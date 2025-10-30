Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCCE5CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 12:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RU/IFjxmC5UzobtaqwaIgLh+ViOP+BMDNSNp906n97k=; b=s4yhMNCWIz2b4Z3b0nQ/tLb3QS
	xffU/1eZkuCiGAneP/1cOC81RBZw6IKJrHkCd5IggugSbRK9rPvObItDXqC5Wu0EMfKHP7SvccZGw
	oHRPyoD0YXkPfI7UX7Qmjm74OiXY1MIYMI9VajLbCeGtc933lVy/Jd6ZnNS/+5aC9hT/7zzhOFpBl
	y9oJEtVuoKeCeal9Pyt+pheV9L/zHRyZRpwhVr8+DySUJE89+vG4knArkVpjNsMkXgvJvHPs346NE
	rEGO3S9wA71Ynx+QBPIeMO0XWdRsWGSBkMYTlsjIaruWqTHiXPwAMVzex0D0NOKKOkdT/RhocEhVi
	UyITG/7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vERMf-000000045Ak-3jHy;
	Thu, 30 Oct 2025 12:02:49 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vERMd-0000000459g-2tOh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 12:02:48 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4710683a644so9918045e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 05:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761825766; x=1762430566; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RU/IFjxmC5UzobtaqwaIgLh+ViOP+BMDNSNp906n97k=;
        b=YiRgx3XvE6KUNQUuEDRG4+3ch2Yn7nZYW4ifJR22sdfjropYpXvnLddzFKAGIZWo/m
         /7R39vviPchn6rqzyIn5hpvLgKIdoSHXa5U7UY5xDNnNkpe1jPw4ysXIkrU368wF9se7
         3Eu3YEqltUmDBA1cfnKBZJ8zoHh25iqyJZ5go6LCQTXPa6fcmmg4w6/VonRxTjhiKc9v
         z9GPYzdp6gLxhOB5/mVn0GQstyfxY82rsYhlVGnF+9nl2K4SYPsBrz1DyQHk1RkOHUGB
         Ca2RQ4K+0OHOHWphQlYxw3jlZU7608HyvxwGKgNVI79ca6J0qTnGvvIrGjEdWO/r0tWp
         8y9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761825766; x=1762430566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RU/IFjxmC5UzobtaqwaIgLh+ViOP+BMDNSNp906n97k=;
        b=W3215ll3JcSTwjsT9hRCp9Eb2XzFA8pccetQc20Ll8QVQLa+b8OIuGjVAemnu/qtsW
         7JZQ1KeLk8rUbFDZNZW4qGXY06z7pjbRMmTsOET5gN+BNasdCfN6kcewvcB4vRRqP287
         BFVqL8ks74PhgQ2aVLjnVNJOxMLkdSmRau/+0a0f0Ofq7WCTvJZOeKrd1RYA/sbMqBMc
         nnXUx3/l40WvTA1OBH4pKJ1D92M75SNoxB5izihzUKWNV5fA3nnM84AtXRqLvYB8v7/J
         MA9wMyju7qybu/Yh9pslI6D2CkZhlOUhrs6rCWB7e7f+fHmtsx74HbKqLPho9MTD8k4e
         9S2g==
X-Forwarded-Encrypted: i=1; AJvYcCUSZXMt9DF2TYXBb5ivy6JaJ7FSUg5Yf/Nt+Itqp4TTPH4gaq/bPAbYkygj87yOiwu5MfGUaJ3DwQovzowwJ3MJ@lists.infradead.org
X-Gm-Message-State: AOJu0YztqpOn818NV8vbywFHg3g4/w9hFVwgUzWWRf6BXqZlHFy/9BwB
	BC2LLymanWkgXpFqdNS/f1MNdple/vLoS1MwG1nBOFB4jLhTBSKoo0+6
X-Gm-Gg: ASbGncucC3vqT/wPehupnrO6WYgCfnhUOKfpc6mfBiCe2yet723aq0tK50n3a0k8mk8
	QR1xLqYmlzwQQaN72oF5wJDN6RL6n/oL4rBdejOwiVDfd9v3HEqHaG89k6jEjq/RY6n8aQ2UYs4
	Tq+/9FGQGhzk4Xxq51OIPZGNFPUl1R0wwWCMWEWE6v7OhyUQnozg1VA8Pi5HbwRyiYsRGHT1w+K
	KiKAC4YpKGUGGEUnnXrMwrDDhiTA3Dlr12AhMlFXf3K1+aHydgq5fEV3zIV2qKfm3cldOjEZv1L
	Cj0rsOXBLOt/uD7vCwOv1o74clYYUdygIs7uLsRNP7jdDRyGyIHfO4cBDu9i2XlrxZVUJiFmaqa
	r6yd0ZZhjs53mx7dOwrM+odTKDm4Eux3lQs2qqycQ/NQrm4x5VTibBd8py5WtKH0cY94ze0WH3O
	mBBhQUoDhhC9dimG3NQdo4gyhsOPseM0inY1w5AiTyfOC/qSwyQfSH1fq/mIkQHyIfWw13+ZNU
X-Google-Smtp-Source: AGHT+IGF+6bOCrVb3+3E532mSpXBs3rQ5f3sWNWs1oBDAb7QHFohBiPTXpW2jdZsUENdcJwLMcPkBw==
X-Received: by 2002:a05:600d:830f:b0:477:ede:d2b4 with SMTP id 5b1f17b1804b1-47726263362mr19710395e9.9.1761825765597;
        Thu, 30 Oct 2025 05:02:45 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-146-98-100.cust.vodafonedsl.it. [93.146.98.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429b9b436efsm2399848f8f.23.2025.10.30.05.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 05:02:45 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/4] arm64: dts: freescale: imx93-var-som: Add WiFi and Bluetooth support
Date: Thu, 30 Oct 2025 13:01:21 +0100
Message-ID: <20251030120127.509933-2-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030120127.509933-1-stefano.radaelli21@gmail.com>
References: <20251030120127.509933-1-stefano.radaelli21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_050247_755111_46802E11 
X-CRM114-Status: GOOD (  13.27  )
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
VAR-SOM-MX93. The module can be based on either the NXP IW612 or IW611
chipset, depending on the configuration chosen by the customer.

Regardless of the chipset used, WiFi communicates over SDIO and Bluetooth
over UART.

Signed-off-by: Stefano Radaelli <stefano.radaelli21@gmail.com>
---
v2:
 - Fix pinctrl alignment

 .../boot/dts/freescale/imx93-var-som.dtsi     | 94 ++++++++++++++++++-
 1 file changed, 93 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
index a5f09487d803..37f7837fb5ac 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
@@ -12,7 +12,7 @@ /{
 	model = "Variscite VAR-SOM-MX93 module";
 	compatible = "variscite,var-som-mx93", "fsl,imx93";
 
-	mmc_pwrseq: mmc-pwrseq {
+	usdhc3_pwrseq: mmc-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		post-power-on-delay-ms = <100>;
 		power-off-delay-us = <10000>;
@@ -70,6 +70,18 @@ led@1 {
 	};
 };
 
+/* BT module */
+&lpuart5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpuart5>, <&pinctrl_bluetooth>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
+};
+
 /* eMMC */
 &usdhc1 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
@@ -81,7 +93,27 @@ &usdhc1 {
 	status = "okay";
 };
 
+/* WiFi */
+&usdhc3 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	pinctrl-0 = <&pinctrl_usdhc3>, <&pinctrl_usdhc3_wlan>;
+	pinctrl-1 = <&pinctrl_usdhc3_100mhz>, <&pinctrl_usdhc3_wlan>;
+	pinctrl-2 = <&pinctrl_usdhc3_200mhz>, <&pinctrl_usdhc3_wlan>;
+	pinctrl-3 = <&pinctrl_usdhc3_sleep>, <&pinctrl_usdhc3_wlan>;
+	bus-width = <4>;
+	mmc-pwrseq = <&usdhc3_pwrseq>;
+	non-removable;
+	wakeup-source;
+	status = "okay";
+};
+
 &iomuxc {
+	pinctrl_bluetooth: bluetoothgrp {
+		fsl,pins = <
+			MX93_PAD_ENET2_MDIO__GPIO4_IO15		0x51e
+		>;
+	};
+
 	pinctrl_eqos: eqosgrp {
 		fsl,pins = <
 			MX93_PAD_ENET1_MDC__ENET_QOS_MDC			0x57e
@@ -108,6 +140,15 @@ MX93_PAD_UART2_TXD__GPIO1_IO07			0x51e
 		>;
 	};
 
+	pinctrl_lpuart5: lpuart5grp {
+		fsl,pins = <
+			MX93_PAD_DAP_TDO_TRACESWO__LPUART5_TX   0x31e
+			MX93_PAD_DAP_TDI__LPUART5_RX            0x31e
+			MX93_PAD_DAP_TMS_SWDIO__LPUART5_RTS_B   0x31e
+			MX93_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B  0x31e
+		>;
+	};
+
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
 			MX93_PAD_SD1_CLK__USDHC1_CLK		0x15fe
@@ -123,4 +164,55 @@ MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x13fe
 			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x15fe
 		>;
 	};
+
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__USDHC3_CLK		0x1582 /* SDIO_B_CLK */
+			MX93_PAD_SD3_CMD__USDHC3_CMD		0x40001382 /* SDIO_B_CMD */
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x40001382 /* SDIO_B_D0 */
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x40001382 /* SDIO_B_D1 */
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x40001382 /* SDIO_B_D2 */
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x40001382 /* SDIO_B_D3 */
+		>;
+	};
+
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__USDHC3_CLK		0x158e /* SDIO_B_CLK */
+			MX93_PAD_SD3_CMD__USDHC3_CMD		0x4000138e /* SDIO_B_CMD */
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x4000138e /* SDIO_B_D0 */
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x4000138e /* SDIO_B_D1 */
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x4000138e /* SDIO_B_D2 */
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x4000138e /* SDIO_B_D3 */
+		>;
+	};
+
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__USDHC3_CLK		0x15fe /* SDIO_B_CLK */
+			MX93_PAD_SD3_CMD__USDHC3_CMD		0x400013fe /* SDIO_B_CMD */
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x400013fe /* SDIO_B_D0 */
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x400013fe /* SDIO_B_D1 */
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x400013fe /* SDIO_B_D2 */
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x400013fe /* SDIO_B_D3 */
+		>;
+	};
+
+	pinctrl_usdhc3_sleep: usdhc3-sleepgrp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__GPIO3_IO20		0x400
+			MX93_PAD_SD3_CMD__GPIO3_IO21		0x400
+			MX93_PAD_SD3_DATA0__GPIO3_IO22		0x400
+			MX93_PAD_SD3_DATA1__GPIO3_IO23		0x400
+			MX93_PAD_SD3_DATA2__GPIO3_IO24		0x400
+			MX93_PAD_SD3_DATA3__GPIO3_IO25		0x400
+		>;
+	};
+
+	pinctrl_usdhc3_wlan: usdhc3-wlangrp {
+		fsl,pins = <
+			MX93_PAD_ENET2_MDC__GPIO4_IO14		0x51e /* WIFI_REG_ON     */
+			MX93_PAD_SD2_RESET_B__GPIO3_IO07	0x51e /* WIFI_PWR_EN     */
+		>;
+	};
 };
-- 
2.43.0


