Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A285C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 15:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B8d89tWgXYwUCIAoIbQ8mg9HLXq8Ydq7zeYQBsrGRvg=; b=Ev8mjixUD/DuUzJd0Tbe1dkFta
	Ubrt2cmpaKAM2di/gW0+ZAy3vtEmpx5BtR6T4xJH96p6MwjPP0fI35uKQPh2y2qb30WlHX7/FeEj0
	Fdbwuh01B3nOgpHG/qpoLL8qhKGCRX4Gtt5BOZjsjCG07NBCwgNAOxnn8QRvglx5ioKXSksAb4lID
	JGk2nJgN2eqdzWnlWH2VXY5pUozRsZouytCNRIzaSNWYeHQ3gJvu52byvjBgx+v1F5UyV8F8gcHtn
	AOGDgjKV7uqwLhCJ1eT8AqhBdgQItgJ8I8ci9bWTD6SuTwWmLgFpdZkCF8KreI7cGjYPyCysbszx2
	uuC1kGIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZbO-00000003vMb-48HQ;
	Tue, 29 Sep 2026 15:18:42 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZaf-00000003uxO-0r8a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 15:17:58 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ffe281cb1so19959765e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 08:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790695075; x=1791299875; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B8d89tWgXYwUCIAoIbQ8mg9HLXq8Ydq7zeYQBsrGRvg=;
        b=PhHOx2cNGnc4Ua2/ar6YOk6pjR2hsFaKhRmk/EmaEPVPF9FmwtRApyfkug7IWPU8WY
         5M2fQGOG4gaOoqrFD7UowXCEFZ9xEjKANvbm6BGcZ0LvgFfi52z3Q6X0HWlAHtToXTPl
         HoyVzI6YCMbLM9O/BWvhPwrpXnLJWjumx37OWI0k5jqmjgxoiFRLNnAyqtnf4VsM4E1G
         qtf4nhydgbSzAj0peI7TfSwPDEDF+zDU4AR37yCgzKW1qq8w/DvLRR1otz9nnTmf9uDM
         8cxnlLr4TSpmvZFFnuWzqofvQrmMLLPALx1NNZ0a/vEpYX/koT01F98e7oTbnOMIjGhB
         0i7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790695075; x=1791299875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B8d89tWgXYwUCIAoIbQ8mg9HLXq8Ydq7zeYQBsrGRvg=;
        b=wkS7mPXUP9FPN0ZgB9II/bTUdGhgjyeb+oDxe8SfDLGQph5yu3hlWkxSQinRZNPiHf
         8rV+ZkAbjsA4+/BXOEOTS44VV91xQm7ngc/Rn7SheTf6E15maL3mZMm7cNtMNF70JILE
         FujRj/fROmuXF2/gkfUwP2Bj2+QUOLzHmLFtmSMf3M5KdTlo3R/sfOvhrbDeVZemJv2T
         bbfnq1EfyGRj3B7VnV+W5DnybGvc1H/LH2INjXQIYZhm1f4hv1xTl47L1dGZIU5G8O4M
         kIpmwRxrmn+Wr4XmRv7Ocub1c/zV/DQWKEsO+W10zuytnKfliQFmPjmNR6WBjr/p/MQP
         Yxog==
X-Forwarded-Encrypted: i=1; AKwUvBwDD6G3bhR2pgBTFUHK4L44ThU98y3E4j1hUSwMrH0gHOGhxflVQcoNwE4jpa5r5sNoshFtIy64oAINlCV4PVrs@lists.infradead.org
X-Gm-Message-State: AFuF++kTzvADGuKqTbDPTgAquwg6t9k0QOdmRupsliugyxJnCBzjkQZm
	jJ2IRPigqgVek1JeuBpZc1bWm8xC9fliUEx/B/QRABuiVcARiBSKHov+
X-Gm-Gg: AYBFou14seipyG8KXlQmoo17bwNXAQPrvynIEH0lqUhz3CW0R+B4J0MwxUb+/7J6GO3
	t7UU8fw+hXxTkXxibnlASG0kXAYkSAn8JiPUszVy8G8jhx1wIKejywrcCMuMhkUue9G3d4mCyZE
	g9/UxDkiHSNbZP/gPDUBnSZfvjAw00qFYwKvspzEnb4qmMHH+MjSfa4KyHQzrOIxPB0XF1quHwe
	/V7aosm8rfpjYRGMrUNCVnEQv5UV6b9VoEHEon9lcnUOHxg8YsrTooJCaAitYvfSfHkFLe7hAra
	bj+Y0eckV0fylg9VXoInXW3En6SwsPH0/GU6oOJ4OKn4bnTkHHI+vB70OaDL2+83YRnCjPrc6lI
	u4XPuC1bWe9FgmaFc+iPiUCGHfYqBYjv9xRpXCOvaHRoGruz+z4jiBOZXqVsvsGpz7d+TyZRC9T
	jst4yvSbQtNoCmMA6ETUFMdAZX0mCUeTcZYmxV7z9RPgy9flnGC+BLPNe3SWUuMb8qvyLeckZIf
	eQBSKnDtgU0nAq1EdQ5SUnhZ0LDfDWRFPJ89V7IkKXykrXuBA0dPwAzLh94c/uk3ztpOtKhyhoy
	6HHXbf3CLY173nSEPL6/9ns=
X-Received: by 2002:a05:600c:348a:b0:49a:a101:4157 with SMTP id 5b1f17b1804b1-49ff06b2c58mr223903065e9.7.1790695075031;
        Tue, 29 Sep 2026 08:17:55 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a013cf8402sm10313705e9.2.2026.09.29.08.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:17:54 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v4 06/13] ARM: dts: imx6ul: Add Variscite SoM and DART base files
Date: Tue, 29 Sep 2026 17:17:33 +0200
Message-ID: <150c7e64d34a12a4fb9cec1a5b2c805246590100.1790693249.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790693249.git.stefano.r@variscite.com>
References: <cover.1790693249.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_081757_404075_11172549 
X-CRM114-Status: GOOD (  18.21  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add shared DTSI files for the VAR-SOM-6UL and DART-6UL modules and
SoC-specific wrappers for i.MX6UL, i.MX6ULL and i.MX6ULZ.

Describe the touch and ADC reference supply as a fixed 3.3 V
regulator on both modules so the ADC can report the correct scale.

Keep storage, audio and carrier options in separate DTSI files so
board variants can include the hardware assembled on each board.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - Constrain the fixed touch and ADC reference regulators to 3.3 V on
   both modules so the ADC can report a valid scale.

 .../dts/nxp/imx/imx6ul-imx6ull-var-dart.dtsi  | 207 ++++++++++++++++++
 .../dts/nxp/imx/imx6ul-imx6ull-var-som.dtsi   | 203 +++++++++++++++++
 .../arm/boot/dts/nxp/imx/imx6ul-var-dart.dtsi |  31 +++
 arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi |  31 +--
 .../boot/dts/nxp/imx/imx6ull-var-dart.dtsi    |  31 +++
 .../arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi |  31 ++-
 .../boot/dts/nxp/imx/imx6ulz-var-dart.dtsi    |  38 ++++
 .../arm/boot/dts/nxp/imx/imx6ulz-var-som.dtsi |  38 ++++
 8 files changed, 573 insertions(+), 37 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som.dtsi

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart.dtsi
new file mode 100644
index 000000000000..f7190f6d50b5
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart.dtsi
@@ -0,0 +1,207 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/ {
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x20000000>;
+	};
+
+	/* ref_clk for micrel ethernet phy */
+	rmii_ref_clk: clock-rmii-ref {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <25000000>;
+		clock-output-names = "rmii-ref";
+	};
+
+	reg_3p3v: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "3P3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	reg_gpio_dvfs: regulator-gpio-dvfs {
+		compatible = "regulator-gpio";
+		regulator-name = "gpio_dvfs";
+		regulator-min-microvolt = <1300000>;
+		regulator-max-microvolt = <1400000>;
+		regulator-type = "voltage";
+		gpios = <&gpio4 13 GPIO_ACTIVE_HIGH>;
+		states = <1300000 0x1
+			  1400000 0x0>;
+	};
+
+	touch_3v3_regulator: regulator-touch-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "touch_3v3_supply";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+};
+
+&clks {
+	assigned-clocks = <&clks IMX6UL_CLK_PLL4_AUDIO_DIV>;
+	assigned-clock-rates = <786432000>;
+};
+
+&cpu0 {
+	arm-supply = <&reg_arm>;
+	soc-supply = <&reg_soc>;
+};
+
+&fec1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_enet1>, <&pinctrl_enet1_gpio>, <&pinctrl_enet1_mdio>;
+	phy-mode = "rmii";
+	phy-handle = <&ethphy0>;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@1 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <1>;
+			clocks = <&rmii_ref_clk>;
+			clock-names = "rmii-ref";
+			reset-gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <100000>;
+			micrel,rmii-reference-clock-select-25-mhz = <1>;
+			micrel,led-mode = <1>;
+		};
+	};
+};
+
+&i2c2 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c2>;
+	pinctrl-1 = <&pinctrl_i2c2_gpio>;
+	scl-gpios = <&gpio1 30 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio1 31 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+};
+
+&pxp {
+	status = "okay";
+};
+
+&snvs_poweroff {
+	status = "okay";
+};
+
+&snvs_pwrkey {
+	status = "okay";
+};
+
+&tsc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_tsc>;
+	xnur-gpios = <&gpio1 3 GPIO_ACTIVE_LOW>;
+	measure-delay-time = <0xffff>;
+	pre-charge-time = <0xfff>;
+	status = "okay";
+};
+
+/* Bluetooth UART */
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart2>;
+	uart-has-rtscts;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_enet1: enet1-grp {
+		fsl,pins = <
+			MX6UL_PAD_ENET1_RX_EN__ENET1_RX_EN	0x1b0b0
+			MX6UL_PAD_ENET1_RX_ER__ENET1_RX_ER	0x1b0b0
+			MX6UL_PAD_ENET1_RX_DATA0__ENET1_RDATA00	0x1b0b0
+			MX6UL_PAD_ENET1_RX_DATA1__ENET1_RDATA01	0x1b0b0
+			MX6UL_PAD_ENET1_TX_EN__ENET1_TX_EN	0x1b0b0
+			MX6UL_PAD_ENET1_TX_DATA0__ENET1_TDATA00	0x1b0b0
+			MX6UL_PAD_ENET1_TX_DATA1__ENET1_TDATA01	0x1b0b0
+			MX6UL_PAD_ENET1_TX_CLK__ENET1_REF_CLK1	0x4001b031
+		>;
+	};
+
+	pinctrl_enet1_mdio: enet1-mdio-grp {
+		fsl,pins = <
+			MX6UL_PAD_GPIO1_IO06__ENET1_MDIO	0x1b0b0
+			MX6UL_PAD_GPIO1_IO07__ENET1_MDC		0x1b0b0
+		>;
+	};
+
+	pinctrl_i2c2: i2c2-grp {
+		fsl,pins = <
+			MX6UL_PAD_UART5_TX_DATA__I2C2_SCL	0x4001b8b0
+			MX6UL_PAD_UART5_RX_DATA__I2C2_SDA	0x4001b8b0
+		>;
+	};
+
+	pinctrl_i2c2_gpio: i2c2-gpio-grp {
+		fsl,pins = <
+			MX6UL_PAD_UART5_TX_DATA__GPIO1_IO30	0x1b0b0
+			MX6UL_PAD_UART5_RX_DATA__GPIO1_IO31	0x1b0b0
+		>;
+	};
+
+	pinctrl_tsc: tsc-grp {
+		fsl,pins = <
+			MX6UL_PAD_GPIO1_IO01__GPIO1_IO01	0xb0
+			MX6UL_PAD_GPIO1_IO02__GPIO1_IO02	0xb0
+			MX6UL_PAD_GPIO1_IO03__GPIO1_IO03	0xb0
+			MX6UL_PAD_GPIO1_IO04__GPIO1_IO04	0xb0
+		>;
+	};
+
+	pinctrl_uart2: uart2-grp {
+		fsl,pins = <
+			MX6UL_PAD_UART2_TX_DATA__UART2_DCE_TX	0x1b0b1
+			MX6UL_PAD_UART2_RX_DATA__UART2_DCE_RX	0x1b0b1
+			MX6UL_PAD_UART2_CTS_B__UART2_DCE_CTS	0x1b0b1
+			MX6UL_PAD_UART2_RTS_B__UART2_DCE_RTS	0x1b0b1
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1-grp {
+		fsl,pins = <
+			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x17059
+			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x17059
+			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x17059
+			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x17059
+			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x17059
+			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x17059
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhz-grp {
+		fsl,pins = <
+			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x170b9
+			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x100b9
+			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x170b9
+			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x170b9
+			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x170b9
+			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x170b9
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhz-grp {
+		fsl,pins = <
+			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x170f9
+			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x100f9
+			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x170f9
+			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x170f9
+			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x170f9
+			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x170f9
+		>;
+	};
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som.dtsi
new file mode 100644
index 000000000000..cd93f618e907
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som.dtsi
@@ -0,0 +1,203 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/ {
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x20000000>;
+	};
+
+	/* ref_clk for micrel ethernet phy */
+	rmii_ref_clk: clock-rmii-ref {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <25000000>;
+		clock-output-names = "rmii-ref";
+	};
+
+	reg_3p3v: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "3P3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	reg_gpio_dvfs: regulator-gpio-dvfs {
+		compatible = "regulator-gpio";
+		regulator-name = "gpio_dvfs";
+		regulator-min-microvolt = <1300000>;
+		regulator-max-microvolt = <1400000>;
+		regulator-type = "voltage";
+		gpios = <&gpio4 13 GPIO_ACTIVE_HIGH>;
+		states = <1300000 0x1
+			  1400000 0x0>;
+	};
+
+	touch_3v3_regulator: regulator-touch-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "touch_3v3_supply";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+};
+
+&clks {
+	assigned-clocks = <&clks IMX6UL_CLK_PLL4_AUDIO_DIV>;
+	assigned-clock-rates = <786432000>;
+};
+
+&cpu0 {
+	arm-supply = <&reg_arm>;
+	soc-supply = <&reg_soc>;
+};
+
+&fec1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_enet1>, <&pinctrl_enet1_gpio>, <&pinctrl_enet1_mdio>;
+	phy-mode = "rmii";
+	phy-handle = <&ethphy0>;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@1 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <1>;
+			clocks = <&rmii_ref_clk>;
+			clock-names = "rmii-ref";
+			reset-gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <100000>;
+			micrel,rmii-reference-clock-select-25-mhz = <1>;
+			micrel,led-mode = <1>;
+		};
+	};
+};
+
+&i2c2 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c2>;
+	pinctrl-1 = <&pinctrl_i2c2_gpio>;
+	scl-gpios = <&gpio4 20 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio4 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+};
+
+&pxp {
+	status = "okay";
+};
+
+&snvs_poweroff {
+	status = "okay";
+};
+
+&tsc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_tsc>;
+	xnur-gpios = <&gpio1 3 GPIO_ACTIVE_LOW>;
+	measure-delay-time = <0xffff>;
+	pre-charge-time = <0xfff>;
+	status = "okay";
+};
+
+/* Bluetooth UART */
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart2>;
+	uart-has-rtscts;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_enet1: enet1-grp {
+		fsl,pins = <
+			MX6UL_PAD_ENET1_RX_EN__ENET1_RX_EN	0x1b0b0
+			MX6UL_PAD_ENET1_RX_ER__ENET1_RX_ER	0x1b0b0
+			MX6UL_PAD_ENET1_RX_DATA0__ENET1_RDATA00	0x1b0b0
+			MX6UL_PAD_ENET1_RX_DATA1__ENET1_RDATA01	0x1b0b0
+			MX6UL_PAD_ENET1_TX_EN__ENET1_TX_EN	0x1b0b0
+			MX6UL_PAD_ENET1_TX_DATA0__ENET1_TDATA00	0x1b0b0
+			MX6UL_PAD_ENET1_TX_DATA1__ENET1_TDATA01	0x1b0b0
+			MX6UL_PAD_ENET1_TX_CLK__ENET1_REF_CLK1	0x4001b031
+		>;
+	};
+
+	pinctrl_enet1_mdio: enet1-mdio-grp {
+		fsl,pins = <
+			MX6UL_PAD_GPIO1_IO06__ENET1_MDIO	0x1b0b0
+			MX6UL_PAD_GPIO1_IO07__ENET1_MDC		0x1b0b0
+		>;
+	};
+
+	pinctrl_i2c2: i2c2-grp {
+		fsl,pins = <
+			MX6UL_PAD_CSI_HSYNC__I2C2_SCL		0x4001b8b0
+			MX6UL_PAD_CSI_VSYNC__I2C2_SDA		0x4001b8b0
+		>;
+	};
+
+	pinctrl_i2c2_gpio: i2c2-gpio-grp {
+		fsl,pins = <
+			MX6UL_PAD_CSI_HSYNC__GPIO4_IO20		0x1b0b0
+			MX6UL_PAD_CSI_VSYNC__GPIO4_IO19		0x1b0b0
+		>;
+	};
+
+	pinctrl_tsc: tsc-grp {
+		fsl,pins = <
+			MX6UL_PAD_GPIO1_IO01__GPIO1_IO01	0xb0
+			MX6UL_PAD_GPIO1_IO02__GPIO1_IO02	0xb0
+			MX6UL_PAD_GPIO1_IO03__GPIO1_IO03	0xb0
+			MX6UL_PAD_GPIO1_IO04__GPIO1_IO04	0xb0
+		>;
+	};
+
+	pinctrl_uart2: uart2-grp {
+		fsl,pins = <
+			MX6UL_PAD_UART2_TX_DATA__UART2_DCE_TX	0x1b0b1
+			MX6UL_PAD_UART2_RX_DATA__UART2_DCE_RX	0x1b0b1
+			MX6UL_PAD_UART2_CTS_B__UART2_DCE_CTS	0x1b0b1
+			MX6UL_PAD_UART2_RTS_B__UART2_DCE_RTS	0x1b0b1
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1-grp {
+		fsl,pins = <
+			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x17059
+			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x17059
+			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x17059
+			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x17059
+			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x17059
+			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x17059
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhz-grp {
+		fsl,pins = <
+			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x170b9
+			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x100b9
+			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x170b9
+			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x170b9
+			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x170b9
+			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x170b9
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhz-grp {
+		fsl,pins = <
+			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x170f9
+			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x100f9
+			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x170f9
+			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x170f9
+			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x170f9
+			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x170f9
+		>;
+	};
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-dart.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-dart.dtsi
new file mode 100644
index 000000000000..83da4f9c5588
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-dart.dtsi
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common dtsi for Variscite DART-6UL
+ *
+ * Link: https://variscite.com/system-on-module-som/i-mx-6/i-mx-6ul/dart-6ul/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+#include "imx6ul-imx6ull-var-dart.dtsi"
+
+&adc1 {
+	vref-supply = <&touch_3v3_regulator>;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_enet1_gpio: enet1-gpio-grp {
+		fsl,pins = <
+			MX6UL_PAD_SNVS_TAMPER0__GPIO5_IO00	0x1b0b0
+		>;
+	};
+
+	pinctrl_wifi: wifi-grp {
+		fsl,pins = <
+			MX6UL_PAD_SNVS_TAMPER4__GPIO5_IO04	0x1b0b0
+			MX6UL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x03029
+		>;
+	};
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
index feea24c0e068..8e3c2d72811f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
@@ -2,37 +2,30 @@
 /*
  * Support for Variscite VAR-SOM-6UL Module
  *
- * Copyright 2019 Variscite Ltd.
+ * Link: https://variscite.com/system-on-module-som/i-mx-6/i-mx-6ul/var-som-6ul/
+ *
  * Copyright 2025 Bootlin
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
  */
 
-/dts-v1/;
-
-#include "imx6ul.dtsi"
-#include "imx6ul-var-som-common.dtsi"
+#include "imx6ul-imx6ull-var-som.dtsi"
 
-/ {
-	model = "Variscite VAR-SOM-6UL module";
-	compatible = "variscite,var-som-imx6ul", "fsl,imx6ul";
+&adc1 {
+	vref-supply = <&touch_3v3_regulator>;
+	status = "okay";
 };
 
 &iomuxc {
-	pinctrl_brcm_bt: brcm-bt-grp {
-		fsl,pins = <
-			MX6UL_PAD_SNVS_TAMPER4__GPIO5_IO04	0x1b0b0	/* BT_REG_ON (BT_EN) */
-		>;
-	};
-
-	pinctrl_brcm_wifi: brcm-wifi-grp {
+	pinctrl_enet1_gpio: enet1-gpio-grp {
 		fsl,pins = <
-			MX6UL_PAD_SNVS_TAMPER2__GPIO5_IO02	0x1b0b0	/* WL_PWR (WIFI_PWR 5G) */
-			MX6UL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x1b0b0	/* WL_REG_ON (WIFI_EN) */
+			MX6UL_PAD_SNVS_TAMPER0__GPIO5_IO00	0x1b0b0
 		>;
 	};
 
-	pinctrl_enet1_gpio: enet1-gpiogrp {
+	pinctrl_wifi: wifi-grp {
 		fsl,pins = <
-			MX6UL_PAD_SNVS_TAMPER0__GPIO5_IO00	0x1b0b0 /* fec1 reset */
+			MX6UL_PAD_SNVS_TAMPER4__GPIO5_IO04	0x1b0b0
+			MX6UL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x03029
 		>;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart.dtsi
new file mode 100644
index 000000000000..bb8d392d8f54
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart.dtsi
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common dtsi for Variscite DART-6ULL
+ *
+ * Link: https://variscite.com/system-on-module-som/i-mx-6/i-mx-6ul/dart-6ul/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+#include "imx6ul-imx6ull-var-dart.dtsi"
+
+&adc1 {
+	vref-supply = <&touch_3v3_regulator>;
+	status = "okay";
+};
+
+&iomuxc_snvs {
+	pinctrl_enet1_gpio: enet1-gpio-grp {
+		fsl,pins = <
+			MX6ULL_PAD_SNVS_TAMPER0__GPIO5_IO00	0x1b0b0
+		>;
+	};
+
+	pinctrl_wifi: wifi-grp {
+		fsl,pins = <
+			MX6ULL_PAD_SNVS_TAMPER4__GPIO5_IO04	0x1b0b0
+			MX6ULL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x03029
+		>;
+	};
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi
index f120b1dca75c..0341c181ed8e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi
@@ -2,35 +2,30 @@
 /*
  * Support for Variscite VAR-SOM-6UL module with imx6ull CPU
  *
- * Copyright 2019-2024 Variscite Ltd.
+ * https://variscite.com/system-on-module-som/i-mx-6/i-mx-6ul/var-som-6ul/
+ *
  * Copyright 2026 Dimonoff
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
  */
 
-#include "imx6ull.dtsi"
-#include "imx6ul-var-som-common.dtsi"
+#include "imx6ul-imx6ull-var-som.dtsi"
 
-/ {
-	model = "Variscite VAR-SOM-6UL module";
-	compatible = "variscite,var-som-imx6ull", "fsl,imx6ull";
+&adc1 {
+	vref-supply = <&touch_3v3_regulator>;
+	status = "okay";
 };
 
-&iomuxc {
-	pinctrl_brcm_bt: brcm-bt-grp {
-		fsl,pins = <
-			MX6ULL_PAD_SNVS_TAMPER4__GPIO5_IO04	0x1b0b0	/* BT_REG_ON (BT_EN) */
-		>;
-	};
-
-	pinctrl_brcm_wifi: brcm-wifi-grp {
+&iomuxc_snvs {
+	pinctrl_enet1_gpio: enet1-gpio-grp {
 		fsl,pins = <
-			MX6ULL_PAD_SNVS_TAMPER2__GPIO5_IO02	0x1b0b0	/* WL_PWR (WIFI_PWR 5G) */
-			MX6ULL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x1b0b0	/* WL_REG_ON (WIFI_EN) */
+			MX6ULL_PAD_SNVS_TAMPER0__GPIO5_IO00	0x1b0b0
 		>;
 	};
 
-	pinctrl_enet1_gpio: enet1-gpiogrp {
+	pinctrl_wifi: wifi-grp {
 		fsl,pins = <
-			MX6ULL_PAD_SNVS_TAMPER0__GPIO5_IO00	0x1b0b0 /* fec1 reset */
+			MX6ULL_PAD_SNVS_TAMPER4__GPIO5_IO04	0x1b0b0
+			MX6ULL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x03029
 		>;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart.dtsi
new file mode 100644
index 000000000000..a3fdfb92bb82
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart.dtsi
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common dtsi for Variscite DART-6ULZ
+ *
+ * Link: https://variscite.com/system-on-module-som/i-mx-6/i-mx-6ul/dart-6ul/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+#include "imx6ul-imx6ull-var-dart.dtsi"
+
+&fec1 {
+	status = "disabled";
+};
+
+&pxp {
+	status = "disabled";
+};
+
+&tsc {
+	status = "disabled";
+};
+
+&iomuxc_snvs {
+	pinctrl_enet1_gpio: enet1-gpio-grp {
+		fsl,pins = <
+			MX6ULL_PAD_SNVS_TAMPER0__GPIO5_IO00	0x1b0b0
+		>;
+	};
+
+	pinctrl_wifi: wifi-grp {
+		fsl,pins = <
+			MX6ULL_PAD_SNVS_TAMPER4__GPIO5_IO04	0x1b0b0
+			MX6ULL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x03029
+		>;
+	};
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som.dtsi
new file mode 100644
index 000000000000..f37607fb207a
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som.dtsi
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common dtsi for Variscite VAR-SOM-6ULZ
+ *
+ * Link: https://variscite.com/system-on-module-som/i-mx-6/i-mx-6ul/var-som-6ul/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+#include "imx6ul-imx6ull-var-som.dtsi"
+
+&fec1 {
+	status = "disabled";
+};
+
+&pxp {
+	status = "disabled";
+};
+
+&tsc {
+	status = "disabled";
+};
+
+&iomuxc_snvs {
+	pinctrl_enet1_gpio: enet1-gpio-grp {
+		fsl,pins = <
+			MX6ULL_PAD_SNVS_TAMPER0__GPIO5_IO00	0x1b0b0
+		>;
+	};
+
+	pinctrl_wifi: wifi-grp {
+		fsl,pins = <
+			MX6ULL_PAD_SNVS_TAMPER4__GPIO5_IO04	0x1b0b0
+			MX6ULL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x03029
+		>;
+	};
+};
-- 
2.47.3

