Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8EF3CCF2D4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 01:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cNR3vb579dXsDYsujzLCTLqAAOGxXjoVkILSQWP2oe8=; b=YWX9dWf34ZfQBYpsS2kFTCstrY
	ANCn/Rxhqk/bnGCKhLyXqE3e8jtwmvmp6IuS4daWt97/8ap4paJqdwwtFfrKI9c2ji2Sog9BFHROF
	FLu+sLWC0zYKGlkZD3TPEn1Q0TwkL5nkSLkffn0lruAENiUlHCU6zUzr9xEpDblJrcnLFHwn/tEcJ
	eorepYTAW/1eF8z8phUI/sUJvruiBR+Hl2RGuj+hrXKdmRb3ERMiov9wQbkjIXkN+R4HqidATcuc7
	nmPtQuVBohTuCibkFqT4VQZlr0PdQXwoj31jbETf6vSPn8N6Eg1/yDOhRJnwmXvS7OAOCHjxr4Egq
	alxJIa1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIcER-00000006OPO-4Bly;
	Mon, 19 Oct 2026 01:32:08 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIcEN-00000006OOs-3bKp;
	Mon, 19 Oct 2026 01:32:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=cN
	R3vb579dXsDYsujzLCTLqAAOGxXjoVkILSQWP2oe8=; b=fQWPm5mfBDj4rk4TrJ
	5C5lGQqMiOE4ZJLQ468NXt9Rxv0Z8YlJoJtp+nzgKDkFJC45sCjDnIxUgkr7WzNL
	q9JxzgCXNRWO9CqMNAtLCX2G/ba11RIASARGABhOb547LTvJIol7dMS53pfL+9nu
	AGfaBkN6nhywuuO5OgauW8rio=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wCnj78Dc9VqcUAyAw--.1470S2;
	Mon, 19 Oct 2026 09:31:48 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH] wifi: mt76: mt7996: stop radios after add failure
Date: Mon, 19 Oct 2026 09:31:45 +0800
Message-Id: <20261019013146.1488644-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCnj78Dc9VqcUAyAw--.1470S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXF43ZF4DCw48AFy3Zw15twb_yoW5Xr4fp3
	yjka90yr4UArn5XF18Cr4jvF1rC3yxGry7CrWku3Z8Crn7CrZ3Jr40vF9FvF1rCrWxC3Wa
	vr40y3ZrWanxWFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piJPE3UUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8ATtKGrVcwQqoQAA3y
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_183204_243418_B07F5667 
X-CRM114-Status: GOOD (  11.11  )
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

A multi-radio interface can start one radio before starting a later
radio fails. add_interface returns without stopping the radios started
by that failed request. mt7996_run can also leave firmware radio state
enabled when setup fails after radio enablement.

Disable a radio when mt7996_run fails and track radios newly started by
add_interface so they and their monitor state are rolled back on a later
failure.

Fixes: 69d54ce7491d ("wifi: mt76: mt7996: switch to single multi-radio wiphy")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 .../net/wireless/mediatek/mt76/mt7996/main.c  | 26 ++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index dd7a01c02a7c..1cea0515a413 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -24,15 +24,15 @@ int mt7996_run(struct mt7996_phy *phy)
 
 	ret = mt7996_mcu_set_chan_info(phy, UNI_CHANNEL_RX_PATH);
 	if (ret)
-		return ret;
+		goto disable_radio;
 
 	ret = mt7996_mcu_set_thermal_throttling(phy, MT7996_THERMAL_THROTTLE_MAX);
 	if (ret)
-		return ret;
+		goto disable_radio;
 
 	ret = mt7996_mcu_set_thermal_protect(phy, true);
 	if (ret)
-		return ret;
+		goto disable_radio;
 
 	set_bit(MT76_STATE_RUNNING, &phy->mt76->state);
 
@@ -45,6 +45,11 @@ int mt7996_run(struct mt7996_phy *phy)
 	}
 
 	return 0;
+
+disable_radio:
+	mt7996_mcu_set_radio_en(phy, false);
+
+	return ret;
 }
 
 static int mt7996_start(struct ieee80211_hw *hw)
@@ -558,6 +563,7 @@ static int mt7996_add_interface(struct ieee80211_hw *hw,
 	struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
 	struct wireless_dev *wdev = ieee80211_vif_to_wdev(vif);
 	struct mt7996_dev *dev = mt7996_hw_dev(hw);
+	unsigned long started = 0;
 	int i, err = 0;
 
 	mutex_lock(&dev->mt76.mutex);
@@ -572,6 +578,7 @@ static int mt7996_add_interface(struct ieee80211_hw *hw,
 		err = mt7996_run(phy);
 		if (err)
 			goto out;
+		set_bit(i, &started);
 
 		if (vif->type == NL80211_IFTYPE_MONITOR)
 			mt7996_set_monitor(phy, true);
@@ -584,6 +591,19 @@ static int mt7996_add_interface(struct ieee80211_hw *hw,
 
 out:
 	mutex_unlock(&dev->mt76.mutex);
+	if (err) {
+		for_each_set_bit(i, &started, MT7996_MAX_RADIOS) {
+			struct mt7996_phy *phy = dev->radio_phy[i];
+
+			if (vif->type == NL80211_IFTYPE_MONITOR) {
+				mutex_lock(&dev->mt76.mutex);
+				mt7996_set_monitor(phy, false);
+				mutex_unlock(&dev->mt76.mutex);
+			}
+
+			mt7996_stop_phy(phy);
+		}
+	}
 
 	return err;
 }
-- 
2.34.1


