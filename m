Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE5AF588E9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 15:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ajfQUwGSQAvlo8GAPRafi2qaUj13iHRN9Ryci1MykkM=; b=YnCWfxbsxp7xuIC4VLUQAu7cwi
	TxQiGlqHiS0szthZJaEEdx817iThtDlTXYCZnVoP6Kw4sfKfjhZIrzvlY7HrXGF/Pn55wtNsxFgBx
	kFi67tb0Xy/mT5ImNiCxblRaK9u+FFziRTqxILECSECIaAFYkdue8tludz2rCoAdQ6QqDzWo+zOJd
	Vfnqeam+C46gSHUugngTHFYpQWHJoePb06WA+Cj4umUWKNWsulX0v7Y3uuPCcaVdkttPr9xDVcWoy
	I4vX43OkLDzIQ8aR+jIKJRyPuP1BzJAxPSC6ghQ0BGqgUykyjileKPy1KLvGxvKCbHYw4qjU9GL6x
	1JIvlR4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEqg1-00000007K5R-1U2u;
	Mon, 20 Apr 2026 15:36:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEqfy-00000007K3Y-0b7P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 15:36:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9A83A4452C;
	Mon, 20 Apr 2026 15:36:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50381C19425;
	Mon, 20 Apr 2026 15:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776699401;
	bh=cyXUIm1fscacF+r/3RwBlsGAeBy9drC6xZZK3OfXakg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EvpA/W6VzFmOy+iJQyZuRB7parrYzJPATQpPEQTkBngeE+S8V4XLc3KYEW+VGtjEP
	 4PewB70fRglhhAyPMOcOfNiLSYNHbo5anyOy3sh88FaxlvV9B9HUFbMPGKbaJMNDNg
	 mNef1IHPIgiOcwqJiyP9Bsb8CP5mGdbqA8j373MhuMlaRLzOFpB/3a8XoMMFV7PaaL
	 rtM/tWnCBokqjpY0ev4QMJJWQdsqXtBy2nEB6XeCMbj8mpfRN6RrFpn2OcbFZzgvY5
	 FasaLW6PuJV2WtGzcpjHfUmqrl6Vwh05o7haD9qkb0wuRIrvSwh4pSgDyheBqZ7ZYZ
	 Y3ipL6dMZ8TTQ==
From: Puranjay Mohan <puranjay@kernel.org>
To: bpf@vger.kernel.org
Cc: Puranjay Mohan <puranjay@kernel.org>,
	"Alexei Starovoitov" <ast@kernel.org>,
	"Daniel Borkmann" <daniel@iogearbox.net>,
	"Andrii Nakryiko" <andrii@kernel.org>,
	"Martin KaFai Lau" <martin.lau@linux.dev>,
	"Eduard Zingerman" <eddyz87@gmail.com>,
	"Kumar Kartikeya Dwivedi" <memxor@gmail.com>,
	"Song Liu" <song@kernel.org>,
	"Yonghong Song" <yonghong.song@linux.dev>,
	"Xu Kuohai" <xukuohai@huaweicloud.com>,
	"Catalin Marinas" <catalin.marinas@arm.com>,
	"Will Deacon" <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH bpf-next 1/3] bpf, arm64: Map BPF_REG_0 to x8 instead of x7
Date: Mon, 20 Apr 2026 08:35:59 -0700
Message-ID: <20260420153603.4097618-2-puranjay@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260420153603.4097618-1-puranjay@kernel.org>
References: <20260420153603.4097618-1-puranjay@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_083642_221873_1D3B03BC 
X-CRM114-Status: GOOD (  15.02  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Move the BPF return value register from x7 to x8, freeing x7 for use
as an argument register. AAPCS64 designates x8 as the indirect result
location register; it is caller-saved and not used for argument
passing, making it a suitable home for BPF_REG_0.

This is a prerequisite for stack argument support, which needs x5-x7
to pass arguments 6-8 to native kfuncs following the AAPCS64 calling
convention.

Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
---
 arch/arm64/net/bpf_jit_comp.c                          |  4 ++--
 arch/arm64/net/bpf_timed_may_goto.S                    |  8 ++++----
 .../testing/selftests/bpf/progs/verifier_jit_inline.c  |  2 +-
 tools/testing/selftests/bpf/progs/verifier_ldsx.c      |  6 +++---
 .../selftests/bpf/progs/verifier_private_stack.c       | 10 +++++-----
 5 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index 0816c40fc7af..085e650662e3 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -47,7 +47,7 @@
 /* Map BPF registers to A64 registers */
 static const int bpf2a64[] = {
 	/* return value from in-kernel function, and exit value from eBPF */
-	[BPF_REG_0] = A64_R(7),
+	[BPF_REG_0] = A64_R(8),
 	/* arguments from eBPF program to in-kernel function */
 	[BPF_REG_1] = A64_R(0),
 	[BPF_REG_2] = A64_R(1),
@@ -1048,7 +1048,7 @@ static void build_epilogue(struct jit_ctx *ctx, bool was_classic)
 	/* Restore FP/LR registers */
 	emit(A64_POP(A64_FP, A64_LR, A64_SP), ctx);
 
-	/* Move the return value from bpf:r0 (aka x7) to x0 */
+	/* Move the return value from bpf:r0 (aka x8) to x0 */
 	emit(A64_MOV(1, A64_R(0), r0), ctx);
 
 	/* Authenticate lr */
diff --git a/arch/arm64/net/bpf_timed_may_goto.S b/arch/arm64/net/bpf_timed_may_goto.S
index 894cfcd7b241..a9a802711a7f 100644
--- a/arch/arm64/net/bpf_timed_may_goto.S
+++ b/arch/arm64/net/bpf_timed_may_goto.S
@@ -8,8 +8,8 @@ SYM_FUNC_START(arch_bpf_timed_may_goto)
 	stp     x29, x30, [sp, #-64]!
 	mov     x29, sp
 
-	/* Save BPF registers R0 - R5 (x7, x0-x4)*/
-	stp	x7, x0, [sp, #16]
+	/* Save BPF registers R0 - R5 (x8, x0-x4)*/
+	stp	x8, x0, [sp, #16]
 	stp	x1, x2, [sp, #32]
 	stp	x3, x4, [sp, #48]
 
@@ -28,8 +28,8 @@ SYM_FUNC_START(arch_bpf_timed_may_goto)
 	/* BPF_REG_AX(x9) will be stored into count, so move return value to it. */
 	mov	x9, x0
 
-	/* Restore BPF registers R0 - R5 (x7, x0-x4) */
-	ldp	x7, x0, [sp, #16]
+	/* Restore BPF registers R0 - R5 (x8, x0-x4) */
+	ldp	x8, x0, [sp, #16]
 	ldp	x1, x2, [sp, #32]
 	ldp	x3, x4, [sp, #48]
 
diff --git a/tools/testing/selftests/bpf/progs/verifier_jit_inline.c b/tools/testing/selftests/bpf/progs/verifier_jit_inline.c
index 4ea254063646..885ff69a3a62 100644
--- a/tools/testing/selftests/bpf/progs/verifier_jit_inline.c
+++ b/tools/testing/selftests/bpf/progs/verifier_jit_inline.c
@@ -9,7 +9,7 @@ __success __retval(0)
 __arch_x86_64
 __jited("	addq	%gs:{{.*}}, %rax")
 __arch_arm64
-__jited("	mrs	x7, SP_EL0")
+__jited("	mrs	x8, SP_EL0")
 int inline_bpf_get_current_task(void)
 {
 	bpf_get_current_task();
diff --git a/tools/testing/selftests/bpf/progs/verifier_ldsx.c b/tools/testing/selftests/bpf/progs/verifier_ldsx.c
index c8494b682c31..c814e82a7242 100644
--- a/tools/testing/selftests/bpf/progs/verifier_ldsx.c
+++ b/tools/testing/selftests/bpf/progs/verifier_ldsx.c
@@ -274,11 +274,11 @@ __jited("movslq	0x10(%rdi,%r12), %r15")
 __jited("movswq	0x18(%rdi,%r12), %r15")
 __jited("movsbq	0x20(%rdi,%r12), %r15")
 __arch_arm64
-__jited("add	x11, x7, x28")
+__jited("add	x11, x8, x28")
 __jited("ldrsw	x21, [x11, #0x10]")
-__jited("add	x11, x7, x28")
+__jited("add	x11, x8, x28")
 __jited("ldrsh	x21, [x11, #0x18]")
-__jited("add	x11, x7, x28")
+__jited("add	x11, x8, x28")
 __jited("ldrsb	x21, [x11, #0x20]")
 __jited("add	x11, x0, x28")
 __jited("ldrsw	x22, [x11, #0x10]")
diff --git a/tools/testing/selftests/bpf/progs/verifier_private_stack.c b/tools/testing/selftests/bpf/progs/verifier_private_stack.c
index 646e8ef82051..c5078face38d 100644
--- a/tools/testing/selftests/bpf/progs/verifier_private_stack.c
+++ b/tools/testing/selftests/bpf/progs/verifier_private_stack.c
@@ -170,12 +170,12 @@ __jited("	mrs	x10, TPIDR_EL{{[0-1]}}")
 __jited("	add	x27, x27, x10")
 __jited("	add	x25, x27, {{.*}}")
 __jited("	bl	0x{{.*}}")
-__jited("	mov	x7, x0")
+__jited("	mov	x8, x0")
 __jited("	mov	x0, #0x2a")
 __jited("	str	x0, [x27]")
 __jited("	bl	0x{{.*}}")
-__jited("	mov	x7, x0")
-__jited("	mov	x7, #0x0")
+__jited("	mov	x8, x0")
+__jited("	mov	x8, #0x0")
 __jited("	ldp	x25, x27, [sp], {{.*}}")
 __naked void private_stack_callback(void)
 {
@@ -220,7 +220,7 @@ __jited("	mov	x0, #0x2a")
 __jited("	str	x0, [x27]")
 __jited("	mov	x0, #0x0")
 __jited("	bl	0x{{.*}}")
-__jited("	mov	x7, x0")
+__jited("	mov	x8, x0")
 __jited("	ldp	x27, x28, [sp], #0x10")
 int private_stack_exception_main_prog(void)
 {
@@ -258,7 +258,7 @@ __jited("	add	x25, x27, {{.*}}")
 __jited("	mov	x0, #0x2a")
 __jited("	str	x0, [x27]")
 __jited("	bl	0x{{.*}}")
-__jited("	mov	x7, x0")
+__jited("	mov	x8, x0")
 __jited("	ldp	x27, x28, [sp], #0x10")
 int private_stack_exception_sub_prog(void)
 {
-- 
2.52.0


