Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43938CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 22:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pJGbQvKOank3p6da5RP7YzMSzAjqQT4QAALgpjG02Ys=; b=OM+haxpLJZ4uvBTwLI5+eD9vVG
	NRfItULfGISSu9kjirg2Xoe6Q6Yp1vNRXHZAz3XetTLvAlXt5A1bO6eviAC8CJ41PzcI7Ce3tfE4k
	+m+QpR6ExbFrGfl5en3SW4MUH2ET01N/vtRBD1QW4MlOSEXXn7asiBMBewQL3xtnzoKkTBOaLbykI
	XRZvO5KAEbZfB15ZhrDn+lK0UbpPcPuMOPsUwW4cgqhI589gc+6ClG8xdzsU+IaIZKDS60Lx3CRFz
	JTy3PSIxmKK0ccYuWtdUYf257RTQF3d742S5aiW+ZPnZvREU+w323gZxRm2j/4NI2QrVbnoG5FfyM
	uwfKLo6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwpak-00000005ey4-1Won;
	Thu, 11 Sep 2025 22:16:34 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwpah-00000005ex8-0N9u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 22:16:32 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-32dd4fa054bso1051603a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 15:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757628990; x=1758233790; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pJGbQvKOank3p6da5RP7YzMSzAjqQT4QAALgpjG02Ys=;
        b=ibJQmbFD2cV4Q5eHzZPDPmNIbbanTMp8kWdSmDhWbmzcmfmI8LZJaSoxZqmsgFKPjN
         Or6naBKyRYy9jIG0EhcE6YqGRiF8MGoyXvvGmg/9OhWlvRBaRGqp6d2IR1w8Nrye+U2U
         3frnU0xYx4Xns/9ajvU+tSOFTPNp9Av0l9y295+JO65o0VNZG+BDjVuZCTkWepUv8EGC
         1oxos4gYi1JbCTEiwT7r738JqvIRP4Lsj5NptY9fMHXnDDUDC6Yj0PSkp2IiCehuMDIN
         F/zt/PzNxsc+FwR2p0GLprJX5FWYWZrEFNF8rdI9o6E7KQFX9nSEbXDXk42QswhJ9MU+
         6iBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757628990; x=1758233790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pJGbQvKOank3p6da5RP7YzMSzAjqQT4QAALgpjG02Ys=;
        b=DsNg+GA8gMAQGnOTopAV4fqYWoocn00dadSFd4KAvztldkjEmT4cOrKM6n7z9zARrP
         aGjZIJVOHd/I0tB6OT4h0aaMIF6kIeuJ29GkbMzLTWrz3BDhbihxOoVNWatGehz+DuFU
         Zos0tSDALiL7x95u3FH1D7nup1YKWNaJB9EHdgI8IHMrsotZoNlCRAzanzvioZOpUsNp
         c+cWgdhCVg7dOTjrNF/BeabR+3iNVrQNspfqyjHFCst6jdSsnvMHc5cmiy6scVCRNCfK
         8e5fconnsKIlLyTK1qckc/SatnK2IhBiXP+ITt2FGOqYJdjJ8Yi9vLgKJIPXX01RKdj6
         tP8w==
X-Forwarded-Encrypted: i=1; AJvYcCUWGQCHGgKJl9jlFfq3R9O8JhqOXW+JngNsVqJi8cHKfiHVOAZwdaj4adx25aImlHmLzTFagMTR+EnZJXIqO0m3@lists.infradead.org
X-Gm-Message-State: AOJu0YxEsSUi6SljOtZK2ZXHTgHknd+onmxV9ptUDrRCHEr2ttM29dE/
	NYVoD3hikLpYlF87IKq+n0UNMMYWhiBiPXYnFvRBp3o7nXd4k9eWrHSW
X-Gm-Gg: ASbGncvEOs2uAQbdTYEzZAqy7A4zDvVN4aYqMfojZMa52ZbZw2u5exqDF8L+dXXub78
	2leRbBPjJyAXHCdJX62H2USz3984WqzhubQdrQEvG91hd5KWY+DShGzT3cAFDyZH7NwArHN+MeG
	lSJDdB+cQqBgtup4wzsLeZG+g2uSJbfhh1KFLtaIv8ArVCCYeXgnW4X5fxogHAJXGpoWVxPAWhd
	QjQzUOw4+CZs5FUE2zVEEoVDGzOk8tvm+A2plkqZ2/G3NzE4GPrvBxWM36p1GyhmO1KtmAFGR63
	kN893xUmWh4HhfqJQ1U7dJcXKxvOMh9Paamgl9l3xoCOVp75/TbooinHtaBEAOUKPJWTzJUBCMr
	dRK/XgH2talxZaXOJGmGL7Ea4VQeNDX6/7ZZ+Ck5daC+yLI7FzfL5Pfj0wcZ0PusonTg52T8=
X-Google-Smtp-Source: AGHT+IHiZ0i/fqjHfxLIg5y5A42HChRZzH9Wsg1ARyoCs3aMcn6FX+kE2ZCfPOxdtSDNrlPgVgR80w==
X-Received: by 2002:a17:90b:250b:b0:32d:dfb5:36d8 with SMTP id 98e67ed59e1d1-32ddfb54564mr1649322a91.8.1757628989675;
        Thu, 11 Sep 2025 15:16:29 -0700 (PDT)
Received: from archlinux ([2601:644:8200:ac2f::9ec])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32dd9509002sm3333995a91.0.2025.09.11.15.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 15:16:29 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH] wifi: mt76: mt76_eeprom_override to int
Date: Thu, 11 Sep 2025 15:16:19 -0700
Message-ID: <20250911221619.16035-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_151631_130287_2CCD0ED4 
X-CRM114-Status: GOOD (  17.40  )
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

mt76_eeprom_override has of_get_mac_address, which can return
-EPROBE_DEFER if the nvmem driver gets loaded after mt76 for some
reason.

Make sure this gets passed to probe so that nvmem mac overrides always
work.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/eeprom.c        | 9 +++++++--
 drivers/net/wireless/mediatek/mt76/mt76.h          | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7603/eeprom.c | 3 +--
 drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c | 4 +---
 drivers/net/wireless/mediatek/mt76/mt7615/init.c   | 5 ++++-
 drivers/net/wireless/mediatek/mt76/mt76x0/eeprom.c | 6 +++++-
 drivers/net/wireless/mediatek/mt76/mt76x2/eeprom.c | 4 +++-
 drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c | 4 +---
 drivers/net/wireless/mediatek/mt76/mt7915/init.c   | 4 +++-
 drivers/net/wireless/mediatek/mt76/mt7921/init.c   | 4 +++-
 drivers/net/wireless/mediatek/mt76/mt7925/init.c   | 4 +++-
 drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c | 3 +--
 drivers/net/wireless/mediatek/mt76/mt7996/init.c   | 4 +++-
 13 files changed, 36 insertions(+), 20 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
index 443517d06c9f..a987c5e4eff6 100644
--- a/drivers/net/wireless/mediatek/mt76/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
@@ -163,13 +163,16 @@ static int mt76_get_of_eeprom(struct mt76_dev *dev, void *eep, int len)
 	return mt76_get_of_data_from_nvmem(dev, eep, "eeprom", len);
 }
 
-void
+int
 mt76_eeprom_override(struct mt76_phy *phy)
 {
 	struct mt76_dev *dev = phy->dev;
 	struct device_node *np = dev->dev->of_node;
+	int err;
 
-	of_get_mac_address(np, phy->macaddr);
+	err = of_get_mac_address(np, phy->macaddr);
+	if (err == -EPROBE_DEFER)
+		return err;
 
 	if (!is_valid_ether_addr(phy->macaddr)) {
 		eth_random_addr(phy->macaddr);
@@ -177,6 +180,8 @@ mt76_eeprom_override(struct mt76_phy *phy)
 			 "Invalid MAC address, using random address %pM\n",
 			 phy->macaddr);
 	}
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(mt76_eeprom_override);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 127637454c82..47c143e6a79a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -1268,7 +1268,7 @@ void mt76_seq_puts_array(struct seq_file *file, const char *str,
 			 s8 *val, int len);
 
 int mt76_eeprom_init(struct mt76_dev *dev, int len);
-void mt76_eeprom_override(struct mt76_phy *phy);
+int mt76_eeprom_override(struct mt76_phy *phy);
 int mt76_get_of_data_from_mtd(struct mt76_dev *dev, void *eep, int offset, int len);
 int mt76_get_of_data_from_nvmem(struct mt76_dev *dev, void *eep,
 				const char *cell_name, int len);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7603/eeprom.c
index f5a6b03bc61d..88382b537a33 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/eeprom.c
@@ -182,7 +182,6 @@ int mt7603_eeprom_init(struct mt7603_dev *dev)
 		dev->mphy.antenna_mask = 1;
 
 	dev->mphy.chainmask = dev->mphy.antenna_mask;
-	mt76_eeprom_override(&dev->mphy);
 
-	return 0;
+	return mt76_eeprom_override(&dev->mphy);
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c
index ccedea7e8a50..d4bc7e11e772 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c
@@ -351,8 +351,6 @@ int mt7615_eeprom_init(struct mt7615_dev *dev, u32 addr)
 	memcpy(dev->mphy.macaddr, dev->mt76.eeprom.data + MT_EE_MAC_ADDR,
 	       ETH_ALEN);
 
-	mt76_eeprom_override(&dev->mphy);
-
-	return 0;
+	return mt76_eeprom_override(&dev->mphy);
 }
 EXPORT_SYMBOL_GPL(mt7615_eeprom_init);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
index aae80005a3c1..3e7af3e58736 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
@@ -570,7 +570,10 @@ int mt7615_register_ext_phy(struct mt7615_dev *dev)
 	       ETH_ALEN);
 	mphy->macaddr[0] |= 2;
 	mphy->macaddr[0] ^= BIT(7);
-	mt76_eeprom_override(mphy);
+
+	ret = mt76_eeprom_override(mphy);
+	if (ret)
+		return ret;
 
 	/* second phy can only handle 5 GHz */
 	mphy->cap.has_5ghz = true;
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt76x0/eeprom.c
index 4de45a56812d..d4506b8b46fa 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/eeprom.c
@@ -332,7 +332,11 @@ int mt76x0_eeprom_init(struct mt76x02_dev *dev)
 
 	memcpy(dev->mphy.macaddr, (u8 *)dev->mt76.eeprom.data + MT_EE_MAC_ADDR,
 	       ETH_ALEN);
-	mt76_eeprom_override(&dev->mphy);
+
+	err = mt76_eeprom_override(&dev->mphy);
+	if (err)
+		return err;
+
 	mt76x02_mac_setaddr(dev, dev->mphy.macaddr);
 
 	mt76x0_set_chip_cap(dev);
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x2/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt76x2/eeprom.c
index 156b16c17b2b..221805deb42f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x2/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x2/eeprom.c
@@ -499,7 +499,9 @@ int mt76x2_eeprom_init(struct mt76x02_dev *dev)
 
 	mt76x02_eeprom_parse_hw_cap(dev);
 	mt76x2_eeprom_get_macaddr(dev);
-	mt76_eeprom_override(&dev->mphy);
+	ret = mt76_eeprom_override(&dev->mphy);
+	if (ret)
+		return ret;
 	dev->mphy.macaddr[0] &= ~BIT(1);
 
 	return 0;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
index c0f3402d30bb..38dfd5de365c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
@@ -284,9 +284,7 @@ int mt7915_eeprom_init(struct mt7915_dev *dev)
 	memcpy(dev->mphy.macaddr, dev->mt76.eeprom.data + MT_EE_MAC_ADDR,
 	       ETH_ALEN);
 
-	mt76_eeprom_override(&dev->mphy);
-
-	return 0;
+	return mt76_eeprom_override(&dev->mphy);
 }
 
 int mt7915_eeprom_get_target_power(struct mt7915_dev *dev,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 3e30ca5155d2..5ea8b46e092e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -702,7 +702,9 @@ mt7915_register_ext_phy(struct mt7915_dev *dev, struct mt7915_phy *phy)
 		mphy->macaddr[0] |= 2;
 		mphy->macaddr[0] ^= BIT(7);
 	}
-	mt76_eeprom_override(mphy);
+	ret = mt76_eeprom_override(mphy);
+	if (ret)
+		return ret;
 
 	/* init wiphy according to mphy and phy */
 	mt7915_init_wiphy(phy);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index 14e17dc90256..b9098a7331b1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -189,7 +189,9 @@ static int __mt7921_init_hardware(struct mt792x_dev *dev)
 	if (ret)
 		goto out;
 
-	mt76_eeprom_override(&dev->mphy);
+	ret = mt76_eeprom_override(&dev->mphy);
+	if (ret)
+		goto out;
 
 	ret = mt7921_mcu_set_eeprom(dev);
 	if (ret)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/init.c b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
index 4249bad83c93..d7d5afe365ed 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
@@ -249,7 +249,9 @@ static int __mt7925_init_hardware(struct mt792x_dev *dev)
 	if (ret)
 		goto out;
 
-	mt76_eeprom_override(&dev->mphy);
+	ret = mt76_eeprom_override(&dev->mphy);
+	if (ret)
+		goto out;
 
 	ret = mt7925_mcu_set_eeprom(dev);
 	if (ret)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
index 87c6192b6384..da3231c9aa11 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
@@ -334,9 +334,8 @@ int mt7996_eeprom_init(struct mt7996_dev *dev)
 		return ret;
 
 	memcpy(dev->mphy.macaddr, dev->mt76.eeprom.data + MT_EE_MAC_ADDR, ETH_ALEN);
-	mt76_eeprom_override(&dev->mphy);
 
-	return 0;
+	return mt76_eeprom_override(&dev->mphy);
 }
 
 int mt7996_eeprom_get_target_power(struct mt7996_dev *dev,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index a9599c286328..0537475573ad 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -667,7 +667,9 @@ static int mt7996_register_phy(struct mt7996_dev *dev, enum mt76_band_id band)
 		if (band == MT_BAND2)
 			mphy->macaddr[0] ^= BIT(6);
 	}
-	mt76_eeprom_override(mphy);
+	ret = mt76_eeprom_override(mphy);
+	if (ret)
+		goto error;
 
 	/* init wiphy according to mphy and phy */
 	mt7996_init_wiphy_band(mphy->hw, phy);
-- 
2.51.0


