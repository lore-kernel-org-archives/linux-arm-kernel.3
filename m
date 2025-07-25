Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC89C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 22:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b8LYG7wuRmzGq43gcL749unONqJry/qLbYupfxmkoic=; b=zkKckq8qrOpg1Tf2e030GO32mr
	01FWLcp10D1VdBeM0Xf5fMMwFZghNYAufgpwDIdsvVpH9/CwOGZK6IGl2GFW46b+00yw/SrTxiAit
	Zf93M8fGBfhTLZ7+z1wVWulf3dADNa2wWJ37fiB0whubwrxfOtlVj9WTog79R/z7LLIzDakqfp9E7
	G4KK7+ogHt+s7FTwOlpjSV6EcjiICzhyIVVrMMvHxvkX+YJBXp4pocVP3+ozPq6WeKekleUI15JeA
	KhO8P4QaG5t/DayYUPSl1ERuXGUnvUMW/oqZNhBD0bdYZbWyoOHZ97UIP9aRs1kEwhZKORuVJ/FeY
	Te+BEdwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufQkf-0000000AmRu-1xpB;
	Fri, 25 Jul 2025 22:18:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufQiD-0000000Am3p-1mzp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 22:16:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8EF72601F2;
	Fri, 25 Jul 2025 22:16:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C206C4CEEF;
	Fri, 25 Jul 2025 22:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753481780;
	bh=zcCljp+/O3021EXF1kCLQYobxVhkF/h2q9zxHMYLlrk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YZKOhAYkjdfG8UL5HyJCFIY5sTjEDtSgODpdhnxJHWSijrZUGlWcW8bnm9QR/3Bo8
	 MOu7XWmbuz2fW/3mr6s58b1HlBXH/j3Dr5hwwJe7jRQAKLeIpVdfloTiX1kPjPj6LX
	 RXfHwUTSK6J1UNfxEMAd7zMN50FiHYgDcMkEZmHuCQbFPIvUcS+hmvAxhDVis2PI6F
	 IMFQ4cGUHzYx3+9Zwm2s7jH6YxyUqcaj+M9S7iriu1EofrRPo3E4488GIgFXE8D07a
	 WuoDsvFFqj3rxBASIDmQ3E79npvARYh4fHJ9XG+9hMQzqx2MIGGsHOXsBeIZ88Qw00
	 meD+hksXofvbw==
Date: Fri, 25 Jul 2025 15:16:18 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lukasz Majewski <lukma@denx.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Richard Cochran
 <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Stefan Wahren
 <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>
Subject: Re: [net-next v16 06/12] net: mtip: Add net_device_ops functions to
 the L2 switch driver
Message-ID: <20250725151618.0bc84bdb@kernel.org>
In-Reply-To: <20250724223318.3068984-7-lukma@denx.de>
References: <20250724223318.3068984-1-lukma@denx.de>
	<20250724223318.3068984-7-lukma@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Fri, 25 Jul 2025 00:33:12 +0200 Lukasz Majewski wrote:
> +static void swap_buffer(void *bufaddr, int len)
> +{
> +	int i;
> +	unsigned int *buf = bufaddr;
> +

nit: reverse xmas tree

> +	if (status & BD_ENET_TX_READY) {
> +		/* All transmit buffers are full. Bail out.
> +		 * This should not happen, since dev->tbusy should be set.
> +		 */
> +		netif_stop_queue(dev);
> +		dev_err_ratelimited(&fep->pdev->dev, "%s: tx queue full!.\n",
> +				    dev->name);
> +		spin_unlock(&fep->hw_lock);

As we discussed on previous revision you have many to one mapping
of netdevs to queues. I think the warning should only be printed
if the drivers is in "single netdev" mode. Otherwise it _will_
trigger.

BTW you should put the print after the unlock, console writes are slow.

> +static void mtip_timeout(struct net_device *dev, unsigned int txqueue)
> +{
> +	struct mtip_ndev_priv *priv = netdev_priv(dev);
> +	struct switch_enet_private *fep = priv->fep;
> +	struct cbd_t *bdp;
> +	int i;
> +
> +	dev->stats.tx_errors++;
> +
> +	if (IS_ENABLED(CONFIG_SWITCH_DEBUG)) {

why are you hiding the debug info under a CONFIG_ ? 
(which BTW appears not to be defined at all)
Seems useful to know the state of the HW when the queue hung.
You can use a DO_ONCE() if you want to avoid spamming logs

> +	/* Set buffer length and buffer pointer */
> +	bufaddr = skb->data;

You should call skb_cow_data() if you want to write to the skb data.

> +static void mtip_timeout(struct net_device *dev, unsigned int txqueue)
> +{
> +	struct mtip_ndev_priv *priv = netdev_priv(dev);
> +	struct switch_enet_private *fep = priv->fep;
> +	struct cbd_t *bdp;
> +	int i;
> +
> +	dev->stats.tx_errors++;

timeouts are already counted by the stack, I think the statistic
is exposed per-queue in sysfs

> +		spin_lock_bh(&fep->hw_lock);
> +		dev_info(&dev->dev, "%s: transmit timed out.\n", dev->name);
> +		dev_info(&dev->dev,
> +			 "Ring data: cur_tx %lx%s, dirty_tx %lx cur_rx: %lx\n",
> +			 (unsigned long)fep->cur_tx,
> +			 fep->tx_full ? " (full)" : "",
> +			 (unsigned long)fep->dirty_tx,
> +			 (unsigned long)fep->cur_rx);
> +
> +		bdp = fep->tx_bd_base;
> +		dev_info(&dev->dev, " tx: %u buffers\n", TX_RING_SIZE);
> +		for (i = 0; i < TX_RING_SIZE; i++) {
> +			dev_info(&dev->dev, "  %08lx: %04x %04x %08x\n",
> +				 (kernel_ulong_t)bdp, bdp->cbd_sc,
> +				 bdp->cbd_datlen, (int)bdp->cbd_bufaddr);
> +			bdp++;
> +		}
> +
> +		bdp = fep->rx_bd_base;
> +		dev_info(&dev->dev, " rx: %lu buffers\n",
> +			 (unsigned long)RX_RING_SIZE);
> +		for (i = 0 ; i < RX_RING_SIZE; i++) {
> +			dev_info(&dev->dev, "  %08lx: %04x %04x %08x\n",
> +				 (kernel_ulong_t)bdp,
> +				 bdp->cbd_sc, bdp->cbd_datlen,
> +				 (int)bdp->cbd_bufaddr);
> +			bdp++;
> +		}
> +		spin_unlock_bh(&fep->hw_lock);

