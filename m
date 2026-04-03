Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0612E85379
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 16:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R8bbmJ6AUhZaXmYfqpE8kSaeOWqJOg3vQgtDbE6Siko=; b=dppkJzlV3eqD+VkaHrDtJuDz3+
	RbvN7kGpbHomXJQNvPK9yUPhoF7cMIzrghkqFbNMEMsMw5fkxMMo5d24aUOJ1CvXIH8V/8CqPyl5F
	0K2VhQuOi2ZWgKjHfo4b8crFS9mtMeQP7pv2LGIY9YhqieX2jCejLfenOyzuVTLKF/nIfxJxXzK/9
	XvbkdqO90m6FAv1BbrnSAWjgBJutXw6uNul+I/Zz+K9+uPsoEQjzJlciLMbXuW6uvepejphPyAxmn
	2egDEhJu6aRQ4IMNda7A6OVVmDVNqajFug4ml1j5BjFNjgDqKJ9rKg4OGVYycb53gGyWKfxmxJpiN
	Rd9PSgTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8hPG-00000002KCy-0VZR;
	Fri, 03 Apr 2026 16:30:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8hPF-00000002KCb-1hgV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 16:30:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 81300600CB;
	Fri,  3 Apr 2026 16:30:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B757CC4CEF7;
	Fri,  3 Apr 2026 16:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775233800;
	bh=uQCRAOjiV5WXPzI6jcTO694gx4cH1dlQgpFKmqcXA5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d3t2+OAHZo0jkm8hzozNa4QRBweKwXcljiFW5lnb6ImG2r0kh/bxvTFk5MGH9pdHQ
	 y0OmYJ54QNe/FAIJtrxCmSu/AjdYl1AWsXJtdyU8kOuQvesdIxwEfTdO3WZCXxmAXe
	 2dA2z5XGivG0D0urzxBuNu5sKF/8YawL8d5IDyVD2XI9nhFftRgsDzOf3FVldR9vOF
	 44tDIAykbbaKNmfzBMTDa6uiAot2E+jOcuaIaFFTWEb6oFFG3yM1hjN/R98jhkWr10
	 KMqyDUeMPLa0ekmOXVPnfeU23W3Aq/xOeKiDxU7PfV0EkTO8zxhR+z3jql6Oyo317h
	 FQickyvwtnYaA==
Date: Fri, 3 Apr 2026 21:59:46 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	bhelgaas@google.com, hongxing.zhu@nxp.com, l.stach@pengutronix.de, 
	imx@lists.linux.dev, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V10 04/13] PCI: imx6: Assert PERST# before enabling
 regulators
Message-ID: <jwazawvhuoafkhfwpjfgccc3hz6kej7i6iwkh5be2qena2b4di@yzv6e75zezfu>
References: <20260402095107.205439-1-sherry.sun@nxp.com>
 <20260402095107.205439-5-sherry.sun@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260402095107.205439-5-sherry.sun@nxp.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Apr 02, 2026 at 05:50:58PM +0800, Sherry Sun wrote:
> According to the PCIe initialization requirements, PERST# signal should
> be asserted before applying power to the PCIe device, and deasserted
> after power and reference clock are stable.
> 

Spec wording is not quite like this. Spec mandates asserting PERST# *before*
stopping refclk and powering down the device and deasserting it *after* applying
power and refclk stable.

I believe you want to assert PERST# before enabling regulator to prevent the
endpoint from functioning? If so, is it due to refclk not available yet or some
other reason?

> Currently, the driver enables the vpcie3v3aux regulator in
> imx_pcie_probe() before PERST# is asserted in imx_pcie_host_init(),
> which violates the PCIe power sequencing requirements. However, there
> is no issue so far because PERST# is requested as GPIOD_OUT_HIGH in
> imx_pcie_probe(), which guarantees that PERST# is asserted before
> enabling the vpcie3v3aux regulator.
> 
> This is prepare for the upcoming changes that will parse the reset
> property using the new Root Port binding, which will use GPIOD_ASIS
> when requesting the reset GPIO. With GPIOD_ASIS, the GPIO state is not
> guaranteed, so explicit sequencing is required.
> 
> Fix the power sequencing by:
> 1. Moving vpcie3v3aux regulator enable from probe to
>    imx_pcie_host_init(), where it can be properly sequenced with PERST#.
> 2. Moving imx_pcie_assert_perst() before regulator and clock enable to
>    ensure correct ordering.
> 
> The vpcie3v3aux regulator is kept enabled for the entire PCIe controller
> lifecycle and automatically disabled on device removal via devm cleanup.
> 

vpcie3v3aux handling should be in a separate patch.

- Mani

> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 49 +++++++++++++++++++++------
>  1 file changed, 39 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 45d70ae7e04f..948ffb75d122 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -166,6 +166,8 @@ struct imx_pcie {
>  	u32			tx_swing_full;
>  	u32			tx_swing_low;
>  	struct regulator	*vpcie;
> +	struct regulator	*vpcie_aux;
> +	bool			vpcie_aux_enabled;
>  	struct regulator	*vph;
>  	void __iomem		*phy_base;
>  
> @@ -1220,6 +1222,13 @@ static void imx_pcie_disable_device(struct pci_host_bridge *bridge,
>  	imx_pcie_remove_lut(imx_pcie, pci_dev_id(pdev));
>  }
>  
> +static void imx_pcie_vpcie_aux_disable(void *data)
> +{
> +	struct regulator *vpcie_aux = data;
> +
> +	regulator_disable(vpcie_aux);
> +}
> +
>  static void imx_pcie_assert_perst(struct imx_pcie *imx_pcie, bool assert)
>  {
>  	if (assert) {
> @@ -1240,6 +1249,24 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
>  	struct imx_pcie *imx_pcie = to_imx_pcie(pci);
>  	int ret;
>  
> +	imx_pcie_assert_perst(imx_pcie, true);
> +
> +	/* Keep 3.3Vaux supply enabled for the entire PCIe controller lifecycle */
> +	if (imx_pcie->vpcie_aux && !imx_pcie->vpcie_aux_enabled) {
> +		ret = regulator_enable(imx_pcie->vpcie_aux);
> +		if (ret) {
> +			dev_err(dev, "failed to enable vpcie_aux regulator: %d\n",
> +				ret);
> +			return ret;
> +		}
> +		imx_pcie->vpcie_aux_enabled = true;
> +
> +		ret = devm_add_action_or_reset(dev, imx_pcie_vpcie_aux_disable,
> +					       imx_pcie->vpcie_aux);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	if (imx_pcie->vpcie) {
>  		ret = regulator_enable(imx_pcie->vpcie);
>  		if (ret) {
> @@ -1249,25 +1276,24 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
>  		}
>  	}
>  
> +	ret = imx_pcie_clk_enable(imx_pcie);
> +	if (ret) {
> +		dev_err(dev, "unable to enable pcie clocks: %d\n", ret);
> +		goto err_reg_disable;
> +	}
> +
>  	if (pp->bridge && imx_check_flag(imx_pcie, IMX_PCIE_FLAG_HAS_LUT)) {
>  		pp->bridge->enable_device = imx_pcie_enable_device;
>  		pp->bridge->disable_device = imx_pcie_disable_device;
>  	}
>  
>  	imx_pcie_assert_core_reset(imx_pcie);
> -	imx_pcie_assert_perst(imx_pcie, true);
>  
>  	if (imx_pcie->drvdata->init_phy)
>  		imx_pcie->drvdata->init_phy(imx_pcie);
>  
>  	imx_pcie_configure_type(imx_pcie);
>  
> -	ret = imx_pcie_clk_enable(imx_pcie);
> -	if (ret) {
> -		dev_err(dev, "unable to enable pcie clocks: %d\n", ret);
> -		goto err_reg_disable;
> -	}
> -
>  	if (imx_pcie->phy) {
>  		ret = phy_init(imx_pcie->phy);
>  		if (ret) {
> @@ -1780,9 +1806,12 @@ static int imx_pcie_probe(struct platform_device *pdev)
>  	of_property_read_u32(node, "fsl,max-link-speed", &pci->max_link_speed);
>  	imx_pcie->supports_clkreq = of_property_read_bool(node, "supports-clkreq");
>  
> -	ret = devm_regulator_get_enable_optional(&pdev->dev, "vpcie3v3aux");
> -	if (ret < 0 && ret != -ENODEV)
> -		return dev_err_probe(dev, ret, "failed to enable Vaux supply\n");
> +	imx_pcie->vpcie_aux = devm_regulator_get_optional(&pdev->dev, "vpcie3v3aux");
> +	if (IS_ERR(imx_pcie->vpcie_aux)) {
> +		if (PTR_ERR(imx_pcie->vpcie_aux) != -ENODEV)
> +			return PTR_ERR(imx_pcie->vpcie_aux);
> +		imx_pcie->vpcie_aux = NULL;
> +	}
>  
>  	imx_pcie->vpcie = devm_regulator_get_optional(&pdev->dev, "vpcie");
>  	if (IS_ERR(imx_pcie->vpcie)) {
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்

