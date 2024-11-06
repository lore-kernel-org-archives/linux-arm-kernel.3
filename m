Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C96D35E5D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 01:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=bVjIdzAUshkjwP0ESdIfahQpb1a94Dr8amn1lCTmv+E=; b=nCNrxDqr+SnGva
	9cet2uzU7ZRpvKFZADYc/nu+A+uNN3PA9nyUQpOSCJ3WrD/EjeyqsYUW3SxQCBF/66VYsxeTlo45g
	PwIzk3kfdEAx1BGTMDpVL2Gj+M3l5dGiUcv+0o7teYyogftRVWS0xLciAbaKRZjDYai9mKQfjNBuL
	s7pymXztHH8ZU/5fcYhdh4Q+//ku89wUUtQTOIoJ/7dZ9nQ9pc6MeSu75PBxBArxAD1Xy9TuiSSct
	Jpm52eC9Qvyzg50/tVeQbVJr7jDJv8zXTV5gL5PYSwe8tUA/QvdMknoNkrK5+dUeH+vnutjOf2uM7
	Y9cI9r8fB4YjJ3EKzlIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Um5-00000001JFG-3diC;
	Wed, 06 Nov 2024 01:23:57 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8UkN-00000001J2m-15Pd;
	Wed, 06 Nov 2024 01:22:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 80284A40BF5;
	Wed,  6 Nov 2024 01:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA147C4CECF;
	Wed,  6 Nov 2024 01:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730856130;
	bh=CTwxo+a59cKcPcqlad8C1Q83+2bZfWEFbSYDDoYvJmI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=UUUtCwOyNqA2uQhwxK/bCvR5AxgRCgLxIvhCAKJ6ZkqGTjK9+Lv6B6AISY7MONKjH
	 DHko1vkEAmnr4dmI4M0s5rJMtG67zUfT7Qc1yvNrZAxnfFbV625iLjNA+kQpcl7aBG
	 DGpT80Vbse2wpr+mzJuxORmvpLBl4K+l4vFI5odhGeSKD276fog9x5EwxWWcp7qWId
	 WR+eUPL2KZCHRPualYGxUjMdEbbbvkFb/T4JgLLavQsNW5mVo5UMosWHgHJT1ChQ3x
	 0BRU59UP3/KY9SzPGZVx+sxsmbqZuVxePeHICwpi9ysQxV9oiF2g8j3xthRshkBdVK
	 KSqQVCDQgkEgA==
Date: Tue, 5 Nov 2024 19:22:08 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>
Cc: linux-pci@vger.kernel.org, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, bhelgaas@google.com, matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
	fshao@chromium.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v4 1/2] PCI: mediatek-gen3: Add support for setting
 max-link-speed limit
Message-ID: <20241106012208.GA1498775@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104114935.172908-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_172211_477005_42B76B2D 
X-CRM114-Status: GOOD (  26.13  )
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

On Mon, Nov 04, 2024 at 12:49:34PM +0100, AngeloGioacchino Del Regno wrote:
> Add support for respecting the max-link-speed devicetree property,
> forcing a maximum speed (Gen) for a PCI-Express port.
> 
> Since the MediaTek PCIe Gen3 controllers also expose the maximum
> supported link speed in the PCIE_BASE_CFG register, if property
> max-link-speed is specified in devicetree, validate it against the
> controller capabilities and proceed setting the limitations only
> if the wanted Gen is lower than the maximum one that is supported
> by the controller itself (otherwise it makes no sense!).
> 
> Reviewed-by: Fei Shao <fshao@chromium.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Can we get an ack from Ryder and/or Jianjun, since they're listed as
supporters for this driver?

> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -28,7 +28,11 @@
>  
>  #include "../pci.h"
>  
> +#define PCIE_BASE_CFG_REG		0x14
> +#define PCIE_BASE_CFG_SPEED		GENMASK(15, 8)
> +
>  #define PCIE_SETTING_REG		0x80
> +#define PCIE_SETTING_GEN_SUPPORT	GENMASK(14, 12)
>  #define PCIE_PCI_IDS_1			0x9c
>  #define PCI_CLASS(class)		(class << 8)
>  #define PCIE_RC_MODE			BIT(0)
> @@ -125,6 +129,9 @@
>  
>  struct mtk_gen3_pcie;
>  
> +#define PCIE_CONF_LINK2_CTL_STS		(PCIE_CFG_OFFSET_ADDR + 0xb0)
> +#define PCIE_CONF_LINK2_LCR2_LINK_SPEED	GENMASK(3, 0)

Are these the same as PCI_EXP_LNKCTL2 and PCI_EXP_LNKCTL2_TLS?

It looks like you access these registers via an ioremapped MMIO access
instead of config space, but if they reach the same internal register,
please define the appropriate offset and use PCI_EXP_LNKCTL2 and
related definitions so grep can find them and we'll know how to
interpret the PCIE_CONF_LINK2_LCR2_LINK_SPEED field.

>  /**
>   * struct mtk_gen3_pcie_pdata - differentiate between host generations
>   * @power_up: pcie power_up callback
> @@ -160,6 +167,7 @@ struct mtk_msi_set {
>   * @phy: PHY controller block
>   * @clks: PCIe clocks
>   * @num_clks: PCIe clocks count for this port
> + * @max_link_speed: Maximum link speed (PCIe Gen) for this port
>   * @irq: PCIe controller interrupt number
>   * @saved_irq_state: IRQ enable state saved at suspend time
>   * @irq_lock: lock protecting IRQ register access
> @@ -180,6 +188,7 @@ struct mtk_gen3_pcie {
>  	struct phy *phy;
>  	struct clk_bulk_data *clks;
>  	int num_clks;
> +	u8 max_link_speed;
>  
>  	int irq;
>  	u32 saved_irq_state;
> @@ -381,11 +390,27 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
>  	int err;
>  	u32 val;
>  
> -	/* Set as RC mode */
> +	/* Set as RC mode and set controller PCIe Gen speed restriction, if any */
>  	val = readl_relaxed(pcie->base + PCIE_SETTING_REG);
>  	val |= PCIE_RC_MODE;
> +	if (pcie->max_link_speed) {
> +		val &= ~PCIE_SETTING_GEN_SUPPORT;
> +
> +		/* Can enable link speed support only from Gen2 onwards */
> +		if (pcie->max_link_speed >= 2)
> +			val |= FIELD_PREP(PCIE_SETTING_GEN_SUPPORT,
> +					  GENMASK(pcie->max_link_speed - 2, 0));
> +	}
>  	writel_relaxed(val, pcie->base + PCIE_SETTING_REG);
>  
> +	/* Set Link Control 2 (LNKCTL2) speed restriction, if any */
> +	if (pcie->max_link_speed) {
> +		val = readl_relaxed(pcie->base + PCIE_CONF_LINK2_CTL_STS);
> +		val &= ~PCIE_CONF_LINK2_LCR2_LINK_SPEED;
> +		val |= FIELD_PREP(PCIE_CONF_LINK2_LCR2_LINK_SPEED, pcie->max_link_speed);
> +		writel_relaxed(val, pcie->base + PCIE_CONF_LINK2_CTL_STS);
> +	}
> +
>  	/* Set class code */
>  	val = readl_relaxed(pcie->base + PCIE_PCI_IDS_1);
>  	val &= ~GENMASK(31, 8);
> @@ -1004,9 +1029,21 @@ static void mtk_pcie_power_down(struct mtk_gen3_pcie *pcie)
>  	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets, pcie->phy_resets);
>  }
>  
> +static int mtk_pcie_get_controller_max_link_speed(struct mtk_gen3_pcie *pcie)
> +{
> +	u32 val;
> +	int ret;
> +
> +	val = readl_relaxed(pcie->base + PCIE_BASE_CFG_REG);
> +	val = FIELD_GET(PCIE_BASE_CFG_SPEED, val);
> +	ret = fls(val);
> +
> +	return ret > 0 ? ret : -EINVAL;
> +}
> +
>  static int mtk_pcie_setup(struct mtk_gen3_pcie *pcie)
>  {
> -	int err;
> +	int err, max_speed;
>  
>  	err = mtk_pcie_parse_port(pcie);
>  	if (err)
> @@ -1031,6 +1068,20 @@ static int mtk_pcie_setup(struct mtk_gen3_pcie *pcie)
>  	if (err)
>  		return err;
>  
> +	err = of_pci_get_max_link_speed(pcie->dev->of_node);
> +	if (err > 0) {
> +		/* Get the maximum speed supported by the controller */
> +		max_speed = mtk_pcie_get_controller_max_link_speed(pcie);
> +
> +		/* Set max_link_speed only if the controller supports it */
> +		if (max_speed >= 0 && max_speed <= err) {
> +			pcie->max_link_speed = err;
> +			dev_dbg(pcie->dev,
> +				"Max controller link speed Gen%d, override to Gen%u",
> +				max_speed, pcie->max_link_speed);
> +		}
> +	}
> +
>  	/* Try link up */
>  	err = mtk_pcie_startup_port(pcie);
>  	if (err)
> -- 
> 2.46.1
> 

