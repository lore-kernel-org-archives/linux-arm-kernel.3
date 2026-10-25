Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E73C606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 10:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KjtJy+T4;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=F1QJw7Q2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TSv0+yZLYYcP5njQ5f+/DYiv7trYAEQiae7vUcOdvq8=; b=KjtJy+T4P2eujf
	TVpXshj/tOdgbBX5Qjcks9in60qhTOVP4Lt2LEtGjtLw9k+oluk+WfMj67sB2a6F/fO85+CxY3a16
	m+iWh6LHH9trEtNbsepmSvU2VyfKPiAxsdGsFb4mbQ6qOp7PijJX9pGYUppCSJmZMCehpWiMZtytg
	TUgri6S3kd3WFNtKxlGlYHSEcRiC0GrHUHjxOkpVjGyr+rEATPHKQ24T1WJHAHa/nA2KaZL8G/qJY
	soY4LRhTXt/NWeU9jCwCSvDyjqTjaxgMFgbr4K/0nUgeKCensWpI4BFQ/TgNIq2bmSPTMGqKgobHb
	Me89Y7FysVf78L2mBfWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKv8p-00000000wr5-1MaQ;
	Sun, 25 Oct 2026 10:07:51 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKv8h-00000000wom-3cYy
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 10:07:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=TS
	v0+yZLYYcP5njQ5f+/DYiv7trYAEQiae7vUcOdvq8=; b=F1QJw7Q2NRhuB6V6fi
	/O0b11uaOVs3PLJ2d8MO1FfjWl/+15WntD5JcTjXuyOqTyhQfxzdbfu4iJm3x1EO
	yimynlaJmPw5UpestznrwogkOJSruyt05u7H7l2gD/QfrzDeEjuKkO7M2L1JnUBj
	M4KZuh3C4XzqBeMZ3fYrQ7XYw=
Received: from 4CV529F122.company.local (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3_26u1N1q7fwbCQ--.3918S4;
	Sun, 25 Oct 2026 18:07:04 +0800 (CST)
From: Ding Hui <dinghui1111@163.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org (open list:STMMAC ETHERNET DRIVER),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: dinghui@lixiang.com,
	xiasanbo@lixiang.com,
	yangchen11@lixiang.com,
	liuxuanjun@lixiang.com,
	zhoujing3@lixiang.com,
	fujiahui@lixiang.com
Subject: [PATCH net v5 2/2] net: stmmac: restore RX descriptor buffer addresses on resume
Date: Sun, 25 Oct 2026 18:06:36 +0800
Message-Id: <20261025100636.613670-3-dinghui1111@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261025100636.613670-1-dinghui1111@163.com>
References: <20261025100636.613670-1-dinghui1111@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3_26u1N1q7fwbCQ--.3918S4
X-Coremail-Antispam: 1Uf129KBjvJXoWfJw1Uur4rtFWDXr15Zr1rCrg_yoWDAF4Dpa
	1akw4jk3ykJr13Gw4DJr4kZa4aya45tFW8Wa1xWw4a9F4akryS9F1fXFy5ZFy7Jryqvr4S
	yF4UA3Z5CF4DXrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07bjpBfUUUUU=
X-CM-SenderInfo: pglqwx1xlriiqr6rljoofrz/xtbC8wh5pWrd1Mg0sgAA3K
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_030744_281541_66FDDEFC 
X-CRM114-Status: GOOD (  21.30  )
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ding Hui <dinghui@lixiang.com>

stmmac_suspend() disables NAPI before stopping RX DMA. Frames received
in that interval can leave completed descriptors that have not been
refilled. On GMAC4 and XGMAC, hardware writeback overwrites the descriptor
buffer addresses with status and timestamp data.

stmmac_resume() calls stmmac_clear_descriptors(), which returns those
descriptors to DMA without restoring their buffer addresses. Restarting
RX DMA can therefore cause a fatal bus error.

Restore the addresses from the attached buffers before restarting DMA.
Factor buffer allocation and address programming into helpers shared
with the normal and zero-copy refill paths. Allocate missing primary
and secondary pages with GFP_KERNEL, including a missing secondary page
when the primary page was allocated before a refill failure. Abort
resume if a required page cannot be allocated.

For XSK queues, try to allocate missing buffers but leave unavailable
slots CPU-owned so an empty fill ring does not prevent TX-only use.
DMA may stop at such a slot with an RBU event; it must not receive an
invalid buffer address.

Rebuild chain pointers that timestamp writeback may have overwritten.
Publish OWN only after all address fields have been restored, since
programming the secondary address overwrites OWN on GMAC4 and XGMAC.
Keep existing buffers and their DMA mappings rather than recycling them
as the earlier, reverted resume fix did.

Fixes: f748be531d70 ("stmmac: support new GMAC4")
Signed-off-by: Ding Hui <dinghui@lixiang.com>
---
Changes in v5:
- Target net and add a Fixes tag for GMAC4 support.
- Share buffer preparation helpers with both RX refill paths.
- Allocate missing secondary pages independently of primary pages.
- Condense the kernel-doc and clarify CPU-owned XSK slots/RBU handling.
- Rebase onto net/main and retain SerDes cleanup on resume failure.

The allocation-flags fix is now patch 1/2 of this series.

 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 190 +++++++++++++-----
 1 file changed, 138 insertions(+), 52 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index f5ae12208e85..e56f5d044fc8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1670,6 +1670,40 @@ static bool stmmac_rx_check_buf2_cap(struct stmmac_priv *priv)
 	return priv->hw->desc && priv->hw->desc->set_sec_addr;
 }
 
+static int stmmac_prepare_rx_buffer(struct stmmac_priv *priv,
+				    struct stmmac_rx_queue *rx_q,
+				    struct stmmac_rx_buffer *buf,
+				    struct dma_desc *p, gfp_t flags)
+{
+	gfp_t gfp = flags;
+
+	if (priv->dma_cap.host_dma_width <= 32)
+		gfp |= GFP_DMA32;
+
+	if (!buf->page) {
+		buf->page = page_pool_alloc_pages(rx_q->page_pool, gfp);
+		if (!buf->page)
+			return -ENOMEM;
+		buf->page_offset = stmmac_rx_offset(priv);
+	}
+
+	if (stmmac_rx_check_buf2_cap(priv) && !buf->sec_page) {
+		buf->sec_page = page_pool_alloc_pages(rx_q->page_pool, gfp);
+		if (!buf->sec_page)
+			return -ENOMEM;
+
+		buf->sec_addr = page_pool_get_dma_addr(buf->sec_page);
+	}
+
+	buf->addr = page_pool_get_dma_addr(buf->page) + buf->page_offset;
+
+	stmmac_set_desc_addr(priv, p, buf->addr);
+	stmmac_set_desc_sec_addr(priv, p, buf->sec_addr,
+				 stmmac_rx_check_buf2_cap(priv));
+
+	return 0;
+}
+
 /**
  * stmmac_init_rx_buffers - init the RX descriptor buffer.
  * @priv: driver private structure
@@ -1688,32 +1722,98 @@ static int stmmac_init_rx_buffers(struct stmmac_priv *priv,
 {
 	struct stmmac_rx_queue *rx_q = &dma_conf->rx_queue[queue];
 	struct stmmac_rx_buffer *buf = &rx_q->buf_pool[i];
-	gfp_t gfp = flags;
+	int ret;
 
-	if (priv->dma_cap.host_dma_width <= 32)
-		gfp |= GFP_DMA32;
+	ret = stmmac_prepare_rx_buffer(priv, rx_q, buf, p, flags);
+	if (ret)
+		return ret;
 
-	if (!buf->page) {
-		buf->page = page_pool_alloc_pages(rx_q->page_pool, gfp);
-		if (!buf->page)
+	if (dma_conf->dma_buf_sz == BUF_SIZE_16KiB)
+		stmmac_init_desc3(priv, p);
+
+	return 0;
+}
+
+static int stmmac_prepare_rx_buffer_zc(struct stmmac_priv *priv,
+				       struct stmmac_rx_queue *rx_q,
+				       struct stmmac_rx_buffer *buf,
+				       struct dma_desc *p)
+{
+	if (!buf->xdp) {
+		buf->xdp = xsk_buff_alloc(rx_q->xsk_pool);
+		if (!buf->xdp)
 			return -ENOMEM;
-		buf->page_offset = stmmac_rx_offset(priv);
 	}
 
-	if (stmmac_rx_check_buf2_cap(priv) && !buf->sec_page) {
-		buf->sec_page = page_pool_alloc_pages(rx_q->page_pool, gfp);
-		if (!buf->sec_page)
-			return -ENOMEM;
+	stmmac_set_desc_addr(priv, p, xsk_buff_xdp_get_dma(buf->xdp));
+	stmmac_set_desc_sec_addr(priv, p, 0, false);
 
-		buf->sec_addr = page_pool_get_dma_addr(buf->sec_page);
-		stmmac_set_desc_sec_addr(priv, p, buf->sec_addr, true);
+	return 0;
+}
+
+/**
+ * stmmac_reinit_rx_descriptors - restore RX descriptors before restarting DMA
+ * @priv: driver private structure
+ * @dma_conf: DMA configuration
+ * @queue: RX queue index
+ *
+ * Restore buffer addresses overwritten by hardware writeback after
+ * stmmac_clear_descriptors(). Reuse attached buffers and allocate missing
+ * primary and secondary pages with GFP_KERNEL before restarting DMA.
+ *
+ * For XSK queues, try to allocate missing buffers and leave unavailable
+ * descriptors CPU-owned. Rebuild chain pointers when needed, then return
+ * valid descriptors to DMA after restoring all address fields.
+ *
+ * Return: 0 on success, or -ENOMEM if a required page cannot be allocated.
+ */
+static int stmmac_reinit_rx_descriptors(struct stmmac_priv *priv,
+					struct stmmac_dma_conf *dma_conf,
+					u32 queue)
+{
+	struct stmmac_rx_queue *rx_q = &dma_conf->rx_queue[queue];
+	struct stmmac_rx_buffer *buf;
+	struct dma_desc *p;
+	int i, ret;
+
+	for (i = 0; i < dma_conf->dma_rx_size; i++) {
+		buf = &rx_q->buf_pool[i];
+		p = stmmac_get_rx_desc(priv, rx_q, i);
+
+		if (rx_q->xsk_pool) {
+			ret = stmmac_prepare_rx_buffer_zc(priv, rx_q, buf, p);
+			if (ret) {
+				/* An empty fill ring must not prevent TX-only use. */
+				stmmac_clear_desc(priv, p);
+				continue;
+			}
+		} else {
+			ret = stmmac_init_rx_buffers(priv, dma_conf, p, i,
+						     GFP_KERNEL, queue);
+			if (ret)
+				return ret;
+		}
 	}
 
-	buf->addr = page_pool_get_dma_addr(buf->page) + buf->page_offset;
+	/* Hardware timestamp writeback may have overwritten chain pointers. */
+	if (priv->descriptor_mode == STMMAC_CHAIN_MODE) {
+		void *des = priv->extend_desc ? (void *)rx_q->dma_erx :
+					      (void *)rx_q->dma_rx;
 
-	stmmac_set_desc_addr(priv, p, buf->addr);
-	if (dma_conf->dma_buf_sz == BUF_SIZE_16KiB)
-		stmmac_init_desc3(priv, p);
+		stmmac_mode_init(priv, des, rx_q->dma_rx_phy,
+				 dma_conf->dma_rx_size, priv->extend_desc);
+	}
+
+	/* GMAC4/XGMAC secondary address writes overwrite the OWN bit. */
+	dma_wmb();
+	for (i = 0; i < dma_conf->dma_rx_size; i++) {
+		buf = &rx_q->buf_pool[i];
+		if (rx_q->xsk_pool && !buf->xdp)
+			continue;
+
+		p = stmmac_get_rx_desc(priv, rx_q, i);
+		stmmac_set_rx_owner(priv, p, false);
+	}
 
 	return 0;
 }
@@ -5145,10 +5245,6 @@ static inline void stmmac_rx_refill(struct stmmac_priv *priv, u32 queue)
 	struct stmmac_rx_queue *rx_q = &priv->dma_conf.rx_queue[queue];
 	int dirty = stmmac_rx_dirty(priv, queue);
 	unsigned int entry = rx_q->dirty_rx;
-	gfp_t gfp = (GFP_ATOMIC | __GFP_NOWARN);
-
-	if (priv->dma_cap.host_dma_width <= 32)
-		gfp |= GFP_DMA32;
 
 	while (dirty-- > 0) {
 		struct stmmac_rx_buffer *buf = &rx_q->buf_pool[entry];
@@ -5157,25 +5253,9 @@ static inline void stmmac_rx_refill(struct stmmac_priv *priv, u32 queue)
 
 		p = stmmac_get_rx_desc(priv, rx_q, entry);
 
-		if (!buf->page) {
-			buf->page = page_pool_alloc_pages(rx_q->page_pool, gfp);
-			if (!buf->page)
-				break;
-		}
-
-		if (stmmac_rx_check_buf2_cap(priv) && !buf->sec_page) {
-			buf->sec_page = page_pool_alloc_pages(rx_q->page_pool, gfp);
-			if (!buf->sec_page)
-				break;
-
-			buf->sec_addr = page_pool_get_dma_addr(buf->sec_page);
-		}
-
-		buf->addr = page_pool_get_dma_addr(buf->page) + buf->page_offset;
-
-		stmmac_set_desc_addr(priv, p, buf->addr);
-		stmmac_set_desc_sec_addr(priv, p, buf->sec_addr,
-					 stmmac_rx_check_buf2_cap(priv));
+		if (stmmac_prepare_rx_buffer(priv, rx_q, buf, p,
+					     GFP_ATOMIC | __GFP_NOWARN))
+			break;
 		stmmac_refill_desc3(priv, rx_q, p);
 
 		use_rx_wd = !stmmac_rx_need_ic(priv, rx_q, queue);
@@ -5578,22 +5658,15 @@ static bool stmmac_rx_refill_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
 
 	while (budget-- > 0 && entry != rx_q->cur_rx) {
 		struct stmmac_rx_buffer *buf = &rx_q->buf_pool[entry];
-		dma_addr_t dma_addr;
+		struct dma_desc *p = stmmac_get_rx_desc(priv, rx_q, entry);
 		bool use_rx_wd;
 
-		if (!buf->xdp) {
-			buf->xdp = xsk_buff_alloc(rx_q->xsk_pool);
-			if (!buf->xdp) {
-				ret = false;
-				break;
-			}
+		if (stmmac_prepare_rx_buffer_zc(priv, rx_q, buf, p)) {
+			ret = false;
+			break;
 		}
 
-		rx_desc = stmmac_get_rx_desc(priv, rx_q, entry);
-
-		dma_addr = xsk_buff_xdp_get_dma(buf->xdp);
-		stmmac_set_desc_addr(priv, rx_desc, dma_addr);
-		stmmac_set_desc_sec_addr(priv, rx_desc, 0, false);
+		rx_desc = p;
 		stmmac_refill_desc3(priv, rx_q, rx_desc);
 
 		use_rx_wd = !stmmac_rx_need_ic(priv, rx_q, queue);
@@ -8454,6 +8527,7 @@ int stmmac_resume(struct device *dev)
 {
 	struct net_device *ndev = dev_get_drvdata(dev);
 	struct stmmac_priv *priv = netdev_priv(ndev);
+	u32 queue;
 	int ret;
 
 	if (priv->plat->resume) {
@@ -8503,6 +8577,18 @@ int stmmac_resume(struct device *dev)
 	stmmac_free_tx_skbufs(priv);
 	stmmac_clear_descriptors(priv, &priv->dma_conf);
 
+	for (queue = 0; queue < priv->plat->rx_queues_to_use; queue++) {
+		ret = stmmac_reinit_rx_descriptors(priv, &priv->dma_conf, queue);
+		if (ret) {
+			netdev_err(ndev, "Failed to restore RX queue %u: %d\n",
+				   queue, ret);
+			stmmac_legacy_serdes_power_down(priv);
+			mutex_unlock(&priv->lock);
+			rtnl_unlock();
+			return ret;
+		}
+	}
+
 	ret = stmmac_hw_setup(ndev);
 	if (ret < 0) {
 		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
-- 
2.34.1


