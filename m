Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED64E63F21
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 01:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q0fKyKWI4980jZn5M5FggHqzBxrEKL/SGjXzNzw8NrU=; b=Sr9z3kxaYBi/8yfb9wfFVmQ3Jn
	9vKnJwLs/zz07Msyk7X5JZ2ABgIeLwd8P308il24zidXOcvp2feSSzO8gSjnm0HwLLaMmSKxzXk0z
	aAUTWIxjd5X4T3PupyQ7wZbFuFgCmP4IKw7puLlkkvCMcL5JlZp/V5eVBNhnXBZJxqu+5TeG29D/y
	ZFdUz8v2uAx/0WWHE/j3VubDG1QbklQRT082u7qhfl99Sq9PqD0QqPhzmEsVucwOqZXBpRiwpxEvP
	BIZ0ndtdapaDLh+vTYXAoSgkfm+Bkk0wY1YB8sD8btlOocUh5XEilmN3cZe9S3FAIstFvF7Ag6N5z
	NKPA4wmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrn0e-00000005pam-2I7L;
	Mon, 16 Feb 2026 01:02:44 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrn0c-00000005pY7-24QU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 01:02:43 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-124a635476fso3022870c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Feb 2026 17:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771203761; x=1771808561; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q0fKyKWI4980jZn5M5FggHqzBxrEKL/SGjXzNzw8NrU=;
        b=kGEbOQk3Dic3IEJ8HAfnHdacwK+s/WpQ7E5WM3jcxOnB6GZB37o8pgiUy5z9rAs6iP
         VamOUPl8SqTX2flju9mpPOnOqa4Rs+ge7t72jGIuVP1REO7Nmnm8ZKj6q/9W+Vf1hdcz
         53TBxNkxO8K9oe2FSZE1FBPtBOzS6/4lUk/zI7+lAXYPMpK2PwcAshEABJIoMU9r5Ssj
         931oxA15+ZDz+HQbKxXCC8vqDPwTlUcBNBE/M7HdHJStwyJFyxiovU5vo15w2c2lNIGM
         0uycihJckLz3WPw+itdJtevxPlDzGCpi2G1YuEAZvLyxrdniBkuXwFAlC34i9eP3VL73
         SPAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771203761; x=1771808561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q0fKyKWI4980jZn5M5FggHqzBxrEKL/SGjXzNzw8NrU=;
        b=kBdeN539+SZaa0NwE83FzwObu+Ic4aTy3tsP1OvCceYKg8xGxYSMgbXRaauLzwvLxH
         N4csiwr9mJXFpc6OGtWhw87ePREaoxwjBgNaD4Q83W0rVB8492jAWcsMUAltbBhyn6Bd
         UDQ61ffvBl34iiSuQKx8kXnOGnOeGjh1tpjs1P4mXWMFjyGX3+hO3ArpZAIutdsDMsEA
         DxAKlSvU5dCgcdopuAe0rz4pYVEVikA3PmMYzrq04VFRX/NFPhTTBKX1NTLVGxL3HAkr
         qUEYhBvuF/Q5o03cXEW8Gd9Tur4tQrbrIZBwetN/hnIG4OFlCrhxokt1IjJJ2Y42lQFC
         YnQw==
X-Forwarded-Encrypted: i=1; AJvYcCUEkR62qDaXME94cfemXdhsqnR+yDHRGsQVL6oaaQ8Mx6l8gQN+ejqy17ONCiKX2Oz49vg9/bzX06QEB4OLJ0no@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7ozGyqm/K1oyosbBOpN5tXRVA1jhvFrbZoGKa9CcBdVDayl0I
	EGhLO87ZOnzAHntPy+yE+a1egrHOTcn9PKdSoe2kUkLBBKDSfkULTV2F
X-Gm-Gg: AZuq6aLwYQ3nMlgOmj4HbyAfeEotzqGupwFkQ5Cw6T6m+XI3Hwjvb7n6on+kHR0FfoZ
	PHMNFYQjomj1ciQ0TmVh4Pz120ajtWUSRTvNS5OjKUbzervBh6/SCH0xvr9AwHkTXkZaDKZT1S4
	Qf9QGYit27plzo9pbPYYWA1HqIPH++aCkHU4PG3/GKAoif4bKOPbUrTUMBKZD8TPK3+LzYJTive
	DwyURSnapOFGHFDMROeUHKLcFUmbqjzX8/kphEsGIfbGvhHNCTYe2BcdaBy35oSdKnhChOkuVly
	jBhMhCSqR4/RNvCHuFNI1+BkGs+vCHP7NFF/8wjQDNXLJE8kku5hrhVogwCKCaeHKDq7NnOlZsp
	h6nnul7rHVphf9uHSldM7yCEFsSZKx6RQIeicOQL+g02hHy0rvUusHr7M+aT9cxWdrhgYK3URpY
	uMXGGQ+1EMo/gi5iVQbHQNqvEAAQx8WZ74virxYJk6NuS0L31uHp4cNH7mg7/8beFDwPRVwtJf3
	LC+
X-Received: by 2002:a05:7022:793:b0:127:366f:8bb7 with SMTP id a92af1059eb24-1273ae2f14bmr4124070c88.25.1771203761453;
        Sun, 15 Feb 2026 17:02:41 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:4ffb:cd7:e7e8:c526:2074])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742cadb25sm9158160c88.10.2026.02.15.17.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 17:02:41 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: jonas@kwiboo.se,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH v5 4/4] ARM: dts: rockchip: Add Onion Omega4 Evaluation Board
Date: Sun, 15 Feb 2026 22:02:19 -0300
Message-Id: <20260216010219.2131484-4-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260216010219.2131484-1-festevam@gmail.com>
References: <20260216010219.2131484-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260215_170242_544535_78246613 
X-CRM114-Status: GOOD (  19.01  )
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

From: Fabio Estevam <festevam@nabladev.com>

The Onion Omega4 Evaluation Board is based on the RV1103B SoC and has:

 - 256 MB of RAM
 - 256 MB of SPI-NAND
 - Ethernet
 - USB OTG
 - Wifi
 - SD card
 - Camera connector

The details can be found at:
https://documentation.onioniot.com/omega4/getting-started/

Add the initial support for this board so that it can fully boot into
Linux with the root file system stored in the SPI NAND.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
Changes since v4:
- Use compatible = "onion,omega4-evb", "onion,omega4", "rockchip,rv1103b";

 arch/arm/boot/dts/rockchip/Makefile           |  1 +
 .../boot/dts/rockchip/rv1103b-omega4-evb.dts  | 55 ++++++++++++++++
 .../arm/boot/dts/rockchip/rv1103b-omega4.dtsi | 65 +++++++++++++++++++
 3 files changed, 121 insertions(+)
 create mode 100644 arch/arm/boot/dts/rockchip/rv1103b-omega4-evb.dts
 create mode 100644 arch/arm/boot/dts/rockchip/rv1103b-omega4.dtsi

diff --git a/arch/arm/boot/dts/rockchip/Makefile b/arch/arm/boot/dts/rockchip/Makefile
index 716f5540e438..d0154fd7ff24 100644
--- a/arch/arm/boot/dts/rockchip/Makefile
+++ b/arch/arm/boot/dts/rockchip/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_ROCKCHIP) += \
+	rv1103b-omega4-evb.dtb \
 	rv1108-elgin-r1.dtb \
 	rv1108-evb.dtb \
 	rv1109-relfor-saib.dtb \
diff --git a/arch/arm/boot/dts/rockchip/rv1103b-omega4-evb.dts b/arch/arm/boot/dts/rockchip/rv1103b-omega4-evb.dts
new file mode 100644
index 000000000000..3016492e15d3
--- /dev/null
+++ b/arch/arm/boot/dts/rockchip/rv1103b-omega4-evb.dts
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2022 Rockchip Electronics Co., Ltd.
+ * Copyright (c) 2025 plan44.ch/luz
+ * Copyright (c) 2025 Onion Corporation
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+#include "rv1103b-omega4.dtsi"
+
+/ {
+	model = "Onion Omega4 Evaluation Board";
+	compatible = "onion,omega4-evb", "onion,omega4", "rockchip,rv1103b";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0	{
+			pinctrl-names = "default";
+			pinctrl-0 = <&led>;
+			gpios = <&gpio0 RK_PA2 GPIO_ACTIVE_HIGH>;
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_BLUE>;
+			label = "sys";
+			default-state = "on";
+		};
+	};
+};
+
+&fspi0 {
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&pinctrl {
+	leds {
+		led: led {
+			rockchip,pins = <0 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/rockchip/rv1103b-omega4.dtsi b/arch/arm/boot/dts/rockchip/rv1103b-omega4.dtsi
new file mode 100644
index 000000000000..58aebffda9cd
--- /dev/null
+++ b/arch/arm/boot/dts/rockchip/rv1103b-omega4.dtsi
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2022 Rockchip Electronics Co., Ltd.
+ * Copyright (c) 2025 plan44.ch/luz
+ * Copyright (c) 2025 Onion Corporation
+ */
+
+/dts-v1/;
+
+#include "rv1103b.dtsi"
+
+&uart0 {
+	bootph-all;
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0m0_xfer>;
+};
+
+&fspi0 {
+	spi_nand: flash@0 {
+		compatible = "spi-nand";
+		reg = <0>;
+		bootph-pre-ram;
+		bootph-some-ram;
+		spi-max-frequency = <75000000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <1>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "env";
+				reg = <0x00000000 0x00040000>;
+			};
+
+			partition@40000 {
+				label = "idblock";
+				reg = <0x00040000 0x00100000>;
+				read-only;
+			};
+
+			partition@140000 {
+				label = "uboot";
+				reg = <0x00140000 0x00100000>;
+				read-only;
+			};
+
+			partition@240000 {
+				label = "boot";
+				reg = <0x00240000 0x00800000>;
+			};
+
+			partition@a40000 {
+				label = "ubi";
+				reg = <0x00a40000 0x0f5c0000>;
+			};
+		};
+	};
+};
+
+&wdt {
+	status = "okay";
+};
-- 
2.34.1


