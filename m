Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48221D20686
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 13:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rghx0pm+5jfzJHBsanepJHQxc9Dx1mBbxV+B31UGnBs=; b=1z9BkDdWwuXr8YYLx/N0Nj7kWI
	yxMnPvSLBsUGZMwF4psQG61Rfh4ndFYHlJ8rXdngcx0xm1CImefuqUfmgXpxxPBHf+aQqPLMMFNw+
	VvkFxRhHgwpbHkPCJRTH8t4Jrs9PPATxg6HGeUpgTdjXW4/WhPqT3eI2lbfw9kgdQw6RRoKZ8tgGN
	pSgaCaYB4g3Ds9PUfxsV0+34NSgKTRPpanrpoJcSyX/8sTZwrGQufcp7ehvSz751Rcj9P1yODXU/Y
	nn6V2mhXsPrbVMo6/BYibYAw+gDvGpGOs5v9/0Y7t3Yu3xr6hL7WmHA2qGYyRK3RWO4tNOCNIHmcn
	R/v88I3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR99e-0000000821y-1ef7;
	Thu, 04 Dec 2025 13:13:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR99b-00000008201-1hFO;
	Thu, 04 Dec 2025 13:13:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9AAB641502;
	Thu,  4 Dec 2025 13:13:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1139C4CEFB;
	Thu,  4 Dec 2025 13:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764854030;
	bh=xzqTEQWlL2osp14A8v9rgJIJ+HBndeX+dXJ6PqlMsSU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=W6a/8v+tZ1wBU7ORJU4gfxbgQSxoH7is6h7L5UXKeRinp4GFBPww6pt2tEnbwjUdu
	 QUmedV+m8MyDCjQ3dXw8taQIOL8v4et5PqJrbQZfF9qZ4BxcO9ZUZIUqezq1fM7m9N
	 DvNhsWGwiwkf8h2kyICYHgdUzSBbNOm0wFelS82XerPfwAOsmlt0ZnFMvh4+O6VDVQ
	 emy+qVeS09QrSZqZUtyeozPVvWVbpbyGsp4vRGRelgdEywjit2eq110pVMmQP+oBuX
	 KcwBLaHzyDkIL4oUzxDmuccpVXpXc9VrKVONnEm4dz0i5wUJH6BXOAR/7gpXh1HjI0
	 zcGZP2xNjFkRA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 04 Dec 2025 14:13:28 +0100
Subject: [PATCH mt76 1/3] wifi: mt76: mt7996: Set mtxq->wcid just for
 primary link
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-mt76-txq-wicd-fix-v1-1-1f4b2f2b3b2c@kernel.org>
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
X-CRM114-CacheID: sfid-20251204_051351_464759_485FB050 
X-CRM114-Status: UNSURE (   9.80  )
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

Set WCID index in mt76_txq struct just for the primary link in
mt7996_vif_link_add routine.

Fixes: 69d54ce7491d0 ("wifi: mt76: mt7996: switch to single multi-radio wiphy")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index beed795edb24c67e1b7b44fe87fd5de125a21d94..0ad0152478a7e1b11bfe5d68d750cb8332d54290 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -300,7 +300,6 @@ int mt7996_vif_link_add(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 		.cmd = SET_KEY,
 		.link_id = link_conf->link_id,
 	};
-	struct mt76_txq *mtxq;
 	int mld_idx, idx, ret;
 
 	mlink->idx = __ffs64(~dev->mt76.vif_mask);
@@ -343,11 +342,6 @@ int mt7996_vif_link_add(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 	mt7996_mac_wtbl_update(dev, idx,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
 
-	if (vif->txq) {
-		mtxq = (struct mt76_txq *)vif->txq->drv_priv;
-		mtxq->wcid = idx;
-	}
-
 	if (vif->type != NL80211_IFTYPE_AP &&
 	    (!mlink->omac_idx || mlink->omac_idx > 3))
 		vif->offload_flags = 0;
@@ -371,8 +365,15 @@ int mt7996_vif_link_add(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 	ieee80211_iter_keys(mphy->hw, vif, mt7996_key_iter, &it);
 
 	if (!mlink->wcid->offchannel &&
-	    mvif->mt76.deflink_id == IEEE80211_LINK_UNSPECIFIED)
+	    mvif->mt76.deflink_id == IEEE80211_LINK_UNSPECIFIED) {
+		if (vif->txq) {
+			struct mt76_txq *mtxq;
+
+			mtxq = (struct mt76_txq *)vif->txq->drv_priv;
+			mtxq->wcid = idx;
+		}
 		mvif->mt76.deflink_id = link_conf->link_id;
+	}
 
 	return 0;
 }

-- 
2.52.0


