Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06954C79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 16:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dDSBBx3Hv27oWPrcg3hzUVurDCr6UZtKfBMnc1F8Aas=; b=GWjSKpk2Nf9ZnP
	69r8ojUsLM7wJq9S478702RzSduS6SQ9KqtRQucaWfLDnhMGlihmggFXyIyQSynJQNz401au2q1wd
	6Oe/aO2Q4U09pIfTQgYHaPb1OhENOceWPbYzE7x04aD9qQq/aFxjYjvChv+DnQ5KBJwG0dOtzDjjv
	dK6KDMpxEd05cTMkCNQba5KpUZJnyAf2DouGE/G8l7Zs/lRFPz+aBQnAsKK6lwItqtI0PzBl++bHY
	8j4tDByQ08L4P1/Tk5thmwRC6norpkDT5iQEiMb3qS1ag7lLaFEUAU2Z/Z8aKVn7/fUDKVTmd/8Ay
	BdskmnfOZIhHXftrV1nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Wch-00000002h40-2UBf;
	Fri, 04 Sep 2026 16:18:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Wcf-00000002h3S-1Rmz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 16:18:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDD4E152B;
	Fri,  4 Sep 2026 09:18:31 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 951143FB7F;
	Fri,  4 Sep 2026 09:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788538715; bh=VNTopBOMSkbcm9JObmGqJlQAEJJ4Esr4E5Inmoq7/1A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FnElP0XC/Lud9MIzr6OOcRyDIulmEImgxyNGRQpXnKCWyBPRz0FY6RkwT9wIiDI22
	 2GCgirH2Y+Se8pYXG99OcBgFochdX/us/Mg2eygivxq4J3kk9x3cOWPzbLpDxBnX4R
	 Y8PDF2A5Xik9DKwuqCMjp4joWDf/XqvqaDTg1ZJM=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 03/21] arm64: percpu: Fix LSE operations on {8,16}-bit types
Date: Fri,  4 Sep 2026 17:17:40 +0100
Message-Id: <20260904161758.376504-4-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260904161758.376504-1-mark.rutland@arm.com>
References: <20260904161758.376504-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_091837_461940_43EA3F5A 
X-CRM114-Status: GOOD (  13.68  )
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

The assembly for __percpu_##name##_case_##sz() and
__percpu_##name##_return_case_##sz() doesn't use the 'sfx' macro
argument to form the LSE instruction. Without 'sfx', a W register
argument will imply a 32-bit memory location, and consequently
{8,16}-bit ops will erroneously read and write 32 bits of memory when
the LSE instruction is used.

Fix this by appending 'sfx' to 'op_lse' to LSE instruction. It is not
necessary (and not valid) to append 'sfx' to 'op_llsc', as 'op_llsc' is
a register-register operation which does not access memory (and does not
take a size suffix).

Test case:

| void outline_this_cpu_add_u8(u8 __percpu *p, u8 v)
| {
| 	this_cpu_add(*p, v);
| }

Generated inline code (same before and after this patch):

| <outline_this_cpu_add_u8>:
|        paciasp
|        stp     x29, x30, [sp, #-16]!
|        mrs     x2, sp_el0
|        mov     x29, sp
|        ldr     w3, [x2, #8]
|        add     w3, w3, #0x1
|        str     w3, [x2, #8]
|        mrs     x3, tpidr_el1
|        add     x0, x0, x3
| 1:     ldxrb   w5, [x0]        // <----------------
|        add     w5, w5, w1      // LL/SC alternative
|        stxrb   w4, w5, [x0]    // instructions here
|        cbnz    w4, 1b          // <----------------
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

Generated LSE alternative before this patch:

|        ldadd   w1, w5, [x0]    // 32-bit LDADD
|        nop
|        nop
|        nop

Generated LSE alternative after this patch:

|        ldaddb  w1, w5, [x0]    // 8-bit LDADDB
|        nop
|        nop
|        nop

Fixes: 959bf2fd03b5 ("arm64: percpu: Rewrite per-cpu ops to allow use of LSE atomics")
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
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
Cc: stable@vger.kernel.org
---
 arch/arm64/include/asm/percpu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
index 31193bcf89a2b..8cf4068ce1b56 100644
--- a/arch/arm64/include/asm/percpu.h
+++ b/arch/arm64/include/asm/percpu.h
@@ -77,7 +77,7 @@ __percpu_##name##_case_##sz(void *ptr, unsigned long val)		\
 	"	stxr" #sfx "\t%w[loop], %" #w "[tmp], %[ptr]\n"		\
 	"	cbnz	%w[loop], 1b",					\
 	/* LSE atomics */						\
-		#op_lse "\t%" #w "[val], %" #w "[tmp], %[ptr]\n"	\
+		#op_lse #sfx "\t%" #w "[val], %" #w "[tmp], %[ptr]\n"	\
 		__nops(3))						\
 	: [loop] "=&r" (loop), [tmp] "=&r" (tmp),			\
 	  [ptr] "+Q"(*(u##sz *)ptr)					\
@@ -98,7 +98,7 @@ __percpu_##name##_return_case_##sz(void *ptr, unsigned long val)	\
 	"	stxr" #sfx "\t%w[loop], %" #w "[ret], %[ptr]\n"		\
 	"	cbnz	%w[loop], 1b",					\
 	/* LSE atomics */						\
-		#op_lse "\t%" #w "[val], %" #w "[ret], %[ptr]\n"	\
+		#op_lse #sfx "\t%" #w "[val], %" #w "[ret], %[ptr]\n"	\
 		#op_llsc "\t%" #w "[ret], %" #w "[ret], %" #w "[val]\n"	\
 		__nops(2))						\
 	: [loop] "=&r" (loop), [ret] "=&r" (ret),			\
-- 
2.30.2


