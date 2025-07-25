Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D525CC87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 16:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e9r+gNZY6sc4+Uq5fr76de8nyc+i5y+sUCWy1ZudE2Q=; b=dGI1fF9lY/Uey+h1zUEWPC3UN8
	4AInVe78Zd5+O3zqPvG5xtXAM9ILCnrSqguX9S/+523vuOq4wBcdX1ZlkL0aolotX7fh+fJLIu95u
	oC3wS2300pO/uNc8Y+uSJ8299WUqGLi2nx5eoEt0QU5SBbvWJKLs4sOzwVt2LVWc5LheeIC5fQRNT
	KtSRI+wF9KEJ+SsNs3Y0wbv10pZUlsEc1Abjjj/qsHsb9mgnGMWTuDIboQTwSI5cZiCtrvLKEjzTd
	ibK9X7EBPT39INO4Gnt+vQCVc7O7eNIvAUbZnCMqwC7svMnMT3jkouhIKZ7ZWF3io1ScX/C5LHzch
	4Ger2HIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufL7B-0000000ACIY-43Gi;
	Fri, 25 Jul 2025 16:17:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufKkx-0000000A9jf-2R2e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 15:54:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AC01960052;
	Fri, 25 Jul 2025 15:54:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0F67C4CEEB;
	Fri, 25 Jul 2025 15:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753458886;
	bh=xG/OsJ4RBMjiH7Ek0IeepUFOX5x1inIciVmtdhWccpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uBaWn3/Q51Wwky6sepxHfcP+qTHXyvswkD8viZdlu3x9xc8bywF1CfxoOxSRV6qEE
	 YjXpGOJXm2SVFwtl8YsoHc3nx1xJUJwE2J34Conodh7TE1Tnm2lFZUwaXn3xxAR4pk
	 tkdIE39he7V3H2rqUPH+QVD5FI9DHI/D2WU2dIhsfvlHfevegQjDPcZvhD+xjEcw6u
	 GbUgL5yNruK5/YD3GIr8V8HeGIaypxFfXpmlPxG6xmwI9WzHbPHeCFliDKLrN3nT/1
	 BAWcQ94lGL16YzqpfHBpMXBrWobaGyAZ6vhVS9gddpDMYEIhzbPjO7RF/ohL8SmIKM
	 vQuomxcJbmVRg==
Date: Fri, 25 Jul 2025 16:54:40 +0100
From: Simon Horman <horms@kernel.org>
To: Lukasz Majewski <lukma@denx.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [net-next v16 06/12] net: mtip: Add net_device_ops functions to
 the L2 switch driver
Message-ID: <20250725155440.GF1367887@horms.kernel.org>
References: <20250724223318.3068984-1-lukma@denx.de>
 <20250724223318.3068984-7-lukma@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724223318.3068984-7-lukma@denx.de>
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

On Fri, Jul 25, 2025 at 12:33:12AM +0200, Lukasz Majewski wrote:
> This patch provides callbacks for struct net_device_ops for MTIP
> L2 switch.
> 
> Signed-off-by: Lukasz Majewski <lukma@denx.de>

...

> +static netdev_tx_t mtip_start_xmit_port(struct sk_buff *skb,
> +					struct net_device *dev, int port)
> +{
> +	struct mtip_ndev_priv *priv = netdev_priv(dev);
> +	struct switch_enet_private *fep = priv->fep;
> +	unsigned short status;
> +	struct cbd_t *bdp;
> +	void *bufaddr;
> +
> +	spin_lock_bh(&fep->hw_lock);
> +
> +	if (!fep->link[0] && !fep->link[1]) {
> +		/* Link is down or autonegotiation is in progress. */
> +		netif_stop_queue(dev);
> +		spin_unlock_bh(&fep->hw_lock);
> +		return NETDEV_TX_BUSY;
> +	}
> +
> +	/* Fill in a Tx ring entry */
> +	bdp = fep->cur_tx;
> +	status = bdp->cbd_sc;
> +
> +	if (status & BD_ENET_TX_READY) {
> +		/* All transmit buffers are full. Bail out.
> +		 * This should not happen, since dev->tbusy should be set.
> +		 */
> +		netif_stop_queue(dev);
> +		dev_err_ratelimited(&fep->pdev->dev, "%s: tx queue full!.\n",
> +				    dev->name);
> +		spin_unlock(&fep->hw_lock);

Sorry be the one to point out this needle in a haystack,
but this should be spin_unlock_bh()

Flagged by Smatch.

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
> +		unsigned int index;
> +
> +		index = bdp - fep->tx_bd_base;
> +		memcpy(fep->tx_bounce[index], skb->data, skb->len);
> +		bufaddr = fep->tx_bounce[index];
> +	}
> +
> +	if (fep->quirks & FEC_QUIRK_SWAP_FRAME)
> +		swap_buffer(bufaddr, skb->len);
> +
> +	/* Push the data cache so the CPM does not get stale memory
> +	 * data.
> +	 */
> +	bdp->cbd_bufaddr = dma_map_single(&fep->pdev->dev, bufaddr,
> +					  MTIP_SWITCH_TX_FRSIZE,
> +					  DMA_TO_DEVICE);
> +	if (unlikely(dma_mapping_error(&fep->pdev->dev, bdp->cbd_bufaddr))) {
> +		dev_err(&fep->pdev->dev,
> +			"Failed to map descriptor tx buffer\n");
> +		dev->stats.tx_dropped++;
> +		dev_kfree_skb_any(skb);
> +		goto err;
> +	}
> +
> +	/* Save skb pointer. */
> +	fep->tx_skbuff[fep->skb_cur] = skb;
> +	fep->skb_cur = (fep->skb_cur + 1) & TX_RING_MOD_MASK;
> +
> +	/* Send it on its way.  Tell FEC it's ready, interrupt when done,
> +	 * it's the last BD of the frame, and to put the CRC on the end.
> +	 */
> +
> +	status |= (BD_ENET_TX_READY | BD_ENET_TX_INTR | BD_ENET_TX_LAST |
> +		   BD_ENET_TX_TC);
> +
> +	/* Synchronize all descriptor writes */
> +	wmb();
> +	bdp->cbd_sc = status;
> +
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
> +	spin_unlock_bh(&fep->hw_lock);
> +
> +	return NETDEV_TX_OK;
> +}

...

