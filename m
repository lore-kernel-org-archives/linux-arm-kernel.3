Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F41106ACD6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 17:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=osI+M8vtA5Itvv1gkj2+8UtRnmj/iYMW3ALQJ3t5Hrk=; b=kpxbtqBXmHfwWqoMkQV60ydh0c
	m+87hlv74Yc0vNXMvBjzoLdr+Jmbb3HMRKj4Fr5PdGD8mClXUTwDsQ1w/+vYZGH1zea9ogUGNeT00
	fLlNADaEO/VOwiFFH8H3tURZ82dWYmk7+xBx/ome03ULwFmy/RhlaOz4Bh/u483BEVCr9IlcSfZ1A
	8b/oB2HiHTJUqlB+9KuaqkY0UmsZE8MUoSDLgKFKpKmD4X4VaYIOani+tSiDjGNmf3BrRDd78UiSP
	AaKQWKjbTpKBeMJ1dIIaUpAhPLxAgsC42nRgVcsn1JFnzp0JgsOmFFmF9FjCIz0Rs62ZqtZmwRxp0
	uoYvyWZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0kDZ-0000000EmvN-3yy3;
	Thu, 12 Mar 2026 17:53:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0kDX-0000000EmtQ-3ITC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 17:53:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C68EB1A9A;
	Thu, 12 Mar 2026 10:52:55 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 746553F73B;
	Thu, 12 Mar 2026 10:52:59 -0700 (PDT)
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
Subject: [PATCH v16 5/8] arm64: futex: support futex with FEAT_LSUI
Date: Thu, 12 Mar 2026 17:52:40 +0000
Message-Id: <20260312175243.1593864-6-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260312175243.1593864-1-yeoreum.yun@arm.com>
References: <20260312175243.1593864-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_105303_926126_E6883E9D 
X-CRM114-Status: GOOD (  20.67  )
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

Current futex atomic operations are implemented with ll/sc instructions
and clearing PSTATE.PAN.

Since Armv9.6, FEAT_LSUI supplies not only load/store instructions but
also atomic operation for user memory access in kernel it doesn't need
to clear PSTATE.PAN bit anymore.

With theses instructions some of futex atomic operations don't need to
be implmented with ldxr/stlxr pair instead can be implmented with
one atomic operation supplied by FEAT_LSUI and don't enable mto like
ldtr*/sttr* instructions usage.

However, some of futex atomic operation don't have matched
instructuion i.e) eor or cmpxchg with word size.
For those operation, uses cas{al}t to implement them.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/arm64/include/asm/futex.h | 168 ++++++++++++++++++++++++++++++++-
 arch/arm64/include/asm/lsui.h  |  27 ++++++
 2 files changed, 192 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/include/asm/lsui.h

diff --git a/arch/arm64/include/asm/futex.h b/arch/arm64/include/asm/futex.h
index ba6a19de7823..20ee0b9b2546 100644
--- a/arch/arm64/include/asm/futex.h
+++ b/arch/arm64/include/asm/futex.h
@@ -7,9 +7,9 @@
 
 #include <linux/futex.h>
 #include <linux/uaccess.h>
-#include <linux/stringify.h>
 
 #include <asm/errno.h>
+#include <asm/lsui.h>
 
 #define FUTEX_MAX_LOOPS	128 /* What's the largest number you can think of? */
 
@@ -90,11 +90,173 @@ __llsc_futex_cmpxchg(u32 __user *uaddr, u32 oldval, u32 newval, u32 *oval)
 	return ret;
 }
 
+#ifdef CONFIG_ARM64_LSUI
+
+/*
+ * FEAT_LSUI is supported since Armv9.6, where FEAT_PAN is mandatory.
+ * However, this assumption may not always hold:
+ *
+ *   - Some CPUs advertise FEAT_LSUI but lack FEAT_PAN.
+ *   - Virtualisation or ID register overrides may expose invalid
+ *     feature combinations.
+ *
+ * Rather than disabling FEAT_LSUI when FEAT_PAN is absent, wrap LSUI
+ * instructions with uaccess_ttbr0_enable()/disable() when
+ * ARM64_SW_TTBR0_PAN is enabled.
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
+	int ret, i;
+	u32 other, orig_other;
+	union {
+		u32 futex[2];
+		u64 raw;
+	} oval64, orig64, nval64;
+
+	uaddr64 = (u64 __user *) PTR_ALIGN_DOWN(uaddr, sizeof(u64));
+	futex_pos = !IS_ALIGNED((unsigned long)uaddr, sizeof(u64));
+	other_pos = !futex_pos;
+
+	oval64.futex[futex_pos] = oldval;
+	ret = get_user(oval64.futex[other_pos], (u32 __user *)uaddr64 + other_pos);
+	if (ret)
+		return -EFAULT;
+
+	ret = -EAGAIN;
+	for (i = 0; i < FUTEX_MAX_LOOPS; i++) {
+		orig64.raw = nval64.raw = oval64.raw;
+
+		nval64.futex[futex_pos] = newval;
+
+		if (__lsui_cmpxchg64(uaddr64, &oval64.raw, nval64.raw))
+			return -EFAULT;
+
+		oldval = oval64.futex[futex_pos];
+		other = oval64.futex[other_pos];
+		orig_other = orig64.futex[other_pos];
+
+		if (other == orig_other) {
+			ret = 0;
+			break;
+		}
+	}
+
+	if (!ret)
+		*oval = oldval;
+
+	return ret;
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
+		if (ret)
+			return ret;
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
@@ -106,7 +268,7 @@ FUTEX_ATOMIC_OP(set)
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


