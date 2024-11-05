Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B380D3176B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 17:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=oljPsmb6PyVhBGxuhwl4CovfkcoBjJyPZ3dxtEYJ5q4=; b=KagzmIKXRMHZI6
	YBF8L3RpgGA5l1sBQmXdbMGIbVnd/V7gHHBdoPZ3VOTxXbv/cNoGjB1+ty+wgHqbNJ5vtfTGg7U8c
	RMB/ilmzd8tIqEySUUz6rfR/aS/TESmfHqyPyItQPsyE8YXv0uMacF2TjWPWI8zcVAoeV7uxxrdGI
	2W3FTRnCd8ktxX4FBHulc32kOYEUanWb1tcnw454sBcatlcSpKAV6UgHAgswUQVFgKkZTuMyhqavy
	A/nuQa69ywfCCKulNCskxhgM9QcbsnHXGYACx4hSQBfboWt3Q1nBaXfDr8LEAeeXliZCVQHD7qMHI
	VLmpi0O4CulXGTug07qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8NOK-00000000DQ6-3yiU;
	Tue, 05 Nov 2024 17:30:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8NGb-00000000CAR-0n4O;
	Tue, 05 Nov 2024 17:22:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E44A95C4A89;
	Tue,  5 Nov 2024 17:22:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40B07C4CED1;
	Tue,  5 Nov 2024 17:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730827376;
	bh=zvORLLKvLulrWcA4oBGbbnyMDidVWOv949NeC6tWnAI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=mgLLV1rYaK4NSUvwU8HUu+uY2sk/iLccv6x0HEZ3C/4GIC2IKZKNxUxtVvFBv0gOm
	 6Qf0GKQ+LtlWolM6z/6H4Bq+BXV63UTpm6Jxrk6ZjFhZeY2UOt+wBLNprG7k15UKTZ
	 c0l2IbGJrylHWqfK8kTtB/hbsUiHPDU0PKn2BvNGBTNEP9BhZQlqRXr5I/XjDka7WP
	 GmiR1JSv6NpFrcjDIe0Gyb1vRl5oQF432oHAn7Dsr+LpGZEd9NoQF0Wc1FVgv90BiK
	 9TU34deY3A6C9jNM4+YM0adRUoUSzbJyaC8LmGlulGYawiqnOS01XRXWYjtRGBX1xP
	 muE70Tfv2SpzA==
Date: Tue, 5 Nov 2024 11:22:54 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Christian Marangi <ansuelsmth@gmail.com>, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, upstream@airoha.com,
	Hui Ma <hui.ma@airoha.com>
Subject: Re: [PATCH v2] PCI: mediatek-gen3: Avoid PCIe resetting via
 PCIE_RSTB for Airoha EN7581 SoC
Message-ID: <20241105172254.GA1447085@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104-pcie-en7581-rst-fix-v2-1-ffe5839c76d8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_092257_339784_C76C741F 
X-CRM114-Status: GOOD (  32.29  )
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

On Mon, Nov 04, 2024 at 11:00:05PM +0100, Lorenzo Bianconi wrote:
> Airoha EN7581 has a hw bug asserting/releasing PCIE_PE_RSTB signal
> causing occasional PCIe link down issues. In order to overcome the
> problem, PCIE_RSTB signals are not asserted/released during device probe or
> suspend/resume phase and the PCIe block is reset using REG_PCI_CONTROL
> (0x88) and REG_RESET_CONTROL (0x834) registers available via the clock
> module.
> Introduce flags field in the mtk_gen3_pcie_pdata struct in order to
> specify per-SoC capabilities.

Add blank lines between paragraphs so we know where they end.

Where does this alternate way of doing reset (using REG_PCI_CONTROL
and REG_RESET_CONTROL) happen?  Why isn't there something in this
patch to use that alternate method at the same points where
PCIE_PE_RSTB is used?

If we don't need to assert reset for Airoha EN7581, why do we need to
do it for the other SoCs?

> Tested-by: Hui Ma <hui.ma@airoha.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
> Changes in v2:
> - introduce flags field in mtk_gen3_pcie_flags struct instead of adding
>   reset callback
> - fix the leftover case in mtk_pcie_suspend_noirq routine
> - add more comments
> - Link to v1: https://lore.kernel.org/r/20240920-pcie-en7581-rst-fix-v1-1-1043fb63ffc9@kernel.org
> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 59 ++++++++++++++++++++---------
>  1 file changed, 41 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 66ce4b5d309bb6d64618c70ac5e0a529e0910511..8e4704ff3509867fc0ff799e9fb99e71e46756cd 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -125,10 +125,18 @@
>  
>  struct mtk_gen3_pcie;
>  
> +enum mtk_gen3_pcie_flags {
> +	SKIP_PCIE_RSTB	= BIT(0), /* skip PCIE_RSTB signals configuration
> +				   * during device probing or suspend/resume
> +				   * phase in order to avoid hw bugs/issues.
> +				   */
> +};
> +
>  /**
>   * struct mtk_gen3_pcie_pdata - differentiate between host generations
>   * @power_up: pcie power_up callback
>   * @phy_resets: phy reset lines SoC data.
> + * @flags: pcie device flags.
>   */
>  struct mtk_gen3_pcie_pdata {
>  	int (*power_up)(struct mtk_gen3_pcie *pcie);
> @@ -136,6 +144,7 @@ struct mtk_gen3_pcie_pdata {
>  		const char *id[MAX_NUM_PHY_RESETS];
>  		int num_resets;
>  	} phy_resets;
> +	u32 flags;
>  };
>  
>  /**
> @@ -402,22 +411,33 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
>  	val |= PCIE_DISABLE_DVFSRC_VLT_REQ;
>  	writel_relaxed(val, pcie->base + PCIE_MISC_CTRL_REG);
>  
> -	/* Assert all reset signals */
> -	val = readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
> -	val |= PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB | PCIE_PE_RSTB;
> -	writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> -
>  	/*
> -	 * Described in PCIe CEM specification sections 2.2 (PERST# Signal)
> -	 * and 2.2.1 (Initial Power-Up (G3 to S0)).
> -	 * The deassertion of PERST# should be delayed 100ms (TPVPERL)
> -	 * for the power and clock to become stable.
> +	 * Airoha EN7581 has a hw bug asserting/releasing PCIE_PE_RSTB signal
> +	 * causing occasional PCIe link down. In order to overcome the issue,
> +	 * PCIE_RSTB signals are not asserted/released at this stage and the
> +	 * PCIe block is reset using REG_PCI_CONTROL (0x88) and
> +	 * REG_RESET_CONTROL (0x834) registers available via the clock module.
>  	 */
> -	msleep(100);
> -
> -	/* De-assert reset signals */
> -	val &= ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB | PCIE_PE_RSTB);
> -	writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> +	if (!(pcie->soc->flags & SKIP_PCIE_RSTB)) {
> +		/* Assert all reset signals */
> +		val = readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
> +		val |= PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB |
> +		       PCIE_PE_RSTB;
> +		writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> +
> +		/*
> +		 * Described in PCIe CEM specification sections 2.2 (PERST# Signal)
> +		 * and 2.2.1 (Initial Power-Up (G3 to S0)).
> +		 * The deassertion of PERST# should be delayed 100ms (TPVPERL)
> +		 * for the power and clock to become stable.

Blank line between paragraphs.

> +		 */
> +		msleep(PCIE_T_PVPERL_MS);
> +
> +		/* De-assert reset signals */
> +		val &= ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB |
> +			 PCIE_PE_RSTB);
> +		writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> +	}
>  
>  	/* Check if the link is up or not */
>  	err = readl_poll_timeout(pcie->base + PCIE_LINK_STATUS_REG, val,
> @@ -1160,10 +1180,12 @@ static int mtk_pcie_suspend_noirq(struct device *dev)
>  		return err;
>  	}
>  
> -	/* Pull down the PERST# pin */
> -	val = readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
> -	val |= PCIE_PE_RSTB;
> -	writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> +	if (!(pcie->soc->flags & SKIP_PCIE_RSTB)) {
> +		/* Pull down the PERST# pin */
> +		val = readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
> +		val |= PCIE_PE_RSTB;
> +		writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> +	}
>  
>  	dev_dbg(pcie->dev, "entered L2 states successfully");
>  
> @@ -1214,6 +1236,7 @@ static const struct mtk_gen3_pcie_pdata mtk_pcie_soc_en7581 = {
>  		.id[2] = "phy-lane2",
>  		.num_resets = 3,
>  	},
> +	.flags = SKIP_PCIE_RSTB,
>  };
>  
>  static const struct of_device_id mtk_pcie_of_match[] = {
> 
> ---
> base-commit: 3102ce10f3111e4c3b8fb233dc93f29e220adaf7
> change-id: 20240920-pcie-en7581-rst-fix-8161658c13c4
> 
> Best regards,
> -- 
> Lorenzo Bianconi <lorenzo@kernel.org>
> 

