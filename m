Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C7AF01825
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 10:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2kqrj/2c0zv+1NCTSq2/VHk7jhBs1mvGg+SzX49antA=; b=dE7ePGyQjx3VWFlFC2mmFi6W68
	4Hi7w4Wz/cF97IydU7trIrTPempCtk5/B0I3Ww4fCTfzKbyiN4h6NOmkxPr0N2SVhvMVYpcMLIwDf
	Og0D3fNFseFP29UKXZbL3gheBpBy9FRUl9P8P8s/XAbFSkAeHwoAGu6+PG0+oM4Yqd+cVMHB5pOFE
	GYfJatSdIXwr6UNDF3KkSvCAjYbWhLRAYzCQAxOakhbkt0/SR3pLncD2Fos/IP4m2DmYSJg+Rz8zS
	1F/pc78AAqcs59Vo33HhUnccL2JrorsODe6OPMP37OAzCg18PAfJxmATUNG7N//cS+7YL7AQlZLyj
	btwu4LLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySPn-00000003RwF-1vNf;
	Fri, 06 Mar 2026 10:28:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySPk-00000003RvE-2xfV;
	Fri, 06 Mar 2026 10:28:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 28CAE60018;
	Fri,  6 Mar 2026 10:28:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FE11C2BCB1;
	Fri,  6 Mar 2026 10:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772792891;
	bh=UX9LotaCII1gNgWF6VT0FK2LBe6LuscZygpKe1U4P9o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jtfEIRU+Oa7aPZpI2yKHto/RoaDuZe+on+y4m2sd0FwoxdLGYbK+YXCZz9pNKoSvA
	 E6qGiW44VjTiwvxFmbvFbaJ7FV4n73HLdUb7SFAgSvScN3uTMTRTjk6esBuElpWqbH
	 x/dSftm+owyRqjZMLC4MhqyEBVaz8SUs9S4PMqPW7EiXJJYkPyT9XGs6tjhrUuKfF8
	 lnG5FtGtpKMMaPYfMv1hqDeR3pXFzUOzfnE/qSQlDVUO9/X3VWSjAS9AZSUUWZVyWH
	 aKbuX/sHlVKoFYPm3pn/PxmsOyhzKNqaQLHkvFludMHpScx3YJjY4t87wdG3LFrruU
	 GmFWLENw4aKWw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 06 Mar 2026 11:27:53 +0100
Subject: [PATCH mt76 2/4] wifi: mt76: mt7996: Fix deflink lookup removing
 links
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-mt7996-deflink-lookup-link-remove-v1-2-7162b332873c@kernel.org>
References: <20260306-mt7996-deflink-lookup-link-remove-v1-0-7162b332873c@kernel.org>
In-Reply-To: <20260306-mt7996-deflink-lookup-link-remove-v1-0-7162b332873c@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
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

Do not set vif deflink in mt7996_vif_link_remove routine if the vif txq
pointer is NULL in order to not miss the mtxq wcid field update adding
a new link with a valid vif txq pointer.

Fixes: 2e6bdd40e1d01 ("wifi: mt76: mt7996: Reset mtxq->idx if primary link is removed in mt7996_vif_link_remove()")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 8b1924778cbd6a5f6a516a689a379fb715cc3097..e76643b8234b6323fa53f1f5958e23b5adc99c72 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -405,26 +405,26 @@ void mt7996_vif_link_remove(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 
 	rcu_assign_pointer(dev->mt76.wcid[idx], NULL);
 
-	if (!mlink->wcid->offchannel &&
+	if (vif->txq && !mlink->wcid->offchannel &&
 	    mvif->mt76.deflink_id == link_conf->link_id) {
 		struct ieee80211_bss_conf *iter;
+		struct mt76_txq *mtxq;
 		unsigned int link_id;
 
-		/* Primary link will be removed, look for a new one */
 		mvif->mt76.deflink_id = IEEE80211_LINK_UNSPECIFIED;
+		mtxq = (struct mt76_txq *)vif->txq->drv_priv;
+		/* Primary link will be removed, look for a new one */
 		for_each_vif_active_link(vif, iter, link_id) {
 			struct mt7996_vif_link *link;
 
+			if (link_id == link_conf->link_id)
+				continue;
+
 			link = mt7996_vif_link(dev, vif, link_id);
 			if (!link)
 				continue;
 
-			if (vif->txq) {
-				struct mt76_txq *mtxq;
-
-				mtxq = (struct mt76_txq *)vif->txq->drv_priv;
-				mtxq->wcid = link->msta_link.wcid.idx;
-			}
+			mtxq->wcid = link->msta_link.wcid.idx;
 			mvif->mt76.deflink_id = link_id;
 			break;
 		}

-- 
2.53.0


