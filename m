Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F1EC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 02:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1rXR1XDJS+X2HiibFkF+x03IbxnwnNBVCByuan7U0nY=; b=vuxoORjqilQ0V4ocIizFxD90cL
	2ItUsz6n4Heiq4RcFynOpcPwkiMAG6O7dHtitCC/TRtc1IcvQwC/iWFlFO6O9vIzV7uagHMmjkMVj
	MJiOBg1fT1xshyIf/Lza32xYvJvzThg4OHYc9G/zBmTlu/OkMfv2rAjd3RM+yCiToZyf9rFFZDsLS
	HsShtsXqr0sZwXeejVLHRYLP6ugBdShII9tgZ2S2iurOZxnASxvCN1HYGxBZJKnJKBB9cnzLD3JIq
	j93hdYUMUdWMeKIdqNBQffKwAj9Uw9OD6P/dMNciBoAyH5NIGbHSvSrFc+Uvq8TXDAc1SGTWVAmRb
	QdbxHkeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugZkA-0000000Fk4X-1UIE;
	Tue, 29 Jul 2025 02:07:06 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugZaO-0000000FjDc-0lQ5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 01:57:03 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4brddc1vxzz2Cg1C;
	Tue, 29 Jul 2025 09:52:36 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id F16071A016C;
	Tue, 29 Jul 2025 09:56:48 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 29 Jul
 2025 09:56:47 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<sstabellini@kernel.org>, <mark.rutland@arm.com>, <puranjay@kernel.org>,
	<broonie@kernel.org>, <mbenes@suse.cz>, <ryan.roberts@arm.com>,
	<akpm@linux-foundation.org>, <chenl311@chinatelecom.cn>,
	<ada.coupriediaz@arm.com>, <anshuman.khandual@arm.com>,
	<kristina.martsenko@arm.com>, <liaochang1@huawei.com>, <ardb@kernel.org>,
	<leitao@debian.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <xen-devel@lists.xenproject.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next v7 1/7] arm64: ptrace: Replace interrupts_enabled() with regs_irqs_disabled()
Date: Tue, 29 Jul 2025 09:54:50 +0800
Message-ID: <20250729015456.3411143-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250729015456.3411143-1-ruanjinjie@huawei.com>
References: <20250729015456.3411143-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_185700_547506_50632913 
X-CRM114-Status: GOOD (  15.84  )
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

The generic entry code expects architecture code to provide
regs_irqs_disabled(regs) function, but arm64 does not have this and
provides inerrupts_enabled(regs), which has the opposite polarity.

In preparation for moving arm64 over to the generic entry code,
relace arm64's interrupts_enabled() with regs_irqs_disabled() and
update its callers under arch/arm64.

For the moment, a definition of interrupts_enabled() is provided for
the GICv3 driver. Once arch/arm implement regs_irqs_disabled(), this
can be removed.

Delete the fast_interrupts_enabled() macro as it is unused and we
don't want any new users to show up.

No functional changes.

Acked-by: Mark Rutland <mark.rutland@arm.com>
Suggested-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/daifflags.h  | 2 +-
 arch/arm64/include/asm/ptrace.h     | 9 +++++----
 arch/arm64/include/asm/xen/events.h | 2 +-
 arch/arm64/kernel/acpi.c            | 2 +-
 arch/arm64/kernel/debug-monitors.c  | 2 +-
 arch/arm64/kernel/entry-common.c    | 4 ++--
 arch/arm64/kernel/sdei.c            | 2 +-
 7 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/include/asm/daifflags.h b/arch/arm64/include/asm/daifflags.h
index fbb5c99eb2f9..5fca48009043 100644
--- a/arch/arm64/include/asm/daifflags.h
+++ b/arch/arm64/include/asm/daifflags.h
@@ -128,7 +128,7 @@ static inline void local_daif_inherit(struct pt_regs *regs)
 {
 	unsigned long flags = regs->pstate & DAIF_MASK;
 
-	if (interrupts_enabled(regs))
+	if (!regs_irqs_disabled(regs))
 		trace_hardirqs_on();
 
 	if (system_uses_irq_prio_masking())
diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
index 47ff8654c5ec..8b915d4a9d4b 100644
--- a/arch/arm64/include/asm/ptrace.h
+++ b/arch/arm64/include/asm/ptrace.h
@@ -214,11 +214,12 @@ static inline void forget_syscall(struct pt_regs *regs)
 		(regs)->pmr == GIC_PRIO_IRQON :				\
 		true)
 
-#define interrupts_enabled(regs)			\
-	(!((regs)->pstate & PSR_I_BIT) && irqs_priority_unmasked(regs))
+static __always_inline bool regs_irqs_disabled(const struct pt_regs *regs)
+{
+	return (regs->pstate & PSR_I_BIT) || !irqs_priority_unmasked(regs);
+}
 
-#define fast_interrupts_enabled(regs) \
-	(!((regs)->pstate & PSR_F_BIT))
+#define interrupts_enabled(regs)	(!regs_irqs_disabled(regs))
 
 static inline unsigned long user_stack_pointer(struct pt_regs *regs)
 {
diff --git a/arch/arm64/include/asm/xen/events.h b/arch/arm64/include/asm/xen/events.h
index 2788e95d0ff0..2977b5fe068d 100644
--- a/arch/arm64/include/asm/xen/events.h
+++ b/arch/arm64/include/asm/xen/events.h
@@ -14,7 +14,7 @@ enum ipi_vector {
 
 static inline int xen_irqs_disabled(struct pt_regs *regs)
 {
-	return !interrupts_enabled(regs);
+	return regs_irqs_disabled(regs);
 }
 
 #define xchg_xen_ulong(ptr, val) xchg((ptr), (val))
diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
index 4d529ff7ba51..3fbce0a9a0fe 100644
--- a/arch/arm64/kernel/acpi.c
+++ b/arch/arm64/kernel/acpi.c
@@ -407,7 +407,7 @@ int apei_claim_sea(struct pt_regs *regs)
 	return_to_irqs_enabled = !irqs_disabled_flags(arch_local_save_flags());
 
 	if (regs)
-		return_to_irqs_enabled = interrupts_enabled(regs);
+		return_to_irqs_enabled = !regs_irqs_disabled(regs);
 
 	/*
 	 * SEA can interrupt SError, mask it and describe this as an NMI so
diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
index 110d9ff54174..85fc162a6f9b 100644
--- a/arch/arm64/kernel/debug-monitors.c
+++ b/arch/arm64/kernel/debug-monitors.c
@@ -167,7 +167,7 @@ static void send_user_sigtrap(int si_code)
 	if (WARN_ON(!user_mode(regs)))
 		return;
 
-	if (interrupts_enabled(regs))
+	if (!regs_irqs_disabled(regs))
 		local_irq_enable();
 
 	arm64_force_sig_fault(SIGTRAP, si_code, instruction_pointer(regs),
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 2b0c5925502e..8e798f46ad28 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -74,7 +74,7 @@ static __always_inline void __exit_to_kernel_mode(struct pt_regs *regs)
 {
 	lockdep_assert_irqs_disabled();
 
-	if (interrupts_enabled(regs)) {
+	if (!regs_irqs_disabled(regs)) {
 		if (regs->exit_rcu) {
 			trace_hardirqs_on_prepare();
 			lockdep_hardirqs_on_prepare();
@@ -662,7 +662,7 @@ static void noinstr el1_interrupt(struct pt_regs *regs,
 {
 	write_sysreg(DAIF_PROCCTX_NOIRQ, daif);
 
-	if (IS_ENABLED(CONFIG_ARM64_PSEUDO_NMI) && !interrupts_enabled(regs))
+	if (IS_ENABLED(CONFIG_ARM64_PSEUDO_NMI) && regs_irqs_disabled(regs))
 		__el1_pnmi(regs, handler);
 	else
 		__el1_irq(regs, handler);
diff --git a/arch/arm64/kernel/sdei.c b/arch/arm64/kernel/sdei.c
index 6f24a0251e18..95169f7b6531 100644
--- a/arch/arm64/kernel/sdei.c
+++ b/arch/arm64/kernel/sdei.c
@@ -243,7 +243,7 @@ unsigned long __kprobes do_sdei_event(struct pt_regs *regs,
 	 * If we interrupted the kernel with interrupts masked, we always go
 	 * back to wherever we came from.
 	 */
-	if (mode == kernel_mode && !interrupts_enabled(regs))
+	if (mode == kernel_mode && regs_irqs_disabled(regs))
 		return SDEI_EV_HANDLED;
 
 	/*
-- 
2.34.1


