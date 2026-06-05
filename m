Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C81CCD6E6B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 07:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OAHd6WydKYBQCkvMXE/3oSe9e9pm1fVvh4h5O21kqfs=; b=CRsq7dzYRhQsoof1FK0u2Ah22d
	MhtvU/+kHA3/WX4ygSB8z5l9joHNJ2QxoAqnD0Fkh94bAAY7gehafQcnixpUTv+Nr2TUrsExd7mQb
	V5ApcbOBo7RL2YSH1dpkd8zTWhwEvt2oow/eeYA2Gxdaeds5Wndg51uxQZWnDIWV5dYd8FEZz0dP1
	d//HRoR/ZibqJTMzg8cH0XkaHwTSY7z+aX40sWW/hQairO3QFORe65Dqdyz03dr1YkVaZZbo0JRbs
	6LmLP4Z80aklPCla/nDh3lLVDjRfF9CiWzn3rpx7LTRC8RKEs/obssAFbE3tbbyNO9rX4hs2MfV+f
	70rtAc6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVOk7-00000000Dde-3vCH;
	Fri, 05 Jun 2026 07:13:23 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVOk5-00000000DcU-0i6j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 07:13:22 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-46019edc13dso735609f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 00:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780643598; x=1781248398; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OAHd6WydKYBQCkvMXE/3oSe9e9pm1fVvh4h5O21kqfs=;
        b=dNt081YKyhjLaPTj9d8Sf6iQQ8x9U0P5mhz65zvpTp67kqmsrJ3SFSqDiDDaGtdlCU
         pTHpsl3aCVpb+wSKG+rtPv+V/sHA+4cVsoJ/BVdCkG/l7RD+c9MlxYAh0z1Yk2JVyP/7
         M7vat7EuTwyrN6jnyR2L3o2jO3UpMOaEAJVKGXczXiqVpVtX4Gc3oS2v+ClyjOv7t8mo
         +2sEfadadgF02Fkdm1UREmIWJoRKyqS8GvPhf1YK5505mq3bqjG5vS1L7+ldC/3zaCAz
         BPncvcHWKcF1ul5waFuPqJNxT6g4qCLY00+aD4bO0MxnDhUZeeuUa3Uii7dROKoq3JTR
         Elhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780643598; x=1781248398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OAHd6WydKYBQCkvMXE/3oSe9e9pm1fVvh4h5O21kqfs=;
        b=BMPazCOlEzuthl4T3RSgD11fOMZqPDvwbZ2zrGThAwntRVwwkAhGoDRt81ILjFiFE4
         TJIV27qlPyzD7Hoz91pZ+gomTJTWf2h8NlgoPNgY44VKENiQpTpk+sTUlqTKdAqGg6Df
         0xldFsAqOroJ78WEsChJ11WOFtyi8DxyJbLawHeM9AcdLXjsx3w/ql6CRN+GVcXoi6Jl
         hOUdRpxwTHkgFqsaxNjOMahv5fRlQj7Ie45KhKtAFmNIg2D3agK04FG41ckhS38tWaHn
         e+ePpx2Wd9cCGcIlO5rpbNXiABUdhFLpZgEUS1KYYXUauP4b+dKZkjdZZepLVg0cKGS8
         5lIw==
X-Forwarded-Encrypted: i=1; AFNElJ+C7ZiL5HLNi69K2eYtHRXkH8DDq6xUwe9fdTtu77+j7TCvlBnrHVOpVaDmKXWQ6JogoufIfy+xK875PQ34olk1@lists.infradead.org
X-Gm-Message-State: AOJu0YwHEHjmoJacm01b6Rvl7kQze7h5NG4eb53AwXamDRw0r9hZ/BYf
	XsWV5TMHFxY14HqM52Ipc6+ARUahGpfjeqXze+Sp1bcML9Flon/2zvQP
X-Gm-Gg: Acq92OGhpOy12y1Img8dQmKWtfgnV8WzV2IyLpGwkL84mCy1LzU0Oo0L80WJnqrkorR
	0fKG1byMfo8OmbTqDmqobIg5Q5v9Gt7kiHNRM8WFIXWkwo0k78KeHKR0ZtWy3gADBEbtW6SyA5Y
	zzRaObc8UTOzx2WlhAMOYnxc18OFnP6viUa0lcFEkzx0lytmdNGl6aoVtZL4PXV1uIMrfFNJIAK
	gGBQ88//eIJGa8vk8VhhUKJzmKgEW2aqfDesg7UUalnWJmCcSWAgZ5NlIxTRhfR4iHuFMVVHdSf
	jsao3uH49q1PmL09v/PSHXl0/35btZxo5B8RpUR1UkYqDwvxNrKypP6+BW/DtVy1y8nY4dh15m6
	SNwmxbWoDt1PPlr+Zv33FiRJJ60//m5M8ZWjZenZJAK7dEmi8gjQaFmEGuWWBKnfBDO1IXOd5V/
	qtfxtaY+SkvzOditPhptzUpA5lprQVwMCuVII4IPSjApAveT9dAMwHiowHDVWiqSkgcHVAIkwzP
	kFYUPM=
X-Received: by 2002:adf:fd8b:0:b0:43b:498f:dceb with SMTP id ffacd0b85a97d-460304f6b48mr2770670f8f.9.1780643597933;
        Fri, 05 Jun 2026 00:13:17 -0700 (PDT)
Received: from Ansuel-XPS24 (host-79-42-252-49.retail.telecomitalia.it. [79.42.252.49])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4601f2f5612sm22221465f8f.15.2026.06.05.00.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 00:13:16 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] pinctrl: Move Airoha driver to dedicated directory
Date: Fri,  5 Jun 2026 09:12:31 +0200
Message-ID: <20260605071233.28873-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_001321_239921_D9C9800D 
X-CRM114-Status: GOOD (  18.76  )
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

In preparation for additional SoC support, move the Airoha pinctrl driver
for AN7581 SoC to a dedicated directory.

This is to tidy things up and keep code organized without polluting the
Mediatek driver directory.

The driver doesn't depend on any generic or common code from the Mediatek
codebase so it can be safely moved without any modification.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS                                   |  2 +-
 drivers/pinctrl/Kconfig                       |  1 +
 drivers/pinctrl/Makefile                      |  1 +
 drivers/pinctrl/airoha/Kconfig                | 20 +++++++++++++++++++
 drivers/pinctrl/airoha/Makefile               |  3 +++
 .../{mediatek => airoha}/pinctrl-airoha.c     |  0
 drivers/pinctrl/mediatek/Kconfig              | 17 +---------------
 drivers/pinctrl/mediatek/Makefile             |  1 -
 8 files changed, 27 insertions(+), 18 deletions(-)
 create mode 100644 drivers/pinctrl/airoha/Kconfig
 create mode 100644 drivers/pinctrl/airoha/Makefile
 rename drivers/pinctrl/{mediatek => airoha}/pinctrl-airoha.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 21c0ef0b9ce5..38bf92149a15 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21024,7 +21024,7 @@ M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
-F:	drivers/pinctrl/mediatek/pinctrl-airoha.c
+F:	drivers/pinctrl/airoha/pinctrl-airoha.c
 
 PIN CONTROLLER - AMD
 M:	Basavaraj Natikar <Basavaraj.Natikar@amd.com>
diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 03f2e3ee065f..e0babad31445 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -679,6 +679,7 @@ config PINCTRL_RP1
 	  multi function device.
 
 source "drivers/pinctrl/actions/Kconfig"
+source "drivers/pinctrl/airoha/Kconfig"
 source "drivers/pinctrl/aspeed/Kconfig"
 source "drivers/pinctrl/bcm/Kconfig"
 source "drivers/pinctrl/berlin/Kconfig"
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index f7d5d5f76d0c..36c55858801f 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -66,6 +66,7 @@ obj-$(CONFIG_PINCTRL_ZYNQMP)	+= pinctrl-zynqmp.o
 obj-$(CONFIG_PINCTRL_ZYNQ)	+= pinctrl-zynq.o
 
 obj-y				+= actions/
+obj-y				+= airoha/
 obj-$(CONFIG_ARCH_ASPEED)	+= aspeed/
 obj-y				+= bcm/
 obj-$(CONFIG_PINCTRL_BERLIN)	+= berlin/
diff --git a/drivers/pinctrl/airoha/Kconfig b/drivers/pinctrl/airoha/Kconfig
new file mode 100644
index 000000000000..03adaeae8fc3
--- /dev/null
+++ b/drivers/pinctrl/airoha/Kconfig
@@ -0,0 +1,20 @@
+# SPDX-License-Identifier: GPL-2.0-only
+menu "Airoha pinctrl drivers"
+	depends on ARCH_AIROHA || COMPILE_TEST
+
+config PINCTRL_AIROHA
+	tristate "Airoha EN7581 pin control"
+	depends on OF
+	depends on ARM64 || COMPILE_TEST
+	select PINMUX
+	select GENERIC_PINCONF
+	select GENERIC_PINCTRL_GROUPS
+	select GENERIC_PINMUX_FUNCTIONS
+	select GPIOLIB
+	select GPIOLIB_IRQCHIP
+	select REGMAP_MMIO
+	help
+	  Say yes here to support pin controller and gpio driver
+	  on Airoha EN7581 SoC.
+
+endmenu
diff --git a/drivers/pinctrl/airoha/Makefile b/drivers/pinctrl/airoha/Makefile
new file mode 100644
index 000000000000..a25b744dd7a8
--- /dev/null
+++ b/drivers/pinctrl/airoha/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_PINCTRL_AIROHA)		+= pinctrl-airoha.o
diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
similarity index 100%
rename from drivers/pinctrl/mediatek/pinctrl-airoha.c
rename to drivers/pinctrl/airoha/pinctrl-airoha.c
diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 4819617d9368..97980cc28b9c 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menu "MediaTek pinctrl drivers"
-	depends on ARCH_MEDIATEK || ARCH_AIROHA || RALINK || COMPILE_TEST
+	depends on ARCH_MEDIATEK || RALINK || COMPILE_TEST
 
 config EINT_MTK
 	tristate "MediaTek External Interrupt Support"
@@ -126,21 +126,6 @@ config PINCTRL_MT8127
 	select PINCTRL_MTK
 
 # For ARMv8 SoCs
-config PINCTRL_AIROHA
-	tristate "Airoha EN7581 pin control"
-	depends on OF
-	depends on ARM64 || COMPILE_TEST
-	select PINMUX
-	select GENERIC_PINCONF
-	select GENERIC_PINCTRL_GROUPS
-	select GENERIC_PINMUX_FUNCTIONS
-	select GPIOLIB
-	select GPIOLIB_IRQCHIP
-	select REGMAP_MMIO
-	help
-	  Say yes here to support pin controller and gpio driver
-	  on Airoha EN7581 SoC.
-
 config PINCTRL_MT2712
 	bool "MediaTek MT2712 pin control"
 	depends on OF
diff --git a/drivers/pinctrl/mediatek/Makefile b/drivers/pinctrl/mediatek/Makefile
index ae765bd99965..6dc17b0c23f9 100644
--- a/drivers/pinctrl/mediatek/Makefile
+++ b/drivers/pinctrl/mediatek/Makefile
@@ -8,7 +8,6 @@ obj-$(CONFIG_PINCTRL_MTK_MOORE)		+= pinctrl-moore.o
 obj-$(CONFIG_PINCTRL_MTK_PARIS)		+= pinctrl-paris.o
 
 # SoC Drivers
-obj-$(CONFIG_PINCTRL_AIROHA)		+= pinctrl-airoha.o
 obj-$(CONFIG_PINCTRL_MT7620)		+= pinctrl-mt7620.o
 obj-$(CONFIG_PINCTRL_MT7621)		+= pinctrl-mt7621.o
 obj-$(CONFIG_PINCTRL_MT76X8)		+= pinctrl-mt76x8.o
-- 
2.53.0


