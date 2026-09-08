Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14E8C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 15:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mCGI4PWraToF0kS5mdW0qzNHE/i0AiL9333WpI56GTc=; b=ivTEeYFvzu6Nms
	raQX7wYHB18Vr+JHwp4/ghVZ1Y6lvCJXt3tAzW1TAfC9tOJhEwJxmo9Bseob4WcBtw7pzhts55fWN
	pyItSaXOOesMkA3U9F3amcJ1HPg6F7WZI8WrPsJLJw+sgUiLhcJZtEq7dxKEO6UeCcPceUbdC1xHN
	lkcq1U72FrIUJ0DDIkv7IrIe4jda3caz8D+Rbf4gfkbbLPtD3NSLFPqUKT/qAS6+r+t5uXUHlET0G
	AQj+npSvtsD13pHPPoAini8V3fkpm8gihx+V9L8vB15Z1eIdGdbc/Tphe8637xv/STIq8Vu82mW5M
	/fXXdzeG07LvwkNrdfAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xfL-00000009T0v-1FvT;
	Tue, 08 Sep 2026 15:23:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xfK-00000009T0J-1krL
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 15:23:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=mCGI4PWraToF0kS5mdW0qzNHE/i0AiL9333WpI56GTc=; b=XXQ1Fx05f7QcdPWmgE/119cX6Q
	4Fs4goEUrZj12oExWBFaFVeZ+DO/Q9Yu9i5nitJouYbjUB9+Oz0T+xQUptVU3ga7X8xCTlKjffj/U
	O2HGWTy4UkWQdBLOxLFvQxQA2m70/DecIufhjVWq/XLQJ9Gs4jaJMjTfzLLKwbqiThVDsLZ+4RpmB
	TtejNhpdm3MYxe3mJgZExaOZRmaZ/mgDv+rAwbTJbAYbwyjS3XIREQBThsFdpTQ1CKFB/9MEiKU0i
	njo/R3hNavLPJ0WG+X5TezDqo3oHThOwBTU+0l9xyJ7W6v8/RqlaqYOj/N+gBxiW2vPGwHXMTq955
	Lrk+H1pA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3xfH-000000000sN-01D7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 15:23:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD0701CC4;
	Tue,  8 Sep 2026 08:23:09 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B992E3F7B4;
	Tue,  8 Sep 2026 08:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788880993; bh=Vs9u8mzEXViD8Vv/CNdwO/SfW5bYcOi6Omyxf47fU7M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CFqzp/yYDljxrShd5sx2/qimoAV5lly7MGeRwuSOpuY+uPB0lNstJ+PwCA+IyfkuC
	 MAjabA1D4j4b3Q1EEsKp0zPgYFed5awBP7SmP6eZqTDD5IXTZFed9jdl6xz+RUIPTg
	 t7RK+mfRsWfHp7xtV0uAu8dihwuLBDfToZVrn4JA=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 15/21] arm64: percpu: Implement preemptible read/write ops
Date: Tue,  8 Sep 2026 16:17:35 +0100
Message-Id: <20260908151741.394589-16-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260908151741.394589-1-mark.rutland@arm.com>
References: <20260908151741.394589-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_162315_368693_47E29026 
X-CRM114-Status: GOOD (  10.64  )
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

Use the PCPU GPR infrastructure to implement preemptible this_cpu_read()
and this_cpu_write().

This change means that this_cpu_read() will always use a plain LDR, even
in LTO configurations where READ_ONCE() will use LDA[P]R. Using plain
LDR is preferable, given that the rationale for using LDA[P]R in
READ_ONCE() was to retain address dependencies against values written by
other CPUs, which isn't expected usage for this_cpu_read(). Using plain
LDR will enforce fewer ordering constraints.

Test case:

| void outline_this_cpu_write_u64(u64 __percpu *p, u64 v)
| {
| 	this_cpu_write(*p, v);
| }

Generated code before this patch (v7.2-rc4):

| <outline_this_cpu_write_u64>:
|        paciasp
|        stp     x29, x30, [sp, #-16]!
|        mrs     x2, sp_el0
|        mov     x29, sp
|        ldr     w3, [x2, #8]
|        add     w3, w3, #0x1
|        str     w3, [x2, #8]
|        mrs     x3, tpidr_el1
|        str     x1, [x0, x3]
|        ldr     x0, [x2, #8]
|        sub     x0, x0, #0x1
|        str     w0, [x2, #8]
|        cbz     x0, 1f
|        ldr     x0, [x2, #8]
|        cbnz    x0, 2f
| 1:     bl      preempt_schedule_notrace
| 2:     ldp     x29, x30, [sp], #16
|        autiasp
|        ret

Generated code after this patch:

| <outline_this_cpu_write_u64>:
|        mrs     x2, sp_el0
|        mov     w3, #0x7c60
|        strh    w3, [x2, #20]
|        mrs     x3, tpidr_el1
|        str     x1, [x0, x3]
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
 arch/arm64/include/asm/percpu.h | 79 ++++++++++++++++++++++++---------
 1 file changed, 58 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
index 03fa916030fd1..984f69846cc09 100644
--- a/arch/arm64/include/asm/percpu.h
+++ b/arch/arm64/include/asm/percpu.h
@@ -128,15 +128,42 @@ static inline unsigned long __kern_my_cpu_offset(void)
 #define __my_cpu_offset __kern_my_cpu_offset()
 #endif
 
-#define PERCPU_RW_OPS(sz)						\
-static inline unsigned long __percpu_read_##sz(void *ptr)		\
-{									\
-	return READ_ONCE(*(u##sz *)ptr);				\
-}									\
-									\
-static inline void __percpu_write_##sz(void *ptr, unsigned long val)	\
-{									\
-	WRITE_ONCE(*(u##sz *)ptr, (u##sz)val);				\
+#define PERCPU_RW_OPS(w, sfx, sz)						\
+static inline unsigned long __percpu_read_##sz(void __percpu *pcp)		\
+{										\
+	u16 *gprs = &current_thread_info()->pcpu_gprs;				\
+	unsigned long off;							\
+	unsigned long val;							\
+										\
+	asm volatile(								\
+	__PCPU_GPRS_BEGIN_OFFSET("%[gprs]", "%[pcp]", "%[off]")			\
+	"	ldr" #sfx "\t%" #w "[val], [%[pcp], %[off]]\n"			\
+	__PCPU_GPRS_END("%[gprs]")						\
+	: [gprs] "=Qo" (*gprs),							\
+	  [off] "=&r" (off),							\
+	  [val] "=&r" (val)							\
+	: [pcp] "r" (pcp)							\
+	: "memory"								\
+	);									\
+										\
+	return val;								\
+}										\
+										\
+static inline void __percpu_write_##sz(void __percpu *pcp, unsigned long val)	\
+{										\
+	u16 *gprs = &current_thread_info()->pcpu_gprs;				\
+	unsigned long off;							\
+										\
+	asm volatile(								\
+	__PCPU_GPRS_BEGIN_OFFSET("%[gprs]", "%[pcp]", "%[off]")			\
+	"	str" #sfx "\t%" #w "[val], [%[pcp], %[off]]\n"			\
+	__PCPU_GPRS_END("%[gprs]")						\
+	: [gprs] "=Qo" (*gprs),							\
+	  [off] "=&r" (off)							\
+	: [pcp] "r" (pcp),							\
+	  [val] "r" ((u##sz)val)						\
+	: "memory"								\
+	);									\
 }
 
 #define __PERCPU_OP_CASE(w, sfx, name, sz, op_llsc, op_lse)		\
@@ -196,10 +223,10 @@ __percpu_##name##_return_case_##sz(void *ptr, unsigned long val)	\
 	__PERCPU_RET_OP_CASE(w,  , name, 32, op_llsc, op_lse)		\
 	__PERCPU_RET_OP_CASE( ,  , name, 64, op_llsc, op_lse)
 
-PERCPU_RW_OPS(8)
-PERCPU_RW_OPS(16)
-PERCPU_RW_OPS(32)
-PERCPU_RW_OPS(64)
+PERCPU_RW_OPS(w, b, 8)
+PERCPU_RW_OPS(w, h, 16)
+PERCPU_RW_OPS(w,  , 32)
+PERCPU_RW_OPS( ,  , 64)
 
 /*
  * Use value-returning atomics for CPU-local ops as they are more likely
@@ -245,23 +272,33 @@ PERCPU_RET_OP(add, add, ldadd)
 	__retval;							\
 })
 
+#define _pcp_wrap(op, pcp, ...)						\
+({									\
+	op(&(pcp), __VA_ARGS__);					\
+})
+
+#define _pcp_wrap_return(op, pcp, args...)				\
+({									\
+	(typeof(pcp))op(&(pcp), ##args);				\
+})
+
 #define this_cpu_read_1(pcp)		\
-	_pcp_protect_return(__percpu_read_8, pcp)
+	_pcp_wrap_return(__percpu_read_8, pcp)
 #define this_cpu_read_2(pcp)		\
-	_pcp_protect_return(__percpu_read_16, pcp)
+	_pcp_wrap_return(__percpu_read_16, pcp)
 #define this_cpu_read_4(pcp)		\
-	_pcp_protect_return(__percpu_read_32, pcp)
+	_pcp_wrap_return(__percpu_read_32, pcp)
 #define this_cpu_read_8(pcp)		\
-	_pcp_protect_return(__percpu_read_64, pcp)
+	_pcp_wrap_return(__percpu_read_64, pcp)
 
 #define this_cpu_write_1(pcp, val)	\
-	_pcp_protect(__percpu_write_8, pcp, (unsigned long)(val))
+	_pcp_wrap(__percpu_write_8, pcp, (unsigned long)(val))
 #define this_cpu_write_2(pcp, val)	\
-	_pcp_protect(__percpu_write_16, pcp, (unsigned long)(val))
+	_pcp_wrap(__percpu_write_16, pcp, (unsigned long)(val))
 #define this_cpu_write_4(pcp, val)	\
-	_pcp_protect(__percpu_write_32, pcp, (unsigned long)(val))
+	_pcp_wrap(__percpu_write_32, pcp, (unsigned long)(val))
 #define this_cpu_write_8(pcp, val)	\
-	_pcp_protect(__percpu_write_64, pcp, (unsigned long)(val))
+	_pcp_wrap(__percpu_write_64, pcp, (unsigned long)(val))
 
 #define this_cpu_add_1(pcp, val)	\
 	_pcp_protect(__percpu_add_case_8, pcp, val)
-- 
2.30.2


