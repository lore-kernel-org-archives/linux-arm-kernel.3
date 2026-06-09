Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A6DACD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 09:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yJ60kBjWAJGClfdgON5i50ME0WuDweXsexe8c1DjGOY=; b=FmhsImTZwlvLkYWK/ar0xcZCej
	f8qPq4Q2AWv0aqlVRW7TxVowBIFsxFtylWj6X+oR7cb4tbPqOWmSu7CxrQh3PXxb2o7vYpToJPSOY
	Z2Tqbm4oXFWt2rykCUPoeX5LvTnSh8AbEKQ8H8ywFJFzjH6oYR3GWiajPhBFVOfyVFyTr1wfhXdwn
	oa/sXFKq93afxRF0TXFrsBN/BwHD6x5LVNuDOTFXujDorO3ZI1u6RZl88zvBgIYeU8HBj/DE1U7E9
	Wf9HymC5oTeO2lEj8emK3/l2nTTWj219kTSHYEG8BMRCv2qp4tv3MreTOWD7mHGk+bNxMdviLx61F
	k27sDqzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWshm-00000005CWa-1jGp;
	Tue, 09 Jun 2026 09:25:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWshl-00000005CWT-0Q4d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 09:25:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C0BB4455A;
	Tue,  9 Jun 2026 09:25:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46FAE1F00893;
	Tue,  9 Jun 2026 09:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780997104;
	bh=yJ60kBjWAJGClfdgON5i50ME0WuDweXsexe8c1DjGOY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=EQcaFDcvAfJBZLt1sk2F4oVpqklrDooFDyAR9r8krEc6Cttbx38JBoke99EX5oJib
	 AZChEhROze4PqPSzWKRsvXXAlewpzJKxknovpGTuHmLf5gdLOFY8DPC8fDWl/5YHok
	 snctg/OfXjCKJlOojBpxLCDUqgMH3ZDO0Wj2O24IBet5+2whuRhwxurtAc2KtHXh2D
	 aBYFPGOrZclVsXVPHB7Gdd9ExuPALR0f50hXDqP4KAlGdtM7RZeD7dVGRugpj+dpvr
	 xmZc9YGlnF02UkKwPcX2YqSFLw9WC15mYNHfdLeaF0BN6oE/W0cwbJx7z68ttx4juG
	 cBKWior0bcVLQ==
Message-ID: <c50194dd-3a3c-4193-9296-1e35c6732351@kernel.org>
Date: Tue, 9 Jun 2026 11:24:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v4 3/8] can: flexcan: split rx/tx masks per mailbox
 IRQ line
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
 Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>
References: <20260603071342.641874-1-ciprianmarian.costea@oss.nxp.com>
 <20260603071342.641874-4-ciprianmarian.costea@oss.nxp.com>
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
In-Reply-To: <20260603071342.641874-4-ciprianmarian.costea@oss.nxp.com>
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

On 03/06/2026 at 09:13, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> On S32G2, which has two mailbox IRQ lines (mb-0 for MBs 0-7, mb-1
> for MBs 8-127), both handlers currently process the full rx_mask/tx_mask
> range,
> 
> Introduce struct flexcan_mb_irq to hold per-IRQ-line rx and tx masks.
> 
> In flexcan_irq_mb(), the irq argument selects the correct mask set: the
> primary MB IRQ uses mb_irq[0] and the secondary uses mb_irq[1].
> 
> For single-IRQ platforms, mb_irq[0] holds the full combined masks with no
> functional change.
> 
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> ---
>  drivers/net/can/flexcan/flexcan-core.c | 61 +++++++++++++++++++-------
>  drivers/net/can/flexcan/flexcan.h      | 10 ++++-
>  2 files changed, 52 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/net/can/flexcan/flexcan-core.c b/drivers/net/can/flexcan/flexcan-core.c
> index 7dde2e623def..32e4d4da00a1 100644
> --- a/drivers/net/can/flexcan/flexcan-core.c
> +++ b/drivers/net/can/flexcan/flexcan-core.c
> @@ -957,14 +957,16 @@ static inline void flexcan_write64(struct flexcan_priv *priv, u64 val, void __io
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
> @@ -1071,7 +1073,8 @@ static struct sk_buff *flexcan_mailbox_read(struct can_rx_offload *offload,
>  }
>  
>  /* Process mailbox (RX + TX) events */
> -static irqreturn_t flexcan_do_mb(struct net_device *dev)
> +static irqreturn_t flexcan_do_mb(struct net_device *dev,
> +				 const struct flexcan_mb_irq *mb_irq)
>  {
>  	struct net_device_stats *stats = &dev->stats;
>  	struct flexcan_priv *priv = netdev_priv(dev);
> @@ -1084,7 +1087,8 @@ static irqreturn_t flexcan_do_mb(struct net_device *dev)
>  		u64 reg_iflag_rx;
>  		int ret;
>  
> -		while ((reg_iflag_rx = flexcan_read_reg_iflag_rx(priv))) {
> +		while ((reg_iflag_rx = flexcan_read_reg_iflag_rx(priv,
> +								 mb_irq->rx_mask))) {
>  			handled = IRQ_HANDLED;
>  			ret = can_rx_offload_irq_offload_timestamp(&priv->offload,
>  								   reg_iflag_rx);
> @@ -1110,10 +1114,10 @@ static irqreturn_t flexcan_do_mb(struct net_device *dev)
>  		}
>  	}
>  
> -	reg_iflag_tx = flexcan_read_reg_iflag_tx(priv);
> +	reg_iflag_tx = flexcan_read_reg_iflag_tx(priv, mb_irq->tx_mask);
>  
>  	/* transmission complete interrupt */
> -	if (reg_iflag_tx & priv->tx_mask) {
> +	if (reg_iflag_tx & mb_irq->tx_mask) {
>  		u32 reg_ctrl = priv->read(&priv->tx_mb->can_ctrl);
>  
>  		handled = IRQ_HANDLED;
> @@ -1125,7 +1129,7 @@ static irqreturn_t flexcan_do_mb(struct net_device *dev)
>  		/* after sending a RTR frame MB is in RX mode */
>  		priv->write(FLEXCAN_MB_CODE_TX_INACTIVE,
>  			    &priv->tx_mb->can_ctrl);
> -		flexcan_write64(priv, priv->tx_mask, &regs->iflag1);
> +		flexcan_write64(priv, mb_irq->tx_mask, &regs->iflag1);
>  		netif_wake_queue(dev);
>  	}
>  
> @@ -1228,7 +1232,7 @@ static irqreturn_t flexcan_irq(int irq, void *dev_id)
>  	struct flexcan_priv *priv = netdev_priv(dev);
>  	irqreturn_t handled;
>  
> -	handled = flexcan_do_mb(dev);
> +	handled = flexcan_do_mb(dev, &priv->mb_irq[0]);
>  	handled |= flexcan_do_state(dev);
>  	handled |= flexcan_do_berr(dev);
>  
> @@ -1243,9 +1247,15 @@ static irqreturn_t flexcan_irq_mb(int irq, void *dev_id)
>  {
>  	struct net_device *dev = dev_id;
>  	struct flexcan_priv *priv = netdev_priv(dev);
> +	const struct flexcan_mb_irq *mb_irq;
>  	irqreturn_t handled;
> +	int idx;
>  
> -	handled = flexcan_do_mb(dev);
> +	idx = (priv->devtype_data.quirks & FLEXCAN_QUIRK_SECONDARY_MB_IRQ &&
> +	       irq == priv->irq_secondary_mb) ? 1 : 0;
> +	mb_irq = &priv->mb_irq[idx];
> +
> +	handled = flexcan_do_mb(dev, mb_irq);
>  
>  	if (handled)
>  		can_rx_offload_irq_finish(&priv->offload);
> @@ -1473,6 +1483,7 @@ static void flexcan_ram_init(struct net_device *dev)
>  static int flexcan_rx_offload_setup(struct net_device *dev)
>  {
>  	struct flexcan_priv *priv = netdev_priv(dev);
> +	u64 rx_mask, tx_mask;
>  	int err;
>  
>  	if (priv->can.ctrlmode & CAN_CTRLMODE_FD)
> @@ -1494,20 +1505,35 @@ static int flexcan_rx_offload_setup(struct net_device *dev)
>  			flexcan_get_mb(priv, FLEXCAN_TX_MB_RESERVED_RX_FIFO);
>  	priv->tx_mb_idx = priv->mb_count - 1;
>  	priv->tx_mb = flexcan_get_mb(priv, priv->tx_mb_idx);
> -	priv->tx_mask = FLEXCAN_IFLAG_MB(priv->tx_mb_idx);
> -
>  	priv->offload.mailbox_read = flexcan_mailbox_read;
>  
>  	if (priv->devtype_data.quirks & FLEXCAN_QUIRK_USE_RX_MAILBOX) {
>  		priv->offload.mb_first = FLEXCAN_RX_MB_RX_MAILBOX_FIRST;
>  		priv->offload.mb_last = priv->mb_count - 2;
>  
> -		priv->rx_mask = GENMASK_ULL(priv->offload.mb_last,
> -					    priv->offload.mb_first);
> +		rx_mask = GENMASK_ULL(priv->offload.mb_last,
> +				      priv->offload.mb_first);
> +		tx_mask = FLEXCAN_IFLAG_MB(priv->tx_mb_idx);
> +
> +		if (priv->devtype_data.quirks & FLEXCAN_QUIRK_SECONDARY_MB_IRQ) {
> +			/* S32G2 has two MB IRQ lines with the split at MB 8:
> +			 * mb-0 IRQ handles MBs 0-7,
> +			 * mb-1 IRQ handles MBs 8-127.
                                                  ^^^
Your comment says 8-127 but the code uses GENMASK_ULL(63, 8). Is this
intentional?

> +			 */
> +			priv->mb_irq[0].rx_mask = rx_mask & GENMASK_ULL(7, 0);
> +			priv->mb_irq[0].tx_mask = tx_mask & GENMASK_ULL(7, 0);
> +			priv->mb_irq[1].rx_mask = rx_mask & GENMASK_ULL(63, 8);
> +			priv->mb_irq[1].tx_mask = tx_mask & GENMASK_ULL(63, 8);
> +		} else {
> +			priv->mb_irq[0].rx_mask = rx_mask;
> +			priv->mb_irq[0].tx_mask = tx_mask;
> +		}
> +

The introduction of the struct flexcan_mb_irq seems a bit overkill.
Can't you just define two new masks and keep the existing struct
flexcan_stop_mode untouched:

	#define FLEXCAN_SECONDARY_MB_IRQ_MB0_MASK GENMASK_U64(7, 0)
	#define FLEXCAN_SECONDARY_MB_IRQ_MB1_MASK GENMASK_U64(63, 8)

and when you need to access the MB, just select the correct mask. For
example, flexcan_irq_mb() becomes something like this:

	u64 mb_mask;

	if (priv->devtype_data.quirks & FLEXCAN_QUIRK_SECONDARY_MB_IRQ
	    && irq == priv->irq_secondary_mb)
		mb_mask = FLEXCAN_SECONDARY_MB_IRQ_MB0_MASK;
	else
		mb_mask = FLEXCAN_SECONDARY_MB_IRQ_MB1_MASK;

	handled = flexcan_do_mb(dev, mb_mask);

>  		err = can_rx_offload_add_timestamp(dev, &priv->offload);
>  	} else {
> -		priv->rx_mask = FLEXCAN_IFLAG_RX_FIFO_OVERFLOW |
> +		priv->mb_irq[0].rx_mask = FLEXCAN_IFLAG_RX_FIFO_OVERFLOW |
>  			FLEXCAN_IFLAG_RX_FIFO_AVAILABLE;
> +		priv->mb_irq[0].tx_mask = FLEXCAN_IFLAG_MB(priv->tx_mb_idx);
>  		err = can_rx_offload_add_fifo(dev, &priv->offload,
>  					      FLEXCAN_NAPI_WEIGHT);
>  	}
> @@ -1531,7 +1557,8 @@ static void flexcan_chip_interrupts_enable(const struct net_device *dev)
>  		disable_irq(priv->irq_secondary_mb);
>  
>  	priv->write(priv->reg_ctrl_default, &regs->ctrl);
> -	reg_imask = priv->rx_mask | priv->tx_mask;
> +	reg_imask = priv->mb_irq[0].rx_mask | priv->mb_irq[0].tx_mask |
> +		    priv->mb_irq[1].rx_mask | priv->mb_irq[1].tx_mask;
>  	priv->write(upper_32_bits(reg_imask), &regs->imask2);
>  	priv->write(lower_32_bits(reg_imask), &regs->imask1);
>  	enable_irq(dev->irq);
> diff --git a/drivers/net/can/flexcan/flexcan.h b/drivers/net/can/flexcan/flexcan.h
> index 16692a2502eb..22aa097ec3c0 100644
> --- a/drivers/net/can/flexcan/flexcan.h
> +++ b/drivers/net/can/flexcan/flexcan.h
> @@ -75,10 +75,17 @@
>   */
>  #define FLEXCAN_QUIRK_SECONDARY_MB_IRQ	BIT(18)
>  
> +#define FLEXCAN_NR_MB_IRQS	2
> +
>  struct flexcan_devtype_data {
>  	u32 quirks;		/* quirks needed for different IP cores */
>  };
>  
> +struct flexcan_mb_irq {
> +	u64 rx_mask;
> +	u64 tx_mask;
> +};
> +
>  struct flexcan_stop_mode {
>  	struct regmap *gpr;
>  	u8 req_gpr;
> @@ -99,8 +106,7 @@ struct flexcan_priv {
>  	u8 clk_src;	/* clock source of CAN Protocol Engine */
>  	u8 scu_idx;
>  
> -	u64 rx_mask;
> -	u64 tx_mask;
> +	struct flexcan_mb_irq mb_irq[FLEXCAN_NR_MB_IRQS];
>  	u32 reg_ctrl_default;
>  
>  	struct clk *clk_ipg;


Yours sincerely,
Vincent Mailhol


