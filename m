Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 146C2C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 11:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UDXBcHYBjbBx8kRimk/szEiiHIP6Zv6ulp3/ljBz3LM=; b=JUv4uvUbdBUvFiJBS5gXkdW0TB
	A1XBp+tjefFmvzIaRbUhrwPWxWwqgOddqA3wb7dDgcBuKaHKLMhb13MmMxbIdw+Ebql3MeIfJbgyu
	nYJ7IRtR+96hAb3ZUcGfAuqUxvCLKbMMhEJCXNV1nyvxKcTRHKuPzFJGUBwTPqW6PoRIdYXYQqxkw
	/w5U+qPZrD3uppckFKRCUGwaa/lUJ2+L8zQpg4zCJ7rrDT16jdi40QTP15f/1hT1UmrmPlaT8Cqry
	Ml6eYSLCPMXQwzWw7ZBkTxJyLLvlAjSZfd0nQ6vDVm1PcARJWDz8n5edC+b3VV1qyR5+sju+RruZ+
	aoz2xlHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKSy-00000008IRA-2C6p;
	Wed, 12 Mar 2025 11:41:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsK2d-00000008Dyw-1w5X;
	Wed, 12 Mar 2025 11:14:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3409B5C572E;
	Wed, 12 Mar 2025 11:12:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 593ACC4CEF1;
	Wed, 12 Mar 2025 11:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741778066;
	bh=Apq6zmVAGnuN+5hg+hrKs89pEY3E/XKyZ94bOW+pK8U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LCDPRyqYpB3mnx9KkqpNXZC1CPhFx2X+EApdNsfdCwz8qHukevl4p6JHqqNa2wHD8
	 UJl3Us0EXYFssSRv0gQNTuVFn8H9X2gSqKL3wN02qlF6j+JRJ3XdXUtBQR1+rrzqHs
	 ZPuW2U6c/Gwy+EjHEQvzwMbjnU77bEepoUO7n/sIsvKDFQoo/vyUTVmnX95HVl5VAS
	 yTDLm/jh/74lCtLRAa6C82QehfV7fPHH3HAkmnUnyxShvwZPYOfrOkvZJns+FakeDM
	 8fLawP0hpT12VwCSBcXovQzRDEz5cLremovZQyfSFa+3j1RAy/kXj5XCcS75D5of2K
	 YSj8x96qdD7Fw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 12 Mar 2025 12:13:54 +0100
Subject: [PATCH 10/21] wifi: mt76: mt7996: rework mt7996_sta_hw_queue_read
 to support MLO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-b4-mt7996-mlo-p2-v1-10-015b3d6fd928@kernel.org>
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
X-CRM114-CacheID: sfid-20250312_041427_587740_F034EF69 
X-CRM114-Status: GOOD (  11.53  )
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

Extend mt7996_sta_hw_queue_read to support multi-link setup.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7996/debugfs.c    | 54 +++++++++++++++-------
 1 file changed, 38 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c
index d453c2fc97e4fad10a29093b70e2ede8375ee0d8..4a28db17a2874078489e08ac8a038a51834b33a0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c
@@ -616,29 +616,51 @@ static void
 mt7996_sta_hw_queue_read(void *data, struct ieee80211_sta *sta)
 {
 	struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
-	struct mt7996_dev *dev = msta->vif->deflink.phy->dev;
-	struct mt7996_sta_link *msta_link = &msta->deflink;
+	struct mt7996_vif *mvif = msta->vif;
+	struct mt7996_dev *dev = mvif->deflink.phy->dev;
+	struct ieee80211_link_sta *link_sta;
 	struct seq_file *s = data;
-	u8 ac;
+	struct ieee80211_vif *vif;
+	unsigned int link_id;
 
-	for (ac = 0; ac < 4; ac++) {
-		u32 qlen, ctrl, val;
-		u32 idx = msta_link->wcid.idx >> 5;
-		u8 offs = msta_link->wcid.idx & GENMASK(4, 0);
+	vif = container_of((void *)mvif, struct ieee80211_vif, drv_priv);
+
+	rcu_read_lock();
 
-		ctrl = BIT(31) | BIT(11) | (ac << 24);
-		val = mt76_rr(dev, MT_PLE_AC_QEMPTY(ac, idx));
+	for_each_sta_active_link(vif, sta, link_sta, link_id) {
+		struct mt7996_sta_link *msta_link;
+		struct mt76_vif_link *mlink;
+		u8 ac;
 
-		if (val & BIT(offs))
+		mlink = rcu_dereference(mvif->mt76.link[link_id]);
+		if (!mlink)
 			continue;
 
-		mt76_wr(dev, MT_FL_Q0_CTRL, ctrl | msta_link->wcid.idx);
-		qlen = mt76_get_field(dev, MT_FL_Q3_CTRL,
-				      GENMASK(11, 0));
-		seq_printf(s, "\tSTA %pM wcid %d: AC%d%d queued:%d\n",
-			   sta->addr, msta_link->wcid.idx,
-			   msta->vif->deflink.mt76.wmm_idx, ac, qlen);
+		msta_link = rcu_dereference(msta->link[link_id]);
+		if (!msta_link)
+			continue;
+
+		for (ac = 0; ac < 4; ac++) {
+			u32 idx = msta_link->wcid.idx >> 5, qlen, ctrl, val;
+			u8 offs = msta_link->wcid.idx & GENMASK(4, 0);
+
+			ctrl = BIT(31) | BIT(11) | (ac << 24);
+			val = mt76_rr(dev, MT_PLE_AC_QEMPTY(ac, idx));
+
+			if (val & BIT(offs))
+				continue;
+
+			mt76_wr(dev,
+				MT_FL_Q0_CTRL, ctrl | msta_link->wcid.idx);
+			qlen = mt76_get_field(dev, MT_FL_Q3_CTRL,
+					      GENMASK(11, 0));
+			seq_printf(s, "\tSTA %pM wcid %d: AC%d%d queued:%d\n",
+				   sta->addr, msta_link->wcid.idx,
+				   mlink->wmm_idx, ac, qlen);
+		}
 	}
+
+	rcu_read_unlock();
 }
 
 static int

-- 
2.48.1


