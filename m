Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4964FC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 00:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8j2BSjmna2ghQKBcJTnNrRFDhjm44gnJpM2ihIwsNrg=; b=hcr0gKpuhR2Vs1Br80Nlx7s4pT
	4fk72D7gjoXJ/oQaZ08vEdv5OBcfzmuG9HgCaU3G2hslNYGn6xz2mKRYvE5ruIDAH/JqI0S48sUBs
	sW5goOhq8XWhVoia5ECPKOTWP8wx88+/FoDMwLw+N46FZFHxk2F8gFhcWimJ/Mz1Tx7pKXljwyTeJ
	cC8/1QoNTrYmM5fL/s8K4aS4roGfDaDbjZOQShWw9TliGFc4AVn9YHZ3rHORyzfiRyEatlmBRz/Gz
	W5xoeINBmdo05qfuIvC9+wcDD5TMYDg5Xki7iGPudGd/4w9Wp04I7L4Q0S+M+JVOYPRKi+ve98xmY
	ZwZlvlJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpG2R-00000002eAm-0KC1;
	Tue, 04 Mar 2025 00:21:35 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpFvQ-00000002d69-0Hab
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 00:14:21 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2feb4648d4dso13865579a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 16:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741047259; x=1741652059; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8j2BSjmna2ghQKBcJTnNrRFDhjm44gnJpM2ihIwsNrg=;
        b=4chBx8hvEAXC/hGaeb+v2QG6vVt6r7SrK8XWea32cfJuZf6eg3yXbSKiwkRCkTyzHa
         tPhI+b+gyDbULnBo8YERk0D7EsQxPNjKHBoyVQqKxkMXgtla+c72JEBE+dfFHsBsRPVH
         +3ey6dz4K+x8KRcAe12kiIv/tMEdvUrNMLuiFqtnzeZRYpY15zCuuoCSSVh4q8RTwzfL
         +JoN1deQwMb+Z2Ndkzb41WAVuHL20MNwKdjUdVblJSOGxNef3keIZku7mCr/Pg2CCD3o
         aP6PDRxLX8/h1oZByWeDrmR9Xv3lJy99pFHY9kHp0tu9W/aEuh6A5/Fs2Zb/9ya8j2Kf
         U1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741047259; x=1741652059;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8j2BSjmna2ghQKBcJTnNrRFDhjm44gnJpM2ihIwsNrg=;
        b=ExEsiPYTMDgbrvLeRLVHfoTGorFDAZnUMWkpYT2B/2PcaDTiFvVph+r2/hJXhHRaV8
         jWWnx9N+49rnw9/dnI6WWNpBjP5Gyv5ig+RsGUBanwdxFrGRIdeIiEKjRU0v88SxM+cy
         sJ4m2xT5aNNi9elMJ1RjK6gZUZuso8yKiZUAzFty/tmngGusWz9I4VPS2jVoEdNg1P/x
         zWVEmLammiNQ6O7L5kgHseMdT23HeKwmhH4t3sl61ntUfV+IfaLJYi0dtVf+Ni6ZVxTa
         Ise4FKVq9qvZyHtGzxgYRoqJ0TdY7/060pVD5ApnNFGusF/CV1oDlv5qf9fcg5XGS2p5
         HEtQ==
X-Forwarded-Encrypted: i=1; AJvYcCULZQYA09xiX7pg59uKTojwRTbE1Ljw22XAQ9FA++JJuv2jBcGW+eCDVmU/jl7u9lFqGbko7JrXQGl+4A1xJHL9@lists.infradead.org
X-Gm-Message-State: AOJu0YwGPdnbluNugUrdRIm08W7tjTmrBimny9tR3q9r3Ukd8/hJK5uO
	Y+wuWUiEa41zKq8vF7CLpt5SjpChkTq1L9cZJ2ziocVr3WOIGFsEReDTZWBy+WsyRfxXrTWxn0O
	Tifu+k/2SiA==
X-Google-Smtp-Source: AGHT+IFMIVdq6tii8p6eio9YIzGPiIzt2c6o+qQ5+Ro+WEeR+4w6njY2EQbyY4O8uOd8S00f8/XVAn3YIRE9Zg==
X-Received: from pjbcz12.prod.google.com ([2002:a17:90a:d44c:b0:2fa:284f:adae])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:554f:b0:2ea:712d:9a82 with SMTP id 98e67ed59e1d1-2febabf8577mr23330143a91.29.1741047259169;
 Mon, 03 Mar 2025 16:14:19 -0800 (PST)
Date: Tue,  4 Mar 2025 00:14:16 +0000
In-Reply-To: <cover.1741046028.git.yepeilin@google.com>
Mime-Version: 1.0
References: <cover.1741046028.git.yepeilin@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <fb4784d569abe2ba66e33833e3e64c168a87465d.1741046028.git.yepeilin@google.com>
Subject: [PATCH bpf-next v5 4/6] bpf, arm64: Support load-acquire and
 store-release instructions
From: Peilin Ye <yepeilin@google.com>
To: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Peilin Ye <yepeilin@google.com>, bpf@ietf.org, Alexei Starovoitov <ast@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Eduard Zingerman <eddyz87@gmail.com>, 
	David Vernet <void@manifault.com>, Daniel Borkmann <daniel@iogearbox.net>, 
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
X-CRM114-CacheID: sfid-20250303_161420_104457_F79AE2B5 
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
(BPF_STORE_REL) instructions in the arm64 JIT compiler.  For example
(assuming little-endian):

  db 10 00 00 00 01 00 00  r0 = load_acquire((u64 *)(r1 + 0x0))
  95 00 00 00 00 00 00 00  exit

  opcode (0xdb): BPF_ATOMIC | BPF_DW | BPF_STX
  imm (0x00000100): BPF_LOAD_ACQ

The JIT compiler would emit an LDAR instruction for the above, e.g.:

  ldar  x7, [x0]

Similarly, consider the following 16-bit store-release:

  cb 21 00 00 10 01 00 00  store_release((u16 *)(r1 + 0x0), w2)
  95 00 00 00 00 00 00 00  exit

  opcode (0xcb): BPF_ATOMIC | BPF_H | BPF_STX
  imm (0x00000110): BPF_STORE_REL

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

Acked-by: Xu Kuohai <xukuohai@huawei.com>
Signed-off-by: Peilin Ye <yepeilin@google.com>
---
 arch/arm64/net/bpf_jit.h      | 20 ++++++++
 arch/arm64/net/bpf_jit_comp.c | 90 ++++++++++++++++++++++++++++++++---
 2 files changed, 104 insertions(+), 6 deletions(-)

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
index bdda5a77bb16..70d7c89d3ac9 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -647,6 +647,81 @@ static int emit_bpf_tail_call(struct jit_ctx *ctx)
 	return 0;
 }
 
+static int emit_atomic_ld_st(const struct bpf_insn *insn, struct jit_ctx *ctx)
+{
+	const s32 imm = insn->imm;
+	const s16 off = insn->off;
+	const u8 code = insn->code;
+	const bool arena = BPF_MODE(code) == BPF_PROBE_ATOMIC;
+	const u8 arena_vm_base = bpf2a64[ARENA_VM_START];
+	const u8 dst = bpf2a64[insn->dst_reg];
+	const u8 src = bpf2a64[insn->src_reg];
+	const u8 tmp = bpf2a64[TMP_REG_1];
+	u8 reg;
+
+	switch (imm) {
+	case BPF_LOAD_ACQ:
+		reg = src;
+		break;
+	case BPF_STORE_REL:
+		reg = dst;
+		break;
+	default:
+		pr_err_once("unknown atomic load/store op code %02x\n", imm);
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
+	switch (imm) {
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
+		pr_err_once("unexpected atomic load/store op code %02x\n",
+			    imm);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 #ifdef CONFIG_ARM64_LSE_ATOMICS
 static int emit_lse_atomic(const struct bpf_insn *insn, struct jit_ctx *ctx)
 {
@@ -1641,11 +1716,17 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx,
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
+			ret = emit_atomic_ld_st(insn, ctx);
+		else if (cpus_have_cap(ARM64_HAS_LSE_ATOMICS))
 			ret = emit_lse_atomic(insn, ctx);
 		else
 			ret = emit_ll_sc_atomic(insn, ctx);
@@ -2667,13 +2748,10 @@ bool bpf_jit_supports_insn(struct bpf_insn *insn, bool in_arena)
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
2.48.1.711.g2feabab25a-goog


