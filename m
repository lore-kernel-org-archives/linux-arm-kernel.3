Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2DD6CD6E6E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 20:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UoqSqntIzj8Teup4Ktkq7Hy+tOt6BUYqG7fRFULwZGI=; b=DVIqfJmNM1xBamPYVNmQDrh6zY
	yyhOtSpcV4nJbkZd0XJIN/MDZnWJO30HwyFA19Kipb8WLuNrMuPZupFnX4mjHnfIH2xsvhlA6wnW0
	0SwPYqj2aF0mzzPbnj7gR/GeXrtEV9Y4ihJDuA8JrSUtw35NSldDdpXbz8gho6ZYq+E2WHmr8R1RZ
	QJhqldeLsvFbr+j32N/9XDFQ04XhHXszdYqkzJT1C4ogp5TUBLhyHgtHKgvSVABtoKVe01MAAJV3f
	Aw/8IQ3U9jxNw14ybZKOZxYtV/MLXtad4uRcS/jtX9zHI0DRkTxzWTv2Z70n7BtuygiD2/Bic6/RO
	CTgovMCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVEaW-0000000HGLj-3d4D;
	Thu, 04 Jun 2026 20:22:48 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVEaS-0000000HGHh-3K2R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 20:22:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 70D3DC63455;
	Thu,  4 Jun 2026 20:22:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 14D1F5FED1;
	Thu,  4 Jun 2026 20:22:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B7E44106A1D2E;
	Thu,  4 Jun 2026 22:22:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780604561; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UoqSqntIzj8Teup4Ktkq7Hy+tOt6BUYqG7fRFULwZGI=;
	b=SDLnofRdJQjkWpFQ6LGyaG2sZP86FbyHIls5X2QUP/GRqr01kMjATXSEiWElfffb9fHpHO
	SqLnK5hi9Q0E4KWiVd7iND83r6UBBXhxoxFKxp4a8IWFec5dnraufsGFdUHfBVMl/Qk3sh
	eAh/CxqaHu6M2u7ZtRd55oDSOzTUCIJx9Uiha+AE8Ru11L67+DVHUyDHqS0ePUtAt/pblU
	Hy3P8O2m1WTPdbi2ePIcGbLurB1oyRXStQWk+VwZg9mJT/FYFzjeSUCzJkefdiOQh/x73i
	dFJoDeSktVCsoQ3SeQ19KNc21/3/EpBVTbkKciVVtEG9XzRrrNN6WctnVsqY8A==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Date: Thu, 04 Jun 2026 22:22:03 +0200
Subject: [PATCH bpf-next v2 5/8] bpf, x86: emit KASAN checks into x86 JITed
 programs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260604-kasan-v2-5-c066e627fda8@bootlin.com>
References: <20260604-kasan-v2-0-c066e627fda8@bootlin.com>
In-Reply-To: <20260604-kasan-v2-0-c066e627fda8@bootlin.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Shuah Khan <shuah@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: ebpf@linuxfoundation.org, 
 Bastien Curutchet <bastien.curutchet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, bpf@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_132244_998060_BEEA4087 
X-CRM114-Status: GOOD (  14.72  )
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

Insert KASAN shadow memory checks before memory load and store
operations in JIT-compiled BPF programs. This helps detect memory safety
bugs such as use-after-free and out-of-bounds accesses at runtime.

The main instructions being targeted are BPF_ST, BPF_STX and BPF_LDX,
but not all of them are being instrumented:
- if the load/store instruction is in fact accessing the program stack,
  emit_kasan_check silently skips the instrumentation, as we already
  have page guards to monitor stack accesses.
- if the load/store instruction is a BPF_PROBE_MEM or a BPF_PROBE_ATOMIC
  instruction, we do not instrument it, as the passed address can fault
  (hence the custom fault management with BPF_PROBE_XXX instructions),
  and so the corresponding kasan check could fault as well.

Signed-off-by: Alexis Lothoré (eBPF Foundation) <alexis.lothore@bootlin.com>
---
Changes in v2:
- support BPF_ATOMICS
- support BPF_ST
- make sure to systematically pass correct instruction to kasan check
---
 arch/x86/net/bpf_jit_comp.c | 63 ++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 53 insertions(+), 10 deletions(-)

diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
index 943a0f315cf2..cb3c03edc4bd 100644
--- a/arch/x86/net/bpf_jit_comp.c
+++ b/arch/x86/net/bpf_jit_comp.c
@@ -1516,17 +1516,30 @@ static int emit_atomic_rmw_index(u8 **pprog, u32 atomic_op, u32 size,
 	return 0;
 }
 
-static int emit_atomic_ld_st(u8 **pprog, u32 atomic_op, u32 dst_reg,
-			     u32 src_reg, s16 off, u8 bpf_size)
+static int emit_atomic_ld_st(u8 **pprog, struct bpf_insn *insn, u8 *ip,
+			     u32 dst_reg, u32 src_reg, bool accesses_stack_only)
 {
+	u32 atomic_op = insn->imm;
+	int err;
+
 	switch (atomic_op) {
 	case BPF_LOAD_ACQ:
+		err = emit_kasan_check(pprog, src_reg, insn, ip, false,
+				       accesses_stack_only);
+		if (err)
+			return err;
 		/* dst_reg = smp_load_acquire(src_reg + off16) */
-		emit_ldx(pprog, bpf_size, dst_reg, src_reg, off);
+		emit_ldx(pprog, BPF_SIZE(insn->code), dst_reg, src_reg,
+			 insn->off);
 		break;
 	case BPF_STORE_REL:
+		err = emit_kasan_check(pprog, dst_reg, insn, ip, true,
+				       accesses_stack_only);
+		if (err)
+			return err;
 		/* smp_store_release(dst_reg + off16, src_reg) */
-		emit_stx(pprog, bpf_size, dst_reg, src_reg, off);
+		emit_stx(pprog, BPF_SIZE(insn->code), dst_reg, src_reg,
+			 insn->off);
 		break;
 	default:
 		pr_err("bpf_jit: unknown atomic load/store opcode %02x\n",
@@ -1904,6 +1917,7 @@ static int do_jit(struct bpf_verifier_env *env, struct bpf_prog *bpf_prog, int *
 		const s32 imm32 = insn->imm;
 		u32 dst_reg = insn->dst_reg;
 		u32 src_reg = insn->src_reg;
+		bool accesses_stack_only;
 		u8 b2 = 0, b3 = 0;
 		u8 *start_of_ldx;
 		s64 jmp_offset;
@@ -1924,6 +1938,8 @@ static int do_jit(struct bpf_verifier_env *env, struct bpf_prog *bpf_prog, int *
 			EMIT_ENDBR();
 
 		ip = image + addrs[i - 1] + (prog - temp);
+		accesses_stack_only =
+			bpf_insn_accesses_stack_only(env, bpf_prog, i - 1);
 
 		switch (insn->code) {
 			/* ALU */
@@ -2304,6 +2320,10 @@ static int do_jit(struct bpf_verifier_env *env, struct bpf_prog *bpf_prog, int *
 		case BPF_ST | BPF_MEM | BPF_H:
 		case BPF_ST | BPF_MEM | BPF_W:
 		case BPF_ST | BPF_MEM | BPF_DW:
+			err = emit_kasan_check(&prog, dst_reg, insn, ip, true,
+					       accesses_stack_only);
+			if (err)
+				return err;
 			switch (BPF_SIZE(insn->code)) {
 			case BPF_B:
 				if (is_ereg(dst_reg))
@@ -2369,6 +2389,10 @@ static int do_jit(struct bpf_verifier_env *env, struct bpf_prog *bpf_prog, int *
 				insn_off = outgoing_arg_base - outgoing_rsp - insn_off - 16;
 				dst_reg = BPF_REG_FP;
 			}
+			err = emit_kasan_check(&prog, dst_reg, insn, ip, true,
+					       accesses_stack_only);
+			if (err)
+				return err;
 			emit_stx(&prog, BPF_SIZE(insn->code), dst_reg, src_reg, insn_off);
 			break;
 
@@ -2530,6 +2554,12 @@ static int do_jit(struct bpf_verifier_env *env, struct bpf_prog *bpf_prog, int *
 				/* populate jmp_offset for JAE above to jump to start_of_ldx */
 				start_of_ldx = prog;
 				end_of_jmp[-1] = start_of_ldx - end_of_jmp;
+			} else {
+				err = emit_kasan_check(&prog, src_reg, insn, ip,
+						       false,
+						       accesses_stack_only);
+				if (err)
+					return err;
 			}
 			if (BPF_MODE(insn->code) == BPF_PROBE_MEMSX ||
 			    BPF_MODE(insn->code) == BPF_MEMSX)
@@ -2592,13 +2622,13 @@ static int do_jit(struct bpf_verifier_env *env, struct bpf_prog *bpf_prog, int *
 			fallthrough;
 		case BPF_STX | BPF_ATOMIC | BPF_W:
 		case BPF_STX | BPF_ATOMIC | BPF_DW:
+			bool is64 = BPF_SIZE(insn->code) == BPF_DW;
+			u32 real_src_reg = src_reg;
+			u32 real_dst_reg = dst_reg;
+			u8 *branch_target;
 			if (insn->imm == (BPF_AND | BPF_FETCH) ||
 			    insn->imm == (BPF_OR | BPF_FETCH) ||
 			    insn->imm == (BPF_XOR | BPF_FETCH)) {
-				bool is64 = BPF_SIZE(insn->code) == BPF_DW;
-				u32 real_src_reg = src_reg;
-				u32 real_dst_reg = dst_reg;
-				u8 *branch_target;
 
 				/*
 				 * Can't be implemented with a single x86 insn.
@@ -2612,7 +2642,19 @@ static int do_jit(struct bpf_verifier_env *env, struct bpf_prog *bpf_prog, int *
 				if (dst_reg == BPF_REG_0)
 					real_dst_reg = BPF_REG_AX;
 
+				ip += 3;
+			}
+			if (!bpf_atomic_is_load_store(insn)) {
+				err = emit_kasan_check(&prog, real_dst_reg,
+						       insn, ip, false,
+						       accesses_stack_only);
+				if (err)
+					return err;
 				branch_target = prog;
+			}
+			if (insn->imm == (BPF_AND | BPF_FETCH) ||
+			    insn->imm == (BPF_OR | BPF_FETCH) ||
+			    insn->imm == (BPF_XOR | BPF_FETCH)) {
 				/* Load old value */
 				emit_ldx(&prog, BPF_SIZE(insn->code),
 					 BPF_REG_0, real_dst_reg, insn->off);
@@ -2644,8 +2686,9 @@ static int do_jit(struct bpf_verifier_env *env, struct bpf_prog *bpf_prog, int *
 			}
 
 			if (bpf_atomic_is_load_store(insn))
-				err = emit_atomic_ld_st(&prog, insn->imm, dst_reg, src_reg,
-							insn->off, BPF_SIZE(insn->code));
+				err = emit_atomic_ld_st(&prog, insn, ip,
+							dst_reg, src_reg,
+							accesses_stack_only);
 			else
 				err = emit_atomic_rmw(&prog, insn->imm, dst_reg, src_reg,
 						      insn->off, BPF_SIZE(insn->code));

-- 
2.54.0


