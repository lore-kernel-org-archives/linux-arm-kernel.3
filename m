Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CA4D3ABEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 08:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uu9zn9HAv+ji6Lk8Z9qnfiKPT2mPCyrkdUfp4InyZHw=; b=eaCOVGfaSBGdnMkDb5JZVQuFM0
	4CaT4G3f09sF1llvHaIyWOdVwzkqeal9nUN1EHW6Trlkv8vdidGcpRzEntCP4keOdfK5eTx+r20uZ
	avNKyGxQpK4hwiqMQxut9UNuknE7LBEMZNZcckYs3Ho/gvrGCmADkVwaQ6F/Y70PWyBtNeZE7SrUa
	QeFEA5hM6QBxFiE5WSJ3TbXGyepHujva1/06YU1HXqA0gF9g/uaa8KLyJerxA1TQb3BA3wj4bALkb
	jjjeNyxAfOsReUEflYrDGowL2GvFhHMpFm2Wnl6EhrNxbg/ZXTlIvp/zwoEW0BNBoJP78XmXH1wq2
	y0dHMznA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSWky-0000000Cosm-0ZmX;
	Mon, 08 Dec 2025 08:38:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSWku-0000000Corr-2ps0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 08:38:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1765183084; x=1796719084;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aJVLiKB0hw4i7u+gPQHx4MVI2yABH5AWG0hgZzIhmoU=;
  b=krPSgaqQ/br4IM3fk/MAmE1B9bdBvVCmjtfPNfXT2kv679acS0qYD9+0
   L1K75N+qA1qd/T4vlQmydvpAOZ1KnuhvJIpWo3eJIVfJ4wUJEaogN2G3o
   BgOE/IdGbjQSyGUl2s+HgUSo7VDW/5KzjLsdc03bIX7LUqV0ZDAsbLbCN
   vFHWkW/ou5+sHJLgTeJkJq7+fiShByhEjY1DV3L88OLzAawHOJOF1U0lE
   mUjc4FpNPA+bODFAGb+EdnZUlc5ZOU5U5MiLQOSnND/ntPufcRyEaZdeC
   QsfJ8jajGz0HSnXRPZQnF0vPCJ4H0KRnuW9hnwNQCLgMYmDCy4FiVy6fu
   Q==;
X-CSE-ConnectionGUID: eA4pPB0/RzaLndq8Vflnpg==
X-CSE-MsgGUID: yxxIIWcySz6uk9ihfY1OYg==
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="49530812"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 01:38:03 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Mon, 8 Dec 2025 01:37:09 -0700
Received: from DEN-DL-M31836.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 8 Dec 2025 01:37:07 -0700
From: Horatiu Vultur <horatiu.vultur@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <wsa+renesas@sang-engineering.com>,
	<romain.sioen@microchip.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [PATCH v5 2/2] ARM: dts: Add support for pcb8385
Date: Mon, 8 Dec 2025 09:35:45 +0100
Message-ID: <20251208083545.3642168-3-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251208083545.3642168-1-horatiu.vultur@microchip.com>
References: <20251208083545.3642168-1-horatiu.vultur@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_003804_781893_601582DF 
X-CRM114-Status: GOOD (  15.39  )
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

Add basic support for pcb8385 [1]. It is a modular board which allows
to add different daughter cards on which there are different PHYs.
This adds support for UART, LEDs and I2C.

[1] https://www.microchip.com/en-us/development-tool/ev83e85a

Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
---
 arch/arm/boot/dts/microchip/Makefile          |   3 +-
 .../boot/dts/microchip/lan966x-pcb8385.dts    | 131 ++++++++++++++++++
 2 files changed, 133 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/microchip/lan966x-pcb8385.dts

diff --git a/arch/arm/boot/dts/microchip/Makefile b/arch/arm/boot/dts/microchip/Makefile
index 79cd38fdc7dab..08986c24a4700 100644
--- a/arch/arm/boot/dts/microchip/Makefile
+++ b/arch/arm/boot/dts/microchip/Makefile
@@ -102,4 +102,5 @@ dtb-$(CONFIG_SOC_LAN966) += \
 	lan966x-kontron-kswitch-d10-mmt-8g.dtb \
 	lan966x-pcb8290.dtb \
 	lan966x-pcb8291.dtb \
-	lan966x-pcb8309.dtb
+	lan966x-pcb8309.dtb \
+	lan966x-pcb8385.dtb
diff --git a/arch/arm/boot/dts/microchip/lan966x-pcb8385.dts b/arch/arm/boot/dts/microchip/lan966x-pcb8385.dts
new file mode 100644
index 0000000000000..d18969275efea
--- /dev/null
+++ b/arch/arm/boot/dts/microchip/lan966x-pcb8385.dts
@@ -0,0 +1,131 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * lan966x-pcb8385.dts - Device Tree file for PCB8385
+ */
+/dts-v1/;
+
+#include "lan966x.dtsi"
+#include "dt-bindings/phy/phy-lan966x-serdes.h"
+
+/ {
+	model = "Microchip EVB - LAN9668";
+	compatible = "microchip,lan9668-pcb8385", "microchip,lan9668", "microchip,lan966";
+
+	aliases {
+		serial0 = &usart3;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	gpio-restart {
+		compatible = "gpio-restart";
+		gpios = <&gpio 59 GPIO_ACTIVE_LOW>;
+		open-source;
+		priority = <200>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-p1-green {
+			label = "cu0:green";
+			gpios = <&sgpio_out 2 0 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led-p1-yellow {
+			label = "cu0:yellow";
+			gpios = <&sgpio_out 2 1 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led-p2-green {
+			label = "cu1:green";
+			gpios = <&sgpio_out 3 0 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led-p2-yellow {
+			label = "cu1:yellow";
+			gpios = <&sgpio_out 3 1 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+	};
+};
+
+&aes {
+	status = "reserved"; /* Reserved by secure OS */
+};
+
+&flx0 {
+	atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_TWI>;
+	status = "okay";
+};
+
+&flx3 {
+	atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_USART>;
+	status = "okay";
+};
+
+&gpio {
+	fc0_b_pins: fc0-b-pins {
+		/* SCL, SDA */
+		pins = "GPIO_25", "GPIO_26";
+		function = "fc0_b";
+	};
+
+	fc3_b_pins: fc3-b-pins {
+		/* RX, TX */
+		pins = "GPIO_52", "GPIO_53";
+		function = "fc3_b";
+	};
+
+	sgpio_a_pins: sgpio-a-pins {
+		/* SCK, D0, D1, LD */
+		pins = "GPIO_32", "GPIO_33", "GPIO_34", "GPIO_35";
+		function = "sgpio_a";
+	};
+};
+
+&i2c0 {
+	pinctrl-0 = <&fc0_b_pins>;
+	pinctrl-names = "default";
+	dmas = <0>, <0>;
+	i2c-analog-filter;
+	i2c-digital-filter;
+	i2c-digital-filter-width-ns = <35>;
+	i2c-sda-hold-time-ns = <1500>;
+	status = "okay";
+
+	eeprom@54 {
+		compatible = "atmel,24c01";
+		reg = <0x54>;
+	};
+
+	eeprom@55 {
+		compatible = "atmel,24c01";
+		reg = <0x55>;
+	};
+};
+
+&sgpio {
+	pinctrl-0 = <&sgpio_a_pins>;
+	pinctrl-names = "default";
+	microchip,sgpio-port-ranges = <0 3>;
+	status = "okay";
+
+	gpio@0 {
+		ngpios = <64>;
+	};
+	gpio@1 {
+		ngpios = <64>;
+	};
+};
+
+&usart3 {
+	pinctrl-0 = <&fc3_b_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
-- 
2.34.1


