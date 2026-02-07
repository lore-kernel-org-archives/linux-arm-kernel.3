Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B041CEE0AE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Feb 2026 13:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QAMsCJ7WM0LvMqOJgK6pz8e5Nk/hEPgkVpMXdjp+pWs=; b=XqijZ5gcbLD9IsIF+oaF2Yi1AW
	l9on3yGYXDoSZvR2u0EUW4M4Zn5pD2D6WBJNlUH7x144eQO1lS5w7uSVxKas2XRWF4+CNXXYPi7R3
	N5xTGbHj5+Vdz1Vr3BRNXWujDXT4Kwn6DhgISAYZOpaRgKXUImcz1dZbGWE6eRlhr0AF15budSjup
	dQXpPhc4q3xt0l121aWUX3U6hjyD/LyKiS1Jm3cfjIoAGRQ2ylYof9evkCCFPdwSkppd557yJAwui
	IrUi0lYyq/QAodJ9hKt1/dB3HGOowOmyZ9hG0B/JzLx9qHc1bNyGoYqlVH2Wr41porKTpLvvB0SbT
	CAQhPybg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voiCf-0000000CTGr-3YNJ;
	Sat, 07 Feb 2026 13:18:25 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voiCd-0000000CTDf-2WJq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Feb 2026 13:18:24 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-2ba64b5a53aso31451eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Feb 2026 05:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770470303; x=1771075103; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QAMsCJ7WM0LvMqOJgK6pz8e5Nk/hEPgkVpMXdjp+pWs=;
        b=LqajDDjCGuY4AGzK3qlyEHXbvAF7dJ3WfUJIDDDa54uYQ7hx7mwWIsd+1WMZ6alKyE
         9el7DhHnv1jfscfcGSN+OAHv62xEut2BSCFEdsgbM/4TD1WAtEaRQWC1U2umndLOOKQZ
         y99jS30ncs52t/D1z54oxU7d9atrazVrkb//Sb6yuHRP7jb4Qeu02QW1/sy+agXTEL4g
         1IbK+E4aHIvW0AZLaae0mh4unJG1t9XvH4TPQ/8yAyfvnbyNoA0Lm1Js6JAdljVlg8nj
         V+VmW71dMXaK4QmPZJJGG8/FzzY2qBdBT6Qd2e7MDJiViCMfHlhNOjAuA8rkTBB4z0ZA
         W6qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770470303; x=1771075103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QAMsCJ7WM0LvMqOJgK6pz8e5Nk/hEPgkVpMXdjp+pWs=;
        b=Vcng6VQ8l2TieQaxnnOvCNJXC3F6JEH/g1n41oLIZBzOFPdLXl7VAzaJHypzdUSECu
         V9VTsp8dKnhWDXa6GYAMxYeJxBOIjdb/nRH4OP+844b4pwhbCU5eiRnvg9MpVJnLXyu7
         ALXA5HCRAjh+BAFR6YGV2BaPbntA4uZaDFsUyt1TcXk4fjFZJ4Qzs0u7mkIV3WjPU+AJ
         ix7bU/MKPFMQtRExQ+7LOwFnT0eaHkGfYHq4wrnKu90jBCeMyeJ1O+nf9MWXiBOVWltI
         gvplrC9SZwFsusleFKZD7JyISOgwxr8AlAzmpkBlChFdhel0HCrR+qICXR+NuIQwjUWk
         7E/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXiqHey6JqBzimvj1/v7D5cEiVr5zwW0SUo3ULOHmJ4yF6J5C7+P21ruWjNewpg2FPCBWedc16ZuPFhhGQCIr2o@lists.infradead.org
X-Gm-Message-State: AOJu0YzhpgZ4grTI8zBC0KVEYcFExJxlq+XBE4UomxPgUD6T6+wC66zD
	rtdS+Sa+5Y6RhWvQCmzpuvZr/FU2lNHNz35btsNBbVpAE+7UCPTetGfu
X-Gm-Gg: AZuq6aKJBXMbh4KTYEN1tAcWUarz57wKejJnW0JQg851Pj6y9rZRSd3m028vIrteajG
	9Sp1+8VNhbQ4FehS5qQ+OHk1sQqwmp7ZkWe4TWpX2E9eZeENkTM1Qe9Q/oZqtFqCROeZrDO566b
	4+b7/ZnWeprC4rsSPunAXGUVjw0KnHNNSmH+xabQ9yx+ww2TXocAqxFiVX5S5aguCeq0J6QkJ2W
	Ccj5pJWWcU9P6x8Le2d2niMEd0fw6fBROD5f1aMvU/zpugaaBjgeLgiKwVn1GF/nIeL336hkRtS
	g5nz41lF+jpoZkANydI8nPg88XP1CNDhiu860tNmu9tBfdM8iH/RYHZs9/W8PaH3ylRAZHoyeGB
	F7inSRl9/W4cyNdQ9C9g7AlG/NSkKi9nMKr9BEOs/qe4e4ALinXpsiCtEWoqGWWJJZb52pSkd4/
	nnn9cznRjTgIUEtE4rkehMSVwR
X-Received: by 2002:a05:7301:19a5:b0:2b0:4c5f:c05c with SMTP id 5a478bee46e88-2b85644eb2amr2741172eec.4.1770470302536;
        Sat, 07 Feb 2026 05:18:22 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:b1ab:5cb0:a2f8:764b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855c7f5fcsm3688627eec.29.2026.02.07.05.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 05:18:22 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: jonas@kwiboo.se,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH v2 4/4] ARM: dts: rockchip: Add Onion RV1103B Omega4
Date: Sat,  7 Feb 2026 10:18:03 -0300
Message-Id: <20260207131803.2834749-4-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260207131803.2834749-1-festevam@gmail.com>
References: <20260207131803.2834749-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_051823_655826_F6590C4C 
X-CRM114-Status: GOOD (  18.19  )
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

Onion Omega4 board is a board based on the RV1103B SoC that has:

 - 256 MB of RAM
 - 256 MB of SPI-NAND
 - Ethernet
 - USB OTG
 - Wifi
 - SD card
 - Camera connector

Add the initial support for this board so that it can fully boot into
Linux with the root file system stored in the SPI NAND.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
Changes since v1:
- Removed memory node.
- Added serial0 alias and used stdout-path = "serial0:115200n8";
- Added color, function and pinctrl entries to the LED node.
- Used bootph-pre-ram and bootph-some-ram.

 arch/arm/boot/dts/rockchip/Makefile           |   1 +
 arch/arm/boot/dts/rockchip/rv1103b-omega4.dts | 106 ++++++++++++++++++
 2 files changed, 107 insertions(+)
 create mode 100644 arch/arm/boot/dts/rockchip/rv1103b-omega4.dts

diff --git a/arch/arm/boot/dts/rockchip/Makefile b/arch/arm/boot/dts/rockchip/Makefile
index 716f5540e438..d8cd5df138cc 100644
--- a/arch/arm/boot/dts/rockchip/Makefile
+++ b/arch/arm/boot/dts/rockchip/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_ROCKCHIP) += \
+	rv1103b-omega4.dtb \
 	rv1108-elgin-r1.dtb \
 	rv1108-evb.dtb \
 	rv1109-relfor-saib.dtb \
diff --git a/arch/arm/boot/dts/rockchip/rv1103b-omega4.dts b/arch/arm/boot/dts/rockchip/rv1103b-omega4.dts
new file mode 100644
index 000000000000..bcfc9b321dd6
--- /dev/null
+++ b/arch/arm/boot/dts/rockchip/rv1103b-omega4.dts
@@ -0,0 +1,106 @@
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
+#include "rv1103b.dtsi"
+
+/ {
+	model = "Onion RV1103 Omega4 Board";
+	compatible = "onion,rv1103b-omega4", "rockchip,rv1103b";
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
+			pinctrl-0 = <&led_pin>;
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
+
+	flash@0 {
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
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0m0_xfer_pins>;
+	bootph-all;
+	status = "okay";
+};
+
+&wdt {
+	bootph-all;
+	status = "okay";
+};
+
+&pinctrl {
+	leds {
+		led_pin: led-pin {
+			rockchip,pins = <0 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
-- 
2.34.1


