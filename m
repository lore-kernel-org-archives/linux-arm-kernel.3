Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7721ECA6012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 10:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QiJYJbjmheWs7wPlkVKR/hdYCqmCDj//JwiCYCX2pGk=; b=eItVwZwqjOb8ruPe1CpiwhZMFh
	7aRisHlinC26biJK1KpSAk4xWS0uUMqgTqDntTiWObVLxHrWm1IiKweck02n8T+ZAb1FqUvozvASm
	QkLH94gjCYOB/ogoVvZc+iZrYFcaDVsbf7WrfZfSAnnQoP+c3QStCGxgou0fOSUr0I4Km6eSVIwLM
	uNNJPR1WO3gwhGno1eXQuLhUHbZMG0R+cOpgmXP5tQBR7S6qF2mf0v2i7ygTLCuzFChX1Cu96j/VZ
	dAaAlvCcSIeZS1ufCdAPMkF7Byy2jB8NPCZ1ucd5Mh1/TMdL0yA/nHH5UgJMK1wBM7kgp7gJ0tNmc
	SCtJV9LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7Ww-00000005zcV-3jjJ;
	Fri, 09 Oct 2026 10:08:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7Wu-00000005za0-2pq6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 10:08:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E38243927;
	Fri,  9 Oct 2026 10:08:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D6311F000FF;
	Fri,  9 Oct 2026 10:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540524;
	bh=QiJYJbjmheWs7wPlkVKR/hdYCqmCDj//JwiCYCX2pGk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fmj8B0IwM4MxhYYcILMeyRpVwGeVEfR+Yb2D2W8PmpIYhNVMhuWXR6RHlVmC8/pxY
	 ljntwvQGqJ8CiLpkNPlXUm1X//wqXVZQ3LsworI5gyNkC8OWkIQRWLnBXWnnIffSNU
	 308NyDXtoX1bxouW1HTuXKFkGDpD9pmYn7fR72vxtGK/wO/UbwgvcJDMRndyFIYd1q
	 /bAw2b+FZRkxHUOJRdh4ed7Mz08sBCzE0uR24LmImGWxY5fC31BP1owhOeNnsBIqs4
	 AIZr5+oPiS1bra1vqdJs11SkBRK7biuQy7HxL70whZi4CAb1FNTVJq8wAo2/h1buOw
	 ouwHgEMfLR9rQ==
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
Subject: [PATCH v2 15/23] arm64: smp: Use generic HOTPLUG_SPLIT_STARTUP machinery for CPU onlining
Date: Fri,  9 Oct 2026 11:07:26 +0100
Message-ID: <20261009100738.31288-16-will@kernel.org>
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

In preparation for enabling parallel bringup of secondary CPUs on arm64,
take the baby step of moving from HOTPLUG_CORE_SYNC_FULL to
HOTPLUG_SPLIT_STARTUP.

Rework the cpu_die_early() path to use a private cpumask, otherwise
clearing the incoming CPU from the present mask in the 'kick' stage will
prevent the hotplug stage machine from progressing and
arch_cpuhp_cleanup_kick_cpu() will not be called.

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/Kconfig           |  2 +-
 arch/arm64/include/asm/smp.h |  1 +
 arch/arm64/kernel/smp.c      | 10 ++++++----
 3 files changed, 8 insertions(+), 5 deletions(-)

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
index d83ba5bbfd37..918b54d1c301 100644
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
 
@@ -138,6 +138,9 @@ void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu, bool is_alive)
 	if (status == CPU_MMU_OFF)
 		status = READ_ONCE(__early_cpu_boot_status);
 
+	if (cpumask_test_and_clear_cpu(cpu, &secondary_data.cpu_died_early_mask))
+		set_cpu_present(cpu, false);
+
 	/* A CPU has failed to boot. Try to figure out what happened. */
 	switch (status & CPU_BOOT_STATUS_MASK) {
 	default:
@@ -407,8 +410,7 @@ void __noreturn cpu_die_early(void)
 
 	pr_crit("CPU%d: will not boot\n", cpu);
 
-	/* Mark this CPU absent */
-	set_cpu_present(cpu, 0);
+	cpumask_set_cpu(cpu, &secondary_data.cpu_died_early_mask);
 
 	if (IS_ENABLED(CONFIG_HOTPLUG_CPU)) {
 		update_cpu_boot_status(CPU_KILL_ME);
-- 
2.56.0.385.gd3acb90ef8-goog


