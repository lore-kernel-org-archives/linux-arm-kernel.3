Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF958C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VQg53ehAFnrB01nEYV2rJXcWPdHCaHCZumOHDg6UyEQ=; b=1VHa5LgBHX5nEU
	8qvB8EQbNJ0YgdVm2pLWYhqZItCa1rgIFR13Kau+afCM88wujvAbh3qqlF0Ignk3uQwR50G/Ag00n
	1mCTTe+1ZkCrd+9txEyOfJrY3zembmxcEbOtL2nH23PFivUOpuesAY5DV7KL0MvZwKeqhPbJVtUnz
	C24kLOhk/7kY1eMFy78dNW8iPYSjtum+cQ7APyjCwvA9KmHTyu1A+Y3wOcpMEqIeofNH69PXYsWuP
	WWhscmsa03vZadeb/CH0sUrRXDDmvCT/I+rUg/i6eiRcpk6k/gWUYWjlIQS9FZrwBXTvTR3BxFSRX
	kgTiXFTecnC5jKfQolxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whneM-00000002LHk-1CD8;
	Thu, 09 Jul 2026 12:14:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whndy-00000002Kan-470A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 12:14:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3FE391476;
	Thu,  9 Jul 2026 05:14:13 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 69DB13F66F;
	Thu,  9 Jul 2026 05:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783599257; bh=8VQmFGRw+k59sHF9ZPQqZRgGJpA9tth18IfiP3VkYBY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MeeMM93XWWRjIFH5ucL4mM2nmTsVYHR06PG06RRMf4cKlRgr/v4ay7CD7z4wnPihE
	 xRKUBJeeTgGLw6yqRRrAPqMEph8ZE0/tdqvS3odMS8+LypsYwTSJGwYsMSR8dljiTi
	 8wZwk9cC1Z70PkJIDQb4HrERTT5OLAbMIRogpfZM=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 16/36] arm64: cpuidle: use new helpers to bypass interrupt priority masking
Date: Thu,  9 Jul 2026 13:13:13 +0100
Message-Id: <20260709121333.23507-17-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260709121333.23507-1-vladimir.murzin@arm.com>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_051419_130895_FB9AE611 
X-CRM114-Status: GOOD (  19.67  )
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
---
 arch/arm64/include/asm/cpuidle.h            | 14 ++---
 arch/arm64/include/asm/interrupts/masking.h | 58 +++++++++++++++++++++
 2 files changed, 62 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/cpuidle.h b/arch/arm64/include/asm/cpuidle.h
index 2047713e097d..0c7ccdaf1832 100644
--- a/arch/arm64/include/asm/cpuidle.h
+++ b/arch/arm64/include/asm/cpuidle.h
@@ -5,22 +5,17 @@
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
 		if (system_uses_irq_prio_masking()) {			\
-			c->daif_bits = read_sysreg(daif);		\
-			write_sysreg(c->daif_bits | PSR_I_BIT | PSR_F_BIT, \
-				     daif);				\
-			c->pmr = gic_read_pmr();			\
-			gic_write_pmr(GIC_PRIO_IRQON | GIC_PRIO_PSR_I_SET); \
+			c->arm64_context = local_all_irqs_force_daif_save(); \
 		}							\
 	} while (0)
 
@@ -28,8 +23,7 @@ struct arm_cpuidle_irq_context {
 	do {								\
 		struct arm_cpuidle_irq_context *c = __c;		\
 		if (system_uses_irq_prio_masking()) {			\
-			gic_write_pmr(c->pmr);				\
-			write_sysreg(c->daif_bits, daif);		\
+			local_all_irqs_force_daif_restore(c->arm64_context); \
 		}							\
 	} while (0)
 #else
diff --git a/arch/arm64/include/asm/interrupts/masking.h b/arch/arm64/include/asm/interrupts/masking.h
index 19d32618b2b9..9dc37a571094 100644
--- a/arch/arm64/include/asm/interrupts/masking.h
+++ b/arch/arm64/include/asm/interrupts/masking.h
@@ -99,6 +99,64 @@ static inline void local_all_irqs_final_mask(void)
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
+static inline arm64_exc_hwstates_t local_all_irqs_force_daif_save(void)
+{
+	arm64_exc_hwstates_t states = {};
+	/*
+	 * Cannot use lockdep_assert here as idle entry enables hardirqs
+	 * while keeping interrupts masked.
+	 */
+	WARN_ON_ONCE(!irqs_disabled());
+
+	if (system_uses_irq_prio_masking()) {
+	        states.saved.daif = read_sysreg(daif);
+	        states.saved.pmr = read_sysreg_s(SYS_ICC_PMR_EL1);
+		/*
+		 * We might have IF set or unset. In case IF already set orring with IF
+		 * won't change anything, combined with PMR set to IRQON we might become
+		 * one of contexts: CRITICAL, ERROR or NONMI. In case IF is unset (which
+		 * also implies that DA is unset) orring with IF and combining with PMR
+		 * set to IRQON would effectively gives us NONMI context.
+		 */
+		states.expected.daif = states.saved.daif | DAIF_PROCCTX_NOIRQ;
+		states.expected.pmr = GIC_PRIO_IRQON;
+
+		arm64_update_exc_hwstate(states.expected, true);
+	}
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
+void local_all_irqs_force_daif_restore(arm64_exc_hwstates_t states)
+{
+	/*
+	 * Cannot use lockdep_assert here as idle entry enables hardirqs
+	 * while keeping interrupts masked.
+	 */
+	WARN_ON_ONCE(!irqs_disabled());
+
+	if (system_uses_irq_prio_masking()) {
+		arm64_debug_exc_hwstate(states.expected);
+		arm64_update_exc_hwstate(states.saved, true);
+	}
+}
+
 /*
  * During early boot, we unmask PSR.DA before the GIC has been set up.
  * If we use IRQ priority masking, the PMR and PSR will be out of sync
-- 
2.34.1


