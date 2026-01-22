Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02985C44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 10:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L+1VonWasDGN2tbwRBl7t/syaAmcIt7bPL/qwJ0Yitw=; b=ox37mSc4yczzsspW/xBNUqXdy/
	v2jFClclp3uByQ1lickCdvuz7I+wJC8ExIhtK18sYJNMwg5W8WQuIVDZro4FEu1CXTgzMwrDVWax0
	tayl7gr69mdsRdsvd82GLHOjTGOX8n9VdyjT0YW1dWfU2959wxgYL2hK1/cz1K80zPIxnWtbCKAmy
	djkdLS247Rjx6CzJxZ5LPjKhGO9YiwcJAGTNIpk1OBkhS0BRkXklMrlOgwBd1/qGqSwyXVDn0+BdG
	q49IjxB8nqjf/WBAm3ghE19I3acbhPSSDAOSA5XqPjL6FTVJ1rA6oRyu2/lNKeOLtRYBZ+ZlDJBuF
	eIMnDUdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis7K-00000006rxX-1lcX;
	Thu, 22 Jan 2026 10:40:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis7B-00000006rlJ-0toU;
	Thu, 22 Jan 2026 10:40:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A4164600C3;
	Thu, 22 Jan 2026 10:40:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0796FC16AAE;
	Thu, 22 Jan 2026 10:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769078436;
	bh=KDBMeimDOqIPWA+AlFv7vKWaNXKeitCrK7nYonb6SUc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mRWJy0pjF9QJLR0IMnhus9dD9uY4hexqwBs2PQOnyVIZVxadMyI+EWYL66Wu6gt3a
	 Al3MgeusAdmfWGSozvZ4g+PUaDUAQ8GDwxhZ9/fjHrxqk9xohYdy9vngUaIn9M44fL
	 BokApxfzcYHRKTjESvtjPRQdVBG4+acIWfHDLcE4KY1DYwHuviN5IGM0m0ihKPy/xL
	 2h5ixOtbc+SdIIWCancWFfIQLh6QkicxT6vjnDTtX1xuZqnXnkVk1oHNAhr4oGqKlg
	 TFUMaWFM6vK7uL3IpBVgz1Wr/vGyPoh8Cr7UBcIMDyiU1Yo0D4hLNMF4tocFyq5hZf
	 sUHqUnybuOVBQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 22 Jan 2026 11:39:56 +0100
Subject: [PATCH mt76 v2 12/17] wifi: mt76: mt7996: Add __mt7996_npu_hw_init
 routine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-mt76-npu-eagle-offload-v2-12-2374614c0de6@kernel.org>
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

Introduce __mt7996_npu_hw_init utility routine in order to run it
holding mt76 mutex and move NPU hw re-initialization before restarting
the NAPIs during device reset.

Tested-by: Kang Yang <kang.yang@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c    |  4 +--
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h |  6 +++++
 drivers/net/wireless/mediatek/mt76/mt7996/npu.c    | 31 +++++++++++++---------
 3 files changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index db2eda2f1c4c097aafc55245e523e39c7bc71e34..ebce6b080886896be746c37690ef38713fe2cbc2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -2607,6 +2607,8 @@ void mt7996_mac_reset_work(struct work_struct *work)
 				     MT_INT_TX_RX_DONE_EXT);
 	}
 
+	__mt7996_npu_hw_init(dev);
+
 	clear_bit(MT76_MCU_RESET, &dev->mphy.state);
 	mt7996_for_each_phy(dev, phy)
 		clear_bit(MT76_RESET, &phy->mt76->state);
@@ -2636,8 +2638,6 @@ void mt7996_mac_reset_work(struct work_struct *work)
 
 	mutex_unlock(&dev->mt76.mutex);
 
-	mt7996_npu_hw_init(dev);
-
 	mt7996_for_each_phy(dev, phy)
 		ieee80211_queue_delayed_work(hw, &phy->mt76->mac_work,
 					     MT7996_WATCHDOG_TIME);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index de31385aa966116b34e545de92623a214bddc8f8..3928e059fd2a41aa7d4aa41b0d303b0763384523 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -881,10 +881,16 @@ int mt7996_mtk_init_debugfs(struct mt7996_phy *phy, struct dentry *dir);
 int mt7996_dma_rro_init(struct mt7996_dev *dev);
 
 #ifdef CONFIG_MT7996_NPU
+int __mt7996_npu_hw_init(struct mt7996_dev *dev);
 int mt7996_npu_hw_init(struct mt7996_dev *dev);
 int mt7996_npu_hw_stop(struct mt7996_dev *dev);
 int mt7996_npu_rx_queues_init(struct mt7996_dev *dev);
 #else
+static inline int __mt7996_npu_hw_init(struct mt7996_dev *dev)
+{
+	return 0;
+}
+
 static inline int mt7996_npu_hw_init(struct mt7996_dev *dev)
 {
 	return 0;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/npu.c b/drivers/net/wireless/mediatek/mt76/mt7996/npu.c
index 1a77a7dc103762c8cc998508348e418858c30029..7941996891c88333d121e4c739001ea19bff94c9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/npu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/npu.c
@@ -525,20 +525,18 @@ int mt7996_npu_rx_queues_init(struct mt7996_dev *dev)
 				      &dev->mt76.q_rx[MT_RXQ_NPU1]);
 }
 
-int mt7996_npu_hw_init(struct mt7996_dev *dev)
+int __mt7996_npu_hw_init(struct mt7996_dev *dev)
 {
 	struct airoha_npu *npu;
-	int i, err = 0;
-
-	mutex_lock(&dev->mt76.mutex);
+	int i, err;
 
 	npu = rcu_dereference_protected(dev->mt76.mmio.npu, &dev->mt76.mutex);
 	if (!npu)
-		goto unlock;
+		return 0;
 
 	err = mt7996_npu_offload_init(dev, npu);
 	if (err)
-		goto unlock;
+		return err;
 
 	if (is_mt7996(&dev->mt76))
 		err = mt7996_npu_rxd_init(dev, npu);
@@ -546,27 +544,36 @@ int mt7996_npu_hw_init(struct mt7996_dev *dev)
 		err = mt7992_npu_rxd_init(dev, npu);
 
 	if (err)
-		goto unlock;
+		return err;
 
 	err = mt7996_npu_txd_init(dev, npu);
 	if (err)
-		goto unlock;
+		return err;
 
 	err = mt7996_npu_rx_event_init(dev, npu);
 	if (err)
-		goto unlock;
+		return err;
 
 	err = mt7996_npu_set_pcie_addr(dev, npu);
 	if (err)
-		goto unlock;
+		return err;
 
 	err = mt7996_npu_tx_done_init(dev, npu);
 	if (err)
-		goto unlock;
+		return err;
 
 	for (i = MT_RXQ_NPU0; i <= MT_RXQ_NPU1; i++)
 		airoha_npu_wlan_enable_irq(npu, i - MT_RXQ_NPU0);
-unlock:
+
+	return 0;
+}
+
+int mt7996_npu_hw_init(struct mt7996_dev *dev)
+{
+	int err;
+
+	mutex_lock(&dev->mt76.mutex);
+	err = __mt7996_npu_hw_init(dev);
 	mutex_unlock(&dev->mt76.mutex);
 
 	return err;

-- 
2.52.0


