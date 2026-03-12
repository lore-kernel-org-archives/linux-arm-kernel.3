Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B3F106ACD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 17:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JdWAEcK1UQBtGED9leIkdvGlFsctWl+jWR6WvmFwJhY=; b=CdoTMreW47h2ohbldqEwf6nBMS
	Xep+CiRMeYDymPVRQTE5q+nP16RSEoRrZ9/4X2NvTEK8pFMuCtS8UtvrXu7KinCKodfGlBos05E8y
	qxwM8VtFmUvyZsM6bhfLPHg3WFoTfhBita5BH+5Pe13Q3OGiicf35jFf6YUezYWCSlsJWzqzCFQt9
	JgrNl8tDv6LG9yzt7dyEiiZ7Hzm0a81roCyJzyx79MkFmXqzTwX4utf1bn1Sp0i9fTS0NHtGIpGsy
	bhA1q6ehNoB8bXW0sO3m6AtUGY/wM74H8QBN8XpAg7RT2AbA7WS+ohdU3bVTqzLcV1eztUWzHZ7Yh
	nKCePvjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0kDZ-0000000Emuy-2j3m;
	Thu, 12 Mar 2026 17:53:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0kDU-0000000EmrE-2Wqn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 17:53:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02585165C;
	Thu, 12 Mar 2026 10:52:53 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A83E93F73B;
	Thu, 12 Mar 2026 10:52:56 -0700 (PDT)
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
Subject: [PATCH v16 4/8] arm64: futex: refactor futex atomic operation
Date: Thu, 12 Mar 2026 17:52:39 +0000
Message-Id: <20260312175243.1593864-5-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260312175243.1593864-1-yeoreum.yun@arm.com>
References: <20260312175243.1593864-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_105300_725259_83F0215A 
X-CRM114-Status: GOOD (  11.71  )
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

Refactor futex atomic operations using ll/sc method with
clearing PSTATE.PAN to prepare to apply FEAT_LSUI on them.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/arm64/include/asm/futex.h | 156 +++++++++++++++++++++------------
 1 file changed, 98 insertions(+), 58 deletions(-)

diff --git a/arch/arm64/include/asm/futex.h b/arch/arm64/include/asm/futex.h
index bc06691d2062..ba6a19de7823 100644
--- a/arch/arm64/include/asm/futex.h
+++ b/arch/arm64/include/asm/futex.h
@@ -7,73 +7,139 @@
 
 #include <linux/futex.h>
 #include <linux/uaccess.h>
+#include <linux/stringify.h>
 
 #include <asm/errno.h>
 
 #define FUTEX_MAX_LOOPS	128 /* What's the largest number you can think of? */
 
-#define __futex_atomic_op(insn, ret, oldval, uaddr, tmp, oparg)		\
-do {									\
+#define LLSC_FUTEX_ATOMIC_OP(op, insn)					\
+static __always_inline int						\
+__llsc_futex_atomic_##op(int oparg, u32 __user *uaddr, int *oval)	\
+{									\
 	unsigned int loops = FUTEX_MAX_LOOPS;				\
+	int ret, oldval, newval;					\
 									\
 	uaccess_enable_privileged();					\
-	asm volatile(							\
-"	prfm	pstl1strm, %2\n"					\
-"1:	ldxr	%w1, %2\n"						\
+	asm volatile("// __llsc_futex_atomic_" #op "\n"			\
+"	prfm	pstl1strm, %[uaddr]\n"					\
+"1:	ldxr	%w[oldval], %[uaddr]\n"					\
 	insn "\n"							\
-"2:	stlxr	%w0, %w3, %2\n"						\
-"	cbz	%w0, 3f\n"						\
-"	sub	%w4, %w4, %w0\n"					\
-"	cbnz	%w4, 1b\n"						\
-"	mov	%w0, %w6\n"						\
+"2:	stlxr	%w[ret], %w[newval], %[uaddr]\n"			\
+"	cbz	%w[ret], 3f\n"						\
+"	sub	%w[loops], %w[loops], %w[ret]\n"			\
+"	cbnz	%w[loops], 1b\n"					\
+"	mov	%w[ret], %w[err]\n"					\
 "3:\n"									\
 "	dmb	ish\n"							\
-	_ASM_EXTABLE_UACCESS_ERR(1b, 3b, %w0)				\
-	_ASM_EXTABLE_UACCESS_ERR(2b, 3b, %w0)				\
-	: "=&r" (ret), "=&r" (oldval), "+Q" (*uaddr), "=&r" (tmp),	\
-	  "+r" (loops)							\
-	: "r" (oparg), "Ir" (-EAGAIN)					\
+	_ASM_EXTABLE_UACCESS_ERR(1b, 3b, %w[ret])			\
+	_ASM_EXTABLE_UACCESS_ERR(2b, 3b, %w[ret])			\
+	: [ret] "=&r" (ret), [oldval] "=&r" (oldval),			\
+	  [uaddr] "+Q" (*uaddr), [newval] "=&r" (newval),		\
+	  [loops] "+r" (loops)						\
+	: [oparg] "r" (oparg), [err] "Ir" (-EAGAIN)			\
 	: "memory");							\
 	uaccess_disable_privileged();					\
-} while (0)
+									\
+	if (!ret)							\
+		*oval = oldval;						\
+									\
+	return ret;							\
+}
+
+LLSC_FUTEX_ATOMIC_OP(add, "add	%w[newval], %w[oldval], %w[oparg]")
+LLSC_FUTEX_ATOMIC_OP(or,  "orr	%w[newval], %w[oldval], %w[oparg]")
+LLSC_FUTEX_ATOMIC_OP(and, "and	%w[newval], %w[oldval], %w[oparg]")
+LLSC_FUTEX_ATOMIC_OP(eor, "eor	%w[newval], %w[oldval], %w[oparg]")
+LLSC_FUTEX_ATOMIC_OP(set, "mov	%w[newval], %w[oparg]")
+
+static __always_inline int
+__llsc_futex_cmpxchg(u32 __user *uaddr, u32 oldval, u32 newval, u32 *oval)
+{
+	int ret = 0;
+	unsigned int loops = FUTEX_MAX_LOOPS;
+	u32 val, tmp;
+
+	uaccess_enable_privileged();
+	asm volatile("//__llsc_futex_cmpxchg\n"
+"	prfm	pstl1strm, %[uaddr]\n"
+"1:	ldxr	%w[curval], %[uaddr]\n"
+"	eor	%w[tmp], %w[curval], %w[oldval]\n"
+"	cbnz	%w[tmp], 4f\n"
+"2:	stlxr	%w[tmp], %w[newval], %[uaddr]\n"
+"	cbz	%w[tmp], 3f\n"
+"	sub	%w[loops], %w[loops], %w[tmp]\n"
+"	cbnz	%w[loops], 1b\n"
+"	mov	%w[ret], %w[err]\n"
+"3:\n"
+"	dmb	ish\n"
+"4:\n"
+	_ASM_EXTABLE_UACCESS_ERR(1b, 4b, %w[ret])
+	_ASM_EXTABLE_UACCESS_ERR(2b, 4b, %w[ret])
+	: [ret] "+r" (ret), [curval] "=&r" (val),
+	  [uaddr] "+Q" (*uaddr), [tmp] "=&r" (tmp),
+	  [loops] "+r" (loops)
+	: [oldval] "r" (oldval), [newval] "r" (newval),
+	  [err] "Ir" (-EAGAIN)
+	: "memory");
+	uaccess_disable_privileged();
+
+	if (!ret)
+		*oval = val;
+
+	return ret;
+}
+
+#define FUTEX_ATOMIC_OP(op)						\
+static __always_inline int						\
+__futex_atomic_##op(int oparg, u32 __user *uaddr, int *oval)		\
+{									\
+	return __llsc_futex_atomic_##op(oparg, uaddr, oval);		\
+}
+
+FUTEX_ATOMIC_OP(add)
+FUTEX_ATOMIC_OP(or)
+FUTEX_ATOMIC_OP(and)
+FUTEX_ATOMIC_OP(eor)
+FUTEX_ATOMIC_OP(set)
+
+static __always_inline int
+__futex_cmpxchg(u32 __user *uaddr, u32 oldval, u32 newval, u32 *oval)
+{
+	return __llsc_futex_cmpxchg(uaddr, oldval, newval, oval);
+}
 
 static inline int
 arch_futex_atomic_op_inuser(int op, int oparg, int *oval, u32 __user *_uaddr)
 {
-	int oldval = 0, ret, tmp;
-	u32 __user *uaddr = __uaccess_mask_ptr(_uaddr);
+	int ret;
+	u32 __user *uaddr;
 
 	if (!access_ok(_uaddr, sizeof(u32)))
 		return -EFAULT;
 
+	uaddr = __uaccess_mask_ptr(_uaddr);
+
 	switch (op) {
 	case FUTEX_OP_SET:
-		__futex_atomic_op("mov	%w3, %w5",
-				  ret, oldval, uaddr, tmp, oparg);
+		ret = __futex_atomic_set(oparg, uaddr, oval);
 		break;
 	case FUTEX_OP_ADD:
-		__futex_atomic_op("add	%w3, %w1, %w5",
-				  ret, oldval, uaddr, tmp, oparg);
+		ret = __futex_atomic_add(oparg, uaddr, oval);
 		break;
 	case FUTEX_OP_OR:
-		__futex_atomic_op("orr	%w3, %w1, %w5",
-				  ret, oldval, uaddr, tmp, oparg);
+		ret = __futex_atomic_or(oparg, uaddr, oval);
 		break;
 	case FUTEX_OP_ANDN:
-		__futex_atomic_op("and	%w3, %w1, %w5",
-				  ret, oldval, uaddr, tmp, ~oparg);
+		ret = __futex_atomic_and(~oparg, uaddr, oval);
 		break;
 	case FUTEX_OP_XOR:
-		__futex_atomic_op("eor	%w3, %w1, %w5",
-				  ret, oldval, uaddr, tmp, oparg);
+		ret = __futex_atomic_eor(oparg, uaddr, oval);
 		break;
 	default:
 		ret = -ENOSYS;
 	}
 
-	if (!ret)
-		*oval = oldval;
-
 	return ret;
 }
 
@@ -81,40 +147,14 @@ static inline int
 futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *_uaddr,
 			      u32 oldval, u32 newval)
 {
-	int ret = 0;
-	unsigned int loops = FUTEX_MAX_LOOPS;
-	u32 val, tmp;
 	u32 __user *uaddr;
 
 	if (!access_ok(_uaddr, sizeof(u32)))
 		return -EFAULT;
 
 	uaddr = __uaccess_mask_ptr(_uaddr);
-	uaccess_enable_privileged();
-	asm volatile("// futex_atomic_cmpxchg_inatomic\n"
-"	prfm	pstl1strm, %2\n"
-"1:	ldxr	%w1, %2\n"
-"	sub	%w3, %w1, %w5\n"
-"	cbnz	%w3, 4f\n"
-"2:	stlxr	%w3, %w6, %2\n"
-"	cbz	%w3, 3f\n"
-"	sub	%w4, %w4, %w3\n"
-"	cbnz	%w4, 1b\n"
-"	mov	%w0, %w7\n"
-"3:\n"
-"	dmb	ish\n"
-"4:\n"
-	_ASM_EXTABLE_UACCESS_ERR(1b, 4b, %w0)
-	_ASM_EXTABLE_UACCESS_ERR(2b, 4b, %w0)
-	: "+r" (ret), "=&r" (val), "+Q" (*uaddr), "=&r" (tmp), "+r" (loops)
-	: "r" (oldval), "r" (newval), "Ir" (-EAGAIN)
-	: "memory");
-	uaccess_disable_privileged();
 
-	if (!ret)
-		*uval = val;
-
-	return ret;
+	return __futex_cmpxchg(uaddr, oldval, newval, uval);
 }
 
 #endif /* __ASM_FUTEX_H */
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


