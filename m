Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A5BFED2FE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 10:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vD9XV3c23C+2JgGGszHzOnaUIWcl3DV5rrl6x+Bs1b8=; b=Dcu5AV/lfmIkGIdLocDa4Hmbv8
	ycUK6cExsiaFo0W6238OnindMIP/Dtpp1xts8ckaKpUqOBgk1wYScMlBjeSjGk9XHwRr+1m1YKiE0
	CyvNINcnxYZuqQEI6wInRD2VHKNEiknLNe0tlzhiySxYufxvAB0mAemNYtF1X84TAbERv6tOn3a0I
	kppC3BKFssBcpjfj9tV3MPPrRXxaK8SOS/8FmN9l7SHC6T9jZ4TH/NN5doV5cYeTQF9J0M+Odxpkg
	oQ+38B9jXRO20XBcqiV5Tlhbr0meCddOPkE9vp9/5AroxoX8ZUWSiw9VGb5NfO9kRa/tO+/MM0SBM
	he+Cca2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0czg-0000000DpjD-2hD2;
	Thu, 12 Mar 2026 10:10:16 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0czd-0000000DpeP-2hIV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 10:10:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vD9XV3c23C+2JgGGszHzOnaUIWcl3DV5rrl6x+Bs1b8=; b=pMi/MFaxfKzfHX7aJIdpDsOd4N
	ACF0r4ilzIdLHkDT3cQxga2TPDKyQcCLshgb+9fvGrYALB+GIcqFixWUrLolzYFi2wfI5qsu4QpYM
	IHyVmhmbk+h/7kFV7KtN+XA0CzSZX/5ihCMYA4eGxolb8SIMNyXRT1n8c5XIeKV+aROfMtb+yKM7a
	Cvos3DlXzSFVSa4kFMuXiI04xf5Fe+s3qXKaENNhK/5aoR2IG0NC7f2jSwg54dpE2ldH6SK/5WFcL
	jSLlj6Ylb+zvjjwcV78YCh9jiZ6cnXYr5MM1Xil+JKh2fyhw7lqjCYw6ML3b7JNZRIVoKF3Su89hz
	fPIpuQyA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:45888 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w0czF-000000007aJ-3WbS;
	Thu, 12 Mar 2026 10:09:49 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w0czA-0000000CzGq-04op;
	Thu, 12 Mar 2026 10:09:44 +0000
In-Reply-To: <abKQWloxp9_4OuJh@shell.armlinux.org.uk>
References: <abKQWloxp9_4OuJh@shell.armlinux.org.uk>
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
Subject: [PATCH net-next v2 11/15] net: stmmac: add helper to get hardware
 transmit descriptor
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w0czA-0000000CzGq-04op@rmk-PC.armlinux.org.uk>
Date: Thu, 12 Mar 2026 10:09:44 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_031013_844508_EB53A6E4 
X-CRM114-Status: GOOD (  15.00  )
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

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 87 ++++++-------------
 1 file changed, 25 insertions(+), 62 deletions(-)

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


