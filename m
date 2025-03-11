Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C06C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 19:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UpD7IfzNAmvF03/c5DMQRuG3uY+LkykF0tbWG1s1BSM=; b=xzT2+XCf0jCqluSHt1E6cBJKxP
	tDWpntj2fs4nPWqkmJedxchVaoDakVn4WMkTySyhvjlta0ehD1PVWQOt9/4yfLFi8+Vq3hHGBvNpx
	050Eu4RSSbjSGFEXE4AHQoqQkOO9c8Cv1Oxa1FOnX3G1jO6MQvrwiMXkx1NDPY0T6NaxS6JE+4uZf
	/ycfw+WaVEdr/XDqUBBOHLJMHd6Ij4cN7ZGJ6767vEzWVJKo8HruFUdvw/1MpEIcl/iE+HlASARI6
	z06+jymetdeE7lw2lY7J1jE0OudG0RMwj32qeAwa/WQrhRNcq/7To8xgSvoYNKxJVEBOlJO2ye6/c
	rvaK0zfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4v6-00000006itg-0WUe;
	Tue, 11 Mar 2025 19:05:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts3fR-00000006VB2-1r8h;
	Tue, 11 Mar 2025 17:45:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 11C055C683F;
	Tue, 11 Mar 2025 17:43:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EABCC4CEEA;
	Tue, 11 Mar 2025 17:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741715124;
	bh=yMGvzqosXKLOg9r7y8NE7dLNPaEiAHvwtMOrKej2gDM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UOvNErM86huTmpVRVXTsFHd3gq/GhF0LLFJLFNh9lEIga3OHhvWdOolRKdKDn3MQs
	 UUTvVHOk6QzOUbVDSeuY+V8xmzoXwcDuv/Zio4EPYDS7lA2ahdFdl6lY8A2WfFn/Lt
	 r79pU2+9MVn9oEdk4Px4STQC8KFlPiXuhEqiMvtigwg19vNXcQt7pnN3Qbksn1LqIe
	 n/hO4j2QUkvvf9I0W7MSBvg+QvrUJYvg/31NPns9RDLGgAHoqztCkTL+eJtsYGypW6
	 Or7OP+yGWNCkgzrRx4akTDOp6YL6qJIZiwoyaoc/rbsFsQ7c1wfgZwKmkirdv+NDEM
	 L/EK99ryY2MtQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 11 Mar 2025 18:45:02 +0100
Subject: [PATCH v2 03/13] wifi: mt76: mt7996: Add mt7996_sta_link struct in
 mt7996_vif_link
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-mt7996-mlo-v2-3-31df6972519b@kernel.org>
References: <20250311-mt7996-mlo-v2-0-31df6972519b@kernel.org>
In-Reply-To: <20250311-mt7996-mlo-v2-0-31df6972519b@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Kalle Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, 
 Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_104525_600551_756CA8E6 
X-CRM114-Status: GOOD (  16.43  )
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

Introduce mt7996_sta_link field in mt7996_vif_link structure instead of
mt7996_sta. This is a preliminary patch to support MLO in MT7996 driver.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c    |  6 +++---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c   | 24 ++++++++++++----------
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c    | 10 ++++-----
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h |  2 +-
 4 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 754f8e520f52f6abf70daa148bf4289f68b1252b..456666eb7080c50493dcde61c5399adc6a987d2d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -72,10 +72,10 @@ static struct mt76_wcid *mt7996_rx_get_wcid(struct mt7996_dev *dev,
 	msta_link = container_of(wcid, struct mt7996_sta_link, wcid);
 	msta = msta_link->sta;
 
-	if (!msta->vif)
+	if (!msta || !msta->vif)
 		return NULL;
 
-	return &msta->vif->deflink.sta.deflink.wcid;
+	return &msta->vif->deflink.msta_link.wcid;
 }
 
 bool mt7996_mac_wtbl_update(struct mt7996_dev *dev, int idx, u32 mask)
@@ -202,7 +202,7 @@ void mt7996_mac_enable_rtscts(struct mt7996_dev *dev,
 			      struct ieee80211_vif *vif, bool enable)
 {
 	struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
-	struct mt7996_sta_link *msta_link = &mvif->deflink.sta.deflink;
+	struct mt7996_sta_link *msta_link = &mvif->deflink.msta_link;
 	u32 addr;
 
 	addr = mt7996_mac_wtbl_lmac_addr(dev, msta_link->wcid.idx, 5);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 0cd011619fd3fc6f6994e4a8a896668340969cf5..34f984387c00714fbe72af5220ec067760510bb8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -161,19 +161,23 @@ mt7996_set_hw_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 		  struct mt7996_vif_link *mlink, struct ieee80211_key_conf *key)
 {
 	struct mt7996_dev *dev = mt7996_hw_dev(hw);
-	struct mt7996_sta *msta = sta ? (struct mt7996_sta *)sta->drv_priv :
-				  &mlink->sta;
-	struct mt76_wcid *wcid = &msta->deflink.wcid;
-	u8 *wcid_keyidx = &wcid->hw_key_idx;
+	struct mt76_wcid *wcid = &mlink->msta_link.wcid;
 	struct mt7996_phy *phy;
 	int idx = key->keyidx;
+	u8 *wcid_keyidx;
 
 	phy = mt7996_vif_link_phy(mlink);
 	if (!phy)
 		return -EINVAL;
 
-	if (sta && !wcid->sta)
-		return -EOPNOTSUPP;
+	if (sta) {
+		struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
+
+		wcid = &msta->deflink.wcid;
+		if (!wcid->sta)
+			return -EOPNOTSUPP;
+	}
+	wcid_keyidx = &wcid->hw_key_idx;
 
 	switch (key->cipher) {
 	case WLAN_CIPHER_SUITE_AES_CMAC:
@@ -229,7 +233,7 @@ int mt7996_vif_link_add(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 			struct mt76_vif_link *mlink)
 {
 	struct mt7996_vif_link *link = container_of(mlink, struct mt7996_vif_link, mt76);
-	struct mt7996_sta_link *msta_link = &link->sta.deflink;
+	struct mt7996_sta_link *msta_link = &link->msta_link;
 	struct mt7996_phy *phy = mphy->priv;
 	struct mt7996_dev *dev = phy->dev;
 	u8 band_idx = phy->mt76->band_idx;
@@ -261,7 +265,6 @@ int mt7996_vif_link_add(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 	idx = MT7996_WTBL_RESERVED - mlink->idx;
 
 	INIT_LIST_HEAD(&msta_link->rc_list);
-	msta_link->sta = &link->sta;
 	msta_link->wcid.idx = idx;
 	msta_link->wcid.tx_info |= MT_WCID_TX_INFO_SET;
 	mt76_wcid_init(&msta_link->wcid, band_idx);
@@ -303,10 +306,9 @@ void mt7996_vif_link_remove(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 			    struct mt76_vif_link *mlink)
 {
 	struct mt7996_vif_link *link = container_of(mlink, struct mt7996_vif_link, mt76);
+	struct mt7996_sta_link *msta_link = &link->msta_link;
 	struct mt7996_phy *phy = mphy->priv;
 	struct mt7996_dev *dev = phy->dev;
-	struct mt7996_sta *msta = &link->sta;
-	struct mt7996_sta_link *msta_link = &msta->deflink;
 	int idx = msta_link->wcid.idx;
 
 	mt7996_mcu_add_sta(dev, vif, mlink, NULL, CONN_STATE_DISCONNECT, false);
@@ -892,7 +894,7 @@ static void mt7996_tx(struct ieee80211_hw *hw,
 		struct mt7996_vif *mvif;
 
 		mvif = (struct mt7996_vif *)vif->drv_priv;
-		wcid = &mvif->deflink.sta.deflink.wcid;
+		wcid = &mvif->deflink.msta_link.wcid;
 
 		if (mvif->mt76.roc_phy &&
 		    (info->flags & IEEE80211_TX_CTL_TX_OFFCHAN)) {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index b0ddc2af1516995fc11f030ef8360bae4ea3be3b..9018ede6efed49241205ddc042f3df149cd58530 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -2171,8 +2171,8 @@ mt7996_mcu_add_group(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 		.val = cpu_to_le32(mvif->deflink.mt76.idx % 16),
 	};
 
-	msta = sta ? (struct mt7996_sta *)sta->drv_priv : &mvif->deflink.sta;
-	msta_link = &msta->deflink;
+	msta = sta ? (struct mt7996_sta *)sta->drv_priv : NULL;
+	msta_link = msta ? &msta->deflink : &mvif->deflink.msta_link;
 	req.wlan_idx = cpu_to_le16(msta_link->wcid.idx);
 
 	return mt76_mcu_send_msg(&dev->mt76, MCU_WM_UNI_CMD(VOW), &req,
@@ -2319,7 +2319,7 @@ static int mt7996_mcu_get_pn(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 {
 #define TSC_TYPE_BIGTK_PN 2
 	struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
-	struct mt7996_sta_link *msta_link = &mvif->deflink.sta.deflink;
+	struct mt7996_sta_link *msta_link = &mvif->deflink.msta_link;
 	struct sta_rec_pn_info *pn_info;
 	struct sk_buff *skb, *rskb;
 	struct tlv *tlv;
@@ -4357,8 +4357,8 @@ int mt7996_mcu_wtbl_update_hdr_trans(struct mt7996_dev *dev,
 	struct mt7996_sta *msta;
 	struct sk_buff *skb;
 
-	msta = sta ? (struct mt7996_sta *)sta->drv_priv : &mvif->deflink.sta;
-	msta_link = &msta->deflink;
+	msta = sta ? (struct mt7996_sta *)sta->drv_priv : NULL;
+	msta_link = msta ? &msta->deflink : &mvif->deflink.msta_link;
 
 	skb = __mt76_connac_mcu_alloc_sta_req(&dev->mt76, &mvif->deflink.mt76,
 					      &msta_link->wcid,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index d0a4240f12a482895659e3a359daadcdca7bf7c9..ac5b94e1315ec610f5182563e3fb9d504a67c16f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -215,7 +215,7 @@ struct mt7996_sta {
 struct mt7996_vif_link {
 	struct mt76_vif_link mt76; /* must be first */
 
-	struct mt7996_sta sta;
+	struct mt7996_sta_link msta_link;
 	struct mt7996_phy *phy;
 
 	struct ieee80211_tx_queue_params queue_params[IEEE80211_NUM_ACS];

-- 
2.48.1


