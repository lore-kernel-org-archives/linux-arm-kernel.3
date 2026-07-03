Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F25C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 08:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bOzNAmFCng9YoBdaUUvA3gHi0RfJnoeHmgno7+BaQ30=; b=bXTGqPJd3IDHe0geAgEAvPkO6H
	7h3ModVeGgjLZ8qKYJzsfjowtRMwTc2V2cZhVeuRssQvMAWDBej2HmJiogwEc5F7JnHl9AnMFgDbk
	8kqQFkJuhuw1WCWnCpK6zOdIUt2HCvV57y3qvRG0odnG+NmI0XksARDTadU2O4cM2BPyedbRciNe1
	1LiWO70LcizvYfJZAg3Fjw5n7+67OWaW9W+d5KbIGWwMvdBjg7yjh8p8aOAS9W79MjQ1csIOFfDrI
	kiQ4dVmP3nARLZomf18OY24LbdvRfXGW7+IWxj/b1URLmUaroRGGFLVgUR4iHAaAliCjkAoywcYPF
	U12/2Yrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZXQ-00000006OEM-1xGC;
	Fri, 03 Jul 2026 08:46:20 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZXM-00000006O8B-32WO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 08:46:18 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-474bf35cccdso85654f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 01:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783068375; x=1783673175; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bOzNAmFCng9YoBdaUUvA3gHi0RfJnoeHmgno7+BaQ30=;
        b=VTvR5EEhgEz+becTe2bFq6Yv+6MxsnW1j6XKDbnwu5psqQlcbVa/FNMMMwDarB9f7i
         FfwmnsmVDhQ6oWPmydYRcfLSNY8Fz5sbIvpR6wc3rUwLIvIGJ0p8Fad3XQWaRrHVam0c
         zvFxuSVeYiR3aSVSmT5SZHv0Ji8JLq0joadk4uft7F84nyRjNIK9szYnBXjymy69oGWy
         NE+VKczfA7naR4n1QnNL0ZQe8/yDIuJTQzC9zEVHxIforOhyIfCAJroLTIfIStoVeuv9
         v4hZ3lYeCO+tmNYcaEJ2Wnei6IA1AsWFXlTmgzYuJZMvsCcz2ofp1mr0Xc7GmC6cJ4Ne
         /E1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068375; x=1783673175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bOzNAmFCng9YoBdaUUvA3gHi0RfJnoeHmgno7+BaQ30=;
        b=LVVcnSlq5cuRbl2YZGRsyGeuYeEvQ5mWSvkFgAObaj5+PkK9fo2yGy5/AQ6XaInhCq
         VdrV1gY4a8wiECUaLL1FJl4P/kGD7OzcbYEBbDbo2ERZEcqUFNteaLeC3bU5rQgdpzyd
         ktvSzM31pUYrW7R0VMfQC2dtcque6GhBdQn+WWWDqtUI0D3CdqLFsIqobYQGOrLIzaBa
         6YiwLXlhVTm8HMh4sKQr2AKXuPW3U7f7hyLA41d6p67dYjMHoZUEhiVegWleRrbDm1hi
         6wA8UAC/efnhhH448VmSS1lpilzHtmNqB2YopLRZBzpfwUHCfvYZkR4k0erZp40EWYBk
         WE7A==
X-Forwarded-Encrypted: i=1; AFNElJ/dx9qqjBoUZl3kjYdnIraFNp1+k4PDgzOrVbQQ8fZVKHCSfvIdECEVp4Q+tOtSgTmrhr/2U/zoqA+hB1RBeR19@lists.infradead.org
X-Gm-Message-State: AOJu0Yw23hln5hvEfD+twORebIFB7h04HfZihhRlkMP/TcYo/68vHPzn
	RM8d9XxZ15e7Gi14VzTNIujLCAxonePeqzFGlLxD5ORdjriN3MiDFi+L
X-Gm-Gg: AfdE7clYNyYbs1h1qY0UMHxQo2pvkIOdtvyycM28KJgHjek63YF/SoWiiYCSoAXXJP5
	4F4aiSM6KhSgXf++7YhUUK8kj17+PnJrnlxZkarS1k1Hje0Fr/Dv1mtR/HtwyoSVBU23NhCu+KU
	fXcvkfhm6GRpf9W/dtlA13eIgxXZa91wZjLgpo8GFZPZ2g9F2DNxpWhW/ZKePUFMNWBJxI3pGvN
	6i1bmJwwGz8U9kfipjH0KS3UgFsB2WdCDeNr9pVuN1C6CjcLa6R2vPur9+YmFFZ8HspeT8Fvqre
	XsVnSvLd3mCBJ13iASWtPyqZ6dZskiXt1ugOPxyvTrMlXWgCL80IirlE4unZkpbnRPQnCimPZ/T
	WPxB5vV5fTF5cnIApujf0Md5SmLGJCNkP6aMywxiUcnowBmhpOjiAnEM51escomQH6oZBdBG6Ex
	K3ELUAYhICXHIy7KPGrdETTWRChNCLKdQf/ExHIBMHqjZaUs3hYkZxNRop96mxOh2BFSdZpBXzK
	fhcdkWL31c8QGBTewsFHl7qgIClLAuCnj+d
X-Received: by 2002:a05:600c:8590:b0:490:9588:bdb6 with SMTP id 5b1f17b1804b1-493c2ba43a2mr115054165e9.33.1783068374165;
        Fri, 03 Jul 2026 01:46:14 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cfb6f199sm6335505e9.3.2026.07.03.01.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:46:13 -0700 (PDT)
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
Subject: [PATCH v1 06/15] arm64: dts: freescale: imx8mn-var-som: Add MCP251xFD CAN controller
Date: Fri,  3 Jul 2026 10:45:53 +0200
Message-ID: <f6e7b5679b0ffd1053b8a5263cd5361d4aa99b8d.1783067947.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783067947.git.stefano.r@variscite.com>
References: <cover.1783067947.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_014616_837566_B9ACA845 
X-CRM114-Status: GOOD (  11.74  )
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


