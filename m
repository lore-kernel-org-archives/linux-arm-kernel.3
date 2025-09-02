Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF5DCA100E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 00:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pzL70xv8ZsDwTjAis92pMOSl2k1+RVW8P1/Td7i/e8k=; b=fefL2HKBply6X5iuxg6XcZqaRY
	kpXP9b3ySxuoxZIEKZjXQhBtzAjCR1JsQHSoduVx4pM1yMf8FuqYu3nFvbHM0Kaau9VZmK0l5eZBR
	sHuBZcVxuQu031cv/AZTFbQlu/nTziIzVSNuTX3rV3AMml/c62hFX2xlRKgafg6zA7O/N89ji0FPf
	PqFTp0I96jWB9SlzhLqXBmW4sXAQOt2QGQrcamEKGtwkot2jGezsFWVm3NvlYAsOsQif1KGIR+h0C
	R3t4bDD5+RPzBCGyfHTWq1Jg4wBYs0EB1cPijKdvhsuGTTL0zAyjIRDkjaPb5EQKSj6OP4gubkZmC
	drYXgu7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utbcC-00000002pDS-2SFp;
	Wed, 03 Sep 2025 00:44:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWWi-00000001ghJ-1XVP;
	Tue, 02 Sep 2025 19:18:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 15C7C406BC;
	Tue,  2 Sep 2025 19:18:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94AC4C4CEED;
	Tue,  2 Sep 2025 19:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756840723;
	bh=zIxR8tHE1ex3YBnEJ3n32W6/UA/Srrv0hymuahhhdJw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AxU06vEti00Ht3iyPjyQLhh884fK3t7Ik7JqY7JtjxgVyAAfN5Khp7MLNMkQwvlul
	 VLtJHKin+FAS5GlSbYFbcpIrBsy66j3i70+0r/hJRaIX2bquJeGDSEQ3DK4F5ZzlXZ
	 pujqrnpHPnVysOvUEOwvI1sowN+7n3ILbTRRFpGuVVyJr4YvQ558YkyeX0M3tu6Myo
	 s5/w/qNPgSwEI7aprDSTpfYZl5XfQ9ZLkqYB85BwwW/pPq0kFAcEGVepKm6kzW7ZJq
	 /en4XzeobBBT2BYs5Tf/b3N1i5Dyu9GH7lwrEYbfE9PFvZsdyc6aXUQtVm89AzJIXl
	 YjFkcU9QcL1dA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 02 Sep 2025 21:18:04 +0200
Subject: [PATCH mt76 v3 14/15] wifi: mt76: Add mt76_dma_get_rxdmad_c_buf
 utility routione
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-mt7996-rro-rework-v3-14-8f813890959e@kernel.org>
References: <20250902-mt7996-rro-rework-v3-0-8f813890959e@kernel.org>
In-Reply-To: <20250902-mt7996-rro-rework-v3-0-8f813890959e@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Rex Lu <rex.lu@mediatek.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_121844_451257_5FE1C06D 
X-CRM114-Status: GOOD (  14.18  )
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
 drivers/net/wireless/mediatek/mt76/dma.c  | 52 +++++++++++++++++++++++++++++--
 drivers/net/wireless/mediatek/mt76/dma.h  | 33 ++++++++++++++++++++
 drivers/net/wireless/mediatek/mt76/mt76.h |  8 +++++
 3 files changed, 90 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index fc30a8ea54ca6f736fd911de4ad471558e6c9577..67955bd759bacec6c6f562ecd9c114463b601ed2 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -427,15 +427,55 @@ mt76_dma_tx_cleanup(struct mt76_dev *dev, struct mt76_queue *q, bool flush)
 		wake_up(&dev->tx_wait);
 }
 
+static void *
+mt76_dma_get_rxdmad_c_buf(struct mt76_dev *dev, struct mt76_queue *q,
+			  int idx, int *len, bool *more)
+{
+	struct mt76_queue_entry *e = &q->entry[idx];
+	struct mt76_rro_rxdmad_c *dmad = e->buf;
+	struct mt76_txwi_cache *t;
+	void *buf;
+
+	t = mt76_rx_token_release(dev, dmad->rx_token_id);
+	if (!t)
+		return ERR_PTR(-EAGAIN);
+
+	q = &dev->q_rx[t->qid];
+	dma_sync_single_for_cpu(dev->dma_dev, t->dma_addr,
+				SKB_WITH_OVERHEAD(q->buf_size),
+				page_pool_get_dma_dir(q->page_pool));
+
+	if (len)
+		*len = dmad->sdl0;
+	if (more)
+		*more = !dmad->ls;
+
+	buf = t->ptr;
+	if (dmad->ind_reason == MT_DMA_WED_IND_REASON_REPEAT ||
+	    dmad->ind_reason == MT_DMA_WED_IND_REASON_OLDPKT) {
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
 
@@ -516,7 +556,7 @@ mt76_dma_dequeue(struct mt76_dev *dev, struct mt76_queue *q, bool flush,
 	q->tail = (q->tail + 1) % q->ndesc;
 	q->queued--;
 
-	return mt76_dma_get_buf(dev, q, idx, len, info, more, drop);
+	return mt76_dma_get_buf(dev, q, idx, len, info, more, drop, flush);
 }
 
 static int
@@ -885,10 +925,16 @@ mt76_dma_rx_process(struct mt76_dev *dev, struct mt76_queue *q, int budget)
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
index f53c2136858043d0f208d9d21304fae2058ac70f..f47039d9ba4fd03d7decc6dd7582bb0efccda496 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.h
+++ b/drivers/net/wireless/mediatek/mt76/dma.h
@@ -58,6 +58,39 @@ struct mt76_wed_rro_desc {
 	__le32 buf1;
 } __packed __aligned(4);
 
+struct mt76_rro_rxdmad_c {
+	u32 sdp0_31_0;
+	u32 header_ofst	: 7;
+	u32 ver		: 1;
+	u32 to_host	: 1;
+	u32 ring_info	: 2;
+	u32 dst_sel	: 2;
+	u32 pn_chk_fail	: 1;
+	u32 rsv		: 2;
+	u32 sdl0	: 14;
+	u32 ls		: 1;
+	u32 rsv2	: 1;
+	u32 sdp0_35_32	: 4;
+	u32 rsv3	: 2;
+	u32 sca_gat	: 1;
+	u32 par_se	: 1;
+	u32 rss_hash	: 4;
+	u32 ind_reason	: 4;
+	u32 rx_token_id	: 16;
+	u32 cs_status	: 4;
+	u32 cs_type	: 4;
+	u32 c		: 1;
+	u32 f		: 1;
+	u32 un		: 1;
+	u32 is_fc_data	: 1;
+	u32 uc		: 1;
+	u32 mc		: 1;
+	u32 bc		: 1;
+	u32 rsv4	: 1;
+	u32 wcid	: 12;
+	u32 magic_cnt	: 4;
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
2.50.1


