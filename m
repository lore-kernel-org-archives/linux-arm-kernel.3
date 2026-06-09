Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C06CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 19:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VF3viPuMEWMRZJosuNQWMzSXeAmE8fJkp4pt8onW/hA=; b=qG9Vmgnevw6LFgf9dhZ4N47zVW
	/dJqCYEYcEWrp2Esy6oe+eV/R9WE8Ky+1ivP5AkCzYMAM0F4FTmww9tcI7UkhMsFq0Fvut1kG3WR7
	YEP1vMpJQabjEnr1hLARm8kddEhSp2O6W8MtwWAY2+q+KtnoxgXjPGwfTLHIcrUt3JoFvN56z0aOU
	tNyBeno4sCL6DBm9PusZY+7YbCvQtFdF8Kvp8JmjVLI7LSlUBO3FGWOsjF9okXrQq6/zKzeW5fiu/
	D8pbux2tcPRyknkcRujjOVDt/ciCurnp0G/ngrv9vOdRu6lPRH97B1GVI3+ov+pEihoFuEdW6sKWs
	NZRH409Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX2Le-00000006J25-2fAT;
	Tue, 09 Jun 2026 19:42:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX2Lc-00000006J1g-47zH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 19:42:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0D1716024D;
	Tue,  9 Jun 2026 19:42:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F35BE1F00893;
	Tue,  9 Jun 2026 19:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781034171;
	bh=VF3viPuMEWMRZJosuNQWMzSXeAmE8fJkp4pt8onW/hA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=DEB8hNSvqowoBsK7oJGEHssg8xawpxZ4XjOvZWYwOTV2tGTY8r4FZ0xm/DtI4yFen
	 20Cg4KP5QSUVKt3zu4X+uh24hFtE1M+fEybkvLSmlv5RJXXTZ4XpSjDItk3Kkhb7kc
	 3cdixxxdaQaNLZ9rhfnF8J7e7kHc2RXn6JZAlp/ilF+rndMLG1X1MkNZo9INrU9Z1s
	 uEReFLCk3DWijehGRsg1Xb1lCVZzotP7tkk5baiXWXWd8iZ3CA1qzdi07fqpGSrfmM
	 tUK4KhTleT85i7KjJSsMxn6QhmZGfCOxP7p1pcIt8iOfWX+5GvlOypiejBV0T9c0pc
	 vK+1MA1rTte4Q==
Message-ID: <3bf39b4d-123f-42d3-bc05-fdb86a256e7e@kernel.org>
Date: Tue, 9 Jun 2026 21:42:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/8] can: flexcan: split rx/tx masks per mailbox IRQ
 line
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-can@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>,
 Haibo Chen <haibo.chen@nxp.com>
References: <20260609142954.1807421-1-ciprianmarian.costea@oss.nxp.com>
 <20260609142954.1807421-4-ciprianmarian.costea@oss.nxp.com>
From: Vincent Mailhol <mailhol@kernel.org>
Content-Language: en-US
Autocrypt: addr=mailhol@kernel.org; keydata=
 xjMEZluomRYJKwYBBAHaRw8BAQdAf+/PnQvy9LCWNSJLbhc+AOUsR2cNVonvxhDk/KcW7FvN
 JFZpbmNlbnQgTWFpbGhvbCA8bWFpbGhvbEBrZXJuZWwub3JnPsKZBBMWCgBBFiEE7Y9wBXTm
 fyDldOjiq1/riG27mcIFAmdfB/kCGwMFCQp/CJcFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcC
 F4AACgkQq1/riG27mcKBHgEAygbvORJOfMHGlq5lQhZkDnaUXbpZhxirxkAHwTypHr4A/joI
 2wLjgTCm5I2Z3zB8hqJu+OeFPXZFWGTuk0e2wT4JzjgEZx4y8xIKKwYBBAGXVQEFAQEHQJrb
 YZzu0JG5w8gxE6EtQe6LmxKMqP6EyR33sA+BR9pLAwEIB8J+BBgWCgAmFiEE7Y9wBXTmfyDl
 dOjiq1/riG27mcIFAmceMvMCGwwFCQPCZwAACgkQq1/riG27mcJU7QEA+LmpFhfQ1aij/L8V
 zsZwr/S44HCzcz5+jkxnVVQ5LZ4BANOCpYEY+CYrld5XZvM8h2EntNnzxHHuhjfDOQ3MAkEK
In-Reply-To: <20260609142954.1807421-4-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 09/06/2026 at 16:29, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> On S32G2, which has two mailbox IRQ lines (mb-0 for MBs 0-7, mb-1
> for MBs 8-63), both handlers currently process the full rx_mask/tx_mask
> range.
> 
> Introduce FLEXCAN_SECONDARY_MB_IRQ_MB0_MASK and
> FLEXCAN_SECONDARY_MB_IRQ_MB1_MASK to describe the split, and pass
> the selected mask to flexcan_do_mb() via a new mb_mask parameter.
> 
> In flexcan_irq_mb(), the irq argument selects the correct mask: the
> primary MB IRQ uses MB0_MASK and the secondary uses MB1_MASK.
> 
> For single-IRQ platforms, mb_mask is ~0ULL with no functional change.
> 
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> Reviewed-and-tested-by: Haibo Chen <haibo.chen@nxp.com>
> Tested-by: Enric Balletbo i Serra <eballetb@redhat.com>

Looks better than v5!

Reviewed-by: Vincent Mailhol <mailhol@kernel.org>

> ---
>  drivers/net/can/flexcan/flexcan-core.c | 39 ++++++++++++++++++--------
>  1 file changed, 28 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/net/can/flexcan/flexcan-core.c b/drivers/net/can/flexcan/flexcan-core.c
> index 7dde2e623def..0ed838f0719a 100644
> --- a/drivers/net/can/flexcan/flexcan-core.c
> +++ b/drivers/net/can/flexcan/flexcan-core.c
> @@ -182,6 +182,12 @@
>  #define FLEXCAN_IFLAG_RX_FIFO_WARN	BIT(6)
>  #define FLEXCAN_IFLAG_RX_FIFO_AVAILABLE	BIT(5)
>  
> +/* On platforms with FLEXCAN_QUIRK_SECONDARY_MB_IRQ, the MB IRQ lines are
> + * split.
> + */
> +#define FLEXCAN_SECONDARY_MB_IRQ_MB0_MASK	GENMASK_ULL(7, 0)
> +#define FLEXCAN_SECONDARY_MB_IRQ_MB1_MASK	GENMASK_ULL(63, 8)

Nitpick: priv->rx_mask, priv->tx_mask and your mb_mask variable all have
type u64 so you could have used GENMASK_U64() to stay coherent with the
type. But you don't have to send a v6 just for this.

>  /* FLEXCAN message buffers */
>  #define FLEXCAN_MB_CODE_MASK		(0xf << 24)
>  #define FLEXCAN_MB_CODE_RX_BUSY_BIT	(0x1 << 24)
> @@ -957,14 +963,16 @@ static inline void flexcan_write64(struct flexcan_priv *priv, u64 val, void __io
>  		priv->write(lower_32_bits(val), addr);
>  }
>  
> -static inline u64 flexcan_read_reg_iflag_rx(struct flexcan_priv *priv)
> +static inline u64 flexcan_read_reg_iflag_rx(struct flexcan_priv *priv,
> +					    u64 rx_mask)
>  {
> -	return flexcan_read64_mask(priv, &priv->regs->iflag1, priv->rx_mask);
> +	return flexcan_read64_mask(priv, &priv->regs->iflag1, rx_mask);
>  }
>  
> -static inline u64 flexcan_read_reg_iflag_tx(struct flexcan_priv *priv)
> +static inline u64 flexcan_read_reg_iflag_tx(struct flexcan_priv *priv,
> +					    u64 tx_mask)
>  {
> -	return flexcan_read64_mask(priv, &priv->regs->iflag1, priv->tx_mask);
> +	return flexcan_read64_mask(priv, &priv->regs->iflag1, tx_mask);
>  }
>  
>  static inline struct flexcan_priv *rx_offload_to_priv(struct can_rx_offload *offload)
> @@ -1071,12 +1079,14 @@ static struct sk_buff *flexcan_mailbox_read(struct can_rx_offload *offload,
>  }
>  
>  /* Process mailbox (RX + TX) events */
> -static irqreturn_t flexcan_do_mb(struct net_device *dev)
> +static irqreturn_t flexcan_do_mb(struct net_device *dev, u64 mb_mask)
>  {
>  	struct net_device_stats *stats = &dev->stats;
>  	struct flexcan_priv *priv = netdev_priv(dev);
>  	struct flexcan_regs __iomem *regs = priv->regs;
>  	irqreturn_t handled = IRQ_NONE;
> +	u64 rx_mask = priv->rx_mask & mb_mask;
> +	u64 tx_mask = priv->tx_mask & mb_mask;
>  	u64 reg_iflag_tx;
>  
>  	/* reception interrupt */
> @@ -1084,7 +1094,8 @@ static irqreturn_t flexcan_do_mb(struct net_device *dev)
>  		u64 reg_iflag_rx;
>  		int ret;
>  
> -		while ((reg_iflag_rx = flexcan_read_reg_iflag_rx(priv))) {
> +		while ((reg_iflag_rx = flexcan_read_reg_iflag_rx(priv,
> +								 rx_mask))) {
>  			handled = IRQ_HANDLED;
>  			ret = can_rx_offload_irq_offload_timestamp(&priv->offload,
>  								   reg_iflag_rx);
> @@ -1110,10 +1121,10 @@ static irqreturn_t flexcan_do_mb(struct net_device *dev)
>  		}
>  	}
>  
> -	reg_iflag_tx = flexcan_read_reg_iflag_tx(priv);
> +	reg_iflag_tx = flexcan_read_reg_iflag_tx(priv, tx_mask);
>  
>  	/* transmission complete interrupt */
> -	if (reg_iflag_tx & priv->tx_mask) {
> +	if (reg_iflag_tx & tx_mask) {
>  		u32 reg_ctrl = priv->read(&priv->tx_mb->can_ctrl);
>  
>  		handled = IRQ_HANDLED;
> @@ -1125,7 +1136,7 @@ static irqreturn_t flexcan_do_mb(struct net_device *dev)
>  		/* after sending a RTR frame MB is in RX mode */
>  		priv->write(FLEXCAN_MB_CODE_TX_INACTIVE,
>  			    &priv->tx_mb->can_ctrl);
> -		flexcan_write64(priv, priv->tx_mask, &regs->iflag1);
> +		flexcan_write64(priv, tx_mask, &regs->iflag1);
>  		netif_wake_queue(dev);
>  	}
>  
> @@ -1228,7 +1239,7 @@ static irqreturn_t flexcan_irq(int irq, void *dev_id)
>  	struct flexcan_priv *priv = netdev_priv(dev);
>  	irqreturn_t handled;
>  
> -	handled = flexcan_do_mb(dev);
> +	handled = flexcan_do_mb(dev, ~0ULL);
>  	handled |= flexcan_do_state(dev);
>  	handled |= flexcan_do_berr(dev);
>  
> @@ -1244,8 +1255,14 @@ static irqreturn_t flexcan_irq_mb(int irq, void *dev_id)
>  	struct net_device *dev = dev_id;
>  	struct flexcan_priv *priv = netdev_priv(dev);
>  	irqreturn_t handled;
> +	u64 mb_mask = ~0ULL;
> +
> +	if (priv->devtype_data.quirks & FLEXCAN_QUIRK_SECONDARY_MB_IRQ)
> +		mb_mask = (irq == priv->irq_secondary_mb) ?
> +			  FLEXCAN_SECONDARY_MB_IRQ_MB1_MASK :
> +			  FLEXCAN_SECONDARY_MB_IRQ_MB0_MASK;
>  
> -	handled = flexcan_do_mb(dev);
> +	handled = flexcan_do_mb(dev, mb_mask);
>  
>  	if (handled)
>  		can_rx_offload_irq_finish(&priv->offload);


Yours sincerely,
Vincent Mailhol


