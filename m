Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF47CA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 10:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tXikqsP5XVtBQiNqwM5kkXuHQDCKxQU/erbNI3Z1XPw=; b=sbNR4OxmVZUnd5xMNTgOxQiir4
	LuqxCBYWkq24POYgvryZI+gWjkZDe8gkAL1sZhRObZsjOuCidFe98thevcbCpQyOZm5IevSZcz0cV
	pEIBa3Wk9y3GvqFgYRBu1uJIXCef+kZA6Ymy1YxV7O3mSJ96MB4MYnK32CnbhhnmmzAnfwL0zl9ky
	fGQ5PjJ3VDrhIA9XWLce9n/fj6uPw+olnnCXzW/mXk+teyvsNxQNBCYoy/UvOVy6XwkZl034TDJVm
	2PZoxagdnPPH0yn2DaqaTCRKzwPi2jfmd9OU6GulW9JcV7vZY+KLCuDB0Q7C8EG4tXTWm9H6f8xNc
	9itOjCOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7XF-00000005zxP-22WU;
	Fri, 09 Oct 2026 10:09:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7XE-00000005zvK-0hOl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 10:09:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9094660DBE;
	Fri,  9 Oct 2026 10:09:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F0801F00898;
	Fri,  9 Oct 2026 10:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540543;
	bh=tXikqsP5XVtBQiNqwM5kkXuHQDCKxQU/erbNI3Z1XPw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Xxnr4XH95BBCQnBjDScJPoifYLijvIoZKq0QSktzwzAPMfcLsxHYiUh7V2aB9rSGn
	 5kEDVn8MKFdj+Oi9/rZz/XfiVgRNj1HMgn4uSQlzVLFrR0KQ2KJRGVeJF8G5ODJSbc
	 LrY1LAB/B/zxpAP1p/3H0e3OXa7aJRQzPbrVQWIwIXTNF4v5LRiDcTmDCAYJsMvUs6
	 emi7HsxBmQpSCGrIeht9P6jvRCD9zjkGpsNm/5ZfewOP8aa3kaO9BRu50e9Yec5lre
	 6g2i7qHWsHcor1gBCAzg0VQb37xqY8kvj+78ayYVec1a+9BFvoJQ2sxEVHWPWDwugW
	 aEKyVyoS3Mi3g==
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
Subject: [PATCH v2 20/23] arm64: cpu_ops: Expose optional argument to target cpu in ->cpu_boot()
Date: Fri,  9 Oct 2026 11:07:31 +0100
Message-ID: <20261009100738.31288-21-will@kernel.org>
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

Some backend implementations of 'struct cpu_ops', notably PSCI v0.2+,
allow an optional argument to be passed in register X0 to the target
CPU during boot.

Expose this functionality by extending the ->cpu_boot() CPU operation
to take an additional argument which is ignored unless the new optional
->cpu_boot_has_arg() callback is present and returns 'true'. For now,
we continue to pass zero.

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/cpu_ops.h          |  6 +++++-
 arch/arm64/kernel/acpi_parking_protocol.c |  3 ++-
 arch/arm64/kernel/psci.c                  | 12 ++++++++++--
 arch/arm64/kernel/smp.c                   |  2 +-
 arch/arm64/kernel/smp_spin_table.c        |  2 +-
 5 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/cpu_ops.h b/arch/arm64/include/asm/cpu_ops.h
index cd298a8710d8..e7662a1879d9 100644
--- a/arch/arm64/include/asm/cpu_ops.h
+++ b/arch/arm64/include/asm/cpu_ops.h
@@ -21,6 +21,9 @@
  *		mechanism for doing so, tests whether it is possible to boot
  *		the given CPU.
  * @cpu_boot:	Boots a cpu into the kernel.
+ * @cpu_boot_has_arg: Optionally determines whether @cpu_boot passes its
+ *		      (non-zero) second argument to the booting CPU in
+ *		      register x0.
  * @cpu_postboot: Optionally, perform any post-boot cleanup or necessary
  *		synchronisation. Called from the cpu being booted.
  * @cpu_can_disable: Determines whether a CPU can be disabled based on
@@ -36,7 +39,8 @@ struct cpu_operations {
 	const char	*name;
 	int		(*cpu_init)(unsigned int);
 	int		(*cpu_prepare)(unsigned int);
-	int		(*cpu_boot)(unsigned int);
+	int		(*cpu_boot)(unsigned int, unsigned long);
+	bool		(*cpu_boot_has_arg)(void);
 	void		(*cpu_postboot)(void);
 #ifdef CONFIG_HOTPLUG_CPU
 	bool		(*cpu_can_disable)(unsigned int cpu);
diff --git a/arch/arm64/kernel/acpi_parking_protocol.c b/arch/arm64/kernel/acpi_parking_protocol.c
index e1be29e608b7..24ebde1241bf 100644
--- a/arch/arm64/kernel/acpi_parking_protocol.c
+++ b/arch/arm64/kernel/acpi_parking_protocol.c
@@ -56,7 +56,8 @@ static int acpi_parking_protocol_cpu_prepare(unsigned int cpu)
 	return 0;
 }
 
-static int acpi_parking_protocol_cpu_boot(unsigned int cpu)
+static int acpi_parking_protocol_cpu_boot(unsigned int cpu,
+					  unsigned long ignored)
 {
 	struct cpu_mailbox_entry *cpu_entry = &cpu_mailbox_entries[cpu];
 	struct parking_protocol_mailbox __iomem *mailbox;
diff --git a/arch/arm64/kernel/psci.c b/arch/arm64/kernel/psci.c
index 6b25a12ed143..8cd74a77de2e 100644
--- a/arch/arm64/kernel/psci.c
+++ b/arch/arm64/kernel/psci.c
@@ -36,16 +36,23 @@ static int __init cpu_psci_cpu_prepare(unsigned int cpu)
 	return 0;
 }
 
-static int cpu_psci_cpu_boot(unsigned int cpu)
+static int cpu_psci_cpu_boot(unsigned int cpu, unsigned long context)
 {
 	phys_addr_t pa_secondary_entry = __pa_symbol(secondary_entry);
-	int err = psci_ops.cpu_on(cpu_logical_map(cpu), pa_secondary_entry, 0);
+	int err = psci_ops.cpu_on(cpu_logical_map(cpu), pa_secondary_entry,
+				  context);
 	if (err && err != -EPERM)
 		pr_err("failed to boot CPU%d (%d)\n", cpu, err);
 
 	return err;
 }
 
+static bool cpu_psci_cpu_boot_has_context(void)
+{
+	return psci_ops.get_version &&
+	       psci_ops.get_version() >= PSCI_VERSION(0, 2);
+}
+
 #ifdef CONFIG_HOTPLUG_CPU
 static bool cpu_psci_cpu_can_disable(unsigned int cpu)
 {
@@ -114,6 +121,7 @@ const struct cpu_operations cpu_psci_ops = {
 	.cpu_init	= cpu_psci_cpu_init,
 	.cpu_prepare	= cpu_psci_cpu_prepare,
 	.cpu_boot	= cpu_psci_cpu_boot,
+	.cpu_boot_has_arg = cpu_psci_cpu_boot_has_context,
 #ifdef CONFIG_HOTPLUG_CPU
 	.cpu_can_disable = cpu_psci_cpu_can_disable,
 	.cpu_disable	= cpu_psci_cpu_disable,
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index f7141ec18029..29c70616a107 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -103,7 +103,7 @@ static int boot_secondary(unsigned int cpu, struct task_struct *idle)
 	const struct cpu_operations *ops = get_secondary_cpu_ops();
 
 	if (ops->cpu_boot)
-		return ops->cpu_boot(cpu);
+		return ops->cpu_boot(cpu, 0);
 
 	return -EOPNOTSUPP;
 }
diff --git a/arch/arm64/kernel/smp_spin_table.c b/arch/arm64/kernel/smp_spin_table.c
index 49029eace3ad..a5e6f444c25f 100644
--- a/arch/arm64/kernel/smp_spin_table.c
+++ b/arch/arm64/kernel/smp_spin_table.c
@@ -104,7 +104,7 @@ static int smp_spin_table_cpu_prepare(unsigned int cpu)
 	return 0;
 }
 
-static int smp_spin_table_cpu_boot(unsigned int cpu)
+static int smp_spin_table_cpu_boot(unsigned int cpu, unsigned long ignored)
 {
 	/*
 	 * Update the pen release flag.
-- 
2.56.0.385.gd3acb90ef8-goog


