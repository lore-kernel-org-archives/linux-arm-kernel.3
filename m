Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F99D1D893
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 08:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+irdYQ55lAjXovfmD1rXTK8/JD/sbh+KiEDf10dmDBk=; b=YrIUuzEZIeJD5PbpbfqaB/LQdK
	YJs3PYaM9GxTxzE3tOkueweQHVIMTCo67FV+nRtc7Jwllb83fzFbodGRQexEo40Ckp7MB8Xf/B1Zl
	0uYo+x/dI5mI/lcvmYhRkpUF/Cey/hdGZhHN2d0VfBye7J86hqOOl9ZWh0WSvDT7aP/vrKMsGCo1D
	XdxqXSEXfkex+Wnz4Cisk9CxXjTrkAbxQ5NoU1SobaJxX24p1PEb8mHnOUZKWo27sIQacjgFO0Tvb
	U7g0E/V4OnJfNsdL2HMAHXgX8CfQtPA1O1qiDJgi7aoxwpBTG3Rzq+XUXwfmFrENU31/upk4cnv00
	yKoQ1Gtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR4RB-00000007ejb-1XkQ;
	Thu, 04 Dec 2025 08:11:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR4R7-00000007eev-1Anu;
	Thu, 04 Dec 2025 08:11:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 757B444094;
	Thu,  4 Dec 2025 08:11:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5104C4CEFB;
	Thu,  4 Dec 2025 08:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764835894;
	bh=9tkiIoFRCYZoXUyUbxUPn15FtFCqvMqqWuG2MjAgwnM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Pi/g7otKqRIiFGvIX4xL7IEzBgfVdqdxzAC9ulp4ORE5QV4MaPUwqpocavkQ9Z2TA
	 MACoajbNq3k9pQi0ErArJ/4f7CTveRv/NeJx7FBn//GJTWwJXUU5Z+i/zjvh9an1Td
	 ZxUQpyJiWWNxQM73rGysOfIyAt8rjqs/G3FtS5dHZKm+kFf0J6K9UhIIFvRHV4OGg0
	 9brZKQc4KsLTkG9Cl/RB2Jvi7BHiyBq6rzzhTpmwtz/QqQM3yhRD0tVHRd0a7LVdEu
	 4sC7yQvEFNWRjB/H1G+UcEbxYXDSMNCtliWliBp5gOhzx3w/lmsIds+kVd068jl5WK
	 DeX6x+2a7kl9g==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 04 Dec 2025 09:10:46 +0100
Subject: [PATCH mt76 04/11] wifi: mt76: mt7996: Fix BAND2 tx queues
 initialization when NPU is enabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-mt76-npu-eagle-offload-v1-4-7819c52c0893@kernel.org>
References: <20251204-mt76-npu-eagle-offload-v1-0-7819c52c0893@kernel.org>
In-Reply-To: <20251204-mt76-npu-eagle-offload-v1-0-7819c52c0893@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Hui Ma <hui.ma@airoha.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_001138_830061_E5C0E657 
X-CRM114-Status: GOOD (  14.89  )
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

Fix BAND2 tx queues initialization for MT7996 chipset when NPU is
enabled. This is a preliminary patch to enable NPU offload for MT7996
(7990-Eagle) chipset.

Tested-by: Hui Ma <hui.ma@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/init.c   | 18 ++++++++++++------
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h |  1 +
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index 00a8286bd136862d756706d6ad8098a2ddc3ca4e..9fbe4235de0d0d42776d5661fa1c297e431b8d27 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -668,8 +668,9 @@ static int mt7996_register_phy(struct mt7996_dev *dev, enum mt76_band_id band)
 		return 0;
 
 	if (dev->hif2 &&
-	    ((is_mt7996(&dev->mt76) && band == MT_BAND2) ||
-	     (is_mt7992(&dev->mt76) && band == MT_BAND1))) {
+	    ((is_mt7992(&dev->mt76) && band == MT_BAND1) ||
+	     (is_mt7996(&dev->mt76) && band == MT_BAND2 &&
+	      !mt76_npu_device_active(&dev->mt76)))) {
 		hif1_ofs = MT_WFDMA0_PCIE1(0) - MT_WFDMA0(0);
 		wed = &dev->mt76.mmio.wed_hif2;
 	}
@@ -709,14 +710,19 @@ static int mt7996_register_phy(struct mt7996_dev *dev, enum mt76_band_id band)
 	/* init wiphy according to mphy and phy */
 	mt7996_init_wiphy_band(mphy->hw, phy);
 
-	if (is_mt7996(&dev->mt76) && !dev->hif2 && band == MT_BAND1) {
+	if (is_mt7996(&dev->mt76) &&
+	    ((band == MT_BAND1 && !dev->hif2) ||
+	     (band == MT_BAND2 && mt76_npu_device_active(&dev->mt76)))) {
 		int i;
 
 		for (i = 0; i <= MT_TXQ_PSD; i++)
-			mphy->q_tx[i] = dev->mt76.phys[MT_BAND0]->q_tx[0];
+			mphy->q_tx[i] = dev->mt76.phys[band - 1]->q_tx[0];
 	} else {
-		ret = mt7996_init_tx_queues(mphy->priv, MT_TXQ_ID(band),
-					    MT7996_TX_RING_SIZE,
+		int size = is_mt7996(&dev->mt76) &&
+			   mt76_npu_device_active(&dev->mt76)
+			   ? MT7996_NPU_TX_RING_SIZE / 2 : MT7996_TX_RING_SIZE;
+
+		ret = mt7996_init_tx_queues(mphy->priv, MT_TXQ_ID(band), size,
 					    MT_TXQ_RING_BASE(band) + hif1_ofs,
 					    wed);
 		if (ret)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index 7a884311800ea8cfc0e302b2a140a4072ce18b69..29a77d75099033727f5df5a487216c043fd04f85 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -29,6 +29,7 @@
 #define MT7996_RX_RING_SIZE		1536
 #define MT7996_RX_MCU_RING_SIZE		512
 #define MT7996_RX_MCU_RING_SIZE_WA	1024
+#define MT7996_NPU_TX_RING_SIZE		1024
 /* scatter-gather of mcu event is not supported in connac3 */
 #define MT7996_RX_MCU_BUF_SIZE		(2048 + \
 					 SKB_DATA_ALIGN(sizeof(struct skb_shared_info)))

-- 
2.52.0


