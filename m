Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18FF0C54F52
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 12:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tkeJla5v40wMHKIeACO8cF6hVwqEf3tTh3fCTp1mlqs=; b=4UOs+QzApSaj8d
	vZtOnqNvYofh/AWLYBZKwmg5MVafGgddYS5Q+BtNifj8IE/FTnda6sF5FhcbVq7ipTHigtj8L90aW
	yljVz9qUoC8UjpGbktieg6dQLSCW40Sbo+1cZhRKe3rUT2WERKC9iSIAewJEwLQ9H/nrqmkyKjq5F
	HJCATLk+bS22gpryodhmphobdUuyAFs655d+EzVfD4ON28nC9qb5dlVHB1+iYkAnF5p+/BAr0cpEY
	cwHBrTlO1LSmko09A4P0AqMpZVDTU5Nwc0GUlmqorzAYX2ljQ529cI+8NMzv6u3ybFXKdUyNGPJnn
	GLsVRvamcKYmS5YlG15w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woh6S-00000005GdZ-3mKQ;
	Tue, 28 Jul 2026 12:40:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woh6K-00000005GWy-1vxW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 12:40:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5EE461A9A;
	Tue, 28 Jul 2026 05:39:59 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 97A813F86F;
	Tue, 28 Jul 2026 05:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785242403; bh=kviss4ItVT/apGmt+LIVjoKzW0Y1t1oDkN7B2U0WHf8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q0J+Hojo+y4sLMKDRspsbKFJqiMWHfMQkE5Fz9RmkaRhm01KVg3ooGhQKJZ6Gsn5q
	 og0PKcm3PrcSLH4f5myguhEOyJENKIANexuGLJjDicnRp+/F3quVwBn1uEWt7Laimc
	 /zGmozvj911qNCqEEQKH4IYr3jvqGuWIv0R7wj3g=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 09/13] arm64: percpu: Implement preemptible return RMW ops
Date: Tue, 28 Jul 2026 13:38:55 +0100
Message-Id: <20260728123859.2911495-10-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260728123859.2911495-1-mark.rutland@arm.com>
References: <20260728123859.2911495-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_054004_598251_09D9978F 
X-CRM114-Status: UNSURE (   9.64  )
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
Cc: mark.rutland@arm.com, vladimir.murzin@arm.com, peterz@infradead.org, catalin.marinas@arm.com, hca@linux.ibm.com, linux-kernel@vger.kernel.org, ruanjinjie@huawei.com, yang@os.amperecomputing.com, maz@kernel.org, will@kernel.org, ardb@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Use the PCPU GPR infrastructure to implement all of the RMW ops which
return a value.

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
 arch/arm64/include/asm/percpu.h | 36 ++++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
index 7e9ab51561706..3e79bb8b6c9d0 100644
--- a/arch/arm64/include/asm/percpu.h
+++ b/arch/arm64/include/asm/percpu.h
@@ -173,24 +173,36 @@ __percpu_##name##_case_##sz(void __percpu *pcp, unsigned long val)	\
 
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
-		#op_lse "\t%" #w "[val], %" #w "[ret], %[ptr]\n"	\
+		#op_lse "\t%" #w "[val], %" #w "[ret], [%[addr]]\n"	\
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
@@ -294,13 +306,13 @@ PERCPU_RET_OP(add, add, ldadd)
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
 	_pcp_wrap(__percpu_andnot_case_8, pcp, ~val)
-- 
2.30.2


