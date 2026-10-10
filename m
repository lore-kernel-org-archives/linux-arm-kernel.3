Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE61CA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 13:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yAt/7yJPn0972Rii+WXEYTfcVi7V4uYYD90Bl15iiXM=; b=ojF4p/kRB1TbcGpTJ9VIk6lTuy
	TtqO2c/YL7P4erGVOC2y/KtW53VYy1dVRvaVyp9S2fi3SFZU8E/J2Nf31Ao1tXvphLOorIfgKbLkh
	lCAtKqcULVQDyDLD/Ax1sAxnuCdxs6oyMqQHUCcSEg2+aljyAlInX5svPdtLA614apY2laJCnBHIC
	QdqW9aRSGK0novHwklaW2yTAEGiuohmnslzGHu1W0GOCECIsSu3oZJPi/qLWYiAmcipEsasC/YAxI
	MWsjPm7i7glAlzfwocmB3vikddH3ug/pT4AcNR2qhzZiJYE2gD33Kgn8GsmxM3ygzTnbRD6MwmY0E
	3hmiJuWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFWgx-000000083Mp-1Z6s;
	Sat, 10 Oct 2026 13:00:47 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFWgm-000000083DD-0w3L
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 13:00:39 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a1923f15afso1453795e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 06:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637235; x=1792242035; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yAt/7yJPn0972Rii+WXEYTfcVi7V4uYYD90Bl15iiXM=;
        b=Nn/VKCe6cDggTuFmmTQp32pYCXs4DVLOvLpRocfWVU5kVkEoof/EvvXK72nwsNNaLz
         ej+Ro1WOEL0Ew886+m3bNgV5bg7KtQKIia61YYBT+grZWHZcbqBly3wD1zmz26D5JU6D
         K3q+uTUWH47GdqCMDuXbt9WS7PlCDtsEWRhsErwNVnsQBArnEgWsiAmZwribiYUwgLHD
         dBGkalDnWboox8ULA8mkDuiw9Phiypj55aKJ0d92vbg6UTiF7rimw9tLKrdjsVmXRtpK
         7wA1w+PCIxuFtjciBHk5Gz2TyTLNXDXoh9oLj8ct6+OfumtdQ3qtkMdtwR3/PIbWHY1T
         0BNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637235; x=1792242035;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yAt/7yJPn0972Rii+WXEYTfcVi7V4uYYD90Bl15iiXM=;
        b=mPNUhcZj9oaGEpg3NrdKKkn40UCauAer9G3Q9XjDBSExeNErZohCE6ViqPyi07R4gu
         zktJrSIfPH91GkKt/q3Xg/Z6SPibCOg5fnL+9rDZwJvAnpnzpuMj7sIRPEnxlHKlkV24
         f15mLlgzWjaTIF0q0A8BLhQwkALuF34NX27Nsy6pk4gMxWhiQCYYxsB4KNc5uyZVALFo
         LMCE+OSo0Q2x8FL2cWQdRKSWwtLetzZnzhJqNxisuCAyMVbZqK5FFS5BpGvISwfwbnc5
         1tGTb/zdEbF6Uwbw+vwAy+SbBs1NVDPoenJyEDfcxcUGea7JSe93i3FxK9sDhaVgApMJ
         c/Ig==
X-Gm-Message-State: AFq9FYJEyMasDtN2qIru5P9bzHvA6hAdPf07SkJH3AchIAznhZ4QZPKc
	WODJNHQowIPlc7pmFs/QWHu8QQb7or884LrYrOd4tTkKg2X52GAZaw/d53s5riCAVRkGsg==
X-Gm-Gg: AYBFou367H8Mh3Wz1wasZn16RAciE9O66pxqWRCelsUHqVek/y8K4QO5fC3XmYJFAOj
	pq1ohn3jAxaEp5P49oL6EpyiMdfyRdZDoMWFqmGhO+eTS4SpwtR1RMXtXiZ3jsW+4p/GBMLWiv9
	Mt2v9GczdQDywUAw13d/KQ4emuBf0Zk/zhypbHKmeShkuT+kXy9h6XgHVjy11t488v2R65DPzMO
	fRWHKN16TO1rE0mTuxqam9NxZj02puekB5W4NKMo+coTX6HLcvYq5JsjMcY6vz34P5kFx4MbSE1
	jRaxN7P3NL8i5LL1spXVSh9ggp8kRMcLi2rzO5kl2l9rg6WV34RaF0gQANevnNgdYO3V3egbYvK
	gpnQ84Fb7itxbgy7LPbix3w9qUyUfSO1MT3wJnL8dU/ZRvYp2B5q/UkA00q+ONxCV1t87Ip7f4P
	GZrvTDmYjySzranHT5EnA3rBN5DwKkWe+t4+rBmXGRYWGCFFPvfyEzYZUa3AiZIkHgs+knzf15F
	U36SCnGmFt/jBf2ar0rMkAgpo5/+GXv/6VSVNgi67iSXCKtFTLtecIoQIQSToq3tFQTtpecfdPw
	Yd0SVFbcK7sqx3tD08Oi/jFLl3zY8F/O/Iz7EUs/GB+1kZ1uHytF/cYhloz6tmv5ROZ8MZfH
X-Received: by 2002:a05:600c:4688:b0:4a1:8d46:6228 with SMTP id 5b1f17b1804b1-4a18e4a9ba5mr95803285e9.14.1791637234403;
        Sat, 10 Oct 2026 06:00:34 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:33 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 05/24] ARM: zte: Add ZX279128S platform and CPU hotplug support
Date: Sat, 10 Oct 2026 13:59:43 +0100
Message-ID: <20261010130024.177503-6-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_060036_597249_347E6009 
X-CRM114-Status: GOOD (  29.94  )
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

Support the dual Cortex-A9 platform, second-CPU startup through
bootloader SRAM and CPU hotplug. Keep existing ZX297520V3 support
intact.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 MAINTAINERS                           |  22 ++++
 arch/arm/mach-zte/Kconfig             |  17 +++
 arch/arm/mach-zte/Makefile            |   4 +
 arch/arm/mach-zte/platsmp-zx279128s.c | 173 ++++++++++++++++++++++++++
 arch/arm/mach-zte/zx279128s.c         |  19 +++
 5 files changed, 235 insertions(+)
 create mode 100644 arch/arm/mach-zte/platsmp-zx279128s.c
 create mode 100644 arch/arm/mach-zte/zx279128s.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 4f72b4ac27..4d0f4e5485 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3894,6 +3894,28 @@ F:	drivers/video/fbdev/vt8500lcdfb.*
 F:	drivers/video/fbdev/wm8505fb*
 F:	drivers/video/fbdev/wmt_ge_rops.*
 
+ARM/ZTE ZX279128S SOC SUPPORT
+M:	Navid Ghahremani <ghahramani.navid@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/zte,zx279128s-crm.yaml
+F:	Documentation/devicetree/bindings/gpio/zte,zx279128s-gpio.yaml
+F:	Documentation/devicetree/bindings/net/zte,zx279128s-gmac.yaml
+F:	Documentation/devicetree/bindings/net/zte,zx279128s-mdio.yaml
+F:	Documentation/devicetree/bindings/pci/zte,zx279128s-pcie.yaml
+F:	Documentation/devicetree/bindings/spi/zte,zx279128s-spifc.yaml
+F:	Documentation/devicetree/bindings/usb/zte,zx279128s-dwc3.yaml
+F:	arch/arm/boot/dts/zte/zx279128s*
+F:	arch/arm/mach-zte/*zx279128s*
+F:	drivers/clk/zte/clk-zx279128s.c
+F:	drivers/gpio/gpio-zx279128s.c
+F:	drivers/net/ethernet/zte/
+F:	drivers/net/mdio/mdio-zx279128s.c
+F:	drivers/net/phy/sanechips.c
+F:	drivers/pci/controller/dwc/pcie-zx279128s.c
+F:	drivers/spi/spi-zx279128s-spifc.c
+F:	include/dt-bindings/clock/zte,zx279128s-crm.h
+
 ARM/ZTE ZX29 SOC SUPPORT
 M:	Stefan Dösinger <stefandoesinger@gmail.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
diff --git a/arch/arm/mach-zte/Kconfig b/arch/arm/mach-zte/Kconfig
index d3b404ca48..ff3845f109 100644
--- a/arch/arm/mach-zte/Kconfig
+++ b/arch/arm/mach-zte/Kconfig
@@ -26,4 +26,21 @@ config SOC_ZX297520V3
 	  Please read Documentation/arch/arm/zte/zx297520v3.rst on how to boot
 	  the kernel.
 
+config SOC_ZX279128S
+	bool "zx279128s SoC"
+	default y
+	select ARM_AMBA
+	select ARM_GIC
+	select ARM_GLOBAL_TIMER
+	select CACHE_L2X0
+	select CACHE_L2X0_IO_LOCK
+	select CLKSRC_ARM_GLOBAL_TIMER_SCHED_CLOCK
+	select HAVE_ARM_SCU if SMP
+	select HAVE_ARM_TWD if SMP
+	help
+	  Support for the ZTE (Sanechips) zx279128s SoC, a dual-core
+	  Cortex-A9 with an L2C-310 cache controller, used in home gateways
+	  such as the ZTE ZXHN H3600. The second core is started through
+	  the on-chip SRAM, where the boot loader keeps it waiting.
+
 endif
diff --git a/arch/arm/mach-zte/Makefile b/arch/arm/mach-zte/Makefile
index 1bfe4fddd6..72f518632e 100644
--- a/arch/arm/mach-zte/Makefile
+++ b/arch/arm/mach-zte/Makefile
@@ -1,2 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_SOC_ZX297520V3) += zx297520v3.o
+obj-$(CONFIG_SOC_ZX279128S) += zx279128s.o
+ifdef CONFIG_SMP
+obj-$(CONFIG_SOC_ZX279128S) += platsmp-zx279128s.o
+endif
diff --git a/arch/arm/mach-zte/platsmp-zx279128s.c b/arch/arm/mach-zte/platsmp-zx279128s.c
new file mode 100644
index 0000000000..8285b8fb10
--- /dev/null
+++ b/arch/arm/mach-zte/platsmp-zx279128s.c
@@ -0,0 +1,173 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Navid Ghahremani <ghahramani.navid@gmail.com>
+ *
+ * The boot loader runs from on-chip SRAM.  Its reset code sends every
+ * core but CPU0 into a loop: wait for an event (WFE), then jump to the
+ * start of the SRAM, where the boot loader's reset vector leads back to
+ * the WFE.  To start the second core, replace that vector with a jump to
+ * secondary_startup and send an event.
+ *
+ * To take the second core offline again (CPU hotplug, and kexec, which needs
+ * it), the core puts the boot loader's vector back and returns to the boot
+ * loader's loop with the MMU and caches off. That loop is outside the
+ * kernel's memory, so the core survives the kernel being replaced, and the
+ * next start works the same way as the first.
+ */
+
+#include <linux/cacheflush.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/smp.h>
+
+#include <asm/cp15.h>
+#include <asm/idmap.h>
+#include <asm/proc-fns.h>
+#include <asm/smp_scu.h>
+#include <asm/tlbflush.h>
+
+/* ldr pc, [pc, #-4]: jump to the address stored in the next word */
+#define ZX279128S_JUMP_INSN	0xe51ff004
+
+static void __iomem *zx279128s_smp_sram;
+static phys_addr_t zx279128s_smp_sram_phys;
+/* the boot loader's vector, as found at boot */
+static u32 zx279128s_boot_vector[2];
+
+static int zx279128s_boot_secondary(unsigned int cpu, struct task_struct *idle)
+{
+	if (!zx279128s_smp_sram)
+		return -ENODEV;
+
+	/*
+	 * Store the address before the instruction: a core that wakes up
+	 * in between still runs the boot loader's vector and goes back to
+	 * sleep instead of jumping to a stale address.
+	 */
+	writel(__pa_symbol(secondary_startup), zx279128s_smp_sram + 4);
+	writel(ZX279128S_JUMP_INSN, zx279128s_smp_sram);
+
+	/* Complete both writes, then wake the core */
+	dsb_sev();
+
+	return 0;
+}
+
+static void __init zx279128s_smp_prepare_cpus(unsigned int max_cpus)
+{
+	struct device_node *np;
+	struct resource res;
+	void __iomem *scu;
+
+	np = of_find_compatible_node(NULL, NULL, "arm,cortex-a9-scu");
+	if (!np) {
+		pr_err("zx279128s: no SCU node\n");
+		return;
+	}
+	scu = of_iomap(np, 0);
+	of_node_put(np);
+	if (!scu) {
+		pr_err("zx279128s: cannot map the SCU\n");
+		return;
+	}
+	scu_enable(scu);
+	iounmap(scu);
+
+	np = of_find_compatible_node(NULL, NULL, "zte,zx279128s-smp-sram");
+	if (!np) {
+		pr_err("zx279128s: no SMP SRAM node\n");
+		return;
+	}
+	if (of_address_to_resource(np, 0, &res)) {
+		of_node_put(np);
+		pr_err("zx279128s: no SMP SRAM address\n");
+		return;
+	}
+	zx279128s_smp_sram = of_iomap(np, 0);
+	of_node_put(np);
+	if (!zx279128s_smp_sram) {
+		pr_err("zx279128s: cannot map the SMP SRAM\n");
+		return;
+	}
+	zx279128s_smp_sram_phys = res.start;
+	zx279128s_boot_vector[0] = readl(zx279128s_smp_sram);
+	zx279128s_boot_vector[1] = readl(zx279128s_smp_sram + 4);
+
+	/* zx279128s_cpu_die() reads these with its data cache off */
+	sync_cache_w(&zx279128s_smp_sram);
+	sync_cache_w(&zx279128s_smp_sram_phys);
+	sync_cache_w(&zx279128s_boot_vector);
+}
+
+#ifdef CONFIG_HOTPLUG_CPU
+typedef void (*phys_reset_t)(unsigned long addr, bool hvc);
+
+/*
+ * If the vector already holds a jump, an earlier kernel started the core
+ * and did not put the boot loader's vector back: the original is unknown,
+ * so the core cannot be parked safely.
+ */
+static bool zx279128s_cpu_can_disable(unsigned int cpu)
+{
+	return zx279128s_smp_sram &&
+	       zx279128s_boot_vector[0] != ZX279128S_JUMP_INSN;
+}
+
+static void zx279128s_cpu_die(unsigned int cpu)
+{
+	phys_reset_t phys_reset;
+
+	/* Take out a flat mapping, which keeps the kernel mappings too */
+	setup_mm_for_reboot();
+
+	/*
+	 * The boot loader's loop executes the vector, which
+	 * zx279128s_boot_secondary() changes with data writes. Stop caching
+	 * and predicting instructions, as at power-on, so that the parked
+	 * core sees the change.
+	 */
+	set_cr(get_cr() & ~(CR_I | CR_Z));
+	__flush_icache_all();
+	local_flush_bp_all();
+
+	/* Clean the caches and leave coherency with the other core */
+	v7_exit_coherency_flush(louis);
+
+	/*
+	 * Put the boot loader's vector back, instruction word last: the core
+	 * then wakes up into the boot loader's loop, and zx279128s_cpu_kill()
+	 * sees that it is about to leave the kernel.
+	 */
+	writel_relaxed(zx279128s_boot_vector[1], zx279128s_smp_sram + 4);
+	writel_relaxed(zx279128s_boot_vector[0], zx279128s_smp_sram);
+	dsb();
+
+	/* Turn the MMU off and continue at the boot loader's vector */
+	phys_reset = (phys_reset_t)virt_to_idmap(cpu_reset);
+	phys_reset(zx279128s_smp_sram_phys, false);
+}
+
+static int zx279128s_cpu_kill(unsigned int cpu)
+{
+	u32 val;
+
+	/* Wait until the dying core has put the vector back */
+	return !readl_poll_timeout(zx279128s_smp_sram, val,
+				   val == zx279128s_boot_vector[0], 1000,
+				   100 * USEC_PER_MSEC);
+}
+#endif
+
+static const struct smp_operations zx279128s_smp_ops __initconst = {
+	.smp_prepare_cpus	= zx279128s_smp_prepare_cpus,
+	.smp_boot_secondary	= zx279128s_boot_secondary,
+#ifdef CONFIG_HOTPLUG_CPU
+	.cpu_can_disable	= zx279128s_cpu_can_disable,
+	.cpu_die		= zx279128s_cpu_die,
+	.cpu_kill		= zx279128s_cpu_kill,
+#endif
+};
+
+CPU_METHOD_OF_DECLARE(zx279128s_smp, "zte,zx279128s-smp", &zx279128s_smp_ops);
diff --git a/arch/arm/mach-zte/zx279128s.c b/arch/arm/mach-zte/zx279128s.c
new file mode 100644
index 0000000000..064c76f8ad
--- /dev/null
+++ b/arch/arm/mach-zte/zx279128s.c
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Navid Ghahremani <ghahramani.navid@gmail.com>
+ */
+
+#include <asm/mach/arch.h>
+#include <linux/init.h>
+
+static const char *const zx279128s_dt_compat[] __initconst = {
+	"zte,zx279128s",
+	NULL,
+};
+
+DT_MACHINE_START(ZX279128S, "ZTE zx279128s (Device Tree)")
+	.dt_compat	= zx279128s_dt_compat,
+	/* Keep the L2 cache setup of the boot loader and the device tree */
+	.l2c_aux_val	= 0,
+	.l2c_aux_mask	= ~0,
+MACHINE_END
-- 
2.55.0


