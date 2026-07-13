Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6BD2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 15:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iTMbh21QXQw/7/D6TKZ7n81vmxGgnjPukreQ8dydJKI=; b=axf5WrmMYykTKoqJ3mCEoV3v+J
	R2EolFOg4hEBi2MA7tBo7OcjSK4ddQzlRmedHeksGP7H/htKgCab2YWpzPLmKTn2NtpIHScgZsqel
	B2Ot7C8zr7Q81cIYygtXT+WW3Tbgf7Mt6/CZn15ehgT+ZzhV/N4rg7rWj31qMK8vUBAdLdw3jAOwD
	dvnFW9f8JCyNfAdX9/j/77C2rTDA3j7mfybtutGC3LHB5FFi4IkJIbZPViMXkO4nEICHtltI/ZCsh
	3aC1vWDVS5jtWFGEUYRw4d/W+TkkRUGPjQTCebw2QXkd23w3Mu1Ox2vORan/xESaVylEXFEsL9Erl
	vNiy87XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIFH-00000009j8p-3tpi;
	Mon, 13 Jul 2026 15:06:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIFG-00000009j7U-0CBq
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Jul 2026 15:06:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=iTMbh21QXQw/7/D6TKZ7n81vmxGgnjPukreQ8dydJKI=; b=hdI+lDkS/OlWNv9WIApeiwSP2c
	VBHNAiWyz51deZZLDZ4uYPmFY5V/GpX0yOx73kYVwL226faQTJaZC9IEYjOSMNlJ1Ko4fQ4UKN3f7
	op7FL5ZvF+fnDFJrp8jh7eb54pIG9EcqD0vcj03OYiIHLsul/G8XQrcpecd4mmsJi5HxZDNfzD9JC
	SUwfPyI5HhYMO7WGtut5Sn4HQABSByqygMPPGgmEWeNwmq6F8TUB1DdV1TFr+x/+Ynym4w9kj0YqZ
	D1jK02qPPxgrrU718AFRfwvPPl+OxaaS4vBCIA4TXbY9ihUSQpoI3H6VNBGbaJvj4JlT/m5DR4uuY
	4FVKTAhQ==;
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjIFD-0000000BkxD-0VmJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 15:06:57 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-47362928f65so3179305f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 08:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783955213; x=1784560013; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iTMbh21QXQw/7/D6TKZ7n81vmxGgnjPukreQ8dydJKI=;
        b=HspUCLGNg968E9VQSqOXXjbR8Hm8YNCq8giSWEHzslEt/NrfRtXRQsn6U1khDTUotw
         Xl8tDnY7vn50+zV/nBc0cLkjnhnhmz6bjUBIYfxtfcYZj477e9OFf2H85eotzz68WtFv
         WbsfkTjIAUFikcTwqvkKwEKk97vVBbXCFwC0DPMF5RdfrxsW0RNbealfmQUxIuW36H1P
         AiNHvepmFLwz2t70cec6MNHTHVx6YcFOyw6TY5bm2AP2Y+Pxmf/sPvonrjpZJ3G/aIQ2
         Ke18Ux+BSa2UW+WmPYlK1m0DBg+Y5zJPyedynOOGcLu+uDv+jNClJN3CVpUjc+Xc9iQJ
         jThw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783955213; x=1784560013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iTMbh21QXQw/7/D6TKZ7n81vmxGgnjPukreQ8dydJKI=;
        b=jxGAGKoQ/zFY+5EA+7sb9cVpeWiqPwsDiUlppuJ6puSguH2qS9g61kY4zU6nD8Tqvg
         7NKYMAk6OVfptoDy5oBd+MzuYIwpmTlwgTW2q2wUQLcwp0h8V7NQUrbrdyDw+P25leGI
         TZYkFqshV9N6kKCt4RQfWLrbnaXgVS4UUkUpa2HtmpnL1kgkdzNmrNEUTrbk6oeNd5Vl
         fPt2kEHY0eWDCHhZlmCPl3AhCGtuQjqqGcGCCh4lS00RBLAIHc0Bc3Q02d0b5Jb31S/9
         57gwYTlSIkGFqNO7Rv/eE28EJx8JprFtIowHWFFlJLG73F4UVdL7egr6vNa9I1f7YK6Q
         WlNw==
X-Forwarded-Encrypted: i=1; AHgh+RrVQQ3kqZ+G+MOxWClEbaIwJGXdpRPLsyoUCo6TEyWvGbFmCZ5dMpbqXwh4/42yCu07+JSkFXXEtYn2WNTO7Qgb@lists.infradead.org
X-Gm-Message-State: AOJu0Yza8jbZz6WZCZBVHZXHoCBjST+uw8ZuoLeztGWmDDMwvYEzoiNn
	PGkyEgxG2T15XPHwRj9MU3RzkxBHAj8AdZGaIceJX1YhHBjev/+KKQTH
X-Gm-Gg: AfdE7cks7v3dELIuKCwcpKdrInbHvBF84BT45n3OHYHjaXW8MmA08G+M8dsbb8H8vTO
	37jS/mtW4+klTXJuVjixR6DlKxfI/8jBIgnVufSnoYlInsFE4UQ4eDF9LTkaDDBYPBaYCR9j21z
	qS/JxgwisCS2GUTRMMoo2Pc2kUxfPioxr9IOvaI3Z+Uygp7pxYNAHWIifBhVwwI9h94VG1IW10B
	dd0uCd8i+ydqqrggty5vxtWJfHEXG2dyDDTC7qJ2s/7mJni/pGy4vgYrmkg1I63fs0q6ibmF6Ng
	9byUdZfalaQiB2+LUswz4EbOxrWiGJZkPEq6CW1Atd7tQvZdKdIQi82OHa56FOkFqx0v/Trn2eC
	4NYUT2NT6ABMVHSc60ZYI498yXXyVGPfKsaCEWyOPwv1cLfcFRe6cPeARNCEt276ArwsEd8zUP0
	nsxE3nUxhkcJVpK2+gv936ogu3TwnM+qXfk/u/nzIw1g2bEVtiESmRI5mAfQF4edVg+z3gnkv9e
	7ccH8WKBxtQCefT
X-Received: by 2002:a05:6000:41dd:b0:475:f0d1:eb69 with SMTP id ffacd0b85a97d-47f2dceeeebmr11163398f8f.54.1783955213443;
        Mon, 13 Jul 2026 08:06:53 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635a5d7sm19389f8f.10.2026.07.13.08.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 08:06:52 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Mon, 13 Jul 2026 17:06:23 +0200
Subject: [PATCH 2/8] arm64: dts: freescale: imx8mm-verdin: Add DSI to HDMI
 adapter overlay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-v1-verdin-imx8mm-dtbos-v1-2-4acd63db4504@toradex.com>
References: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com>
In-Reply-To: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_160655_299124_F2F2E837 
X-CRM114-Status: GOOD (  14.17  )
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
index f833e179ab3c..e8a1e015ca77 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -177,21 +177,34 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7902.dtb
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


