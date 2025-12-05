Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD0E0D2F7D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 10:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DGlyFnhax/0lJ9NW1lMd7M3eZsgCmemW5ZXycdeu5zY=; b=u2hD9VCrR7J1D7pAdUmAPTbpQz
	nwNZhaBCgy8Lf/BMQKChHSJ8I0YgtzhNT1JLXM8kbZHlGSKkkNGu7/DZ9BmO0JsG7uS0UTPqCilnh
	DY85QHA9lWG5nE+Ozr0hB70EXh1t/0x1Maqc6yl5YIS648wCj9Igac3smisLdcC0oXYmq5T91oXb1
	mCXaKJnxENBK8c6FFBEOf/Q0nezRhAyjohtvfMm+/cwTNkKFQDM8nENGDd4HUjcOl6GmGXiP1vU0f
	oLLEk3TrMboVxJxx0PE6FKfitFAqhCBIaI3wDQbC/PEgYF01gy7uLGgFd1ydICV/gi0ohBTR4vpM8
	+Qoq32zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRSzq-00000009Nmm-3DPd;
	Fri, 05 Dec 2025 10:25:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRSzp-00000009Nkw-0288;
	Fri, 05 Dec 2025 10:25:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1E0B460207;
	Fri,  5 Dec 2025 10:25:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71919C19421;
	Fri,  5 Dec 2025 10:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764930303;
	bh=RxDYsuEIekiV39gylaVg9STJS5tjppkkI1OwqwKaIdY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=P7jOPs6JUDN6dCCsJryXrpTqAVNb0kz30r/+b1OXAGYq3wHxhFUI/Qew8O0rJGYyn
	 RseoeBUY7kI4nkGAkGv/yysky/OEvZ83kBR4wyg5foFYXoszwsCRR1sZ4ZsfCes9MT
	 xBwCenuTOo+KUHaqHh6QiDXfeu4vdSVzFTqJOB3jAYNLtsQaw/jKY/EjErmmmD9fSZ
	 DRFmqDgBAv0cZ7oCZYwxlu5lIPs7XpX1YQIJeDl9v8XIMZO8mNsvdoSR7hP0LBYVD3
	 3imcJFAS7RMPMvUVCoXJIUUSLcX45ueZB7wlu6Q+OgBbHuQy3me9QzRiJwmxgS+fwq
	 VWfIMPBarG3IQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 05 Dec 2025 11:24:38 +0100
Subject: [PATCH mt76 v2 3/4] wifi: mt76: mt7996: Switch to the secondary
 link if the default one is removed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-mt76-txq-wicd-fix-v2-3-f19ba48af7c1@kernel.org>
References: <20251205-mt76-txq-wicd-fix-v2-0-f19ba48af7c1@kernel.org>
In-Reply-To: <20251205-mt76-txq-wicd-fix-v2-0-f19ba48af7c1@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Bo Jiao <Bo.Jiao@mediatek.com>, 
 Peter Chiu <chui-hao.chiu@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
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

Switch to the secondary link if available in mt7996_mac_sta_remove_links
routine if the primary one is removed.
Moreover reset secondary link index for single link scenario.

Fixes: 85cd5534a3f2e ("wifi: mt76: mt7996: use correct link_id when filling TXD and TXP")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c  | 12 +++---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 52 ++++++++++++++++--------
 2 files changed, 41 insertions(+), 23 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 2560e2f46e89a4bc46e21d796fca80b7decefa5c..4d33265971e2e00c788541a5c780dc20619e7396 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -2403,14 +2403,12 @@ mt7996_mac_reset_sta_iter(void *data, struct ieee80211_sta *sta)
 			continue;
 
 		mt7996_mac_sta_deinit_link(dev, msta_link);
-
-		if (msta->deflink_id == i) {
-			msta->deflink_id = IEEE80211_LINK_UNSPECIFIED;
-			continue;
-		}
-
-		kfree_rcu(msta_link, rcu_head);
+		if (msta_link != &msta->deflink)
+			kfree_rcu(msta_link, rcu_head);
 	}
+
+	msta->deflink_id = IEEE80211_LINK_UNSPECIFIED;
+	msta->seclink_id = msta->deflink_id;
 }
 
 static void
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 8bf85a9beee7dc8c6741568af5b36cf89f0c1a88..1baace971ec3511dba3e8a64c236a2b55f9dbd36 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -945,6 +945,22 @@ mt7996_channel_switch_beacon(struct ieee80211_hw *hw,
 	mutex_unlock(&dev->mt76.mutex);
 }
 
+static void
+mt7996_sta_init_txq_wcid(struct ieee80211_sta *sta, int idx)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(sta->txq); i++) {
+		struct mt76_txq *mtxq;
+
+		if (!sta->txq[i])
+			continue;
+
+		mtxq = (struct mt76_txq *)sta->txq[i]->drv_priv;
+		mtxq->wcid = idx;
+	}
+}
+
 static int
 mt7996_mac_sta_init_link(struct mt7996_dev *dev,
 			 struct ieee80211_bss_conf *link_conf,
@@ -962,21 +978,10 @@ mt7996_mac_sta_init_link(struct mt7996_dev *dev,
 		return -ENOSPC;
 
 	if (msta->deflink_id == IEEE80211_LINK_UNSPECIFIED) {
-		int i;
-
 		msta_link = &msta->deflink;
 		msta->deflink_id = link_id;
 		msta->seclink_id = msta->deflink_id;
-
-		for (i = 0; i < ARRAY_SIZE(sta->txq); i++) {
-			struct mt76_txq *mtxq;
-
-			if (!sta->txq[i])
-				continue;
-
-			mtxq = (struct mt76_txq *)sta->txq[i]->drv_priv;
-			mtxq->wcid = idx;
-		}
+		mt7996_sta_init_txq_wcid(sta, idx);
 	} else {
 		msta_link = kzalloc(sizeof(*msta_link), GFP_KERNEL);
 		if (!msta_link)
@@ -1058,13 +1063,28 @@ mt7996_mac_sta_remove_links(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 
 		mphy->num_sta--;
 		if (msta->deflink_id == link_id) {
-			msta->deflink_id = IEEE80211_LINK_UNSPECIFIED;
-			continue;
+			if (msta->seclink_id == msta->deflink_id) {
+				/* no secondary link available */
+				msta->deflink_id = IEEE80211_LINK_UNSPECIFIED;
+				msta->seclink_id = msta->deflink_id;
+			} else {
+				struct mt7996_sta_link *msta_seclink;
+
+				/* switch to the secondary link */
+				msta->deflink_id = msta->seclink_id;
+				msta_seclink = mt76_dereference(
+						msta->link[msta->seclink_id],
+						mdev);
+				if (msta_seclink)
+					mt7996_sta_init_txq_wcid(sta,
+						msta_seclink->wcid.idx);
+			}
 		} else if (msta->seclink_id == link_id) {
-			msta->seclink_id = IEEE80211_LINK_UNSPECIFIED;
+			msta->seclink_id = msta->deflink_id;
 		}
 
-		kfree_rcu(msta_link, rcu_head);
+		if (msta_link != &msta->deflink)
+			kfree_rcu(msta_link, rcu_head);
 	}
 }
 

-- 
2.52.0


