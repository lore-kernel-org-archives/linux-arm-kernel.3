Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE3D5CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TTCYbmCCFawqrBO2FBgM3U6QUl4DO3apJXsadwXF0Ik=; b=TakPfbQY5hYe1kC1ZpzHIqXvaG
	n8+3ClqxfSbWiNKoN/X2MA2035pElQt/7yMp3elwa2Kn8UOQVq1pXUEOLRldbdlNVJ4ulhpEsmGwn
	iXLlbuMMUmqLIbVJd0KnV1BjfiCemjENYK9frL0YWwe8TiqsaCLR6wdlDiijcagVeALrMowqoCoHH
	GcytQCu5aH7D1o+IEd51CJpkdIwqAyrcvi3Lj3ZUeqTApmdJJ92y1YJp1n/jeQWEkUsSaKJfBWEDM
	qTMwIbQmWO9uESGpsXBxZy4i1xr5+ZV6Pje+9NNySRoUwrym13UVzvQtHplp0ck6UgwXGy9lUMFfE
	2mUfwOVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw26n-000000095TJ-41En;
	Tue, 09 Sep 2025 17:26:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1RZ-00000008cG7-07Zo
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Sep 2025 16:43:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=TTCYbmCCFawqrBO2FBgM3U6QUl4DO3apJXsadwXF0Ik=; b=d9KskKvmHN9tg8YTiTMeoRzHFq
	Rs7rsNQaguF9cFBq7WoB1kWVCZDPWQLRqKE9ZQYsqpJegdCUuwMi20md1i7Oiq8Af9O32i02mol6Y
	re56LcaWEGlOl6AqBvMt2nLMft/uVLSnjxqBHvf6NZr/Pdyzq5jE1/jcEPexpwcnjh63HZh4cyeSD
	YPbF7jzpBuqUNgAARr0haZ/EinWXCUXETjM0ghvkHXdfnUCV4qw+ijvapt71S67TZsAGnmRRCIRfy
	hQZVg2tMGbN7D+v+uizp8dg9kL9KYmhtNJjs2sqZ1eucjvs1OJ5M5Wg/k/KRxVhhOPjJyOA/cwgPt
	fQ5jILRg==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0tV-00000005QCB-3eTe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 16:08:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1757434114; x=1788970114;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cA9M2c+NwIj2R5SNaIYS+Uj81/D0soHwTzFXUWCg/9c=;
  b=wuMwfFmg4q2JFZT/x6GDklhvMwpwtmmDUz/GHv8ELY428x6x1n/bD4zh
   wqebVxTky6gK/VN22rl81ahb0X1vOCngpydagErFeSJwZoU1k1RU5W7k4
   Ji6uRM61ez7cM7EMgri/5VggQPjqUk5YFrowdkMwh7XtW04UK2CYxjoC2
   xKlW39/iGZSyRWM8Axh46KbUAb17GI65bZiXhqXtkRPSduyE+VE2yxB0v
   KVpB77d6uGO3UIfkmnK1SFZUwjzllnaVPAa154nAGIsR95i124156TrUv
   dxSmnQqmEMMRQgdHN5DjrxYRj9b0wsfLGHjVfA+BPDWYdEV4A22l5bcN2
   A==;
X-CSE-ConnectionGUID: U3r+KmqaRGWFfKqUCS3uWA==
X-CSE-MsgGUID: IXZNLDIGTJK36sEJeagksA==
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="277647069"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Sep 2025 09:08:25 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 9 Sep 2025 09:07:55 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 9 Sep 2025 09:07:55 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH] ARM: dts: microchip: sama7d65: Add GPIO buttons and LEDs
Date: Tue, 9 Sep 2025 09:08:38 -0700
Message-ID: <20250909160842.392075-1-Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_170834_229402_2B313319 
X-CRM114-Status: GOOD (  10.54  )
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
 .../dts/microchip/at91-sama7d65_curiosity.dts | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
index f091cc40a9f0..2fe34c59d942 100644
--- a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
@@ -11,6 +11,7 @@
 #include "sama7d65-pinfunc.h"
 #include "sama7d65.dtsi"
 #include <dt-bindings/mfd/atmel-flexcom.h>
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/pinctrl/at91.h>
 
 / {
@@ -26,6 +27,42 @@ chosen {
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
+		led-red {
+			label = "red";
+			gpios = <&pioa PIN_PB17 GPIO_ACTIVE_HIGH>; /* Conflict with pwm. */
+		};
+
+		led-green {
+			label = "green";
+			gpios = <&pioa PIN_PB15 GPIO_ACTIVE_HIGH>; /* Conflict with pwm. */
+		};
+
+		led-blue {
+			label = "blue";
+			gpios = <&pioa PIN_PA21 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
 	memory@60000000 {
 		device_type = "memory";
 		reg = <0x60000000 0x40000000>;
@@ -352,6 +389,18 @@ pinctrl_i2c10_default: i2c10-default {
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


