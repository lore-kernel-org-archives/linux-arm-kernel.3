Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 601A1CC6B29
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 09:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mpMUcZsIGQVL/iLIKTF7miuHUmKyHgqyxoFn6S/brv8=; b=bl9CyGVE7yFMPLyf9ePGSbHM3v
	3g41ir+1fey6Ou43B+AFgmdIX2qX2avNZRlQ2CzrS6tso+jPOQfXecdMZMqvZI7jQ9RiT0xazRzfQ
	vEqSiOurrj1PPISnXURpAZu4hKsuitgKAHaeFxQEFOOlcKbuuVRIudTmpXYf7F7uVqqpOb6XDPw/P
	z/7SCF8LSkWGZV64dujTBrXmCinAsKFRs6h7BhdfHm+uHgvKGQrCyC50rW1/RIqURPD4uY1vakwrN
	7cjU/hBxFHHyQD2O4c0UQoCH+cwMnVv3WsKWsLY9Q/Fwcb05KwBnTK0zXdtVA3dCLSrF2vr8Dj2Qm
	4i1crG7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtKE-0000000EjCI-1GIR;
	Wed, 14 Oct 2026 07:22:58 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtKA-0000000Ej9a-2BeX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 07:22:55 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso250671f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 00:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962573; x=1792567373; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mpMUcZsIGQVL/iLIKTF7miuHUmKyHgqyxoFn6S/brv8=;
        b=lo9CB014I1dp18U7zUY9gvMcVuBD1qIKxKAHLy9FwUePkc8Z92QljyL81Q79CwrJcO
         VE7URx7hUmu+/pt8puZiUlTHsYWRDP+2aEq6aZJAYlUa0+nFtWLU/uv4lrUJnqg6vQfv
         YJbksLivC5Cv5FX1bxZegi/Davdrmprm1F0R6HwlcPksLx44MSlsk5mFfT4paaSHbKrO
         BxH1cvJdURV5bd8G0R4qwDD1lH9v/B62NsX+/I2ZYzqOhjjhccIrT5kXFDLcCzdD4XRX
         lOaISLOOvrzkyCCXKtV+j5bp44jPC7UjIEhI+qgQv9WP4cfV7cmpROETKPgCpftQ+Yiy
         lScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962573; x=1792567373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mpMUcZsIGQVL/iLIKTF7miuHUmKyHgqyxoFn6S/brv8=;
        b=YJDZExOB5v7boso+MQCiLTCd+IOx9/o2ZTcE1R0I6AVGvmJSnaTzP/MZoGAcu/hk30
         suM5iP2cda/fhAmjN+NUcNXo7526kxmqxrTcaxwYTlYkJ0XHgNSNXgmhZ+zP/KiM0Y8/
         IGPT3Bsh71PofvClCqpsKSXgQrwrXr0jvz7dhmFLcoUqFiUlI7jXI9IHkHXS5IVIueBW
         AW6+BBtCyyX8g95k3YNKlDwyqy1O6+tl1SBObE/shquLJ1/+xOn/SSxslSFkO7D5244Y
         svbBpEwEHGbApSugb8evl5mB/SAq0tVssgajZS6nOqGrS1dxEZd/xWMFEVEFhxtU/pO0
         J9zg==
X-Gm-Message-State: AFq9FYIupBmb9kh0928iXQAMqXMx22nXjh5nT6xmEjZGcvgEekaXNkqn
	fzSIqMGZqhiy2cn+kg3oiyr9CvPrmeCC1BVI1Z5LFp/D4zUJ7oEkJYGus2Uz66c8Juzu4w==
X-Gm-Gg: AYBFou1T3oTRV82MExkk/3SXBx//aOP8ruQUDRBS4hLh5zbQJZ6slR61O8SQx+iJuuW
	NQgwB6GZ2KoyUFO7qun96dLWkR+x1iNMW6ifArZTVis4v+YMxgn44DGbCeIaJkuujpHnjIiVv0R
	LedSqiTYdTK8+4bx2jD2UzewT/t685CoKDXrmeSlu339Q7CAIqkKp+3nkINuMC/kHSq4zEBgCS7
	LfADnckzwsMTtXUyf6IoY114HLW6iQO2e1n/YtbsZM5kR/HM52dpg4P4HGQL0M0z3ceT01Zzwrn
	QFuS9pwC8xlPUqAVofLqLLVIoYzR4D+9tmYYcRNMnRa/pBGz89VWwAqKr8cSyu6XdnlLpkX64aU
	a1BJQM3cdwaUfeVImDKTNLzFv7oq45danE9F+gNnKnm1FanXL+jmJs91axDNfhX2Ywa5PnjosIh
	ACkEcQoJotN96my8xRZDT0qJ4wE2UwJ6X4lGvvOKY0yMB6KCAXFmZBKj0qaBMpkKOjLpSkJC5nC
	+/kMyZ4xmEyn7L2qrbidZOslFZme7uNMQ2L/gHMyMSHOW/eZ39frmnOrr0Uyu+yT9lt+nsB9NM6
	L+vnzqk/nDs6vi3GNU5atSQTh7Q0Yrz7ea1mAwj48LgtPoLwPI3aeUuou04HcQ==
X-Received: by 2002:a5d:5d0e:0:b0:48d:eec6:308b with SMTP id ffacd0b85a97d-48deec631ebmr235007f8f.21.1791962572592;
        Wed, 14 Oct 2026 00:22:52 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm8500933f8f.35.2026.10.14.00.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:22:52 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/24] ARM: zte: Add ZX279128S platform and CPU hotplug support
Date: Wed, 14 Oct 2026 08:20:43 +0100
Message-ID: <20261014072109.1759502-4-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_002254_603789_EC4B7ACE 
X-CRM114-Status: GOOD (  29.26  )
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

Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 arch/arm/mach-zte/Kconfig             |  16 +++
 arch/arm/mach-zte/Makefile            |   4 +
 arch/arm/mach-zte/platsmp-zx279128s.c | 173 ++++++++++++++++++++++++++
 arch/arm/mach-zte/zx279128s.c         |  19 +++
 4 files changed, 212 insertions(+)
 create mode 100644 arch/arm/mach-zte/platsmp-zx279128s.c
 create mode 100644 arch/arm/mach-zte/zx279128s.c

diff --git a/arch/arm/mach-zte/Kconfig b/arch/arm/mach-zte/Kconfig
index d3b404ca48..032079c958 100644
--- a/arch/arm/mach-zte/Kconfig
+++ b/arch/arm/mach-zte/Kconfig
@@ -26,4 +26,20 @@ config SOC_ZX297520V3
 	  Please read Documentation/arch/arm/zte/zx297520v3.rst on how to boot
 	  the kernel.
 
+config SOC_ZX279128S
+	bool "zx279128s SoC"
+	default y
+	select ARM_AMBA
+	select ARM_GIC
+	select ARM_GLOBAL_TIMER
+	select CACHE_L2X0
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


