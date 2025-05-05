Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98227C3ABB9
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 22:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M3ZZS6uQe4Kj5Pri7kd3aGshKqxpA+s/ubTNfLhqljY=; b=hUD6GS2EOM7cwfQa9/RwFvspU3
	+sDfPqoNUyB8/aFPWZTCTm8pKGzA7J1W2OYHLYgGsMLnhWhvrlklETK50WJel2RsTgm8aZoF6iiRx
	eKDn8T9pcDKuDDbgn6T/OY/s4yIyg8b3NUapM/Ah174BP3UsK+RxTv8WqJuessJ/yMuBXnKMkftn6
	ogzlaIzfIDFs8JAwTcdQPRLZi3jaF2dS6Coat/XbFoRYFiuNCNKdfDKLOSw/bd9iQZX8ZepaCbbPp
	Jkp8k4zbzV/wRI10NyvRs1Q/glUyokvSPVE5cvZEi86zBXuBPTH9jhwt5LBAkZ9C0nCZnZo8+d3Wx
	4MITDLnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4NK-00000008nEc-0gx6;
	Mon, 05 May 2025 22:33:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC47M-00000008i68-2dyh;
	Mon, 05 May 2025 22:16:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4314B629C0;
	Mon,  5 May 2025 22:16:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 434BCC4CEE4;
	Mon,  5 May 2025 22:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483415;
	bh=W2Wxsu7SWKuP/XejYew3Si0a72iY7M15wT4Jt1kxI0M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KhdHoIGq5qHfNzOVZz+JjIzws8j76Ed/xBpGhv57DUHRVCJ6Jo67JsgWjbQw+znrH
	 Dz4pMKjYx/Y3evzCU7dCRnyBfk/FJ2DHqb/1YPSlgvGZfTsZ26hLyZj2RvYRbsANXB
	 NXdsNfQ0hasoDxCDtRBNrUEZq9PKeLCo67rWe8F0zpuQdN7WhQeQBGx6aRZK7KzWrY
	 ed0fa2HL7h0YvcvDHexBF2jIL1zUt+eqS/eq3bZX3JIZPd48AnjGJPvK6nY0x1Hv2P
	 p/EPGlPhc+HDyTPY7cIirhhS2IPJFltbSVPWR2ehpUFcdO3HhayTYrBJx60MkNnOhS
	 6nODEl0N5pwMw==
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
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 074/642] wifi: mt76: mt7996: implement driver specific get_txpower function
Date: Mon,  5 May 2025 18:04:50 -0400
Message-Id: <20250505221419.2672473-74-sashal@kernel.org>
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

[ Upstream commit 86db2c5d4ed390b97a5b455a97e2cd9c4f3eff2b ]

Fixes reporting tx power for vifs that don't have a channel context
assigned. Report the tx power of a phy that is covered by the vif's
radio mask.

Link: https://patch.msgid.link/20250311103646.43346-7-nbd@nbd.name
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7996/main.c  | 29 ++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 69dd565d83190..980a059b3b38f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -601,6 +601,33 @@ static void mt7996_configure_filter(struct ieee80211_hw *hw,
 	mutex_unlock(&dev->mt76.mutex);
 }
 
+static int
+mt7996_get_txpower(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+		   unsigned int link_id, int *dbm)
+{
+	struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
+	struct mt7996_phy *phy = mt7996_vif_link_phy(&mvif->deflink);
+	struct mt7996_dev *dev = mt7996_hw_dev(hw);
+	struct wireless_dev *wdev;
+	int n_chains, delta, i;
+
+	if (!phy) {
+		wdev = ieee80211_vif_to_wdev(vif);
+		for (i = 0; i < hw->wiphy->n_radio; i++)
+			if (wdev->radio_mask & BIT(i))
+				phy = dev->radio_phy[i];
+
+		if (!phy)
+			return -EINVAL;
+	}
+
+	n_chains = hweight16(phy->mt76->chainmask);
+	delta = mt76_tx_power_nss_delta(n_chains);
+	*dbm = DIV_ROUND_UP(phy->mt76->txpower_cur + delta, 2);
+
+	return 0;
+}
+
 static u8
 mt7996_get_rates_table(struct mt7996_phy *phy, struct ieee80211_bss_conf *conf,
 		       bool beacon, bool mcast)
@@ -1650,7 +1677,7 @@ const struct ieee80211_ops mt7996_ops = {
 	.remain_on_channel = mt76_remain_on_channel,
 	.cancel_remain_on_channel = mt76_cancel_remain_on_channel,
 	.release_buffered_frames = mt76_release_buffered_frames,
-	.get_txpower = mt76_get_txpower,
+	.get_txpower = mt7996_get_txpower,
 	.channel_switch_beacon = mt7996_channel_switch_beacon,
 	.get_stats = mt7996_get_stats,
 	.get_et_sset_count = mt7996_get_et_sset_count,
-- 
2.39.5


