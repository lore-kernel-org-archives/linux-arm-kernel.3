Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF300C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vOcHTsYb4h+VeUSRe2lAfYF/8fkZ7txsIUQH7WX2X+g=; b=cgVJG/txZ5m7rW
	X3FoXsg1Ngkw4HGjxnVWJcIFbtHDyo8hAGi8hRu2bQo5olEohCYX2eBA5cF1fmf4F+YHK5LqEHTqG
	Qp3t0HGMpbLpWFgY5oMRWREaksGZL26GUEUFmOqrIDutxHDQifppVP6QarfPI53sX2CNLiBGC7RU2
	LxFuEBJykQX8cwkijfT15YqkNvV4Wln1VVPVu98vR5T6LZSv0xY5iyGDEOmM6lh5349RX0Ql+FM9h
	lIwnVbWrdFNmc0S5lu1GuIO9f0kOo4h/p4WlvozLVBxvMurzzzBGCT9k9bIUjoyZksWo9GMZwql+w
	7AhAccffi2vmR2KVTa2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whndy-00000002KiE-2P9U;
	Thu, 09 Jul 2026 12:14:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whndv-00000002KOh-0Ezl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 12:14:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 560AD3569;
	Thu,  9 Jul 2026 05:14:10 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 84BA03F66F;
	Thu,  9 Jul 2026 05:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783599254; bh=rBuhUjEtMlgf1ot1Zj1uMreE+JixP7BdiR7Hp+9ur8U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GLyXrkDnFiHixPoWZfqxuHDZjEd23wtXjd+EbjgLkXVSN6t2pdYotLpPjy7yjVTUA
	 jBgwHIhCPRDBCR2kLp9ZH5i14h8E0/MKAIi+lWtKx1ay+dLGAQ1TwG0p1kA/zbEX2k
	 5atWIlKtMwdS8MPVqZsM0aDgbJN1OVqtNOdnqne8=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 14/36] arm64: interrupts: introduce generic interrupt masking helpers
Date: Thu,  9 Jul 2026 13:13:11 +0100
Message-Id: <20260709121333.23507-15-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260709121333.23507-1-vladimir.murzin@arm.com>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_051415_176654_88E4A280 
X-CRM114-Status: GOOD (  15.44  )
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
Cc: mark.rutland@arm.com, maz@kernel.org, ruanjinjie@huawei.com, catalin.marinas@arm.com, will@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ada Couprie Diaz <ada.coupriediaz@arm.com>

As for the entry code, we want to replace `local_daif_...` helpers
so that they can properly handle both DAIF and PMR, as well controlling
their use more strongly.

Introduce new `local_all_irqs_...` helpers to replace them, which should
only be called in save/restore pairs.

Save the requested interrupt state as well, so we can check for
inconsistent interrupt masking in between save and restore.

There are two exceptions where it does not make sense to force
save/restore pairs for modifying the interrupt masks:
 - when initializing a CPU or
 - preparing to turn it off.

As we otherwise want to force save/restore pairs, those cases are
handled with specific helpers, making clear that they should not be
used outside of those cases, enforced with `CONFIG_DEBUG_IRQFLAGS`
enabled.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 arch/arm64/include/asm/interrupts/masking.h | 101 ++++++++++++++++++++
 1 file changed, 101 insertions(+)
 create mode 100644 arch/arm64/include/asm/interrupts/masking.h

diff --git a/arch/arm64/include/asm/interrupts/masking.h b/arch/arm64/include/asm/interrupts/masking.h
new file mode 100644
index 000000000000..66ee03f7ab68
--- /dev/null
+++ b/arch/arm64/include/asm/interrupts/masking.h
@@ -0,0 +1,101 @@
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
+#ifdef CONFIG_DEBUG_IRQFLAGS
+/* Make sure the CPU init/tear down masking functions are only used once. */
+static DEFINE_PER_CPU(bool, irqs_masks_cpu_init_done);
+static DEFINE_PER_CPU(bool, irqs_masks_cpu_final_done);
+#endif
+
+static inline
+arm64_exc_hwstates_t local_all_irqs_save_mask(arm64_exc_context_t new)
+{
+	arm64_exc_hwstate_t state = arm64_exc_hwstate_of_context(new);
+	arm64_exc_hwstate_t actual = {.flags = arch_local_save_flags()};
+
+	if (IS_ENABLED(CONFIG_DEBUG_IRQFLAGS)) {
+		bool pnmi = system_uses_irq_prio_masking();
+
+		WARN_ON_ONCE(new < CRITICAL_CONTEXT &&
+			     actual.daif == DAIF_MASK);
+
+		WARN_ON_ONCE(new < ERROR_CONTEXT &&
+			     actual.daif == DAIF_ERRCTX);
+
+		WARN_ON_ONCE(new < NONMI_CONTEXT &&
+			     pnmi && actual.daif == DAIF_PROCCTX_NOIRQ);
+
+		WARN_ON_ONCE(new < NOIRQ_CONTEXT &&
+			     ((pnmi && actual.pmr == GIC_PRIO_IRQOFF) ||
+			      (!pnmi && actual.daif == DAIF_PROCCTX_NOIRQ)));
+	}
+
+	arm64_update_exc_hwstate(state, actual.pmr != state.pmr);
+
+	if (!arch_irqs_disabled_flags(actual.flags))
+		trace_hardirqs_off();
+
+	return (arm64_exc_hwstates_t){.saved = actual, .expected = state};
+}
+
+static inline void local_all_irqs_restore(arm64_exc_hwstates_t states)
+{
+	arm64_debug_exc_hwstate(states.expected);
+
+	if (!arch_irqs_disabled_flags(states.saved.flags))
+		trace_hardirqs_on();
+
+	arm64_update_exc_hwstate(states.saved, true);
+}
+
+#ifdef CONFIG_DEBUG_IRQFLAGS
+static inline
+void local_all_irqs_cpu_init_mask(arm64_exc_context_t context)
+{
+	WARN_ON(__this_cpu_read(irqs_masks_cpu_init_done));
+	if (context == PROCESS_CONTEXT)
+		trace_hardirqs_on();
+	arm64_update_exc_context(context, true);
+	__this_cpu_write(irqs_masks_cpu_init_done, true);
+	__this_cpu_write(irqs_masks_cpu_final_done, false);
+}
+
+static inline void local_all_irqs_final_mask(void)
+{
+	WARN_ON(__this_cpu_read(irqs_masks_cpu_final_done));
+	arm64_update_exc_context(CRITICAL_CONTEXT, true);
+	trace_hardirqs_off();
+	__this_cpu_write(irqs_masks_cpu_final_done, true);
+	__this_cpu_write(irqs_masks_cpu_init_done, false);
+}
+#else /* CONFIG_DEBUG_IRQFLAGS */
+static inline
+void local_all_irqs_cpu_init_mask(arm64_exc_context_t context)
+{
+	if (context == PROCESS_CONTEXT)
+		trace_hardirqs_on();
+	arm64_update_exc_context(context, true);
+}
+
+static inline void local_all_irqs_final_mask(void)
+{
+	arm64_update_exc_context(CRITICAL_CONTEXT, true);
+	trace_hardirqs_off();
+}
+#endif /* CONFIG_DEBUG_IRQFLAGS */
+#endif /* __ASM_INTERRUPTS_MASKING_H */
-- 
2.34.1


