Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7678CA5FD9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 07:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C6LcBsrn3qmklfWXf6wHISNXjWe9EOmsJSpM+lvYuXY=; b=AlyKEqzkx229kaxASH7gxM7ZWP
	EfJ+pXYQqxDCZjJl0HKTorQvh3gjdUz8MZKNtweLhxgQ6Np9CR0WH4hI6GxEgDcf24wT/QWwyQGSA
	gQ4w2G8boMm1C1v4EZtSqPxf7lJBEHGdxMzeUEZzaOJxHVqyNZJTNQTbx/hNQ8s55kQexNYU9Ng44
	o1W7zH4/LDsdnha6fEruT8e0qXG3mjdhSQgNKPBzbpCNwTi0HlU9yvlmcPv0V1BoXbl/QOJ7hAw2F
	Un3VSnPszPFTbXdxWd3iQsGHrT8aSf9lonk0WkWxbEajDmuD7mimMkcTe4k6HXHX3anau6fCtZMP4
	tbPlOoag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCY8P-0000000Av60-2yQT;
	Fri, 02 Oct 2026 07:56:49 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCY8L-0000000Av3e-2XSY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 07:56:46 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49ff9642c57so16997355e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 00:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790927804; x=1791532604; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C6LcBsrn3qmklfWXf6wHISNXjWe9EOmsJSpM+lvYuXY=;
        b=AH7RIaNOX5NgVETHoA+ptwgxyd2T3zC2qGsEWu7ZnXzOONfWMXG6593xiFJkrgZvWe
         nK9ESFcbxQ+KxWLKJcbGJmwGYL6zfMo/FHsj/W51iJvrBsQLkpZQY1eFcRazS3A1bNxU
         7jRWBrHnKOoGqKIkS4BGchnrAafvg2wMuaXXb3XFjLIuH/oKyq6lZCsUYZ+11mwXaObt
         XZ2DWJUM8xT/WAh2eGwX2F3REn3kpzuTc8snG4l0V9c9wiUgqTp4fuIa3Z5+ieNutZYq
         LuWovSpi5Ec94w8jVnYaG4oRX/2lRS9J+e/Ku5yRHFVuTqJBvC5cH3Xpk7ryeLGebwUB
         2ipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790927804; x=1791532604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C6LcBsrn3qmklfWXf6wHISNXjWe9EOmsJSpM+lvYuXY=;
        b=dyus0V4aAmD0NH8K0LKhXuWoyWLSVMdwvuvsHbHZsofTFL8dUu9cJexyf6vK1EOawC
         tQc8uUeM3eOI+auZZlHeV+mgIqtlv2j1DD34Rfposk9KWF8o8Q5LytfHawvECZKZ0YKa
         ExucyZx+xak64lemOtbn1KnmUUbf7XwXI9rCCoOLfMkpsvzLbuVnXPwNprg+BwS1mL4E
         8etXFbXfTxusYlvnvSysBNHAoF48HJ4ht6QQH7s/Nnb69HJ/8hegTmKIWPoD6AWW/B/N
         z/C6HAznFxprGMiaPt8SM3n+uRSb6ZV1c9p/bzCh19y9JfUXqJUaQh5XOHr73uyi1MZO
         cIig==
X-Forwarded-Encrypted: i=1; AKwUvByTB+wppXlAWx5xmBcTjs+/LjLlRT3Vx7+c6BhgbExuVxv5onyG5eBDz6m0w1nC6wTTuhGKXWHXXHcAf+E5P+we@lists.infradead.org
X-Gm-Message-State: AFuF++mEpz309rqvjxG5e16n2m4CoFcF5K89Dlr6nzaJ7WyvoB7Gib8C
	VOJfCMx7eMi3KS8oBSKifXJ4mVzVxXcL7ctmBUJqJZS9mmgJaGLhwQKB
X-Gm-Gg: AYBFou36z2NvKNfB2VoBZ0DPsup6XWCFhSP4bNWNPtGYRlQAyGjV1cWaWE+WJ9+b7iO
	AuiFejJ2rkw+MQHMBsjM0iwS8MUKvn21C/PKYA+ieJ0JjKvr//YjJKKuHo1sakztklAugmjDKg6
	QrSEwTdG/+Qsg55oc1fClDf6wkXtIePUgome346nGGFWFnnGea5hF2LQBkSoIbxES7Y7oDcD3er
	wAF+4ZfuPHys52a+DC6FpFyhNnPH9sjWCbANLfqWSrcYWT/O0FoOPqJxiu6CuTZwyCyxItPTcgW
	ohkY06BE7uLSkROXissN9HMHNTm9FFSWJD4UQklcAYhGdrRQDKjhWDoDsinhTrrbDa7AM1CP1Ps
	7MePtwbBgMoCvlZfo6gzhFugpId0+2qtTnGYpb/Kl2Io9TmxiO5oJoFLC1nbLSIa21KUnEUmClO
	7NWUYAJ6gicKyvixqSQWX4z59e5svtolWenO9XhM8+ANXxicXaUR/oYOaCoWEKbEFK+5FBsSA05
	44RnwFq8frphZRfhQxr3wF0diWdQMuMtrKHFS5+j8b1U9ELvTp8bCpfXmEgsBF+uJDj1pqp4A==
X-Received: by 2002:a05:600c:c102:b0:49c:e37e:4389 with SMTP id 5b1f17b1804b1-4a027534963mr27502755e9.4.1790927803714;
        Fri, 02 Oct 2026 00:56:43 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280be5dfsm63635305e9.7.2026.10.02.00.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:56:43 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Fri, 02 Oct 2026 09:56:37 +0200
Subject: [PATCH 1/5] arm64: dts: freescale: imx8mp-toradex-smarc: Add DSI
 to HDMI adapter overlay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-smarc-imx8mp-display-submit-v1-1-f578c63fb676@toradex.com>
References: <20261002-smarc-imx8mp-display-submit-v1-0-f578c63fb676@toradex.com>
In-Reply-To: <20261002-smarc-imx8mp-display-submit-v1-0-f578c63fb676@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_005645_696669_59A2E9BC 
X-CRM114-Status: GOOD (  14.56  )
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

Add a device tree overlay for the Toradex DSI to HDMI Adapter, an
accessory that connects to the Toradex SMARC Development Board DSI
connector and provides a full-size HDMI Type-A output. The adapter is
based on the Lontium LT8912B DSI-to-HDMI bridge.

The overlay is also combined with the SMARC Development Board device
tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-hdmi-adapter
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   4 +
 .../imx8mp-toradex-smarc-dsi-to-hdmi.dtso          | 103 +++++++++++++++++++++
 2 files changed, 107 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a80cccf34eb5..b5519fb36b5b 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -709,11 +709,15 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-bd500.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt101tm023.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpqs-mb-smarc-2.dtb
 
+imx8mp-toradex-smarc-dev-dsi-to-hdmi-dtbs := imx8mp-toradex-smarc-dev.dtb imx8mp-toradex-smarc-dsi-to-hdmi.dtbo
+
 imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10-dtbs += imx8mp-tx8p-ml81-moduline-display-106.dtb \
 	imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtbo
 imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17-dtbs += imx8mp-tx8p-ml81-moduline-display-106.dtb \
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dsi-to-hdmi.dtso b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dsi-to-hdmi.dtso
new file mode 100644
index 000000000000..270cf567ace1
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dsi-to-hdmi.dtso
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex DSI to HDMI Adapter connected via Toradex SMARC Development
+ * Board DSI connector J44. Open J95 to select the carrier DSI route.
+ *
+ * https://developer.toradex.com/hardware/accessories/add-ons/dsi-hdmi-adapter
+ * https://www.toradex.com/accessories/verdin-dsi-to-hdmi-adapter
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+#include "imx8mp-pinfunc.h"
+
+&{/} {
+	dsi-hdmi-connector {
+		compatible = "hdmi-connector";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_hdmi_hpd>;
+		/* I2C on DSI Connector Pins 52/54 */
+		ddc-i2c-bus = <&i2c_dsi_1>;
+		/* SMARC LCD1_BKLT_PWM (SMARC S122) - HPD */
+		hpd-gpios = <&gpio5 5 GPIO_ACTIVE_HIGH>;
+		type = "a";
+
+		port {
+			dsi_hdmi_connector_in: endpoint {
+				remote-endpoint = <&dsi_hdmi_bridge_out>;
+			};
+		};
+	};
+};
+
+/* I2C on DSI Connector Pins 4/6 */
+&i2c_dsi_0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	hdmi-bridge@48 {
+		compatible = "lontium,lt8912b";
+		reg = <0x48>;
+		/* SMARC LCD1_BKLT_EN (SMARC S107) */
+		reset-gpios = <&som_gpio_expander 7 GPIO_ACTIVE_LOW>;
+		vcchdmipll-supply = <&reg_carrier_1p8v>;
+		vcchdmitx-supply = <&reg_carrier_1p8v>;
+		vcclvdspll-supply = <&reg_carrier_1p8v>;
+		vcclvdstx-supply = <&reg_carrier_1p8v>;
+		vccmipirx-supply = <&reg_carrier_1p8v>;
+		vccsysclk-supply = <&reg_carrier_1p8v>;
+		vdd-supply = <&reg_carrier_1p8v>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				dsi_hdmi_bridge_in: endpoint {
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&mipi_dsi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				dsi_hdmi_bridge_out: endpoint {
+					remote-endpoint = <&dsi_hdmi_connector_in>;
+				};
+			};
+		};
+	};
+};
+
+&lcdif1 {
+	status = "okay";
+};
+
+&mipi_dsi {
+	samsung,esc-clock-frequency = <16000000>;
+
+	status = "okay";
+};
+
+&mipi_dsi_out {
+	remote-endpoint = <&dsi_hdmi_bridge_in>;
+};
+
+/* SMARC LCD1_BKLT_PWM (SMARC S122) repurposed as HDMI HPD GPIO */
+&pwm1 {
+	status = "disabled";
+};
+
+&iomuxc {
+	pinctrl_hdmi_hpd: hdmihpdgpiogrp {
+		fsl,pins = <MX8MP_IOMUXC_SPDIF_EXT_CLK__GPIO5_IO05	0x104>; /* SMARC S122 - LCD1_BKLT_PWM */
+	};
+};

-- 
2.43.0


