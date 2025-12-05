Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B9FD2F7D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 10:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rghx0pm+5jfzJHBsanepJHQxc9Dx1mBbxV+B31UGnBs=; b=eAsGjPAB1XRDlqeTsl2WlwadUD
	HeCfoJjEt7vS0V5Qv32i28UEN6bgD+3PXrAzZa8M5h2YTSMtdx9Ynp7daZwSpQorBHFEuX/rOmn+a
	EGfTSRZSkjNOZykBn8YsAT67og83KGX9Htv3BeVF/0oy7M/iRimDRdjhK8ClbDdcBSVQ7n0EkWkNc
	NL4gAuXECoA6md4jUWYP9iU/D5tYXsdK+n1/Q/vVZGjvfxm4JMqrmRCet0rsW5rdQdot4b18JEtLT
	9GfKYAWkfkgZDQTsApNRzgZS0l0lNVeHF4nTUFSj9ycYJdFHRlVdWk3RN5mAVImMBAXb7RN/JQK8A
	0vh3jcjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRSzm-00000009Nje-2IPm;
	Fri, 05 Dec 2025 10:25:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRSzj-00000009Ni5-2Zn7;
	Fri, 05 Dec 2025 10:24:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BA5FC60204;
	Fri,  5 Dec 2025 10:24:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B5BFC4CEF1;
	Fri,  5 Dec 2025 10:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764930298;
	bh=xzqTEQWlL2osp14A8v9rgJIJ+HBndeX+dXJ6PqlMsSU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RFlgqxvU6m+guTVl1YRJFX8cKwpsgb+KzPhf9cdvSF+gLYpmI1tgPTPRF4z6SQvMN
	 X0RcEhRUua5rZINpreDUT0NYGNFwvf4PdUUvBxjE/zEgGfuoZhibqiR0vsZq06jA+h
	 1PKbbyVYjo1Fxm3HpL32wrMR3rHEpd894LnoVayrzKChBrC1ml3pOhvAgBSTwEjtmX
	 iyQlTYiV02jirjKqJ0nWspjsy7+UJV79KyTqkRyfxVI2o75Tii3xYOn84JjPS8FMFq
	 MNgd+bhCP409gmh04/owUgTB9baepSBxl9T5uyaktSZREdpXT0aQqNC/JqEQ8SqWvv
	 t9GFZOY9o541A==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 05 Dec 2025 11:24:36 +0100
Subject: [PATCH mt76 v2 1/4] wifi: mt76: mt7996: Set mtxq->wcid just for
 primary link
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-mt76-txq-wicd-fix-v2-1-f19ba48af7c1@kernel.org>
References: <20251205-mt76-txq-wicd-fix-v2-0-f19ba48af7c1@kernel.org>
In-Reply-To: <20251205-mt76-txq-wicd-fix-v2-0-f19ba48af7c1@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Bo Jiao <Bo.Jiao@mediatek.com>, 
 Peter Chiu <chui-hao.chiu@mediatek.com>
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

Set WCID index in mt76_txq struct just for the primary link in
mt7996_vif_link_add routine.

Fixes: 69d54ce7491d0 ("wifi: mt76: mt7996: switch to single multi-radio wiphy")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index beed795edb24c67e1b7b44fe87fd5de125a21d94..0ad0152478a7e1b11bfe5d68d750cb8332d54290 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -300,7 +300,6 @@ int mt7996_vif_link_add(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 		.cmd = SET_KEY,
 		.link_id = link_conf->link_id,
 	};
-	struct mt76_txq *mtxq;
 	int mld_idx, idx, ret;
 
 	mlink->idx = __ffs64(~dev->mt76.vif_mask);
@@ -343,11 +342,6 @@ int mt7996_vif_link_add(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 	mt7996_mac_wtbl_update(dev, idx,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
 
-	if (vif->txq) {
-		mtxq = (struct mt76_txq *)vif->txq->drv_priv;
-		mtxq->wcid = idx;
-	}
-
 	if (vif->type != NL80211_IFTYPE_AP &&
 	    (!mlink->omac_idx || mlink->omac_idx > 3))
 		vif->offload_flags = 0;
@@ -371,8 +365,15 @@ int mt7996_vif_link_add(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 	ieee80211_iter_keys(mphy->hw, vif, mt7996_key_iter, &it);
 
 	if (!mlink->wcid->offchannel &&
-	    mvif->mt76.deflink_id == IEEE80211_LINK_UNSPECIFIED)
+	    mvif->mt76.deflink_id == IEEE80211_LINK_UNSPECIFIED) {
+		if (vif->txq) {
+			struct mt76_txq *mtxq;
+
+			mtxq = (struct mt76_txq *)vif->txq->drv_priv;
+			mtxq->wcid = idx;
+		}
 		mvif->mt76.deflink_id = link_conf->link_id;
+	}
 
 	return 0;
 }

-- 
2.52.0


