Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83267CA5FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 09:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sPTNcpCzfgcdS8RGPPF/gEa81j+VgsvIHhK7KCjyHO4=; b=xzgAeu+g9NQvIM9AZv2mAO0J6c
	MzOhGfrKh4mWtvF77OxAETpFZgTSQLhnT5CmzG3t1KBEukdH5vJoi1FvAIALbEZMB5vzX3nY2aF4t
	ISDDGczfUW701YAxq64bEH/40LuLftpSNgeSSaZed5abPchu/91CfKKe9Wfyakv0xdrbaVP1oi+To
	msOBeVZXCBjwHi4pOOEobZghi2xojcAi0ua8qkGM0+fKrF6ognAZO1Zj9mJlsUiO4IBBlendfqsll
	MtS3AQcETWOU2ZCg7DHiz/rx2IQPTyTE95s2v7JtE6GLhtapaDKRexLp61+D0CAxQOYV8K7ibUb8P
	BcSqoqvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfL2-0000000G4kD-1iGw;
	Mon, 05 Oct 2026 09:50:28 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfKv-0000000G4fU-18C4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 09:50:22 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id B30281FC90;
	Mon,  5 Oct 2026 11:50:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1791193819;
	bh=sPTNcpCzfgcdS8RGPPF/gEa81j+VgsvIHhK7KCjyHO4=; h=From:To:Subject;
	b=pA5FsFrNVnj4fdFopj3hwZgJGCDCmZxmTtx6pgsXLJQSDxRMQ55luQdPZZchGiDg4
	 qRKHtjN1srZfTnl1ek7z+q95abCXIhukGmi2tBGCNKM3y23Cav2RJ2ZKzCTUavnmua
	 +p7lh/x7L09KYCAWjMEg2L6Vzrj0S2IJMxTrWmgl0p4qo8onUVIViLnlfuLgYeVpG8
	 GlhbDRcXBuUjFy0kvn6dk+QfH/MaaIoHw/wgJCWuD6zh8cLnKu4jffd6y2AKaXDaOB
	 c2cE2taHe3QbIJQI9omDjnWVeg3SALtDKMzskvSLfANsUM7/mL70vNIC6ek5i+5uo9
	 1imwGe04x9M3Q==
From: Francesco Dolcini <francesco@dolcini.it>
To: Francesco Dolcini <francesco@dolcini.it>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 4/4] ARM: dts: imx6ull-colibri-emmc: Add Toradex Capacitive Touch Display 10" LVDS
Date: Mon,  5 Oct 2026 11:50:04 +0200
Message-ID: <20261005095006.20290-5-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261005095006.20290-1-francesco@dolcini.it>
References: <20261005095006.20290-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_025021_626637_A0EFC332 
X-CRM114-Status: GOOD (  14.99  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add a device tree overlay for the Toradex Capacitive Touch Display 10.1"
LVDS connected through the DPI to LVDS transmitter on the Iris v2 carrier
board. The panel is a LogicTechno LT170410-2WHC 10.1" WXGA IPS LCD and
the touch input is provided by an Atmel MaxTouch capacitive touch
controller.

The LVDS transmitter, panel, backlight and LCDIF description is shared
with the Colibri iMX7 overlay, only the LVDS transmitter control GPIOs
and the Atmel MaxTouch controller wiring are SoC specific.

The overlay is also combined with the Iris v2 carrier board device tree
to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v2: new patch
---
 arch/arm/boot/dts/nxp/imx/Makefile            |  7 +++
 ...emmc-iris-panel-cap-touch-10inch-lvds.dtso | 49 +++++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-iris-panel-cap-touch-10inch-lvds.dtso

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index dac2e146ed75..7b838f32c013 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -352,6 +352,11 @@ dtb-$(CONFIG_SOC_IMX6SX) += \
 	imx6sx-udoo-neo-basic.dtb \
 	imx6sx-udoo-neo-extended.dtb \
 	imx6sx-udoo-neo-full.dtb
+
+imx6ull-colibri-emmc-iris-v2-panel-cap-touch-10inch-lvds-dtbs := \
+	imx6ull-colibri-emmc-iris-v2.dtb \
+	imx6ull-colibri-emmc-iris-panel-cap-touch-10inch-lvds.dtbo
+
 dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ul-14x14-evk.dtb \
 	imx6ul-ccimx6ulsbcexpress.dtb \
@@ -382,7 +387,9 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ull-colibri-emmc-aster.dtb \
 	imx6ull-colibri-emmc-eval-v3.dtb \
 	imx6ull-colibri-emmc-iris.dtb \
+	imx6ull-colibri-emmc-iris-panel-cap-touch-10inch-lvds.dtbo \
 	imx6ull-colibri-emmc-iris-v2.dtb \
+	imx6ull-colibri-emmc-iris-v2-panel-cap-touch-10inch-lvds.dtb \
 	imx6ull-colibri-eval-v3.dtb \
 	imx6ull-colibri-iris.dtb \
 	imx6ull-colibri-iris-v2.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-iris-panel-cap-touch-10inch-lvds.dtso b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-iris-panel-cap-touch-10inch-lvds.dtso
new file mode 100644
index 000000000000..f698d6768279
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-iris-panel-cap-touch-10inch-lvds.dtso
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" LVDS
+ *
+ * Toradex Capacitive Touch Display 10.1" on Iris v2 carrier board X7 / X5
+ * connectors through on-carrier LVDS transmitter
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-lvds
+ * https://developer.toradex.com/hardware/colibri-som-family/carrier-boards/iris-carrier-board/
+ * https://www.toradex.com/products/carrier-board/iris-carrier-board
+ * https://docs.toradex.com/108421-colibri_arm_iris_carrier_board_datasheet.pdf
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+#include "imx6ull-imx7-colibri-iris-panel-cap-touch-10inch-lvds.dtsi"
+
+&atmel_mxt_ts {
+	pinctrl-0 = <&pinctrl_atmel_conn &pinctrl_atmel_snvs_conn>;
+	/* SODIMM 107 / TOUCH_INT# */
+	interrupt-parent = <&gpio5>;
+	interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
+	/* SODIMM 106 / TOUCH_RST# */
+	reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
+
+/*
+ * The LVDS transmitter control pins are muxed as GPIO by the pinctrl_gpio1,
+ * pinctrl_gpio7 and pinctrl_snvs_gpio1 groups of the module device tree.
+ */
+&lvds_encoder {
+	/* SODIMM 63 / LVDS_RGB_MODE */
+	b6b8-gpios = <&gpio2 1 GPIO_ACTIVE_HIGH>;
+	/* SODIMM 95 / LVDS_COLOR_MAP */
+	map-gpios = <&gpio5 3 GPIO_ACTIVE_HIGH>;
+	/* SODIMM 55 / LVDS_CH_MODE */
+	mode-gpios = <&gpio2 0 GPIO_ACTIVE_HIGH>;
+	/* SODIMM 99 / LVDS_PWRON */
+	powerdown-gpios = <&gpio1 14 GPIO_ACTIVE_LOW>;
+};
-- 
2.47.3


