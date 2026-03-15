Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C01D58B1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Mar 2026 10:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VasJbWCxpoxnwKShqa23ohILZc6vS8V4+Rl58UCtG08=; b=ctyBa0WUFXbs8hWHLt7T6iKSN8
	dBqT3ZubtotWF0GD6/j5m8gsWqyuLdjiP3OVse1JFPvU4IOEArxD9YnyxHOUIB9Dqb4aVmIDPO9zm
	sI+o3q8dfU2CgXyQJKuDeynji5SSI6VafTJPsmoH1dJLCw303zfBBM2npeP1FWThLtWge8tb5gSSd
	5mS+0GKoexS+46tWRKMaSarXffiCrK7LhWoMcsQq3YJ8NaqRIvH0ElfkVxnu7BzTvqlxSF0LXFVNg
	UTZnnIY5uI4g/ZkgfatkWP1gxXzjHVCBIHfm9kzVHxisydp26evXPioOdkBdVIWiqMcpPt5dDWfZF
	isHCRqsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1igy-00000002XWF-0clJ;
	Sun, 15 Mar 2026 10:27:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1igs-00000002XSz-2ow3;
	Sun, 15 Mar 2026 10:27:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1D8F8600AD;
	Sun, 15 Mar 2026 10:27:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73E42C2BC9E;
	Sun, 15 Mar 2026 10:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773570441;
	bh=RpoF+B4D/eUYxEn76AnVBIL0u0AIFSztUUSg3zdlIFQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PghcMoSekIlNfqQOdvR3I44/qOAtlLmPazjq748mGrOfI+lpl0lZIE4k5EHAB8vju
	 M80InoE/DDEDji2pURzrjMgaoC9QQPMRFP10noBjX6s9F3GHTVbD1AYKkYOfitWfH4
	 2JbpdXUgHrf/Wx4J+en6V3FAeJMRe5c3/r1pfMwYI3iGiZ/sxsBd0SKE4Wxg2LX7gv
	 ibwnPvHnoeY4W/kGwo7BUXx0cmjeYNEfAbEkP0452gSsrhgWLB7gjCNNEEHj/tQ3ZP
	 pKOuwYy9UlxESG2rv4XjEG7ls7kBWfveiXnnZNE+HHYPMA5/s5V8NsThxl6rHmVxiw
	 GlPCn0xUO/ufw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 15 Mar 2026 11:26:27 +0100
Subject: [PATCH mt76 4/6] wifi: mt76: mt7996: Destroy vif active links in
 mt7996_remove_interface()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260315-mt7996-mlo-link-reconf-v1-4-a8a634fbc927@kernel.org>
References: <20260315-mt7996-mlo-link-reconf-v1-0-a8a634fbc927@kernel.org>
In-Reply-To: <20260315-mt7996-mlo-link-reconf-v1-0-a8a634fbc927@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
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

MT7996 hw requires to remove active links from the mcu BSSINFO table
destroying the interface. For this reason introduce mt7996_vif_link_destroy
routine and remove active (non-offchannel) vif links running
mt7996_remove_interface routine.
This is a preliminary patch in order to support MLO link reconfiguration
in MT7996 driver.

Co-developed-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 108 +++++++++++++++--------
 1 file changed, 72 insertions(+), 36 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index feee93340a6c691d38858230a5f05627aac1c07f..d8ef41c39a7f3d8801e05bfa6e2d22ed9d0371b7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -306,6 +306,10 @@ int mt7996_vif_link_add(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 	};
 	int mld_idx, idx, ret;
 
+	if ((mvif->mt76.valid_links & BIT(link_conf->link_id)) &&
+	    !mlink->offchannel)
+		return 0;
+
 	mlink->idx = __ffs64(~dev->mt76.vif_mask);
 	if (mlink->idx >= mt7996_max_interface_num(dev))
 		return -ENOSPC;
@@ -393,65 +397,40 @@ int mt7996_vif_link_add(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 	return 0;
 }
 
-void mt7996_vif_link_remove(struct mt76_phy *mphy, struct ieee80211_vif *vif,
-			    struct ieee80211_bss_conf *link_conf,
-			    struct mt76_vif_link *mlink)
+static void mt7996_vif_link_destroy(struct mt7996_phy *phy,
+				    struct mt7996_vif_link *link,
+				    struct ieee80211_vif *vif,
+				    struct ieee80211_bss_conf *link_conf)
 {
-	struct mt7996_vif_link *link = container_of(mlink, struct mt7996_vif_link, mt76);
 	struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
 	struct mt7996_sta_link *msta_link = &link->msta_link;
 	unsigned int link_id = msta_link->wcid.link_id;
-	struct mt7996_phy *phy = mphy->priv;
-	struct mt7996_dev *dev = phy->dev;
+	struct mt76_vif_link *mlink = &link->mt76;
 	struct mt7996_key_iter_data it = {
 		.cmd = SET_KEY,
 		.link_id = link_id,
 	};
+	struct mt7996_dev *dev = phy->dev;
 	int idx = msta_link->wcid.idx;
 
-	if (!mlink->wcid->offchannel)
-		ieee80211_iter_keys(mphy->hw, vif, mt7996_key_iter, &it);
-
 	if (!link_conf)
 		link_conf = &vif->bss_conf;
 
+	if (!mlink->wcid->offchannel)
+		ieee80211_iter_keys(phy->mt76->hw, vif, mt7996_key_iter, &it);
+
 	mt7996_mcu_add_sta(dev, link_conf, NULL, link, NULL,
 			   CONN_STATE_DISCONNECT, false);
 	mt7996_mcu_add_bss_info(phy, vif, link_conf, mlink, msta_link, false);
-
 	mt7996_mcu_add_dev_info(phy, vif, link_conf, mlink, false);
 
 	rcu_assign_pointer(dev->mt76.wcid[idx], NULL);
 
-	if (!mlink->wcid->offchannel) {
-		if (vif->txq && mvif->mt76.deflink_id == link_id) {
-			struct ieee80211_bss_conf *iter;
-			struct mt76_txq *mtxq;
-
-			mvif->mt76.deflink_id = IEEE80211_LINK_UNSPECIFIED;
-			mtxq = (struct mt76_txq *)vif->txq->drv_priv;
-			/* Primary link will be removed, look for a new one */
-			for_each_vif_active_link(vif, iter, link_id) {
-				struct mt7996_vif_link *link;
-
-				if (link_id == msta_link->wcid.link_id)
-					continue;
-
-				link = mt7996_vif_link(dev, vif, link_id);
-				if (!link)
-					continue;
-
-				mtxq->wcid = link->msta_link.wcid.idx;
-				mvif->mt76.deflink_id = link_id;
-				break;
-			}
-		}
-		mvif->mt76.valid_links &= ~BIT(link_id);
-	}
-
 	dev->mt76.vif_mask &= ~BIT_ULL(mlink->idx);
 	dev->mld_idx_mask &= ~BIT_ULL(link->mld_idx);
 	phy->omac_mask &= ~BIT_ULL(mlink->omac_idx);
+	if (!mlink->wcid->offchannel)
+		mvif->mt76.valid_links &= ~BIT(link_id);
 
 	spin_lock_bh(&dev->mt76.sta_poll_lock);
 	if (!list_empty(&msta_link->wcid.poll_list))
@@ -467,6 +446,44 @@ void mt7996_vif_link_remove(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 	}
 }
 
+void mt7996_vif_link_remove(struct mt76_phy *mphy, struct ieee80211_vif *vif,
+			    struct ieee80211_bss_conf *link_conf,
+			    struct mt76_vif_link *mlink)
+{
+	struct mt7996_vif_link *link = container_of(mlink, struct mt7996_vif_link, mt76);
+	struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
+	struct mt7996_sta_link *msta_link = &link->msta_link;
+	struct mt7996_phy *phy = mphy->priv;
+
+	/* Hw requires to destroy active links tearing down the interface, so
+	 * postpone it removing the interface.
+	 */
+	if (mlink->wcid->offchannel) {
+		mt7996_vif_link_destroy(phy, link, vif, link_conf);
+	} else if (vif->txq &&
+		   mvif->mt76.deflink_id == msta_link->wcid.link_id) {
+		struct ieee80211_bss_conf *iter;
+		struct mt76_txq *mtxq;
+		unsigned int link_id;
+
+		mvif->mt76.deflink_id = IEEE80211_LINK_UNSPECIFIED;
+		mtxq = (struct mt76_txq *)vif->txq->drv_priv;
+		/* Primary link will be removed, look for a new one */
+		for_each_vif_active_link(vif, iter, link_id) {
+			if (link_id == msta_link->wcid.link_id)
+				continue;
+
+			link = mt7996_vif_link(phy->dev, vif, link_id);
+			if (!link)
+				continue;
+
+			mtxq->wcid = link->msta_link.wcid.idx;
+			mvif->mt76.deflink_id = link_id;
+			break;
+		}
+	}
+}
+
 static void mt7996_phy_set_rxfilter(struct mt7996_phy *phy)
 {
 	struct mt7996_dev *dev = phy->dev;
@@ -570,10 +587,29 @@ static void mt7996_remove_iter(void *data, u8 *mac, struct ieee80211_vif *vif)
 static void mt7996_remove_interface(struct ieee80211_hw *hw,
 				    struct ieee80211_vif *vif)
 {
+	struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
+	unsigned long rem_links = mvif->mt76.valid_links;
 	struct mt7996_dev *dev = mt7996_hw_dev(hw);
 	struct mt7996_radio_data rdata = {};
+	unsigned int link_id;
 	int i;
 
+	/* Remove all active links */
+	for_each_set_bit(link_id, &rem_links, IEEE80211_MLD_MAX_NUM_LINKS) {
+		struct mt7996_vif_link *link;
+		struct mt7996_phy *phy;
+
+		link = mt7996_vif_link(dev, vif, link_id);
+		if (!link)
+			continue;
+
+		phy = __mt7996_phy(dev, link->msta_link.wcid.phy_idx);
+		if (!phy)
+			continue;
+
+		mt7996_vif_link_destroy(phy, link, vif, NULL);
+	}
+
 	ieee80211_iterate_active_interfaces_mtx(hw, 0, mt7996_remove_iter,
 						&rdata);
 	mt76_vif_cleanup(&dev->mt76, vif);

-- 
2.53.0


