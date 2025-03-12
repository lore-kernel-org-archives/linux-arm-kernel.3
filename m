Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D531C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 12:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fVm/D280GJEYENNPlv6whCksWJdmpr5CYr/oEEx4lPI=; b=sZ2GCliHZ9jyXB26pzVayTxzAI
	XmzGMBYKEqoKl3nb7xHMaEAt5tMb1g2ykPTfiJ9kTGxkJD3VEzSTGiLOCifgNYuAFPWz7jMj2YtqN
	7m7SiRs1alOFjjrijZfymN7HMWI7MpHZR+9klqOJmGVb2Ex5xJ/xNkoqYdjFcLeHNumIozbkvmTIJ
	36WIjjrsPG27+yiHOEpltjzgURmYXBPrR27vxW4/LLrGFIQ6Gt6GdpCLCBLTqw4wVZ/02A7kdnt11
	t/lE0RJZXDXP/pSpsgIg5DTwO3OC4K1fafbuJjHCY46uv9ib9H3LDjCK6oOkZe2KIoNoqV6H9td5G
	Wqrgz0zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLXp-00000008Spn-2Gip;
	Wed, 12 Mar 2025 12:50:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsK2y-00000008E2s-0TDS;
	Wed, 12 Mar 2025 11:14:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CE3305C545B;
	Wed, 12 Mar 2025 11:12:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F04B2C4CEE3;
	Wed, 12 Mar 2025 11:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741778087;
	bh=4ZaNPtKmjehzI82M7KLgZa7FjF1q/x0G0f5lQ/Nm54w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VC+TH0LI7DoJxVsbEomdR9CDlxCi3ukZUEs+F3MY9l5s4IxdsrvBkmXxEMa+l7ckA
	 L7QY+MwkGORAu2kbffdbwd/AHDR/CGO/kQ71A+30QfVaTlGwqkGcALQ5Vm1vTdAduc
	 Tq8oeM4e5dgk/2E3VTsyGC9VHJTGGAtbDVjlQiErZe9vyBmpCA4bW/x+YWXys8HEpy
	 oxu342EZCyiWVaQ8oOWmv6mnLo6YUhC5+qqzHGXdska4HjyqO8WyrjlkJZv2uvwH7N
	 gnNUisWlvhlzuAn/Fcx0D/egbBtNE6wH+15ahHqw3KV5WSxi+oBgEBx2Ru28dmand2
	 2MBHF0Fpx75sw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 12 Mar 2025 12:14:02 +0100
Subject: [PATCH 18/21] wifi: mt76: mt7996: set vif default link_id
 adding/removing vif links
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-b4-mt7996-mlo-p2-v1-18-015b3d6fd928@kernel.org>
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
X-CRM114-CacheID: sfid-20250312_041448_238547_1D50391F 
X-CRM114-Status: UNSURE (   9.61  )
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

This info will be consumed by subsequent patches (e.g. in set/get tsf
routines).

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index bcca1850d471bc43390c2f9e2ffecf6d9a05f377..40efba5bcaac364f8aa1ebf528e283494178616b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -271,6 +271,7 @@ int mt7996_vif_link_add(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 			struct mt76_vif_link *mlink)
 {
 	struct mt7996_vif_link *link = container_of(mlink, struct mt7996_vif_link, mt76);
+	struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
 	struct mt7996_sta_link *msta_link = &link->msta_link;
 	struct mt7996_phy *phy = mphy->priv;
 	struct mt7996_dev *dev = phy->dev;
@@ -338,6 +339,9 @@ int mt7996_vif_link_add(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 
 	ieee80211_iter_keys(mphy->hw, vif, mt7996_key_iter, NULL);
 
+	if (mvif->mt76.deflink_id == IEEE80211_LINK_UNSPECIFIED)
+		mvif->mt76.deflink_id = link_conf->link_id;
+
 	return 0;
 }
 
@@ -346,6 +350,7 @@ void mt7996_vif_link_remove(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 			    struct mt76_vif_link *mlink)
 {
 	struct mt7996_vif_link *link = container_of(mlink, struct mt7996_vif_link, mt76);
+	struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
 	struct mt7996_sta_link *msta_link = &link->msta_link;
 	struct mt7996_phy *phy = mphy->priv;
 	struct mt7996_dev *dev = phy->dev;
@@ -359,6 +364,19 @@ void mt7996_vif_link_remove(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 
 	rcu_assign_pointer(dev->mt76.wcid[idx], NULL);
 
+	if (mvif->mt76.deflink_id == link_conf->link_id) {
+		struct ieee80211_bss_conf *iter;
+		unsigned int link_id;
+
+		mvif->mt76.deflink_id = IEEE80211_LINK_UNSPECIFIED;
+		for_each_vif_active_link(vif, iter, link_id) {
+			if (link_id != IEEE80211_LINK_UNSPECIFIED) {
+				mvif->mt76.deflink_id = link_id;
+				break;
+			}
+		}
+	}
+
 	dev->mt76.vif_mask &= ~BIT_ULL(mlink->idx);
 	phy->omac_mask &= ~BIT_ULL(mlink->omac_idx);
 
@@ -443,6 +461,7 @@ static int mt7996_add_interface(struct ieee80211_hw *hw,
 	mt76_vif_init(vif, &mvif->mt76);
 
 	vif->offload_flags |= IEEE80211_OFFLOAD_ENCAP_4ADDR;
+	mvif->mt76.deflink_id = IEEE80211_LINK_UNSPECIFIED;
 
 out:
 	mutex_unlock(&dev->mt76.mutex);

-- 
2.48.1


