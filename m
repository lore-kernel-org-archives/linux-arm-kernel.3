Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0247C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 11:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ASbg6N3YF1d+CKIIx0jhWWOC0eYlnnNN/XAgnaYLrDM=; b=EKe6WSwoHgUEuhq4KMtQCW6BJ+
	hoZBzGWie+Rsain7OjNC7/El9VSLf7T5kbTQXCxTrgU0Kj/XaZXQ/nZfqeShIoDAttN/9SL1xLtfj
	0Xg20vKsCacuuv5mfu55KRAnxPDr9FYiWo62JUwT63BksnZdMuj/pISHbVd3l0iyNdsDf0G7kCBK8
	kVJPDr7gObpHcsWSxN6EJu32NQFI52N+FCLwQlQlmY6PD/FiTLpWXcOnVtFEv6xw8oihZEnnjItZH
	w0r5PkUya7+5vIMQ71aHXk2eWdQxrX1slxkNOedhEkLNYtemFVnAaVM5NkdzHm8NFawMEp6izzZu+
	8fNw3DaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKXY-00000008J5Z-2afq;
	Wed, 12 Mar 2025 11:46:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsK30-00000008E3l-3JyD;
	Wed, 12 Mar 2025 11:14:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6A9455C4D3B;
	Wed, 12 Mar 2025 11:12:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D7A5C4CEE3;
	Wed, 12 Mar 2025 11:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741778089;
	bh=39zJVl4unEfcbQLkDsBgo6CNVTE0OqnLRumgLqEDfuU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KCK43Gr8+skZLQcdMTG+/pr4fI5GMn6vsr62lz7kVVqL4gayd8W3K39+JSwzMXidW
	 uFrw+CQfPFZST1INNrrJDJqAlO2qeIZ/NJ4CFM09OyFB8n1eyxmDzcthOldRxwjS8l
	 cDUN00C90EhV7iV69BbB5YIhsgM8W8owdcyAIzPhr2LfGV1rbHkZM5WeQ+uGzpPeU+
	 47aiiR0pBXhindFknEcdl50hfkIOC6bYsd2xIBv8deJTBftTANuWtwndvfAtIQ3RRI
	 LgWA37aQ0VN7GDi/SweigLlYPq4DKDb01dTet9ndsdXcJl4e6S/yzu5/nVQxYJ6a4q
	 9ewg1xyrEr8TQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 12 Mar 2025 12:14:03 +0100
Subject: [PATCH 19/21] wifi: mt76: mt7996: rework set/get_tsf callabcks to
 support MLO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-b4-mt7996-mlo-p2-v1-19-015b3d6fd928@kernel.org>
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
X-CRM114-CacheID: sfid-20250312_041450_955125_E66C5F88 
X-CRM114-Status: GOOD (  13.10  )
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

This is a preliminary patch in order to enable MLO for MT7996 driver.

Co-developed-by: Bo Jiao <Bo.Jiao@mediatek.com>
Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
Co-developed-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c    |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7996/main.c   | 48 ++++++++++++++--------
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h |  2 +-
 3 files changed, 33 insertions(+), 19 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 6870ee189dca61a989d4b7cfde741588c8f18482..a52b4e71b267e9a72b69cb2ffbc95befb1cca655 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -2732,7 +2732,7 @@ void mt7996_mac_add_twt_setup(struct ieee80211_hw *hw,
 
 		flow->sched = true;
 		flow->start_tsf = mt7996_mac_twt_sched_list_add(dev, flow);
-		curr_tsf = __mt7996_get_tsf(hw, msta->vif);
+		curr_tsf = __mt7996_get_tsf(hw, &msta->vif->deflink);
 		div_u64_rem(curr_tsf - flow->start_tsf, interval, &rem);
 		flow_tsf = curr_tsf + interval - rem;
 		twt_agrt->twt = cpu_to_le64(flow_tsf);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 40efba5bcaac364f8aa1ebf528e283494178616b..8bcb4b8e3ef58c23294c16c10d38384bfba87e30 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -1336,10 +1336,10 @@ mt7996_get_stats(struct ieee80211_hw *hw,
 	return 0;
 }
 
-u64 __mt7996_get_tsf(struct ieee80211_hw *hw, struct mt7996_vif *mvif)
+u64 __mt7996_get_tsf(struct ieee80211_hw *hw, struct mt7996_vif_link *link)
 {
 	struct mt7996_dev *dev = mt7996_hw_dev(hw);
-	struct mt7996_phy *phy = mt7996_vif_link_phy(&mvif->deflink);
+	struct mt7996_phy *phy = link->phy;
 	union {
 		u64 t64;
 		u32 t32[2];
@@ -1351,8 +1351,8 @@ u64 __mt7996_get_tsf(struct ieee80211_hw *hw, struct mt7996_vif *mvif)
 
 	lockdep_assert_held(&dev->mt76.mutex);
 
-	n = mvif->deflink.mt76.omac_idx > HW_BSSID_MAX ? HW_BSSID_0
-					       : mvif->deflink.mt76.omac_idx;
+	n = link->mt76.omac_idx > HW_BSSID_MAX ? HW_BSSID_0
+					       : link->mt76.omac_idx;
 	/* TSF software read */
 	mt76_rmw(dev, MT_LPON_TCR(phy->mt76->band_idx, n), MT_LPON_TCR_SW_MODE,
 		 MT_LPON_TCR_SW_READ);
@@ -1370,7 +1370,7 @@ mt7996_get_tsf(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 	u64 ret;
 
 	mutex_lock(&dev->mt76.mutex);
-	ret = __mt7996_get_tsf(hw, mvif);
+	ret = __mt7996_get_tsf(hw, &mvif->deflink);
 	mutex_unlock(&dev->mt76.mutex);
 
 	return ret;
@@ -1382,26 +1382,33 @@ mt7996_set_tsf(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 {
 	struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
 	struct mt7996_dev *dev = mt7996_hw_dev(hw);
-	struct mt7996_phy *phy = mt7996_vif_link_phy(&mvif->deflink);
+	struct mt7996_vif_link *link;
+	struct mt7996_phy *phy;
 	union {
 		u64 t64;
 		u32 t32[2];
 	} tsf = { .t64 = timestamp, };
 	u16 n;
 
-	if (!phy)
-		return;
-
 	mutex_lock(&dev->mt76.mutex);
 
-	n = mvif->deflink.mt76.omac_idx > HW_BSSID_MAX ? HW_BSSID_0
-					       : mvif->deflink.mt76.omac_idx;
+	link = mt7996_vif_link(dev, vif, mvif->mt76.deflink_id);
+	if (!link)
+		goto unlock;
+
+	n = link->mt76.omac_idx > HW_BSSID_MAX ? HW_BSSID_0
+					       : link->mt76.omac_idx;
+	phy = link->phy;
+	if (!phy)
+		goto unlock;
+
 	mt76_wr(dev, MT_LPON_UTTR0(phy->mt76->band_idx), tsf.t32[0]);
 	mt76_wr(dev, MT_LPON_UTTR1(phy->mt76->band_idx), tsf.t32[1]);
 	/* TSF software overwrite */
 	mt76_rmw(dev, MT_LPON_TCR(phy->mt76->band_idx, n), MT_LPON_TCR_SW_MODE,
 		 MT_LPON_TCR_SW_WRITE);
 
+unlock:
 	mutex_unlock(&dev->mt76.mutex);
 }
 
@@ -1411,26 +1418,33 @@ mt7996_offset_tsf(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 {
 	struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
 	struct mt7996_dev *dev = mt7996_hw_dev(hw);
-	struct mt7996_phy *phy = mt7996_vif_link_phy(&mvif->deflink);
+	struct mt7996_vif_link *link;
+	struct mt7996_phy *phy;
 	union {
 		u64 t64;
 		u32 t32[2];
 	} tsf = { .t64 = timestamp, };
 	u16 n;
 
-	if (!phy)
-		return;
-
 	mutex_lock(&dev->mt76.mutex);
 
-	n = mvif->deflink.mt76.omac_idx > HW_BSSID_MAX ? HW_BSSID_0
-					       : mvif->deflink.mt76.omac_idx;
+	link = mt7996_vif_link(dev, vif, mvif->mt76.deflink_id);
+	if (!link)
+		goto unlock;
+
+	phy = link->phy;
+	if (!phy)
+		goto unlock;
+
+	n = link->mt76.omac_idx > HW_BSSID_MAX ? HW_BSSID_0
+					       : link->mt76.omac_idx;
 	mt76_wr(dev, MT_LPON_UTTR0(phy->mt76->band_idx), tsf.t32[0]);
 	mt76_wr(dev, MT_LPON_UTTR1(phy->mt76->band_idx), tsf.t32[1]);
 	/* TSF software adjust*/
 	mt76_rmw(dev, MT_LPON_TCR(phy->mt76->band_idx, n), MT_LPON_TCR_SW_MODE,
 		 MT_LPON_TCR_SW_ADJUST);
 
+unlock:
 	mutex_unlock(&dev->mt76.mutex);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index 124a48e2706e412afc91af5e1c057fca40fe5e3c..815a3c68b8723469e32e74b85979eaf75c1b176a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -535,7 +535,7 @@ struct mt7996_dev *mt7996_mmio_probe(struct device *pdev,
 				     void __iomem *mem_base, u32 device_id);
 void mt7996_wfsys_reset(struct mt7996_dev *dev);
 irqreturn_t mt7996_irq_handler(int irq, void *dev_instance);
-u64 __mt7996_get_tsf(struct ieee80211_hw *hw, struct mt7996_vif *mvif);
+u64 __mt7996_get_tsf(struct ieee80211_hw *hw, struct mt7996_vif_link *link);
 int mt7996_register_device(struct mt7996_dev *dev);
 void mt7996_unregister_device(struct mt7996_dev *dev);
 int mt7996_vif_link_add(struct mt76_phy *mphy, struct ieee80211_vif *vif,

-- 
2.48.1


