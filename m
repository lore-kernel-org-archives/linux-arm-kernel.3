Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ADDFC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 12:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T14bRznuZF3M+01AOzWAJR3PvKsWz5DFvy6lKJmvkFo=; b=R7bW0PzFpL15yFdjhZemM1lUVn
	suS/pouv/5GHFVlJM0KoNeK1BqmUweP2o44IIUmQlABJw4PA/yL0xBS9EAgHBrjxN7fYUOdbjw8Yi
	Rtn/Srcp5OS/4AQwArr3ATiKS0+HRK8AD3UdM/ljBI9a2O39PRmRf5Yr2ecFKGl9XQR2YjiG62E+v
	KRvxuiyOT4GeBd9y3IjD1qvSyFAP7TMAXfVsQtGY1S5uVap5J9dNxrQKA9Ks0NZFOyGxQ9Mbe3rAa
	zZeWmg6Tz+onm/FF73tiK9dCj+nhYI9SOslMurbZLI7s0ik72ea/Ceuc2fOtzA0LFhg058UlUbOLm
	8TG6Oimg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKsg-00000008MZ7-1ZTZ;
	Wed, 12 Mar 2025 12:08:14 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsK2t-00000008E24-1JmI;
	Wed, 12 Mar 2025 11:14:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 93742A47060;
	Wed, 12 Mar 2025 11:09:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D63D8C4CEE3;
	Wed, 12 Mar 2025 11:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741778082;
	bh=goqirt3ne0YBLw9g5DlQYNOmTv0nq7Z+NH2LHivrQCo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FExmkP1WMmO5+7CyR9+dkdJc/RFvUa92Bbn+nvfCIUEbussK7GdCLQktDXr0Q6d4t
	 Y2JvzZyvDuCxmvheqPxuAAaszz11xG89s/l/RJB30KpdeOIN6GQbA4MSFSWKPMvwdT
	 XVRtdgyW/Aq8YT9VeaGGjm8G9PdNbcETf0kb6h2sE7Xamx8cZuR4fQduA2K6i3HrdD
	 GeFEnTKv6ZPE7CIbhbRFni7p4XUssuSSAGvRctJ28kEp9LrZ62jCsIq3Sh0fh9MYKs
	 1SdA+yZNYQb/tfUKeo8UJLjYvG3vNwsVuV2XKoa05+jbqxaxfvbwOBrRMh7uih07uD
	 I12jMNNqHwP2A==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 12 Mar 2025 12:14:00 +0100
Subject: [PATCH 16/21] wifi: mt76: mt7996: rework mt7996_mcu_add_obss_spr
 to support MLO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-b4-mt7996-mlo-p2-v1-16-015b3d6fd928@kernel.org>
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
X-CRM114-CacheID: sfid-20250312_041443_503130_F90C54C9 
X-CRM114-Status: GOOD (  10.70  )
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

Rework mt7996_mcu_add_obss_spr routine in order to support multi-link
setup.

Co-developed-by: Bo Jiao <Bo.Jiao@mediatek.com>
Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
Co-developed-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c   |  3 ++-
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c    | 11 ++++++-----
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h |  3 ++-
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 4a33979ee8535303fa3d09ec4500546d26f700eb..eeb856984298c1e07396c0338e0858afbdb21501 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -807,7 +807,7 @@ mt7996_link_info_changed(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		mt7996_mcu_set_tx(dev, vif, info);
 
 	if (changed & BSS_CHANGED_HE_OBSS_PD)
-		mt7996_mcu_add_obss_spr(phy, vif, &info->he_obss_pd);
+		mt7996_mcu_add_obss_spr(phy, link, &info->he_obss_pd);
 
 	if (changed & BSS_CHANGED_HE_BSS_COLOR) {
 		if ((vif->type == NL80211_IFTYPE_AP &&
@@ -1254,6 +1254,7 @@ mt7996_ampdu_action(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	mtxq = (struct mt76_txq *)txq->drv_priv;
 
 	mutex_lock(&dev->mt76.mutex);
+
 	switch (action) {
 	case IEEE80211_AMPDU_RX_START:
 		mt76_rx_aggr_start(&dev->mt76, &msta_link->wcid, tid, ssn,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index b9f689436bfd3859e01ff7025a1f77cec8348824..318ab7c2baa22861637137edfb666e779e662557 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -4193,12 +4193,12 @@ mt7996_mcu_set_obss_spr_pd(struct mt7996_phy *phy,
 }
 
 static int
-mt7996_mcu_set_obss_spr_siga(struct mt7996_phy *phy, struct ieee80211_vif *vif,
+mt7996_mcu_set_obss_spr_siga(struct mt7996_phy *phy,
+			     struct mt7996_vif_link *link,
 			     struct ieee80211_he_obss_pd *he_obss_pd)
 {
-	struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
 	struct mt7996_dev *dev = phy->dev;
-	u8 omac = mvif->deflink.mt76.omac_idx;
+	u8 omac = link->mt76.omac_idx;
 	struct {
 		u8 band_idx;
 		u8 __rsv[3];
@@ -4270,7 +4270,8 @@ mt7996_mcu_set_obss_spr_bitmap(struct mt7996_phy *phy,
 				 sizeof(req), true);
 }
 
-int mt7996_mcu_add_obss_spr(struct mt7996_phy *phy, struct ieee80211_vif *vif,
+int mt7996_mcu_add_obss_spr(struct mt7996_phy *phy,
+			    struct mt7996_vif_link *link,
 			    struct ieee80211_he_obss_pd *he_obss_pd)
 {
 	int ret;
@@ -4304,7 +4305,7 @@ int mt7996_mcu_add_obss_spr(struct mt7996_phy *phy, struct ieee80211_vif *vif,
 		return ret;
 
 	/* Set SR prohibit */
-	ret = mt7996_mcu_set_obss_spr_siga(phy, vif, he_obss_pd);
+	ret = mt7996_mcu_set_obss_spr_siga(phy, link, he_obss_pd);
 	if (ret)
 		return ret;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index 8a347dd8e648a43250e7dd717cb65f77cb4a61dd..45280f8f34fc4a56dddb3944232c17fdf4b61f69 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -595,7 +595,8 @@ int mt7996_mcu_add_beacon(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			  struct ieee80211_bss_conf *link_conf);
 int mt7996_mcu_beacon_inband_discov(struct mt7996_dev *dev,
 				    struct ieee80211_vif *vif, u32 changed);
-int mt7996_mcu_add_obss_spr(struct mt7996_phy *phy, struct ieee80211_vif *vif,
+int mt7996_mcu_add_obss_spr(struct mt7996_phy *phy,
+			    struct mt7996_vif_link *link,
 			    struct ieee80211_he_obss_pd *he_obss_pd);
 int mt7996_mcu_add_rate_ctrl(struct mt7996_dev *dev,
 			     struct ieee80211_vif *vif,

-- 
2.48.1


