Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E88F0C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 16:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aCWxL+gdHp3rawACd96l5HhEzAGyed8VGNhhwwNNZMg=; b=DL6Vh7x64KB/ULIlmvxs30uLkB
	KN+jWhMG3//Tj2gHwSHHSmOeeNpiriXg/D/8hYQzCFlkkgJN6tLRmx35SXuQa16DC4FrWXoxJoPBZ
	5y+ydhch/kQLwV5X1HH4LIeQrouVfok3n1/Mlz1a1wn3twz6kbns5QzomPS7riLkDigYBvlT3Gqiw
	8iFRKMpk/tMtle9TQiA+VbEIKuAJ59FnvVoJLSGPav9jzv5va6x/p2HKKyraFUq3fRane3pj//HB1
	TafTLn2pINklaIx6kwBw4oxw9jEX3r8WYVZXOp9tRSdiLhx/3mvX3CpnRd6WutaAnYorsJxvJlRH9
	hpo74lwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnIhf-0000000GpaE-2U5X;
	Fri, 24 Jul 2026 16:24:51 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnIhZ-0000000GpWW-0Kyf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 16:24:46 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-47f7872abb6so438061f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 09:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784910283; x=1785515083; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aCWxL+gdHp3rawACd96l5HhEzAGyed8VGNhhwwNNZMg=;
        b=Wf0V4WpRVMkAgdKRzbO3gj6SxsJMtDFAKptrQYFWM/OS3rUGGZ4VaTcia06XI+Dnnb
         tb9qLeItNQ9DSbAKOHsgl/bqBu6juZXlVS6G7nNnxHBRjsO6k0OHyP/wI32OzniCwyCU
         DL4dvYkcI1NA84Icn7nQ8zpdt5/Y4tPoYEOtzgNgT2R4R1VFGD1doRMQhimL9NDv4hzF
         gmvTrrHc7rClj7E0CTGN0pMD2UY41KvoW+Yvsk0sGgMpdzeJSL4uLXqoy3bmXaOmCieG
         DuaIN6xZIXKLEjoHRLNnieCtdIQ4j6q7hQ3Vm7tbcN41S+0O9jdBvZVSPunofCFBs9Qu
         cv/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784910283; x=1785515083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aCWxL+gdHp3rawACd96l5HhEzAGyed8VGNhhwwNNZMg=;
        b=iLLXcpS6b2tbaJ32xMrsvongyWRsEv3GfQsMlZS/n0quOktQvPMqeyqh4ATv+mznVm
         6cdU9RhpykEWqpxyy/SkSPFF89ZNTNcOiuzChFKnOp7Vx8+sR4Cee31FvBO/zizuZFl3
         kweyveXj8Qmc5gOPrYZV8QHhfV5nFnEaRoTFBIImzUJcuJKLkko2P/1ZqBSo6C7D4cDP
         sEWEC8b5dYeNp5Af7Y7CSqQPho/mU7+gmq6t1W51s4dKlNYApTB2WLJtejTZ3vAo6hir
         FzfrXJp8ki+aJQWaA7xo9JW4kPX5unJKakaTbkzeCyTmqtvIOT3Oo24kuoLrF54QgwJm
         TTWg==
X-Forwarded-Encrypted: i=1; AHgh+RpNP/HCRNlyyisSwFcYlBNDJlq6jTx3lMObl5opVFP1S1HQJPPVLU574YRPXdUHzpCa0TJARxkC5MK8PKtlIyFa@lists.infradead.org
X-Gm-Message-State: AOJu0Ywwp8xG2p2pq45x6c7csl9A/ggvyLZitLsCBQ9wZzKydNAJ9ZVs
	DmW/a1waffJblJLz7XKqEsUaAEq77adPPhNyQ4uzmhlmM3a2V11m3PdU
X-Gm-Gg: AR+sD11LAO/Io0zXtoId9eRHQLm+73iQ1F5xz+HhP+nt4b0DCMNhyQqULVTThiNY5Us
	dFkJBPI3AMeQosCz5ajVslfjMIEkF1Tor2aTZFd9cNLGFZ+m41TAXmtS9L66YvFkJs0/nKaYGdi
	swhrUnGvc3ri3r6PtiGSZ7LCf5lgfNanMsuzQ5bsRLXy0HWmStGoG/MHBsAzM9xFwECnJX4YX/c
	RX3jGly1qUO5UtkF7tQo+wVp9mQ0e2uXbFMM6czq4pc/0J/VTKLmbvg2yx0thiLgZvlk+mEFh+u
	NidixflU9CHoJXvQHJyMTZpULkHSS74KBQCbwZcfs0mGApQzdOvi55FHeeOInAV+RMpNOFPajJS
	9jq59+AMBhJVTxMLD+Il0TfXmAfXxFKYCaa0I/qvIL0XF4T9Om3Pa3fg0hWqyENhAKgnONqgJyu
	YdpzfbY+glDiuYzuwVySda/NUH2M6JEUzrrfXhFj+R7UiIpJMm9eQzqk6GuzcbkbqojWJP0ASsM
	vhg+w==
X-Received: by 2002:a05:6000:178b:b0:475:f100:35fb with SMTP id ffacd0b85a97d-47f8dcab0a4mr11547786f8f.56.1784910283133;
        Fri, 24 Jul 2026 09:24:43 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a5d9sm24366255f8f.5.2026.07.24.09.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:24:42 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Fri, 24 Jul 2026 18:24:29 +0200
Subject: [PATCH v2 3/7] arm64: dts: freescale: imx8mm-verdin: Add Toradex
 DSI to LVDS adapter with 10.1" display
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-v1-verdin-imx8mm-dtbos-v2-3-9d7988bd76f6@toradex.com>
References: <20260724-v1-verdin-imx8mm-dtbos-v2-0-9d7988bd76f6@toradex.com>
In-Reply-To: <20260724-v1-verdin-imx8mm-dtbos-v2-0-9d7988bd76f6@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_092445_183561_EF10EF00 
X-CRM114-Status: GOOD (  13.60  )
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

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add a device tree overlay for the Toradex DSI to LVDS Adapter with the
Toradex Capacitive Touch Display 10.1" LVDS. The adapter connects to the
Verdin DSI_1 interface. It is based on the Texas Instruments SN65DSI84
DSI-to-LVDS bridge and drives a LogicTechno LT170410-2WHC 10.1" WXGA IPS
LCD panel. Touch input is provided by an Atmel maXTouch capacitive touch
controller.

Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-lvds-adapter
Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   4 +
 ...-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso | 104 +++++++++++++++++++++
 2 files changed, 108 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index f55c570cb3e3..91ae54931818 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -179,6 +179,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7903.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7904.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dev-nau8822-btl.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dsi-to-hdmi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dev-dsi-to-hdmi.dtb
@@ -191,6 +192,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-hdmi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-ivy.dtb
@@ -204,6 +206,8 @@ imx8mm-verdin-nonwifi-dev-dsi-to-hdmi-dtbs := imx8mm-verdin-nonwifi-dev.dtb imx8
 imx8mm-verdin-nonwifi-yavia-dsi-to-hdmi-dtbs := imx8mm-verdin-nonwifi-yavia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 imx8mm-verdin-wifi-dahlia-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-dahlia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 imx8mm-verdin-wifi-dev-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
+imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := imx8mm-verdin-wifi-dev.dtb \
+	imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 imx8mm-verdin-wifi-dev-nau8822-btl-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dev-nau8822-btl.dtbo
 imx8mm-verdin-wifi-yavia-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-yavia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso
new file mode 100644
index 000000000000..2c253018893b
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex DSI to LVDS Adapter on Verdin DSI_1 with Capacitive Touch Display
+ * 10.1". Used on Dahlia (X17) and Development Board (X48) that expose DSI_1
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
+#include <dt-bindings/pwm/pwm.h>
+
+&{/} {
+	backlight_pwm3: backlight-pwm3 {
+		compatible = "pwm-backlight";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2s_2_d_out_dsi_1_bkl_en>;
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
+		/* Verdin I2S_2_D_OUT (SODIMM 46) - DSI_1_BKL_EN_LVDS */
+		enable-gpios = <&gpio3 24 GPIO_ACTIVE_HIGH>;
+		power-supply = <&reg_3p3v>;
+		/* Verdin PWM_3_DSI (SODIMM 19) - PWM_3_DSI_LVDS */
+		pwms = <&pwm1 0 6666667 PWM_POLARITY_INVERTED>;
+	};
+
+	panel-lvds-bridge {
+		compatible = "logictechno,lt170410-2whc";
+		backlight = <&backlight_pwm3>;
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
+		gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
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
+&lcdif {
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

-- 
2.43.0


