Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29725C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 12:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S7xJaqX3WA3+Xd7AqY6wvAP8Z3Kxluj3soJ9O/Ght7o=; b=HeKeDWl7hYNJYSeBi5Oxlt+pnq
	XeRljht6Nm1h3xIwfxlZSMooSiBPRehHCL6b2awKpcqH1EfcwOg1jEjLOIRewPazahhK/3dY3ZVE9
	zQ6JL+hUMQ5/tIryK+0lQzuOkM7LKnGBxMi8rXe4DyOFdiGITHl93g3bSHcqtnRoeicDG9OyTQGyW
	pYAgEX2qRT345mREIeWutmRMFwS9Hufg6qOuhibdxPcbIFVlwGBxKcJeFo5mUSW8M33CSTPMnFER/
	RAkiDi3lD4qslSeC1pAcvvRaJk5t66/oM1/wPxOjllrtvnGRFw8m8JjOHFOt3GXL1a9iYoG76T+8j
	rejxbtSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKkY-00000008L21-3cxm;
	Wed, 12 Mar 2025 11:59:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsK2g-00000008Dzk-1blL;
	Wed, 12 Mar 2025 11:14:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 068A45C4C4C;
	Wed, 12 Mar 2025 11:12:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02D97C4CEEC;
	Wed, 12 Mar 2025 11:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741778069;
	bh=8bdOOIA+g5woZVfBzNuz6crv+Ldk1aebuEmLn1pwko8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=syw4jIN/oQolTdBHgcpGrdCv+CKQ3H59VhF8Ffe0e1E5PDMByv4Xr3bcXpRX9CeKf
	 ilexGL1NotHnn0YDHnW1vQ8G4c8TzmGMXuD/CFPsnvXqwc7vyHsUELpy50S8RiwKIX
	 GQjMmvkgztr/0XcYQHbAciuYh6d8RQKuo1luFdotHTlSRTrLPDoURw5b/qHHvM4vCY
	 K6tTrt9y5Ir7kBQCac46D1EasE082N3GSlYxULF4uS5HsPsFqykGFDXq4IksapKPDL
	 SgvTbmU0NGUvhVQZ8qiQT2mzS44GfHg6aIxAI7sQup/mmrEdZriZss4cf6ACUrsaft
	 UL8edFNHJwDUA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 12 Mar 2025 12:13:55 +0100
Subject: [PATCH 11/21] wifi: mt76: mt7996: remove
 mt7996_mac_enable_rtscts()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-b4-mt7996-mlo-p2-v1-11-015b3d6fd928@kernel.org>
References: <20250312-b4-mt7996-mlo-p2-v1-0-015b3d6fd928@kernel.org>
In-Reply-To: <20250312-b4-mt7996-mlo-p2-v1-0-015b3d6fd928@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_041430_548046_97C2E6D6 
X-CRM114-Status: UNSURE (   8.86  )
X-CRM114-Notice: Please train this message.
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

It is controlled by FW, also, driver should not directly write WTBL to
prevent WTBL overwritten issues.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c    | 14 --------------
 drivers/net/wireless/mediatek/mt76/mt7996/main.c   |  3 ---
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h |  2 --
 3 files changed, 19 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index b8d88fdee97a3567b57a20d0322859b7ae8ce88a..c1c7638e29a1205629f4eb126e15163981109557 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -217,20 +217,6 @@ static void mt7996_mac_sta_poll(struct mt7996_dev *dev)
 	rcu_read_unlock();
 }
 
-void mt7996_mac_enable_rtscts(struct mt7996_dev *dev,
-			      struct ieee80211_vif *vif, bool enable)
-{
-	struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
-	struct mt7996_sta_link *msta_link = &mvif->deflink.msta_link;
-	u32 addr;
-
-	addr = mt7996_mac_wtbl_lmac_addr(dev, msta_link->wcid.idx, 5);
-	if (enable)
-		mt76_set(dev, addr, BIT(5));
-	else
-		mt76_clear(dev, addr, BIT(5));
-}
-
 /* The HW does not translate the mac header to 802.3 for mesh point */
 static int mt7996_reverse_frag0_hdr_trans(struct sk_buff *skb, u16 hdr_gap)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index a845c3e758adcc4802f704a99ac39aa9ca670c88..8d7ad2dc2d7bccf6c8f5fe4862828b61145a0c85 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -785,9 +785,6 @@ mt7996_link_info_changed(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 				   !!(changed & BSS_CHANGED_BSSID));
 	}
 
-	if (changed & BSS_CHANGED_ERP_CTS_PROT)
-		mt7996_mac_enable_rtscts(dev, vif, info->use_cts_prot);
-
 	if (changed & BSS_CHANGED_ERP_SLOT) {
 		int slottime = info->use_short_slot ? 9 : 20;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index 1e79757b7a5197426438532a2f0c39e54d6ebae5..8a347dd8e648a43250e7dd717cb65f77cb4a61dd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -707,8 +707,6 @@ bool mt7996_mac_wtbl_update(struct mt7996_dev *dev, int idx, u32 mask);
 void mt7996_mac_reset_counters(struct mt7996_phy *phy);
 void mt7996_mac_cca_stats_reset(struct mt7996_phy *phy);
 void mt7996_mac_enable_nf(struct mt7996_dev *dev, u8 band);
-void mt7996_mac_enable_rtscts(struct mt7996_dev *dev,
-			      struct ieee80211_vif *vif, bool enable);
 void mt7996_mac_write_txwi(struct mt7996_dev *dev, __le32 *txwi,
 			   struct sk_buff *skb, struct mt76_wcid *wcid,
 			   struct ieee80211_key_conf *key, int pid,

-- 
2.48.1


