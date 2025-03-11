Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC44AC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 18:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sXl8G46Mj8MptImB58diQAXjZ76uTTyq4hO/6fq6bPA=; b=pOLSGaZSsC50CATPLMRTZt/mdz
	OAcQOHTY8IH/BqhkK3lWFWuLc7kbVZxrk6pR6du1AlLgeRq+qH9s96f8swQwWGBXYy9wDl6cl/Iq3
	OlDMetqT+nYb5ubUT81qAIx8qm0A0CJcx669WG/9Ds6Rj328wNbbbb5kCz5EqqhIrtvItyBK5d+Y6
	fpd4UWXhAUo6spIrO+Am5TrVndxiJYQuEds3e/r1zH8jZ7nEUDMnFZS6mtatkEFQCmhC98H5DUOqn
	H3LbzCppr6T4NQpH7fgn2C5d8QqOsjXcUk10zjXOGTcByg+QR/SfJtg/CNleaTpkEULqY+yKv0yN+
	edpX3aSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts40L-00000006Ysy-35Qu;
	Tue, 11 Mar 2025 18:07:01 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts3fp-00000006VJ4-0zKd;
	Tue, 11 Mar 2025 17:45:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5BFAAA460B5;
	Tue, 11 Mar 2025 17:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2C33C4CEE9;
	Tue, 11 Mar 2025 17:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741715148;
	bh=+9H/cY7XevfmBl9ExA/WUMon0lUnrmWb3xP9M+8TCyw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CSU4XMYkyAMLesDJHX/NI6iGOV6eDoUKWQC1hccMOd+ARFpc4od8rVylCk2UWRn4T
	 76xmYC/iKDWULGlI6lQpJGJv3/1adR7tAbyN/9UUgwKphXiy38OVQdj9XxCk65iBKt
	 OZ0uvJDGPRmn9GYuODYjOIhqQkSfNBkhkUYFmSFa/PUCKzs4iW1HBCRyyuw6nKYSDU
	 NFzzO/o/zc8cNH5ITZPeNEHsVsaOSo4/WuwwhDPCkd0jHWIufwXHC75BLnsAN1Tr3f
	 vw5p90rWA87DRHFwdoY11+GF6G7XrhgKuFlNooY9IzTKWkLLEHAll4bkhO60TMnxxH
	 Fl0zj165K9UyA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 11 Mar 2025 18:45:11 +0100
Subject: [PATCH v2 12/13] wifi: mt76: mt7996: Rely on mt7996_vif_link in
 mt7996_mcu_twt_agrt_update signature
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-mt7996-mlo-v2-12-31df6972519b@kernel.org>
References: <20250311-mt7996-mlo-v2-0-31df6972519b@kernel.org>
In-Reply-To: <20250311-mt7996-mlo-v2-0-31df6972519b@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Kalle Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, 
 Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Bo Jiao <Bo.Jiao@mediatek.com>, 
 Peter Chiu <chui-hao.chiu@mediatek.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_104549_419815_C8DE4026 
X-CRM114-Status: GOOD (  11.00  )
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

From: Shayne Chen <shayne.chen@mediatek.com>

This is a preliminary patch to enable MLO for MT7996 driver

Co-developed-by: Bo Jiao <Bo.Jiao@mediatek.com>
Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
Co-developed-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c    | 5 +++--
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c    | 8 ++++----
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h | 2 +-
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 456666eb7080c50493dcde61c5399adc6a987d2d..4a7f6fd9025297f0ffa8ea7e91efd34164a26196 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -2672,7 +2672,8 @@ void mt7996_mac_add_twt_setup(struct ieee80211_hw *hw,
 	}
 	flow->tsf = le64_to_cpu(twt_agrt->twt);
 
-	if (mt7996_mcu_twt_agrt_update(dev, msta->vif, flow, MCU_TWT_AGRT_ADD))
+	if (mt7996_mcu_twt_agrt_update(dev, &msta->vif->deflink, flow,
+				       MCU_TWT_AGRT_ADD))
 		goto unlock;
 
 	setup_cmd = TWT_SETUP_CMD_ACCEPT;
@@ -2705,7 +2706,7 @@ void mt7996_mac_twt_teardown_flow(struct mt7996_dev *dev,
 		return;
 
 	flow = &msta_link->twt.flow[flowid];
-	if (mt7996_mcu_twt_agrt_update(dev, msta->vif, flow,
+	if (mt7996_mcu_twt_agrt_update(dev, &msta->vif->deflink, flow,
 				       MCU_TWT_AGRT_DELETE))
 		return;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 43e85308132e5ed80d8199858014b31a29b2e3b5..e6ebb309a8257637c122702df2f2924649b7fabe 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -4236,7 +4236,7 @@ int mt7996_mcu_update_bss_color(struct mt7996_dev *dev,
 #define TWT_AGRT_PROTECT	BIT(2)
 
 int mt7996_mcu_twt_agrt_update(struct mt7996_dev *dev,
-			       struct mt7996_vif *mvif,
+			       struct mt7996_vif_link *link,
 			       struct mt7996_twt_flow *flow,
 			       int cmd)
 {
@@ -4267,12 +4267,12 @@ int mt7996_mcu_twt_agrt_update(struct mt7996_dev *dev,
 		.len = cpu_to_le16(sizeof(req) - 4),
 		.tbl_idx = flow->table_id,
 		.cmd = cmd,
-		.own_mac_idx = mvif->deflink.mt76.omac_idx,
+		.own_mac_idx = link->mt76.omac_idx,
 		.flowid = flow->id,
 		.peer_id = cpu_to_le16(flow->wcid),
 		.duration = flow->duration,
-		.bss = mvif->deflink.mt76.idx,
-		.bss_idx = mvif->deflink.mt76.idx,
+		.bss = link->mt76.idx,
+		.bss_idx = link->mt76.idx,
 		.start_tsf = cpu_to_le64(flow->tsf),
 		.mantissa = flow->mantissa,
 		.exponent = flow->exp,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index 0dd9d798541f95f82bf8606512052eca79115f5c..962022c7eec9fd82ebba8e0d5aa6b6eae769ee32 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -563,7 +563,7 @@ int mt7996_run(struct mt7996_phy *phy);
 int mt7996_mcu_init(struct mt7996_dev *dev);
 int mt7996_mcu_init_firmware(struct mt7996_dev *dev);
 int mt7996_mcu_twt_agrt_update(struct mt7996_dev *dev,
-			       struct mt7996_vif *mvif,
+			       struct mt7996_vif_link *link,
 			       struct mt7996_twt_flow *flow,
 			       int cmd);
 int mt7996_mcu_add_dev_info(struct mt7996_phy *phy, struct ieee80211_vif *vif,

-- 
2.48.1


