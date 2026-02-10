Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E434CEA8124
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 14:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6r7XJGPI4Eu2nijObW0lD2FssoR7X5MTuREbg2w6rVY=; b=CGAt4+k1uL4xusbOpJgUDlN+7m
	TxPLtJab92IwZxzgteV9/+j9bDM+ox65xkl6WQDD7mh1ArSIFtIpkAD69oetZSyZvfliVY5MLRUD9
	EMkbYz3JYcAxhE7qNfOoHNarhlBSTDEJkHQVLrqQIEWfayc49j+BKvGxCCnQ263SC47LO2fsUAMRB
	S5z/YICn6hMIcexIWs3szxrqDGmATD4x8KO480Up8XbGvNaEGAuGp01Oy/sMG4MWmEGDs+BLiSNDH
	CIvpnfm/KPW9XtbGfarWNxwNTZ9d36PncUv6PX/s1b1VFEppxSRl+Gr1T+NNQ/6UTFmhrAElgKjMQ
	6fJGQ4IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpp3Q-0000000H46c-1WMA;
	Tue, 10 Feb 2026 14:49:28 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpp3O-0000000H44M-0Tfm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 14:49:27 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-79088484065so9195057b3.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 06:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770734965; x=1771339765; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6r7XJGPI4Eu2nijObW0lD2FssoR7X5MTuREbg2w6rVY=;
        b=VxWqZwTX8zHVK0EZoVz3+STbHPAywNPAYRCvgU5asesgtEWwmpRI18xJzQ3rbmCjCG
         bEbpc9Gai/ZG1gHX/RxZu9fY4nObDebMoqJmqT76INPxByS4Cv0PtSjhIUTfkMwD9/Dy
         xKA2DGucJwfLT20fGRtCW/v3bF6mEaS1lpiGJJ7XBCKa0O96Qe54lC7Riyap59MFpITe
         so6kBu1/82V+TnsbNI5IwlJLw6aQAIzE5OknVn/woLiuqH8/8umJMnExhndzV/OJm5ur
         gEoYRUj9E1Ufe2BkeAULOw5eXawn+RUMKN/I5y+fKnBd3u/z3oZVqCvoMQiZ6NoPhJQm
         kT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770734965; x=1771339765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6r7XJGPI4Eu2nijObW0lD2FssoR7X5MTuREbg2w6rVY=;
        b=V6s39a6w7uCA42ajlgK3vPW/oLwkDdwmDpkwk9c0IopixRNHJxQ/WBcvfcuyXEgxbz
         JUfvBS2WLio6HIj/y6Ma6k3civzorpooLOsKS7FgSoWe4rTBUNRyzpXb015v1tGmk9n8
         nTmaLPWEWpVvMeQwldEOdkw3HI1ZMLlC0Z1iATDn1WeIvrl1zg3WR6/G8TrQvhj+yz9d
         KBolPj+A4VaDeVE9ZkwAN5XFJ4O3/GlZc5VVRljoRPob0D/f/B/bs9Ykyby8bdZmpabn
         AoTSLqf3RBgIXkJZjmeYW3NRoB7h6oEQPBSiJXMhC7k2EdbkhaNL99BvAIkny6x3Fpu2
         ZSIA==
X-Forwarded-Encrypted: i=1; AJvYcCU+Pv9CCk8rWRp1wcyZGSDfAXL89q/JwWhatzOz2VDXeQoXGisn/dcWgSMDOIw8WWiX7wuLNUVBDCF1AOus0I4p@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0jBO5PNQ6jXNapDelraXlf3SXi0jDXC83zEOkSuugKFsTZ54A
	73bNl+EFtkyCdI1NcVtLWbK7Ze6/Qx8A09xwgGk4qJwW+CByFIvESoGK
X-Gm-Gg: AZuq6aJ0thYhrtU4hyKw7HitziSxPGyuNBG0qgQ7dkZvT5eoSObAbmAGrHAfl11qfD8
	PN8SfYMkVINrY/PiknjkwyVRWcX7YqoSRd+JcCPI5g9EcXOwsMwse2LtwdHRd9nj4pg9+mwlvBt
	2hHzQZOD+8GzZk4urIoiFgHCjX26NWjKgtXzWH0joj15oy+O8nycRvVD7e+AdS8kX046LCd5+MG
	ClOBb3XN+oC7JK/9WrHGO3EmIW2yS4xgiscEy50x7oRrAoIEaOaLCqVT6/tqay/V0vFLAvNssiC
	GXPXjrog2Xgv3YrbnTZFMrgE38F7PLyGtl5j7T+T/CIUNTwJ7070vCqX0WqH8O0T6vfAFpgSh4Q
	YYATL/310eebTwLUJiSqjfgWPGNwm/eihpexsEKhy/pnIi3wxRcOC591DGviKOT1EKtLtVv9aLZ
	JA6WGSf8dRQSZdgAsi6a+E5W5ge9+5LwfWDndW
X-Received: by 2002:a05:690c:60c6:b0:794:d4c3:3152 with SMTP id 00721157ae682-7952aaa7866mr287712077b3.31.1770734964654;
        Tue, 10 Feb 2026 06:49:24 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:7e95:428c:8802:872e])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64acd247ee5sm12086263d50.6.2026.02.10.06.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 06:49:23 -0800 (PST)
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
Subject: [PATCH v3 4/4] ARM: dts: rockchip: Add Onion Omega4 Evaluation Board
Date: Tue, 10 Feb 2026 11:48:45 -0300
Message-Id: <20260210144845.317048-4-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260210144845.317048-1-festevam@gmail.com>
References: <20260210144845.317048-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_064926_166485_F8F9422C 
X-CRM114-Status: GOOD (  19.55  )
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
Changes since v3:
- Split it in the EVB and SoM dtsi.

 arch/arm/boot/dts/rockchip/Makefile           |  1 +
 .../boot/dts/rockchip/rv1103b-omega4-evb.dts  | 94 +++++++++++++++++++
 .../arm/boot/dts/rockchip/rv1103b-omega4.dtsi | 21 +++++
 3 files changed, 116 insertions(+)
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
index 000000000000..686f2dd28eab
--- /dev/null
+++ b/arch/arm/boot/dts/rockchip/rv1103b-omega4-evb.dts
@@ -0,0 +1,94 @@
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
+	compatible = "onion,rv1103b-omega4-evb", "onion,rv1103b-omega4", "rockchip,rv1103b";
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
+
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
+&pinctrl {
+	leds {
+		led: led {
+			rockchip,pins = <0 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/rockchip/rv1103b-omega4.dtsi b/arch/arm/boot/dts/rockchip/rv1103b-omega4.dtsi
new file mode 100644
index 000000000000..bf245b547ea2
--- /dev/null
+++ b/arch/arm/boot/dts/rockchip/rv1103b-omega4.dtsi
@@ -0,0 +1,21 @@
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
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0m0_xfer>;
+	bootph-all;
+	status = "okay";
+};
+
+&wdt {
+	status = "okay";
+};
-- 
2.34.1


