Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3BB8CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 15:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0lxRV5yPqrMAPqUmmOkNvgaZ30DI1+Dv4pn+M+60YN0=; b=vqSnBWjFQ9JeidsXbHl8+WZ77F
	3QVjZDg2HS1iwJv/rw/iWcrTvtUU6WLvATZtkegxQDLLisLsFW0QMOdLBkUCLUvTzwAt3t3Q9OPDU
	8zValUtavfDDoi4ShpU1Cds2IQFuV9Aol1/rmvonApYNBZgAVL3qPayr9EkAsUtDj+m+slnnWXE7W
	tOT/J4wP+a+e6nXQnOH+hUEJ9TY9+srSDLd+pj4q4xF3LNnb5TEUiwvEGU63G4GD0Kcb2n0RceEWB
	nFgfG1KnHTdy17oeeGrS/jXgjiWqr+9qVtnBs/7OzGqrolloBVeBnj6gSvdGCX9a1aoFBxFJW6sXR
	Ada7fwfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0Ru-00000008A3E-1gAh;
	Tue, 09 Sep 2025 15:40:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuv1-0000000664E-08Hx;
	Tue, 09 Sep 2025 09:45:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C340D44C94;
	Tue,  9 Sep 2025 09:45:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52A45C4CEF7;
	Tue,  9 Sep 2025 09:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757411142;
	bh=mXR0IHtSNygv1JTjzZdKnTQs+iwRt9uR2itgt1dZk5Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rJNdIPTBivU4VJsrNNoUtjQsnbu9PEz2S1vA5GAai7TXyEq5ZdnV+AIVtheBzx4Jq
	 /SqT3gPDOVQzD7r2OhJJwdgKIFN8kcU4tC/fZRLKJia34YD1iD/w6JtAKYWjBJixEq
	 qnxFJ/AhwFTPFiEW9MBg5/sTdCm8ZJiZG93tMci9kMlUp/QbQTgAEKdGDPvi3ePdKg
	 Cyc9727C9W/xcTorw+lnRk8ABvU3m3AHs9dWT1EYB3i9cI/rSfVda3oDvRHvqD8nWq
	 lfMgYN+yNKwqVmG+FUnPuebgFXIEwvEDXcpneVaIsG4bxH4LcOE1xKBhdD+WRJvB+j
	 L1efoLlPuhuqQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 09 Sep 2025 11:45:15 +0200
Subject: [PATCH mt76 v5 07/16] wifi: mt76: mt7996: Introduce the capability
 to reset MT7992 WED device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-mt7996-rro-rework-v5-7-7d66f6eb7795@kernel.org>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_024543_144164_1EF4EAA6 
X-CRM114-Status: GOOD (  13.80  )
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
 drivers/net/wireless/mediatek/mt76/mt7996/init.c   |  6 ++---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c    | 30 ++++++++++++++++++++++
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h |  1 +
 3 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index 93144b5e9564792556153a1fad7bf8e4140a3385..73a55eea535872f94d2328ea5d832d82bf02abb2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -756,9 +756,9 @@ void mt7996_wfsys_reset(struct mt7996_dev *dev)
 	msleep(20);
 }
 
-#ifdef CONFIG_NET_MEDIATEK_SOC_WED
-static void mt7996_rro_hw_init(struct mt7996_dev *dev)
+void mt7996_rro_hw_init(struct mt7996_dev *dev)
 {
+#ifdef CONFIG_NET_MEDIATEK_SOC_WED
 	struct mtk_wed_device *wed = &dev->mt76.mmio.wed;
 	u32 reg = MT_RRO_ADDR_ELEM_SEG_ADDR0;
 	int i;
@@ -838,8 +838,8 @@ static void mt7996_rro_hw_init(struct mt7996_dev *dev)
 	/* interrupt enable */
 	mt76_wr(dev, MT_RRO_HOST_INT_ENA,
 		MT_RRO_HOST_INT_ENA_HOST_RRO_DONE_ENA);
-}
 #endif
+}
 
 static int mt7996_wed_rro_init(struct mt7996_dev *dev)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 8f177a606483bac8df124318b6060a0885df6baf..e31e3324acf97b309c317a5203b78cf55306abdf 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -1905,6 +1905,32 @@ mt7996_mac_restart(struct mt7996_dev *dev)
 	if (ret)
 		goto out;
 
+	if (mtk_wed_device_active(&dev->mt76.mmio.wed) && dev->has_rro) {
+		u32 wed_irq_mask = dev->mt76.mmio.irqmask |
+				   MT_INT_RRO_RX_DONE |
+				   MT_INT_TX_DONE_BAND2;
+
+		mt7996_rro_hw_init(dev);
+		mt76_for_each_q_rx(&dev->mt76, i) {
+			if (mt76_queue_is_wed_rro_ind(&dev->mt76.q_rx[i]) ||
+			    mt76_queue_is_wed_rro_msdu_pg(&dev->mt76.q_rx[i]))
+				mt76_queue_rx_reset(dev, i);
+		}
+
+		mt76_wr(dev, MT_INT_MASK_CSR, wed_irq_mask);
+		mtk_wed_device_start_hw_rro(&dev->mt76.mmio.wed, wed_irq_mask,
+					    false);
+		mt7996_irq_enable(dev, wed_irq_mask);
+		mt7996_irq_disable(dev, 0);
+	}
+
+	if (mtk_wed_device_active(&dev->mt76.mmio.wed_hif2)) {
+		mt76_wr(dev, MT_INT_PCIE1_MASK_CSR,
+			MT_INT_TX_RX_DONE_EXT);
+		mtk_wed_device_start(&dev->mt76.mmio.wed_hif2,
+				     MT_INT_TX_RX_DONE_EXT);
+	}
+
 	/* set the necessary init items */
 	ret = mt7996_mcu_set_eeprom(dev);
 	if (ret)
@@ -2117,6 +2143,10 @@ void mt7996_mac_reset_work(struct work_struct *work)
 
 		mt76_wr(dev, MT_INT_MASK_CSR, wed_irq_mask);
 
+		if (is_mt7992(&dev->mt76) && dev->has_rro)
+			mt76_wr(dev, MT_RRO_3_0_EMU_CONF,
+				MT_RRO_3_0_EMU_CONF_EN_MASK);
+
 		mtk_wed_device_start_hw_rro(&dev->mt76.mmio.wed, wed_irq_mask,
 					    true);
 		mt7996_irq_enable(dev, wed_irq_mask);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index 094ea070369a8ac33a3aa692d5aaf9535c89d3d8..9af3382003bcfecd2eed5d1384d57bdf65af7f82 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -569,6 +569,7 @@ extern struct pci_driver mt7996_hif_driver;
 
 struct mt7996_dev *mt7996_mmio_probe(struct device *pdev,
 				     void __iomem *mem_base, u32 device_id);
+void mt7996_rro_hw_init(struct mt7996_dev *dev);
 void mt7996_wfsys_reset(struct mt7996_dev *dev);
 irqreturn_t mt7996_irq_handler(int irq, void *dev_instance);
 u64 __mt7996_get_tsf(struct ieee80211_hw *hw, struct mt7996_vif_link *link);

-- 
2.51.0


