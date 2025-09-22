Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00FFCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 06:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s4HGwE6JITShxMvSeU8R2PrIbvvEmZDXP/9z9rie5Ps=; b=JzgD2HUqcIHkzSL4L8G7d4Ytj+
	0y8HzWn2q+bT7ZYcKc3tAtGTAu3j9O5VRx5/8EJwmAnXBXv0BPEvUoipxYZbUus+cEW2CJltTjOw3
	QhAacI6stPHXyF11H9xLuiwnwI65iKQpfj9lHbbn6jzQj2maS/dEF2i+j0beAq7nuK06OGW5XVZJm
	3R3k588hkgpJEsHO0ICunA673SwE7rlbfY6A9CZ4GqYl5Na+F3jXDL+pH4FmxYzalUFfGYYGqUTxv
	msOWzGvIOGl4OG7ECfvJEXss5tPFt0nNrb7FkHWKcebUuApuRl/66N8Lz3BOKfZxD6SXtidLsZwob
	qyoT7hRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Zn6-00000008vfJ-2vGG;
	Mon, 22 Sep 2025 06:12:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Zn4-00000008vel-2jZM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 06:12:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CAB7A601DC;
	Mon, 22 Sep 2025 06:12:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34ED8C4CEF0;
	Mon, 22 Sep 2025 06:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758521565;
	bh=3UerwbZ38Y6F51/AVZvwT7fXNyINz/eAUpivcoyBoKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FtkR8yioGMhFkuF+Cn1wzH4ievrnmc6BCRXFotZptl2hU5vAkAIKzb6bxFPJl1/5V
	 t4Mn1u5euXTtsl6AZUiQoeTQxskVNc45ObI32dW7n0Te3qyvGjRzhenrKBLO5oHYKl
	 yUKTm4Sv3J7vPNKLXw44JzFxh23XziKUMADmJi2MTFy4Jsv2SnxqwWjSA4XwdmqybH
	 zELfSwj198PjLJt2gM0PVjIdfM9qO99QCK9ZGD/5Wis0BX6pNvKy85B9mHiUi1S1A1
	 cogT9I5lshWFzf1pOdPgdgwi/Sqwx0jL/p8E70994AcP5fUyojYjW0lHrviiFFZB5+
	 mPj2bZghG6pFg==
Date: Mon, 22 Sep 2025 11:42:36 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, jingoohan1@gmail.com, l.stach@pengutronix.de, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] PCI: imx6: Add a method to handle CLKREQ#
 override active low
Message-ID: <hsmebnz6opoj45zztdd2svmdtrwwwrngjaidpltbunnkdvvdqz@lhyejtlwkkes>
References: <20250922023741.906024-1-hongxing.zhu@nxp.com>
 <20250922023741.906024-3-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250922023741.906024-3-hongxing.zhu@nxp.com>
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

On Mon, Sep 22, 2025 at 10:37:41AM +0800, Richard Zhu wrote:
> The CLKREQ# is an open drain, active low signal that is driven low by
> the card to request reference clock. It's an optional signal added in
> PCIe CEM r4.0, sec 2. Thus, this signal wouldn't be driven low if it's
> reserved.
> 
> Since the reference clock controlled by CLKREQ# may be required by i.MX
> PCIe host too. To make sure this clock is ready even when the CLKREQ#
> isn't driven low by the card(e.x the scenario described above), force
> CLKREQ# override active low for i.MX PCIe host during initialization.
> 
> The CLKREQ# override can be cleared safely when supports-clkreq is
> present and PCIe link is up later. Because the CLKREQ# would be driven
> low by the card at this time.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 35 +++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 80e48746bbaf..a73632b47e2d 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -52,6 +52,8 @@
>  #define IMX95_PCIE_REF_CLKEN			BIT(23)
>  #define IMX95_PCIE_PHY_CR_PARA_SEL		BIT(9)
>  #define IMX95_PCIE_SS_RW_REG_1			0xf4
> +#define IMX95_PCIE_CLKREQ_OVERRIDE_EN		BIT(8)
> +#define IMX95_PCIE_CLKREQ_OVERRIDE_VAL		BIT(9)
>  #define IMX95_PCIE_SYS_AUX_PWR_DET		BIT(31)
>  
>  #define IMX95_PE0_GEN_CTRL_1			0x1050
> @@ -136,6 +138,7 @@ struct imx_pcie_drvdata {
>  	int (*enable_ref_clk)(struct imx_pcie *pcie, bool enable);
>  	int (*core_reset)(struct imx_pcie *pcie, bool assert);
>  	int (*wait_pll_lock)(struct imx_pcie *pcie);
> +	void (*clr_clkreq_override)(struct imx_pcie *pcie);
>  	const struct dw_pcie_host_ops *ops;
>  };
>  
> @@ -149,6 +152,7 @@ struct imx_pcie {
>  	struct gpio_desc	*reset_gpiod;
>  	struct clk_bulk_data	*clks;
>  	int			num_clks;
> +	bool			supports_clkreq;
>  	struct regmap		*iomuxc_gpr;
>  	u16			msi_ctrl;
>  	u32			controller_id;
> @@ -267,6 +271,13 @@ static int imx95_pcie_init_phy(struct imx_pcie *imx_pcie)
>  			   IMX95_PCIE_REF_CLKEN,
>  			   IMX95_PCIE_REF_CLKEN);
>  
> +	/* Force CLKREQ# low by override */
> +	regmap_update_bits(imx_pcie->iomuxc_gpr,
> +			   IMX95_PCIE_SS_RW_REG_1,
> +			   IMX95_PCIE_CLKREQ_OVERRIDE_EN |
> +			   IMX95_PCIE_CLKREQ_OVERRIDE_VAL,
> +			   IMX95_PCIE_CLKREQ_OVERRIDE_EN |
> +			   IMX95_PCIE_CLKREQ_OVERRIDE_VAL);

This should be:

	imx95_pcie_clkreq_override(imx_pcie, true);

refer below...

>  	return 0;
>  }
>  
> @@ -1298,6 +1309,18 @@ static void imx_pcie_host_exit(struct dw_pcie_rp *pp)
>  		regulator_disable(imx_pcie->vpcie);
>  }
>  
> +static void imx8mm_pcie_clr_clkreq_override(struct imx_pcie *imx_pcie)
> +{
> +	imx8mm_pcie_enable_ref_clk(imx_pcie, false);

Just noticed this discrepancy. 'imx8mm_pcie_enable_ref_clk(, false)' is enabling
the CLKREQ# override, thereby enabling the refclk. But only for imx8mm, this
helper is called as imx8mm_pcie_enable_ref_clk(). But for imx95, the equivalent
function is called as imx95_pcie_clr_clkreq_override(). This is causing
confusion.

Maybe you should just call both functions as:

	imx8mm_pcie_clkreq_override(imx_pcie, bool enable);
	imx95_pcie_clkreq_override(imx_pcie, bool enable);

Then,

	imx8mm_pcie_clr_clkreq_override(struct imx_pcie *imx_pcie)
	{
		imx8mm_pcie_clkreq_override(imx_pcie, false)
	}

	imx95_pcie_clr_clkreq_override(struct imx_pcie *imx_pcie)
	{
		imx95_pcie_clkreq_override(imx_pcie, false)
	}

and populate the clr_clkreq_override() callback.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

