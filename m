Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2CF2C3ABB9
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 22:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dktR7hzrYNh/x+tOOZgpc9/SDCQx1E3PWBz2MwtJth4=; b=sjDBVHNeYXeImb7SYzSMJ86Lh1
	lyAEa5lVAFZm/2tdeFiURR0FQO1b+TMU6uGvj+Qha17LjDrGJLVYuoH5ETaUTypWixMVgRgml2UE6
	QwqoyvdznCeHHEfJ2Q1mHZKjrdPrEzPRJqkdacjZ5nLx5+dtmk3EQvR0JPQ0aQ1AnnMUkIcEVu5X7
	nYUU4as6wKCkKuWICPMSa789UMKbNoXvHvhUflLGZxcmklrdXGGj3uMn4pPXdGkIVFlBTB1gyhQ7M
	kr8/SYqkcgy4KprtWzneKdYjOaJhmB0yT4TH13tfv6q1bb2nVGphmNqVWi92aZqTNSCrEarOMTKgZ
	3lTjWV9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4TH-00000008p6O-2n8v;
	Mon, 05 May 2025 22:39:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC47W-00000008iBa-2BPZ;
	Mon, 05 May 2025 22:17:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 24C31629C2;
	Mon,  5 May 2025 22:16:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14CF7C4CEED;
	Mon,  5 May 2025 22:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483425;
	bh=6qaGOBfLQqjBlG7mlV7178I8mSUvnwgJ+5rXSWFfTWk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AW3cqLiOdmsJUn1UWa9LJFWHXTOxROTJqBMNdfmnoGqApv0hJK1tHEa7nmB0ApXw0
	 tEJIbETLWTRCepZLtvRrsIHnyAb7U1f1V/UxSMmiDjTwwoVzXFCFd5AqPb7Eq0owRR
	 dpYSQ+28Op3lQh8tEE9z0cq0nhBbr9rzQ+RrmrFqEejMSekDagc3HbcpeSXjJ9M8tu
	 vm9GUIIHZ7RdM9vvhIWxU4kOg66tcH9p8yvyaEgdzsKUhgPJdAke6DV7lVbNbStatp
	 Ksz+T1Ke6gqNB7u4NeyaZStasZVX1tPCXK9E/wLuehUAZulHlXVaAkP1e2oww3NwQG
	 PidfmXbKgeE2w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Sasha Levin <sashal@kernel.org>,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	shayne.chen@mediatek.com,
	chui-hao.chiu@mediatek.com,
	Bo.Jiao@mediatek.com,
	benjamin-jw.lin@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 076/642] wifi: mt76: mt7996: use the correct vif link for scanning/roc
Date: Mon,  5 May 2025 18:04:52 -0400
Message-Id: <20250505221419.2672473-76-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit
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

From: Felix Fietkau <nbd@nbd.name>

[ Upstream commit 13b4c81083cc4b59fb639a511c0a9a7c38efde7e ]

Use the newly added offchannel_link pointer in vif data

Link: https://patch.msgid.link/20250311103646.43346-5-nbd@nbd.name
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7996/mac.c   | 40 +++++++++++++------
 .../net/wireless/mediatek/mt76/mt7996/main.c  |  1 +
 2 files changed, 28 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 019c925ae600e..88f9d9059d5f2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -832,7 +832,8 @@ void mt7996_mac_write_txwi(struct mt7996_dev *dev, __le32 *txwi,
 	u8 band_idx = (info->hw_queue & MT_TX_HW_QUEUE_PHY) >> 2;
 	u8 p_fmt, q_idx, omac_idx = 0, wmm_idx = 0;
 	bool is_8023 = info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP;
-	struct mt76_vif_link *mvif;
+	struct mt76_vif_link *mlink = NULL;
+	struct mt7996_vif *mvif;
 	u16 tx_count = 15;
 	u32 val;
 	bool inband_disc = !!(changed & (BSS_CHANGED_UNSOL_BCAST_PROBE_RESP |
@@ -840,11 +841,18 @@ void mt7996_mac_write_txwi(struct mt7996_dev *dev, __le32 *txwi,
 	bool beacon = !!(changed & (BSS_CHANGED_BEACON |
 				    BSS_CHANGED_BEACON_ENABLED)) && (!inband_disc);
 
-	mvif = vif ? (struct mt76_vif_link *)vif->drv_priv : NULL;
-	if (mvif) {
-		omac_idx = mvif->omac_idx;
-		wmm_idx = mvif->wmm_idx;
-		band_idx = mvif->band_idx;
+	if (vif) {
+		mvif = (struct mt7996_vif *)vif->drv_priv;
+		if (wcid->offchannel)
+			mlink = rcu_dereference(mvif->mt76.offchannel_link);
+		if (!mlink)
+			mlink = &mvif->deflink.mt76;
+	}
+
+	if (mlink) {
+		omac_idx = mlink->omac_idx;
+		wmm_idx = mlink->wmm_idx;
+		band_idx = mlink->band_idx;
 	}
 
 	if (inband_disc) {
@@ -910,13 +918,13 @@ void mt7996_mac_write_txwi(struct mt7996_dev *dev, __le32 *txwi,
 			     is_multicast_ether_addr(hdr->addr1);
 		u8 idx = MT7996_BASIC_RATES_TBL;
 
-		if (mvif) {
-			if (mcast && mvif->mcast_rates_idx)
-				idx = mvif->mcast_rates_idx;
-			else if (beacon && mvif->beacon_rates_idx)
-				idx = mvif->beacon_rates_idx;
+		if (mlink) {
+			if (mcast && mlink->mcast_rates_idx)
+				idx = mlink->mcast_rates_idx;
+			else if (beacon && mlink->beacon_rates_idx)
+				idx = mlink->beacon_rates_idx;
 			else
-				idx = mvif->basic_rates_idx;
+				idx = mlink->basic_rates_idx;
 		}
 
 		val = FIELD_PREP(MT_TXD6_TX_RATE, idx) | MT_TXD6_FIXED_BW;
@@ -984,8 +992,14 @@ int mt7996_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 
 	if (vif) {
 		struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
+		struct mt76_vif_link *mlink = NULL;
+
+		if (wcid->offchannel)
+			mlink = rcu_dereference(mvif->mt76.offchannel_link);
+		if (!mlink)
+			mlink = &mvif->deflink.mt76;
 
-		txp->fw.bss_idx = mvif->deflink.mt76.idx;
+		txp->fw.bss_idx = mlink->idx;
 	}
 
 	txp->fw.token = cpu_to_le16(id);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 980a059b3b38f..b01cc7ef47999 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -249,6 +249,7 @@ int mt7996_vif_link_add(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 	mlink->band_idx = band_idx;
 	mlink->wmm_idx = vif->type == NL80211_IFTYPE_AP ? 0 : 3;
 	mlink->wcid = &link->sta.wcid;
+	mlink->wcid->offchannel = mlink->offchannel;
 
 	ret = mt7996_mcu_add_dev_info(phy, vif, link_conf, mlink, true);
 	if (ret)
-- 
2.39.5


