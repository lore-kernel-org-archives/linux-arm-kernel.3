Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1626BC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 21:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RtBm7dhzS7vdeIwSr3GhYSR7TMJjCHW8IHR7lAffLu0=; b=TabVN1qdv0tGeuS1TghJi6jXrE
	K0vSM5q941iTYMH3c+aqgH2NlOHAwQEhOdSaVStteRLHd48mqLIj7ErkKINARbay7CWyGUWzRoxR/
	SMGIAkSYsyYl02PLdUaUDmsLONj7jeZLQmRnirxhN808DwDRefLcL5RTgHBhYjnvwJgAPwXPCNDUp
	e/96bqfY7wxROg353Nhw0cgNUGvhAyeP6rTwGbiu0C938b7fclPEC/rlUSYQjD0xgnQLQjXRIQzwe
	mBV7LSBZNeYy95L3apzEGQPxuCvDfuBp3Hk+05mvCw7bmjEZTqbq5xS6OJA2GF1sb5CWNT6urR6Xn
	jzHu/zZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPplf-0000000EglQ-0WDD;
	Thu, 12 Jun 2025 21:47:27 +0000
Received: from mail-wr1-f43.google.com ([209.85.221.43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPpT4-0000000EegY-2Swy;
	Thu, 12 Jun 2025 21:28:15 +0000
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a50fc7ac4dso981536f8f.0;
        Thu, 12 Jun 2025 14:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749763693; x=1750368493; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RtBm7dhzS7vdeIwSr3GhYSR7TMJjCHW8IHR7lAffLu0=;
        b=jfkuup3ApMM/85/ldg4lEHM6DjocjzXc65ap4kpKu+Iz18ox3FO5joge6RoWI2Gvf0
         NdYsz2F1vAapkZoI2+vPOxpbjIZRW8RU3JIPwG2PcdHcVSmtRgUZW71wY0YC3WhgBJZk
         08ttmGy4VPJ60B2cOnz3VGvc2QYHlOa7lfhYKX42s5xoK2lAzH7i4H7sN+Eiaho8xxg/
         B1CkBB5Y/BqIHPOCzv/GWRy+bMQdjqu2CVCiHKOkW8ajap5FmUY33TxgwPlIZKChjPqz
         CdfJxws8a3dt04btSZDzt7u3i3Md4aQGGvUEJQKl9iyGkLgDNGwTp84Ity//XMx/aeS3
         Rl3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749763693; x=1750368493;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RtBm7dhzS7vdeIwSr3GhYSR7TMJjCHW8IHR7lAffLu0=;
        b=kNoGhXVu6CKStjFGIdBq6+z3FP01I5WckmoRgsc5wRDykVeROYhz1iMIbiBsldcohL
         mYMxl0qqA/3oZaQx7B6up0K5Fvu9mavfrcNNuCKR+nnw8L1igiNRyaVVERshw0pZ6eOw
         OjBiuYP+SCEc4jD3u6OGEqOyyNV/P5PRSuRC24zReQRDwp6o7kqx5VeeVTUbpIssemFL
         o2i/q+k+LT16RuAvHoLWY5oDHSj2a9/y/YoL5r9Kq3deZ0meSbKhkT4KHNGReFZ+M5Tk
         6g8/P6ENwGrgcnwQwAWtcC9njy6gSaxEKcKc+ozZgISBQDziT01zQOqSkd8C77TbEyTa
         DKlw==
X-Forwarded-Encrypted: i=1; AJvYcCVS9KlaORpgCMHDividmOhLMLpUdcK+/RfMBCMrj22Ty802bbgRF+6hxPzXt9TWeKn6PgUN8Qf9YTO77R1faz4r@lists.infradead.org, AJvYcCW7qKvqLl2nxF7V+go2xRBk2g3WkTPDf1a78YKcMkdVhnmMMX8A1uOzoVQ4M1Rury67GdDDJZ1B1UyYy22NlGU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4J7s45hf15B3P+KhgdgZr6TpNO76wyg3ENhjDUxcAx9K1vCVb
	foKDbLGc0jYJGFdY2z1rPgFMufg5/PEnuuVT/KOCLx/tThzM76P3VV+d
X-Gm-Gg: ASbGncvU5zQJKLl/t5UTk6xGycqsxGlMaghMgOVbhPeQ5BeYw2s0YtjWCGXFsQiojyN
	7h4Sw0KqcYtwpx5oK3ObBPxHM0ksk1QCFHZ3y9xllJcmjd14xphFjqjDEkvLRqD+WWcXEYGVSfL
	8c8wPbI/lE7YCtuuqnjN+TzgV4p8S+iz63qcleAVjbbtYX+3Vumx7qQ3fKi8PTUCtksxDzepiPl
	xmbfkYhfD8rk2IyaIejdheQPbenlFlNB5wkuwMxM+H0CIliwFzo+ixAmfTQItnNxQZLpwWj2n9y
	kShwRX0dxosTnJsPB4ulEAkEyhDWBLJGIcdNsEoqj5BOix4ARkjxMLJE5yxR57GTC69P1aEWW+q
	VGS2uTFZIxS1XBvWNJvVhg1i7W5s8rWdoWeBZmpX4uGbUzSd9fcaVh9sXJB1t3Th5Xh6yg4KxR+
	lJSf6zpWwYBSMR0uzd8pzkmDxLjQ==
X-Google-Smtp-Source: AGHT+IE1XU4nO/VzkNo3ZuofzqheSkVfnICKLzbgowD//YuyvE9aSKTHQ8v90RNFDlyeUk68AvpS0w==
X-Received: by 2002:a05:6000:1acc:b0:3a5:2875:f986 with SMTP id ffacd0b85a97d-3a56871751cmr620856f8f.44.1749763692667;
        Thu, 12 Jun 2025 14:28:12 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f22:3f00:7533:d8b1:ff14:6fe5? (p200300ea8f223f007533d8b1ff146fe5.dip0.t-ipconnect.de. [2003:ea:8f22:3f00:7533:d8b1:ff14:6fe5])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a568b2ca65sm413139f8f.77.2025.06.12.14.28.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 14:28:12 -0700 (PDT)
Message-ID: <42c05496-61b2-4b09-b853-3d99b3dfe95c@gmail.com>
Date: Thu, 12 Jun 2025 23:28:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 3/3] net: phy: add Kconfig symbol PHY_PACKAGE
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, David Miller <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org
References: <eec346a4-e903-48af-8150-0191932a7a0b@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <eec346a4-e903-48af-8150-0191932a7a0b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_142814_631853_3C55483F 
X-CRM114-Status: GOOD (  12.65  )
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

Only a handful of PHY drivers needs the PHY package functionality,
therefore build the module only if needed.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/Kconfig          | 6 ++++++
 drivers/net/phy/Makefile         | 2 +-
 drivers/net/phy/mediatek/Kconfig | 1 +
 drivers/net/phy/qcom/Kconfig     | 1 +
 4 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
index 53dad2482..28acc6392 100644
--- a/drivers/net/phy/Kconfig
+++ b/drivers/net/phy/Kconfig
@@ -25,6 +25,9 @@ if PHYLIB
 config SWPHY
 	bool
 
+config PHY_PACKAGE
+	 tristate
+
 config LED_TRIGGER_PHY
 	bool "Support LED triggers for tracking link state"
 	depends on LEDS_TRIGGERS
@@ -157,6 +160,7 @@ config BCM54140_PHY
 	tristate "Broadcom BCM54140 PHY"
 	depends on HWMON || HWMON=n
 	select BCM_NET_PHYLIB
+	select PHY_PACKAGE
 	help
 	  Support the Broadcom BCM54140 Quad SGMII/QSGMII PHY.
 
@@ -292,6 +296,7 @@ source "drivers/net/phy/mediatek/Kconfig"
 config MICREL_PHY
 	tristate "Micrel PHYs"
 	depends on PTP_1588_CLOCK_OPTIONAL
+	select PHY_PACKAGE
 	help
 	  Supports the KSZ9021, VSC8201, KS8001 PHYs.
 
@@ -323,6 +328,7 @@ config MICROSEMI_PHY
 	depends on MACSEC || MACSEC=n
 	depends on PTP_1588_CLOCK_OPTIONAL || !NETWORK_PHY_TIMESTAMPING
 	select CRYPTO_LIB_AES if MACSEC
+	select PHY_PACKAGE
 	help
 	  Currently supports VSC8514, VSC8530, VSC8531, VSC8540 and VSC8541 PHYs
 
diff --git a/drivers/net/phy/Makefile b/drivers/net/phy/Makefile
index 4e69597f2..b4795aaf9 100644
--- a/drivers/net/phy/Makefile
+++ b/drivers/net/phy/Makefile
@@ -19,7 +19,7 @@ obj-$(CONFIG_MDIO_BUS)		+= mdio-bus.o
 obj-$(CONFIG_PHYLINK)		+= phylink.o
 obj-$(CONFIG_PHYLIB)		+= libphy.o
 obj-$(CONFIG_PHYLIB)		+= mdio_devres.o
-obj-$(CONFIG_PHYLIB)		+= phy_package.o
+obj-$(CONFIG_PHY_PACKAGE)	+= phy_package.o
 
 obj-$(CONFIG_NETWORK_PHY_TIMESTAMPING) += mii_timestamper.o
 
diff --git a/drivers/net/phy/mediatek/Kconfig b/drivers/net/phy/mediatek/Kconfig
index 9f30a91be..bb7dc8762 100644
--- a/drivers/net/phy/mediatek/Kconfig
+++ b/drivers/net/phy/mediatek/Kconfig
@@ -27,6 +27,7 @@ config MEDIATEK_GE_SOC_PHY
 	depends on ARCH_AIROHA || (ARCH_MEDIATEK && NVMEM_MTK_EFUSE) || \
 		   COMPILE_TEST
 	select MTK_NET_PHYLIB
+	select PHY_PACKAGE
 	help
 	  Supports MediaTek SoC built-in Gigabit Ethernet PHYs.
 
diff --git a/drivers/net/phy/qcom/Kconfig b/drivers/net/phy/qcom/Kconfig
index 570626cc8..bba14be8d 100644
--- a/drivers/net/phy/qcom/Kconfig
+++ b/drivers/net/phy/qcom/Kconfig
@@ -24,6 +24,7 @@ config QCA808X_PHY
 config QCA807X_PHY
 	tristate "Qualcomm QCA807x PHYs"
 	select QCOM_NET_PHYLIB
+	select PHY_PACKAGE
 	depends on OF_MDIO
 	help
 	  Currently supports the Qualcomm QCA8072, QCA8075 and the PSGMII
-- 
2.49.0



