Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B0BC53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7TLt+zdcvz3r9qfvKN9z9DaSjMY9QUr3OW5Osm3F39A=; b=KwiyObkcavJTiLmcnuCIUK7KAY
	Av+7Hkua5rP222B4mAc5ZlI6J4F0SV2no0FUT7QRwaKzeht1mMgm+LNezMkGCi1SX4XBfEF4pqSyi
	PEOF7+kRgSu+kUqnohqLBFc5uBuO3y+Mr8RyMZztiZBeK6u0WRIpHGmj2yN0wp5SV39KE+dyRIk1P
	LKA2DRd/vc97Oq5UM8wplLgIkzX1O4EEnNyXR/4bb3V5NpNXmVpRX/BCF71veqCTh5YCwwH75k0XJ
	0AYkzEGZwY2fGWiJUTgDtmhPF/LtSKeCfuyLKUyUm5u9BiQC+5li4PZ5qDAk8GyPorRQ0WIm4LY3s
	R2iX1t1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOJ0-00000003Mto-0p7f;
	Mon, 27 Jul 2026 16:35:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOIn-00000003Mdo-3SGx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:35:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6637B1682;
	Mon, 27 Jul 2026 09:35:36 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 87D563F86F;
	Mon, 27 Jul 2026 09:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785170140; bh=4sKV8aAQtP6aGoXl5meZsBRp3JbYXD7E9FpB8toD3VI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j5zXlzfmafnG3XA13MOI2MYAry08PRHkjJf3dGHIHWaYgI1l+0ShUSZjr++IJkEiF
	 oMuPZHMZntUfU0kFK6RdAuh0+oZeK6ZLaTXu4HbSM78bWVziMfCWFbPkHTw20Uz6pQ
	 O6AVkjb7/6ykRqyHDHvcX3fYZdU66ejaoUlRR3UU=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [RFC PATCH v2 16/45] arm64: interrupts: Introduce exception masking save/restore helpers
Date: Mon, 27 Jul 2026 17:34:24 +0100
Message-Id: <20260727163453.7969-17-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260727163453.7969-1-vladimir.murzin@arm.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_093541_975726_CA67A1C6 
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
 arch/arm64/include/asm/interrupts/masking.h | 89 +++++++++++++++++++++
 arch/arm64/kernel/irq.c                     | 32 +++++++-
 2 files changed, 120 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/include/asm/interrupts/masking.h

diff --git a/arch/arm64/include/asm/interrupts/masking.h b/arch/arm64/include/asm/interrupts/masking.h
new file mode 100644
index 000000000000..fd4fb5497c7e
--- /dev/null
+++ b/arch/arm64/include/asm/interrupts/masking.h
@@ -0,0 +1,89 @@
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
index 9fafd826002b..ca98db345f92 100644
--- a/arch/arm64/kernel/irq.c
+++ b/arch/arm64/kernel/irq.c
@@ -21,7 +21,7 @@
 #include <linux/seq_file.h>
 #include <linux/smp.h>
 #include <linux/vmalloc.h>
-#include <asm/daifflags.h>
+#include <asm/interrupts/masking.h>
 #include <asm/exception.h>
 #include <asm/numa.h>
 #include <asm/softirq_stack.h>
@@ -39,6 +39,12 @@ DECLARE_PER_CPU(unsigned long *, irq_shadow_call_stack_ptr);
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
@@ -133,3 +139,27 @@ void __init init_IRQ(void)
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


