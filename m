Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF33CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 21:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/w0q1W+AvK8kg250gJCMARO+LFjcoeFnkdjzUPI/ZzI=; b=L6FbgMmX5RyKdWwG2oLV95qRLn
	zqMsAwbSlPgULeBxvIx920kuM5suc6LVsdmG+OqT/Ao1Y98F3A+/sSEDLyn1ggOfaOa1y0bWXRvwL
	YrCKX8G+cvYF+Cot6xolttY/9qQ4pCYBAXnY65eLftMiAaR7pZZFK8KF1CcgHgYiyQNaXCt/PFWZM
	8UBahfk4mC206bU/GYZuIXNGLsRXX6brwUlbEwJsJyHpI4eiB4TJ1+U2Qp+3ctyp/YtiQFnx6D0So
	W+dbAqX4cygOlu9Phx5kK9zD1GyBeyDuX0rfN+DrOBgZbybOfnXywWx7Gs/jGfkqzl6kwwn+rjo/D
	3LgspuBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyzJd-0000000EkL4-0Gla;
	Wed, 17 Sep 2025 21:03:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyzJZ-0000000EkIq-3y7u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 21:03:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758143026; x=1789679026;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IwFFZCXQOLVb7GZ4/qN58iqaw9529gFbX/J7lxnDmvo=;
  b=Dq9I1k/5/7OvxofPd7ujgKuck2VCLfRylo5HiT8q7RVYkDgQGWdtoQLz
   fUckPtwsJzroFxPaZ5HEeeS26QKVArD9kQOmuE9mIpBXj3SXfaohkgCKS
   rLA3yF8V47/GMldxc+cy1/xp8uOp2sLJbgiMstrk7j0toOThfg5On6ILe
   jFm5QL5Yylaq5vHBKIEC6UQohFGBiRe+Cpt7GyhrxnCMpJq+hckvSwg+J
   kGH8knXepF4bULr448F94FMadi0eUP9Cgv6lCe7MIWHYlcZRH7QweVU2h
   Uq79oS2Ujk2m6iYZ/Wz+5ZrDvVew4uEssBbr+zwBQHUzkTTTHm66BB7oj
   g==;
X-CSE-ConnectionGUID: CmOguM3+R+yjf+NdgD1gwA==
X-CSE-MsgGUID: +CrTMq7GRbqgNcYR2svHqQ==
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; 
   d="scan'208";a="47182889"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Sep 2025 14:03:42 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 17 Sep 2025 14:03:28 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 17 Sep 2025 14:03:28 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>, Ryan Wanner
	<Ryan.Wanner@microchip.com>
Subject: [PATCH v2] ARM: dts: microchip: sama7d65: Add GPIO buttons and LEDs
Date: Wed, 17 Sep 2025 14:04:08 -0700
Message-ID: <20250917210409.503830-1-Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_140346_292102_79BCAA78 
X-CRM114-Status: GOOD (  11.86  )
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

Add the USER button as a GPIO input as well as add the LEDs and enable
the blue LED as a heartbeat.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
Changes v1 -> v2:
- Remove the label node in the LEDs.
- Use properties color and function to describe the LEDs.
- Add phandles for the LEDs.

 .../dts/microchip/at91-sama7d65_curiosity.dts | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
index f091cc40a9f0..927c27260b6c 100644
--- a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
@@ -11,6 +11,8 @@
 #include "sama7d65-pinfunc.h"
 #include "sama7d65.dtsi"
 #include <dt-bindings/mfd/atmel-flexcom.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/at91.h>
 
 / {
@@ -26,6 +28,43 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_key_gpio_default>;
+
+		button {
+			label = "PB_USER";
+			gpios = <&pioa PIN_PC10 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_PROG1>;
+			wakeup-source;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_led_gpio_default>;
+
+		led0: led-red {
+			color = <LED_COLOR_ID_RED>;
+			gpios = <&pioa PIN_PB17 GPIO_ACTIVE_HIGH>; /* Conflict with pwm. */
+		};
+
+		led1: led-green {
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&pioa PIN_PB15 GPIO_ACTIVE_HIGH>; /* Conflict with pwm. */
+		};
+
+		led2: led-blue {
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_HEARTBEAT;
+			gpios = <&pioa PIN_PA21 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
 	memory@60000000 {
 		device_type = "memory";
 		reg = <0x60000000 0x40000000>;
@@ -352,6 +391,18 @@ pinctrl_i2c10_default: i2c10-default {
 		bias-pull-up;
 	};
 
+	pinctrl_key_gpio_default: key-gpio-default {
+		pinmux = <PIN_PC10__GPIO>;
+		bias-pull-up;
+	};
+
+	pinctrl_led_gpio_default: led-gpio-default {
+		pinmux = <PIN_PB15__GPIO>,
+			 <PIN_PB17__GPIO>,
+			 <PIN_PA21__GPIO>;
+		bias-pull-up;
+	};
+
 	pinctrl_sdmmc1_default: sdmmc1-default {
 		cmd-data {
 			pinmux = <PIN_PB22__SDMMC1_CMD>,
-- 
2.43.0


