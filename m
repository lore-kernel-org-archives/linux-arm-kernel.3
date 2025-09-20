Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE71CAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 07:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cZgIBFFrOT5ImdZRDHiz/iAIJvjaGehAxbvcEJta7pM=; b=eVYjT2kx5PGyCCcB4eec9BUaUS
	paOr0mzF3akKhxNi6p1o3vufc2qL/ueqHgKhpy0169n9NMg0lLHUqCeKJ1xZlwEyVK/7IiCiN+C/S
	1r2N8z3KV/eqgIVsAAZpXR0dgEdaazxkFi10mWZSWAMU71zul8FspaiPRQm0lHBDeUrvFK7olhOci
	M/C4VX/gvEerE8W3z6Yf3NSLdG9bdQH0QJaD1ap6QAi03BUSJX6TIp7/znB46O7K87HkXpdgkpHkm
	MZnndOgWOnYyz4PYyZgwbCAGqYO+zJ+L1wMKo7BPuYNGyDORqflTrow5WOljtbFIhlcfXieRFl5M8
	Sw7ArlZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzs9p-00000004wqV-2nRx;
	Sat, 20 Sep 2025 07:37:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzs9o-00000004wqL-2Ntf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 07:37:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A33D06013C;
	Sat, 20 Sep 2025 07:37:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67A32C4CEEB;
	Sat, 20 Sep 2025 07:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758353839;
	bh=GXoeXO8k9Luo47HuYsKuJ/VbXUiTDkuCn8oRQSvIc/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iTmPoAQiElG7qvJc2ufXiuVr2dOcBcWezyRyDspcodrcaq9dxMFFJDVD/2EEWOZi/
	 kbooih2FPzMceDrWpdDfni8QZDUNrcV+x8axOQWXOF30I/WQU8Jkd9JbX4N/VV/qWm
	 vtMla+OCjcXSk8ISe5u3MHbuRFt5GnTE2OoeOxA/3RHYjO9j5B9jbEEEm1ELD/SfcB
	 jKewCEHu1V1r07zQK7LQ6pf6g3u84JEzr5yMdDseWqMuBzttIGY+tKj9oTolqgI3fe
	 ZuPY5Ba/YNmXVDDPcTIQK7/t9yD3geYTGu1JHXObto+N0GaswbkUusGalHAyUItA7G
	 wECvkTE1ax0fg==
Date: Sat, 20 Sep 2025 13:07:09 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	bhelgaas@google.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 3/3] PCI: imx6: Add external reference clock input
 mode support
Message-ID: <c524y4ymsozmktpptjrpkav62yykrqztyx4hkrgmbmbrewxio2@bczi3zufjede>
References: <20250918032555.3987157-1-hongxing.zhu@nxp.com>
 <20250918032555.3987157-4-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250918032555.3987157-4-hongxing.zhu@nxp.com>
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

On Thu, Sep 18, 2025 at 11:25:55AM +0800, Richard Zhu wrote:
> i.MX95 PCIes have two reference clock inputs: one from internal PLL, the
> other from off chip crystal oscillator. The "extref" clock refers to a
> reference clock from an external crystal oscillator.
> 
> Add external reference clock input mode support for i.MX95 PCIes.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 80e48746bbaf..e2ca8b036253 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -149,6 +149,7 @@ struct imx_pcie {
>  	struct gpio_desc	*reset_gpiod;
>  	struct clk_bulk_data	*clks;
>  	int			num_clks;
> +	bool			enable_ext_refclk;
>  	struct regmap		*iomuxc_gpr;
>  	u16			msi_ctrl;
>  	u32			controller_id;
> @@ -241,6 +242,8 @@ static unsigned int imx_pcie_grp_offset(const struct imx_pcie *imx_pcie)
>  
>  static int imx95_pcie_init_phy(struct imx_pcie *imx_pcie)
>  {
> +	bool ext = imx_pcie->enable_ext_refclk;
> +
>  	/*
>  	 * ERR051624: The Controller Without Vaux Cannot Exit L23 Ready
>  	 * Through Beacon or PERST# De-assertion
> @@ -259,13 +262,12 @@ static int imx95_pcie_init_phy(struct imx_pcie *imx_pcie)
>  			IMX95_PCIE_PHY_CR_PARA_SEL,
>  			IMX95_PCIE_PHY_CR_PARA_SEL);
>  
> -	regmap_update_bits(imx_pcie->iomuxc_gpr,
> -			   IMX95_PCIE_PHY_GEN_CTRL,
> -			   IMX95_PCIE_REF_USE_PAD, 0);
> -	regmap_update_bits(imx_pcie->iomuxc_gpr,
> -			   IMX95_PCIE_SS_RW_REG_0,
> +	regmap_update_bits(imx_pcie->iomuxc_gpr, IMX95_PCIE_PHY_GEN_CTRL,
> +			   ext ? IMX95_PCIE_REF_USE_PAD : 0,
> +			   IMX95_PCIE_REF_USE_PAD);
> +	regmap_update_bits(imx_pcie->iomuxc_gpr, IMX95_PCIE_SS_RW_REG_0,
>  			   IMX95_PCIE_REF_CLKEN,
> -			   IMX95_PCIE_REF_CLKEN);
> +			   ext ? 0 : IMX95_PCIE_REF_CLKEN);
>  
>  	return 0;
>  }
> @@ -1606,7 +1608,7 @@ static int imx_pcie_probe(struct platform_device *pdev)
>  	struct imx_pcie *imx_pcie;
>  	struct device_node *np;
>  	struct device_node *node = dev->of_node;
> -	int ret, domain;
> +	int i, ret, domain;
>  	u16 val;
>  
>  	imx_pcie = devm_kzalloc(dev, sizeof(*imx_pcie), GFP_KERNEL);
> @@ -1657,6 +1659,10 @@ static int imx_pcie_probe(struct platform_device *pdev)
>  	if (imx_pcie->num_clks < 0)
>  		return dev_err_probe(dev, imx_pcie->num_clks,
>  				     "failed to get clocks\n");
> +	imx_pcie->enable_ext_refclk = false;

Default value is 'false'. So no need to initialize.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

