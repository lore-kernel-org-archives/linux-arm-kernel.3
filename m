Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32BF6C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 11:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C5APgKbRFQnXZM9gxZLWgCCBIp1xML9rVLvexyxRRRw=; b=cr0TyHXKuL8dzaq5zYe0S/uD8D
	kmgV2jHE/56jAbFHjNtD2w2UNskTuwJEFzbZlABOa1SaGZKWAOhWpRHppSCG/gqeD7UsjXq0AsHAz
	G8x4uFlkByZAQSpta6lTBaIlkUA88u+AGaIG8QBWuJ6nZhz3Mbn7gjBJ7MpmJd9sIitczXCjs13q6
	YQFAT6rS4PJDHry/JtanysQfLN0ZnMn9syHSL134OPR/sesEPPSG9rCsB+EDmbYu21rcXdr1rC2tO
	9PpJnOOK0Db5gIWllqm+I04Z/3LCrO850NrG0pjav/5HDmeilhjFMP0bqvGu/qSroGW8tw+KcsU0E
	MZoFEEXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKO6-00000008HhN-0bh8;
	Wed, 12 Mar 2025 11:36:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsK2V-00000008DxB-3WyB;
	Wed, 12 Mar 2025 11:14:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 714405C4427;
	Wed, 12 Mar 2025 11:12:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95437C4CEE3;
	Wed, 12 Mar 2025 11:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741778058;
	bh=Q/1lqny96ZWi4j5/QaIgLJgjqjSOFtGumXMHNNWeir0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZPtDONtB0vhOHsB04hl1M5aDDoAuT2/0whZnk/X8Ot42nwLyXoP+wigFwXZ1rRuws
	 jSZp+2yoR+GXGA5xlabT07ii0xdCmhaTLPNSNGXOzyIA9Y5shaQT/S2mV7/5MSMdbo
	 Tog7eBhmb/nlQBy7DyLSFSkJ3zgUhHeiMGR+BmSPBFrzGCzK08lp9HGpfsCB73Sy1l
	 MkYGo6Ch14oYDPqkOMTQNaLNN12vQJ65sQGuQ6QIfx2P9P4hSk6H3zFeQOSrQff3qd
	 bGoUe4VdDVqxlM4TMP27diakKkk9U3dFbHCbHuKl5l8sMFRAQCJ+12QXLY7L+2vqGW
	 WOERFkGoaXIYg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 12 Mar 2025 12:13:51 +0100
Subject: [PATCH 07/21] wifi: mt76: mt7996: rework mt7996_sta_set_4addr and
 mt7996_sta_set_decap_offload to support MLO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-b4-mt7996-mlo-p2-v1-7-015b3d6fd928@kernel.org>
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
X-CRM114-CacheID: sfid-20250312_041420_001358_7500C651 
X-CRM114-Status: GOOD (  13.05  )
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

Rework mt7996_sta_set_4addr and mt7996_sta_set_decap_offload routines in
order to properly support multi-link. This is a preliminary patch to enable
MLO for MT7996 driver.

Co-developed-by: Bo Jiao <Bo.Jiao@mediatek.com>
Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
Co-developed-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c   | 74 ++++++++++++++++------
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c    | 11 +---
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h |  3 +-
 3 files changed, 61 insertions(+), 27 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 642d633b5126ce81f3d32a9bd912603e2c328c8a..f7703e00712cd1a59484ceddfad5bd00b8814250 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -1540,19 +1540,37 @@ static void mt7996_sta_set_4addr(struct ieee80211_hw *hw,
 				 struct ieee80211_sta *sta,
 				 bool enabled)
 {
-	struct mt7996_dev *dev = mt7996_hw_dev(hw);
 	struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
-	struct mt7996_sta_link *msta_link = &msta->deflink;
+	struct mt7996_dev *dev = mt7996_hw_dev(hw);
+	struct ieee80211_link_sta *link_sta;
+	unsigned int link_id;
 
-	if (enabled)
-		set_bit(MT_WCID_FLAG_4ADDR, &msta_link->wcid.flags);
-	else
-		clear_bit(MT_WCID_FLAG_4ADDR, &msta_link->wcid.flags);
+	mutex_lock(&dev->mt76.mutex);
 
-	if (!msta_link->wcid.sta)
-		return;
+	for_each_sta_active_link(vif, sta, link_sta, link_id) {
+		struct mt7996_sta_link *msta_link;
+		struct mt7996_vif_link *link;
 
-	mt7996_mcu_wtbl_update_hdr_trans(dev, vif, sta);
+		link = mt7996_vif_link(dev, vif, link_id);
+		if (!link)
+			continue;
+
+		msta_link = mt76_dereference(msta->link[link_id], &dev->mt76);
+		if (!msta_link)
+			continue;
+
+		if (enabled)
+			set_bit(MT_WCID_FLAG_4ADDR, &msta_link->wcid.flags);
+		else
+			clear_bit(MT_WCID_FLAG_4ADDR, &msta_link->wcid.flags);
+
+		if (!msta_link->wcid.sta)
+			continue;
+
+		mt7996_mcu_wtbl_update_hdr_trans(dev, vif, link, msta_link);
+	}
+
+	mutex_unlock(&dev->mt76.mutex);
 }
 
 static void mt7996_sta_set_decap_offload(struct ieee80211_hw *hw,
@@ -1560,19 +1578,39 @@ static void mt7996_sta_set_decap_offload(struct ieee80211_hw *hw,
 					 struct ieee80211_sta *sta,
 					 bool enabled)
 {
-	struct mt7996_dev *dev = mt7996_hw_dev(hw);
 	struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
-	struct mt7996_sta_link *msta_link = &msta->deflink;
+	struct mt7996_dev *dev = mt7996_hw_dev(hw);
+	struct ieee80211_link_sta *link_sta;
+	unsigned int link_id;
 
-	if (enabled)
-		set_bit(MT_WCID_FLAG_HDR_TRANS, &msta_link->wcid.flags);
-	else
-		clear_bit(MT_WCID_FLAG_HDR_TRANS, &msta_link->wcid.flags);
+	mutex_lock(&dev->mt76.mutex);
 
-	if (!msta_link->wcid.sta)
-		return;
+	for_each_sta_active_link(vif, sta, link_sta, link_id) {
+		struct mt7996_sta_link *msta_link;
+		struct mt7996_vif_link *link;
 
-	mt7996_mcu_wtbl_update_hdr_trans(dev, vif, sta);
+		link = mt7996_vif_link(dev, vif, link_id);
+		if (!link)
+			continue;
+
+		msta_link = mt76_dereference(msta->link[link_id], &dev->mt76);
+		if (!msta_link)
+			continue;
+
+		if (enabled)
+			set_bit(MT_WCID_FLAG_HDR_TRANS,
+				&msta_link->wcid.flags);
+		else
+			clear_bit(MT_WCID_FLAG_HDR_TRANS,
+				  &msta_link->wcid.flags);
+
+		if (!msta_link->wcid.sta)
+			continue;
+
+		mt7996_mcu_wtbl_update_hdr_trans(dev, vif, link, msta_link);
+	}
+
+	mutex_unlock(&dev->mt76.mutex);
 }
 
 static const char mt7996_gstrings_stats[][ETH_GSTRING_LEN] = {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 46c5e639b9630199ffa601e545fa76690f0101e3..7c097aaead328bd234d87e535497c2f788ffa4c3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -4465,17 +4465,12 @@ int mt7996_mcu_rdd_cmd(struct mt7996_dev *dev, int cmd, u8 index,
 
 int mt7996_mcu_wtbl_update_hdr_trans(struct mt7996_dev *dev,
 				     struct ieee80211_vif *vif,
-				     struct ieee80211_sta *sta)
+				     struct mt7996_vif_link *link,
+				     struct mt7996_sta_link *msta_link)
 {
-	struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
-	struct mt7996_sta_link *msta_link;
-	struct mt7996_sta *msta;
 	struct sk_buff *skb;
 
-	msta = sta ? (struct mt7996_sta *)sta->drv_priv : NULL;
-	msta_link = msta ? &msta->deflink : &mvif->deflink.msta_link;
-
-	skb = __mt76_connac_mcu_alloc_sta_req(&dev->mt76, &mvif->deflink.mt76,
+	skb = __mt76_connac_mcu_alloc_sta_req(&dev->mt76, &link->mt76,
 					      &msta_link->wcid,
 					      MT7996_STA_UPDATE_MAX_SIZE);
 	if (IS_ERR(skb))
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index c2a2916e0647cfdcbee9912e3915241465e32cac..f226090bcd02ea478113e4bccea0492cfa34477d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -749,7 +749,8 @@ int mt7996_mcu_bcn_prot_enable(struct mt7996_dev *dev, struct ieee80211_vif *vif
 			       struct ieee80211_key_conf *key);
 int mt7996_mcu_wtbl_update_hdr_trans(struct mt7996_dev *dev,
 				     struct ieee80211_vif *vif,
-				     struct ieee80211_sta *sta);
+				     struct mt7996_vif_link *link,
+				     struct mt7996_sta_link *msta_link);
 int mt7996_mcu_cp_support(struct mt7996_dev *dev, u8 mode);
 #ifdef CONFIG_MAC80211_DEBUGFS
 void mt7996_sta_add_debugfs(struct ieee80211_hw *hw, struct ieee80211_vif *vif,

-- 
2.48.1


