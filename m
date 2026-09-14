Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F95C88E6A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 10:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7lz4OfOmN0xXQhcRpFC83CzXEDu+ric+1nAG1EOU9XE=; b=u5MlCLxwJVY518Ef2MHkYkePGK
	jW/hPtlcFCJ/2ZTqP8v2r4ruc/dcWszW4fPPSWxwh0I3b+aI9cO4ydMjEVjs5G2h1fioQwIdXFJe/
	81BCIEdbGEwKbjaP+SrXCSm56mpCraTJ/QxVatWRssuTznQjmez3tmTH/IE1mzrYX6ShzZN4ZoFdm
	JOUrjqbFQHql/KcstxD4Nqj5FxY1DdU6sLfbmVNWJpgabTUEnd1vjeMKMpdejesTp6W/AqNc8XAlT
	ZLY0EKONMJDzc1qGHn9rs2HFTjT7NXGD5mlJxrZiR7QZoxIJvBY99NfRIQ4jJfnicqGwjzsMI+ZUL
	uJaVvn6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63oo-000000035Pe-3ybE;
	Mon, 14 Sep 2026 10:21:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63og-000000035Ij-3Xi1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 10:21:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4EBB91576;
	Mon, 14 Sep 2026 03:21:34 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CAC413F7B4;
	Mon, 14 Sep 2026 03:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789381297; bh=Pm6gRQ+ubEAn/0R2DCRLWccnC3xm8/b56iT3hX2TLAU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gTu55cm1tgHvcgrOFDw3Hz1FiBQYjJZYmxuIrdQezK4XzCfPbDphTUHBWrXKZkvi8
	 tu5wQBGKUxoeR8urbMx5jaS6jjXoSyMdwLwhg5tZrCME3GoQnpmq645O8mspIW0/kJ
	 REKC78V2/1Wjdw85G1t7Gu7Eh81a9aH+ilz2bzEI=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	maz@kernel.org,
	lpieralisi@kernel.org,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [PATCH 07/38] arm64: interrupts: Introduce exception masking save/restore helpers
Date: Mon, 14 Sep 2026 11:20:31 +0100
Message-Id: <20260914102102.68597-8-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260914102102.68597-1-vladimir.murzin@arm.com>
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_032140_640386_04D70BFB 
X-CRM114-Status: GOOD (  18.36  )
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

From: Ada Couprie Diaz <ada.coupriediaz@arm.com>

Outside the entry code, the local_daif_... helpers need to be replaced
so that both DAIF and PMR are handled correctly and their use can be
controlled more strongly.

Introduce local_exceptions_save_mask() and local_exceptions_restore(),
which must be used as a pair. Save both the original and requested
exception state so that inconsistent changes between the save and
restore can be detected.

There are two cases where paired save and restore operations do not
make sense:

- when initializing a CPU, and
- when preparing to turn it off.

Handle those cases with local_exceptions_cpu_init_mask() and
local_exceptions_final_mask(). When CONFIG_DEBUG_IRQFLAGS is enabled,
enforce that these helpers are not used outside their intended
contexts.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 arch/arm64/include/asm/interrupts/masking.h | 92 +++++++++++++++++++++
 arch/arm64/kernel/irq.c                     | 31 +++++++
 2 files changed, 123 insertions(+)
 create mode 100644 arch/arm64/include/asm/interrupts/masking.h

diff --git a/arch/arm64/include/asm/interrupts/masking.h b/arch/arm64/include/asm/interrupts/masking.h
new file mode 100644
index 000000000000..db3439853b64
--- /dev/null
+++ b/arch/arm64/include/asm/interrupts/masking.h
@@ -0,0 +1,92 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2025 Arm Ltd.
+ */
+#ifndef __ASM_INTERRUPTS_MASKING_H
+#define __ASM_INTERRUPTS_MASKING_H
+
+#include <asm/arch_gicv3.h>
+#include <asm/bug.h>
+#include <asm/cpufeature.h>
+#include <asm/interrupts/common_flags.h>
+#include <asm/ptrace.h>
+
+typedef struct arm64_exc_hwstates {
+	arm64_exc_hwstate_t saved;
+	arm64_exc_hwstate_t expected;
+} arm64_exc_hwstates_t;
+
+static inline
+arm64_exc_hwstates_t local_exceptions_save_mask(arm64_exc_context_t new)
+{
+	arm64_exc_hwstate_t actual = {.flags = arch_local_save_flags()};
+	arm64_exc_hwstate_t state = arm64_exc_hwstate_of_context(new);
+	bool irqs_disabled = arch_irqs_disabled_flags(state.flags);
+	bool force;
+
+	/*
+	 * We've just got actual HW state so we can rely on that to
+	 * optimize some unnecessary updates.
+	 */
+	force = system_uses_irq_prio_masking() && actual.pmr != state.pmr;
+
+	if (!irqs_disabled)
+		trace_hardirqs_on();
+
+	__arm64_update_exc_hwstate(state, force);
+
+	if (irqs_disabled)
+		trace_hardirqs_off();
+
+	return (arm64_exc_hwstates_t){.saved = actual, .expected = state};
+}
+
+static inline void local_exceptions_restore(arm64_exc_hwstates_t states)
+{
+	bool irqs_disabled = arch_irqs_disabled_flags(states.saved.flags);
+
+	arm64_debug_exc_hwstate(states.expected);
+
+	if (!irqs_disabled)
+		trace_hardirqs_on();
+
+	arm64_update_exc_hwstate(states.saved);
+
+	if (irqs_disabled)
+		trace_hardirqs_off();
+}
+
+static __always_inline
+void __local_exceptions_cpu_init_mask(arm64_exc_context_t context)
+{
+	if (context == PROCESS_CONTEXT)
+		trace_hardirqs_on();
+
+	arm64_update_exc_context(context);
+
+	if (context != PROCESS_CONTEXT)
+		trace_hardirqs_off();
+}
+
+static __always_inline void __local_exceptions_final_mask(void)
+{
+	arm64_update_exc_context(CRITICAL_CONTEXT);
+	trace_hardirqs_off();
+}
+
+#ifdef CONFIG_DEBUG_IRQFLAGS
+void local_exceptions_cpu_init_mask(arm64_exc_context_t context);
+void local_exceptions_final_mask(void);
+#else
+static inline
+void local_exceptions_cpu_init_mask(arm64_exc_context_t context)
+{
+	__local_exceptions_cpu_init_mask(context);
+}
+
+static inline void local_exceptions_final_mask(void)
+{
+	__local_exceptions_final_mask();
+}
+#endif /* CONFIG_DEBUG_IRQFLAGS */
+#endif /* __ASM_INTERRUPTS_MASKING_H */
diff --git a/arch/arm64/kernel/irq.c b/arch/arm64/kernel/irq.c
index 9fafd826002b..58b778083576 100644
--- a/arch/arm64/kernel/irq.c
+++ b/arch/arm64/kernel/irq.c
@@ -22,6 +22,7 @@
 #include <linux/smp.h>
 #include <linux/vmalloc.h>
 #include <asm/daifflags.h>
+#include <asm/interrupts/masking.h>
 #include <asm/exception.h>
 #include <asm/numa.h>
 #include <asm/softirq_stack.h>
@@ -39,6 +40,12 @@ DECLARE_PER_CPU(unsigned long *, irq_shadow_call_stack_ptr);
 DEFINE_PER_CPU(unsigned long *, irq_shadow_call_stack_ptr);
 #endif
 
+#ifdef CONFIG_DEBUG_IRQFLAGS
+/* Make sure the CPU init/tear down masking functions are only used once. */
+static cpumask_t irqs_masks_init_done;
+static cpumask_t irqs_masks_final_done;
+#endif
+
 static int __init init_irq_scs(void)
 {
 	int cpu;
@@ -133,3 +140,27 @@ void __init init_IRQ(void)
 		local_daif_restore(DAIF_PROCCTX_NOIRQ);
 	}
 }
+
+#ifdef CONFIG_DEBUG_IRQFLAGS
+void local_exceptions_cpu_init_mask(arm64_exc_context_t context)
+{
+	int cpu = smp_processor_id();
+
+	WARN_ON(cpumask_test_cpu(cpu, &irqs_masks_init_done));
+
+	__local_exceptions_cpu_init_mask(context);
+	cpumask_set_cpu(cpu, &irqs_masks_init_done);
+	cpumask_clear_cpu(cpu, &irqs_masks_final_done);
+}
+
+void local_exceptions_final_mask(void)
+{
+	int cpu = smp_processor_id();
+
+	WARN_ON(cpumask_test_cpu(cpu, &irqs_masks_final_done));
+
+	__local_exceptions_final_mask();
+	cpumask_set_cpu(cpu, &irqs_masks_final_done);
+	cpumask_clear_cpu(cpu, &irqs_masks_init_done);
+}
+#endif
-- 
2.34.1


