Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF8BC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 15:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MAGWXG3Ahq1mYkJfQDDBcTX3uMzi1AhbirDI8EReniI=; b=MPD977bjp9dj9r
	zf3S+Di6NMwvJtfa9gaO5CszHv0PU2g4o0VCo56640JDV6usjEXbH+45D4CaNLUI76MwYtOnLvpLH
	vFS/9/7Eqvm4A8xdI+mxorFyNyrROyH0cWGU4xCQhvZmwST8CjQ0csIQHgV0O0HoTEoT0BS3nWmv4
	oB6/bth94K8pMrE6Q9ys4XmnSF/W4lnxqo4VDFCB93my0kMVnfcHMeZhT7l10ee6oAhLAfgtmJcln
	muAq9UijyZBU3eIhHGJNh+DmzpwGd4XLlLQmUdtjdw0LokYla2rP8y91nYMmlT3mx0ZliM4qgZoIg
	UTpRsRvDqQ6E64XWQ79A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xaZ-00000009RaO-015Y;
	Tue, 08 Sep 2026 15:18:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xaW-00000009RZM-4An9
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 15:18:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=MAGWXG3Ahq1mYkJfQDDBcTX3uMzi1AhbirDI8EReniI=; b=FQDc9LwCF29Wtio4JkP/2/K+qB
	jURkSDVPhz2DArgNBmreK2yXBjaUdOGfrtlfFo+954FWzi6atHNL/xRtcnH9c+cwZykas29+d+PAd
	JNbuQHAuEwJrNLHYWMpJp5utvaQF7BBWWpVRS3xH9yWLrxFvgS0CSDq3CLmoSWKRJLckm/CX2iqQE
	mG9Swt1gaN/K+f+Ze4tqxocJVxALeV8sHLWYB/Ux/7+Ci4wq2Sh+DOVEjKafklzG+Q+bugOaVNk1E
	jy84bh8Dc7MaU6mlfBjRmaXqfhXHhAD/tNTMN+EAI0wOAX9Ls0FogqXOH6KBAQJo3Dqn/rKPJ8WEW
	yG4ynNmw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3xaS-000000000S4-1pNJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 15:18:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD6231476;
	Tue,  8 Sep 2026 08:18:10 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C8C553F7B4;
	Tue,  8 Sep 2026 08:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788880694; bh=KFeNIBrLxZQpzLqw1ayvd3v5I1936Z3GzJgS3GkPOo0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R7oI6VpNN6LRLBqIdsGcykYO3v48JEZ8JaDrY3aZE4lwh8gYhsVovm2FYyr/OYjYF
	 AOItoSOivGifvSoMf2Un1WMr1Uj5pXtqL58SGXGfy5enN04VlL6T7Wzz5ZhUZpmY57
	 rZrOTI2f51JuE0XdPIO8kD4QBKy9KbniRBV+1t70=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 01/21] arm64: percpu: Fix this_cpu_write() casting
Date: Tue,  8 Sep 2026 16:17:21 +0100
Message-Id: <20260908151741.394589-2-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260908151741.394589-1-mark.rutland@arm.com>
References: <20260908151741.394589-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_161816_907407_BBCAB918 
X-CRM114-Status: GOOD (  12.07  )
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

The arm64 implementation of this_cpu_write() casts 'val' to unsigned
long. This is necessary to handle cases where 'val' is a pointer type,
and to avoid spurious compiler warnings for the (unreachable!) cases
where the pointer type would be cast to a smaller integer type.

Unfortunately, the cast is applied to 'val' rather than '(val)', which
won't always generate the expected value when 'val' is an expression.

For example, for this_cpu_write(pcp, zero - 1), where 'pcp' is a u64 and
'zero' is a u32:

* 'zero'                      ===> (u32) 0x00000000
* 'zero - 1'                  ===> (u32) 0xffffffff
* '(unsigned long)zero - 1'   ===> (u64) 0xffffffffffffffff
* '(unsigned long)(zero - 1)' ===> (u64) 0x00000000ffffffff

Fix this by adding brackets around 'val'

The bug described above can be seen from the disassembly of the
following test code:

| void this_cpu_write_zero_minus_1(u64 __percpu *pcp)
| {
| 	u32 zero = 0;
| 	this_cpu_write(*pcp, zero - 1);
| }
|
| void this_cpu_write_zero_minus_1_brackets(u64 __percpu *pcp)
| {
| 	u32 zero = 0;
| 	this_cpu_write(*pcp, (zero - 1));
| }

Generated code before this patch:

| <this_cpu_write_zero_minus_1>:
|        paciasp
|        stp     x29, x30, [sp, #-16]!
|        mrs     x1, sp_el0
|        mov     x29, sp
|        ldr     w2, [x1, #8]
|        add     w2, w2, #0x1
|        str     w2, [x1, #8]
|        mov     x3, #0xffffffffffffffff
|        mrs     x2, tpidr_el1
|        str     x3, [x0, x2]
|        ldr     x0, [x1, #8]
|        add     x0, x0, x3
|        str     w0, [x1, #8]
|        cbz     x0, 1f
|        ldr     x0, [x1, #8]
|        cbnz    x0, 2f
| 1:     bl      preempt_schedule_notrace
| 2:     ldp     x29, x30, [sp], #16
|        autiasp
|        ret
|
| <this_cpu_write_zero_minus_1_brackets>:
|        paciasp
|        stp     x29, x30, [sp, #-16]!
|        mrs     x1, sp_el0
|        mov     x29, sp
|        ldr     w2, [x1, #8]
|        add     w2, w2, #0x1
|        str     w2, [x1, #8]
|        mov     x3, #0xffffffff
|        mrs     x2, tpidr_el1
|        str     x3, [x0, x2]
|        ldr     x0, [x1, #8]
|        sub     x0, x0, #0x1
|        str     w0, [x1, #8]
|        cbz     x0, 1f
|        ldr     x0, [x1, #8]
|        cbnz    x0, 2f
| 1:     bl      preempt_schedule_notrace
| 2:     ldp     x29, x30, [sp], #16
|        autiasp
|        ret

Generated code after this patch:

| <this_cpu_write_zero_minus_1>:
|        paciasp
|        stp     x29, x30, [sp, #-16]!
|        mrs     x1, sp_el0
|        mov     x29, sp
|        ldr     w2, [x1, #8]
|        add     w2, w2, #0x1
|        str     w2, [x1, #8]
|        mov     x3, #0xffffffff
|        mrs     x2, tpidr_el1
|        str     x3, [x0, x2]
|        ldr     x0, [x1, #8]
|        sub     x0, x0, #0x1
|        str     w0, [x1, #8]
|        cbz     x0, 1f
|        ldr     x0, [x1, #8]
|        cbnz    x0, 2f
| 1:     bl      preempt_schedule_notrace
| 2:     ldp     x29, x30, [sp], #16
|        autiasp
|        ret
|
| <this_cpu_write_zero_minus_1_brackets>:
|        b       this_cpu_write_zero_minus_1

Fixes: 959bf2fd03b5 ("arm64: percpu: Rewrite per-cpu ops to allow use of LSE atomics")
Reported-by: David Laight <david.laight.linux@gmail.com>
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: David Laight <david.laight.linux@gmail.com>
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
index b57b2bb009677..63bbfd4944a37 100644
--- a/arch/arm64/include/asm/percpu.h
+++ b/arch/arm64/include/asm/percpu.h
@@ -179,13 +179,13 @@ PERCPU_RET_OP(add, add, ldadd)
 	_pcp_protect_return(__percpu_read_64, pcp)
 
 #define this_cpu_write_1(pcp, val)	\
-	_pcp_protect(__percpu_write_8, pcp, (unsigned long)val)
+	_pcp_protect(__percpu_write_8, pcp, (unsigned long)(val))
 #define this_cpu_write_2(pcp, val)	\
-	_pcp_protect(__percpu_write_16, pcp, (unsigned long)val)
+	_pcp_protect(__percpu_write_16, pcp, (unsigned long)(val))
 #define this_cpu_write_4(pcp, val)	\
-	_pcp_protect(__percpu_write_32, pcp, (unsigned long)val)
+	_pcp_protect(__percpu_write_32, pcp, (unsigned long)(val))
 #define this_cpu_write_8(pcp, val)	\
-	_pcp_protect(__percpu_write_64, pcp, (unsigned long)val)
+	_pcp_protect(__percpu_write_64, pcp, (unsigned long)(val))
 
 #define this_cpu_add_1(pcp, val)	\
 	_pcp_protect(__percpu_add_case_8, pcp, val)
-- 
2.30.2


