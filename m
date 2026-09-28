Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1382ACA5FA6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 19:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wYkBWEaad7pJtWSE9fUzK8FJHWmMOd6HhAL0BzGHkSI=; b=d78cv9M0Kv95K8J8V2gXjBng4n
	HNv4D+yQyHMa0vGqI31Ew8l7J2pEDbkPSfVwS4fKvIk5DEnKyPcEQrt/DVeQ9sEbUS+Dfg44vAkci
	lVtkDYQtITqgSHps+OHxyUMQWf3dvfq6WW/KlXpCLkEY8Ggl1MVfRErygHL5It1YCBtBLYE2Nu2h7
	tf2QNRpfs5HavoKW2ItWbzExHfY3fl6IgpMLgKNIwGovmGNKALRMGnDAvAmXw+ykqGv7hkkGUKdyR
	AmrLnMOP96TW02o6aqS9tZJZDI1YQMHoXNYzlumk1w9yauwq9RNKlnUCNEkHG9u1PVK4OmHiwsEqE
	DG1tYxuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBHJX-00000001V6c-3EhW;
	Mon, 28 Sep 2026 19:47:03 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBHIk-00000001Udn-0y2X
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 19:46:15 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-48434392b02so2964144f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 12:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790624772; x=1791229572; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wYkBWEaad7pJtWSE9fUzK8FJHWmMOd6HhAL0BzGHkSI=;
        b=hIpSEQjMNB307pS8MswbKSK8Uc6vrGnGaq+6RHo048VNcmVLpY4V9g6TXeIQL2v+Bw
         foxx8MKcnJ6ey63zymTL5F4RJ34N2v/brp/64D2DeUpI3lclFlBVilpHLotSWLrjVDSH
         XZi0QMfIt/laXTX05i6ve/qrhtxrogQe9L1iIQcZrSDD82pvwREK/b0O7UbVzUz4tHx2
         VtJ6u6bB9fKD5GMXqpjr90nBTdKWyAhxgt3Yak3+z9aS/Maa5pc0JptliSGpruPiZhc8
         KNDwqRr9MVuZxGTqOrOwW+/14CgwIETmorwE/Bw28MtNEwNNiTYKyr1hJ0IPMXjo90bu
         81YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790624772; x=1791229572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wYkBWEaad7pJtWSE9fUzK8FJHWmMOd6HhAL0BzGHkSI=;
        b=mr1hlGQeihzGvldJY8dJ2AO68tUfoU3ecccU1f8IRF//v7y4nVl7i9ckIl+m1BYJWE
         dVH3idF4RAfN4fQd9QCBWb2RbgNy/WdONqCPNkB4DOc1uTj7w+XLdbTAT3PPREDAbZnA
         5xOOnnvUR0ogtRiZGmGygY7pQQnxO29TTy8hZsd1B80HTGGJsUeUxpScfd/UkBZ2ackI
         gVHE1s7ybe+lOBeZRacRlXIaX4FKkTP+xjSJw6LbkXIp41LCxvIg0Af08pPdmLtPPCWr
         LJjw8Es9bl5kAIktVnEP2RfpW5c07xak6KDiqW70iinNvjAV5P6UxqbiX1zO2Z7omeKa
         nkdw==
X-Forwarded-Encrypted: i=1; AKwUvBwH+HfcAqHjMKjNb1IvjpEMVmCQtZZytMEcMb4kFFiUdF6P8wV0LXEgxU+t3PQAPNXI9mLqZNJ6xtqZtXBXlBVI@lists.infradead.org
X-Gm-Message-State: AFq9FYJzK9HVVQJJ5uwukb4r8mus/wvpc/HQK9mYU/o3+enKzmY8eB/V
	S5U5F5Wh4NZ6t4gd8sf/LwBVK4nBVuvrYNo00CgHSHpdH9DqV41uwNlN
X-Gm-Gg: AYBFou0DwgBEYH6oyZatFSQ0Pzz/L8/jy1Xp4MLrACeXSoCnUdPbbVt2X6G/FYx0dZO
	ttqZyAD0CRocRkN4GIcEZhZ9Ne5qjZNNGqfziWiOJuUqh5G0kY88JlhkGaUfUpxld4Vd3nxbU2W
	y+C40AA52TJUKmxEHTlPva4Zi+YgbJ+Jb7uGVhlNeIIhVTZTmoyCauHDmNyzSW3KLatKGpncq7M
	Zz0gFOM8QX/eJ6SFqGNCoFZpXg9fsdGlrZAKgxn5XD8B4bA2kpp/LINob/EK03+d0iXe2vtbP+k
	LQV5gaGbGgkin9NKsUYd0spMJMeCiay7fr1dplwj91Wd60fGl7cWoyQVQksMxxMumgNWN+WfDub
	kqTPj/xHnsm4oMK0/FtXDxxnhjsAo/XYZC27EpLLF+Rtf48vI0I2k7nPFN3BHq6WCBgQ7yrGf8c
	wRG+zsArbr1CFBxaCZGew01/Cf/p6ikDlSx+pYqjz7DLluqwBNAj4XstQIYHDYKtb1d5QkegI0N
	sEtSqJbam3eOAcvJ+4F3kKBr4ZR/tS3QEPdF81FQKAsj398gsJWBgMsWxizedW5
X-Received: by 2002:a05:6000:2511:b0:487:27f9:840 with SMTP id ffacd0b85a97d-48871726b7cmr23962375f8f.53.1790624772381;
        Mon, 28 Sep 2026 12:46:12 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-82-57-191-234.retail.telecomitalia.it. [82.57.191.234])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48af071532dsm1527706f8f.20.2026.09.28.12.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 12:46:11 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	Joris Vaisvila <joey@tinyisr.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v24 08/10] net: dsa: move mediatek DSA driver in dedicated directory
Date: Mon, 28 Sep 2026 21:45:07 +0200
Message-ID: <20260928194511.41878-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928194511.41878-1-ansuelsmth@gmail.com>
References: <20260928194511.41878-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_124614_323661_801BABFB 
X-CRM114-Status: GOOD (  19.48  )
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

To tidy things up and better organize DSA drivers, move the Mediatek
related driver to the dedicated Vendor directory.

MAINTAINERS file is updated accordingly to reference the new location.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS                                  |  6 +--
 drivers/net/dsa/Kconfig                      | 45 +-------------------
 drivers/net/dsa/Makefile                     |  5 +--
 drivers/net/dsa/mediatek/Kconfig             | 45 ++++++++++++++++++++
 drivers/net/dsa/mediatek/Makefile            |  5 +++
 drivers/net/dsa/{ => mediatek}/mt7530-mdio.c |  0
 drivers/net/dsa/{ => mediatek}/mt7530-mmio.c |  0
 drivers/net/dsa/{ => mediatek}/mt7530.c      |  0
 drivers/net/dsa/{ => mediatek}/mt7530.h      |  0
 drivers/net/dsa/{ => mediatek}/mt7628.c      |  0
 10 files changed, 55 insertions(+), 51 deletions(-)
 create mode 100644 drivers/net/dsa/mediatek/Kconfig
 create mode 100644 drivers/net/dsa/mediatek/Makefile
 rename drivers/net/dsa/{ => mediatek}/mt7530-mdio.c (100%)
 rename drivers/net/dsa/{ => mediatek}/mt7530-mmio.c (100%)
 rename drivers/net/dsa/{ => mediatek}/mt7530.c (100%)
 rename drivers/net/dsa/{ => mediatek}/mt7530.h (100%)
 rename drivers/net/dsa/{ => mediatek}/mt7628.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 59e6385b2c50..ff8c5dda07b5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16839,9 +16839,9 @@ M:	Chester A. Unal <chester.a.unal@arinc9.com>
 M:	Daniel Golle <daniel@makrotopia.org>
 L:	netdev@vger.kernel.org
 S:	Maintained
-F:	drivers/net/dsa/mt7530-mdio.c
-F:	drivers/net/dsa/mt7530-mmio.c
-F:	drivers/net/dsa/mt7530.*
+F:	drivers/net/dsa/mediatek/mt7530-mdio.c
+F:	drivers/net/dsa/mediatek/mt7530-mmio.c
+F:	drivers/net/dsa/mediatek/mt7530.*
 F:	net/dsa/tag_mtk.c
 
 MEDIATEK T7XX 5G WWAN MODEM DRIVER
diff --git a/drivers/net/dsa/Kconfig b/drivers/net/dsa/Kconfig
index fe8cd5338fda..ffc26eb3e899 100644
--- a/drivers/net/dsa/Kconfig
+++ b/drivers/net/dsa/Kconfig
@@ -28,50 +28,7 @@ source "drivers/net/dsa/hirschmann/Kconfig"
 
 source "drivers/net/dsa/lantiq/Kconfig"
 
-config NET_DSA_MT7530
-	tristate "MediaTek MT7530 and MT7531 Ethernet switch support"
-	select NET_DSA_TAG_MTK
-	select REGMAP_IRQ
-	imply NET_DSA_MT7530_MDIO
-	imply NET_DSA_MT7530_MMIO
-	help
-	  This enables support for the MediaTek MT7530 and MT7531 Ethernet
-	  switch chips. Multi-chip module MT7530 in MT7621AT, MT7621DAT,
-	  MT7621ST and MT7623AI SoCs, and built-in switch in MT7988 SoC are
-	  supported as well.
-
-config NET_DSA_MT7530_MDIO
-	tristate "MediaTek MT7530 MDIO interface driver"
-	depends on NET_DSA_MT7530
-	select MEDIATEK_GE_PHY
-	select PCS_MTK_LYNXI
-	help
-	  This enables support for the MediaTek MT7530 and MT7531 switch
-	  chips which are connected via MDIO, as well as multi-chip
-	  module MT7530 which can be found in the MT7621AT, MT7621DAT,
-	  MT7621ST and MT7623AI SoCs.
-
-config NET_DSA_MT7530_MMIO
-	tristate "MediaTek MT7530 MMIO interface driver"
-	depends on NET_DSA_MT7530
-	depends on HAS_IOMEM
-	imply MEDIATEK_GE_SOC_PHY
-	help
-	  This enables support for the built-in Ethernet switch found
-	  in the MediaTek MT7988 SoC.
-	  The switch is a similar design as MT7531, but the switch registers
-	  are directly mapped into the SoCs register space rather than being
-	  accessible via MDIO.
-
-config NET_DSA_MT7628
-	tristate "MediaTek MT7628 Embedded Ethernet switch support"
-	depends on HAS_IOMEM && (SOC_MT7620 || COMPILE_TEST)
-	select NET_DSA_TAG_MT7628
-	select MEDIATEK_FE_SOC_PHY
-	select REGMAP_MMIO
-	help
-	  This enables support for the built-in Ethernet switch found
-	  in the MT7628 SoC.
+source "drivers/net/dsa/mediatek/Kconfig"
 
 config NET_DSA_MV88E6060
 	tristate "Marvell 88E6060 ethernet switch chip support"
diff --git a/drivers/net/dsa/Makefile b/drivers/net/dsa/Makefile
index 7e637d56b35c..ee4784a9839b 100644
--- a/drivers/net/dsa/Makefile
+++ b/drivers/net/dsa/Makefile
@@ -2,10 +2,6 @@
 obj-$(CONFIG_NET_DSA_BCM_SF2)	+= bcm-sf2.o
 bcm-sf2-objs			:= bcm_sf2.o bcm_sf2_cfp.o
 obj-$(CONFIG_NET_DSA_LOOP)	+= dsa_loop.o
-obj-$(CONFIG_NET_DSA_MT7530)	+= mt7530.o
-obj-$(CONFIG_NET_DSA_MT7530_MDIO) += mt7530-mdio.o
-obj-$(CONFIG_NET_DSA_MT7530_MMIO) += mt7530-mmio.o
-obj-$(CONFIG_NET_DSA_MT7628) += mt7628.o
 obj-$(CONFIG_NET_DSA_MV88E6060) += mv88e6060.o
 obj-$(CONFIG_NET_DSA_RZN1_A5PSW) += rzn1_a5psw.o
 obj-$(CONFIG_NET_DSA_SMSC_LAN9303) += lan9303-core.o
@@ -17,6 +13,7 @@ obj-$(CONFIG_NET_DSA_VITESSE_VSC73XX_SPI) += vitesse-vsc73xx-spi.o
 obj-y				+= b53/
 obj-y				+= hirschmann/
 obj-y				+= lantiq/
+obj-y				+= mediatek/
 obj-y				+= microchip/
 obj-y				+= motorcomm/
 obj-y				+= mv88e6xxx/
diff --git a/drivers/net/dsa/mediatek/Kconfig b/drivers/net/dsa/mediatek/Kconfig
new file mode 100644
index 000000000000..ef62481662fd
--- /dev/null
+++ b/drivers/net/dsa/mediatek/Kconfig
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config NET_DSA_MT7530
+	tristate "MediaTek MT7530 and MT7531 Ethernet switch support"
+	select NET_DSA_TAG_MTK
+	select REGMAP_IRQ
+	imply NET_DSA_MT7530_MDIO
+	imply NET_DSA_MT7530_MMIO
+	help
+	  This enables support for the MediaTek MT7530 and MT7531 Ethernet
+	  switch chips. Multi-chip module MT7530 in MT7621AT, MT7621DAT,
+	  MT7621ST and MT7623AI SoCs, and built-in switch in MT7988 SoC are
+	  supported as well.
+
+config NET_DSA_MT7530_MDIO
+	tristate "MediaTek MT7530 MDIO interface driver"
+	depends on NET_DSA_MT7530
+	select MEDIATEK_GE_PHY
+	select PCS_MTK_LYNXI
+	help
+	  This enables support for the MediaTek MT7530 and MT7531 switch
+	  chips which are connected via MDIO, as well as multi-chip
+	  module MT7530 which can be found in the MT7621AT, MT7621DAT,
+	  MT7621ST and MT7623AI SoCs.
+
+config NET_DSA_MT7530_MMIO
+	tristate "MediaTek MT7530 MMIO interface driver"
+	depends on NET_DSA_MT7530
+	depends on HAS_IOMEM
+	imply MEDIATEK_GE_SOC_PHY
+	help
+	  This enables support for the built-in Ethernet switch found
+	  in the MediaTek MT7988 SoC.
+	  The switch is a similar design as MT7531, but the switch registers
+	  are directly mapped into the SoCs register space rather than being
+	  accessible via MDIO.
+
+config NET_DSA_MT7628
+	tristate "MediaTek MT7628 Embedded Ethernet switch support"
+	depends on HAS_IOMEM && (SOC_MT7620 || COMPILE_TEST)
+	select NET_DSA_TAG_MT7628
+	select MEDIATEK_FE_SOC_PHY
+	select REGMAP_MMIO
+	help
+	  This enables support for the built-in Ethernet switch found
+	  in the MT7628 SoC.
diff --git a/drivers/net/dsa/mediatek/Makefile b/drivers/net/dsa/mediatek/Makefile
new file mode 100644
index 000000000000..0ed6e11f292e
--- /dev/null
+++ b/drivers/net/dsa/mediatek/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_NET_DSA_MT7530)	+= mt7530.o
+obj-$(CONFIG_NET_DSA_MT7530_MDIO) += mt7530-mdio.o
+obj-$(CONFIG_NET_DSA_MT7530_MMIO) += mt7530-mmio.o
+obj-$(CONFIG_NET_DSA_MT7628) += mt7628.o
diff --git a/drivers/net/dsa/mt7530-mdio.c b/drivers/net/dsa/mediatek/mt7530-mdio.c
similarity index 100%
rename from drivers/net/dsa/mt7530-mdio.c
rename to drivers/net/dsa/mediatek/mt7530-mdio.c
diff --git a/drivers/net/dsa/mt7530-mmio.c b/drivers/net/dsa/mediatek/mt7530-mmio.c
similarity index 100%
rename from drivers/net/dsa/mt7530-mmio.c
rename to drivers/net/dsa/mediatek/mt7530-mmio.c
diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mediatek/mt7530.c
similarity index 100%
rename from drivers/net/dsa/mt7530.c
rename to drivers/net/dsa/mediatek/mt7530.c
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mediatek/mt7530.h
similarity index 100%
rename from drivers/net/dsa/mt7530.h
rename to drivers/net/dsa/mediatek/mt7530.h
diff --git a/drivers/net/dsa/mt7628.c b/drivers/net/dsa/mediatek/mt7628.c
similarity index 100%
rename from drivers/net/dsa/mt7628.c
rename to drivers/net/dsa/mediatek/mt7628.c
-- 
2.55.0


