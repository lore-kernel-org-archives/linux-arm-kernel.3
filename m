Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D24DB106FD9E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 09:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6iS/RgX6lu0f4umfKZBwVXa6SDtuz9v9yqZMmkoNc/c=; b=0H4eE9uOUcz85vU2FwPhhP7WS0
	IR6lsmBL+jvlcgOZYIYX6sD2662wkffhW2kHVK/EFZrJGHUMq6UGCO6EQX4ECBGTeszIQPRa/mWxt
	TlcFOYNvVtf7Vb9G0pmSX2L8nz0UUIxB+JsxwHCB4301ixBUGOpfLkY0wYE81knqUZgsvtasdPqG7
	TkCwNNCw0tKZRsa3P9cjXMvBegpexwUn2E89xh/Vl9rtr70aaPBPeCaODWazi1B8RgZDt5cBh7YJO
	Ux0MVtiLrTVsSHb4IRRrbREKheWXAUiHkMC58/fuSsMAWhjgqpuFNPuDlw7GObeOSOYnjK+vy+TC6
	qgJN4j0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1LW9-00000001h3k-3KI4;
	Sat, 14 Mar 2026 09:42:45 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1LW7-00000001h37-2aFq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 09:42:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6iS/RgX6lu0f4umfKZBwVXa6SDtuz9v9yqZMmkoNc/c=; b=gXmuQJPf4NRzbEAzste9JKT4rd
	y15jYlSaqUIRw9S0xTDzp6+mJDC02qagvvFFdE1+wRagyfv23za8lRq9zLvmN817/QP0YRAV4fd1h
	r5aBa1idN9kpNtMKGOE+a8Tj0VwuBwM/aDUixHUp40YrpkXasNfWoDLQ5UGOnoR4cf+wQfrP70tli
	DN9hIPiVjbbe3ME1zL8olY5g0HtyIB/ZtrFWJewWqe9NaNPtBFbjGVtf83H8FZr42pRZFoNu01nL9
	N5Mkbbk96ECqJTUMgtfMF3kKM2jJoCmJWydrOG+ZFaO8IJ3joACwPeOsJNyxgfBNG5jA0Ovm0ibm9
	JzMT+X7Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:34364 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w1LVu-000000001zy-3vCL;
	Sat, 14 Mar 2026 09:42:30 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w1LVu-0000000DGRr-0Ni3;
	Sat, 14 Mar 2026 09:42:30 +0000
In-Reply-To: <abUtGH9KB03PH5Ne@shell.armlinux.org.uk>
References: <abUtGH9KB03PH5Ne@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	bpf@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Stanislav Fomichev <sdf@fomichev.me>
Subject: [PATCH net-next v4 02/15] net: stmmac: helpers for filling
 tx_q->tx_skbuff_dma
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w1LVu-0000000DGRr-0Ni3@rmk-PC.armlinux.org.uk>
Date: Sat, 14 Mar 2026 09:42:30 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_024243_807431_D57B01EE 
X-CRM114-Status: GOOD (  20.60  )
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

Add helpers to fill in the transmit queue metadata to ensure that all
entries are initialised when preparing to transmit. This avoids clean
up code running into surprises.

For example, stmmac_clean_desc3() (which calls clean_desc3() in
chain_mode.c or ring_mode.c) looks at the .last_segment, and in the
latter case, .is_jumbo members.

AI believes that there is a missing .buf_type assignment in
stmmac_tso_xmit(), but this is a mis-analysis. AI believes that
stmmac_tso_allocator() which would increment tx_q->cur_tx will be
called within the loop when nfrags is zero, but it's failing to
realise that none of the code within the for() loop will be
executed. In any case, at the point where the loop exits,
tx_q->tx_skbuff_dma[tx_q->cur_tx].buf_type has been correctly set
via the call to stmmac_set_tx_skb_dma_entry() - either the one
before the loop, or the one at the end of the loop block.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 96 +++++++++++--------
 1 file changed, 54 insertions(+), 42 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 11150bddd872..0dcf4a31e314 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1925,6 +1925,34 @@ static int init_dma_rx_desc_rings(struct net_device *dev,
 	return ret;
 }
 
+static void stmmac_set_tx_dma_entry(struct stmmac_tx_queue *tx_q,
+				    unsigned int entry,
+				    enum stmmac_txbuf_type type,
+				    dma_addr_t addr, size_t len,
+				    bool map_as_page)
+{
+	tx_q->tx_skbuff_dma[entry].buf = addr;
+	tx_q->tx_skbuff_dma[entry].len = len;
+	tx_q->tx_skbuff_dma[entry].buf_type = type;
+	tx_q->tx_skbuff_dma[entry].map_as_page = map_as_page;
+	tx_q->tx_skbuff_dma[entry].last_segment = false;
+	tx_q->tx_skbuff_dma[entry].is_jumbo = false;
+}
+
+static void stmmac_set_tx_skb_dma_entry(struct stmmac_tx_queue *tx_q,
+					unsigned int entry, dma_addr_t addr,
+					size_t len, bool map_as_page)
+{
+	stmmac_set_tx_dma_entry(tx_q, entry, STMMAC_TXBUF_T_SKB, addr, len,
+				map_as_page);
+}
+
+static void stmmac_set_tx_dma_last_segment(struct stmmac_tx_queue *tx_q,
+					   unsigned int entry)
+{
+	tx_q->tx_skbuff_dma[entry].last_segment = true;
+}
+
 /**
  * __init_dma_tx_desc_rings - init the TX descriptor ring (per queue)
  * @priv: driver private structure
@@ -1970,11 +1998,8 @@ static int __init_dma_tx_desc_rings(struct stmmac_priv *priv,
 			p = tx_q->dma_tx + i;
 
 		stmmac_clear_desc(priv, p);
+		stmmac_set_tx_skb_dma_entry(tx_q, i, 0, 0, false);
 
-		tx_q->tx_skbuff_dma[i].buf = 0;
-		tx_q->tx_skbuff_dma[i].map_as_page = false;
-		tx_q->tx_skbuff_dma[i].len = 0;
-		tx_q->tx_skbuff_dma[i].last_segment = false;
 		tx_q->tx_skbuff[i] = NULL;
 	}
 
@@ -2695,19 +2720,15 @@ static bool stmmac_xdp_xmit_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
 		meta = xsk_buff_get_metadata(pool, xdp_desc.addr);
 		xsk_buff_raw_dma_sync_for_device(pool, dma_addr, xdp_desc.len);
 
-		tx_q->tx_skbuff_dma[entry].buf_type = STMMAC_TXBUF_T_XSK_TX;
-
 		/* To return XDP buffer to XSK pool, we simple call
 		 * xsk_tx_completed(), so we don't need to fill up
 		 * 'buf' and 'xdpf'.
 		 */
-		tx_q->tx_skbuff_dma[entry].buf = 0;
-		tx_q->xdpf[entry] = NULL;
+		stmmac_set_tx_dma_entry(tx_q, entry, STMMAC_TXBUF_T_XSK_TX,
+					0, xdp_desc.len, false);
+		stmmac_set_tx_dma_last_segment(tx_q, entry);
 
-		tx_q->tx_skbuff_dma[entry].map_as_page = false;
-		tx_q->tx_skbuff_dma[entry].len = xdp_desc.len;
-		tx_q->tx_skbuff_dma[entry].last_segment = true;
-		tx_q->tx_skbuff_dma[entry].is_jumbo = false;
+		tx_q->xdpf[entry] = NULL;
 
 		stmmac_set_desc_addr(priv, tx_desc, dma_addr);
 
@@ -2882,6 +2903,9 @@ static int stmmac_tx_clean(struct stmmac_priv *priv, int budget, u32 queue,
 			tx_q->tx_skbuff_dma[entry].map_as_page = false;
 		}
 
+		/* This looks at tx_q->tx_skbuff_dma[tx_q->dirty_tx].is_jumbo
+		 * and tx_q->tx_skbuff_dma[tx_q->dirty_tx].last_segment
+		 */
 		stmmac_clean_desc3(priv, tx_q, p);
 
 		tx_q->tx_skbuff_dma[entry].last_segment = false;
@@ -4471,10 +4495,8 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 	 * this DMA buffer right after the DMA engine completely finishes the
 	 * full buffer transmission.
 	 */
-	tx_q->tx_skbuff_dma[tx_q->cur_tx].buf = des;
-	tx_q->tx_skbuff_dma[tx_q->cur_tx].len = skb_headlen(skb);
-	tx_q->tx_skbuff_dma[tx_q->cur_tx].map_as_page = false;
-	tx_q->tx_skbuff_dma[tx_q->cur_tx].buf_type = STMMAC_TXBUF_T_SKB;
+	stmmac_set_tx_skb_dma_entry(tx_q, tx_q->cur_tx, des, skb_headlen(skb),
+				    false);
 
 	/* Prepare fragments */
 	for (i = 0; i < nfrags; i++) {
@@ -4489,17 +4511,14 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 		stmmac_tso_allocator(priv, des, skb_frag_size(frag),
 				     (i == nfrags - 1), queue);
 
-		tx_q->tx_skbuff_dma[tx_q->cur_tx].buf = des;
-		tx_q->tx_skbuff_dma[tx_q->cur_tx].len = skb_frag_size(frag);
-		tx_q->tx_skbuff_dma[tx_q->cur_tx].map_as_page = true;
-		tx_q->tx_skbuff_dma[tx_q->cur_tx].buf_type = STMMAC_TXBUF_T_SKB;
+		stmmac_set_tx_skb_dma_entry(tx_q, tx_q->cur_tx, des,
+					    skb_frag_size(frag), true);
 	}
 
-	tx_q->tx_skbuff_dma[tx_q->cur_tx].last_segment = true;
+	stmmac_set_tx_dma_last_segment(tx_q, tx_q->cur_tx);
 
 	/* Only the last descriptor gets to point to the skb. */
 	tx_q->tx_skbuff[tx_q->cur_tx] = skb;
-	tx_q->tx_skbuff_dma[tx_q->cur_tx].buf_type = STMMAC_TXBUF_T_SKB;
 
 	/* Manage tx mitigation */
 	tx_packets = CIRC_CNT(tx_q->cur_tx + 1, first_tx,
@@ -4758,23 +4777,18 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 		if (dma_mapping_error(priv->device, des))
 			goto dma_map_err; /* should reuse desc w/o issues */
 
-		tx_q->tx_skbuff_dma[entry].buf = des;
-
+		stmmac_set_tx_skb_dma_entry(tx_q, entry, des, len, true);
 		stmmac_set_desc_addr(priv, desc, des);
 
-		tx_q->tx_skbuff_dma[entry].map_as_page = true;
-		tx_q->tx_skbuff_dma[entry].len = len;
-		tx_q->tx_skbuff_dma[entry].last_segment = last_segment;
-		tx_q->tx_skbuff_dma[entry].buf_type = STMMAC_TXBUF_T_SKB;
-
 		/* Prepare the descriptor and set the own bit too */
 		stmmac_prepare_tx_desc(priv, desc, 0, len, csum_insertion,
 				priv->mode, 1, last_segment, skb->len);
 	}
 
+	stmmac_set_tx_dma_last_segment(tx_q, entry);
+
 	/* Only the last descriptor gets to point to the skb. */
 	tx_q->tx_skbuff[entry] = skb;
-	tx_q->tx_skbuff_dma[entry].buf_type = STMMAC_TXBUF_T_SKB;
 
 	/* According to the coalesce parameter the IC bit for the latest
 	 * segment is reset and the timer re-started to clean the tx status.
@@ -4853,14 +4867,13 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 		if (dma_mapping_error(priv->device, des))
 			goto dma_map_err;
 
-		tx_q->tx_skbuff_dma[first_entry].buf = des;
-		tx_q->tx_skbuff_dma[first_entry].buf_type = STMMAC_TXBUF_T_SKB;
-		tx_q->tx_skbuff_dma[first_entry].map_as_page = false;
+		stmmac_set_tx_skb_dma_entry(tx_q, first_entry, des, nopaged_len,
+					    false);
 
 		stmmac_set_desc_addr(priv, first, des);
 
-		tx_q->tx_skbuff_dma[first_entry].len = nopaged_len;
-		tx_q->tx_skbuff_dma[first_entry].last_segment = last_segment;
+		if (last_segment)
+			stmmac_set_tx_dma_last_segment(tx_q, first_entry);
 
 		if (unlikely((skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP) &&
 			     priv->hwts_tx_en)) {
@@ -5062,6 +5075,7 @@ static int stmmac_xdp_xmit_xdpf(struct stmmac_priv *priv, int queue,
 	struct stmmac_tx_queue *tx_q = &priv->dma_conf.tx_queue[queue];
 	bool csum = !priv->plat->tx_queues_cfg[queue].coe_unsupported;
 	unsigned int entry = tx_q->cur_tx;
+	enum stmmac_txbuf_type buf_type;
 	struct dma_desc *tx_desc;
 	dma_addr_t dma_addr;
 	bool set_ic;
@@ -5089,7 +5103,7 @@ static int stmmac_xdp_xmit_xdpf(struct stmmac_priv *priv, int queue,
 		if (dma_mapping_error(priv->device, dma_addr))
 			return STMMAC_XDP_CONSUMED;
 
-		tx_q->tx_skbuff_dma[entry].buf_type = STMMAC_TXBUF_T_XDP_NDO;
+		buf_type = STMMAC_TXBUF_T_XDP_NDO;
 	} else {
 		struct page *page = virt_to_page(xdpf->data);
 
@@ -5098,14 +5112,12 @@ static int stmmac_xdp_xmit_xdpf(struct stmmac_priv *priv, int queue,
 		dma_sync_single_for_device(priv->device, dma_addr,
 					   xdpf->len, DMA_BIDIRECTIONAL);
 
-		tx_q->tx_skbuff_dma[entry].buf_type = STMMAC_TXBUF_T_XDP_TX;
+		buf_type = STMMAC_TXBUF_T_XDP_TX;
 	}
 
-	tx_q->tx_skbuff_dma[entry].buf = dma_addr;
-	tx_q->tx_skbuff_dma[entry].map_as_page = false;
-	tx_q->tx_skbuff_dma[entry].len = xdpf->len;
-	tx_q->tx_skbuff_dma[entry].last_segment = true;
-	tx_q->tx_skbuff_dma[entry].is_jumbo = false;
+	stmmac_set_tx_dma_entry(tx_q, entry, buf_type, dma_addr, xdpf->len,
+				false);
+	stmmac_set_tx_dma_last_segment(tx_q, entry);
 
 	tx_q->xdpf[entry] = xdpf;
 
-- 
2.47.3


