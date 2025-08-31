Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E36C1CA0FE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Aug 2025 22:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7UGpC4k1s4o++ArXEHYGWSUE1IqVb/ADaDnpWYicHDU=; b=OwZag40/riHp/1yobFyoUeXQdw
	Dd0bhyZzxt5cHSkIvXKksogaCeB/L4vquydf25W2+kypL9IvZ8/UsXjN/zieayHwVQN6Cb9o+Owfe
	Xg6iEbnTaw6lbYA3LSm1bjFl5QRcUcXMMA6vZuyfmVQgcrYt+YINPj0Y0v82J3GKYjaZ5aypP9YDG
	/VtRuqYgneMYI1ItfS4QY4apacB6jgfGYcQ0TSYqPbIUZBtex2QcRbuPrxyVi8ucYoe0tEw2yw5It
	EbOCPBNTEW5a+reLGWW8rV4eKn1yuJS/smK7cQB+/T2Nvhr8moOND6Vd4pG262hz+KjIYa7uK8fYw
	Ikza51hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usqMo-0000000Akf8-3wwp;
	Sun, 31 Aug 2025 22:17:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usqK9-0000000Akbp-2Kpi;
	Sun, 31 Aug 2025 22:14:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 993C1601B1;
	Sun, 31 Aug 2025 22:14:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAA38C4CEED;
	Sun, 31 Aug 2025 22:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756678496;
	bh=3Xss2Co3He96uRMaXnCLjMQL0IkTNyb4K4s+G1NFEY8=;
	h=From:Date:Subject:To:Cc:From;
	b=sxz1Y0SDU6qOkz8svjCRGFQhGoKXfbodfvAE42iVSDCQFREY0WK89E3wE01hjtyhd
	 OcoT4LPn+y1pV2o2H/GGHDioCq9NBBa5vmENZ6jteFJWhsU4Woz2R6oWYEUu6g1XNY
	 kHDfDtApSKifk/oWHXALG3q05tT5fcG8HEzCAV7UU3RJYtumkpnjobO3DYP9qkybMc
	 ypBn1hvE+I6DJdis3TSmGnJALGEPLAv8fKP86VlHbifBE05Y3nuneUcqc0ZfAHPaQw
	 HozvhyFowbj1AC08V73yPEqYWH5yZvLO7VZXn2zWkka+fslrA7c1PwG/YHwALtg3x7
	 U4mrqkGqThWzA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 01 Sep 2025 00:14:37 +0200
Subject: [PATCH mt76] wifi: mt76: mt7996: Use proper link_id in
 link_sta_rc_update callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-mt7996-fix-link_sta_rc_update-callback-v1-1-e24caf196222@kernel.org>
X-B4-Tracking: v=1; b=H4sIAEzJtGgC/x2NQQ7CIBAAv9Ls2U2gxFr8ijFkgVU3RWwAjUnTv
 0s8zmFmNqhchCuchw0Kf6TKK3fQhwHCg/KdUWJnGNV4VLPR+Gwnaye8yReT5MXVRq4E914jNcZ
 AKXkKC8aZlDFWs/cT9NhauCv/0eW67z+bvBSJeAAAAA==
X-Change-ID: 20250831-mt7996-fix-link_sta_rc_update-callback-d8a03391ebb6
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bo Jiao <Bo.Jiao@mediatek.com>, Peter Chiu <chui-hao.chiu@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
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

Do not always use deflink_id in link_sta_rc_update mac80211
callback but use the proper link_id provided by mac80211.

Fixes: 0762bdd30279f ("wifi: mt76: mt7996: rework mt7996_mac_sta_rc_work to support MLO")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 43 +++++++++++++++---------
 1 file changed, 28 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 7f3a117c52bd3438b6bb41a068bbf11658dfba42..21d290cad4f49b06c8dc8d3fc103da7ccaca99b6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -1662,19 +1662,13 @@ static void mt7996_sta_statistics(struct ieee80211_hw *hw,
 	}
 }
 
-static void mt7996_link_rate_ctrl_update(void *data, struct ieee80211_sta *sta)
+static void mt7996_link_rate_ctrl_update(void *data,
+					 struct mt7996_sta_link *msta_link)
 {
-	struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
+	struct mt7996_sta *msta = msta_link->sta;
 	struct mt7996_dev *dev = msta->vif->deflink.phy->dev;
-	struct mt7996_sta_link *msta_link;
 	u32 *changed = data;
 
-	rcu_read_lock();
-
-	msta_link = rcu_dereference(msta->link[msta->deflink_id]);
-	if (!msta_link)
-		goto out;
-
 	spin_lock_bh(&dev->mt76.sta_poll_lock);
 
 	msta_link->changed |= *changed;
@@ -1682,8 +1676,6 @@ static void mt7996_link_rate_ctrl_update(void *data, struct ieee80211_sta *sta)
 		list_add_tail(&msta_link->rc_list, &dev->sta_rc_list);
 
 	spin_unlock_bh(&dev->mt76.sta_poll_lock);
-out:
-	rcu_read_unlock();
 }
 
 static void mt7996_link_sta_rc_update(struct ieee80211_hw *hw,
@@ -1691,11 +1683,32 @@ static void mt7996_link_sta_rc_update(struct ieee80211_hw *hw,
 				      struct ieee80211_link_sta *link_sta,
 				      u32 changed)
 {
-	struct mt7996_dev *dev = mt7996_hw_dev(hw);
 	struct ieee80211_sta *sta = link_sta->sta;
+	struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
+	struct mt7996_sta_link *msta_link;
 
-	mt7996_link_rate_ctrl_update(&changed, sta);
-	ieee80211_queue_work(hw, &dev->rc_work);
+	rcu_read_lock();
+
+	msta_link = rcu_dereference(msta->link[link_sta->link_id]);
+	if (msta_link) {
+		struct mt7996_dev *dev = mt7996_hw_dev(hw);
+
+		mt7996_link_rate_ctrl_update(&changed, msta_link);
+		ieee80211_queue_work(hw, &dev->rc_work);
+	}
+
+	rcu_read_unlock();
+}
+
+static void mt7996_sta_rate_ctrl_update(void *data, struct ieee80211_sta *sta)
+{
+	struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
+	struct mt7996_sta_link *msta_link;
+	u32 *changed = data;
+
+	msta_link = rcu_dereference(msta->link[msta->deflink_id]);
+	if (msta_link)
+		mt7996_link_rate_ctrl_update(&changed, msta_link);
 }
 
 static int
@@ -1716,7 +1729,7 @@ mt7996_set_bitrate_mask(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	 * - multiple rates: if it's not in range format i.e 0-{7,8,9} for VHT
 	 * then multiple MCS setting (MCS 4,5,6) is not supported.
 	 */
-	ieee80211_iterate_stations_atomic(hw, mt7996_link_rate_ctrl_update,
+	ieee80211_iterate_stations_atomic(hw, mt7996_sta_rate_ctrl_update,
 					  &changed);
 	ieee80211_queue_work(hw, &dev->rc_work);
 

---
base-commit: 035ba65d13516fa2afa78203ba3ef54fd70584af
change-id: 20250831-mt7996-fix-link_sta_rc_update-callback-d8a03391ebb6

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


