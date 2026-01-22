Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 906B5D62613
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 10:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i3Rlq27ytc1umu4wH4VjyweSB86feBdtCia7YnhpZ7A=; b=xxv40xLn3yIxlsrr95qXmlMQPp
	nUIq1AFwoYVCF2z3UsQqYxhkAN6jw642bx0xZdFUC2Gt10vsXmrNpgYvSTExE0Jcv+qGMx65lHW91
	z3rNCdSNcU9kHUCqts/Uuq/oQEvJvB/o7pdtWExvC704vYQ/5PWBxTcV6/OvSMytJvshDLWqE2A8G
	aRnvrpAB+6wUDisxvw+UDVlGhxlqNHdrdJh/Pm2Z64fMw7Yoo3/2I6vYz4+7vzw+fNHszfom4dJ39
	3J0nMgEKlxBSm2gTUE/7lTkwU6cjgaMg2SViDu4DNgDEtzt2pcQ8HUI7n+B34FO6m1ososfpwublb
	vFKQ57mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis7X-00000006sGr-14Jb;
	Thu, 22 Jan 2026 10:40:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis7I-00000006rtq-2nlx;
	Thu, 22 Jan 2026 10:40:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 16FD0600C3;
	Thu, 22 Jan 2026 10:40:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E069C116C6;
	Thu, 22 Jan 2026 10:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769078443;
	bh=6RG/0E+e7ypwdL1JqZ0zGng7cYN5PEFOPEDzMeJF3D0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=myDhehn6XWyqg2YOYOJB/E3akVEXbNvMBZbpDkAWDz4e60fDxQNE3EH2ANkYet+73
	 Q4G9IeSIWXhZAyL6oxBelvSF2mf5Fds3cR7xhfm3faaV5+/W22NJWac/D3GzLkuxtQ
	 vL2aiI2H06lFn3Fw8mxWVJHythHblyIr/rEEEPsiLuztsH5Zd9fzOfkOnEWnoGx7MI
	 055UaEJyuBgpSXGz0yZMiGZVV13ZQgqqu4CDva536Ni0W4F7bf56cnTtVvQ7S5FdCd
	 Knh4CiM3W3urzvz5JG5dSwQiKZbLHqcGEaTFOgcKh8EJPLE37+pftYay+UHUSIK0uW
	 Z4u94QtIjGzOw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 22 Jan 2026 11:39:59 +0100
Subject: [PATCH mt76 v2 15/17] wifi: mt76: mt7996: Do not schedule RRO and
 TxFree queues during reset for NPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-mt76-npu-eagle-offload-v2-15-2374614c0de6@kernel.org>
References: <20260122-mt76-npu-eagle-offload-v2-0-2374614c0de6@kernel.org>
In-Reply-To: <20260122-mt76-npu-eagle-offload-v2-0-2374614c0de6@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Kang Yang <kang.yang@airoha.com>
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

This is a preliminary patch to properly manage reset procedure when NPU
offloading is enabled.

Tested-by: Kang Yang <kang.yang@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/dma.c        | 11 +++++++++++
 drivers/net/wireless/mediatek/mt76/mt76.h       | 10 ++++++++++
 drivers/net/wireless/mediatek/mt76/mt7996/dma.c |  5 +++++
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 14 ++++++++++++++
 4 files changed, 40 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index f5c6bb94ccbbda6afe03b24cf245b30c797e855d..2d133ace7c33ac5492e287a53510ee4b6a6b7403 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -881,6 +881,10 @@ mt76_dma_rx_cleanup(struct mt76_dev *dev, struct mt76_queue *q)
 		    mt76_queue_is_wed_rro(q))
 			continue;
 
+		if (mt76_npu_device_active(dev) &&
+		    mt76_queue_is_wed_rro(q))
+			continue;
+
 		if (!mt76_queue_is_wed_rro_rxdmad_c(q) &&
 		    !mt76_queue_is_wed_rro_ind(q))
 			mt76_put_page_pool_buf(buf, false);
@@ -923,6 +927,13 @@ mt76_dma_rx_reset(struct mt76_dev *dev, enum mt76_rxq_id qid)
 	    mt76_queue_is_wed_rro(q))
 		return;
 
+	if (mt76_npu_device_active(dev) &&
+	    mt76_queue_is_wed_rro(q))
+		return;
+
+	if (mt76_queue_is_npu_txfree(q))
+		return;
+
 	mt76_dma_sync_idx(dev, q);
 	if (mt76_queue_is_npu(q))
 		mt76_npu_fill_rx_queue(dev, q);
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index eefc3f555f8afea2af67517683d522b657e20b7b..5e68efc367fce63bcc60a8792e6f9d118283e3ed 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -55,6 +55,8 @@
 				 FIELD_PREP(MT_QFLAG_WED_RING, _n))
 #define MT_NPU_Q_TX(_n)		__MT_NPU_Q(MT76_WED_Q_TX, _n)
 #define MT_NPU_Q_RX(_n)		__MT_NPU_Q(MT76_WED_Q_RX, _n)
+#define MT_NPU_Q_TXFREE(_n)	(FIELD_PREP(MT_QFLAG_WED_TYPE, MT76_WED_Q_TXFREE) | \
+				 FIELD_PREP(MT_QFLAG_WED_RING, _n))
 
 struct mt76_dev;
 struct mt76_phy;
@@ -2003,6 +2005,14 @@ static inline bool mt76_queue_is_npu_rx(struct mt76_queue *q)
 	       FIELD_GET(MT_QFLAG_WED_TYPE, q->flags) == MT76_WED_Q_RX;
 }
 
+static inline bool mt76_queue_is_npu_txfree(struct mt76_queue *q)
+{
+	if (q->flags & MT_QFLAG_WED)
+		return false;
+
+	return FIELD_GET(MT_QFLAG_WED_TYPE, q->flags) == MT76_WED_Q_TXFREE;
+}
+
 struct mt76_txwi_cache *
 mt76_token_release(struct mt76_dev *dev, int token, bool *wake);
 int mt76_token_consume(struct mt76_dev *dev, struct mt76_txwi_cache **ptxwi);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/dma.c b/drivers/net/wireless/mediatek/mt76/mt7996/dma.c
index 1a4f5f5b2a8435933070bb7d8feab26a0c174922..8f5d297dafce23dcb3c1e53678f8d67dab9e8987 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/dma.c
@@ -756,6 +756,9 @@ int mt7996_dma_init(struct mt7996_dev *dev)
 	     (is_mt7992(&dev->mt76)))) {
 		dev->mt76.q_rx[MT_RXQ_MAIN_WA].flags = MT_WED_Q_TXFREE;
 		dev->mt76.q_rx[MT_RXQ_MAIN_WA].wed = wed;
+	} else if (is_mt7992(&dev->mt76) &&
+		   mt76_npu_device_active(&dev->mt76)) {
+		dev->mt76.q_rx[MT_RXQ_MAIN_WA].flags = MT_NPU_Q_TXFREE(0);
 	}
 
 	if (mt7996_has_wa(dev)) {
@@ -888,6 +891,8 @@ int mt7996_dma_init(struct mt7996_dev *dev)
 				/* tx free notify event from WA for band0 */
 				dev->mt76.q_rx[MT_RXQ_TXFREE_BAND0].flags = MT_WED_Q_TXFREE;
 				dev->mt76.q_rx[MT_RXQ_TXFREE_BAND0].wed = wed;
+			} else if (mt76_npu_device_active(&dev->mt76)) {
+				dev->mt76.q_rx[MT_RXQ_TXFREE_BAND0].flags = MT_NPU_Q_TXFREE(0);
 			}
 
 			ret = mt76_queue_alloc(dev,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index ebce6b080886896be746c37690ef38713fe2cbc2..c88a97dbab8d529e71c8bcbb146e7e319c32e6e4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -2563,6 +2563,13 @@ void mt7996_mac_reset_work(struct work_struct *work)
 		    mt76_queue_is_wed_rro(&dev->mt76.q_rx[i]))
 			continue;
 
+		if (mt76_npu_device_active(&dev->mt76) &&
+		    mt76_queue_is_wed_rro(&dev->mt76.q_rx[i]))
+			continue;
+
+		if (mt76_queue_is_npu_txfree(&dev->mt76.q_rx[i]))
+			continue;
+
 		napi_disable(&dev->mt76.napi[i]);
 	}
 	napi_disable(&dev->mt76.tx_napi);
@@ -2618,6 +2625,13 @@ void mt7996_mac_reset_work(struct work_struct *work)
 		    mt76_queue_is_wed_rro(&dev->mt76.q_rx[i]))
 			continue;
 
+		if (mt76_npu_device_active(&dev->mt76) &&
+		    mt76_queue_is_wed_rro(&dev->mt76.q_rx[i]))
+			continue;
+
+		if (mt76_queue_is_npu_txfree(&dev->mt76.q_rx[i]))
+			continue;
+
 		napi_enable(&dev->mt76.napi[i]);
 		local_bh_disable();
 		napi_schedule(&dev->mt76.napi[i]);

-- 
2.52.0


