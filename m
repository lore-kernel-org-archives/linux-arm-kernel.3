Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C552C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 11:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XTYIPi4k+XGhDafYz8SznBRbiAw1Y9BXiJWFfhp4GDQ=; b=x3VDDRCNIc+2ABzYKsvkFuMCPj
	sYw9XyuwQ56rEVwpGt8c6d/ZPxGwOoYhROvBUlLOlAYAi/U6qXJGjteUYJ6oLmuJxlZoLiRiaKOyr
	pFOx0eckLUy1dklQ18eOh55mSTQkzSUIJZx6vyqhTjkdkjD6gncBWbeB3fxFmRNvwAxWv/5IXYFlQ
	75plj12n+arRRmnr+LLVBzWbZXAR7yI9b0AyWWXu7jaLcrW72h6ufVy88wt5tzEWgHHecN2LOJB68
	cjbi/3R37Ux3e6DF4feYDZj8DuAbg5q0tiC91tT1qCLfL2058fgHlLcT4BzuUSY9lrFOsCU2fXNYv
	J20ei2fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN8p5-0000000FMmc-3wrF;
	Thu, 05 Jun 2025 11:31:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN8cF-0000000FLWR-12SM;
	Thu, 05 Jun 2025 11:18:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 600B6614B8;
	Thu,  5 Jun 2025 11:18:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B409AC4CEEB;
	Thu,  5 Jun 2025 11:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749122314;
	bh=KcQumna6h2x+9rO/0vXE9bDt2GkL03POAiZICd71E6c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JigQayQP+k+6dF4dKOQFKMLhceMkigMy/i0s/hnvZ9G3ioPd+v8zG0trBFo66A6Mi
	 Jyt5egnjzrpsALGwx1c8yN7JA64xR4JEM9QUJgwc1q92qdfDf+7v1AyZd0a9FkHVwI
	 cKf/CQi9vwy/03VYBm/DuOZ8DCQ5VlmxegFf8338SUJKTAfzYNGLilVuah4Qn8unWd
	 MKlBPkE6G8KEH73k2K0eqC09hroH68BDbBgl026S8D/w3BY4Jc6QofoYVvOjeX+THj
	 0uI6o56D5qWx0aJDtJzaxX8dn3m3WWQ2PAwd5AcxREU/Ij9v/TQclPJ5OMIHiO1o5K
	 js9c/EvWbA25g==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 05 Jun 2025 13:14:19 +0200
Subject: [PATCH mt76 4/5] wifi: mt76: Move RCU section in
 mt7996_mcu_add_rate_ctrl()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-mt7996-sleep-while-atomic-v1-4-d46d15f9203c@kernel.org>
References: <20250605-mt7996-sleep-while-atomic-v1-0-d46d15f9203c@kernel.org>
In-Reply-To: <20250605-mt7996-sleep-while-atomic-v1-0-d46d15f9203c@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bo Jiao <Bo.Jiao@mediatek.com>, Peter Chiu <chui-hao.chiu@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Ben Greear <greearb@candelatech.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
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

Since mt76_mcu_skb_send_msg() routine can't be executed in atomic context,
move RCU section in mt7996_mcu_add_rate_ctrl() and execute
mt76_mcu_skb_send_msg() in non-atomic context. This is a preliminary
patch to fix a 'sleep while atomic' issue in mt7996_mac_sta_rc_work().

Fixes: 0762bdd30279 ("wifi: mt76: mt7996: rework mt7996_mac_sta_rc_work to support MLO")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c    |  3 +-
 drivers/net/wireless/mediatek/mt76/mt7996/main.c   |  6 +--
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c    | 50 +++++++++++++++++-----
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h | 10 ++---
 4 files changed, 45 insertions(+), 24 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 7444bd374b50bdfdcf7e1973993f496b740a1c51..5561b1098e3fb0d25551fde3cfdb3057217395fd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -2403,8 +2403,7 @@ void mt7996_mac_sta_rc_work(struct work_struct *work)
 		if (changed & (IEEE80211_RC_SUPP_RATES_CHANGED |
 			       IEEE80211_RC_NSS_CHANGED |
 			       IEEE80211_RC_BW_CHANGED))
-			mt7996_mcu_add_rate_ctrl(dev, vif, link_conf,
-						 link_sta, link, msta_link,
+			mt7996_mcu_add_rate_ctrl(dev, msta_link->sta, vif,
 						 link_id, true);
 
 		if (changed & IEEE80211_RC_SMPS_CHANGED)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index a096b5bab001de8d4fe3270ab37b1a6dab702ab1..07dd75ce94a5f204dcd4d659a777151bb9fcf8d2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -1112,10 +1112,8 @@ mt7996_mac_sta_event(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 			if (err)
 				return err;
 
-			err = mt7996_mcu_add_rate_ctrl(dev, vif, link_conf,
-						       link_sta, link,
-						       msta_link, link_id,
-						       false);
+			err = mt7996_mcu_add_rate_ctrl(dev, msta_link->sta, vif,
+						       link_id, false);
 			if (err)
 				return err;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 742497ba2a6bcd73e3660e626e4a756d79a467bf..77ab1f4854a43643c296f6ed28c08da99bfdcb04 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -2201,23 +2201,44 @@ mt7996_mcu_sta_rate_ctrl_tlv(struct sk_buff *skb, struct mt7996_dev *dev,
 	memset(ra->rx_rcpi, INIT_RCPI, sizeof(ra->rx_rcpi));
 }
 
-int mt7996_mcu_add_rate_ctrl(struct mt7996_dev *dev,
-			     struct ieee80211_vif *vif,
-			     struct ieee80211_bss_conf *link_conf,
-			     struct ieee80211_link_sta *link_sta,
-			     struct mt7996_vif_link *link,
-			     struct mt7996_sta_link *msta_link,
-			     u8 link_id, bool changed)
+int mt7996_mcu_add_rate_ctrl(struct mt7996_dev *dev, struct mt7996_sta *msta,
+			     struct ieee80211_vif *vif, u8 link_id,
+			     bool changed)
 {
-	struct mt7996_sta *msta = msta_link->sta;
+	struct ieee80211_bss_conf *link_conf;
+	struct ieee80211_link_sta *link_sta;
+	struct mt7996_sta_link *msta_link;
+	struct mt7996_vif_link *link;
+	struct ieee80211_sta *sta;
 	struct sk_buff *skb;
-	int ret;
+	int ret = -ENODEV;
+
+	rcu_read_lock();
+
+	link = mt7996_vif_link(dev, vif, link_id);
+	if (!link)
+		goto error_unlock;
+
+	msta_link = rcu_dereference(msta->link[link_id]);
+	if (!msta_link)
+		goto error_unlock;
+
+	sta = wcid_to_sta(&msta_link->wcid);
+	link_sta = rcu_dereference(sta->link[link_id]);
+	if (!link_sta)
+		goto error_unlock;
+
+	link_conf = rcu_dereference(vif->link_conf[link_id]);
+	if (!link_conf)
+		goto error_unlock;
 
 	skb = __mt76_connac_mcu_alloc_sta_req(&dev->mt76, &link->mt76,
 					      &msta_link->wcid,
 					      MT7996_STA_UPDATE_MAX_SIZE);
-	if (IS_ERR(skb))
-		return PTR_ERR(skb);
+	if (IS_ERR(skb)) {
+		ret = PTR_ERR(skb);
+		goto error_unlock;
+	}
 
 	/* firmware rc algorithm refers to sta_rec_he for HE control.
 	 * once dev->rc_work changes the settings driver should also
@@ -2231,12 +2252,19 @@ int mt7996_mcu_add_rate_ctrl(struct mt7996_dev *dev,
 	 */
 	mt7996_mcu_sta_rate_ctrl_tlv(skb, dev, vif, link_conf, link_sta, link);
 
+	rcu_read_unlock();
+
 	ret = mt76_mcu_skb_send_msg(&dev->mt76, skb,
 				    MCU_WMWA_UNI_CMD(STA_REC_UPDATE), true);
 	if (ret)
 		return ret;
 
 	return mt7996_mcu_add_rate_ctrl_fixed(dev, msta, vif, link_id);
+
+error_unlock:
+	rcu_read_unlock();
+
+	return ret;
 }
 
 static int
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index a529c2bae7cbf83589650c593f033e6ec5e714a8..33ac16b64ef113eff3f7749963e34a49b3c67ac3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -620,13 +620,9 @@ int mt7996_mcu_beacon_inband_discov(struct mt7996_dev *dev,
 int mt7996_mcu_add_obss_spr(struct mt7996_phy *phy,
 			    struct mt7996_vif_link *link,
 			    struct ieee80211_he_obss_pd *he_obss_pd);
-int mt7996_mcu_add_rate_ctrl(struct mt7996_dev *dev,
-			     struct ieee80211_vif *vif,
-			     struct ieee80211_bss_conf *link_conf,
-			     struct ieee80211_link_sta *link_sta,
-			     struct mt7996_vif_link *link,
-			     struct mt7996_sta_link *msta_link,
-			     u8 link_id, bool changed);
+int mt7996_mcu_add_rate_ctrl(struct mt7996_dev *dev, struct mt7996_sta *msta,
+			     struct ieee80211_vif *vif, u8 link_id,
+			     bool changed);
 int mt7996_set_channel(struct mt76_phy *mphy);
 int mt7996_mcu_set_chan_info(struct mt7996_phy *phy, u16 tag);
 int mt7996_mcu_set_tx(struct mt7996_dev *dev, struct ieee80211_vif *vif,

-- 
2.49.0


