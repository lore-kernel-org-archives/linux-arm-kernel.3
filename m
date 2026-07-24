Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6F7C53215
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 16:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I4GlmrO2wvSEO/h8L9kCT2VN9gDvXyxGV+hLNuzvXEk=; b=tv8BkWZdBJfzTX+ku/BxLHa4jT
	eNZjFCOnyB57tAHxK/KvzJ2J5FCAb3dckfLu7LaM2/ISOslB6h8j8YT2t9/eTvP17SN+Pop6IxCbI
	T3kh5oIHpjVx5eVlYCO3/3NWSmavMgTOy5gPZu3KyOiIs6Whfig+1SgNIY7+TKPdf1qiXAH9NKrXP
	yDF2ScQuIXYreZYCdndyIi8kmPQsmvz4G0p9s6KrwEoT43vFgrb0iMdHf/ePJoGoz2+zgYcv9SLio
	83MqPoo6ZNOjfatKQOS8M0BYA2fJ062vrxJQATx8e7uccsXVEeI2fuXaNfGXPkD3hL4iqZicyV5Ge
	S11gaLow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnIhf-0000000GpZs-1t2u;
	Fri, 24 Jul 2026 16:24:51 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnIhX-0000000GpW1-3v1s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 16:24:45 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-47de0093c42so544132f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 09:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784910282; x=1785515082; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I4GlmrO2wvSEO/h8L9kCT2VN9gDvXyxGV+hLNuzvXEk=;
        b=WyH3v/OI+dUi6+C91cxcF7mTFBXpSLv1jf248v3tzKeRCtvXfk5X0/IFjU+wqfMV/8
         W5fvdEqHSn5FGx7DkvYTCB1IMOrzKOlvymJa/7UWaG6zyaEr8S8BbaIFTsXFpauR+9O8
         S/eayp2X50BWayi10Tc1uOk15qyurfyKEx2elAZVojn7EEibPlTI+r1E3+jfwTpfHuup
         zXX8Q93Vt7/9S2eBSa/uXzQpP2kTHumxNrm2AhP117vTycRR1bojNrUoRaghN32c3tW6
         SNKxxBuMkGu2F/pftI47YnG9AGFv3igTi3nbjxXaTc0NDYY8+T91eJ17P8m37fIbNORH
         NxbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784910282; x=1785515082;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I4GlmrO2wvSEO/h8L9kCT2VN9gDvXyxGV+hLNuzvXEk=;
        b=I4RFhH8M/aJ2FIZiq8q7SX9Enum8ctbZY9oj880kI/X99ikrlhEQpLZrayjC8zExqv
         sg0lKaxn0J2QzR41xq9Y5hlVTfbb0nPROpTS67CuUzSF+avn1kS1hR/hwV6kCK5gc8P/
         DxatpaUwmE16v8pbMVP7F8XqP/6kfswA/LooXyEKHq919YzOjGSN406GYvIUducwwKNY
         U8kJXlZmFM/14YYBwWF25iohUH5tSzk4LDlEzrwkGG4qq3/ifsSk69mE9yUEz+yZJy0F
         XTm89VXxhm5qULU+3bCfqYg5is4jaUDAjWFJpqtKcUW/gh30Wg0J6qL/wSU/k/daRKCG
         Qt9w==
X-Forwarded-Encrypted: i=1; AHgh+RqW1CFsUWAxc7iMr6ObopPQTBR4Iadxwj1b10yEd7Yx/Ovli5qpR9ZIxalkyyilnSEF7/OXpKYeuVhbBVcQl6Vq@lists.infradead.org
X-Gm-Message-State: AOJu0Ywl6eftBvFRh3Y3ei+b2kf8akIeDtzU/PIa7yReKQ91padDX9iU
	28f19RO/uM+8+mcrXL+UVlnDU6Y2LaAzh3F82dpgmF9willvVkzUh/JF
X-Gm-Gg: AR+sD12r6i/UomHx/X4VzchWx3T2N7cfetV/7CZDDFTyCkLARx2CaS+DMcI2//FGtHt
	kAsuDBo/cfJRHhXauas9s/Gh9irHFyKeNe7vPVVcKyAqLsCTd+RyBBPN30ujNaBaYgAqMvbRNIL
	oLiJSWIxmBxPfQIq7J/T1amHLmKvViffzluIM2g6ef5eLy06L/PXeibnSwP+fFhkRNUCENKUL0R
	qA9yPJTo+xV0Jvdc96MHL/KzIl95H11auPdXueMrudL3wo1dQDsSRAOY8axVfMGmQJ2mJScfVJv
	l/m5dkCtmTrR9FDz+/e672wL9VVWroCevFaQrIaOgiZclmqe2xtoGgiTuOeN9IzILMJzewM362n
	mQhpySnQMiMqvN5X/buSG8GRnpyaN0bBut/QDCCy8SA7mfR4fmsb3I6eJlBBDCYpnydv8iEHKfy
	qMeietqWWAfbF887aV+r03COzmtWKicJGZSsDHen2hwAcLDKIz7igu9QHdoa+3OpEu366C799Jv
	m3SrzE9jJQS/Y9e
X-Received: by 2002:a05:6000:4305:b0:47f:93e1:e7d0 with SMTP id ffacd0b85a97d-47f93e1ee92mr7483001f8f.36.1784910281885;
        Fri, 24 Jul 2026 09:24:41 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a5d9sm24366255f8f.5.2026.07.24.09.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:24:41 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Fri, 24 Jul 2026 18:24:28 +0200
Subject: [PATCH v2 2/7] arm64: dts: freescale: imx8mm-verdin: Add DSI to
 HDMI adapter overlay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-v1-verdin-imx8mm-dtbos-v2-2-9d7988bd76f6@toradex.com>
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
X-CRM114-CacheID: sfid-20260724_092444_014517_DD05ED9E 
X-CRM114-Status: GOOD (  13.92  )
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
accessory that connects to the Verdin DSI_1 interface and provides a
full-size HDMI Type-A output. The adapter is based on the Lontium
LT8912B DSI-to-HDMI bridge.

The overlay is also combined with the Verdin iMX8M Mini carrier board
device trees to provide ready-to-use DTBs for the Dahlia, Yavia and
Development Board carriers, in both WiFi and non-WiFi SoM variants.

Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-hdmi-adapter
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             | 13 ++++
 .../dts/freescale/imx8mm-verdin-dsi-to-hdmi.dtso   | 88 ++++++++++++++++++++++
 2 files changed, 101 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index dcc0464b4e80..f55c570cb3e3 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -178,21 +178,34 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7902.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7903.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7904.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dev-nau8822-btl.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dsi-to-hdmi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-mallow.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-yavia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-zinnia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-mallow.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-yavia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-zinnia.dtb
 
+imx8mm-verdin-nonwifi-dahlia-dsi-to-hdmi-dtbs := imx8mm-verdin-nonwifi-dahlia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
+imx8mm-verdin-nonwifi-dev-dsi-to-hdmi-dtbs := imx8mm-verdin-nonwifi-dev.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
+imx8mm-verdin-nonwifi-yavia-dsi-to-hdmi-dtbs := imx8mm-verdin-nonwifi-yavia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
+imx8mm-verdin-wifi-dahlia-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-dahlia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
+imx8mm-verdin-wifi-dev-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 imx8mm-verdin-wifi-dev-nau8822-btl-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dev-nau8822-btl.dtbo
+imx8mm-verdin-wifi-yavia-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-yavia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 
 imx8mm-tqma8mqml-mba8mx-lvds-g133han01-dtbs += imx8mm-tqma8mqml-mba8mx.dtb imx8mm-tqma8mqml-mba8mx-lvds-g133han01.dtbo
 imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33-dtbs += imx8mm-tqma8mqml-mba8mx.dtb imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-hdmi.dtso b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-hdmi.dtso
new file mode 100644
index 000000000000..507d0bbb5935
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-hdmi.dtso
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex DSI to HDMI Adapter on Verdin DSI_1.
+ *
+ * https://developer.toradex.com/hardware/accessories/add-ons/dsi-hdmi-adapter
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	reg_dsi_hdmi: regulator-dsi-hdmi {
+		compatible = "regulator-fixed";
+		/* Verdin CTRL_SLEEP_MOCI# (SODIMM 256) */
+		gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+		regulator-name = "DSI_1_PWR_EN";
+	};
+};
+
+&hdmi_connector {
+	status = "okay";
+
+	port {
+		hdmi_connector_in: endpoint {
+			remote-endpoint = <&dsi_hdmi_bridge_out>;
+		};
+	};
+};
+
+&hdmi_lontium_lt8912 {
+	vdd-supply = <&reg_dsi_hdmi>;
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
+			dsi_hdmi_bridge_in: endpoint {
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&mipi_dsi_out>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			dsi_hdmi_bridge_out: endpoint {
+				remote-endpoint = <&hdmi_connector_in>;
+			};
+		};
+	};
+};
+
+/* Verdin I2C_2_DSI */
+&i2c2 {
+	clock-frequency = <10000>;
+
+	status = "okay";
+};
+
+&lcdif {
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
+/* Verdin PWM_3_DSI (SODIMM 19) repurposed as HDMI HPD GPIO */
+&pwm1 {
+	status = "disabled";
+};

-- 
2.43.0


