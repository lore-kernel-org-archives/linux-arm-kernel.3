Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE4BD1D897
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 08:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CxWpkgkX2xYhXslI7wfUDFO1uMWrSF836dyXYkzSD+I=; b=sanZB5t9JufzU0GoI7yj+jyVfM
	7c6EVexpqi2VYW4QYaYbMcM2CRvq0pARWysLGI5Ze00AHSasSZwPpSz4gV/vmyDnE4sO84oEmfgcM
	okFEq+OqiRxEUJIoTR8K71lzR6mjhSTJAY4yYheWOIVCQleqFj8G/7/WBaHbZEgPqQQP1f7VD20bP
	OAK0MhOJsJ3QcWbsad0WxbiscEfxXKSS66RRqv9CbsqF+SPTuRrta39GfY0WRQ8uObgXZYNLEr+I4
	8qgAsFXhlswnZ/GMpFiTIQBnP+mkYfX3CGa17EwK43YxCXqap4YlrEWj/gvTF91Wyjc1MU5eDl46r
	R8raK+tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR4Qz-00000007eaR-2ktY;
	Thu, 04 Dec 2025 08:11:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR4Qx-00000007eZe-2htz;
	Thu, 04 Dec 2025 08:11:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C269F60197;
	Thu,  4 Dec 2025 08:11:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24E46C4CEFB;
	Thu,  4 Dec 2025 08:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764835886;
	bh=7v99+YloqcQ2DSrbUWR7Bl7ivv5eftsO7JmXAB1Ntj0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Bgs2pLypU/S2VtAFMHb5Y3yebF1BoUoFaGb4PVIbMhJ0bllSw/atSVmnlRbkbGNqO
	 6TTHDzCjmGMKEijAZ1oZ28VPZyD5UGlIi109HWQsY/SR6Xw0zB3OafK12A716VREsJ
	 PfVT1T8TbBw2C0BAvW8DmppGBivS5iBMHp1jFECav2fjCIqwJFZiraVY4TU12KD5ah
	 Tk8Kn/OaJSRE4xeMD6hi3MDa65wpYEN1BKJosVdgE0sMZhMFzL9dh8X3X550dUITaC
	 IIewn1hPJCo95AEHfN+tpYVEX/Dnf5Tfj6xAg0oWZKCl2Rn7Ri1D73S8fCwYpH/3mq
	 GoMd9vQ3K1r2w==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 04 Dec 2025 09:10:43 +0100
Subject: [PATCH mt76 01/11] wifi: mt76: mt7996: Fix NPU stop procedure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-mt76-npu-eagle-offload-v1-1-7819c52c0893@kernel.org>
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

Fix NPU stop procedure used during device L1 SER recovery moving
mt7996_npu_hw_stop routine before disabling rx NAPIs.
Add missing usleep_range in mt7996_npu_hw_stop().

Tested-by: Hui Ma <hui.ma@airoha.com>
Fixes: 377aa17d2aedc ("wifi: mt76: mt7996: Add NPU offload support to MT7996 driver")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c |  3 +--
 drivers/net/wireless/mediatek/mt76/mt7996/npu.c | 23 ++++++++++++++---------
 2 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 2560e2f46e89a4bc46e21d796fca80b7decefa5c..2a8e91f59b0cafd46c97a9ac73b78f1ba087b5d8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -2543,6 +2543,7 @@ void mt7996_mac_reset_work(struct work_struct *work)
 	if (mtk_wed_device_active(&dev->mt76.mmio.wed))
 		mtk_wed_device_stop(&dev->mt76.mmio.wed);
 
+	mt7996_npu_hw_stop(dev);
 	ieee80211_stop_queues(mt76_hw(dev));
 
 	set_bit(MT76_RESET, &dev->mphy.state);
@@ -2569,8 +2570,6 @@ void mt7996_mac_reset_work(struct work_struct *work)
 
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


