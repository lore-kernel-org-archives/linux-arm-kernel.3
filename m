Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6FE1FED2FE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 10:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sjmjh9LqgSfqY7476rGy7BOUo6MdY+yHA2slM9LQGLY=; b=i2Z74ubL9d2gQqvEifYnjlezOG
	ShjP54zNrXPtFXYWIUbURjU34UuT2HLouif9KG+8IUU6D7QaDIVRUvSKVcQ3CzyydddU+0ymNF9Aa
	Us48eSh274TCpuJe6jotS2TqgeVKf06JfNai79xtSlpg8aI0LFGFcz7cfTIKCU2imy7mFdX68rntS
	25pQXVRSaJtYSQBUi/yX3yQyQReh7Ls+BpLxTN/sfv5DOwTlE+P9nSTArzzVmuVAM/w/QZUkImhJh
	qsZwA+r3S4uwf3+R55xCltb5HGnCVn09X3G9ghczEXuypz6Fj1zBp8rIUQsmteNSEZLqaxYV8tTfT
	fswTcE6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0cyr-0000000DpEV-35fP;
	Thu, 12 Mar 2026 10:09:25 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0cyo-0000000DpBj-44ka
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 10:09:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sjmjh9LqgSfqY7476rGy7BOUo6MdY+yHA2slM9LQGLY=; b=k0Elcg92Hb9NPX8KXDnVZjVRJV
	THC2ab6FYjf9+dASBldtwZ/nUxEtYKBCDEgQ1T8VGoRo7AFx1s7fUuPZ/NxbcCK+WUwc/WCuu9c+u
	dE2EkiZG6NEbeS3HZ+2EG84fGPHRRSrYwQw7mVmPTSlQ2v7d11z1A7AH6T6GehfuY+JjaDGpT4R/z
	D7wk2uuR4N3wvODuIxcrEbbc66Vpyd0okRa3Yl+LgjRvyxylbYmt+f465h7bmExDaFUZz49keGFEi
	CyZxDo+2IQ2A6OEOCZVkzu4X0Fswf1BqDvHunyDpVbBfJQt8IZBron3RbMEhmyn0UWqorV4uSdATa
	YY/bbyOw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51220 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w0cyb-000000007Xv-0rxw;
	Thu, 12 Mar 2026 10:09:09 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w0cya-0000000CzGA-0dpn;
	Thu, 12 Mar 2026 10:09:08 +0000
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
Subject: [PATCH net-next v2 04/15] net: stmmac: add helper to get hardware
 receive descriptor
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w0cya-0000000CzGA-0dpn@rmk-PC.armlinux.org.uk>
Date: Thu, 12 Mar 2026 10:09:08 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_030923_190022_04BC0252 
X-CRM114-Status: GOOD (  14.41  )
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

Provide a helper to get a hardware receive descriptor that takes
account of whether extended format is being used, but returning the
base struct dma_desc pointer. This avoids multiple instances where
this is open coded.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 76 +++++++------------
 1 file changed, 26 insertions(+), 50 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 765b168df50d..a3dfd3501604 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -362,6 +362,16 @@ static inline u32 stmmac_tx_avail(struct stmmac_priv *priv, u32 queue)
 			  priv->dma_conf.dma_tx_size);
 }
 
+static struct dma_desc *stmmac_get_rx_desc(struct stmmac_priv *priv,
+					   struct stmmac_rx_queue *rx_q,
+					   unsigned int index)
+{
+	if (priv->extend_desc)
+		return &rx_q->dma_erx[index].basic;
+	else
+		return &rx_q->dma_rx[index];
+}
+
 /**
  * stmmac_rx_dirty - Get RX queue dirty
  * @priv: driver private structure
@@ -1421,13 +1431,11 @@ static void stmmac_display_rx_rings(struct stmmac_priv *priv,
 
 		pr_info("\tRX Queue %u rings\n", queue);
 
-		if (priv->extend_desc) {
-			head_rx = (void *)rx_q->dma_erx;
+		head_rx = stmmac_get_rx_desc(priv, rx_q, 0);
+		if (priv->extend_desc)
 			desc_size = sizeof(struct dma_extended_desc);
-		} else {
-			head_rx = (void *)rx_q->dma_rx;
+		else
 			desc_size = sizeof(struct dma_desc);
-		}
 
 		/* Display RX ring */
 		stmmac_display_ring(priv, head_rx, dma_conf->dma_rx_size, true,
@@ -1519,10 +1527,7 @@ static void stmmac_clear_rx_descriptors(struct stmmac_priv *priv,
 
 	/* Clear the RX descriptors */
 	for (i = 0; i < dma_conf->dma_rx_size; i++) {
-		if (priv->extend_desc)
-			desc = &rx_q->dma_erx[i].basic;
-		else
-			desc = &rx_q->dma_rx[i];
+		desc = stmmac_get_rx_desc(priv, rx_q, i);
 
 		stmmac_init_rx_desc(priv, desc, priv->use_riwt, priv->mode,
 				    (i == dma_conf->dma_rx_size - 1),
@@ -1731,10 +1736,7 @@ static int stmmac_alloc_rx_buffers(struct stmmac_priv *priv,
 		struct dma_desc *p;
 		int ret;
 
-		if (priv->extend_desc)
-			p = &((rx_q->dma_erx + i)->basic);
-		else
-			p = rx_q->dma_rx + i;
+		p = stmmac_get_rx_desc(priv, rx_q, i);
 
 		ret = stmmac_init_rx_buffers(priv, dma_conf, p, i, flags,
 					     queue);
@@ -1789,10 +1791,7 @@ static int stmmac_alloc_rx_buffers_zc(struct stmmac_priv *priv,
 		dma_addr_t dma_addr;
 		struct dma_desc *p;
 
-		if (priv->extend_desc)
-			p = (struct dma_desc *)(rx_q->dma_erx + i);
-		else
-			p = rx_q->dma_rx + i;
+		p = stmmac_get_rx_desc(priv, rx_q, i);
 
 		buf = &rx_q->buf_pool[i];
 
@@ -4954,10 +4953,7 @@ static inline void stmmac_rx_refill(struct stmmac_priv *priv, u32 queue)
 		struct dma_desc *p;
 		bool use_rx_wd;
 
-		if (priv->extend_desc)
-			p = (struct dma_desc *)(rx_q->dma_erx + entry);
-		else
-			p = rx_q->dma_rx + entry;
+		p = stmmac_get_rx_desc(priv, rx_q, entry);
 
 		if (!buf->page) {
 			buf->page = page_pool_alloc_pages(rx_q->page_pool, gfp);
@@ -5355,10 +5351,7 @@ static bool stmmac_rx_refill_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
 			}
 		}
 
-		if (priv->extend_desc)
-			rx_desc = (struct dma_desc *)(rx_q->dma_erx + entry);
-		else
-			rx_desc = rx_q->dma_rx + entry;
+		rx_desc = stmmac_get_rx_desc(priv, rx_q, entry);
 
 		dma_addr = xsk_buff_xdp_get_dma(buf->xdp);
 		stmmac_set_desc_addr(priv, rx_desc, dma_addr);
@@ -5416,14 +5409,12 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 	int status = 0;
 
 	if (netif_msg_rx_status(priv)) {
-		void *rx_head;
+		void *rx_head = stmmac_get_rx_desc(priv, rx_q, 0);
 
 		netdev_dbg(priv->dev, "%s: descriptor ring:\n", __func__);
 		if (priv->extend_desc) {
-			rx_head = (void *)rx_q->dma_erx;
 			desc_size = sizeof(struct dma_extended_desc);
 		} else {
-			rx_head = (void *)rx_q->dma_rx;
 			desc_size = sizeof(struct dma_desc);
 		}
 
@@ -5461,10 +5452,7 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 			dirty = 0;
 		}
 
-		if (priv->extend_desc)
-			p = (struct dma_desc *)(rx_q->dma_erx + entry);
-		else
-			p = rx_q->dma_rx + entry;
+		p = stmmac_get_rx_desc(priv, rx_q, entry);
 
 		/* read the status of the incoming frame */
 		status = stmmac_rx_status(priv, &priv->xstats, p);
@@ -5477,10 +5465,7 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 						priv->dma_conf.dma_rx_size);
 		next_entry = rx_q->cur_rx;
 
-		if (priv->extend_desc)
-			np = (struct dma_desc *)(rx_q->dma_erx + next_entry);
-		else
-			np = rx_q->dma_rx + next_entry;
+		np = stmmac_get_rx_desc(priv, rx_q, next_entry);
 
 		prefetch(np);
 
@@ -5616,16 +5601,13 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 	limit = min(priv->dma_conf.dma_rx_size - 1, (unsigned int)limit);
 
 	if (netif_msg_rx_status(priv)) {
-		void *rx_head;
+		void *rx_head = stmmac_get_rx_desc(priv, rx_q, 0);
 
 		netdev_dbg(priv->dev, "%s: descriptor ring:\n", __func__);
-		if (priv->extend_desc) {
-			rx_head = (void *)rx_q->dma_erx;
+		if (priv->extend_desc)
 			desc_size = sizeof(struct dma_extended_desc);
-		} else {
-			rx_head = (void *)rx_q->dma_rx;
+		else
 			desc_size = sizeof(struct dma_desc);
-		}
 
 		stmmac_display_ring(priv, rx_head, priv->dma_conf.dma_rx_size, true,
 				    rx_q->dma_rx_phy, desc_size);
@@ -5658,10 +5640,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		entry = next_entry;
 		buf = &rx_q->buf_pool[entry];
 
-		if (priv->extend_desc)
-			p = (struct dma_desc *)(rx_q->dma_erx + entry);
-		else
-			p = rx_q->dma_rx + entry;
+		p = stmmac_get_rx_desc(priv, rx_q, entry);
 
 		/* read the status of the incoming frame */
 		status = stmmac_rx_status(priv, &priv->xstats, p);
@@ -5673,10 +5652,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 						priv->dma_conf.dma_rx_size);
 		next_entry = rx_q->cur_rx;
 
-		if (priv->extend_desc)
-			np = (struct dma_desc *)(rx_q->dma_erx + next_entry);
-		else
-			np = rx_q->dma_rx + next_entry;
+		np = stmmac_get_rx_desc(priv, rx_q, next_entry);
 
 		prefetch(np);
 
-- 
2.47.3


