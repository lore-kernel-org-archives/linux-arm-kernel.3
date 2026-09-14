Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC1EFC88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 10:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R7iVv1p1WtAouVJpGwRs7PiB95BaybuUuqA4WJNgwAw=; b=y0tom6PNDTwf9zbX4MqPZfKtut
	EwBICJbUN1wA9exC8xp7flpqROitKkRHWIoYO9bQMbbspaUUbwdA4UL6MzL/ppURVSNJJVA+s/Us1
	Yquuaa6Z1mjV4d2e4DJFnGXgpsgsr/LY2nZHTF7qckzC1QmCeEgMGO85mkqg/UVmvpO6SmAWNgJiT
	5HPec3s+7WBh4EipNhFrTGCmVEIaR6HAeyWEmpqXVyPtemimbzUffX7UxdbqAWf7SjvkyrDEG43o0
	5IbHpXf/2vfo2QjEMpAY67h1L6U21AJ/A+eje/vWfxftBuZnJY9wXASndIM8S/77vBEJH/bZM/Mlz
	S8WZrDew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63on-000000035MA-28Ki;
	Mon, 14 Sep 2026 10:21:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63oa-000000035Fd-1Xlk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 10:21:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A23511576;
	Mon, 14 Sep 2026 03:21:25 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2AA083F7B4;
	Mon, 14 Sep 2026 03:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789381289; bh=3+uzwUQwmeGWE7b7TIOhH1luQsA7AuX1YB4We4SnzAw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=drqha7YMPXHJnLQMDp6shHr5gsixws2Cs+h2gk26FGKJCJT+qdDxYvkuu6pR+fES6
	 aFXvj4kzX7lIFbKdgWNSJbGMI6UQohf8hOImnJt9GV37Nx6KjJUdt+G5gJOVyw93CC
	 Xcen1rwGb4RjpRSajy7ayiMbFsxUCdIxm6Ao0EVM=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	maz@kernel.org,
	lpieralisi@kernel.org,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [PATCH 01/38] arm64: irqflags: Introduce arm64-specific irqflags type
Date: Mon, 14 Sep 2026 11:20:25 +0100
Message-Id: <20260914102102.68597-2-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260914102102.68597-1-vladimir.murzin@arm.com>
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_032132_485628_64B820B4 
X-CRM114-Status: GOOD (  15.41  )
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
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/irqflags.h | 44 ++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/irqflags.h b/arch/arm64/include/asm/irqflags.h
index a8cb5a5c93b7..5c17e26727f9 100644
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
@@ -20,6 +22,24 @@
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
+		u8 __pad0;
+		u32 __pad1;
+	};
+	unsigned long flags;
+} arm64_exc_hwstate_t;
+
+static_assert(sizeof(arm64_exc_hwstate_t) == sizeof(unsigned long));
+
 static __always_inline void __daif_local_irq_enable(void)
 {
 	barrier();
@@ -79,12 +99,16 @@ static __always_inline void arch_local_irq_disable(void)
 
 static __always_inline unsigned long __daif_local_save_flags(void)
 {
-	return read_sysreg(daif);
+	arm64_exc_hwstate_t hwstate = { .daif = read_sysreg(daif) };
+
+	return hwstate.flags;
 }
 
 static __always_inline unsigned long __pmr_local_save_flags(void)
 {
-	return read_sysreg_s(SYS_ICC_PMR_EL1);
+	arm64_exc_hwstate_t hwstate = { .pmr = read_sysreg_s(SYS_ICC_PMR_EL1) };
+
+	return hwstate.flags;
 }
 
 /*
@@ -101,12 +125,16 @@ static __always_inline unsigned long arch_local_save_flags(void)
 
 static __always_inline bool __daif_irqs_disabled_flags(unsigned long flags)
 {
-	return flags & PSR_I_BIT;
+	arm64_exc_hwstate_t hwstate = { .flags = flags };
+
+	return hwstate.daif & PSR_I_BIT;
 }
 
 static __always_inline bool __pmr_irqs_disabled_flags(unsigned long flags)
 {
-	return flags != GIC_PRIO_IRQON;
+	arm64_exc_hwstate_t hwstate = { .flags = flags };
+
+	return hwstate.pmr != GIC_PRIO_IRQON;
 }
 
 static __always_inline bool arch_irqs_disabled_flags(unsigned long flags)
@@ -171,15 +199,19 @@ static __always_inline unsigned long arch_local_irq_save(void)
 
 static __always_inline void __daif_local_irq_restore(unsigned long flags)
 {
+	arm64_exc_hwstate_t hwstate = { .flags = flags };
+
 	barrier();
-	write_sysreg(flags, daif);
+	write_sysreg(hwstate.daif, daif);
 	barrier();
 }
 
 static __always_inline void __pmr_local_irq_restore(unsigned long flags)
 {
+	arm64_exc_hwstate_t hwstate = { .flags = flags };
+
 	barrier();
-	write_sysreg_s(flags, SYS_ICC_PMR_EL1);
+	write_sysreg_s(hwstate.pmr, SYS_ICC_PMR_EL1);
 	pmr_sync();
 	barrier();
 }
-- 
2.34.1


