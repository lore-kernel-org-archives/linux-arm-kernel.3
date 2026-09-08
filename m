Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6437C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 10:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MCbiA6d2rt3S8lOdzp5UrMVswALZKd4o8wNqLwS4zQI=; b=U2+JyPsTet12HSepfwvrMIPyON
	/7kr8ea17m91rJ/w7IN34t8wC+eLRQXTqoNkWvb+X9nrcK0uFQ/c8YVGUZY8k3ZbP3h61vUd/poM+
	2YLgbarIUP93T4KFX2m+pAkErhT5JOcFUfmmMl/vfGKclVJvsmKWAzz8dDJVhcLIub3qvbqoV5qPn
	fln0/NMVwV3o4WXRcvKCKNJ7CxY9A87oY+rXgsmz9kdmAm+TntM4B9kk4KIUXPDJYQxcUh/6kRhF9
	+QXG5Mfa2zfC7WriA87pyYxpfwWKliTIPxkUmTYbLTQM4zTGTHyHsXwGcAHywAy8qSxicOCbo9vOF
	vwm+/Y+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sfG-00000008iRg-3Hs2;
	Tue, 08 Sep 2026 10:02:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sfD-00000008iQI-29Pa
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 10:02:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=MCbiA6d2rt3S8lOdzp5UrMVswALZKd4o8wNqLwS4zQI=; b=Lk1ZRqrKeAqJy9Yrs5qS/Z3JLY
	tUJghvBTK4iLfFDx5TKwQcBe+dAbansBLjZ9XZvnwSSdNXGve5U04TVl+LYwecPfwmA1kn+UFDIhw
	0ZdwuoseQdLtB3mwFxKigT8GyhuPPy0cYvgnxHU0xTmh6yYUcDtd3/s+43LnW/63TiwZUAChh8ZAb
	IIuJ/9OsQCigfqpkE9HXoj/I099U/NLNmQebR/Clq6a6hYLpc2JoRbUK9uW98bNCUxf4qUqrpQ9lA
	SQOQ/RbVgWwd57Gw76TMVDBX6STQFQ4mEZ/qnjAlgi39ck3g0E2eg7TxQofZfAJYJoo9lQvtkZvfr
	hC/ZSJqQ==;
Received: from mail11.truemail.it ([217.194.8.81])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3sf9-0000000HFIl-0PUY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 10:02:50 +0000
Received: from francesco-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id C5CE920472;
	Tue,  8 Sep 2026 12:02:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1788861763;
	bh=MCbiA6d2rt3S8lOdzp5UrMVswALZKd4o8wNqLwS4zQI=; h=From:To:Subject;
	b=RS5h5kpti2SyYd5yW2ROAgvenmgN5O/dVg9BxwIRiwseTW+g37UFGKhvaQJMQ3OGA
	 coO3PpehTRRb//aoN4TRCWJxJ/wxobkSxiP79EhKr5uVOLs3wLTOyJhb4rUmWKMrTL
	 st1RbLQbfy1uJ9quwNKNEFzA9UoJ+/XMV6IFd8d+gd45aq7BhW5MYfRfmCw0j1/LZx
	 1YLpv6ynhzsiYvzM5Ypp6UmTmppohGvGjGAoOxzBEGPfWTaaXiCtN1aN7qZSZzZedx
	 W9b2y40pXHopN6KKpovjWS7fhw78NpMmZJH2qGI+gUJiFWYmJ1dHU++nBRnxr6PeHe
	 4/B3TMn+pUzkQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Francesco Dolcini <francesco@dolcini.it>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
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
Subject: [PATCH v1 3/3] ARM: dts: imx7d-colibri-emmc: Add Toradex Capacitive Touch Display 10" LVDS
Date: Tue,  8 Sep 2026 12:02:27 +0200
Message-ID: <20260908100230.83796-4-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260908100230.83796-1-francesco@dolcini.it>
References: <20260908100230.83796-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_110247_479128_00A6BB7E 
X-CRM114-Status: GOOD (  13.67  )
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
LVDS connected via a DPI to LVDS on Iris carrier board. The panel is a
LogicTechno LT170410-2WHC 10.1" WXGA IPS LCD and the touch input is
provided by an Atmel MaxTouch capacitive touch controller.

The overlay is also combined with the Iris v2 carrier board device tree
to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
this is based on https://lore.kernel.org/all/20260901124921.78635-1-francesco@dolcini.it/
---
 arch/arm/boot/dts/nxp/imx/Makefile            |  6 ++
 ...emmc-iris-panel-cap-touch-10inch-lvds.dtso | 92 +++++++++++++++++++
 2 files changed, 98 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-iris-panel-cap-touch-10inch-lvds.dtso

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index d1272104ef27..b9456e7e5310 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -424,6 +424,10 @@ imx7d-colibri-emmc-aster-panel-cap-touch-7inch-parallel-dtbs := \
 	imx7d-colibri-emmc-aster.dtb \
 	imx7d-colibri-emmc-panel-cap-touch-7inch-parallel.dtbo
 
+imx7d-colibri-emmc-iris-v2-panel-cap-touch-10inch-lvds-dtbs := \
+	imx7d-colibri-emmc-iris-v2.dtb \
+	imx7d-colibri-emmc-iris-panel-cap-touch-10inch-lvds.dtbo
+
 imx7d-colibri-emmc-iris-v2-panel-cap-touch-7inch-parallel-dtbs := \
 	imx7d-colibri-emmc-iris-v2.dtb \
 	imx7d-colibri-emmc-panel-cap-touch-7inch-parallel.dtbo
@@ -459,8 +463,10 @@ dtb-$(CONFIG_SOC_IMX7D) += \
 	imx7d-colibri-emmc-aster-panel-cap-touch-7inch-parallel.dtb \
 	imx7d-colibri-emmc-aster-vga.dtb \
 	imx7d-colibri-emmc-iris.dtb \
+	imx7d-colibri-emmc-iris-panel-cap-touch-10inch-lvds.dtbo \
 	imx7d-colibri-emmc-iris-vga.dtb \
 	imx7d-colibri-emmc-iris-v2.dtb \
+	imx7d-colibri-emmc-iris-v2-panel-cap-touch-10inch-lvds.dtb \
 	imx7d-colibri-emmc-iris-v2-panel-cap-touch-7inch-parallel.dtb \
 	imx7d-colibri-emmc-iris-v2-vga.dtb \
 	imx7d-colibri-emmc-eval-v3.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-iris-panel-cap-touch-10inch-lvds.dtso b/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-iris-panel-cap-touch-10inch-lvds.dtso
new file mode 100644
index 000000000000..ad0f37c71708
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-iris-panel-cap-touch-10inch-lvds.dtso
@@ -0,0 +1,92 @@
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
+&{/} {
+	lvds-encoder {
+		compatible = "thine,thc63lvd827";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_lvds_transceiver>;
+		b6b8-gpios = <&gpio7 2 GPIO_ACTIVE_HIGH>;
+		map-gpios = <&gpio2 13 GPIO_ACTIVE_HIGH>;
+		mode-gpios = <&gpio7 3 GPIO_ACTIVE_HIGH>;
+		powerdown-gpios = <&gpio7 11 GPIO_ACTIVE_LOW>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lvds_bridge_in: endpoint {
+					pclk-sample = <1>;
+					remote-endpoint = <&lcdif_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				lvds_bridge_out: endpoint {
+					remote-endpoint = <&lvds_panel_in>;
+				};
+			};
+		};
+	};
+
+	lvds-panel {
+		compatible = "logictechno,lt170410-2whc";
+		backlight = <&backlight>;
+		power-supply = <&reg_3v3>;
+
+		port {
+			lvds_panel_in: endpoint {
+				remote-endpoint = <&lvds_bridge_out>;
+			};
+		};
+	};
+};
+
+&atmel_mxt_ts {
+	pinctrl-0 = <&pinctrl_atmel_connector>;
+	/* SODIMM 107 / TOUCH_INT# */
+	interrupt-parent = <&gpio2>;
+	interrupts = <15 IRQ_TYPE_EDGE_FALLING>;
+	/* SODIMM 106 / TOUCH_RST# */
+	reset-gpios = <&gpio2 28 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
+
+&backlight {
+	status = "okay";
+};
+
+&lcdif {
+	status = "okay";
+
+	port {
+		lcdif_out: endpoint {
+			remote-endpoint = <&lvds_bridge_in>;
+		};
+	};
+};
-- 
2.47.3


