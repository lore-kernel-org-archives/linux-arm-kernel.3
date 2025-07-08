Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB24C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 07:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6czeKDpt8v66XEHSe6x3h/hUUMeRTdQ+SNqtbc/zues=; b=29Ry2ZxLBhw7Mz7U7EaLyoG5mi
	/hDGglnQiyA7FmdJ4xBSnr2+EHa/lumXGbyFDx0ugbj9A12n5mTVZg82rz9rLjTlvOqx22jhTrz9Q
	BAYzI1PnWlMwR3OsK8JNRiMBXg2tkWHjy3pP1bK6b4dK15WtZD3B903WAIs4HiVouAK6EvdxkH0uJ
	TRrrwOY81xflyTZ2dBdqLp8oQVcG1Gg6Y9CjdsVYZFbM9lfInFA9noyNeWt0BK4gA8e6oBi3xLFn9
	mo59RUU6+rAJuZmbVEtZGs1oBIiB0nqYd3bVK9N6lkf3wUUsmZbatNPQENdSB7Lpdz7BplAiGmTjS
	XdSfTSQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ2c8-00000004Yu0-1KzM;
	Tue, 08 Jul 2025 07:19:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ2VG-00000004YEh-2E9Q;
	Tue, 08 Jul 2025 07:12:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1A4625C615F;
	Tue,  8 Jul 2025 07:12:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F25AC4CEED;
	Tue,  8 Jul 2025 07:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751958752;
	bh=LeS2SICgV/5MqAA9eQYNW8wxvh5FPWeUvlj4KtSg9A0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bEDKP191w6cYbB3YOJ+oedL0pWFUvCQJw+CJbwh95JzBZpWY11hQBE4xctGOHFMJF
	 J6NeBGWNAqNEEbkSGo3L/c2BlLUHSTPIv0tVgqgtvQgKQbbOsFOeotaUNMRxewXXoz
	 K1cH2u4l9vk9q2iiKg/l3SCj6LCbH1mgby6hJ6kOjJkVYysBL6C+DT4IwJFBSFS3S3
	 1p4rAF1syrYB5TMOj4Jn81ike3Na8P4Mm5CazPFoKpSOqxY5fStcZh/zm5Lc2E9mJ8
	 jXdKV9dEmERxMEvCDVqwsLt2lFOiUvm2AAAoT/7MIUgj5wR7nIWaVwctBSaRRK3BsP
	 xHdVT0slsytJg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 08 Jul 2025 09:12:05 +0200
Subject: [PATCH mt76 2/2] wifi: mt76: mt7996: Fix mt7996_mcu_sta_ba wcid
 configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-mt7996-mlo-fixes-v2-v1-2-f2682818a8a3@kernel.org>
References: <20250708-mt7996-mlo-fixes-v2-v1-0-f2682818a8a3@kernel.org>
In-Reply-To: <20250708-mt7996-mlo-fixes-v2-v1-0-f2682818a8a3@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Peter Chiu <chui-hao.chiu@mediatek.com>, 
 Money Wang <Money.Wang@mediatek.com>, 
 Evelyn Tsai <evelyn.tsai@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 MeiChia Chiu <meichia.chiu@mediatek.com>, 
 Howard Hsu <howard-yh.hsu@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_001234_677429_648F48E7 
X-CRM114-Status: GOOD (  10.86  )
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

Fix the wcid pointer used in mt7996_mcu_sta_ba routine to properly
support MLO scenario.

Fixes: 98686cd21624c ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c   |  6 ++++--
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c    | 12 +++++++-----
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h |  3 ++-
 3 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 03ec3edc9a632390cb6d86d75b2e65a302a9a372..4f7db05902fb35641ee5e5d1d921a7ca437ec3dd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -1331,11 +1331,13 @@ mt7996_ampdu_action(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		case IEEE80211_AMPDU_RX_START:
 			mt76_rx_aggr_start(&dev->mt76, &msta_link->wcid, tid,
 					   ssn, params->buf_size);
-			ret = mt7996_mcu_add_rx_ba(dev, params, link, true);
+			ret = mt7996_mcu_add_rx_ba(dev, params, link,
+						   msta_link, true);
 			break;
 		case IEEE80211_AMPDU_RX_STOP:
 			mt76_rx_aggr_stop(&dev->mt76, &msta_link->wcid, tid);
-			ret = mt7996_mcu_add_rx_ba(dev, params, link, false);
+			ret = mt7996_mcu_add_rx_ba(dev, params, link,
+						   msta_link, false);
 			break;
 		case IEEE80211_AMPDU_TX_OPERATIONAL:
 			mtxq->aggr = true;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 0374872db4777cc85eed594f7d977dd822927b6d..edfbea813bfc0e5edbe4c33e90bf4ceacb533ac1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -1152,9 +1152,8 @@ int mt7996_mcu_set_timing(struct mt7996_phy *phy, struct ieee80211_vif *vif,
 static int
 mt7996_mcu_sta_ba(struct mt7996_dev *dev, struct mt76_vif_link *mvif,
 		  struct ieee80211_ampdu_params *params,
-		  bool enable, bool tx)
+		  struct mt76_wcid *wcid, bool enable, bool tx)
 {
-	struct mt76_wcid *wcid = (struct mt76_wcid *)params->sta->drv_priv;
 	struct sta_rec_ba_uni *ba;
 	struct sk_buff *skb;
 	struct tlv *tlv;
@@ -1188,14 +1187,17 @@ int mt7996_mcu_add_tx_ba(struct mt7996_dev *dev,
 	if (enable && !params->amsdu)
 		msta_link->wcid.amsdu = false;
 
-	return mt7996_mcu_sta_ba(dev, &link->mt76, params, enable, true);
+	return mt7996_mcu_sta_ba(dev, &link->mt76, params, &msta_link->wcid,
+				 enable, true);
 }
 
 int mt7996_mcu_add_rx_ba(struct mt7996_dev *dev,
 			 struct ieee80211_ampdu_params *params,
-			 struct mt7996_vif_link *link, bool enable)
+			 struct mt7996_vif_link *link,
+			 struct mt7996_sta_link *msta_link, bool enable)
 {
-	return mt7996_mcu_sta_ba(dev, &link->mt76, params, enable, false);
+	return mt7996_mcu_sta_ba(dev, &link->mt76, params, &msta_link->wcid,
+				 enable, false);
 }
 
 static void
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index 1ad6bc046f7c01d43452252ed46677d42e0c8850..19e115e316df05640062ca9fa56d4bcc8d41956e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -608,7 +608,8 @@ int mt7996_mcu_add_tx_ba(struct mt7996_dev *dev,
 			 struct mt7996_sta_link *msta_link, bool enable);
 int mt7996_mcu_add_rx_ba(struct mt7996_dev *dev,
 			 struct ieee80211_ampdu_params *params,
-			 struct mt7996_vif_link *link, bool enable);
+			 struct mt7996_vif_link *link,
+			 struct mt7996_sta_link *msta_link, bool enable);
 int mt7996_mcu_update_bss_color(struct mt7996_dev *dev,
 				struct mt76_vif_link *mlink,
 				struct cfg80211_he_bss_color *he_bss_color);

-- 
2.50.0


