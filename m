Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 805F1C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 10:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=agzqGvbctxvP+rJ6izPk8xhSnEfEv0d1x7sJEbQaz1I=; b=JhplF3V8ipGLBqYPrsLK/ygfzd
	4FALkd5HRZtThn5XIE5tv5/o7kXt68kxv4LQfqTBDzNhmUZ/5rIHwUOe6d2Jz5m/hQvWbmUdiB+vl
	btkx5Pcpz+LBCaaV7zCbKavPFDvrOqreF5WtWOL+2ODzKYVmzUcd0Q8taHfohSVSWOLpfh2xfUrST
	BiCf/3BhTB5HEOMCB3JshdOgz9539tPQYiAGdQ1e4Xog8SpP8RB8cQvEq/5o3SwdqhtR0eYdNrS4/
	rYnD7oTfjP5h8LKD/N8U/00BRigtAaTEh2dkv2teWzN7qDe/KYz5Ye+pSyI3rUKg8kiX7IPFZ2INI
	v0wjuuhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63oo-000000035NU-0ESn;
	Mon, 14 Sep 2026 10:21:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63od-000000035Gv-27Lu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 10:21:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5460A1C2B;
	Mon, 14 Sep 2026 03:21:31 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D49F43F7B4;
	Mon, 14 Sep 2026 03:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789381295; bh=5bTOkRNnSQ6lDeS6DI69PPUgPZplSp52ZS0ECRGF4oA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lJ1qUq6d3Stt+VcMfc5ANGAr1s3eXRQ7yf16FZZqj73qBss8vFICn0lBsfJQm6EAA
	 bFmrZS9C4XNYwjOWlQ5hq9FNW2aOQK5NQTPKGRpos6EFad10dDY4Uwa7fbzkIXgUCn
	 7nAX7vTgu3pvevYpYwAAPr9DuvXbhVeD20dFZ+ac=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	maz@kernel.org,
	lpieralisi@kernel.org,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [PATCH 05/38] arm64: entry: Introduce entry specific exception masking helpers
Date: Mon, 14 Sep 2026 11:20:29 +0100
Message-Id: <20260914102102.68597-6-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260914102102.68597-1-vladimir.murzin@arm.com>
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_032135_623291_0818D8E5 
X-CRM114-Status: GOOD (  14.70  )
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
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/interrupts/entry.h | 100 ++++++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 arch/arm64/include/asm/interrupts/entry.h

diff --git a/arch/arm64/include/asm/interrupts/entry.h b/arch/arm64/include/asm/interrupts/entry.h
new file mode 100644
index 000000000000..0cfca62aa25b
--- /dev/null
+++ b/arch/arm64/include/asm/interrupts/entry.h
@@ -0,0 +1,100 @@
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
+		WARN_ON_ONCE(prev.daif < next.daif);
+
+		if (prev.daif == next.daif) {
+			/*
+			 * GIC_PRIO_IRQON is larger that GIC_PRIO_IRQOFF so larger PMR value is weaker
+			 */
+			WARN_ON_ONCE(system_uses_irq_prio_masking() && prev.pmr > next.pmr);
+		}
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
+		WARN_ON_ONCE(prev.daif > next.daif);
+
+		if (prev.daif == next.daif) {
+			/*
+			 * GIC_PRIO_IRQON is larger that GIC_PRIO_IRQOFF so smaller PMR value is stronger
+			 */
+			WARN_ON_ONCE(system_uses_irq_prio_masking() && prev.pmr < next.pmr);
+		}
+	}
+
+	return __arm64_switch_exc_hwstate_to(prev, next);
+}
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


