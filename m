Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B3EC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 11:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FBq7UjLX/xpCl4D474QvTrJ3GQfaPRtyUYEBlnHL3XE=; b=cnvshKZsvMIBMhAd/1k/4VDNnx
	RqVdJKpJcQlyJWrlC4sD8h4kLbBrSChK+P7eLki6JnZRHOzzZSR6qaUhZWvbq5oS/4m24pDEpEmn8
	79oYzSbkuJVISCYYMNtLv4+D37wzCnuyH5jiAF+yfREWSU/k8J6IqK/26JDmz1QYxrkzGtXv5ptnV
	0IGY3CFjiMNjeLdUqxfdWKlN4lgMlSqhatncH5NXA3kRnNTyJAX8CSal3bfU5q6VRr/jaQYWvHvOK
	5SsydqjWa+oQ/hC0M/4Z8uPExRJyTx2LHp7PDk/+1l1u82B6kaxZueGYVgstOD1/hMncmQfEO95dF
	SfAh8IXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKao-00000008JXM-3uUa;
	Wed, 12 Mar 2025 11:49:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsK35-00000008E4r-3wqR;
	Wed, 12 Mar 2025 11:14:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8AB0E5C4D3B;
	Wed, 12 Mar 2025 11:12:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B01F2C4CEE3;
	Wed, 12 Mar 2025 11:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741778095;
	bh=pV0wMRVJdZx0GGHAFXpYdrUB+nz6p/5vFjYGRVyVErE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hpmJEhP1hMpGXNoHcPfRkMXqjDkP5S+jvIEBCwxwau4AN0S/l+8HrDTAjiY5Twem4
	 xqOnJIUSN0Pa2H79swjZIg26CA/4RXQVH8ELKJ3mIxAq1G2xWcK5CjUQSNZKvW8yKO
	 rRleEl1gLxRD8BmSnZpDRifNIZ7tDmjIEAAUPWP5QWNY4H+4B65QXbFOWYx3gQfGpT
	 hxbPtiG01hV8Uhm8Hgfbpzprfr56An7/POl9M+4tunh/16TrGjeWKyArFzO4Ax78QB
	 dEkJulOLbxaPazj1balVbbVKfGbJsdOVt4npWzZyYN/G/rGmM74F7VVXCFhQfajyC0
	 zhBVwgtokmq4g==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 12 Mar 2025 12:14:05 +0100
Subject: [PATCH 21/21] wifi: mt76: mt7996: Update mt7996_tx to MLO support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-b4-mt7996-mlo-p2-v1-21-015b3d6fd928@kernel.org>
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
X-CRM114-CacheID: sfid-20250312_041456_040730_6B8B05CF 
X-CRM114-Status: GOOD (  11.28  )
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

Rework mt7996_tx routine in order to support multi-link
setup.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 31 +++++++++++++++---------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index adeb267b2801894590f90d02e902ebec602de98a..91c64e3a0860ff0dc5405627b23f79f4ebd1dafd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -1200,12 +1200,18 @@ static void mt7996_tx(struct ieee80211_hw *hw,
 	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
 	struct ieee80211_vif *vif = info->control.vif;
 	struct mt76_wcid *wcid = &dev->mt76.global_wcid;
+	u8 link_id = u32_get_bits(info->control.flags,
+				  IEEE80211_TX_CTRL_MLO_LINK);
+
+	rcu_read_lock();
 
 	if (vif) {
-		struct mt7996_vif *mvif;
+		struct mt7996_vif *mvif = (void *)vif->drv_priv;
+		struct mt76_vif_link *mlink;
 
-		mvif = (struct mt7996_vif *)vif->drv_priv;
-		wcid = &mvif->deflink.msta_link.wcid;
+		mlink = rcu_dereference(mvif->mt76.link[link_id]);
+		if (mlink && mlink->wcid)
+			wcid = mlink->wcid;
 
 		if (mvif->mt76.roc_phy &&
 		    (info->flags & IEEE80211_TX_CTL_TX_OFFCHAN)) {
@@ -1217,19 +1223,22 @@ static void mt7996_tx(struct ieee80211_hw *hw,
 		}
 	}
 
-	if (control->sta) {
-		struct mt7996_sta_link *msta_link;
-
-		msta_link = (struct mt7996_sta_link *)control->sta->drv_priv;
-		wcid = &msta_link->wcid;
-	}
-
 	if (!mphy) {
 		ieee80211_free_txskb(hw, skb);
-		return;
+		goto unlock;
 	}
 
+	if (control->sta) {
+		struct mt7996_sta *msta = (void *)control->sta->drv_priv;
+		struct mt7996_sta_link *msta_link;
+
+		msta_link = rcu_dereference(msta->link[link_id]);
+		if (msta_link)
+			wcid = &msta_link->wcid;
+	}
 	mt76_tx(mphy, control->sta, wcid, skb);
+unlock:
+	rcu_read_unlock();
 }
 
 static int mt7996_set_rts_threshold(struct ieee80211_hw *hw, u32 val)

-- 
2.48.1


