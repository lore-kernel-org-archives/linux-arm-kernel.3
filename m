Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F72C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 18:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NJdc85o/IG9fAKuggL3GP3CO9fu7kb3YU5ILMmhvPmU=; b=jFqSzLEpmQfkcCvhZimT6yzJRf
	B9wVBxZ2vJIIoa1PhHJOkCCkcXqOm3ozT3K/nSPfEfxPDhx4Xcs63XkqKGwe2E1Xi4OxnBNgl2ExN
	ZF8vcNuUe9+At3ZNBuzmcOMsqBZgGL9fBPQFi9pFVUhbEEGqmNBxc4VHSftCViNQfh73GWCgW8Imu
	+XQByYLR85lwtEGwCbm7bt+vsAW7940RkCyTt/vJ3505Ni6xEF1sEFMHSVBYGo9bNhhEio03SFrqK
	yreTJarfGwv8Iz07YmNQw11FzV57pUlI3cWql3vYYmViPbeodio8rJBhspsIAL/QRdJS0Rjn+H98Z
	DJdWr7qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts3ts-00000006XbQ-3Ve0;
	Tue, 11 Mar 2025 18:00:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts3fe-00000006VFJ-2Maw;
	Tue, 11 Mar 2025 17:45:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1C5105C5622;
	Tue, 11 Mar 2025 17:43:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A857C4CEE9;
	Tue, 11 Mar 2025 17:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741715137;
	bh=LVJawuz9qJYzYyrfmxkyS2WnH9bwQG3JJ+05tO0wnlQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gaQn4OyQ5++jIDUZ913GwZLxCPjkXEcDxeXKyxfLhuoBD7eloqIJ6gr7NcY97KADN
	 OSLxzl4WXuL1+oV0V53PLw1KtZ8xQbdLwwsYIuEiT19PF0NfLZKBz9DKjAEAKJyVLS
	 MabKFdfS8r/654CPtvJ3Vz/DuNpYtMmT1lzwUMTzEGPU2Krm3tD5PYPGbAiKm2F/vN
	 ph3yPl08SPrG00axHfzKKNSj0Yp380BoimOj8wlmYCUD2disNyqWeUE99ZYMYNujGG
	 DVH6n1ft3iIF/84YIca81qwldpSOz/wLFOuq0CUzb1E5WGKb0VWNziO0TKDvsXRUjr
	 YX/K004TWI5Cw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 11 Mar 2025 18:45:07 +0100
Subject: [PATCH v2 08/13] wifi: mt76: mt7996: Add
 mt7996_mac_sta_change_links callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-mt7996-mlo-v2-8-31df6972519b@kernel.org>
References: <20250311-mt7996-mlo-v2-0-31df6972519b@kernel.org>
In-Reply-To: <20250311-mt7996-mlo-v2-0-31df6972519b@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Kalle Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, 
 Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Bo Jiao <Bo.Jiao@mediatek.com>, 
 Peter Chiu <chui-hao.chiu@mediatek.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_104538_648932_44091512 
X-CRM114-Status: UNSURE (   9.43  )
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

Intrdouce mt7996_mac_sta_change_links routine to set change_sta_links
required by mac80211. This is a preliminary patch to introduce MLO
support for MT7996 driver.

Co-developed-by: Bo Jiao <Bo.Jiao@mediatek.com>
Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
Co-developed-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 1bca444d2d02333cabd31ba2c8565769a42ab581..307c68c6b0cd7c3acdbfd7be78a007a66d3183bf 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -952,6 +952,26 @@ mt7996_mac_sta_add_links(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 	return err;
 }
 
+static int
+mt7996_mac_sta_change_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+			    struct ieee80211_sta *sta, u16 old_links,
+			    u16 new_links)
+{
+	struct mt7996_dev *dev = mt7996_hw_dev(hw);
+	unsigned long add = new_links & ~old_links;
+	unsigned long rem = old_links & ~new_links;
+	int ret;
+
+	mutex_lock(&dev->mt76.mutex);
+
+	mt7996_mac_sta_remove_links(dev, sta, rem);
+	ret = mt7996_mac_sta_add_links(dev, vif, sta, add);
+
+	mutex_unlock(&dev->mt76.mutex);
+
+	return ret;
+}
+
 static int
 mt7996_mac_sta_add(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 		   struct ieee80211_sta *sta)
@@ -1921,4 +1941,5 @@ const struct ieee80211_ops mt7996_ops = {
 	.net_setup_tc = mt76_wed_net_setup_tc,
 #endif
 	.change_vif_links = mt7996_change_vif_links,
+	.change_sta_links = mt7996_mac_sta_change_links,
 };

-- 
2.48.1


