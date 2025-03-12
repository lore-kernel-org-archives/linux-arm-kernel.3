Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB57FC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 12:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q8H3olc2XhikAv3qkBeshEdNoA6wqvjjSQbKsEOiM/Q=; b=RGYq9y1es2owXIFLFDOmEUFKMB
	FnK1MTW8Qy4KdSn1zKyQ3N+9UF5RX+P1Xb9Yfa/Q4zAS2J5ZOxG+UZlmy0mmJhKEOlwjX52QgIBNb
	0z1FUiP+AGS88EGbhqoTachR022jqKXaQZsr44SmXGoTcNryJpaMsGdZVugTqX9XozG/lrc9F2SRv
	XsMyHrc/8cW96LzXOURhiz4fzVMWwckFLrqi41CgVSPjdmqk00M9Bu4Zr3L5gDi8cN0lXZ3D/cOv8
	Oiv9ez8wA4NHIXY06iOW6OCGSEU6L66nKEQr/9IOKxTwNp4Dh5DRpkV9l9C4nSZwFUAd1pnK0pAYu
	4f40w7ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKuK-00000008MlO-07TX;
	Wed, 12 Mar 2025 12:09:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsK2v-00000008E2T-2YCO;
	Wed, 12 Mar 2025 11:14:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3D5A15C4D3B;
	Wed, 12 Mar 2025 11:12:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62345C4CEE3;
	Wed, 12 Mar 2025 11:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741778084;
	bh=2BMSlWifzBJQWXzj81j5vx/Mw/O7XE3wzQLEE6BMvQA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VCXDRac0nKwzoZuB4yPsRWArmjUKM5KTRleio0CdD+AhaF/dNI4BlO8pMye/O/Dp9
	 lOxXHVbDwfXI2YU0m2+Zv+F8Eem6oa4TKDt9FXCg2tc/j4fX1m7ApcPYU7c5aBnd42
	 G8AzGYczCEimen/2HApkq5zpv6TcERoZGnqEmG+bSLyltFIsaTkLsX8e6t9vnLEhQ3
	 i0dihpCOOzWLEComXjfDAxvJDUejFsy6y3ICdCnFQDysY1eB0CDN680QFFdBg/Xmkp
	 AwMQsR2xQ2daW0TNTM1nwOBvOqIpRdJo/1mZbXk3HQy0NaGGVj5VVEcGH/Wj/6aRWs
	 /9Z5srHESCk/g==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 12 Mar 2025 12:14:01 +0100
Subject: [PATCH 17/21] wifi: mt76: mt7996: rework
 mt7996_mcu_beacon_inband_discov to support MLO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-b4-mt7996-mlo-p2-v1-17-015b3d6fd928@kernel.org>
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
X-CRM114-CacheID: sfid-20250312_041445_762366_C60BB508 
X-CRM114-Status: GOOD (  12.24  )
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

Rework mt7996_mcu_beacon_inband_discov routine in order to support
multi-link setup.

Co-developed-by: Bo Jiao <Bo.Jiao@mediatek.com>
Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
Co-developed-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c   |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c    | 19 ++++++++++---------
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h |  3 ++-
 3 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index eeb856984298c1e07396c0338e0858afbdb21501..bcca1850d471bc43390c2f9e2ffecf6d9a05f377 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -827,7 +827,7 @@ mt7996_link_info_changed(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 
 	if (changed & (BSS_CHANGED_UNSOL_BCAST_PROBE_RESP |
 		       BSS_CHANGED_FILS_DISCOVERY))
-		mt7996_mcu_beacon_inband_discov(dev, vif, changed);
+		mt7996_mcu_beacon_inband_discov(dev, info, link, changed);
 
 	if (changed & BSS_CHANGED_MU_GROUPS)
 		mt7996_update_mu_group(hw, link, info);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 318ab7c2baa22861637137edfb666e779e662557..85602a8594e0c9ab3a0055e04cf1ca836d62b6b9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -2717,13 +2717,14 @@ int mt7996_mcu_add_beacon(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 }
 
 int mt7996_mcu_beacon_inband_discov(struct mt7996_dev *dev,
-				    struct ieee80211_vif *vif, u32 changed)
+				    struct ieee80211_bss_conf *link_conf,
+				    struct mt7996_vif_link *link, u32 changed)
 {
 #define OFFLOAD_TX_MODE_SU	BIT(0)
 #define OFFLOAD_TX_MODE_MU	BIT(1)
+	struct ieee80211_vif *vif = link_conf->vif;
 	struct ieee80211_hw *hw = mt76_hw(dev);
-	struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
-	struct mt7996_phy *phy = mt7996_vif_link_phy(&mvif->deflink);
+	struct mt7996_phy *phy = link->phy;
 	struct mt76_wcid *wcid = &dev->mt76.global_wcid;
 	struct bss_inband_discovery_tlv *discov;
 	struct ieee80211_tx_info *info;
@@ -2740,21 +2741,21 @@ int mt7996_mcu_beacon_inband_discov(struct mt7996_dev *dev,
 	chandef = &phy->mt76->chandef;
 	band = chandef->chan->band;
 
-	if (vif->bss_conf.nontransmitted)
+	if (link_conf->nontransmitted)
 		return 0;
 
-	rskb = __mt7996_mcu_alloc_bss_req(&dev->mt76, &mvif->deflink.mt76,
+	rskb = __mt7996_mcu_alloc_bss_req(&dev->mt76, &link->mt76,
 					  MT7996_MAX_BSS_OFFLOAD_SIZE);
 	if (IS_ERR(rskb))
 		return PTR_ERR(rskb);
 
 	if (changed & BSS_CHANGED_FILS_DISCOVERY &&
-	    vif->bss_conf.fils_discovery.max_interval) {
-		interval = vif->bss_conf.fils_discovery.max_interval;
+	    link_conf->fils_discovery.max_interval) {
+		interval = link_conf->fils_discovery.max_interval;
 		skb = ieee80211_get_fils_discovery_tmpl(hw, vif);
 	} else if (changed & BSS_CHANGED_UNSOL_BCAST_PROBE_RESP &&
-		   vif->bss_conf.unsol_bcast_probe_resp_interval) {
-		interval = vif->bss_conf.unsol_bcast_probe_resp_interval;
+		   link_conf->unsol_bcast_probe_resp_interval) {
+		interval = link_conf->unsol_bcast_probe_resp_interval;
 		skb = ieee80211_get_unsol_bcast_probe_resp_tmpl(hw, vif);
 	}
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index 45280f8f34fc4a56dddb3944232c17fdf4b61f69..124a48e2706e412afc91af5e1c057fca40fe5e3c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -594,7 +594,8 @@ int mt7996_mcu_update_bss_color(struct mt7996_dev *dev,
 int mt7996_mcu_add_beacon(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			  struct ieee80211_bss_conf *link_conf);
 int mt7996_mcu_beacon_inband_discov(struct mt7996_dev *dev,
-				    struct ieee80211_vif *vif, u32 changed);
+				    struct ieee80211_bss_conf *link_conf,
+				    struct mt7996_vif_link *link, u32 changed);
 int mt7996_mcu_add_obss_spr(struct mt7996_phy *phy,
 			    struct mt7996_vif_link *link,
 			    struct ieee80211_he_obss_pd *he_obss_pd);

-- 
2.48.1


