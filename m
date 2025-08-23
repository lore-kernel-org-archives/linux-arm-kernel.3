Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14093CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 14:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g8Iszz1yvxCGV5Dd4dbUtStcPOogiq5VwkNlSZToCdI=; b=Givm5s8DB/JTjt8kaVYs3A8ATW
	rl28apyYUxWbgbEHtDGQHf4isKUN3IelfRAgodNa/zSWQFul1EvLlF9vGfTfogiNZ1jCbx0rUWoRr
	kqQSL0KegqPLIjHZU1ykIBOY41CZwNeztAFu7JIiVWbUMB2sZt6qoDtDSAurZ37ljQZW1I7H7mSAc
	lRDvWzpHru+Q5jaWWl+Wyw+mu6tY/9Li6THiD0VBGm9m8KO78Boy0L3EjzvP2JFzUl3kZrvCLijfY
	OryxJd7+FRnWUXd1N4x4lw9Yguk8jlyjhQMzjpOpa3v1erJ4gKIETx6/M1ADwk/ZpuPQePLIzUrTw
	GU3t5aGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upphX-00000004t1v-3ELJ;
	Sat, 23 Aug 2025 14:58:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uppex-00000004sxO-15j9;
	Sat, 23 Aug 2025 14:55:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2B06160007;
	Sat, 23 Aug 2025 14:55:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EFB6C4CEE7;
	Sat, 23 Aug 2025 14:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755960957;
	bh=+9rohC3hw9FcT0vjAC99i/cdAi2nMjBPDQ6zTDoXUjs=;
	h=From:Date:Subject:To:Cc:From;
	b=V+fn9p788B9pgMpEmSGZCQi6XuiRBEdNYR4n2lcJy6TiPwzdKb/yNXv5Acjr8N/gM
	 c3FZdhi2iwIg/lkdNE1JWHeHXc+9CQJI1Wa1lc5XKPWo82DJwuBmBN93FcV++N8v0Z
	 P1/ARMsotMWx2fAPb2/VUutByqTG64Su291NX3R+z3++IiqSqGgR82TGjSk7VFOIrl
	 y0uQmWCI1BZlFq+cdA2JcPTzoyJApUJPO95gjiRJhU/9Ya7FsraDYTVUKoeFIpNLkf
	 qyc71vhrBluZkQhy9otv2L35pBgKutjBNaHvTjfD2f3n6t4j+cCKMBY2QJai9w0DU7
	 d6JsuLioYElsw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 23 Aug 2025 16:55:37 +0200
Subject: [PATCH mt76] wifi: mt76: mt7996: Use deflink for AMPDU rx
 reordering
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250823-mt7996-mlo-aggr-fix-v1-1-f35cf0ea4c8a@kernel.org>
X-B4-Tracking: v=1; b=H4sIAGjWqWgC/x2MQQqAIBAAvxJ7biENK/tKdDDbbCErNCII/550n
 IGZFyIFpgh98UKgmyMfewZRFmBXsztCnjODrKSqOlmjv1qtG/Tbgca5gAs/aK2YG6UXY6cacnk
 Gyvq/DmNKH8QSfOVlAAAA
X-Change-ID: 20250823-mt7996-mlo-aggr-fix-cc1d659facb3
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
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

Packets belonging to the same TID can be sent over multiple links.
AMPDU rx reordering must be performed over all active links. Fix the
problem always using default link for AMPDU rx reordering.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/agg-rx.c        |  2 +
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c    | 10 ++-
 drivers/net/wireless/mediatek/mt76/mt7996/main.c   | 97 ++++++++--------------
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c    | 64 +++++++++++---
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h |  6 +-
 5 files changed, 101 insertions(+), 78 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/agg-rx.c b/drivers/net/wireless/mediatek/mt76/agg-rx.c
index 07c386c7b4d08967f5dcb69ee9282b042afbce10..936ab1ca92460793f4d275ad18dd6f7722445d90 100644
--- a/drivers/net/wireless/mediatek/mt76/agg-rx.c
+++ b/drivers/net/wireless/mediatek/mt76/agg-rx.c
@@ -173,6 +173,8 @@ void mt76_rx_aggr_reorder(struct sk_buff *skb, struct sk_buff_head *frames)
 	if (ackp == IEEE80211_QOS_CTL_ACK_POLICY_NOACK)
 		return;
 
+	if (wcid->def_wcid)
+		wcid = wcid->def_wcid;
 	tid = rcu_dereference(wcid->aggr[tidno]);
 	if (!tid)
 		return;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index d6531b74be1f15467c06e385d0efabad806db6b8..fecf68271234e7949014d5be6b9e2f87c6dbb281 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -1183,8 +1183,14 @@ mt7996_txwi_free(struct mt7996_dev *dev, struct mt76_txwi_cache *t,
 	txwi = (__le32 *)mt76_get_txwi_ptr(mdev, t);
 	if (link_sta) {
 		wcid_idx = wcid->idx;
-		if (likely(t->skb->protocol != cpu_to_be16(ETH_P_PAE)))
-			mt7996_tx_check_aggr(link_sta, wcid, t->skb);
+		if (likely(t->skb->protocol != cpu_to_be16(ETH_P_PAE))) {
+			struct mt7996_sta *msta;
+
+			/* AMPDU state is stored in the primary link */
+			msta = (void *)link_sta->sta->drv_priv;
+			mt7996_tx_check_aggr(link_sta, &msta->deflink.wcid,
+					     t->skb);
+		}
 	} else {
 		wcid_idx = le32_get_bits(txwi[9], MT_TXD9_WLAN_IDX);
 	}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 38d15963ec5801e70b8e539b7707a8d47c9a37fd..16b208b0d1c7c529cb8ee4f5090a5ed4287aeddd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -988,11 +988,6 @@ static void
 mt7996_mac_sta_deinit_link(struct mt7996_dev *dev,
 			   struct mt7996_sta_link *msta_link)
 {
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(msta_link->wcid.aggr); i++)
-		mt76_rx_aggr_stop(&dev->mt76, &msta_link->wcid, i);
-
 	mt7996_mac_wtbl_update(dev, msta_link->wcid.idx,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
 
@@ -1367,16 +1362,13 @@ static int
 mt7996_ampdu_action(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		    struct ieee80211_ampdu_params *params)
 {
-	enum ieee80211_ampdu_mlme_action action = params->action;
 	struct mt7996_dev *dev = mt7996_hw_dev(hw);
 	struct ieee80211_sta *sta = params->sta;
 	struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
 	struct ieee80211_txq *txq = sta->txq[params->tid];
-	struct ieee80211_link_sta *link_sta;
 	u16 tid = params->tid;
 	u16 ssn = params->ssn;
 	struct mt76_txq *mtxq;
-	unsigned int link_id;
 	int ret = 0;
 
 	if (!txq)
@@ -1386,61 +1378,42 @@ mt7996_ampdu_action(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 
 	mutex_lock(&dev->mt76.mutex);
 
-	for_each_sta_active_link(vif, sta, link_sta, link_id) {
-		struct mt7996_sta_link *msta_link;
-		struct mt7996_vif_link *link;
-
-		msta_link = mt76_dereference(msta->link[link_id], &dev->mt76);
-		if (!msta_link)
-			continue;
-
-		link = mt7996_vif_link(dev, vif, link_id);
-		if (!link)
-			continue;
-
-		switch (action) {
-		case IEEE80211_AMPDU_RX_START:
-			mt76_rx_aggr_start(&dev->mt76, &msta_link->wcid, tid,
-					   ssn, params->buf_size);
-			ret = mt7996_mcu_add_rx_ba(dev, params, link,
-						   msta_link, true);
-			break;
-		case IEEE80211_AMPDU_RX_STOP:
-			mt76_rx_aggr_stop(&dev->mt76, &msta_link->wcid, tid);
-			ret = mt7996_mcu_add_rx_ba(dev, params, link,
-						   msta_link, false);
-			break;
-		case IEEE80211_AMPDU_TX_OPERATIONAL:
-			mtxq->aggr = true;
-			mtxq->send_bar = false;
-			ret = mt7996_mcu_add_tx_ba(dev, params, link,
-						   msta_link, true);
-			break;
-		case IEEE80211_AMPDU_TX_STOP_FLUSH:
-		case IEEE80211_AMPDU_TX_STOP_FLUSH_CONT:
-			mtxq->aggr = false;
-			clear_bit(tid, &msta_link->wcid.ampdu_state);
-			ret = mt7996_mcu_add_tx_ba(dev, params, link,
-						   msta_link, false);
-			break;
-		case IEEE80211_AMPDU_TX_START:
-			set_bit(tid, &msta_link->wcid.ampdu_state);
-			ret = IEEE80211_AMPDU_TX_START_IMMEDIATE;
-			break;
-		case IEEE80211_AMPDU_TX_STOP_CONT:
-			mtxq->aggr = false;
-			clear_bit(tid, &msta_link->wcid.ampdu_state);
-			ret = mt7996_mcu_add_tx_ba(dev, params, link,
-						   msta_link, false);
-			break;
-		}
-
-		if (ret)
-			break;
-	}
-
-	if (action == IEEE80211_AMPDU_TX_STOP_CONT)
+	switch (params->action) {
+	case IEEE80211_AMPDU_RX_START:
+		/* Since packets belonging to the same TID can be split over
+		 * multiple links, store the AMPDU state for reordering in the
+		 * primary link
+		 */
+		mt76_rx_aggr_start(&dev->mt76, &msta->deflink.wcid, tid,
+				   ssn, params->buf_size);
+		ret = mt7996_mcu_add_rx_ba(dev, params, vif, true);
+		break;
+	case IEEE80211_AMPDU_RX_STOP:
+		mt76_rx_aggr_stop(&dev->mt76, &msta->deflink.wcid, tid);
+		ret = mt7996_mcu_add_rx_ba(dev, params, vif, false);
+		break;
+	case IEEE80211_AMPDU_TX_OPERATIONAL:
+		mtxq->aggr = true;
+		mtxq->send_bar = false;
+		ret = mt7996_mcu_add_tx_ba(dev, params, vif, true);
+		break;
+	case IEEE80211_AMPDU_TX_STOP_FLUSH:
+	case IEEE80211_AMPDU_TX_STOP_FLUSH_CONT:
+		mtxq->aggr = false;
+		clear_bit(tid, &msta->deflink.wcid.ampdu_state);
+		ret = mt7996_mcu_add_tx_ba(dev, params, vif, false);
+		break;
+	case IEEE80211_AMPDU_TX_START:
+		set_bit(tid, &msta->deflink.wcid.ampdu_state);
+		ret = IEEE80211_AMPDU_TX_START_IMMEDIATE;
+		break;
+	case IEEE80211_AMPDU_TX_STOP_CONT:
+		mtxq->aggr = false;
+		clear_bit(tid, &msta->deflink.wcid.ampdu_state);
+		ret = mt7996_mcu_add_tx_ba(dev, params, vif, false);
 		ieee80211_stop_tx_ba_cb_irqsafe(vif, sta->addr, tid);
+		break;
+	}
 
 	mutex_unlock(&dev->mt76.mutex);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 0ba60279bbb77dfa94ef3121f75eaadac3c7290e..f641cedf5d6a080baf9cb7d47bd60cabbb147fb0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -1192,23 +1192,67 @@ mt7996_mcu_sta_ba(struct mt7996_dev *dev, struct mt76_vif_link *mvif,
 /** starec & wtbl **/
 int mt7996_mcu_add_tx_ba(struct mt7996_dev *dev,
 			 struct ieee80211_ampdu_params *params,
-			 struct mt7996_vif_link *link,
-			 struct mt7996_sta_link *msta_link, bool enable)
+			 struct ieee80211_vif *vif, bool enable)
 {
-	if (enable && !params->amsdu)
-		msta_link->wcid.amsdu = false;
+	struct ieee80211_sta *sta = params->sta;
+	struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
+	struct ieee80211_link_sta *link_sta;
+	unsigned int link_id;
+	int ret = 0;
+
+	for_each_sta_active_link(vif, sta, link_sta, link_id) {
+		struct mt7996_sta_link *msta_link;
+		struct mt7996_vif_link *link;
+
+		msta_link = mt76_dereference(msta->link[link_id], &dev->mt76);
+		if (!msta_link)
+			continue;
 
-	return mt7996_mcu_sta_ba(dev, &link->mt76, params, &msta_link->wcid,
-				 enable, true);
+		link = mt7996_vif_link(dev, vif, link_id);
+		if (!link)
+			continue;
+
+		if (enable && !params->amsdu)
+			msta_link->wcid.amsdu = false;
+
+		ret = mt7996_mcu_sta_ba(dev, &link->mt76, params,
+					&msta_link->wcid, enable, true);
+		if (ret)
+			break;
+	}
+
+	return ret;
 }
 
 int mt7996_mcu_add_rx_ba(struct mt7996_dev *dev,
 			 struct ieee80211_ampdu_params *params,
-			 struct mt7996_vif_link *link,
-			 struct mt7996_sta_link *msta_link, bool enable)
+			 struct ieee80211_vif *vif, bool enable)
 {
-	return mt7996_mcu_sta_ba(dev, &link->mt76, params, &msta_link->wcid,
-				 enable, false);
+	struct ieee80211_sta *sta = params->sta;
+	struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
+	struct ieee80211_link_sta *link_sta;
+	unsigned int link_id;
+	int ret = 0;
+
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
+		ret = mt7996_mcu_sta_ba(dev, &link->mt76, params,
+					&msta_link->wcid, enable, false);
+		if (ret)
+			break;
+	}
+
+	return ret;
 }
 
 static void
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index b98cfe6e5be8c6b77357cf7d2a76135f10609ca4..97b84710667ffdb5b6188a72d6f8475f7eb9a128 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -612,12 +612,10 @@ int mt7996_mcu_teardown_mld_sta(struct mt7996_dev *dev,
 				struct mt7996_sta_link *msta_link);
 int mt7996_mcu_add_tx_ba(struct mt7996_dev *dev,
 			 struct ieee80211_ampdu_params *params,
-			 struct mt7996_vif_link *link,
-			 struct mt7996_sta_link *msta_link, bool enable);
+			 struct ieee80211_vif *vif, bool enable);
 int mt7996_mcu_add_rx_ba(struct mt7996_dev *dev,
 			 struct ieee80211_ampdu_params *params,
-			 struct mt7996_vif_link *link,
-			 struct mt7996_sta_link *msta_link, bool enable);
+			 struct ieee80211_vif *vif, bool enable);
 int mt7996_mcu_update_bss_color(struct mt7996_dev *dev,
 				struct mt76_vif_link *mlink,
 				struct cfg80211_he_bss_color *he_bss_color);

---
base-commit: d0698b9ec737e0d764fbe15805114d67822b0e75
change-id: 20250823-mt7996-mlo-aggr-fix-cc1d659facb3

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


