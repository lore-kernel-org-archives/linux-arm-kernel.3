Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA933C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 10:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sMB5qXqvNx3BJbaxkPq4j1Gnoku1AFqOK8/l2xk+F7g=; b=evQnYY61w1pbKD+4Y2zKNl5mAh
	/C9SOy110gClpv+/tyk/VBuGbe8rhcW6GizkHPjZ33CshJfZs8eph0tEsGQt0fFLSjzr1rW7+xGB7
	Yl/NNKkEVqvs2obpHYz7BSce5u74Yg0TeW+7om6ErMQzbv/S9lKKg83pT9VdA28VtuM7QKZgrYOZN
	Y71g8POd/pNzIwTyAfB+caMPYdK7R3lAEj7mqBH3VCNYafF4/lbR61kTrAitRw7Qmq1kWXI4U/XIu
	52y5URtVlnr4Q/SYGz/s1dcl1mOWQirHLNIzbS3FCd75p0HanU7aHM0o9ssd+Q0N79IFYJV4sgVfg
	sSEnK9tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cIw-0000000E6WU-202K;
	Thu, 10 Sep 2026 10:46:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cIv-0000000E6WM-1Lc1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 10:46:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 507F6600CB;
	Thu, 10 Sep 2026 10:46:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C90B1F000FF;
	Thu, 10 Sep 2026 10:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789037212;
	bh=sMB5qXqvNx3BJbaxkPq4j1Gnoku1AFqOK8/l2xk+F7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZN6QZt6O3MLzgqmYkmBgsf49pieDTorluX+jRjhxCCt7V6tC7qBO+3FTp3lNzmTC6
	 w9WTpiww7Mu2cT5YLzO2Q7hef9jzAyKF2VFnBFMbk9ixADkSx7YkR8OYW0mQnwRLiU
	 EqiV2dooB9fP7mYprCwfg6frserLGIT65/W/KgpTPitae3BM9wOBWQAPm5DzFonZw/
	 WDObgQurIJdASxm+V94GbRgX9TeMnEqMv6OZ9qjjp3J/sn6TNiAThAZwinjA8/CPTW
	 sJqAghhqpOQGpbHRcoBl6Uxh7mLqNZ8w4Q1fonJlPGTazsnqJf6A828JQv90CcE+3Z
	 GNwjD0HtFeR3g==
Date: Thu, 10 Sep 2026 12:46:43 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: hongxing.zhu@oss.nxp.com
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: Re: [PATCH v5] PCI: imx6: Update MPLLB bandwidth to improve i.MX95
 Gen3 PCIe stability
Message-ID: <ojbp5v6txcdvrs2hcrknai7kkb4bu6cnp6fometzkrf2mdzvv4@cepxzg4r7jvd>
References: <20260803034319.992323-1-hongxing.zhu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260803034319.992323-1-hongxing.zhu@oss.nxp.com>
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

On Mon, Aug 03, 2026 at 11:43:19AM +0800, hongxing.zhu@oss.nxp.com wrote:
> From: Richard Zhu <hongxing.zhu@nxp.com>
> 
> We observed poor bandwidth margins during i.MX95 Gen3 PCIe tests with
> the default MPLLB_BANDWIDTH value (120). The margins worsened across
> voltage and temperature (VT) variations and different test matrices,
> potentially causing link stability issues.
> 
> Testing with MPLLB_BANDWIDTH value of 140 (0x8c) shows significant
> improvement in bandwidth margins across all VT conditions and test
> scenarios.
> 
> Implement PHY register write helper function and configure:
> - MPLLB_BW_OVRD_IN = 140 (0x8c) for improved bandwidth margin
> - MPLLB_BW_OVRD_EN to enable the override
> 
> This ensures robust PCIe Gen3 performance across all operating
> conditions.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
> Changes in v5:
> Update the commit log refer to Bjorn's suggestions.
> 
> Changes in v4:
> Move the delay to imx95_pcie_init_phy() with a comment added.
> 
> Changes in v3:
> Regarding Frank's comments, refine naming consistency and clarity.
> 
> Changes in v2:
> Update the register name and bit definitions.
> Don't move IMX95_PCIE_PHY_CR_PARA_SEL settings.
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 32 +++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 39790e66b98dc..3bc52c4781903 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -80,6 +80,17 @@
>  #define IMX95_SID_MASK				GENMASK(5, 0)
>  #define IMX95_MAX_LUT				32
>  
> +#define IMX95_PCIE_PHY_REG_ADDR			0x3008
> +#define IMX95_PCIE_PHY_REG_EN			BIT(31)
> +#define IMX95_PCIE_PHY_REG_ADDR_MASK		GENMASK(15, 0)
> +#define IMX95_PCIE_PHY_REG_DATA			0x300c
> +#define IMX95_PCIE_PHY_MPLLB_OVRD_IN		0x2004
> +/* BIT(10): Override enable for mpllb_bandwidth[15:0] */
> +#define IMX95_PCIE_PHY_MPLLB_OVRD_BW_EN		BIT(10)
> +/* Register offset: Override value for mpllb_bandwidth[15:0] */
> +#define IMX95_PCIE_PHY_MPLLB_BW_IN		0x2005
> +#define IMX95_PCIE_PHY_MPLLB_BW_VAL		0x8c
> +
>  #define IMX95_PCIE_RST_CTRL			0x3010
>  #define IMX95_PCIE_COLD_RST			BIT(0)
>  
> @@ -270,6 +281,15 @@ static int imx95_pcie_select_ref_clk_src(struct imx_pcie *imx_pcie)
>  	return 0;
>  }
>  
> +static void imx95_pcie_phy_write(struct imx_pcie *imx_pcie, int addr, u16 data)
> +{
> +	regmap_update_bits(imx_pcie->iomuxc_gpr, IMX95_PCIE_PHY_REG_ADDR,
> +			   IMX95_PCIE_PHY_REG_EN, IMX95_PCIE_PHY_REG_EN);
> +	regmap_update_bits(imx_pcie->iomuxc_gpr, IMX95_PCIE_PHY_REG_ADDR,
> +			   IMX95_PCIE_PHY_REG_ADDR_MASK, addr);
> +	regmap_write(imx_pcie->iomuxc_gpr, IMX95_PCIE_PHY_REG_DATA, data);
> +}
> +
>  static int imx95_pcie_init_phy(struct imx_pcie *imx_pcie)
>  {
>  	/*
> @@ -290,6 +310,18 @@ static int imx95_pcie_init_phy(struct imx_pcie *imx_pcie)
>  			IMX95_PCIE_PHY_CR_PARA_SEL,
>  			IMX95_PCIE_PHY_CR_PARA_SEL);
>  

I've added regmap_read() to flush the IMX95_PCIE_PHY_CR_PARA_SEL update before
below delay, while applying.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

