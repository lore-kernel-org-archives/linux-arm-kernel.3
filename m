Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A10CFC54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EyInLL6D/BqYcuRn25xlQKegIbkafuyx51sppSzMr0o=; b=iF3Lg6zJpt3J9+PoQlDMpQzxHd
	A9gNtc4QG9Yxi35I3B7goHehO6hF/czx6DkMwbZU0bnQV3kMDD4VdjPuSxC84jqhv/FHcX3AUAYNy
	NfeSkNjM6UEpv7Q/AcBrsMFOXP1EvQgc8ts2AGXulm5abcPhomtAgPQlanxoVPIAgYSQOdFVRAFHt
	dtBumt2Ak8aT1rajtDg3NzlcQrwZ8GodMy90kKdSo/yKQ2HGNqXC0q9EMts0GGPdjSE0bW3/qe4mL
	7DiY5aTJSbdqKTfqyCAJ0+7kvJ30Tt+AsAueFWr4mI8ky5HLqQxS3ookJ0pp1Tvoi6DV1aqNEWsBJ
	FFq09SgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOJ1-00000003My9-4AqH;
	Mon, 27 Jul 2026 16:35:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOIq-00000003Mdo-2Olz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:35:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10BE11682;
	Mon, 27 Jul 2026 09:35:40 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 392F63F86F;
	Mon, 27 Jul 2026 09:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785170144; bh=QwTradb3LQik+84TXDVwz43xvCcZtNZnQCPoUQ4PTTs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hFO2++IuWnp+6jylITL6QPlHu8v8x8wJqS8lbQKDPGukVh0lqMIbl4r7ypK2X/g+z
	 GEo9GP+VkVspDoJ6ozSOTnvZayySHoRuOXY77GigWt8Md1t3NWqOg6LEsarL2vE35b
	 fCo+43YEHjUttVLXq38nT+4Lvopdo/Sq7cOBgNZ8=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [RFC PATCH v2 19/45] arm64: cpuidle: use new helpers to bypass interrupt priority masking
Date: Mon, 27 Jul 2026 17:34:27 +0100
Message-Id: <20260727163453.7969-20-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260727163453.7969-1-vladimir.murzin@arm.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_093544_717261_0C1D4CE5 
X-CRM114-Status: GOOD (  19.62  )
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
---
 arch/arm64/include/asm/cpuidle.h            | 18 ++----
 arch/arm64/include/asm/interrupts/masking.h | 61 +++++++++++++++++++++
 2 files changed, 65 insertions(+), 14 deletions(-)

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
index 193089fda252..e13852442062 100644
--- a/arch/arm64/include/asm/interrupts/masking.h
+++ b/arch/arm64/include/asm/interrupts/masking.h
@@ -89,6 +89,67 @@ static inline void local_exceptions_final_mask(void)
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
+	/*
+	 * We might have IF set or unset. In case IF already set orring with IF
+	 * won't change anything, combined with PMR set to IRQON we might become
+	 * one of contexts: CRITICAL, ERROR or NONMI. In case IF is unset (which
+	 * also implies that DA is unset) orring with IF and combining with PMR
+	 * set to IRQON would effectively gives us NONMI context.
+	 */
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


