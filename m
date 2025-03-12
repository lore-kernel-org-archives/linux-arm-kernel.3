Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90337C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 12:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U8GgpesGPKvUPuO+e0urIVQS32ohPuw+lvfStFcCRo4=; b=Z5MGDTMeIpnLANxE4kVhwieBGa
	bp9JPUax+xa2wh9BevLbWFH00tOf/obb+5PtbNtAkDItFY4Mns9Gd2HTUK3IBymoCuYh4HvUXHV5C
	PLaLRWPGvmMPMKyd/J01LSHLjg2Stg1+h3ShF0c2hyq5WHa/Wyl6FhH9uyRlctSukwkiMGh+XJJVo
	9CNnS60wrPSWUQjJf5W5HexH3RrRKYxtdV1mQ0Mc22UvaxHZny8MNove4AF+NSLXJfmd4kJH10y5m
	M/TEmALOetcEC8sr+CEfSGQtYI8LuR0Lkz/ogBkqWG31Qvy4IbKCD/giFgLYmcHmhrCyxQ1LixBBK
	iKJquiGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKmB-00000008LEt-2VaZ;
	Wed, 12 Mar 2025 12:01:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsK2i-00000008E0U-45p7;
	Wed, 12 Mar 2025 11:14:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8B9415C4427;
	Wed, 12 Mar 2025 11:12:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE550C4CEE3;
	Wed, 12 Mar 2025 11:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741778072;
	bh=b08uEQ5quVp3D6iNULc2yDb9yKAuO3kK/KKmB/b0PGA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=vJkFe0z6Hu3nQvReHWse6tIG0wbyZL7oMg44G/gueVUiprWIjF3tp9BK259WJGX9I
	 tFGtgqteXp/Yss61R32hejOG5f0vUmPqRpqWS6jTeuDRXKMuKOyS8Bkeq8UrPpYEw6
	 SHnLUcBZoLexKxlYmpGmLIhT5dkdavGu5l7t+UfdIn7yrir168E3fZFfkdroVS0pMi
	 UuZwp5azTO8gOSjHEVebsQSJ6WH/VNeGBSQjI18F6FNtUPxDCxJoiU16kZrLZKC4aT
	 NS0CwfPQIgncUoI3yVqPtCnsEoYsb8uZwuOoP11FG3YuNPYIWcxz/yx8I7rJA9NZkh
	 EwjkfF3EUALyA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 12 Mar 2025 12:13:56 +0100
Subject: [PATCH 12/21] wifi: mt76: mt7996: rework mt7996_mac_sta_rc_work to
 support MLO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-b4-mt7996-mlo-p2-v1-12-015b3d6fd928@kernel.org>
References: <20250312-b4-mt7996-mlo-p2-v1-0-015b3d6fd928@kernel.org>
In-Reply-To: <20250312-b4-mt7996-mlo-p2-v1-0-015b3d6fd928@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Bo Jiao <Bo.Jiao@mediatek.com>, 
 Peter Chiu <chui-hao.chiu@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_041433_132316_D3F9FCBE 
X-CRM114-Status: GOOD (  12.99  )
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

Rework mt7996_mac_sta_rc_work routine in order to support multi-link
setup.

Co-developed-by: Bo Jiao <Bo.Jiao@mediatek.com>
Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
Co-developed-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Co-developed-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c  | 40 ++++++++++++++++++------
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 30 ++++++++++++------
 2 files changed, 52 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index c1c7638e29a1205629f4eb126e15163981109557..c56b1126abd59da5895d94fb368004adf6ffbbc8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -2300,13 +2300,20 @@ void mt7996_mac_update_stats(struct mt7996_phy *phy)
 void mt7996_mac_sta_rc_work(struct work_struct *work)
 {
 	struct mt7996_dev *dev = container_of(work, struct mt7996_dev, rc_work);
+	struct ieee80211_bss_conf *link_conf;
+	struct ieee80211_link_sta *link_sta;
 	struct mt7996_sta_link *msta_link;
+	struct mt7996_vif_link *link;
+	struct mt76_vif_link *mlink;
 	struct ieee80211_sta *sta;
 	struct ieee80211_vif *vif;
 	struct mt7996_sta *msta;
-	u32 changed;
+	struct mt7996_vif *mvif;
 	LIST_HEAD(list);
+	u32 changed;
+	u8 link_id;
 
+	rcu_read_lock();
 	spin_lock_bh(&dev->mt76.sta_poll_lock);
 	list_splice_init(&dev->sta_rc_list, &list);
 
@@ -2319,21 +2326,35 @@ void mt7996_mac_sta_rc_work(struct work_struct *work)
 		msta_link->changed = 0;
 		spin_unlock_bh(&dev->mt76.sta_poll_lock);
 
+		sta = wcid_to_sta(&msta_link->wcid);
+		link_id = msta_link->wcid.link_id;
 		msta = msta_link->sta;
-		sta = container_of((void *)msta, struct ieee80211_sta, drv_priv);
-		vif = container_of((void *)msta->vif, struct ieee80211_vif, drv_priv);
+		mvif = msta->vif;
+		vif = container_of((void *)mvif, struct ieee80211_vif, drv_priv);
+
+		mlink = rcu_dereference(mvif->mt76.link[link_id]);
+		if (!mlink)
+			continue;
+
+		link_sta = rcu_dereference(sta->link[link_id]);
+		if (!link_sta)
+			continue;
+
+		link_conf = rcu_dereference(vif->link_conf[link_id]);
+		if (!link_conf)
+			continue;
+
+		link = (struct mt7996_vif_link *)mlink;
 
 		if (changed & (IEEE80211_RC_SUPP_RATES_CHANGED |
 			       IEEE80211_RC_NSS_CHANGED |
 			       IEEE80211_RC_BW_CHANGED))
-			mt7996_mcu_add_rate_ctrl(dev, vif, &vif->bss_conf,
-						 &sta->deflink,
-						 &msta->vif->deflink,
-						 msta_link, true);
+			mt7996_mcu_add_rate_ctrl(dev, vif, link_conf,
+						 link_sta, link, msta_link,
+						 true);
 
 		if (changed & IEEE80211_RC_SMPS_CHANGED)
-			mt7996_mcu_set_fixed_field(dev, &sta->deflink,
-						   &msta->vif->deflink,
+			mt7996_mcu_set_fixed_field(dev, link_sta, link,
 						   msta_link, NULL,
 						   RATE_PARAM_MMPS_UPDATE);
 
@@ -2341,6 +2362,7 @@ void mt7996_mac_sta_rc_work(struct work_struct *work)
 	}
 
 	spin_unlock_bh(&dev->mt76.sta_poll_lock);
+	rcu_read_unlock();
 }
 
 void mt7996_mac_work(struct work_struct *work)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 8d7ad2dc2d7bccf6c8f5fe4862828b61145a0c85..4d3098e47dbbc25ced2a4b40c6b92423c451899e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -304,6 +304,7 @@ int mt7996_vif_link_add(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 
 	INIT_LIST_HEAD(&msta_link->rc_list);
 	msta_link->wcid.idx = idx;
+	msta_link->wcid.link_id = link_conf->link_id;
 	msta_link->wcid.tx_info |= MT_WCID_TX_INFO_SET;
 	mt76_wcid_init(&msta_link->wcid, band_idx);
 
@@ -1521,29 +1522,39 @@ static void mt7996_sta_statistics(struct ieee80211_hw *hw,
 	}
 }
 
-static void mt7996_sta_rc_work(void *data, struct ieee80211_sta *sta)
+static void mt7996_link_rate_ctrl_update(void *data, struct ieee80211_sta *sta)
 {
 	struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
 	struct mt7996_dev *dev = msta->vif->deflink.phy->dev;
-	struct mt7996_sta_link *msta_link = &msta->deflink;
+	struct mt7996_sta_link *msta_link;
 	u32 *changed = data;
 
+	rcu_read_lock();
+
+	msta_link = rcu_dereference(msta->link[msta->deflink_id]);
+	if (!msta_link)
+		goto out;
+
 	spin_lock_bh(&dev->mt76.sta_poll_lock);
+
 	msta_link->changed |= *changed;
 	if (list_empty(&msta_link->rc_list))
 		list_add_tail(&msta_link->rc_list, &dev->sta_rc_list);
+
 	spin_unlock_bh(&dev->mt76.sta_poll_lock);
+out:
+	rcu_read_unlock();
 }
 
-static void mt7996_sta_rc_update(struct ieee80211_hw *hw,
-				 struct ieee80211_vif *vif,
-				 struct ieee80211_link_sta *link_sta,
-				 u32 changed)
+static void mt7996_link_sta_rc_update(struct ieee80211_hw *hw,
+				      struct ieee80211_vif *vif,
+				      struct ieee80211_link_sta *link_sta,
+				      u32 changed)
 {
 	struct mt7996_dev *dev = mt7996_hw_dev(hw);
 	struct ieee80211_sta *sta = link_sta->sta;
 
-	mt7996_sta_rc_work(&changed, sta);
+	mt7996_link_rate_ctrl_update(&changed, sta);
 	ieee80211_queue_work(hw, &dev->rc_work);
 }
 
@@ -1565,7 +1576,8 @@ mt7996_set_bitrate_mask(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	 * - multiple rates: if it's not in range format i.e 0-{7,8,9} for VHT
 	 * then multiple MCS setting (MCS 4,5,6) is not supported.
 	 */
-	ieee80211_iterate_stations_atomic(hw, mt7996_sta_rc_work, &changed);
+	ieee80211_iterate_stations_atomic(hw, mt7996_link_rate_ctrl_update,
+					  &changed);
 	ieee80211_queue_work(hw, &dev->rc_work);
 
 	return 0;
@@ -2023,7 +2035,7 @@ const struct ieee80211_ops mt7996_ops = {
 	.link_info_changed = mt7996_link_info_changed,
 	.sta_state = mt7996_sta_state,
 	.sta_pre_rcu_remove = mt76_sta_pre_rcu_remove,
-	.link_sta_rc_update = mt7996_sta_rc_update,
+	.link_sta_rc_update = mt7996_link_sta_rc_update,
 	.set_key = mt7996_set_key,
 	.ampdu_action = mt7996_ampdu_action,
 	.set_rts_threshold = mt7996_set_rts_threshold,

-- 
2.48.1


