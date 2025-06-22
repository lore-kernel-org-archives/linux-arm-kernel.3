Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB88C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Jun 2025 09:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EooIJeo3bYtl8ysN+iZeLwYc+8vJw0FC5QoH38ExmLI=; b=Md0EYK0pj85axMueFQkSCywMeM
	xHAaPrOat92GiylYh3N+n/sNCOi/BG/V09TDmjlnSJkxxjWuVIaYtBPGlZ134M6jgMFzrThWkH5UG
	TtLofM8miFfuxEqEXpc76SKAukIE17dmWFphK8L9KCe4sTIir2EOask1DMuh1zVzgoNjstkIhNGE2
	x7eBzuXY32mHIcPnDO0pfX7vZFPu8TBjetLHxzIzIxlX3qvthcKQfSd8E//Tmiqj8xn9Ccq+TyTg1
	fjaCLY3hYNCSWa6+fthfmpNUnFgamW8c1PcJsJ1dWXYQYXUzvE9z0krNcjqHGaOtHY7CqQK306ZWR
	Wkb07SWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTHPV-00000000ius-1ZM8;
	Sun, 22 Jun 2025 09:54:49 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTH9n-00000000h30-3gvV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Jun 2025 09:38:37 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ADDAD102A8C91;
	Sun, 22 Jun 2025 11:38:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1750585114; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=EooIJeo3bYtl8ysN+iZeLwYc+8vJw0FC5QoH38ExmLI=;
	b=FeMwosR+YqIq8kPOpFufzd7F3NNKu2qEDqdssYvHXP3UCJsKKmbDZSgEPF6E+eaTiXnkGZ
	6dXGOcJrr/21dOqF7SWlL+Txog5u4FHfq0Oh4943regw0xTYmoOtC/HNf9oRvvecszBNTo
	IrILG4sbHXGYkWDO341yc5A/JkQBIPwnFqGWAZEMg9zWhjNwefsAW3k+1lvDNndNq5XIKU
	0nhNRBrGCT7e13Nc4ifikKmOYiJlSK4eFPFZ8NLksj3qFois5prSj3L8L9tM9IO6gddbB7
	8xImkrakmI5mhSw6FedHyXSrVGHGzXy5XjsjhgyyWB/GqvA9Mh8w6h1akZgOVg==
From: Lukasz Majewski <lukma@denx.de>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>,
	Simon Horman <horms@kernel.org>,
	Lukasz Majewski <lukma@denx.de>
Subject: [net-next v13 06/11] net: mtip: Add mtip_switch_{rx|tx} functions to the L2 switch driver
Date: Sun, 22 Jun 2025 11:37:51 +0200
Message-Id: <20250622093756.2895000-7-lukma@denx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250622093756.2895000-1-lukma@denx.de>
References: <20250622093756.2895000-1-lukma@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_023836_204191_FCFC19DF 
X-CRM114-Status: GOOD (  30.15  )
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

This patch provides mtip_switch_tx and mtip_switch_rx functions
code for MTIP L2 switch.

Signed-off-by: Lukasz Majewski <lukma@denx.de>
---
Changes for v13:
- New patch - created by excluding some code from large (i.e. v12 and
  earlier) MTIP driver
---
 .../net/ethernet/freescale/mtipsw/mtipl2sw.c  | 252 ++++++++++++++++++
 1 file changed, 252 insertions(+)

diff --git a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
index 813cd39d6d56..a4e38e0d773e 100644
--- a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
+++ b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
@@ -228,6 +228,39 @@ struct mtip_port_info *mtip_portinfofifo_read(struct switch_enet_private *fep)
 	return info;
 }
 
+static void mtip_atable_get_entry_port_number(struct switch_enet_private *fep,
+					      unsigned char *mac_addr, u8 *port)
+{
+	int block_index, block_index_end, entry;
+	u32 mac_addr_lo, mac_addr_hi;
+	u32 read_lo, read_hi;
+
+	mac_addr_lo = (u32)((mac_addr[3] << 24) | (mac_addr[2] << 16) |
+			    (mac_addr[1] << 8) | mac_addr[0]);
+	mac_addr_hi = (u32)((mac_addr[5] << 8) | (mac_addr[4]));
+
+	block_index = GET_BLOCK_PTR(crc8_calc(mac_addr));
+	block_index_end = block_index + ATABLE_ENTRY_PER_SLOT;
+
+	/* now search all the entries in the selected block */
+	for (entry = block_index; entry < block_index_end; entry++) {
+		mtip_read_atable(fep, entry, &read_lo, &read_hi);
+		*port = MTIP_PORT_FORWARDING_INIT;
+
+		if (read_lo == mac_addr_lo &&
+		    ((read_hi & 0x0000FFFF) ==
+		     (mac_addr_hi & 0x0000FFFF))) {
+			/* found the correct address */
+			if ((read_hi & (1 << 16)) && (!(read_hi & (1 << 17))))
+				*port = FIELD_GET(AT_PORT_MASK, read_hi);
+			break;
+		}
+	}
+
+	dev_dbg(&fep->pdev->dev, "%s: MAC: %pM PORT: 0x%x\n", __func__,
+		mac_addr, *port);
+}
+
 /* Clear complete MAC Look Up Table */
 void mtip_clear_atable(struct switch_enet_private *fep)
 {
@@ -820,10 +853,229 @@ static irqreturn_t mtip_interrupt(int irq, void *ptr_fep)
 
 static void mtip_switch_tx(struct net_device *dev)
 {
+	struct mtip_ndev_priv *priv = netdev_priv(dev);
+	struct switch_enet_private *fep = priv->fep;
+	unsigned short status;
+	struct sk_buff *skb;
+	unsigned long flags;
+	struct cbd_t *bdp;
+
+	spin_lock_irqsave(&fep->hw_lock, flags);
+	bdp = fep->dirty_tx;
+
+	while (((status = bdp->cbd_sc) & BD_ENET_TX_READY) == 0) {
+		if (bdp == fep->cur_tx && fep->tx_full == 0)
+			break;
+
+		dma_unmap_single(&fep->pdev->dev, bdp->cbd_bufaddr,
+				 MTIP_SWITCH_TX_FRSIZE, DMA_TO_DEVICE);
+		bdp->cbd_bufaddr = 0;
+		skb = fep->tx_skbuff[fep->skb_dirty];
+		/* Check for errors */
+		if (status & (BD_ENET_TX_HB | BD_ENET_TX_LC |
+				   BD_ENET_TX_RL | BD_ENET_TX_UN |
+				   BD_ENET_TX_CSL)) {
+			dev->stats.tx_errors++;
+			if (status & BD_ENET_TX_HB)  /* No heartbeat */
+				dev->stats.tx_heartbeat_errors++;
+			if (status & BD_ENET_TX_LC)  /* Late collision */
+				dev->stats.tx_window_errors++;
+			if (status & BD_ENET_TX_RL)  /* Retrans limit */
+				dev->stats.tx_aborted_errors++;
+			if (status & BD_ENET_TX_UN)  /* Underrun */
+				dev->stats.tx_fifo_errors++;
+			if (status & BD_ENET_TX_CSL) /* Carrier lost */
+				dev->stats.tx_carrier_errors++;
+		} else {
+			dev->stats.tx_packets++;
+		}
+
+		if (status & BD_ENET_TX_READY)
+			dev_err(&fep->pdev->dev,
+				"Enet xmit interrupt and TX_READY.\n");
+
+		/* Deferred means some collisions occurred during transmit,
+		 * but we eventually sent the packet OK.
+		 */
+		if (status & BD_ENET_TX_DEF)
+			dev->stats.collisions++;
+
+		/* Free the sk buffer associated with this last transmit */
+		dev_consume_skb_irq(skb);
+		fep->tx_skbuff[fep->skb_dirty] = NULL;
+		fep->skb_dirty = (fep->skb_dirty + 1) & TX_RING_MOD_MASK;
+
+		/* Update pointer to next buffer descriptor to be transmitted */
+		if (status & BD_ENET_TX_WRAP)
+			bdp = fep->tx_bd_base;
+		else
+			bdp++;
+
+		/* Since we have freed up a buffer, the ring is no longer
+		 * full.
+		 */
+		if (fep->tx_full) {
+			fep->tx_full = 0;
+			if (netif_queue_stopped(dev))
+				netif_wake_queue(dev);
+		}
+	}
+	fep->dirty_tx = bdp;
+	spin_unlock_irqrestore(&fep->hw_lock, flags);
 }
 
+/* During a receive, the cur_rx points to the current incoming buffer.
+ * When we update through the ring, if the next incoming buffer has
+ * not been given to the system, we just set the empty indicator,
+ * effectively tossing the packet.
+ */
 static int mtip_switch_rx(struct net_device *dev, int budget, int *port)
 {
+	struct mtip_ndev_priv *priv = netdev_priv(dev);
+	u8 *data, rx_port = MTIP_PORT_FORWARDING_INIT;
+	struct switch_enet_private *fep = priv->fep;
+	unsigned short status, pkt_len;
+	struct net_device *pndev;
+	struct ethhdr *eth_hdr;
+	int pkt_received = 0;
+	struct sk_buff *skb;
+	struct cbd_t *bdp;
+	struct page *page;
+
+	spin_lock_bh(&fep->hw_lock);
+
+	/* First, grab all of the stats for the incoming packet.
+	 * These get messed up if we get called due to a busy condition.
+	 */
+	bdp = fep->cur_rx;
+
+	while (!((status = bdp->cbd_sc) & BD_ENET_RX_EMPTY)) {
+		if (pkt_received >= budget)
+			break;
+
+		pkt_received++;
+		/* Since we have allocated space to hold a complete frame,
+		 * the last indicator should be set.
+		 */
+		if ((status & BD_ENET_RX_LAST) == 0)
+			dev_warn_ratelimited(&dev->dev,
+					     "SWITCH ENET: rcv is not +last\n");
+
+		if (!fep->usage_count)
+			goto rx_processing_done;
+
+		/* Check for errors. */
+		if (status & (BD_ENET_RX_LG | BD_ENET_RX_SH | BD_ENET_RX_NO |
+			      BD_ENET_RX_CR | BD_ENET_RX_OV)) {
+			dev->stats.rx_errors++;
+			if (status & (BD_ENET_RX_LG | BD_ENET_RX_SH)) {
+				/* Frame too long or too short. */
+				dev->stats.rx_length_errors++;
+			}
+			if (status & BD_ENET_RX_NO)	/* Frame alignment */
+				dev->stats.rx_frame_errors++;
+			if (status & BD_ENET_RX_CR)	/* CRC Error */
+				dev->stats.rx_crc_errors++;
+			if (status & BD_ENET_RX_OV)	/* FIFO overrun */
+				dev->stats.rx_fifo_errors++;
+		}
+
+		/* Report late collisions as a frame error.
+		 * On this error, the BD is closed, but we don't know what we
+		 * have in the buffer.  So, just drop this frame on the floor.
+		 */
+		if (status & BD_ENET_RX_CL) {
+			dev->stats.rx_errors++;
+			dev->stats.rx_frame_errors++;
+			goto rx_processing_done;
+		}
+
+		/* Get correct RX page */
+		page = fep->page[bdp - fep->rx_bd_base];
+		/* Process the incoming frame */
+		pkt_len = bdp->cbd_datlen;
+		data = (__u8 *)__va(bdp->cbd_bufaddr);
+
+		dma_sync_single_for_cpu(&fep->pdev->dev, bdp->cbd_bufaddr,
+					pkt_len, DMA_FROM_DEVICE);
+		prefetch(page_address(page));
+
+		if (fep->quirks & FEC_QUIRK_SWAP_FRAME)
+			swap_buffer(data, pkt_len);
+
+		if (data) {
+			eth_hdr = (struct ethhdr *)data;
+			mtip_atable_get_entry_port_number(fep,
+							  eth_hdr->h_source,
+							  &rx_port);
+			if (rx_port == MTIP_PORT_FORWARDING_INIT)
+				mtip_atable_dynamicms_learn_migration(fep,
+								      fep->curr_time,
+								      eth_hdr->h_source,
+								      &rx_port);
+		}
+
+		if ((rx_port == 1 || rx_port == 2) && fep->ndev[rx_port - 1])
+			pndev = fep->ndev[rx_port - 1];
+		else
+			pndev = dev;
+
+		*port = rx_port;
+
+		/* This does 16 byte alignment, exactly what we need.
+		 * The packet length includes FCS, but we don't want to
+		 * include that when passing upstream as it messes up
+		 * bridging applications.
+		 */
+		skb = netdev_alloc_skb(pndev, pkt_len + NET_IP_ALIGN);
+		if (unlikely(!skb)) {
+			dev_dbg(&fep->pdev->dev,
+				"%s: Memory squeeze, dropping packet.\n",
+				pndev->name);
+			page_pool_recycle_direct(fep->page_pool, page);
+			pndev->stats.rx_dropped++;
+			goto err_mem;
+		} else {
+			skb_reserve(skb, NET_IP_ALIGN);
+			skb_put(skb, pkt_len);      /* Make room */
+			skb_copy_to_linear_data(skb, data, pkt_len);
+			skb->protocol = eth_type_trans(skb, pndev);
+			napi_gro_receive(&fep->napi, skb);
+		}
+
+		pndev->stats.rx_packets++;
+		pndev->stats.rx_bytes += pkt_len;
+
+ rx_processing_done:
+		/* Clear the status flags for this buffer */
+		status &= ~BD_ENET_RX_STATS;
+
+		/* Mark the buffer empty */
+		status |= BD_ENET_RX_EMPTY;
+		/* Make sure that updates to the descriptor are performed */
+		wmb();
+		bdp->cbd_sc = status;
+
+		/* Update BD pointer to next entry */
+		if (status & BD_ENET_RX_WRAP)
+			bdp = fep->rx_bd_base;
+		else
+			bdp++;
+
+		/* Doing this here will keep the FEC running while we process
+		 * incoming frames.  On a heavily loaded network, we should be
+		 * able to keep up at the expense of system resources.
+		 */
+		writel(MCF_ESW_RDAR_R_DES_ACTIVE, fep->hwp + ESW_RDAR);
+	} /* while (!((status = bdp->cbd_sc) & BD_ENET_RX_EMPTY)) */
+
+	fep->cur_rx = bdp;
+	spin_unlock_bh(&fep->hw_lock);
+
+	return pkt_received;
+
+ err_mem:
+	spin_unlock_bh(&fep->hw_lock);
 	return -ENOMEM;
 }
 
-- 
2.39.5


