Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8825C79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 16:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MAGWXG3Ahq1mYkJfQDDBcTX3uMzi1AhbirDI8EReniI=; b=eGOYiehpLvzysq
	rJ/DWM+e6HZlMp38wJzQ0aowYPLlM6TrGVhaLRjPW93JtUU6rM7L09OkuxU4RhRfGKHtOpyhE0aWg
	6HuwVygYb98uIMvNXNHLoeoe+5vo3/pygo2CxNir/YBF96vKzc6+MYwFMu28oA0IQfkaynqF8IJQ8
	23DQUy66pmA+Vge8NTDSDZ5h1eGa0lML19TEVhfA8sEnitYSAA0IhTnxlGGftVzMRb4hpKQ3Huz/+
	6xkob044g58vQFOKJS+rUODlibLbbFsikk/9TJqs/0FmFtx84u5YpChv9R69Faq0c94tKeditos7q
	HphPYaEZwxho/onXfu9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XBe-00000002o44-2noC;
	Fri, 04 Sep 2026 16:54:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XBb-00000002o3M-1iqI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 16:54:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A2EC152B;
	Fri,  4 Sep 2026 09:54:38 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D65433F673;
	Fri,  4 Sep 2026 09:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788540882; bh=KFeNIBrLxZQpzLqw1ayvd3v5I1936Z3GzJgS3GkPOo0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bp1Qc9x1Y9v42Z0LcCy/WpelGFL5GNGAYDEfpsbJ+BDL8SBtTd1YCSFZKp69FTuzl
	 xaof4qNcSOS9n8+Hp/7VAy3a6f9bdD9c8FgjRKspTiWZJiRDFijcVsR+CbUZhkFbKI
	 t4b89OCHH6uh7EnxNT76IvTAVapJbGG22Ed5EPho=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 01/21] arm64: percpu: Fix this_cpu_write() casting
Date: Fri,  4 Sep 2026 17:54:04 +0100
Message-Id: <20260904165404.376821-1-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260904161758.376504-1-mark.rutland@arm.com>
References: <20260904161758.376504-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_095443_545150_FF938AEE 
X-CRM114-Status: GOOD (  12.13  )
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


