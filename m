Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38DFCC79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 18:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pwhnjkKX5SffmqWRw89HSGPh7x+52vp6lBn4P2+YAcc=; b=XmyU+gq7fKBLgptlvmZSBi2fCI
	bJ2nrryh9FeeXTUzJU87T9DgfD9FDkXOzSXSyJKt1CgbJekVnfl3DW+WILWQVz2ZDGGYDCyZJcZLa
	Sa9xj+eqj5lLUXZA/xDml4iDOV11T0Ns//fAk6+qgHR5ckMIECPwFYsJ2slWZZ3KtoCYPBYJbC5HD
	v4+XtPNFOC8zxGQSK1wh1p1kMnIpBnXhzcJBvQ4O16fYkgHeWCMrV+BtOoHr1NVkXfInz9icU1cxw
	EPlDfeYSm256B/l43SlOEJzThB1Tv6igeXaRwLT0KbQ4BHnx8IVlQtVgt3Sa2iLxC2ltCp22FYH9S
	x94MPJOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Moh-0000000Cb2R-3uFA;
	Wed, 09 Sep 2026 18:14:39 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Mof-0000000Cb1r-0e3D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 18:14:38 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2d91ff7d9acso54060475ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 11:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788977676; x=1789582476; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pwhnjkKX5SffmqWRw89HSGPh7x+52vp6lBn4P2+YAcc=;
        b=XZu9b5QPsVlIhKhR7SDt1rNUsGbcrfiyDdPF/UXv7szGaDuAnCBJomolCwdAjLYHO4
         2RoGFgo6qnmHIiWBTV7p0rkUIjzWMh/SdufM+LVMGwmA7f2vLVkeNErYingheHlmFJdc
         iS7s49ZsAHn8LhQ2pwDbe7Thcdju1OL2KrFqbTW/zqYqb3/ZoBlwqhBcqeCXhEj6vqdl
         J4S+CdQtqXPug7goeIh9eazhPpvzthp9LFzn8O8PBnxFwhdHJ7EhpaDw6OvOfdv8dZpD
         JDOe+PjWuKkO0tqDUluGnWaueM/ViSGfyIkDT/gRbE4HhHjuh7WRwzcdXlcNVIXwN5SD
         RtSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788977676; x=1789582476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pwhnjkKX5SffmqWRw89HSGPh7x+52vp6lBn4P2+YAcc=;
        b=C+BmekXtGHs7iia3YXKeQn0D2xxlT1riNCg7UzFYEiJIJbLHnPMCi+ekTV+ywEa25J
         CM7HKO7R8W+HRqoz4ue4si2oGxpIqfrvblh/H7Ml7SPzacSlXiD7HkvxkigBB8d7Yzo0
         mYYbkl8RCwMV+w5tztlaTIko7PypgTf9huY2UTj5GS3YbI8ZrXlI2U9pjsCBmoeSbJ21
         anjj66PJzeJg/0Wl44ZLKz/NhQFy0n1YQknCZlkcDYLWuyLyFrrimysFLjdSbvO1BLDu
         DMkJCbMukpsApq7uhTG4euP2GNp8QMN/Nbph2GqgIELbpi+J9sL5E2iro3+u7Kupyaj1
         MaDw==
X-Forwarded-Encrypted: i=1; AKwUvByii9E2LzcZSX++DKpgNK2NeD+oLx7ra2GSrKS6VD26dXTzGA8Q9vRIGfv6A/suj1JhRw6mQePpIBjnLCPFacQI@lists.infradead.org
X-Gm-Message-State: AFuF++mGXW8RtjSJkiXYBtZKl7a1YQAs/ZOj3yKjszaOkGIbMPYOkcyw
	pGSPqgtdaYbylOvcMUaVR88DiHbutsWwdR0O9iJ15ZsNvRIoPIZoLiGi
X-Gm-Gg: AYBFou0/8j9h+MfPwwslx5EkOwiR6QO/1jmUOsKaTAlnzX6OEe0VMrU2aBa14PML4S7
	sgDZOeX7Zcb9FJIUjK6EV0qd1aeXMAQX7f2FlGRBwjsWK3lOFSLJl+odvAOC0oOSI81pRhYlClg
	/GIdI1T2VcCYdDwONd5DnVDHZc+st+fr5a1HHIp0kB49UIAcdOCuJU9JnxOIVe1bcZSXRubLjNB
	GYyZi8qTPVFhr+EslB7Zd4eMkE0bzn0RkPa8fcH74EaLlJXYA5HoGwhFMkwoH8GufqhRmA3MlYD
	TJI/8tygjwA6cCbQZlKpypFd/EA6U/eTwbp6xh5bL/vz4EipvbfhU6VQZaoUvQDh8h+4jDj3O4V
	V3xl42FVqYcjb4F3VTiwZ5rmfzcoN33iorcJDLq/pqWvUfZg6/Zkjg/Kc4rPSWgAuCSrSzv1x1P
	lKHMTsm7lKOl/k6hoxZ5jLFVLUP2hCbPvzAlii0WWMit4OeUefn5udYmCETK4O7M/DK+RxIkhDo
	h4+h2okTYi4hdx8
X-Received: by 2002:a17:903:2f86:b0:2db:210f:c104 with SMTP id d9443c01a7336-2db210fc254mr424562675ad.10.1788977676106;
        Wed, 09 Sep 2026 11:14:36 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1495b57fsm77694195ad.24.2026.09.09.11.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 11:14:35 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: u-kumar1@ti.com,
	nm@ti.com,
	vigneshr@ti.com,
	kristo@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: leonardo.costa@toradex.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: ti: k3-am69-aquila: Add Toradex DSI to LVDS adapter with the 10.1" V2 display
Date: Wed,  9 Sep 2026 15:12:09 -0300
Message-ID: <20260909181332.1081552-1-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_111437_211524_F8C5B73B 
X-CRM114-Status: GOOD (  18.87  )
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
Toradex Capacitive Touch Display 10.1" LVDS V2. The adapter connects to the
Aquila DSI_1 interface. It is based on the Texas Instruments SN65DSI84
DSI-to-LVDS bridge and drives an Opto Logic SCX1001511GGC49 10.1" WXGA TFT
LCD LVDS panel. Touch input is provided by an ILITEK ILI251x capacitive
touch controller.

Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-lvds-adapter
Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
Changes in v2:
- Add comment explaining the panel timings difference between this
  overlay and the ones for the native LVDS interface (without the DSI to
  LVDS bridge).
- Add information in the hardware pin comments about which signals in
  the DSI to LVDS bridge each pin connects to.
- Add comment explaining why the rising edge is used on the TOUCH_INT#
  signal.
- Link to v1: https://lore.kernel.org/all/20260803173705.2268792-1-leoreis.costa@gmail.com/T/#
---
 arch/arm64/boot/dts/ti/Makefile               |   5 +
 ...dsi-to-lvds-v2-panel-cap-touch-10inch.dtso | 161 ++++++++++++++++++
 2 files changed, 166 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 795978e962ee..536a34e132ed 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -225,6 +225,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dsi-to-lvds-panel-cap-touch-10inch.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dsi-to-lvds-v2-panel-cap-touch-10inch.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-panel-cap-touch-7inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-sk.dtb
@@ -389,6 +390,9 @@ k3-am69-aquila-dev-csi-ov5640-dtbs := \
 k3-am69-aquila-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := \
 	k3-am69-aquila-dev.dtb \
 	k3-am69-aquila-dsi-to-lvds-panel-cap-touch-10inch.dtbo
+k3-am69-aquila-dev-dsi-to-lvds-v2-panel-cap-touch-10inch-dtbs := \
+	k3-am69-aquila-dev.dtb \
+	k3-am69-aquila-dsi-to-lvds-v2-panel-cap-touch-10inch.dtbo
 k3-am69-sk-csi2-dual-imx219-dtbs := k3-am69-sk.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
 k3-am69-sk-pcie0-ep-dtbs := k3-am69-sk.dtb \
@@ -491,6 +495,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am69-aquila-dev-csi-ov5640-24mhz.dtb \
 	k3-am69-aquila-dev-csi-ov5640.dtb \
 	k3-am69-aquila-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb \
+	k3-am69-aquila-dev-dsi-to-lvds-v2-panel-cap-touch-10inch.dtb \
 	k3-am69-sk-csi2-dual-imx219.dtb \
 	k3-am69-sk-pcie0-ep.dtb \
 	k3-j7200-evm-pcie1-ep.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso b/arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso
new file mode 100644
index 000000000000..92e270611f05
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso
@@ -0,0 +1,161 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex DSI to LVDS Adapter on Aquila DSI_1 with Capacitive Touch Display
+ * 10.1" V2 Used on Development Board (J44). DSI_1 is exposed via a Samtec
+ * LSS-130 connector.
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
+	backlight_pwm3: backlight-pwm3 {
+		compatible = "pwm-backlight";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_19_dsi_1>;
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
+		/* Aquila GPIO_19_DSI_1 (AQUILA B44) - DSI_1_BKL_EN_LVDS */
+		enable-gpios = <&main_gpio0 13 GPIO_ACTIVE_HIGH>;
+		/* Aquila PWM_3_DSI (AQUILA B46) - PWM_3_DSI_LVDS */
+		pwms = <&main_ehrpwm5 0 6666667 0>;
+	};
+
+	panel-lvds-bridge {
+		compatible = "optologic,scx1001511ggc49", "panel-lvds";
+		backlight = <&backlight_pwm3>;
+		data-mapping = "vesa-24";
+		height-mm = <136>;
+		width-mm = <217>;
+
+		/*
+		 * The timings here are different from the nominal ones for the
+		 * SCX1001511GGC49 display. The clock-frequency, along with the
+		 * other timings, are adjusted from experimentation to work
+		 * consistently with the DSI to LVDS bridge (TI SN65DSI84)
+		 * across Toradex modules that use it.
+		 */
+		panel-timing {
+			clock-frequency = <70000000>;
+			hactive = <1280>;
+			hback-porch = <55>;
+			hfront-porch = <55>;
+			hsync-len = <45>;
+			vactive = <800>;
+			vback-porch = <5>;
+			vfront-porch = <5>;
+			vsync-len = <3>;
+			de-active = <1>;
+			hsync-active = <0>;
+			vsync-active = <0>;
+			pixelclk-active = <0>;
+		};
+
+		port {
+			panel_lvds_bridge_in: endpoint {
+				remote-endpoint = <&dsi_lvds_bridge_out>;
+			};
+		};
+	};
+};
+
+&dphy_tx0 {
+	status = "okay";
+};
+
+&dsi0 {
+	status = "okay";
+};
+
+&dsi0_ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	port@0 {
+		reg = <0>;
+
+		dsi0_out: endpoint {
+			remote-endpoint = <&dsi_lvds_bridge_in>;
+		};
+	};
+
+	port@1 {
+		reg = <1>;
+
+		dsi0_in: endpoint {
+			remote-endpoint = <&dpi2_out>;
+		};
+	};
+};
+
+&dss_ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	port@2 {
+		reg = <2>;
+
+		dpi2_out: endpoint {
+			remote-endpoint = <&dsi0_in>;
+		};
+	};
+};
+
+&i2c_dsi_0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	bridge@2c {
+		compatible = "ti,sn65dsi84";
+		reg = <0x2c>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_20_dsi_1>;
+		/* Aquila GPIO_20_DSI_1 (AQUILA B45) - LVDS_EN */
+		enable-gpios = <&main_gpio0 18 GPIO_ACTIVE_HIGH>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				dsi_lvds_bridge_in: endpoint {
+					remote-endpoint = <&dsi0_out>;
+					data-lanes = <1 2 3 4>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				dsi_lvds_bridge_out: endpoint {
+					remote-endpoint = <&panel_lvds_bridge_in>;
+				};
+			};
+		};
+	};
+
+	touchscreen@41 {
+		compatible = "ilitek,ili251x";
+		reg = <0x41>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_17_dsi_1>, <&pinctrl_gpio_18_dsi_1>;
+		/* Aquila GPIO_17_DSI_1 (AQUILA B42) - TOUCH_INT# */
+		/* Rising edge avoids spurious interrupts from the noisy falling edge. */
+		interrupt-parent = <&main_gpio0>;
+		interrupts = <12 IRQ_TYPE_EDGE_RISING>;
+		/* Aquila GPIO_18_DSI_1 (AQUILA B43) - TOUCH_RESET# */
+		reset-gpios = <&main_gpio0 31 GPIO_ACTIVE_LOW>;
+	};
+};

