Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06256D46BFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 20:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ivrCV94WmRsG3UJQEpI4nokKADv1VpiwgzFohf+xhyQ=; b=ZVDfuyMskBq/RQUph+r1M+s+Ug
	1c8TGUJ/hWOkpkrYC6v7Id7X9C4Fj8aLsKa7v2Visnb9Hl+rfw2Bj0sgIGk+R+IYXMjIfcuuC5FK5
	RGvHZOtWV1g7daj+Tj3/3h7hkJMYhuqTFTeD3pPmG6DWMPvs7hiQfG1wJGl0kB9p99W4NlbD4x9nh
	dzeNWWRHj3V8bJvqToFEPDpM3jFFIsdWmkfILqXFQemgY4dn5+TeZSPHUb8zq8OrGaBSjiG+BmKx7
	qCJDOSH08JK142KwW5THznMdd1yaStpzD2QAso/yEeHyIG4ciV7IwVKoP5GWwbHzjTetvVTpD/dX+
	stEgCr/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlCFq-0000000Gm9q-1eVa;
	Wed, 28 Jan 2026 20:35:10 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlCFm-0000000Gm7Y-0RjR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 20:35:07 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-42fed090e5fso233952f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 12:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769632504; x=1770237304; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ivrCV94WmRsG3UJQEpI4nokKADv1VpiwgzFohf+xhyQ=;
        b=L4hPNjPjjkj9gJ6HSQ4It4nBW+C+2cROgOJcjmbf9oGi4EsBZvXxOPT9G84rV4g8j6
         sL/u8KLETPwilf+B7SX8qoXTTnGcGoP/0Q2NTKALFO7HwGk0Vi3aJ4pfB+oKdLaKpLub
         kjCHGIdUDGlQ3V+nf9bOuO0s+a8fnPYkKSw7LYbze/u/PBkwtPTa+4s1ylL62ox28soq
         FXlDrPatd9Vp1M0O8gF9W+1tclFw4Kj71SBv2kGr9CVQCRLk/GNVb/57Khf14N5eaiJM
         s8OiBiNooCb+pJtTYL+6RUuOQbTtMSONxen4p/TThbYws4SJzoiB6S8CSe2LJVviyBno
         S6QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769632504; x=1770237304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ivrCV94WmRsG3UJQEpI4nokKADv1VpiwgzFohf+xhyQ=;
        b=ihDMXwDQsoArCVMZYC1i9ulZzJAsXkwJ929FMxAnjIvbAnaSemO61+J9n9eKySTJme
         aaMbDHaulZ6Bh1bpegY6wSVPHA3IJ8aNWANRxwGHaeGRAeGiNPv5RKCEq6yNWj1hudkK
         4ld+VryQ6ITgeP5WPf4wAoEAr5I54LoxcWVSRuV1bTSsgLP4PihezK16Vhlh7n9BTuCM
         YWkSGSiIyf47+Q51Goq/wkz31dp7Xkxsg8XaO+PVbu6jpRK1ikhPMMt8pc4woFjZKrOr
         7bBZs54qEzq51Sl+aBM9/X0uzoxpAlITSDht4IzYM5/MH/4ekgG6swEJKtSH9FQH0706
         vSGg==
X-Gm-Message-State: AOJu0YzBoJAr9S6cJUagzA/lQwl9fRlsD51dg4UmlRlb9aGUc2kHvy+F
	f8P7cpc3HKbkXRFTi3w84xc1HivV1LCZcCDzex+NZp4Kls90s0UyJfzet4+AE1GU
X-Gm-Gg: AZuq6aI2TRbhHgP8xwaQ/72aiiQqwxRpt75JzZ6gtkApE5AnyHUeMinApRHBU5Navkw
	wCiWVZkk4E+YD7vFpPIwHMide0w3hUQ0Mnrtv2DslILz8ocz1I6FNl20/NP0KL+ir/S+BFuktKj
	S0o/4J18/PQBf8X8LtuD772QFXA8AUAaKyRH5gFphlCzQj3czvaf/MA08axCzuNMRaXcxR2dB/L
	zZy92pINoxaGyz3dsjpW+0V1nVCsT2eY8Jkwl5VSptS2Ul2QmmCHS/g6wzGYu+3dUqpHQq7dUEl
	cRQI1bKZAgFxzJsDVa2m/dqPFRBGxIg03G/gMQN8iwin3pBvfllVKASaBdg308m6lsYcv/oJkdf
	5PQkxR98AuQPXn0CFl4vfMf+1whw4W4wu7mis6A3hqHrvE5z142ChTP3pKxfPTcThDa6QMURtpL
	3SplAl+spRK+ldwO+xBDUy7Cdd
X-Received: by 2002:a05:6000:401e:b0:431:74:cca with SMTP id ffacd0b85a97d-435dd0b29fcmr9152671f8f.44.1769632503750;
        Wed, 28 Jan 2026 12:35:03 -0800 (PST)
Received: from strix.doe.home ([197.250.227.106])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee04csm9577644f8f.12.2026.01.28.12.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 12:35:03 -0800 (PST)
From: =?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: soc@lists.linux.dev,
	linus.walleij@linaro.org,
	Jun Nie <jun.nie@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Drew Fustini <fustini@kernel.org>
Subject: [RFC PATCH v2 1/7] ARM: zte: Add zx297520v3 platform support.
Date: Wed, 28 Jan 2026 23:34:49 +0300
Message-ID: <20260128203455.38569-2-stefandoesinger@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128203455.38569-1-stefandoesinger@gmail.com>
References: <20260128203455.38569-1-stefandoesinger@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_123506_185601_9D7C3BAD 
X-CRM114-Status: GOOD (  26.60  )
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

This SoC is used in low end LTE-to-WiFi routers, for example some D-Link
DWR 932 revisions, ZTE K10, ZLT S10 4G, but also models that are branded
and sold by ISPs themselves. They are widespread in Africa, China,
Russia and Eastern Europe.

This SoC is a relative of the zx296702 and zx296718 that had some
upstream support until commit 89d4f98ae90d ("ARM: remove zte zx
platform"). My eventual goal is to enable OpenWRT to run on these
devices.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 Documentation/arch/arm/zte/zx297520v3.rst | 106 ++++++++++++++++++++++
 MAINTAINERS                               |   4 +
 arch/arm/Kconfig                          |   2 +
 arch/arm/Makefile                         |   1 +
 arch/arm/mach-zte/Kconfig                 |  23 +++++
 arch/arm/mach-zte/Makefile                |   2 +
 arch/arm/mach-zte/zx297520v3.c            |  19 ++++
 7 files changed, 157 insertions(+)
 create mode 100644 Documentation/arch/arm/zte/zx297520v3.rst
 create mode 100644 arch/arm/mach-zte/Kconfig
 create mode 100644 arch/arm/mach-zte/Makefile
 create mode 100644 arch/arm/mach-zte/zx297520v3.c

diff --git a/Documentation/arch/arm/zte/zx297520v3.rst b/Documentation/arch/arm/zte/zx297520v3.rst
new file mode 100644
index 000000000000..cfa40ca6baaf
--- /dev/null
+++ b/Documentation/arch/arm/zte/zx297520v3.rst
@@ -0,0 +1,106 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+====================================
+Booting Linux on ZTE zx297520v3 SoCs
+====================================
+
+...............................................................................
+
+Author:	Stefan Dösinger
+
+Date  : 27 Jan 2026
+
+1. Hardware description
+---------------------------
+Zx297520v3 SoCs use a 64 bit capable Cortex-A53 CPU and GICv3, although they
+run in aarch32 mode only. The CPU has support EL3, but no hypervisor (EL2) and
+it seems to lack VFP and NEON.
+
+The SoC is used in a number of cheap LTE to Wifi routers, both battery powered
+MiFis and stationary CPEs. In addition to the CPU these devices usually have
+64 MB Ram (although some is shared with the LTE chip), 128 MB NAND flash, an
+SDIO connected RTL8192-type Wifi chip limited to 2.4 ghz operation, USB 2,
+and buttons.
+
+Some devices, especially the stationary ones, have 100 mbit Ethernet, and an
+Ethernet switch.
+
+Usually the devices have LEDs for status indication, although some have SPI-
+connected displays.
+
+Some have an SD card slot. If it exists, it is a better choice for the root
+file system because it easily outperforms the built-in NAND.
+
+The LTE interface appears to be run by a separate Cortex-M0 CPU that runs a
+non-Linux binary blob and communicates with the main CPU via RPMsg.
+
+2. Booting
+---------------------------
+
+Generally CPU and GICv3 need to be set up according to the requirements spelled
+out in Documentation/arch/arm64/booting.rst. For zx297520v3 this means:
+
+1. GICD_CTLR.DS=1 to disable GIC security
+2. Enable access to ICC_SRE
+3. Disable trapping IRQs into monitor mode
+4. Configure EL2 and below to run in insecure mode.
+
+And an unrelated: This needs to be moved into a driver eventually:
+5. Configure timer PPIs to active-low.
+
+The kernel sources provided by ZTE do not boot either (interrupts do not work
+at all). They are incomplete in other aspects too, so it is assumed that there
+is some workaround similar to the one described in this document somewhere in
+the binary blobs.
+
+The assembly code below is given as an example of how to achieve this:
+
+```
+#include <linux/irqchip/arm-gic-v3.h>
+#include <asm/assembler.h>
+#include <asm/cp15.h>
+
+@ This allows EL1 to handle ints hat are normally handled by EL2/3.
+ldr     r3, =0xf2000000
+ldr     r4, =#(GICD_CTLR_ARE_NS | GICD_CTLR_DS)
+str     r4, [r3]
+
+cps     #MON_MODE
+
+@ Work in non-secure physical address space: SCR_EL3.NS = 1. At least the UART
+@ seems to respond only to non-secure addresses. I have taken insipiration from
+@ Raspberry pi's armstub7.S here.
+@
+@ ARM docs say modify this bit in monitor mode only...
+mrc     p15, 0, r3, c1, c1, 0
+mov	r3, #0x131			@ non-secure, Make F, A bits in CPSR writeable
+					@ Allow hypervisor call.
+mcr     p15, 0, r3, c1, c1, 0
+
+@ AP_PPI_MODE_REG: Configure timer PPIs (10, 11, 13, 14) to active-low.
+ldr	r3, =0xF22020a8
+ldr	r4, =0x50
+str	r4, [r3]
+ldr	r3, =0xF22020ac
+ldr	r4, =0x14
+str	r4, [r3]
+
+@ Enable EL2 access to ICC_SRE (bit 3, ICC_SRE_EL3.Enable). Enable system reg
+@ access to GICv3 registers (bit 0, ICC_SRE_EL3.SRE) for EL1 and EL3.
+mrc     p15, 6, r3, c12, c12, 5         @ ICC_SRE_EL3
+orr     r3, #0x9                        @ FIXME: No defines for SRE_EL3 values?
+mcr     p15, 6, r3, c12, c12, 5
+mrc     p15, 0, r3, c12, c12, 5         @ ICC_SRE_EL1
+orr     r3, #(ICC_SRE_EL1_SRE)
+mcr     p15, 0, r3, c12, c12, 5
+
+@ Like ICC_SRE_EL3, enable EL1 access to ICC_SRE and system register access
+@ for EL2.
+mrc     p15, 4, r3, c12, c9, 5          @ ICC_SRE_EL2 aka ICC_HSRE
+orr     r3, r3, #(ICC_SRE_EL2_ENABLE | ICC_SRE_EL2_SRE)
+mcr     p15, 4, r3, c12, c9, 5
+isb
+
+@ Back to SVC mode. TODO: Doesn't safe_svcmode_maskall do this for us anyway?
+cps     #SVC_MODE
+```
diff --git a/MAINTAINERS b/MAINTAINERS
index e8f06145fb54..225392cf3b5b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28392,6 +28392,10 @@ F:	lib/zstd/
 N:	zstd
 K:	zstd
 
+ZX29
+M:	Stefan Dösinger <stefandoesinger@gmail.com>
+F:	arch/arm/mach-zte/
+
 ZSWAP COMPRESSED SWAP CACHING
 M:	Johannes Weiner <hannes@cmpxchg.org>
 M:	Yosry Ahmed <yosry.ahmed@linux.dev>
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 4fb985b76e97..bd2cae242603 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -463,6 +463,8 @@ source "arch/arm/mach-versatile/Kconfig"
 
 source "arch/arm/mach-vt8500/Kconfig"
 
+source "arch/arm/mach-zte/Kconfig"
+
 source "arch/arm/mach-zynq/Kconfig"
 
 # ARMv7-M architecture
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index b7de4b6b284c..573813ef5e77 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -223,6 +223,7 @@ machine-$(CONFIG_ARCH_SUNXI)		+= sunxi
 machine-$(CONFIG_ARCH_TEGRA)		+= tegra
 machine-$(CONFIG_ARCH_U8500)		+= ux500
 machine-$(CONFIG_ARCH_VT8500)		+= vt8500
+machine-$(CONFIG_ARCH_ZTE)		+= zte
 machine-$(CONFIG_ARCH_ZYNQ)		+= zynq
 machine-$(CONFIG_PLAT_VERSATILE)	+= versatile
 machine-$(CONFIG_PLAT_SPEAR)		+= spear
diff --git a/arch/arm/mach-zte/Kconfig b/arch/arm/mach-zte/Kconfig
new file mode 100644
index 000000000000..373889b72005
--- /dev/null
+++ b/arch/arm/mach-zte/Kconfig
@@ -0,0 +1,23 @@
+# SPDX-License-Identifier: GPL-2.0
+menuconfig ARCH_ZTE
+	bool "ZTE ZX family"
+	depends on ARCH_MULTI_V7
+	help
+	  Support for ZTE ZX-based family of processors.
+
+if ARCH_ZTE
+
+config SOC_ZX297520V3
+	default y if ARCH_ZTE
+	bool "ZX297520v3"
+	select ARM_GIC_V3
+	select HAVE_ARM_ARCH_TIMER
+	select PM_GENERIC_DOMAINS if PM
+	help
+	  Support for ZTE ZX297520v3 SoC. It a single core SoC used in cheap LTE to WiFi routers.
+	  These devices can be Identified by the occurrence of the string "zx297520v3" in the boot
+	  output and /proc/cpuinfo of their stock firmware.
+
+	  Please read Documentation/arch/arm/zte/zx297520v3.rst on how to boot the kernel.
+
+endif
diff --git a/arch/arm/mach-zte/Makefile b/arch/arm/mach-zte/Makefile
new file mode 100644
index 000000000000..1bfe4fddd6af
--- /dev/null
+++ b/arch/arm/mach-zte/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_SOC_ZX297520V3) += zx297520v3.o
diff --git a/arch/arm/mach-zte/zx297520v3.c b/arch/arm/mach-zte/zx297520v3.c
new file mode 100644
index 000000000000..e8db18c2f665
--- /dev/null
+++ b/arch/arm/mach-zte/zx297520v3.c
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2026 Stefan Dösinger
+ */
+
+#include <asm/mach/arch.h>
+#include <asm/mach/map.h>
+
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+
+static const char *const zx297520v3_dt_compat[] __initconst = {
+	"zte,zx297520v3",
+	NULL,
+};
+
+DT_MACHINE_START(ZX, "ZTE ZX297520v3 (Device Tree)")
+	.dt_compat	= zx297520v3_dt_compat,
+MACHINE_END
-- 
2.52.0


