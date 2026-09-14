Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B8FC88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 11:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KxpZMbs6P991al40d9/EcvASpkfJogYBYjTyArXzdR0=; b=xg9UTBq74Ywl/L6AbwQyDPlJNy
	FPrrVAhY+zZrBz9O9IKRU6lG/6So3VGvHfuHteuy6ortCtxsGybXv5AlWRghQTmzpNf7Dmd86AZsq
	EE+N4wA5gkJdU2Ie4Q8VhCrUJlsEW5LyqdQ6W16kxRTpv9DLq0xuAWYRTxnRPNbvKT34GeRRxXQ/o
	4w4Ae1yjufkLGfWBCO4WuMQ3xdNcAKxAGq0h4usrrMWOer+2YUjm4TqqEjrvR2xkwEE4K6hnbsWyX
	r/p5+Fd5XX8Y6nrPVy5e1pHfK+M9zqv3D+yn3fBGe4cSiHgeZwJlCkYT4lujeRmBOijD50OC/nSgO
	2DnAGh2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63on-000000035Mc-2ctM;
	Mon, 14 Sep 2026 10:21:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63ob-000000035GR-0AIP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 10:21:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B3191CC4;
	Mon, 14 Sep 2026 03:21:28 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0579C3F7B4;
	Mon, 14 Sep 2026 03:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789381292; bh=/E1gADCXH2ZPZSq9YGzP8GGL96+lyKAqNJguewmEpvY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=byU3G00blU8bBFh7pqaUYFdnLEOJI4tUtnIZVyyEJXv84Vr34aEVVn5x+ZWjPn1+1
	 VRb+33De5kFpkxfsiauVDTxiI1GqauQS9pCH3zmR78Jb9Z05+ns+ZZ/ZcGlaLiCvJx
	 AOUkVjhvWuo48/Nv/iLxxXWVcyvbIicMRVDZ7NPY=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	maz@kernel.org,
	lpieralisi@kernel.org,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [PATCH 03/38] arm64: interrupts: Add common exception state helpers
Date: Mon, 14 Sep 2026 11:20:27 +0100
Message-Id: <20260914102102.68597-4-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260914102102.68597-1-vladimir.murzin@arm.com>
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_032133_173382_A124FBFE 
X-CRM114-Status: GOOD (  18.73  )
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
exception contexts and hardware state and update the hardware state.

Updating PMR is unnecessary when a caller knows that its value has not
changed. Allow such callers to avoid the update, while providing a
force option for callers that cannot rely on the previous PMR state.

Entry specific and general purpose masking APIs will be built on these
helpers in subsequent patches.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 .../include/asm/interrupts/common_flags.h     | 174 ++++++++++++++++++
 1 file changed, 174 insertions(+)
 create mode 100644 arch/arm64/include/asm/interrupts/common_flags.h

diff --git a/arch/arm64/include/asm/interrupts/common_flags.h b/arch/arm64/include/asm/interrupts/common_flags.h
new file mode 100644
index 000000000000..0de5ba1ae155
--- /dev/null
+++ b/arch/arm64/include/asm/interrupts/common_flags.h
@@ -0,0 +1,174 @@
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
+void __arm64_update_exc_hwstate(arm64_exc_hwstate_t hwstate, bool force)
+{
+	bool pseudo_nmi = system_uses_irq_prio_masking();
+
+	barrier();
+
+	if (pseudo_nmi && hwstate.pmr == GIC_PRIO_IRQOFF && force) {
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
+	write_sysreg(hwstate.daif, daif);
+
+	if (pseudo_nmi && hwstate.pmr == GIC_PRIO_IRQON && force) {
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


