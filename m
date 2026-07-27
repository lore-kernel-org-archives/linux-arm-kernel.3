Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57176C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nPXtduZAjebA7ZbzHPFIkXCD4OjYMq5tTr4ljl5eloI=; b=cEOzdebbqGAQPYtfRGCquNZmcG
	RiotEo2b0PFYzEGpM63lzREytDkjaXeL0yDvEgzKPuzbUcAhcmMMtf1bPl68wcNwk+6+dUSvtmaJz
	q06XhEgziLtUNYbnhf/aWoe98Yl1KiMNB5zpxrTklPGgd1tAiYx/QU3nb3RUwgk5M3ESZhVxVaGa2
	RR5llfoa03TISXXPw8uI8z/hu4RS434HUGQdY039c/TNPJDj2R7SsPKULRFx+enUURbjsdUJh1P2u
	2ys7nZ4nW+6gk+d0TnXGFK3f60Is+QlyqsLwBYFlaA8eP32RPG0cEAqS5bnwRbJsbm0ISchYkdt3z
	h7D0BBFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOIz-00000003MsH-1ZR9;
	Mon, 27 Jul 2026 16:35:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOIk-00000003MSR-40qR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:35:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCDA71688;
	Mon, 27 Jul 2026 09:35:33 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 00CF73F86F;
	Mon, 27 Jul 2026 09:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785170137; bh=996vPGKSmu+khzNinjMXhBFADpKCKYLdHOZ6nLXCZcI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F6U+SiERBMB9eEOzZ+v9TloLKhZmOdT1eLM/KHPpPQAMevD6X3SMcU2BX39BeN2pb
	 LERWz6cl/CBCToIRTE1RVQVaUgFzI6S5TsesVDmXNFebBJLSDafGVm4XYtkFvVSPjN
	 KMZZKd5DdaN+PfVgkxRc0W2guVQHwFMeaYz7Mwm4=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [RFC PATCH v2 14/45] arm64: entry: Introduce entry specific exception masking helpers
Date: Mon, 27 Jul 2026 17:34:22 +0100
Message-Id: <20260727163453.7969-15-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260727163453.7969-1-vladimir.murzin@arm.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_093539_079645_63398676 
X-CRM114-Status: GOOD (  14.44  )
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

The entry code handles interrupt masking differently from the rest of
the kernel. Exception handlers enter and exit with all exceptions
masked, but they must temporarily unmask the appropriate set of
exceptions so that the rest of the handler executes with the expected
exception state.

For EL0 handlers, this means dropping to masking context appropriate
for the work to be performed. For EL1 handlers, this means restoring
the masking context of the interrupted task. In both cases, all
exceptions must be masked again before returning from the exception
handler.

The rest of the kernel typically follows the opposite pattern: it
raises the masking context to protect a critical section and later
restores the previous context.

Given these different usage patterns, introduce a dedicated set of
exception masking helpers for the entry code. Keeping these helpers
separate from the generic interrupt masking APIs makes the intended
usage explicit and helps avoid mixing the two masking models.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 arch/arm64/include/asm/interrupts/entry.h | 113 ++++++++++++++++++++++
 1 file changed, 113 insertions(+)
 create mode 100644 arch/arm64/include/asm/interrupts/entry.h

diff --git a/arch/arm64/include/asm/interrupts/entry.h b/arch/arm64/include/asm/interrupts/entry.h
new file mode 100644
index 000000000000..d66eb5d633f0
--- /dev/null
+++ b/arch/arm64/include/asm/interrupts/entry.h
@@ -0,0 +1,113 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2025 Arm Ltd.
+ */
+#ifndef __ASM_INTERRUPTS_ENTRY_H
+#define __ASM_INTERRUPTS_ENTRY_H
+
+#include <asm/arch_gicv3.h>
+#include <asm/bug.h>
+#include <asm/cpufeature.h>
+#include <asm/interrupts/common_flags.h>
+
+
+static __always_inline
+arm64_exc_hwstate_t __arm64_switch_exc_hwstate_to(arm64_exc_hwstate_t prev,
+						  arm64_exc_hwstate_t next)
+{
+	bool irqs_disabled = arch_irqs_disabled_flags(next.flags);
+	bool force;
+
+	arm64_debug_exc_hwstate(prev);
+
+	if (prev.flags == next.flags)
+		return next;
+
+	if (!irqs_disabled)
+		trace_hardirqs_on();
+
+	force = system_uses_irq_prio_masking() && prev.pmr != next.pmr;
+
+	__arm64_update_exc_hwstate(next, force);
+
+	if (irqs_disabled)
+		trace_hardirqs_off();
+
+	return next;
+}
+
+static __always_inline
+arm64_exc_hwstate_t arm64_inherit_exc_context(struct pt_regs *regs)
+{
+	arm64_exc_hwstate_t prev = arm64_exc_hwstate_of_context(CRITICAL_CONTEXT);
+	arm64_exc_hwstate_t next = arm64_inherit_exc_hwstate(regs);
+
+	return __arm64_switch_exc_hwstate_to(prev, next);
+}
+
+static __always_inline
+arm64_exc_hwstate_t arm64_drop_exc_context(arm64_exc_hwstate_t prev, arm64_exc_context_t context)
+{
+	arm64_exc_hwstate_t next = arm64_exc_hwstate_of_context(context);
+
+	if (IS_ENABLED(CONFIG_DEBUG_IRQFLAGS)) {
+		bool pnmi = system_uses_irq_prio_masking();
+
+		WARN_ON_ONCE(context > ERROR_CONTEXT &&
+			     prev.daif == DAIF_ERRCTX);
+
+		WARN_ON_ONCE(context > NONMI_CONTEXT &&
+			     prev.daif == DAIF_PROCCTX_NOIRQ);
+
+		WARN_ON_ONCE(context > NOIRQ_CONTEXT &&
+			     pnmi && prev.pmr == GIC_PRIO_IRQOFF);
+
+		WARN_ON_ONCE(context > PROCESS_CONTEXT &&
+			     ((pnmi && prev.daif == DAIF_PROCCTX && prev.pmr == GIC_PRIO_IRQON) ||
+			      (!pnmi && prev.daif == DAIF_PROCCTX)));
+	}
+
+	return __arm64_switch_exc_hwstate_to(prev, next);
+}
+
+static __always_inline
+arm64_exc_hwstate_t arm64_lift_exc_context(arm64_exc_hwstate_t prev, arm64_exc_context_t context)
+{
+	arm64_exc_hwstate_t next = arm64_exc_hwstate_of_context(context);
+
+	if (IS_ENABLED(CONFIG_DEBUG_IRQFLAGS)) {
+		bool pnmi = system_uses_irq_prio_masking();
+
+		WARN_ON_ONCE(context < CRITICAL_CONTEXT &&
+			     prev.daif == DAIF_MASK);
+
+		WARN_ON_ONCE(context < ERROR_CONTEXT &&
+			     prev.daif == DAIF_ERRCTX);
+
+		WARN_ON_ONCE(context < NONMI_CONTEXT &&
+			     pnmi && prev.daif == DAIF_PROCCTX_NOIRQ);
+
+		WARN_ON_ONCE(context < NOIRQ_CONTEXT &&
+			     ((pnmi && prev.pmr == GIC_PRIO_IRQOFF) ||
+			      (!pnmi && prev.daif == DAIF_PROCCTX_NOIRQ)));
+	}
+
+	return __arm64_switch_exc_hwstate_to(prev, next);
+}
+
+
+static __always_inline
+arm64_exc_hwstate_t arm64_unmask_exc_context(arm64_exc_context_t context)
+{
+	arm64_exc_hwstate_t prev = arm64_exc_hwstate_of_context(CRITICAL_CONTEXT);
+
+	return arm64_drop_exc_context(prev, context);
+}
+
+static __always_inline
+arm64_exc_hwstate_t arm64_mask_exc_context(arm64_exc_hwstate_t prev)
+{
+	return arm64_lift_exc_context(prev, CRITICAL_CONTEXT);
+}
+
+#endif /* __ASM_INTERRUPTS_ENTRY_H */
-- 
2.34.1


