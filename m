Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D36FCA601C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 10:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gf3FKiGtI6KQvcd0GShYu0Q8rw5bxQGuG60R9wMsHvs=; b=RjtHloRMBbkAqvBnXVkLuLr+7P
	IsH2d1QTJCTt4ac4Gwya1INgC6WPvDQbebPbOSsVItFaJUhX41S0XfGYmqBQKWTxjnlMLuyCWNTzp
	6f00Jt32QNzWBrCLIpGTKpUWM7kxKSHULN45YkhYbcjU+BOO/luaajPzRbE2qTwKD0IQ+3312yqDO
	Ra0jrLdTpzTyqde+1sX87xc5PHvbz2hF0c1g1t30XPkk460aYC/bw743vs/gphdy4NvK4jIYX3tEa
	XHvSW+VAVqlpvV2KkoKswNtJoPVtUnS9hLHdXrWwpl7eH55WlPz6yQ7WFdt6No2qL5HWfKuSYJLfV
	xxf51/jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7X3-00000005zjD-1JA6;
	Fri, 09 Oct 2026 10:08:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7X2-00000005zi2-3A90
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 10:08:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3037C60DC1;
	Fri,  9 Oct 2026 10:08:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A927A1F000FF;
	Fri,  9 Oct 2026 10:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540531;
	bh=Gf3FKiGtI6KQvcd0GShYu0Q8rw5bxQGuG60R9wMsHvs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VV2WNtASTb2ywGrU+P4MagqzQJqSlcybnay65ivhhNFbICQvC4wYZdl74iX5p9Rfd
	 jIkMWR4TpDIzC1NUJmuPT8uxCapov3UFXt+32M6W/cMc02/mrDyGy/gZzCiagy2Wg5
	 bkBbYrcfYeFQGi6UARjSzRcKaDeAPf1FLLKfjwMxXWDbDJfibt2WqE2RILQpyd+E6b
	 /NKzj8/lnEYGX4NoqKalXw+d+jcWUlqvxhb6aVAxApBurH1n9YKkYB1Dqtfrr8vhe1
	 F8W0L7+03vjR3nj0F5hSVnurbAY3F8hm0RzQxqjctKtcRjQNF9SsDEW+L6eWP/FAuF
	 tN+pSm7bBspvQ==
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
Subject: [PATCH v2 17/23] arm64: cpu_ops: Introduce get_secondary_cpu_ops()
Date: Fri,  9 Oct 2026 11:07:28 +0100
Message-ID: <20261009100738.31288-18-will@kernel.org>
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

Introduce get_secondary_cpu_ops() to retrieve a pointer to the
'cpu_operations' structure for the non-boot CPUs and use it instead of
get_cpu_ops() where we are dealing with secondary CPUs.

This is a pre-requisite for enabling parallel CPU bring-up.

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/cpu_ops.h |  1 +
 arch/arm64/kernel/cpu_ops.c      |  5 +++++
 arch/arm64/kernel/smp.c          | 19 +++++++------------
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/include/asm/cpu_ops.h b/arch/arm64/include/asm/cpu_ops.h
index a444c8915e88..cd298a8710d8 100644
--- a/arch/arm64/include/asm/cpu_ops.h
+++ b/arch/arm64/include/asm/cpu_ops.h
@@ -48,6 +48,7 @@ struct cpu_operations {
 
 int __init init_cpu_ops(int cpu);
 extern const struct cpu_operations *get_cpu_ops(int cpu);
+extern const struct cpu_operations *get_secondary_cpu_ops(void);
 
 static inline void __init init_bootcpu_ops(void)
 {
diff --git a/arch/arm64/kernel/cpu_ops.c b/arch/arm64/kernel/cpu_ops.c
index eacfb88a0c0c..7d183ca31dc8 100644
--- a/arch/arm64/kernel/cpu_ops.c
+++ b/arch/arm64/kernel/cpu_ops.c
@@ -127,3 +127,8 @@ const struct cpu_operations *get_cpu_ops(int cpu)
 
 	return NULL;
 }
+
+const struct cpu_operations *get_secondary_cpu_ops(void)
+{
+	return cpu_ops;
+}
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 918b54d1c301..f7141ec18029 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -100,7 +100,7 @@ static inline int op_cpu_kill(unsigned int cpu)
  */
 static int boot_secondary(unsigned int cpu, struct task_struct *idle)
 {
-	const struct cpu_operations *ops = get_cpu_ops(cpu);
+	const struct cpu_operations *ops = get_secondary_cpu_ops();
 
 	if (ops->cpu_boot)
 		return ops->cpu_boot(cpu);
@@ -221,7 +221,7 @@ asmlinkage notrace void secondary_start_kernel(void)
 	 */
 	check_local_cpu_capabilities();
 
-	ops = get_cpu_ops(cpu);
+	ops = get_secondary_cpu_ops();
 	if (ops->cpu_postboot)
 		ops->cpu_postboot();
 
@@ -329,7 +329,7 @@ int __cpu_disable(void)
 
 static int op_cpu_kill(unsigned int cpu)
 {
-	const struct cpu_operations *ops = get_cpu_ops(cpu);
+	const struct cpu_operations *ops = get_secondary_cpu_ops();
 
 	/*
 	 * If we have no means of synchronising with the dying CPU, then assume
@@ -370,7 +370,7 @@ void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
 void __noreturn cpu_die(void)
 {
 	unsigned int cpu = smp_processor_id();
-	const struct cpu_operations *ops = get_cpu_ops(cpu);
+	const struct cpu_operations *ops = get_secondary_cpu_ops();
 
 	idle_task_exit();
 
@@ -496,7 +496,7 @@ static int __init smp_cpu_setup(int cpu)
 	if (init_cpu_ops(cpu))
 		return -ENODEV;
 
-	ops = get_cpu_ops(cpu);
+	ops = get_secondary_cpu_ops();
 	if (ops->cpu_init(cpu))
 		return -ENODEV;
 
@@ -780,7 +780,7 @@ void __init smp_init_cpus(void)
 
 void __init smp_prepare_cpus(unsigned int max_cpus)
 {
-	const struct cpu_operations *ops;
+	const struct cpu_operations *ops = get_secondary_cpu_ops();
 	unsigned int cpu;
 	int err;
 
@@ -806,10 +806,6 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 		if (cpu == 0)
 			continue;
 
-		ops = get_cpu_ops(cpu);
-		if (!ops)
-			continue;
-
 		err = ops->cpu_prepare(cpu);
 		if (err)
 			continue;
@@ -1345,8 +1341,7 @@ bool smp_crash_stop_failed(void)
 static bool have_cpu_die(void)
 {
 #ifdef CONFIG_HOTPLUG_CPU
-	int any_cpu = raw_smp_processor_id();
-	const struct cpu_operations *ops = get_cpu_ops(any_cpu);
+	const struct cpu_operations *ops = get_secondary_cpu_ops();
 
 	if (ops && ops->cpu_die)
 		return true;
-- 
2.56.0.385.gd3acb90ef8-goog


