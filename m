Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B2E9C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IrTLbOTuuMQ4L6f9zvoUGhlf4wkNs5/PIEKC6sIRKzw=; b=KxfMD5CcnYMZEOXeRi8hiDsxJt
	mVXOrIpohQnEoFIytmiCKKsZnUFBFbplH/IVENwdrqkqI6CATRip3S8yiXNayrghURrhcydXXpmqF
	pkr1/OUvaNGWzP1+RRyDP35zfeUf5aGyjvXztqrgdrHVLFDHKjVwKleaZJh42spb5KMC3lIO2FyXo
	iurwrAbgbqKvAjFiIKEkmli97igy4KKzkrm92M4WTMnflWs8bCfhcZBxmRmihfOA+n3NRkRFmYcec
	9vpasmxZyMV6h8JY6UnFDCa98Xo0FQWmbDitRCA73tzNpSVGVcJRXkkAfdFaA5cQuToCB4GM345FJ
	N1XbP2JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cPE-00000007Ldn-0f2l;
	Mon, 07 Sep 2026 16:41:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cP5-00000007LSq-2rcC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:41:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2622D60261;
	Mon,  7 Sep 2026 16:41:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8351E1F00A3F;
	Mon,  7 Sep 2026 16:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799266;
	bh=IrTLbOTuuMQ4L6f9zvoUGhlf4wkNs5/PIEKC6sIRKzw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Cl6u/ywB2DKdlUfB00LGseaWWQeZTgxCSacs6+G9B2GLgrcRdNqVSfBdgAGDki+cP
	 pRVU96/X2jGIRvB24yRvH7MGvvgLZTne8ceL3es+phtgtgaFn4ylSIgtvJ2mNdN8hM
	 IpZwPAENDmZ5ZkL2k3en4xblqBTjDtOU8SSO4RdVIgAKHGHwVmMau1gVQXLzLxrMIb
	 ev8n+hrFdyud9E7/79AoKY0LUtAVy3lfM1Dgn7Ir3QVGm8QAFgkn4/9yRxKWA7SKm0
	 l7qslGovC2LRdlg9leogMDNSvgxU5cZfHzjBDKzb+Vd4FZCAaSlLLd96RVyvlPodd9
	 idk9CX2H4Jujg==
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
Subject: [PATCH 11/19] arm64: smp: Use generic HOTPLUG_SPLIT_STARTUP machinery for CPU onlining
Date: Mon,  7 Sep 2026 17:40:14 +0100
Message-ID: <20260907164024.17164-12-will@kernel.org>
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

In preparation for enabling parallel bringup of secondary CPUs on arm64,
take the baby step of moving from HOTPLUG_CORE_SYNC_FULL to
HOTPLUG_SPLIT_STARTUP.

Rework the cpu_die_early() path to use a private cpumask, otherwise
clearing the incoming CPU from the present mask in the 'kick' stage will
prevent the hotplug stage machine from progressing and
arch_cpuhp_cleanup_kick_cpu() will not be called.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/Kconfig           | 2 +-
 arch/arm64/include/asm/smp.h | 1 +
 arch/arm64/kernel/smp.c      | 9 +++++----
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 89d1f0f2269c..fd8cf792b7fd 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -230,7 +230,7 @@ config ARM64
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_KPROBES
 	select HAVE_KRETPROBES
-	select HOTPLUG_CORE_SYNC_FULL
+	select HOTPLUG_SPLIT_STARTUP
 	select HOTPLUG_SMT if HOTPLUG_CPU
 	select IRQ_DOMAIN
 	select IRQ_FORCED_THREADING
diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
index fe343c30d620..7b986a6a765b 100644
--- a/arch/arm64/include/asm/smp.h
+++ b/arch/arm64/include/asm/smp.h
@@ -89,6 +89,7 @@ asmlinkage void secondary_start_kernel(void);
 struct secondary_data {
 	struct task_struct *task;
 	long status;
+	cpumask_t cpu_died_early_mask;
 };
 
 extern struct secondary_data secondary_data;
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 00362ed6e1ab..c5e9d5d5e003 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -62,7 +62,7 @@
  * so we need some other way of telling a new secondary core
  * where to place its SVC stack
  */
-struct secondary_data secondary_data;
+struct secondary_data secondary_data = {};
 /* Number of CPUs which aren't online, but looping in kernel text. */
 static int cpus_stuck_in_kernel;
 
@@ -108,7 +108,7 @@ static int boot_secondary(unsigned int cpu, struct task_struct *idle)
 	return -EOPNOTSUPP;
 }
 
-int __cpu_up(unsigned int cpu, struct task_struct *idle)
+int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *idle)
 {
 	int ret;
 
@@ -146,6 +146,8 @@ void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu, bool is_alive)
 		cpus_stuck_in_kernel++;
 		break;
 	case CPU_KILL_ME:
+		if (cpumask_test_cpu(cpu, &secondary_data.cpu_died_early_mask))
+			set_cpu_present(cpu, false);
 		if (!op_cpu_kill(cpu)) {
 			pr_crit("CPU%u: died during early boot\n", cpu);
 			break;
@@ -406,8 +408,7 @@ void __noreturn cpu_die_early(void)
 
 	pr_crit("CPU%d: will not boot\n", cpu);
 
-	/* Mark this CPU absent */
-	set_cpu_present(cpu, 0);
+	cpumask_set_cpu(cpu, &secondary_data.cpu_died_early_mask);
 
 	if (IS_ENABLED(CONFIG_HOTPLUG_CPU)) {
 		update_cpu_boot_status(CPU_KILL_ME);
-- 
2.55.0.979.g7e5102b832-goog


