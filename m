Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DB7C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 13:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nXTeVOFNCWzbdVO0LmnZtr0Oh5swCk9akXtVtHvzZMM=; b=pvV1om876yKIzauDSF8FatTKfw
	aJYSJDEXwn27LoHz+qpkVJIzfAeIWgF8s5rTD4Rp/vN8wnEYvsLutpkJ4VWzf3sPB+SNJdb+gueoZ
	AuOF2gMzX6SV9jx4puFSnt72Gip095qx7lVXmd5zrIbUML7uAWVROQspXWnhjCCFTygiZW2pOuVye
	XijIfovlsOa/QzN6EulK7lIGokVHJlepEHaqeWr3UyRcN2krB/E3qkeqMh74+MBlyGeE/rHEKDRiu
	PLjEdCwyEPZHTIhn8Z8rRQMGhWSw2uTK9RmEiorw1Z29mKb/9cLs9LqsdLH2NfzbbLkeKv5oEXg3g
	YQFi/fzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl6Zg-000000012yG-0tjH;
	Thu, 20 Feb 2025 13:26:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl6Sk-000000011Gn-0oyr;
	Thu, 20 Feb 2025 13:19:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DF1E86144C;
	Thu, 20 Feb 2025 13:19:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE3C9C4CEE2;
	Thu, 20 Feb 2025 13:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740057573;
	bh=NMKfKYHsw5h77rOqLOseLFklXTOlYyElpbIvxJSWHQE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lR3VxaLXaOMHzjD2O43ZhYb1yF0yfypAV5zqLn4qepSe+a8sSU6T6jTOGj/Z4xcNe
	 e/gt/sCKT6YUFNYJFZv9VRnKSoRgsbvN35q2WuKY1DLllxZkq7G338atgVySZqOLhX
	 M14dmHEqYGjUn/iUJ5cvBFrmlKFkcceaeaiDGp5UzH6qML/Vh3Jl7tjwJVIomulpgu
	 PFZK3p36FBDTuUsb3pa/iEEDFLs7wewirroiuTaMZxooaKqfqtR+eOEWZzcUcNjNvz
	 FaEcNl5jeiHZRixUyaKZd4Bvsa+Eg055W+x0xNxnHqzBVeb9OCZvftHAA0UDetAhp6
	 NHxf/NdOo/vGA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 20 Feb 2025 14:18:54 +0100
Subject: [PATCH 08/14] wifi: mt76: mt7996: Rely on mt7996_sta_link in
 sta_add/sta_remove callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-mt7996-mlo-v1-8-34c4abb37158@kernel.org>
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
X-CRM114-CacheID: sfid-20250220_051934_360127_F0AFFDDA 
X-CRM114-Status: GOOD (  17.13  )
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

Generalize mt7996_mac_sta_add() and mt7996_mac_sta_remove() routines to
deal with mt7996_sta_link structure.
This is a preliminary patch to introduce MLO support for MT7996 driver.

Co-developed-by: Bo Jiao <Bo.Jiao@mediatek.com>
Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
Co-developed-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Co-developed-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c   | 148 ++++++++++++++++-----
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h |   4 +
 2 files changed, 121 insertions(+), 31 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index eb923c17220eb2ac8d6c916f250c618ebd90c311..06e87a8cae48902d3ffa641127f653ddb146cb3d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -787,41 +787,143 @@ mt7996_channel_switch_beacon(struct ieee80211_hw *hw,
 	mutex_unlock(&dev->mt76.mutex);
 }
 
-int mt7996_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
-		       struct ieee80211_sta *sta)
+static int
+mt7996_mac_sta_init_link(struct mt7996_dev *dev, struct ieee80211_vif *vif,
+			 struct mt7996_vif_link *link,
+			 struct ieee80211_sta *sta, unsigned int link_id)
 {
-	struct mt7996_dev *dev = container_of(mdev, struct mt7996_dev, mt76);
 	struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
-	struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
-	struct mt7996_sta_link *msta_link = &msta->deflink;
-	struct mt7996_vif_link *link = &mvif->deflink;
-	struct mt7996_phy *phy = link->phy;
-	u8 band_idx = phy->mt76->band_idx;
+	struct mt7996_sta_link *msta_link;
 	int idx;
 
 	idx = mt76_wcid_alloc(dev->mt76.wcid_mask, MT7996_WTBL_STA);
 	if (idx < 0)
 		return -ENOSPC;
 
-	msta->vif = mvif;
+	if (msta->deflink_id == IEEE80211_LINK_UNSPECIFIED) {
+		msta_link = &msta->deflink;
+		msta->deflink_id = link_id;
+	} else {
+		msta_link = kzalloc(sizeof(*msta_link), GFP_KERNEL);
+		if (!msta_link)
+			return -ENOMEM;
+	}
+
 	INIT_LIST_HEAD(&msta_link->rc_list);
 	INIT_LIST_HEAD(&msta_link->wcid.poll_list);
 	msta_link->sta = msta;
 	msta_link->wcid.sta = 1;
 	msta_link->wcid.idx = idx;
-	msta_link->wcid.phy_idx = band_idx;
+	msta_link->wcid.link_id = link_id;
+
+	__mt76_sta_common_init(link->phy->mt76, &msta_link->wcid,
+			       sta, msta->deflink_id == link_id);
 
 	ewma_avg_signal_init(&msta_link->avg_ack_signal);
 
-	mt7996_mac_wtbl_update(dev, idx,
-			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
+	rcu_assign_pointer(msta->link[link_id], msta_link);
+
+	mt7996_mac_wtbl_update(dev, idx, MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
 	mt7996_mcu_add_sta(dev, vif, &link->mt76, sta, CONN_STATE_DISCONNECT,
 			   true);
-	mt76_sta_common_init(phy->mt76, &msta_link->wcid, sta);
 
 	return 0;
 }
 
+static void
+mt7996_mac_sta_deinit_link(struct mt7996_dev *dev,
+			   struct mt7996_sta_link *msta_link)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(msta_link->wcid.aggr); i++)
+		mt76_rx_aggr_stop(&dev->mt76, &msta_link->wcid, i);
+
+	mt7996_mac_wtbl_update(dev, msta_link->wcid.idx,
+			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
+
+	spin_lock_bh(&dev->mt76.sta_poll_lock);
+	if (!list_empty(&msta_link->wcid.poll_list))
+		list_del_init(&msta_link->wcid.poll_list);
+	if (!list_empty(&msta_link->rc_list))
+		list_del_init(&msta_link->rc_list);
+	spin_unlock_bh(&dev->mt76.sta_poll_lock);
+
+	mt76_wcid_cleanup(&dev->mt76, &msta_link->wcid);
+	mt76_wcid_mask_clear(dev->mt76.wcid_mask, msta_link->wcid.idx);
+}
+
+static void
+mt7996_mac_sta_remove_links(struct mt7996_dev *dev, struct ieee80211_sta *sta,
+			    unsigned long links)
+{
+	struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
+	struct mt76_dev *mdev = &dev->mt76;
+	unsigned int link_id;
+
+	for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
+		struct mt7996_sta_link *msta_link = NULL;
+
+		msta_link = rcu_replace_pointer(msta->link[link_id], msta_link,
+						lockdep_is_held(&mdev->mutex));
+		if (!msta_link)
+			continue;
+
+		mt7996_mac_sta_deinit_link(dev, msta_link);
+		if (msta->deflink_id == link_id) {
+			msta->deflink_id = IEEE80211_LINK_UNSPECIFIED;
+			continue;
+		}
+
+		kfree_rcu(msta_link, rcu_head);
+	}
+}
+
+static int
+mt7996_mac_sta_add_links(struct mt7996_dev *dev, struct ieee80211_vif *vif,
+			 struct ieee80211_sta *sta, unsigned long new_links)
+{
+	struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
+	unsigned int link_id;
+	int err;
+
+	for_each_set_bit(link_id, &new_links, IEEE80211_MLD_MAX_NUM_LINKS) {
+		struct mt7996_vif_link *link;
+
+		if (rcu_access_pointer(msta->link[link_id]))
+			continue;
+
+		link = mt7996_vif_link(dev, vif, link_id);
+		if (!link)
+			goto error_unlink;
+
+		err = mt7996_mac_sta_init_link(dev, vif, link, sta, link_id);
+		if (err)
+			goto error_unlink;
+	}
+
+	return 0;
+
+error_unlink:
+	mt7996_mac_sta_remove_links(dev, sta, new_links);
+
+	return err;
+}
+
+int mt7996_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
+		       struct ieee80211_sta *sta)
+{
+	struct mt7996_dev *dev = container_of(mdev, struct mt7996_dev, mt76);
+	struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
+	struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
+	unsigned long links = sta->mlo ? sta->valid_links : BIT(0);
+
+	msta->deflink_id = IEEE80211_LINK_UNSPECIFIED;
+	msta->vif = mvif;
+
+	return mt7996_mac_sta_add_links(dev, vif, sta, links);
+}
+
 int mt7996_mac_sta_event(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 			 struct ieee80211_sta *sta, enum mt76_sta_event ev)
 {
@@ -871,25 +973,9 @@ void mt7996_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 			   struct ieee80211_sta *sta)
 {
 	struct mt7996_dev *dev = container_of(mdev, struct mt7996_dev, mt76);
-	struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
-	struct mt7996_sta_link *msta_link = &msta->deflink;
-	int i, idx = msta_link->wcid.idx;
-
-	for (i = 0; i < ARRAY_SIZE(msta_link->wcid.aggr); i++)
-		mt76_rx_aggr_stop(mdev, &msta_link->wcid, i);
-
-	mt7996_mac_wtbl_update(dev, msta_link->wcid.idx,
-			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
-
-	spin_lock_bh(&mdev->sta_poll_lock);
-	if (!list_empty(&msta_link->wcid.poll_list))
-		list_del_init(&msta_link->wcid.poll_list);
-	if (!list_empty(&msta_link->rc_list))
-		list_del_init(&msta_link->rc_list);
-	spin_unlock_bh(&mdev->sta_poll_lock);
+	unsigned long links = sta->mlo ? sta->valid_links : BIT(0);
 
-	mt76_wcid_cleanup(mdev, &msta_link->wcid);
-	mt76_wcid_mask_clear(mdev->wcid_mask, idx);
+	mt7996_mac_sta_remove_links(dev, sta, links);
 }
 
 static void mt7996_tx(struct ieee80211_hw *hw,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index ac5b94e1315ec610f5182563e3fb9d504a67c16f..74b1fea9ac38466402d1791ba6207b495376c150 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -204,10 +204,14 @@ struct mt7996_sta_link {
 		u8 flowid_mask;
 		struct mt7996_twt_flow flow[MT7996_MAX_STA_TWT_AGRT];
 	} twt;
+
+	struct rcu_head rcu_head;
 };
 
 struct mt7996_sta {
 	struct mt7996_sta_link deflink; /* must be first */
+	struct mt7996_sta_link __rcu *link[IEEE80211_MLD_MAX_NUM_LINKS];
+	u8 deflink_id;
 
 	struct mt7996_vif *vif;
 };

-- 
2.48.1


