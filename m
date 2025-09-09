Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD187CAC596
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 16:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fTss655vhxdUft2ofzsRdjSj+jZ1Aem/pV1rlcBeKqE=; b=lpL5q2EVRe6U0OzIspp+hW3r9a
	WnltJ3M8IFWW1fdWZt43gS7vfZ4ofTFCw7MyO36x9X03YPYFOSyWhlopIYx3TTJcyIaVXSscPCn2X
	UvSsrX+7XRFl+rEiX/4f0/udpuYjMA3CqReus6aBhCygPT0eSsYtAZhV78ZAm6YUam6BfcV5LBtv8
	WEBrOeoFWZpCEyTydz6yaoGVjCdVXoVMeB7OtU5jw2bGERrxk97bhRiuipqL45Bp41D6eATotoipK
	fSOmx0x3cRcTJJKSdbV6LQCs3yWr2kXKYmmRZOh/7SRs2R8K0faRg8BQv+DmGd3c4DGvtbIDqA63W
	N7DjpnPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1Q8-00000008ahQ-3jaP;
	Tue, 09 Sep 2025 16:42:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuul-000000065uJ-3Fry;
	Tue, 09 Sep 2025 09:45:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B89D7601DF;
	Tue,  9 Sep 2025 09:45:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FF24C4CEF4;
	Tue,  9 Sep 2025 09:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757411126;
	bh=63qO3dU+DU3qNsm6kcv0ikjPrEMUL7pdCA8pX5Re53o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=f0v7+EcCLyBaauKkw7dxQ0iFiYn4xW/U2v1VQq/KO1BjzP7YvYkb2yU4UdD03um0o
	 wZxUg/aDVD1evBs6sHeg+HnR4Q5gRCEekInU0MobjevLrI6KmDjOnhGv7ATSAthjJh
	 n1x6cmEMLBMJR9bz5QdyKOIgWyV5b77Db4+dxNAdIiAo49pjekCt0mOC4I3YynFkP/
	 Y6n0Dt0AbZGebGsdGsm4ocR2DeKFXjA4pEB/R2IP6OuPw92ja6Um4xgguDoemNXF0v
	 ekTRUUiNIG7tEmmopSpJP59JQiBjhOgijSKXtdjIAe8yLP6tMR+Kfu+zSkn1PQLX9I
	 Y7tIsw85w98+Q==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 09 Sep 2025 11:45:09 +0200
Subject: [PATCH mt76 v5 01/16] wifi: mt76: Add reset_idx to reset_q
 mt76_queue_ops signature.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-mt7996-rro-rework-v5-1-7d66f6eb7795@kernel.org>
References: <20250909-mt7996-rro-rework-v5-0-7d66f6eb7795@kernel.org>
In-Reply-To: <20250909-mt7996-rro-rework-v5-0-7d66f6eb7795@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Bo Jiao <Bo.Jiao@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Rex Lu <rex.lu@mediatek.com>, 
 Benjamin Lin <benjamin-jw.lin@mediatek.com>
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

Remove __mt76_dma_queue_reset routine and use mt76_dma_queue_reset
directly instead in mt76_queue_ops struct.
This is a preliminary patch to enable WED support for MT7992 Kite
chipset supported by MT7996 driver.

Co-developed-by: Rex Lu <rex.lu@mediatek.com>
Signed-off-by: Rex Lu <rex.lu@mediatek.com>
Co-developed-by: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
Co-developed-by: Benjamin Lin <benjamin-jw.lin@mediatek.com>
Signed-off-by: Benjamin Lin <benjamin-jw.lin@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/dma.c        | 11 +++--------
 drivers/net/wireless/mediatek/mt76/dma.h        |  7 +++----
 drivers/net/wireless/mediatek/mt76/mt76.h       |  3 ++-
 drivers/net/wireless/mediatek/mt76/mt7915/dma.c |  4 ++--
 drivers/net/wireless/mediatek/mt76/mt792x_dma.c |  6 +++---
 drivers/net/wireless/mediatek/mt76/mt7996/dma.c |  4 ++--
 drivers/net/wireless/mediatek/mt76/wed.c        |  8 ++++----
 7 files changed, 19 insertions(+), 24 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index 87f531297f8513b0caee2d034184ddd8fa3b6a21..25c26ff8c8e24352f2bb31c6e185e628a56f609b 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -197,8 +197,8 @@ mt76_dma_sync_idx(struct mt76_dev *dev, struct mt76_queue *q)
 	q->tail = q->head;
 }
 
-void __mt76_dma_queue_reset(struct mt76_dev *dev, struct mt76_queue *q,
-			    bool reset_idx)
+void mt76_dma_queue_reset(struct mt76_dev *dev, struct mt76_queue *q,
+			  bool reset_idx)
 {
 	if (!q || !q->ndesc)
 		return;
@@ -218,11 +218,6 @@ void __mt76_dma_queue_reset(struct mt76_dev *dev, struct mt76_queue *q,
 	mt76_dma_sync_idx(dev, q);
 }
 
-void mt76_dma_queue_reset(struct mt76_dev *dev, struct mt76_queue *q)
-{
-	__mt76_dma_queue_reset(dev, q, true);
-}
-
 static int
 mt76_dma_add_rx_buf(struct mt76_dev *dev, struct mt76_queue *q,
 		    struct mt76_queue_buf *buf, void *data)
@@ -740,7 +735,7 @@ mt76_dma_alloc_queue(struct mt76_dev *dev, struct mt76_queue *q,
 			return 0;
 	}
 
-	mt76_dma_queue_reset(dev, q);
+	mt76_dma_queue_reset(dev, q, true);
 
 	return 0;
 }
diff --git a/drivers/net/wireless/mediatek/mt76/dma.h b/drivers/net/wireless/mediatek/mt76/dma.h
index e3ddc7a837579c0835a704ab8944099d276c6222..320d2cbbbd4559db146139a50e579b9b57282557 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.h
+++ b/drivers/net/wireless/mediatek/mt76/dma.h
@@ -81,14 +81,13 @@ void mt76_dma_attach(struct mt76_dev *dev);
 void mt76_dma_cleanup(struct mt76_dev *dev);
 int mt76_dma_rx_fill(struct mt76_dev *dev, struct mt76_queue *q,
 		     bool allow_direct);
-void __mt76_dma_queue_reset(struct mt76_dev *dev, struct mt76_queue *q,
-			    bool reset_idx);
-void mt76_dma_queue_reset(struct mt76_dev *dev, struct mt76_queue *q);
+void mt76_dma_queue_reset(struct mt76_dev *dev, struct mt76_queue *q,
+			  bool reset_idx);
 
 static inline void
 mt76_dma_reset_tx_queue(struct mt76_dev *dev, struct mt76_queue *q)
 {
-	dev->queue_ops->reset_q(dev, q);
+	dev->queue_ops->reset_q(dev, q, true);
 	if (mtk_wed_device_active(&dev->mmio.wed))
 		mt76_wed_dma_setup(dev, q, true);
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index d518a5441418bce5ae477e7f15dde56b6cb5b87d..314221fec512c99cc15b942b7ef7ccecfd1d987e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -290,7 +290,8 @@ struct mt76_queue_ops {
 
 	void (*kick)(struct mt76_dev *dev, struct mt76_queue *q);
 
-	void (*reset_q)(struct mt76_dev *dev, struct mt76_queue *q);
+	void (*reset_q)(struct mt76_dev *dev, struct mt76_queue *q,
+			bool reset_idx);
 };
 
 enum mt76_phy_type {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/dma.c b/drivers/net/wireless/mediatek/mt76/mt7915/dma.c
index 0c62272fe7d03552c8c260b3971a62fb143895c1..009ef713f437983a0676ed5d4d951a9efcb305e8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/dma.c
@@ -624,13 +624,13 @@ int mt7915_dma_reset(struct mt7915_dev *dev, bool force)
 	}
 
 	for (i = 0; i < __MT_MCUQ_MAX; i++)
-		mt76_queue_reset(dev, dev->mt76.q_mcu[i]);
+		mt76_queue_reset(dev, dev->mt76.q_mcu[i], true);
 
 	mt76_for_each_q_rx(&dev->mt76, i) {
 		if (mt76_queue_is_wed_tx_free(&dev->mt76.q_rx[i]))
 			continue;
 
-		mt76_queue_reset(dev, &dev->mt76.q_rx[i]);
+		mt76_queue_reset(dev, &dev->mt76.q_rx[i], true);
 	}
 
 	mt76_tx_status_check(&dev->mt76, true);
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_dma.c b/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
index 6f9db782338e6e405de49dd07fefae1a1de09f93..69217ce911307b3408a56d0a210b39ac3bc75e8c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
@@ -181,13 +181,13 @@ mt792x_dma_reset(struct mt792x_dev *dev, bool force)
 
 	/* reset hw queues */
 	for (i = 0; i < __MT_TXQ_MAX; i++)
-		mt76_queue_reset(dev, dev->mphy.q_tx[i]);
+		mt76_queue_reset(dev, dev->mphy.q_tx[i], true);
 
 	for (i = 0; i < __MT_MCUQ_MAX; i++)
-		mt76_queue_reset(dev, dev->mt76.q_mcu[i]);
+		mt76_queue_reset(dev, dev->mt76.q_mcu[i], true);
 
 	mt76_for_each_q_rx(&dev->mt76, i)
-		mt76_queue_reset(dev, &dev->mt76.q_rx[i]);
+		mt76_queue_reset(dev, &dev->mt76.q_rx[i], true);
 
 	mt76_tx_status_check(&dev->mt76, true);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/dma.c b/drivers/net/wireless/mediatek/mt76/mt7996/dma.c
index c8bef0b2a14445224689efb4c0fee6c80387a7fa..c77e619070d34ddbf281a5d90c6c96cbd1bb2283 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/dma.c
@@ -775,7 +775,7 @@ void mt7996_dma_reset(struct mt7996_dev *dev, bool force)
 	}
 
 	for (i = 0; i < __MT_MCUQ_MAX; i++)
-		mt76_queue_reset(dev, dev->mt76.q_mcu[i]);
+		mt76_queue_reset(dev, dev->mt76.q_mcu[i], true);
 
 	mt76_for_each_q_rx(&dev->mt76, i) {
 		if (mtk_wed_device_active(&dev->mt76.mmio.wed))
@@ -783,7 +783,7 @@ void mt7996_dma_reset(struct mt7996_dev *dev, bool force)
 			    mt76_queue_is_wed_tx_free(&dev->mt76.q_rx[i]))
 				continue;
 
-		mt76_queue_reset(dev, &dev->mt76.q_rx[i]);
+		mt76_queue_reset(dev, &dev->mt76.q_rx[i], true);
 	}
 
 	mt76_tx_status_check(&dev->mt76, true);
diff --git a/drivers/net/wireless/mediatek/mt76/wed.c b/drivers/net/wireless/mediatek/mt76/wed.c
index 63f69e152b1cbb5bc0170a44976be1c7c52f21dc..907a8e43e72ad1f2a68d097c4a06df4506c4b039 100644
--- a/drivers/net/wireless/mediatek/mt76/wed.c
+++ b/drivers/net/wireless/mediatek/mt76/wed.c
@@ -118,7 +118,7 @@ int mt76_wed_dma_setup(struct mt76_dev *dev, struct mt76_queue *q, bool reset)
 	case MT76_WED_Q_TXFREE:
 		/* WED txfree queue needs ring to be initialized before setup */
 		q->flags = 0;
-		mt76_dma_queue_reset(dev, q);
+		mt76_dma_queue_reset(dev, q, true);
 		mt76_dma_rx_fill(dev, q, false);
 
 		ret = mtk_wed_device_txfree_ring_setup(q->wed, q->regs);
@@ -133,21 +133,21 @@ int mt76_wed_dma_setup(struct mt76_dev *dev, struct mt76_queue *q, bool reset)
 		break;
 	case MT76_WED_RRO_Q_DATA:
 		q->flags &= ~MT_QFLAG_WED;
-		__mt76_dma_queue_reset(dev, q, false);
+		mt76_dma_queue_reset(dev, q, false);
 		mtk_wed_device_rro_rx_ring_setup(q->wed, ring, q->regs);
 		q->head = q->ndesc - 1;
 		q->queued = q->head;
 		break;
 	case MT76_WED_RRO_Q_MSDU_PG:
 		q->flags &= ~MT_QFLAG_WED;
-		__mt76_dma_queue_reset(dev, q, false);
+		mt76_dma_queue_reset(dev, q, false);
 		mtk_wed_device_msdu_pg_rx_ring_setup(q->wed, ring, q->regs);
 		q->head = q->ndesc - 1;
 		q->queued = q->head;
 		break;
 	case MT76_WED_RRO_Q_IND:
 		q->flags &= ~MT_QFLAG_WED;
-		mt76_dma_queue_reset(dev, q);
+		mt76_dma_queue_reset(dev, q, true);
 		mt76_dma_rx_fill(dev, q, false);
 		mtk_wed_device_ind_rx_ring_setup(q->wed, q->regs);
 		break;

-- 
2.51.0


