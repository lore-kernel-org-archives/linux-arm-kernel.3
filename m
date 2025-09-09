Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9EF5CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 15:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ST5qY9dIT9eHtJtl5uDk85VI0/Q6uzwDVRGo+0F+Zo=; b=LNO/LwXc2K6bmU7IBCViZ2Hewf
	MYKf6W58ZOvz8+7J4Wl9St5fQPtYdZVXQxamV0VVS4zMtbIBmrTvN7eosrFX2U/XCYSK7ZkscCZA3
	a9kKfJxfj/QLQotszpcR01g0TqLfoXli0Usz3XpwthDblMt3N4SoWZTBF650av9k0FjAATM1KNoeK
	MyrCeWNKdtb8BtDxsLxcqyTVC/2hRjte+eJsV4z1r30zVyv2uDQgUGQdILsIV/t1i2paRFfeQuZOF
	tgwzTgLdCya5rBbwdslApWTG1yUA58vvu1z2edLpMiVWPjDBmdnoWvFoKvSuS5k3zQqyLWYggMAGV
	AFuQXaNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0Sa-00000008Azs-1gig;
	Tue, 09 Sep 2025 15:40:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuvL-000000066GS-3k5G;
	Tue, 09 Sep 2025 09:46:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A29D541963;
	Tue,  9 Sep 2025 09:46:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D9D3C4CEF4;
	Tue,  9 Sep 2025 09:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757411163;
	bh=VefrPpa7X9Fg9YWc2H408hwgRf9NxieAdeA1oV4lZc8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CoJ9wCt9DHP4TF5e8QPyn2dadyxkj4duoXqw+xpixuq25URqG6fimfSH4UmIuSg/h
	 z8NmPnv7LKBHkgM5mI20UZ+yHYNyACgLt/g4JcPQ7G5OgBzElbTdHnsyr8ScmDQBnq
	 Ul0+dyJ4skc3gGfnT3Um6Hx1ZXyW5kcJpqj4rUHSAYNA/6NA+g8CiHe3TXN5IRRxX9
	 AVticwSfPGjtVHPsPq7iW41s+UY9x39OOo2mfyUHzjtwY/e0F3aO0tUiF+pHug+QyQ
	 UCAKQMqQhFMD644eul4Z1hfWDZsCiJb5YlLP6z2kO75cXezuy+2dWIjYv5g7l7RZfF
	 hQPsv5cLajgEA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 09 Sep 2025 11:45:23 +0200
Subject: [PATCH mt76 v5 15/16] wifi: mt76: Add mt76_dma_get_rxdmad_c_buf
 utility routione
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-mt7996-rro-rework-v5-15-7d66f6eb7795@kernel.org>
References: <20250909-mt7996-rro-rework-v5-0-7d66f6eb7795@kernel.org>
In-Reply-To: <20250909-mt7996-rro-rework-v5-0-7d66f6eb7795@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Bo Jiao <Bo.Jiao@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Rex Lu <rex.lu@mediatek.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_024604_102895_FA5E4223 
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

Introduce mt76_dma_get_rxdmad_c_buf routine to process packets received
by HW-RRO v3.1 module.
This is a preliminary patch to introduce SW path for HW-RRO v3.1 module
available on MT7992 chipset.

Co-developed-by: Rex Lu <rex.lu@mediatek.com>
Signed-off-by: Rex Lu <rex.lu@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/dma.c  | 58 +++++++++++++++++++++++++++++--
 drivers/net/wireless/mediatek/mt76/dma.h  | 15 ++++++++
 drivers/net/wireless/mediatek/mt76/mt76.h |  8 +++++
 3 files changed, 78 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index fc30a8ea54ca6f736fd911de4ad471558e6c9577..7ad4a3a4cf095ba54afee6bda9fbf91286b8f280 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -427,15 +427,61 @@ mt76_dma_tx_cleanup(struct mt76_dev *dev, struct mt76_queue *q, bool flush)
 		wake_up(&dev->tx_wait);
 }
 
+static void *
+mt76_dma_get_rxdmad_c_buf(struct mt76_dev *dev, struct mt76_queue *q,
+			  int idx, int *len, bool *more)
+{
+	struct mt76_queue_entry *e = &q->entry[idx];
+	struct mt76_rro_rxdmad_c *dmad = e->buf;
+	u32 data1 = le32_to_cpu(dmad->data1);
+	u32 data2 = le32_to_cpu(dmad->data2);
+	struct mt76_txwi_cache *t;
+	u16 rx_token_id;
+	u8 ind_reason;
+	void *buf;
+
+	rx_token_id = FIELD_GET(RRO_RXDMAD_DATA2_RX_TOKEN_ID_MASK, data2);
+	t = mt76_rx_token_release(dev, rx_token_id);
+	if (!t)
+		return ERR_PTR(-EAGAIN);
+
+	q = &dev->q_rx[t->qid];
+	dma_sync_single_for_cpu(dev->dma_dev, t->dma_addr,
+				SKB_WITH_OVERHEAD(q->buf_size),
+				page_pool_get_dma_dir(q->page_pool));
+
+	if (len)
+		*len = FIELD_GET(RRO_RXDMAD_DATA1_SDL0_MASK, data1);
+	if (more)
+		*more = !FIELD_GET(RRO_RXDMAD_DATA1_LS_MASK, data1);
+
+	buf = t->ptr;
+	ind_reason = FIELD_GET(RRO_RXDMAD_DATA2_IND_REASON_MASK, data2);
+	if (ind_reason == MT_DMA_WED_IND_REASON_REPEAT ||
+	    ind_reason == MT_DMA_WED_IND_REASON_OLDPKT) {
+		mt76_put_page_pool_buf(buf, false);
+		buf = ERR_PTR(-EAGAIN);
+	}
+	t->ptr = NULL;
+	t->dma_addr = 0;
+
+	mt76_put_rxwi(dev, t);
+
+	return buf;
+}
+
 static void *
 mt76_dma_get_buf(struct mt76_dev *dev, struct mt76_queue *q, int idx,
-		 int *len, u32 *info, bool *more, bool *drop)
+		 int *len, u32 *info, bool *more, bool *drop, bool flush)
 {
 	struct mt76_queue_entry *e = &q->entry[idx];
 	struct mt76_desc *desc = &q->desc[idx];
 	u32 ctrl, desc_info, buf1;
 	void *buf = e->buf;
 
+	if (mt76_queue_is_wed_rro_rxdmad_c(q) && !flush)
+		buf = mt76_dma_get_rxdmad_c_buf(dev, q, idx, len, more);
+
 	if (mt76_queue_is_wed_rro(q))
 		goto done;
 
@@ -516,7 +562,7 @@ mt76_dma_dequeue(struct mt76_dev *dev, struct mt76_queue *q, bool flush,
 	q->tail = (q->tail + 1) % q->ndesc;
 	q->queued--;
 
-	return mt76_dma_get_buf(dev, q, idx, len, info, more, drop);
+	return mt76_dma_get_buf(dev, q, idx, len, info, more, drop, flush);
 }
 
 static int
@@ -885,10 +931,16 @@ mt76_dma_rx_process(struct mt76_dev *dev, struct mt76_queue *q, int budget)
 		if (!data)
 			break;
 
+		if (PTR_ERR(data) == -EAGAIN) {
+			done++;
+			continue;
+		}
+
 		if (mt76_queue_is_wed_rro_ind(q) && dev->drv->rx_rro_ind_process)
 			dev->drv->rx_rro_ind_process(dev, data);
 
-		if (mt76_queue_is_wed_rro(q)) {
+		if (mt76_queue_is_wed_rro(q) &&
+		    !mt76_queue_is_wed_rro_rxdmad_c(q)) {
 			done++;
 			continue;
 		}
diff --git a/drivers/net/wireless/mediatek/mt76/dma.h b/drivers/net/wireless/mediatek/mt76/dma.h
index f53c2136858043d0f208d9d21304fae2058ac70f..17a80e1757fcc3a9358f1cc4f3cafe4b6d87ec65 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.h
+++ b/drivers/net/wireless/mediatek/mt76/dma.h
@@ -58,6 +58,21 @@ struct mt76_wed_rro_desc {
 	__le32 buf1;
 } __packed __aligned(4);
 
+/* data1 */
+#define RRO_RXDMAD_DATA1_LS_MASK		BIT(30)
+#define RRO_RXDMAD_DATA1_SDL0_MASK		GENMASK(29, 16)
+/* data2 */
+#define RRO_RXDMAD_DATA2_RX_TOKEN_ID_MASK	GENMASK(31, 16)
+#define RRO_RXDMAD_DATA2_IND_REASON_MASK	GENMASK(15, 12)
+/* data3 */
+#define RRO_RXDMAD_DATA3_MAGIC_CNT_MASK		GENMASK(31, 28)
+struct mt76_rro_rxdmad_c {
+	__le32 data0;
+	__le32 data1;
+	__le32 data2;
+	__le32 data3;
+};
+
 enum mt76_qsel {
 	MT_QSEL_MGMT,
 	MT_QSEL_HCCA,
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 39e4641ae2cc5287a2c8c838c729bc7e85b68b9a..4aabb8d1021a70f502a4afe25b14d2cc6d524aca 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -45,6 +45,7 @@
 #define MT_WED_RRO_Q_DATA(_n)	__MT_WED_RRO_Q(MT76_WED_RRO_Q_DATA, _n)
 #define MT_WED_RRO_Q_MSDU_PG(_n)	__MT_WED_RRO_Q(MT76_WED_RRO_Q_MSDU_PG, _n)
 #define MT_WED_RRO_Q_IND	__MT_WED_RRO_Q(MT76_WED_RRO_Q_IND, 0)
+#define MT_WED_RRO_Q_RXDMAD_C	__MT_WED_RRO_Q(MT76_WED_RRO_Q_RXDMAD_C, 0)
 
 struct mt76_dev;
 struct mt76_phy;
@@ -71,6 +72,7 @@ enum mt76_wed_type {
 	MT76_WED_RRO_Q_DATA,
 	MT76_WED_RRO_Q_MSDU_PG,
 	MT76_WED_RRO_Q_IND,
+	MT76_WED_RRO_Q_RXDMAD_C,
 };
 
 struct mt76_bus_ops {
@@ -1793,6 +1795,12 @@ static inline bool mt76_queue_is_wed_rro_ind(struct mt76_queue *q)
 	       FIELD_GET(MT_QFLAG_WED_TYPE, q->flags) == MT76_WED_RRO_Q_IND;
 }
 
+static inline bool mt76_queue_is_wed_rro_rxdmad_c(struct mt76_queue *q)
+{
+	return mt76_queue_is_wed_rro(q) &&
+	       FIELD_GET(MT_QFLAG_WED_TYPE, q->flags) == MT76_WED_RRO_Q_RXDMAD_C;
+}
+
 static inline bool mt76_queue_is_wed_rro_data(struct mt76_queue *q)
 {
 	return mt76_queue_is_wed_rro(q) &&

-- 
2.51.0


