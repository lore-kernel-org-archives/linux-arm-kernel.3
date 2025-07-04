Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D56F0C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 14:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5j+ildZKdAgbAL0LgvuikIYArGpe1jtgC3xFGYVg0vU=; b=JYt/b5/aBjrO4K41iRQ0lWM5t6
	u3nAeeyUax78x24e6V2alXaAhHvUibfI6cXDiUY99I/hzLPC0FVK6Z/rVK7KU/vJoPYS6O2qsjRJX
	C6HWtcnn28NU/7ci6FdGkpLKoqcctTd5NyCuR8NfNuoq0FXVc2TlQvYwWEiobnodDNT4YPZ+zg4GI
	zrW6Kw7ZcrNacESMw5ah6VmVeVCtaZ1b+ZrLK8lneO7l3BMgYhu9xqVpe2rpAI95FMcXw0JOs4pXO
	ZyKbrI7F5HFQ0YrUz1sdh2ByKrc2aBpWdsyiwaoTj7EjQks3FmO3C9vgaMAqt8W930qa5k46vD0NA
	C4rS864w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXhWk-0000000EgV3-0CkS;
	Fri, 04 Jul 2025 14:36:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXg9g-0000000ETKg-2FAH;
	Fri, 04 Jul 2025 13:08:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 464AB44B38;
	Fri,  4 Jul 2025 13:08:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C89E2C4CEEB;
	Fri,  4 Jul 2025 13:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751634520;
	bh=0J163NQ2g6iT1JWmoTnRElFmVhhyQWnZB3Sm6WBqxYI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kr/rEHuwj5fB0VR4i2MVTfDTBCvShkGCupuPkp6XlfLP86Rk3VavV1JjZfEX2+/E1
	 tXmIsy3NSLe/b/jS35DS4Pujb2TaarVpaGB7XM7O5EaeeNzcexzNfVRKOzdr17JlUj
	 KFIDoKGExUYNUOGEfQEswH2hu4yJS2If/SDOMbdp9ucuCwrl6vNQAsmR9VgBnuGObs
	 xvi8g/5qxkg+G4N3Q6ftibwj865HZm2EUmz5xT3xRMpJqknzwOBXoWjdDOxR5TeOOn
	 PjWwE6G/4Xdx6y68XWx4sCPe0j/jdeAUjBehaan+WSKTJjcnpTtBpcQ9iw6LMSz+DN
	 AzXELV6R8DeKA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 04 Jul 2025 15:08:10 +0200
Subject: [PATCH mt76 6/9] wifi: mt76: mt7996: Fix possible OOB access in
 mt7996_tx()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-mt7996-mlo-fixes-v1-6-356456c73f43@kernel.org>
References: <20250704-mt7996-mlo-fixes-v1-0-356456c73f43@kernel.org>
In-Reply-To: <20250704-mt7996-mlo-fixes-v1-0-356456c73f43@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bo Jiao <Bo.Jiao@mediatek.com>, Peter Chiu <chui-hao.chiu@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_060840_597014_19F76031 
X-CRM114-Status: GOOD (  12.18  )
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

Fis possible Out-Of-Boundary access in mt7996_tx routine if link_id is
set to IEEE80211_LINK_UNSPECIFIED

Fixes: 3ce8acb86b661 ("wifi: mt76: mt7996: Update mt7996_tx to MLO support")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index d1f90dea512bade652743611b7d062863a63ccfe..6404514556419f75b69a783d96b0920157263e04 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -1216,10 +1216,17 @@ static void mt7996_tx(struct ieee80211_hw *hw,
 
 	if (vif) {
 		struct mt7996_vif *mvif = (void *)vif->drv_priv;
-		struct mt76_vif_link *mlink;
+		struct mt76_vif_link *mlink = &mvif->deflink.mt76;
 
-		mlink = rcu_dereference(mvif->mt76.link[link_id]);
-		if (mlink && mlink->wcid)
+		if (link_id < IEEE80211_LINK_UNSPECIFIED)
+			mlink = rcu_dereference(mvif->mt76.link[link_id]);
+
+		if (!mlink) {
+			ieee80211_free_txskb(hw, skb);
+			goto unlock;
+		}
+
+		if (mlink->wcid)
 			wcid = mlink->wcid;
 
 		if (mvif->mt76.roc_phy &&
@@ -1228,7 +1235,7 @@ static void mt7996_tx(struct ieee80211_hw *hw,
 			if (mphy->roc_link)
 				wcid = mphy->roc_link->wcid;
 		} else {
-			mphy = mt76_vif_link_phy(&mvif->deflink.mt76);
+			mphy = mt76_vif_link_phy(mlink);
 		}
 	}
 
@@ -1237,7 +1244,7 @@ static void mt7996_tx(struct ieee80211_hw *hw,
 		goto unlock;
 	}
 
-	if (control->sta) {
+	if (control->sta && link_id < IEEE80211_LINK_UNSPECIFIED) {
 		struct mt7996_sta *msta = (void *)control->sta->drv_priv;
 		struct mt7996_sta_link *msta_link;
 

-- 
2.50.0


