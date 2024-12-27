Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D81D0E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 23:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V1Jom10EOQH/PKFAAJHq8N5xyHFec0ta56+9r5GmZ5A=; b=oYjhlg4TqGyhU3hN45JkA0ZHrL
	sA+G+iLYcohrpEnfzBbBNLEdNuVG8hhy3NJd2HfWqzVbmgxDgukMwWLRu3BV+/n4j67cZC36esS4z
	WRRkMTgPzI2sIOZs4DOMzALXjZyIV6GoceDlwaUmzySd/xiSAwd9Q2zulxq/gD10wi5tjbeplWDoo
	KXsCB10BBX7/G4qIVZBpct/DSXpLULUwurFTH1nUVg51/iREof6Iv+GXXZ6cwYFUEEGAg+MWhzV5U
	vhZtDeoVeUZN4YzJ27qM0+DSXYxdEIBpLf0eEN2NvS9K5GW2ZDKeNDXYHiap2QS1i4pZ3fEZcApPt
	ePoUxHvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRJue-000000016f6-3dYK;
	Fri, 27 Dec 2024 23:38:36 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRJtF-000000016Uq-4Ayf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 23:37:11 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2efc3292021so15525325a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Dec 2024 15:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735342628; x=1735947428; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=V1Jom10EOQH/PKFAAJHq8N5xyHFec0ta56+9r5GmZ5A=;
        b=a5vdP62M1fD2YiQNbAdi1IDWshMpNrJd9AuKpz9ahqO+jK04Z9p6/rckW2TfTWh5AO
         WF8q4UP+RoTy+nQVSoZus39cSkXlYph5DJHzViPYbBNW4wz2V9ku18/2shBgAM81VYcK
         jaqz+ozdP6cBhhZgybgC8hIXXxG08Eefj9dN/NW/dKX60KoqDDLW+/f5MAueOjakoz48
         eALALSluc9Pu7QcUagnLm/hBxdjP+mgT572y2Zy41frawC3Gg/wHCbKPD6H1znvL1u5J
         KDo3LcQwYCwZrVhLCTCj4C/PdEHKgTchNydLuSOD/SBLubS74X8cbYfJEpZYuoiJOGN/
         DuYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735342628; x=1735947428;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V1Jom10EOQH/PKFAAJHq8N5xyHFec0ta56+9r5GmZ5A=;
        b=ZBxDkg2PdA7J7BFz/wUIzfyR2dj/KiZvjp9D4LHO63ZagWC8+seOLK5XLHa2DL6I+G
         xfu7HWkhG+au3CnNko31qrpLpXsdv7+lJKzAqrFuUkCZ+wjLn314S/4F5Qorrz65zLp4
         i0BdMFN8sZ5xkXxfIJMdB32C64BqgfD+C9x1V42u1l0nspEa+oBBfZbPKJPHGO7NKJOb
         llElxqknIoRL8rXulUMZDZRwV3gWCxnhUzNHRhprRU+rmVST9D//fBoAERSYg++KE2HD
         iYCURfZ6z25N7MTNQAtLr35XrLl7dpVGerdXOCMu4zAXlzt6mtbrfbp1lfmNsqgZS/ZU
         Fxow==
X-Forwarded-Encrypted: i=1; AJvYcCWGJdHEpIN9gnnM/VEcC7eFMQCBPknfpGOSBmQGXXCuAf9Yu/c2Ll9Lc2RSRpZfmFRiJXjf7QQqgMwDKeHgd+cS@lists.infradead.org
X-Gm-Message-State: AOJu0YzDu+CMdWJYeuLox8RfSi0JIbY3N/6PB85q3f4SzC2mut881UyM
	kg2v6LcMQeep4D3odW4tvc4XMATK0TyvHcVzh0/mmpEHfJTq7vSOEXxeFej76Z4oGFe3aK8eNqi
	V9Hd4Li5fLQ==
X-Google-Smtp-Source: AGHT+IHLqDFBZY1ka2PsyCGmywlPi9etlGqovVDfnWYdL0s2CLTlisPa8ylI+ySeYFuG7avGHeJOt2PnDcL76g==
X-Received: from pfbf11.prod.google.com ([2002:a05:6a00:ad8b:b0:728:e916:1a4f])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:808f:b0:724:59e0:5d22 with SMTP id d2e1a72fcca58-72abdebb934mr45961712b3a.20.1735342628610;
 Fri, 27 Dec 2024 15:37:08 -0800 (PST)
Date: Fri, 27 Dec 2024 23:36:22 +0000
In-Reply-To: <3b84fa17ab72f3f69e09e0032452d17eb13b80db.1735342016.git.yepeilin@google.com>
Mime-Version: 1.0
References: <3b84fa17ab72f3f69e09e0032452d17eb13b80db.1735342016.git.yepeilin@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <953c7241e82496cb7a8b5a8724028ad646cd0896.1735342016.git.yepeilin@google.com>
Subject: [PATCH bpf-next 2/2] bpf, arm64: Emit A64_{ADD,SUB}_I when possible
 in emit_{lse,ll_sc}_atomic()
From: Peilin Ye <yepeilin@google.com>
To: bpf@vger.kernel.org
Cc: Peilin Ye <yepeilin@google.com>, Xu Kuohai <xukuohai@huaweicloud.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Josh Don <joshdon@google.com>, 
	Barret Rhoden <brho@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_153710_037828_14EED9C5 
X-CRM114-Status: GOOD (  13.84  )
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

Currently in emit_{lse,ll_sc}_atomic(), if there is an offset, we add it
to the base address by emitting two instructions, for example:

  if (off) {
          emit_a64_mov_i(1, tmp, off, ctx);
          emit(A64_ADD(1, tmp, tmp, dst), ctx);
  ...

As pointed out by Xu, we can combine the above into a single A64_ADD_I
instruction if 'is_addsub_imm(off)' is true, or an A64_SUB_I, if
'is_addsub_imm(-off)' is true.

Suggested-by: Xu Kuohai <xukuohai@huaweicloud.com>
Signed-off-by: Peilin Ye <yepeilin@google.com>
---
Hi all,

This was pointed out by Xu in [1] .  Tested on x86-64, using
PLATFORM=aarch64 CROSS_COMPILE=aarch64-linux-gnu- vmtest.sh:

LSE:
  * ./test_progs-cpuv4 -a atomics,arena_atomics
    2/15 PASSED, 0 SKIPPED, 0 FAILED
  * ./test_verifier
    790 PASSED, 0 SKIPPED, 0 FAILED

LL/SC:
(In vmtest.sh, changed '-cpu' QEMU option from 'cortex-a76' to
 'cortex-a57', to make LSE atomics unavailable.)
  * ./test_progs-cpuv4 -a atomics
    1/7 PASSED, 0 SKIPPED, 0 FAILED
  * ./test_verifier
    790 PASSED, 0 SKIPPED, 0 FAILED

Thanks,
Peilin Ye

[1] https://lore.kernel.org/bpf/f704019d-a8fa-4cf5-a606-9d8328360a3e@huaweicloud.com/

 arch/arm64/net/bpf_jit_comp.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index 9040033eb1ea..f15bbe92fed9 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -649,8 +649,14 @@ static int emit_lse_atomic(const struct bpf_insn *insn, struct jit_ctx *ctx)
 	u8 reg = dst;
 
 	if (off) {
-		emit_a64_mov_i(1, tmp, off, ctx);
-		emit(A64_ADD(1, tmp, tmp, dst), ctx);
+		if (is_addsub_imm(off)) {
+			emit(A64_ADD_I(1, tmp, reg, off), ctx);
+		} else if (is_addsub_imm(-off)) {
+			emit(A64_SUB_I(1, tmp, reg, -off), ctx);
+		} else {
+			emit_a64_mov_i(1, tmp, off, ctx);
+			emit(A64_ADD(1, tmp, tmp, reg), ctx);
+		}
 		reg = tmp;
 	}
 	if (arena) {
@@ -721,7 +727,7 @@ static int emit_ll_sc_atomic(const struct bpf_insn *insn, struct jit_ctx *ctx)
 	const s32 imm = insn->imm;
 	const s16 off = insn->off;
 	const bool isdw = BPF_SIZE(code) == BPF_DW;
-	u8 reg;
+	u8 reg = dst;
 	s32 jmp_offset;
 
 	if (BPF_MODE(code) == BPF_PROBE_ATOMIC) {
@@ -730,11 +736,15 @@ static int emit_ll_sc_atomic(const struct bpf_insn *insn, struct jit_ctx *ctx)
 		return -EINVAL;
 	}
 
-	if (!off) {
-		reg = dst;
-	} else {
-		emit_a64_mov_i(1, tmp, off, ctx);
-		emit(A64_ADD(1, tmp, tmp, dst), ctx);
+	if (off) {
+		if (is_addsub_imm(off)) {
+			emit(A64_ADD_I(1, tmp, reg, off), ctx);
+		} else if (is_addsub_imm(-off)) {
+			emit(A64_SUB_I(1, tmp, reg, -off), ctx);
+		} else {
+			emit_a64_mov_i(1, tmp, off, ctx);
+			emit(A64_ADD(1, tmp, tmp, reg), ctx);
+		}
 		reg = tmp;
 	}
 
-- 
2.47.1.613.gc27f4b7a9f-goog


