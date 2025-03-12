Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E1E6C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 11:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SozmTqb+3PEG14+0CVcqjLx6ucMAJPZaCz0TZBGT9yw=; b=l4VzJoNnNYE+LcNe3ixcFLWAZj
	gcUZLMGEXcC08ZUHfy3LNcZ2N6Z1c9aXLiEhSNbLFtSRPlea+wEIpRMQOtN11lbf1yviLqnB4RRnt
	C01jZl5Uzg2PFin2rCWyL8PIh5Fo/HRrvWWuiY6N0ujr4ujoddyXjw/X1WpyYmpJ1d9a4YQ1zjmyw
	md2vS6Ytc0JKdAdE7Vd2C+NcBoiIjSceynNiLqIF9/XzdjkMlgEDm3Vsi0Y2oDTeFV4uMGYKaVYZ4
	BWRDK9YxiYeX6QWr7BUVF1MgHyJh2mYLXU+2zMnvNNQdu4inOmbWPITGGQLlgOrgtUqtMB5KQYuxS
	N7QlwGZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKPj-00000008I0C-0bH3;
	Wed, 12 Mar 2025 11:38:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsK2Y-00000008Dxa-1fDX;
	Wed, 12 Mar 2025 11:14:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1DE6F5C4C4C;
	Wed, 12 Mar 2025 11:12:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42188C4CEE3;
	Wed, 12 Mar 2025 11:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741778061;
	bh=9KFKNi5KDKq9H88236ZA4xlL5POAQG5ULjKFyqq+tJ0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nBWz1UkAknO9qe5FEqfRn0WPANGZvJDBAfA3QMG8HWzatu/vfG0NPyfvsmEmmc2g4
	 0vtKdP9GkatEOTm2P5himEX++8uS1S7D+DMuairD+Eo2w1AF2Rj1KTPM2q6Vqvzyjn
	 TLbwUCc2f2m0IpC0dr42U5sBK2GFyikwpWh2XOp96Yh53gCyu6PPDolrHqWmGEAnOg
	 BKPEAAvQPpacyJYfezRYhaIbasOMvcIfJzw39OP/2jWjyEuYbmvDq/IPMmuhkzj9xR
	 NcrKTNzZYJ2Qi3e0cJG42lB6Qau6iL8A0BFulTENCPoIYM8yLdCVGOpfLN0SQcRuDg
	 1KzTYDqre51Rw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 12 Mar 2025 12:13:52 +0100
Subject: [PATCH 08/21] wifi: mt76: mt7996: Add mt7996_sta_link to
 mt7996_mcu_add_bss_info signature
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-b4-mt7996-mlo-p2-v1-8-015b3d6fd928@kernel.org>
References: <20250312-b4-mt7996-mlo-p2-v1-0-015b3d6fd928@kernel.org>
In-Reply-To: <20250312-b4-mt7996-mlo-p2-v1-0-015b3d6fd928@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_041422_536714_E9476DF0 
X-CRM114-Status: GOOD (  12.34  )
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

This is a preliminary patch to introduce MLO support for MT996 driver.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c   | 13 ++++++++-----
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c    |  5 +++--
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h |  3 ++-
 3 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index f7703e00712cd1a59484ceddfad5bd00b8814250..4abbe761b732f1ea7791ba1f86c2c87db1eea91d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -195,7 +195,8 @@ mt7996_set_hw_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 
 	if (cmd == SET_KEY && !sta && !mlink->mt76.cipher) {
 		mlink->mt76.cipher = mt76_connac_mcu_get_cipher(key->cipher);
-		mt7996_mcu_add_bss_info(phy, vif, &vif->bss_conf, &mlink->mt76, true);
+		mt7996_mcu_add_bss_info(phy, vif, &vif->bss_conf, &mlink->mt76,
+					&mlink->msta_link, true);
 	}
 
 	if (cmd == SET_KEY) {
@@ -288,7 +289,7 @@ int mt7996_vif_link_add(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 
 	mt7996_init_bitrate_mask(vif, link);
 
-	mt7996_mcu_add_bss_info(phy, vif, link_conf, mlink, true);
+	mt7996_mcu_add_bss_info(phy, vif, link_conf, mlink, msta_link, true);
 	/* defer the first STA_REC of BMC entry to BSS_CHANGED_BSSID for STA
 	 * interface, since firmware only records BSSID when the entry is new
 	 */
@@ -314,7 +315,7 @@ void mt7996_vif_link_remove(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 
 	mt7996_mcu_add_sta(dev, link_conf, NULL, link, NULL,
 			   CONN_STATE_DISCONNECT, false);
-	mt7996_mcu_add_bss_info(phy, vif, link_conf, mlink, false);
+	mt7996_mcu_add_bss_info(phy, vif, link_conf, mlink, msta_link, false);
 
 	mt7996_mcu_add_dev_info(phy, vif, link_conf, mlink, false);
 
@@ -704,7 +705,8 @@ mt7996_vif_cfg_changed(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 				continue;
 
 			mt7996_mcu_add_bss_info(link->phy, vif, link_conf,
-						&link->mt76, true);
+						&link->mt76, &link->msta_link,
+						true);
 			mt7996_mcu_add_sta(dev, link_conf, NULL, link, NULL,
 					   CONN_STATE_PORT_SECURE,
 					   !!(changed & BSS_CHANGED_BSSID));
@@ -740,7 +742,8 @@ mt7996_link_info_changed(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	 */
 	if ((changed & BSS_CHANGED_BSSID && !is_zero_ether_addr(info->bssid)) ||
 	    (changed & BSS_CHANGED_BEACON_ENABLED && info->enable_beacon)) {
-		mt7996_mcu_add_bss_info(phy, vif, info, &link->mt76, true);
+		mt7996_mcu_add_bss_info(phy, vif, info, &link->mt76,
+					&link->msta_link, true);
 		mt7996_mcu_add_sta(dev, info, NULL, link, NULL,
 				   CONN_STATE_PORT_SECURE,
 				   !!(changed & BSS_CHANGED_BSSID));
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 7c097aaead328bd234d87e535497c2f788ffa4c3..d1a0dd4698fbe5cf248796ed6f13b99f3c191af1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -1064,7 +1064,8 @@ __mt7996_mcu_alloc_bss_req(struct mt76_dev *dev, struct mt76_vif_link *mvif, int
 
 int mt7996_mcu_add_bss_info(struct mt7996_phy *phy, struct ieee80211_vif *vif,
 			    struct ieee80211_bss_conf *link_conf,
-			    struct mt76_vif_link *mlink, int enable)
+			    struct mt76_vif_link *mlink,
+			    struct mt7996_sta_link *msta_link, int enable)
 {
 	struct mt7996_dev *dev = phy->dev;
 	struct sk_buff *skb;
@@ -1081,7 +1082,7 @@ int mt7996_mcu_add_bss_info(struct mt7996_phy *phy, struct ieee80211_vif *vif,
 
 	/* bss_basic must be first */
 	mt7996_mcu_bss_basic_tlv(skb, vif, link_conf, mlink, phy->mt76,
-				 mlink->wcid->idx, enable);
+				 msta_link->wcid.idx, enable);
 	mt7996_mcu_bss_sec_tlv(skb, mlink);
 
 	if (vif->type == NL80211_IFTYPE_MONITOR)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index f226090bcd02ea478113e4bccea0492cfa34477d..4d5ab3f4b78ee6fc584370372fe34b44292e4594 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -571,7 +571,8 @@ int mt7996_mcu_add_dev_info(struct mt7996_phy *phy, struct ieee80211_vif *vif,
 			    struct mt76_vif_link *mlink, bool enable);
 int mt7996_mcu_add_bss_info(struct mt7996_phy *phy, struct ieee80211_vif *vif,
 			    struct ieee80211_bss_conf *link_conf,
-			    struct mt76_vif_link *mlink, int enable);
+			    struct mt76_vif_link *mlink,
+			    struct mt7996_sta_link *msta_link, int enable);
 int mt7996_mcu_add_sta(struct mt7996_dev *dev,
 		       struct ieee80211_bss_conf *link_conf,
 		       struct ieee80211_link_sta *link_sta,

-- 
2.48.1


