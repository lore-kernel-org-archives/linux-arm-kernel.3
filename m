Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9452CC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 21:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4oiYd0WO1dyBDehb+76+lvXFrBgYYtMGun3ipOfIIKU=; b=iFpxok1VVGWxS6+Dgg//ZYwQM8
	IkeGrnGspOfe5SNmYSyvfTOjQQyTLDGYPXAyrMWpWbdsE0GqZnsQKk0a38OuC2o+PzX25d8VH+BNP
	ZAmK+rL+OlEKxDwwxL1FO8ZBvS02qDUoEhi78mbAyTpZUtJ97LQTgbiW/V+Q9Q4DSK/iMGvnXvEn3
	TVwblTZzAORl2Bu4vKT41T+K9HHmSFkgK7/swA+0LNgJsnW1vqS3ASzfqlPAvLl7y2CoKWVMumMM/
	P6OBHhXpu1jzPFWqZnakdq+2pAu075iGj4Tzs8zX3udqdypQJX/vjRTMI2Np8hQLraIN7tX1pAtEf
	ipHuCvjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thbWo-00000001XF4-19yp;
	Mon, 10 Feb 2025 21:41:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thb6b-00000001SVB-07v8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 21:14:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1739222052; x=1770758052;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p8EM3OYRWcrCb8EXs2uauOw4xPx+f4SxoXq7GIVo4uI=;
  b=GfOtBYz0Fh83r5VAk1m+k+XC+zfWyTZmFYN4U/t9UrX9n3EFjuFO20DL
   mCbfhMZZ/PF9fbFZf22Jvjfo1nRob+coe1aya+guBxYTxsR6AO5a0daob
   vnvFu6jLoYIU+zUU4VGkmoaY03s9FrC+Gkr2vnaulUOxRUD1pVN4BZn2s
   MwxTrlnaxNw4ywf5jAuVK5xyvBxPfbYHnJlfjC6h0vNKvl3ceDXhBoc8a
   4fFo+w7v0viHQz9vJwfFuWqnRo0dSA1qzM5tsJvgrXitsB+VXbySDSNTX
   cPGOhHW2uuTnGf8FYcVeNwjoQCVz9v0zdVbpf2r+OaUkBiGdoyBijQnpE
   Q==;
X-CSE-ConnectionGUID: AYqW9AG9RbOJ2Xf8Pt97Yw==
X-CSE-MsgGUID: GO8bNwHTQJWiQJPTzuOfGg==
X-IronPort-AV: E=Sophos;i="6.13,275,1732604400"; 
   d="scan'208";a="205027993"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Feb 2025 14:14:07 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 10 Feb 2025 14:13:47 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 10 Feb 2025 14:13:47 -0700
From: <Ryan.Wanner@microchip.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <claudiu.beznea@tuxon.dev>, <sre@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<p.zabel@pengutronix.de>
CC: <linux@armlinux.org.uk>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-rtc@vger.kernel.org>, "Ryan
 Wanner" <Ryan.Wanner@microchip.com>
Subject: [PATCH v2 14/15] ARM: dts: microchip: sama7d65: Add Reset and Shutdown and PM support
Date: Mon, 10 Feb 2025 14:13:14 -0700
Message-ID: <d8578cb635ff5b01e42132bd40a12b31c8638800.1739221064.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739221064.git.Ryan.Wanner@microchip.com>
References: <cover.1739221064.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_131413_133928_E1D9CB48 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

Add support for reset controller, wake up alarm timers, and shutdown
controller.

Add SRAM, SFR, secumod, UDDRC, and DDR3phy to enable support for low power modes.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 77 +++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index 854b30d15dcd4..1d40235bdab0a 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -46,12 +46,42 @@ slow_xtal: clock-slowxtal {
 		};
 	};
 
+	ns_sram: sram@100000 {
+		compatible = "mmio-sram";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <0x100000 0x20000>;
+		ranges;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		ranges;
 		#address-cells = <1>;
 		#size-cells = <1>;
 
+		securam: sram@e0000800 {
+			compatible = "microchip,sama7d65-securam", "atmel,sama5d2-securam", "mmio-sram";
+			reg = <0xe0000800 0x4000>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 17>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0xe0000800 0x4000>;
+			no-memory-wc;
+		};
+
+		secumod: secumod@e0004000 {
+			compatible = "microchip,sama7d65-secumod", "atmel,sama5d2-secumod", "syscon";
+			reg = <0xe0004000 0x4000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		sfrbu: sfr@e0008000 {
+			compatible ="microchip,sama7d65-sfrbu", "atmel,sama5d2-sfrbu", "syscon";
+			reg = <0xe0008000 0x20>;
+		};
+
 		pioa: pinctrl@e0014000 {
 			compatible = "microchip,sama7d65-pinctrl", "microchip,sama7g5-pinctrl";
 			reg = <0xe0014000 0x800>;
@@ -76,6 +106,31 @@ pmc: clock-controller@e0018000 {
 			clock-names = "td_slck", "md_slck", "main_xtal";
 		};
 
+		reset_controller: reset-controller@e001d100 {
+			compatible = "microchip,sama7d65-rstc", "microchip,sama7g5-rstc";
+			reg = <0xe001d100 0xc>, <0xe001d1e4 0x4>;
+			#reset-cells = <1>;
+			clocks = <&clk32k 0>;
+		};
+
+		shdwc: poweroff@e001d200 {
+			compatible = "microchip,sama7d65-shdwc", "microchip,sama7g5-shdwc", "syscon";
+			reg = <0xe001d200 0x20>;
+			clocks = <&clk32k 0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			atmel,wakeup-rtc-timer;
+			atmel,wakeup-rtt-timer;
+			status = "disabled";
+		};
+
+		rtt: rtc@e001d300 {
+			compatible = "microchip,sama7d65-rtt", "atmel,at91sam9260-rtt";
+			reg = <0xe001d300 0x30>;
+			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk32k 0>;
+		};
+
 		clk32k: clock-controller@e001d500 {
 			compatible = "microchip,sama7d65-sckc", "microchip,sam9x60-sckc";
 			reg = <0xe001d500 0x4>;
@@ -83,6 +138,18 @@ clk32k: clock-controller@e001d500 {
 			#clock-cells = <1>;
 		};
 
+		gpbr: gpbr@e001d700 {
+			compatible = "microchip,sama7d65-gpbr", "syscon";
+			reg = <0xe001d700 0x48>;
+		};
+
+		rtc: rtc@e001d800 {
+			compatible = "microchip,sama7d65-rtc", "microchip,sam9x60-rtc";
+			reg = <0xe001d800 0x30>;
+			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk32k 1>;
+		};
+
 		sdmmc1: mmc@e1208000 {
 			compatible = "microchip,sama7d65-sdhci", "microchip,sam9x60-sdhci";
 			reg = <0xe1208000 0x400>;
@@ -132,6 +199,16 @@ uart6: serial@200 {
 			};
 		};
 
+		uddrc: uddrc@e3800000 {
+			compatible = "microchip,sama7d65-uddrc", "microchip,sama7g5-uddrc";
+			reg = <0xe3800000 0x4000>;
+		};
+
+		ddr3phy: ddr3phy@e3804000 {
+			compatible = "microchip,sama7d65-ddr3phy", "microchip,sama7g5-ddr3phy";
+			reg = <0xe3804000 0x1000>;
+		};
+
 		gic: interrupt-controller@e8c11000 {
 			compatible = "arm,cortex-a7-gic";
 			reg = <0xe8c11000 0x1000>,
-- 
2.43.0


