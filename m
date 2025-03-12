Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F0EC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 12:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sXKahqiH+KsTvatuzLo8FvML+ig17JXXkWdq6FUWD/8=; b=2vRdrH6YS8schCBx+4sk20LFL3
	guu1+Dn7SirkASk+9QMrxfYVJJeLzmLyRcfFwJUW4icbTPDVInzxpVO4rkRHcMoL/oHfSXb1vcxYw
	7vA3szf6TNs+VYQ8ZMmrcWHGrPBYxoY43YElK1tiVY+CNUhulAhKYW6p4k2urzJeZuJXsnMivvJdd
	3z0mADWT/OE8QtzjD1r9srn4Ex1mCLYbzmllrTREWGQ/3hdv4S0BmRgXkz1iQAqgRf1TbvOWmO5w6
	3di/4Xo9OnyfBxZJE0COizZmFVPsjwm/GLdn/p7njpAgdDL8oaMZK3oO0n0SV59K9Aw0DTfx5ooFG
	ZB5XdCwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKno-00000008LV0-1KbC;
	Wed, 12 Mar 2025 12:03:12 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsK2l-00000008E0w-2yYd;
	Wed, 12 Mar 2025 11:14:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 090CEA47060;
	Wed, 12 Mar 2025 11:09:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B5B5C4CEE3;
	Wed, 12 Mar 2025 11:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741778074;
	bh=WWKbKXXhJy/OKwXLv2qGhKk5Lfwrc9oYu3E9rs+ztZc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qJ7a7Ju84qjP7w8QPDH0rMbRtx3oxjSBvDnts4zwcLD4cCGpVSZsf1iiJzh3137u0
	 96OlQ3+Io1gm3tjou8mheY5D9JqkdKvxhL5ibV+z+YzeSf6SOARvzYnQAO32q2PZY0
	 CsU+p6Vd6D2SfLjq3VQxiCwKLoTRYp7sUDmj1yqRlpjkxFLhmAw+x0eHMsR6aaucq/
	 PnfcYI26hW2oR5k2E1MO9xibDYvpp38uTm7hzDYrtbAkQQ4B7GhyjNjPE2NEKD6fzi
	 7E0TLnoHVY/fc0AyE7Vin4gZmmWaAFR5UTFwGyMTHhqTBRcaiK8K4IiUJkkcUcqbuh
	 LrdbKefZ72PAw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 12 Mar 2025 12:13:57 +0100
Subject: [PATCH 13/21] wifi: mt76: mt7996: rework mt7996_mac_sta_poll to
 support MLO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-b4-mt7996-mlo-p2-v1-13-015b3d6fd928@kernel.org>
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
X-CRM114-CacheID: sfid-20250312_041435_888274_3596BB16 
X-CRM114-Status: GOOD (  11.12  )
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

Rework mt7996_mac_sta_poll routine in order to support multi-link
setup.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index c56b1126abd59da5895d94fb368004adf6ffbbc8..6870ee189dca61a989d4b7cfde741588c8f18482 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -123,10 +123,12 @@ static void mt7996_mac_sta_poll(struct mt7996_dev *dev)
 		[IEEE80211_AC_VO] = 6
 	};
 	struct mt7996_sta_link *msta_link;
+	struct mt76_vif_link *mlink;
 	struct ieee80211_sta *sta;
 	struct mt7996_sta *msta;
 	u32 tx_time[IEEE80211_NUM_ACS], rx_time[IEEE80211_NUM_ACS];
 	LIST_HEAD(sta_poll_list);
+	struct mt76_wcid *wcid;
 	int i;
 
 	spin_lock_bh(&dev->mt76.sta_poll_lock);
@@ -150,10 +152,11 @@ static void mt7996_mac_sta_poll(struct mt7996_dev *dev)
 					     struct mt7996_sta_link,
 					     wcid.poll_list);
 		msta = msta_link->sta;
-		list_del_init(&msta_link->wcid.poll_list);
+		wcid = &msta_link->wcid;
+		list_del_init(&wcid->poll_list);
 		spin_unlock_bh(&dev->mt76.sta_poll_lock);
 
-		idx = msta_link->wcid.idx;
+		idx = wcid->idx;
 
 		/* refresh peer's airtime reporting */
 		addr = mt7996_mac_wtbl_lmac_addr(dev, idx, 20);
@@ -181,7 +184,7 @@ static void mt7996_mac_sta_poll(struct mt7996_dev *dev)
 			       sizeof(msta_link->airtime_ac));
 		}
 
-		if (!msta_link->wcid.sta)
+		if (!wcid->sta)
 			continue;
 
 		sta = container_of((void *)msta, struct ieee80211_sta,
@@ -207,8 +210,15 @@ static void mt7996_mac_sta_poll(struct mt7996_dev *dev)
 		rssi[2] = to_rssi(GENMASK(23, 16), val);
 		rssi[3] = to_rssi(GENMASK(31, 14), val);
 
-		msta_link->ack_signal =
-			mt76_rx_signal(msta->vif->deflink.phy->mt76->antenna_mask, rssi);
+		mlink = rcu_dereference(msta->vif->mt76.link[wcid->link_id]);
+		if (mlink) {
+			struct mt76_phy *mphy = mt76_vif_link_phy(mlink);
+
+			if (mphy)
+				msta_link->ack_signal =
+					mt76_rx_signal(mphy->antenna_mask,
+						       rssi);
+		}
 
 		ewma_avg_signal_add(&msta_link->avg_ack_signal,
 				    -msta_link->ack_signal);

-- 
2.48.1


