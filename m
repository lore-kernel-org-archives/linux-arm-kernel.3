Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 914C3CA6012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 10:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0deMOOkKM1Zzx2mLD7YuJf2kxSlJNqIuFqXW0gdc4ZI=; b=wBFbRlGAjI5pjpwtOw5r2P9DRs
	pC3Pt662oopYuHsmjdfTar7Xe6h1rYzOROjByiQyXHiL4D+o/42m1DeLiRrHP/0XoNNMAvSJj6KxX
	aEeauxm5o2vobdV+R96LFEGNPbFtzLzQuS/L9Vyc4d9qGSkqaHO93DGq1B90+/gJqeOlVybjj9Kua
	tiNAU87dXgw4jLNS5YNfiqlfCT/p672B3BP4l3X+fmaGY7vpvc6Fys508J7sbOMk4STeFM6RSSR4G
	QTBzvbLWc/+Cv9xOjj3mE3ixM3WLv3ecjq2+rL7bMwanHP2ct88fenYPXoLeFSLmiFGsHMyVP3iU6
	o7KUs+Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7XJ-0000000603S-3VCQ;
	Fri, 09 Oct 2026 10:09:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7XH-00000006002-45Qz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 10:09:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5B62760DC4;
	Fri,  9 Oct 2026 10:09:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D45361F00893;
	Fri,  9 Oct 2026 10:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540547;
	bh=0deMOOkKM1Zzx2mLD7YuJf2kxSlJNqIuFqXW0gdc4ZI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=e7Gh36tYXmNMCo57ukPodpx+NI4nz02QHrmC/H2uelnyXVa89ybr8dBWww0y2rjEO
	 HdUn0OYm2vZnz1hWyp+JJ6qfS77WI0V7FsSVXqvG3HraxSxCeeahTcUHgsienkjhcy
	 /33O39I49Jl/PL4hWRzL7lYov0mwqSEU3KmiV4IUXMrvimGYGkD3E5JZ1zyWi7+8VB
	 gdUEOp9hoDuzmcOE+V5L3uZPkHdZZBSX8KZUjL49qe2UTU2Cys/9KnM1px1da7GBno
	 f2aNdZVUPZF7tO+ImMOkQZX/2lBYKQKyclkfxW4CcOQPSvR9g1MMREMlaGIiAiUDqE
	 mDNQIPJF7X2IA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	=?UTF-8?q?=C8=98tefania=20Ion?= <stefion@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Tarun Sahu <tarunsahu@google.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2 21/23] arm64: smp: Pass secondary CPU boot parameters via firmware if possible
Date: Fri,  9 Oct 2026 11:07:32 +0100
Message-ID: <20261009100738.31288-22-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261009100738.31288-1-will@kernel.org>
References: <20261009100738.31288-1-will@kernel.org>
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

In preparation for parallel bringup of secondary CPUs, the global
'secondary_data' structure used for initial paramater passing must be
localised.

Pass the idle 'task_struct' pointer for secondary CPUs directly to
->cpu_boot() if the backend supports it.

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/smp.h |  1 +
 arch/arm64/kernel/head.S     | 12 +++++++++++-
 arch/arm64/kernel/psci.c     |  4 ++--
 arch/arm64/kernel/smp.c      | 25 +++++++++++--------------
 4 files changed, 25 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
index 7b986a6a765b..7f2cd84b7785 100644
--- a/arch/arm64/include/asm/smp.h
+++ b/arch/arm64/include/asm/smp.h
@@ -95,6 +95,7 @@ struct secondary_data {
 extern struct secondary_data secondary_data;
 extern long __early_cpu_boot_status;
 extern void secondary_entry(void);
+extern void secondary_entry_with_arg(void);
 
 extern void arch_send_call_function_single_ipi(int cpu);
 extern void arch_send_call_function_ipi_mask(const struct cpumask *mask);
diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index 87a822e5c4ca..17868b497d7c 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -335,6 +335,7 @@ SYM_FUNC_END(init_kernel_el)
 	 * cores are held until we're ready for them to initialise.
 	 */
 SYM_FUNC_START(secondary_holding_pen)
+	mov	x19, xzr
 	mov	x0, xzr
 	bl	init_kernel_el			// w0=cpu_boot_mode
 	mrs	x2, mpidr_el1
@@ -353,10 +354,16 @@ SYM_FUNC_END(secondary_holding_pen)
 	 * be used where CPUs are brought online dynamically by the kernel.
 	 */
 SYM_FUNC_START(secondary_entry)
+	mov	x0, xzr
+	b	secondary_entry_with_arg
+SYM_FUNC_END(secondary_entry)
+
+SYM_FUNC_START(secondary_entry_with_arg)
+	mov	x19, x0
 	mov	x0, xzr
 	bl	init_kernel_el			// w0=cpu_boot_mode
 	b	secondary_startup
-SYM_FUNC_END(secondary_entry)
+SYM_FUNC_END(secondary_entry_with_arg)
 
 SYM_FUNC_START_LOCAL(secondary_startup)
 	/*
@@ -391,10 +398,13 @@ SYM_FUNC_START_LOCAL(__secondary_switched)
 	msr	vbar_el1, x5
 	isb
 
+	mov	x2, x19
+	cbnz	x2, 1f
 	adr_l	x0, secondary_data
 	ldr	x2, [x0, #CPU_BOOT_TASK]
 	cbz	x2, __secondary_too_slow
 
+1:
 	init_cpu_task x2, x1, x3
 
 #ifdef CONFIG_ARM64_PTR_AUTH
diff --git a/arch/arm64/kernel/psci.c b/arch/arm64/kernel/psci.c
index 8cd74a77de2e..54aa91039b69 100644
--- a/arch/arm64/kernel/psci.c
+++ b/arch/arm64/kernel/psci.c
@@ -38,8 +38,8 @@ static int __init cpu_psci_cpu_prepare(unsigned int cpu)
 
 static int cpu_psci_cpu_boot(unsigned int cpu, unsigned long context)
 {
-	phys_addr_t pa_secondary_entry = __pa_symbol(secondary_entry);
-	int err = psci_ops.cpu_on(cpu_logical_map(cpu), pa_secondary_entry,
+	void *entry_va = context ? secondary_entry_with_arg : secondary_entry;
+	int err = psci_ops.cpu_on(cpu_logical_map(cpu), __pa_symbol(entry_va),
 				  context);
 	if (err && err != -EPERM)
 		pr_err("failed to boot CPU%d (%d)\n", cpu, err);
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 29c70616a107..fb3a93090a3c 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -93,34 +93,31 @@ static inline int op_cpu_kill(unsigned int cpu)
 }
 #endif
 
-
 /*
  * Boot a secondary CPU, and assign it the specified idle task.
  * This also gives us the initial stack to use for this CPU.
  */
-static int boot_secondary(unsigned int cpu, struct task_struct *idle)
-{
-	const struct cpu_operations *ops = get_secondary_cpu_ops();
-
-	if (ops->cpu_boot)
-		return ops->cpu_boot(cpu, 0);
-
-	return -EOPNOTSUPP;
-}
-
 int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *idle)
 {
-	int ret;
+	const struct cpu_operations *ops = get_secondary_cpu_ops();
+	int ret = -EOPNOTSUPP;
+	void *arg = NULL;
 
 	/*
 	 * We need to tell the secondary core where to find its stack and the
 	 * page tables.
 	 */
-	secondary_data.task = idle;
+	if (ops->cpu_boot_has_arg && ops->cpu_boot_has_arg())
+		arg = idle;
+	else
+		secondary_data.task = idle;
+
 	update_cpu_boot_status(CPU_MMU_OFF);
 
 	/* Now bring the CPU into our world */
-	ret = boot_secondary(cpu, idle);
+	if (ops->cpu_boot)
+		ret = ops->cpu_boot(cpu, (unsigned long)arg);
+
 	if (ret && ret != -EPERM)
 		pr_err("CPU%u: failed to boot: %d\n", cpu, ret);
 	return ret;
-- 
2.56.0.385.gd3acb90ef8-goog


