Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA17F9D0F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 21:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8wFK0gp3wooXUiFduuNfphtu9sBcwIaPtUN3C7dkqng=; b=wip5mOWMH/xGJfMT54/KbaiiKc
	sU3V9ToUcyGzlltliAr4RZA3zh9eHXlKrx9futQ2karfJ2f4xORUtZYkUWw6eGKx/H2c2lJDdt3PY
	OSnpQzeRQens+Ed6PCtunsI17Nc2uclwhTNHFkISffgQ0xGmCJfCmhqI2wAvOPFtuT0imx/V+q8ib
	pLGhFJIqb+JLeJAkSpUsJZPqOor7Q7AI3kUZ5p+LrCS+jfEGmFErs768HqtsOu/0Ue7FGJXae08pc
	t284JCkT+g8wEYkh3h8wW7cyRtRvxqqILlD6QU3SyBw/rFz2VvYbXbC7TQINMPeFFHOEFqbAZDdxk
	mw04tNig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCl3c-00000000Dre-3wxt;
	Tue, 14 Apr 2026 21:12:28 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCl3Y-00000000DqJ-32zC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 21:12:25 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-43cf8d550bdso5632166f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 14:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776201143; x=1776805943; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wFK0gp3wooXUiFduuNfphtu9sBcwIaPtUN3C7dkqng=;
        b=DFpg4iwXrwFko/egPRbf9YYmvQZl4PUe/YBonnzamuR36V2QgmFaEq94cBqfNpVY5z
         hR/BfFcbzL3YLBbp6+A9eN+Xzk1ata4GWXrQ65zNcKKfPEt9j4lPL9pmezftJ2KzfIil
         wdrVJL6cGhadHeldz6lg+B14CWufFGNgYKQiiLZm8kIucLf4j7viT3+PxeTSl4ZlM6zV
         yKCJuRXg5t9Vbq7lUrseDw/dkEzLcwqPI0pppXmAU0GVxDBqQ22AT9I6UWrqbqp6iGZd
         swhASSKnhlQP/WTHJN1iWJ/TLL/A6GWIabzVxfI7Vu7jThadEfC5AEtxScNE19I2Wx4U
         +C9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776201143; x=1776805943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8wFK0gp3wooXUiFduuNfphtu9sBcwIaPtUN3C7dkqng=;
        b=A8onXpBu19UUgunIJsZg27po90l+CVdbI7M7IsCBxuUOVjtOXfeGqtwm51LB/fVhLu
         E2SG1bSiBzgHt8ZBv4xLwvFDJ4i5Z1EIH58zWbQYibAdMHHxjnfiETSmenx6/E9z87Rl
         eBVEjfCGnrnUXXblh81gK+MMjp9zRQJ12XlocEu+OUUiRm3YgqtoLWGNnrSwxTSAWaXT
         eEwwaW6wDRaSfaSd/bWWTlOgXFqjJloIyA1hqj5bkQqmxtBY/oCFoEFBF1e2bQHiEI3N
         dGbTSzCONbgSEQaQwFyBDZ9NWfQhkVcfv9JpZ/mde2b5NvC7dif7j4QfZ/41c6Nj9DMN
         91iw==
X-Gm-Message-State: AOJu0Yy59Ur6cZjSCDtRL7xBTgTd7Nw88Up9KHqb4f72Sa5frbmcWQmV
	Sc+c19YyXLXHl8kzmYXxeaNMfKSFQqQSyhO+BDuBKZwjwgAh5BUMWRtMBnpncDGU
X-Gm-Gg: AeBDiesi463VfxTD2AVC9QKolbb2DNcw1NKe9N4D/lPcpbDONzz4pX57nzuisMqzNTq
	Ew7UXlytrAZuG1N8RO4+a6n7yeEp9b/aE0Z8UkFh6XADS1G+UZpt4XzCynlxCLM5GkAH4Fi6NVk
	7A2gKpyOJqzdW2poGgrnsGHBZzAO61dNJ9LC7HyXKJ68cTx8tWN26LLaO0w9EbWJ/j49vMTqMwn
	A7NZ4W+tIDRFrT+7en/Ixn0oaeIW337Q295fy7SMjuI73A7SMc6dDD9RzVW2f0R2G5o2tILpifY
	uyKdxgSm1dy/d3+giS6Foh7cm+jrefbrnKnhPOnbjwp5MtzeOZADEhe1cxzd5O+w5ZKblqp/O22
	gtOnYya5g4+HyReisq97zxkPqVu3afZGw6eQr79pR6Xflyjdr7O5vbATyaB6fGoEsjrtYjEc9UR
	8a7NMFWAjQkVysHvYS9vnhxl4CytAL4JukDOYowH0E1OY=
X-Received: by 2002:a5d:5d12:0:b0:43d:613:33de with SMTP id ffacd0b85a97d-43d642a63d1mr28136384f8f.20.1776201142568;
        Tue, 14 Apr 2026 14:12:22 -0700 (PDT)
Received: from strix.doe.home ([197.250.100.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d73b44b3esm27652679f8f.13.2026.04.14.14.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 14:12:22 -0700 (PDT)
From: =?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linusw@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/8] ARM: zte: Add zx297520v3 platform support
Date: Wed, 15 Apr 2026 00:12:08 +0300
Message-ID: <20260414211215.152850-2-stefandoesinger@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260414211215.152850-1-stefandoesinger@gmail.com>
References: <20260414211215.152850-1-stefandoesinger@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_141224_819038_BF43415E 
X-CRM114-Status: GOOD (  36.00  )
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
 Documentation/arch/arm/zte/zx297520v3.rst | 158 ++++++++++++++++++++++
 MAINTAINERS                               |   4 +
 arch/arm/Kconfig                          |   2 +
 arch/arm/Makefile                         |   1 +
 arch/arm/mach-zte/Kconfig                 |  24 ++++
 arch/arm/mach-zte/Makefile                |   2 +
 arch/arm/mach-zte/zx297520v3.c            |  19 +++
 7 files changed, 210 insertions(+)
 create mode 100644 Documentation/arch/arm/zte/zx297520v3.rst
 create mode 100644 arch/arm/mach-zte/Kconfig
 create mode 100644 arch/arm/mach-zte/Makefile
 create mode 100644 arch/arm/mach-zte/zx297520v3.c

diff --git a/Documentation/arch/arm/zte/zx297520v3.rst b/Documentation/arch/arm/zte/zx297520v3.rst
new file mode 100644
index 000000000000..a0f25ade0a3d
--- /dev/null
+++ b/Documentation/arch/arm/zte/zx297520v3.rst
@@ -0,0 +1,158 @@
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
+and buttons. Devices with as low as 32 MB or as high as 128 MB ram exist, as
+do devices with 8 or 16 MB of NOR flash.
+
+Some devices, especially the stationary ones, have 100 mbit Ethernet and an
+Ethernet switch.
+
+Usually the devices have LEDs for status indication, although some have SPI or
+i2c connected displays
+
+Some have an SD card slot. If it exists, it is a better choice for the root
+file system because it easily outperforms the built-in NAND.
+
+The LTE interface runs on a separate DSP called ZSP880. It is probably derived
+from LSI ZSPs and has an undocumented instruction set. The ZSP communicates
+with the main CPU via SRAM and DRAM and a mailbox hardware that can generate
+IRQs on either ends.
+
+There is also a Cortex M0 CPU, which is responsible for early HW initialization
+and starting the Cortex A53 CPU. It does not have any essential purpose once
+U-Boot is started. A SRAM-Based handover protocol exists to run custom code on
+this CPU.
+
+2. Booting via USB
+---------------------------
+
+The Boot ROM has support for booting custom code via USB. This mode can be
+entered by connecting a Boot PIN to GND or by modifying the third byte on NAND
+(set it to anything other than 0x5A aka 'Z'). A free software tool to start
+custom uboot and kernels can be found here:
+
+https://github.com/zx297520v3-mainline/zx297520v3-loader
+
+If USB download mode is entered but no boot commands are sent through USB, the
+device will proceed to boot normally after a few seconds. It is therefore
+possible to enable USB boot permanently and still leave the default boot files
+in place.
+
+3. Building for built-in U-Boot
+---------------------------
+The devices come with an ancient U-Boot that loads legacy uImages from NAND and
+boots them without a chance for the user to interrupt. The images are stored in
+files ap_cpuap.bin and ap_recovery.bin on a jffs2 partition named imagefs,
+usually mtd4. A file named "fotaflag" switches between the two modes.
+
+In addition to the uImage header, those files have a 384 byte signature header,
+which is used for authenticating the images on some devices. Most devices have
+this authentication disabled and it is enough to pad the uImage files with 384
+zero bytes.
+
+Builtin U-Boot also poorly sets up the CPU. Read the next section for details
+on this. It has no support for loading DTBs, so CONFIG_ARM_APPENDED_DTB is
+needed.
+
+So to build an image that boots from NAND the following steps are necessary:
+
+1) Patch the assembly code from section 3 into arch/arm/kernel/head.S.
+2) make zx29_defconfig
+3) make [-j x]
+4) cat arch/arm/boot/zImage arch/arm/boot/dts/zte/[device].dtb > kernel+dtb
+5) mkimage -A arm -O linux -T kernel -C none -a 0x20008000 -d kernel+dtb uimg
+6) dd if=/dev/zero bs=1 count=384 of=ap_recovery.bin
+7) cat uimg >> ap_recovery.bin
+8) Place this file onto imagefs on the device. Delete ap_cpuap.bin if the
+free space is not enough.
+9) Create the file fotaflag: echo -n FOTA-RECOVERY > fotaflag
+
+For development, booting ap_recovery.bin is recommended because the normal boot
+mode arms the watchdog before starting the kernel.
+
+4. CPU and GIC Setup
+---------------------------
+
+Generally CPU and GICv3 need to be set up according to the requirements spelled
+out in Documentation/arch/arm64/booting.rst. For zx297520v3 this means:
+
+1. GICD_CTLR.DS=1 to disable GIC security
+2. Enable access to ICC_SRE
+3. Disable trapping IRQs into monitor mode
+4. Configure EL2 and below to run in insecure mode.
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
index d1cc0e12fe1f..974d7a98956a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29200,6 +29200,10 @@ F:	include/linux/zswap.h
 F:	mm/zswap.c
 F:	tools/testing/selftests/cgroup/test_zswap.c
 
+ZX29
+M:	Stefan Dösinger <stefandoesinger@gmail.com>
+F:	arch/arm/mach-zte/
+
 SENARYTECH AUDIO CODEC DRIVER
 M:	bo liu <bo.liu@senarytech.com>
 S:	Maintained
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index ec33376f8e2b..4217ed704e48 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -464,6 +464,8 @@ source "arch/arm/mach-versatile/Kconfig"
 
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
index 000000000000..24699256863b
--- /dev/null
+++ b/arch/arm/mach-zte/Kconfig
@@ -0,0 +1,24 @@
+# SPDX-License-Identifier: GPL-2.0
+menuconfig ARCH_ZTE
+	bool "ZTE zx family"
+	depends on ARCH_MULTI_V7
+	help
+	  Support for ZTE zx-based family of processors.
+
+if ARCH_ZTE
+
+config SOC_ZX297520V3
+	default y if ARCH_ZTE
+	bool "ZX297520v3"
+	select ARM_GIC_V3
+	select ARM_AMBA
+	select HAVE_ARM_ARCH_TIMER
+	select PM_GENERIC_DOMAINS if PM
+	help
+	  Support for ZTE zx297520v3 SoC. It a single core SoC used in cheap LTE to WiFi routers.
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
index 000000000000..c11c7e836f91
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
+DT_MACHINE_START(ZX, "ZTE zx297520v3 (Device Tree)")
+	.dt_compat	= zx297520v3_dt_compat,
+MACHINE_END
-- 
2.52.0


