Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A68E4C44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LbKx4UdJngIHDfVXCfQYXIxFv5ahfIStqyAOLEiYvps=; b=zRK2/+NFdIRW4X6ZtDI/7amund
	1/vg+cfY312xnry3WIKCBhBI5OMvmFC4Wd22r6O2uSvdDMl8DRiLW3ZV2jo2CKkCtsa4vMr3Sr+W+
	a2g/5Bdafoo4a3PVRyPVmK99pCeCg0uswGhcgS2f6O7v/UNTEVm+cbzTx19RWMaWuPQ8TsBsGFuOL
	e1u3jymp+6x24DuVk6YGyGOLff+Xwu6wxa6XZJVUhidmaWkqmvIk/2Y05MZ/bpORtPVfTuxlW5n3w
	6ZG68TGwk8htrzls+TGj5H+gZA1AL06rqgEoJoK3PLyv4+6iY8vA3ZXVQfzYxoMnM7N8/Ix2MV9qo
	3BHDbIvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfjD-0000000C3Fk-3xEV;
	Mon, 06 Jul 2026 09:35:04 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfj9-0000000C38k-25NF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:35:02 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-493bab44440so14490025e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 02:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330498; x=1783935298; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LbKx4UdJngIHDfVXCfQYXIxFv5ahfIStqyAOLEiYvps=;
        b=W6i/KWSwmQ4/0JGCtC5dzdglYZmerCxOn8GM1tBKMRdBBS70hH25joRtpv0b8AVZmQ
         c3drvdYksx6a40EAh7TBBTUnuLDVaJxoQZsOb74/YGedfPKgQKtEO8UC+oeGXD60VaAI
         vR6y1Wo+1MDcx6gpnIWSOrE7R27BO5tIT8zJzVOXa6KbXUc9PrfzV96x18ux4kQq110D
         Qg3gxXNFxGzVfCfW9Pzn4kL7uRMP9YyFmk2c67RF+yhT6GgiLkK8VAgS1iukZiPPa8sz
         WRyMLqHK0c/TTFl08Y0uq5eZFAiewj9rAi+Cew+V0eM6rqQD39IHK/FUTF1uYPfZ91Cy
         u8Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330498; x=1783935298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LbKx4UdJngIHDfVXCfQYXIxFv5ahfIStqyAOLEiYvps=;
        b=Dw4Rswzw62mbZPGJAMyka+l5p5IXq/XnHois6zNKUUhZ0BV//14hmkr2pMygO4klA8
         QsCSX2zm3UtwzzUWc6Q+loUAqmr3el4cz7VTqqqMS8vjYeeDQUY0H4KcI1zBk9of6xtN
         +gJC+CSd1jEdMAUpiGWvZI3y8DBQ8bOGFRaHiFh9B4kARD4QAHLmiuSy/YowX9DH8hea
         sLiMKgUxy/4/U98EbjjNugpLNGzBBXhJbH/XroP2CxFoWV8p+ln64RMRAIri6QmGY9U7
         7tv+hD3PbzRKbRpGJF+x6zXAN+XGmJprzs7Kq1bMyTaNY2SYd6xHHipelGFxUOeChoDQ
         Xxyg==
X-Forwarded-Encrypted: i=1; AHgh+RpUr0IUQ4lmdw7I4YX6x3CH5HtyG+7AgvkqHFMQMvZerAHAOCLC5PK7OY8jhHkm0PXyQ4dIlGFcZnLeAkiMji0i@lists.infradead.org
X-Gm-Message-State: AOJu0YyxkSlc5QlRuNLWHrZL1X7kd342WcKVjEtuJCdDXtdHHsFXwmPX
	e80FzBovW0uEpMNeldsTvvUU5PJQlX0Ro2CEEe6YrokiWONylLMhtbU5
X-Gm-Gg: AfdE7cn2TJgT98O/KtN9b/hvYC9GMovGRYD9KRRv6AinpCiirZGDt5T5P2NVGtc26pl
	XS87Td1fOfSUeXPA5tUCtmkVtVBpNgwS7TFekF4jf7SKuRrpBjUZEdVyyEApB5Iv97rC7qhDADK
	wPtFiGyK//mZWuFe8CfjxYqO8Zu2trqOh1u5h5xYzWx0Pkjf2N+3mCzegLP+ZI/uS7IpLHvPK8K
	Hniz9k8Ymq0nXsyG624/9S+obFCZoY80E90sV+VtZHukQMmzC7DnEj+8Tmmldyqrm49lFs2706q
	Z8jHt5hZy8ClW9fvQ2IQEOaUSeImlg8jGXy1nhAsACjMHWd7/r4ZvAOU2yEUk0835jkRKJ1HiD9
	IKh7t57iROu+0xyTCdrg9dFak+RxOV59ztpDmd58uP6oGzIYyNSeCLiVM/BVmiLhtR3ALKwLbUf
	f6jfg292yjuA2iZn1JxXLqQi3hQHPgSqev39XBl1nAvrOKprCp9mrCrQbhEvw+I0GVQEa1U+LrR
	upHI862/1E5pkBjMUWykNi2nw==
X-Received: by 2002:a05:600c:8489:b0:490:b26c:64ad with SMTP id 5b1f17b1804b1-493d128b664mr87032755e9.5.1783330497687;
        Mon, 06 Jul 2026 02:34:57 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6375764sm314379715e9.5.2026.07.06.02.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:34:57 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 06/15] arm64: dts: freescale: imx8mn-var-som: Add MCP251xFD CAN controller
Date: Mon,  6 Jul 2026 11:34:36 +0200
Message-ID: <ad528d193a9b2eaba700efc7374dd9ea90dd2dbc.1783330236.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783330236.git.stefano.r@variscite.com>
References: <cover.1783330236.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_023459_551774_D9C5CE24 
X-CRM114-Status: GOOD (  12.14  )
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

Add support for the Microchip MCP251xFD CAN-FD controller connected
to the SPI bus on the i.MX8MN VAR-SOM.

The controller uses a 40 MHz external oscillator and requires an
interrupt line and a dedicated RX interrupt GPIO.

Add the fixed clock, the MCP251xFD device node with the required
properties, and the corresponding pinctrl configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../boot/dts/freescale/imx8mn-var-som.dtsi    | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
index e2e04ad2fbb6..ac22dd3e6542 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
@@ -11,6 +11,13 @@ / {
 	model = "Variscite VAR-SOM-MX8MN module";
 	compatible = "variscite,var-som-mx8mn", "fsl,imx8mn";
 
+	clk40m: oscillator {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <40000000>;
+		clock-output-names = "can_osc";
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0x0 0x40000000 0 0x40000000>;
@@ -130,6 +137,19 @@ touchscreen@0 {
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
+		spi-max-frequency = <20000000>;
+		microchip,rx-int-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
+	};
 };
 
 &fec1 {
@@ -391,6 +411,13 @@ &wdog1 {
 };
 
 &iomuxc {
+	pinctrl_can: cangrp {
+		fsl,pins = <
+			MX8MN_IOMUXC_GPIO1_IO05_GPIO1_IO5		0x1c0
+			MX8MN_IOMUXC_SD2_CD_B_GPIO2_IO12		0x16
+		>;
+	};
+
 	pinctrl_ecspi1: ecspi1grp {
 		fsl,pins = <
 			MX8MN_IOMUXC_ECSPI1_SCLK_ECSPI1_SCLK		0x13
-- 
2.47.3


