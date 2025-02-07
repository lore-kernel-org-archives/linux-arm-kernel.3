Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09023C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 02:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3/uv2akh8MDqd9n19hYJv/xvE4Iur0KMmE3+KGKTk/Y=; b=o5B0Uo+3PpO1zEnuW+i2J0v3Lg
	xIaPNnPXzQ3iXhT/sKRVDlAWz9Yx2eA8h9QotNp/IVYeVrz1/XYXM8JFh6E66hpnWrzYbLps9zjxp
	F+fmbzJyMYJnXOny0QVBsmmk0RVhNYMAq/ocbnm/dCVw0YkDD84vCHHEg2npiPXgYOgfWJDHFqHtD
	gUEUFhxMtZvQiKPhIa7yKCo1Hq0hrab7vj+xaqqSmI8QHsO/Qzmez3HQvD+L9HzRH7opU6MtxHQV4
	4Z4F6XZT8yXDtTypgMw2DztbwY6JxEf5KtV/ETb1l/tyyf24hEscC6PyvQmsiw1xlp+KrTFWPERpJ
	d33LRdmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgDuf-00000008301-0oKC;
	Fri, 07 Feb 2025 02:16:13 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgDlD-000000081dV-3Mv7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 02:06:28 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2f9f2bf2aaeso3265797a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 18:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738893986; x=1739498786; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3/uv2akh8MDqd9n19hYJv/xvE4Iur0KMmE3+KGKTk/Y=;
        b=vlCyVqCpk0p5+ObSN17Zi5W64I3/hTlYbMz9B0830q139/6ruzcKCO7S7dfCyivsDE
         Xy/uJDkfc+4s7kUx/2tZrjAXSbX1sJgZYe/kug00LuyM4j8Jk/04o86wQyd8duXpGSIH
         LSjUAGDM7/zL+F3I7vhDaHcJrJHoeaoait9DnlpFujhqKDfgYVS5TZZiFOKVGoqaC3Z6
         iRtOPljBxlM88Y4DpspbEQXGQrGTBCSaKR3doH9jSqtzkXmBBGnCeTPy5BP+LwsWadNk
         i1ev3MhCcBchgZs7mp8fUwcURRbpxu1iC1XFlPeNWd+c/UNpGijn2Y5yrvKc4i10+GPU
         OSkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738893986; x=1739498786;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3/uv2akh8MDqd9n19hYJv/xvE4Iur0KMmE3+KGKTk/Y=;
        b=m4g/CrGFmaABoKQqVZatv0KSIbTUDMCFjRVMf7oqhZ24CaY1ke+h6VrHMlDGafLbEM
         RD7IymptAXl8XtvBy+tetkzLSf8PP84dVkSa5WKqu32wImrSphMfZ9jo+6WhcxtTItqz
         sc17aMmdD6tM9T74YT/2JlUAE0L57Ks6z/oMhgcKv3XHS+2rxP3R57yqK5HV3U0jwXQY
         5chGhAW0OI/76R342V4N56IJm8v+BatYl9Zsm7foKFwLbjikyDtq3ZF/pTaY51ZO2cRF
         tgCJr47egKS/LMMQ3MwZFgRGlXn6t8QzgWLiUkbkp7XbiZhG0vbvbHn92O3IYO58iWcU
         WykQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaG49ESDuVZfrOZLjS04u3J+OvIjx8O4C1ej3HBGBrr4qoYqCnHVEseT/MI+yUhJF5rpjdXa/pzRu6h0fnp99T@lists.infradead.org
X-Gm-Message-State: AOJu0YxPHzqT98eOyXnDGQDqqktkvxK32+EpsxzzukyC3pNdbWdoKPCA
	5LbLrV2EAu4ca91N4691l0C8VsaL7+BzDhQvLxK0HltiL/PslYSMAUb3VH9CQccEsAc1y+DFyzu
	BpoEUaCuiUQ==
X-Google-Smtp-Source: AGHT+IHmd7jXzZpPbORG/2teAdCv8IQKKJx1keqS0VzPbP7gZVccyL5ZzCdiANnZVKcUIXtFTxwxZpQFooUwFw==
X-Received: from pfvx11.prod.google.com ([2002:a05:6a00:270b:b0:725:dec7:dd47])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:230c:b0:725:e4b9:a600 with SMTP id d2e1a72fcca58-7305d4f0412mr2817045b3a.16.1738893986567;
 Thu, 06 Feb 2025 18:06:26 -0800 (PST)
Date: Fri,  7 Feb 2025 02:06:19 +0000
In-Reply-To: <cover.1738888641.git.yepeilin@google.com>
Mime-Version: 1.0
References: <cover.1738888641.git.yepeilin@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <73f55267778db55ba9e854f0e3bef24c4bbba2fb.1738888641.git.yepeilin@google.com>
Subject: [PATCH bpf-next v2 7/9] bpf, arm64: Support load-acquire and
 store-release instructions
From: Peilin Ye <yepeilin@google.com>
To: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Peilin Ye <yepeilin@google.com>, bpf@ietf.org, Xu Kuohai <xukuohai@huaweicloud.com>, 
	Eduard Zingerman <eddyz87@gmail.com>, David Vernet <void@manifault.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Quentin Monnet <qmo@kernel.org>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Yingchi Long <longyingchi24s@ict.ac.cn>, 
	Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>, Neel Natu <neelnatu@google.com>, 
	Benjamin Segall <bsegall@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_180627_840422_1D98E476 
X-CRM114-Status: GOOD (  15.70  )
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

Support BPF load-acquire (BPF_LOAD_ACQ) and store-release
(BPF_STORE_REL) instructions in the arm64 JIT compiler.  For example:

  db 10 00 00 11 00 00 00  r0 = load_acquire((u64 *)(r1 + 0x0))
  95 00 00 00 00 00 00 00  exit

  opcode (0xdb): BPF_ATOMIC | BPF_DW | BPF_STX
  imm (0x00000011): BPF_LOAD_ACQ

The JIT compiler would emit an LDAR instruction for the above, e.g.:

  ldar  x7, [x0]

Similarly, consider the following 16-bit store-release:

  cb 21 00 00 22 00 00 00  store_release((u16 *)(r1 + 0x0), w2)
  95 00 00 00 00 00 00 00  exit

  opcode (0xcb): BPF_ATOMIC | BPF_H | BPF_STX
  imm (0x00000022): BPF_ATOMIC_STORE | BPF_RELEASE

An STLRH instruction would be emitted, e.g.:

  stlrh  w1, [x0]

For a complete mapping:

  load-acquire     8-bit  LDARB
 (BPF_LOAD_ACQ)   16-bit  LDARH
                  32-bit  LDAR (32-bit)
                  64-bit  LDAR (64-bit)
  store-release    8-bit  STLRB
 (BPF_STORE_REL)  16-bit  STLRH
                  32-bit  STLR (32-bit)
                  64-bit  STLR (64-bit)

Arena accesses are supported.
bpf_jit_supports_insn(..., /*in_arena=*/true) always returns true for
BPF_LOAD_ACQ and BPF_STORE_REL instructions, as they don't depend on
ARM64_HAS_LSE_ATOMICS.

Signed-off-by: Peilin Ye <yepeilin@google.com>
---
 arch/arm64/net/bpf_jit.h      | 20 ++++++++
 arch/arm64/net/bpf_jit_comp.c | 91 ++++++++++++++++++++++++++++++++---
 2 files changed, 105 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/net/bpf_jit.h b/arch/arm64/net/bpf_jit.h
index b22ab2f97a30..a3b0e693a125 100644
--- a/arch/arm64/net/bpf_jit.h
+++ b/arch/arm64/net/bpf_jit.h
@@ -119,6 +119,26 @@
 	aarch64_insn_gen_load_store_ex(Rt, Rn, Rs, A64_SIZE(sf), \
 				       AARCH64_INSN_LDST_STORE_REL_EX)
 
+/* Load-acquire & store-release */
+#define A64_LDAR(Rt, Rn, size)  \
+	aarch64_insn_gen_load_acq_store_rel(Rt, Rn, AARCH64_INSN_SIZE_##size, \
+					    AARCH64_INSN_LDST_LOAD_ACQ)
+#define A64_STLR(Rt, Rn, size)  \
+	aarch64_insn_gen_load_acq_store_rel(Rt, Rn, AARCH64_INSN_SIZE_##size, \
+					    AARCH64_INSN_LDST_STORE_REL)
+
+/* Rt = [Rn] (load acquire) */
+#define A64_LDARB(Wt, Xn)	A64_LDAR(Wt, Xn, 8)
+#define A64_LDARH(Wt, Xn)	A64_LDAR(Wt, Xn, 16)
+#define A64_LDAR32(Wt, Xn)	A64_LDAR(Wt, Xn, 32)
+#define A64_LDAR64(Xt, Xn)	A64_LDAR(Xt, Xn, 64)
+
+/* [Rn] = Rt (store release) */
+#define A64_STLRB(Wt, Xn)	A64_STLR(Wt, Xn, 8)
+#define A64_STLRH(Wt, Xn)	A64_STLR(Wt, Xn, 16)
+#define A64_STLR32(Wt, Xn)	A64_STLR(Wt, Xn, 32)
+#define A64_STLR64(Xt, Xn)	A64_STLR(Xt, Xn, 64)
+
 /*
  * LSE atomics
  *
diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index 8c3b47d9e441..c439df0233d1 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -647,6 +647,82 @@ static int emit_bpf_tail_call(struct jit_ctx *ctx)
 	return 0;
 }
 
+static int emit_atomic_load_store(const struct bpf_insn *insn,
+				  struct jit_ctx *ctx)
+{
+	const s32 type = BPF_ATOMIC_TYPE(insn->imm);
+	const s16 off = insn->off;
+	const u8 code = insn->code;
+	const bool arena = BPF_MODE(code) == BPF_PROBE_ATOMIC;
+	const u8 arena_vm_base = bpf2a64[ARENA_VM_START];
+	const u8 dst = bpf2a64[insn->dst_reg];
+	const u8 src = bpf2a64[insn->src_reg];
+	const u8 tmp = bpf2a64[TMP_REG_1];
+	u8 reg;
+
+	switch (type) {
+	case BPF_ATOMIC_LOAD:
+		reg = src;
+		break;
+	case BPF_ATOMIC_STORE:
+		reg = dst;
+		break;
+	default:
+		pr_err_once("unknown atomic load/store op type %02x\n", type);
+		return -EINVAL;
+	}
+
+	if (off) {
+		emit_a64_add_i(1, tmp, reg, tmp, off, ctx);
+		reg = tmp;
+	}
+	if (arena) {
+		emit(A64_ADD(1, tmp, reg, arena_vm_base), ctx);
+		reg = tmp;
+	}
+
+	switch (insn->imm) {
+	case BPF_LOAD_ACQ:
+		switch (BPF_SIZE(code)) {
+		case BPF_B:
+			emit(A64_LDARB(dst, reg), ctx);
+			break;
+		case BPF_H:
+			emit(A64_LDARH(dst, reg), ctx);
+			break;
+		case BPF_W:
+			emit(A64_LDAR32(dst, reg), ctx);
+			break;
+		case BPF_DW:
+			emit(A64_LDAR64(dst, reg), ctx);
+			break;
+		}
+		break;
+	case BPF_STORE_REL:
+		switch (BPF_SIZE(code)) {
+		case BPF_B:
+			emit(A64_STLRB(src, reg), ctx);
+			break;
+		case BPF_H:
+			emit(A64_STLRH(src, reg), ctx);
+			break;
+		case BPF_W:
+			emit(A64_STLR32(src, reg), ctx);
+			break;
+		case BPF_DW:
+			emit(A64_STLR64(src, reg), ctx);
+			break;
+		}
+		break;
+	default:
+		pr_err_once("unknown atomic load/store op code %02x\n",
+			    insn->imm);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 #ifdef CONFIG_ARM64_LSE_ATOMICS
 static int emit_lse_atomic(const struct bpf_insn *insn, struct jit_ctx *ctx)
 {
@@ -1641,11 +1717,17 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx,
 			return ret;
 		break;
 
+	case BPF_STX | BPF_ATOMIC | BPF_B:
+	case BPF_STX | BPF_ATOMIC | BPF_H:
 	case BPF_STX | BPF_ATOMIC | BPF_W:
 	case BPF_STX | BPF_ATOMIC | BPF_DW:
+	case BPF_STX | BPF_PROBE_ATOMIC | BPF_B:
+	case BPF_STX | BPF_PROBE_ATOMIC | BPF_H:
 	case BPF_STX | BPF_PROBE_ATOMIC | BPF_W:
 	case BPF_STX | BPF_PROBE_ATOMIC | BPF_DW:
-		if (cpus_have_cap(ARM64_HAS_LSE_ATOMICS))
+		if (bpf_atomic_is_load_store(insn))
+			ret = emit_atomic_load_store(insn, ctx);
+		else if (cpus_have_cap(ARM64_HAS_LSE_ATOMICS))
 			ret = emit_lse_atomic(insn, ctx);
 		else
 			ret = emit_ll_sc_atomic(insn, ctx);
@@ -2667,13 +2749,10 @@ bool bpf_jit_supports_insn(struct bpf_insn *insn, bool in_arena)
 	if (!in_arena)
 		return true;
 	switch (insn->code) {
-	case BPF_STX | BPF_ATOMIC | BPF_B:
-	case BPF_STX | BPF_ATOMIC | BPF_H:
 	case BPF_STX | BPF_ATOMIC | BPF_W:
 	case BPF_STX | BPF_ATOMIC | BPF_DW:
-		if (bpf_atomic_is_load_store(insn))
-			return false;
-		if (!cpus_have_cap(ARM64_HAS_LSE_ATOMICS))
+		if (!bpf_atomic_is_load_store(insn) &&
+		    !cpus_have_cap(ARM64_HAS_LSE_ATOMICS))
 			return false;
 	}
 	return true;
-- 
2.48.1.502.g6dc24dfdaf-goog


