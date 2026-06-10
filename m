Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5256CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 11:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M48g1rCWscfQlBlf5X+TWnsGxGVdXiBVb0x/zKO5E7k=; b=JEThinMUaiJMSpgqNQdwUWhnVi
	Lux52hKij1lP3QzqohcYf1Wnu/dfbyGi3LwvnFPMCh0SqNRlql52JRkRJOrpdDhqiI13Tv2dFCZFR
	BqcZsFFqxqbOE7tmx8gGoJUGheJ0RRk5KexrXBvwPwMQfJ+Z+66zDx9SXPA+zCCui7hdiyBUSdX7d
	ddO+Klnc8vsfPFUBbXwgpcJf2YJZwVO99RonrIQgQ372rQl/dW9cfG/OLEapcsC0HEhsIfWbJFMki
	Ou6hdnxDXPvpOx5CtxRfeTk0ZwVp754GN25DA5amNTx22yQufx/DeugSzqSi/uoH+CyPQQbRS5VIs
	+e8a3m1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXH7U-00000007XO5-1Mxy;
	Wed, 10 Jun 2026 11:29:16 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXH7R-00000007XLY-3bQa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 11:29:15 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-36ba285e98bso6556739a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 04:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781090953; x=1781695753; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M48g1rCWscfQlBlf5X+TWnsGxGVdXiBVb0x/zKO5E7k=;
        b=Xq13aGOXgBQ1ozD0N3f7yBvXCu8IjpIaJ/P16CYkXwsj1DhtzYNXw3sYFJ4f0JHa4d
         c6caNntrBvl1lgsKGBs0dA/Y1hkqHz0wXkmyMgWMX0DvMg4SUygLcbSyEVh/PzT0+YBb
         JRVtFYdLvn1cExWS8i5wnC3CfbEltvmOtwAvsTQ83JMRhtGSACxM4tBJkzn4+cUQ3TwZ
         fLvd+w3LhSHYXXmzRcXClQwW71WDS4g708kXDkBZCS8U4dvhYvraTdIz1XfhIZ6Cjmg2
         hxYYKizKed4nPdtgV0w/3STVWojZI7UH0cXNSAiPOqxQBUOn1iAFfuTTiG7Ega0sTZmZ
         MkeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781090953; x=1781695753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M48g1rCWscfQlBlf5X+TWnsGxGVdXiBVb0x/zKO5E7k=;
        b=ZbsY3qgT02hjm/Qp4n/drElP1g3kPJNctHE7olH0rZFsb7Bmel9P1VYq/pSu+3Bd+9
         NUT/zpiJ67zvvNE95guKFiOsl89slZvX/cwKb9g8aK2/E/MgpNmZ0aIWlcPiOifKLdO6
         56F7QvOAfAB4wIZ0ZRDK0+BrtQJQYT2BX+g0vE7/e7RRdLuGqziia8XK77m1OLOtM98Z
         xJriI16tw4WYGiMz4CupeDwVp/EPl3/L9XfJEakcQfm3XMF+klqi5uUhMYaRREQErnPq
         +uhCguUCOb/s9RuZYQsPM3ul4feEo0PB5Aliu2xG7srWG3DBkLHu42BBAErozpV06sAo
         VY+g==
X-Forwarded-Encrypted: i=1; AFNElJ8rlK7i8STKBRio62vxs7t8UW+rKfJPyUUBDr2WvvadEEocRmXxOhFYBzBYMoClXiWTehAPq1fuutO9gS4VLSOc@lists.infradead.org
X-Gm-Message-State: AOJu0YyCNoADwLdP54Z+MbJ2G+pxl12y3/LfBmmZ4DKpmr8nko/c5aWo
	uGaBmCLH6Qv9m3IPtBxT099jskE+/KO8iWhtbV1VZVMwGqexoBHSmnd1
X-Gm-Gg: Acq92OEWmovRMzmRn24HTGaofL+UzHyTmP4VfjRBRiHTyRzvb7IfIJmmadtsIIQHajQ
	iqzzzv9EHFLS76SMYW1xvJVE0a23mYNwIVSuKfxllIJ8k34ArObvPZYRpGh8dAhDGBAQO9ZdQyu
	F5ZwDp3Z/MgGUKTtAtc7xbfdq4Y7thXfLpGnJ1XF2iaVwjxF/n6mI7iAOruvlZgQv2RugL3Lkf/
	ZSCmcSjVZR6EPNYSSdzVj4Jdf0nPTqPBl1hUWNdPFXx3MJKJdwXjk+Y6gAQyCOMIdQlLVSWbjHz
	YfJUAfDXr67X4cOWvgHZ9PH/dilR97p4SsiiPd64Sew3DTmBQ2oVXpgJ8kFJWYLxTQR52NRCb39
	0Wbdy8Mrj+YiGgCTpmBYzKy+6N9isK3y8U2jSb2uSKE6u2iRAxTnibuYdA/NVY3uLutDuKqHLZ6
	m/ec1ArxsB2HMBaUXxwF4yU+xwSsVzwUkjZ+b1otISsV7lNpU7I7KkSQ==
X-Received: by 2002:a17:90b:48ca:b0:36b:71e6:3de8 with SMTP id 98e67ed59e1d1-370f122d6a6mr26906196a91.24.1781090953042;
        Wed, 10 Jun 2026 04:29:13 -0700 (PDT)
Received: from hc-pb-01.realtek.com ([123.51.179.67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-376460ee14fsm2027651a91.1.2026.06.10.04.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:29:12 -0700 (PDT)
From: Jason Li <jason.lee651024@gmail.com>
X-Google-Original-From: Jason Li <jason.li@cortina-access.com>
To: jason.li@cortina-access.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: cortina-access: Add DTS for CA8289 SoC and Venus board
Date: Wed, 10 Jun 2026 19:28:21 +0800
Message-Id: <20260610112821.3030099-5-jason.li@cortina-access.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260610112821.3030099-1-jason.li@cortina-access.com>
References: <20260610112821.3030099-1-jason.li@cortina-access.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_042913_907847_DAFBF530 
X-CRM114-Status: GOOD (  19.74  )
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

Add SoC DTSI for the Cortina-Access CA8289 (Venus) and a board DTS for
the Venus engineering board. The description covers the minimum set of
hardware nodes needed to boot a kernel with an INITRD rootfs: CPUs,
GIC, timer, PSCI, fixed clock and UART.

Signed-off-by: Jason Li <jason.li@cortina-access.com>
Assisted-by: Claude:claude-opus-4-8
---
 MAINTAINERS                                   |   1 +
 arch/arm64/Kconfig.platforms                  |  10 ++
 arch/arm64/boot/dts/Makefile                  |   1 +
 arch/arm64/boot/dts/cortina-access/Makefile   |   2 +
 .../dts/cortina-access/ca8289-engboard.dts    |  31 +++++
 .../boot/dts/cortina-access/ca8289-soc.dtsi   | 118 ++++++++++++++++++
 6 files changed, 163 insertions(+)
 create mode 100644 arch/arm64/boot/dts/cortina-access/Makefile
 create mode 100644 arch/arm64/boot/dts/cortina-access/ca8289-engboard.dts
 create mode 100644 arch/arm64/boot/dts/cortina-access/ca8289-soc.dtsi

diff --git a/MAINTAINERS b/MAINTAINERS
index 515d89d96472..ebfdb9c267cc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2826,6 +2826,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/arm/cortina-access.yaml
 F:	Documentation/devicetree/bindings/serial/cortina-access,serial.yaml
+F:	arch/arm64/boot/dts/cortina-access/
 
 ARM/CORTINA SYSTEMS GEMINI ARM ARCHITECTURE
 M:	Hans Ulli Kroll <ulli.kroll@googlemail.com>
diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index dc995a732117..ba6dda0660c3 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -134,6 +134,16 @@ config ARCH_CIX
 	  This enables support for the Cixtech SoC family,
 	  like P1(sky1).
 
+config ARCH_CORTINA_ACCESS
+	bool "Cortina-Access SoC Family"
+	select GPIOLIB
+	select PINCTRL
+	help
+	  This enables support for Cortina-Access SoCs.  The family
+	  includes ARMv8-based devices targeting networking and access
+	  applications.
+	  If you have a Cortina-Access board, say Y here.
+
 config ARCH_EXYNOS
 	bool "Samsung Exynos SoC family"
 	select COMMON_CLK_SAMSUNG
diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index 98ec8f1b76e4..a599f525fb9a 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -16,6 +16,7 @@ subdir-y += broadcom
 subdir-y += bst
 subdir-y += cavium
 subdir-y += cix
+subdir-y += cortina-access
 subdir-y += exynos
 subdir-y += freescale
 subdir-y += hisilicon
diff --git a/arch/arm64/boot/dts/cortina-access/Makefile b/arch/arm64/boot/dts/cortina-access/Makefile
new file mode 100644
index 000000000000..554893f381fe
--- /dev/null
+++ b/arch/arm64/boot/dts/cortina-access/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_CORTINA_ACCESS) += ca8289-engboard.dtb
diff --git a/arch/arm64/boot/dts/cortina-access/ca8289-engboard.dts b/arch/arm64/boot/dts/cortina-access/ca8289-engboard.dts
new file mode 100644
index 000000000000..c8289a0f8269
--- /dev/null
+++ b/arch/arm64/boot/dts/cortina-access/ca8289-engboard.dts
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * dts file for Cortina Access Venus Engineering Board
+ *
+ * Copyright (C) 2026, Cortina Access Inc.
+ *
+ */
+
+/dts-v1/;
+
+#include "ca8289-soc.dtsi"
+
+/ {
+	model = "Cortina Access Venus Engineering Board";
+	compatible = "cortina-access,ca8289-engboard";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@0 {	/* 512MB */
+		device_type = "memory";
+		reg = <0x00000000 0x00000000 0x0 0x20000000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/cortina-access/ca8289-soc.dtsi b/arch/arm64/boot/dts/cortina-access/ca8289-soc.dtsi
new file mode 100644
index 000000000000..8e7ffcf4ccab
--- /dev/null
+++ b/arch/arm64/boot/dts/cortina-access/ca8289-soc.dtsi
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * dts file for Cortina Access CA8289 SoC
+ *
+ * Copyright (C) 2026, Cortina Access Inc.
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "arm,cortex-a55", "arm,armv8";
+			device_type = "cpu";
+			reg = <0x0 0x0>;
+			enable-method = "psci";
+		};
+		cpu1: cpu@100 {
+			compatible = "arm,cortex-a55", "arm,armv8";
+			device_type = "cpu";
+			reg = <0x0 0x100>;
+			enable-method = "psci";
+		};
+		cpu2: cpu@200 {
+			compatible = "arm,cortex-a55", "arm,armv8";
+			device_type = "cpu";
+			reg = <0x0 0x200>;
+			enable-method = "psci";
+		};
+		cpu3: cpu@300 {
+			compatible = "arm,cortex-a55", "arm,armv8";
+			device_type = "cpu";
+			reg = <0x0 0x300>;
+			enable-method = "psci";
+		};
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+				core1 {
+					cpu = <&cpu1>;
+				};
+				core2 {
+					cpu = <&cpu2>;
+				};
+				core3 {
+					cpu = <&cpu3>;
+				};
+			};
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+
+	gic: interrupt-controller@4f8000000 {
+		compatible = "arm,gic-v3";
+		#interrupt-cells = <3>;
+		interrupt-controller;
+		#redistributor-regions = <1>;
+		reg = <0x00000004 0xF8000000 0 0x10000>,
+		      <0x00000004 0xF8040000 0 0x80000>;
+	};
+
+	apb_pclk: apb-pclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <125000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/* TrustZone reserved region; must not be mapped by the kernel */
+		tz_pool: tz-buffer@f000000 {
+			reg = <0x0 0x0F000000 0x0 0x1000000>;
+			no-map;
+		};
+	};
+
+	/* See Documentation/devicetree/bindings/timer/arm,arch_timer.yaml */
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+		clock-frequency = <25000000>;
+	};
+
+	uart0: serial@f4329188 {
+		device_type = "serial";
+		compatible = "cortina-access,serial";
+		reg = <0x00000000 0xf4329188 0x0 0x30>;
+		clocks = <&apb_pclk>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	uart1: serial@f43291b8 {
+		device_type = "serial";
+		compatible = "cortina-access,serial";
+		reg = <0x00000000 0xf43291b8 0x0 0x30>;
+		clocks = <&apb_pclk>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+	};
+};
-- 
2.39.5


