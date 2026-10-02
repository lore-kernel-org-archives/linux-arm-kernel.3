Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15597CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 13:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zayP4WDTOu5O+niuDClNFcuxUww+7ip1Eh7ZVrZJwtg=; b=kPhjSaPK0RYLFVUmzBly23NIBX
	AE6M54xfgJXJ8MaFEP1DlxnwlddXMYj4c42D/QSXR5A9TE0PcEkRG1q9yw/dErb33lRKvp93wxdHY
	hHm+Bdiv0RGrPogJitKMTlOhfogU+7LN8XayUG5nvBWxbUpi3hqjnd9sUZ68bQagvIWh3lIOHW7mo
	98R5cU1S8GG7X4DwoTTnZIQuhxs6O3z9zU//u3v0grGVlDei/rtNdghu5r8EVZGdOfdtbt40W04Y8
	BRM3iW0T39IgZtKg1jVHGSAHkTH9Wcpe7IcMWSFQnmKPQ4YZrgyMJri9q4VMbNyr4iTyr5n2YGhUC
	jbYgrB6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCdN9-0000000Bfdd-1fg6;
	Fri, 02 Oct 2026 13:32:23 +0000
Received: from mail-wr2-x0d.google.com ([2a00:1450:4864:30::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCdN6-0000000Bfc8-2JDZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 13:32:22 +0000
Received: by mail-wr2-x0d.google.com with SMTP id ffacd0b85a97d-48b9d8056d2so500799f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 06:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790947938; x=1791552738; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zayP4WDTOu5O+niuDClNFcuxUww+7ip1Eh7ZVrZJwtg=;
        b=nZ2dMd7OCX/LrMU6fqxVfbuQjJrtgMpwCi+WNu3PTWPKKPgSRhPkWBevFRSjI3iHKu
         S7rWKNJtIOsSfjY7PywHPipzUIHq2cAQOUmeddXBLtjW+SGAM1cyEg/dw+bKXHo6bT8C
         JBz2GIXskTKBgYxdjf1NOW+0kv81X5c1AAB10gmhIF8MFMRkKb3Gcljc9JqZzc9ZAMli
         /1hLNorSv8TAxYUTwFOg6iTC74Xvtqh1m7++5yZQDKsMS7WJLxgGpnL2f1AKCyMtzBYN
         07JV0zXOstOldqZsB2sooBq4OIlwQaczWghlG07m8VD0yAwszHwTmxkhWm7Z6S2UfFsE
         yEyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790947938; x=1791552738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zayP4WDTOu5O+niuDClNFcuxUww+7ip1Eh7ZVrZJwtg=;
        b=d38rySxgzWDIxitPzUAIUHUMePc+4uePr8Nfonj6KLc6KopcmqOvjEmjyUndPfjMFJ
         8k16cYUwvhK6Tiki2h8npDozk+tazeZs5of/P3/JEW1TyhZrih+/Vj4mMa6Ga1pgBV+Z
         w9wkDDS4vmmr7T4BxUirGdeEsYM7kYFpvIEaS5bYRqt9YP2XM0DaWuJpa1XDtTvY4pHw
         vTLxVpPTDhkj0bq09EMUJFeAi4x+9jdLXBuG2LWGa3RUd/eSCG3RoZzLGX7Pol9HBc/V
         vQsa9MN4Mk2DDN/6ZkEyHYCY98KPQPFW28pPBQaoKOIzrLuYbmQ2WCShd+VLkMRUv0Vk
         ZmfA==
X-Forwarded-Encrypted: i=1; AKwUvBwslueXt1xIpGl+4mCYh3IuhAXwr5GrUaUoSAL+B40MQ7Vp4shusSGfoVn8+MCKUDV2pJgjWDWFJhwRAYgVbNfA@lists.infradead.org
X-Gm-Message-State: AFq9FYLfAFw9RA+1q4Z6+k5IA92L77eDn7oIhqBa6a2jQw2446ggzl3z
	/i8NRfG0X+B/xYN03gkIL48upNxX4UN+rXi4qYro+jjB1kL59sXQ0NY/
X-Gm-Gg: AYBFou0Uxj/BUsPC5cxR+dxCynYfb92eSYxu7UR56jmA2/LbGdaWT2HJmRLtIxUOaPP
	FNxw788WFQqnHhP3ON+yI8Xdyb6oHi6NcPLliHKPhiNIIqpL+zXoGmLaUsxTrbT6OUHNUCuJCWs
	J5MqCJOy506UNeR1b/u5BCr7FRDhpAVK3USmBKe47UnwoVx835m04Sh9X4lW/uJb/yPvYLxcigd
	IGnEnCwpyZle1cAXtTHLUMFIBaaWX4B8LMqLOCNe3wn9yr/jjei4TVADnihAdtE9+zn+9ed85y+
	2x02SpAwgd44WyAcwacFaLYU3+JvzLJH30KX/wLBJNv4lmpErFB+WxlqkAhQJ9phwZqs93P/BzT
	Nbsb9eT8oUqw+8E7zrciyBp5fBCMVLw9xlNkZT7U0ec9aKHluaPuNo4ANQfsnaPbk0iWaJoSnu4
	hu5kGB+F3h7qiX85bUU6xHhYhnW5r5mMvnfPiJ0aT+VACTmkNWaou6B0ru5gvH4WSECqe5C+swE
	gOgnl8/F6N/cSZ+jri6Rwe2oQKEDr906iRSTgPZJlh8FbpDKZRqfQtktbK8gEB+ypP+kM+lDg==
X-Received: by 2002:adf:fec2:0:b0:48b:3f2:2ec7 with SMTP id ffacd0b85a97d-48b1274a1a3mr4164575f8f.31.1790947938402;
        Fri, 02 Oct 2026 06:32:18 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f9bc0sm5809855f8f.41.2026.10.02.06.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:32:17 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Fri, 02 Oct 2026 15:31:31 +0200
Subject: [PATCH 2/2] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 OV5640 overlays
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-v1-smarc-imx8mp-cameras-v1-2-a0e89182c625@toradex.com>
References: <20261002-v1-smarc-imx8mp-cameras-v1-0-a0e89182c625@toradex.com>
In-Reply-To: <20261002-v1-smarc-imx8mp-cameras-v1-0-a0e89182c625@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_063220_769662_63189F53 
X-CRM114-Status: GOOD (  14.20  )
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

Add device tree overlays for the current 27 MHz and legacy 24 MHz
Toradex OV5640 camera modules connected to CSI0 and CSI1 on the SMARC
Development Board.

CAM_n_CON_PWRCTRL (pin 24) is an active-high power-up input of the
camera module, so it is described as an active-low powerdown GPIO.

The overlays are also combined with the SMARC Development Board device
tree to provide ready-to-use DTBs.

Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             | 16 +++++
 .../imx8mp-toradex-smarc-csi0-ov5640-24mhz.dtso    | 15 +++++
 .../imx8mp-toradex-smarc-csi0-ov5640.dtso          | 75 ++++++++++++++++++++++
 .../imx8mp-toradex-smarc-csi1-ov5640-24mhz.dtso    | 15 +++++
 .../imx8mp-toradex-smarc-csi1-ov5640.dtso          | 75 ++++++++++++++++++++++
 5 files changed, 196 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 1310b34178e5..357d0afbd41f 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -711,8 +711,16 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt101tm023.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-adapter-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-adapter-panel-cap-touch-7inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-csi0-ov5640-24mhz.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-csi0-ov5640.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-csi1-ov5640-24mhz.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-csi1-ov5640.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-adapter-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-adapter-panel-cap-touch-7inch-dsi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-csi0-ov5640-24mhz.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-csi0-ov5640.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-csi1-ov5640-24mhz.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-csi1-ov5640.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-panel-cap-touch-10inch-lvds.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
@@ -726,6 +734,14 @@ imx8mp-toradex-smarc-dev-adapter-panel-cap-touch-10inch-dsi-dtbs := imx8mp-torad
 	imx8mp-toradex-smarc-adapter-panel-cap-touch-10inch-dsi.dtbo
 imx8mp-toradex-smarc-dev-adapter-panel-cap-touch-7inch-dsi-dtbs := imx8mp-toradex-smarc-dev.dtb \
 	imx8mp-toradex-smarc-adapter-panel-cap-touch-7inch-dsi.dtbo
+imx8mp-toradex-smarc-dev-csi0-ov5640-24mhz-dtbs := imx8mp-toradex-smarc-dev.dtb \
+	imx8mp-toradex-smarc-csi0-ov5640-24mhz.dtbo
+imx8mp-toradex-smarc-dev-csi0-ov5640-dtbs := imx8mp-toradex-smarc-dev.dtb \
+	imx8mp-toradex-smarc-csi0-ov5640.dtbo
+imx8mp-toradex-smarc-dev-csi1-ov5640-24mhz-dtbs := imx8mp-toradex-smarc-dev.dtb \
+	imx8mp-toradex-smarc-csi1-ov5640-24mhz.dtbo
+imx8mp-toradex-smarc-dev-csi1-ov5640-dtbs := imx8mp-toradex-smarc-dev.dtb \
+	imx8mp-toradex-smarc-csi1-ov5640.dtbo
 imx8mp-toradex-smarc-dev-dsi-to-hdmi-dtbs := imx8mp-toradex-smarc-dev.dtb imx8mp-toradex-smarc-dsi-to-hdmi.dtbo
 imx8mp-toradex-smarc-dev-panel-cap-touch-10inch-lvds-dtbs := imx8mp-toradex-smarc-dev.dtb \
 	imx8mp-toradex-smarc-panel-cap-touch-10inch-lvds.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi0-ov5640-24mhz.dtso b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi0-ov5640-24mhz.dtso
new file mode 100644
index 000000000000..7e6991b95dec
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi0-ov5640-24mhz.dtso
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Module 5MP OV5640 with 24 MHz oscillator connected
+ * via Toradex SMARC Development Board CSI0 connector J45.
+ *
+ * https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
+ */
+
+#include "imx8mp-toradex-smarc-csi0-ov5640.dtso"
+
+&clk_csi0_ov5640_osc {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi0-ov5640.dtso b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi0-ov5640.dtso
new file mode 100644
index 000000000000..23b155beec2a
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi0-ov5640.dtso
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Set 5MP OV5640 connected via Toradex SMARC
+ * Development Board CSI0 connector J45.
+ *
+ * https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
+ * https://www.toradex.com/accessories/csi-camera-ov5640
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	clk_csi0_ov5640_osc: ov5640-csi0-xclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <27000000>;
+	};
+};
+
+&isi_0 {
+	status = "okay";
+};
+
+/* SMARC I2C_CAM0 */
+&smarc_csi0_i2c {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&clk_csi0_ov5640_osc>;
+		clock-names = "xclk";
+		AVDD-supply = <&reg_carrier_3p3v>;
+		DOVDD-supply = <&reg_carrier_3p3v>;
+		DVDD-supply = <&reg_carrier_3p3v>;
+		/* CAM_0_CON_PWRCTRL, pin 24 */
+		powerdown-gpios = <&smarc_csi0 3 GPIO_ACTIVE_LOW>;
+		/* CAM_0_CON_RST, pin 11 */
+		reset-gpios = <&smarc_csi0 0 GPIO_ACTIVE_LOW>;
+
+		port {
+			ov5640_csi0_to_smarc_csi_rx: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&smarc_csi0_rx_in>;
+			};
+		};
+	};
+};
+
+&smarc_csi0_rx {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			smarc_csi0_rx_in: endpoint {
+				data-lanes = <1 2>;
+				remote-endpoint = <&ov5640_csi0_to_smarc_csi_rx>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi1-ov5640-24mhz.dtso b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi1-ov5640-24mhz.dtso
new file mode 100644
index 000000000000..f6bfc3d49f5e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi1-ov5640-24mhz.dtso
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Module 5MP OV5640 with 24 MHz oscillator connected
+ * via Toradex SMARC Development Board CSI1 connector J46.
+ *
+ * https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
+ */
+
+#include "imx8mp-toradex-smarc-csi1-ov5640.dtso"
+
+&clk_csi1_ov5640_osc {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi1-ov5640.dtso b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi1-ov5640.dtso
new file mode 100644
index 000000000000..d78f46a764f8
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi1-ov5640.dtso
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Set 5MP OV5640 connected via Toradex SMARC
+ * Development Board CSI1 connector J46.
+ *
+ * https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
+ * https://www.toradex.com/accessories/csi-camera-ov5640
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	clk_csi1_ov5640_osc: ov5640-csi1-xclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <27000000>;
+	};
+};
+
+&isi_0 {
+	status = "okay";
+};
+
+/* SMARC I2C_CAM1 */
+&smarc_csi1_i2c {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&clk_csi1_ov5640_osc>;
+		clock-names = "xclk";
+		AVDD-supply = <&reg_carrier_3p3v>;
+		DOVDD-supply = <&reg_carrier_3p3v>;
+		DVDD-supply = <&reg_carrier_3p3v>;
+		/* CAM_1_CON_PWRCTRL, pin 24 */
+		powerdown-gpios = <&smarc_csi1 3 GPIO_ACTIVE_LOW>;
+		/* CAM_1_CON_RST, pin 11 */
+		reset-gpios = <&smarc_csi1 0 GPIO_ACTIVE_LOW>;
+
+		port {
+			ov5640_csi1_to_smarc_csi_rx: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&smarc_csi1_rx_in>;
+			};
+		};
+	};
+};
+
+&smarc_csi1_rx {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			smarc_csi1_rx_in: endpoint {
+				data-lanes = <1 2>;
+				remote-endpoint = <&ov5640_csi1_to_smarc_csi_rx>;
+			};
+		};
+	};
+};

-- 
2.43.0


