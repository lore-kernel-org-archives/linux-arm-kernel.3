Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899C0C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 22:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KbV2nWe8P2p34Kclaz10E5nv87cU5PqwkUolzYNx1/w=; b=e0hRWJEKsjPAE+WjyFnYEZrsNI
	jOTG5ikbZDSH2/N+iydykeSG4Et199aVYGm9lkqTln6b9HzNGalqIVmhAdIYlMOkGri3BKVV2yGLq
	NPFJ2PQEmY1tigLVGdpW1N11vGVPxKGh0EEx7kpUFKFE8Iyg14iV7KQ8o9BLOVsGh+TMftdwJBuMI
	hNm8IaboXX2CPce0nW0MvNwEYHprWxXlK6sgXWoC8a77JRxRr8+bQDr3p3IfDWdLCNfeWSWDLvykd
	YRbBv0bDyPohkOvCDw9kPUWPmwiY50GTJ2Mi4fTEic/FVwDI3BDLQZidtRKDD8n3vVY2Nv1cWNXjC
	E08Cqn2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4VH-00000008pit-38FQ;
	Mon, 05 May 2025 22:41:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC47Y-00000008iC8-0gGa;
	Mon, 05 May 2025 22:17:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C2410629C0;
	Mon,  5 May 2025 22:16:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E0DDC4CEE4;
	Mon,  5 May 2025 22:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483427;
	bh=/b3J7JjYOwlDGnUX53TNs6feQxn0vwXryA22VULuaAo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A+8LdaL0zlSrtyPxyWKO9f+UWS5oOvoccOqbb7m82jkVMfNc6rrJwVP0rf5Qzl0Rn
	 QW6+mi0c43TdWGGQgoCUISeQXLlxl4nAKOW+q6V6/4pdAhbWo2OfSnCBvhF/sYyTge
	 GM3ZT5udxDgpKj+ZcYDsXU6/KR86EKmNxNKye9UrN8/Rv8PA0s+PfL5mfVVZFOdWoA
	 +d7ZEi7Wjz/f9KDIPbsDV6tGw41XVYISABjr5BtJE6+IRmMQbbGkPLTBbUT9uoKkgo
	 AyK6PeZy3i+51czHoioaoNRd5g8/vm6VfLxnLWrmxwUsyTErrJtre3qNTnFopXSGjn
	 grcIixCbve6JA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Sasha Levin <sashal@kernel.org>,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 077/642] wifi: mt76: scan: set vif offchannel link for scanning/roc
Date: Mon,  5 May 2025 18:04:53 -0400
Message-Id: <20250505221419.2672473-77-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit
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

From: Felix Fietkau <nbd@nbd.name>

[ Upstream commit 3ba20af886d1f604dceeb4d4c8ff872e2c4e885e ]

The driver needs to know what vif link to use

Link: https://patch.msgid.link/20250311103646.43346-4-nbd@nbd.name
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/channel.c | 3 +++
 drivers/net/wireless/mediatek/mt76/mt76.h    | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/channel.c b/drivers/net/wireless/mediatek/mt76/channel.c
index 6a35c6ebd823e..e7b839e742903 100644
--- a/drivers/net/wireless/mediatek/mt76/channel.c
+++ b/drivers/net/wireless/mediatek/mt76/channel.c
@@ -293,6 +293,7 @@ struct mt76_vif_link *mt76_get_vif_phy_link(struct mt76_phy *phy,
 		kfree(mlink);
 		return ERR_PTR(ret);
 	}
+	rcu_assign_pointer(mvif->offchannel_link, mlink);
 
 	return mlink;
 }
@@ -301,10 +302,12 @@ void mt76_put_vif_phy_link(struct mt76_phy *phy, struct ieee80211_vif *vif,
 			   struct mt76_vif_link *mlink)
 {
 	struct mt76_dev *dev = phy->dev;
+	struct mt76_vif_data *mvif = mlink->mvif;
 
 	if (IS_ERR_OR_NULL(mlink) || !mlink->offchannel)
 		return;
 
+	rcu_assign_pointer(mvif->offchannel_link, NULL);
 	dev->drv->vif_link_remove(phy, vif, &vif->bss_conf, mlink);
 	kfree(mlink);
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 8714418f3906c..e4ecd9cde36dc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -351,6 +351,7 @@ struct mt76_wcid {
 	u8 hw_key_idx;
 	u8 hw_key_idx2;
 
+	u8 offchannel:1;
 	u8 sta:1;
 	u8 sta_disabled:1;
 	u8 amsdu:1;
@@ -788,6 +789,7 @@ struct mt76_vif_link {
 
 struct mt76_vif_data {
 	struct mt76_vif_link __rcu *link[IEEE80211_MLD_MAX_NUM_LINKS];
+	struct mt76_vif_link __rcu *offchannel_link;
 
 	struct mt76_phy *roc_phy;
 	u16 valid_links;
-- 
2.39.5


