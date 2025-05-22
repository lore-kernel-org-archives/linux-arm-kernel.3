Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BAD5C54E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 17:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bSfESP3eCTxh/lZuV155AcEe86QVGTg9cJglhVrSbYE=; b=a4KlWEtPKv71l0X4tUxoxIjAuX
	/L9SSovs3KSb/ZjRGblDRX8SR9Sp+nWheWMOdNj3t917ZYJZ6QJa3msnzi4bxh85ek2KL7n4bIOp2
	dNMtOmcnHqfZjajntgANNMYzrB6WTu9GYjqqsGFX7yBMQyGdZURTyZ+VqNCUliYVubq4Esz37AjZq
	UFxMPsHfx/Xtt2pS4DUz9HEE5z2uY8ipGvWMTb0EkUPWMhVXI3MSZDz7ZEBQ7SQCw/wEhDBN27736
	V2J2iCE5ejMnBnWmUl/tDy8jrI5xBYbPKAz25lIcLq7FOPPWawnqmzaT2VsXdUycK0teLp9w19MWW
	GloMsEsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI9J5-00000001gxG-2zbk;
	Thu, 22 May 2025 17:02:11 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI9B7-00000001fZV-0pVL;
	Thu, 22 May 2025 16:53:58 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43d0618746bso67788315e9.2;
        Thu, 22 May 2025 09:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747932835; x=1748537635; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bSfESP3eCTxh/lZuV155AcEe86QVGTg9cJglhVrSbYE=;
        b=UwNoGOhHZVKIKodAmUMNO7tStGkW0lsnO7FnA2L4NhYzACAQamJgPTR3nU54YN6PcO
         NmWcQR0FKmZAN2vkvhVTJEvwBlz/flkSX5r4bLCO29bLOTQ8jcaRt/7xI4D1hc2uu4+u
         lk2rQDBFvLB0GD/ioru6iTg8vv2InfSoUthIA82nmQt+jgvC5dBjFsY1Lui4nLo23tWL
         XRLprfLx07/PSAHUF/3n9ZCcnFHRQ2E+lVbnkQWgIq+peFK1RWgrV7o1z5Ocx+CZSLdJ
         +XoT80UoTKAwk2cJRGV25rJzvWLEIo9pnh/UAsLbu9EXuHVMlDBkW+8jnDGxbzXJf0Er
         94Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747932835; x=1748537635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bSfESP3eCTxh/lZuV155AcEe86QVGTg9cJglhVrSbYE=;
        b=Y4WY+kAElQGJw/1lHXUWM1Ttblbc1gpIFvKLPDtfmkb5u5uCV0fRrxIaCV1+M2Z2B+
         bePGgQoetPvqCbgcA4v4Ua6W1p6IsAu9i2hMPKLP9ofqYYHa79TzT0RbV0c2iXhBlf1C
         ScZ47Yy6mJCo9BFM6oDoZfRFckmWc44voeLroeTupJLRIb/t82vt+b4rtIQFn8Lkh1nd
         xHFk5Djj5MnbbHosVJTcbex4MNbmVEsBMS25fxxWsdxubc5NhJc0LAn7uEfKYvCFGqDF
         pMI+LgU3KWg+cPHZCKVPr2oqIJT4piXJf+l+EnknVEQswhxMuWca5OFox/3ZFFHHw+7N
         MdDQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1gOL052TgT3q7RIkmLs3+1kI58GRJQ83RskVJVgQcXtwpIFvZWHEbxnGkYt4I4aPDOTC1ilybSJOOKlXufls=@lists.infradead.org, AJvYcCWWxbLsZg5uWNyMHLMyuek0PnpFor0K8AztBbXDahKgg2tyD2Sgyy2hz1VGmSAqituX96R1VuR8Rk7fdZVSf+mL@lists.infradead.org
X-Gm-Message-State: AOJu0YwXXN7B8/gwWVqDKda2npspViRlj3oFb4U3bza7MvtAktb6/Vih
	F+ZqWTkF5qVVeEE+mUIFU4qBEKC238FkpZVl8qowTzpo3gu3JJrIO+0+
X-Gm-Gg: ASbGnct6JEuUzrNZQg+J+jPQFwuHxgEl4qs/VaZillalVQr2ayxLJRWzGNyJOlWDf/p
	LWIKF45gLk69oKbwtB/94omrf2NLqCr/d6HaVnfxXM2BwxKFTkuLcuSwZPQ2vW2E1pHAunx5guh
	9tF56ipFDIwWvp/8YsI0mGX1keSrWjG9tlyE6iCP45JaRGs4/5bp6kf0KLBH30tB8rQcrB/vuj3
	o3my72Mr74SkrB+F0BanqSyr4ejEM8TGnV/FgrQvwNO2YmZ3SQXuf/xjqWERv9VDYqVfFofC5I9
	oRkTUhB6i8ZRPWvJymC9xxsLPMq6Qcg3lheYRQNPIHze5ZI7OX8cyEpwYEABSgGxjIJH9aDIlqI
	pUeobKd/NKwLjwnDXjuSQkQTfZIDZIlE=
X-Google-Smtp-Source: AGHT+IEzv6dDW2P+AO+sDCJeKnMjKX39Z0fgtVNTUSFY3hWWH8aZvhhzfZqCq/1J9bR4RY3rI7hlEQ==
X-Received: by 2002:a05:600c:c1c8:20b0:43c:f3e4:d6f6 with SMTP id 5b1f17b1804b1-44302a1f0d5mr152421885e9.31.1747932835423;
        Thu, 22 May 2025 09:53:55 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-447f6b297easm118737525e9.6.2025.05.22.09.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 09:53:54 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [net-next PATCH 3/3] net: phy: mediatek: Add Airoha AN7583 PHY support
Date: Thu, 22 May 2025 18:53:11 +0200
Message-ID: <20250522165313.6411-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250522165313.6411-1-ansuelsmth@gmail.com>
References: <20250522165313.6411-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_095357_233603_8756086B 
X-CRM114-Status: GOOD (  13.94  )
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

Add Airoha AN7583 PHY support based on Airoha AN7581 with the small
difference that BMCR_PDOWN is enabled by default and needs to be cleared
to make the internal PHY correctly work.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/mediatek/mtk-ge-soc.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/net/phy/mediatek/mtk-ge-soc.c b/drivers/net/phy/mediatek/mtk-ge-soc.c
index a284e8435cb6..cd09fbf92ef2 100644
--- a/drivers/net/phy/mediatek/mtk-ge-soc.c
+++ b/drivers/net/phy/mediatek/mtk-ge-soc.c
@@ -17,6 +17,7 @@
 #define MTK_GPHY_ID_MT7981			0x03a29461
 #define MTK_GPHY_ID_MT7988			0x03a29481
 #define MTK_GPHY_ID_AN7581			0x03a294c1
+#define MTK_GPHY_ID_AN7583			0xc0ff0420
 
 #define MTK_EXT_PAGE_ACCESS			0x1f
 #define MTK_PHY_PAGE_STANDARD			0x0000
@@ -1463,6 +1464,12 @@ static int an7581_phy_led_polarity_set(struct phy_device *phydev, int index,
 			      MTK_PHY_LED_ON_POLARITY, val);
 }
 
+static int an7583_phy_config_init(struct phy_device *phydev)
+{
+	/* BMCR_PDOWN is enabled by default */
+	return phy_clear_bits(phydev, MII_BMCR, BMCR_PDOWN);
+}
+
 static struct phy_driver mtk_socphy_driver[] = {
 	{
 		PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7981),
@@ -1509,6 +1516,18 @@ static struct phy_driver mtk_socphy_driver[] = {
 		.led_hw_control_get = mt798x_phy_led_hw_control_get,
 		.led_polarity_set = an7581_phy_led_polarity_set,
 	},
+	{
+		PHY_ID_MATCH_EXACT(MTK_GPHY_ID_AN7583),
+		.name		= "Airoha AN7583 PHY",
+		.config_init	= an7583_phy_config_init,
+		.probe		= an7581_phy_probe,
+		.led_blink_set	= mt798x_phy_led_blink_set,
+		.led_brightness_set = mt798x_phy_led_brightness_set,
+		.led_hw_is_supported = mt798x_phy_led_hw_is_supported,
+		.led_hw_control_set = mt798x_phy_led_hw_control_set,
+		.led_hw_control_get = mt798x_phy_led_hw_control_get,
+		.led_polarity_set = an7581_phy_led_polarity_set,
+	},
 };
 
 module_phy_driver(mtk_socphy_driver);
@@ -1517,6 +1536,7 @@ static const struct mdio_device_id __maybe_unused mtk_socphy_tbl[] = {
 	{ PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7981) },
 	{ PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7988) },
 	{ PHY_ID_MATCH_EXACT(MTK_GPHY_ID_AN7581) },
+	{ PHY_ID_MATCH_EXACT(MTK_GPHY_ID_AN7583) },
 	{ }
 };
 
-- 
2.48.1


