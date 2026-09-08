Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F0DC79FAF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 15:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dyNxZmZuKH2T7aPxOnee5PBnhOaQGAXKTH5a/XTFXxs=; b=mdd6EoDbxJCCN5
	nPL/+1ikdnREx13sUWS1SZ3YHYjgcECDkcRgZPPwl6uR/NU5PnwwsSbkyrRCK/jPLN+ddczDdfbwC
	PLpKaz0/W0chW7hYLU87y05htgZKM7NEMGtrBPQRM35T0pBPiSWnnLCQNzkMQnEsKuMARIRr2q5yz
	DKWivbAyNC1tyPCjb3dkOCoXxBiIdmcDKrYcP0FWHJB0DEML+Fo7kg8w9cwueEDTpqhd+a4+oHaFn
	dKE0qJK2QLdtK+zmGxLcBOZqSeDnd5jFMeS+NpjGwkSs2si93Ij4HR/RYpe1MFGgjxboV4+f2s4h/
	LVZbzk+oKz5yq7ldQ6dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xfx-00000009TBK-1t8r;
	Tue, 08 Sep 2026 15:23:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xfv-00000009TAC-2eon
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 15:23:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 15A531C2B;
	Tue,  8 Sep 2026 08:23:50 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 003ED3F7B4;
	Tue,  8 Sep 2026 08:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788881033; bh=+3TbNq4I5WUDgsElPrSIlf88x+DrFoWeDhT4++DQ1Go=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oWAT3/w27laItZfMIUXEbjJWqji7hz6hClmellVkeRjvZyuvgPutvepeCJ+RyfSJe
	 yX9st1C4powqEHNrFup9vXhjQNB1DDXzyWQGyVR4CdJ6jy6rwXmr9WDNMN4AAue8IN
	 u+0asB0rMdCFFBBg/fUiCe6K0cTJGgpKRVWbyBHQ=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 16/21] arm64: percpu: Implement preemptible void RMW ops
Date: Tue,  8 Sep 2026 16:17:36 +0100
Message-Id: <20260908151741.394589-17-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260908151741.394589-1-mark.rutland@arm.com>
References: <20260908151741.394589-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_082355_744699_69A43990 
X-CRM114-Status: GOOD (  10.30  )
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
Cc: mark.rutland@arm.com, vladimir.murzin@arm.com, ryan.roberts@arm.com, usama.anjum@arm.com, peterz@infradead.org, catalin.marinas@arm.com, david.laight.linux@gmail.com, stable@vger.kernel.org, ruanjinjie@huawei.com, james.morse@arm.com, yang@os.amperecomputing.com, cl@gentwo.org, maz@kernel.org, david@kernel.org, ljs@kernel.org, will@kernel.org, ardb@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Use the PCPU GPR infrastructure to implement all of the RMW ops which do
not return a value.

Test case:

| void outline_this_cpu_add_u64(u64 __percpu *p, u64 v)
| {
| 	this_cpu_add(*p, v);
| }

Generated code before this patch (v7.2-rc4):

| <outline_this_cpu_add_u64>:
|        paciasp
|        stp     x29, x30, [sp, #-16]!
|        mrs     x2, sp_el0
|        mov     x29, sp
|        ldr     w3, [x2, #8]
|        add     w3, w3, #0x1
|        str     w3, [x2, #8]
|        mrs     x3, tpidr_el1
|        add     x0, x0, x3
| 1:     ldxr    x5, [x0]
|        add     x5, x5, x1
|        stxr    w4, x5, [x0]
|        cbnz    w4, 1b
|        ldr     x0, [x2, #8]
|        sub     x0, x0, #0x1
|        str     w0, [x2, #8]
|        cbz     x0, 2f
|        ldr     x0, [x2, #8]
|        cbnz    x0, 3f
| 2:     bl      preempt_schedule_notrace
| 3:     ldp     x29, x30, [sp], #16
|        autiasp
|        ret

Generated code after this patch:

| <outline_this_cpu_add_u64>:
|        mrs     x2, sp_el0
|        mov     w4, #0xc80
|        strh    w4, [x2, #20]
|        mrs     x4, tpidr_el1
|        add     x3, x0, x4
| 1:     ldxr    x6, [x3]
|        add     x6, x6, x1
|        stxr    w5, x6, [x3]
|        cbnz    w5, 1b
|        strh    wzr, [x2, #20]
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
 arch/arm64/include/asm/percpu.h | 52 ++++++++++++++++++++-------------
 1 file changed, 32 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
index 984f69846cc09..504a7fefa2015 100644
--- a/arch/arm64/include/asm/percpu.h
+++ b/arch/arm64/include/asm/percpu.h
@@ -168,23 +168,35 @@ static inline void __percpu_write_##sz(void __percpu *pcp, unsigned long val)	\
 
 #define __PERCPU_OP_CASE(w, sfx, name, sz, op_llsc, op_lse)		\
 static inline void							\
-__percpu_##name##_case_##sz(void *ptr, unsigned long val)		\
+__percpu_##name##_case_##sz(void __percpu *pcp, unsigned long val)	\
 {									\
+	u16 *gprs = &current_thread_info()->pcpu_gprs;			\
+	unsigned long addr;						\
+	unsigned long off;						\
 	unsigned int loop;						\
 	u##sz tmp;							\
 									\
-	asm volatile (ARM64_LSE_ATOMIC_INSN(				\
+	asm volatile (							\
+	__PCPU_GPRS_BEGIN("%[gprs]", "%[pcp]", "%[off]", "%[addr]")	\
+	ARM64_LSE_ATOMIC_INSN(						\
 	/* LL/SC */							\
-	"1:	ldxr" #sfx "\t%" #w "[tmp], %[ptr]\n"			\
+	"1:	ldxr" #sfx "\t%" #w "[tmp], [%[addr]]\n"		\
 		#op_llsc "\t%" #w "[tmp], %" #w "[tmp], %" #w "[val]\n"	\
-	"	stxr" #sfx "\t%w[loop], %" #w "[tmp], %[ptr]\n"		\
+	"	stxr" #sfx "\t%w[loop], %" #w "[tmp], [%[addr]]\n"	\
 	"	cbnz	%w[loop], 1b",					\
 	/* LSE atomics */						\
-		#op_lse #sfx "\t%" #w "[val], %" #w "[tmp], %[ptr]\n"	\
+		#op_lse #sfx "\t%" #w "[val], %" #w "[tmp], [%[addr]]\n"\
 		__nops(3))						\
-	: [loop] "=&r" (loop), [tmp] "=&r" (tmp),			\
-	  [ptr] "+Q"(*(u##sz *)ptr)					\
-	: [val] "r" ((u##sz)(val)));					\
+	__PCPU_GPRS_END("%[gprs]")					\
+	: [gprs] "=Qo" (*gprs),						\
+	  [addr] "=&r" (addr),						\
+	  [off] "=&r" (off),						\
+	  [loop] "=&r" (loop),						\
+	  [tmp] "=&r" (tmp)						\
+	: [pcp] "r" (pcp),						\
+	  [val] "r" ((u##sz)(val))					\
+	: "memory"							\
+	);								\
 }
 
 #define __PERCPU_RET_OP_CASE(w, sfx, name, sz, op_llsc, op_lse)		\
@@ -301,13 +313,13 @@ PERCPU_RET_OP(add, add, ldadd)
 	_pcp_wrap(__percpu_write_64, pcp, (unsigned long)(val))
 
 #define this_cpu_add_1(pcp, val)	\
-	_pcp_protect(__percpu_add_case_8, pcp, val)
+	_pcp_wrap(__percpu_add_case_8, pcp, val)
 #define this_cpu_add_2(pcp, val)	\
-	_pcp_protect(__percpu_add_case_16, pcp, val)
+	_pcp_wrap(__percpu_add_case_16, pcp, val)
 #define this_cpu_add_4(pcp, val)	\
-	_pcp_protect(__percpu_add_case_32, pcp, val)
+	_pcp_wrap(__percpu_add_case_32, pcp, val)
 #define this_cpu_add_8(pcp, val)	\
-	_pcp_protect(__percpu_add_case_64, pcp, val)
+	_pcp_wrap(__percpu_add_case_64, pcp, val)
 
 #define this_cpu_add_return_1(pcp, val)	\
 	_pcp_protect_return(__percpu_add_return_case_8, pcp, val)
@@ -319,22 +331,22 @@ PERCPU_RET_OP(add, add, ldadd)
 	_pcp_protect_return(__percpu_add_return_case_64, pcp, val)
 
 #define this_cpu_and_1(pcp, val)	\
-	_pcp_protect(__percpu_andnot_case_8, pcp, ~(u8)(val))
+	_pcp_wrap(__percpu_andnot_case_8, pcp, ~(u8)(val))
 #define this_cpu_and_2(pcp, val)	\
-	_pcp_protect(__percpu_andnot_case_16, pcp, ~(u16)(val))
+	_pcp_wrap(__percpu_andnot_case_16, pcp, ~(u16)(val))
 #define this_cpu_and_4(pcp, val)	\
-	_pcp_protect(__percpu_andnot_case_32, pcp, ~(u32)(val))
+	_pcp_wrap(__percpu_andnot_case_32, pcp, ~(u32)(val))
 #define this_cpu_and_8(pcp, val)	\
-	_pcp_protect(__percpu_andnot_case_64, pcp, ~(u64)(val))
+	_pcp_wrap(__percpu_andnot_case_64, pcp, ~(u64)(val))
 
 #define this_cpu_or_1(pcp, val)		\
-	_pcp_protect(__percpu_or_case_8, pcp, val)
+	_pcp_wrap(__percpu_or_case_8, pcp, val)
 #define this_cpu_or_2(pcp, val)		\
-	_pcp_protect(__percpu_or_case_16, pcp, val)
+	_pcp_wrap(__percpu_or_case_16, pcp, val)
 #define this_cpu_or_4(pcp, val)		\
-	_pcp_protect(__percpu_or_case_32, pcp, val)
+	_pcp_wrap(__percpu_or_case_32, pcp, val)
 #define this_cpu_or_8(pcp, val)		\
-	_pcp_protect(__percpu_or_case_64, pcp, val)
+	_pcp_wrap(__percpu_or_case_64, pcp, val)
 
 #define this_cpu_xchg_1(pcp, val)	\
 	_pcp_protect_return(xchg_relaxed, pcp, val)
-- 
2.30.2


