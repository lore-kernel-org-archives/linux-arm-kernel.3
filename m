Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D026EC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 18:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tJiU9QBRilFPZgakuc6csm79chJpwvoiI/+QYm/64x4=; b=maP2Pmp/VS1JN2YR1L9SfzLplc
	jKLR4Yzm9VFONCrrI3ayiMXmUxFB8lDq0SVGfb6UeluHqgEpIxKUlZ0hNF1E7OoCUT+o6g38SYZ2X
	vphXjkZSzi1CJZpRTEkANZ8cS1r6HW+/o704uG9plFG0/NiBnxlaCSeO4x7ETCbQE+M2JJFbWlp3Z
	5Tfk8Q2x9SXiOWJYYhNerHyiCnXvFCxfND+/dcsgCUomUVXSCbRQzG/hzrp2iChNTp7AnwMVU8Qg4
	nl8odKYF1fgaSdr/qXNUFuC+M04W7SBC0/zzXX0bD7payiRuTGKMfxvx1Mhtc+o03jj+F0k0lhaFN
	1SQCVYLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts3vU-00000006Y2U-3Kvy;
	Tue, 11 Mar 2025 18:02:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts3fh-00000006VGF-10wC;
	Tue, 11 Mar 2025 17:45:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CFA135C67FA;
	Tue, 11 Mar 2025 17:43:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5247C4CEE9;
	Tue, 11 Mar 2025 17:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741715140;
	bh=R6gtg/TQgZku/lKJqB18xCV0J8UOG6HPluWCjQVyBro=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mYDikKAR2jNfzHfGL/PSDYSCJCpSiliCotsLvB91EjDjDgVVftrJYUUh8mg2FPJLf
	 ZxSaNXjYYJzwLaRxIXd8w3ckJQ2EsWiG1pt1X2qKk9tA4HmCzaBq9WKX/YrGqRgeuN
	 DXerEjDgu1mMLsQ3sJJJfRo+UHrvK0T6iCNYpFFOx9kzuRdp/3NdINXAMu7Dl7FiF3
	 7bM5v0LU76iRzQaBQHj2mbXRItScgXpLd0QDUIJyj9eXT7JuTlgWiVlIArb/mW3jNy
	 NuGZPfb52r5t47qaATo0rcM2MKSqZvFdhIKywqjhvI8fJTtVwWTopte6e8JKlDWkMf
	 G0spAbPJNSVTg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 11 Mar 2025 18:45:08 +0100
Subject: [PATCH v2 09/13] wifi: mt76: mt7996: Support MLO in
 mt7996_mac_sta_event()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-mt7996-mlo-v2-9-31df6972519b@kernel.org>
References: <20250311-mt7996-mlo-v2-0-31df6972519b@kernel.org>
In-Reply-To: <20250311-mt7996-mlo-v2-0-31df6972519b@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Kalle Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, 
 Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Bo Jiao <Bo.Jiao@mediatek.com>, 
 Peter Chiu <chui-hao.chiu@mediatek.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_104541_398651_EAA2FCAB 
X-CRM114-Status: GOOD (  13.29  )
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

Similar to mt7996_mac_sta_add() adn mt7996_mac_sta_remove(), update
mt7996_mac_sta_event routine to take into account MLO support.
Please note mcu routines does not support MLO yet.

Co-developed-by: Bo Jiao <Bo.Jiao@mediatek.com>
Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
Co-developed-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Co-developed-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 69 ++++++++++++++----------
 1 file changed, 40 insertions(+), 29 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 307c68c6b0cd7c3acdbfd7be78a007a66d3183bf..6d323b5e4e8076ca963e585c12dc656dc5ec3fdb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -1001,41 +1001,52 @@ mt7996_mac_sta_event(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 		     struct ieee80211_sta *sta, enum mt76_sta_event ev)
 {
 	struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
-	struct mt7996_sta_link *msta_link = &msta->deflink;
-	struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
-	struct mt7996_vif_link *link = &mvif->deflink;
-	int i, ret;
-
-	switch (ev) {
-	case MT76_STA_EVENT_ASSOC:
-		ret = mt7996_mcu_add_sta(dev, vif, &link->mt76, sta,
-					 CONN_STATE_CONNECT, true);
-		if (ret)
-			return ret;
-
-		ret = mt7996_mcu_add_rate_ctrl(dev, vif, sta, false);
-		if (ret)
-			return ret;
+	struct ieee80211_link_sta *link_sta;
+	unsigned int link_id;
 
-		msta_link->wcid.tx_info |= MT_WCID_TX_INFO_SET;
-		msta_link->wcid.sta = 1;
+	for_each_sta_active_link(vif, sta, link_sta, link_id) {
+		struct mt7996_sta_link *msta_link;
+		struct mt7996_vif_link *link;
+		int i, err;
 
-		return 0;
+		link = mt7996_vif_link(dev, vif, link_id);
+		if (!link)
+			continue;
 
-	case MT76_STA_EVENT_AUTHORIZE:
-		return mt7996_mcu_add_sta(dev, vif, &link->mt76, sta,
-					  CONN_STATE_PORT_SECURE, false);
+		msta_link = mt76_dereference(msta->link[link_id], &dev->mt76);
+		if (!msta_link)
+			continue;
 
-	case MT76_STA_EVENT_DISASSOC:
-		for (i = 0; i < ARRAY_SIZE(msta_link->twt.flow); i++)
-			mt7996_mac_twt_teardown_flow(dev, msta, i);
+		switch (ev) {
+		case MT76_STA_EVENT_ASSOC:
+			err = mt7996_mcu_add_sta(dev, vif, &link->mt76, sta,
+						 CONN_STATE_CONNECT, true);
+			if (err)
+				return err;
 
-		mt7996_mcu_add_sta(dev, vif, &link->mt76, sta,
-				   CONN_STATE_DISCONNECT, false);
-		msta_link->wcid.sta_disabled = 1;
-		msta_link->wcid.sta = 0;
+			err = mt7996_mcu_add_rate_ctrl(dev, vif, sta, false);
+			if (err)
+				return err;
 
-		return 0;
+			msta_link->wcid.tx_info |= MT_WCID_TX_INFO_SET;
+			msta_link->wcid.sta = 1;
+			break;
+		case MT76_STA_EVENT_AUTHORIZE:
+			err = mt7996_mcu_add_sta(dev, vif, &link->mt76, sta,
+						 CONN_STATE_PORT_SECURE, false);
+			if (err)
+				return err;
+			break;
+		case MT76_STA_EVENT_DISASSOC:
+			for (i = 0; i < ARRAY_SIZE(msta_link->twt.flow); i++)
+				mt7996_mac_twt_teardown_flow(dev, msta, i);
+
+			mt7996_mcu_add_sta(dev, vif, &link->mt76, sta,
+					   CONN_STATE_DISCONNECT, false);
+			msta_link->wcid.sta_disabled = 1;
+			msta_link->wcid.sta = 0;
+			break;
+		}
 	}
 
 	return 0;

-- 
2.48.1


