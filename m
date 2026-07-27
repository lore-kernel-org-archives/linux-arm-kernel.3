Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B30F7C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8FGGmlFVXTBhF9SJHe7Se1HljLibCwoXnF52mKKyBoo=; b=lgYbRf7gQ5RY7eHW4IHqLZym44
	B6ycknhSA8qSfIsLJsgbQsMFQPCKds3GsqmgYQS03mx357CAbbu3hc2UtrZlCXe9/zddxqIH5qNBQ
	ERNJ/Abp4cJv9xGJBZzDwcSG3KUV7fjHsBNp3ivy6c9uhZ6uS6gjOlypgZQzcwziWJvcHBEcuel8n
	EgB76lydVpenvjFpPHpJ+dulhGjCsEtjD4kzr3JybkpgMLrLUrZoexeGBGaM6cu2srNe9CuLS0Rj9
	Nb5EsTnOkql5lsxtU/PyjfpQBqiwDFBH/RvcIajGCtxabwFqI8QZ4E3B7iGdvg3tzZUKjakQEfaNz
	3qSH65Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOIy-00000003Mpt-1IOJ;
	Mon, 27 Jul 2026 16:35:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOIi-00000003MSR-1iI3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:35:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63DA21688;
	Mon, 27 Jul 2026 09:35:31 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8C9893F86F;
	Mon, 27 Jul 2026 09:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785170135; bh=ygP+M3JwB9/8x+6BBnygert5if1HwtpwHdYMc7WMov0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AU8DGSn40TMDZqSlwYU/+esry6Wsvj3X0SVNSvvoYws6fZ4UUUdchLZGSM60ZyO0X
	 0QT+4Ink/cKG4cyTHsb/uG+VCV4OlpsHHhYrC0G8PX6WNs21/s3GgHZ3xVH5qCG794
	 f6JtmW9+Q/5FyTez2j7PkQvD2QDPMGf2SRM0Gzn8=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [RFC PATCH v2 12/45] arm64: interrupts: Add common exception state helpers
Date: Mon, 27 Jul 2026 17:34:20 +0100
Message-Id: <20260727163453.7969-13-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260727163453.7969-1-vladimir.murzin@arm.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_093536_527240_E7CFA430 
X-CRM114-Status: GOOD (  20.26  )
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

The entry code and the rest of the kernel require different interrupt
masking APIs, but all need a common representation of the hardware
exception state.

Introduce exception contexts that map DAIF and PMR state to the
corresponding masking context. Provide helpers to translate between
exception contexts and hardware state, verify the current state, and
update the hardware state.

Updating PMR is unnecessary when a caller knows that its value has not
changed. Allow such callers to avoid the update, while providing a
force option for callers that cannot rely on the previous PMR state.

Entry specific and general purpose masking APIs will be built on these
helpers in subsequent patches.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 .../include/asm/interrupts/common_flags.h     | 208 ++++++++++++++++++
 1 file changed, 208 insertions(+)
 create mode 100644 arch/arm64/include/asm/interrupts/common_flags.h

diff --git a/arch/arm64/include/asm/interrupts/common_flags.h b/arch/arm64/include/asm/interrupts/common_flags.h
new file mode 100644
index 000000000000..f034dcafccbc
--- /dev/null
+++ b/arch/arm64/include/asm/interrupts/common_flags.h
@@ -0,0 +1,208 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2025 Arm Ltd.
+ */
+#ifndef __ASM_INTERRUPTS_COMMON_FLAGS_H
+#define __ASM_INTERRUPTS_COMMON_FLAGS_H
+
+#include <asm/arch_gicv3.h>
+#include <asm/bug.h>
+#include <asm/cpufeature.h>
+#include <asm/ptrace.h>
+#include <asm/sysreg.h>
+#include <asm/irqflags.h>
+
+#define DAIF_PROCCTX		0
+#define DAIF_PROCCTX_NOIRQ	(PSR_I_BIT | PSR_F_BIT)
+#define DAIF_ERRCTX		(PSR_A_BIT | PSR_I_BIT | PSR_F_BIT)
+#define DAIF_MASK		(PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT)
+
+/*
+ * Exception context mapping
+ *
+ * pseudo-NMI
+ *
+ * CRITICAL -> DAIF + IRQON  (corresponds to the state on exception entry)
+ * ERROR    ->  AIF + IRQON
+ * NONMI    ->   IF + IRQON
+ * NOIRQ    ->    0 + IRQOFF
+ * PROCESS  ->    0 + IRQON
+ *
+ * Otherwise
+ *
+ * CRITICAL -> DAIF           (corresponds to the state on exception entry)
+ * ERROR    ->  AIF
+ * NONMI    ->   IF
+ * NOIRQ    ->   IF
+ * PROCESS  ->    0
+ */
+typedef enum arm64_exc_context {
+	PROCESS_CONTEXT,
+	NOIRQ_CONTEXT,
+	NONMI_CONTEXT,
+	ERROR_CONTEXT,
+	CRITICAL_CONTEXT,
+} arm64_exc_context_t;
+
+static __always_inline
+arm64_exc_hwstate_t __arm64_exc_hwstate_of_process_context(void)
+{
+	if (system_uses_irq_prio_masking())
+		return (arm64_exc_hwstate_t){.daif=DAIF_PROCCTX, .pmr=GIC_PRIO_IRQON};
+
+	return (arm64_exc_hwstate_t){.daif=DAIF_PROCCTX};
+}
+
+static __always_inline
+arm64_exc_hwstate_t __arm64_exc_hwstate_of_noirq_context(void)
+{
+	if (system_uses_irq_prio_masking())
+		return (arm64_exc_hwstate_t){.daif=DAIF_PROCCTX, .pmr=GIC_PRIO_IRQOFF};
+
+	return (arm64_exc_hwstate_t){.daif=DAIF_PROCCTX_NOIRQ};
+}
+
+static __always_inline
+arm64_exc_hwstate_t __arm64_exc_hwstate_of_nonmi_context(void)
+{
+	if (system_uses_irq_prio_masking())
+		return (arm64_exc_hwstate_t){.daif=DAIF_PROCCTX_NOIRQ, .pmr=GIC_PRIO_IRQON};
+
+	return (arm64_exc_hwstate_t){.daif=DAIF_PROCCTX_NOIRQ};
+}
+
+static __always_inline
+arm64_exc_hwstate_t __arm64_exc_hwstate_of_error_context(void)
+{
+	if (system_uses_irq_prio_masking())
+		return (arm64_exc_hwstate_t){.daif=DAIF_ERRCTX, .pmr=GIC_PRIO_IRQON};
+
+	return (arm64_exc_hwstate_t){.daif=DAIF_ERRCTX};
+}
+
+static __always_inline
+arm64_exc_hwstate_t __arm64_exc_hwstate_of_critical_context(void)
+{
+	if (system_uses_irq_prio_masking())
+		return (arm64_exc_hwstate_t){.daif=DAIF_MASK, .pmr=GIC_PRIO_IRQON};
+
+	return (arm64_exc_hwstate_t){.daif=DAIF_MASK};
+}
+
+static __always_inline
+arm64_exc_hwstate_t arm64_exc_hwstate_of_context(arm64_exc_context_t context) {
+	switch (context) {
+	case PROCESS_CONTEXT:
+		return __arm64_exc_hwstate_of_process_context();
+	case NOIRQ_CONTEXT:
+		return __arm64_exc_hwstate_of_noirq_context();
+	case NONMI_CONTEXT:
+		return __arm64_exc_hwstate_of_nonmi_context();
+	case ERROR_CONTEXT:
+		return __arm64_exc_hwstate_of_error_context();
+	case CRITICAL_CONTEXT:
+		return __arm64_exc_hwstate_of_critical_context();
+	default:
+		BUG();
+	}
+}
+
+static __always_inline
+arm64_exc_hwstate_t arm64_inherit_exc_hwstate(struct pt_regs *regs)
+{
+	arm64_exc_hwstate_t state = {.daif=regs->pstate & DAIF_MASK};
+
+	if (system_uses_irq_prio_masking())
+		state.pmr = regs->pmr;
+
+	return state;
+}
+
+static __always_inline
+void arm64_debug_exc_hwstate(arm64_exc_hwstate_t expected)
+{
+	arm64_exc_hwstate_t actual;
+
+	if (!IS_ENABLED(CONFIG_DEBUG_IRQFLAGS))
+		return;
+
+	actual.flags = arch_local_save_flags();
+
+	if (expected.flags == actual.flags)
+		return;
+
+	if (system_uses_irq_prio_masking()) {
+		WARN_ONCE(1, "Unexpected DAIF+PMR: 0x%x + 0x%x (expected 0x%x + 0x%x)\n",
+			  actual.daif, actual.pmr, expected.daif, expected.pmr);
+	} else {
+		WARN_ONCE(1, "Unexpected DAIF: 0x%x (expected 0x%x)\n",
+			  actual.daif, expected.daif);
+	}
+}
+
+static __always_inline
+void arm64_debug_exc_context(arm64_exc_context_t context)
+{
+	arm64_exc_hwstate_t expected = arm64_exc_hwstate_of_context(context);
+
+	arm64_debug_exc_hwstate(expected);
+}
+
+static __always_inline
+void __arm64_update_exc_hwstate(arm64_exc_hwstate_t hwstate, bool force)
+{
+	barrier();
+
+	if (system_uses_irq_prio_masking() &&
+	    hwstate.pmr == GIC_PRIO_IRQOFF &&
+	    force) {
+		/*
+		 * There has been concern that the write to daif
+		 * might be reordered before this write to PMR.
+		 * From the ARM ARM DDI 0487D.a, section D1.7.1
+		 * "Accessing PSTATE fields":
+		 *   Writes to the PSTATE fields have side-effects on
+		 *   various aspects of the PE operation. All of these
+		 *   side-effects are guaranteed:
+		 *     - Not to be visible to earlier instructions in
+		 *       the execution stream.
+		 *     - To be visible to later instructions in the
+		 *       execution stream
+		 *
+		 * Also, writes to PMR are self-synchronizing, so no
+		 * interrupts with a lower priority than PMR is signaled
+		 * to the PE after the write.
+		 *
+		 * So we don't need additional synchronization here.
+		 */
+		write_sysreg_s(hwstate.pmr, SYS_ICC_PMR_EL1);
+	}
+
+	barrier();
+	write_sysreg(hwstate.daif, daif);
+	barrier();
+
+	if (system_uses_irq_prio_masking() &&
+	    hwstate.pmr == GIC_PRIO_IRQON &&
+	    force) {
+		write_sysreg_s(hwstate.pmr, SYS_ICC_PMR_EL1);
+		pmr_sync();
+	}
+
+	barrier();
+}
+
+static __always_inline
+void arm64_update_exc_hwstate(arm64_exc_hwstate_t hwstate)
+{
+	__arm64_update_exc_hwstate(hwstate, true);
+}
+
+static __always_inline
+void arm64_update_exc_context(arm64_exc_context_t context)
+{
+	arm64_exc_hwstate_t hwstate = arm64_exc_hwstate_of_context(context);
+
+	arm64_update_exc_hwstate(hwstate);
+}
+#endif /* __ASM_INTERRUPTS_COMMON_FLAGS_H */
-- 
2.34.1


