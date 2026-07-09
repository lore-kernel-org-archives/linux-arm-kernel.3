Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A52FEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8vRhfh4UF+gzMVyYg+hxt0VtCRM9epVGstn1AVdr4RM=; b=f6uxxCkffPJSx6
	OFsU4HwrcU6swZBGnMK6Siay46N561po3vtMD7Pc2r7FtbO8ySvmpf0WJt7ewHSGWagH0LcPFSnnf
	VemNGN93Ru0bLOaRwFTagknTybagYo5WSoUP1TT8GMKmRGrLfgsbL5L/1C7V+OOZ+c/z+MtzDC35j
	L4MaluIEvqSW5/qRKQ+q5EwTia4IaImjx1CNakBxvMpRvQK9FjnVcejBTkbqqKR7JmYou9tk0VROg
	jWn35b+WX9Gg3v8cxhn+rFzjNJoUrzUv1a/wz9XEzy1dRCLT3p6gLPVHaoQiy8H5g5xpnVICNf5js
	IiN2cyl4u20ksHoQN/Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whndx-00000002Kep-1Dul;
	Thu, 09 Jul 2026 12:14:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whndo-00000002KRn-07C8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 12:14:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1FF33339;
	Thu,  9 Jul 2026 05:14:03 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 49AD33F66F;
	Thu,  9 Jul 2026 05:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783599247; bh=5yPQIKUyTcr5yE36Oqan1bBwz94dm/yC776Kb2SpaHA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Slzc0DX23JD9VSLAZ2SHHgv+9+tdd3iu2wxVXAFy9GT+OsRbIHsMN598fR1CNIsvM
	 YHs8kLwPbhzyW58HCcvgGV1GvUKY9xnNw0xkNfcNdBA5OkCMHW96LeAaCLBzs43Q1C
	 aP/6uHP23DedoDPS4ah3SVJl7DH9EE1Igozsktv0=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 09/36] arm64: irqflags: introduce arm64-specific irqflags type
Date: Thu,  9 Jul 2026 13:13:06 +0100
Message-Id: <20260709121333.23507-10-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260709121333.23507-1-vladimir.murzin@arm.com>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_051408_195725_2576C9D5 
X-CRM114-Status: GOOD (  17.71  )
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

With pseudo-NMIs enabled, we have two mechanisms that control
interrupt masking in parallel :
- The DAIF flags, masking at the CPU
- The GIC PMR, masking before the CPU

However, our irqflags implementation currently assumes that only one
of the two is used at a time, so both DAIF and PMR masking use the same
`unsigned long flags` in their own way.
This is incorrect, as some parts of the kernel will mask interrupts
with DAIF directly or bypass the local_irq masking via the PMR,
and makes tracking the state and changes of both in parallel impossible.

The irqflags API expects `unsigned long`s to be passed around, but
they should not be manipulated outside of the arch-specific code.
So, we can encode the information we need however we want as long as
we return and accept `unsigned long`s.

Introduce a union type for arm64 irqflags whose first member is
a struct allowing us to track DAIF and PMR in parallel, and the second
is the `unsigned long` expected by the irqflags API.

DAIF is a two byte value, to maintain compatibility with existing defines.
PMR is a one byte value, which is the maximum amount of priority bits
allowed by the GICv3 architecture.

Update the internal irqflags functions to use this new union and convert
back and forth with the irqflags unsigned long.
There should be no functional changes.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 arch/arm64/include/asm/irqflags.h | 80 ++++++++++++++++++++-----------
 1 file changed, 53 insertions(+), 27 deletions(-)

diff --git a/arch/arm64/include/asm/irqflags.h b/arch/arm64/include/asm/irqflags.h
index a8cb5a5c93b7..7775904ba6a9 100644
--- a/arch/arm64/include/asm/irqflags.h
+++ b/arch/arm64/include/asm/irqflags.h
@@ -9,6 +9,8 @@
 #include <asm/ptrace.h>
 #include <asm/sysreg.h>
 
+#include <linux/compiler.h>
+
 /*
  * Aarch64 has flags for masking: Debug, Asynchronous (serror), Interrupts and
  * FIQ exceptions, in the 'daif' register. We mask and unmask them in 'daif'
@@ -20,6 +22,22 @@
  * exceptions should be unmasked.
  */
 
+ /*
+  * Internally, we want to independently manipulate and track the different
+  * interrupt masking mechanisms.
+  * Externally, the generic irqflags API expects unsgined longs to represent
+  * the state of interrupts, which are treated as obscure arch-specific data.
+  */
+typedef union arm64_exc_hwstate {
+	struct {
+		u16 daif;
+		u8 pmr;
+	};
+	unsigned long flags;
+} arm64_exc_hwstate_t;
+
+static_assert(sizeof(arm64_exc_hwstate_t) == sizeof(unsigned long));
+
 static __always_inline void __daif_local_irq_enable(void)
 {
 	barrier();
@@ -77,14 +95,14 @@ static __always_inline void arch_local_irq_disable(void)
 	}
 }
 
-static __always_inline unsigned long __daif_local_save_flags(void)
+static __always_inline arm64_exc_hwstate_t __daif_local_save_flags(void)
 {
-	return read_sysreg(daif);
+	return (arm64_exc_hwstate_t){ .daif = read_sysreg(daif) };
 }
 
-static __always_inline unsigned long __pmr_local_save_flags(void)
+static __always_inline arm64_exc_hwstate_t __pmr_local_save_flags(void)
 {
-	return read_sysreg_s(SYS_ICC_PMR_EL1);
+	return (arm64_exc_hwstate_t){ .pmr = read_sysreg_s(SYS_ICC_PMR_EL1) };
 }
 
 /*
@@ -93,28 +111,32 @@ static __always_inline unsigned long __pmr_local_save_flags(void)
 static __always_inline unsigned long arch_local_save_flags(void)
 {
 	if (system_uses_irq_prio_masking()) {
-		return __pmr_local_save_flags();
+		return __pmr_local_save_flags().flags;
 	} else {
-		return __daif_local_save_flags();
+		return __daif_local_save_flags().flags;
 	}
 }
 
-static __always_inline bool __daif_irqs_disabled_flags(unsigned long flags)
+static __always_inline
+bool __daif_irqs_disabled_flags(arm64_exc_hwstate_t hwstate)
 {
-	return flags & PSR_I_BIT;
+	return hwstate.daif & PSR_I_BIT;
 }
 
-static __always_inline bool __pmr_irqs_disabled_flags(unsigned long flags)
+static __always_inline
+bool __pmr_irqs_disabled_flags(arm64_exc_hwstate_t hwstate)
 {
-	return flags != GIC_PRIO_IRQON;
+	return hwstate.pmr != GIC_PRIO_IRQON;
 }
 
 static __always_inline bool arch_irqs_disabled_flags(unsigned long flags)
 {
+	arm64_exc_hwstate_t hwstate = { .flags = flags };
+
 	if (system_uses_irq_prio_masking()) {
-		return __pmr_irqs_disabled_flags(flags);
+		return __pmr_irqs_disabled_flags(hwstate);
 	} else {
-		return __daif_irqs_disabled_flags(flags);
+		return __daif_irqs_disabled_flags(hwstate);
 	}
 }
 
@@ -137,49 +159,51 @@ static __always_inline bool arch_irqs_disabled(void)
 	}
 }
 
-static __always_inline unsigned long __daif_local_irq_save(void)
+static __always_inline arm64_exc_hwstate_t __daif_local_irq_save(void)
 {
-	unsigned long flags = __daif_local_save_flags();
+	arm64_exc_hwstate_t hwstate = __daif_local_save_flags();
 
 	__daif_local_irq_disable();
 
-	return flags;
+	return hwstate;
 }
 
-static __always_inline unsigned long __pmr_local_irq_save(void)
+static __always_inline arm64_exc_hwstate_t __pmr_local_irq_save(void)
 {
-	unsigned long flags = __pmr_local_save_flags();
+	arm64_exc_hwstate_t hwstate = __pmr_local_save_flags();
 
 	/*
 	 * There are too many states with IRQs disabled, just keep the current
 	 * state if interrupts are already disabled/masked.
 	 */
-	if (!__pmr_irqs_disabled_flags(flags))
+	if (!__pmr_irqs_disabled_flags(hwstate))
 		__pmr_local_irq_disable();
 
-	return flags;
+	return hwstate;
 }
 
 static __always_inline unsigned long arch_local_irq_save(void)
 {
 	if (system_uses_irq_prio_masking()) {
-		return __pmr_local_irq_save();
+		return __pmr_local_irq_save().flags;
 	} else {
-		return __daif_local_irq_save();
+		return __daif_local_irq_save().flags;
 	}
 }
 
-static __always_inline void __daif_local_irq_restore(unsigned long flags)
+static __always_inline
+void __daif_local_irq_restore(arm64_exc_hwstate_t hwstate)
 {
 	barrier();
-	write_sysreg(flags, daif);
+	write_sysreg(hwstate.daif, daif);
 	barrier();
 }
 
-static __always_inline void __pmr_local_irq_restore(unsigned long flags)
+static __always_inline
+void __pmr_local_irq_restore(arm64_exc_hwstate_t hwstate)
 {
 	barrier();
-	write_sysreg_s(flags, SYS_ICC_PMR_EL1);
+	write_sysreg_s(hwstate.pmr, SYS_ICC_PMR_EL1);
 	pmr_sync();
 	barrier();
 }
@@ -189,10 +213,12 @@ static __always_inline void __pmr_local_irq_restore(unsigned long flags)
  */
 static __always_inline void arch_local_irq_restore(unsigned long flags)
 {
+	arm64_exc_hwstate_t hwstate = { .flags = flags };
+
 	if (system_uses_irq_prio_masking()) {
-		__pmr_local_irq_restore(flags);
+		__pmr_local_irq_restore(hwstate);
 	} else {
-		__daif_local_irq_restore(flags);
+		__daif_local_irq_restore(hwstate);
 	}
 }
 
-- 
2.34.1


