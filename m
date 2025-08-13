Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB07CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 22:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0Md1MjnRbVsA3QHspXApHKzqfrIcS9N1iDkxacrYYKA=; b=CWPLgSWUixL//hJsrLKHTV6KBO
	BgMSw/HzTTlhWGyWWIqxYX82KJvs92dkxP0Ccp2rNUdHMKLm7rchD9wcccAwnpwKOt7xpEYwaXWtv
	Z4zW6R40VLV34vD4/DnuyfEUqB/yWkBi+UvIO1blvqWY7ddPxAEGaGj29nPVhsKPsRLNuPdqfCZ0Y
	lyGf2mADFziuZOUWlWIMwjVKv9L4cJFwqFNb5x4eI8RI8UcHwYzypmj8wtJmzsa7zyx5tipXPuyfg
	l2n51itUPYWG2KQFEuerCCSJiUmsXSr0gpob7A7tLJm+AqYz9Lh9dsNlqnSeZUrG5Jqb4xjnVhejn
	2ajSdxxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umKEf-0000000FBSe-40m4;
	Wed, 13 Aug 2025 22:46:21 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umEsl-0000000EWWR-0d1r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 17:03:24 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DH39Y21693731;
	Wed, 13 Aug 2025 12:03:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755104589;
	bh=0Md1MjnRbVsA3QHspXApHKzqfrIcS9N1iDkxacrYYKA=;
	h=From:To:CC:Subject:Date;
	b=iJUVujfQqYTeaGlwtS87WXJCvzTu/HMtB5Gf25j/ov15Rg/4m5t+qBz7kdsoNZpUa
	 E8tEQCHgFOeaKCVihG9IHU26R3jR9D2ZPu2AYe2nfD/YWFkZpdYi6wmhUxzImJTY7T
	 YmJi9k6HpXYEi8QH1XoScw/UuPbBdH8BDOH4elU0=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DH39Aj1113140
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 12:03:09 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 12:03:09 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 12:03:09 -0500
Received: from lelvem-mr06.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DH386F2615165;
	Wed, 13 Aug 2025 12:03:09 -0500
From: Andrew Davis <afd@ti.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Russell King
	<linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
        Jean-Marie Verdun
	<verdun@hpe.com>,
        Nick Hawkins <nick.hawkins@hpe.com>
CC: <soc@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH] ARM: mach-hpe: Rework support and directory structure
Date: Wed, 13 Aug 2025 12:03:08 -0500
Message-ID: <20250813170308.290349-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_100323_471220_02C39C3A 
X-CRM114-Status: GOOD (  23.21  )
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

Having a platform need a mach-* directory should be seen as a negative,
it means the platform needs special non-standard handling. ARM64 support
does not allow mach-* directories at all. While we may not get to that
given all the non-standard architectures we support, we should still try
to get as close as we can and reduce the number of mach directories.

The mach-hpe/ directory and files, provides just one "feature":
having the kernel print the machine name if the DTB does not also contain
a "model" string (which they always do). To reduce the number of mach-*
directories let's do without that feature and remove this directory.

Note, we drop the l2c_aux_mask = ~0 line, but this is safe as
the fallback GENERIC_DT machine has that as the default.

Signed-off-by: Andrew Davis <afd@ti.com>
---

Changes for v3:
 - Rebased on v6.17-rc1

Changes for v2:
 - Rebased on v6.13-rc1

 MAINTAINERS                |  1 -
 arch/arm/Kconfig           |  2 --
 arch/arm/Kconfig.platforms | 25 +++++++++++++++++++++++++
 arch/arm/Makefile          |  1 -
 arch/arm/mach-hpe/Kconfig  | 23 -----------------------
 arch/arm/mach-hpe/Makefile |  1 -
 arch/arm/mach-hpe/gxp.c    | 15 ---------------
 7 files changed, 25 insertions(+), 43 deletions(-)
 delete mode 100644 arch/arm/mach-hpe/Kconfig
 delete mode 100644 arch/arm/mach-hpe/Makefile
 delete mode 100644 arch/arm/mach-hpe/gxp.c

diff --git a/MAINTAINERS b/MAINTAINERS
index fe168477caa45..bf5dbbea85782 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2728,7 +2728,6 @@ F:	Documentation/devicetree/bindings/spi/hpe,gxp-spifi.yaml
 F:	Documentation/devicetree/bindings/timer/hpe,gxp-timer.yaml
 F:	Documentation/hwmon/gxp-fan-ctrl.rst
 F:	arch/arm/boot/dts/hpe/
-F:	arch/arm/mach-hpe/
 F:	drivers/clocksource/timer-gxp.c
 F:	drivers/hwmon/gxp-fan-ctrl.c
 F:	drivers/i2c/busses/i2c-gxp.c
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index b1f3df39ed406..f8faa15c6a15f 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -393,8 +393,6 @@ source "arch/arm/mach-highbank/Kconfig"
 
 source "arch/arm/mach-hisi/Kconfig"
 
-source "arch/arm/mach-hpe/Kconfig"
-
 source "arch/arm/mach-imx/Kconfig"
 
 source "arch/arm/mach-ixp4xx/Kconfig"
diff --git a/arch/arm/Kconfig.platforms b/arch/arm/Kconfig.platforms
index 845ab08e20a4b..5c19c1f2cff61 100644
--- a/arch/arm/Kconfig.platforms
+++ b/arch/arm/Kconfig.platforms
@@ -87,6 +87,31 @@ config MACH_ASM9260
 	help
 	  Support for Alphascale ASM9260 based platform.
 
+menuconfig ARCH_HPE
+	bool "HPE SoC support"
+	depends on ARCH_MULTI_V7
+	help
+	  This enables support for HPE ARM based BMC chips.
+
+if ARCH_HPE
+
+config ARCH_HPE_GXP
+	bool "HPE GXP SoC"
+	depends on ARCH_MULTI_V7
+	select ARM_VIC
+	select GENERIC_IRQ_CHIP
+	select CLKSRC_MMIO
+	help
+	  HPE GXP is the name of the HPE Soc. This SoC is used to implement many
+	  BMC features at HPE. It supports ARMv7 architecture based on the Cortex
+	  A9 core. It is capable of using an AXI bus to which a memory controller
+	  is attached. It has multiple SPI interfaces to connect boot flash and
+	  BIOS flash. It uses a 10/100/1000 MAC for network connectivity. It
+	  has multiple i2c engines to drive connectivity with a host
+	  infrastructure.
+
+endif
+
 menuconfig ARCH_MOXART
 	bool "MOXA ART SoC"
 	depends on ARCH_MULTI_V4
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index e31e95ffd33fc..b7de4b6b284ca 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -189,7 +189,6 @@ machine-$(CONFIG_ARCH_FOOTBRIDGE)	+= footbridge
 machine-$(CONFIG_ARCH_GEMINI)		+= gemini
 machine-$(CONFIG_ARCH_HIGHBANK)		+= highbank
 machine-$(CONFIG_ARCH_HISI)		+= hisi
-machine-$(CONFIG_ARCH_HPE)		+= hpe
 machine-$(CONFIG_ARCH_IXP4XX)		+= ixp4xx
 machine-$(CONFIG_ARCH_KEYSTONE)		+= keystone
 machine-$(CONFIG_ARCH_LPC18XX)		+= lpc18xx
diff --git a/arch/arm/mach-hpe/Kconfig b/arch/arm/mach-hpe/Kconfig
deleted file mode 100644
index 3372bbf38d383..0000000000000
--- a/arch/arm/mach-hpe/Kconfig
+++ /dev/null
@@ -1,23 +0,0 @@
-menuconfig ARCH_HPE
-	bool "HPE SoC support"
-	depends on ARCH_MULTI_V7
-	help
-	  This enables support for HPE ARM based BMC chips.
-if ARCH_HPE
-
-config ARCH_HPE_GXP
-	bool "HPE GXP SoC"
-	depends on ARCH_MULTI_V7
-	select ARM_VIC
-	select GENERIC_IRQ_CHIP
-	select CLKSRC_MMIO
-	help
-	  HPE GXP is the name of the HPE Soc. This SoC is used to implement many
-	  BMC features at HPE. It supports ARMv7 architecture based on the Cortex
-	  A9 core. It is capable of using an AXI bus to which a memory controller
-	  is attached. It has multiple SPI interfaces to connect boot flash and
-	  BIOS flash. It uses a 10/100/1000 MAC for network connectivity. It
-	  has multiple i2c engines to drive connectivity with a host
-	  infrastructure.
-
-endif
diff --git a/arch/arm/mach-hpe/Makefile b/arch/arm/mach-hpe/Makefile
deleted file mode 100644
index 8b0a91234df4e..0000000000000
--- a/arch/arm/mach-hpe/Makefile
+++ /dev/null
@@ -1 +0,0 @@
-obj-$(CONFIG_ARCH_HPE_GXP) += gxp.o
diff --git a/arch/arm/mach-hpe/gxp.c b/arch/arm/mach-hpe/gxp.c
deleted file mode 100644
index 581c8da517b86..0000000000000
--- a/arch/arm/mach-hpe/gxp.c
+++ /dev/null
@@ -1,15 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/* Copyright (C) 2022 Hewlett-Packard Enterprise Development Company, L.P. */
-
-#include <asm/mach/arch.h>
-
-static const char * const gxp_board_dt_compat[] = {
-	"hpe,gxp",
-	NULL,
-};
-
-DT_MACHINE_START(GXP_DT, "HPE GXP")
-	.dt_compat	= gxp_board_dt_compat,
-	.l2c_aux_val = 0,
-	.l2c_aux_mask = ~0,
-MACHINE_END
-- 
2.39.2


