Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 544F3D59D99
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Dec 2025 21:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2F5uXP1gOIQBrzq2hOBarI+Qc/GCCuzwKt4gk60y13U=; b=MjMyEjN5Y3I1oo8JKkOX1bIEDE
	xAP0mijJ+tVTzk50l2SVvRJVwwK/f5dgaOBqwxLU9NSRrwNdK0yScceHUljA9UEyb3YR0g6MNaSIs
	L+S/YQ35WjRp5553FpiVc7mMfNmHmRsgZ30v9ZtTpW/4Wcn0qvuh2FdLC080PxrCrRfVVxCbFjvtE
	e52n4DQRYMOHNNIHSea4kJDplOEW/QpxmMVFLJIBxgfF7ucSmrglD1UjlCBZjYO0loEbiVurmX/PJ
	OZfIItQofeCfiHiovk1HyCKwWIh0boc/p9bYHi59GvfSrWtDKZJc6+RVxgkMVIrgmCk0/HG6iNpLi
	pNsFNbEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUu1m-00000002l7P-2h9l;
	Sun, 14 Dec 2025 21:53:18 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUu1c-00000002l1n-35FG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Dec 2025 21:53:09 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so36416855e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Dec 2025 13:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765749187; x=1766353987; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2F5uXP1gOIQBrzq2hOBarI+Qc/GCCuzwKt4gk60y13U=;
        b=HBk784JfxAeWHmlqxAd3G2x9VuNUeHaLLG0EqNEJvWVC1+Zek7D+/Jl0wGTceSekM8
         m3LuIwYPpwtWr7gJaHNWnKwNws3gsobB9tLk9J+cQCnmMuVJ2VBkYhKkPn/wTDgYjFjK
         HRSXIz2HpNI0zGaKtkzkClZ8aoFQ3niq54TEjGaOiwmm0zj941GV7lvfzY3AX2KrwBG2
         tl4K90b4Wjn8f8hnZSE8rlLxhUr5yM1aSyxfm0JywXrmj3RSMABGI5jU7QCMqInr/ZQS
         srzHlExTkZpPsqZ74djH92PuvxGVsuhlRnezrDk5bxDoJNKywajdNg1An50GwVSu+dk4
         xcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765749187; x=1766353987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2F5uXP1gOIQBrzq2hOBarI+Qc/GCCuzwKt4gk60y13U=;
        b=gtgkWSbNmT0ug/Be9pD4X6ooFspol/O822wSIiex9AJF2tdlr61TAieDytbB4cz2kP
         nHlPNcrw9H4vi8MVTNTawWR802sQRZXpWk5d0CZWghtyxgGFtqz5j1V9tPWMCyszRXAE
         a6x5Dz9kxNIge30E5rR/f7gcFX6c9pEDXzrAzl/o0L1UnvJKXytaMHkceaAk76sDCGRP
         AOzr4kMA2zPZuZZMBtCjWFBQ+b016tLFrE3WDoPwD0M8UYDvLJTunyKawI1JBvfDJ9qF
         aog+X/8F9sIKS8GwritKSrtU2A0ygML966/lP09s1rJhUBmUhpLuKqJPuLJ2ZrE/NzWG
         Byyw==
X-Forwarded-Encrypted: i=1; AJvYcCWb69Ea4TvUxdIfoJbByZGOb4vj7GaCTwQgGt5fxJag9P5Ap6R60bkmbu9ZXgZ4t7q2fU/faIkc9WHSuk2t7A33@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6CSd2/Lk/NEHcnjONYxyjtJNW+fUMglSEJ4+aiDi+63+monnD
	ItJisOkJOhVbw1lrarKrODZC1z/FavcNE82A/AI7nj52BtzTJKcOwvshAa1w18YR
X-Gm-Gg: AY/fxX70TNh1MbAO1IqeMadvCFNo1ed1I6gJ7LQRxDoL0CZQAL6CbiMyqCd3us7JSy+
	ZmOVf0qWND9gGGTI/zr6alVqJ6QyO7pNb+8jDZ6/GkqWTz/VwhvmzONMLqTWsvDgDeHKXkQ8PFD
	T/nl+yVCv3EJE053XYZiuTysV2tJYPV5mI3sck4ylhuJ/cw2rYtFAIF4NHPED2vAZU0w8f09CNt
	JNwo1mtR2E5IXuRVRiVhtGt0mFjIaXHT7EwXmZ+edKEk7zXwyHLU7PfuWgSLSt6dbSognfkHeQJ
	APHIp5j2uhckXgpEkWVcbop1UovWKbSbMFghos4fM812F1In9luPyj1IWUXLY8FgirPmR74v+W4
	sia3v9l45iiLEoBxD/uJZ15KQ26mTcBcwe1QjiOArWVAfvu1WeoPSD3++ZlZJK6RBBkqwkxk8b9
	/61tOk1lZYCWzX2HlAd1s8V+hqU24Fr68KR8ppltWSsSCeeaK2DMWYA1eGryVaomZqC4jMUI07V
	LNiK+1T9ksohUA=
X-Google-Smtp-Source: AGHT+IH5q/7aBvJPjnjOG7E6nhAeBZKXJqEYSxCBGInW+6pZRSupN9zJSXDFPB84qoKhL9ZS6X1B5g==
X-Received: by 2002:a5d:5d0e:0:b0:430:f3ab:56af with SMTP id ffacd0b85a97d-430f3ab5950mr5281059f8f.48.1765749186695;
        Sun, 14 Dec 2025 13:53:06 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-5.cust.vodafonedsl.it. [5.94.28.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f6a42c8csm7625568f8f.16.2025.12.14.13.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 13:53:06 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 4/6] arm64: dts: imx8mp-var-som: Add WiFi and Bluetooth support
Date: Sun, 14 Dec 2025 22:52:51 +0100
Message-ID: <20251214215256.5812-5-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251214215256.5812-1-stefano.r@variscite.com>
References: <20251214215256.5812-1-stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_135308_818385_C5F662EF 
X-CRM114-Status: GOOD (  12.29  )
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

Add device tree nodes for the WiFi and Bluetooth module mounted on the
VAR-SOM-MX8MP. The module can be based on either the NXP IW612 or IW611
chipset, depending on the configuration chosen by the customer.

Regardless of the chipset used, WiFi communicates over SDIO and Bluetooth
over UART.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx8mp-var-som.dtsi    | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
index 5bba91dcef17..2c49d53e30c3 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
@@ -21,6 +21,14 @@ memory@40000000 {
 		      <0x1 0x00000000 0 0xc0000000>;
 	};
 
+	iw61x_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		post-power-on-delay-ms = <100>;
+		power-off-delay-us = <10000>;
+		reset-gpios = <&gpio2 8 GPIO_ACTIVE_LOW>, /* WIFI_RESET */
+			      <&gpio2 19 GPIO_ACTIVE_LOW>; /* WIFI_PWR_EN */
+	};
+
 	reg_phy_supply: regulator-phy-supply {
 		compatible = "regulator-fixed";
 		regulator-name = "phy-supply";
@@ -202,6 +210,33 @@ ldo5: LDO5 {
 	};
 };
 
+/* BT */
+&uart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart3>, <&pinctrl_bluetooth>;
+	assigned-clocks = <&clk IMX8MP_CLK_UART3>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
+};
+
+/* WIFI */
+&usdhc1 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_wifi>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>, <&pinctrl_wifi>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>, <&pinctrl_wifi>;
+	bus-width = <4>;
+	non-removable;
+	keep-power-in-suspend;
+	mmc-pwrseq = <&iw61x_pwrseq>;
+	status = "okay";
+};
+
 /* eMMC */
 &usdhc3 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
@@ -222,6 +257,14 @@ &wdog1 {
 
 &iomuxc {
 
+	pinctrl_bluetooth: bluetoothgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_DATA7__GPIO2_IO09                              0xc0
+			MX8MP_IOMUXC_GPIO1_IO04__GPIO1_IO04                             0xc0
+			MX8MP_IOMUXC_SD1_RESET_B__GPIO2_IO10                            0xc0
+		>;
+	};
+
 	pinctrl_eqos: eqosgrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC				0x2
@@ -256,6 +299,48 @@ MX8MP_IOMUXC_SPDIF_RX__GPIO5_IO04				0x1c0
 		>;
 	};
 
+	pinctrl_uart3: uart3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI1_SCLK__UART3_DCE_RX                          0x140
+			MX8MP_IOMUXC_ECSPI1_MOSI__UART3_DCE_TX                          0x140
+			MX8MP_IOMUXC_ECSPI1_MISO__UART3_DCE_CTS                         0x140
+			MX8MP_IOMUXC_ECSPI1_SS0__UART3_DCE_RTS                          0x140
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK                                0x190
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD                                0x1d0
+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0                            0x1d0
+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1                            0x1d0
+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2                            0x1d0
+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3                            0x1d0
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK                                0x194
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD                                0x1d4
+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0                            0x1d4
+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1                            0x1d4
+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2                            0x1d4
+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3                            0x1d4
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK                                0x196
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD                                0x1d6
+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0                            0x1d6
+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1                            0x1d6
+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2                            0x1d6
+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3                            0x1d6
+		>;
+	};
+
 	pinctrl_usdhc3: usdhc3grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK				0x190
@@ -309,4 +394,11 @@ pinctrl_wdog: wdoggrp {
 			MX8MP_IOMUXC_GPIO1_IO02__WDOG1_WDOG_B				0xc6
 		>;
 	};
+
+	pinctrl_wifi: wifigrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_DATA6__GPIO2_IO08                              0xc0
+			MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19                            0xc0
+		>;
+	};
 };
-- 
2.47.3


