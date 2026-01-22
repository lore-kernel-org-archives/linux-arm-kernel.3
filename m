Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE921C44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 10:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2RyWFzthzPZpGV6q7BsJhDZrpyFNAi0H1UZVrSt/nV8=; b=QMFZ9NGmwEtFA4wQI7p8rakgy/
	noTu2g5YZtRcQOISmodW/hUdc2Wb1W4FDmYMvlPph3FQDZAyvCVeF09y/O3iAJWocM7/eGH7N90k2
	dIRea/XempL1yeLb98FXDw9wj79mCyFjwb3a7quPAlEWzjhRru+l4ckyBP4ISwJuDvYFZRUNnK6V/
	XpJVUe1SUQImThn21WodgsgzcqX2GjjUxukGhqd7ilnZqh1ZPYPL0TLr575Q6J7DJLqDV542Yde0w
	8c/X/VbCPDx5wRrW25fIuVP5mwaFZDDVV1oENwhSW7ehPZkzcePgO61fW2e+lg0cKvYh58MDGs6oG
	w4hyRolg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis7e-00000006sQH-2lBQ;
	Thu, 22 Jan 2026 10:41:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis7L-00000006ryZ-0mA5;
	Thu, 22 Jan 2026 10:40:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 78D6A4174F;
	Thu, 22 Jan 2026 10:40:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06D21C116C6;
	Thu, 22 Jan 2026 10:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769078446;
	bh=GnGL7E+7P909aX4G+BaWU6tM9ToZknyZMbSj5MwV5v0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VYNJL3E3dv0C0qzK1C2rcZ8ZD804rHK9TPyhxPwoalYPrpbKcpYeT7x0IHQArespV
	 nZ3D/pveDlXmrrzfUAtvdlPp2OzIewnpSDrZ8mQuzilOJfOBP6b0lDz4P7I4mi6+er
	 wBaqDH1kdz4aEDzCYy4fSje/c6FZlIBttVY2T7QIaYhLRjphxzVhiNhNq0QTrtL3ZA
	 IuF8797FwKFkv9YOmxNaeMOxGUgkBanhxjxwjLrnygYrH6rEJmFiSSs/fuVlzWwZbj
	 2bgOjJe66DrrtSVTRab0oLZX/HEa+0kU9aqSaeJwuezkYxZXz1Puzdz9FR8zJfqkWi
	 f439elYzbKKfg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 22 Jan 2026 11:40:00 +0100
Subject: [PATCH mt76 v2 16/17] wifi: mt76: mt7996: Store DMA mapped buffer
 addresses in mt7996_npu_hw_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-mt76-npu-eagle-offload-v2-16-2374614c0de6@kernel.org>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_024047_359917_AC2B25E8 
X-CRM114-Status: GOOD (  14.50  )
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

In order to not always reallocate them during NPU reset, store the DMA
mapped buffer addresses allocated by mt7996_npu_hw_init routine in
mt7996 structure.

Tested-by: Kang Yang <kang.yang@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h |  4 ++
 drivers/net/wireless/mediatek/mt76/mt7996/npu.c    | 58 +++++++++++++---------
 2 files changed, 39 insertions(+), 23 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index a823292814ee589070fb5930a70a16d165855300..195e8ab7876caba602fb520dff8cfdd78bb495dc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -31,6 +31,8 @@
 #define MT7996_RX_MCU_RING_SIZE_WA	1024
 #define MT7996_NPU_TX_RING_SIZE		1024
 #define MT7996_NPU_RX_RING_SIZE		1024
+#define MT7996_NPU_TXD_SIZE		3
+
 /* scatter-gather of mcu event is not supported in connac3 */
 #define MT7996_RX_MCU_BUF_SIZE		(2048 + \
 					 SKB_DATA_ALIGN(sizeof(struct skb_shared_info)))
@@ -475,6 +477,8 @@ struct mt7996_dev {
 		struct list_head page_map[MT7996_RRO_MSDU_PG_HASH_SIZE];
 	} wed_rro;
 
+	dma_addr_t npu_txd_addr[2 * MT7996_NPU_TXD_SIZE];
+
 	bool ibf;
 	u8 fw_debug_wm;
 	u8 fw_debug_wa;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/npu.c b/drivers/net/wireless/mediatek/mt76/mt7996/npu.c
index 7941996891c88333d121e4c739001ea19bff94c9..897918a31b162679c9e133c93894fa88b5a75f6a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/npu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/npu.c
@@ -344,12 +344,14 @@ static int mt7996_npu_txd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
 		MT_BAND0,
 		is_mt7996(&dev->mt76) ? MT_BAND2 : MT_BAND1,
 	};
-	int i;
+	int i, index = 0;
+
+	BUILD_BUG_ON(ARRAY_SIZE(band_list) * 3 !=
+		     ARRAY_SIZE(dev->npu_txd_addr));
 
 	for (i = 0; i < ARRAY_SIZE(band_list); i++) {
 		int err, band = band_list[i], phy_id;
-		dma_addr_t dma_addr;
-		u32 val, size;
+		u32 val;
 
 		err = mt76_npu_get_msg(npu, band + 5,
 				       WLAN_FUNC_GET_WAIT_RXDESC_BASE,
@@ -364,43 +366,29 @@ static int mt7996_npu_txd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
 					       : band;
 		writel(val, &dev->mt76.phys[phy_id]->q_tx[0]->regs->desc_base);
 
-		size = is_mt7996(&dev->mt76) ? band == MT_BAND2
-					     ? MT7996_NPU_TX_RING_SIZE
-					     : MT7996_NPU_RX_RING_SIZE / 2
-					     : MT7996_TX_RING_SIZE;
-		if (!dmam_alloc_coherent(dev->mt76.dma_dev, 256 * size,
-					 &dma_addr, GFP_KERNEL))
-			return -ENOMEM;
-
 		err = mt76_npu_send_msg(npu, band,
 					WLAN_FUNC_SET_WAIT_TX_BUF_SPACE_HW_BASE,
-					dma_addr, GFP_KERNEL);
+					dev->npu_txd_addr[index++], GFP_KERNEL);
 		if (err) {
 			dev_warn(dev->mt76.dev,
 				 "failed setting NPU wlan queue buf addr\n");
 			return err;
 		}
 
-		if (!dmam_alloc_coherent(dev->mt76.dma_dev, 256 * size,
-					 &dma_addr, GFP_KERNEL))
-			return -ENOMEM;
-
 		err = mt76_npu_send_msg(npu, band + 5,
 					WLAN_FUNC_SET_WAIT_TX_BUF_SPACE_HW_BASE,
-					dma_addr, GFP_KERNEL);
+					dev->npu_txd_addr[index++],
+					GFP_KERNEL);
 		if (err) {
 			dev_warn(dev->mt76.dev,
 				 "failed setting NPU wlan tx buf addr\n");
 			return err;
 		}
 
-		if (!dmam_alloc_coherent(dev->mt76.dma_dev, 256 * 1024,
-					 &dma_addr, GFP_KERNEL))
-			return -ENOMEM;
-
 		err = mt76_npu_send_msg(npu, band + 10,
 					WLAN_FUNC_SET_WAIT_TX_BUF_SPACE_HW_BASE,
-					dma_addr, GFP_KERNEL);
+					dev->npu_txd_addr[index++],
+					GFP_KERNEL);
 		if (err) {
 			dev_warn(dev->mt76.dev,
 				 "failed setting NPU wlan tx buf base\n");
@@ -570,7 +558,31 @@ int __mt7996_npu_hw_init(struct mt7996_dev *dev)
 
 int mt7996_npu_hw_init(struct mt7996_dev *dev)
 {
-	int err;
+	int i, err;
+
+	BUILD_BUG_ON(ARRAY_SIZE(dev->npu_txd_addr) % 3);
+
+	for (i = 0; i < ARRAY_SIZE(dev->npu_txd_addr); i += 3) {
+		int band = i && is_mt7996(&dev->mt76) ? MT_BAND2 : MT_BAND0;
+		u32 size = is_mt7996(&dev->mt76) ? band == MT_BAND2
+						 ? MT7996_NPU_TX_RING_SIZE
+						 : MT7996_NPU_RX_RING_SIZE / 2
+						 : MT7996_TX_RING_SIZE;
+
+		if (!dmam_alloc_coherent(dev->mt76.dma_dev, 256 * size,
+					 &dev->npu_txd_addr[i], GFP_KERNEL))
+			return -ENOMEM;
+
+		if (!dmam_alloc_coherent(dev->mt76.dma_dev, 256 * size,
+					 &dev->npu_txd_addr[i + 1],
+					 GFP_KERNEL))
+			return -ENOMEM;
+
+		if (!dmam_alloc_coherent(dev->mt76.dma_dev, 256 * 1024,
+					 &dev->npu_txd_addr[i + 2],
+					 GFP_KERNEL))
+			return -ENOMEM;
+	}
 
 	mutex_lock(&dev->mt76.mutex);
 	err = __mt7996_npu_hw_init(dev);

-- 
2.52.0


