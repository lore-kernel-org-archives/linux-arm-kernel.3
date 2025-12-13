Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68CB7D5B16D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Dec 2025 23:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iLiAHdwLrrTtAb7WXEO2B+WkLRD0WKuXCR00+TEvVdI=; b=uuqjfAuAXDcxqDqaHHtJjwVUsC
	oVKc8FbCZCPMX0eRiiqNlCSqqdofZw+EpM0NLhKCdmwTFrWJapWDRAfmJXzySDChSb1AaJpFxxskI
	nZEyA3mlRincZ+436ia5+ZaWgM175bQWVW/y7qS+RxUpYwi1dUQZrjSJA6KZfJXYugrbob+EW+UK8
	+9LYEaPEsyIjeyZrkdSoJziTNjYhfIMFn6wIMEpCz+msouhjYggyAekPEjRMIq3VWREwt7NmQyqWC
	n4T+0YbKiAvCwdnIGxuFPsZmCVgQjnVUxQ2fzAlugaLH02Szj3JzRNj8azVNp4qaIAL/k6KXAb2di
	cQrjrnzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUYk5-00000001yoi-3xUi;
	Sat, 13 Dec 2025 23:09:37 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUYk3-00000001ylS-060f
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Dec 2025 23:09:36 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so26588795e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Dec 2025 15:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765667373; x=1766272173; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iLiAHdwLrrTtAb7WXEO2B+WkLRD0WKuXCR00+TEvVdI=;
        b=Gr4dzFAdQs1q0FygFl1D3W/a4R2+CpfIQZkcW2jW8yyQkKzZbt71L0u+vwQpTjwoYu
         a6DECPyvpfT2UKxNq0mglhBr7SvGI1UwrS/vw/DaNR4YlCsStBDO0udBYUtod979NZ0i
         Y4b55OreNvEvRPx1r8S/jYE1Uy3+CNtanyqquRQ4pVNfhl8UVoldc+UzGvdyIiQzd57i
         TIYiK9oXr06PDY7CWJMr8OIP2Tu6hs0n0jaE9+frMErlruqGdXLKjr/9V7vr3M1jCtFc
         NxNrRPMgP2D9L28oFDkJ7lmpa534StUmpa3+JNU0E/VZ6NaDSK2QM2fuBb6RY1ad44DT
         wRmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765667373; x=1766272173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iLiAHdwLrrTtAb7WXEO2B+WkLRD0WKuXCR00+TEvVdI=;
        b=ZG1Ha2ZT5dPBkpAyzTnzsuledQsvEmHErfo6tDLxYkLagDM1z1xscOyOxi4E0dLpPJ
         zfQ5OMujRnQLn8AtzunFn/Ib1GVusEZOoq/1ulprDqcfLmbXvXr73uwN69/63mb7e1s6
         V6/8tYQsbAXLeA/yiht4EiQNOHY9Xi3I/DCpfVRhbQr2wheN+fK226iD3Bbo9/gRKCch
         9d3WnmfrM2WdiA3a2DEPsiffdtgw7zkQxndeDnqZYCSo4iDi1Gt4vcnNo7rC1mZf8GHZ
         bt9Wsrs3XFhBG0On1HdVTuddEa6KtBClQBKpsHcFW9/9FKxLaxdEIwpBLLZ7gLwDar6f
         z9eg==
X-Forwarded-Encrypted: i=1; AJvYcCV2Ld/DaerOZd6RawCEFSlw6x1uBSj3wziTNAj2lhYRbUnJnY+HouWO4ohrMwQieyjWcwEPPNC9A/mq8u2a8mxc@lists.infradead.org
X-Gm-Message-State: AOJu0YwS694fygyiRWUI4SVjJGdgTjkA9cokmGtxJPXy5+5jtuYMljfJ
	pF7+lU4obJf8sQcBfRpRqfngtoaZOBbeOm/7ecqXxohCcg7oVcyBGHpl
X-Gm-Gg: AY/fxX5NFmgIOBl7Q5KXsD4svn4PKCzzQmk01EeORxO3zz0BHP9qnds3ym0pTc+n2uI
	SsnK2s+bjg5O9wxzl1UDh9c0leVhjYWd6SdsbKoFKPSS3Sfn1vosHV7I71J4ZUlx5JUTb3oAaII
	IX9WZ1H+cklpkzIknQ426oc7mmfeYippFtpWAspL24Kv/3/liPeYsaLu5KroQZQ6MvoTFWG5y71
	NV+dzn7OYfzqKrV9/g67jLEb9lI+i8QCdYEiwnIwJuM0Yi1uhaQUQdBv8IUL3eudKeiHpyWolRy
	k+noNwA2Ck7hFciq73ui+og8xfETF5AsRyUjK+yrodWx5OzhnribMvRtT8SZtB4U621r4iOe4fu
	Al/TLLiMfA+pv1pZuQvkdKjS2hz4/QEaag+Na2MfZytgJDg+BMl1hqaCsIn4fHqqrGwOD7qji8g
	8dxuxakcq5FhhehL5bh0YnjnqVhpLB6K2OTuexGxYlvbXqLNjrLRFMFNCdgEn1yT2ZpXkxYqmi0
	HMUQ97/i7hu9mw=
X-Google-Smtp-Source: AGHT+IH6niwXjGSgeBp3K1O2l+qN5cvu2ukCARvoS/8//WHx6xKUmx0WGHddFj4pGChWigbfy7f/Wg==
X-Received: by 2002:a05:600d:7:b0:475:dd7f:f6cd with SMTP id 5b1f17b1804b1-47a932e5731mr43201845e9.35.1765667373091;
        Sat, 13 Dec 2025 15:09:33 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-5.cust.vodafonedsl.it. [5.94.28.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f4f4150sm106040995e9.11.2025.12.13.15.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 15:09:32 -0800 (PST)
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
Subject: [PATCH v2 4/6] arm64: dts: imx8mp-var-som: Add WiFi and Bluetooth support
Date: Sun, 14 Dec 2025 00:09:04 +0100
Message-ID: <20251213230909.16810-5-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251213230909.16810-1-stefano.r@variscite.com>
References: <20251213230909.16810-1-stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251213_150935_101510_696E5817 
X-CRM114-Status: GOOD (  11.92  )
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
 .../boot/dts/freescale/imx8mp-var-som.dtsi    | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
index 5bba91dcef17..e7f5ec10cbac 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
@@ -21,6 +21,15 @@ memory@40000000 {
 		      <0x1 0x00000000 0 0xc0000000>;
 	};
 
+	iw61x_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		post-power-on-delay-ms = <100>;
+		power-off-delay-us = <10000>;
+		reset-gpios = <&gpio2 8 GPIO_ACTIVE_LOW>, /* WIFI_RESET */
+			      <&gpio2 19 GPIO_ACTIVE_LOW>; /* WIFI_PWR_EN */
+		status = "okay";
+	};
+
 	reg_phy_supply: regulator-phy-supply {
 		compatible = "regulator-fixed";
 		regulator-name = "phy-supply";
@@ -202,6 +211,33 @@ ldo5: LDO5 {
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
@@ -222,6 +258,14 @@ &wdog1 {
 
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
@@ -256,6 +300,48 @@ MX8MP_IOMUXC_SPDIF_RX__GPIO5_IO04				0x1c0
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
@@ -309,4 +395,11 @@ pinctrl_wdog: wdoggrp {
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


