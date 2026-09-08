Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6DAC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 15:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dv+MD4RoIv1X1OjNSW2DcFLNrf28KgaRvuQExs0WkWg=; b=eU25lYTdwdg+Uw
	MoEjQohouVkfHI8+JLm6Od0Pvu6eRI83MjuYR4wjLC2zeh/5P1IGhdNOfXvHARUGfbSjVz2RFsmF8
	GPUxYRoK1cn+S1xoKLwyfBSUm0fV7gAzYT1Nye2JdeXZCbE+EMy7pXxO7mD8NPhCasFE6yMf/h6n7
	1/r7vAY+frmRQumVFF1BRdeXZrGHTG1rvLZwysVUZu7XNexTLj+r8ru4XfwuBhnyTTBEg7qMLD0uk
	Htw28KeAxpUKDKcrBb9yKsAseei/wqtw3CSK0+XYqGgNH2RGggX+Hn7Q1TPgFUNZQACFB2ZlnFF/p
	BWrNG9N8bO5tKATe3ojg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xbh-00000009Rzs-1uiD;
	Tue, 08 Sep 2026 15:19:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xbd-00000009Ryk-3Q8D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 15:19:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 344C11477;
	Tue,  8 Sep 2026 08:19:24 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1F0D63F7B4;
	Tue,  8 Sep 2026 08:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788880767; bh=Dku5Deo1eRRXqpsPtgYa4sf2TVZxd3PZhvBhEyKq1EI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IDBdSxw30Uki5F+RysH5AXGIqghxg4QxoX6EYTD+EoTHVB363lDaB3sk2x9L6kA7a
	 1avlVlEJwS2s08OMmpqoLamIBnq/e9k2D8P2g49xm7RIrZ3s0BiNGvv/FYSWAq3B/r
	 Mo9h7MIAHHNAUtTJZcQtyQYOP26nhiB3ItubDjnQ=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 05/21] arm64: cmpxchg128: LSE: Remove redundant operands
Date: Tue,  8 Sep 2026 16:17:25 +0100
Message-Id: <20260908151741.394589-6-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260908151741.394589-1-mark.rutland@arm.com>
References: <20260908151741.394589-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_081929_942546_559E5969 
X-CRM114-Status: GOOD (  14.63  )
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

The LSE assembly for cmpxhg128*() has redundant operands which cause
unnecessary register pressure. These operands can be removed without
adverse effects, as described below.

It is necessary to force specific registers for the 64-bit halves of
'old' and 'new', as the encoding of CASP[A][L] requires that these
halves are allocated into even/odd register pairs, and contemporary
versions of LLVM don't support a mechanism to allocate a value into an
even/odd register pair for inline assembly. We manually allocate these
into x0/x1/x2/x3.

It is not necessary to force the address into a specific register, as
the encoding of CASP[A][L] can accept this in any GPR or SP. Hence, it
is not necessary to manually allocate the address into x4 for the
'[ptr]' operand. The assembly uses the '[v]' operand, and contemporary
compilers happen to allocate '[v]' into a separate register from
'[ptr]', meaning that '[ptr]' only serves to create register pressure.

It is not necessary to allocate the '[oldval1]' and '[oldval2]'
operands, as these are not used by the assembly. The assembly uses the
'[old1]' and '[old2]' operands for both input and output. The
'[oldval1]' and '[oldval2]' operands only serve to create register
pressure.

Remove the redundant operands. This saves on register pressure, as
demonstrated by the test case below. There's still some unfortunate
register shuffling due to the manual allocation of 'old' and 'new', but
this should be less prominent within a larger function.

Test case:

| u128 outline_cmpxchg128(u128 *p, u128 old, u128 new)
| {
| 	return cmpxchg128(p, old, new);
| }

Generated code before this patch:

| <outline_cmpxchg128>:
|        mov     x6, x0
|        mov     x1, x3
|        mov     x0, x2
|        b       1f
|        mov     x2, x4
|        mov     x3, x5
|        mov     x4, x6
|        mov     x5, x0
|        mov     x7, x1
|        caspal  x0, x1, x2, x3, [x6]
|        ret
| 1:     prfm    pstl1strm, [x6]
| 2:     ldxp    x8, x7, [x6]
|        cmp     x8, x0
|        ccmp    x7, x3, #0x0, eq
|        b.ne    3f
|        stlxp   w2, x4, x5, [x6]
|        cbnz    w2, 2b
|        dmb     ish
| 3:     mov     x0, x8
|        mov     x1, x7
|        ret

Generated code after this patch:

| <outline_cmpxchg128>:
|        mov     x6, x0
|        mov     x0, x2
|        b       1f
|        mov     x1, x3
|        mov     x2, x4
|        mov     x3, x5
|        caspal  x0, x1, x2, x3, [x6]
|        ret
| 1:     prfm    pstl1strm, [x6]
| 2:     ldxp    x8, x7, [x6]
|        cmp     x8, x0
|        ccmp    x7, x3, #0x0, eq
|        3f
|        stlxp   w2, x4, x5, [x6]
|        cbnz    w2, 2b
|        dmb     ish
| 3:     mov     x0, x8
|        mov     x1, x7
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
 arch/arm64/include/asm/atomic_lse.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/atomic_lse.h b/arch/arm64/include/asm/atomic_lse.h
index afad1849c4cf5..d588af0565331 100644
--- a/arch/arm64/include/asm/atomic_lse.h
+++ b/arch/arm64/include/asm/atomic_lse.h
@@ -291,15 +291,13 @@ __lse__cmpxchg128##name(volatile u128 *ptr, u128 old, u128 new)		\
 	register unsigned long x1 asm ("x1") = o.high;			\
 	register unsigned long x2 asm ("x2") = n.low;			\
 	register unsigned long x3 asm ("x3") = n.high;			\
-	register unsigned long x4 asm ("x4") = (unsigned long)ptr;	\
 									\
 	asm volatile(							\
 	__LSE_PREAMBLE							\
 	"	casp" #mb "\t%[old1], %[old2], %[new1], %[new2], %[v]\n"\
 	: [old1] "+&r" (x0), [old2] "+&r" (x1),				\
 	  [v] "+Q" (*(u128 *)ptr)					\
-	: [new1] "r" (x2), [new2] "r" (x3), [ptr] "r" (x4),		\
-	  [oldval1] "r" (o.low), [oldval2] "r" (o.high)			\
+	: [new1] "r" (x2), [new2] "r" (x3)				\
 	: cl);								\
 									\
 	r.low = x0; r.high = x1;					\
-- 
2.30.2


