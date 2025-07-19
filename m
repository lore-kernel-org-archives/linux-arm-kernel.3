Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07DD2C83F3B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 01:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PzgPv34t85hMUxw/v1ooqyt+79boC5oeohNDYV7KXy8=; b=vHJwwTHo/uHA/C+j8Ru6vmq2W9
	YUXE9IGVp7hoFBt4vRyxcot0HW+wIOXsVXkMOsfS+L5gyywZwzojSn6FFNXpjrgHxYJQAjwOPpJqW
	ubE9CBe3t825LGEVQkWJx12EhNH8U63GWcElKhwM6uoBA5ToYMZQOYb2mUEBatuPnRr1Ea9ZRqFlm
	Yc6ekihxRNjMG09rcfScTTd4C5IAaWmsBOIQ1YAF/z7BFVMZtI/B1qT++NgcOjUuizpOs7BzOXBqB
	INC0lagb2E3TsK7EY6U85DMclk1W+0HfwnI0tz/UsmlMLV/d3x1zsuxVQLZfC0HZ+VIIw2K96mhIM
	XDEEjfmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucwPx-0000000Dhov-3tnK;
	Sat, 19 Jul 2025 01:31:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucwNY-0000000Dhiu-2H5B
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 01:28:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D37B4601BB;
	Sat, 19 Jul 2025 01:28:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7E19C4CEEB;
	Sat, 19 Jul 2025 01:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752888521;
	bh=Xgk+Vyd7x+6zQrEAnXg5atZzEmalN4PkM8Ip/CYxqwQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lfPZkFoA3Z24WBBd9MMRnhKZMdp5gnVosdYE8Q/i9PYWIAZzRroRFMzV8QnwfDvt4
	 kz+/Jv8t7a2RGS2sWVjDCYSqG47HmNk6ye1KTrG5zhMf9Ns8LsdwbvDkHU/lW0WM57
	 ATL1F175Bz0rUtgcrTp65YYpio0cbeoRyAO4bv5i88hiGDLdj6D03jGgsyR4L5+/DS
	 kUz8MkJ2autaMOIDVk1fMopa3pRG1uEEUigHlDcnvJioMxW6vhhLTCWYVXyHV5pcWA
	 HURmrr9AXzwN6pqvM/E+SS11bhWPDrvd+ybRm5wGr4PDF/XZUBnCbKGrS8dQUACnRO
	 Va2gPWTaJ+UxA==
Date: Fri, 18 Jul 2025 18:28:40 -0700
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
Subject: Re: [net-next v15 06/12] net: mtip: Add net_device_ops functions to
 the L2 switch driver
Message-ID: <20250718182840.7ab7e202@kernel.org>
In-Reply-To: <20250716214731.3384273-7-lukma@denx.de>
References: <20250716214731.3384273-1-lukma@denx.de>
	<20250716214731.3384273-7-lukma@denx.de>
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

On Wed, 16 Jul 2025 23:47:25 +0200 Lukasz Majewski wrote:
> +static netdev_tx_t mtip_start_xmit_port(struct sk_buff *skb,
> +					struct net_device *dev, int port)
> +{
> +	struct mtip_ndev_priv *priv = netdev_priv(dev);
> +	struct switch_enet_private *fep = priv->fep;
> +	unsigned short status;
> +	struct cbd_t *bdp;
> +	void *bufaddr;
> +
> +	spin_lock(&fep->hw_lock);

I see some inconsistencies in how you take this lock.
Bunch of bare spin_lock() calls from BH context, but there's also
a _irqsave() call in mtip_adjust_link(). Please align to the strictest
context (not sure if the irqsave is actually needed, at a glance, IOW
whether the lock is taken from an IRQ)

> +	if (!fep->link[0] && !fep->link[1]) {
> +		/* Link is down or autonegotiation is in progress. */
> +		netif_stop_queue(dev);
> +		spin_unlock(&fep->hw_lock);
> +		return NETDEV_TX_BUSY;
> +	}
> +
> +	/* Fill in a Tx ring entry */
> +	bdp = fep->cur_tx;
> +
> +	/* Force read memory barier on the current transmit description */

Barrier are between things. What is this barrier separating, and what
write barrier does it pair with? As far as I can tell cur_tx is just
a value in memory, and accesses are under ->hw_lock, so there should
be no ordering concerns.

> +	rmb();
> +	status = bdp->cbd_sc;
> +
> +	if (status & BD_ENET_TX_READY) {
> +		/* All transmit buffers are full. Bail out.
> +		 * This should not happen, since dev->tbusy should be set.
> +		 */
> +		netif_stop_queue(dev);
> +		dev_err(&fep->pdev->dev, "%s: tx queue full!.\n", dev->name);

This needs to be rate limited, we don't want to flood the logs in case
there's a bug.

Also at a glance it seems like you have one fep for multiple netdevs.
So stopping one netdev's Tx queue when fep fills up will not stop the
other ports from pushing frames, right?

> +		spin_unlock(&fep->hw_lock);
> +		return NETDEV_TX_BUSY;
> +	}
> +
> +	/* Clear all of the status flags */
> +	status &= ~BD_ENET_TX_STATS;
> +
> +	/* Set buffer length and buffer pointer */
> +	bufaddr = skb->data;
> +	bdp->cbd_datlen = skb->len;
> +
> +	/* On some FEC implementations data must be aligned on
> +	 * 4-byte boundaries. Use bounce buffers to copy data
> +	 * and get it aligned.spin
> +	 */
> +	if ((unsigned long)bufaddr & MTIP_ALIGNMENT) {

I think you should add 

	if ... ||
           fep->quirks & FEC_QUIRK_SWAP_FRAME)

here. You can't modify skb->data without calling skb_cow_data()
but you already have buffers allocated so can as well use them.

> +		unsigned int index;
> +
> +		index = bdp - fep->tx_bd_base;
> +		memcpy(fep->tx_bounce[index],
> +		       (void *)skb->data, skb->len);

this fits on one 80 char line BTW, quite easily:

		memcpy(fep->tx_bounce[index], (void *)skb->data, skb->len);

Also the cast to void * is not necessary in C.

> +		bufaddr = fep->tx_bounce[index];
> +	}
> +
> +	if (fep->quirks & FEC_QUIRK_SWAP_FRAME)
> +		swap_buffer(bufaddr, skb->len);
> +
> +	/* Save skb pointer. */
> +	fep->tx_skbuff[fep->skb_cur] = skb;
> +
> +	fep->skb_cur = (fep->skb_cur + 1) & TX_RING_MOD_MASK;

Not sure if this is buggy, but maybe delay updating things until the
mapping succeeds? Fewer things to unwind.

> +	/* Push the data cache so the CPM does not get stale memory
> +	 * data.
> +	 */
> +	bdp->cbd_bufaddr = dma_map_single(&fep->pdev->dev, bufaddr,
> +					  MTIP_SWITCH_TX_FRSIZE,
> +					  DMA_TO_DEVICE);
> +	if (unlikely(dma_mapping_error(&fep->pdev->dev, bdp->cbd_bufaddr))) {
> +		dev_err(&fep->pdev->dev,
> +			"Failed to map descriptor tx buffer\n");
> +		dev->stats.tx_errors++;
> +		dev->stats.tx_dropped++;

dropped and errors are two different counters
I'd stick to dropped

> +		dev_kfree_skb_any(skb);
> +		goto err;
> +	}
> +
> +	/* Send it on its way.  Tell FEC it's ready, interrupt when done,
> +	 * it's the last BD of the frame, and to put the CRC on the end.
> +	 */
> +
> +	status |= (BD_ENET_TX_READY | BD_ENET_TX_INTR
> +			| BD_ENET_TX_LAST | BD_ENET_TX_TC);

The | goes at the end of the previous line, start of new line adjusts 
to the opening brackets..

> +
> +	/* Synchronize all descriptor writes */
> +	wmb();
> +	bdp->cbd_sc = status;
> +
> +	netif_trans_update(dev);

Is this call necessary?

> +	skb_tx_timestamp(skb);
> +
> +	/* Trigger transmission start */
> +	writel(MCF_ESW_TDAR_X_DES_ACTIVE, fep->hwp + ESW_TDAR);
> +
> +	dev->stats.tx_bytes += skb->len;
> +	/* If this was the last BD in the ring,
> +	 * start at the beginning again.
> +	 */
> +	if (status & BD_ENET_TX_WRAP)
> +		bdp = fep->tx_bd_base;
> +	else
> +		bdp++;
> +
> +	if (bdp == fep->dirty_tx) {
> +		fep->tx_full = 1;
> +		netif_stop_queue(dev);
> +	}
> +
> +	fep->cur_tx = bdp;
> + err:
> +	spin_unlock(&fep->hw_lock);
> +
> +	return NETDEV_TX_OK;
> +}

