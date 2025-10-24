Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A890CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 12:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x2d7sDTl3SazQkAKLB0c39ILNZM2divz9O3bAG2KBEg=; b=2jA+K6oLYrj9gL0dNUDKF3tfP2
	jzN4VUoWayGSrED7xI7eMNPGPMu5dDlTOjaAFXYq2CqA/egQPdkgG0lTXXKZDRo+mR5bNA8FCSREy
	+awFZXBaN4F6qDiw908JOnmxtk3qkKt/fBdUcp2wu8A9hgnTNceMoZuADmQppaQ++Si24tnVNtLK1
	qsEGniKZNRDfgYbWiUyCA3wFC6SydDQJDXY6vbw70pFuE+LNYBa4V1qGIaIMFY6UEcRKgBh6YX1GG
	dqSapASnLr15HP2vkUsfdGOOpnFc5yV0NgtmgbUGTo58h93dk1DQebUOmPIqLhZ32AL/+6J+GtdmF
	uCEWF7nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCGnl-00000009Lvl-2Xu4;
	Fri, 24 Oct 2025 12:21:49 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCGnh-00000009LuP-2I23
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 12:21:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E60F8C0C426;
	Fri, 24 Oct 2025 12:21:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CAB1460703;
	Fri, 24 Oct 2025 12:21:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AD095102F2494;
	Fri, 24 Oct 2025 14:21:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761308500; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=x2d7sDTl3SazQkAKLB0c39ILNZM2divz9O3bAG2KBEg=;
	b=mtZfZ8Fvzni/ZBVlwcVTL6dB5cWoNQZIGHwiIwATXK47wnMy2rIvfgnCjdWF5PZpupmTZ2
	2m3FtTBulY2W8MEfLcrVqoOFWO3zJbzePGU7/Yi6n9ra3iksyc2wI8BZnlD2GlYy1kKebc
	pxQ7JzAreDI3lYpo8PTkXy1/p+kpRTa2DGulULPvXM+/mAQPpXCjemmcenVQon3OrYGxky
	H/paFxM9jyKzushNdD6tYksHDBm0hhMzjiM8wAhXZcO4n1CR9XcJ6j6gfgcO4xfsbAohD0
	L4G6UjT+CEIcZYXpjSdikLyjliaYqogGJKSRkbcfxUUh5aOywM4xmjTXMoelMA==
Message-ID: <79081b06-4e34-458a-8e00-fe3a0e4e26b6@bootlin.com>
Date: Fri, 24 Oct 2025 14:21:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/10] net: stmmac: Use interrupt mode INTM=1 for per
 channel irq
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>
Cc: kernel@pengutronix.de, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Teoh Ji Sheng <ji.sheng.teoh@intel.com>
References: <20251024-v6-12-topic-socfpga-agilex5-v5-0-4c4a51159eeb@pengutronix.de>
 <20251024-v6-12-topic-socfpga-agilex5-v5-2-4c4a51159eeb@pengutronix.de>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20251024-v6-12-topic-socfpga-agilex5-v5-2-4c4a51159eeb@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_052146_245877_D2A930ED 
X-CRM114-Status: GOOD (  23.32  )
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

Hi Steffen,

On 24/10/2025 13:49, Steffen Trumtrar wrote:
> From: Teoh Ji Sheng <ji.sheng.teoh@intel.com>
> 
> commit 6ccf12ae111e ("net: stmmac: use interrupt mode INTM=1
> for multi-MSI") is introduced for platform that uses MSI.
> 
> Similar approach is taken to enable per channel interrupt
> that uses shared peripheral interrupt (SPI), so only per channel
> TX and RX intr (TI/RI) are handled by TX/RX ISR without calling
> common interrupt ISR.
> 
> TX/RX NORMAL interrupts check is now decoupled, since NIS bit
> is not asserted for any TI/RI events when INTM=1.
> 
> Signed-off-by: Teoh Ji Sheng <ji.sheng.teoh@intel.com>
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h       |  3 +++
>  drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c   | 10 +++++++++-
>  .../net/ethernet/stmicro/stmmac/stmmac_platform.c    | 20 ++++++++++++++++++++
>  include/linux/stmmac.h                               |  2 ++
>  4 files changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> index 0d408ee17f337..64b533207e4a6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> @@ -326,6 +326,9 @@
>  /* DMA Registers */
>  #define XGMAC_DMA_MODE			0x00003000
>  #define XGMAC_SWR			BIT(0)
> +#define DMA_MODE_INTM_MASK		GENMASK(13, 12)
> +#define DMA_MODE_INTM_SHIFT		12
> +#define DMA_MODE_INTM_MODE1		0x1
>  #define XGMAC_DMA_SYSBUS_MODE		0x00003004
>  #define XGMAC_WR_OSR_LMT		GENMASK(29, 24)
>  #define XGMAC_WR_OSR_LMT_SHIFT		24
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> index 4d6bb995d8d84..1e9ee1f10f0ef 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> @@ -31,6 +31,13 @@ static void dwxgmac2_dma_init(void __iomem *ioaddr,
>  		value |= XGMAC_EAME;
>  
>  	writel(value, ioaddr + XGMAC_DMA_SYSBUS_MODE);
> +
> +	if (dma_cfg->multi_irq_en) {
> +		value = readl(ioaddr + XGMAC_DMA_MODE);
> +		value &= ~DMA_MODE_INTM_MASK;
> +		value |= (DMA_MODE_INTM_MODE1 << DMA_MODE_INTM_SHIFT);
> +		writel(value, ioaddr + XGMAC_DMA_MODE);
> +	}
>  }
>  
>  static void dwxgmac2_dma_init_chan(struct stmmac_priv *priv,
> @@ -359,13 +366,14 @@ static int dwxgmac2_dma_interrupt(struct stmmac_priv *priv,
>  		}
>  	}
>  
> -	/* TX/RX NORMAL interrupts */
> +	/* RX NORMAL interrupts */
>  	if (likely(intr_status & XGMAC_RI)) {
>  		u64_stats_update_begin(&stats->syncp);
>  		u64_stats_inc(&stats->rx_normal_irq_n[chan]);
>  		u64_stats_update_end(&stats->syncp);
>  		ret |= handle_rx;
>  	}
> +	/* TX NORMAL interrupts */
>  	if (likely(intr_status & (XGMAC_TI | XGMAC_TBU))) {
>  		u64_stats_update_begin(&stats->syncp);
>  		u64_stats_inc(&stats->tx_normal_irq_n[chan]);
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index 27bcaae07a7f2..cfa82b8e04b94 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -607,6 +607,8 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
>  	dma_cfg->fixed_burst = of_property_read_bool(np, "snps,fixed-burst");
>  	dma_cfg->mixed_burst = of_property_read_bool(np, "snps,mixed-burst");
>  
> +	dma_cfg->multi_irq_en = of_property_read_bool(np, "snps,multi-irq-en");

You need to document this property in the binding

> +
>  	plat->force_thresh_dma_mode = of_property_read_bool(np, "snps,force_thresh_dma_mode");
>  	if (plat->force_thresh_dma_mode && plat->force_sf_dma_mode) {
>  		plat->force_sf_dma_mode = 0;
> @@ -737,6 +739,8 @@ EXPORT_SYMBOL_GPL(stmmac_pltfr_find_clk);
>  int stmmac_get_platform_resources(struct platform_device *pdev,
>  				  struct stmmac_resources *stmmac_res)
>  {
> +	char irq_name[11];
> +	int i;
>  	memset(stmmac_res, 0, sizeof(*stmmac_res));
>  
>  	/* Get IRQ information early to have an ability to ask for deferred
> @@ -746,6 +750,22 @@ int stmmac_get_platform_resources(struct platform_device *pdev,
>  	if (stmmac_res->irq < 0)
>  		return stmmac_res->irq;
>  
> +	/* For RX Channel */
> +	for (i = 0; i < MTL_MAX_RX_QUEUES; i++) {
> +		sprintf(irq_name, "%s%d", "macirq_rx", i);
> +		stmmac_res->rx_irq[i] = platform_get_irq_byname(pdev, irq_name);
> +		if (stmmac_res->rx_irq[i] < 0)
> +			break;
> +	}
> +
> +	/* For TX Channel */
> +	for (i = 0; i < MTL_MAX_TX_QUEUES; i++) {
> +		sprintf(irq_name, "%s%d", "macirq_tx", i);
> +		stmmac_res->tx_irq[i] = platform_get_irq_byname(pdev, irq_name);
> +			if (stmmac_res->tx_irq[i] < 0)
> +				break;
> +	}

Same for these irq names

> +
>  	/* On some platforms e.g. SPEAr the wake up irq differs from the mac irq
>  	 * The external wake up irq can be passed through the platform code
>  	 * named as "eth_wake_irq"
> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index fa1318bac06c4..a8b15b4e3c370 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -102,6 +102,7 @@ struct stmmac_dma_cfg {
>  	bool aal;
>  	bool eame;
>  	bool multi_msi_en;
> +	bool multi_irq_en;
>  	bool dche;
>  	bool atds;
>  };
> @@ -290,6 +291,7 @@ struct plat_stmmacenet_data {
>  	u8 vlan_fail_q;
>  	struct pci_dev *pdev;
>  	int int_snapshot_num;
> +	bool multi_irq_en;

This seems to be unused ?

>  	int msi_mac_vec;
>  	int msi_wol_vec;
>  	int msi_lpi_vec;
> 
Thanks,

Maxime

