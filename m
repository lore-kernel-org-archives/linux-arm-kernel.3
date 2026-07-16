Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5055CC44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 16:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tCDBpM2pxxYPqmtXE+cmuwq5digT5TckD0bD8zDphms=; b=iagv5oWh/bdsF8zTft2jZ8m2jM
	tId7KPxg3tBriJ4Rjmpkp4sw/9QOqZaQQSO3+OWdDmy2tQqAhAFI6tdKkWfrfrsQCRAAZZic2Ls3K
	tqdyqgBZMxd2K5y7dzVfdr3NmHHKTa0/Sg7dJTw/yygcoLFZ9e7C8A70g6ZMo+Xq1HIl9zRtOnedG
	TeqfX65LlVmQ9y1t4w3uPkA3JGUKD5p3Ix6oBusiNiJAebB44xXiR+Uup7SmKmzcJnfDt9DeYnY6D
	X6OG0/LvmcDdnnmCtyi56kC1vgbOPtcFcKCApV5S7vKvuR4ffoR+EZqpCu8RHppxNP1gEG149qeyJ
	0MiZVL3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkP3t-00000000BCR-07JY;
	Thu, 16 Jul 2026 16:35:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkP3r-00000000BCD-0VYe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 16:35:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B41534067C;
	Thu, 16 Jul 2026 16:35:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FAF61F000E9;
	Thu, 16 Jul 2026 16:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784219745;
	bh=tCDBpM2pxxYPqmtXE+cmuwq5digT5TckD0bD8zDphms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I/pHE01+zdOY3q1W2i+xz50QzXIAaRgLB3kol79iC9rBehwWm+hJObG89HvR2XCug
	 8PyHl6tfTaZPeL/KRpY/RuKOZeX2UK4n4CiynVWymrR4Kpq3xzbdUuUNZ4hga1p/8N
	 ObR/s+2mdqZbZ3b15eoKwGMGFQSfapfC3Ypc0nM4k94dwazLogQDx8ulA5FhpJ3wdB
	 hzTF+96NshnBfdI7cY0sr3m698hmIAmAzh+AJFojNv2yqS99W9WeNAe851245oI/Ud
	 dIx3kzT/DbJejo+s4rKRraNZ8jaiAiNSzNEmTEydApwdjNdSl90a7V1GMizA0VOc1C
	 FJvzepiVes6Nw==
Date: Thu, 16 Jul 2026 18:35:27 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: hongxing.zhu@oss.nxp.com
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: Re: [PATCH v2] PCI: imx6: Fix i.MX6Q/DL boot hang by separating PHY
 power and reference clock control
Message-ID: <afwyhy7npuvtecdbuzaytazbifu2ytb6admq4xbzbmxwx47vpq@wrc5dp62mtng>
References: <20260708035928.580236-1-hongxing.zhu@oss.nxp.com>
 <20260708035928.580236-2-hongxing.zhu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260708035928.580236-2-hongxing.zhu@oss.nxp.com>
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

On Wed, Jul 08, 2026 at 11:59:27AM +0800, hongxing.zhu@oss.nxp.com wrote:
> From: Richard Zhu <hongxing.zhu@nxp.com>
> 
> Commit 610fa91d9863 ("PCI: imx6: Assert PERST# before enabling regulators")
> introduced a boot hang on i.MX6Q/DL variants by changing the initialization
> sequence.
> 
> The issue stems from coupling PHY power (TEST_PD) and reference clock
> (REF_CLK_EN) control in imx6q_pcie_enable_ref_clk(). When these are
> managed together, the timing between PHY power-up and reference clock
> enablement cannot be properly controlled, leading to initialization
> failures.
> 

What is the timing requirement here?

> Fix this by separating the two concerns:
> 
> - Move PHY power control (TEST_PD) to imx6q_pcie_core_reset() where it
>   logically belongs with reset operations. This ensures PHY power state
>   is managed as part of the core reset sequence.
> 
> - Update imx6qp_pcie_core_reset() to call imx6q_pcie_core_reset() for
>   shared PHY power management, avoiding code duplication.
> 
> - Make imx6q_pcie_enable_ref_clk() responsible only for reference clock
>   (REF_CLK_EN) control, simplifying its purpose.
> 
> - Remove the 10us delay workaround from imx6q_pcie_enable_ref_clk() as
>   proper sequencing is now handled by the core_reset functions.
> 
> This refactoring ensures PHY power is controlled during reset
> operations, fixing the boot hang while improving code maintainability.
> 

This patch does too many things at once. Can't you split it and keep the minimal
fix in one patch?

- Mani

> Fixes: 610fa91d9863 ("PCI: imx6: Assert PERST# before enabling regulators")
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
> Changes in v2:
> Regarding sashiko's reivew, invoke imx_pcie_assert_core_reset() explicitly
> in error path of imx_pcie_host_init() and imx_pcie_host_exit().
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 45 ++++++++++++---------------
>  1 file changed, 20 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 9406bba36953f..53f3da6ab30d5 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -680,21 +680,12 @@ static int imx_pcie_attach_pd(struct device *dev)
>  
>  static int imx6q_pcie_enable_ref_clk(struct imx_pcie *imx_pcie, bool enable)
>  {
> -	if (enable) {
> -		/* power up core phy and enable ref clock */
> -		regmap_clear_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1, IMX6Q_GPR1_PCIE_TEST_PD);
> -		/*
> -		 * The async reset input need ref clock to sync internally,
> -		 * when the ref clock comes after reset, internal synced
> -		 * reset time is too short, cannot meet the requirement.
> -		 * Add a ~10us delay here.
> -		 */
> -		usleep_range(10, 100);
> -		regmap_set_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1, IMX6Q_GPR1_PCIE_REF_CLK_EN);
> -	} else {
> -		regmap_clear_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1, IMX6Q_GPR1_PCIE_REF_CLK_EN);
> -		regmap_set_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1, IMX6Q_GPR1_PCIE_TEST_PD);
> -	}
> +	if (enable)
> +		regmap_set_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1,
> +				IMX6Q_GPR1_PCIE_REF_CLK_EN);
> +	else
> +		regmap_clear_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1,
> +				  IMX6Q_GPR1_PCIE_REF_CLK_EN);
>  
>  	return 0;
>  }
> @@ -823,23 +814,25 @@ static int imx6sx_pcie_core_reset(struct imx_pcie *imx_pcie, bool assert)
>  	return 0;
>  }
>  
> -static int imx6qp_pcie_core_reset(struct imx_pcie *imx_pcie, bool assert)
> +static int imx6q_pcie_core_reset(struct imx_pcie *imx_pcie, bool assert)
>  {
> -	regmap_update_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1, IMX6Q_GPR1_PCIE_SW_RST,
> -			   assert ? IMX6Q_GPR1_PCIE_SW_RST : 0);
> -	if (!assert)
> -		usleep_range(200, 500);
> +	if (assert)
> +		regmap_set_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1,
> +				IMX6Q_GPR1_PCIE_TEST_PD);
> +	else
> +		regmap_clear_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1,
> +				  IMX6Q_GPR1_PCIE_TEST_PD);
>  
>  	return 0;
>  }
>  
> -static int imx6q_pcie_core_reset(struct imx_pcie *imx_pcie, bool assert)
> +static int imx6qp_pcie_core_reset(struct imx_pcie *imx_pcie, bool assert)
>  {
> +	imx6q_pcie_core_reset(imx_pcie, assert);
> +	regmap_update_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1, IMX6Q_GPR1_PCIE_SW_RST,
> +			   assert ? IMX6Q_GPR1_PCIE_SW_RST : 0);
>  	if (!assert)
> -		return 0;
> -
> -	regmap_set_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1, IMX6Q_GPR1_PCIE_TEST_PD);
> -	regmap_set_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1, IMX6Q_GPR1_PCIE_REF_CLK_EN);
> +		usleep_range(200, 500);
>  
>  	return 0;
>  }
> @@ -1445,6 +1438,7 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
>  	return 0;
>  
>  err_phy_off:
> +	imx_pcie_assert_core_reset(imx_pcie);
>  	phy_power_off(imx_pcie->phy);
>  err_phy_exit:
>  	phy_exit(imx_pcie->phy);
> @@ -1471,6 +1465,7 @@ static void imx_pcie_host_exit(struct dw_pcie_rp *pp)
>  			dev_err(pci->dev, "unable to power off PHY\n");
>  		phy_exit(imx_pcie->phy);
>  	}
> +	imx_pcie_assert_core_reset(imx_pcie);
>  	imx_pcie_clk_disable(imx_pcie);
>  
>  	pci_pwrctrl_power_off_devices(pci->dev);
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

