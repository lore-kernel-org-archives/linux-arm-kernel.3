Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B31CECA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 10:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ru0ZoHw/Kw/Oi/vluVCYpEmBr1d9awOz5x+e4Gf6Zco=; b=tR5PgupGcI5iJPyRjMRSjKsRRF
	5fNk/PFTLrQBn2Pe5Y1p6ZcjSdjw9fhEG54esTidUWAoUSDRPoGlpKq/VNNvk7crrzqt/PUIL4/RJ
	u1xW8m9trluPhJf22aonnxU7C3XtPzergLNfSHyQkWQmYQFZUsFhOAlJrkez6sJcHJyslaqlfxxQi
	dvV4o7od91aQzIv5pRkik0VWu4iv5+XDBROrjvlzYHU8lQ176pfWIURaeJ65MdE/x82DWn+Bwzzdy
	VMh3ioLEZXvAvqpjHtTUOuTRI8en+Dk2uugTXJaq0OWz6brOJ3hLgQKyrDt+n80QM3xnMaajcGKLx
	cyse5ZYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7Ws-00000005zXd-2vDJ;
	Fri, 09 Oct 2026 10:08:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7Wq-00000005zVG-3pdM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 10:08:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A1CCC42DB3;
	Fri,  9 Oct 2026 10:08:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 535461F00898;
	Fri,  9 Oct 2026 10:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540520;
	bh=Ru0ZoHw/Kw/Oi/vluVCYpEmBr1d9awOz5x+e4Gf6Zco=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ejB5Aap7qJB0eLqC9SCRtQkfIzIVoxG+agEWiICmAbabgdIbGpLmahPjhX51KU6Ae
	 Mm65RyqPdlWxbdMsnt/+vHbaYgaYtxQzrwvMD0I6m8FzIkifN6QwgdMEuVLNePLVZU
	 QkoK6HuR00qeEbKKmCXOTreibk4W7VwYoZUbO2Y3CHJCF7rc0cyDMSwsi7m8d04goY
	 Og4U9Rxrm8Tz1Inp963L/xP2rm/M2s5DNs4+I3STE7TfP+tUPPHcFNhzQsmjDtUMMv
	 2G96mwGkmW974dA6X/FKOO8CdjuVFHfOQTIr4iL6OgZxc8evyrEyubuJnsdDM8Vkef
	 SS9Xk+mzxeJPA==
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
Subject: [PATCH v2 14/23] arm64: smp: Use generic HOTPLUG_CORE_SYNC_FULL machinery for CPU onlining
Date: Fri,  9 Oct 2026 11:07:25 +0100
Message-ID: <20261009100738.31288-15-will@kernel.org>
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

Select HOTPLUG_CORE_SYNC_FULL on arm64 to replace the 'cpu_running'
completion with the generic code for synchronising with secondary CPUs
during boot.

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/Kconfig           |  2 +-
 arch/arm64/include/asm/smp.h |  1 -
 arch/arm64/kernel/smp.c      | 39 +++++++++++++++++-------------------
 3 files changed, 19 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b5a51b0ef944..89d1f0f2269c 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -230,7 +230,7 @@ config ARM64
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_KPROBES
 	select HAVE_KRETPROBES
-	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
+	select HOTPLUG_CORE_SYNC_FULL
 	select HOTPLUG_SMT if HOTPLUG_CPU
 	select IRQ_DOMAIN
 	select IRQ_FORCED_THREADING
diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
index 10ea4f543069..fe343c30d620 100644
--- a/arch/arm64/include/asm/smp.h
+++ b/arch/arm64/include/asm/smp.h
@@ -12,7 +12,6 @@
 #define CPU_BOOT_STATUS_MASK		((UL(1) << CPU_STUCK_REASON_SHIFT) - 1)
 
 #define CPU_MMU_OFF			(-1)
-#define CPU_BOOT_SUCCESS		(0)
 /* The cpu invoked ops->cpu_die, synchronise it with cpu_kill */
 #define CPU_KILL_ME			(1)
 /* The cpu couldn't die gracefully and is looping in the kernel */
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 014b163ce658..d83ba5bbfd37 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -108,12 +108,9 @@ static int boot_secondary(unsigned int cpu, struct task_struct *idle)
 	return -EOPNOTSUPP;
 }
 
-static DECLARE_COMPLETION(cpu_running);
-
 int __cpu_up(unsigned int cpu, struct task_struct *idle)
 {
 	int ret;
-	long status;
 
 	/*
 	 * We need to tell the secondary core where to find its stack and the
@@ -124,27 +121,24 @@ int __cpu_up(unsigned int cpu, struct task_struct *idle)
 
 	/* Now bring the CPU into our world */
 	ret = boot_secondary(cpu, idle);
-	if (ret) {
-		if (ret != -EPERM)
-			pr_err("CPU%u: failed to boot: %d\n", cpu, ret);
-		return ret;
-	}
+	if (ret && ret != -EPERM)
+		pr_err("CPU%u: failed to boot: %d\n", cpu, ret);
+	return ret;
+}
 
-	/*
-	 * CPU was successfully started, wait for it to come online or
-	 * time out.
-	 */
-	wait_for_completion_timeout(&cpu_running,
-				    msecs_to_jiffies(5000));
-	if (cpu_online(cpu))
-		return 0;
+void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu, bool is_alive)
+{
+	long status;
+
+	if (is_alive)
+		return;
 
-	pr_crit("CPU%u: failed to come online\n", cpu);
 	secondary_data.task = NULL;
 	status = READ_ONCE(secondary_data.status);
 	if (status == CPU_MMU_OFF)
 		status = READ_ONCE(__early_cpu_boot_status);
 
+	/* A CPU has failed to boot. Try to figure out what happened. */
 	switch (status & CPU_BOOT_STATUS_MASK) {
 	default:
 		pr_err("CPU%u: failed in unknown state : 0x%lx\n",
@@ -171,8 +165,6 @@ int __cpu_up(unsigned int cpu, struct task_struct *idle)
 	case CPU_PANIC_KERNEL:
 		panic("CPU%u detected unsupported configuration\n", cpu);
 	}
-
-	return -EIO;
 }
 
 static void init_gic_priority_masking(void)
@@ -234,6 +226,13 @@ asmlinkage notrace void secondary_start_kernel(void)
 	 * Log the CPU info before it is marked online and might get read.
 	 */
 	cpuinfo_store_cpu();
+
+	/*
+	 * Synchronise with the core bringing us online so that it knows
+	 * we made it into the kernel. We're still not 'online'.
+	 */
+	cpuhp_ap_sync_alive();
+
 	rcutree_report_cpu_starting(cpu);
 	update_cpu_features(cpu);
 	store_cpu_topology(cpu);
@@ -256,9 +255,7 @@ asmlinkage notrace void secondary_start_kernel(void)
 	pr_info("CPU%u: Booted secondary processor 0x%010lx [0x%08x]\n",
 					 cpu, (unsigned long)mpidr,
 					 read_cpuid_id());
-	update_cpu_boot_status(CPU_BOOT_SUCCESS);
 	set_cpu_online(cpu, true);
-	complete(&cpu_running);
 
 	/*
 	 * Secondary CPUs enter the kernel with all DAIF exceptions masked.
-- 
2.56.0.385.gd3acb90ef8-goog


