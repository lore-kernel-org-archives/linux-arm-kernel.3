Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF556C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 14:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iztkL2ZWTz8tKNPBwekO2fYmdhAs6Kf4ueV6IXZCyZw=; b=saXkpny+Roo/VsI9r9r/LGddPx
	6slbw4t4jpOFfLIopZk3F8KsTjvBoDKu2jEk3vVStDqQkqUCrS8PdMgaivhMHzJqG+o/3AoQJSJg+
	NXIJ73byHVq6YeS0P9bgs1MwO5s/i1f8cVdgwt+Z2Cl3MCic04Z49CojRPkWqAc0NgkIl5kuUysdg
	oTrMMgHBBiVYjdcgsVieuH5LOZbwtYhldaQIBFNSyhtloZa0ztoehWgXZ7jtD07kpQ4iVMeHEpu98
	/edHsZtB2d/WDG5NZeifHzqwLF32/rZz93f6hShcQ/tKLqRRC0+352K1aJZQMTbSgJAXFB6LAJ4+p
	pomWdv0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thrPS-000000049Qb-1mv6;
	Tue, 11 Feb 2025 14:38:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thrKp-000000048G0-3D5B
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 14:34:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1739284439; x=1770820439;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UoZYGY1/CNTKkir6gRGx13md5BbvfRyVSNo4KoboVp4=;
  b=g/aQQgMphhoKbF+epLvjCeEZyOtpXQEj9HPPhcSxrwXptieeha86T94t
   CxoWMJjz36E2UnbMc6/0qS9oL8MiVylqZa9ZQZGjQDYj7jwUgEtl5JyIl
   z6nFJmR2aP+m9BuHSDObCnoElcnlJNfquO0uaLEr6p/NPErdxdIxF7qZo
   tHwLyS7fAxmUWKiy0ZvNH6Kw3CL9wBPC+6wfT2ht8jrAMj1iovOJpOgfi
   MJIMgHBr5aJnpBYVkx5PcAcO+uXIjTzzv4D25RJ5KFMDBYElk/B24uvbS
   VPLzWyE8kTdziDqVsWv3GAEGlOBMOzIDNTuJGRhQmJ4ld9FvXW9HudCby
   Q==;
X-CSE-ConnectionGUID: 35UA5pLrQAmrHtJwTcQ8OA==
X-CSE-MsgGUID: sd0yBW3qQJiEvKv5khqFFA==
X-IronPort-AV: E=Sophos;i="6.13,277,1732604400"; 
   d="scan'208";a="37535231"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Feb 2025 07:33:57 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 11 Feb 2025 07:33:30 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 11 Feb 2025 07:33:28 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH 2/2] ARM: dts: microchip: sama7d65_curiosity: Add power monitor support
Date: Tue, 11 Feb 2025 16:33:02 +0200
Message-ID: <20250211143302.4102-3-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211143302.4102-1-mihai.sain@microchip.com>
References: <20250211143302.4102-1-mihai.sain@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_063359_808614_CE25F2D2 
X-CRM114-Status: UNSURE (   9.36  )
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

Add PAC1934 support in order to monitor the board power consumption.
Device is connected on flexcom10 in twi mode.

[root@SAMA7D65 ~]$ awk -f pac1934.awk
VDD3V3   current: 146.173 mA, voltage: 3302.73 mV
VDDIODDR current: 62.1356 mA, voltage: 1353.96 mV
VDDCORE  current: 242.248 mA, voltage: 1204.36 mV
VDDCPU   current: 213.565 mA, voltage: 1303.05 mV

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 .../dts/microchip/at91-sama7d65_curiosity.dts | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
index 0f86360fb733..8d826ec4c66c 100644
--- a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
@@ -43,6 +43,52 @@ &uart6 {
 	status = "okay";
 };
 
+&flx10 {
+	atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_TWI>;
+	status = "okay";
+};
+
+&i2c10 {
+	dmas = <0>, <0>;
+	i2c-analog-filter;
+	i2c-digital-filter;
+	i2c-digital-filter-width-ns = <35>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c10_default>;
+	status = "okay";
+
+	power-monitor@10 {
+		compatible = "microchip,pac1934";
+		reg = <0x10>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		channel@1 {
+			reg = <0x1>;
+			shunt-resistor-micro-ohms = <47000>;
+			label = "VDD3V3";
+		};
+
+		channel@2 {
+			reg = <0x2>;
+			shunt-resistor-micro-ohms = <47000>;
+			label = "VDDIODDR";
+		};
+
+		channel@3 {
+			reg = <0x3>;
+			shunt-resistor-micro-ohms = <47000>;
+			label = "VDDCORE";
+		};
+
+		channel@4 {
+			reg = <0x4>;
+			shunt-resistor-micro-ohms = <47000>;
+			label = "VDDCPU";
+		};
+	};
+};
+
 &main_xtal {
 	clock-frequency = <24000000>;
 };
@@ -75,6 +121,12 @@ pinctrl_uart6_default: uart6-default {
 			 <PIN_PD19__FLEXCOM6_IO1>;
 		bias-disable;
 	};
+
+	pinctrl_i2c10_default: i2c10-default{
+		pinmux = <PIN_PB19__FLEXCOM10_IO1>,
+			 <PIN_PB20__FLEXCOM10_IO0>;
+		bias-pull-up;
+	};
 };
 
 &sdmmc1 {
-- 
2.48.1


