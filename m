Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B3510706EE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 17:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JJPSxQfilQ+or5ekIKNTsm+fjxpsoIRloR2hyiKGgwk=; b=fQqPmiwpMrtGg2mh15TiAcHhkn
	ru1dNnGpQEfJ+F0qFbYp+Z1VFQSeMuoGRbYXMA9jziIumeyUOnyIZlAyCMeqryyp9HXLZ3jYtoOX3
	pjSeOmb8aiB5gnLu9cdgmMGM6IneERrZrqylrIk119r/MWmidDuIs5aDtaJId7jQkHP3s7IwHbf8X
	xPDF3iGMT6t9WOCPnzVDZ4zDl6Uv73p2uGGqXLL3PK1jBGy3kiSZc94n1deEGRrqnZQJmhTKVTRT0
	sE/z+/gH9cq+U72oifGnbQFmai+0dT3Z1ymAI90r8doinUmByggg9Fa8sccCHDua67LlrgAO23XXh
	fj/ZDDmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1T9b-000000022b5-1LXA;
	Sat, 14 Mar 2026 17:51:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1T9U-000000022Xe-36Rf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 17:51:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B8FD153B;
	Sat, 14 Mar 2026 10:51:45 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 271AC3F73B;
	Sat, 14 Mar 2026 10:51:49 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	maz@kernel.org,
	oupton@kernel.org,
	miko.lenczewski@arm.com,
	kevin.brodsky@arm.com,
	broonie@kernel.org,
	ardb@kernel.org,
	suzuki.poulose@arm.com,
	lpieralisi@kernel.org,
	joey.gouly@arm.com,
	yuzenghui@huawei.com,
	yeoreum.yun@arm.com
Subject: [PATCH v17 5/8] arm64: futex: support futex with FEAT_LSUI
Date: Sat, 14 Mar 2026 17:51:30 +0000
Message-Id: <20260314175133.1084528-6-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260314175133.1084528-1-yeoreum.yun@arm.com>
References: <20260314175133.1084528-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_105152_866420_2FEE955C 
X-CRM114-Status: GOOD (  19.94  )
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

Current futex atomic operations are implemented using LL/SC instructions
while temporarily clearing PSTATE.PAN.

Since Armv9.6, FEAT_LSUI provides load/store instructions for user memory
access in the kernel as well as atomic operations, removing the need to
clear PSTATE.PAN.

With these instructions, some futex atomic operations no longer need to
be implemented using an ldxr/stlxr pair. Instead, they can be performed
using a single atomic instruction provided by FEAT_LSUI, without enabling
MTE as required when using ldtr*/sttr* instructions.

However, some futex atomic operations do not have a matching LSUI
instruction, for example eor or word-sized cmpxchg. For such cases,
use cas{al}t to implement the operation.

FEAT_LSUI is introduced in Armv9.6, where FEAT_PAN is mandatory. However,
this assumption may not always hold:

 - Some CPUs may advertise FEAT_LSUI but lack FEAT_PAN.
 - Virtualization or ID register overrides may expose invalid feature
   combinations.

Therefore, instead of disabling FEAT_LSUI when FEAT_PAN is absent, wrap
LSUI instructions with uaccess_ttbr0_enable()/disable() when
ARM64_SW_TTBR0_PAN is enabled.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/arm64/include/asm/futex.h | 157 ++++++++++++++++++++++++++++++++-
 arch/arm64/include/asm/lsui.h  |  27 ++++++
 2 files changed, 181 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/include/asm/lsui.h

diff --git a/arch/arm64/include/asm/futex.h b/arch/arm64/include/asm/futex.h
index ba6a19de7823..f2203a5e231c 100644
--- a/arch/arm64/include/asm/futex.h
+++ b/arch/arm64/include/asm/futex.h
@@ -7,9 +7,9 @@
 
 #include <linux/futex.h>
 #include <linux/uaccess.h>
-#include <linux/stringify.h>
 
 #include <asm/errno.h>
+#include <asm/lsui.h>
 
 #define FUTEX_MAX_LOOPS	128 /* What's the largest number you can think of? */
 
@@ -90,11 +90,162 @@ __llsc_futex_cmpxchg(u32 __user *uaddr, u32 oldval, u32 newval, u32 *oval)
 	return ret;
 }
 
+#ifdef CONFIG_ARM64_LSUI
+
+/*
+ * Wrap LSUI instructions with uaccess_ttbr0_enable()/disable(), as
+ * PAN toggling is not required.
+ */
+
+#define LSUI_FUTEX_ATOMIC_OP(op, asm_op)				\
+static __always_inline int						\
+__lsui_futex_atomic_##op(int oparg, u32 __user *uaddr, int *oval)	\
+{									\
+	int ret = 0;							\
+	int oldval;							\
+									\
+	uaccess_ttbr0_enable();						\
+									\
+	asm volatile("// __lsui_futex_atomic_" #op "\n"			\
+	__LSUI_PREAMBLE							\
+"1:	" #asm_op "al	%w[oparg], %w[oldval], %[uaddr]\n"		\
+"2:\n"									\
+	_ASM_EXTABLE_UACCESS_ERR(1b, 2b, %w[ret])			\
+	: [ret] "+r" (ret), [uaddr] "+Q" (*uaddr),			\
+	  [oldval] "=r" (oldval)					\
+	: [oparg] "r" (oparg)						\
+	: "memory");							\
+									\
+	uaccess_ttbr0_disable();					\
+									\
+	if (!ret)							\
+		*oval = oldval;						\
+	return ret;							\
+}
+
+LSUI_FUTEX_ATOMIC_OP(add, ldtadd)
+LSUI_FUTEX_ATOMIC_OP(or, ldtset)
+LSUI_FUTEX_ATOMIC_OP(andnot, ldtclr)
+LSUI_FUTEX_ATOMIC_OP(set, swpt)
+
+static __always_inline int
+__lsui_cmpxchg64(u64 __user *uaddr, u64 *oldval, u64 newval)
+{
+	int ret = 0;
+
+	uaccess_ttbr0_enable();
+
+	asm volatile("// __lsui_cmpxchg64\n"
+	__LSUI_PREAMBLE
+"1:	casalt	%[oldval], %[newval], %[uaddr]\n"
+"2:\n"
+	_ASM_EXTABLE_UACCESS_ERR(1b, 2b, %w[ret])
+	: [ret] "+r" (ret), [uaddr] "+Q" (*uaddr),
+	  [oldval] "+r" (*oldval)
+	: [newval] "r" (newval)
+	: "memory");
+
+	uaccess_ttbr0_disable();
+
+	return ret;
+}
+
+static __always_inline int
+__lsui_cmpxchg32(u32 __user *uaddr, u32 oldval, u32 newval, u32 *oval)
+{
+	u64 __user *uaddr64;
+	bool futex_pos, other_pos;
+	u32 other, orig_other;
+	union {
+		u32 futex[2];
+		u64 raw;
+	} oval64, orig64, nval64;
+
+	uaddr64 = (u64 __user *)PTR_ALIGN_DOWN(uaddr, sizeof(u64));
+	futex_pos = !IS_ALIGNED((unsigned long)uaddr, sizeof(u64));
+	other_pos = !futex_pos;
+
+	oval64.futex[futex_pos] = oldval;
+	if (get_user(oval64.futex[other_pos], (u32 __user *)uaddr64 + other_pos))
+		return -EFAULT;
+
+	orig64.raw = oval64.raw;
+
+	nval64.futex[futex_pos] = newval;
+	nval64.futex[other_pos] = oval64.futex[other_pos];
+
+	if (__lsui_cmpxchg64(uaddr64, &oval64.raw, nval64.raw))
+		return -EFAULT;
+
+	oldval = oval64.futex[futex_pos];
+	other = oval64.futex[other_pos];
+	orig_other = orig64.futex[other_pos];
+
+	if (other != orig_other)
+		return -EAGAIN;
+
+	*oval = oldval;
+
+	return 0;
+}
+
+static __always_inline int
+__lsui_futex_atomic_and(int oparg, u32 __user *uaddr, int *oval)
+{
+	/*
+	 * Undo the bitwise negation applied to the oparg passed from
+	 * arch_futex_atomic_op_inuser() with FUTEX_OP_ANDN.
+	 */
+	return __lsui_futex_atomic_andnot(~oparg, uaddr, oval);
+}
+
+static __always_inline int
+__lsui_futex_atomic_eor(int oparg, u32 __user *uaddr, int *oval)
+{
+	u32 oldval, newval, val;
+	int ret, i;
+
+	if (get_user(oldval, uaddr))
+		return -EFAULT;
+
+	/*
+	 * there are no ldteor/stteor instructions...
+	 */
+	for (i = 0; i < FUTEX_MAX_LOOPS; i++) {
+		newval = oldval ^ oparg;
+
+		ret = __lsui_cmpxchg32(uaddr, oldval, newval, &val);
+		switch (ret) {
+		case -EFAULT:
+			return ret;
+		case -EAGAIN:
+			continue;
+		}
+
+		if (val == oldval) {
+			*oval = val;
+			return 0;
+		}
+
+		oldval = val;
+	}
+
+	return -EAGAIN;
+}
+
+static __always_inline int
+__lsui_futex_cmpxchg(u32 __user *uaddr, u32 oldval, u32 newval, u32 *oval)
+{
+	return __lsui_cmpxchg32(uaddr, oldval, newval, oval);
+}
+#endif	/* CONFIG_ARM64_LSUI */
+
+
 #define FUTEX_ATOMIC_OP(op)						\
 static __always_inline int						\
 __futex_atomic_##op(int oparg, u32 __user *uaddr, int *oval)		\
 {									\
-	return __llsc_futex_atomic_##op(oparg, uaddr, oval);		\
+	return __lsui_llsc_body(futex_atomic_##op, oparg, uaddr, oval);	\
 }
 
 FUTEX_ATOMIC_OP(add)
@@ -106,7 +257,7 @@ FUTEX_ATOMIC_OP(set)
 static __always_inline int
 __futex_cmpxchg(u32 __user *uaddr, u32 oldval, u32 newval, u32 *oval)
 {
-	return __llsc_futex_cmpxchg(uaddr, oldval, newval, oval);
+	return __lsui_llsc_body(futex_cmpxchg, uaddr, oldval, newval, oval);
 }
 
 static inline int
diff --git a/arch/arm64/include/asm/lsui.h b/arch/arm64/include/asm/lsui.h
new file mode 100644
index 000000000000..8f0d81953eb6
--- /dev/null
+++ b/arch/arm64/include/asm/lsui.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_LSUI_H
+#define __ASM_LSUI_H
+
+#include <linux/compiler_types.h>
+#include <linux/stringify.h>
+#include <asm/alternative.h>
+#include <asm/alternative-macros.h>
+#include <asm/cpucaps.h>
+
+#define __LSUI_PREAMBLE	".arch_extension lsui\n"
+
+#ifdef CONFIG_ARM64_LSUI
+
+#define __lsui_llsc_body(op, ...)					\
+({									\
+	alternative_has_cap_unlikely(ARM64_HAS_LSUI) ?			\
+		__lsui_##op(__VA_ARGS__) : __llsc_##op(__VA_ARGS__);	\
+})
+
+#else	/* CONFIG_ARM64_LSUI */
+
+#define __lsui_llsc_body(op, ...)	__llsc_##op(__VA_ARGS__)
+
+#endif	/* CONFIG_ARM64_LSUI */
+
+#endif	/* __ASM_LSUI_H */
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


