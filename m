Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F48CD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 11:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8VnZ67Mn9rpXh6zYkRstzvXdwxleOKYbVtvyQUHqOxM=; b=HFLbIoiTKr0Xv03q9M4sjM34Er
	gorrVva9PH+SJrzAwlX6lcJGGgIxbvpF+J/x4DNlI1TF8VaO7csVDfwg8I49G33nf3Pp5UpJ1hjpA
	vJAvKzHaUxpI3z7+fknoh2wzYJm1vTJDxkownE72Hag8lFAeN9oAAwz1R4kDbw3gruGknfdb6glx2
	YbtSiwJcgGJCdqm04zLSZ55rDlx6cE8pnJ3eKV1rncrcgaJLg7TEzxkynZOGSQpz9qQTqZJIMMkzG
	lX5dI9gKAkPIvKULMKJ7OQMgace9VxQgrAsChVe0vPyYo6Pc7LzncIBbwXP0q/zG8wFg7qlWOLaOk
	+ZnMR9Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNer-0000000Cunf-0gAm;
	Tue, 02 Jun 2026 11:51:45 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNen-0000000Cum4-22Td
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 11:51:43 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-49041fb8c23so85670135e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 04:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780401100; x=1781005900; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8VnZ67Mn9rpXh6zYkRstzvXdwxleOKYbVtvyQUHqOxM=;
        b=tLdH8Uu6xeS9LHdeOXarnTAKMP1pYmYG0OEWblnzsb7XN8r1fQkg5UihrNZNdIe/Q5
         5DnDaRtRRIZwRkAUYg08L3i7GSzOYts0OEUw1o6dqNVnpLRuk1fNKqT/4J8jL4WNZXlz
         8NpLXRc13ziYws3rIB/ERkcmA6bxlm2NCzjbEw6KY4h53dlBP20YksjghrgdTnM7AOUP
         Qgu1vGzLhnE0/rGGdINwdLzlMZJWOvnKFJBnkYmj1SWQrOjbkvBtJRhWvbqzDvi8rTL6
         n4duVOWDA7AeSZm78JhD62d1Zgedjjy1OODJ3zZqq5sFIiF6x4E/9DhuHfcEWj1IA5e3
         pmhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780401100; x=1781005900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8VnZ67Mn9rpXh6zYkRstzvXdwxleOKYbVtvyQUHqOxM=;
        b=seFXk/JRCrRgerS0Hki6L0s9cUXcJor1eoZjNLX/vhLYYIgNupaU3D3VJFJ3QfSWiw
         jMJGdT0h7/DkhNDhestd+UNYGrEHqWPPGhn8sNb55HAJ2pfxAVdC6CEopU+qrBs2QgKC
         z83kgVHIaquMqxRau2XDpSBaz4CnnNNiE3Yn7DWpQ8bn/f7Cv6TuhSszU+eTokEA0WJ3
         Y0D2EOJwmFv1gTgPWNAgtVAN3HWTkP4DNFeI2J/O4kZzJlZtL+3DeZIuQqGuu0uwYC4m
         +vwt68KH8ZwoSdBzd10bi+L28aYS/bLyLlAU55Kzg3jPmyvCBultl3noc5W3bVRF6Y1q
         cZyw==
X-Forwarded-Encrypted: i=1; AFNElJ/9JYWwYIle65nMjXbul/kzJvJtArkO5eEehZXns1UFRd5wihCVR5b2ciRr/s4P8M3eDqInR905yqhAP9jECTV5@lists.infradead.org
X-Gm-Message-State: AOJu0YyW02rRl9n6Km5yKwgkJfOvt5A3Hc0ez/u4O5Nk69fAB5u7PxFp
	WLshScJ6ACyYYjPbjoew5/BotR8c6xioO2tEzknzMEWc4FDEmeVypftD
X-Gm-Gg: Acq92OHgbAThr9bpPWKJxp/CX3OMg4Kp0tTJZt/VMlK458Vu7OPif63nw/W+hYbAmm1
	UYSsFgK4EDLLtF/NgHNJjcwOr8E6S5+nV6om6LfWWI4MYk7sCCQG9yGE1ySuQEdO/SpQIUmMeun
	VEGRZ+0XEfxQFgVwyjiOvXa0KLsIlBdypsQ6xlRoQYqLhAxCeyiI9XLRBVnfAW/+OjOSUFOmOV4
	fcSDzeYhUTD8bns79KIfLHSNO0DU3qoJeAUWTfU38DSLX3sWatT9MSJtZXWQ17/zCEBt/6/X+6b
	9fQDpRYJNvfItH+0oJDZBbmBqDweqUZPQ41U0dYlXqzjlHxU7KEehyqYe1FXLYr+/NrTldBmkQj
	kchaZCt5ygQUwsXV8DWo1SaOQAzEgNw4BNluT7UgGchSOf0M/ayyFn0RGMG/YjhT4ytimcdlcEJ
	Mdqbza3tl9WQ1cK69ZO9JUrnk5ow==
X-Received: by 2002:a05:600c:2242:b0:490:5321:2466 with SMTP id 5b1f17b1804b1-490a2941ea3mr185811465e9.20.1780401099423;
        Tue, 02 Jun 2026 04:51:39 -0700 (PDT)
Received: from vitor-nb ([2001:8a0:c4c6:f00:e8c3:a961:5b26:a2c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c152570sm139480015e9.9.2026.06.02.04.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 04:51:38 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/7] arm64: dts: ti: k3-am69-aquila: Add Toradex DSI to HDMI Adapter
Date: Tue,  2 Jun 2026 12:51:24 +0100
Message-ID: <20260602115123.1324474-10-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602115123.1324474-9-ivitro@gmail.com>
References: <20260602115123.1324474-9-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_045141_579413_93CD173E 
X-CRM114-Status: GOOD (  15.53  )
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

Add a device tree overlay for the Toradex DSI to HDMI Adapter on the
Aquila AM69 DSI_1 interface. Used on Aquila Development Board (J44),
where DSI_1 is exposed via a Samtec LSS-130 connector.

The adapter is based on the Lontium LT8912B DSI-to-HDMI bridge.

Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-hdmi-adapter
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile               |   4 +
 .../dts/ti/k3-am69-aquila-dsi-to-hdmi.dtso    | 115 ++++++++++++++++++
 2 files changed, 119 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-hdmi.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 371f9a043fe5..7709bb58d4ca 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -190,8 +190,12 @@ dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
 
 # Boards with J784s4 SoC
+k3-am69-aquila-dev-dsi-to-hdmi-dtbs := k3-am69-aquila-dev.dtb \
+	k3-am69-aquila-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-clover.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev-dsi-to-hdmi.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-sk-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm.dtb
diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-hdmi.dtso b/arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-hdmi.dtso
new file mode 100644
index 000000000000..d8e4dd69599e
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-hdmi.dtso
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex DSI to HDMI Adapter on Aquila AM69 DSI_1.
+ * Used on Development Board (J44), DSI_1 is exposed via a Samtec LSS-130 connector.
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
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pwm3_dsi_gpio>;
+		ddc-i2c-bus = <&i2c_dsi_1>;
+		/* Aquila PWM_3_DSI (AQUILA B46) */
+		hpd-gpios = <&main_gpio0 33 GPIO_ACTIVE_HIGH>;
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&dsi_hdmi_bridge_out>;
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
+			remote-endpoint = <&dsi_hdmi_bridge_in>;
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
+/* Aquila PWM_3_DSI (AQUILA B46) repurposed as HDMI HPD GPIO */
+&main_ehrpwm5 {
+	status = "disabled";
+};
+
+&i2c_dsi_0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	hdmi@48 {
+		compatible = "lontium,lt8912b";
+		reg = <0x48>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_20_dsi_1>;
+		/* Aquila GPIO_20_DSI_1 (AQUILA B45) */
+		reset-gpios = <&main_gpio0 18 GPIO_ACTIVE_LOW>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				dsi_hdmi_bridge_in: endpoint {
+					remote-endpoint = <&dsi0_out>;
+					data-lanes = <1 2 3 4>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				dsi_hdmi_bridge_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
+};
-- 
2.54.0


