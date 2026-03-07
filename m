Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA40FCB63B
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 15:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ppGBOS/6/w1brOm93Ryd65a8gDz63BqR/Ri6xgwGtY=; b=ouaDdZTmAYzlkx1tZIofKkpnla
	iwghW0V2mCZXo5BHVg2yd8ATWh9EoTIdbhRyqyntVOdFvHKeaWm1krpEjAXebHrskj2WxKw8WDCpN
	Xi24C6GAh+Z6bo8a2qM41hlxv5GH02+3WOEJQmeh/qnGMzA/qKCWFRAGbQ3Od0WxdAfQeY7/K0O9T
	7i1FEHXUHyQotjb/UGLAqYD/dGCkSGriDe5JQKjJKNfLbq63Wc69v+0eV0KoAf6uR+j8v9GsDXwb3
	ve25mvEHzDBbp9j+AiuulubxgskmZ0ILeFhfv48glcwp13v4rd2Z03eVq3XQZOcqEgNdVQJZ1HQ/z
	VhZKOzJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vytzx-00000005K53-2yKr;
	Sat, 07 Mar 2026 15:55:27 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vytzq-00000005Jyw-38sY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 15:55:20 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-482f454be5bso104498025e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Mar 2026 07:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772898917; x=1773503717; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ppGBOS/6/w1brOm93Ryd65a8gDz63BqR/Ri6xgwGtY=;
        b=YX94odWka5tjG+4bNmBMbcYK9sA2xJKbAm06Yp22ahF0yVa7jJZwhHRilc2U/jAnsK
         1nSpVGhvxBwLxN6AsilE9GEt7EMOlB9N/hg3kqkscvQiDyKi9KQtzwsptjWdmbvjX5+m
         ywraBR17Zj96ZhX1zCiYx4w4Wr4GUuzWBclRThOpq837MSLUTI8Ny6G516jMMtNFF2Gh
         yyCyhRyh7eH8fw6+BQzkFk56eXQ4rastjS9rMLUWh34B/Qn3hXl1gnUsR1wazxGPHWmi
         XJN4ZTOWyAtTh/28hR4ea1tMyDfH3Twzg2VEyNPYWoUIfs783vHB7GoFSzuIhgSSZxma
         YxWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772898917; x=1773503717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1ppGBOS/6/w1brOm93Ryd65a8gDz63BqR/Ri6xgwGtY=;
        b=o7LtBOmYnvBxX+WkvQmhG+ELtpnWH3j4Jdxzsexkvr1UFiN+DLz6VqLVR9CeE/db6D
         GUfSnbiCZLrWYGFztVp9NkWpAzhJrhE4m7PoVPiPTInyjGY/L6tnV6BW0vKpd9LVp6wI
         kT+Huau1vtgChEVH9MYoTVsbW7U4kXupvPXqo3Yba4papPv2hW5J7aSRqK0NkHZnoIUw
         Nbn+7pL18VkzPnlXD6XT7d39giMo2b/dqvFD2IiDyeyYNc8KFIGfzYOJQnKS9I7MFtzx
         6JpdESpPAMdc+zZZrZw9Q08joK8ArW4ZRAMDztrmBTv3JfdekTBAQqVu5PAxcaAgx7XP
         +aSg==
X-Forwarded-Encrypted: i=1; AJvYcCW9tmA/xIPnj8SQz+nxJs2mP6Y7WVjGtwmgugSypNp9gKaGF/w2V6H5sg4Z2Xp1wy/zH2BTz7PDhcGZ5hFYTgNL@lists.infradead.org
X-Gm-Message-State: AOJu0YxPXQtfI2VA31oMEet1Flw0LhMpV2F/PhmFxFqinKg8JEq4SIVM
	sGWmpnk7VWmXC0EcZ35wqZxMlaerXJQ8o8U1zivmTcHKCezbR0LYQYl6
X-Gm-Gg: ATEYQzxKpWTbuDzfJOMAgLKyX1J/8xz7N0VaYush2rf/k18UKkylqmozO8gHbsv3U0g
	B8qnRbm8kIzesKI+FSe8V8Nu8I3P2NsnSEJaQ2Vmv7Rj2cOOisaLiSMeri2xs0T/ifIoWbFGnyU
	fjQdMat8k/7K5TTfMRkeg8Uhk+Zr8b31dB8P/QXsbm5nAivpYrWhac5UmQyfoZAp3dgenqvFx+H
	1sP3iPGtlrUyE1e+kH5Ppkj2Q4DX9xJ91TJsz3ZJrmerhJt5N5Mu+438Ifdw6M3fm6TKjjLQg2/
	Su8PWVY8+kJvm0M9Xn6K6f8kxWLX6MmbDOAy2zf5AM2sBA6xtoP9QojlbPqjZxno01SM38IL8H8
	IK5PnVYve+/i/7rP35u5/b/kXf7gOPKVeMFOnZOyG7NKDWmm9RH6uQafFyKQlxnxnWLmt3CjY9K
	VbJUSA+cK/g4YuqmfUY9yOFQq0LSqzlMUmlGpFWcdvCEO6Bu1XmnKXD+SMo4N0cRFWgPqwzfK+N
	Wz3Re/7gGyX2HsniktFCpEWAA==
X-Received: by 2002:a05:600c:198a:b0:483:a352:b4e4 with SMTP id 5b1f17b1804b1-4852671c9b1mr93300675e9.6.1772898916828;
        Sat, 07 Mar 2026 07:55:16 -0800 (PST)
Received: from GLaDOS.lan (93-35-179-236.ip56.fastwebnet.it. [93.35.179.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681a3esm261097785e9.4.2026.03.07.07.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 07:55:16 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 05/11] arm64: dts: freescale: imx8mm-var-som: Add MCP251xFD CAN controller
Date: Sat,  7 Mar 2026 16:54:41 +0100
Message-ID: <d007d05d5927820aa06389c07dad55357d5f8d4e.1772898346.git.stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772898346.git.stefano.radaelli21@gmail.com>
References: <cover.1772898346.git.stefano.radaelli21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_075518_901600_65E823B1 
X-CRM114-Status: GOOD (  12.12  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add support for the Microchip MCP251xFD CAN-FD controller connected
to the SPI bus on the i.MX8MM VAR-SOM.

The controller uses a 40 MHz external oscillator and requires an
interrupt line and a dedicated RX interrupt GPIO.

This patch adds the fixed clock, the MCP251xFD device node with the
required properties, and the corresponding pinctrl configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 .../boot/dts/freescale/imx8mm-var-som.dtsi    | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
index 7cedef8add32..21a4d87c0e26 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
@@ -14,6 +14,13 @@ memory@40000000 {
 		reg = <0x0 0x40000000 0 0x80000000>;
 	};
 
+	clk40m: oscillator {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <40000000>;
+		clock-output-names = "can_osc";
+	};
+
 	reg_audio_supply: regulator-3p3v {
 		compatible = "regulator-fixed";
 		regulator-name = "wm8904-supply";
@@ -139,6 +146,19 @@ touchscreen@0 {
 		ti,keep-vref-on;
 		wakeup-source;
 	};
+
+	/* CAN controller */
+	can0: can@1 {
+		compatible = "microchip,mcp251xfd";
+		reg = <1>;
+		clocks = <&clk40m>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_can>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
+		microchip,rx-int-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
+		spi-max-frequency = <20000000>;
+	};
 };
 
 &fec1 {
@@ -424,6 +444,13 @@ &wdog1 {
 };
 
 &iomuxc {
+	pinctrl_can: cangrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO05_GPIO1_IO5		0x16
+			MX8MM_IOMUXC_SD2_CD_B_GPIO2_IO12		0x16
+		>;
+	};
+
 	pinctrl_ecspi1: ecspi1grp {
 		fsl,pins = <
 			MX8MM_IOMUXC_ECSPI1_SCLK_ECSPI1_SCLK		0x13
-- 
2.47.3


