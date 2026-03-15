Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC9ADD58B18
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Mar 2026 10:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7rgChFmIouqeHCPcpfOn7bpnllesQzJJCYEtA2Kzmn4=; b=omhKWgeEsJl/cVRyPrPXvz5x9y
	8S5Ay+V3eErCoCm3W9VL2IAEc0dueGmSPYJzq9Zf8oeeULxNnoXf69eo9OamIkmEJhN6dKSVzuPll
	2gkhYWJCJ+dfFnnhuaqofKI69KRbUgKWskOUHMkts6r7Ix5CKG9/kXm4VmVeV3WqQTlqIFJbODu+I
	MfxVKgJiButW/I7AL4kyxWSsKDRYO/7o6ZalpqEIyZEn28O7lVb9sUhBe0JSpvUr8p3sAtFgbyCmF
	pjFlkEXyolGda6LeIZkrFIFpNdtf388NQ65uicPwmgDwZj/0IrNNj/qiB2Ex0A7+ZhKD+DMc/jYky
	cOOcKSwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1igv-00000002XU6-2QOm;
	Sun, 15 Mar 2026 10:27:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1igp-00000002XRE-38QS;
	Sun, 15 Mar 2026 10:27:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5A40343BE2;
	Sun, 15 Mar 2026 10:27:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D44D4C2BCB0;
	Sun, 15 Mar 2026 10:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773570439;
	bh=QxnZNiTp0ScmumG7Zz7nuHt9/R4db5LB3gmyfj4jlho=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=co/+Xtx7Z4CZOv7BHwB/J2/Jk/CHJjP+EEiS5fau8qkfnwdesoXuCcrX6dY68ivZg
	 v21XzDRF2oIU7F6Rm7EuBgZaK9wZEjo1qAghK4W1qmdw+foXZC4Pdg4/1rcHYeHSrA
	 B7V/EUfzvFfE7QqX3nMtBMlHTgYhpJTUA0d1WCUZQxdIOyVnjtwBeLvVvXV5j+OA1t
	 e7BG4OWXj6I91Lldc72QssnGJMOn+qRVDn+SLyTYaxuTS8y7wD5X0lkutt3cXU2cn5
	 2gGjknjwkEJpQd5adLbv+WeqrO73hWJjfsaP0RQpFamCZFKi4Y83iPzD2kdIEJF/DY
	 1bxxemwwZPBFw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 15 Mar 2026 11:26:26 +0100
Subject: [PATCH mt76 3/6] wifi: mt76: mt7996: Move mlink deallocation in
 mt7996_vif_link_remove()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260315-mt7996-mlo-link-reconf-v1-3-a8a634fbc927@kernel.org>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_032719_850154_7614A06D 
X-CRM114-Status: UNSURE (   9.86  )
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

From: Shayne Chen <shayne.chen@mediatek.com>

Destroy mt76_vif_link struct in mt7996_vif_link_remove routine and not
in mt76_unassign_vif_chanctx(). This is necessary since, in order to
properly support MLO link reconfiguration, we will destroy mt76_vif_link
struct during AP tear-down process and not running unassign_vif_chanctx
mac80211 callback.
This patch does not introduce any regression since
mt76_assign_vif_chanctx/mt76_unassign_vif_chanctx APIs are currently
used just by MT7996 driver.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/channel.c     | 9 ---------
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 6 ++++++
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/channel.c b/drivers/net/wireless/mediatek/mt76/channel.c
index cf3fc09e5d5a87c8c67b7694f986180964c72799..05eee64706ea87f9f19acc103354939c66b767cb 100644
--- a/drivers/net/wireless/mediatek/mt76/channel.c
+++ b/drivers/net/wireless/mediatek/mt76/channel.c
@@ -158,8 +158,6 @@ void mt76_unassign_vif_chanctx(struct ieee80211_hw *hw,
 {
 	struct mt76_chanctx *ctx = (struct mt76_chanctx *)conf->drv_priv;
 	struct mt76_vif_link *mlink = (struct mt76_vif_link *)vif->drv_priv;
-	struct mt76_vif_data *mvif = mlink->mvif;
-	int link_id = link_conf->link_id;
 	struct mt76_phy *phy = ctx->phy;
 	struct mt76_dev *dev = phy->dev;
 
@@ -176,15 +174,8 @@ void mt76_unassign_vif_chanctx(struct ieee80211_hw *hw,
 	if (!mlink)
 		goto out;
 
-	if (mlink != (struct mt76_vif_link *)vif->drv_priv)
-		rcu_assign_pointer(mvif->link[link_id], NULL);
-
 	dev->drv->vif_link_remove(phy, vif, link_conf, mlink);
 	mlink->ctx = NULL;
-
-	if (mlink != (struct mt76_vif_link *)vif->drv_priv)
-		kfree_rcu(mlink, rcu_head);
-
 out:
 	mutex_unlock(&dev->mutex);
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 07a266f7670c1d6b050e3790ce91cba014b18eab..feee93340a6c691d38858230a5f05627aac1c07f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -459,6 +459,12 @@ void mt7996_vif_link_remove(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 	spin_unlock_bh(&dev->mt76.sta_poll_lock);
 
 	mt76_wcid_cleanup(&dev->mt76, &msta_link->wcid);
+
+	if (mlink != (struct mt76_vif_link *)vif->drv_priv &&
+	    !mlink->wcid->offchannel) {
+		rcu_assign_pointer(mlink->mvif->link[link_id], NULL);
+		kfree_rcu(mlink, rcu_head);
+	}
 }
 
 static void mt7996_phy_set_rxfilter(struct mt7996_phy *phy)

-- 
2.53.0


