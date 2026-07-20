Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A45E0C4452A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 14:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QYtCIYb5UxFdCVyUP7gHIgoE53UyvbtqfxqBe9fHsqA=; b=45rB4nc+CWLbC5S1eg8JMiylwY
	MzITAxyhQtPldE3LoC4v4/muWm+7Z9a/BJjg5tXd3P+HMaIbROpADVyz0ILscEp5JeJVK1JnZNybJ
	G9oNIir8wPZ41XYX8dzjOjCT+cHt7Mfxvz1uQbcNeCIkaKyTXklzl30vkUWBPXV4NMF8SlbIF0Rqh
	xhdckIgrrm8IiTfG6I/CbAsU4FvkBUne9uRUYrZelW3Fu58rzHracp20F/stFmB59WbTE4VETVgto
	/ehHPwJkCXCJXoerOVTHTIn3WD+PAGa7lhd9qWRb2L1bOpe1m3mQxT/Va/fgOoEM1itRc1k1t7nfF
	Vz4EU+bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpAO-000000070Qw-30f8;
	Mon, 20 Jul 2026 14:40:24 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpAL-000000070Pw-1znE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 14:40:23 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DE2DF1A10C3;
	Mon, 20 Jul 2026 14:40:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AD87560360;
	Mon, 20 Jul 2026 14:40:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 27F4311BD3D7F;
	Mon, 20 Jul 2026 16:40:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784558415; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=QYtCIYb5UxFdCVyUP7gHIgoE53UyvbtqfxqBe9fHsqA=;
	b=R7bamHGDq5ejMwKZ6s8SMmVuLuVk0hU9b2xLmL74byZ3w1266aWhFCnOPf2rvgxKKz4he8
	+izN91RNWfQjE4N1dQtY5ZpgiR3qLxK/eut+ylZ14ORAnjBtgtQzS9Z5zQVVTCfHqZkMN8
	F27y74XmXfrqV/ZmfKreojMBjGofULWjXuUi3wLYhRGLMJ0a8zWhTt+INcBe/ERDdHebOP
	m/nE6tC9tPc1ykTnZQcvFkscFU/36HyUi4tdoHDspl4m/vspru77bfQaZwJm17FmcKfltk
	xQmqNCctYFeEuB+4L/MVLoTbnnxPxqzwIS4vQVwBt4RX/h1MwjGNCl+LLsbigg==
Message-ID: <d8a556c5-9403-48fa-8456-5451e576bae0@bootlin.com>
Date: Mon, 20 Jul 2026 16:40:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] net: stmmac: dwmac4: mask interrupts when stopping
 DMA in suspend
To: Luis Lang <luis.la@mail.de>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
 Rohan G Thomas <rohan.g.thomas@altera.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260720111534.163416-1-luis.la@mail.de>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260720111534.163416-1-luis.la@mail.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_074021_665660_F355EF58 
X-CRM114-Status: GOOD (  19.56  )
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

Hi Luis,

On 7/20/26 13:15, Luis Lang wrote:
> Since commit 1b9707e6f1a9 ("net: stmmac: enable RPS and RBU
> interrupts"), suspending causes an interrupt storm from the RPS
> interrupt.
> Fix this by adding a deinit_chan() op to stmmac_dma_ops, which
> masks all default dma channel interrupts. This is called from
> stmmac_stop_all_dma(), so interrupts don't trigger while suspending.
> 
> Fixes: 1b9707e6f1a9 ("net: stmmac: enable RPS and RBU interrupts")
> Suggested-by: Andrew Lunn <andrew@lunn.ch>
> Suggested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Signed-off-by: Luis Lang <luis.la@mail.de>

I wasn't able to reproduce the original issue on dwmac4, however
I could test that suspend/resume as well as WoL still works on a
dwmac4 device with this patch applied.

Thanks for the patch !

Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  .../net/ethernet/stmicro/stmmac/dwmac4_dma.c  | 24 +++++++++++++++++++
>  drivers/net/ethernet/stmicro/stmmac/hwif.h    |  4 ++++
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c |  4 ++++
>  3 files changed, 32 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
> index 829a23bdad01..23ffe1adcd0d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
> @@ -106,6 +106,17 @@ static void dwmac4_dma_init_channel(struct stmmac_priv *priv,
>  	       ioaddr + DMA_CHAN_INTR_ENA(dwmac4_addrs, chan));
>  }
>  
> +static void dwmac4_dma_deinit_channel(struct stmmac_priv *priv,
> +				      void __iomem *ioaddr, u32 chan)
> +{
> +	const struct dwmac4_addrs *dwmac4_addrs = priv->plat->dwmac4_addrs;
> +	u32 value;
> +
> +	value = readl(ioaddr + DMA_CHAN_INTR_ENA(dwmac4_addrs, chan));
> +	value &= ~DMA_CHAN_INTR_DEFAULT_MASK;
> +	writel(value, ioaddr + DMA_CHAN_INTR_ENA(dwmac4_addrs, chan));
> +}
> +
>  static void dwmac410_dma_init_channel(struct stmmac_priv *priv,
>  				      void __iomem *ioaddr,
>  				      struct stmmac_dma_cfg *dma_cfg, u32 chan)
> @@ -125,6 +136,17 @@ static void dwmac410_dma_init_channel(struct stmmac_priv *priv,
>  	       ioaddr + DMA_CHAN_INTR_ENA(dwmac4_addrs, chan));
>  }
>  
> +static void dwmac410_dma_deinit_channel(struct stmmac_priv *priv,
> +					void __iomem *ioaddr, u32 chan)
> +{
> +	const struct dwmac4_addrs *dwmac4_addrs = priv->plat->dwmac4_addrs;
> +	u32 value;
> +
> +	value = readl(ioaddr + DMA_CHAN_INTR_ENA(dwmac4_addrs, chan));
> +	value &= ~DMA_CHAN_INTR_DEFAULT_MASK_4_10;
> +	writel(value, ioaddr + DMA_CHAN_INTR_ENA(dwmac4_addrs, chan));
> +}
> +
>  static void dwmac4_dma_init(void __iomem *ioaddr,
>  			    struct stmmac_dma_cfg *dma_cfg)
>  {
> @@ -548,6 +570,7 @@ const struct stmmac_dma_ops dwmac4_dma_ops = {
>  	.reset = dwmac4_dma_reset,
>  	.init = dwmac4_dma_init,
>  	.init_chan = dwmac4_dma_init_channel,
> +	.deinit_chan = dwmac4_dma_deinit_channel,
>  	.init_rx_chan = dwmac4_dma_init_rx_chan,
>  	.init_tx_chan = dwmac4_dma_init_tx_chan,
>  	.axi = dwmac4_dma_axi,
> @@ -577,6 +600,7 @@ const struct stmmac_dma_ops dwmac410_dma_ops = {
>  	.reset = dwmac4_dma_reset,
>  	.init = dwmac4_dma_init,
>  	.init_chan = dwmac410_dma_init_channel,
> +	.deinit_chan = dwmac410_dma_deinit_channel,
>  	.init_rx_chan = dwmac4_dma_init_rx_chan,
>  	.init_tx_chan = dwmac4_dma_init_tx_chan,
>  	.axi = dwmac4_dma_axi,
> diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> index e6317b94fff7..04dafec021b4 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> @@ -170,6 +170,8 @@ struct stmmac_dma_ops {
>  	void (*init)(void __iomem *ioaddr, struct stmmac_dma_cfg *dma_cfg);
>  	void (*init_chan)(struct stmmac_priv *priv, void __iomem *ioaddr,
>  			  struct stmmac_dma_cfg *dma_cfg, u32 chan);
> +	void (*deinit_chan)(struct stmmac_priv *priv, void __iomem *ioaddr,
> +			    u32 chan);
>  	void (*init_rx_chan)(struct stmmac_priv *priv, void __iomem *ioaddr,
>  			     struct stmmac_dma_cfg *dma_cfg,
>  			     dma_addr_t phy, u32 chan);
> @@ -235,6 +237,8 @@ struct stmmac_dma_ops {
>  	stmmac_do_void_callback(__priv, dma, init, __args)
>  #define stmmac_init_chan(__priv, __args...) \
>  	stmmac_do_void_callback(__priv, dma, init_chan, __priv, __args)
> +#define stmmac_deinit_chan(__priv, __args...) \
> +	stmmac_do_void_callback(__priv, dma, deinit_chan, __priv, __args)
>  #define stmmac_init_rx_chan(__priv, __args...) \
>  	stmmac_do_void_callback(__priv, dma, init_rx_chan, __priv, __args)
>  #define stmmac_init_tx_chan(__priv, __args...) \
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 2a0d7eff88d3..af29a50ddb89 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -2560,6 +2560,7 @@ static void stmmac_stop_all_dma(struct stmmac_priv *priv)
>  {
>  	u8 rx_channels_count = priv->plat->rx_queues_to_use;
>  	u8 tx_channels_count = priv->plat->tx_queues_to_use;
> +	u8 dma_csr_ch = max(rx_channels_count, tx_channels_count);
>  	u8 chan;
>  
>  	for (chan = 0; chan < rx_channels_count; chan++)
> @@ -2567,6 +2568,9 @@ static void stmmac_stop_all_dma(struct stmmac_priv *priv)
>  
>  	for (chan = 0; chan < tx_channels_count; chan++)
>  		stmmac_stop_tx_dma(priv, chan);
> +
> +	for (chan = 0; chan < dma_csr_ch; chan++)
> +		stmmac_deinit_chan(priv, priv->ioaddr, chan);
>  }
>  
>  /**


