Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C33C44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 10:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6jJGRPv85OWh3HBfUyldzK7oyjOmYokmRuoEIMIrNUA=; b=PCrQOcAZHaUZu01oBkzUSjdLWs
	cLKBg2/tHQ2QkVy5vj2UcQh7HWLd9Um/7icDZrILqolQCxFJgrDADnrbsKsxc6SMbrjK90xyNEgMJ
	CW8kgzmK0wpOfxLYWLjT/p7jvGsauhoaOS/LN/cbxCTLhW+po3xA/r6rVoqchsNHHyokITQP1ftHp
	JeqTAIf4z4v83vKd2Mgv7JeLNV9uIYyrThv/xu6AYcLbAiyN+B5DzeVaCOtAW9EFGEzhncK/cNHRs
	C3RXwNwjS4b1pcosV3a0mvrIs1EJmOIESHfkz2tvdGhEjlFy6IIyc/Y8sU5ML2HsEyQQYAH/+TodL
	oLi+TdVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis6w-00000006rVQ-07yw;
	Thu, 22 Jan 2026 10:40:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis6r-00000006rRT-1Tu1;
	Thu, 22 Jan 2026 10:40:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 786D66011E;
	Thu, 22 Jan 2026 10:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEED7C19425;
	Thu, 22 Jan 2026 10:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769078416;
	bh=xuRORZfdR4M/WSRo7T9uton7f222LTTNyUa0f+wJB9s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=r75Aiu/oTgroTQdJ5/sxArYiRrJnTihEnqAemmnTGkD1OTn0yS6eAq+cjtHaPmw0w
	 84mwjVHKQAHjYuJXtLNhbCpx4oJKUg0mduadNlizKNR4Nb5ryLlCVMzve248wpp6yM
	 1fUrJqbbQDnYy9JIQKjltvCXqQV1NfsVDxVdRtHpI3z9ttyKscGJiNcauQaigbrxGk
	 N8tkiGxR6ZRvu+3/gPjJt+iAVyNzR3lQ4zRUaThwb+EQEUn6NwcOEdR6v1ofnC77Md
	 kmzumdTkXnxv9r5iLRnie/DoRKJBHhnwuut8SGFeVmvB5ueXep/r99b9bUFIp6sPyJ
	 OBWzkQejoxVlg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 22 Jan 2026 11:39:48 +0100
Subject: [PATCH mt76 v2 04/17] wifi: mt76: mt7996: Fix BAND2 tx queues
 initialization when NPU is enabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-mt76-npu-eagle-offload-v2-4-2374614c0de6@kernel.org>
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

Fix BAND2 tx queues initialization for MT7990 chipset when NPU is
enabled. This is a preliminary patch to enable NPU offload for MT7996
(Eagle) chipset.

Tested-by: Kang Yang <kang.yang@airoha.com>
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


