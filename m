Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00DAD10706C1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 09:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ewJOvFdSeAwG/CGm/arAeUzyqJS602sni3GTNGvNovU=; b=k2gfzq+U0GumbVp4eNEtizgZN8
	RawQOFbRbXs/fZSujQ1VTh2CpNxr2VzdjGsHDJC2JbqX70jTdclWBXeNLocslNpyjeUKi/4vTj0sL
	N/DGq7bp+g5DwzDrWfT/aZjQ7JNv6sOo54ebEHJZ5XpwmoyOx2HcKWKyPrJ+8RFA2JdE95QzkjxO9
	ptrIAKFpX5psyQJaajqs8dh2ogkAX11J7UuTZqao56MKdqde7cguZcCtdrg3s0eDoIqOSNm96kYS6
	xfUcCp++ii50vF8W4CIJsrggyF5EZgbTSuk67YDpgD+wKESXB1LdEmE0zzSN13VIY/MMDOSrDsv8/
	Ow1WrtOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Lc7-00000001i4n-1Zdc;
	Sat, 14 Mar 2026 09:48:55 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Lc4-00000001i4H-0wry
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 09:48:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ewJOvFdSeAwG/CGm/arAeUzyqJS602sni3GTNGvNovU=; b=oeHq0EsDTBESJxJk03DAsJkTIe
	+4e9eI20R0/DgUAHdUHWJkP4/25aCbX61Dy2r6JgzaByZsvVji8f7IG6zuddW57CSaSeB1InaGcxk
	w1rH2b5n20B/w5o843Ip6PuHXRTMce/CugkRALgv1dyTTCfQWVKs/E0UkZjWXLgFBTmgrOALKSe41
	EqQFW6eJKIM/ALTLh5AaETA80ivmSFV8lb+P8DFR2E9wbS91hZR0kaGT37Q4uuSzU9WORDxdKJYd2
	mHgWSTEyPv+5vqOsFMx3/cgdvt7uzFc+tBSiNrbf00HKvq1bp+ENObElOxQ+t9eAkUtb5JNjJF7kW
	QvTZWamQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38364 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w1LWj-0000000022h-3TXF;
	Sat, 14 Mar 2026 09:43:22 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w1LWe-0000000DGSj-0KtE;
	Sat, 14 Mar 2026 09:43:16 +0000
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
Subject: [PATCH net-next v4 11/15] net: stmmac: add helper to get hardware
 transmit descriptor
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w1LWe-0000000DGSj-0KtE@rmk-PC.armlinux.org.uk>
Date: Sat, 14 Mar 2026 09:43:16 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_024852_492063_7E4F3924 
X-CRM114-Status: GOOD (  17.99  )
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

Provide a helper to get the hardware transmit descriptor that takes
account of whether extended format and TBS are being used, returning
the base struct dma_desc pointer. This avoids multiple instances where
these tests are open coded.

We need to update dwmac4_display_ring() to cope the passed head
pointer always pointing at the struct dma_desc by using
dma_desc_to_edesc() to convert it to struct dma_edesc. This is the
only stmmac_display_ring() implementation that this affects.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/descs.h   |  2 +
 .../ethernet/stmicro/stmmac/dwmac4_descs.c    |  2 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 87 ++++++-------------
 3 files changed, 28 insertions(+), 63 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/descs.h b/drivers/net/ethernet/stmicro/stmmac/descs.h
index e62e2ebcf273..846007cc245f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/descs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/descs.h
@@ -173,6 +173,8 @@ struct dma_edesc {
 	struct dma_desc basic;
 };
 
+#define dma_desc_to_edesc(x) container_of(x, struct dma_edesc, basic)
+
 /* Transmit checksum insertion control */
 #define	TX_CIC_FULL	3	/* Include IP header and pseudoheader */
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
index 1bbf02504dad..d5c003f3fbbc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
@@ -427,7 +427,7 @@ static void dwmac4_display_ring(void *head, unsigned int size, bool rx,
 			extp++;
 		}
 	} else if (desc_size == sizeof(struct dma_edesc)) {
-		struct dma_edesc *ep = (struct dma_edesc *)head;
+		struct dma_edesc *ep = dma_desc_to_edesc(head);
 
 		for (i = 0; i < size; i++) {
 			dma_addr = dma_rx_phy + i * sizeof(*ep);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 032ef9fba8b4..76e4dcf8f697 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -362,6 +362,18 @@ static inline u32 stmmac_tx_avail(struct stmmac_priv *priv, u32 queue)
 			  priv->dma_conf.dma_tx_size);
 }
 
+static struct dma_desc *stmmac_get_tx_desc(struct stmmac_priv *priv,
+					   struct stmmac_tx_queue *tx_q,
+					   unsigned int index)
+{
+	if (priv->extend_desc)
+		return &tx_q->dma_etx[index].basic;
+	else if (tx_q->tbs & STMMAC_TBS_AVAIL)
+		return &tx_q->dma_entx[index].basic;
+	else
+		return &tx_q->dma_tx[index];
+}
+
 static size_t stmmac_get_rx_desc_size(struct stmmac_priv *priv)
 {
 	if (priv->extend_desc)
@@ -1489,16 +1501,14 @@ static void stmmac_display_tx_rings(struct stmmac_priv *priv,
 
 		pr_info("\tTX Queue %d rings\n", queue);
 
-		if (priv->extend_desc) {
-			head_tx = (void *)tx_q->dma_etx;
+		if (priv->extend_desc)
 			desc_size = sizeof(struct dma_extended_desc);
-		} else if (tx_q->tbs & STMMAC_TBS_AVAIL) {
-			head_tx = (void *)tx_q->dma_entx;
+		else if (tx_q->tbs & STMMAC_TBS_AVAIL)
 			desc_size = sizeof(struct dma_edesc);
-		} else {
-			head_tx = (void *)tx_q->dma_tx;
+		else
 			desc_size = sizeof(struct dma_desc);
-		}
+
+		head_tx = stmmac_get_tx_desc(priv, tx_q, 0);
 
 		stmmac_display_ring(priv, head_tx, dma_conf->dma_tx_size, false,
 				    tx_q->dma_tx_phy, desc_size);
@@ -1587,13 +1597,7 @@ static void stmmac_clear_tx_descriptors(struct stmmac_priv *priv,
 		int last = (i == (dma_conf->dma_tx_size - 1));
 		struct dma_desc *p;
 
-		if (priv->extend_desc)
-			p = &tx_q->dma_etx[i].basic;
-		else if (tx_q->tbs & STMMAC_TBS_AVAIL)
-			p = &tx_q->dma_entx[i].basic;
-		else
-			p = &tx_q->dma_tx[i];
-
+		p = stmmac_get_tx_desc(priv, tx_q, i);
 		stmmac_init_tx_desc(priv, p, priv->mode, last);
 	}
 }
@@ -2021,13 +2025,7 @@ static int __init_dma_tx_desc_rings(struct stmmac_priv *priv,
 	for (i = 0; i < dma_conf->dma_tx_size; i++) {
 		struct dma_desc *p;
 
-		if (priv->extend_desc)
-			p = &((tx_q->dma_etx + i)->basic);
-		else if (tx_q->tbs & STMMAC_TBS_AVAIL)
-			p = &((tx_q->dma_entx + i)->basic);
-		else
-			p = tx_q->dma_tx + i;
-
+		p = stmmac_get_tx_desc(priv, tx_q, i);
 		stmmac_clear_desc(priv, p);
 		stmmac_set_tx_skb_dma_entry(tx_q, i, 0, 0, false);
 
@@ -2730,13 +2728,7 @@ static bool stmmac_xdp_xmit_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
 			continue;
 		}
 
-		if (likely(priv->extend_desc))
-			tx_desc = (struct dma_desc *)(tx_q->dma_etx + entry);
-		else if (tx_q->tbs & STMMAC_TBS_AVAIL)
-			tx_desc = &tx_q->dma_entx[entry].basic;
-		else
-			tx_desc = tx_q->dma_tx + entry;
-
+		tx_desc = stmmac_get_tx_desc(priv, tx_q, entry);
 		dma_addr = xsk_buff_raw_get_dma(pool, xdp_desc.addr);
 		meta = xsk_buff_get_metadata(pool, xdp_desc.addr);
 		xsk_buff_raw_dma_sync_for_device(pool, dma_addr, xdp_desc.len);
@@ -2863,13 +2855,7 @@ static int stmmac_tx_clean(struct stmmac_priv *priv, int budget, u32 queue,
 			skb = NULL;
 		}
 
-		if (priv->extend_desc)
-			p = (struct dma_desc *)(tx_q->dma_etx + entry);
-		else if (tx_q->tbs & STMMAC_TBS_AVAIL)
-			p = &tx_q->dma_entx[entry].basic;
-		else
-			p = tx_q->dma_tx + entry;
-
+		p = stmmac_get_tx_desc(priv, tx_q, entry);
 		status = stmmac_tx_status(priv,	&priv->xstats, p, priv->ioaddr);
 		/* Check if the descriptor is owned by the DMA */
 		if (unlikely(status & tx_dma_own))
@@ -4752,13 +4738,7 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 		csum_insertion = !csum_insertion;
 	}
 
-	if (likely(priv->extend_desc))
-		desc = (struct dma_desc *)(tx_q->dma_etx + entry);
-	else if (tx_q->tbs & STMMAC_TBS_AVAIL)
-		desc = &tx_q->dma_entx[entry].basic;
-	else
-		desc = tx_q->dma_tx + entry;
-
+	desc = stmmac_get_tx_desc(priv, tx_q, entry);
 	first = desc;
 
 	if (has_vlan)
@@ -4783,12 +4763,7 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 		entry = STMMAC_GET_ENTRY(entry, priv->dma_conf.dma_tx_size);
 		WARN_ON(tx_q->tx_skbuff[entry]);
 
-		if (likely(priv->extend_desc))
-			desc = (struct dma_desc *)(tx_q->dma_etx + entry);
-		else if (tx_q->tbs & STMMAC_TBS_AVAIL)
-			desc = &tx_q->dma_entx[entry].basic;
-		else
-			desc = tx_q->dma_tx + entry;
+		desc = stmmac_get_tx_desc(priv, tx_q, entry);
 
 		des = skb_frag_dma_map(priv->device, frag, 0, len,
 				       DMA_TO_DEVICE);
@@ -4829,13 +4804,7 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 		set_ic = false;
 
 	if (set_ic) {
-		if (likely(priv->extend_desc))
-			desc = &tx_q->dma_etx[entry].basic;
-		else if (tx_q->tbs & STMMAC_TBS_AVAIL)
-			desc = &tx_q->dma_entx[entry].basic;
-		else
-			desc = &tx_q->dma_tx[entry];
-
+		desc = stmmac_get_tx_desc(priv, tx_q, entry);
 		tx_q->tx_count_frames = 0;
 		stmmac_set_tx_ic(priv, desc);
 	}
@@ -5103,13 +5072,7 @@ static int stmmac_xdp_xmit_xdpf(struct stmmac_priv *priv, int queue,
 		return STMMAC_XDP_CONSUMED;
 	}
 
-	if (likely(priv->extend_desc))
-		tx_desc = (struct dma_desc *)(tx_q->dma_etx + entry);
-	else if (tx_q->tbs & STMMAC_TBS_AVAIL)
-		tx_desc = &tx_q->dma_entx[entry].basic;
-	else
-		tx_desc = tx_q->dma_tx + entry;
-
+	tx_desc = stmmac_get_tx_desc(priv, tx_q, entry);
 	if (dma_map) {
 		dma_addr = dma_map_single(priv->device, xdpf->data,
 					  xdpf->len, DMA_TO_DEVICE);
-- 
2.47.3


