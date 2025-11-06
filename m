Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7043CCFA19
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 09:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lnNPahU5KnxIaDC4PkoyKT7Rmo8UOHhtk+KmpOJbv1U=; b=v7uaJl+uzdZ6M7tZM3JH9v+zFp
	OsqooAbaIbpnegDd8aqQmlkJQ8IBDPxumPn3t43CKAz7crIe73odZ/uMWjTW2mG4oNxrAx7ajD6dc
	tWugo79zR1vkWneh6vhkM6mwr+yaLJl2b5ROuXaorhB1LAME90pCfgH+8dB6XMMCKkOPZsogDrXRW
	6gVHTMMvfg39Q4neiV0zwjT3xyn268TPlsALA7g5OekS8y6k6tvIZUtlvej5GGipBGy5hgRxI/QqE
	BqydQRLA4cffEGV9wsjZPod4kccfMKaY4NsAo4Jy7rmr5QuUNCMFVzQaRNygggPA6WoWHRVTU1yRu
	ear6GO6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwU8-0000000FASn-3e7m;
	Thu, 06 Nov 2025 09:40:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwU6-0000000FAR7-32GG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 09:40:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E7901596;
	Thu,  6 Nov 2025 01:40:42 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2466D3F63F;
	Thu,  6 Nov 2025 01:40:47 -0800 (PST)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	maz@kernel.org,
	broonie@kernel.org,
	oliver.upton@linux.dev,
	miko.lenczewski@arm.com,
	kevin.brodsky@arm.com,
	ardb@kernel.org,
	suzuki.poulose@arm.com,
	lpieralisi@kernel.org,
	yangyicong@hisilicon.com,
	scott@os.amperecomputing.com,
	joey.gouly@arm.com,
	yuzenghui@huawei.com,
	pbonzini@redhat.com,
	shuah@kernel.org,
	mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v11 6/9] arm64: futex: support futex with FEAT_LSUI
Date: Thu,  6 Nov 2025 09:40:20 +0000
Message-Id: <20251106094023.1371246-7-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251106094023.1371246-1-yeoreum.yun@arm.com>
References: <20251106094023.1371246-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_014050_849735_6F643300 
X-CRM114-Status: GOOD (  17.94  )
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
 arch/arm64/include/asm/futex.h | 180 ++++++++++++++++++++++++++++++++-
 1 file changed, 178 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/futex.h b/arch/arm64/include/asm/futex.h
index f8cb674bdb3f..6778ff7e1c0e 100644
--- a/arch/arm64/include/asm/futex.h
+++ b/arch/arm64/include/asm/futex.h
@@ -9,6 +9,8 @@
 #include <linux/uaccess.h>
 #include <linux/stringify.h>
 
+#include <asm/alternative.h>
+#include <asm/alternative-macros.h>
 #include <asm/errno.h>
 
 #define FUTEX_MAX_LOOPS	128 /* What's the largest number you can think of? */
@@ -86,11 +88,185 @@ __llsc_futex_cmpxchg(u32 __user *uaddr, u32 oldval, u32 newval, u32 *oval)
 	return ret;
 }
 
+#ifdef CONFIG_AS_HAS_LSUI
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
+#define LSUI_FUTEX_ATOMIC_OP(op, asm_op, mb)				\
+static __always_inline int						\
+__lsui_futex_atomic_##op(int oparg, u32 __user *uaddr, int *oval)	\
+{									\
+	int ret = 0;							\
+	int oldval;							\
+									\
+	asm volatile("// __lsui_futex_atomic_" #op "\n"			\
+	__LSUI_PREAMBLE							\
+"1:	" #asm_op #mb "	%w3, %w2, %1\n"					\
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
+LSUI_FUTEX_ATOMIC_OP(add, ldtadd, al)
+LSUI_FUTEX_ATOMIC_OP(or, ldtset, al)
+LSUI_FUTEX_ATOMIC_OP(andnot, ldtclr, al)
+LSUI_FUTEX_ATOMIC_OP(set, swpt, al)
+
+static __always_inline int
+__lsui_cmpxchg64(u64 __user *uaddr, u64 *oldval, u64 newval)
+{
+	int ret = 0;
+
+	asm volatile("// __lsui_cmpxchg64\n"
+	__LSUI_PREAMBLE
+"1:	casalt	%x2, %x3, %1\n"
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
+	int ret = -EAGAIN, i;
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
+	futex_on_lo = (IS_ALIGNED((unsigned long)uaddr, sizeof(u64)) ==
+			IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN));
+
+	for (i = 0; i < FUTEX_MAX_LOOPS; i++) {
+		if (get_user(oval64.raw, uaddr64))
+			return -EFAULT;
+
+		nval64.raw = oval64.raw;
+
+		if (futex_on_lo) {
+			oval64.lo_futex.val = oldval;
+			nval64.lo_futex.val = newval;
+		} else {
+			oval64.hi_futex.val = oldval;
+			nval64.hi_futex.val = newval;
+		}
+
+		orig64.raw = oval64.raw;
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
+	return __lsui_futex_atomic_andnot(~oparg, uaddr, oval);
+}
+
+static __always_inline int
+__lsui_futex_atomic_eor(int oparg, u32 __user *uaddr, int *oval)
+{
+	u32 oldval, newval, val;
+	int ret, i;
+
+	/*
+	 * there are no ldteor/stteor instructions...
+	 */
+	for (i = 0; i < FUTEX_MAX_LOOPS; i++) {
+		if (get_user(oldval, uaddr))
+			return -EFAULT;
+
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
+	alternative_has_cap_likely(ARM64_HAS_LSUI) ?			\
+		__lsui_##op(__VA_ARGS__) : __llsc_##op(__VA_ARGS__);	\
+})
+
+#else	/* CONFIG_AS_HAS_LSUI */
+
+#define __lsui_llsc_body(op, ...)	__llsc_##op(__VA_ARGS__)
+
+#endif	/* CONFIG_AS_HAS_LSUI */
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
@@ -102,7 +278,7 @@ FUTEX_ATOMIC_OP(set)
 static __always_inline int
 __futex_cmpxchg(u32 __user *uaddr, u32 oldval, u32 newval, u32 *oval)
 {
-	return __llsc_futex_cmpxchg(uaddr, oldval, newval, oval);
+	return __lsui_llsc_body(futex_cmpxchg, uaddr, oldval, newval, oval);
 }
 
 static inline int
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


