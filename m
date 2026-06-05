Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 330C5CD6E75
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 02:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FDS6Cjxf+/JaLSZoJgj5+4lXnvtwYjgZb5JthpJtzIg=; b=mK+p/DKCF0N0U89Xintf+GsaAY
	KjsKgrFreM7dhHU0n7IE48PYbaYeEJvAEWb3NWrDhSrmTkL2XIAxWkMbAgEIte67hHWO+MbpiXzre
	07q4I7fQ8RXA4C80Q4+5cj8atB72qMeSR+Br5i7WmlfVAoLf2JEEVzH39l2HlDAvk/wv8Z1TmuZHr
	tav0DTzgX42te9zppAHuOof18mO7y6/i9wOX39zEA9BWYZ7BM1I2cOVsk6owVW3GwG6o2nDEY8OSW
	jVZe9mq0ui72KFmgwUInOgwvD8fIz2tVciG8jMQSj22rx79Xx/p3q0NS7ie1mHSN7jghcxa3kIGf6
	RCPxBs7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVK9G-0000000HZDl-0aKp;
	Fri, 05 Jun 2026 02:19:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVK9D-0000000HZCO-3smp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 02:18:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6CE8743645;
	Fri,  5 Jun 2026 02:18:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABE901F0089A;
	Fri,  5 Jun 2026 02:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780625939;
	bh=FDS6Cjxf+/JaLSZoJgj5+4lXnvtwYjgZb5JthpJtzIg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eSK1dnYs/i4g7x7knYUHW/Wl5/sSyoXtjWuckn2ea6tzYp5zrTDgrTa+9u4hsm/pO
	 pHc5bJP+iGItN/dbiX7ZSBTHPx8/1Hr5dYgw2D9RYKnE4MXEa5KvB/54oYsCHNDLo/
	 srRuaTwHWpV1uDkh/ypS872D0MAU22VP9P5PxEcwbNffgPpMg3eyTKTdhB2YmwEyLc
	 2M9pTrN2mI7bQwOoog6vxYJCZgcDOvxukPYpG7hriBZQFD1PKD2JRemTDq1Y1xsJmI
	 yLkTCTH5WUiR11orLkqg+CAYuKgK43f9El/wcVnnfNcKi4IQ1nZ/16ttbg/6FC5uJs
	 46bwhGgMXMUSg==
From: Jakub Kicinski <kuba@kernel.org>
To: lukasz.majewski@mailbox.org
Cc: Jakub Kicinski <kuba@kernel.org>,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	lgirdwood@gmail.com,
	nathan@kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	krzk+dt@kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	robh@kernel.org
Subject: Re: [net-next v24 5/7] net: mtip: Add mtip_switch_{rx|tx} functions to the L2 switch driver
Date: Thu,  4 Jun 2026 19:18:57 -0700
Message-ID: <20260605021857.3594621-1-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601112437.2216043-6-lukasz.majewski@mailbox.org>
References: <20260601112437.2216043-6-lukasz.majewski@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net: mtip: Add mtip_switch_{rx|tx} functions to the L2 switch driver

This patch fills in the previously stubbed mtip_switch_tx() and
mtip_switch_rx() functions for the MTIP L2 switch driver, adds a small
helper mtip_atable_get_entry_port_number() that looks a MAC up in the
hardware address table, and a mtip_update_cbd() helper used to refill RX
buffer descriptors from the page_pool.

> diff --git a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> index 7dfeda230e3f..212207861e13 100644
> --- a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> +++ b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c

[ ... ]

> @@ -836,11 +873,233 @@ static irqreturn_t mtip_interrupt(int irq, void *ptr_fep)
>  
>  static void mtip_switch_tx(struct switch_enet_private *fep)
>  {
> +	struct net_device *dev;
> +	unsigned short status;
> +	struct sk_buff *skb;
> +	struct cbd_t *bdp;
> +	int index;
> +
> +	spin_lock_bh(&fep->hw_lock);
> +	bdp = fep->dirty_tx;
> +
> +	while (((status = bdp->cbd_sc) & BD_ENET_TX_READY) == 0) {
> +		if (bdp == fep->cur_tx &&
> +		    !mtip_netif_queues_stopped(fep))
> +			break;
> +
> +		index = bdp - fep->tx_bd_base;
> +		dma_unmap_single(&fep->pdev->dev, bdp->cbd_bufaddr,
> +				 MTIP_SWITCH_TX_FRSIZE, DMA_TO_DEVICE);
> +		bdp->cbd_bufaddr = 0;
> +		skb = fep->tx_skbuff[index];
> +		dev = skb->dev;

[High]
Can mtip_switch_tx() race with mtip_adjust_link() and dereference a NULL
skb here?

mtip_adjust_link() runs in process context from phylib's state machine
and calls:

    mtip_netif_stop_queues(fep);
    mtip_switch_restart(...);
    if (mtip_netif_queues_stopped(fep))
            mtip_netif_wake_queues(fep);

mtip_switch_restart() does not appear to take fep->hw_lock, does not
disable NAPI, clears tx_skbuff[i] = NULL and resets cur_tx = dirty_tx
= base, and at the end re-enables RX/TX interrupts via ESW_IMR.

While this is in flight, both per-port queues are XOFF so
mtip_netif_queues_stopped(fep) returns true. A concurrent RX interrupt
on another CPU can schedule NAPI, which calls mtip_switch_tx() with
this state:

    bdp = fep->dirty_tx;             /* == base after restart */
    while ((bdp->cbd_sc & BD_ENET_TX_READY) == 0) {
            if (bdp == fep->cur_tx && !mtip_netif_queues_stopped(fep))
                    break;           /* not taken: queues stopped */
            ...
            skb = fep->tx_skbuff[index];   /* NULL */
            dev = skb->dev;                /* NULL deref */

mtip_switch_restart() does not reset cbd_sc, so cbd_sc & BD_ENET_TX_READY
can still be 0 from prior TX activity, which lets the loop body run.
dma_unmap_single() would also be called with the stale cbd_bufaddr.

The mtip_timeout_work() path wraps the same restart in napi_disable() /
netif_tx_lock_bh(); should the adjust_link path do the same?

> +		/* Check for errors */
> +		if (status & (BD_ENET_TX_HB | BD_ENET_TX_LC |
> +				   BD_ENET_TX_RL | BD_ENET_TX_UN |
> +				   BD_ENET_TX_CSL)) {
> +			dev->stats.tx_errors++;
> +			if (status & BD_ENET_TX_HB)  /* No heartbeat */
> +				dev->stats.tx_heartbeat_errors++;
> +			if (status & BD_ENET_TX_LC)  /* Late collision */
> +				dev->stats.tx_window_errors++;
> +			if (status & BD_ENET_TX_RL)  /* Retrans limit */
> +				dev->stats.tx_aborted_errors++;
> +			if (status & BD_ENET_TX_UN)  /* Underrun */
> +				dev->stats.tx_fifo_errors++;
> +			if (status & BD_ENET_TX_CSL) /* Carrier lost */
> +				dev->stats.tx_carrier_errors++;
> +		} else {
> +			dev->stats.tx_packets++;
> +		}
> +
> +		if (status & BD_ENET_TX_READY)
> +			dev_err_ratelimited(&fep->pdev->dev,
> +					    "xmit interrupt and TX_READY.\n");

[Low]
Can this dev_err_ratelimited() ever fire?

The enclosing loop is:

    while (((status = bdp->cbd_sc) & BD_ENET_TX_READY) == 0) {

status is only assigned in the loop header and is not re-read inside the
body, so by construction status & BD_ENET_TX_READY is always 0 when this
diagnostic is reached. Was the intent to re-read bdp->cbd_sc, or is this
leftover scaffolding that should just be removed?

> +
> +		/* Deferred means some collisions occurred during transmit,
> +		 * but we eventually sent the packet OK.
> +		 */
> +		if (status & BD_ENET_TX_DEF)
> +			dev->stats.collisions++;
> +
> +		/* Free the sk buffer associated with this last transmit */
> +		dev_consume_skb_any(skb);
> +		fep->tx_skbuff[index] = NULL;

[ ... ]

> +	}
> +	fep->dirty_tx = bdp;
> +	spin_unlock_bh(&fep->hw_lock);
>  }
>  
> +static int mtip_update_cbd(struct switch_enet_private *fep, struct cbd_t *bdp,
> +			   int index)
> +{

[ ... ]

> +}
> +

[ ... ]

>  static int mtip_switch_rx(struct net_device *dev, int budget)
>  {
> -	return -ENOMEM;
> +	struct mtip_ndev_priv *priv = netdev_priv(dev);

[Low]
After this patch mtip_switch_rx() only ever returns pkt_received, which
is non-negative; the page_pool allocation failure path does
pndev->stats.rx_dropped++ and goto rx_processing_done rather than
returning -ENOMEM.

The earlier patch in the series left mtip_rx_napi() with:

    pkts = mtip_switch_rx(napi->dev, budget);
    if (pkts == -ENOMEM) {
            napi_complete(napi);
            writel(MCF_ESW_IMR_RXF | MCF_ESW_IMR_TXF, fep->hwp + ESW_IMR);
            return 0;
    }

Is that branch now unreachable, and should it be removed so the contract
between mtip_switch_rx() and its caller stays consistent?

[ ... ]

> +
> +		/* Get correct RX page */
> +		index = bdp - fep->rx_bd_base;
> +		page = fep->page[index];
> +		/* Process the incoming frame */
> +		pkt_len = bdp->cbd_datlen;
> +
> +		dma_sync_single_for_cpu(&fep->pdev->dev, bdp->cbd_bufaddr,
> +					pkt_len, DMA_FROM_DEVICE);
> +		net_prefetch(page_address(page));
> +		data = page_address(page);
> +
> +		if (fep->quirks & FEC_QUIRK_SWAP_FRAME)
> +			swap_buffer(data, pkt_len);
> +
> +		eth_hdr = (struct ethhdr *)data;
> +		mtip_atable_get_entry_port_number(fep, eth_hdr->h_source,
> +						  &rx_port);

[ ... ]

> +
> +		if (mtip_update_cbd(fep, bdp, index)) {
> +			pndev->stats.rx_dropped++;
> +			goto rx_processing_done;
> +		}
> +
> +		/* The packet length includes FCS, but we don't want to
> +		 * include that when passing upstream as it messes up
> +		 * bridging applications.
> +		 */
> +		skb = build_skb(page_address(page), PAGE_SIZE);
> +		if (unlikely(!skb)) {
> +			page_pool_recycle_direct(fep->page_pool, page);
> +			pndev->stats.rx_dropped++;
> +
> +			netdev_err_once(pndev, "build_skb failed!\n");
> +			goto rx_processing_done;
> +		}
> +
> +		skb_put(skb, pkt_len);      /* Make room */
> +		skb_mark_for_recycle(skb);
> +		skb->protocol = eth_type_trans(skb, pndev);
> +		skb->offload_fwd_mark = fep->br_offload;
> +		napi_gro_receive(&fep->napi, skb);
> +
> +		pndev->stats.rx_packets++;
> +		pndev->stats.rx_bytes += pkt_len;

[High]
Is the FCS actually being stripped here?

The comment above build_skb() states:

    /* The packet length includes FCS, but we don't want to
     * include that when passing upstream as it messes up
     * bridging applications.
     */

but skb_put() and the rx_bytes accounting both use pkt_len unmodified:

    skb_put(skb, pkt_len);      /* Make room */
    ...
    pndev->stats.rx_bytes += pkt_len;

The equivalent fec_enet_rx_queue_napi() in fec_main.c does
pkt_len - sub_len (with sub_len = 4 + fep->rx_shift). Combined with
mtip_enet_init() programming MCF_FEC_RCR_CRC_FWD in the RCR register so
the CRC is forwarded into the RX buffer, every skb handed to
napi_gro_receive() ends up with 4 trailing FCS bytes and rx_bytes is
overcounted by 4 per frame. Should pkt_len be reduced by 4 (or by
4 + fep->rx_shift) before skb_put() and the stats update?

[ ... ]

