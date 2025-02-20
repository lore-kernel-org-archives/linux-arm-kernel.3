Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A580DC021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 13:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Cx30TfuVFtcEqNv55Em2QT/UyoyqvDQDwVrOYUF4DM=; b=AhaBlLPGBWF5aAd1kO4R9EeB6r
	wrrvGV2JJcTMwnnJGoWPHJVEuFYICJe1x9TvR14C3lLy3QGbV7IwIUGXGS7Z2MSOzFiXeBd8CYU8E
	DvEevdoeMy0BnYRtxHUrDkTNiWguS88zSWf8zmo91QZCp4qaXaWLYxsGjTUPAp7cBawZdiiWirhMN
	USdtWQdZYz5Jrr/jkSqYLZkdls6RPMilfPjWuYve+nGRgmw0IRyEqPjmQnWHWNx7KPVz6/Ch0TcHt
	8cm1+69hN2Zz0KECon+X7+64pO+QHHXWeAer/ojhue13usZDsgUjDqSN2X3zdZLc+El1lHFgWH8o2
	iltfQ+kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl6fX-000000014a0-1otw;
	Thu, 20 Feb 2025 13:32:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl6Sx-000000011MU-2Z9H;
	Thu, 20 Feb 2025 13:19:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EE7785C47EF;
	Thu, 20 Feb 2025 13:19:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7139CC4CED1;
	Thu, 20 Feb 2025 13:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740057586;
	bh=QKSzQlhaap4NAoryXxlW3RwuzGmB6dNpgI2ZolbeH9Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cvUG9+bvGqraYZX0xzmmwrHTNtaWHbsLpNhOd0okoa4i/YDP1jn1+6VTIiWymSKEP
	 6BZ26lDvyxpf4oVOnYh8q5yAttNaCh2OCv1hkXtqd+GhI5lcl/R+9rJe/LHa4K8nG4
	 W25b77WSwYP+n6MKmRs5KyDy3eSMfPHupdNOEZ6CMAvE7xSg85XSmU/GODiXH3hIIe
	 cqo7mHfBPrLZsyHdNFiUk7lkrNDzrH59VSXasjaT1N6ThT1snKrddtBmC9IgPoxZmC
	 +GiqeA10crVxL50W4DLlsrmp5wfN6Iy3R1TqDBtLDjXbcNiWzUefKikR6qC92MQbj7
	 btVz9tWm9RulA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 20 Feb 2025 14:18:59 +0100
Subject: [PATCH 13/14] wifi: mt76: mt7996: Rely on mt7996_vif_link in
 mt7996_mcu_twt_agrt_update signature
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-mt7996-mlo-v1-13-34c4abb37158@kernel.org>
References: <20250220-mt7996-mlo-v1-0-34c4abb37158@kernel.org>
In-Reply-To: <20250220-mt7996-mlo-v1-0-34c4abb37158@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Kalle Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Bo Jiao <Bo.Jiao@mediatek.com>, 
 Peter Chiu <chui-hao.chiu@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_051947_742641_C5F63F8E 
X-CRM114-Status: GOOD (  10.95  )
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
index 32b011e7945a603e06b543e0b302211ce83af1ec..0c862cd749b233ae1a6870c536792087109cd46c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -2659,7 +2659,8 @@ void mt7996_mac_add_twt_setup(struct ieee80211_hw *hw,
 	}
 	flow->tsf = le64_to_cpu(twt_agrt->twt);
 
-	if (mt7996_mcu_twt_agrt_update(dev, msta->vif, flow, MCU_TWT_AGRT_ADD))
+	if (mt7996_mcu_twt_agrt_update(dev, &msta->vif->deflink, flow,
+				       MCU_TWT_AGRT_ADD))
 		goto unlock;
 
 	setup_cmd = TWT_SETUP_CMD_ACCEPT;
@@ -2692,7 +2693,7 @@ void mt7996_mac_twt_teardown_flow(struct mt7996_dev *dev,
 		return;
 
 	flow = &msta_link->twt.flow[flowid];
-	if (mt7996_mcu_twt_agrt_update(dev, msta->vif, flow,
+	if (mt7996_mcu_twt_agrt_update(dev, &msta->vif->deflink, flow,
 				       MCU_TWT_AGRT_DELETE))
 		return;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index fea6f228a62268583d6cd1a711f05ab91a5815ed..a35ef2b295d2e3e95de60e7c5c45c54087d381d4 100644
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
index 43534681301b8f239337092013e49eec2fee2ce8..3a8e99b6f474af285838f90b1068380c93a862a1 100644
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


