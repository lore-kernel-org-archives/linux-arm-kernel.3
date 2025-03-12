Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1077AC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 11:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RBk9VIUpAZq501kfSxKnl97Q4qhZW5tVnj28DlfAIdM=; b=JmTvZ8ddsbWX7sFaW8Ol+83GDe
	ji8G4bxdN14Rof+yTDn+hLYMggeJHkn8tCoTmXOyQUx5vPwCcuMmURJMi4Dn00ySjPV0UtO6wmDJf
	qqBCW5cUXPj7JpflJ87yPoA/5KFiUVodLkfJgtua18+eN8KUDRHCTbhGLgzNJfBCn34MI7tY9ccoi
	5Tnj3cLWbWkt0fVULAtvm2fNs/X4ROe7OwWtluTk2A5sJxk51+qmuvjy7H2qi6xL1+fbqJG21adku
	kGz7eWBD4rm1ZDld+bKItXx6/XQMMyc9SZPKJF7MZIM3xvatpTtjbFW82JdtJXVQkhhmN9o9UTKK2
	o65QbkvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKZA-00000008JJP-40XO;
	Wed, 12 Mar 2025 11:48:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsK33-00000008E4N-1lL0;
	Wed, 12 Mar 2025 11:14:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 01CD25C56BC;
	Wed, 12 Mar 2025 11:12:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2358EC4CEEC;
	Wed, 12 Mar 2025 11:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741778092;
	bh=tk6PkdxP+zQXfHPFeg5FWZF1EZ75Tf6fIjYcvX8+F+A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=a2iLvNySFPfeoYMhbQXGsJkCyN8mRrnH00UNhHRQhL+Ct5r/iHuyjC4e3YrnTJrbm
	 CIHPasd8n0om2ENg3BW4mFnuHzLxr+9TVggxetKSlo4DVTW5KzXoB0uVmXoIcaDzd0
	 qC+45iP+QWVlg1LwIZ+DEtOs2kSbaFrXoXCavFEnqtpTyHHF8Tm7LxgXIdHGzMAt9C
	 IFRc7Al3IO6syyT2cz2MkzrkQ6FenXFEuh7ZjWwAiZKD+0LNmN6U8NXgxkeA+EE/Wq
	 h2cvrkN5ZbMa9lvcG+hAKK/nijyRZWCEChohSjmOcu8KFzSDfO8h8EjrvHWfCLdT3j
	 sLcqEFOaj5BTA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 12 Mar 2025 12:14:04 +0100
Subject: [PATCH 20/21] wifi: mt76: mt7996: rework mt7996_ampdu_action to
 support MLO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-b4-mt7996-mlo-p2-v1-20-015b3d6fd928@kernel.org>
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
X-CRM114-CacheID: sfid-20250312_041453_580474_C16216D3 
X-CRM114-Status: GOOD (  12.23  )
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

Active/de-active TX/RX BA sessssion for each active links running
mt7996_ampdu_action routine.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c   | 89 ++++++++++++++--------
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c    | 16 ++--
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h |  5 +-
 3 files changed, 64 insertions(+), 46 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 8bcb4b8e3ef58c23294c16c10d38384bfba87e30..adeb267b2801894590f90d02e902ebec602de98a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -1259,12 +1259,13 @@ mt7996_ampdu_action(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	enum ieee80211_ampdu_mlme_action action = params->action;
 	struct mt7996_dev *dev = mt7996_hw_dev(hw);
 	struct ieee80211_sta *sta = params->sta;
-	struct ieee80211_txq *txq = sta->txq[params->tid];
 	struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
-	struct mt7996_sta_link *msta_link = &msta->deflink;
+	struct ieee80211_txq *txq = sta->txq[params->tid];
+	struct ieee80211_link_sta *link_sta;
 	u16 tid = params->tid;
 	u16 ssn = params->ssn;
 	struct mt76_txq *mtxq;
+	unsigned int link_id;
 	int ret = 0;
 
 	if (!txq)
@@ -1274,38 +1275,60 @@ mt7996_ampdu_action(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 
 	mutex_lock(&dev->mt76.mutex);
 
-	switch (action) {
-	case IEEE80211_AMPDU_RX_START:
-		mt76_rx_aggr_start(&dev->mt76, &msta_link->wcid, tid, ssn,
-				   params->buf_size);
-		ret = mt7996_mcu_add_rx_ba(dev, params, true);
-		break;
-	case IEEE80211_AMPDU_RX_STOP:
-		mt76_rx_aggr_stop(&dev->mt76, &msta_link->wcid, tid);
-		ret = mt7996_mcu_add_rx_ba(dev, params, false);
-		break;
-	case IEEE80211_AMPDU_TX_OPERATIONAL:
-		mtxq->aggr = true;
-		mtxq->send_bar = false;
-		ret = mt7996_mcu_add_tx_ba(dev, params, true);
-		break;
-	case IEEE80211_AMPDU_TX_STOP_FLUSH:
-	case IEEE80211_AMPDU_TX_STOP_FLUSH_CONT:
-		mtxq->aggr = false;
-		clear_bit(tid, &msta_link->wcid.ampdu_state);
-		ret = mt7996_mcu_add_tx_ba(dev, params, false);
-		break;
-	case IEEE80211_AMPDU_TX_START:
-		set_bit(tid, &msta_link->wcid.ampdu_state);
-		ret = IEEE80211_AMPDU_TX_START_IMMEDIATE;
-		break;
-	case IEEE80211_AMPDU_TX_STOP_CONT:
-		mtxq->aggr = false;
-		clear_bit(tid, &msta_link->wcid.ampdu_state);
-		ret = mt7996_mcu_add_tx_ba(dev, params, false);
-		ieee80211_stop_tx_ba_cb_irqsafe(vif, sta->addr, tid);
-		break;
+	for_each_sta_active_link(vif, sta, link_sta, link_id) {
+		struct mt7996_sta_link *msta_link;
+		struct mt7996_vif_link *link;
+
+		msta_link = mt76_dereference(msta->link[link_id], &dev->mt76);
+		if (!msta_link)
+			continue;
+
+		link = mt7996_vif_link(dev, vif, link_id);
+		if (!link)
+			continue;
+
+		switch (action) {
+		case IEEE80211_AMPDU_RX_START:
+			mt76_rx_aggr_start(&dev->mt76, &msta_link->wcid, tid,
+					   ssn, params->buf_size);
+			ret = mt7996_mcu_add_rx_ba(dev, params, link, true);
+			break;
+		case IEEE80211_AMPDU_RX_STOP:
+			mt76_rx_aggr_stop(&dev->mt76, &msta_link->wcid, tid);
+			ret = mt7996_mcu_add_rx_ba(dev, params, link, false);
+			break;
+		case IEEE80211_AMPDU_TX_OPERATIONAL:
+			mtxq->aggr = true;
+			mtxq->send_bar = false;
+			ret = mt7996_mcu_add_tx_ba(dev, params, link,
+						   msta_link, true);
+			break;
+		case IEEE80211_AMPDU_TX_STOP_FLUSH:
+		case IEEE80211_AMPDU_TX_STOP_FLUSH_CONT:
+			mtxq->aggr = false;
+			clear_bit(tid, &msta_link->wcid.ampdu_state);
+			ret = mt7996_mcu_add_tx_ba(dev, params, link,
+						   msta_link, false);
+			break;
+		case IEEE80211_AMPDU_TX_START:
+			set_bit(tid, &msta_link->wcid.ampdu_state);
+			ret = IEEE80211_AMPDU_TX_START_IMMEDIATE;
+			break;
+		case IEEE80211_AMPDU_TX_STOP_CONT:
+			mtxq->aggr = false;
+			clear_bit(tid, &msta_link->wcid.ampdu_state);
+			ret = mt7996_mcu_add_tx_ba(dev, params, link,
+						   msta_link, false);
+			break;
+		}
+
+		if (ret)
+			break;
 	}
+
+	if (action == IEEE80211_AMPDU_TX_STOP_CONT)
+		ieee80211_stop_tx_ba_cb_irqsafe(vif, sta->addr, tid);
+
 	mutex_unlock(&dev->mt76.mutex);
 
 	return ret;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 85602a8594e0c9ab3a0055e04cf1ca836d62b6b9..89e4f0e8858322b636650a27d9ab0872987b7011 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -1160,26 +1160,20 @@ mt7996_mcu_sta_ba(struct mt7996_dev *dev, struct mt76_vif_link *mvif,
 /** starec & wtbl **/
 int mt7996_mcu_add_tx_ba(struct mt7996_dev *dev,
 			 struct ieee80211_ampdu_params *params,
-			 bool enable)
+			 struct mt7996_vif_link *link,
+			 struct mt7996_sta_link *msta_link, bool enable)
 {
-	struct mt7996_sta *msta = (struct mt7996_sta *)params->sta->drv_priv;
-	struct mt7996_sta_link *msta_link = &msta->deflink;
-	struct mt7996_vif *mvif = msta->vif;
-
 	if (enable && !params->amsdu)
 		msta_link->wcid.amsdu = false;
 
-	return mt7996_mcu_sta_ba(dev, &mvif->deflink.mt76, params, enable, true);
+	return mt7996_mcu_sta_ba(dev, &link->mt76, params, enable, true);
 }
 
 int mt7996_mcu_add_rx_ba(struct mt7996_dev *dev,
 			 struct ieee80211_ampdu_params *params,
-			 bool enable)
+			 struct mt7996_vif_link *link, bool enable)
 {
-	struct mt7996_sta *msta = (struct mt7996_sta *)params->sta->drv_priv;
-	struct mt7996_vif *mvif = msta->vif;
-
-	return mt7996_mcu_sta_ba(dev, &mvif->deflink.mt76, params, enable, false);
+	return mt7996_mcu_sta_ba(dev, &link->mt76, params, enable, false);
 }
 
 static void
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index 815a3c68b8723469e32e74b85979eaf75c1b176a..43e646ed6094cb7fb78d201fc3ee8446ad2a16a1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -584,10 +584,11 @@ int mt7996_mcu_teardown_mld_sta(struct mt7996_dev *dev,
 				struct mt7996_sta_link *msta_link);
 int mt7996_mcu_add_tx_ba(struct mt7996_dev *dev,
 			 struct ieee80211_ampdu_params *params,
-			 bool add);
+			 struct mt7996_vif_link *link,
+			 struct mt7996_sta_link *msta_link, bool enable);
 int mt7996_mcu_add_rx_ba(struct mt7996_dev *dev,
 			 struct ieee80211_ampdu_params *params,
-			 bool add);
+			 struct mt7996_vif_link *link, bool enable);
 int mt7996_mcu_update_bss_color(struct mt7996_dev *dev,
 				struct mt76_vif_link *mlink,
 				struct cfg80211_he_bss_color *he_bss_color);

-- 
2.48.1


