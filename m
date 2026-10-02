Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE999CA5FE2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 08:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n35vORrY76T9C+6BE8M5WGzcneKyoeI/5ncUW8CF/t4=; b=X3oszZNiRt3VL5U1jBo6rAqkAd
	BV/GzgE2gB1GNX+vNcK3ON9uy4bsivC/rR85as/qbxEaaJE2MrUOBrodwfLsYPMO+WjsPVtRjT/Pk
	W8npTcUuFW4IG4dmTjhmIpyH1/+femq5yskRJAtrzH6XVY0y0xPlOCBNDmyfddRejJQ2uS0ObGIwz
	ZrKm8lbsAzuYtzWFmchoHb+oBC/mBLsro3LRHLfwO9t6UJmLEUSMheZZ43bOoAD0fvhIVHVOVebZp
	qOpRoJjRCvkzIN6vDLncoz7XdPm5r60GIiWue37nSRSBmlxB/0qg4Dx8j2t/YDUtkqZT2TCuR8J7o
	1I0phdaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYPZ-0000000Ax3a-2HGT;
	Fri, 02 Oct 2026 08:14:33 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYPV-0000000Ax1A-30QV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 08:14:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=n35vORrY76T9C+6BE8M5WGzcneKyoeI/5ncUW8CF/t4=; b=NgJ3OK/Ruhe8OAX6Dy6N8Hx2Ba
	FHNwVWp3f9Uie76buliYQXcmtWLimSBitdNTlBh/8gxdLTeeHmLxZwpac9hND0HETnGWdwPsK6Iai
	9PFIDk5eW8zm4Q4Xo2VrEmVo4t5kw2OTz0AgahVaMycJ358uibl4271v2CTOyiPgCjknt4vKQsFQZ
	pdgiJTBwLkbt/AzAxrn8ETuivFM9QyMiwtODtKGJoYjGlpLmcTZdMGIsjj2qQvyMDkSABS34ILYPe
	Tl3GswHjEsf1xcbnn0CebaVuWac0B60PSk4kfxjoLeSsiYBjqsz0ifcICJ3DQbHVtu83pw4aULlfk
	BCFz1Tew==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xCYPO-0003Mt-1K;
	Fri, 02 Oct 2026 10:14:22 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xCYPO-000FgI-0t;
	Fri, 02 Oct 2026 10:14:21 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH 1/8] ARM: dts: imx6ul: Add LVDS DT overlay for TQMa6ULx
Date: Fri,  2 Oct 2026 10:14:02 +0200
Message-ID: <20261002081417.2092471-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002081417.2092471-1-alexander.stein@ew.tq-group.com>
References: <20261002081417.2092471-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28141/Fri Oct  2 08:26:12 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_011429_865391_AAA0AFAD 
X-CRM114-Status: GOOD (  15.79  )
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

The generic setup like pinmux and lcdif <-> display connection is done
in the mainboard while LVDS specific setup is done in the overlay.
As this mainboard also supports parallel display the LVDS connection
using an LVDS encoder is done in the overlay.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile            |  4 ++
 ...6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtso | 69 +++++++++++++++++++
 arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi        | 64 +++++++++++++++++
 3 files changed, 137 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtso

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index c5caca92ea10c..ea0799ba1893e 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -420,6 +420,10 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ulz-14x14-evk.dtb \
 	imx6ulz-bsh-smm-m2.dtb
 
+imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33-dtbs += imx6ul-tqma6ul2-mba6ulx.dtb imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtbo
+
+dtb-$(CONFIG_SOC_IMX6UL) += 	imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtb
+
 imx7d-colibri-emmc-aster-panel-cap-touch-7inch-parallel-dtbs := \
 	imx7d-colibri-emmc-aster.dtb \
 	imx7d-colibri-emmc-panel-cap-touch-7inch-parallel.dtbo
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtso b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtso
new file mode 100644
index 0000000000000..e44b7461001ea
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtso
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright 2018-2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Markus Niebel
+ * Author: Alexander Stein
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	lvds_encoder: lvds-encoder {
+		compatible = "ti,sn75lvds83", "lvds-encoder";
+		powerdown-gpios = <&expander_out0 3 GPIO_ACTIVE_LOW>;
+		power-supply = <&reg_mba6ul_3v3>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lvds_encoder_in: endpoint {
+					remote-endpoint = <&lcdif_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				lvds_encoder_out: endpoint {
+					remote-endpoint = <&display_in>;
+				};
+			};
+		};
+	};
+};
+
+&backlight {
+	pwms = <&pwm2 0 62500 0>;
+	brightness-levels = <0 16 32 64 96 128 160 192 224 255>;
+	default-brightness-level = <5>;
+	status = "okay";
+};
+
+&display {
+	compatible = "tianma,tm070jvhg33";
+	power-supply = <&reg_mba6ul_5v0>;
+	status = "okay";
+};
+
+&display_in {
+	remote-endpoint = <&lvds_encoder_out>;
+};
+
+/* for lcd reset != #stkrst */
+/* place r2021, resolder r2022 and iomux following: */
+/* MX6UL_PAD_LCD_RESET__GPIO3_IO04	0x79 */
+&lcdif {
+	status = "okay";
+};
+
+&lcdif_out {
+	remote-endpoint = <&lvds_encoder_in>;
+};
diff --git a/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi b/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
index fd05479bbffc9..ba79bb9760806 100644
--- a/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
@@ -30,6 +30,21 @@ beeper: beeper {
 		gpios = <&expander_out1 6 GPIO_ACTIVE_HIGH>;
 	};
 
+	display: display {
+		/*
+		 * Display is not fixed, so compatible has to be added from
+		 * DT overlay
+		 */
+		backlight = <&backlight>;
+		status = "disabled";
+
+		port {
+			display_in: endpoint {
+				remote-endpoint = <&lcdif_out>;
+			};
+		};
+	};
+
 	gpio_buttons: gpio-keys {
 		compatible = "gpio-keys";
 		pinctrl-names = "default";
@@ -299,6 +314,17 @@ se97b: eeprom@51 {
 	};
 };
 
+&lcdif {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lcdif>, <&pinctrl_lcdifctrl>;
+
+	port {
+		lcdif_out: endpoint {
+			remote-endpoint = <&display_in>;
+		};
+	};
+};
+
 &pwm2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pwm2>;
@@ -466,6 +492,44 @@ MX6UL_PAD_UART2_CTS_B__FLEXCAN2_TX	0x1b020
 		>;
 	};
 
+	pinctrl_lcdif: lcdifgrp {
+		fsl,pins = <
+			MX6UL_PAD_LCD_DATA00__LCDIF_DATA00	0x79
+			MX6UL_PAD_LCD_DATA01__LCDIF_DATA01	0x79
+			MX6UL_PAD_LCD_DATA02__LCDIF_DATA02	0x79
+			MX6UL_PAD_LCD_DATA03__LCDIF_DATA03	0x79
+			MX6UL_PAD_LCD_DATA04__LCDIF_DATA04	0x79
+			MX6UL_PAD_LCD_DATA05__LCDIF_DATA05	0x79
+			MX6UL_PAD_LCD_DATA06__LCDIF_DATA06	0x79
+			MX6UL_PAD_LCD_DATA07__LCDIF_DATA07	0x79
+			MX6UL_PAD_LCD_DATA08__LCDIF_DATA08	0x79
+			MX6UL_PAD_LCD_DATA09__LCDIF_DATA09	0x79
+			MX6UL_PAD_LCD_DATA10__LCDIF_DATA10	0x79
+			MX6UL_PAD_LCD_DATA11__LCDIF_DATA11	0x79
+			MX6UL_PAD_LCD_DATA12__LCDIF_DATA12	0x79
+			MX6UL_PAD_LCD_DATA13__LCDIF_DATA13	0x79
+			MX6UL_PAD_LCD_DATA14__LCDIF_DATA14	0x79
+			MX6UL_PAD_LCD_DATA15__LCDIF_DATA15	0x79
+			MX6UL_PAD_LCD_DATA16__LCDIF_DATA16	0x79
+			MX6UL_PAD_LCD_DATA17__LCDIF_DATA17	0x79
+			MX6UL_PAD_LCD_DATA18__LCDIF_DATA18	0x79
+			MX6UL_PAD_LCD_DATA19__LCDIF_DATA19	0x79
+			MX6UL_PAD_LCD_DATA20__LCDIF_DATA20	0x79
+			MX6UL_PAD_LCD_DATA21__LCDIF_DATA21	0x79
+			MX6UL_PAD_LCD_DATA22__LCDIF_DATA22	0x79
+			MX6UL_PAD_LCD_DATA23__LCDIF_DATA23	0x79
+		>;
+	};
+
+	pinctrl_lcdifctrl: lcdifctrlgrp {
+		fsl,pins = <
+			MX6UL_PAD_LCD_CLK__LCDIF_CLK		0x79
+			MX6UL_PAD_LCD_ENABLE__LCDIF_ENABLE	0x79
+			MX6UL_PAD_LCD_HSYNC__LCDIF_HSYNC	0x79
+			MX6UL_PAD_LCD_VSYNC__LCDIF_VSYNC	0x79
+		>;
+	};
+
 	pinctrl_pwm2: pwm2grp {
 		fsl,pins = <
 			/* 100 k PD, DSE 120 OHM, SPEED LO */
-- 
2.55.0


