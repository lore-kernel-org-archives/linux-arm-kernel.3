Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B5A1F01826
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 10:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UGOQVt+7Y3D7+Y5xnzu5p9OKHgoPeIqVQqLnvEYEfGk=; b=POmiDVjHjlvFkDm1pnVF7YogGl
	3I3bkh55mh6+I/kpqHtLuf3mKa5ledrDlst7We5djCBvlfcxoiCA47mx+wzPx6oGsfATYegbIoAZf
	7HI4YY3VggTl56HJQ6h/gx0chJ1ITdqog9gO0EnvsiZSlhhbie5OlcLqlxoKrhlRKWxuIUQhhfFLG
	NTjLcjOoqpu7JRs9BQQXOMQmHo4QDyWiOPMHT0MhnleZUmaix/1xku0mmtL53LRIuUauktL3GiFdP
	hUtOiElZYRkvj8a+bvDSTMbyMiQDI20SUTHCETlBSylccyxoZUNN/s/WZFJ+bLJx7+YIxRXIg2/72
	0y0lCQIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySPv-00000003S1a-1VkV;
	Fri, 06 Mar 2026 10:28:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySPm-00000003Rvt-4B5B;
	Fri, 06 Mar 2026 10:28:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7B87744488;
	Fri,  6 Mar 2026 10:28:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 081FFC4CEF7;
	Fri,  6 Mar 2026 10:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772792894;
	bh=vtJahmgdlmSsLBAyraoFWgIJCZdL41zKKCGfsFhC39U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KhItWIQYBrQBGK9rvdDy62BEDEJ5JBax4GjKo8Rf/VSMy3V9DB0V8FwXG/END8llW
	 ngi6Lt0GeDDgZOkjTVB2les+/F4/YjEOesdhfbZmEyoXjFNVXR1U+342Y4wAyWRikk
	 lS6Xb595gPOrF1oIN653eKaLfsCAhTp8oBLlvkOMn2lV4WCTdi1PGHe8iXW0E+1Xvt
	 tBLHW3kHjddvNRj3eFndQtzrY0uYYVH67oUbyODIEGSGvxf0QmbtcTLWXomCtjh+gi
	 F+jzH/icqqOyWADJJEZYVnjTXRuLKrRk+QtMjOQSqMAnamdC3ydYh+EpEAUEUlmdv2
	 oLQtKk4jE3T2w==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 06 Mar 2026 11:27:54 +0100
Subject: [PATCH mt76 3/4] wifi: mt76: mt7996: Fix deflink lookup adding
 links
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-mt7996-deflink-lookup-link-remove-v1-3-7162b332873c@kernel.org>
References: <20260306-mt7996-deflink-lookup-link-remove-v1-0-7162b332873c@kernel.org>
In-Reply-To: <20260306-mt7996-deflink-lookup-link-remove-v1-0-7162b332873c@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_022815_062798_C0087579 
X-CRM114-Status: GOOD (  10.01  )
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

Do not set vif deflink in mt7996_vif_link_add routine if the vif txq
pointer is NULL in order to not miss the mtxq wcid field update adding
a new link with a valid vif txq pointer.

Fixes: b25fd88d7133d ("wifi: mt76: mt7996: Set mtxq->wcid just for primary link")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index e76643b8234b6323fa53f1f5958e23b5adc99c72..b659d173268981f25344be4b3176a1e7636db7a4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -365,15 +365,12 @@ int mt7996_vif_link_add(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 
 	ieee80211_iter_keys(mphy->hw, vif, mt7996_key_iter, &it);
 
-	if (!mlink->wcid->offchannel &&
+	if (vif->txq && !mlink->wcid->offchannel &&
 	    mvif->mt76.deflink_id == IEEE80211_LINK_UNSPECIFIED) {
-		if (vif->txq) {
-			struct mt76_txq *mtxq;
+		struct mt76_txq *mtxq = (struct mt76_txq *)vif->txq->drv_priv;
 
-			mtxq = (struct mt76_txq *)vif->txq->drv_priv;
-			mtxq->wcid = idx;
-		}
 		mvif->mt76.deflink_id = link_conf->link_id;
+		mtxq->wcid = idx;
 	}
 
 	return 0;

-- 
2.53.0


