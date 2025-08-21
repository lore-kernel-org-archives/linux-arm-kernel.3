Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09D0CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 17:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FrmQ9eEMlmR2OzST/11R8tzUR1tSQRY5H0/lN6Kw82c=; b=PsJh1Cx2K+1t1Gu8/n84zPQs1l
	OISVi4HJ4iKiDJ9Z2t3MUaVoHRXwPjK4rqtfhEDg3w2r8BJ0hIvk/hUs2gbuizR7wieqz4ANHu5BG
	2d7qLT53KzeAy+C6kK7LX1SayWwqsnmE+n8F0eqBiw9zVtSjIjUN+W3A4mt55LEdWgsYY21ql77do
	9S7v0LBJzi7eAlqop2k46gnQLWsRwtatQhI850Ca/h9fZ4TxDbLhti6UwNqkFbxgpFncH7VD94Wst
	10okR7VPov7G8vHyuDrQ4hPKcUbMzeda58V83x6eoxHqliCZynuVamy1Ih3kDVVVU4xdeokIO6/BY
	YIXAdAiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up97f-000000004Xm-2xrP;
	Thu, 21 Aug 2025 17:30:47 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up59v-0000000H1Fv-0Ick;
	Thu, 21 Aug 2025 13:16:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5F242A58367;
	Thu, 21 Aug 2025 13:16:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A405FC4CEEB;
	Thu, 21 Aug 2025 13:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755782210;
	bh=61JWdqdg6ttc8hRt/w+pdh8UPhQBz1yHII1rdZ7h0dk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WBiOSeIa2tOfNOlCgXUBRK0laxOaQOgR524wMZr25pw0RzDYSgBTxXI6UIhUFaCJk
	 /PSadmL6/+hZjXad4QkdPZ1OtAjooX9hsXKowDWgga66Y6uW4IUXeV3wkB76IXqSDX
	 ackWI9iZ/7PkfSdJ7t5owGxMudf0K/PXyJjgUOueJZhnDqOCuyEX4YqAx8pW1oiSlY
	 KGg2MZszn8Rjyp0uLv+Y2BmmRk6hS9yy5059u7rkZaqI0CZXRKPNrZONjmSbVN6+nR
	 4IUpNNg841+DZZhnoMWTIKzUN5gBWb8WcEG+PDv8oPxBJ9YgXUlKbCtvaD7SygkIgB
	 eEGJEdtxtXrCQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 21 Aug 2025 15:14:58 +0200
Subject: [PATCH mt76 06/14] wifi: mt76: mt7996: Introduce the capability to
 reset MT7992 WED device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-mt7996-rro-rework-v1-6-6c8477ad969f@kernel.org>
References: <20250821-mt7996-rro-rework-v1-0-6c8477ad969f@kernel.org>
In-Reply-To: <20250821-mt7996-rro-rework-v1-0-6c8477ad969f@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Rex Lu <rex.lu@mediatek.com>, Benjamin Lin <benjamin-jw.lin@mediatek.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_061651_242690_040FFF30 
X-CRM114-Status: GOOD (  13.86  )
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
index 543572328d65ff75ab654f41ff85b22ed0f34beb..8dc2e9155cba66cb51ba992c31da3e4273207f44 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -726,9 +726,9 @@ void mt7996_wfsys_reset(struct mt7996_dev *dev)
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
@@ -808,8 +808,8 @@ static void mt7996_rro_hw_init(struct mt7996_dev *dev)
 	/* interrupt enable */
 	mt76_wr(dev, MT_RRO_HOST_INT_ENA,
 		MT_RRO_HOST_INT_ENA_HOST_RRO_DONE_ENA);
-}
 #endif
+}
 
 static int mt7996_wed_rro_init(struct mt7996_dev *dev)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index d6531b74be1f15467c06e385d0efabad806db6b8..2ca10588b7a67be8a6d72b81c63322ec38cca257 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -1847,6 +1847,32 @@ mt7996_mac_restart(struct mt7996_dev *dev)
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
@@ -2059,6 +2085,10 @@ void mt7996_mac_reset_work(struct work_struct *work)
 
 		mt76_wr(dev, MT_INT_MASK_CSR, wed_irq_mask);
 
+		if (is_mt7992(&dev->mt76) && dev->has_rro)
+			mt76_wr(dev, MT_RRO_3_0_EMU_CONF,
+				MT_RRO_3_0_EMU_CONF_EN_MASK);
+
 		mtk_wed_device_start_hw_rro(&dev->mt76.mmio.wed, wed_irq_mask,
 					    true);
 		mt7996_irq_enable(dev, wed_irq_mask);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index d269dcf957d74757a23dc4c48ef01f5e04668119..1efcfaf32d451e12a817c9b835fcc5e49b5ccb19 100644
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
2.50.1


