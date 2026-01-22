Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 983D4C44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 10:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BYq0jZQZ4Bi6i53VlGnzVkXUxLyKZYlVP/mx921Y7gI=; b=ZbTO3+nHt6ZNvLjIUs5WEqIl/o
	/reEeXOkRY4OckzdECNAfwCyXbd+5lh0gPMwjoRhMiCRCmIln70wMtO930uPeLMFRBEwNeMQtp2Ok
	WtutR3a78WwgTcD1x7DxmTFFwspIzPbKv/wrJgF/0oxYClMbkowAsPCY1xNrD5I7hkMIinan75CW6
	pZzTWKLySaxisxoENuLzir6Ep1rp5JIdWl6oBK3a3nD/m5zWiUhLYWwkE5PIQdb7IXxKQ2coPdI8Z
	Sv2UwKvmwHjJTnYcYG82vHM1FzMSvs3CgGTtfTlcC8Gs3rCpSnVpz/QjmEj52uBHl6zhlxAnZqb+o
	7VwF7Gew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis6l-00000006rN0-18CM;
	Thu, 22 Jan 2026 10:40:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis6j-00000006rLn-1eyp;
	Thu, 22 Jan 2026 10:40:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 71A97600C4;
	Thu, 22 Jan 2026 10:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6DA0C116C6;
	Thu, 22 Jan 2026 10:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769078408;
	bh=KU+ZJPPqLdFxTIM95Q/9Ua16kgbz6avWzKANiuJatAI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gbxBPy+7yiFsK69XpDfOh35vTKAC0wfohEib4CcWHaIFBZrnOh3bzc+4xJVEbXroP
	 I2FI1y3x/SXqkMw/oD9KM9GIz20OZCXYHumsr/kk3gS/PtcXVedycRVf2yMZqdU+OD
	 btfGebhcWuQlkhDb0zUdBQtIaOtIHBTr3AwRYOm3axdzn218Hqk01etJ768CJD14Vq
	 ihOusZjjekyxRBWv1hwuNJ5YCZ8TO6x6wfLNRcN/obVZI8kw0rfZjiyuJ/66lYUuOF
	 ++4PkCO5qbCb80lJkh/pixHmL5iK73VvyZ/v6cxjseAFiMtgXLvponmTL3JwoQb5qB
	 ZeQ3MkiZvvZwA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 22 Jan 2026 11:39:45 +0100
Subject: [PATCH mt76 v2 01/17] wifi: mt76: mt7996: Fix NPU stop procedure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-mt76-npu-eagle-offload-v2-1-2374614c0de6@kernel.org>
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

Move mt7996_npu_hw_stop routine before disabling rx NAPIs in order to
fix NPU stop procedure used during device L1 SER recovery.
Add missing usleep_range in mt7996_npu_hw_stop().

Fixes: 377aa17d2aedc ("wifi: mt76: mt7996: Add NPU offload support to MT7996 driver")
Tested-by: Kang Yang <kang.yang@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c |  3 +--
 drivers/net/wireless/mediatek/mt76/mt7996/npu.c | 23 ++++++++++++++---------
 2 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index aab79c042b52fbc67e14352665e0905397e4a301..db2eda2f1c4c097aafc55245e523e39c7bc71e34 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -2542,6 +2542,7 @@ void mt7996_mac_reset_work(struct work_struct *work)
 	if (mtk_wed_device_active(&dev->mt76.mmio.wed))
 		mtk_wed_device_stop(&dev->mt76.mmio.wed);
 
+	mt7996_npu_hw_stop(dev);
 	ieee80211_stop_queues(mt76_hw(dev));
 
 	set_bit(MT76_RESET, &dev->mphy.state);
@@ -2568,8 +2569,6 @@ void mt7996_mac_reset_work(struct work_struct *work)
 
 	mutex_lock(&dev->mt76.mutex);
 
-	mt7996_npu_hw_stop(dev);
-
 	mt76_wr(dev, MT_MCU_INT_EVENT, MT_MCU_INT_EVENT_DMA_STOPPED);
 
 	if (mt7996_wait_reset_state(dev, MT_MCU_CMD_RESET_DONE)) {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/npu.c b/drivers/net/wireless/mediatek/mt76/mt7996/npu.c
index 29bb735da4cb8f5998c9483567c65f3e3530c771..067ef647e404073173833aad3a2800d6591a5188 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/npu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/npu.c
@@ -320,33 +320,38 @@ int mt7996_npu_hw_init(struct mt7996_dev *dev)
 int mt7996_npu_hw_stop(struct mt7996_dev *dev)
 {
 	struct airoha_npu *npu;
-	int i, err;
+	int i, err = 0;
 	u32 info;
 
+	mutex_lock(&dev->mt76.mutex);
+
 	npu = rcu_dereference_protected(dev->mt76.mmio.npu, &dev->mt76.mutex);
 	if (!npu)
-		return 0;
+		goto unlock;
 
 	err = mt76_npu_send_msg(npu, 4, WLAN_FUNC_SET_WAIT_INODE_TXRX_REG_ADDR,
 				0, GFP_KERNEL);
 	if (err)
-		return err;
+		goto unlock;
 
 	for (i = 0; i < 10; i++) {
 		err = mt76_npu_get_msg(npu, 3, WLAN_FUNC_GET_WAIT_NPU_INFO,
 				       &info, GFP_KERNEL);
-		if (err)
-			continue;
+		if (!err && !info)
+			break;
 
-		if (info) {
-			err = -ETIMEDOUT;
-			continue;
-		}
+		err = -ETIMEDOUT;
+		usleep_range(10000, 15000);
 	}
 
 	if (!err)
 		err = mt76_npu_send_msg(npu, 6,
 					WLAN_FUNC_SET_WAIT_INODE_TXRX_REG_ADDR,
 					0, GFP_KERNEL);
+	else
+		dev_err(dev->mt76.dev, "npu stop failed\n");
+unlock:
+	mutex_unlock(&dev->mt76.mutex);
+
 	return err;
 }

-- 
2.52.0


