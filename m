Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC20FFCC06B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 19:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nQRz3vom4i98v5hOr3xa41qzBpQfTuX5yERFzQc6reQ=; b=o0mh5TRfg/gP2OQZLIHIqRu53R
	LBdK1hoGrY8KHsBVlH12Z1ywILrR3iu/2i5RATbdx0pM8C5eZhb+/GWkx/Lyabo6zdmAOShPsZUkJ
	pbTIRPK9N2e36MGDl5ZLIpqC+PwmqXcJg77aC2w/YsoPmTLC8L4vSdvc87zd+r67U2dvaZynRwgGl
	mpM389l2X/gWew/82GJ3o5NVVEIYQ8ODwO8i/h4w166mxktTzjeFrMvbVHd26Xew2hSqeSgguiuFD
	rM9W6z6BYqfMzigMD9ymQdEnWLEFlbQUSSRgbGP5Ujf9IXSLHUhtKyKcg5wCXUfDfFnQRkGvUqRLA
	jm/v2IWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vybJz-00000004Qfw-1P45;
	Fri, 06 Mar 2026 19:58:51 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vybJu-00000004Qb7-0xp4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 19:58:47 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso84922355e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 11:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772827124; x=1773431924; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nQRz3vom4i98v5hOr3xa41qzBpQfTuX5yERFzQc6reQ=;
        b=ItrowJE//veRsZ7AKm+mgSr5924DF8oWdnNfumKhmzqcz9/6wjMJxoSBfIiUPWYdQF
         8+3YeavJBcdgFGyFONbu3YySt35RbDVpwuynjVB8j7HSv7D7p7snh8WgtToXwgZOMErW
         AvwFKZ+kUBYHfdvm9V6ULygTjzWJxzByEELL6DbbRprVVRkX26NvkgLzPhsbQYJhrQM6
         vYGhy1M+almUt1kV2Hn4to4B/DsCEGpHnzETej28QJ8RvsJkzDnmwHxVsqk8byh8LNgr
         t3X9l59/Hu7xuqX5P5e0b+B7H9iA2CQRX+NkkO0/NPnmkfKLLZxNBqvQwN6iJ2JN9RAG
         +ZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772827124; x=1773431924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nQRz3vom4i98v5hOr3xa41qzBpQfTuX5yERFzQc6reQ=;
        b=hcLexVf6RdrilNt3oNLmnCxSgH1kLdK7nCMLQtKmiFgMWRpzkSNb7ZyYA847GKr4zy
         wWnzttyFci3J/uI4JX5ohmRAhW+OwUNyMiIM8vYv0fGxfO/DIRf42TrwmR0T3TQD7xZG
         6CNVJrYEgvBuiS/J06GI11CKcNDYS+p/oLlo+IUmh3HDyUc4Ln1lc6nvbkJdd9W+s5Q+
         V4UxUd5fYzzSEvvCOfd4DJY8Wr64Mp5inxrlmVjI+IqjvCdtM3xsc5XA5jP44xqd0I5L
         +6qCItbl/wMyI0kxhiXd0rm0E1wTxxzb6zutz2qtfoTwXwDtCf/m78Q3SqDt3u27yb4C
         af1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXkXf4lz1K47HfM2zXVWmmWWhOG+ZX7poTMKrDSiEjuH7oAF7S0fazBCdC38Wb2aWHSv2Vxy32IwD0arGwYDkwt@lists.infradead.org
X-Gm-Message-State: AOJu0YwsYgorm2thU7Zr/yhmHHT0N3erm7/VNVRnDv0O/aBMvufo1Urw
	ix0aceu+ojHkD2EKhEbLxqVjZ9opQfL+r4wlUXiKZFf8JomUUcGetrP0
X-Gm-Gg: ATEYQzzAvw8cDHLHyLoph+YJYLj9tVTtPIz1mfDF8RxF+AbsuEMpB5QBV5NZkCOlzGx
	8QtCk3khprIjXFkHbc6+8HbTHX5QZ1v0D8pQVMSuSSN2iiNKMtuIEK5dBnPgrYO1gAYjJ4CinWP
	bCLaSiO2lvb8BXfhuTfipJ1eHsow8tL0IimVaWrB2c722KM6WcjdJLG9Do5NyRHPnlAWs6gjQH1
	HHN5MX+Y6oCKkolHw3sP4gSCjzEzB9lhr0jO4G+odODe/Fx+qgbXC+7A4hVAJJHOgJRlGtIM4nw
	zYac17Vka+0A6tb6X2oEtxeJPGDu5YGhJnTH6pJchJsDmIe2vDhSWBwPMQiynVO36P9EtxxbB+t
	TWMyz028imTFx6W5chNJjapnFD4Rss3/HQFfy8Gs/azq8/YbMentrXaZ//oHZHiW6z6sClS6Pu+
	oSvASZ8vV8HHpgq+mKYc/mofYsMP24qVtMmbd4XGS5uefnsUZ6NC+lQUb7Zw8AxTaxpjzOjJNMC
	yV7YM+7ucKtI0w2QN2+BX/y7d/cZGLq7TeYbbc=
X-Received: by 2002:a05:600c:3b17:b0:483:64b4:79da with SMTP id 5b1f17b1804b1-4852695d236mr59709085e9.26.1772827124293;
        Fri, 06 Mar 2026 11:58:44 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48523803b5fsm25167265e9.7.2026.03.06.11.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 11:58:43 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
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
Subject: [PATCH v2 05/11] arm64: dts: freescale: imx8mm-var-som: Add MCP251xFD CAN controller
Date: Fri,  6 Mar 2026 20:58:24 +0100
Message-ID: <d007d05d5927820aa06389c07dad55357d5f8d4e.1772826534.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772826534.git.stefano.r@variscite.com>
References: <cover.1772826534.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_115846_286315_135E8E1D 
X-CRM114-Status: GOOD (  12.20  )
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
to the SPI bus on the i.MX8MM VAR-SOM.

The controller uses a 40 MHz external oscillator and requires an
interrupt line and a dedicated RX interrupt GPIO.

This patch adds the fixed clock, the MCP251xFD device node with the
required properties, and the corresponding pinctrl configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
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


