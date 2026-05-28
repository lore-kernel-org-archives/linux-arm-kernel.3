Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA3CCCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 03:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AsfZTg8Pkg8qEtfL6QgXYQbd6ulGPjRi4xRGoZQifSA=; b=2XEaU6Gb7XyEEJ0Gx+M/DwIx5s
	POWysLcQZ0Acv8azW6d9owO/ea/KbZO/KNztUkaCS/+83OTXrBztSHI3yRzPwd7RJc2Exuwu2Ng9m
	g/Fr/XG3xhM6+vtJKIKsTK0CkdMqKoh3PySZHL80CF3aoCD04CwyF1ogLySoS2c/hxsrCj+dtrQNg
	PKhwHHVROkE6tRS2PBaDTtUrP6CagUAAmQftXBWTqJRcs5wGSjRS5l4gS6ApsiN+D8dffrD8FxhMO
	PB7rSCSUfDJUPHHq0IsGFsx5BdE+exbgYWa68cDqTMQZjdwCgdKZaoDNyeSTWdXKWIhDqxQwbgCT6
	414vvVlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSRZn-000000054Do-0ASf;
	Thu, 28 May 2026 03:38:31 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSRZj-000000054DL-3lMM;
	Thu, 28 May 2026 03:38:29 +0000
X-UUID: ab5ad48c5a4611f1aa26b74ffac11d73-20260528
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:7a828153-7aa4-495a-a2e8-16286402c62e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:4a09221e07cf789a4913c9d7f23183cc,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|865|898,TC:nil,Content:0|15|50,EDM:-
	3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,A
	V:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ab5ad48c5a4611f1aa26b74ffac11d73-20260528
X-User: liujiajia@kylinos.cn
Received: from nature.lan [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liujiajia@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1218919271; Thu, 28 May 2026 11:38:19 +0800
From: Jiajia Liu <liujiajia@kylinos.cn>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	Leon Yen <leon.yen@mediatek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Jiajia Liu <liujiajia@kylinos.cn>
Subject: [PATCH v2] wifi: mt76: add wcid publish check in mt76_sta_add
Date: Thu, 28 May 2026 11:38:14 +0800
Message-ID: <20260528033814.46418-1-liujiajia@kylinos.cn>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_203828_266586_4B28F3B1 
X-CRM114-Status: GOOD (  10.04  )
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

Since mt7925_mac_sta_add publishes wcid, add publish check in mt76_sta_add
to avoid reinitializing the wcid->poll_list.

Found dev->sta_poll_list corruption when using mt7925 and 7.1-rc4.
According to the corruption information, prev->next was changed to itself.

wlan0: disconnect from AP 90:fb:5d:94:8b:e3 for new auth to 90:fb:5d:94:8b:e2
wlan0: authenticate with 90:fb:5d:94:8b:e2 (local address=84:9e:56:9c:7e:6b)
wlan0: send auth to 90:fb:5d:94:8b:e2 (try 1/3)
 slab kmalloc-8k start ffff8c80958a6000 pointer offset 4160 size 8192
list_add corruption. prev->next should be next (ffff8c808a7488f8), but was ffff8c80958a7040. (prev=ffff8c80958a7040).

 mt76_wcid_add_poll+0x95/0xd0 [mt76]
 mt7925_mac_add_txs.part.0+0xa5/0xe0 [mt7925_common]
 mt7925_rx_check+0xa7/0xc0 [mt7925_common]
 mt76_dma_rx_poll+0x50d/0x790 [mt76]
 mt792x_poll_rx+0x52/0xe0 [mt792x_lib]

Signed-off-by: Jiajia Liu <liujiajia@kylinos.cn>
---

Changes in v2:
  - use dev->wcid table instead of adding MT_WCID_FLAG_DRV_PUBLSH for
    wcid publish check suggested by Sean
  - subject and commit message update

---
 drivers/net/wireless/mediatek/mt76/mac80211.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index 4ae5e4715a9c..b78b4cd206e0 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -1576,6 +1576,7 @@ mt76_sta_add(struct mt76_phy *phy, struct ieee80211_vif *vif,
 {
 	struct mt76_wcid *wcid = (struct mt76_wcid *)sta->drv_priv;
 	struct mt76_dev *dev = phy->dev;
+	struct mt76_wcid *published;
 	int ret;
 	int i;
 
@@ -1595,11 +1596,19 @@ mt76_sta_add(struct mt76_phy *phy, struct ieee80211_vif *vif,
 		mtxq->wcid = wcid->idx;
 	}
 
-	ewma_signal_init(&wcid->rssi);
-	rcu_assign_pointer(dev->wcid[wcid->idx], wcid);
+	published = rcu_dereference_protected(dev->wcid[wcid->idx],
+					      lockdep_is_held(&dev->mutex));
+	if (published != wcid) {
+		WARN_ON_ONCE(published);
+		ewma_signal_init(&wcid->rssi);
+		rcu_assign_pointer(dev->wcid[wcid->idx], wcid);
+		mt76_wcid_init(wcid, phy->band_idx);
+	} else {
+		wcid->phy_idx = phy->band_idx;
+	}
+
 	phy->num_sta++;
 
-	mt76_wcid_init(wcid, phy->band_idx);
 out:
 	mutex_unlock(&dev->mutex);
 
-- 
2.53.0


