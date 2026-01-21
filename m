Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEAB2C44506
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 19:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WETBeITmnOiC4YX/w8Soud79cUBuh8C/cvUXIX70YK0=; b=YIqRVD+gVoMZPL8DW1ahDwaHAn
	QiRqlaaq9oL6kZOOmHOCEn7e9Wje5QcFd5ZkCdhvoyiFzE2U0mCfsag2N9kGW9NXwjvrpArCiSs8n
	fpfcf4y5mO29ADsi7YicnYKrwX7XHWtPEDHWyvhae6gBRXrWrIsiX442FJM2OWi3BJE7lufOXJi/Y
	Of8HLp+ZdlQ4vYTyn5WJc9r6hdpdRM5eJwTtvG2uvxJkgiPaW0I53N9Eke5gUSYZh0li0FZdDQ50V
	7nU4afteiQk9vP0lEuzqk+VEW9niaAhSWXWbK84RmKfyMhzNMAnJwXk+1D1W6UD57BfIsKNG+uyxb
	FKj19YTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vidXb-00000005xOn-0AdA;
	Wed, 21 Jan 2026 19:06:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vidXU-00000005xKd-3czC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 19:06:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B5033165C;
	Wed, 21 Jan 2026 11:06:41 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 04DE03F632;
	Wed, 21 Jan 2026 11:06:44 -0800 (PST)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	maz@kernel.org,
	broonie@kernel.org,
	oliver.upton@linux.dev,
	miko.lenczewski@arm.com,
	kevin.brodsky@arm.com,
	ardb@kernel.org,
	suzuki.poulose@arm.com,
	lpieralisi@kernel.org,
	scott@os.amperecomputing.com,
	joey.gouly@arm.com,
	yuzenghui@huawei.com,
	pbonzini@redhat.com,
	shuah@kernel.org,
	mark.rutland@arm.com,
	arnd@arndb.de,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v12 6/7] arm64: futex: support futex with FEAT_LSUI
Date: Wed, 21 Jan 2026 19:06:21 +0000
Message-Id: <20260121190622.2218669-7-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260121190622.2218669-1-yeoreum.yun@arm.com>
References: <20260121190622.2218669-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_110648_998530_F538B202 
X-CRM114-Status: GOOD (  18.47  )
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
one atomic operation supplied by FEAT_LSUI.

However, some of futex atomic operation don't have matched
instructuion i.e) eor or cmpxchg with word size.
For those operation, uses cas{al}t to implement them.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/arm64/include/asm/futex.h | 189 ++++++++++++++++++++++++++++++++-
 1 file changed, 187 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/futex.h b/arch/arm64/include/asm/futex.h
index 9a0efed50743..568583982875 100644
--- a/arch/arm64/include/asm/futex.h
+++ b/arch/arm64/include/asm/futex.h
@@ -9,6 +9,8 @@
 #include <linux/uaccess.h>
 #include <linux/stringify.h>
 
+#include <asm/alternative.h>
+#include <asm/alternative-macros.h>
 #include <asm/errno.h>
 
 #define FUTEX_MAX_LOOPS	128 /* What's the largest number you can think of? */
@@ -87,11 +89,194 @@ __llsc_futex_cmpxchg(u32 __user *uaddr, u32 oldval, u32 newval, u32 *oval)
 	return ret;
 }
 
+#ifdef CONFIG_ARM64_LSUI
+
+/*
+ * When the LSUI feature is present, the CPU also implements PAN, because
+ * FEAT_PAN has been mandatory since Armv8.1. Therefore, there is no need to
+ * call uaccess_ttbr0_enable()/uaccess_ttbr0_disable() around each LSUI
+ * operation.
+ */
+
+#define __LSUI_PREAMBLE	".arch_extension lsui\n"
+
+#define LSUI_FUTEX_ATOMIC_OP(op, asm_op)				\
+static __always_inline int						\
+__lsui_futex_atomic_##op(int oparg, u32 __user *uaddr, int *oval)	\
+{									\
+	int ret = 0;							\
+	int oldval;							\
+									\
+	asm volatile("// __lsui_futex_atomic_" #op "\n"			\
+	__LSUI_PREAMBLE							\
+"1:	" #asm_op "al	%w3, %w2, %1\n"					\
+"2:\n"									\
+	_ASM_EXTABLE_UACCESS_ERR(1b, 2b, %w0)				\
+	: "+r" (ret), "+Q" (*uaddr), "=r" (oldval)			\
+	: "r" (oparg)							\
+	: "memory");							\
+									\
+	if (!ret)							\
+		*oval = oldval;						\
+									\
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
+	asm volatile("// __lsui_cmpxchg64\n"
+	__LSUI_PREAMBLE
+"1:	casalt	%2, %3, %1\n"
+"2:\n"
+	_ASM_EXTABLE_UACCESS_ERR(1b, 2b, %w0)
+	: "+r" (ret), "+Q" (*uaddr), "+r" (*oldval)
+	: "r" (newval)
+	: "memory");
+
+	return ret;
+}
+
+static __always_inline int
+__lsui_cmpxchg32(u32 __user *uaddr, u32 oldval, u32 newval, u32 *oval)
+{
+	u64 __user *uaddr64;
+	bool futex_on_lo;
+	int ret, i;
+	u32 other, orig_other;
+	union {
+		struct futex_on_lo {
+			u32 val;
+			u32 other;
+		} lo_futex;
+
+		struct futex_on_hi {
+			u32 other;
+			u32 val;
+		} hi_futex;
+
+		u64 raw;
+	} oval64, orig64, nval64;
+
+	uaddr64 = (u64 __user *) PTR_ALIGN_DOWN(uaddr, sizeof(u64));
+	futex_on_lo = IS_ALIGNED((unsigned long)uaddr, sizeof(u64));
+
+	if (futex_on_lo) {
+		oval64.lo_futex.val = oldval;
+		ret = get_user(oval64.lo_futex.other, uaddr + 1);
+	} else {
+		oval64.hi_futex.val = oldval;
+		ret = get_user(oval64.hi_futex.other, uaddr - 1);
+	}
+
+	if (ret)
+		return -EFAULT;
+
+	ret = -EAGAIN;
+	for (i = 0; i < FUTEX_MAX_LOOPS; i++) {
+		orig64.raw = nval64.raw = oval64.raw;
+
+		if (futex_on_lo)
+			nval64.lo_futex.val = newval;
+		else
+			nval64.hi_futex.val = newval;
+
+		if (__lsui_cmpxchg64(uaddr64, &oval64.raw, nval64.raw))
+			return -EFAULT;
+
+		if (futex_on_lo) {
+			oldval = oval64.lo_futex.val;
+			other = oval64.lo_futex.other;
+			orig_other = orig64.lo_futex.other;
+		} else {
+			oldval = oval64.hi_futex.val;
+			other = oval64.hi_futex.other;
+			orig_other = orig64.hi_futex.other;
+		}
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
+
 #define FUTEX_ATOMIC_OP(op)						\
 static __always_inline int						\
 __futex_atomic_##op(int oparg, u32 __user *uaddr, int *oval)		\
 {									\
-	return __llsc_futex_atomic_##op(oparg, uaddr, oval);		\
+	return __lsui_llsc_body(futex_atomic_##op, oparg, uaddr, oval);	\
 }
 
 FUTEX_ATOMIC_OP(add)
@@ -103,7 +288,7 @@ FUTEX_ATOMIC_OP(set)
 static __always_inline int
 __futex_cmpxchg(u32 __user *uaddr, u32 oldval, u32 newval, u32 *oval)
 {
-	return __llsc_futex_cmpxchg(uaddr, oldval, newval, oval);
+	return __lsui_llsc_body(futex_cmpxchg, uaddr, oldval, newval, oval);
 }
 
 static inline int
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


