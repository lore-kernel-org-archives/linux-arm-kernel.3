Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1956BC79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 11:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eV9sk5hU0/u8qwTJY/3H34b1rkL69Lya+pyG85fXSY0=; b=dt22m+iUaOfdu2zXy/C0WU5eBi
	TamI7kPxiyzzeB3j6rBlzQQFS0biq6CHmjgWhpAAhuMqsyHmYtWx37ZN+5SZnoZECkRAYyu2a9vk8
	tvUdU0k8Pj4nQiomb8BwFWCnjVzUdz9XadMjKfAfBe8GC5dK7s5iUsC1CoxsoluH+LuVSyZzHq0pw
	dCDb2Ie2kUiRa1voILk5P4zgN/47Jv4JqeKPs5XW6aCLHG0ozIZwdlOanldONpqwpMGZIRnc+Px65
	W7SqxOceV8ICtNoq22blnSAS6b1+yt0h7wweqtChLi0RN2s5jLC8uTU/WmhGibHFp9tuWCKoNXmMt
	QhLAUhgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XjN-00000006gdL-2YFG;
	Mon, 07 Sep 2026 11:41:46 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XjI-00000006gaC-2Mi4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 11:41:41 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-4859245e493so1496909f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 04:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788781299; x=1789386099; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eV9sk5hU0/u8qwTJY/3H34b1rkL69Lya+pyG85fXSY0=;
        b=Lr1rV3u294mKDARYirXnH25yOUYBZ/JmQR8Cg7OvLws6tFcSJwOU8MOL61uYAkPy6b
         68EoMGwzdoFcqMs9Se4ZYMfasgjPjoN3BxXr3bYXekNIKe+ygqMZ1XbBA74eQBhA3dLc
         VCWq66fM0sKuO3331VNDhyn9j6q5TWNtlTdinnQyhob7GrJI3RCXj2EK9U9AH/53+2Xk
         uf4NmKE5Rg3zqZAH7krRsJoLhp8MYEcvDMT8wIcS9GUV1Opke4KRf5nkesaofwI9MTHa
         XbWYWUQm+VGz/+dhzkKaJXCzRylxcnFwT+UIeBeodQLAKx4cLx8WeTqFm6Rd5A9/LMOf
         b0QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788781299; x=1789386099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eV9sk5hU0/u8qwTJY/3H34b1rkL69Lya+pyG85fXSY0=;
        b=hhLDFJJ7dsZThWYoEHv7J6P5z/wVIb64JfaKrrsPaIxKLb8cwRzs0UiHk/l60iyqw4
         o0grvsd9vFByOKZNy1VnTjsQXkLFv/WLbHMdF4QsLX6zl4IcT1I1Dzve+2v6a/4QoDDu
         bKfjz7RfEotW+DmBOTsCIV6NVrFxWZfDQe2nx/st4mH0SgCPG6hyNdnNwjvT1MZpKBYQ
         WhRZDhGolpggofAC2+n9Bk2FSkfvvQQ6rE9039Ib6hBdPGmq78Y3X6CM4qwNrWP+KMrK
         9/Afqd76geF7rNs86T414l8vW3CNnxAkHft6Tq3Q5Hccfj3bq86ITeg+8fzd/IYp076E
         SALw==
X-Forwarded-Encrypted: i=1; AKwUvBxIfoPbN1IHYy2kmR3Y7uZm+CHGj7+QHu9H2G316046/T+H7ayZcmSc6b8gc/8KLwsyDWLE8lcrDt9K0xLN9Pxl@lists.infradead.org
X-Gm-Message-State: AFuF++m9Rzfrv3kQyIfpybNOJcfu9Rx2cZjl+it9f2dHDRroSjCfHONs
	mBkXD9c67VcoYaXekFlzYg1QYXO91chJr8NPTcbSSSKd4JO6y7AjFEcyEQ21VMMg
X-Gm-Gg: AYBFou00ZlBOdbSaFsgfB9e1cS913/Gc8r3AVT0Y0v1MII3FrTYC3KY+kZxyiSp0Eob
	DnGm8y19n4ar63XNZObo9dh4qSqbpoBlsrm4OoQ8M0RAkQSF2oVKUampAhS0ghOJUDZGHNS38hv
	aw9hH6snU6VVJfrA+foX1mhN01eCm2iucAO8+EiOIfJ4x0HnHrst5H6PKRg4DRCxx44qMDZrKDg
	EwTDwqGi9C+wwUmPTZYqe/XIyrLB2jjtHAedW6H2qfoN1z9++PmZPn/l1GoaeAM2+l9UloEQzLj
	AK5UD639y12nafhgc0tZnFQYPLbvTpiTnAQq6OhWd/Lv2vAC8Vjs70aTWA8HHC1VUgSu4cW7GL6
	u7eIlCjcPeF9aU3xKdVGH9Rmysa4EQj9kAJKmtoUtjSSD+jfVmLNv9Ws+DPlyoBUdlWX7qTR2zk
	WF6UxvKO6ghGTl6Hj3TliacfS3gjWppCkMmXr3bbilb5hWr/1WW3ABQNZipHHJHksKG80Zi3KLa
	hgAzsk9IZrtwaz7LHx37luQhtsB3hED4mACz4yChZAWIgPWQtcq6Jm/kP+ChI8=
X-Received: by 2002:a05:6000:240b:b0:485:8a47:5b8b with SMTP id ffacd0b85a97d-4858a475d06mr19956526f8f.40.1788781298671;
        Mon, 07 Sep 2026 04:41:38 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d2693e8sm26763182f8f.3.2026.09.07.04.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:41:38 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Mon, 07 Sep 2026 13:41:31 +0200
Subject: [PATCH 2/4] arm64: dts: freescale: imx8mp-verdin: Add DSI to HDMI
 adapter overlay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-verdin-imx8mp-non-camera-overlays-ready-v1-2-ca0c63c2994f@toradex.com>
References: <20260907-verdin-imx8mp-non-camera-overlays-ready-v1-0-ca0c63c2994f@toradex.com>
In-Reply-To: <20260907-verdin-imx8mp-non-camera-overlays-ready-v1-0-ca0c63c2994f@toradex.com>
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
X-CRM114-CacheID: sfid-20260907_044140_644789_96A0748E 
X-CRM114-Status: GOOD (  14.99  )
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

The overlay is also combined with the Verdin iMX8M Plus carrier board
device trees to provide ready-to-use DTBs for the Dahlia, Yavia and
Development Board carriers, in both WiFi and non-WiFi SoM variants.

Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-hdmi-adapter
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |  13 +++
 .../dts/freescale/imx8mp-verdin-dsi-to-hdmi.dtso   | 102 +++++++++++++++++++++
 2 files changed, 115 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 8c6fdeaf12af..715235b62912 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -729,21 +729,34 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw74xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw75xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw82xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dev-nau8822-btl.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dsi-to-hdmi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-mallow.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-yavia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-zinnia.dtb
 
+imx8mp-verdin-nonwifi-dahlia-dsi-to-hdmi-dtbs := imx8mp-verdin-nonwifi-dahlia.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
+imx8mp-verdin-nonwifi-dev-dsi-to-hdmi-dtbs := imx8mp-verdin-nonwifi-dev.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
+imx8mp-verdin-nonwifi-yavia-dsi-to-hdmi-dtbs := imx8mp-verdin-nonwifi-yavia.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
+imx8mp-verdin-wifi-dahlia-dsi-to-hdmi-dtbs := imx8mp-verdin-wifi-dahlia.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
+imx8mp-verdin-wifi-dev-dsi-to-hdmi-dtbs := imx8mp-verdin-wifi-dev.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
 imx8mp-verdin-wifi-dev-nau8822-btl-dtbs := imx8mp-verdin-wifi-dev.dtb imx8mp-verdin-dev-nau8822-btl.dtbo
+imx8mp-verdin-wifi-yavia-dsi-to-hdmi-dtbs := imx8mp-verdin-wifi-yavia.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
 
 imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtbo
 imx8mp-evk-lvds0-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-lvds-hdmi.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-hdmi.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-hdmi.dtso
new file mode 100644
index 000000000000..e572fd13b987
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-hdmi.dtso
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
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
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pwm_3_dsi_hpd_gpio>;
+		ddc-i2c-bus = <&i2c2>;
+		/* Verdin PWM_3_DSI (SODIMM 19) - HPD */
+		hpd-gpios = <&gpio3 20 GPIO_ACTIVE_HIGH>;
+		label = "hdmi";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&dsi_hdmi_bridge_out>;
+			};
+		};
+	};
+
+	reg_dsi_hdmi: regulator-dsi-hdmi {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		/* Verdin CTRL_SLEEP_MOCI# (SODIMM 256) */
+		gpios = <&gpio4 29 GPIO_ACTIVE_HIGH>;
+		regulator-boot-on;
+		regulator-name = "DSI_1_PWR_EN";
+	};
+};
+
+&hdmi_lontium_lt8912 {
+	pinctrl-0 = <&pinctrl_gpio_10_dsi>;
+	vcchdmipll-supply = <&reg_dsi_hdmi>;
+	vcchdmitx-supply = <&reg_dsi_hdmi>;
+	vcclvdspll-supply = <&reg_dsi_hdmi>;
+	vcclvdstx-supply = <&reg_dsi_hdmi>;
+	vccmipirx-supply = <&reg_dsi_hdmi>;
+	vccsysclk-supply = <&reg_dsi_hdmi>;
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
+/* Verdin PWM_3_DSI (SODIMM 19) repurposed as HDMI HPD GPIO */
+&pwm3 {
+	status = "disabled";
+};

-- 
2.43.0


