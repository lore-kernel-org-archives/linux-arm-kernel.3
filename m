Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C9DCA100D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 00:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CUuo6lKbkUOiCzOrwAg7ZeyS78M9tcY7SSzYMVRQk+Q=; b=vxHQs7dyazNwxxQ+Nsn9dgKO6X
	WqBorfu18U63HXnchPBw1EFrWo4A/yNp4lLh20T5XkNIS1PUjd/f43Qd9jVGXChomf8q39Zp2YQQn
	tvNoN+mvNCq1IS5jblCqfi3RwRx0xja6w7M6gq4LroO3V8GIR9uKvhLUDOBCN29GEPEjAmwunzKVe
	3F0JIlYIjJp37SLFgxnJ2YLG+H/1pskpb6KPiSFY451kwPbBVc93drpdawKoX9cUCNMHZdSs8Z9hR
	TcXAEEP2KBfzQi617fw18O86yk0E6ZOmSE7ZIv5A48z4JYAD0JDQLvBMCycd23K0bfuRLVuFUrtZf
	h3MD/dTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utFGL-0000000EYbG-1okR;
	Tue, 02 Sep 2025 00:52:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utBbl-0000000DtIN-3dPN;
	Mon, 01 Sep 2025 20:58:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3FA92600BB;
	Mon,  1 Sep 2025 20:58:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96A05C4CEF0;
	Mon,  1 Sep 2025 20:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756760312;
	bh=/kBqUbAKFKte7sNG+j7FcLbo7s74p2vGEkUuicqUCtU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qaENrfn9RRl5o1sCi9SXILV4QZhvHZZSwTfZw2j4IP56dV9WyBRzf+HyQcZKrtuQc
	 Doal+j8OlYwA5heaseptWibSaNkOwJmXe0N6sKOqI54djm0/kwFc4ji/ZYb2zFLcgJ
	 7Qdv9MuB3bTnpzDjRTAboJsu5VYIyb1irde/lDmFFlwcdcCXSv8nU+fa4DHreXeE2d
	 xo2PYI3z5JX5bCeJ68SVdnGAb8U/+Cr3d8ecrUuIXeZE94nKq16D6oL1wIND3MBYl0
	 73x8d8nwyGqzAKdo5+wk6DyTWZFwTXO6mTWlPI1FG+ObXn6pRaz2ZIMagm+rT3Acwv
	 omr5j0s3XMnYg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 01 Sep 2025 22:58:00 +0200
Subject: [PATCH mt76 v2 04/14] wifi: mt76: mt7996: Initial DMA
 configuration for MT7992 WED support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-mt7996-rro-rework-v2-4-1f95086b51d1@kernel.org>
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

Manage differences in DMA and RX queues configuration for MT7992 and
MT7996.
This is a preliminary patch to enable WED support for MT7992 Kite
chipset supported by MT7996 driver.

Co-developed-by: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
Co-developed-by: Benjamin Lin <benjamin-jw.lin@mediatek.com>
Signed-off-by: Benjamin Lin <benjamin-jw.lin@mediatek.com>
Signed-off-by: Rex Lu <rex.lu@mediatek.com>
Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/dma.c           |   4 +
 drivers/net/wireless/mediatek/mt76/mt7996/dma.c    | 169 ++++++++++++++++-----
 drivers/net/wireless/mediatek/mt76/mt7996/mmio.c   |   8 +-
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h |   2 +-
 drivers/net/wireless/mediatek/mt76/mt7996/regs.h   |   8 +-
 5 files changed, 148 insertions(+), 43 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index 68b1dd1dbbe0e2b4850e02ee70253b5e248c69bf..f882b4e10858a233a5422ede80d79c21965136e9 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -967,6 +967,10 @@ mt76_dma_init(struct mt76_dev *dev,
 	init_completion(&dev->mmio.wed_reset_complete);
 
 	mt76_for_each_q_rx(dev, i) {
+		if (mtk_wed_device_active(&dev->mmio.wed) &&
+		    mt76_queue_is_wed_rro(&dev->q_rx[i]))
+			continue;
+
 		netif_napi_add(dev->napi_dev, &dev->napi[i], poll);
 		mt76_dma_rx_fill_buf(dev, &dev->q_rx[i], false);
 		napi_enable(&dev->napi[i]);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/dma.c b/drivers/net/wireless/mediatek/mt76/mt7996/dma.c
index c77e619070d34ddbf281a5d90c6c96cbd1bb2283..b3665bb0a433ae4cdbf02fa647d644961509d7aa 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/dma.c
@@ -89,30 +89,60 @@ static void mt7996_dma_config(struct mt7996_dev *dev)
 			   MT7996_RXQ_RRO_BAND0);
 		RXQ_CONFIG(MT_RXQ_MSDU_PAGE_BAND0, WFDMA0, MT_INT_RX_DONE_MSDU_PG_BAND0,
 			   MT7996_RXQ_MSDU_PG_BAND0);
-		RXQ_CONFIG(MT_RXQ_TXFREE_BAND0, WFDMA0, MT_INT_RX_TXFREE_MAIN,
-			   MT7996_RXQ_TXFREE0);
-		/* band1 */
-		RXQ_CONFIG(MT_RXQ_MSDU_PAGE_BAND1, WFDMA0, MT_INT_RX_DONE_MSDU_PG_BAND1,
-			   MT7996_RXQ_MSDU_PG_BAND1);
-		/* band2 */
-		RXQ_CONFIG(MT_RXQ_RRO_BAND2, WFDMA0, MT_INT_RX_DONE_RRO_BAND2,
-			   MT7996_RXQ_RRO_BAND2);
-		RXQ_CONFIG(MT_RXQ_MSDU_PAGE_BAND2, WFDMA0, MT_INT_RX_DONE_MSDU_PG_BAND2,
-			   MT7996_RXQ_MSDU_PG_BAND2);
-		RXQ_CONFIG(MT_RXQ_TXFREE_BAND2, WFDMA0, MT_INT_RX_TXFREE_TRI,
-			   MT7996_RXQ_TXFREE2);
+		if (is_mt7996(&dev->mt76)) {
+			RXQ_CONFIG(MT_RXQ_TXFREE_BAND0, WFDMA0,
+				   MT_INT_RX_TXFREE_MAIN, MT7996_RXQ_TXFREE0);
+			/* band1 */
+			RXQ_CONFIG(MT_RXQ_MSDU_PAGE_BAND1, WFDMA0,
+				   MT_INT_RX_DONE_MSDU_PG_BAND1,
+				   MT7996_RXQ_MSDU_PG_BAND1);
+			/* band2 */
+			RXQ_CONFIG(MT_RXQ_RRO_BAND2, WFDMA0,
+				   MT_INT_RX_DONE_RRO_BAND2,
+				   MT7996_RXQ_RRO_BAND2);
+			RXQ_CONFIG(MT_RXQ_MSDU_PAGE_BAND2, WFDMA0,
+				   MT_INT_RX_DONE_MSDU_PG_BAND2,
+				   MT7996_RXQ_MSDU_PG_BAND2);
+			RXQ_CONFIG(MT_RXQ_TXFREE_BAND2, WFDMA0,
+				   MT_INT_RX_TXFREE_TRI, MT7996_RXQ_TXFREE2);
+		} else {
+			RXQ_CONFIG(MT_RXQ_RRO_BAND1, WFDMA0,
+				   MT_INT_RX_DONE_RRO_BAND1,
+				   MT7996_RXQ_RRO_BAND1);
+		}
 
 		RXQ_CONFIG(MT_RXQ_RRO_IND, WFDMA0, MT_INT_RX_DONE_RRO_IND,
 			   MT7996_RXQ_RRO_IND);
 	}
 
 	/* data tx queue */
-	TXQ_CONFIG(0, WFDMA0, MT_INT_TX_DONE_BAND0, MT7996_TXQ_BAND0);
 	if (is_mt7996(&dev->mt76)) {
-		TXQ_CONFIG(1, WFDMA0, MT_INT_TX_DONE_BAND1, MT7996_TXQ_BAND1);
-		TXQ_CONFIG(2, WFDMA0, MT_INT_TX_DONE_BAND2, MT7996_TXQ_BAND2);
+		TXQ_CONFIG(0, WFDMA0, MT_INT_TX_DONE_BAND0, MT7996_TXQ_BAND0);
+		if (dev->hif2) {
+			/* default bn1:ring19 bn2:ring21 */
+			TXQ_CONFIG(1, WFDMA0, MT_INT_TX_DONE_BAND1,
+				   MT7996_TXQ_BAND1);
+			TXQ_CONFIG(2, WFDMA0, MT_INT_TX_DONE_BAND2,
+				   MT7996_TXQ_BAND2);
+		} else {
+			/* single pcie bn0/1:ring18 bn2:ring19 */
+			TXQ_CONFIG(2, WFDMA0, MT_INT_TX_DONE_BAND1,
+				   MT7996_TXQ_BAND1);
+		}
 	} else {
-		TXQ_CONFIG(1, WFDMA0, MT_INT_TX_DONE_BAND1, MT7996_TXQ_BAND1);
+		if (dev->hif2) {
+			/*  bn0:ring18 bn1:ring21 */
+			TXQ_CONFIG(0, WFDMA0, MT_INT_TX_DONE_BAND0,
+				   MT7996_TXQ_BAND0);
+			TXQ_CONFIG(1, WFDMA0, MT_INT_TX_DONE_BAND2,
+				   MT7996_TXQ_BAND2);
+		} else {
+			/* single pcie bn0:ring18 bn1:ring19 */
+			TXQ_CONFIG(0, WFDMA0, MT_INT_TX_DONE_BAND0,
+				   MT7996_TXQ_BAND0);
+			TXQ_CONFIG(1, WFDMA0, MT_INT_TX_DONE_BAND1,
+				   MT7996_TXQ_BAND1);
+		}
 	}
 
 	/* mcu tx queue */
@@ -288,8 +318,11 @@ void mt7996_dma_start(struct mt7996_dev *dev, bool reset, bool wed_reset)
 	if (mt7996_band_valid(dev, MT_BAND0))
 		irq_mask |= MT_INT_BAND0_RX_DONE;
 
-	if (mt7996_band_valid(dev, MT_BAND1))
+	if (mt7996_band_valid(dev, MT_BAND1)) {
 		irq_mask |= MT_INT_BAND1_RX_DONE;
+		if (is_mt7992(&dev->mt76) && dev->hif2)
+			irq_mask |= MT_INT_RX_TXFREE_BAND1_EXT;
+	}
 
 	if (mt7996_band_valid(dev, MT_BAND2))
 		irq_mask |= MT_INT_BAND2_RX_DONE;
@@ -378,8 +411,19 @@ static void mt7996_dma_enable(struct mt7996_dev *dev, bool reset)
 			 WF_WFDMA0_GLO_CFG_EXT1_TX_FCTRL_MODE);
 
 		mt76_set(dev, MT_WFDMA_HOST_CONFIG,
-			 MT_WFDMA_HOST_CONFIG_PDMA_BAND |
-			 MT_WFDMA_HOST_CONFIG_BAND2_PCIE1);
+			 MT_WFDMA_HOST_CONFIG_PDMA_BAND);
+
+		mt76_clear(dev, MT_WFDMA_HOST_CONFIG,
+			   MT_WFDMA_HOST_CONFIG_BAND0_PCIE1 |
+			   MT_WFDMA_HOST_CONFIG_BAND1_PCIE1 |
+			   MT_WFDMA_HOST_CONFIG_BAND2_PCIE1);
+
+		if (is_mt7996(&dev->mt76))
+			mt76_set(dev, MT_WFDMA_HOST_CONFIG,
+				 MT_WFDMA_HOST_CONFIG_BAND2_PCIE1);
+		else
+			mt76_set(dev, MT_WFDMA_HOST_CONFIG,
+				 MT_WFDMA_HOST_CONFIG_BAND1_PCIE1);
 
 		/* AXI read outstanding number */
 		mt76_rmw(dev, MT_WFDMA_AXI_R2A_CTRL,
@@ -397,12 +441,18 @@ static void mt7996_dma_enable(struct mt7996_dev *dev, bool reset)
 		 * so, redirect pcie0 rx ring3 interrupt to pcie1
 		 */
 		if (mtk_wed_device_active(&dev->mt76.mmio.wed) &&
-		    dev->has_rro)
+		    dev->has_rro) {
+			u32 intr = is_mt7996(&dev->mt76) ?
+				   MT_WFDMA0_RX_INT_SEL_RING6 :
+				   MT_WFDMA0_RX_INT_SEL_RING9 |
+				   MT_WFDMA0_RX_INT_SEL_RING5;
+
 			mt76_set(dev, MT_WFDMA0_RX_INT_PCIE_SEL + hif1_ofs,
-				 MT_WFDMA0_RX_INT_SEL_RING6);
-		else
+				 intr);
+		} else {
 			mt76_set(dev, MT_WFDMA0_RX_INT_PCIE_SEL,
 				 MT_WFDMA0_RX_INT_SEL_RING3);
+		}
 	}
 
 	mt7996_dma_start(dev, reset, true);
@@ -437,7 +487,7 @@ int mt7996_dma_rro_init(struct mt7996_dev *dev)
 	if (ret)
 		return ret;
 
-	if (mt7996_band_valid(dev, MT_BAND1)) {
+	if (mt7996_band_valid(dev, MT_BAND1) && is_mt7996(&dev->mt76)) {
 		/* rx msdu page queue for band1 */
 		mdev->q_rx[MT_RXQ_MSDU_PAGE_BAND1].flags =
 			MT_WED_RRO_Q_MSDU_PG(1) | MT_QFLAG_WED_RRO_EN;
@@ -560,7 +610,9 @@ int mt7996_dma_init(struct mt7996_dev *dev)
 		return ret;
 
 	/* tx free notify event from WA for band0 */
-	if (mtk_wed_device_active(wed) && !dev->has_rro) {
+	if (mtk_wed_device_active(wed) &&
+	    ((is_mt7996(&dev->mt76) && !dev->has_rro) ||
+	     (is_mt7992(&dev->mt76)))) {
 		dev->mt76.q_rx[MT_RXQ_MAIN_WA].flags = MT_WED_Q_TXFREE;
 		dev->mt76.q_rx[MT_RXQ_MAIN_WA].wed = wed;
 	}
@@ -630,6 +682,11 @@ int mt7996_dma_init(struct mt7996_dev *dev)
 	} else if (mt7996_band_valid(dev, MT_BAND1)) {
 		/* rx data queue for mt7992 band1 */
 		rx_base = MT_RXQ_RING_BASE(MT_RXQ_BAND1) + hif1_ofs;
+		if (mtk_wed_device_active(wed) && mtk_wed_get_rx_capa(wed)) {
+			dev->mt76.q_rx[MT_RXQ_BAND1].flags = MT_WED_Q_RX(1);
+			dev->mt76.q_rx[MT_RXQ_BAND1].wed = wed;
+		}
+
 		ret = mt76_queue_alloc(dev, &dev->mt76.q_rx[MT_RXQ_BAND1],
 				       MT_RXQ_ID(MT_RXQ_BAND1),
 				       MT7996_RX_RING_SIZE,
@@ -641,6 +698,12 @@ int mt7996_dma_init(struct mt7996_dev *dev)
 		/* tx free notify event from WA for mt7992 band1 */
 		if (mt7996_has_wa(dev)) {
 			rx_base = MT_RXQ_RING_BASE(MT_RXQ_BAND1_WA) + hif1_ofs;
+			if (mtk_wed_device_active(wed_hif2)) {
+				dev->mt76.q_rx[MT_RXQ_BAND1_WA].flags =
+					MT_WED_Q_TXFREE;
+				dev->mt76.q_rx[MT_RXQ_BAND1_WA].wed = wed_hif2;
+			}
+
 			ret = mt76_queue_alloc(dev, &dev->mt76.q_rx[MT_RXQ_BAND1_WA],
 					       MT_RXQ_ID(MT_RXQ_BAND1_WA),
 					       MT7996_RX_MCU_RING_SIZE,
@@ -665,17 +728,32 @@ int mt7996_dma_init(struct mt7996_dev *dev)
 		if (ret)
 			return ret;
 
-		/* tx free notify event from WA for band0 */
-		dev->mt76.q_rx[MT_RXQ_TXFREE_BAND0].flags = MT_WED_Q_TXFREE;
-		dev->mt76.q_rx[MT_RXQ_TXFREE_BAND0].wed = wed;
+		if (is_mt7992(&dev->mt76)) {
+			dev->mt76.q_rx[MT_RXQ_RRO_BAND1].flags =
+				MT_WED_RRO_Q_DATA(1) | MT_QFLAG_WED_RRO_EN;
+			dev->mt76.q_rx[MT_RXQ_RRO_BAND1].wed = wed;
+			ret = mt76_queue_alloc(dev,
+					       &dev->mt76.q_rx[MT_RXQ_RRO_BAND1],
+					       MT_RXQ_ID(MT_RXQ_RRO_BAND1),
+					       MT7996_RX_RING_SIZE,
+					       MT7996_RX_BUF_SIZE,
+					       MT_RXQ_RING_BASE(MT_RXQ_RRO_BAND1) + hif1_ofs);
+			if (ret)
+				return ret;
+		} else {
+			/* tx free notify event from WA for band0 */
+			dev->mt76.q_rx[MT_RXQ_TXFREE_BAND0].flags = MT_WED_Q_TXFREE;
+			dev->mt76.q_rx[MT_RXQ_TXFREE_BAND0].wed = wed;
 
-		ret = mt76_queue_alloc(dev, &dev->mt76.q_rx[MT_RXQ_TXFREE_BAND0],
-				       MT_RXQ_ID(MT_RXQ_TXFREE_BAND0),
-				       MT7996_RX_MCU_RING_SIZE,
-				       MT7996_RX_BUF_SIZE,
-				       MT_RXQ_RING_BASE(MT_RXQ_TXFREE_BAND0));
-		if (ret)
-			return ret;
+			ret = mt76_queue_alloc(dev,
+					       &dev->mt76.q_rx[MT_RXQ_TXFREE_BAND0],
+					       MT_RXQ_ID(MT_RXQ_TXFREE_BAND0),
+					       MT7996_RX_MCU_RING_SIZE,
+					       MT7996_RX_BUF_SIZE,
+					       MT_RXQ_RING_BASE(MT_RXQ_TXFREE_BAND0));
+			if (ret)
+				return ret;
+		}
 
 		if (mt7996_band_valid(dev, MT_BAND2)) {
 			/* rx rro data queue for band2 */
@@ -778,18 +856,29 @@ void mt7996_dma_reset(struct mt7996_dev *dev, bool force)
 		mt76_queue_reset(dev, dev->mt76.q_mcu[i], true);
 
 	mt76_for_each_q_rx(&dev->mt76, i) {
-		if (mtk_wed_device_active(&dev->mt76.mmio.wed))
-			if (mt76_queue_is_wed_rro(&dev->mt76.q_rx[i]) ||
-			    mt76_queue_is_wed_tx_free(&dev->mt76.q_rx[i]))
-				continue;
+		struct mt76_queue *q = &dev->mt76.q_rx[i];
 
-		mt76_queue_reset(dev, &dev->mt76.q_rx[i], true);
+		if (mtk_wed_device_active(&dev->mt76.mmio.wed)) {
+			if (mt76_queue_is_wed_rro(q) ||
+			    mt76_queue_is_wed_tx_free(q)) {
+				if (force && mt76_queue_is_wed_rro_data(q))
+					mt76_queue_reset(dev, q, false);
+				continue;
+			}
+		}
+		mt76_queue_reset(dev, q, true);
 	}
 
 	mt76_tx_status_check(&dev->mt76, true);
 
-	mt76_for_each_q_rx(&dev->mt76, i)
+	mt76_for_each_q_rx(&dev->mt76, i) {
+		if (mtk_wed_device_active(&dev->mt76.mmio.wed) && force &&
+		    (mt76_queue_is_wed_rro_ind(&dev->mt76.q_rx[i]) ||
+		     mt76_queue_is_wed_rro_msdu_pg(&dev->mt76.q_rx[i])))
+			continue;
+
 		mt76_queue_rx_reset(dev, i);
+	}
 
 	mt7996_dma_enable(dev, !force);
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c b/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c
index fb2428a9b877899a0a6fb879aba84e1f6e7840f2..a8b4ef433c2bfdbbf79ae7f6aa54f33a5d5254ff 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c
@@ -690,12 +690,18 @@ static void mt7996_irq_tasklet(struct tasklet_struct *t)
 					       dev->mt76.mmio.irqmask);
 		if (intr1 & MT_INT_RX_TXFREE_EXT)
 			napi_schedule(&dev->mt76.napi[MT_RXQ_TXFREE_BAND2]);
+
+		if (intr1 & MT_INT_RX_DONE_BAND2_EXT)
+			napi_schedule(&dev->mt76.napi[MT_RXQ_BAND2]);
+
+		if (intr1 & MT_INT_RX_TXFREE_BAND1_EXT)
+			napi_schedule(&dev->mt76.napi[MT_RXQ_BAND1_WA]);
 	}
 
 	if (mtk_wed_device_active(wed)) {
 		mtk_wed_device_irq_set_mask(wed, 0);
 		intr = mtk_wed_device_irq_get(wed, dev->mt76.mmio.irqmask);
-		intr |= (intr1 & ~MT_INT_RX_TXFREE_EXT);
+		intr |= (intr1 & ~MT_INT_TX_RX_DONE_EXT);
 	} else {
 		mt76_wr(dev, MT_INT_MASK_CSR, 0);
 		if (dev->hif2)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index 97b84710667ffdb5b6188a72d6f8475f7eb9a128..c210dfd5e37a91ded70e09f51bca52406d7b9d53 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -178,7 +178,7 @@ enum mt7996_rxq_id {
 	MT7996_RXQ_BAND1 = 5, /* for mt7992 */
 	MT7996_RXQ_BAND2 = 5,
 	MT7996_RXQ_RRO_BAND0 = 8,
-	MT7996_RXQ_RRO_BAND1 = 8,/* unused */
+	MT7996_RXQ_RRO_BAND1 = 9,
 	MT7996_RXQ_RRO_BAND2 = 6,
 	MT7996_RXQ_MSDU_PG_BAND0 = 10,
 	MT7996_RXQ_MSDU_PG_BAND1 = 11,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/regs.h b/drivers/net/wireless/mediatek/mt76/mt7996/regs.h
index e942c0058731cd00bc592e506189820122f2a429..4b8bc008ab3143dcf44cd40b17b9f09778cfd464 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/regs.h
@@ -412,7 +412,9 @@ enum offs_rev {
 
 #define MT_WFDMA0_RX_INT_PCIE_SEL		MT_WFDMA0(0x154)
 #define MT_WFDMA0_RX_INT_SEL_RING3		BIT(3)
+#define MT_WFDMA0_RX_INT_SEL_RING5		BIT(5)
 #define MT_WFDMA0_RX_INT_SEL_RING6		BIT(6)
+#define MT_WFDMA0_RX_INT_SEL_RING9		BIT(9)
 
 #define MT_WFDMA0_MCU_HOST_INT_ENA		MT_WFDMA0(0x1f4)
 
@@ -451,6 +453,8 @@ enum offs_rev {
 
 #define MT_WFDMA_HOST_CONFIG			MT_WFDMA_EXT_CSR(0x30)
 #define MT_WFDMA_HOST_CONFIG_PDMA_BAND		BIT(0)
+#define MT_WFDMA_HOST_CONFIG_BAND0_PCIE1	BIT(20)
+#define MT_WFDMA_HOST_CONFIG_BAND1_PCIE1	BIT(21)
 #define MT_WFDMA_HOST_CONFIG_BAND2_PCIE1	BIT(22)
 
 #define MT_WFDMA_EXT_CSR_HIF_MISC		MT_WFDMA_EXT_CSR(0x44)
@@ -514,7 +518,9 @@ enum offs_rev {
 #define MT_INT_RX_DONE_WA_EXT			BIT(3) /* for mt7992 */
 #define MT_INT_RX_DONE_WA_TRI			BIT(3)
 #define MT_INT_RX_TXFREE_MAIN			BIT(17)
+#define MT_INT_RX_TXFREE_BAND1			BIT(15)
 #define MT_INT_RX_TXFREE_TRI			BIT(15)
+#define MT_INT_RX_TXFREE_BAND1_EXT		BIT(19) /* for mt7992 two PCIE*/
 #define MT_INT_RX_TXFREE_BAND0_MT7990		BIT(14)
 #define MT_INT_RX_TXFREE_BAND1_MT7990		BIT(15)
 #define MT_INT_RX_DONE_BAND2_EXT		BIT(23)
@@ -522,7 +528,7 @@ enum offs_rev {
 #define MT_INT_MCU_CMD				BIT(29)
 
 #define MT_INT_RX_DONE_RRO_BAND0		BIT(16)
-#define MT_INT_RX_DONE_RRO_BAND1		BIT(16)
+#define MT_INT_RX_DONE_RRO_BAND1		BIT(17)
 #define MT_INT_RX_DONE_RRO_BAND2		BIT(14)
 #define MT_INT_RX_DONE_RRO_IND			BIT(11)
 #define MT_INT_RX_DONE_MSDU_PG_BAND0		BIT(18)

-- 
2.50.1


