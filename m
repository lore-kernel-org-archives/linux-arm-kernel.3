Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80793606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 09:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uE/XvtQr;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=DrGNk5uG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=h0FdeRztEg1QCFC1aOzIYL7zluCbo3+kF/F1IiavlMk=; b=uE/XvtQr4t3oV+bew2anVA2UaG
	KeuYIl5I3XET+52PO8RZ58Z0giZKwfYKDZyiWiZwOSps9jexG1Oav48eqhAJn9wo8WX1FXMNUgSbE
	AeTxEOTvZZG5c4nmXcKC09hsFT0ugraIcMY8f6iOxZ8T+so9U1tK5+cq9IF3MBHtjb1JbBrV4mvxF
	C/sbcX82S1effXQ2Wb22WEOtWwIIM+KgRgRd9/9jn8KEkmO1EyyjVsBqwJ0gk2h1tUI0NABd/daR9
	0ZEgT9Xqq/x/zZYDCmFqIXmyNVel4uXOYuloXHmNXunGrvPNVqoCRE2UUoX+PkqW9EVjmQ0QaULfe
	ZvY2lBKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBME-0000000FyuC-0ofS;
	Fri, 23 Oct 2026 09:14:38 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBMB-0000000Fyt6-0aW1;
	Fri, 23 Oct 2026 09:14:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=h0
	FdeRztEg1QCFC1aOzIYL7zluCbo3+kF/F1IiavlMk=; b=DrGNk5uGKYBSKz+kcA
	rIa1Ho5I64GbEvOy/71cC+dNcqsd8weRNu5fHPMou2K45cQLSHWaN8/fYcTKiBow
	/cXPNx8yXnzyshCs4kYyAbOmWIEZY/hLvMDZ+ke6m7EMgwRZAHaq/M5LpxDh2rXZ
	Y7h6DTrK34evKdIEv5mSGJ5Cw=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD3d3ljJdtqy8kCCA--.31461S2;
	Fri, 23 Oct 2026 17:14:15 +0800 (CST)
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
Cc: stable@vger.kernel.org
Subject: [PATCH v2] wifi: mt76: mt7996: stop radios after add failure
Date: Fri, 23 Oct 2026 17:14:10 +0800
Message-Id: <20261023091410.627175-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3d3ljJdtqy8kCCA--.31461S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZFWrGr4DKr4fGrW5tw1kZrb_yoW5uw1kp3
	yjka98tr17Zr95WF18Cr4jvF1rC3y8Kry3JFs5u3Z0kwn5CrZ3Jr40vF9FvF95CrWxA3Wa
	vF4kta1DWanxWFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jUIDcUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8AfzLmrbJWf1LgAA3C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_021435_523357_9590D6E9 
X-CRM114-Status: GOOD (  13.43  )
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A multi-radio interface can start one radio before starting a later
radio fails. add_interface returns without stopping the radios started
by that failed request. It can also leave monitor mode enabled on radios
that were already running before the failed request.

mt7996_run can leave firmware radio state enabled when setup fails after
radio enablement. Disable the radio on those failures. Track radios
started by add_interface and monitor states changed by it, then roll
back both when a later radio fails to start.

Fixes: 69d54ce7491d ("wifi: mt76: mt7996: switch to single multi-radio wiphy")
Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---

Notes:
    Changes in v2:
    - Rebase on the current mt76 tree.
    - Handle the newly added TX power setup failure.
    - Restore monitor state on radios that were already running.

 .../net/wireless/mediatek/mt76/mt7996/main.c  | 33 ++++++++++++++++---
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 9321c8146e2a..9f1927cad5c4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -24,20 +24,20 @@ int mt7996_run(struct mt7996_phy *phy)
 
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
 
 	ret = mt7996_mcu_set_tx_power_ctrl(phy, UNI_TXPOWER_SKU_POWER_LIMIT_CTRL,
 					   true);
 	if (ret)
-		return ret;
+		goto disable_radio;
 
 	set_bit(MT76_STATE_RUNNING, &phy->mt76->state);
 
@@ -50,6 +50,11 @@ int mt7996_run(struct mt7996_phy *phy)
 	}
 
 	return 0;
+
+disable_radio:
+	mt7996_mcu_set_radio_en(phy, false);
+
+	return ret;
 }
 
 static int mt7996_start(struct ieee80211_hw *hw)
@@ -563,6 +568,8 @@ static int mt7996_add_interface(struct ieee80211_hw *hw,
 	struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
 	struct wireless_dev *wdev = ieee80211_vif_to_wdev(vif);
 	struct mt7996_dev *dev = mt7996_hw_dev(hw);
+	unsigned long monitor_changed = 0;
+	unsigned long started = 0;
 	int i, err = 0;
 
 	mutex_lock(&dev->mt76.mutex);
@@ -577,10 +584,14 @@ static int mt7996_add_interface(struct ieee80211_hw *hw,
 			err = mt7996_run(phy);
 			if (err)
 				goto out;
+			set_bit(i, &started);
 		}
 
-		if (vif->type == NL80211_IFTYPE_MONITOR)
+		if (vif->type == NL80211_IFTYPE_MONITOR) {
+			if (phy->rxfilter & MT_WF_RFCR_DROP_OTHER_UC)
+				set_bit(i, &monitor_changed);
 			mt7996_set_monitor(phy, true);
+		}
 	}
 
 	mt76_vif_init(vif, &mvif->mt76);
@@ -590,6 +601,18 @@ static int mt7996_add_interface(struct ieee80211_hw *hw,
 
 out:
 	mutex_unlock(&dev->mt76.mutex);
+	if (err) {
+		for_each_set_bit(i, &monitor_changed, MT7996_MAX_RADIOS) {
+			struct mt7996_phy *phy = dev->radio_phy[i];
+
+			mutex_lock(&dev->mt76.mutex);
+			mt7996_set_monitor(phy, false);
+			mutex_unlock(&dev->mt76.mutex);
+		}
+
+		for_each_set_bit(i, &started, MT7996_MAX_RADIOS)
+			mt7996_stop_phy(dev->radio_phy[i]);
+	}
 
 	return err;
 }
-- 
2.34.1


