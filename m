Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8956C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 05:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SQHObxRFv3b1dtkhqcCo12kh/bUbqfHPaXfLX2WxZNw=; b=WnZ+1Pgf1d9fNan6enAQ2Ewuh+
	gx5UFr298y/0z+gpeRF+4BiLeQithLrQ1RWluElfDa4DOYBYbT4sjVh2uTvXG5OLw4GZCOKPxqT0W
	lXuM+zBspLqhqbmGJ6uPzLQ1ECwg+XhJp6BJYm+oZk/wXSwRPSXly3QkD97a8ONoHbC9MREKftYLm
	4Ou1L5R85gfqZu3iaOyNR4ai/hm3a8nDXMSsdCYuY0+dYKqkTuDvHE/H5qB/LgWUXeUYO3tfyXeYH
	fYknsTw6ld5r/u0tsANwRzcoymp8Z7xKI6dPX+TqOW5hzK7L+NyeUSj5CyemlU8hCriinRuuvKVtw
	mA/ssREA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toybq-0000000HHAg-1F2y;
	Mon, 03 Mar 2025 05:44:58 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toyUo-0000000HGND-1iaU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 05:37:43 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2233b154004so77147065ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Mar 2025 21:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740980261; x=1741585061; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SQHObxRFv3b1dtkhqcCo12kh/bUbqfHPaXfLX2WxZNw=;
        b=CevdBJx09JXa+/OeWJPA6edz1uYjc/Hhr1iyN08uRpkdqndqeQF4vyKo85heDTsDmF
         OLMcAltrhu2Dhi/Slv0J/tjQhGWR2izbBwHh1MvgzDTVQobWvvmJnZmX5ixdEz0RUFBp
         VxCGwiXOCuy57fSdJdRWDpLDdOhLeHipY7cxcQcFgsiNXNXV8kVpiZh0P5M6r8m7ZxAK
         2UEhydkAjg9ZPLVCKx8301ow1C9AJpfrkiQvAt+VbNq/YVcnmb61atXJXoZqEI4kI+Af
         HD2Ui6/Jku79qh6ETmao2CUzKe2pnRUyrmJpkN5+SmcCEDDPPVl0c9+EQH/Va9ze3iIR
         DRtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740980261; x=1741585061;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SQHObxRFv3b1dtkhqcCo12kh/bUbqfHPaXfLX2WxZNw=;
        b=ekvwcqePfbZ9nIE3rsAqX2LMEb78iosZBcT9T+55yQfK+U6zS2HlpRXDgtz06Bx6wp
         DovBe7t/e0WyZ3mvPORXQZaOKykx8yIBoE1bQ1Rug8DLv6ESnlpYpaGw1BEX+cUkD0D8
         aoRlfe28X7lCTGtpszI9wwczCV/E7ajQPqFGLRhjVCxJXAdvmCSkvtuNZarXj2NLJrLo
         BUc9jTaHQMhosBC10tA8Qk0jv4AuxHloMWbdwQtWg0jgeBsKqSrZSBDYnsF3/o1TjhtW
         q6k/dTS6jBr4ROFI5DHPEeRNfAC/YK7napYnEZ4rO4ruhO4/ohj8yWaGmCz1CdKuwLJP
         lqbA==
X-Forwarded-Encrypted: i=1; AJvYcCXr8zUT0dDyChORtVfYssIAhAnDeKDbVa8dIZaxj7HeR+oDwZhrbSVAZSkLyVq3/uVmvflzKgvXPTJAYVHjQpsw@lists.infradead.org
X-Gm-Message-State: AOJu0YwdM6NWWa886PHK9FJeIyoFd47Rvb2mwXJj3bMDzi2E9BBshBI9
	d8i9bdsir+p+0/RwAGJUMG+Io/qJCJs9T4RM+BMtVuV8Yz8jpQI6pNSV/RUc1+gqYVHHGZscchj
	rrY0wozF3AA==
X-Google-Smtp-Source: AGHT+IGVBM97b1TKWcrlp1EX6pOOu/P0bD82xs6zMcoigcFS91E2Bq0KHib9VoJogvCerWoWgXJW1aWjzHCRJw==
X-Received: from pfht3.prod.google.com ([2002:a62:ea03:0:b0:730:8e17:ed06])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e54a:b0:220:bdf2:e51e with SMTP id d9443c01a7336-22368fa90cbmr198079885ad.26.1740980261030;
 Sun, 02 Mar 2025 21:37:41 -0800 (PST)
Date: Mon,  3 Mar 2025 05:37:37 +0000
In-Reply-To: <cover.1740978603.git.yepeilin@google.com>
Mime-Version: 1.0
References: <cover.1740978603.git.yepeilin@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <2c82b29f3530b961b41f94a4942e490ab35a31c8.1740978603.git.yepeilin@google.com>
Subject: [PATCH bpf-next v4 04/10] bpf: Introduce load-acquire and
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
X-CRM114-CacheID: sfid-20250302_213742_461000_ABECC48D 
X-CRM114-Status: GOOD (  21.80  )
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

Introduce BPF instructions with load-acquire and store-release
semantics, as discussed in [1].  Define 2 new flags:

  #define BPF_LOAD_ACQ    0x100
  #define BPF_STORE_REL   0x110

A "load-acquire" is a BPF_STX | BPF_ATOMIC instruction with the 'imm'
field set to BPF_LOAD_ACQ (0x100).

Similarly, a "store-release" is a BPF_STX | BPF_ATOMIC instruction with
the 'imm' field set to BPF_STORE_REL (0x110).

Unlike existing atomic read-modify-write operations that only support
BPF_W (32-bit) and BPF_DW (64-bit) size modifiers, load-acquires and
store-releases also support BPF_B (8-bit) and BPF_H (16-bit).  An 8- or
16-bit load-acquire zero-extends the value before writing it to a 32-bit
register, just like ARM64 instruction LDARH and friends.

Similar to existing atomic read-modify-write operations, misaligned
load-acquires/store-releases are not allowed (even if
BPF_F_ANY_ALIGNMENT is set).

As an example, consider the following 64-bit load-acquire BPF
instruction (assuming little-endian):

  db 10 00 00 00 01 00 00  r0 = load_acquire((u64 *)(r1 + 0x0))

  opcode (0xdb): BPF_ATOMIC | BPF_DW | BPF_STX
  imm (0x00000100): BPF_LOAD_ACQ

Similarly, a 16-bit BPF store-release:

  cb 21 00 00 10 01 00 00  store_release((u16 *)(r1 + 0x0), w2)

  opcode (0xcb): BPF_ATOMIC | BPF_H | BPF_STX
  imm (0x00000110): BPF_STORE_REL

In arch/{arm64,s390,x86}/net/bpf_jit_comp.c, have
bpf_jit_supports_insn(..., /*in_arena=*/true) return false for the new
instructions, until the corresponding JIT compiler supports them in
arena.

[1] https://lore.kernel.org/all/20240729183246.4110549-1-yepeilin@google.com/

Acked-by: Eduard Zingerman <eddyz87@gmail.com>
Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Peilin Ye <yepeilin@google.com>
---
 arch/arm64/net/bpf_jit_comp.c  |  4 +++
 arch/s390/net/bpf_jit_comp.c   | 14 +++++---
 arch/x86/net/bpf_jit_comp.c    |  4 +++
 include/linux/bpf.h            | 15 ++++++++
 include/linux/filter.h         |  2 ++
 include/uapi/linux/bpf.h       |  3 ++
 kernel/bpf/core.c              | 63 ++++++++++++++++++++++++++++++----
 kernel/bpf/disasm.c            | 12 +++++++
 kernel/bpf/verifier.c          | 45 ++++++++++++++++++++++--
 tools/include/uapi/linux/bpf.h |  3 ++
 10 files changed, 152 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index 7409c8acbde3..bdda5a77bb16 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -2667,8 +2667,12 @@ bool bpf_jit_supports_insn(struct bpf_insn *insn, bool in_arena)
 	if (!in_arena)
 		return true;
 	switch (insn->code) {
+	case BPF_STX | BPF_ATOMIC | BPF_B:
+	case BPF_STX | BPF_ATOMIC | BPF_H:
 	case BPF_STX | BPF_ATOMIC | BPF_W:
 	case BPF_STX | BPF_ATOMIC | BPF_DW:
+		if (bpf_atomic_is_load_store(insn))
+			return false;
 		if (!cpus_have_cap(ARM64_HAS_LSE_ATOMICS))
 			return false;
 	}
diff --git a/arch/s390/net/bpf_jit_comp.c b/arch/s390/net/bpf_jit_comp.c
index 9d440a0b729e..0776dfde2dba 100644
--- a/arch/s390/net/bpf_jit_comp.c
+++ b/arch/s390/net/bpf_jit_comp.c
@@ -2919,10 +2919,16 @@ bool bpf_jit_supports_arena(void)
 
 bool bpf_jit_supports_insn(struct bpf_insn *insn, bool in_arena)
 {
-	/*
-	 * Currently the verifier uses this function only to check which
-	 * atomic stores to arena are supported, and they all are.
-	 */
+	if (!in_arena)
+		return true;
+	switch (insn->code) {
+	case BPF_STX | BPF_ATOMIC | BPF_B:
+	case BPF_STX | BPF_ATOMIC | BPF_H:
+	case BPF_STX | BPF_ATOMIC | BPF_W:
+	case BPF_STX | BPF_ATOMIC | BPF_DW:
+		if (bpf_atomic_is_load_store(insn))
+			return false;
+	}
 	return true;
 }
 
diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
index a43fc5af973d..f0c31c940fb8 100644
--- a/arch/x86/net/bpf_jit_comp.c
+++ b/arch/x86/net/bpf_jit_comp.c
@@ -3771,8 +3771,12 @@ bool bpf_jit_supports_insn(struct bpf_insn *insn, bool in_arena)
 	if (!in_arena)
 		return true;
 	switch (insn->code) {
+	case BPF_STX | BPF_ATOMIC | BPF_B:
+	case BPF_STX | BPF_ATOMIC | BPF_H:
 	case BPF_STX | BPF_ATOMIC | BPF_W:
 	case BPF_STX | BPF_ATOMIC | BPF_DW:
+		if (bpf_atomic_is_load_store(insn))
+			return false;
 		if (insn->imm == (BPF_AND | BPF_FETCH) ||
 		    insn->imm == (BPF_OR | BPF_FETCH) ||
 		    insn->imm == (BPF_XOR | BPF_FETCH))
diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index 4c4028d865ee..b556a26d8150 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -991,6 +991,21 @@ static inline bool bpf_pseudo_func(const struct bpf_insn *insn)
 	return bpf_is_ldimm64(insn) && insn->src_reg == BPF_PSEUDO_FUNC;
 }
 
+/* Given a BPF_ATOMIC instruction @atomic_insn, return true if it is an
+ * atomic load or store, and false if it is a read-modify-write instruction.
+ */
+static inline bool
+bpf_atomic_is_load_store(const struct bpf_insn *atomic_insn)
+{
+	switch (atomic_insn->imm) {
+	case BPF_LOAD_ACQ:
+	case BPF_STORE_REL:
+		return true;
+	default:
+		return false;
+	}
+}
+
 struct bpf_prog_ops {
 	int (*test_run)(struct bpf_prog *prog, const union bpf_attr *kattr,
 			union bpf_attr __user *uattr);
diff --git a/include/linux/filter.h b/include/linux/filter.h
index 3ed6eb9e7c73..24e94afb5622 100644
--- a/include/linux/filter.h
+++ b/include/linux/filter.h
@@ -364,6 +364,8 @@ static inline bool insn_is_cast_user(const struct bpf_insn *insn)
  *   BPF_XOR | BPF_FETCH      src_reg = atomic_fetch_xor(dst_reg + off16, src_reg);
  *   BPF_XCHG                 src_reg = atomic_xchg(dst_reg + off16, src_reg)
  *   BPF_CMPXCHG              r0 = atomic_cmpxchg(dst_reg + off16, r0, src_reg)
+ *   BPF_LOAD_ACQ             dst_reg = smp_load_acquire(src_reg + off16)
+ *   BPF_STORE_REL            smp_store_release(dst_reg + off16, src_reg)
  */
 
 #define BPF_ATOMIC_OP(SIZE, OP, DST, SRC, OFF)			\
diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
index beac5cdf2d2c..bb37897c0393 100644
--- a/include/uapi/linux/bpf.h
+++ b/include/uapi/linux/bpf.h
@@ -51,6 +51,9 @@
 #define BPF_XCHG	(0xe0 | BPF_FETCH)	/* atomic exchange */
 #define BPF_CMPXCHG	(0xf0 | BPF_FETCH)	/* atomic compare-and-write */
 
+#define BPF_LOAD_ACQ	0x100	/* load-acquire */
+#define BPF_STORE_REL	0x110	/* store-release */
+
 enum bpf_cond_pseudo_jmp {
 	BPF_MAY_GOTO = 0,
 };
diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index a0200fbbace9..323af18d7d49 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -1663,14 +1663,17 @@ EXPORT_SYMBOL_GPL(__bpf_call_base);
 	INSN_3(JMP, JSET, K),			\
 	INSN_2(JMP, JA),			\
 	INSN_2(JMP32, JA),			\
+	/* Atomic operations. */		\
+	INSN_3(STX, ATOMIC, B),			\
+	INSN_3(STX, ATOMIC, H),			\
+	INSN_3(STX, ATOMIC, W),			\
+	INSN_3(STX, ATOMIC, DW),		\
 	/* Store instructions. */		\
 	/*   Register based. */			\
 	INSN_3(STX, MEM,  B),			\
 	INSN_3(STX, MEM,  H),			\
 	INSN_3(STX, MEM,  W),			\
 	INSN_3(STX, MEM,  DW),			\
-	INSN_3(STX, ATOMIC, W),			\
-	INSN_3(STX, ATOMIC, DW),		\
 	/*   Immediate based. */		\
 	INSN_3(ST, MEM, B),			\
 	INSN_3(ST, MEM, H),			\
@@ -2152,24 +2155,33 @@ static u64 ___bpf_prog_run(u64 *regs, const struct bpf_insn *insn)
 			if (BPF_SIZE(insn->code) == BPF_W)		\
 				atomic_##KOP((u32) SRC, (atomic_t *)(unsigned long) \
 					     (DST + insn->off));	\
-			else						\
+			else if (BPF_SIZE(insn->code) == BPF_DW)	\
 				atomic64_##KOP((u64) SRC, (atomic64_t *)(unsigned long) \
 					       (DST + insn->off));	\
+			else						\
+				goto default_label;			\
 			break;						\
 		case BOP | BPF_FETCH:					\
 			if (BPF_SIZE(insn->code) == BPF_W)		\
 				SRC = (u32) atomic_fetch_##KOP(		\
 					(u32) SRC,			\
 					(atomic_t *)(unsigned long) (DST + insn->off)); \
-			else						\
+			else if (BPF_SIZE(insn->code) == BPF_DW)	\
 				SRC = (u64) atomic64_fetch_##KOP(	\
 					(u64) SRC,			\
 					(atomic64_t *)(unsigned long) (DST + insn->off)); \
+			else						\
+				goto default_label;			\
 			break;
 
 	STX_ATOMIC_DW:
 	STX_ATOMIC_W:
+	STX_ATOMIC_H:
+	STX_ATOMIC_B:
 		switch (IMM) {
+		/* Atomic read-modify-write instructions support only W and DW
+		 * size modifiers.
+		 */
 		ATOMIC_ALU_OP(BPF_ADD, add)
 		ATOMIC_ALU_OP(BPF_AND, and)
 		ATOMIC_ALU_OP(BPF_OR, or)
@@ -2181,20 +2193,59 @@ static u64 ___bpf_prog_run(u64 *regs, const struct bpf_insn *insn)
 				SRC = (u32) atomic_xchg(
 					(atomic_t *)(unsigned long) (DST + insn->off),
 					(u32) SRC);
-			else
+			else if (BPF_SIZE(insn->code) == BPF_DW)
 				SRC = (u64) atomic64_xchg(
 					(atomic64_t *)(unsigned long) (DST + insn->off),
 					(u64) SRC);
+			else
+				goto default_label;
 			break;
 		case BPF_CMPXCHG:
 			if (BPF_SIZE(insn->code) == BPF_W)
 				BPF_R0 = (u32) atomic_cmpxchg(
 					(atomic_t *)(unsigned long) (DST + insn->off),
 					(u32) BPF_R0, (u32) SRC);
-			else
+			else if (BPF_SIZE(insn->code) == BPF_DW)
 				BPF_R0 = (u64) atomic64_cmpxchg(
 					(atomic64_t *)(unsigned long) (DST + insn->off),
 					(u64) BPF_R0, (u64) SRC);
+			else
+				goto default_label;
+			break;
+		/* Atomic load and store instructions support all size
+		 * modifiers.
+		 */
+		case BPF_LOAD_ACQ:
+			switch (BPF_SIZE(insn->code)) {
+#define LOAD_ACQUIRE(SIZEOP, SIZE)				\
+			case BPF_##SIZEOP:			\
+				DST = (SIZE)smp_load_acquire(	\
+					(SIZE *)(unsigned long)(SRC + insn->off));	\
+				break;
+			LOAD_ACQUIRE(B,   u8)
+			LOAD_ACQUIRE(H,  u16)
+			LOAD_ACQUIRE(W,  u32)
+			LOAD_ACQUIRE(DW, u64)
+#undef LOAD_ACQUIRE
+			default:
+				goto default_label;
+			}
+			break;
+		case BPF_STORE_REL:
+			switch (BPF_SIZE(insn->code)) {
+#define STORE_RELEASE(SIZEOP, SIZE)			\
+			case BPF_##SIZEOP:		\
+				smp_store_release(	\
+					(SIZE *)(unsigned long)(DST + insn->off), (SIZE)SRC);	\
+				break;
+			STORE_RELEASE(B,   u8)
+			STORE_RELEASE(H,  u16)
+			STORE_RELEASE(W,  u32)
+			STORE_RELEASE(DW, u64)
+#undef STORE_RELEASE
+			default:
+				goto default_label;
+			}
 			break;
 
 		default:
diff --git a/kernel/bpf/disasm.c b/kernel/bpf/disasm.c
index 309c4aa1b026..974d172d6735 100644
--- a/kernel/bpf/disasm.c
+++ b/kernel/bpf/disasm.c
@@ -267,6 +267,18 @@ void print_bpf_insn(const struct bpf_insn_cbs *cbs,
 				BPF_SIZE(insn->code) == BPF_DW ? "64" : "",
 				bpf_ldst_string[BPF_SIZE(insn->code) >> 3],
 				insn->dst_reg, insn->off, insn->src_reg);
+		} else if (BPF_MODE(insn->code) == BPF_ATOMIC &&
+			   insn->imm == BPF_LOAD_ACQ) {
+			verbose(cbs->private_data, "(%02x) r%d = load_acquire((%s *)(r%d %+d))\n",
+				insn->code, insn->dst_reg,
+				bpf_ldst_string[BPF_SIZE(insn->code) >> 3],
+				insn->src_reg, insn->off);
+		} else if (BPF_MODE(insn->code) == BPF_ATOMIC &&
+			   insn->imm == BPF_STORE_REL) {
+			verbose(cbs->private_data, "(%02x) store_release((%s *)(r%d %+d), r%d)\n",
+				insn->code,
+				bpf_ldst_string[BPF_SIZE(insn->code) >> 3],
+				insn->dst_reg, insn->off, insn->src_reg);
 		} else {
 			verbose(cbs->private_data, "BUG_%02x\n", insn->code);
 		}
diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 22c4edc8695c..dac7af73ac8a 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -579,6 +579,13 @@ static bool is_cmpxchg_insn(const struct bpf_insn *insn)
 	       insn->imm == BPF_CMPXCHG;
 }
 
+static bool is_atomic_load_insn(const struct bpf_insn *insn)
+{
+	return BPF_CLASS(insn->code) == BPF_STX &&
+	       BPF_MODE(insn->code) == BPF_ATOMIC &&
+	       insn->imm == BPF_LOAD_ACQ;
+}
+
 static int __get_spi(s32 off)
 {
 	return (-off - 1) / BPF_REG_SIZE;
@@ -3567,7 +3574,7 @@ static bool is_reg64(struct bpf_verifier_env *env, struct bpf_insn *insn,
 	}
 
 	if (class == BPF_STX) {
-		/* BPF_STX (including atomic variants) has multiple source
+		/* BPF_STX (including atomic variants) has one or more source
 		 * operands, one of which is a ptr. Check whether the caller is
 		 * asking about it.
 		 */
@@ -4181,7 +4188,7 @@ static int backtrack_insn(struct bpf_verifier_env *env, int idx, int subseq_idx,
 			   * dreg still needs precision before this insn
 			   */
 		}
-	} else if (class == BPF_LDX) {
+	} else if (class == BPF_LDX || is_atomic_load_insn(insn)) {
 		if (!bt_is_reg_set(bt, dreg))
 			return 0;
 		bt_clear_reg(bt, dreg);
@@ -7766,6 +7773,32 @@ static int check_atomic_rmw(struct bpf_verifier_env *env,
 	return 0;
 }
 
+static int check_atomic_load(struct bpf_verifier_env *env,
+			     struct bpf_insn *insn)
+{
+	if (!atomic_ptr_type_ok(env, insn->src_reg, insn)) {
+		verbose(env, "BPF_ATOMIC loads from R%d %s is not allowed\n",
+			insn->src_reg,
+			reg_type_str(env, reg_state(env, insn->src_reg)->type));
+		return -EACCES;
+	}
+
+	return check_load_mem(env, insn, true, false, false, "atomic_load");
+}
+
+static int check_atomic_store(struct bpf_verifier_env *env,
+			      struct bpf_insn *insn)
+{
+	if (!atomic_ptr_type_ok(env, insn->dst_reg, insn)) {
+		verbose(env, "BPF_ATOMIC stores into R%d %s is not allowed\n",
+			insn->dst_reg,
+			reg_type_str(env, reg_state(env, insn->dst_reg)->type));
+		return -EACCES;
+	}
+
+	return check_store_reg(env, insn, true);
+}
+
 static int check_atomic(struct bpf_verifier_env *env, struct bpf_insn *insn)
 {
 	switch (insn->imm) {
@@ -7780,6 +7813,10 @@ static int check_atomic(struct bpf_verifier_env *env, struct bpf_insn *insn)
 	case BPF_XCHG:
 	case BPF_CMPXCHG:
 		return check_atomic_rmw(env, insn);
+	case BPF_LOAD_ACQ:
+		return check_atomic_load(env, insn);
+	case BPF_STORE_REL:
+		return check_atomic_store(env, insn);
 	default:
 		verbose(env, "BPF_ATOMIC uses invalid atomic opcode %02x\n",
 			insn->imm);
@@ -20605,7 +20642,9 @@ static int convert_ctx_accesses(struct bpf_verifier_env *env)
 			   insn->code == (BPF_ST | BPF_MEM | BPF_W) ||
 			   insn->code == (BPF_ST | BPF_MEM | BPF_DW)) {
 			type = BPF_WRITE;
-		} else if ((insn->code == (BPF_STX | BPF_ATOMIC | BPF_W) ||
+		} else if ((insn->code == (BPF_STX | BPF_ATOMIC | BPF_B) ||
+			    insn->code == (BPF_STX | BPF_ATOMIC | BPF_H) ||
+			    insn->code == (BPF_STX | BPF_ATOMIC | BPF_W) ||
 			    insn->code == (BPF_STX | BPF_ATOMIC | BPF_DW)) &&
 			   env->insn_aux_data[i + delta].ptr_type == PTR_TO_ARENA) {
 			insn->code = BPF_STX | BPF_PROBE_ATOMIC | BPF_SIZE(insn->code);
diff --git a/tools/include/uapi/linux/bpf.h b/tools/include/uapi/linux/bpf.h
index beac5cdf2d2c..bb37897c0393 100644
--- a/tools/include/uapi/linux/bpf.h
+++ b/tools/include/uapi/linux/bpf.h
@@ -51,6 +51,9 @@
 #define BPF_XCHG	(0xe0 | BPF_FETCH)	/* atomic exchange */
 #define BPF_CMPXCHG	(0xf0 | BPF_FETCH)	/* atomic compare-and-write */
 
+#define BPF_LOAD_ACQ	0x100	/* load-acquire */
+#define BPF_STORE_REL	0x110	/* store-release */
+
 enum bpf_cond_pseudo_jmp {
 	BPF_MAY_GOTO = 0,
 };
-- 
2.48.1.711.g2feabab25a-goog


