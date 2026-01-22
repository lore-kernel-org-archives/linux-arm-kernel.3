Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA6FBC44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 10:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gmpkiYtGTJtJzi0pq82yhrtvArpHJTnxVWugifMQrpw=; b=kKLqvA+nrZ5E8T9NJGQEBQ459Y
	SzPMWOhg/f0XfbsIAtJoHxQBhuTLxwqcVJQX1cYf7S5vr1kaTg4aoKJfR6OmLYvi9CLMDvnMcUxiY
	FiqyrYQNrK5xKOXDaAwrqTYMgQFG6MY0RfGlpwkUq5qdP3N+KJPHxjd6DWCHtFt55kLy/YBD1Rlzq
	dmPUgNbt8hCVRd+XuZ+25efdRaBzoSATyUJSBX3PIaTsRB6YwQMMcvmNMmf6Ne2ApOubUg41yLtwR
	9Lm0cN1vnQIVznLTdY3Y1ZK7Ok/LSoHbjqJX6q1GlnIAhWlUuiOoBJfS64cXLJ2WtqTT/qcK3VDE/
	zSyqLfUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis7G-00000006rrF-3FlJ;
	Thu, 22 Jan 2026 10:40:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis70-00000006rbh-49KE;
	Thu, 22 Jan 2026 10:40:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 77015417BA;
	Thu, 22 Jan 2026 10:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 019A0C116C6;
	Thu, 22 Jan 2026 10:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769078426;
	bh=nGDD7GuM7DNWRjbZSh4SRJQiHF6t4wplSLZM/bA+zBg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Hp7mOil3PtDhSb/C/UYgBvf2C54SocOfzH/e7gduUncw98xdvQGU8EDvHH1hdsd+s
	 egS7HsVYGN7KSXJX4JSC2jT1Ccbx09OZejzmwf2aEg7h3/25Eg1PMTxVzCeU4S8VfL
	 OBBhfRU+K0TMESECkqJR7khruL5V7HiZ0X0fJvv8Yt4HhVF8lqXlAeAjBp4RSYaypp
	 6+DrKSAfdtB5sizXgQYX/0ijbD4KpxpdoNmbpEiBor9ng996KMzVGwf02DGapZOJcz
	 RcIFJs4l095mg2SIOeQ+4kYJdFR3OvWYZFegNwGbGY0BzZNjxmXYJX5I1dpsJkHpeX
	 V+ui7lQWjDwlw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 22 Jan 2026 11:39:52 +0100
Subject: [PATCH mt76 v2 08/17] wifi: mt76: mt7996: Add NPU support for
 MT7990 chipset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-mt76-npu-eagle-offload-v2-8-2374614c0de6@kernel.org>
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
X-CRM114-CacheID: sfid-20260122_024027_086126_B9D318DE 
X-CRM114-Status: GOOD (  18.02  )
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

Introduce support for MT7990 chipset in MT7996 npu configuration
codebase.

Tested-by: Kang Yang <kang.yang@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h |   1 +
 drivers/net/wireless/mediatek/mt76/mt7996/npu.c    | 308 ++++++++++++++++++---
 2 files changed, 277 insertions(+), 32 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index 29a77d75099033727f5df5a487216c043fd04f85..de31385aa966116b34e545de92623a214bddc8f8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -30,6 +30,7 @@
 #define MT7996_RX_MCU_RING_SIZE		512
 #define MT7996_RX_MCU_RING_SIZE_WA	1024
 #define MT7996_NPU_TX_RING_SIZE		1024
+#define MT7996_NPU_RX_RING_SIZE		1024
 /* scatter-gather of mcu event is not supported in connac3 */
 #define MT7996_RX_MCU_BUF_SIZE		(2048 + \
 					 SKB_DATA_ALIGN(sizeof(struct skb_shared_info)))
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/npu.c b/drivers/net/wireless/mediatek/mt76/mt7996/npu.c
index a9569278f73bf83454a0357e93602837c6ccaa86..1a77a7dc103762c8cc998508348e418858c30029 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/npu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/npu.c
@@ -17,21 +17,6 @@ static int mt7992_npu_txrx_offload_init(struct mt7996_dev *dev,
 	int i, err;
 
 	for (i = MT_BAND0; i < MT_BAND2; i++) {
-		dma_addr = phy_addr;
-		if (i)
-			dma_addr += MT_RXQ_RING_BASE(MT_RXQ_RRO_BAND1) + 0x90 +
-				    hif1_ofs;
-		else
-			dma_addr += MT_RXQ_RING_BASE(MT_RXQ_RRO_BAND0) + 0x80;
-
-		err = mt76_npu_send_msg(npu, i, WLAN_FUNC_SET_WAIT_PCIE_ADDR,
-					dma_addr, GFP_KERNEL);
-		if (err) {
-			dev_warn(dev->mt76.dev,
-				 "failed setting NPU wlan PCIe desc addr\n");
-			return err;
-		}
-
 		err = mt76_npu_send_msg(npu, i, WLAN_FUNC_SET_WAIT_DESC,
 					MT7996_RX_RING_SIZE, GFP_KERNEL);
 		if (err) {
@@ -84,6 +69,134 @@ static int mt7992_npu_txrx_offload_init(struct mt7996_dev *dev,
 	return 0;
 }
 
+static int mt7996_npu_txrx_offload_init(struct mt7996_dev *dev,
+					struct airoha_npu *npu)
+{
+	u32 hif1_ofs = dev->hif2 ? MT_WFDMA0_PCIE1(0) - MT_WFDMA0(0) : 0;
+	phys_addr_t phy_addr = dev->mt76.mmio.phy_addr;
+	u32 dma_addr;
+	int err;
+
+	/* npu rx rro ring0 */
+	err = mt76_npu_send_msg(npu, 0, WLAN_FUNC_SET_WAIT_DESC,
+				MT7996_RX_RING_SIZE, GFP_KERNEL);
+	if (err) {
+		dev_warn(dev->mt76.dev,
+			 "failed setting NPU wlan rx desc size\n");
+		return err;
+	}
+
+	/* npu rx rro ring1 */
+	err = mt76_npu_send_msg(npu, 2, WLAN_FUNC_SET_WAIT_DESC,
+				MT7996_NPU_RX_RING_SIZE, GFP_KERNEL);
+	if (err) {
+		dev_warn(dev->mt76.dev,
+			 "failed setting NPU wlan rx desc size\n");
+		return err;
+	}
+
+	/* msdu pg  2GHz */
+	dma_addr = phy_addr + MT_RXQ_RING_BASE(MT_RXQ_MSDU_PAGE_BAND0) + 0xa0;
+	err = mt76_npu_send_msg(npu, 5, WLAN_FUNC_SET_WAIT_PCIE_ADDR,
+				dma_addr, GFP_KERNEL);
+	if (err) {
+		dev_warn(dev->mt76.dev,
+			 "failed setting NPU wlan PCIe desc addr\n");
+		return err;
+	}
+
+	err = mt76_npu_send_msg(npu, 5, WLAN_FUNC_SET_WAIT_DESC,
+				MT7996_NPU_RX_RING_SIZE / 4, GFP_KERNEL);
+	if (err) {
+		dev_warn(dev->mt76.dev,
+			 "failed setting NPU wlan rx desc size\n");
+		return err;
+	}
+
+	/* msdu pg 5GHz */
+	dma_addr = phy_addr + MT_RXQ_RING_BASE(MT_RXQ_MSDU_PAGE_BAND1) + 0xb0;
+	err = mt76_npu_send_msg(npu, 6, WLAN_FUNC_SET_WAIT_PCIE_ADDR,
+				dma_addr, GFP_KERNEL);
+	if (err) {
+		dev_warn(dev->mt76.dev,
+			 "failed setting NPU wlan PCIe desc addr\n");
+		return err;
+	}
+
+	err = mt76_npu_send_msg(npu, 6, WLAN_FUNC_SET_WAIT_DESC,
+				MT7996_NPU_RX_RING_SIZE / 2, GFP_KERNEL);
+	if (err) {
+		dev_warn(dev->mt76.dev,
+			 "failed setting NPU wlan rx desc size\n");
+		return err;
+	}
+
+	/* msdu pg 6GHz */
+	dma_addr = phy_addr + MT_RXQ_RING_BASE(MT_RXQ_MSDU_PAGE_BAND2) + 0xc0;
+	err = mt76_npu_send_msg(npu, 7, WLAN_FUNC_SET_WAIT_PCIE_ADDR,
+				dma_addr, GFP_KERNEL);
+	if (err) {
+		dev_warn(dev->mt76.dev,
+			 "failed setting NPU wlan PCIe desc addr\n");
+		return err;
+	}
+
+	err = mt76_npu_send_msg(npu, 7, WLAN_FUNC_SET_WAIT_DESC,
+				MT7996_NPU_RX_RING_SIZE, GFP_KERNEL);
+	if (err) {
+		dev_warn(dev->mt76.dev,
+			 "failed setting NPU wlan rx desc size\n");
+		return err;
+	}
+
+	/* ind cmd ring */
+	err = mt76_npu_send_msg(npu, 8, WLAN_FUNC_SET_WAIT_PCIE_ADDR,
+				phy_addr + MT_RXQ_RRO_IND_RING_BASE,
+				GFP_KERNEL);
+	if (err) {
+		dev_warn(dev->mt76.dev,
+			 "failed setting NPU wlan PCIe desc addr\n");
+		return err;
+	}
+
+	err = mt76_npu_send_msg(npu, 8, WLAN_FUNC_SET_WAIT_DESC,
+				MT7996_RX_RING_SIZE, GFP_KERNEL);
+	if (err) {
+		dev_warn(dev->mt76.dev,
+			 "failed setting NPU wlan rx desc size\n");
+		return err;
+	}
+
+	err = mt76_npu_send_msg(npu, 3, WLAN_FUNC_SET_WAIT_TX_RING_PCIE_ADDR,
+				phy_addr + MT_RRO_ACK_SN_CTRL, GFP_KERNEL);
+	if (err) {
+		dev_warn(dev->mt76.dev,
+			 "failed setting NPU wlan tx desc addr\n");
+		return err;
+	}
+
+	/* npu tx */
+	dma_addr = phy_addr + MT_TXQ_RING_BASE(1) + 0x120;
+	err = mt76_npu_send_msg(npu, 0, WLAN_FUNC_SET_WAIT_TX_RING_PCIE_ADDR,
+				dma_addr, GFP_KERNEL);
+	if (err) {
+		dev_warn(dev->mt76.dev,
+			 "failed setting NPU wlan tx desc addr\n");
+		return err;
+	}
+
+	dma_addr = phy_addr + MT_TXQ_RING_BASE(0) + 0x150 + hif1_ofs;
+	err = mt76_npu_send_msg(npu, 2, WLAN_FUNC_SET_WAIT_TX_RING_PCIE_ADDR,
+				dma_addr, GFP_KERNEL);
+	if (err) {
+		dev_warn(dev->mt76.dev,
+			 "failed setting NPU wlan tx desc addr\n");
+		return err;
+	}
+
+	return 0;
+}
+
 static int mt7996_npu_offload_init(struct mt7996_dev *dev,
 				   struct airoha_npu *npu)
 {
@@ -108,7 +221,11 @@ static int mt7996_npu_offload_init(struct mt7996_dev *dev,
 		return err;
 	}
 
-	err = mt7992_npu_txrx_offload_init(dev, npu);
+	if (is_mt7996(&dev->mt76))
+		err = mt7996_npu_txrx_offload_init(dev, npu);
+	else
+		err = mt7992_npu_txrx_offload_init(dev, npu);
+
 	if (err)
 		return err;
 
@@ -157,15 +274,84 @@ static int mt7992_npu_rxd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
 	return 0;
 }
 
-static int mt7996_npu_txd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
+static int mt7996_npu_rxd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
 {
-	int i, err;
+	u32 val;
+	int err;
 
-	for (i = MT_BAND0; i < MT_BAND2; i++) {
+	err = mt76_npu_get_msg(npu, 0, WLAN_FUNC_GET_WAIT_RXDESC_BASE,
+			       &val, GFP_KERNEL);
+	if (err) {
+		dev_warn(dev->mt76.dev,
+			 "failed retriving NPU wlan rx ring0 addr\n");
+		return err;
+	}
+	writel(val, &dev->mt76.q_rx[MT_RXQ_RRO_BAND0].regs->desc_base);
+
+	err = mt76_npu_get_msg(npu, 2, WLAN_FUNC_GET_WAIT_RXDESC_BASE,
+			       &val, GFP_KERNEL);
+	if (err) {
+		dev_warn(dev->mt76.dev,
+			 "failed retriving NPU wlan rx ring2 addr\n");
+		return err;
+	}
+	writel(val, &dev->mt76.q_rx[MT_RXQ_RRO_BAND2].regs->desc_base);
+
+	/* msdu pg ring */
+	err = mt76_npu_get_msg(npu, 10, WLAN_FUNC_GET_WAIT_RXDESC_BASE,
+			       &val, GFP_KERNEL);
+	if (err) {
+		dev_warn(dev->mt76.dev,
+			 "failed retriving NPU wlan msdu pg ring addr\n");
+		return err;
+	}
+	writel(val, &dev->mt76.q_rx[MT_RXQ_MSDU_PAGE_BAND0].regs->desc_base);
+
+	err = mt76_npu_get_msg(npu, 11, WLAN_FUNC_GET_WAIT_RXDESC_BASE,
+			       &val, GFP_KERNEL);
+	if (err) {
+		dev_warn(dev->mt76.dev,
+			 "failed retriving NPU wlan msdu pg ring addr\n");
+		return err;
+	}
+	writel(val, &dev->mt76.q_rx[MT_RXQ_MSDU_PAGE_BAND1].regs->desc_base);
+
+	err = mt76_npu_get_msg(npu, 12, WLAN_FUNC_GET_WAIT_RXDESC_BASE,
+			       &val, GFP_KERNEL);
+	if (err) {
+		dev_warn(dev->mt76.dev,
+			 "failed retriving NPU wlan msdu pg ring addr\n");
+		return err;
+	}
+	writel(val, &dev->mt76.q_rx[MT_RXQ_MSDU_PAGE_BAND2].regs->desc_base);
+
+	/* ind_cmd ring */
+	err = mt76_npu_get_msg(npu, 8, WLAN_FUNC_GET_WAIT_RXDESC_BASE,
+			       &val, GFP_KERNEL);
+	if (err) {
+		dev_warn(dev->mt76.dev,
+			 "failed retriving NPU wlan ind_cmd ring addr\n");
+		return err;
+	}
+	writel(val, &dev->mt76.q_rx[MT_RXQ_RRO_IND].regs->desc_base);
+
+	return 0;
+}
+
+static int mt7996_npu_txd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
+{
+	const enum mt76_band_id band_list[] = {
+		MT_BAND0,
+		is_mt7996(&dev->mt76) ? MT_BAND2 : MT_BAND1,
+	};
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(band_list); i++) {
+		int err, band = band_list[i], phy_id;
 		dma_addr_t dma_addr;
-		u32 val;
+		u32 val, size;
 
-		err = mt76_npu_get_msg(npu, i + 5,
+		err = mt76_npu_get_msg(npu, band + 5,
 				       WLAN_FUNC_GET_WAIT_RXDESC_BASE,
 				       &val, GFP_KERNEL);
 		if (err) {
@@ -173,14 +359,20 @@ static int mt7996_npu_txd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
 				 "failed retriving NPU wlan tx ring addr\n");
 			return err;
 		}
-		writel(val, &dev->mt76.phys[i]->q_tx[0]->regs->desc_base);
 
-		if (!dmam_alloc_coherent(dev->mt76.dma_dev,
-					 256 * MT7996_TX_RING_SIZE,
+		phy_id = is_mt7996(&dev->mt76) ? band == MT_BAND0 ? 1 : 0
+					       : band;
+		writel(val, &dev->mt76.phys[phy_id]->q_tx[0]->regs->desc_base);
+
+		size = is_mt7996(&dev->mt76) ? band == MT_BAND2
+					     ? MT7996_NPU_TX_RING_SIZE
+					     : MT7996_NPU_RX_RING_SIZE / 2
+					     : MT7996_TX_RING_SIZE;
+		if (!dmam_alloc_coherent(dev->mt76.dma_dev, 256 * size,
 					 &dma_addr, GFP_KERNEL))
 			return -ENOMEM;
 
-		err = mt76_npu_send_msg(npu, i,
+		err = mt76_npu_send_msg(npu, band,
 					WLAN_FUNC_SET_WAIT_TX_BUF_SPACE_HW_BASE,
 					dma_addr, GFP_KERNEL);
 		if (err) {
@@ -189,12 +381,11 @@ static int mt7996_npu_txd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
 			return err;
 		}
 
-		if (!dmam_alloc_coherent(dev->mt76.dma_dev,
-					 256 * MT7996_TX_RING_SIZE,
+		if (!dmam_alloc_coherent(dev->mt76.dma_dev, 256 * size,
 					 &dma_addr, GFP_KERNEL))
 			return -ENOMEM;
 
-		err = mt76_npu_send_msg(npu, i + 5,
+		err = mt76_npu_send_msg(npu, band + 5,
 					WLAN_FUNC_SET_WAIT_TX_BUF_SPACE_HW_BASE,
 					dma_addr, GFP_KERNEL);
 		if (err) {
@@ -207,7 +398,7 @@ static int mt7996_npu_txd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
 					 &dma_addr, GFP_KERNEL))
 			return -ENOMEM;
 
-		err = mt76_npu_send_msg(npu, i + 10,
+		err = mt76_npu_send_msg(npu, band + 10,
 					WLAN_FUNC_SET_WAIT_TX_BUF_SPACE_HW_BASE,
 					dma_addr, GFP_KERNEL);
 		if (err) {
@@ -223,8 +414,9 @@ static int mt7996_npu_txd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
 static int mt7996_npu_rx_event_init(struct mt7996_dev *dev,
 				    struct airoha_npu *npu)
 {
-	struct mt76_queue *q = &dev->mt76.q_rx[MT_RXQ_MAIN_WA];
+	int qid = is_mt7996(&dev->mt76) ? MT_RXQ_TXFREE_BAND0 : MT_RXQ_MAIN_WA;
 	phys_addr_t phy_addr = dev->mt76.mmio.phy_addr;
+	struct mt76_queue *q = &dev->mt76.q_rx[qid];
 	int err;
 
 	err = mt76_npu_send_msg(npu, 0,
@@ -244,7 +436,8 @@ static int mt7996_npu_rx_event_init(struct mt7996_dev *dev,
 		return err;
 	}
 
-	phy_addr += MT_RXQ_RING_BASE(MT_RXQ_MAIN_WA) + 0x20;
+	phy_addr += MT_RXQ_RING_BASE(qid);
+	phy_addr += is_mt7996(&dev->mt76) ? 0x90 : 0x20;
 	err = mt76_npu_send_msg(npu, 10, WLAN_FUNC_SET_WAIT_PCIE_ADDR,
 				phy_addr, GFP_KERNEL);
 	if (err)
@@ -253,11 +446,54 @@ static int mt7996_npu_rx_event_init(struct mt7996_dev *dev,
 	return err;
 }
 
+static int mt7996_npu_set_pcie_addr(struct mt7996_dev *dev,
+				    struct airoha_npu *npu)
+{
+	u32 hif1_ofs = dev->hif2 ? MT_WFDMA0_PCIE1(0) - MT_WFDMA0(0) : 0;
+	dma_addr_t dma_addr = dev->mt76.mmio.phy_addr;
+	int err;
+
+	dma_addr += MT_RXQ_RING_BASE(MT_RXQ_RRO_BAND0) + 0x80;
+	err = mt76_npu_send_msg(npu, 0, WLAN_FUNC_SET_WAIT_PCIE_ADDR,
+				dma_addr, GFP_KERNEL);
+	if (err) {
+		dev_warn(dev->mt76.dev,
+			 "failed setting NPU wlan PCIe desc addr\n");
+		return err;
+	}
+
+	dma_addr = dev->mt76.mmio.phy_addr + hif1_ofs;
+	if (is_mt7996(&dev->mt76)) {
+		dma_addr += MT_RXQ_RING_BASE(MT_RXQ_RRO_BAND2) + 0x60;
+		err = mt76_npu_send_msg(npu, 2, WLAN_FUNC_SET_WAIT_PCIE_ADDR,
+					dma_addr, GFP_KERNEL);
+	} else {
+		dma_addr += MT_RXQ_RING_BASE(MT_RXQ_RRO_BAND1) + 0x90;
+		err = mt76_npu_send_msg(npu, 1, WLAN_FUNC_SET_WAIT_PCIE_ADDR,
+					dma_addr, GFP_KERNEL);
+	}
+
+	if (err)
+		dev_warn(dev->mt76.dev,
+			 "failed setting NPU wlan PCIe desc addr\n");
+
+	return err;
+}
+
 static int mt7996_npu_tx_done_init(struct mt7996_dev *dev,
 				   struct airoha_npu *npu)
 {
 	int err;
 
+	/* rro ring cpu idx */
+	err = mt76_npu_send_msg(npu, 15, WLAN_FUNC_SET_WAIT_PCIE_ADDR,
+				0, GFP_KERNEL);
+	if (err) {
+		dev_warn(dev->mt76.dev,
+			 "failed setting NPU wlan PCIe desc addr\n");
+		return err;
+	}
+
 	err = mt76_npu_send_msg(npu, 2, WLAN_FUNC_SET_WAIT_INODE_TXRX_REG_ADDR,
 				0, GFP_KERNEL);
 	if (err) {
@@ -304,7 +540,11 @@ int mt7996_npu_hw_init(struct mt7996_dev *dev)
 	if (err)
 		goto unlock;
 
-	err = mt7992_npu_rxd_init(dev, npu);
+	if (is_mt7996(&dev->mt76))
+		err = mt7996_npu_rxd_init(dev, npu);
+	else
+		err = mt7992_npu_rxd_init(dev, npu);
+
 	if (err)
 		goto unlock;
 
@@ -316,6 +556,10 @@ int mt7996_npu_hw_init(struct mt7996_dev *dev)
 	if (err)
 		goto unlock;
 
+	err = mt7996_npu_set_pcie_addr(dev, npu);
+	if (err)
+		goto unlock;
+
 	err = mt7996_npu_tx_done_init(dev, npu);
 	if (err)
 		goto unlock;

-- 
2.52.0


