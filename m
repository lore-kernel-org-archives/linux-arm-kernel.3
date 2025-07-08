Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F20C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 07:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BFd0NVHN2FB+0DvPCwujCccN64uIQ0Qpnb6VPXSrW3E=; b=OYv252Q/69TEERioRU73LpwH0u
	8tCE3KhNuzGvVdjPkSy5fJFrbk8N4pl4XERwVUf9Emyqceqf6IiTgTlWHWVNW+TblS4rmDpx9YkxA
	pGmTerLQW1LhVrK11tNmbNGTpPU1ApjeA8d0/8Kf/aIr7yD7lcKFoA3vlJwj/i3gUPuFn/ky8G91V
	KP0nEBlTUIPNucWM/IVuWziovniDZ2B+qyhv0QuBq7pPNXX+xGXUjh+/nAzJqm1Zj7nAR5nAU5rgs
	YLFSyps9xM8ADvaxI5Vz505J3x4dJLZDk2fKTqpDmdpHb6ahsJSO+owtzA5RuSvXht4soKm/M/OC6
	5v2J0ljg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ2Zn-00000004Yf2-3BiQ;
	Tue, 08 Jul 2025 07:17:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ2VC-00000004YEB-3Qwo;
	Tue, 08 Jul 2025 07:12:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4357C61465;
	Tue,  8 Jul 2025 07:12:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B28BC4CEED;
	Tue,  8 Jul 2025 07:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751958750;
	bh=SzEkAx2UZEVxCVcrkwBEfVoThhQdgL+QBqoVgAMyHC8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=npWx24+zEocZSkBx5yc5LFW1AegC30qV94/npSxPM7n5HbuFHtI/e/JBt3I2VGLMS
	 vHQ7bc8y39hzCG6l34Xl0hJpJPSygXJnC6bjvMrWsrsSz3z+IeBO8nCbf6BRMouo9g
	 6LcjWRRXm6xWcVvfcScve0Y8PTktbu5GLWYOLdAanehg5SAJmPp2Jg0732ZgDpWlud
	 e8mBZ/9g1XO6hvaKOfQaPkhtD9Gb3c7T1ns1GBybE2Jw4VtDMzrTPdpE+m3TTBvGbM
	 XrcR+786aPW7/tfb/TCSiCgQe9WYcypElh/aeisqpRvUAc4Oy9a73YzLlbCu7yiYka
	 LzTLTHcfElnkw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 08 Jul 2025 09:12:04 +0200
Subject: [PATCH mt76 1/2] wifi: mt76: mt7996: Overwrite unspecified link_id
 in mt7996_tx()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-mt7996-mlo-fixes-v2-v1-1-f2682818a8a3@kernel.org>
References: <20250708-mt7996-mlo-fixes-v2-v1-0-f2682818a8a3@kernel.org>
In-Reply-To: <20250708-mt7996-mlo-fixes-v2-v1-0-f2682818a8a3@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Peter Chiu <chui-hao.chiu@mediatek.com>, 
 Money Wang <Money.Wang@mediatek.com>, 
 Evelyn Tsai <evelyn.tsai@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 MeiChia Chiu <meichia.chiu@mediatek.com>, 
 Howard Hsu <howard-yh.hsu@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, 
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

Set link_id to msta or mvif primary value if it is set to
IEEE80211_LINK_UNSPECIFIED by mac80211 in mt7996_tx routine.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 26 ++++++++++++++++--------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index f846b8309ae2e9c39f9d5f2a21ca1edd89dcdf0c..03ec3edc9a632390cb6d86d75b2e65a302a9a372 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -1217,21 +1217,30 @@ static void mt7996_tx(struct ieee80211_hw *hw,
 	struct mt76_wcid *wcid = &dev->mt76.global_wcid;
 	u8 link_id = u32_get_bits(info->control.flags,
 				  IEEE80211_TX_CTRL_MLO_LINK);
+	struct mt7996_sta *msta;
+	struct mt7996_vif *mvif;
 
 	rcu_read_lock();
 
-	if (vif) {
-		struct mt7996_vif *mvif = (void *)vif->drv_priv;
+	msta = control->sta ? (void *)control->sta->drv_priv : NULL;
+	mvif = vif ? (void *)vif->drv_priv : NULL;
+
+	/* Use primary link_id if the value from mac80211 is set to
+	 * IEEE80211_LINK_UNSPECIFIED.
+	 */
+	if (link_id == IEEE80211_LINK_UNSPECIFIED) {
+		if (msta)
+			link_id = msta->deflink_id;
+		else if (mvif)
+			link_id = mvif->mt76.deflink_id;
+	}
+
+	if (mvif) {
 		struct mt76_vif_link *mlink = &mvif->deflink.mt76;
 
 		if (link_id < IEEE80211_LINK_UNSPECIFIED)
 			mlink = rcu_dereference(mvif->mt76.link[link_id]);
 
-		if (!mlink) {
-			ieee80211_free_txskb(hw, skb);
-			goto unlock;
-		}
-
 		if (mlink->wcid)
 			wcid = mlink->wcid;
 
@@ -1250,8 +1259,7 @@ static void mt7996_tx(struct ieee80211_hw *hw,
 		goto unlock;
 	}
 
-	if (control->sta && link_id < IEEE80211_LINK_UNSPECIFIED) {
-		struct mt7996_sta *msta = (void *)control->sta->drv_priv;
+	if (msta && link_id < IEEE80211_LINK_UNSPECIFIED) {
 		struct mt7996_sta_link *msta_link;
 
 		msta_link = rcu_dereference(msta->link[link_id]);

-- 
2.50.0


