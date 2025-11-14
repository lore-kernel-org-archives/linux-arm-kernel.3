Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F9C3CE7B0B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 13:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GSkriPPnkbIMrLqR0H36CJEtq9uV/kywO6APBlVDr34=; b=o1h6XsTIkRhpmtY9hK0evgntZw
	1NkZQKKqCNze4VLC6v4MzxPPVjZpZ7KX+XaS8GN3CgmayLafzTMlWyOz36Uf1DWQ/PEbr6APDnRJ+
	bDjVEXyP+F+KtdHFJ28mrgHLrLuTfVD4EyFeTP6yYu4FzFeMrOjaIfqY63j187jL53C4wflGysmkx
	EtUm8sZ5xoSd7a2rGjQLX5QxPm41tJkTCD85siFqfugkEv5yctQ/T3DZiIq+PHxmRo3WWbVbqNnvb
	Z7P/8AbzhRtQaYKje6pWxjsPhbdVHUV0xt2n6BbSXSJtKHCqC7X5sSNFuvsiNb3ZHuoKJ3GeofULw
	o8Do96pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJtfX-0000000CF3E-3kEE;
	Fri, 14 Nov 2025 13:16:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJtfR-0000000CEyw-3A5N;
	Fri, 14 Nov 2025 13:16:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4DF894177B;
	Fri, 14 Nov 2025 13:16:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1D66C4CEF5;
	Fri, 14 Nov 2025 13:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763126205;
	bh=KVj9k68RnOszWxHXFLkpcOlslWuXtZE1P1GLidHf8pk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tNencgI87mkyu5kZ95NRa6CKYE9aZPGibKUdJkWRA7eia+3BRPKjd3QpRvaO8TLYA
	 Q7sz0zXojoMsc6MjNrV+DMjqDSZdlFDPFFyJP4RoRfwgawI8QpWgs7+fx5YWji7GZn
	 29eqvO5CDsCHRwI7qYYeKAUYFKhmCyCEr55JBQVbgAaHXbikv33R0zFSibuN6dh+Wa
	 lhCANCPbPD5e9NsQx1nEQWqtqOKqKCzUcTS50h1Ef9EIIOV/5qxcHuMgcmJ6vEmziU
	 0aMfsA67D8GYS0/wA5sdEPGeQiODmXouLkO78iHA9tQQ6+JRq1QBW4oFWyb2QFNdQo
	 oRiMNCH2fdfmw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 14 Nov 2025 14:16:24 +0100
Subject: [PATCH mt76 4/4] wifi: mt76: mt7996: skip deflink accounting for
 offchannel links
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-mt76-fix-missing-mtx-v1-4-259ebf11f654@kernel.org>
References: <20251114-mt76-fix-missing-mtx-v1-0-259ebf11f654@kernel.org>
In-Reply-To: <20251114-mt76-fix-missing-mtx-v1-0-259ebf11f654@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bo Jiao <Bo.Jiao@mediatek.com>, Peter Chiu <chui-hao.chiu@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_051647_571050_7E6364D8 
X-CRM114-Status: UNSURE (   9.21  )
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

Do not take into account offchannel links for deflink accounting.

Fixes: a3316d2fc669f ("wifi: mt76: mt7996: set vif default link_id adding/removing vif links")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index ad8698cf16242489b92e23befab4d040abbdcac2..d3cd2fed31cd55f1a949ae3f2e3ed5f488514b1d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -376,7 +376,8 @@ int mt7996_vif_link_add(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 
 	ieee80211_iter_keys(mphy->hw, vif, mt7996_key_iter, &it);
 
-	if (mvif->mt76.deflink_id == IEEE80211_LINK_UNSPECIFIED)
+	if (!mlink->wcid->offchannel &&
+	    mvif->mt76.deflink_id == IEEE80211_LINK_UNSPECIFIED)
 		mvif->mt76.deflink_id = link_conf->link_id;
 
 	return 0;
@@ -407,7 +408,8 @@ void mt7996_vif_link_remove(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 
 	rcu_assign_pointer(dev->mt76.wcid[idx], NULL);
 
-	if (mvif->mt76.deflink_id == link_conf->link_id) {
+	if (!mlink->wcid->offchannel &&
+	    mvif->mt76.deflink_id == link_conf->link_id) {
 		struct ieee80211_bss_conf *iter;
 		unsigned int link_id;
 

-- 
2.51.1


