Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 204EEC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 00:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VycOpllnvSzKdjd9R3576qTHHYaFrsKy4wd3sa7AubQ=; b=FJ8XCd++TG+S/+YSdgdwv25UhN
	azKJ2powvAQOanuROIvLpw3QMcMTkpBm3aHm79Em0rIVmoyEJygH2jAuJpwOB1jik2n5/99r2D2LO
	ZLGYZzauFWAQzLUVAhJHSKBovVJFiKEkokODcmPTWLtiBIWL5NINiG2iRiRcgm6pGALLLhFTgQFum
	bc7cDzu6UReBv1cX/NGJXlPYxI5I9ynrCzP2Ffawk3wgawt1n4kVu3jpNZNA4BEmTlq5U4A0xjWu6
	ErucXrX7ljbNbnM+nlvE6ojak6I0k0U6vYm8AFcr0sMYXVzDxoOIzjRjkOeJi+VKwMX0RyOqBHKXO
	GAPulxPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpG3y-00000002eIW-39AC;
	Tue, 04 Mar 2025 00:23:10 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpFvX-00000002d85-3t6H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 00:14:29 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2fe98fad333so9951330a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 16:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741047267; x=1741652067; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VycOpllnvSzKdjd9R3576qTHHYaFrsKy4wd3sa7AubQ=;
        b=Xda1dXYCO7DKNWVfTbqeyWYQviQeyAmqiWOGCNvJIF58mq7+P+TOKEWEtfPaX/SmNG
         qdBBRfzVB/C4F+Q+d/Na7JdrDiu6XWV8p4PUIR77P5wEHUoNdQmYOHdLgwZEfkllCsUJ
         jCDrbCBGfBdmUdQDweohAJEQOsVnrpHm+5d3vvi8HAUyC1G/YWJoZqnvQUc+D2plC9ym
         F0A1iJqFRSkWqiNigX+qFWy6QL/SzFBZplAyucV8VZhP9njb5HfZfQ/D4auy0Ee/T9Iq
         H5N2rloBLTpeRfRAnXrF+Mb5l/lLeVS4tn2i5VBviHcH1pH0PjYZM3iRWFJ2+BsndkT0
         bg6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741047267; x=1741652067;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VycOpllnvSzKdjd9R3576qTHHYaFrsKy4wd3sa7AubQ=;
        b=EMQq6XQSKqLyKrkAUYgZ0Y4wS34ipcouOR36U66By6UgKpHuJS/wDREc6W6HKJgg+g
         22GdFCQRDKN58sboqIXh6z7F68PQZ+LCfrjIjgAoNdDKWA9Ya3FnpXhqfZq81UcthOLR
         9N1oOurdV7c/GwaxqtTXKED7ocWFhOdfJX7M4f/Kky/P50fm56ZYeGD2DM3WmYBMrJog
         uQEQryaVyi/+fldOT+Mm/vYFumY5tnDY8Cy7LMyiI+5b53m66IT9cIPbUFa9CB1wzzXS
         K1bMGISh03CvjEDg17aChK+XxszMw256xPOX2qj3PGrKXy4jTOEsCP/3VqOCJHk4XQOh
         iArg==
X-Forwarded-Encrypted: i=1; AJvYcCW0HLKvzD9WEbNQz/lt11Au+IeZUbQ8oJj+x4c6JB3muNGN8LzqdlPsWYBBEpVoqYywKvpv0ew7K/87gyMHJ0W9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2w0aV4h8EevO7Fn1csxPux2RcN/13bi3gxtAizZieC2P68be6
	fiLC9NAnOCaSln/whAzF46apWyEJJ6RkwRw0lgTp3CR2YhW6cI8Aak05FZWRVWYZN20huaMKheX
	AJ2/UsfL8uQ==
X-Google-Smtp-Source: AGHT+IGlZNGqUmDxTly2qYsBgk0PptIg3lItr8uvTn+ohlGwkImKw4P0KNR+Inhl9r8cGtTP+KHApKcxMgVj4Q==
X-Received: from pjbqc14.prod.google.com ([2002:a17:90b:288e:b0:2f2:ea3f:34c3])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:278d:b0:2f8:34df:5652 with SMTP id 98e67ed59e1d1-2febab703femr20133867a91.21.1741047267046;
 Mon, 03 Mar 2025 16:14:27 -0800 (PST)
Date: Tue,  4 Mar 2025 00:14:22 +0000
In-Reply-To: <cover.1741046028.git.yepeilin@google.com>
Mime-Version: 1.0
References: <cover.1741046028.git.yepeilin@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <c4b2b97086e214ee24aafeb5f57cb1275a4469ef.1741046028.git.yepeilin@google.com>
Subject: [PATCH bpf-next v5 5/6] bpf, x86: Support load-acquire and
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
X-CRM114-CacheID: sfid-20250303_161427_957826_D428DDE6 
X-CRM114-Status: GOOD (  16.89  )
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

Recently we introduced BPF load-acquire (BPF_LOAD_ACQ) and store-release
(BPF_STORE_REL) instructions.  For x86-64, simply implement them as
regular BPF_LDX/BPF_STX loads and stores.  The verifier always rejects
misaligned load-acquires/store-releases (even if BPF_F_ANY_ALIGNMENT is
set), so emitted MOV* instructions are guaranteed to be atomic.

Arena accesses are supported.  8- and 16-bit load-acquires are
zero-extending (i.e., MOVZBQ, MOVZWQ).

Rename emit_atomic{,_index}() to emit_atomic_rmw{,_index}() to make it
clear that they only handle read-modify-write atomics, and extend their
@atomic_op parameter from u8 to u32, since we are starting to use more
than the lowest 8 bits of the 'imm' field.

Signed-off-by: Peilin Ye <yepeilin@google.com>
---
 arch/x86/net/bpf_jit_comp.c | 99 ++++++++++++++++++++++++++++++-------
 1 file changed, 82 insertions(+), 17 deletions(-)

diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
index f0c31c940fb8..0263d98d92b0 100644
--- a/arch/x86/net/bpf_jit_comp.c
+++ b/arch/x86/net/bpf_jit_comp.c
@@ -1242,8 +1242,8 @@ static void emit_st_r12(u8 **pprog, u32 size, u32 dst_reg, int off, int imm)
 	emit_st_index(pprog, size, dst_reg, X86_REG_R12, off, imm);
 }
 
-static int emit_atomic(u8 **pprog, u8 atomic_op,
-		       u32 dst_reg, u32 src_reg, s16 off, u8 bpf_size)
+static int emit_atomic_rmw(u8 **pprog, u32 atomic_op,
+			   u32 dst_reg, u32 src_reg, s16 off, u8 bpf_size)
 {
 	u8 *prog = *pprog;
 
@@ -1283,8 +1283,9 @@ static int emit_atomic(u8 **pprog, u8 atomic_op,
 	return 0;
 }
 
-static int emit_atomic_index(u8 **pprog, u8 atomic_op, u32 size,
-			     u32 dst_reg, u32 src_reg, u32 index_reg, int off)
+static int emit_atomic_rmw_index(u8 **pprog, u32 atomic_op, u32 size,
+				 u32 dst_reg, u32 src_reg, u32 index_reg,
+				 int off)
 {
 	u8 *prog = *pprog;
 
@@ -1297,7 +1298,7 @@ static int emit_atomic_index(u8 **pprog, u8 atomic_op, u32 size,
 		EMIT1(add_3mod(0x48, dst_reg, src_reg, index_reg));
 		break;
 	default:
-		pr_err("bpf_jit: 1 and 2 byte atomics are not supported\n");
+		pr_err("bpf_jit: 1- and 2-byte RMW atomics are not supported\n");
 		return -EFAULT;
 	}
 
@@ -1331,6 +1332,49 @@ static int emit_atomic_index(u8 **pprog, u8 atomic_op, u32 size,
 	return 0;
 }
 
+static int emit_atomic_ld_st(u8 **pprog, u32 atomic_op, u32 dst_reg,
+			     u32 src_reg, s16 off, u8 bpf_size)
+{
+	switch (atomic_op) {
+	case BPF_LOAD_ACQ:
+		/* dst_reg = smp_load_acquire(src_reg + off16) */
+		emit_ldx(pprog, bpf_size, dst_reg, src_reg, off);
+		break;
+	case BPF_STORE_REL:
+		/* smp_store_release(dst_reg + off16, src_reg) */
+		emit_stx(pprog, bpf_size, dst_reg, src_reg, off);
+		break;
+	default:
+		pr_err("bpf_jit: unknown atomic load/store opcode %02x\n",
+		       atomic_op);
+		return -EFAULT;
+	}
+
+	return 0;
+}
+
+static int emit_atomic_ld_st_index(u8 **pprog, u32 atomic_op, u32 size,
+				   u32 dst_reg, u32 src_reg, u32 index_reg,
+				   int off)
+{
+	switch (atomic_op) {
+	case BPF_LOAD_ACQ:
+		/* dst_reg = smp_load_acquire(src_reg + idx_reg + off16) */
+		emit_ldx_index(pprog, size, dst_reg, src_reg, index_reg, off);
+		break;
+	case BPF_STORE_REL:
+		/* smp_store_release(dst_reg + idx_reg + off16, src_reg) */
+		emit_stx_index(pprog, size, dst_reg, src_reg, index_reg, off);
+		break;
+	default:
+		pr_err("bpf_jit: unknown atomic load/store opcode %02x\n",
+		       atomic_op);
+		return -EFAULT;
+	}
+
+	return 0;
+}
+
 #define DONT_CLEAR 1
 
 bool ex_handler_bpf(const struct exception_table_entry *x, struct pt_regs *regs)
@@ -2113,6 +2157,13 @@ st:			if (is_imm8(insn->off))
 			}
 			break;
 
+		case BPF_STX | BPF_ATOMIC | BPF_B:
+		case BPF_STX | BPF_ATOMIC | BPF_H:
+			if (!bpf_atomic_is_load_store(insn)) {
+				pr_err("bpf_jit: 1- and 2-byte RMW atomics are not supported\n");
+				return -EFAULT;
+			}
+			fallthrough;
 		case BPF_STX | BPF_ATOMIC | BPF_W:
 		case BPF_STX | BPF_ATOMIC | BPF_DW:
 			if (insn->imm == (BPF_AND | BPF_FETCH) ||
@@ -2148,10 +2199,10 @@ st:			if (is_imm8(insn->off))
 				EMIT2(simple_alu_opcodes[BPF_OP(insn->imm)],
 				      add_2reg(0xC0, AUX_REG, real_src_reg));
 				/* Attempt to swap in new value */
-				err = emit_atomic(&prog, BPF_CMPXCHG,
-						  real_dst_reg, AUX_REG,
-						  insn->off,
-						  BPF_SIZE(insn->code));
+				err = emit_atomic_rmw(&prog, BPF_CMPXCHG,
+						      real_dst_reg, AUX_REG,
+						      insn->off,
+						      BPF_SIZE(insn->code));
 				if (WARN_ON(err))
 					return err;
 				/*
@@ -2166,17 +2217,35 @@ st:			if (is_imm8(insn->off))
 				break;
 			}
 
-			err = emit_atomic(&prog, insn->imm, dst_reg, src_reg,
-					  insn->off, BPF_SIZE(insn->code));
+			if (bpf_atomic_is_load_store(insn))
+				err = emit_atomic_ld_st(&prog, insn->imm, dst_reg, src_reg,
+							insn->off, BPF_SIZE(insn->code));
+			else
+				err = emit_atomic_rmw(&prog, insn->imm, dst_reg, src_reg,
+						      insn->off, BPF_SIZE(insn->code));
 			if (err)
 				return err;
 			break;
 
+		case BPF_STX | BPF_PROBE_ATOMIC | BPF_B:
+		case BPF_STX | BPF_PROBE_ATOMIC | BPF_H:
+			if (!bpf_atomic_is_load_store(insn)) {
+				pr_err("bpf_jit: 1- and 2-byte RMW atomics are not supported\n");
+				return -EFAULT;
+			}
+			fallthrough;
 		case BPF_STX | BPF_PROBE_ATOMIC | BPF_W:
 		case BPF_STX | BPF_PROBE_ATOMIC | BPF_DW:
 			start_of_ldx = prog;
-			err = emit_atomic_index(&prog, insn->imm, BPF_SIZE(insn->code),
-						dst_reg, src_reg, X86_REG_R12, insn->off);
+
+			if (bpf_atomic_is_load_store(insn))
+				err = emit_atomic_ld_st_index(&prog, insn->imm,
+							      BPF_SIZE(insn->code), dst_reg,
+							      src_reg, X86_REG_R12, insn->off);
+			else
+				err = emit_atomic_rmw_index(&prog, insn->imm, BPF_SIZE(insn->code),
+							    dst_reg, src_reg, X86_REG_R12,
+							    insn->off);
 			if (err)
 				return err;
 			goto populate_extable;
@@ -3771,12 +3840,8 @@ bool bpf_jit_supports_insn(struct bpf_insn *insn, bool in_arena)
 	if (!in_arena)
 		return true;
 	switch (insn->code) {
-	case BPF_STX | BPF_ATOMIC | BPF_B:
-	case BPF_STX | BPF_ATOMIC | BPF_H:
 	case BPF_STX | BPF_ATOMIC | BPF_W:
 	case BPF_STX | BPF_ATOMIC | BPF_DW:
-		if (bpf_atomic_is_load_store(insn))
-			return false;
 		if (insn->imm == (BPF_AND | BPF_FETCH) ||
 		    insn->imm == (BPF_OR | BPF_FETCH) ||
 		    insn->imm == (BPF_XOR | BPF_FETCH))
-- 
2.48.1.711.g2feabab25a-goog


