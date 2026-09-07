Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF41C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TS0d+Qcb5U7cCVHfErBywRPREk4NWc1936JWNuG9+Kw=; b=3tgzNfYBQWHgIZshp9jNn/NZUZ
	abT+Ix2BmZaFYLWsMn5OYSIoxTcvvp4QvFgeKH2fPzIO1qw2xFOKJDUZkPcguQB8UzW2d9scZgPJk
	l6It+iBWc8fJAJ4eT2PtpeXhfRtkpWF4XKcVaVvvsUD56MHz+5cI2Zd93vF9oDKCdhbneM2R/Isjh
	PGaThi70MzYQOJVT5Yx/CCvdQ7MvkM9MLOhWUO3NJN1WB3mu+LvPlgzq3SDFOZbzGlEtnYVpoocnf
	iHkrKfQ1mu2oM66GkVjExnp/9ROF2TgaItWQd0px/zzABsNWKd/z7c9kNQ98v0Gg7BiMVm0nj/8KD
	VvYDHsQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cPW-00000007M2h-2Vip;
	Mon, 07 Sep 2026 16:41:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cPP-00000007LqY-2d3O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:41:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1A4C2601FB;
	Mon,  7 Sep 2026 16:41:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B3E71F00A3D;
	Mon,  7 Sep 2026 16:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799286;
	bh=TS0d+Qcb5U7cCVHfErBywRPREk4NWc1936JWNuG9+Kw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IpuGX1WImTGcOp6VG3QT4xD/Suwr3ntAXeUskBtmTO+PpDhkAaadE8qJiXTbiUZb0
	 B5+3I17hPKRTOB5jxlYF28DRVRfbjAVVhyefFEg0/dfEo9ljuj5iNtUnrrUqtfh01J
	 gXxmw/MwSNkgqL5FA7TePJP57V9kDRS4+zMKBwW1HXuvjbAS/jEMI4pLrORMf9Nlfk
	 2dZ47ElPWL3gjFHor6Y/bQJWJ1f7ILld0Sdv2/niR8zVq+rjqQk4ozYqnwqhkhyy7W
	 bYj1tO5rmc6XVR0hnaUKdNxqMCOLjjW1eir3Gu3HBUxvrjWqXT9PL+wIfL8Sbl6Fc4
	 wp7D/llYIZJXQ==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH 18/19] arm64: smp: Use generic HOTPLUG_PARALLEL machinery for CPU onlining
Date: Mon,  7 Sep 2026 17:40:21 +0100
Message-ID: <20260907164024.17164-19-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907164024.17164-1-will@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Make the move from HOTPLUG_SPLIT_STARTUP to HOTPLUG_PARALLEL and
enable parallel CPU bringup on systems with PSCI v0.2 or later.

The fiddly part of all this is the error handling if a CPU fails to
come up, as we can no longer rely on a single global 'status' flag to
capture the details. Instead, the secondary_data::status field is
replaced with a zero-initialised byte array, with each byte representing
an error reason, so the total set of failures can be accurately captured
by the primary CPU.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/Kconfig                |  2 +-
 arch/arm64/include/asm/smp.h      | 35 +++++++------
 arch/arm64/include/asm/topology.h |  2 +
 arch/arm64/kernel/head.S          | 15 +++---
 arch/arm64/kernel/smp.c           | 81 ++++++++++++++++---------------
 arch/arm64/mm/mmu.c               |  2 +-
 6 files changed, 72 insertions(+), 65 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index fd8cf792b7fd..8d963cec7189 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -230,7 +230,7 @@ config ARM64
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_KPROBES
 	select HAVE_KRETPROBES
-	select HOTPLUG_SPLIT_STARTUP
+	select HOTPLUG_PARALLEL
 	select HOTPLUG_SMT if HOTPLUG_CPU
 	select IRQ_DOMAIN
 	select IRQ_FORCED_THREADING
diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
index 7f2cd84b7785..3decb42164aa 100644
--- a/arch/arm64/include/asm/smp.h
+++ b/arch/arm64/include/asm/smp.h
@@ -7,20 +7,15 @@
 
 #include <linux/const.h>
 
-/* Values for secondary_data.status */
-#define CPU_STUCK_REASON_SHIFT		(8)
-#define CPU_BOOT_STATUS_MASK		((UL(1) << CPU_STUCK_REASON_SHIFT) - 1)
+/* Offsets for early CPU boot reasons */
+#define EARLY_CPU_STUCK_REASON_52_BIT_VA	(0)
+#define EARLY_CPU_STUCK_REASON_NO_GRAN		(1)
+#define EARLY_CPU_STUCK_REASON_MAX		(2)
 
-#define CPU_MMU_OFF			(-1)
-/* The cpu invoked ops->cpu_die, synchronise it with cpu_kill */
-#define CPU_KILL_ME			(1)
-/* The cpu couldn't die gracefully and is looping in the kernel */
-#define CPU_STUCK_IN_KERNEL		(2)
+/* Offsets for late (i.e. MMU-enabled) CPU boot reasons */
 /* Fatal system error detected by secondary CPU, crash the system */
-#define CPU_PANIC_KERNEL		(3)
-
-#define CPU_STUCK_REASON_52_BIT_VA	(UL(1) << CPU_STUCK_REASON_SHIFT)
-#define CPU_STUCK_REASON_NO_GRAN	(UL(2) << CPU_STUCK_REASON_SHIFT)
+#define CPU_PANIC_KERNEL			(0)
+#define CPU_STATUS_FLAGS_MAX			(1)
 
 #ifndef __ASSEMBLER__
 
@@ -81,6 +76,14 @@ static inline void set_smp_ipi_range(int ipi_base, int n)
  */
 asmlinkage void secondary_start_kernel(void);
 
+union secondary_status {
+	u64	val;
+	union {
+		u8	flags[CPU_STATUS_FLAGS_MAX];
+		u8	early_flags[EARLY_CPU_STUCK_REASON_MAX];
+	};
+};
+
 /*
  * Initial data for bringing up a secondary CPU.
  * @status - Result passed back from the secondary CPU to
@@ -88,7 +91,7 @@ asmlinkage void secondary_start_kernel(void);
  */
 struct secondary_data {
 	struct task_struct *task;
-	long status;
+	union secondary_status status;
 	cpumask_t cpu_died_early_mask;
 };
 
@@ -123,9 +126,11 @@ static inline void __noreturn cpu_park_loop(void)
 	}
 }
 
-static inline void update_cpu_boot_status(int val)
+static inline void update_cpu_boot_status(const unsigned int val)
 {
-	WRITE_ONCE(secondary_data.status, val);
+	BUILD_BUG_ON(val >= CPU_STATUS_FLAGS_MAX);
+
+	WRITE_ONCE(secondary_data.status.flags[val], 1);
 	/* Ensure the visibility of the status update */
 	dsb(ishst);
 }
diff --git a/arch/arm64/include/asm/topology.h b/arch/arm64/include/asm/topology.h
index b9eaf4ad7085..f1ff9e40b7cd 100644
--- a/arch/arm64/include/asm/topology.h
+++ b/arch/arm64/include/asm/topology.h
@@ -41,4 +41,6 @@ void update_freq_counters_refs(void);
 
 #include <asm-generic/topology.h>
 
+#define cpu_primary_thread_mask	cpu_none_mask
+
 #endif /* _ASM_ARM_TOPOLOGY_H */
diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index 17868b497d7c..bec4bc1b12db 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -393,7 +393,6 @@ SYM_FUNC_START_LOCAL(__secondary_switched)
 	mov	x0, x20
 	bl	finalise_el2
 
-	str_l	xzr, __early_cpu_boot_status, x3
 	adr_l	x5, vectors
 	msr	vbar_el1, x5
 	isb
@@ -439,15 +438,15 @@ SYM_FUNC_END(set_cpu_boot_mode_flag)
  * with MMU turned off.
  *
  * update_early_cpu_boot_status tmp, status
- *  - Corrupts tmp1, tmp2
- *  - Writes 'status' to __early_cpu_boot_status and makes sure
+ *  - Corrupts tmp1
+ *  - Writes 1 to the 'status' field of __early_cpu_boot_status and makes sure
  *    it is committed to memory.
  */
 
 	.macro	update_early_cpu_boot_status status, tmp1, tmp2
-	mov	\tmp2, #\status
 	adr_l	\tmp1, __early_cpu_boot_status
-	str	\tmp2, [\tmp1]
+	mov	\tmp2, #1
+	strb	w\tmp2, [\tmp1, #\status]
 	dmb	sy
 	dc	ivac, \tmp1			// Invalidate potentially stale cache line
 	.endm
@@ -495,8 +494,7 @@ SYM_FUNC_START(__cpu_secondary_check52bitva)
 	b.ge	2f
 #endif
 
-	update_early_cpu_boot_status \
-		CPU_STUCK_IN_KERNEL | CPU_STUCK_REASON_52_BIT_VA, x0, x1
+	update_early_cpu_boot_status EARLY_CPU_STUCK_REASON_52_BIT_VA, x0, x1
 1:	wfe
 	wfi
 	b	1b
@@ -507,8 +505,7 @@ SYM_FUNC_END(__cpu_secondary_check52bitva)
 
 SYM_FUNC_START_LOCAL(__no_granule_support)
 	/* Indicate that this CPU can't boot and is stuck in the kernel */
-	update_early_cpu_boot_status \
-		CPU_STUCK_IN_KERNEL | CPU_STUCK_REASON_NO_GRAN, x1, x2
+	update_early_cpu_boot_status EARLY_CPU_STUCK_REASON_NO_GRAN, x1, x2
 1:
 	wfe
 	wfi
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 95d5328c3f5a..d5da44949671 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -64,7 +64,7 @@
  */
 struct secondary_data secondary_data = {};
 /* Number of CPUs which aren't online, but looping in kernel text. */
-static int cpus_stuck_in_kernel;
+static bool cpus_stuck_in_kernel;
 
 static int ipi_irq_base __ro_after_init;
 static int nr_ipi __ro_after_init = NR_IPI;
@@ -93,6 +93,18 @@ static inline int op_cpu_kill(unsigned int cpu)
 }
 #endif
 
+static bool smp_parallel_bringup;
+
+bool arch_cpuhp_init_parallel_bringup(void)
+{
+	const struct cpu_operations *ops = get_secondary_cpu_ops();
+
+	smp_parallel_bringup = ops &&
+			       ops->cpu_boot_has_arg &&
+			       ops->cpu_boot_has_arg();
+	return smp_parallel_bringup;
+}
+
 /*
  * Boot a secondary CPU, and assign it the specified idle task.
  * This also gives us the initial stack to use for this CPU.
@@ -107,13 +119,11 @@ int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *idle)
 	 * We need to tell the secondary core where to find its stack and the
 	 * page tables.
 	 */
-	if (ops->cpu_boot_has_arg && ops->cpu_boot_has_arg())
+	if (smp_parallel_bringup)
 		arg = idle;
 	else
 		secondary_data.task = idle;
 
-	update_cpu_boot_status(CPU_MMU_OFF);
-
 	/* Now bring the CPU into our world */
 	if (ops->cpu_boot)
 		ret = ops->cpu_boot(cpu, (unsigned long)arg);
@@ -125,45 +135,42 @@ int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *idle)
 
 void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu, bool is_alive)
 {
-	long status;
+	union secondary_status status;
 
 	if (is_alive)
 		return;
 
-	secondary_data.task = NULL;
-	status = READ_ONCE(secondary_data.status);
-	if (status == CPU_MMU_OFF)
-		status = READ_ONCE(__early_cpu_boot_status);
-
 	/* A CPU has failed to boot. Try to figure out what happened. */
-	switch (status & CPU_BOOT_STATUS_MASK) {
-	default:
-		pr_err("CPU%u: failed in unknown state : 0x%lx\n",
-		       cpu, status);
-		cpus_stuck_in_kernel++;
-		break;
-	case CPU_KILL_ME:
-		if (cpumask_test_cpu(cpu, &secondary_data.cpu_died_early_mask))
-			set_cpu_present(cpu, false);
+	if (smp_parallel_bringup)
+		pr_warn_once("Parallel CPU bringup failed; consider passing \"cpuhp.parallel=off\" for a more accurate diagnosis.\n");
+	else
+		secondary_data.task = NULL;
+
+	status.val = READ_ONCE(__early_cpu_boot_status);
+	if (status.early_flags[EARLY_CPU_STUCK_REASON_52_BIT_VA]) {
+		pr_crit_once("CPU%u detected lack of support for 52-bit VAs\n",
+			     cpu);
+	}
+
+	if (status.early_flags[EARLY_CPU_STUCK_REASON_NO_GRAN]) {
+		pr_crit_once("CPU%u detected lack of support for %luK granules\n",
+			     cpu, PAGE_SIZE / SZ_1K);
+	}
+
+	status = READ_ONCE(secondary_data.status);
+	if (status.flags[CPU_PANIC_KERNEL])
+		panic("CPU%u detected unsupported configuration\n", cpu);
+
+	if (cpumask_test_cpu(cpu, &secondary_data.cpu_died_early_mask)) {
+		set_cpu_present(cpu, false);
 		if (!op_cpu_kill(cpu)) {
 			pr_crit("CPU%u: died during early boot\n", cpu);
-			break;
+			return;
 		}
-		pr_crit("CPU%u: may not have shut down cleanly\n", cpu);
-		fallthrough;
-	case CPU_STUCK_IN_KERNEL:
-		pr_crit("CPU%u: is stuck in kernel\n", cpu);
-		if (status & CPU_STUCK_REASON_52_BIT_VA)
-			pr_crit("CPU%u: does not support 52-bit VAs\n", cpu);
-		if (status & CPU_STUCK_REASON_NO_GRAN) {
-			pr_crit("CPU%u: does not support %luK granule\n",
-				cpu, PAGE_SIZE / SZ_1K);
-		}
-		cpus_stuck_in_kernel++;
-		break;
-	case CPU_PANIC_KERNEL:
-		panic("CPU%u detected unsupported configuration\n", cpu);
 	}
+
+	pr_crit_once("CPUs may be stuck in kernel\n");
+	cpus_stuck_in_kernel = true;
 }
 
 static void init_gic_priority_masking(void)
@@ -407,12 +414,8 @@ void __noreturn cpu_die_early(void)
 
 	cpumask_set_cpu(cpu, &secondary_data.cpu_died_early_mask);
 
-	if (IS_ENABLED(CONFIG_HOTPLUG_CPU)) {
-		update_cpu_boot_status(CPU_KILL_ME);
+	if (IS_ENABLED(CONFIG_HOTPLUG_CPU))
 		__cpu_try_die(cpu);
-	}
-
-	update_cpu_boot_status(CPU_STUCK_IN_KERNEL);
 
 	cpu_park_loop();
 }
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 79d90226fd5d..59e572a09304 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -61,7 +61,7 @@ static bool rodata_is_rw __ro_after_init = true;
  * The booting CPU updates the failed status @__early_cpu_boot_status,
  * with MMU turned off.
  */
-long __section(".mmuoff.data.write") __early_cpu_boot_status;
+long __section(".mmuoff.data.write") __early_cpu_boot_status = 0;
 
 static DEFINE_SPINLOCK(swapper_pgdir_lock);
 static DEFINE_MUTEX(fixmap_lock);
-- 
2.55.0.979.g7e5102b832-goog


