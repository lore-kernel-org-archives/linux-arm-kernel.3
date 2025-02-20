Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A10C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 13:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j9eHy9nHwXa6AACDtxv9/62RtOxAyb607V3QlD6VLQU=; b=Rz2zphfTi4tB6bpcAEIeS6IINL
	3oeEuZ7+yr7V6bqOTvrKdCZyHYlizSoL3G6Gn2n98oAGaOjaa3nxrO1zuzNYbz+nhWNAoo0JnQL9h
	0/dSKoc58+oXrYIJGgTL5X5ctSXiesArnxs/tEXb1MRcAACF7utUe4eN41KF5g+Tm886PujcUc+5c
	mUHqr/gVgHpOsqERyWtJ1jKpos2/wFQQ/39FeJ3JUagxjxVeecRFeHQexJG2zSpELJwn2H1qPsHqX
	RXREyzIsHoaqoPgNy/1TdjxVLt/Y/FWZDV5hwFnqrmC5gg9emtLJbaY89orbGKjPWwPEHtJGu00SL
	mB53cGsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl6jv-000000015hm-05T7;
	Thu, 20 Feb 2025 13:37:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl6SZ-000000011An-2owF;
	Thu, 20 Feb 2025 13:19:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DADBE5C5DE6;
	Thu, 20 Feb 2025 13:18:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63253C4CED1;
	Thu, 20 Feb 2025 13:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740057562;
	bh=XF1+CPJcSxRtrFfbh8j8RuFGJUKubbov9FFdIk1eby8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=B5rEVBDTHNaC782uQwMROV3wux5uH6XZ3eBP+e0WRSSTjSbYbWey8Ql/tObeUEB+A
	 VQFUV2r/qauRvoDdh+L6aeHvTrkbt16G4N5SZdZPbzGIDltSVd4SLjfyBqk71XX3XN
	 q6yqL0LbCvosq0E1O7U+jg1p833lVBUcnVEOtuqAZMS2rBxdMrSqNlgpWP3uZBN2gg
	 nZj5JS8VoLGy0xmmGjXEyr0W2E/Mz1HiMEOeJUq6qUqUiXlhtX6kBVdGcjAwiJinEa
	 gQWFk9YUdHwFfh1Yf13V1NDAT1+0IDnvYWe1RFC8PfIJ6Da/8YZAC3FNmPfcJWZ8eZ
	 toJ9QP1G3Puvw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 20 Feb 2025 14:18:50 +0100
Subject: [PATCH 04/14] wifi: mt76: mt7996: Add vif_cfg_changed callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-mt7996-mlo-v1-4-34c4abb37158@kernel.org>
References: <20250220-mt7996-mlo-v1-0-34c4abb37158@kernel.org>
In-Reply-To: <20250220-mt7996-mlo-v1-0-34c4abb37158@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Kalle Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Bo Jiao <Bo.Jiao@mediatek.com>, 
 Peter Chiu <chui-hao.chiu@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_051923_829129_CBE9AECC 
X-CRM114-Status: GOOD (  11.58  )
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

Introduce vif_cfg_changed mac80211 callback as preliminary patch to
enable MLO support in MT7996 driver.

Co-developed-by: Bo Jiao <Bo.Jiao@mediatek.com>
Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
Co-developed-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Co-developed-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 35 +++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index e4ea5a37296167400a39e8d80f1fe2c3b0f1af5c..de7accc5d91d686d76518d580c88e2708dcabfea 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -651,6 +651,39 @@ mt7996_update_mu_group(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	mt76_wr(dev, MT_WF_PHYRX_BAND_GID_TAB_POS3(band), mu[3]);
 }
 
+static void
+mt7996_vif_cfg_changed(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+		       u64 changed)
+{
+	struct mt7996_dev *dev = mt7996_hw_dev(hw);
+
+	mutex_lock(&dev->mt76.mutex);
+
+	if ((changed & BSS_CHANGED_ASSOC) && vif->cfg.assoc) {
+		struct ieee80211_bss_conf *link_conf;
+		unsigned long link_id;
+
+		for_each_vif_active_link(vif, link_conf, link_id) {
+			struct mt7996_vif_link *link;
+
+			link = mt7996_vif_link(dev, vif, link_id);
+			if (!link)
+				continue;
+
+			if (!link->phy)
+				continue;
+
+			mt7996_mcu_add_bss_info(link->phy, vif, link_conf,
+						&link->mt76, true);
+			mt7996_mcu_add_sta(dev, vif, &link->mt76, NULL,
+					   CONN_STATE_PORT_SECURE,
+					   !!(changed & BSS_CHANGED_BSSID));
+		}
+	}
+
+	mutex_unlock(&dev->mt76.mutex);
+}
+
 static void mt7996_bss_info_changed(struct ieee80211_hw *hw,
 				    struct ieee80211_vif *vif,
 				    struct ieee80211_bss_conf *info,
@@ -677,7 +710,6 @@ static void mt7996_bss_info_changed(struct ieee80211_hw *hw,
 	 * and then peer references bss_info_rfch to set bandwidth cap.
 	 */
 	if ((changed & BSS_CHANGED_BSSID && !is_zero_ether_addr(info->bssid)) ||
-	    (changed & BSS_CHANGED_ASSOC && vif->cfg.assoc) ||
 	    (changed & BSS_CHANGED_BEACON_ENABLED && info->enable_beacon)) {
 		mt7996_mcu_add_bss_info(phy, vif, info, mvif, true);
 		mt7996_mcu_add_sta(dev, vif, mvif, NULL, CONN_STATE_PORT_SECURE,
@@ -1660,6 +1692,7 @@ const struct ieee80211_ops mt7996_ops = {
 	.conf_tx = mt7996_conf_tx,
 	.configure_filter = mt7996_configure_filter,
 	.bss_info_changed = mt7996_bss_info_changed,
+	.vif_cfg_changed = mt7996_vif_cfg_changed,
 	.sta_state = mt76_sta_state,
 	.sta_pre_rcu_remove = mt76_sta_pre_rcu_remove,
 	.link_sta_rc_update = mt7996_sta_rc_update,

-- 
2.48.1


