Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62528CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 15:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M1W7CRAqGX1E8dfJFnTYqdwHB0D9gv4yn30ZbnB9uVE=; b=lIWuELxqQO9tS9CX9rXZfTrKdA
	WkenfPsI2CK6swiENFD8nTF/YgbexIo6oy/RM99sQuLN+wbtW6G7MlLosTtjtP2jrB2fhZ3FJAnHm
	0YD89PO+2hmynRmj1peJTjFbkC1Ze8cPbNrfGYI58bFywLjNTAM5H5eOtU5pbwQbegZ54DZwuzGHF
	ncgt25bKNkUel0geL8XbzVM+sCpCvPEaIEP8BHopEpJ6yFIlLYONl+Pds8mHo3FIvvv4HEq7AgOgN
	+kfFX3owGOMLKPsInDWjyUFDqBSRvJkjHWDcR5EsC0Fg1eYxL+XBt/WYmx3uBbyGPhaiwSAupOrY/
	D2iuFirw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWyg7-00000005xaj-3e9P;
	Tue, 09 Jun 2026 15:47:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWyg3-00000005xZY-1Id0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 15:47:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6573360200;
	Tue,  9 Jun 2026 15:47:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 848DE1F00893;
	Tue,  9 Jun 2026 15:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781020062;
	bh=M1W7CRAqGX1E8dfJFnTYqdwHB0D9gv4yn30ZbnB9uVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ftE0HrztmsU8QOKAipN0RVsg9+hFmlEX/gcr/B0muCWCk2NcG6rBy14Kz3V4w59uv
	 ySUyPSUYFtMVkok4w7vYMZe4GLCayGjLWr4Cb23yG+zCnOzBRivoFarrAoND0goLN7
	 /b8RiY2cC44AXgj3fgnAtnwp3oNscE2qgBIa89ACDOmbqdI6e51NGe7x/h2hsYoAKo
	 0Z+T5LZUgexpPN8pKGvpuSFDvOkrlEYspCSmErNL0QI/UyJRy6m/eZCLiDoolOYSPu
	 fT31i7Y6VNydiZOelzi5FjWxASApqxkIqUpFhMRVxWFD3DKJgaZtC/7kd8aQQcMmOx
	 70fjglbLcnhLw==
Date: Tue, 9 Jun 2026 21:17:33 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] PCI: imx6: Configure REF_USE_PAD before PHY reset
 for i.MX95
Message-ID: <xwupi3bxiihnmddqkdc6xsixkbirdpnips6qy5n4xchtcysnfq@f6pa5usw2a4f>
References: <20260518072715.3166514-1-hongxing.zhu@nxp.com>
 <20260518072715.3166514-2-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260518072715.3166514-2-hongxing.zhu@nxp.com>
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

On Mon, May 18, 2026 at 03:27:14PM +0800, Richard Zhu wrote:
> According to the i.MX95 PCIe PHY Databook, the ref_use_pad signal in the
> Common Block Signals section selects the reference clock source connected
> to the PHY pads. Per the specification, any change to this input must be
> followed by a PHY reset assertion to take effect.
> 
> Move the REF_USE_PAD configuration before the PHY reset toggle to comply
> with the required initialization sequence.
> 
> Fixes: 47f54a902dcd ("PCI: imx6: Toggle the core reset for i.MX95 PCIe")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 27 ++++++++++++++++++++++++---
>  1 file changed, 24 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 002e0a0d9382..66e760015c92 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -138,6 +138,7 @@ struct imx_pcie_drvdata {
>  	const u32 mode_off[IMX_PCIE_MAX_INSTANCES];
>  	const u32 mode_mask[IMX_PCIE_MAX_INSTANCES];
>  	const struct pci_epc_features *epc_features;
> +	int (*init_pre_reset)(struct imx_pcie *pcie);

I renamed the callback and helper while applying:

s/init_pre_reset/select_ref_clk_src

- Mani

>  	int (*init_phy)(struct imx_pcie *pcie);
>  	int (*enable_ref_clk)(struct imx_pcie *pcie, bool enable);
>  	int (*core_reset)(struct imx_pcie *pcie, bool assert);
> @@ -249,6 +250,24 @@ static unsigned int imx_pcie_grp_offset(const struct imx_pcie *imx_pcie)
>  	return imx_pcie->controller_id == 1 ? IOMUXC_GPR16 : IOMUXC_GPR14;
>  }
>  
> +static int imx95_pcie_init_pre_reset(struct imx_pcie *imx_pcie)
> +{
> +	bool ext = imx_pcie->enable_ext_refclk;
> +
> +	/*
> +	 * Regarding the Signal Descriptions of i.MX95 PCIe PHY, ref_use_pad is
> +	 * used to select reference clock connected to a pair of pads.
> +	 *
> +	 * Any change in this input must be followed by phy_reset assertion.
> +	 */
> +
> +	regmap_update_bits(imx_pcie->iomuxc_gpr, IMX95_PCIE_PHY_GEN_CTRL,
> +			   IMX95_PCIE_REF_USE_PAD,
> +			   ext ? IMX95_PCIE_REF_USE_PAD : 0);
> +
> +	return 0;
> +}
> +
>  static int imx95_pcie_init_phy(struct imx_pcie *imx_pcie)
>  {
>  	bool ext = imx_pcie->enable_ext_refclk;
> @@ -271,9 +290,6 @@ static int imx95_pcie_init_phy(struct imx_pcie *imx_pcie)
>  			IMX95_PCIE_PHY_CR_PARA_SEL,
>  			IMX95_PCIE_PHY_CR_PARA_SEL);
>  
> -	regmap_update_bits(imx_pcie->iomuxc_gpr, IMX95_PCIE_PHY_GEN_CTRL,
> -			   IMX95_PCIE_REF_USE_PAD,
> -			   ext ? IMX95_PCIE_REF_USE_PAD : 0);
>  	regmap_update_bits(imx_pcie->iomuxc_gpr, IMX95_PCIE_SS_RW_REG_0,
>  			   IMX95_PCIE_REF_CLKEN,
>  			   ext ? 0 : IMX95_PCIE_REF_CLKEN);
> @@ -1348,6 +1364,9 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
>  		pp->bridge->disable_device = imx_pcie_disable_device;
>  	}
>  
> +	if (imx_pcie->drvdata->init_pre_reset)
> +		imx_pcie->drvdata->init_pre_reset(imx_pcie);
> +
>  	imx_pcie_assert_core_reset(imx_pcie);
>  
>  	if (imx_pcie->drvdata->init_phy)
> @@ -2047,6 +2066,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  		.mode_mask[0] = IMX95_PCIE_DEVICE_TYPE,
>  		.core_reset = imx95_pcie_core_reset,
>  		.init_phy = imx95_pcie_init_phy,
> +		.init_pre_reset = imx95_pcie_init_pre_reset,
>  		.wait_pll_lock = imx95_pcie_wait_for_phy_pll_lock,
>  		.enable_ref_clk = imx95_pcie_enable_ref_clk,
>  		.clr_clkreq_override = imx95_pcie_clr_clkreq_override,
> @@ -2102,6 +2122,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  		.ltssm_mask = IMX95_PCIE_LTSSM_EN,
>  		.mode_off[0]  = IMX95_PE0_GEN_CTRL_1,
>  		.mode_mask[0] = IMX95_PCIE_DEVICE_TYPE,
> +		.init_pre_reset = imx95_pcie_init_pre_reset,
>  		.init_phy = imx95_pcie_init_phy,
>  		.core_reset = imx95_pcie_core_reset,
>  		.wait_pll_lock = imx95_pcie_wait_for_phy_pll_lock,
> 
> base-commit: 40b7f61a1a4d7fd18188f3f87e15ff5a90ce1d31
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்

