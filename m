Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D33F2C79FA7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4LLWAmIM83hLjX1aLVltoTCp2GcYnZjpRVWo34T5DlY=; b=4kRUko9lT69ptya3NsH8F20uAJ
	jViZg9HLjOQQxJfDe2+mS6bIGBC4SgqEPG3vQq3RxtakzowIk5H4RtVkf45zxCWY2GDmXQJnaIhPV
	LrKy3s3hMz6TiXZ7FO/JWLKOQNnagq2Oolahiu7bG2tmcd2z/XKFFiM2XckATsLLY3IS8P0YHktbo
	VJ6tWNEcJIcFmydPgY0qF494r5e/lyA9JYI5mUuHMrHyEdZSEwrUIPchWthH7AfahSpAj7/TiUknJ
	vPSlSF81nz2/5+z8o3ZpmeMoVyokMR4MXv6kxHHZY1vz92RffX16BGWYlGShhP5yvwHu/vXT7XPrj
	yLW9gnEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cPW-00000007M2Q-22Pj;
	Mon, 07 Sep 2026 16:41:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cPM-00000007LpY-3K19
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:41:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 400C2601DE;
	Mon,  7 Sep 2026 16:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF5D1F00A3A;
	Mon,  7 Sep 2026 16:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799284;
	bh=4LLWAmIM83hLjX1aLVltoTCp2GcYnZjpRVWo34T5DlY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lqjI65UaZ6ZoomaEJnyfKR4mPJu1mjJ3kfz/X3YdtfPpUsjUc7McRrSo1m84kosvA
	 r/CgDll1ozsnv30pGdxnWvwCBZ5X8TkN/vxZ5Cx0mjnuGErCDgZydjffe1Mu08f4Fj
	 8+1Job54DTjducrVg/a0CGSRi4r8VCABF0jqHUysj2FnD1O2WhS1yKgq+WjWBbUeWJ
	 RKtF1i1ITara6JsJOgt6dHz+EXlY1AQgu397dcsZcGhH5j5AddYw+45pVOsKvklkql
	 oPnDm2tOqkYAHwYmm2ODVwQOYYpQnsdM5jFRHdCWK4eFDWEWBMq0UH+g5MP4VmXe3i
	 RxITZRi0gXqVw==
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
Subject: [PATCH 17/19] arm64: smp: Pass secondary CPU boot parameters via firmware if possible
Date: Mon,  7 Sep 2026 17:40:20 +0100
Message-ID: <20260907164024.17164-18-will@kernel.org>
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

In preparation for parallel bringup of secondary CPUs, the global
'secondary_data' structure used for initial paramater passing must be
localised.

Pass the idle 'task_struct' pointer for secondary CPUs directly to
->cpu_boot() if the backend supports it.

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
index 3ba4fa14b9e3..c13e635e8a11 100644
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
index b57f8f752f78..95d5328c3f5a 100644
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
2.55.0.979.g7e5102b832-goog


