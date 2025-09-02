Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9856DCA100F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 00:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pjhTvwpB10/NG7rHT2QiHospv5DdMCcc7XY73UJogMM=; b=pYvPB6YWuhwi7AGr/eFbGKhXXA
	JBGC1NX2TUQJkeHyELyWKu5g0FyRoYJhU+hEpa7XnHazKy7B3SOEHKzb3Q8xzT/0qwFY0jNX7n2d6
	+awdDlHth83Z2swpPOGbOQtyfE+sKBWT6ajxmO3wjqcaseNR3pcXFHBGN59VE59l+P8jhnSAJzARS
	hUWizWpbwmXaRZ2cVqIp/Z6jdxteRMJRDHPBKRIsvmU25o+ykOAGQ8jCcee5/qOHTx3LzM+7XQBbu
	vEOYqxnXfXN/sAVpV2Hp+aI5zpA9alCKL3wybCdOd1q2xSCnMOjiJPcCJUQ6pf89sFZz/q4lvcLlw
	Sz0bFi5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utbc8-00000002p5m-1LUY;
	Wed, 03 Sep 2025 00:44:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWWb-00000001gfb-0zVQ;
	Tue, 02 Sep 2025 19:18:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9A76560055;
	Tue,  2 Sep 2025 19:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEF27C4CEED;
	Tue,  2 Sep 2025 19:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756840716;
	bh=LmNQZAS5G//HNr8t5dXVznsBl/v7F7uEpSP1aJJkqrw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aZvKh7vibZ2v6KcDUtbcEcraqTh+i4g4Vqmma7bEFHLp+/QWofXWAT+rVPE0gJ2vi
	 J/OpiPq4QBfSkM/WnzByp5Bs021ZC5SKIRp4bOI3ofKaFOppt2AaTDQ999pxD6sr30
	 HlZy2ybmBzphSmcjH1g5fJ5N8smRpG5BuhwLamR8Hl3J8OFpx8REeEZ0uavM3FW08K
	 kcgf0pmXCem6DufHOcwjP+5eBx1xdNIkTR5pum8pR7OgjQ4maiiRMZfUQUG5SI8e+H
	 tqbLDVzumfrJqc1L/Y+4ntdyCZaUPF2GSI9VzqGtbH+HSnpWzdN7XZP4HU2llHI3Ks
	 Rbo1FoRY7A1jw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 02 Sep 2025 21:18:01 +0200
Subject: [PATCH mt76 v3 11/15] wifi: mt76: mt7996: Introduce RRO MSDU
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-mt7996-rro-rework-v3-11-8f813890959e@kernel.org>
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

From: Rex Lu <rex.lu@mediatek.com>

Introduce rx_rro_ind_process and rx_rro_add_msdu_page callbacks and the
related logic in the MT7996 driver. This is a preliminary patch to
decouple RRO logic from WED support and reuse RRO when WED module is not
available.

Signed-off-by: Rex Lu <rex.lu@mediatek.com>
Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/dma.c           |   2 +
 drivers/net/wireless/mediatek/mt76/mt76.h          |   6 +
 drivers/net/wireless/mediatek/mt76/mt7996/dma.c    |   3 +
 drivers/net/wireless/mediatek/mt76/mt7996/init.c   |   6 +
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c    | 330 +++++++++++++++++++++
 drivers/net/wireless/mediatek/mt76/mt7996/mmio.c   |   2 +
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h |  51 ++++
 7 files changed, 400 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index f882b4e10858a233a5422ede80d79c21965136e9..b8bb8cdfb69bd6aa8102bff474d8a25a881fb29d 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -256,6 +256,8 @@ mt76_dma_add_rx_buf(struct mt76_dev *dev, struct mt76_queue *q,
 
 		buf1 |= FIELD_PREP(MT_DMA_CTL_TOKEN, rx_token);
 		ctrl |= MT_DMA_CTL_TO_HOST;
+
+		txwi->qid = q - dev->q_rx;
 	}
 
 	WRITE_ONCE(desc->buf0, cpu_to_le32(buf->addr));
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 58d8aa213bb7bf7d1bab0926eca23303d8a733a7..60a3f13ac99125f66f3af406a2a37c25b257a762 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -418,6 +418,8 @@ struct mt76_txwi_cache {
 		struct sk_buff *skb;
 		void *ptr;
 	};
+
+	u8 qid;
 };
 
 struct mt76_rx_tid {
@@ -534,6 +536,10 @@ struct mt76_driver_ops {
 
 	void (*rx_poll_complete)(struct mt76_dev *dev, enum mt76_rxq_id q);
 
+	void (*rx_rro_ind_process)(struct mt76_dev *dev, void *data);
+	int (*rx_rro_add_msdu_page)(struct mt76_dev *dev, struct mt76_queue *q,
+				    dma_addr_t p, void *data);
+
 	void (*sta_ps)(struct mt76_dev *dev, struct ieee80211_sta *sta,
 		       bool ps);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/dma.c b/drivers/net/wireless/mediatek/mt76/mt7996/dma.c
index c5fd25acf9a1a60d4aaffe8ba6d2cf2aafe4fd87..2412767bfaa7e26cdce45b482fb56dea2add8280 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/dma.c
@@ -854,6 +854,9 @@ void mt7996_dma_reset(struct mt7996_dev *dev, bool force)
 
 	mt76_tx_status_check(&dev->mt76, true);
 
+	if (dev->has_rro && !mtk_wed_device_active(&dev->mt76.mmio.wed))
+		mt7996_rro_msdu_page_map_free(dev);
+
 	/* reset wfsys */
 	if (force)
 		mt7996_wfsys_reset(dev);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index 075e5caaa31e54071111b6919bfd9b4eabca5177..89907add122196f0016a295da49af4a911d9cf23 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -774,6 +774,10 @@ void mt7996_rro_hw_init(struct mt7996_dev *dev)
 	if (!dev->has_rro)
 		return;
 
+	INIT_LIST_HEAD(&dev->wed_rro.page_cache);
+	for (i = 0; i < ARRAY_SIZE(dev->wed_rro.page_map); i++)
+		INIT_LIST_HEAD(&dev->wed_rro.page_map[i]);
+
 	if (is_mt7992(&dev->mt76)) {
 		/* Set emul 3.0 function */
 		mt76_wr(dev, MT_RRO_3_0_EMU_CONF,
@@ -1657,6 +1661,8 @@ void mt7996_unregister_device(struct mt7996_dev *dev)
 	mt7996_mcu_exit(dev);
 	mt7996_tx_token_put(dev);
 	mt7996_dma_cleanup(dev);
+	if (dev->has_rro && !mtk_wed_device_active(&dev->mt76.mmio.wed))
+		mt7996_rro_msdu_page_map_free(dev);
 	tasklet_disable(&dev->mt76.irq_tasklet);
 
 	mt76_free_device(&dev->mt76);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 11e71bc175b80784afd080638dc8657ffa092e3e..bb18e3302a45c826e7704c9b3a2234758887b0ef 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -1578,6 +1578,336 @@ void mt7996_queue_rx_skb(struct mt76_dev *mdev, enum mt76_rxq_id q,
 	}
 }
 
+static struct mt7996_msdu_page *
+mt7996_msdu_page_get_from_cache(struct mt7996_dev *dev)
+{
+	struct mt7996_msdu_page *p = NULL;
+
+	spin_lock(&dev->wed_rro.lock);
+
+	if (!list_empty(&dev->wed_rro.page_cache)) {
+		p = list_first_entry(&dev->wed_rro.page_cache,
+				     struct mt7996_msdu_page, list);
+		if (p)
+			list_del(&p->list);
+	}
+
+	spin_unlock(&dev->wed_rro.lock);
+
+	return p;
+}
+
+static struct mt7996_msdu_page *mt7996_msdu_page_get(struct mt7996_dev *dev)
+{
+	struct mt7996_msdu_page *p;
+
+	p = mt7996_msdu_page_get_from_cache(dev);
+	if (!p) {
+		p = kzalloc(L1_CACHE_ALIGN(sizeof(*p)), GFP_ATOMIC);
+		if (p)
+			INIT_LIST_HEAD(&p->list);
+	}
+
+	return p;
+}
+
+static void mt7996_msdu_page_put_to_cache(struct mt7996_dev *dev,
+					  struct mt7996_msdu_page *p)
+{
+	if (p->buf) {
+		mt76_put_page_pool_buf(p->buf, false);
+		p->buf = NULL;
+	}
+
+	spin_lock(&dev->wed_rro.lock);
+	list_add(&p->list, &dev->wed_rro.page_cache);
+	spin_unlock(&dev->wed_rro.lock);
+}
+
+static void mt7996_msdu_page_free_cache(struct mt7996_dev *dev)
+{
+	while (true) {
+		struct mt7996_msdu_page *p;
+
+		p = mt7996_msdu_page_get_from_cache(dev);
+		if (!p)
+			break;
+
+		if (p->buf)
+			mt76_put_page_pool_buf(p->buf, false);
+
+		kfree(p);
+	}
+}
+
+static u32 mt7996_msdu_page_hash_from_addr(dma_addr_t dma_addr)
+{
+	u32 val = 0;
+	int i = 0;
+
+	while (dma_addr) {
+		val += (u32)((dma_addr & 0xff) + i) % MT7996_RRO_MSDU_PG_HASH_SIZE;
+		dma_addr >>= 8;
+		i += 13;
+	}
+
+	return val % MT7996_RRO_MSDU_PG_HASH_SIZE;
+}
+
+static struct mt7996_msdu_page *
+mt7996_rro_msdu_page_get(struct mt7996_dev *dev, dma_addr_t dma_addr)
+{
+	u32 hash = mt7996_msdu_page_hash_from_addr(dma_addr);
+	struct mt7996_msdu_page *p, *tmp, *addr = NULL;
+
+	spin_lock(&dev->wed_rro.lock);
+
+	list_for_each_entry_safe(p, tmp, &dev->wed_rro.page_map[hash],
+				 list) {
+		if (p->dma_addr == dma_addr) {
+			list_del(&p->list);
+			addr = p;
+			break;
+		}
+	}
+
+	spin_unlock(&dev->wed_rro.lock);
+
+	return addr;
+}
+
+static void mt7996_rx_token_put(struct mt7996_dev *dev)
+{
+	int i;
+
+	for (i = 0; i < dev->mt76.rx_token_size; i++) {
+		struct mt76_txwi_cache *t;
+
+		t = mt76_rx_token_release(&dev->mt76, i);
+		if (!t || !t->ptr)
+			continue;
+
+		mt76_put_page_pool_buf(t->ptr, false);
+		t->dma_addr = 0;
+		t->ptr = NULL;
+
+		mt76_put_rxwi(&dev->mt76, t);
+	}
+}
+
+void mt7996_rro_msdu_page_map_free(struct mt7996_dev *dev)
+{
+	struct mt7996_msdu_page *p, *tmp;
+	int i;
+
+	local_bh_disable();
+
+	for (i = 0; i < ARRAY_SIZE(dev->wed_rro.page_map); i++) {
+		list_for_each_entry_safe(p, tmp, &dev->wed_rro.page_map[i],
+					 list) {
+			list_del_init(&p->list);
+			if (p->buf)
+				mt76_put_page_pool_buf(p->buf, false);
+			kfree(p);
+		}
+	}
+	mt7996_msdu_page_free_cache(dev);
+
+	local_bh_enable();
+
+	mt7996_rx_token_put(dev);
+}
+
+int mt7996_rro_msdu_page_add(struct mt76_dev *mdev, struct mt76_queue *q,
+			     dma_addr_t dma_addr, void *data)
+{
+	struct mt7996_dev *dev = container_of(mdev, struct mt7996_dev, mt76);
+	struct mt7996_msdu_page_info *pinfo = data;
+	struct mt7996_msdu_page *p;
+	u32 hash;
+
+	pinfo->owner = 1;
+	p = mt7996_msdu_page_get(dev);
+	if (!p)
+		return -ENOMEM;
+
+	p->buf = data;
+	p->dma_addr = dma_addr;
+	p->q = q;
+
+	hash = mt7996_msdu_page_hash_from_addr(dma_addr);
+
+	spin_lock(&dev->wed_rro.lock);
+	list_add_tail(&p->list, &dev->wed_rro.page_map[hash]);
+	spin_unlock(&dev->wed_rro.lock);
+
+	return 0;
+}
+
+static struct mt7996_wed_rro_addr *
+mt7996_rro_addr_elem_get(struct mt7996_dev *dev, u16 session_id, u16 seq_num)
+{
+	u32 idx = 0;
+	void *addr;
+
+	if (session_id == MT7996_RRO_MAX_SESSION) {
+		addr = dev->wed_rro.session.ptr;
+	} else {
+		idx = session_id / MT7996_RRO_BA_BITMAP_SESSION_SIZE;
+		addr = dev->wed_rro.addr_elem[idx].ptr;
+
+		idx = session_id % MT7996_RRO_BA_BITMAP_SESSION_SIZE;
+		idx = idx * MT7996_RRO_WINDOW_MAX_LEN;
+	}
+	idx += seq_num % MT7996_RRO_WINDOW_MAX_LEN;
+
+	return addr + idx * sizeof(struct mt7996_wed_rro_addr);
+}
+
+#define MT996_RRO_SN_MASK	GENMASK(11, 0)
+
+void mt7996_rro_rx_process(struct mt76_dev *mdev, void *data)
+{
+	struct mt7996_dev *dev = container_of(mdev, struct mt7996_dev, mt76);
+	struct mt76_wed_rro_ind *cmd = (struct mt76_wed_rro_ind *)data;
+	struct mt7996_msdu_page_info *pinfo = NULL;
+	struct mt7996_msdu_page *p = NULL;
+	int i, seq_num = 0;
+
+	for (i = 0; i < cmd->ind_cnt; i++) {
+		struct mt7996_wed_rro_addr *e;
+		struct mt76_rx_status *status;
+		struct mt7996_rro_hif *rxd;
+		int j, len, qid, data_len;
+		struct mt76_txwi_cache *t;
+		struct mt76_queue *q;
+		dma_addr_t dma_addr;
+		struct sk_buff *skb;
+		u32 info = 0;
+		void *buf;
+
+		seq_num = FIELD_GET(MT996_RRO_SN_MASK, cmd->start_sn + i);
+		e = mt7996_rro_addr_elem_get(dev, cmd->se_id, seq_num);
+		if (e->signature != (seq_num / MT7996_RRO_WINDOW_MAX_LEN)) {
+			e->signature = 0xff;
+			goto update_ack_seq_num;
+		}
+
+		dma_addr = e->head_high;
+		dma_addr <<= 32;
+		dma_addr |= e->head_low;
+
+		for (j = 0; j < e->count; j++) {
+			if (!p) {
+				p = mt7996_rro_msdu_page_get(dev, dma_addr);
+				if (!p)
+					continue;
+
+				dma_sync_single_for_cpu(mdev->dma_dev, p->dma_addr,
+							SKB_WITH_OVERHEAD(p->q->buf_size),
+							page_pool_get_dma_dir(p->q->page_pool));
+				pinfo = (struct mt7996_msdu_page_info *)p->buf;
+			}
+
+			rxd = &pinfo->rxd[j % MT7996_MAX_HIF_RXD_IN_PG];
+			len = rxd->sdl;
+
+			t = mt76_rx_token_release(mdev, rxd->rx_token_id);
+			if (!t)
+				goto next_page;
+
+			qid = t->qid;
+			buf = t->ptr;
+			q = &mdev->q_rx[qid];
+			dma_sync_single_for_cpu(mdev->dma_dev, t->dma_addr,
+						SKB_WITH_OVERHEAD(q->buf_size),
+						page_pool_get_dma_dir(q->page_pool));
+
+			t->dma_addr = 0;
+			t->ptr = NULL;
+			mt76_put_rxwi(mdev, t);
+			if (!buf)
+				goto next_page;
+
+			if (q->rx_head)
+				data_len = q->buf_size;
+			else
+				data_len = SKB_WITH_OVERHEAD(q->buf_size);
+
+			if (data_len < len + q->buf_offset) {
+				dev_kfree_skb(q->rx_head);
+				mt76_put_page_pool_buf(buf, false);
+				q->rx_head = NULL;
+				goto next_page;
+			}
+
+			if (q->rx_head) {
+				/* TODO: Take into account non-linear skb. */
+				mt76_put_page_pool_buf(buf, false);
+				if (rxd->ls) {
+					dev_kfree_skb(q->rx_head);
+					q->rx_head = NULL;
+				}
+				goto next_page;
+			}
+
+			if (rxd->ls && !mt7996_rx_check(mdev, buf, len))
+				goto next_page;
+
+			skb = build_skb(buf, q->buf_size);
+			if (!skb)
+				goto next_page;
+
+			skb_reserve(skb, q->buf_offset);
+			skb_mark_for_recycle(skb);
+			__skb_put(skb, len);
+
+			if (cmd->ind_reason == 1 || cmd->ind_reason == 2) {
+				dev_kfree_skb(skb);
+				goto next_page;
+			}
+
+			if (!rxd->ls) {
+				q->rx_head = skb;
+				goto next_page;
+			}
+
+			status = (struct mt76_rx_status *)skb->cb;
+			if (cmd->se_id != MT7996_RRO_MAX_SESSION)
+				status->aggr = true;
+
+			mt7996_queue_rx_skb(mdev, qid, skb, &info);
+next_page:
+			if ((j + 1) % MT7996_MAX_HIF_RXD_IN_PG == 0) {
+				dma_addr = pinfo->next_pg_high;
+				dma_addr <<= 32;
+				dma_addr |= pinfo->next_pg_low;
+				mt7996_msdu_page_put_to_cache(dev, p);
+				p = NULL;
+			}
+		}
+
+update_ack_seq_num:
+		if ((i + 1) % 4 == 0)
+			mt76_wr(dev, MT_RRO_ACK_SN_CTRL,
+				FIELD_PREP(MT_RRO_ACK_SN_CTRL_SESSION_MASK,
+					   cmd->se_id) |
+				FIELD_PREP(MT_RRO_ACK_SN_CTRL_SN_MASK,
+					   seq_num));
+		if (p) {
+			mt7996_msdu_page_put_to_cache(dev, p);
+			p = NULL;
+		}
+	}
+
+	/* Update ack_seq_num for remaining addr_elem */
+	if (i % 4)
+		mt76_wr(dev, MT_RRO_ACK_SN_CTRL,
+			FIELD_PREP(MT_RRO_ACK_SN_CTRL_SESSION_MASK,
+				   cmd->se_id) |
+			FIELD_PREP(MT_RRO_ACK_SN_CTRL_SN_MASK, seq_num));
+}
+
 void mt7996_mac_cca_stats_reset(struct mt7996_phy *phy)
 {
 	struct mt7996_dev *dev = phy->dev;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c b/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c
index aa70e5fce98f005ef5c3f588203f61e179ff04e8..38c15b061dfffc512f99fe4c7d70dcfd92f14c6e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c
@@ -821,6 +821,8 @@ struct mt7996_dev *mt7996_mmio_probe(struct device *pdev,
 		.rx_skb = mt7996_queue_rx_skb,
 		.rx_check = mt7996_rx_check,
 		.rx_poll_complete = mt7996_rx_poll_complete,
+		.rx_rro_ind_process = mt7996_rro_rx_process,
+		.rx_rro_add_msdu_page = mt7996_rro_msdu_page_add,
 		.update_survey = mt7996_update_channel,
 		.set_channel = mt7996_set_channel,
 		.vif_link_add = mt7996_vif_link_add,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index f6dfd36a44c0bf587d3ac85a5a9d38e24deb14d4..0908ebcf65268e0eae862fad9f3c5d48493a78c7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -112,6 +112,7 @@
 #define MT7996_CRIT_TEMP		110
 #define MT7996_MAX_TEMP			120
 
+#define MT7996_MAX_HIF_RXD_IN_PG	5
 #define MT7996_RRO_MSDU_PG_HASH_SIZE	127
 #define MT7996_RRO_MAX_SESSION		1024
 #define MT7996_RRO_WINDOW_MAX_LEN	1024
@@ -299,6 +300,49 @@ struct mt7996_wed_rro_session_id {
 	u16 id;
 };
 
+struct mt7996_msdu_page {
+	struct list_head list;
+
+	struct mt76_queue *q;
+	dma_addr_t dma_addr;
+	void *buf;
+};
+
+struct mt7996_rro_hif {
+	u32 rx_blk_base_low;
+	u32 rx_blk_base_high	: 4;
+	u32 eth_hdr_ofst	: 7;
+	u32 rsv			: 1;
+	u32 ring_no		: 2;
+	u32 dst_sel		: 2;
+	u32 sdl			: 14;
+	u32 ls			: 1;
+	u32 rsv2		: 1;
+	u32 pn_31_0;
+	u32 pn_47_32		: 16;
+	u32 cs_status		: 4;
+	u32 cs_type		: 4;
+	u32 c			: 1;
+	u32 f			: 1;
+	u32 un			: 1;
+	u32 rsv3		: 1;
+	u32 is_fc_data		: 1;
+	u32 uc			: 1;
+	u32 mc			: 1;
+	u32 bc			: 1;
+	u16 rx_token_id;
+	u16 rsv4;
+	u32 rsv5;
+};
+
+struct mt7996_msdu_page_info {
+	struct mt7996_rro_hif rxd[MT7996_MAX_HIF_RXD_IN_PG];
+	u32 next_pg_low;
+	u32 next_pg_high	: 4;
+	u32 rsv			: 27;
+	u32 owner		: 1;
+};
+
 struct mt7996_phy {
 	struct mt76_phy *mt76;
 	struct mt7996_dev *dev;
@@ -416,6 +460,9 @@ struct mt7996_dev {
 		struct work_struct work;
 		struct list_head poll_list;
 		spinlock_t lock;
+
+		struct list_head page_cache;
+		struct list_head page_map[MT7996_RRO_MSDU_PG_HASH_SIZE];
 	} wed_rro;
 
 	bool ibf;
@@ -773,6 +820,10 @@ int mt7996_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 void mt7996_tx_token_put(struct mt7996_dev *dev);
 void mt7996_queue_rx_skb(struct mt76_dev *mdev, enum mt76_rxq_id q,
 			 struct sk_buff *skb, u32 *info);
+void mt7996_rro_msdu_page_map_free(struct mt7996_dev *dev);
+int mt7996_rro_msdu_page_add(struct mt76_dev *mdev, struct mt76_queue *q,
+			     dma_addr_t dma_addr, void *data);
+void mt7996_rro_rx_process(struct mt76_dev *mdev, void *data);
 bool mt7996_rx_check(struct mt76_dev *mdev, void *data, int len);
 void mt7996_stats_work(struct work_struct *work);
 int mt76_dfs_start_rdd(struct mt7996_dev *dev, bool force);

-- 
2.50.1


