Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DFE4D58B1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Mar 2026 10:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MlzBdqWq62Wnh6f8NfbgJRH+0MZCqGQuarTk1uk25WE=; b=DVtQWe5iXzJQld6PGkZOm3zzoP
	DJDtkI0M1CHVg0Mu3A46K655rMfBch88t4/P/Paz3MpR1NboT18/xM5IZtck1ehFQ8GQaOPInRInI
	ISkxJ/KBHWw8XmGN5K/rlDQ1ViWtMjDYKqMV4arWtzy5aVCLmo0/dLvpY0BnqVFmUMd1YJL0QutdV
	klWlWZR65yrebAtxHCR4UY0sKG7afU0a8zxm2sNyLWhicF/QQl6OTOhs//uanFDvvRb6ldguMMSDe
	yht3TFMCIy9JzzeFm2UbBbQg79leNF9SLQ+ZPkeQZt4gAb6E6DsMAMXGDwUcmS3XdI2BC3VgNh242
	O/fCUNmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1igo-00000002XQ2-1goN;
	Sun, 15 Mar 2026 10:27:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1ign-00000002XPS-1FVO;
	Sun, 15 Mar 2026 10:27:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B589860018;
	Sun, 15 Mar 2026 10:27:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16BA3C2BC9E;
	Sun, 15 Mar 2026 10:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773570436;
	bh=F+PGCaeu94wkXm0/Jhhmcj95zbnwqbnLVrkRX5Zg6Q0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GznWEAomdnMu1fJPW3iRbpXgKfryRc7LAXNPLr700OxSlqEzouYO5/nZo4/Ifek+F
	 oMW3IWolBe5wms/sO4hxNUaXA3cefzq2FtQv1LzebC33yiXAVeSO+QWz406Jo4lUPm
	 Fn2Ir+g8PXJDI86qPzqik/R4S0xW2AqqUQs8R4lYnmxjf/0fUJgvdm1QSBEE5CuRJo
	 5IOUpNLaXjqHpjRSCVCKgS+t3Dw70UTQIOvoTGIUkjSuVehStQfpzWNbOdMWukeCFy
	 lw4lhNtCUTivcFMxxAj5jYGIpes3XMm4JWFKhLiI5+3MV1qMsKW5H0YJuDWgpQ003k
	 KuFtGCSi1G55Q==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 15 Mar 2026 11:26:25 +0100
Subject: [PATCH mt76 2/6] wifi: mt76: mt7996: Account active links in
 valid_links fields
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260315-mt7996-mlo-link-reconf-v1-2-a8a634fbc927@kernel.org>
References: <20260315-mt7996-mlo-link-reconf-v1-0-a8a634fbc927@kernel.org>
In-Reply-To: <20260315-mt7996-mlo-link-reconf-v1-0-a8a634fbc927@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
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

From: Shayne Chen <shayne.chen@mediatek.com>

Track active vif links in mt7996_vif_link_add and mt7996_vif_link_remove
routines.
This is a preliminary patch in order to remove AP MLD links from MCU
configuration during AP tear-down process and to support MLO link
reconfiguration in MT7996 driver.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 52 +++++++++++++-----------
 1 file changed, 29 insertions(+), 23 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 21a240f0c8c275b9fb5532ff74bbf76b741dac84..07a266f7670c1d6b050e3790ce91cba014b18eab 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -367,12 +367,16 @@ int mt7996_vif_link_add(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 
 	ieee80211_iter_keys(mphy->hw, vif, mt7996_key_iter, &it);
 
-	if (vif->txq && !mlink->wcid->offchannel &&
-	    mvif->mt76.deflink_id == IEEE80211_LINK_UNSPECIFIED) {
-		struct mt76_txq *mtxq = (struct mt76_txq *)vif->txq->drv_priv;
-
-		mvif->mt76.deflink_id = link_conf->link_id;
-		mtxq->wcid = idx;
+	if (!mlink->wcid->offchannel) {
+		if (vif->txq &&
+		    mvif->mt76.deflink_id == IEEE80211_LINK_UNSPECIFIED) {
+			struct mt76_txq *mtxq;
+
+			mtxq = (struct mt76_txq *)vif->txq->drv_priv;
+			mvif->mt76.deflink_id = link_conf->link_id;
+			mtxq->wcid = idx;
+		}
+		mvif->mt76.valid_links |= BIT(link_conf->link_id);
 	}
 
 	if (vif->type == NL80211_IFTYPE_STATION) {
@@ -419,28 +423,30 @@ void mt7996_vif_link_remove(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 
 	rcu_assign_pointer(dev->mt76.wcid[idx], NULL);
 
-	if (vif->txq && !mlink->wcid->offchannel &&
-	    mvif->mt76.deflink_id == link_id) {
-		struct ieee80211_bss_conf *iter;
-		struct mt76_txq *mtxq;
+	if (!mlink->wcid->offchannel) {
+		if (vif->txq && mvif->mt76.deflink_id == link_id) {
+			struct ieee80211_bss_conf *iter;
+			struct mt76_txq *mtxq;
 
-		mvif->mt76.deflink_id = IEEE80211_LINK_UNSPECIFIED;
-		mtxq = (struct mt76_txq *)vif->txq->drv_priv;
-		/* Primary link will be removed, look for a new one */
-		for_each_vif_active_link(vif, iter, link_id) {
-			struct mt7996_vif_link *link;
+			mvif->mt76.deflink_id = IEEE80211_LINK_UNSPECIFIED;
+			mtxq = (struct mt76_txq *)vif->txq->drv_priv;
+			/* Primary link will be removed, look for a new one */
+			for_each_vif_active_link(vif, iter, link_id) {
+				struct mt7996_vif_link *link;
 
-			if (link_id == msta_link->wcid.link_id)
-				continue;
+				if (link_id == msta_link->wcid.link_id)
+					continue;
 
-			link = mt7996_vif_link(dev, vif, link_id);
-			if (!link)
-				continue;
+				link = mt7996_vif_link(dev, vif, link_id);
+				if (!link)
+					continue;
 
-			mtxq->wcid = link->msta_link.wcid.idx;
-			mvif->mt76.deflink_id = link_id;
-			break;
+				mtxq->wcid = link->msta_link.wcid.idx;
+				mvif->mt76.deflink_id = link_id;
+				break;
+			}
 		}
+		mvif->mt76.valid_links &= ~BIT(link_id);
 	}
 
 	dev->mt76.vif_mask &= ~BIT_ULL(mlink->idx);

-- 
2.53.0


