Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80759C79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 16:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6sDy9GuF7SUNnQ1q2/4jIE3J5QjtSC2VYNO1qS0cctA=; b=ntG3hyaWZQeOcP
	M+45R8s5mV9dZ1We2pXBRVfbAEMZ4fJ2yELnhsosCVLUIHxa9VTY36g7pFsIzW9utnUuHLN/tp2QT
	fftR3LC6gbtL1paZoJuyrJIJreLa/iPsdZHqQbPCW98OfQ37C85wvMaDzeWsVy97Ou0XOLMjiSilN
	YZCSSY6CpVVCxXXdqBel1NcQ3Q92YfrwYvTX0A8YNxeL2UGUvS3qikR6e96dojzyTVKd8TEfM9ioz
	Ukz4ARDd8IW7dYAgcjaLUgEPvc1w3DbKoCw0Rd+8pmDLOCg4aX6rFWox9/ICqaAXkMhamWbr94BzL
	bovFTvxoxt2zdLtE2NMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XD3-00000002oCf-41TJ;
	Fri, 04 Sep 2026 16:56:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XCz-00000002oC5-43aj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 16:56:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02E15152B;
	Fri,  4 Sep 2026 09:56:05 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A5E6C3F673;
	Fri,  4 Sep 2026 09:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788540968; bh=+urC92fTi5p2Xjzo7KYfLK0V4wF1Ttkp4PL7+WZOhQ4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=chu+8afOWTBQLSxqW2RzALf9LMbiinW9KHMVuD9kbrgEkDhix1jMh/k7GDEWOkEU8
	 k+fJ5RpxaSDpP9jX6/VIia6ZE0Z5+EnK6TD0if8xtSpR4UN0ssCMIKWetJuS3kWrXS
	 7K8yu40a2r9hvzpoLEZ9R1kcPMURAMUfreMsCMz0=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 02/21] arm64: percpu: Fix this_cpu_and() mask generation
Date: Fri,  4 Sep 2026 17:56:00 +0100
Message-Id: <20260904165600.376877-1-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260904161758.376504-1-mark.rutland@arm.com>
References: <20260904161758.376504-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_095610_084273_3E2F98EC 
X-CRM114-Status: GOOD (  14.23  )
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

The arm64 implementation of this_cpu_and(pcp, val) is built in terms of
ANDNOT operations, which requires the 'val' argument to be bitwise
negated. The bitwise negation is not implemented correctly, with two
bugs described below.

(1) The bitwise negation is performed as '~val' rather than '~(val)'.
    This won't always generate the expected value when 'val' is an
    expression.

    For example, for this_cpu_and(pcp, 1 - 1):

    * 'val'    is  '1 - 1'   ===> (int) 0x00000000
    * '~val'   is '~1 - 1'   ===> (int) 0xfffffffd
    * '~(val)' is '~(1 - 1)' ===> (int) 0xffffffff

    ... and thus bit[1] of 'pcp' would be preserved unexpectedly by the
    ANDNOT operation.

(2) The bitwise negation is performed on 'val' before it has been cast
    to (at least) the width of 'pcp'. This won't always generate the
    expected value for the upper bits.

    For example, for this_cpu_and(pcp, zero), where 'pcp' is a u64 and
    'zero' is a u32:

    * 'zero'           ===> (u32) 0x00000000
    * '~(zero)'        ===> (u32) 0xffffffff
    * '(u64)~(zero)'   ===> (u64) 0x00000000ffffffff
    * '~((u64)(zero))' ===> (u64) 0xffffffffffffffff

    ... and thus bits[63:32] of 'pcp' would be preserved unexpectedly by
    the ANDNOT operation.

Fix these issues by adding brackets around 'val', and by casting 'val'
to an appropriately-sized type before bitwise negation.

The bugs described above can be seen from the disassembly of the
following test code:

| void this_cpu_and_u64_zero(u64 __percpu *pcp)
| {
|         u64 zero = 0;
|         this_cpu_and(*pcp, zero);
| }
|
| void this_cpu_and_u32_zero(u64 __percpu *pcp)
| {
|         u32 zero = 0;
|         this_cpu_and(*pcp, zero);
| }
|
| void this_cpu_and_expr_zero(u64 __percpu *pcp)
| {
|         this_cpu_and(*pcp, 1 - 1);
| }
|
| void this_cpu_and_expr_zero_brackets(u64 __percpu *pcp)
| {
|         this_cpu_and(*pcp, (1 - 1));
| }

Before this patch:

| <this_cpu_and_u64_zero>:
|        paciasp
|        stp     x29, x30, [sp, #-16]!
|        mrs     x1, sp_el0
|        mov     x29, sp
|        ldr     w2, [x1, #8]
|        add     w2, w2, #0x1
|        str     w2, [x1, #8]
|        mov     x3, #0xffffffffffffffff         // #-1
|        mrs     x2, tpidr_el1
|        add     x0, x0, x2
| 1:     ldxr    x5, [x0]
|        bic     x5, x5, x3
|        stxr    w4, x5, [x0]
|        cbnz    w4, 1b
|        ldr     x0, [x1, #8]
|        add     x0, x0, x3
|        str     w0, [x1, #8]
|        cbz     x0, 2f
|        ldr     x0, [x1, #8]
|        cbnz    x0, 3f
| 2:     bl      preempt_schedule_notrace
| 3:     ldp     x29, x30, [sp], #16
|        autiasp
|        ret
|
| <this_cpu_and_u32_zero>:
|        paciasp
|        stp     x29, x30, [sp, #-16]!
|        mrs     x1, sp_el0
|        mov     x29, sp
|        ldr     w2, [x1, #8]
|        add     w2, w2, #0x1
|        str     w2, [x1, #8]
|        mov     x3, #0xffffffff                 // #4294967295
|        mrs     x2, tpidr_el1
|        add     x0, x0, x2
| 1:     ldxr    x5, [x0]
|        bic     x5, x5, x3
|        stxr    w4, x5, [x0]
|        cbnz    w4, 1b
|        ldr     x0, [x1, #8]
|        sub     x0, x0, #0x1
|        str     w0, [x1, #8]
|        cbz     x0, 2f
|        ldr     x0, [x1, #8]
|        cbnz    x0, 3f
| 2:     bl      preempt_schedule_notrace
| 3:     ldp     x29, x30, [sp], #16
|        autiasp
|        ret
|
| <this_cpu_and_expr_zero>:
|        paciasp
|        stp     x29, x30, [sp, #-16]!
|        mrs     x1, sp_el0
|        mov     x29, sp
|        ldr     w2, [x1, #8]
|        add     w2, w2, #0x1
|        str     w2, [x1, #8]
|        mov     x3, #0xfffffffffffffffd         // #-3
|        mrs     x2, tpidr_el1
|        add     x0, x0, x2
| 1:     ldxr    x5, [x0]
|        bic     x5, x5, x3
|        stxr    w4, x5, [x0]
|        cbnz    w4, 1b
|        ldr     x0, [x1, #8]
|        sub     x0, x0, #0x1
|        str     w0, [x1, #8]
|        cbz     x0, 2f
|        ldr     x0, [x1, #8]
|        cbnz    x0, 3f
| 2:     bl      preempt_schedule_notrace
| 3:     ldp     x29, x30, [sp], #16
|        autiasp
|        ret

After this patch:

| <this_cpu_and_u64_zero>:
|        paciasp
|        stp     x29, x30, [sp, #-16]!
|        mrs     x1, sp_el0
|        mov     x29, sp
|        ldr     w2, [x1, #8]
|        add     w2, w2, #0x1
|        str     w2, [x1, #8]
|        mov     x3, #0xffffffffffffffff         // #-1
|        mrs     x2, tpidr_el1
|        add     x0, x0, x2
| 1:     ldxr    x5, [x0]
|        bic     x5, x5, x3
|        stxr    w4, x5, [x0]
|        cbnz    w4, 1b
|        ldr     x0, [x1, #8]
|        add     x0, x0, x3
|        str     w0, [x1, #8]
|        cbz     x0, 2f
|        ldr     x0, [x1, #8]
|        cbnz    x0, 3f
| 2:     bl      0 <preempt_schedule_notrace>
| 3:     ldp     x29, x30, [sp], #16
|        autiasp
|        ret
|
| <this_cpu_and_u32_zero>:
|        b       this_cpu_and_u64_zero
|
| <this_cpu_and_expr_zero>:
|        b       this_cpu_and_u64_zero
|
| <this_cpu_and_expr_zero_brackets>:
|        b       this_cpu_and_u64_zero

Fixes: 959bf2fd03b5 ("arm64: percpu: Rewrite per-cpu ops to allow use of LSE atomics")
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Acked-by: Christopher Lameter (Ampere) <cl@gentwo.org>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: James Morse <james.morse@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Yang Shi <yang@os.amperecomputing.com>
Cc: stable@vger.kernel.org
---
 arch/arm64/include/asm/percpu.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
index 63bbfd4944a37..31193bcf89a2b 100644
--- a/arch/arm64/include/asm/percpu.h
+++ b/arch/arm64/include/asm/percpu.h
@@ -206,13 +206,13 @@ PERCPU_RET_OP(add, add, ldadd)
 	_pcp_protect_return(__percpu_add_return_case_64, pcp, val)
 
 #define this_cpu_and_1(pcp, val)	\
-	_pcp_protect(__percpu_andnot_case_8, pcp, ~val)
+	_pcp_protect(__percpu_andnot_case_8, pcp, ~(u8)(val))
 #define this_cpu_and_2(pcp, val)	\
-	_pcp_protect(__percpu_andnot_case_16, pcp, ~val)
+	_pcp_protect(__percpu_andnot_case_16, pcp, ~(u16)(val))
 #define this_cpu_and_4(pcp, val)	\
-	_pcp_protect(__percpu_andnot_case_32, pcp, ~val)
+	_pcp_protect(__percpu_andnot_case_32, pcp, ~(u32)(val))
 #define this_cpu_and_8(pcp, val)	\
-	_pcp_protect(__percpu_andnot_case_64, pcp, ~val)
+	_pcp_protect(__percpu_andnot_case_64, pcp, ~(u64)(val))
 
 #define this_cpu_or_1(pcp, val)		\
 	_pcp_protect(__percpu_or_case_8, pcp, val)
-- 
2.30.2


