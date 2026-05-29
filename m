Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFBF8CD6E43
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 12:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1jXwBJL09ITgBWBM4jQU4+8bhoBzGyCBEiuiVIpIW/s=; b=Q5qe0+cUn6xkCVw28udVRuJO8I
	Rkm2NePbu7w4yI5k5Ce8JRRM8GSncXfBPufMEJ1Myl31nnGTOpwveJQretwrrc+JNdv48kmQTm4GK
	gDBPJWUUD5BltWehDI6F1F6q2fvkzUoVjIszXcy3EVcJn9LwDMxduKSOGIXJWCRfsHGkQc9FqmONL
	9dROH7eKLTgpDURJxyIPGs8PdRD/IrYByPMO/g7VAQauN74vFRra1SgJOPYFmeXWhxEiynz6930bs
	bHzEsV8OIayv1H/djNfZjoZNf1tBSBM5SxWjOUQYEAjjZ/UlwkNSEUlQIZIevQgyci3vGQjjMnjlb
	72fCEa9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSw1t-00000007Kx1-2mEa;
	Fri, 29 May 2026 12:09:33 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSw1f-00000007KtV-1m0y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 12:09:20 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-490686877a1so39708055e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 05:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780056557; x=1780661357; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1jXwBJL09ITgBWBM4jQU4+8bhoBzGyCBEiuiVIpIW/s=;
        b=WhB/5GGdP5/YCT4cPcAIHgc2Ka4QtKl1BuzZgFLB126oqBJ183FxmVyvu1/9qxB0dz
         P7V3z6OnJjuicg7u9ckco1pxedzL/epU6k3fyTLsp2rh4vyqK7xBoid1rBsi6aTctfPK
         e6vLq9JCcyhbBDTNxlvfH4FRslGkT4cMQnnEviVrOYQ9rjnCKUdKdkxSnJlh++C+8TFr
         D15dgM30zu8mjc0GiqYNfwDR1FqXpbW46lA2cnWfGsyMsigBRVEioqrf3gPkkXyVq3M2
         /+12atkt0O4muJYROdeQ4S+4xvkJio+dBdXsEBR299Tv7T2vfexNXNCxI5xiK5kGe/+4
         aYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780056557; x=1780661357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1jXwBJL09ITgBWBM4jQU4+8bhoBzGyCBEiuiVIpIW/s=;
        b=n3qIQGoZP53t55rXcH1dDLRjhnrf3Au8iCgPRf5f3fGR9gFsgil4a0ZTM0wqZc5ZVQ
         26nFeGJtTvyrAdlnNDn+orEhdBnIuieol1Pme41zuwf8Un43YDcC7QvPM5m/hmLyBCsi
         j640el/d+1QVqQoKGRfSP5tQGG1H4gSIgmg+Lp9CECBWn2yQt4wlLMOcYOYNHeXKzSt2
         cyIS7zC3LbCOsqFqZYIYhvHY5FLWotX8givuNxE+vV/q+Et6uBvAZvhQn0D7vZnyCxog
         /+ZZNaKd5mknH7NzspzlhDzS/CCpTo7kNJv9KNeaIHnOraKmAKgW22c7oy1fgf1ozqch
         VAIw==
X-Forwarded-Encrypted: i=1; AFNElJ8ZoaG0s8jrRkOX1OvFz6lVOLey/Gjr79C+zKtqBD53E5mL5Sf1PuSNKhGBuOyV2c8P8lUvz0oy+eX3htvRvUa6@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4s1xSVCp8iKaP7AczbkXZQoJpHjqmI3CszN2saWSuUL8e/ln6
	WO2uGJ5ThRlIm8EuOF66DCij5w/dUh8TPhb0R/o7RK3EVHIaUxSQocTk
X-Gm-Gg: Acq92OG3NDymyfvSki3t7fuV1lj/yK66YTVvXck7GHQj2rhoZ0r/G7wTdxDmeSPpcz3
	bmapATJ/HQAy7txUTnWb/LFnsbqOY0s399X+A4bW6CFaXwyt+lNTxK05xpINwnDttQH/9uhqjfD
	F6eA9giTD4+715TAia5xmVozw6v5ZsNYaUn07TfRLgM7/uHkSs5YXiGf/rmMklbIR9/tyUvhTRp
	UqpMN+D2J2pkobmW/ZSvRL6sF5T7SmaU85yFi5VDl/iFn4WAsGbxOtVS9figgOERtkvdFYvpwLw
	+urPDrrV4ztVUJoWPybhWQgDzYIDE+6S6Mv+mqsvQqfTR7Yjrn3FTO/DYnu30wV6r9CSBE+Xb1C
	KXfaP5S8hida3SoYyHHLRJqR+nz9WrlFzcupouE6SYNWA9Bvo8DRS51mdFjbpmj1ktOz79JGGWc
	W1ovlULZ1Mwhf/LpYQTo9Qlb2f
X-Received: by 2002:a05:600c:a013:b0:48f:d620:c27f with SMTP id 5b1f17b1804b1-4909c411cecmr33061665e9.4.1780056557146;
        Fri, 29 May 2026 05:09:17 -0700 (PDT)
Received: from vitor-nb ([89.214.125.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c0b8a11sm13586595e9.16.2026.05.29.05.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 05:09:16 -0700 (PDT)
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
Subject: [PATCH v1 1/7] arm64: dts: ti: k3-am69-aquila: Add Toradex DSI to HDMI Adapter
Date: Fri, 29 May 2026 13:08:53 +0100
Message-ID: <20260529120853.636015-10-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529120853.636015-9-ivitro@gmail.com>
References: <20260529120853.636015-9-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_050919_516569_E96523CF 
X-CRM114-Status: GOOD (  15.45  )
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
index 21db60cd19de..c1aa5c1df927 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -172,8 +172,12 @@ dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
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


