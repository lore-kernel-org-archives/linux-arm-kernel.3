Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B94C54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 12:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4z41WccYINDbIriJ85nwclDWPazoIhKiQpL3gNJnGxg=; b=VRo630zNkORvRL
	FRPpn2IlVzzbVxBqoHOdZ1gRlGgoXtjXr+tqrghSboL5tjyxYOt/njpR43QHq7Y2pyuzwQOIbOg0X
	j9oTudGryGfd85d0TDq2kvk3dn61jy+ulPKXcT/Ndreaxwj/dGG+KU8dmobhKHdzYAXkBZd0KrZtO
	ZDXLpz5lP3JtO5vH1F/5DBtfZsqqe6IhDH/RoxHVWtbH6FGz1IWZAVZPqF3dpYXFkbpZC9P3GKeve
	9vXnc9MEZGsyaGHUhgSeDq7I4sPCRkDjEXmqF2TXdRWCrsjtVtDaWvsQbyjdeqpRoRlZIN5eNIO7k
	SSuakvcs2qjHLWk7/EbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woh6S-00000005Gbx-2SKj;
	Tue, 28 Jul 2026 12:40:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woh6G-00000005GUw-47tB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 12:40:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00F19175D;
	Tue, 28 Jul 2026 05:39:55 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3855E3F86F;
	Tue, 28 Jul 2026 05:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785242399; bh=IHUFBoAokD0Nbm46YkzuC3K9cyMIygGluKfTcn0IytE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A0bUZuNERQzYGd/I39SejLss76LEUQM3VrV3OQInZExPzEeWx1RaJ31EneO1hJ6nd
	 w142Dv5li7pToFLoC6jn+wMDW1oGzpxgG47PjcQW2LHXvHKp4lwhoGhw0Zf/WwehIE
	 fJWbjXvYqnt3TqU6AOZYWls981c3wnVVzqOnfkno=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 07/13] arm64: percpu: Implement preemptible read/write ops
Date: Tue, 28 Jul 2026 13:38:53 +0100
Message-Id: <20260728123859.2911495-8-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260728123859.2911495-1-mark.rutland@arm.com>
References: <20260728123859.2911495-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_054001_109616_53FCC1CF 
X-CRM114-Status: GOOD (  10.49  )
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
Cc: mark.rutland@arm.com, vladimir.murzin@arm.com, peterz@infradead.org, catalin.marinas@arm.com, hca@linux.ibm.com, linux-kernel@vger.kernel.org, ruanjinjie@huawei.com, yang@os.amperecomputing.com, maz@kernel.org, will@kernel.org, ardb@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Use the PCPU GPR infrastructure to implement preemptible this_cpu_read()
and this_cpu_write().

Note that this change means that this_cpu_read() will always use a plain
LDR, even in LTO configurations where READ_ONCE() will use LDA[P]R. I
am not sure whether that's ok, or whether we should similarly use
LDA[P]R here.

Generated code before this patch (v7.2-rc4):

| <outline_this_cpu_write_u64>:
|        paciasp
|        stp     x29, x30, [sp, #-16]!
|        mrs     x2, sp_el0
|        mov     x29, sp
|        ldr     w3, [x2, #8]
|        add     w3, w3, #0x1
|        str     w3, [x2, #8]
|        mrs     x3, tpidr_el1
|        str     x1, [x0, x3]
|        ldr     x0, [x2, #8]
|        sub     x0, x0, #0x1
|        str     w0, [x2, #8]
|        cbz     x0, 1f
|        ldr     x0, [x2, #8]
|        cbnz    x0, 2f
| 1:     bl      preempt_schedule_notrace
| 2:     ldp     x29, x30, [sp], #16
|        autiasp
|        ret

Generated code after this patch:

| <outline_this_cpu_write_u64>:
|        mrs     x2, sp_el0
|        mov     w3, #0x7c60
|        strh    w3, [x2, #20]
|        mrs     x3, tpidr_el1
|        str     x1, [x0, x3]
|        strh    wzr, [x2, #20]
|        ret

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Yang Shi <yang@os.amperecomputing.com>
---
 arch/arm64/include/asm/percpu.h | 79 ++++++++++++++++++++++++---------
 1 file changed, 58 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
index 0871dcc41d759..32623ea676b96 100644
--- a/arch/arm64/include/asm/percpu.h
+++ b/arch/arm64/include/asm/percpu.h
@@ -100,15 +100,42 @@ static inline unsigned long __kern_my_cpu_offset(void)
 #define __my_cpu_offset __kern_my_cpu_offset()
 #endif
 
-#define PERCPU_RW_OPS(sz)						\
-static inline unsigned long __percpu_read_##sz(void *ptr)		\
-{									\
-	return READ_ONCE(*(u##sz *)ptr);				\
-}									\
-									\
-static inline void __percpu_write_##sz(void *ptr, unsigned long val)	\
-{									\
-	WRITE_ONCE(*(u##sz *)ptr, (u##sz)val);				\
+#define PERCPU_RW_OPS(w, sfx, sz)						\
+static inline unsigned long __percpu_read_##sz(void __percpu *pcp)		\
+{										\
+	u16 *gprs = &current_thread_info()->pcpu_gprs;				\
+	unsigned long off;							\
+	unsigned long val;							\
+										\
+	asm volatile(								\
+	__PCPU_GPRS_BEGIN_OFFSET("%[gprs]", "%[pcp]", "%[off]")			\
+	"	ldr" #sfx "\t%" #w "[val], [%[pcp], %[off]]\n"			\
+	__PCPU_GPRS_END("%[gprs]")						\
+	: [gprs] "=Qo" (*gprs),							\
+	  [off] "=&r" (off),							\
+	  [val] "=&r" (val)							\
+	: [pcp] "r" (pcp)							\
+	: "memory"								\
+	);									\
+										\
+	return val;								\
+}										\
+										\
+static inline void __percpu_write_##sz(void __percpu *pcp, unsigned long val)	\
+{										\
+	u16 *gprs = &current_thread_info()->pcpu_gprs;				\
+	unsigned long off;							\
+										\
+	asm volatile(								\
+	__PCPU_GPRS_BEGIN_OFFSET("%[gprs]", "%[pcp]", "%[off]")			\
+	"	str" #sfx "\t%" #w "[val], [%[pcp], %[off]]\n"			\
+	__PCPU_GPRS_END("%[gprs]")						\
+	: [gprs] "=Qo" (*gprs),							\
+	  [off] "=&r" (off)							\
+	: [pcp] "r" (pcp),							\
+	  [val] "r" (val)							\
+	: "memory"								\
+	);									\
 }
 
 #define __PERCPU_OP_CASE(w, sfx, name, sz, op_llsc, op_lse)		\
@@ -168,10 +195,10 @@ __percpu_##name##_return_case_##sz(void *ptr, unsigned long val)	\
 	__PERCPU_RET_OP_CASE(w,  , name, 32, op_llsc, op_lse)		\
 	__PERCPU_RET_OP_CASE( ,  , name, 64, op_llsc, op_lse)
 
-PERCPU_RW_OPS(8)
-PERCPU_RW_OPS(16)
-PERCPU_RW_OPS(32)
-PERCPU_RW_OPS(64)
+PERCPU_RW_OPS(w, b, 8)
+PERCPU_RW_OPS(w, h, 16)
+PERCPU_RW_OPS(w,  , 32)
+PERCPU_RW_OPS( ,  , 64)
 
 /*
  * Use value-returning atomics for CPU-local ops as they are more likely
@@ -217,23 +244,33 @@ PERCPU_RET_OP(add, add, ldadd)
 	__retval;							\
 })
 
+#define _pcp_wrap(op, pcp, ...)						\
+({									\
+	op(&(pcp), __VA_ARGS__);					\
+})
+
+#define _pcp_wrap_return(op, pcp, args...)				\
+({									\
+	(typeof(pcp))op(&(pcp), ##args);				\
+})
+
 #define this_cpu_read_1(pcp)		\
-	_pcp_protect_return(__percpu_read_8, pcp)
+	_pcp_wrap_return(__percpu_read_8, pcp)
 #define this_cpu_read_2(pcp)		\
-	_pcp_protect_return(__percpu_read_16, pcp)
+	_pcp_wrap_return(__percpu_read_16, pcp)
 #define this_cpu_read_4(pcp)		\
-	_pcp_protect_return(__percpu_read_32, pcp)
+	_pcp_wrap_return(__percpu_read_32, pcp)
 #define this_cpu_read_8(pcp)		\
-	_pcp_protect_return(__percpu_read_64, pcp)
+	_pcp_wrap_return(__percpu_read_64, pcp)
 
 #define this_cpu_write_1(pcp, val)	\
-	_pcp_protect(__percpu_write_8, pcp, (unsigned long)val)
+	_pcp_wrap(__percpu_write_8, pcp, (unsigned long)val)
 #define this_cpu_write_2(pcp, val)	\
-	_pcp_protect(__percpu_write_16, pcp, (unsigned long)val)
+	_pcp_wrap(__percpu_write_16, pcp, (unsigned long)val)
 #define this_cpu_write_4(pcp, val)	\
-	_pcp_protect(__percpu_write_32, pcp, (unsigned long)val)
+	_pcp_wrap(__percpu_write_32, pcp, (unsigned long)val)
 #define this_cpu_write_8(pcp, val)	\
-	_pcp_protect(__percpu_write_64, pcp, (unsigned long)val)
+	_pcp_wrap(__percpu_write_64, pcp, (unsigned long)val)
 
 #define this_cpu_add_1(pcp, val)	\
 	_pcp_protect(__percpu_add_case_8, pcp, val)
-- 
2.30.2


