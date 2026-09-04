Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9DCC79F88
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 16:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mfA96QnsoMvO3D+7TnORaPK/QYsXoeS35a8EU15nbzM=; b=CmgrM/5UKJOcNF
	2dFXG8P9NOkg/nWcMtbeuHqL9hFcjZbosdT1ifHIxZRAsCJJAKMro04WqXX03HCQhJpHg74bOaKza
	7F9MrgnfBovWRm5zavgvSgx3GOphl+fvsHMy2EAFOIdZ6InIQ6vMVnDDLl/ULFv81tKNSMDGF/cis
	EQAy7KWJCCmSEY6x/ERP9HbV9d9YXY98cepN2VuD53pbHf/1BQOU3IKNvlqQJ6mNBOYbosqiWDxjC
	q5MIBKmv01Mug4Djc/Pi3eBQcy5nKgkhy29PCajktAqUpGYNMgW3mE0o5xOBCjoaC1QXU7al5cE08
	RRQjO+kjeC2GdS7KtXeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WdF-00000002hRT-1LNY;
	Fri, 04 Sep 2026 16:19:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WdA-00000002hJx-2L29
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 16:19:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69982153B;
	Fri,  4 Sep 2026 09:19:04 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 269AA3F673;
	Fri,  4 Sep 2026 09:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788538748; bh=378UApzYUdHc7nA0s8Xze++4Y0fwfNuwVF3XfZVIDeQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LhqU8W5aoVokpvYJe7OeaPMHPdzou1BtISMYP12A0cTX6tnFSLn02vl0H5bU274uw
	 PksLO7TEg6ekQapY2IQROPgNp5DUzsgwB9OEtjlK/EviN9+jtoxH3ksWXCpt06KO32
	 NUa+i4cvDL1wSlMwtVx57k+cpm19irHzJiKG+3AU=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 17/21] arm64: percpu: Implement preemptible return RMW ops
Date: Fri,  4 Sep 2026 17:17:54 +0100
Message-Id: <20260904161758.376504-18-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260904161758.376504-1-mark.rutland@arm.com>
References: <20260904161758.376504-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_091908_692329_0F095C95 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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
Cc: mark.rutland@arm.com, vladimir.murzin@arm.com, usama.anjum@arm.com, peterz@infradead.org, catalin.marinas@arm.com, david.laight.linux@gmail.com, stable@vger.kernel.org, ruanjinjie@huawei.com, james.morse@arm.com, yang@os.amperecomputing.com, cl@gentwo.org, maz@kernel.org, will@kernel.org, ardb@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Use the PCPU GPR infrastructure to implement all of the RMW ops which
return a value.

Test case:

| u64 outline_this_cpu_add_return_u64(u64 __percpu *p, u64 v)
| {
| 	return this_cpu_add_return(*p, v);
| }

Generated code before this patch (v7.2-rc4):

| <outline_this_cpu_add_return_u64>:
|        paciasp
|        stp     x29, x30, [sp, #-32]!
|        mrs     x3, sp_el0
|        mov     x29, sp
|        ldr     w2, [x3, #8]
|        add     w2, w2, #0x1
|        str     w2, [x3, #8]
|        mov     x2, x0
|        mrs     x4, tpidr_el1
|        add     x2, x2, x4
| 1:     ldxr    x0, [x2]
|        add     x0, x0, x1
|        stxr    w5, x0, [x2]
|        cbnz    w5, 1b
|        ldr     x1, [x3, #8]
|        sub     x1, x1, #0x1
|        str     w1, [x3, #8]
|        cbz     x1, 2f
|        ldr     x1, [x3, #8]
|        cbnz    x1, 3f
| 2:     str     x0, [sp, #24]
|        bl      0 <preempt_schedule_notrace>
|        ldr     x0, [sp, #24]
| 3:     ldp     x29, x30, [sp], #32
|        autiasp
|        ret

Generated code after this patch:

| <outline_this_cpu_add_return_u64>:
|        mrs     x3, sp_el0
|        mov     w5, #0x10a0
|        strh    w5, [x3, #20]
|        mrs     x5, tpidr_el1
|        add     x4, x0, x5
| 1:     ldxr    x2, [x4]
|        add     x2, x2, x1
|        stxr    w6, x2, [x4]
|        cbnz    w6, 1b
|        strh    wzr, [x3, #20]
|        mov     x0, x2
|        ret

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: James Morse <james.morse@arm.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Yang Shi <yang@os.amperecomputing.com>
---
 arch/arm64/include/asm/percpu.h | 36 ++++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
index 504a7fefa2015..9fe44d04c871b 100644
--- a/arch/arm64/include/asm/percpu.h
+++ b/arch/arm64/include/asm/percpu.h
@@ -201,24 +201,36 @@ __percpu_##name##_case_##sz(void __percpu *pcp, unsigned long val)	\
 
 #define __PERCPU_RET_OP_CASE(w, sfx, name, sz, op_llsc, op_lse)		\
 static inline u##sz							\
-__percpu_##name##_return_case_##sz(void *ptr, unsigned long val)	\
+__percpu_##name##_return_case_##sz(void __percpu *pcp, unsigned long val)	\
 {									\
+	u16 *gprs = &current_thread_info()->pcpu_gprs;			\
+	unsigned long addr;						\
+	unsigned long off;						\
 	unsigned int loop;						\
 	u##sz ret;							\
 									\
-	asm volatile (ARM64_LSE_ATOMIC_INSN(				\
+	asm volatile (							\
+	__PCPU_GPRS_BEGIN("%[gprs]", "%[pcp]", "%[off]", "%[addr]")	\
+	ARM64_LSE_ATOMIC_INSN(						\
 	/* LL/SC */							\
-	"1:	ldxr" #sfx "\t%" #w "[ret], %[ptr]\n"			\
+	"1:	ldxr" #sfx "\t%" #w "[ret], [%[addr]]\n"		\
 		#op_llsc "\t%" #w "[ret], %" #w "[ret], %" #w "[val]\n"	\
-	"	stxr" #sfx "\t%w[loop], %" #w "[ret], %[ptr]\n"		\
+	"	stxr" #sfx "\t%w[loop], %" #w "[ret], [%[addr]]\n"	\
 	"	cbnz	%w[loop], 1b",					\
 	/* LSE atomics */						\
-		#op_lse #sfx "\t%" #w "[val], %" #w "[ret], %[ptr]\n"	\
+		#op_lse #sfx "\t%" #w "[val], %" #w "[ret], [%[addr]]\n"\
 		#op_llsc "\t%" #w "[ret], %" #w "[ret], %" #w "[val]\n"	\
 		__nops(2))						\
-	: [loop] "=&r" (loop), [ret] "=&r" (ret),			\
-	  [ptr] "+Q"(*(u##sz *)ptr)					\
-	: [val] "r" ((u##sz)(val)));					\
+	__PCPU_GPRS_END("%[gprs]")					\
+	: [gprs] "=Qo" (*gprs),						\
+	  [addr] "=&r" (addr),						\
+	  [off] "=&r" (off),						\
+	  [loop] "=&r" (loop),						\
+	  [ret] "=&r" (ret)						\
+	: [pcp] "r" (pcp),						\
+	  [val] "r" ((u##sz)(val))					\
+	: "memory"							\
+	);								\
 									\
 	return ret;							\
 }
@@ -322,13 +334,13 @@ PERCPU_RET_OP(add, add, ldadd)
 	_pcp_wrap(__percpu_add_case_64, pcp, val)
 
 #define this_cpu_add_return_1(pcp, val)	\
-	_pcp_protect_return(__percpu_add_return_case_8, pcp, val)
+	_pcp_wrap_return(__percpu_add_return_case_8, pcp, val)
 #define this_cpu_add_return_2(pcp, val)	\
-	_pcp_protect_return(__percpu_add_return_case_16, pcp, val)
+	_pcp_wrap_return(__percpu_add_return_case_16, pcp, val)
 #define this_cpu_add_return_4(pcp, val)	\
-	_pcp_protect_return(__percpu_add_return_case_32, pcp, val)
+	_pcp_wrap_return(__percpu_add_return_case_32, pcp, val)
 #define this_cpu_add_return_8(pcp, val)	\
-	_pcp_protect_return(__percpu_add_return_case_64, pcp, val)
+	_pcp_wrap_return(__percpu_add_return_case_64, pcp, val)
 
 #define this_cpu_and_1(pcp, val)	\
 	_pcp_wrap(__percpu_andnot_case_8, pcp, ~(u8)(val))
-- 
2.30.2


