Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BDBEEB362C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 19:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eLBVbmAAAVsEz0x8golWQm+S6FLxF1rb4QI2LLhQark=; b=ZsLZtV5jXHPk90Khc2y/hbafGY
	fmziLnNpmOATsxMIk6Pqt8lj0HR4/1DvorPbRAq8O2eRwcvbjw3jRq8J40Vv6+kIUHYf9nmrLtKZy
	wvst/Rh+G9uvsO9k+CeuciX36XKrNwf0vMplg322kIsSW6NGZ/DIMTq3aZ35MzxNUo6SEIrMXzB0W
	Ur/2t/2MfyMocbTTKA2LVqPpRJNfehofHlEhwyFi+5VnoLM65RAr+3ZyajjsSaoYLi5qqv7mlxESQ
	PAHsX2nwSjubyUoxaR2n97l04E0kFFyMWY2emThzXNg0uluT4t4zrrtRfGBCK3daH5AchtGrs0l2j
	g8mZoxcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx8fg-0000000DiD9-27XA;
	Mon, 02 Mar 2026 19:11:12 +0000
Received: from mail.hugovil.com ([162.243.120.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx8fb-0000000DiAj-2xy9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 19:11:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Cc:To
	:From:subject:date:message-id:reply-to;
	bh=eLBVbmAAAVsEz0x8golWQm+S6FLxF1rb4QI2LLhQark=; b=xVGu5yG9Yir/yRkWz92EHqc15P
	ImHDqv6NT8OJNNOK3nZNA+oQ8TYVxhnMCIBHmC0Lu4oZbEgSCtuGf6T+HCVkOixc6LH6PoZMPeZHF
	HUxdphbIOCrCMdSTyHd5EkJthdTD0211BEvz2uK4gR9FczxgeuIDlOgmKrp0SLriqBWQ=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:59962 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vx8fL-0007Wl-Df; Mon, 02 Mar 2026 14:10:51 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	laurent.pinchart+renesas@ideasonboard.com,
	antonin.godard@bootlin.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	hugo@hugovil.com,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Date: Mon,  2 Mar 2026 14:03:44 -0500
Message-ID: <20260302190953.669325-9-hugo@hugovil.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260302190953.669325-1-hugo@hugovil.com>
References: <20260302190953.669325-1-hugo@hugovil.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
Subject: [PATCH 08/14] ARM: dts: imx6ul-var-som: factor out SD card support
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_111107_817515_98125264 
X-CRM114-Status: GOOD (  19.52  )
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

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

Move SD support to a separate include, since it cannot be used at the
same time as the Wifi/BT module.

Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
---
 .../dts/nxp/imx/imx6ul-var-som-common.dtsi    | 33 ++++++++++++
 .../imx/imx6ul-var-som-concerto-common.dtsi   | 51 -------------------
 .../dts/nxp/imx/imx6ul-var-som-concerto.dts   |  1 +
 .../boot/dts/nxp/imx/imx6ul-var-som-sd.dtsi   | 27 ++++++++++
 .../dts/nxp/imx/imx6ull-var-som-concerto.dts  |  1 +
 5 files changed, 62 insertions(+), 51 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-sd.dtsi

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
index 22b0c4e0725a5..dd4ecff1eb786 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
@@ -139,6 +139,39 @@ MX6UL_PAD_UART2_RTS_B__UART2_DCE_RTS	0x1b0b1
 		>;
 	};
 
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x17059
+			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x17059
+			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x17059
+			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x17059
+			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x17059
+			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x17059
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <
+			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x170b9
+			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x100b9
+			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x170b9
+			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x170b9
+			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x170b9
+			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x170b9
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <
+			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x170f9
+			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x100f9
+			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x170f9
+			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x170f9
+			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x170f9
+			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x170f9
+		>;
+	};
+
 	pinctrl_usdhc2: usdhc2grp {
 		fsl,pins = <
 			MX6UL_PAD_NAND_RE_B__USDHC2_CLK		0x10069
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-common.dtsi
index 10a23ae104359..ea8d9905ce6e7 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-common.dtsi
@@ -186,45 +186,6 @@ MX6UL_PAD_UART3_TX_DATA__ANATOP_OTG1_ID	0x17059
 		>;
 	};
 
-	pinctrl_usdhc1: usdhc1grp {
-		fsl,pins = <
-			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x17059
-			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x17059
-			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x17059
-			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x17059
-			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x17059
-			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x17059
-		>;
-	};
-
-	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
-		fsl,pins = <
-			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x170b9
-			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x100b9
-			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x170b9
-			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x170b9
-			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x170b9
-			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x170b9
-		>;
-	};
-
-	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
-		fsl,pins = <
-			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x170f9
-			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x100f9
-			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x170f9
-			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x170f9
-			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x170f9
-			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x170f9
-		>;
-	};
-
-	pinctrl_usdhc1_gpio: usdhc1-gpiogrp {
-		fsl,pins = <
-			MX6UL_PAD_GPIO1_IO00__GPIO1_IO00	0x1b0b1 /* CD */
-		>;
-	};
-
 	pinctrl_wdog: wdoggrp {
 		fsl,pins = <
 			MX6UL_PAD_GPIO1_IO01__WDOG1_WDOG_B	0x78b0
@@ -286,18 +247,6 @@ &usbotg2 {
 	status = "okay";
 };
 
-&usdhc1 {
-	pinctrl-names = "default", "state_100mhz", "state_200mhz";
-	pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_usdhc1_gpio>;
-	pinctrl-1 = <&pinctrl_usdhc1_100mhz>, <&pinctrl_usdhc1_gpio>;
-	pinctrl-2 = <&pinctrl_usdhc1_200mhz>, <&pinctrl_usdhc1_gpio>;
-	cd-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
-	no-1-8-v;
-	keep-power-in-suspend;
-	wakeup-source;
-	status = "okay";
-};
-
 &wdog1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_wdog>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
index 11b45f105b7ad..85ebac30d7bed 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
@@ -11,6 +11,7 @@
 
 #include "imx6ul-var-som.dtsi"
 #include "imx6ul-var-som-concerto-common.dtsi"
+#include "imx6ul-var-som-sd.dtsi"
 
 / {
 	model = "Variscite VAR-SOM-6UL Concerto Board (6UL CPU)";
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-sd.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-sd.dtsi
new file mode 100644
index 0000000000000..0e6d9b945eb4a
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-sd.dtsi
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Support optional SD card interface on Variscite VAR-SOM-6UL module.
+ *
+ * Copyright 2019-2024 Variscite Ltd.
+ * Copyright 2026 Dimonoff
+ */
+
+&iomuxc {
+	pinctrl_usdhc1_gpio: usdhc1-gpiogrp {
+		fsl,pins = <
+			MX6UL_PAD_GPIO1_IO00__GPIO1_IO00	0x1b0b1 /* CD */
+		>;
+	};
+};
+
+&usdhc1 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_usdhc1_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>, <&pinctrl_usdhc1_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>, <&pinctrl_usdhc1_gpio>;
+	cd-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
+	no-1-8-v;
+	keep-power-in-suspend;
+	wakeup-source;
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
index 7c601af2657d7..ebf88c3e1addc 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
@@ -10,6 +10,7 @@
 
 #include "imx6ull-var-som.dtsi"
 #include "imx6ul-var-som-concerto-common.dtsi"
+#include "imx6ul-var-som-sd.dtsi"
 
 / {
 	model = "Variscite VAR-SOM-6UL Concerto Board (6ULL CPU)";
-- 
2.47.3


