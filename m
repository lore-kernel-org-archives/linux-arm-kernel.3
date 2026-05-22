Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB23CD5BB4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 14:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wF/xdHDvjpswHjQlyB9UB/0Ql6EbDcVwyoLerz8dv4c=; b=Khz7NjSdFdWrl1ssQb5mn7NZEW
	LMaK9Oc1UXAGeAzgyQHtJyh1iBAGEqOtR64v4CJVFAa30pdgqSYvlK31/ne1Zqd0PnBDlhsh7AUIM
	8sr/iluSmhI6GhlnTKz0/JVuApO9HNMGBfgIQnd5Z0e/J5Ww+LlUo6PNWDSM2fkClfRK4z8QRpq81
	t8VNWXODWD5aLwCXLBWsvFMgHbDWKJkGWqPa9DrSY84THBBlxbr+NaLOoBE3o1HDUcGbHJaeiMrD+
	Z1KYmLZFdUam2sfWgLn/2PtCfmvmAynIQMYhNZKDW1u9PelhFm0sI1V38IS0nkal9LiN5JQgR2oiU
	Ca6HxNCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPnv-0000000AwJI-3ITb;
	Fri, 22 May 2026 13:20:43 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPns-0000000AwHN-2Te8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 13:20:41 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-490426d72f7so7672585e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779456039; x=1780060839; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wF/xdHDvjpswHjQlyB9UB/0Ql6EbDcVwyoLerz8dv4c=;
        b=KKE69tmk6rP7Amk8LXEsdRg8ouOxX7GunPPBk2rONRDqwsyXP0ARKnXjgYW/Gfj2z3
         LwjIeyw9Lc/mjUmcDHE+7W9rJFZsPifIrT9XTuqpkF4NB8tUccW/bcECAeANxvZjlF0T
         UR0Ju2T9mrh5PdtFYHzHJeBrt1HiBFvSMURpDGmNy2m4mCkHNG4yPwXfxpHWokcAubSg
         PGIDa+3k/VR9Q1XNafViqhfqzvVa2aDCBvQ+ZCGq5CqujbXBbUhkgmNiz6hjRhDZc0Mr
         xwDy/ge6NwlEtN68PFKZq6cncqiaV0bztt51SKJyxX8PtpCHp6inCUHwicLXKnkbgfll
         F2Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456039; x=1780060839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wF/xdHDvjpswHjQlyB9UB/0Ql6EbDcVwyoLerz8dv4c=;
        b=CGV+i1w2CXBa+w4zgR0P0MQHo6vZTCk26MktrmLYUXaZ3FR9YvIdNtEjd9mQrtYe+N
         8+eiYfXO4wKCdXiIIQhIZUIA3DeP0N7whJC0wP/ZcdUP/7vjRB8rTZS8KVLfo+5B1RB9
         PpKi03BvhIcLN8ObrzCg2OnJlxurYhD1z946Nu467NMu8/FMcNoRuIPgO/E4o56UTe8Z
         2HEM9a2iwZb0L8PgfaAb4a5PTAxwV4f4U5ULAI95ATcsN0eiJb2oqtfNhDxqOaRctEEG
         bjLl2Qqxo50ASqNVLtgXX9LFJQ7wRIVtxl3Rj71A9EIzxHHnnyUNpTBZwnYKOXD/uJAA
         YSNw==
X-Forwarded-Encrypted: i=1; AFNElJ9n1Ej87JShK8M7CxLtV8Wr1Nas3vNZy2aWKozH0nwyjynPc6itQ5ku+BlaojdwC8JG5H0cpGPFcME0cIf6MjJW@lists.infradead.org
X-Gm-Message-State: AOJu0YxOkm3ldov8TGycdGhuP8sPArCFQN46qtprYz2YKbEO83GJFSLp
	0/gQxq1yK54ZZCv2GcBmWmNkc0dOiTiJBcwMRj6PqWsG3Tj5BtxT0UOQ
X-Gm-Gg: Acq92OEt7Z1gQQvdiMHyVDXgYSn1PYdh0o2wbsSshIbdzbFJ1WKtXa35obH0agoEiIw
	KcpZLiRuUOqjLyRtb909fPHKsublsR7vmGk+S7gfOe4JRUISooy8O7H7dja/Gme5JcuZKb3efM7
	5ky07wPLEfCa7xz7sxV5aZPlmXsHr9ncd6Y3ftYvhAU5pQUvpWUa6E371LM5q2Xk00nh3VTjuvg
	3ZaA9kCq4N+bs+CV7v2/qGEGgfdEIXETkqQypNV4xQsXUMpC012iiUnPd/oTQ5B6Qq8wJtoVcq5
	Zzay62toAPbyMROzvF5SHRmAQRz4CoMHf2XYvRzxeev0AhZtN6IYRy5qj4mro3UQTq2q6ULqIqu
	W3rCYbwiKmwGtU/CKqip+GC0+wI75liE0jfWtdGs3tzc7fx8MWUlKoBpEuOHPqW1MW7V+vNA756
	u1wdZCDkIizlPPmYMRweYGKLzdu6l23xDYoXW2dnBCvA==
X-Received: by 2002:a05:600c:4ecc:b0:488:a824:fdff with SMTP id 5b1f17b1804b1-490426d190cmr49964645e9.22.1779456038767;
        Fri, 22 May 2026 06:20:38 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0cd5sm52220755e9.10.2026.05.22.06.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:20:38 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 02/11] arm64: dts: ti: k3-am62-verdin: Add Toradex Capacitive Touch Display 10.1" LVDS
Date: Fri, 22 May 2026 14:20:15 +0100
Message-ID: <20260522132014.226721-15-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522132014.226721-13-ivitro@gmail.com>
References: <20260522132014.226721-13-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_062040_685268_4C0A332A 
X-CRM114-Status: GOOD (  15.87  )
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

From: Vitor Soares <vitor.soares@toradex.com>

Add a device tree overlay for the Toradex Capacitive Touch Display 10.1"
LVDS connected via Verdin AM62 OLDI on carrier boards exposing LVDS
interface (e.g., Mallow). The panel is a LogicTechno LT170410-2WHC 10.1"
WXGA IPS LCD and the touch input is provided by an Atmel MaxTouch
capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
Changes in v2:
- Use panel-simple compatible form

 arch/arm64/boot/dts/ti/Makefile               |   5 +
 ...25-verdin-panel-cap-touch-10inch-lvds.dtso | 119 ++++++++++++++++++
 2 files changed, 124 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-lvds.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index b2408f62c139..867c05b675d1 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -33,6 +33,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-zinnia.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-10inch-lvds.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dev-dsi-to-hdmi.dtb
@@ -213,6 +214,9 @@ k3-am625-sk-hdmi-audio-dtbs := k3-am625-sk.dtb k3-am62x-sk-hdmi-audio.dtbo
 k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := \
 	k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
+k3-am625-verdin-wifi-mallow-panel-cap-touch-10inch-lvds-dtbs := \
+	k3-am625-verdin-wifi-mallow.dtb \
+	k3-am625-verdin-panel-cap-touch-10inch-lvds.dtbo
 k3-am62-lp-sk-hdmi-audio-dtbs := k3-am62-lp-sk.dtb k3-am62x-sk-hdmi-audio.dtbo
 k3-am62-lp-sk-nand-dtbs := k3-am62-lp-sk.dtb k3-am62-lp-sk-nand.dtbo
 k3-am62a7-phyboard-lyra-disable-eth-phy-dtbs := k3-am62a7-phyboard-lyra-rdk.dtb \
@@ -315,6 +319,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am625-sk-csi2-tevi-ov5640.dtb \
 	k3-am625-sk-hdmi-audio.dtb \
 	k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb \
+	k3-am625-verdin-wifi-mallow-panel-cap-touch-10inch-lvds.dtb \
 	k3-am62-lp-sk-hdmi-audio.dtb \
 	k3-am62-lp-sk-nand.dtb \
 	k3-am62a7-phyboard-lyra-disable-eth-phy.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-lvds.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-lvds.dtso
new file mode 100644
index 000000000000..48479e83dcd3
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-lvds.dtso
@@ -0,0 +1,119 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" connected via Verdin AM62 OLDI
+ * on carrier boards with a Toradex standard LVDS display connector
+ * (e.g., Mallow).
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-lvds
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pwm/pwm.h>
+#include "k3-pinctrl.h"
+
+&{/} {
+	backlight_pwm2: backlight-pwm2 {
+		compatible = "pwm-backlight";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2s_2_d_out_gpio>;
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
+		/* Verdin I2S_2_D_OUT as GPIO (SODIMM 46) */
+		enable-gpios = <&main_gpio0 34 GPIO_ACTIVE_HIGH>;
+		/* Verdin PWM_2 (SODIMM 16) */
+		pwms = <&epwm0 1 6666667 PWM_POLARITY_INVERTED>;
+	};
+
+	panel-lvds-native {
+		compatible = "logictechno,lt170410-2whc";
+		backlight = <&backlight_pwm2>;
+		power-supply = <&reg_3v3_lvds_native>;
+
+		port {
+			panel_lvds_native_in: endpoint {
+				remote-endpoint = <&oldi0_out>;
+			};
+		};
+	};
+
+	reg_3v3_lvds_native: regulator-3v3-lvds-native {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+	};
+};
+
+&dss {
+	status = "okay";
+};
+
+&dss_ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	/* DSS VP1: internal DPI output to OLDIx */
+	port@0 {
+		reg = <0>;
+
+		dss0_out: endpoint {
+			remote-endpoint = <&oldi0_in>;
+		};
+	};
+};
+
+/* Verdin I2C_2_DSI */
+&main_i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touch@4a {
+		compatible = "atmel,maxtouch";
+		reg = <0x4a>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2s_2_d_in_gpio>, <&pinctrl_i2s_2_sync_gpio>;
+		/* Verdin I2S_2_SYNC as GPIO (SODIMM 44) */
+		interrupt-parent = <&main_gpio0>;
+		interrupts = <37 IRQ_TYPE_EDGE_FALLING>;
+		/* Verdin I2S_2_D_IN as GPIO (SODIMM 48) */
+		reset-gpios = <&main_gpio0 33 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&main_pmx0 {
+	/* Mallow Touch RST */
+	pinctrl_i2s_2_d_in_gpio: main-gpio0-33-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x0088, PIN_INPUT, 7) /* (L24) GPMC0_OEn_REn.GPIO0_33 */ /* SODIMM 48 */
+		>;
+	};
+
+	/* Mallow Touch INT# */
+	pinctrl_i2s_2_sync_gpio: main-gpio0-37-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x0098, PIN_INPUT, 7) /* (U23) GPMC0_WAIT0.GPIO0_37 */ /* SODIMM 44 */
+		>;
+	};
+};
+
+&oldi0 {
+	status = "okay";
+};
+
+&oldi0_port0 {
+	oldi0_in: endpoint {
+		remote-endpoint = <&dss0_out>;
+	};
+};
+
+&oldi0_port1 {
+	oldi0_out: endpoint {
+		remote-endpoint = <&panel_lvds_native_in>;
+	};
+};
-- 
2.54.0


