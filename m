Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C971D3E787
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Dec 2025 11:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2F5uXP1gOIQBrzq2hOBarI+Qc/GCCuzwKt4gk60y13U=; b=ZaWiPPT4sEjv7e6c+nkjrcQP4g
	aoiFVpW8pmbEAcVlNbgly7FoCkznGxQ9BFADTkKLb/+bQfyW5oIJ0fTKJLM7CjR07wdRL79SHaPYj
	k6jtMbhvgDJm/fGahziq+6C7wOI6FwdgaOn7KzZnZl2Jl3Ts17gMvXM1Nkehvwe1LbY4Z9JqDuviH
	SUQEpbn0NGJImja9chllaT/nrcKq3dY4rhXAcEEQAiYAdoIMHu/5+T6mJAB14dcwY1OFWYV4vpLdz
	+4jaSD0MGhBCWKX6e3ttR+kJAdrkkxgXr/NnfKNTYQaPWMLdy74KQoONDPQ7bBqlCRKxcEC1TCTw+
	/+pJVXvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUjvM-00000002Nbr-22zM;
	Sun, 14 Dec 2025 11:06:00 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUjvH-00000002NXc-07fv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Dec 2025 11:05:56 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-42e2d5e119fso1133491f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Dec 2025 03:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765710353; x=1766315153; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2F5uXP1gOIQBrzq2hOBarI+Qc/GCCuzwKt4gk60y13U=;
        b=Uax+5i7pca2X1j76QW+ak6AyPrP2WH4gZutHhg+YLVg/d+91zdCIaDEJWm74vdk8Uv
         9W9fLFDecxh7l8TRxsNCFjmiXBgD8qYlApXn9cjwZUzDF4cwBlSKBJLeZbCjChsoYtN4
         1RP5xcqXwn62kJVYVnexXbiOXO2otDsBmAzNyDIS9TD6AnfwyHWFCQpkSeh6oO5Btg9A
         va0Dwz/ITbdDMbRTLF8rWn748pnzcSez/St16/QWS2QTySMeaybI0f4aU2DtvGnKOkBy
         vtF9407r88MD633lrMI5h6SQ3pMLn037SnXK1mD74m3WbLkF9qzRnIqRdbqY8zfk/agU
         aUYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765710353; x=1766315153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2F5uXP1gOIQBrzq2hOBarI+Qc/GCCuzwKt4gk60y13U=;
        b=Uy8kVGcDcMCHpbxkYFXq3DNDPFLzPDdoMipXZO6ATN0qdSYygAm6ndMRt5VH8anbrH
         S2A2eqs1lWrnw8zskqp8+374A0MCER4g/f5e4bvV2x4eH8om8B2MxqsavV8jLz0Als/K
         MeaHeElQqiFggE546MjFnFvHw/4OGa8UpYmCKyXEumzzCtIWqqfr4SXevIlbVN6obv6i
         kPj23oTo58OEKxahiCHC6HvOim2Iuo9rBBpVYo6osNZq9+uadTH/FMsH5YJmEHttE/C/
         UHrDsNPHpeWODDRSxvGBvfYKxpl6mhklh+XfupBWElps3Q1BA45pmUCZP5K766S7iN5c
         W3MQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNSWWXwaYqFlqrFym1deXS0mv5AK3W7LpV6BxjSAaom9lOgmE08YN2Wv+Y20Va+Dvno5P6VSq1hhy2sFUN169V@lists.infradead.org
X-Gm-Message-State: AOJu0YxZZgPTkrGVSr+8NJYT0Ws4FVRmbQ4tczUvhrw7GMEy1zozAIk+
	q3jCLmIK7O9JZk2M4SXX6EJXYh4OJJVwpqZ2P9u63utpoFaXH4N9WSKP
X-Gm-Gg: AY/fxX69JY1BJ0Kh6Ud/2Ez3c+djrF+vL2Fy4qsTmqAYKqcgGsiZJMwqFsoQ6QcPRsh
	e9bcioq7oP3h5H9yTUrLnOKuXPQtXFXSf+5Szq/weZ7NwVvSdvfd4tMNDINHazQ+4OPJCDFdlWl
	i7GvWPhU1xN15JKPN6ucg2jJ1fcPn+rsYhe2+KbpCMZnryQsjtHEkC45K0emF1GjOXNyFz2ijMS
	ZUs5FFRwNpW3ohCC4XlSL7eWC5idoPY1XR03R6We+AJnBn9n6ygNtoJqz5qssOCgX7cqwPR95Zq
	0ALk0WXgDVAAY/JLYmtvd0HPq/5570gYOavLdRSIGYD4v7zOZoezLo04M49+hUAUh5DT6YKt50K
	mqUCj4JHVbH3ILmOBBrH0T7TUiuJPOWaX6R6psPYpXzosjuAPOnh7mEFeN0bi/hlMx/UimrTKaa
	lDvNBCsKy9+eCylf1O/mMrqI8xDntieppb7MpMvbCN40QAjNysfDks9H1o4OnU/6crkLyKUk9LL
	YrqYS6JT0rrJPQ=
X-Google-Smtp-Source: AGHT+IH2w6z+SU0eHU6NOuPA4iQyXCEAi3j85watwL907LSzJ3TbJ27HKuMsKAPlK6Wr9/bCIZ3zVA==
X-Received: by 2002:a05:6000:2585:b0:42b:40df:2337 with SMTP id ffacd0b85a97d-42fb490d6fdmr8806346f8f.50.1765710352872;
        Sun, 14 Dec 2025 03:05:52 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-5.cust.vodafonedsl.it. [5.94.28.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f36b6a19sm7823660f8f.38.2025.12.14.03.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 03:05:52 -0800 (PST)
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
Subject: [PATCH v3 4/6] arm64: dts: imx8mp-var-som: Add WiFi and Bluetooth support
Date: Sun, 14 Dec 2025 12:05:27 +0100
Message-ID: <20251214110531.9475-5-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251214110531.9475-1-stefano.r@variscite.com>
References: <20251214110531.9475-1-stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_030555_113637_F56ACF79 
X-CRM114-Status: GOOD (  12.39  )
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


