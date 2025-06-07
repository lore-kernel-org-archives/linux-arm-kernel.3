Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F3DFC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 09:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BY5a2j93oXGkMU8803msBPZC+Hhuefek8iCrsedNGL4=; b=3C6VvH1bDC2lHR6Xl8iBWjiTNQ
	bJgC66mgRaih8bsshT/NVPebvu8gDC/Jw1dyqxgTVChtopjc2iEDZB8Mr92VjscLDuC+2iMImj93w
	zLS+ZlC18SB1LhinZCo+xabhvTAZKFwe/GbGZqpj8YHUuipUIt78iljPb5TFlPk/zGawy2KO6YKFa
	wIFwBy9HazxqButq++S4lvVRviHfmjm6tQ6phgvGqufjuRLwrV9JbEzN9YL9z+v0hAgVZQFBjfHVg
	MG5OqjL57AuClVO2/rf1aQp8H4UpR7ZIENsg7zB2PvkYxpK5vSFSDWF6u6vuntAWCcnz9Mctq+M0l
	0ZrbPtRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNqBB-00000001ViO-0lan;
	Sat, 07 Jun 2025 09:49:33 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNpwA-00000001UGV-1fYt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Jun 2025 09:34:03 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-ad55d6aeb07so530382366b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Jun 2025 02:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749288841; x=1749893641; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BY5a2j93oXGkMU8803msBPZC+Hhuefek8iCrsedNGL4=;
        b=C3E8rEz7+iau7I962U9eTSxKPmpQImBIFiuXbuUtZDJcnCqnchrJRAt0tUaaGhvCz5
         vbpLJYjPPWfOTTEbdVp02AkoStojYVbA6NnjCjuHZNVRp0E0fpVkJglTi/EaMEwRfI0J
         baFkjcf0waLaHmFIUEXwitE0UFBb3FKaq1+Qc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749288841; x=1749893641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BY5a2j93oXGkMU8803msBPZC+Hhuefek8iCrsedNGL4=;
        b=TWI8f7veTCdHKcyOMGS6y6xdc2xCc3OXGK7r9T2uvPP+yai076z4XC0Dtcv4TplZqi
         wZu3l9f/gzsSUw8tWpqAQgNLgzUhv93qRIQUGRAxORdSCo5pAgEvHZiELodgVKf6g8Gg
         OIQJMiH4OC2oFsNzzQgAmB2RLZ7nKxOHcWOTvcyc0ZssA4hNvKvBjGsJWBuwPf5tTOzh
         C9g1B+y2WVzZZCGcFeaDAeCv96Nt0T6Ns9Qpp0x4gzEELB97BXEsxjRmWLaKAgl2Ex01
         LZVwWpRu4D1hR9V2b2U22V1mwClYB8Lc0eQ/z9Z51F0Bi1us8J4p560JjSU3po9pMKr1
         DoJg==
X-Forwarded-Encrypted: i=1; AJvYcCVrgcCCXY1T3jqxrnBdpziNilYLAT/eXZCc1gTmMNYbixubDvF+TiJM/vEVCnjf5ONa74UA04MF+ikhB4mDA83B@lists.infradead.org
X-Gm-Message-State: AOJu0YxIGCFdgXucqlTo2l17khbYz7jDmY3236gp6WzAfrXEdcgwZpux
	bQpVS5WF1tmo9sB+bCeZzt4T/tlVZb5gWjKyWG0y0iJrekWn78Dxyzlk7cBZebNpH9g=
X-Gm-Gg: ASbGncs1USGw/B0jndkJ6KOpv5iYY/CO+MfkiVOyfBTDzPdG3yp+b3A7InMw91nyL3Q
	hENPFxWF6UzOpIe5YOthBshcRGBIHFbR3bipsGhv8eWsjLhr+/Rwrfka27ghv1uLeVYjgzqopmg
	cpw331EmBZ2Z4pE9IfFqOztPttriHFDUYb2wgj6/KY0roiIqn/v1TeFzRCUk75JOJdDjtBtFFzb
	vb+PoaygtlZtaDpaLds4mewX8pb94F2eISoGHP4F0QTt9v8c1yfwigNK6CNMun4LcNgxG96O8L5
	eLh/Z0NBnktoUtFM2UuBrmFFTo4JBwboV4gXaqUhHQj+6DrTPA20mdo3YzkH85gF/FA5S2fwlQi
	DshILIrpqDiZz9lMJkenhJ9ju/CPUZcm+Ww7cymnVv9GUUYX12J2hMZBp3fKy1pFb9gU7HMoI3O
	OVJE+7ut46ec9C
X-Google-Smtp-Source: AGHT+IH+nnLe4nhY/KmC1nxcHmSMY3MeJ1Ohpe9/3X5P0YmlpM51ucnPzgCI+0Whb6pU1/wD56roKQ==
X-Received: by 2002:a17:907:970c:b0:ad8:a935:b905 with SMTP id a640c23a62f3a-ade1a905ae2mr485259166b.22.1749288840892;
        Sat, 07 Jun 2025 02:34:00 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-87-5-95-99.retail.telecomitalia.it. [87.5.95.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc1c316sm251541066b.98.2025.06.07.02.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 02:34:00 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Matteo Lisi <matteo.lisi@engicam.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 09/10] ARM: dts: imx6ul: support Engicam MicroGEA GTW board
Date: Sat,  7 Jun 2025 11:33:21 +0200
Message-ID: <20250607093342.2248695-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250607093342.2248695-1-dario.binacchi@amarulasolutions.com>
References: <20250607093342.2248695-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_023402_437685_E1B72F22 
X-CRM114-Status: GOOD (  13.94  )
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

Support Engicam MicroGEA GTW board with:

- 256 Mbytes NAND Flash
- 512 Mbytes DRAM DDR2
- Buttons
- LEDs
- Micro SD card connector
- USB 2.0 high-speed/full-speed
- Ethernet MAC

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/nxp/imx/Makefile            |   1 +
 .../nxp/imx/imx6ull-engicam-microgea-gtw.dts  | 164 ++++++++++++++++++
 2 files changed, 165 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dts

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 32dfd69b8d8b..de4142e8f3ce 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -357,6 +357,7 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ull-dhcom-picoitx.dtb \
 	imx6ull-dhcor-maveo-box.dtb \
 	imx6ull-engicam-microgea-bmm.dtb \
+	imx6ull-engicam-microgea-gtw.dtb \
 	imx6ull-engicam-microgea-rmm.dtb \
 	imx6ull-jozacp.dtb \
 	imx6ull-kontron-bl.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dts
new file mode 100644
index 000000000000..1c82ac08bfb4
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dts
@@ -0,0 +1,164 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ * Copyright (C) 2025 Engicam srl
+ */
+
+/dts-v1/;
+
+#include "imx6ull-engicam-microgea.dtsi"
+
+/ {
+	compatible = "engicam,microgea-imx6ull-gtw",
+		     "engicam,microgea-imx6ull", "fsl,imx6ull";
+	model = "Engicam MicroGEA i.MX6ULL GTW Board";
+
+
+	reg_1v8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	reg_3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_keys>;
+
+		user-button {
+			label = "User button";
+			gpios = <&gpio1 13 GPIO_ACTIVE_LOW>;
+			linux,code = <BTN_MISC>;
+			wakeup-source;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_leds>, <&pinctrl_pwrled>;
+
+		led-0 {
+			gpios = <&gpio5 7 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+		};
+
+		led-1 {
+			gpios = <&gpio1 14 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-2 {
+			gpios = <&gpio1 15 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-3 {
+			gpios = <&gpio1 12 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	usb_hub: usb-hub {
+		compatible = "smsc,usb3503a";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_usb_hub>;
+		reset-gpios = <&gpio5 6 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&iomuxc {
+
+	pinctrl_gpio_keys: gpio_keysgrp {
+		fsl,pins = <
+			MX6UL_PAD_JTAG_TDI__GPIO1_IO13		0x0b0b0
+		>;
+	};
+
+	pinctrl_leds: ledsgrp {
+		fsl,pins = <
+			MX6UL_PAD_JTAG_TCK__GPIO1_IO14		0x130b0
+			MX6UL_PAD_JTAG_TRST_B__GPIO1_IO15	0x130b0
+			MX6UL_PAD_JTAG_TDO__GPIO1_IO12		0x130b0
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX6UL_PAD_UART1_TX_DATA__UART1_DCE_TX	0x1b0b1
+			MX6UL_PAD_UART1_RX_DATA__UART1_DCE_RX	0x1b0b1
+		>;
+	};
+
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX6UL_PAD_UART2_TX_DATA__UART2_DCE_TX	0x1b0b1
+			MX6UL_PAD_UART2_RX_DATA__UART2_DCE_RX	0x1b0b1
+			MX6UL_PAD_UART2_RTS_B__UART2_DCE_RTS	0x1b0b1
+			MX6UL_PAD_UART2_CTS_B__UART2_DCE_CTS	0x1b0b1
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x17059
+			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x10059
+			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x17059
+			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x17059
+			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x17059
+			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x17059
+		>;
+	};
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	status = "okay";
+};
+
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart2>;
+	status = "okay";
+};
+
+&usbotg1 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&usbotg2 {
+	dr_mode = "host";
+	disable-over-current;
+	status = "okay";
+};
+
+/* MicroSD */
+&usdhc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	vmmc-supply = <&reg_3v3>;
+	bus-width = <4>;
+	non-removable;
+	status = "okay";
+};
+
+&iomuxc_snvs {
+	pinctrl_pwrled: ledsgrp {
+		fsl,pins = <
+			MX6ULL_PAD_SNVS_TAMPER7__GPIO5_IO07	0x130b0
+		>;
+	};
+
+	pinctrl_usb_hub: usb_hubgrp {
+		fsl,pins = <
+			MX6ULL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x17059
+		>;
+	};
+};
-- 
2.43.0


