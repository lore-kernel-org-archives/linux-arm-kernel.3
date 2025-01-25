Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD4DC02181
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jan 2025 02:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3/pYcf0sANYo9TEsaEY4ONRLzSTmKybwrzwLYycpJYE=; b=TRDXKpM+FXrfgqpGjBcpQEkrmM
	Yo8HF940+tYOnOZ6Uu2BoeEKzldFqyV7V1xkzlCAmLb8JfF9XlNCQzsfc6GRAeYj3rqO5LVXnX6uh
	8ocrL3KWtjL7As8O7AtMEusUIe52L16ajoKiAe8CI/Rdbn5+gNYlsjg0+3tyRKuyr72WJFwOgJNJK
	545aRjiDPFuTrsNgnQRZMFocYHclJzdASqrjjVVUTl3eCAJBdTS/iSAINvv0jJMKy2tWIopxZNyNW
	agyUjdRatJZsRe5o1VX1UtqEMgIqvjCc/dVrRDdv2lB+EeHVEmX2HNGValjr5x2vLls+6chTfyOhk
	mSn7TbeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbVsb-0000000FulR-2fwn;
	Sat, 25 Jan 2025 02:26:37 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbVlV-0000000Fu5K-1AKI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jan 2025 02:19:18 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2f2a9743093so5481199a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jan 2025 18:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737771556; x=1738376356; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3/pYcf0sANYo9TEsaEY4ONRLzSTmKybwrzwLYycpJYE=;
        b=QEN86rXQhORYdE10SIsBaAeJnZX+6W33rfZ63iUY6Q53dpnG803Xry9OrDSr8Ok5fq
         FeYVaHt3Fed2b6ud8at4CBdjMdYlkQevNUlbfDzSLN95vohi0t9W7WEqU0lvZllvi9IG
         fO/q6VE9FinKrCygVOiCkjTtgsHTAQhqble/8DBIqKwKA+QRgP61rpJndo74cw++U8tq
         runOeGBpGmCk4ObOv2x1PN+WtAnaSAiRJfeXXlm3cF2YfkvidxaaC7kqm3jFZAsIx7ph
         +1a568QSHXCLxBEgnoiZqRO0vPvj/FQxsDscCqZdc15xXDqi8fOJIL2yVJln183oU9s5
         xYCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737771556; x=1738376356;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3/pYcf0sANYo9TEsaEY4ONRLzSTmKybwrzwLYycpJYE=;
        b=Z7iOFDeljlHK+zjAIdYoJzcWFAiEa7z29qJCXpaVE08DUAr5f1lm6QluwOd3Jd5gT6
         m8PkmGgnyK/1ZxIKaON0Di4WxVwLc8Ne6/pD9bMEcL3d9Kazi5uPL6Q3VTAe/3XTMg0H
         Nef0yZNqSugtuUOM2eDNb5VgaMJZw10pUdum9/Rvamg0DtHRxDY1tW7NLu0jz+EUf8mw
         HGBv4zjynNf/BxFn2INFM+KX2SdrHEFq/OPtLAzcqNM6uPLyTmHNSeJi8kW0Quq217iE
         VvE5vLBwI1kd+l9WLWdQ4kmTQnMflk6zwQdTB+OPbgJkWq8tvBlz7hxY2j92Id8Hgi+O
         U1hg==
X-Forwarded-Encrypted: i=1; AJvYcCXIBje9cQmA1NQkR/0uD73LEFZidGVe7EQunYopSSdvvyV5MVoDw92bGEKsRSuCWdFSpkmwVAgFt3DSZ+pMGbhX@lists.infradead.org
X-Gm-Message-State: AOJu0YwcsckfFq8CdjgmHboYrit0DKg9XmyPcnmxPUT1CfdCRmw8pAQt
	45UKUpj0xWeSqv/bVXX67ebY82lyr3Mida3axYzYsyEF0/Ov57K0IHOgp9oPCOrrNUwTJxbf6Ko
	+si8yU2Tphw==
X-Google-Smtp-Source: AGHT+IHLeumw4Cen/udsKyGtvAVMvHHnzYuG7MNiJRP+RmXCfv67AF/APEi6auE44B6c9jmN91D0FezxRYqdMA==
X-Received: from pjd4.prod.google.com ([2002:a17:90b:54c4:b0:2d3:d4ca:5fb0])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2e4e:b0:2ee:fd53:2b17 with SMTP id 98e67ed59e1d1-2f782d97276mr45715232a91.29.1737771555858;
 Fri, 24 Jan 2025 18:19:15 -0800 (PST)
Date: Sat, 25 Jan 2025 02:19:09 +0000
In-Reply-To: <cover.1737763916.git.yepeilin@google.com>
Mime-Version: 1.0
References: <cover.1737763916.git.yepeilin@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <1733f889a4b46d13844d1083b5cfba5005b22e86.1737763916.git.yepeilin@google.com>
Subject: [PATCH bpf-next v1 6/8] bpf, arm64: Support load-acquire and
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
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Quentin Monnet <qmo@kernel.org>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>, Neel Natu <neelnatu@google.com>, 
	Benjamin Segall <bsegall@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_181917_314686_C467EFC2 
X-CRM114-Status: GOOD (  15.72  )
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
 arch/arm64/net/bpf_jit_comp.c | 92 ++++++++++++++++++++++++++++++++++-
 2 files changed, 110 insertions(+), 2 deletions(-)

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
index 8446848edddb..488cbe094551 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -647,6 +647,87 @@ static int emit_bpf_tail_call(struct jit_ctx *ctx)
 	return 0;
 }
 
+static inline bool is_atomic_load_store(const s32 imm)
+{
+	const s32 type = BPF_ATOMIC_TYPE(imm);
+
+	return type == BPF_ATOMIC_LOAD || type == BPF_ATOMIC_STORE;
+}
+
+static int emit_atomic_load_store(const struct bpf_insn *insn, struct jit_ctx *ctx)
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
+		pr_err_once("unknown atomic load/store op code %02x\n", insn->imm);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 #ifdef CONFIG_ARM64_LSE_ATOMICS
 static int emit_lse_atomic(const struct bpf_insn *insn, struct jit_ctx *ctx)
 {
@@ -1641,11 +1722,17 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx,
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
+		if (is_atomic_load_store(insn->imm))
+			ret = emit_atomic_load_store(insn, ctx);
+		else if (cpus_have_cap(ARM64_HAS_LSE_ATOMICS))
 			ret = emit_lse_atomic(insn, ctx);
 		else
 			ret = emit_ll_sc_atomic(insn, ctx);
@@ -2669,7 +2756,8 @@ bool bpf_jit_supports_insn(struct bpf_insn *insn, bool in_arena)
 	switch (insn->code) {
 	case BPF_STX | BPF_ATOMIC | BPF_W:
 	case BPF_STX | BPF_ATOMIC | BPF_DW:
-		if (!cpus_have_cap(ARM64_HAS_LSE_ATOMICS))
+		if (!is_atomic_load_store(insn->imm) &&
+		    !cpus_have_cap(ARM64_HAS_LSE_ATOMICS))
 			return false;
 	}
 	return true;
-- 
2.48.1.262.g85cc9f2d1e-goog


