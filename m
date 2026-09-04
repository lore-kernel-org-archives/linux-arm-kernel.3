Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B16C79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 16:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M4P7vyCOVni+ZsK8pF/yuS7E8KI5hqR5gtPw7mD705Y=; b=FSUtGBBM+5nL/G
	XRO5a89doQoAOz+uALRSiNMy7nhMFoQk3/k3DjDVewMX+aiEtLBU7hhXtnITuX8H1AY6xM86F7gmE
	7NVXIkr/WU1REv4QP96C4uWyjx2nCtCcB3vK5kAfVfCA5XI9gKi/IfjhuOcBL5AKiCHusA9vduf/s
	EFAh9+eo0cB+8MiE7bd4WwWVFN2l++CmD7C2MW+96ArFyPSj0NgK4MRfCj9YGLCZ6xl6TdHppwPs5
	Bl78yuOZDn+eHdvr0UUWveH0+/zeEvmOC0Of8e6ao66+MuA1Q9TDvwi0SYpDMDuyQEoOgf6tNKoQD
	OLMEm987K5jDwrsXdIcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WdL-00000002hZc-0hOr;
	Fri, 04 Sep 2026 16:19:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WdH-00000002hUo-2gPp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 16:19:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B0DE1FC4;
	Fri,  4 Sep 2026 09:19:11 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 20CBD3F673;
	Fri,  4 Sep 2026 09:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788538755; bh=ulS9e57JOpVuxlf/+qzYMC41G5m8IkihwUPBziATUvc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EXkyg96WQ/98cWTYDCCR8rmhD1JRF6iYNWWVdQmrD3pOiVnSppi+OUljuC223mog9
	 1j2mCOLV0RL7uAej6pTkk1+tkgCvp2M3O1jsVR3H/bGdMHyDV6fH2o8M2f/vejZake
	 x8rdPdRIWGftdi1CRc9EWL0gdwLH4/pajLRix97U=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 20/21] arm64: percpu: Implement preemptible CMPXCHG128 ops
Date: Fri,  4 Sep 2026 17:17:57 +0100
Message-Id: <20260904161758.376504-21-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260904161758.376504-1-mark.rutland@arm.com>
References: <20260904161758.376504-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_091915_779757_671F7DD9 
X-CRM114-Status: GOOD (  12.86  )
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

Use the PCPU GPR infrastructure to implement this_cpu_cmpxchg128().

Note that before this patch, the LL/SC and LSE implementation was chosen
with an alternative branch. After this patch the implementations are
patched inline, matching the style of the other percpu ops.

The sub-optimal register shuffling before and after this patch occurs
because we hard-code specific registers, as LLVM (currently) lacks a way
to place a 128-bit type in a compiler-allocated even-odd pair of
registers for inline assembly. We should be able to improve that in
future, given compiler support.

Test case:

| u128 outline_this_cpu_cmpxchg128(u128 __percpu *p, u128 old, u128 new)
| {
| 	return this_cpu_cmpxchg128(*p, old, new);
| }

Generated code before this patch (v7.2-rc4):

| <outline_this_cpu_cmpxchg128>:
|        paciasp
|        stp     x29, x30, [sp, #-32]!
|        mov     x6, x0
|        mov     x0, x2
|        mov     x29, sp
|        mov     x1, x3
|        mrs     x2, sp_el0
|        ldr     w7, [x2, #8]
|        add     w7, w7, #0x1
|        str     w7, [x2, #8]
|        mrs     x2, tpidr_el1
|        add     x6, x6, x2
|        b       4f
|        mov     x2, x4
|        mov     x3, x5
|        mov     x4, x6
|        mov     x5, x0
|        mov     x7, x1
|        casp    x0, x1, x2, x3, [x6]
| 1:     mrs     x3, sp_el0
|        ldr     x2, [x3, #8]
|        sub     x2, x2, #0x1
|        str     w2, [x3, #8]
|        cbz     x2, 2f
|        ldr     x2, [x3, #8]
|        cbnz    x2, 3f
| 2:     stp     x0, x1, [sp, #16]
|        bl      preempt_schedule_notrace
|        ldp     x0, x1, [sp, #16]
| 3:     ldp     x29, x30, [sp], #32
|        autiasp
|        ret
| 4:     prfm    pstl1strm, [x6]
| 5:     ldxp    x8, x7, [x6]
|        cmp     x8, x0
|        ccmp    x7, x3, #0x0, eq
|        b.ne    6f
|        stxp    w2, x4, x5, [x6]
|        cbnz    w2, 5b
| 6:     mov     x0, x8
|        mov     x1, x7
|        b       1b

Generated code after this patch:

| <outline_this_cpu_cmpxchg128>:
|        mov     x6, x0
|        mov     x1, x3
|        mov     x0, x2
|        mov     x3, x5
|        mrs     x7, sp_el0
|        mov     x2, x4
|        mov     w5, #0x10a6
|        strh    w5, [x7, #20]
|        mrs     x5, tpidr_el1
|        add     x4, x6, x5
|        prfm    pstl1strm, [x4]
| 1:     ldxp    x9, x10, [x4]
|        cmp     x9, x0
|        ccmp    x10, x1, #0x0, eq
|        b.ne    2f
|        stxp    w8, x2, x3, [x4]
|        cbnz    w8, 1b
| 2:     strh    wzr, [x7, #20]
|        mov     x0, x9
|        mov     x1, x10
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
 arch/arm64/include/asm/percpu.h | 70 +++++++++++++++++++++++++++------
 1 file changed, 57 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
index f19a82437b3fd..5cd98e20e825d 100644
--- a/arch/arm64/include/asm/percpu.h
+++ b/arch/arm64/include/asm/percpu.h
@@ -490,19 +490,63 @@ PERCPU_CMPXCHG_OP(x,  , 64)
 
 #define this_cpu_cmpxchg64(pcp, o, n)	this_cpu_cmpxchg_8(pcp, o, n)
 
-#define this_cpu_cmpxchg128(pcp, o, n)					\
-({									\
-	typedef typeof(pcp) pcp_op_T__;					\
-	u128 old__, new__, ret__;					\
-	pcp_op_T__ *ptr__;						\
-	old__ = o;							\
-	new__ = n;							\
-	preempt_disable_notrace();					\
-	ptr__ = raw_cpu_ptr(&(pcp));					\
-	ret__ = cmpxchg128_local((void *)ptr__, old__, new__);		\
-	preempt_enable_notrace();					\
-	ret__;								\
-})
+static inline u128
+__percpu_cmpxchg_128(void __percpu *pcp, u128 old, u128 new)
+{
+	u16 *gprs = &current_thread_info()->pcpu_gprs;
+	unsigned long addr;
+	unsigned long off;
+	union __u128_halves r, o = { .full = (old) },
+			       n = { .full = (new) };
+	register unsigned long ol asm ("x0") = o.low;
+	register unsigned long oh asm ("x1") = o.high;
+	register unsigned long nl asm ("x2") = n.low;
+	register unsigned long nh asm ("x3") = n.high;
+	unsigned long rl, rh;
+	unsigned long tmp;
+
+	asm volatile (
+	__PCPU_GPRS_BEGIN("%[gprs]", "%[pcp]", "%[off]", "%[addr]")
+	ARM64_LSE_ATOMIC_INSN(
+	/* LL/SC */
+       "       prfm    pstl1strm, [%[addr]]\n"
+       "1:     ldxp    %[rl], %[rh], [%[addr]]\n"
+       "       cmp     %[rl], %[ol]\n"
+       "       ccmp    %[rh], %[oh], 0, eq\n"
+       "       b.ne    2f\n"
+       "       stxp    %w[tmp], %[nl], %[nh], [%[addr]]\n"
+       "       cbnz    %w[tmp], 1b\n"
+       "2:\n"
+	,
+	/* LSE atomics */
+	"	casp	%[ol], %[oh], %[nl], %[nh], [%[addr]]\n"
+	"	mov	%[rl], %[ol]\n"
+	"	mov	%[rh], %[oh]\n"
+	__nops(4)
+	)
+	__PCPU_GPRS_END("%[gprs]")
+	: [gprs] "=Qo" (*gprs),
+	  [addr] "=&r" (addr),
+	  [off] "=&r" (off),
+	  [tmp] "=&r" (tmp),
+	  [ol] "+&r" (ol),
+	  [oh] "+&r" (oh),
+	  [rl] "=&r" (rl),
+	  [rh] "=&r" (rh)
+	: [pcp] "r" (pcp),
+	  [nl] "r" (nl),
+	  [nh] "r" (nh)
+	: "memory", "cc"
+	);
+
+	r.low = rl;
+	r.high = rh;
+
+	return r.full;
+}
+
+#define this_cpu_cmpxchg128(pcp, o, n)	\
+	_pcp_wrap_return(__percpu_cmpxchg_128, pcp, o, n)
 
 #ifdef __KVM_NVHE_HYPERVISOR__
 extern unsigned long __hyp_per_cpu_offset(unsigned int cpu);
-- 
2.30.2


