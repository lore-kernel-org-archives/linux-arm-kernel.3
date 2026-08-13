Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A70C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 13:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=089KQAiVoNPGKgHJpaInzv/69PucbNyqkb0494Vo8Ak=; b=1vOFjSVJcCVFyTtBCO9vMUZ3Bu
	U3VlHgYGLC1rtQIBRq9XXEQ37GdFvad1Sh9RmZ+QxPd9rOr0jE9EzNSy5NRE1w0qbCOXjLdJ1cG7E
	hkNoALLK135NfnkEB4hKS2BNYXmGyK0IWL+RIxiYl374rIQUBxFx6c+NZxFOO5UKHIP5rnXt/d2nF
	wxCG5W5bmsnh/kl1i/82KX4IPt4Sel8VbC6dgDq+wNqUZtav06twSnVugvEox5ZD3DesCiWpI2YpV
	yf9HYHINBzMW+UnRegSFFopKms137RyW3cGSqSW8SOh13ZxaF4F/OCXxvO0GMiXe3YYOViQe5iqu8
	N8TaKSQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuVa2-00000000kmV-1cly;
	Thu, 13 Aug 2026 13:34:46 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuVa0-00000000klj-2s5G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 13:34:45 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2caf228a910so6113885ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 06:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786628084; x=1787232884; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=089KQAiVoNPGKgHJpaInzv/69PucbNyqkb0494Vo8Ak=;
        b=rilc8MsljLhyAa0+UMkQ/BXjQ4CJ1b1huQndDwqvoZE8PjtsXqUuR2t1DG8YRzkeDP
         SzXHPag95TnMLk4K0l8IQuqK+8OZvF/liJpgfBkmXbLRqMNhff9TqD1liPCGOYsevxED
         +3bWy9TkGyrLBaIks/Q4sXPlGifzzNH6zFlray8TQMrSoP73BQgZNGhGEcJD5n8VzFXG
         UjAJQFhKhaozbhe1plpx/l6+6GTghZZIr5EwU2MW4B94FgLJxztcz5xbyv36h3+DDgmF
         +ASIMY/49Pv0AkGNB2/DW+xHQfurwNh1Rx6Q4Er8kg4huxVI8jf/emMQ+oLL5qpCJHBC
         HlRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786628084; x=1787232884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=089KQAiVoNPGKgHJpaInzv/69PucbNyqkb0494Vo8Ak=;
        b=nF1V/rv0VPr3n/WtxVZtzCBxpWhAvZd6peesTcY3U68stkSaVS3YXJpA6fB+zA/+rt
         37v+AE/jjn8oyvGEoDTVpt2D6ZiUWksHPY7zwHqBNGMDM8cPMs15yhe7OksryGFOYvhR
         0RRiuGzsjbu9atltwvVkQWk6O74uwF+AWdNZkH6Efffo+V2Q7vgjfiej5XjztHgrDYHL
         GIuwdIfbbKaAzdJtkWcUQAf0adzbMkunie0tet0io43v8aWtGun9sB6nFkJpw3NXjoYT
         VMoK0TSviMYvroHcnVASMxcRgxpskEsUXnvC9CCpzNVfJELdPb9GzDkO2tsSvQSstSy7
         Sqmw==
X-Forwarded-Encrypted: i=1; AHgh+RqUoXoAoFIqI1DMLHW4vurMtLIGh5dlWwb37ieumm7gLPpa8oNYCzOLb8pFlmS4eourwpqhNMvgZj0xNt9nDcln@lists.infradead.org
X-Gm-Message-State: AOJu0YyuW4mf+sAJD+Q4+94p+LSXNJX5/xtmmx39/SqQ2K7iCX87nMCH
	bNeZMsL1RBh4adjsjOh8oU8gkFkSY16sSeoyZwaQKa0unaCmI325tplG
X-Gm-Gg: AR+sD10nbGfD1egfy41u2xzNQJBMCT3x0rInGHp3sSDfaT9LYyCkgBpAMLeLtjbjUF6
	dQK4HWU8yOUGfYkIJPaMVbJoc/DIMLOKiVg1DFJyJZCfls3e8brQBDbx9c73SYIJ+PMWeBrfLO6
	RjOb6bRaKCslnX1+VZ+gXkcB7Uq2D7Mpwy6LG2ONEXRecs4TsDeB9OV7/RghsWswX5Z9FqzhVv1
	Z0/lMr7IOo+XC3CrMBTT77w7OOQamO8J3JNbQY5ih3uuRBlQ1zsi8ip1CZzbHhLYsNXBhho8MuJ
	rm9Sc7TY0tEh/7K/sOKdEvjt90JGBK0hJBj5lI96mS7HYo5WYnF1EorlBdDkfZbyEpNN5TjHo9N
	4p2T7W+OlDwDXRd8m6i+2CgT6wUslMykx8wGcBE+vdOa26b41ZHSm59Yrt5bUiRhuiH2LWn1PBQ
	gTQzJRy/zBWDiX47sDVxB6/pPpsL/V2DRoSCexKMgo/tv3WL5QYPOq4QvwZxkY+88vC3Q=
X-Received: by 2002:a17:90b:5310:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-3931e0fcad7mr6769440a91.10.1786628083440;
        Thu, 13 Aug 2026 06:34:43 -0700 (PDT)
Received: from leonardoc-nb ([179.160.38.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebc75d891sm8447990eec.5.2026.08.13.06.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 06:34:43 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: [PATCH 2/6] arm64: dts: freescale: imx8mp-verdin: Add Toradex DSI to LVDS adapter with 10.1" display
Date: Thu, 13 Aug 2026 10:33:31 -0300
Message-ID: <20260813133335.1941580-3-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813133335.1941580-1-leoreis.costa@gmail.com>
References: <20260813133335.1941580-1-leoreis.costa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_063444_731224_E500A065 
X-CRM114-Status: GOOD (  14.66  )
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

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay for the Toradex DSI to LVDS Adapter with the
Toradex Capacitive Touch Display 10.1" LVDS. The adapter connects to the
Verdin DSI_1 interface. It is based on the Texas Instruments SN65DSI84
DSI-to-LVDS bridge and drives a LogicTechno LT170410-2WHC 10.1" WXGA LVDS
panel. Touch input is provided by an Atmel MaxTouch capacitive touch
controller.

Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-lvds-adapter
Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  5 +
 ...in-dsi-to-lvds-panel-cap-touch-10inch.dtso | 94 +++++++++++++++++++
 2 files changed, 99 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index d643f85baa7f..c55269a0532a 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -508,6 +508,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw73xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw74xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw75xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw82xx-2x.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-ivy.dtb
@@ -517,12 +518,16 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-panel-cap-touch-10inch-lvds.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow-panel-cap-touch-10inch-lvds.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-zinnia.dtb
 
+imx8mp-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := \
+	imx8mp-verdin-wifi-dev.dtb \
+	imx8mp-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 imx8mp-verdin-wifi-mallow-panel-cap-touch-10inch-lvds-dtbs := \
 	imx8mp-verdin-wifi-mallow.dtb \
 	imx8mp-verdin-panel-cap-touch-10inch-lvds.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso
new file mode 100644
index 000000000000..da05a0256889
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex DSI to LVDS Adapter on Verdin DSI_1 with Capacitive Touch Display
+ * 10.1", used on Dahlia (X17) and Development Board (X48) that expose DSI_1
+ * via a Samtec LSS-130 connector.
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-lvds
+ * https://developer.toradex.com/hardware/accessories/add-ons/dsi-lvds-adapter
+ * https://www.toradex.com/accessories/verdin-dsi-to-lvds-adapter
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	panel-lvds-bridge {
+		compatible = "logictechno,lt170410-2whc";
+		backlight = <&backlight>;
+		power-supply = <&reg_dsi_lvds>;
+
+		port {
+			panel_lvds_bridge_in: endpoint {
+				remote-endpoint = <&dsi_lvds_bridge_out>;
+			};
+		};
+	};
+
+	reg_dsi_lvds: regulator-dsi-lvds {
+		compatible = "regulator-fixed";
+		/* Verdin CTRL_SLEEP_MOCI# (SODIMM 256) */
+		gpios = <&gpio4 29 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+		regulator-name = "DSI_1_PWR_EN";
+	};
+};
+
+&atmel_mxt_ts {
+	vdd-supply = <&reg_dsi_lvds>;
+
+	status = "okay";
+};
+
+&backlight {
+	status = "okay";
+};
+
+&lcdif1 {
+	status = "okay";
+};
+
+&lvds_ti_sn65dsi84 {
+	vcc-supply = <&reg_dsi_lvds>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			dsi_lvds_bridge_in: endpoint {
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&mipi_dsi_out>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+
+			dsi_lvds_bridge_out: endpoint {
+				remote-endpoint = <&panel_lvds_bridge_in>;
+			};
+		};
+	};
+};
+
+&mipi_dsi {
+	samsung,esc-clock-frequency = <16000000>;
+
+	status = "okay";
+};
+
+&mipi_dsi_out {
+	remote-endpoint = <&dsi_lvds_bridge_in>;
+};

