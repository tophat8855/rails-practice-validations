class OrganizationsController < ApplicationController

  def index
    @organizations = Organization.order(:id)
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)
    if @organization.save
      redirect_to organizations_path, notice: "Organization saved successfully"
    else
      render :new
    end
  end

  def edit
    @organization = Organization.find(params[:id])
  end

  def update
    @organization = Organization.find(params[:id])
    @organization.update(organization_params)
    if @organization.save
      redirect_to organizations_path, notice: "Organization updated successfully"
    else
      render :edit
    end
  end

  private

  def organization_params
    params.require(:organization).permit(:name)
  end

end
