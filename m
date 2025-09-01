Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E19CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 00:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=va8Wmhz+p2Vv1kbkARU7Ax8JiEC9E2+jsr9cbQZu+IA=; b=PwGMXiDDshE+2Z8gJtkE2hJJnI
	EWGJQuPxphYg/kjD7uMPNOeluU+1iKKADt8F+b1CtL4Rim2/HWvrD7V9S2DefrhL9XV8Hxmo6sN/1
	3rtxif81KD7HyparW+7eMlyiiGOOZDSPG727/b6yW1QSOufWRjNvB2JlTH9cP9HE8Uq5HzFmOdtkk
	dOftc56WPKs5K0q/roGY25XO7tC6GlS1pggo9zXeaHbYGq9STdYcf4AVs3MV93naqjk1kT53E21++
	OWAQ4GrjxHvlByicQXE/I63rQ3UTpg7N+usFiAKWpoJ38f3KYRx7XAymr0V4Vj2VWN5CvUdqE1+JP
	e650wLjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utFGM-0000000EYcS-11Cc;
	Tue, 02 Sep 2025 00:52:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utBbq-0000000DtJh-3DGL;
	Mon, 01 Sep 2025 20:58:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7DD914404D;
	Mon,  1 Sep 2025 20:58:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B493C4CEF0;
	Mon,  1 Sep 2025 20:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756760318;
	bh=aliTuoRjIt872Bj/CJN6+NhOiVR54ORYedrqFcadIO0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WSP53XmQYk4PVnXbAiMxIDDlTjk6iNCA0dptWEpGF6dwLwwTH3vOtm9V3xb9LMgVI
	 fOvvhSmiHGQbelXwZaD7q0QTiyC4+7xfjnABWAcstiu+f7pkmGKTcd7XEr5HzgsCzq
	 FEjaoXBYxt8+2tE9OdB/a6a/+0gRwACCWrNTUtndcR9sRnxHIo6K9RkgL+/4vMU22U
	 x6Uz3HmzmJIttldNnu8SLwHLZr7wUusavCKNK9uC4WTIMWK8d8YrsDg9AjAX02vCE+
	 b+lq2r8qyfWCyBY16/B2sfAmCkWF0iUR1NMRslQjkFKBRaI9U/II7okdGtU+TDjmHt
	 kL7g3zQk+72sg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 01 Sep 2025 22:58:02 +0200
Subject: [PATCH mt76 v2 06/14] wifi: mt76: mt7996: Introduce the capability
 to reset MT7992 WED device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-mt7996-rro-rework-v2-6-1f95086b51d1@kernel.org>
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
X-CRM114-CacheID: sfid-20250901_135838_850206_CB4BDBE1 
X-CRM114-Status: GOOD (  13.60  )
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
index 9f61667584f4d95f7f6c9dcb0d70ef56a4e298fd..b66ba38df570503839e1a9ba1819b4e29303532f 100644
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
index fecf68271234e7949014d5be6b9e2f87c6dbb281..11e71bc175b80784afd080638dc8657ffa092e3e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -1853,6 +1853,32 @@ mt7996_mac_restart(struct mt7996_dev *dev)
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
@@ -2065,6 +2091,10 @@ void mt7996_mac_reset_work(struct work_struct *work)
 
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
2.50.1


