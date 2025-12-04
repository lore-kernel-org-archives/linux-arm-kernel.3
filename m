Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 751A2D20687
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 13:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mvKjQKXrz9xLBMKqQldxh0N2c2JNqte9Gn9HSqWv8v4=; b=g3IMKbaVHQ3WVwqtU9zyGK4b8B
	hCLOy8Qg7vYrpT0vzn9VFCn3H//XjZv3T0pQwSyQtLAdAl/k7aey7aqS9QkzETbDVw8WhEvsCV51u
	Ug5Z9K2CfY7vYlHpn6KJrSyGa3JLjX/qmUQmwaIRFFxuk0+KHY/snt89QFpoqwlhVRvH+FSRWzkqm
	HXmkpH7E7v7Fvfi9ob+LcKkvsGFWjmC2qO/wIz/VbHBQ9S+3af1+WibPq/ak70+Q1ibfSCEkbozQ7
	nrFI7Vtvh83qGBlDCtNXh7EOMlK41GJey6PCxEHjQE2Wyghsy2ZzzaS6tTWuUotw44U9d4jt709af
	w2nbpmSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR99f-0000000823Q-44BP;
	Thu, 04 Dec 2025 13:13:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR99d-0000000821Q-1ouT;
	Thu, 04 Dec 2025 13:13:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 23FF543DD0;
	Thu,  4 Dec 2025 13:13:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A28BEC16AAE;
	Thu,  4 Dec 2025 13:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764854033;
	bh=j2sszEHvbo+AG1hndOWuS1qSVFTizaaquasEEngVdcE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Lhd29DNACs57cZtRRAVVINI7OhUHBJpQMIkfydpX5nOpuHaAgWxRRpobPMp4G+YGN
	 TQMNvPvVubsSyvlEVrp6Fw9KUS1GBajwsub6Dk3pVtp3ofRwqd95XITFF3PPOreXAv
	 HH4Y5cjmDVfvkgQkZKnevFjqSKocN5riF81D1juHs8mvpjchI7WQAtORUP0AZGL0+z
	 Knz7OB6uM48Vm5upEYVIc9ig9oLzE4/83MPxG9TmR3rSIclKrOTT72uun47WZ+ujD3
	 61pT9AhtoxdZHmwWVBhbAPGRhrkVrFs6EV5q5CatL0z9/72CpRTUH3bv62yLo4QPK7
	 Vrou1YfI22H7w==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 04 Dec 2025 14:13:29 +0100
Subject: [PATCH mt76 2/3] wifi: mt76: mt7996: Reset mtxq->idx if primary
 link is removed in mt7996_vif_link_remove()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-mt76-txq-wicd-fix-v1-2-1f4b2f2b3b2c@kernel.org>
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
X-CRM114-CacheID: sfid-20251204_051353_496020_8EB5A976 
X-CRM114-Status: GOOD (  11.27  )
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

Reset WCID index in mt76_txq struct if primary link is removed in
mt7996_vif_link_remove routine.

Fixes: a3316d2fc669f ("wifi: mt76: mt7996: set vif default link_id adding/removing vif links")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 0ad0152478a7e1b11bfe5d68d750cb8332d54290..8bf85a9beee7dc8c6741568af5b36cf89f0c1a88 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -409,12 +409,23 @@ void mt7996_vif_link_remove(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 		struct ieee80211_bss_conf *iter;
 		unsigned int link_id;
 
+		/* Primary link will be removed, look for a new one */
 		mvif->mt76.deflink_id = IEEE80211_LINK_UNSPECIFIED;
 		for_each_vif_active_link(vif, iter, link_id) {
-			if (link_id != IEEE80211_LINK_UNSPECIFIED) {
-				mvif->mt76.deflink_id = link_id;
-				break;
+			struct mt7996_vif_link *link;
+
+			link = mt7996_vif_link(dev, vif, link_id);
+			if (!link)
+				continue;
+
+			if (vif->txq) {
+				struct mt76_txq *mtxq;
+
+				mtxq = (struct mt76_txq *)vif->txq->drv_priv;
+				mtxq->wcid = link->msta_link.wcid.idx;
 			}
+			mvif->mt76.deflink_id = link_id;
+			break;
 		}
 	}
 

-- 
2.52.0


