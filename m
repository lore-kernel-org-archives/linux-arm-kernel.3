Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA3DDC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 13:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ljNMDwgEGPxW3l7UmALBlGE8xpBlFOfs4DWVLNTuYNs=; b=KwAFJ9rtkpe4+/PcyqRP3V/nyd
	wduRKGie/DyNZIp7ckmnEbG92SItll67r7NGdv824dhCtJiVnbIuH06L5Z5SgEbRduc+hJLgYzLdY
	9FheMp05Ca76NChjj2zUgid9bp6AyUI/2yXFxdGY41CCX9OeWN1yvtNuBwn+zWGn14DLHxa0imeCR
	P5xUNI107ubX5SXokJeLAlCyN8875mT9+lP1Ssr9Z2/huifZNL5GpPTlcBH/VJq4AZEA7ASrBOWOC
	HoriNu8uVZIVVSL7T3V5LMg0SAp6QPx1p9LC8e2OIsQ/+RhcagjceSo/pFeKh1jYFq2dfyph65L/l
	Xv+AeBsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl6gz-000000014uy-1h25;
	Thu, 20 Feb 2025 13:34:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl6T0-000000011Nj-1Dlu;
	Thu, 20 Feb 2025 13:19:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9B8B95C5E1A;
	Thu, 20 Feb 2025 13:19:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BD60C4CEE2;
	Thu, 20 Feb 2025 13:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740057589;
	bh=u+iFsMVx5TqWifZdRLJ8I/qERMsgsiauDgynXlT7cr4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jWPk34xgj+3mQb1Cmnl4ejrnalQGNgEIcgF4UabsQqqNnb6yZ82MpmymifLz6wwHw
	 OYnpOZG1ThNVv3u9sTyi7Gpf91W+GEGrlkZJlJuxZ4mAnZTMsn8wR2BG8cJN1ctNRL
	 hCiv5gs+Kxypy43A7wbD2XuLKiKG13sIYRFAb3PPnKJtvfiJjkgQX6ltM8acANb//l
	 X525tjk9/nHQyOE00FrNztSKy771hkH7KR3s3yuWpBc6WODCheSY5KwCn2y8H3kpbC
	 I2af99bmGMPRzEKk7rmTgPUklW3qOUGY+IKZyXVw6WoqNRrEvzo9UJ/RdwUn6t6+5I
	 7+9VuLu+AnYMA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 20 Feb 2025 14:19:00 +0100
Subject: [PATCH 14/14] wifi: mt76: mt7996: Rely on mt7996_vif_link and
 mt7996_sta_link in mt7996_mac_twt_teardown_flow signature
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-mt7996-mlo-v1-14-34c4abb37158@kernel.org>
References: <20250220-mt7996-mlo-v1-0-34c4abb37158@kernel.org>
In-Reply-To: <20250220-mt7996-mlo-v1-0-34c4abb37158@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Kalle Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_051950_426109_39D53145 
X-CRM114-Status: GOOD (  10.69  )
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

This is a preliminary patch to enable MLO for MT7996 driver

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c    | 7 +++----
 drivers/net/wireless/mediatek/mt76/mt7996/main.c   | 7 +++++--
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h | 3 ++-
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 0c862cd749b233ae1a6870c536792087109cd46c..f663c177ae066113db78dab905db177f63337676 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -2678,10 +2678,10 @@ void mt7996_mac_add_twt_setup(struct ieee80211_hw *hw,
 }
 
 void mt7996_mac_twt_teardown_flow(struct mt7996_dev *dev,
-				  struct mt7996_sta *msta,
+				  struct mt7996_vif_link *link,
+				  struct mt7996_sta_link *msta_link,
 				  u8 flowid)
 {
-	struct mt7996_sta_link *msta_link = &msta->deflink;
 	struct mt7996_twt_flow *flow;
 
 	lockdep_assert_held(&dev->mt76.mutex);
@@ -2693,8 +2693,7 @@ void mt7996_mac_twt_teardown_flow(struct mt7996_dev *dev,
 		return;
 
 	flow = &msta_link->twt.flow[flowid];
-	if (mt7996_mcu_twt_agrt_update(dev, &msta->vif->deflink, flow,
-				       MCU_TWT_AGRT_DELETE))
+	if (mt7996_mcu_twt_agrt_update(dev, link, flow, MCU_TWT_AGRT_DELETE))
 		return;
 
 	list_del_init(&flow->list);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index ecfea602cab9d0cdb2c79e682910ce2c5bd1079f..941d48716005c16414221fad9a41c53667dd3f78 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -1009,7 +1009,8 @@ int mt7996_mac_sta_event(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 			break;
 		case MT76_STA_EVENT_DISASSOC:
 			for (i = 0; i < ARRAY_SIZE(msta_link->twt.flow); i++)
-				mt7996_mac_twt_teardown_flow(dev, msta, i);
+				mt7996_mac_twt_teardown_flow(dev, link,
+							     msta_link, i);
 
 			mt7996_mcu_add_sta(dev, link_conf, link_sta, link,
 					   msta_link, CONN_STATE_DISCONNECT,
@@ -1709,10 +1710,12 @@ mt7996_twt_teardown_request(struct ieee80211_hw *hw,
 			    u8 flowid)
 {
 	struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
+	struct mt7996_sta_link *msta_link = &msta->deflink;
+	struct mt7996_vif_link *link = &msta->vif->deflink;
 	struct mt7996_dev *dev = mt7996_hw_dev(hw);
 
 	mutex_lock(&dev->mt76.mutex);
-	mt7996_mac_twt_teardown_flow(dev, msta, flowid);
+	mt7996_mac_twt_teardown_flow(dev, link, msta_link, flowid);
 	mutex_unlock(&dev->mt76.mutex);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index 3a8e99b6f474af285838f90b1068380c93a862a1..d576dfb2402cdd076e707cc8d725b42de737bff4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -715,7 +715,8 @@ void mt7996_mac_dump_work(struct work_struct *work);
 void mt7996_mac_sta_rc_work(struct work_struct *work);
 void mt7996_mac_update_stats(struct mt7996_phy *phy);
 void mt7996_mac_twt_teardown_flow(struct mt7996_dev *dev,
-				  struct mt7996_sta *msta,
+				  struct mt7996_vif_link *link,
+				  struct mt7996_sta_link *msta_link,
 				  u8 flowid);
 void mt7996_mac_add_twt_setup(struct ieee80211_hw *hw,
 			      struct ieee80211_sta *sta,

-- 
2.48.1


