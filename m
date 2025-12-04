Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F133D20683
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 13:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pjtW3xijmWQY0cu8Nfsgbpv4H+QkZRLt56au43Ou9nw=; b=sSPfSkwqoEQGmud9IdJF7lmIX5
	Y5d9IbbuJCi7ReM4LSvwASYi7UxO/moQKNaCld5yfM3Po2spCTdENLDQ51T3kfy0fEctjlfojNPSM
	0E1zwRXMJFJhJgb1V/8I81x1I9oY2qReAfjjCSjFuJdU+pZk+vQWErAv65BE/Iy4SEVoa6GemwrEt
	DSizOmz6862pCu7KyIXN+xjciCNVEM5OnESW3BJcRRrVL6ZBAqgyFAZ0SHKH1P/6iu7rN+AXOqMNh
	vPwNIApzYXJ33R90Foa7tw9ue1KwNlqwzsfL5tnRQMY/8LsyV5uF01r5LmINOjbNIQRJqcmunyGzY
	lL8hP2Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR99i-0000000825w-0KbA;
	Thu, 04 Dec 2025 13:13:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR99g-0000000823O-0A2X;
	Thu, 04 Dec 2025 13:13:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B5A9943DF5;
	Thu,  4 Dec 2025 13:13:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 436D4C113D0;
	Thu,  4 Dec 2025 13:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764854035;
	bh=RfEto5ZhzzmOQyTL3lH3OKGraSwXsCAmzi9q4NcxOKw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mO4nD5tPms/n1SRcoVWXidSmJheoCCSJ1tsCACG9A/EI4l5ea0XrTQJYCdsH5ttYG
	 GdBxptd8opD0C6A6mWbETT5G25PynSPJl+7NwRXKlE1wh1YEcrrjQuN64yseRZoSTA
	 jE8I75h5/HVBI1AWr42+BGa3Vlw5olITa5Lw3nY8HCyZcYf7LsUtK1mGkSx6EJLXtm
	 diUHbDj180YJ4SEZKIQ9VvrJi/pHTmTurGgDyulEaQgx5kM8EJT6tibdTOe7NVJxX8
	 XfHjFcoSUTjvfJ0idqQzrTgYakjRfJW5whYya0/mdfXfYEfjaQO5PKJF62M26m3oHo
	 BwmHpyCfQDM9g==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 04 Dec 2025 14:13:30 +0100
Subject: [PATCH mt76 3/3] wifi: mt76: mt7996: Switch to the secondary link
 if the default one is removed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-mt76-txq-wicd-fix-v1-3-1f4b2f2b3b2c@kernel.org>
References: <20251204-mt76-txq-wicd-fix-v1-0-1f4b2f2b3b2c@kernel.org>
In-Reply-To: <20251204-mt76-txq-wicd-fix-v1-0-1f4b2f2b3b2c@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_051356_131646_520F5C91 
X-CRM114-Status: GOOD (  14.47  )
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
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 52 ++++++++++++++++--------
 1 file changed, 36 insertions(+), 16 deletions(-)

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


