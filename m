Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2AB1CD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 02:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lw4/4FT2rvt0MC5tdmiJL7oUXfl2ms2f6Q38CmkzsO0=; b=0aUPpvweWTqC4lONed7saaDCOF
	0z9MkiclYpjZiLCR3ttUYi0YVDX0SXS3cO9nJOkZ4iIdA6tj0dgTWdHbEudgGOT1RnvZHkr2+fVsL
	Hl+0qCwTq6BJHwS7unDBhFUDLe4AMUFoHDcl7JuM0JMAybijjIpRH7NmrIRnbWL/x5G4Hpt27eVhE
	zt4giwL3Ky/AvNzGdwVmcW5/XkCTOmcJEPsLiIyI/AOeG1hWiVoMlnAPiMya4UC9LQ5hJAAFL+7P/
	6UWOnidNIhDqC7XAu8mHzo/63cRmzFzFwv2/D6dh4vAxqt4kZ4MZgl/vuL/1iHnyWkk7c4qegM283
	xdZ1BS8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRhWq-00000000rP3-1AeV;
	Tue, 26 May 2026 02:28:24 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRhWm-00000000rNm-0Io6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 02:28:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=lw
	4/4FT2rvt0MC5tdmiJL7oUXfl2ms2f6Q38CmkzsO0=; b=jxnhjdmJVIWAml/kE5
	u5qCxxbg0JHWtE27q94QEN9ZgRfopHORr6sfGxYz1NZj7FaDA1/9eB+xaknOY9Ie
	BZDnTh7i1h1pU7pbh58mw8+I8Nu2niWqaT6BYmbdYe4TT3890Ei02po91Cb0MizK
	EsP3WPZNPJtsPzguS+4p3VVOw=
Received: from PC-YLX4CAEK.company.local (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wAX0JUKBRVqTduMDQ--.20654S2;
	Tue, 26 May 2026 10:27:23 +0800 (CST)
From: Ding Hui <dinghui1111@163.com>
To: andrew@lunn.ch,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Ding Hui <dinghui@lixiang.com>,
	netdev@vger.kernel.org (open list:STMMAC ETHERNET DRIVER),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: xiasanbo@lixiang.com,
	yangchen11@lixiang.com,
	liuxuanjun@lixiang.com
Subject: [PATCH v2] net: stmmac: fix fatal bus error on resume by reinitializing RX buffers
Date: Tue, 26 May 2026 10:26:17 +0800
Message-Id: <20260526022620.501229-1-dinghui1111@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAX0JUKBRVqTduMDQ--.20654S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3AF4UCFWfAr45uw1fKFyUWrg_yoWxAryrpa
	yayw4DKr1kJrs3Gw4rJw48ZFy5Aan0yFW3Ww4xXw4a9a1a9r9avF1ayrWYya4UGr4kZr92
	yr4DA39rCF1DAFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jtiSdUUUUU=
X-Originating-IP: [220.248.55.69]
X-CM-SenderInfo: pglqwx1xlriiqr6rljoofrz/xtbC8wwkUGoVBQw11QAA3d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_192820_689634_D6D60B51 
X-CRM114-Status: GOOD (  23.52  )
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

From: Ding Hui <dinghui@lixiang.com>

On suspend, stmmac_suspend() calls stmmac_disable_all_queues() which
stops the RX NAPI, but the RX DMA engine may still be running for a
short window before stmmac_stop_all_dma() takes effect. During that
window the hardware can write incoming frames into the buffers pointed
to by the RX descriptors and write back the descriptors (clearing the
OWN bit and overwriting RDES0/1/2 with status/timestamp data). Because
NAPI is already disabled, the driver never refills these descriptors,
so the RX ring is left in a "consumed but not refilled" state with
stale content in the descriptor buffer-address fields.

On resume, stmmac_clear_descriptors() only re-arms the OWN bit and
does not repopulate the RX buffer address fields. When the DMA is
restarted it dereferences these stale addresses and triggers a fatal
bus error.

Fix this without any allocation by introducing
stmmac_reinit_rx_descriptors(), called from stmmac_resume() before
stmmac_clear_descriptors(). The helper iterates every RX descriptor
slot and re-programs its buffer address fields:

 - For normal (page_pool) queues: restore RDES0/1 from buf->addr and
   RDES2 from buf->sec_addr. The DMA mapping has remained valid across
   suspend/resume because no pages were freed.

 - For AF_XDP zero-copy queues: restore the DMA address from
   xsk_buff_xdp_get_dma(buf->xdp). Slots with buf->xdp == NULL (TX-only
   XSK socket) are skipped to avoid a NULL-pointer dereference.

 - For chain mode: call stmmac_mode_init() to rebuild the des3 next-
   descriptor pointer chain, which hardware may have overwritten with
   a PTP timestamp value (as noted in chain_mode.c:refill_desc3()).

This approach keeps all RX buffers alive across the PM transition and
avoids any allocation in the resume path, eliminating the OOM risk
raised against the previous approach of freeing and re-allocating
buffers.

Signed-off-by: Ding Hui <dinghui@lixiang.com>
---

Changes in v2:
- Introducing stmmac_reinit_rx_descriptors() to reinitializing rx
  buffers without any allocation.
- Modify commit log.
- Link to v1:
  https://lore.kernel.org/netdev/20260515053856.2310369-1-dinghui1111@163.com/
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 90 +++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3591755ea30b..0dc27d8c66a0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1642,6 +1642,79 @@ static void stmmac_clear_descriptors(struct stmmac_priv *priv,
 		stmmac_clear_tx_descriptors(priv, dma_conf, queue);
 }
 
+/**
+ * stmmac_reinit_rx_descriptors - re-program RX descriptors from existing
+ *				   buffers (allocation-free)
+ * @priv: driver private structure
+ * @dma_conf: structure holding the dma data
+ * @queue: RX queue index
+ *
+ * Description: walk rx_q->buf_pool[] and re-program every RX descriptor's
+ * buffer-address fields from the buffers that are already attached to the
+ * queue. This is intended for the resume path: between suspend and resume
+ * the descriptor buffer-address fields may have been overwritten by HW
+ * writeback (RDESx are reused for status/length on completion), but the
+ * underlying RX buffers (page_pool pages or XSK frames) are still alive
+ * in buf_pool[]. By re-using them we avoid any allocation on resume,
+ * which is unsafe under memory pressure.
+ *
+ * This helper is expected to be called only in stmmac_resume.
+ */
+static void stmmac_reinit_rx_descriptors(struct stmmac_priv *priv,
+					 struct stmmac_dma_conf *dma_conf,
+					 u32 queue)
+{
+	struct stmmac_rx_queue *rx_q = &dma_conf->rx_queue[queue];
+	int i;
+
+	for (i = 0; i < dma_conf->dma_rx_size; i++) {
+		struct stmmac_rx_buffer *buf = &rx_q->buf_pool[i];
+		struct dma_desc *p = stmmac_get_rx_desc(priv, rx_q, i);
+
+		if (rx_q->xsk_pool) {
+			dma_addr_t dma_addr;
+
+			/* The XSK pool may not be fully populated (e.g.
+			 * xdpsock TX-only); skip empty slots.
+			 */
+			if (!buf->xdp)
+				continue;
+
+			dma_addr = xsk_buff_xdp_get_dma(buf->xdp);
+			stmmac_set_desc_addr(priv, p, dma_addr);
+			stmmac_set_desc_sec_addr(priv, p, 0, false);
+		} else {
+			/* Theoretically unreachable: napi_disable() in
+			 * stmmac_suspend() ensures all initialized slots
+			 * have a valid page before we get here.
+			 * Defensive check only.
+			 */
+			if (!buf->page)
+				continue;
+
+			stmmac_set_desc_addr(priv, p, buf->addr);
+			stmmac_set_desc_sec_addr(priv, p, buf->sec_addr,
+						 priv->sph_active &&
+						 buf->sec_page);
+
+			if (dma_conf->dma_buf_sz == BUF_SIZE_16KiB)
+				stmmac_init_desc3(priv, p);
+		}
+	}
+
+	/* Chain mode: re-link descriptor 'next' pointers. This is
+	 * allocation-free; it just rewrites the per-descriptor next
+	 * field which may have been clobbered by HW writeback.
+	 */
+	if (priv->descriptor_mode == STMMAC_CHAIN_MODE) {
+		void *des = priv->extend_desc ? (void *)rx_q->dma_erx
+					      : (void *)rx_q->dma_rx;
+
+		stmmac_mode_init(priv, des, rx_q->dma_rx_phy,
+				 dma_conf->dma_rx_size, priv->extend_desc);
+	}
+}
+
 /**
  * stmmac_init_rx_buffers - init the RX descriptor buffer.
  * @priv: driver private structure
@@ -8272,6 +8345,7 @@ int stmmac_resume(struct device *dev)
 {
 	struct net_device *ndev = dev_get_drvdata(dev);
 	struct stmmac_priv *priv = netdev_priv(ndev);
+	u32 queue;
 	int ret;
 
 	if (priv->plat->resume) {
@@ -8316,6 +8390,22 @@ int stmmac_resume(struct device *dev)
 
 	mutex_lock(&priv->lock);
 
+	/* Re-program the RX descriptors from the buffers that are still
+	 * attached to priv->dma_conf.rx_queue[].buf_pool[]. The buffer-
+	 * address fields of the RX descriptors may have been overwritten
+	 * by HW writeback while the DMA was being stopped on suspend
+	 * (RDESx are reused for status/length on completion), so they
+	 * must be repopulated before the DMA is restarted in
+	 * stmmac_hw_setup() below; otherwise the controller would
+	 * dereference stale addresses and trigger a fatal bus error.
+	 *
+	 * This path is allocation-free: it relies entirely on the RX
+	 * buffers preserved across suspend, which makes the resume path
+	 * safe under memory pressure.
+	 */
+	for (queue = 0; queue < priv->plat->rx_queues_to_use; queue++)
+		stmmac_reinit_rx_descriptors(priv, &priv->dma_conf, queue);
+
 	stmmac_reset_queues_param(priv);
 
 	stmmac_free_tx_skbufs(priv);
-- 
2.34.1


