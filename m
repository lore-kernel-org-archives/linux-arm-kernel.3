Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D561C88E65
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 10:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cQmZq5KUzctPK0a6MNRCOasNWGpIPs3EXE8Oy1jCAY4=; b=xF/gayzd+MYOjulAz6OPS3Y6P3
	O3rmSxQed3S6AavUvKQsWXxbE64cHLvz/GDPjNgioxL3e6hSR6NNsJ1A3t5Psv5p4lP95a2m7/NeT
	mmP0+ich9LYzkVJh2xappa4bH7i0s/98smr39r/HZ4SsL2O5AA79H3yyG6jJaIN5xZ+j4HN1nm7Fc
	c/XhNcF3K1WP0LO114n7gCYk84U0rExHh/h1RiJk9D74NUkYXLnp59yhPZNKbXinFYwXLVCSpPjKy
	ebSxy7o6NSYCtdkUnzjy0ZSKrTB6gCPWHAKyDMMjlznFmVVrQYsmyn5kfVolznWdSyXwysPbjno+f
	h8Fqx3aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63op-000000035QD-0RXn;
	Mon, 14 Sep 2026 10:21:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63ok-000000035J1-2ZCu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 10:21:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90EDD1CC4;
	Mon, 14 Sep 2026 03:21:38 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 188853F7B4;
	Mon, 14 Sep 2026 03:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789381302; bh=U1gKRsYUA1pEc3f8KqFYAzdhMzJTE53Uh6ZnF6JHcto=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sVsLFCqPrAn5itY5ur9vIGRjy1eWsgkDlY2dwasvh2doKPztVA6/RFn8/h929khXv
	 2TMC7YyGn7Tby4rO7aqaGnzmEhf5jfYKg4YVIaxJbXc7axvpI16keEaVGzEw1/WJva
	 vzsl25SwvD3jU54aQeTFiyj20+VhRIZgwtd5kHLA=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	maz@kernel.org,
	lpieralisi@kernel.org,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [PATCH 10/38] arm64: cpuidle: use new helpers to bypass interrupt priority masking
Date: Mon, 14 Sep 2026 11:20:34 +0100
Message-Id: <20260914102102.68597-11-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260914102102.68597-1-vladimir.murzin@arm.com>
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_032142_748624_58C5DEB2 
X-CRM114-Status: GOOD (  18.16  )
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

When the CPU goes into WFI and pseudo-NMIs are in use, we need to make
sure that interrupts are not masked by the PMR otherwise they would not
reach the CPU and wake it up.

Now that we have a proper API that handles both DAIF and PMR, extend it
to provide helpers allowing to temporarily switch to masking interrupts
via DAIF only when interrupt priorities are in use.
This could allow other parts of the code to make use of it and makes it
easier to check for proper use.

Replace the custom cpuidle helper with those new helpers.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/cpuidle.h            | 18 ++-----
 arch/arm64/include/asm/interrupts/masking.h | 54 +++++++++++++++++++++
 2 files changed, 58 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/include/asm/cpuidle.h b/arch/arm64/include/asm/cpuidle.h
index 2047713e097d..b70ef5fd5e57 100644
--- a/arch/arm64/include/asm/cpuidle.h
+++ b/arch/arm64/include/asm/cpuidle.h
@@ -5,32 +5,22 @@
 #include <asm/proc-fns.h>
 
 #ifdef CONFIG_ARM64_PSEUDO_NMI
-#include <asm/arch_gicv3.h>
+#include <asm/interrupts/masking.h>
 
 struct arm_cpuidle_irq_context {
-	unsigned long pmr;
-	unsigned long daif_bits;
+	arm64_exc_hwstates_t arm64_context;
 };
 
 #define arm_cpuidle_save_irq_context(__c)				\
 	do {								\
 		struct arm_cpuidle_irq_context *c = __c;		\
-		if (system_uses_irq_prio_masking()) {			\
-			c->daif_bits = read_sysreg(daif);		\
-			write_sysreg(c->daif_bits | PSR_I_BIT | PSR_F_BIT, \
-				     daif);				\
-			c->pmr = gic_read_pmr();			\
-			gic_write_pmr(GIC_PRIO_IRQON | GIC_PRIO_PSR_I_SET); \
-		}							\
+		c->arm64_context = local_exceptions_force_daif_save(); 	\
 	} while (0)
 
 #define arm_cpuidle_restore_irq_context(__c)				\
 	do {								\
 		struct arm_cpuidle_irq_context *c = __c;		\
-		if (system_uses_irq_prio_masking()) {			\
-			gic_write_pmr(c->pmr);				\
-			write_sysreg(c->daif_bits, daif);		\
-		}							\
+		local_exceptions_force_daif_restore(c->arm64_context);	\
 	} while (0)
 #else
 struct arm_cpuidle_irq_context { };
diff --git a/arch/arm64/include/asm/interrupts/masking.h b/arch/arm64/include/asm/interrupts/masking.h
index 9e589bf11ec8..8729922974b0 100644
--- a/arch/arm64/include/asm/interrupts/masking.h
+++ b/arch/arm64/include/asm/interrupts/masking.h
@@ -92,6 +92,60 @@ static inline void local_exceptions_final_mask(void)
 }
 #endif /* CONFIG_DEBUG_IRQFLAGS */
 
+/*
+ * In some cases, WFI or guest entry for example, we always want interrupts
+ * to reach the CPU even if masked. Masking via the PMR prevents them from
+ * reaching the CPU and waking it up.
+ * Force IRQ masking using DAIF by raising the priority mask
+ * and setting the IF flags.
+ *
+ * Should only be called when IRQs are already masked.
+ */
+static inline arm64_exc_hwstates_t local_exceptions_force_daif_save(void)
+{
+	arm64_exc_hwstates_t states = {};
+
+	if (!system_uses_irq_prio_masking())
+		return states;
+
+	/*
+	 * Cannot use lockdep_assert here as idle entry enables hardirqs
+	 * while keeping interrupts masked.
+	 */
+	WARN_ON_ONCE(!irqs_disabled());
+
+	states.saved.daif = read_sysreg(daif);
+	states.saved.pmr = read_sysreg_s(SYS_ICC_PMR_EL1);
+	states.expected.daif = states.saved.daif | DAIF_PROCCTX_NOIRQ;
+	states.expected.pmr = GIC_PRIO_IRQON;
+
+	arm64_update_exc_hwstate(states.expected);
+
+	return states;
+}
+
+/*
+ * Return to masking with the PMR, restoring previously saved DAIF and PMR.
+ *
+ * IRQs or interrupt priority masking should not have been re-enabled in between
+ * the save and restore.
+ */
+static inline
+void local_exceptions_force_daif_restore(arm64_exc_hwstates_t states)
+{
+	if (!system_uses_irq_prio_masking())
+		return;
+
+	/*
+	 * Cannot use lockdep_assert here as idle entry enables hardirqs
+	 * while keeping interrupts masked.
+	 */
+	WARN_ON_ONCE(!irqs_disabled());
+
+	arm64_debug_exc_hwstate(states.expected);
+	arm64_update_exc_hwstate(states.saved);
+}
+
 /*
  * During early boot, we unmask PSR.DA before the GIC has been set up.
  * If we use IRQ priority masking, the PMR and PSR will be out of sync
-- 
2.34.1


