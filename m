Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF561C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 11:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3F+TWyR8dDheU8NnxXwe5Wz+/9Mx7JCqjIuMynKbPvI=; b=P0v1oYRJi3h1557ApdWd5uzmX5
	tscp3e4s80TmZXvRQEQ76FwNkLlv3bOs4eSleIdazwuvm/XmR8ZqxdFPb1Rkw8e6Ou7Gfpi/ntsVi
	iZb+8rxl3a3UZlal9RsSTdfpccFAg8cEi2WKLy/P/lM1KQYzv3cUvvXramYncYZ83nTpED4Dv6qtA
	t13VmWaZIhK2BPCj6P4iyAIL9UdM9mzazTP0GdtAZUdwwm+pv3171q3MgJ/ZJx5+rDNhu2VSxRMWW
	CC1si6a5jr0kSeEoPuXNYnoZUkkBFQFwi0XMLKDoPNsIAtk1CY6Ay8gyp5zve2BcR5t7Rv+ZNqoxP
	Nk11I9NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN8rH-0000000FN19-1Mxi;
	Thu, 05 Jun 2025 11:34:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN8cH-0000000FLWm-2949;
	Thu, 05 Jun 2025 11:18:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E9430629C8;
	Thu,  5 Jun 2025 11:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45E00C4CEE7;
	Thu,  5 Jun 2025 11:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749122316;
	bh=BxVJrLzkppVqibFuXB/8/X3glUbvHD6lsDPdbsmwtOE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=R7Z20CzkBfM9mtDSOuq6/r0NFGYA4Iqzhxg6sJGGX4TGa70R/J97XM+5zYs3zBjnb
	 OQzc0pBRw1hfSSQyeiUQ1i6WyXetn82zw5cS5AaJYBquB+54Tl78aim7WEL1+cXDcv
	 pPN/mfnGNV6nVSH7132+GLKq3ILV1U/cPF/zuUNzSEsxA6BWBnxDFr3HlX6Iepq63m
	 8awXuprR9Yamb51bXy9nHSoOBKcXaSSZNTB02WOu5BPO11ear8e1kcrs0HzZXyFgar
	 vmc+haivPCNsiZSi6r7u1/i/GQ/A7IKATQ1E0whAY2LB/AvKGuSC2xGF3+g8Py06L9
	 xGsfOS12YXUAg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 05 Jun 2025 13:14:20 +0200
Subject: [PATCH mt76 5/5] wifi: mt76: Remove RCU section in
 mt7996_mac_sta_rc_work()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-mt7996-sleep-while-atomic-v1-5-d46d15f9203c@kernel.org>
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

Since mt7996_mcu_add_rate_ctrl() and mt7996_mcu_set_fixed_field() can't
run in atomic context, move RCU critical section in
mt7996_mcu_add_rate_ctrl() and mt7996_mcu_set_fixed_field(). This patch
fixes a 'sleep while atomic' issue in mt7996_mac_sta_rc_work().

Fixes: 0762bdd30279 ("wifi: mt76: mt7996: rework mt7996_mac_sta_rc_work to support MLO")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 38 +++++--------------------
 1 file changed, 7 insertions(+), 31 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 5561b1098e3fb0d25551fde3cfdb3057217395fd..445fe149ac0d7e194497a2dc884a599b9546c9ef 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -2353,20 +2353,12 @@ void mt7996_mac_update_stats(struct mt7996_phy *phy)
 void mt7996_mac_sta_rc_work(struct work_struct *work)
 {
 	struct mt7996_dev *dev = container_of(work, struct mt7996_dev, rc_work);
-	struct ieee80211_bss_conf *link_conf;
-	struct ieee80211_link_sta *link_sta;
 	struct mt7996_sta_link *msta_link;
-	struct mt7996_vif_link *link;
-	struct mt76_vif_link *mlink;
-	struct ieee80211_sta *sta;
 	struct ieee80211_vif *vif;
-	struct mt7996_sta *msta;
 	struct mt7996_vif *mvif;
 	LIST_HEAD(list);
 	u32 changed;
-	u8 link_id;
 
-	rcu_read_lock();
 	spin_lock_bh(&dev->mt76.sta_poll_lock);
 	list_splice_init(&dev->sta_rc_list, &list);
 
@@ -2377,44 +2369,28 @@ void mt7996_mac_sta_rc_work(struct work_struct *work)
 
 		changed = msta_link->changed;
 		msta_link->changed = 0;
-
-		sta = wcid_to_sta(&msta_link->wcid);
-		link_id = msta_link->wcid.link_id;
-		msta = msta_link->sta;
-		mvif = msta->vif;
-		vif = container_of((void *)mvif, struct ieee80211_vif, drv_priv);
-
-		mlink = rcu_dereference(mvif->mt76.link[link_id]);
-		if (!mlink)
-			continue;
-
-		link_sta = rcu_dereference(sta->link[link_id]);
-		if (!link_sta)
-			continue;
-
-		link_conf = rcu_dereference(vif->link_conf[link_id]);
-		if (!link_conf)
-			continue;
+		mvif = msta_link->sta->vif;
+		vif = container_of((void *)mvif, struct ieee80211_vif,
+				   drv_priv);
 
 		spin_unlock_bh(&dev->mt76.sta_poll_lock);
 
-		link = (struct mt7996_vif_link *)mlink;
-
 		if (changed & (IEEE80211_RC_SUPP_RATES_CHANGED |
 			       IEEE80211_RC_NSS_CHANGED |
 			       IEEE80211_RC_BW_CHANGED))
 			mt7996_mcu_add_rate_ctrl(dev, msta_link->sta, vif,
-						 link_id, true);
+						 msta_link->wcid.link_id,
+						 true);
 
 		if (changed & IEEE80211_RC_SMPS_CHANGED)
-			mt7996_mcu_set_fixed_field(dev, msta, NULL, link_id,
+			mt7996_mcu_set_fixed_field(dev, msta_link->sta, NULL,
+						   msta_link->wcid.link_id,
 						   RATE_PARAM_MMPS_UPDATE);
 
 		spin_lock_bh(&dev->mt76.sta_poll_lock);
 	}
 
 	spin_unlock_bh(&dev->mt76.sta_poll_lock);
-	rcu_read_unlock();
 }
 
 void mt7996_mac_work(struct work_struct *work)

-- 
2.49.0


