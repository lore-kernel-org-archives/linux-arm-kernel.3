Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF37BC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 15:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zB0abRnB96aVBzXq/f6eZ5Kbz/HGeo7yyqOhSey8KzU=; b=g4mhwQU1Q3txhm
	xOLgoYj+icn0LJaIrb+UmTGDNN7jTW28Z5GAcpKP4dz30jx4hLWpiaqHZ7FyRYcbM7E1YfnP1MrNR
	orOA8cPgwyzhjaGIxOhAM9dknF5+zMlDQ8t1W2ouMrNb4nSERmTZ+rcUe2LqOhadeARzDlBTq48Su
	sBEPKBcpVyuWvyyTcF1ODZEN8pj9x2e+7LZ8hL+kelQK82x81AG4dB/g1KpRGLsRg8JtcCR6meCHW
	YydmeaRodouKLTrrTXr/NqLtL+0FMDJ+klS/+0lt7uUQIV3SYbkZie5dmmfRen/jriOB0y3OK7z95
	L2VI40KzD4/NDeYnRSOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xhB-00000009TXJ-0B9g;
	Tue, 08 Sep 2026 15:25:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xh8-00000009TWD-0jSi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 15:25:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 836331476;
	Tue,  8 Sep 2026 08:25:05 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6E7433F7B4;
	Tue,  8 Sep 2026 08:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788881109; bh=weSg9lKsIHE/83qMW/SyU4ojYrTWn2q+C4WdqveaRvg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kuo58kD2UkLH1bs9WZ8LBZfGfU4r2VG6H/vJBtvuZwFHE6vbTEr+VsgUrbmn2nPSp
	 MD9kvcrfP7x1lcXqZYTUmx/3Ki/uB0+TTRsvywVBrHYo3DzzShXikgoFDM9gLnfOpW
	 XITJedS8kH33twrZ1dGuu7GyKF4iRQGmNkAuFe7w=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 19/21] arm64: percpu: Implement preemptible CMPXCHG ops
Date: Tue,  8 Sep 2026 16:17:39 +0100
Message-Id: <20260908151741.394589-20-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260908151741.394589-1-mark.rutland@arm.com>
References: <20260908151741.394589-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_082510_300698_53272D71 
X-CRM114-Status: GOOD (  11.60  )
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

Use the PCPU GPR infrastructure to implement all of the {8,16,32,64}-bit
cmpxchg ops.

Note that before this patch, the LL/SC and LSE implementation was chosen
with an alternative branch. After this patch the implementations are
patched inline, matching the style of the other percpu ops.

Test case:

| u64 outline_this_cpu_cmpxchg_u64(u64 __percpu *p, u64 o, u64 n)
| {
| 	return this_cpu_cmpxchg(*p, o, n);
| }

Generated code before this patch (v7.2-rc4):

| <outline_this_cpu_cmpxchg_u64>:
|        paciasp
|        stp     x29, x30, [sp, #-32]!
|        mrs     x4, sp_el0
|        mov     x29, sp
|        ldr     w3, [x4, #8]
|        add     w3, w3, #0x1
|        str     w3, [x4, #8]
|        mrs     x3, tpidr_el1
|        add     x3, x0, x3
|        b       4f		// alternative branch
|        cas     x1, x2, [x3]
|        mov     x0, x1
| 1:     mrs     x2, sp_el0
|        ldr     x1, [x2, #8]
|        sub     x1, x1, #0x1
|        str     w1, [x2, #8]
|        cbz     x1, 2f
|        ldr     x1, [x2, #8]
|        cbnz    x1, 3f
| 2:     str     x0, [sp, #24]
|        bl      preempt_schedule_notrace
|        ldr     x0, [sp, #24]
| 3:     ldp     x29, x30, [sp], #32
|        autiasp
|        ret
| 4:     prfm    pstl1strm, [x3]
| 5:     ldxr    x0, [x3]
|        eor     x4, x0, x1
|        cbnz    x4, 6f
|        stxr    w4, x2, [x3]
|        cbnz    w4, 5b
| 6:     b       1b

Generated code after this patch:

| <outline_this_cpu_cmpxchg_u64>:
|        mrs     x4, sp_el0
|        mov     w6, #0x14c0
|        strh    w6, [x4, #20]
|        mrs     x6, tpidr_el1
|        add     x5, x0, x6
|        prfm    pstl1strm, [x5]
| 1:     ldxr    x3, [x5]
|        eor     x7, x3, x1
|        cbnz    x7, 2f
|        stxr    w7, x2, [x5]
|        cbnz    w7, 1b
| 2:     strh    wzr, [x4, #20]
|        mov     x0, x3
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
 arch/arm64/include/asm/percpu.h | 69 +++++++++++++++++++++++++++++++--
 1 file changed, 65 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
index 820340c61d70f..f19a82437b3fd 100644
--- a/arch/arm64/include/asm/percpu.h
+++ b/arch/arm64/include/asm/percpu.h
@@ -306,12 +306,67 @@ __percpu_xchg_case_##sz(void __percpu *pcp, u##sz val)			\
 	return ret;							\
 }
 
+#define PERCPU_CMPXCHG_OP(w, sfx, sz)					\
+static inline unsigned long						\
+__percpu_cmpxchg_case_##sz(void __percpu *pcp,				\
+			   u##sz old,					\
+			   u##sz new)					\
+{									\
+	/*                                                              \
+	 * Sub-word sizes require zero extension so that EOR+CBNZ don't	\
+	 * consume non-zero upper bits of the register containing "old".\
+	 */								\
+	xwreg_t(w) cmpval = xwreg_zero_extend(old, w, sz);		\
+	u16 *gprs = &current_thread_info()->pcpu_gprs;			\
+	unsigned long addr;						\
+	unsigned long off;						\
+	unsigned long tmp;						\
+	unsigned long oldval;						\
+									\
+	asm volatile (							\
+	__PCPU_GPRS_BEGIN("%[gprs]", "%[pcp]", "%[off]", "%[addr]")	\
+	ARM64_LSE_ATOMIC_INSN(						\
+	/* LL/SC */							\
+	"	prfm	pstl1strm, [%[addr]]\n"				\
+	"1:	ldxr" #sfx "\t%" #w "[oldval], [%[addr]]\n"		\
+	"	eor	%" #w "[tmp], %" #w "[oldval], %" #w "[old]\n"	\
+	"	cbnz	%" #w "[tmp], 2f\n"				\
+	"	stxr" #sfx "\t%w[tmp], %" #w "[new], [%[addr]]\n"	\
+	"	cbnz	%w[tmp], 1b\n"					\
+	"2:\n"								\
+	,								\
+	/* LSE atomics */						\
+	"	mov	%" #w "[oldval], %" #w "[old]\n"		\
+	"	cas" #sfx "\t%" #w "[oldval], %" #w "[new], [%[addr]]\n"\
+		__nops(4)						\
+	)								\
+	__PCPU_GPRS_END("%[gprs]")					\
+	: [gprs] "=Qo" (*gprs),						\
+	  [addr] "=&r" (addr),						\
+	  [off] "=&r" (off),						\
+	  [tmp] "=&r" (tmp),						\
+	  [oldval] "=&r" (oldval)					\
+	: [pcp] "r" (pcp),						\
+	  [old] "r" (cmpval),						\
+	  [new] "r" (new)						\
+	: "memory"							\
+	);								\
+									\
+	return oldval;							\
+}
+
 PERCPU_XCHG_OP(w, b, 8)
 PERCPU_XCHG_OP(w, h, 16)
 PERCPU_XCHG_OP(w,  , 32)
 PERCPU_XCHG_OP(x,  , 64)
 
+PERCPU_CMPXCHG_OP(w, b, 8)
+PERCPU_CMPXCHG_OP(w, h, 16)
+PERCPU_CMPXCHG_OP(w,  , 32)
+PERCPU_CMPXCHG_OP(x,  , 64)
+
 #undef PERCPU_XCHG_OP
+#undef PERCPU_CMPXCHG_OP
 
 /*
  * It would be nice to avoid the conditional call into the scheduler when
@@ -355,6 +410,12 @@ PERCPU_XCHG_OP(x,  , 64)
 	(typeof(pcp))op(&(pcp), (unsigned long)(val));			\
 })
 
+#define _pcp_wrap_cmpxchg(op, pcp, old, new)				\
+({									\
+	(typeof(pcp))op(&(pcp), (unsigned long)(old),			\
+			(unsigned long)(new));				\
+})
+
 #define this_cpu_read_1(pcp)		\
 	_pcp_wrap_return(__percpu_read_8, pcp)
 #define this_cpu_read_2(pcp)		\
@@ -419,13 +480,13 @@ PERCPU_XCHG_OP(x,  , 64)
 	_pcp_wrap_xchg(__percpu_xchg_case_64, pcp, val)
 
 #define this_cpu_cmpxchg_1(pcp, o, n)	\
-	_pcp_protect_return(cmpxchg_relaxed, pcp, o, n)
+	_pcp_wrap_cmpxchg(__percpu_cmpxchg_case_8, pcp, o, n)
 #define this_cpu_cmpxchg_2(pcp, o, n)	\
-	_pcp_protect_return(cmpxchg_relaxed, pcp, o, n)
+	_pcp_wrap_cmpxchg(__percpu_cmpxchg_case_16, pcp, o, n)
 #define this_cpu_cmpxchg_4(pcp, o, n)	\
-	_pcp_protect_return(cmpxchg_relaxed, pcp, o, n)
+	_pcp_wrap_cmpxchg(__percpu_cmpxchg_case_32, pcp, o, n)
 #define this_cpu_cmpxchg_8(pcp, o, n)	\
-	_pcp_protect_return(cmpxchg_relaxed, pcp, o, n)
+	_pcp_wrap_cmpxchg(__percpu_cmpxchg_case_64, pcp, o, n)
 
 #define this_cpu_cmpxchg64(pcp, o, n)	this_cpu_cmpxchg_8(pcp, o, n)
 
-- 
2.30.2


