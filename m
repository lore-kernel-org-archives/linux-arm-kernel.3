Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB26CD8CAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 19:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QMeBqfIANjuB2z0BodQbfcwU2KdM59UZ/QBGLC1c+2k=; b=kQPM5h9JmWtuVjbqZjOl6vWKuX
	s7StW2GrYmEW11Iyv7WDNhR/ouCudsGybttHdACjLLaByAxRl0pwGxYE/383wAh9LUuDMb16Wtb2Z
	O/VrqeMUeQ/d+Oo09tcT59aKzRUOsRqV32IBrdjLv9oyY8YwKEIlcJypvejHq+FBRFpU7bDclKUCI
	yz/ClqyZ4CB3a1tSEW7lBPG+bA0coMjFQ91hVW6+l1NxMeAZj6TyHje0eEeSFUbbjbxTzglumr7wM
	nYhKfSH2ZQgbggLm6UF3NboDXUnwMzE49UzP83TEOUX/UIM/uz9SlXt9PaoOxtDun6Faive62KkiF
	4xpjOICA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX2To-00000006JiI-3lWX;
	Tue, 09 Jun 2026 19:51:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX2Tn-00000006JiA-47dV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 19:51:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 07D246024D;
	Tue,  9 Jun 2026 19:51:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C22091F00893;
	Tue,  9 Jun 2026 19:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781034678;
	bh=QMeBqfIANjuB2z0BodQbfcwU2KdM59UZ/QBGLC1c+2k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=dziBB5dHsa7EnBkYvZDTTxHglDhPLrVZO5+5Ty/q/KUfuf/21PM2gnqk5xIzBahWF
	 AuRqNBEiYUEO3IhT9ELTw07O66FMMRYXMvm0QyJQLmfNuyCHKDnpHj3QZO4TtPeB+0
	 i4og588mJkrYb/mqVF9EZoHg2E+e+x6f+twDCqi+8KVVjCanGfmI7epCqf0AiR7yAt
	 t/A3BWzKnUDpgdSPP4Ir3rziUxvasVpFbTrX+GMcchlxxXOU4Ln0t5WYs7PMfG0IFl
	 S6YpNpk3xeGIhCQ0dtw4ikZuCkeL2vYsbD/gUnwRvGiqFbPJCHdI5YRC8z1jh+zi46
	 end+eultxPHqA==
Message-ID: <132bb73c-b98d-41aa-a8bb-0f93abbd408b@kernel.org>
Date: Tue, 9 Jun 2026 21:51:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/8] can: flexcan: add FLEXCAN_QUIRK_IRQ_BERR quirk
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
 Larisa Grigore <larisa.grigore@nxp.com>, Haibo Chen <haibo.chen@nxp.com>
References: <20260609142954.1807421-1-ciprianmarian.costea@oss.nxp.com>
 <20260609142954.1807421-6-ciprianmarian.costea@oss.nxp.com>
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
In-Reply-To: <20260609142954.1807421-6-ciprianmarian.costea@oss.nxp.com>
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
> Introduce FLEXCAN_QUIRK_IRQ_BERR quirk to handle hardware integration
> where the FlexCAN module has a dedicated interrupt line for signaling
> bus errors and device state changes.
> 
> This adds the flexcan_irq_esr() handler which composes
> flexcan_do_state() and flexcan_do_berr() to handle platforms where
> these events share a single IRQ line.
> 
> Also extend flexcan_chip_interrupts_enable() to disable/enable the
> new IRQ line during IMASK register writes.
> 
> This is required for NXP S32N79 SoC support.
> 
> Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> Reviewed-and-tested-by: Haibo Chen <haibo.chen@nxp.com>
> Tested-by: Enric Balletbo i Serra <eballetb@redhat.com>

Reviewed-by: Vincent Mailhol <mailhol@kernel.org>

> ---
>  drivers/net/can/flexcan/flexcan-core.c | 54 +++++++++++++++++++++-----
>  drivers/net/can/flexcan/flexcan.h      |  2 +
>  2 files changed, 47 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/can/flexcan/flexcan-core.c b/drivers/net/can/flexcan/flexcan-core.c
> index 0ed838f0719a..adf3af57fb0a 100644
> --- a/drivers/net/can/flexcan/flexcan-core.c
> +++ b/drivers/net/can/flexcan/flexcan-core.c
> @@ -1300,6 +1300,22 @@ static irqreturn_t flexcan_irq_boff(int irq, void *dev_id)
>  	return handled;
>  }
>  
> +/* Combined bus error and state change IRQ handler */
> +static irqreturn_t flexcan_irq_esr(int irq, void *dev_id)
> +{
> +	struct net_device *dev = dev_id;
> +	struct flexcan_priv *priv = netdev_priv(dev);
> +	irqreturn_t handled;
> +
> +	handled = flexcan_do_state(dev);
> +	handled |= flexcan_do_berr(dev);
> +
> +	if (handled)
> +		can_rx_offload_irq_finish(&priv->offload);
> +
> +	return handled;
> +}
> +
>  static void flexcan_set_bittiming_ctrl(const struct net_device *dev)
>  {
>  	const struct flexcan_priv *priv = netdev_priv(dev);
> @@ -1540,10 +1556,10 @@ static void flexcan_chip_interrupts_enable(const struct net_device *dev)
>  	u64 reg_imask;
>  
>  	disable_irq(dev->irq);
> -	if (quirks & FLEXCAN_QUIRK_NR_IRQ_3) {
> +	if (quirks & FLEXCAN_QUIRK_NR_IRQ_3)
>  		disable_irq(priv->irq_boff);
> +	if (quirks & (FLEXCAN_QUIRK_NR_IRQ_3 | FLEXCAN_QUIRK_IRQ_BERR))
>  		disable_irq(priv->irq_err);
> -	}
>  	if (quirks & FLEXCAN_QUIRK_SECONDARY_MB_IRQ)
>  		disable_irq(priv->irq_secondary_mb);
>  
> @@ -1554,10 +1570,10 @@ static void flexcan_chip_interrupts_enable(const struct net_device *dev)
>  	enable_irq(dev->irq);
>  	if (quirks & FLEXCAN_QUIRK_SECONDARY_MB_IRQ)
>  		enable_irq(priv->irq_secondary_mb);
> -	if (quirks & FLEXCAN_QUIRK_NR_IRQ_3) {
> -		enable_irq(priv->irq_boff);
> +	if (quirks & (FLEXCAN_QUIRK_NR_IRQ_3 | FLEXCAN_QUIRK_IRQ_BERR))
>  		enable_irq(priv->irq_err);
> -	}
> +	if (quirks & FLEXCAN_QUIRK_NR_IRQ_3)
> +		enable_irq(priv->irq_boff);
>  }
>  
>  static void flexcan_chip_interrupts_disable(const struct net_device *dev)
> @@ -1881,7 +1897,8 @@ static int flexcan_open(struct net_device *dev)
>  
>  	can_rx_offload_enable(&priv->offload);
>  
> -	if (priv->devtype_data.quirks & FLEXCAN_QUIRK_NR_IRQ_3)
> +	if (priv->devtype_data.quirks &
> +			(FLEXCAN_QUIRK_NR_IRQ_3 | FLEXCAN_QUIRK_IRQ_BERR))
>  		err = request_irq(dev->irq, flexcan_irq_mb,
>  				  IRQF_SHARED, dev->name, dev);
>  	else
> @@ -1902,6 +1919,13 @@ static int flexcan_open(struct net_device *dev)
>  			goto out_free_irq_boff;
>  	}
>  
> +	if (priv->devtype_data.quirks & FLEXCAN_QUIRK_IRQ_BERR) {
> +		err = request_irq(priv->irq_err,
> +				  flexcan_irq_esr, IRQF_SHARED, dev->name, dev);
> +		if (err)
> +			goto out_free_irq_boff;
> +	}
> +
>  	if (priv->devtype_data.quirks & FLEXCAN_QUIRK_SECONDARY_MB_IRQ) {
>  		err = request_irq(priv->irq_secondary_mb,
>  				  flexcan_irq_mb, IRQF_SHARED, dev->name, dev);
> @@ -1916,7 +1940,8 @@ static int flexcan_open(struct net_device *dev)
>  	return 0;
>  
>   out_free_irq_err:
> -	if (priv->devtype_data.quirks & FLEXCAN_QUIRK_NR_IRQ_3)
> +	if (priv->devtype_data.quirks &
> +			(FLEXCAN_QUIRK_IRQ_BERR | FLEXCAN_QUIRK_NR_IRQ_3))
>  		free_irq(priv->irq_err, dev);
>   out_free_irq_boff:
>  	if (priv->devtype_data.quirks & FLEXCAN_QUIRK_NR_IRQ_3)
> @@ -1948,10 +1973,12 @@ static int flexcan_close(struct net_device *dev)
>  	if (priv->devtype_data.quirks & FLEXCAN_QUIRK_SECONDARY_MB_IRQ)
>  		free_irq(priv->irq_secondary_mb, dev);
>  
> -	if (priv->devtype_data.quirks & FLEXCAN_QUIRK_NR_IRQ_3) {
> +	if (priv->devtype_data.quirks &
> +			(FLEXCAN_QUIRK_IRQ_BERR | FLEXCAN_QUIRK_NR_IRQ_3))
>  		free_irq(priv->irq_err, dev);
> +
> +	if (priv->devtype_data.quirks & FLEXCAN_QUIRK_NR_IRQ_3)
>  		free_irq(priv->irq_boff, dev);
> -	}
>  
>  	free_irq(dev->irq, dev);
>  	can_rx_offload_disable(&priv->offload);
> @@ -2338,12 +2365,21 @@ static int flexcan_probe(struct platform_device *pdev)
>  	if (transceiver)
>  		priv->can.bitrate_max = transceiver->attrs.max_link_rate;
>  
> +	if (priv->devtype_data.quirks & FLEXCAN_QUIRK_IRQ_BERR) {
> +		priv->irq_err = platform_get_irq_byname(pdev, "berr");
> +		if (priv->irq_err < 0) {
> +			err = priv->irq_err;
> +			goto failed_platform_get_irq;
> +		}
> +	}
> +
>  	if (priv->devtype_data.quirks & FLEXCAN_QUIRK_NR_IRQ_3) {
>  		priv->irq_boff = platform_get_irq(pdev, 1);
>  		if (priv->irq_boff < 0) {
>  			err = priv->irq_boff;
>  			goto failed_platform_get_irq;
>  		}
> +

Nitpick: you shouldn't have unrelated changes, like this newline
addition, in you patches.

@Marc, do you mind removing this while applying?

>  		priv->irq_err = platform_get_irq(pdev, 2);
>  		if (priv->irq_err < 0) {
>  			err = priv->irq_err;
> diff --git a/drivers/net/can/flexcan/flexcan.h b/drivers/net/can/flexcan/flexcan.h
> index 16692a2502eb..bbb1a8dd4777 100644
> --- a/drivers/net/can/flexcan/flexcan.h
> +++ b/drivers/net/can/flexcan/flexcan.h
> @@ -74,6 +74,8 @@
>   * both need to have an interrupt handler registered.
>   */
>  #define FLEXCAN_QUIRK_SECONDARY_MB_IRQ	BIT(18)
> +/* Setup dedicated bus error and state change IRQ */
> +#define FLEXCAN_QUIRK_IRQ_BERR	BIT(19)
>  
>  struct flexcan_devtype_data {
>  	u32 quirks;		/* quirks needed for different IP cores */


Yours sincerely,
Vincent Mailhol


