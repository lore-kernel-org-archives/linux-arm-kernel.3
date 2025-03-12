Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5208DC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 12:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hjAEADWfmKF8gQirozfCar9u+udL92slADeywACigXw=; b=D7T7trIpUZDBMdu2Xfjh/9zbaa
	6VGA00rYcoPDUnUn/t/d8unwVAo2ex4u3XTWcPLg92s499KKXxY8TCuIBfdf5GJdStHXU3jVY82SB
	eJUuljjq6NRIrwpP95w5ElFlP3fXVIynDJfvgimCEFT8+QIeaRQxTLiXmsIGhBlxScd94MLoLBSKF
	SPVfZROrleQCOoYONYQ4b4am5eT471S7qEpHFR+vEYAdL4pCBgkfyJvYVreEAw2JkgluO2uq7xyYl
	ei0hrYULP3imB7dgbZRV382aMh37FWYIzIawhcwpOLJEeoM7u0Z7V2XRv+YWtlyCMxkX7H4d+aQxh
	EXZW0m+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKr3-00000008MC7-2g1j;
	Wed, 12 Mar 2025 12:06:33 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsK2q-00000008E1h-3OkE;
	Wed, 12 Mar 2025 11:14:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 13389A47073;
	Wed, 12 Mar 2025 11:09:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56206C4CEE3;
	Wed, 12 Mar 2025 11:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741778079;
	bh=1rwqsZtektxFVVacUfzb8PV3XP4ZDGN9CBCejSLdGXc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FYR7/iW7zBYxnPVIjw9SP9/GFCYEpDuRVe9/jHNW4Q/RhKVUWY5nBtvTHteyRFnhA
	 57vCXWZ4HbHqdGHWUce6Ow7EubbYPU7Y/wPq/p3kOs2YQKyRoOqc6B9T4VyKVdcGEG
	 Q0s5B9itsy7jPhIlVs9+UeIhGow+uxT5B3FZGCPJg9avVf6kCwnSMLPDcYMeCIiTLW
	 1JoRD8HMdhcKQHqlY0qz8F6uLvPR/LIWi8J0lnT2L0E+lkkbTAOOohfJSHay/5aH1b
	 VjYSaCmxuc1sVyMpwJSv2Rn67kEOpVmsgTBksKZHuBIvkKhQeELkAvPrTQh24mMboY
	 GcntkwWxLMSDQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 12 Mar 2025 12:13:59 +0100
Subject: [PATCH 15/21] wifi: mt76: mt7996: rework
 mt7996_net_fill_forward_path to support MLO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-b4-mt7996-mlo-p2-v1-15-015b3d6fd928@kernel.org>
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
X-CRM114-CacheID: sfid-20250312_041440_924515_BAB35012 
X-CRM114-Status: GOOD (  10.80  )
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

Rework mt7996_net_fill_forward_path routine in order to support multi-link
setup.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 2bf6453975ae584b2ab7cc9a46cc80ad7d73d05d..4a33979ee8535303fa3d09ec4500546d26f700eb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -1973,13 +1973,26 @@ mt7996_net_fill_forward_path(struct ieee80211_hw *hw,
 {
 	struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
 	struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
-	struct mt7996_sta_link *msta_link = &msta->deflink;
-	struct mt7996_vif_link *mlink = &mvif->deflink;
 	struct mt7996_dev *dev = mt7996_hw_dev(hw);
 	struct mtk_wed_device *wed = &dev->mt76.mmio.wed;
+	struct mt7996_sta_link *msta_link;
+	struct mt7996_vif_link *link;
+	struct mt76_vif_link *mlink;
 	struct mt7996_phy *phy;
 
-	phy = mt7996_vif_link_phy(mlink);
+	mlink = rcu_dereference(mvif->mt76.link[msta->deflink_id]);
+	if (!mlink)
+		return -EIO;
+
+	msta_link = rcu_dereference(msta->link[msta->deflink_id]);
+	if (!msta_link)
+		return -EIO;
+
+	if (!msta_link->wcid.sta || msta_link->wcid.idx > MT7996_WTBL_STA)
+		return -EIO;
+
+	link = (struct mt7996_vif_link *)mlink;
+	phy = mt7996_vif_link_phy(link);
 	if (!phy)
 		return -ENODEV;
 
@@ -1989,13 +2002,10 @@ mt7996_net_fill_forward_path(struct ieee80211_hw *hw,
 	if (!mtk_wed_device_active(wed))
 		return -ENODEV;
 
-	if (!msta_link->wcid.sta || msta_link->wcid.idx > MT7996_WTBL_STA)
-		return -EIO;
-
 	path->type = DEV_PATH_MTK_WDMA;
 	path->dev = ctx->dev;
 	path->mtk_wdma.wdma_idx = wed->wdma_idx;
-	path->mtk_wdma.bss = mvif->deflink.mt76.idx;
+	path->mtk_wdma.bss = mlink->idx;
 	path->mtk_wdma.queue = 0;
 	path->mtk_wdma.wcid = msta_link->wcid.idx;
 

-- 
2.48.1


