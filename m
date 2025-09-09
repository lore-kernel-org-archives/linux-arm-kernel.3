Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD68CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pHTBtamIAofD7j0yEV6xAkvLmMl2NOMHSGLm3F2dxcQ=; b=Pn4SjIum53sq1sNOu8RiS2AgzF
	FuS0qxyAY+ebF3PpW+Bp5s7YnOPcbcyXdDY+EbIeu0ytagLVoycHo6PHnux8F/qpHcaS+sddpGOSR
	3YkfuCwaC18S6khMdj6C+nmm5E19PxhCeMEXxByPstpgWDi/6Hcc9hOKT/x0Ca2FeRfYKHIU5thp7
	QLTTBvnF3Qz8ic6y36ym571hzRrUwxroKeFfT1v6oJQD3E8Z9nI+roemqwM//4iIEn1Jy4dmFJ/Xk
	x5FT499z/N/hvH9rkcNcCLpvcuI/1C3/oA2/6Vq9mlzdcqaz7uTOdsCD6nQdcQslqoHIBntMUMtSK
	+7wQIW4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1vv-00000008nlq-1Mt8;
	Tue, 09 Sep 2025 17:15:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvs4-00000006V1r-2vY0;
	Tue, 09 Sep 2025 10:46:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 14D1A4442B;
	Tue,  9 Sep 2025 10:46:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9147DC4CEF4;
	Tue,  9 Sep 2025 10:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757414803;
	bh=yWrhc412alWgxx6Om8MS4lFSCSiz7aS8X262Zvx9aeA=;
	h=From:To:Cc:Subject:Date:From;
	b=KWIANRDGKOXB9ngieV26KAdfpdlYXvgcH5bTFwhbA8LRTyWDg1H6tiy9K++ltVln4
	 vR1YgOMNbs8Kwvjmbjt9YeIKDZLYpmskusNzpmaTzTSLYbNCT3LytG/vOkzbEpUMbl
	 VQuSu4uLa9TsGX4Xw4U6iu2wxXWQ3xVykQPQqA7/winwFL+AATZNZ2qa9NPgc2UwIw
	 olaSvilNUYdxoZ5nkJmEaI4F+9oM6GauaPKeObdVjuksuqnrEQ8o9tqbUDj4KIoS2Y
	 wDqW0G7l5xFdHQMO4jt+A1Aa0uvCxV1jyT/peWGQbdg6d4bKhAgDfabsiN8UB5w68o
	 HaM5NOx5JZFMA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name,
	ryder.lee@mediatek.com
Cc: shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	lorenzo@kernel.org
Subject: [PATCH mt76] wifi: mt76: Convert mt76_wed_rro_ind to LE
Date: Tue,  9 Sep 2025 12:46:37 +0200
Message-ID: <301d5f2982ddb729c876fb65f9ac2443ce3f5ff1.1757414621.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_034644_775083_9DFD4649 
X-CRM114-Status: GOOD (  15.02  )
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

Do not use bitmask in mt76_wed_rro_ind DMA descriptor in order to not
break endianness.
This patch is based on the following series:
https://lore.kernel.org/linux-wireless/20250909-mt7996-rro-rework-v5-0-7d66f6eb7795@kernel.org/T/#m8b488004d69036cd3672b9eeca8005a937ec0313

Fixes: 950d0abb5cd94 ("wifi: mt76: mt7996: add wed rx support")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/dma.c      |  9 ++++++--
 drivers/net/wireless/mediatek/mt76/mt76.h     | 17 ++++++++-------
 .../net/wireless/mediatek/mt76/mt7996/mac.c   | 21 ++++++++++++-------
 3 files changed, 29 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index 5dc093b21838..1fa7de1d2c45 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -194,6 +194,8 @@ mt76_dma_queue_magic_cnt_init(struct mt76_dev *dev, struct mt76_queue *q)
 	q->magic_cnt = 0;
 	if (mt76_queue_is_wed_rro_ind(q)) {
 		struct mt76_wed_rro_desc *rro_desc;
+		u32 data1 = FIELD_PREP(RRO_IND_DATA1_MAGIC_CNT_MASK,
+				       MT_DMA_WED_IND_CMD_CNT - 1);
 		int i;
 
 		rro_desc = (struct mt76_wed_rro_desc *)q->desc;
@@ -201,7 +203,7 @@ mt76_dma_queue_magic_cnt_init(struct mt76_dev *dev, struct mt76_queue *q)
 			struct mt76_wed_rro_ind *cmd;
 
 			cmd = (struct mt76_wed_rro_ind *)&rro_desc[i];
-			cmd->magic_cnt = MT_DMA_WED_IND_CMD_CNT - 1;
+			cmd->data1 = cpu_to_le32(data1);
 		}
 	} else if (mt76_queue_is_wed_rro_rxdmad_c(q)) {
 		struct mt76_rro_rxdmad_c *dmad = (void *)q->desc;
@@ -582,12 +584,15 @@ mt76_dma_dequeue(struct mt76_dev *dev, struct mt76_queue *q, bool flush,
 
 	if (mt76_queue_is_wed_rro_ind(q)) {
 		struct mt76_wed_rro_ind *cmd;
+		u8 magic_cnt;
 
 		if (flush)
 			goto done;
 
 		cmd = q->entry[idx].buf;
-		if (cmd->magic_cnt != q->magic_cnt)
+		magic_cnt = FIELD_GET(RRO_IND_DATA1_MAGIC_CNT_MASK,
+				      le32_to_cpu(cmd->data1));
+		if (magic_cnt != q->magic_cnt)
 			return NULL;
 
 		if (q->tail == q->ndesc - 1)
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index a78d663ee91d..eede0c0fe2b9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -415,15 +415,16 @@ struct mt76_txq {
 	bool aggr;
 };
 
+/* data0 */
+#define RRO_IND_DATA0_IND_REASON_MASK	GENMASK(31, 28)
+#define RRO_IND_DATA0_START_SEQ_MASK	GENMASK(27, 16)
+#define RRO_IND_DATA0_SEQ_ID_MASK	GENMASK(11, 0)
+/* data1 */
+#define RRO_IND_DATA1_MAGIC_CNT_MASK	GENMASK(31, 29)
+#define RRO_IND_DATA1_IND_COUNT_MASK	GENMASK(12, 0)
 struct mt76_wed_rro_ind {
-	u32 se_id	: 12;
-	u32 rsv		: 4;
-	u32 start_sn	: 12;
-	u32 ind_reason	: 4;
-	u32 ind_cnt	: 13;
-	u32 win_sz	: 3;
-	u32 rsv2	: 13;
-	u32 magic_cnt	: 3;
+	__le32 data0;
+	__le32 data1;
 };
 
 struct mt76_txwi_cache {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index ed10e45b21a4..5b43678e6556 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -1822,11 +1822,17 @@ void mt7996_rro_rx_process(struct mt76_dev *mdev, void *data)
 {
 	struct mt7996_dev *dev = container_of(mdev, struct mt7996_dev, mt76);
 	struct mt76_wed_rro_ind *cmd = (struct mt76_wed_rro_ind *)data;
+	u32 cmd_data0 = le32_to_cpu(cmd->data0);
+	u32 cmd_data1 = le32_to_cpu(cmd->data1);
+	u8 ind_reason = FIELD_GET(RRO_IND_DATA0_IND_REASON_MASK, cmd_data0);
+	u16 start_seq = FIELD_GET(RRO_IND_DATA0_START_SEQ_MASK, cmd_data0);
+	u16 seq_id = FIELD_GET(RRO_IND_DATA0_SEQ_ID_MASK, cmd_data0);
+	u16 ind_count = FIELD_GET(RRO_IND_DATA1_IND_COUNT_MASK, cmd_data1);
 	struct mt7996_msdu_page_info *pinfo = NULL;
 	struct mt7996_msdu_page *p = NULL;
 	int i, seq_num = 0;
 
-	for (i = 0; i < cmd->ind_cnt; i++) {
+	for (i = 0; i < ind_count; i++) {
 		struct mt7996_wed_rro_addr *e;
 		struct mt76_rx_status *status;
 		struct mt7996_rro_hif *rxd;
@@ -1841,8 +1847,8 @@ void mt7996_rro_rx_process(struct mt76_dev *mdev, void *data)
 		void *buf;
 		bool ls;
 
-		seq_num = FIELD_GET(MT996_RRO_SN_MASK, cmd->start_sn + i);
-		e = mt7996_rro_addr_elem_get(dev, cmd->se_id, seq_num);
+		seq_num = FIELD_GET(MT996_RRO_SN_MASK, start_seq + i);
+		e = mt7996_rro_addr_elem_get(dev, seq_id, seq_num);
 		data = le32_to_cpu(e->data);
 		signature = FIELD_GET(WED_RRO_ADDR_SIGNATURE_MASK, data);
 		if (signature != (seq_num / MT7996_RRO_WINDOW_MAX_LEN)) {
@@ -1930,7 +1936,7 @@ void mt7996_rro_rx_process(struct mt76_dev *mdev, void *data)
 			skb_mark_for_recycle(skb);
 			__skb_put(skb, len);
 
-			if (cmd->ind_reason == 1 || cmd->ind_reason == 2) {
+			if (ind_reason == 1 || ind_reason == 2) {
 				dev_kfree_skb(skb);
 				goto next_page;
 			}
@@ -1941,7 +1947,7 @@ void mt7996_rro_rx_process(struct mt76_dev *mdev, void *data)
 			}
 
 			status = (struct mt76_rx_status *)skb->cb;
-			if (cmd->se_id != MT7996_RRO_MAX_SESSION)
+			if (seq_id != MT7996_RRO_MAX_SESSION)
 				status->aggr = true;
 
 			mt7996_queue_rx_skb(mdev, qid, skb, &info);
@@ -1965,7 +1971,7 @@ void mt7996_rro_rx_process(struct mt76_dev *mdev, void *data)
 		if ((i + 1) % 4 == 0)
 			mt76_wr(dev, MT_RRO_ACK_SN_CTRL,
 				FIELD_PREP(MT_RRO_ACK_SN_CTRL_SESSION_MASK,
-					   cmd->se_id) |
+					   seq_id) |
 				FIELD_PREP(MT_RRO_ACK_SN_CTRL_SN_MASK,
 					   seq_num));
 		if (p) {
@@ -1977,8 +1983,7 @@ void mt7996_rro_rx_process(struct mt76_dev *mdev, void *data)
 	/* Update ack_seq_num for remaining addr_elem */
 	if (i % 4)
 		mt76_wr(dev, MT_RRO_ACK_SN_CTRL,
-			FIELD_PREP(MT_RRO_ACK_SN_CTRL_SESSION_MASK,
-				   cmd->se_id) |
+			FIELD_PREP(MT_RRO_ACK_SN_CTRL_SESSION_MASK, seq_id) |
 			FIELD_PREP(MT_RRO_ACK_SN_CTRL_SN_MASK, seq_num));
 }
 
-- 
2.51.0


