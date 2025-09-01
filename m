Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F91FCA1007
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 23:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8640/X5GgxrJKZjDASd1cd9xBcGfAFIcfe4DUa1IB3E=; b=DnWwX8A530tdPB5JmYAeMtRNlA
	bYJBg88dGyu+0EzAb2DGODQi+xwGQzLaJRDoC00EGgPgZqEuR42Uh5sP0ZmoNaD+ZhcmSPHmICCNA
	r9gfH8Fr9GF+D9Dzr5Zc4keFPFGJyNOAa8n64oVI/pNk53GNIaPnerunSUWh2/rHEUNcBe0E2zuco
	QNsbOzsf3ZFuq6H/G7OCkrwNyUS4NR3/gMu8m+Lzwmm7JVmXyJxQx0ck1PXa4k93IK0kGwYRGWeAm
	1WPiI21UnDrzMpj+fqEyyuFFF4ggr4wC1CH7NRQH3sHgE+Yi7LPDlYR5tFfYVV/jTvhIwB6xZDdOi
	YAY09R2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDnk-0000000EJ4t-3tOh;
	Mon, 01 Sep 2025 23:19:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utBbd-0000000DtG9-1rSV;
	Mon, 01 Sep 2025 20:58:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2C3CF44746;
	Mon,  1 Sep 2025 20:58:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEA13C4CEF0;
	Mon,  1 Sep 2025 20:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756760305;
	bh=Qa+QGrBL38NAhpR4eNP1ahLdeQEyPJIqSr/n9x+uvyk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Pp100LJFHiZGRWEVS9sl7TfBgGY9FKJNtNYxTh31vR0ymgb80iLQ0WWvMF8fii9Em
	 XtpsQl9J725L1BJ24BxXXk3Er54vBFlyc1aSV2OBZ4yIrkESGhtcStf2+RQA0S+oSu
	 Bl6G1u//XCOssfWJ7y4cpjde+08kQe8XWfP7w/xfCp0gmtMwNj/0ylYRLliv08vNw/
	 HyUg6Ts02goOJfW58Loz6H3S9TKTsYl/oWs3yqpeaZMmjj2EMQBMh+EEbs54pNK3K0
	 2MiOLfrQSdwAvU1WJ1wFVGkbQnaOTgMIUpw65ESA6eDsH6Z7d4Jdn6bG1NEtSTxC6f
	 Y6rZzxeazfCDQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 01 Sep 2025 22:57:57 +0200
Subject: [PATCH mt76 v2 01/14] wifi: mt76: Add reset_idx to reset_q
 mt76_queue_ops signature.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-mt7996-rro-rework-v2-1-1f95086b51d1@kernel.org>
References: <20250901-mt7996-rro-rework-v2-0-1f95086b51d1@kernel.org>
In-Reply-To: <20250901-mt7996-rro-rework-v2-0-1f95086b51d1@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Rex Lu <rex.lu@mediatek.com>, 
 Benjamin Lin <benjamin-jw.lin@mediatek.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_135825_532832_90819E30 
X-CRM114-Status: GOOD (  13.19  )
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
2.50.1


