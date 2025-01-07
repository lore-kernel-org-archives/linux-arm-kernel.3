Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E54E77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 16:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3sH/Zqg9Rbc1gxdm28fo8ahy16Km0JSQaxGl5475iMU=; b=mbvLtn+WL7SWZtPWEyu7zNOvJc
	JjLIBP0tTcoD8iiovKGZ5IT0a9zbtXx98S0nVno0TLTUONZyo8w3qZUMYxonFc1s4dT0Siydaie9u
	Bp8/tDrANqt1l0/65VDxTNOBP2pOVsFad/+yaN7JlmmRfc4XMnLscSFfBZvFq035at0KL/2IU1Bhp
	YM/+eNE0hHx5kdn95HPXi1YVjiGtQc9iamXm7NIN21qoFm5U8caI9rEeC13+/svKVsal+od9dYcox
	HHYLSuPaccsmFJ8HethvLTwgSNmCbeQDYxU4xqjdl9RWoYvDwGvozUkpYBfIZka9fKRrDS7T40iFQ
	XsdmNB5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVCFA-00000005aHW-2Mqb;
	Tue, 07 Jan 2025 16:15:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVC8B-00000005Yh4-17yB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 16:08:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1736266115; x=1767802115;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PvMZTBsd/zyFDw280jKFb87067d4CpMhzJa4SZI+9ds=;
  b=T1cy8fyxaaOpC04QRA8KX3ur0TOWifc+ZddBcNYRqL3oNXHzYjgW9DJi
   tSgXEVrVxKtIfFMsnyIVin2V1W8G0okqkBi4n6yfXp27Ef1iDFS7PBbGP
   58o1fmvQoGq4gdPhtJTngflZTi9b7Tazf8JUKaIhWFxyLVae0SweKSbhS
   frgDysqPqL6qMIp9FAqmGQKnYX47VceliuN4Iv+sUELDEiV7ekRDVcp9J
   v5Tr+hdVIEVDv0UT4JcuBBAq2UdCSUTEna3AnNUv0RbMvCYmzpTiTsdwj
   ZsnbgCyQFv/JvS+t4ChZy/iZxSvM24+zeROao2zvnLqrccMny07FvhM1j
   g==;
X-CSE-ConnectionGUID: lqpfnJzJQpCXzb9QKpQeRA==
X-CSE-MsgGUID: lkEXHdiKQIKQ2alr2emajQ==
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="40091256"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Jan 2025 09:08:27 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 Jan 2025 09:08:18 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 7 Jan 2025 09:08:18 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<arnd@arndb.de>
CC: <dharma.b@microchip.com>, <mihai.sain@microchip.com>,
	<romain.sioen@microchip.com>, <varshini.rajendran@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-serial@vger.kernel.org>
Subject: [PATCH v5 5/5] ARM: dts: microchip: add support for sama7d65_curiosity board
Date: Tue, 7 Jan 2025 09:07:27 -0700
Message-ID: <20250107160850.120537-6-Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250107160850.120537-1-Ryan.Wanner@microchip.com>
References: <20250107160850.120537-1-Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_080835_315424_D511D439 
X-CRM114-Status: GOOD (  15.37  )
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

From: Romain Sioen <romain.sioen@microchip.com>

Add device tree support for the SAMA7D65 Curiosity board.
Update the Makefile to include the new device tree file.

uart6 is related to flexcom6, hence not sorted in alphabetical order.

Signed-off-by: Romain Sioen <romain.sioen@microchip.com>
Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 arch/arm/boot/dts/microchip/Makefile          |  3 +
 .../dts/microchip/at91-sama7d65_curiosity.dts | 89 +++++++++++++++++++
 2 files changed, 92 insertions(+)
 create mode 100644 arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts

diff --git a/arch/arm/boot/dts/microchip/Makefile b/arch/arm/boot/dts/microchip/Makefile
index 470fe46433a9..79cd38fdc7da 100644
--- a/arch/arm/boot/dts/microchip/Makefile
+++ b/arch/arm/boot/dts/microchip/Makefile
@@ -12,6 +12,7 @@ DTC_FLAGS_at91-sama5d2_xplained := -@
 DTC_FLAGS_at91-sama5d3_eds := -@
 DTC_FLAGS_at91-sama5d3_xplained := -@
 DTC_FLAGS_at91-sama5d4_xplained := -@
+DTC_FLAGS_at91-sama7d65_curiosity := -@
 DTC_FLAGS_at91-sama7g54_curiosity := -@
 DTC_FLAGS_at91-sama7g5ek := -@
 dtb-$(CONFIG_SOC_AT91RM9200) += \
@@ -90,6 +91,8 @@ dtb-$(CONFIG_SOC_SAM_V7) += \
 	at91-sama5d4_xplained.dtb \
 	at91-sama5d4ek.dtb \
 	at91-vinco.dtb
+dtb-$(CONFIG_SOC_SAMA7D65) += \
+	at91-sama7d65_curiosity.dtb
 dtb-$(CONFIG_SOC_SAMA7G5) += \
 	at91-sama7g54_curiosity.dtb \
 	at91-sama7g5ek.dtb
diff --git a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
new file mode 100644
index 000000000000..ef6a56db8acb
--- /dev/null
+++ b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ *  at91-sama7d65_curiosity.dts - Device Tree file for SAMA7D65 Curiosity board
+ *
+ *  Copyright (c) 2024 Microchip Technology Inc. and its subsidiaries
+ *
+ *  Author: Romain Sioen <romain.sioen@microchip.com>
+ *
+ */
+/dts-v1/;
+#include "sama7d65-pinfunc.h"
+#include "sama7d65.dtsi"
+#include <dt-bindings/mfd/atmel-flexcom.h>
+#include <dt-bindings/pinctrl/at91.h>
+
+/ {
+	model = "Microchip SAMA7D65 Curiosity";
+	compatible = "microchip,sama7d65-curiosity", "microchip,sama7d65",
+		     "microchip,sama7d6", "microchip,sama7";
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	aliases {
+		serial0 = &uart6;
+	};
+
+	memory@60000000 {
+		device_type = "memory";
+		reg = <0x60000000 0x40000000>;
+	};
+};
+
+&flx6 {
+	atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_USART>;
+	status = "okay";
+};
+
+&uart6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart6_default>;
+	status = "okay";
+};
+
+&main_xtal {
+	clock-frequency = <24000000>;
+};
+
+&pioa {
+	pinctrl_sdmmc1_default: sdmmc1-default {
+		cmd-data {
+			pinmux = <PIN_PB22__SDMMC1_CMD>,
+				 <PIN_PB24__SDMMC1_DAT0>,
+				 <PIN_PB25__SDMMC1_DAT1>,
+				 <PIN_PB26__SDMMC1_DAT2>,
+				 <PIN_PB27__SDMMC1_DAT3>;
+			slew-rate = <0>;
+			bias-disable;
+		};
+
+		ck-cd-rstn-vddsel {
+			pinmux = <PIN_PB23__SDMMC1_CK>,
+				 <PIN_PB21__SDMMC1_RSTN>,
+				 <PIN_PB30__SDMMC1_1V8SEL>,
+				 <PIN_PB29__SDMMC1_CD>,
+				 <PIN_PB28__SDMMC1_WP>;
+			slew-rate = <0>;
+			bias-disable;
+		};
+	};
+
+	pinctrl_uart6_default: uart6-default {
+		pinmux = <PIN_PD18__FLEXCOM6_IO0>,
+			<PIN_PD19__FLEXCOM6_IO1>;
+		bias-disable;
+	};
+};
+
+&sdmmc1 {
+	bus-width = <4>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sdmmc1_default>;
+	status = "okay";
+};
+
+&slow_xtal {
+	clock-frequency = <32768>;
+};
-- 
2.43.0


