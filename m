Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C2EE77197
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 02:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4UjZolz5E/NeRAD/hPdz8QuR6mdLUg8da+IaKtziAes=; b=LcCnjs2ZipbONalW8RgS8ufrNq
	nEv4vxMZvZ2w/GwNwknpBnxPtTmgQKcuqW+g6ydaYNgOJ8DnLCAjgMy5RUogVOTxgAaZZawTgfsjR
	VCVgpSYFFjFXe8qUIV/9FM8iLJ6obKLvVlIrjYpDRZIhF454qoPK8bcPEDjWYiyQ4LP8jYjOFZMVU
	QL6C6T4mB4iQyO8hss3hR1o4rHEndgy/x3No/6IEV24JE0L1pZT2Pxqb8pgE13tTT/KLHk89GzBaj
	2NG7TINDYQ2VRQTr/WKEzMBD+vmYFDtOtDZEypt8y2pY9DQMz4Edguo6KIUsFyBQ3I9RoMUZLxPU5
	mdgqAHEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTX5h-0000000BtHJ-0hj8;
	Fri, 03 Jan 2025 02:07:09 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTX3Q-0000000Bssd-3pzl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 02:04:50 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-21631cbf87dso143788735ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 18:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735869887; x=1736474687; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4UjZolz5E/NeRAD/hPdz8QuR6mdLUg8da+IaKtziAes=;
        b=muyLex0FEF3J44w5Voh0f4xO237bjkHPOU7bToNo38cN9LeAwJdD+0XiBctc0pFkxR
         1+JlNYxXd0o8V0XB/SLwTK4gTGHcFaRSrK+cSBTTkanoR8EpvYdS01usZYrz1lUZ/pUx
         lxJ1I5Tfen7YtxcZS6HV/OyZETFshEC5ukEvWHAf3vTWaM8Ts/rbANUFutugrOZ1lkIn
         YZQ8eiJpdpc2IvKjGFwnAvlWiLd9uII+V2KF4KVi9ZtpoYcRaNDTt/P9tAz/BhNGNf3P
         zHkBvbwcKozMxsiLPIqYyjggrZ5n1GjB1pDrlt8OKZ30G7AMUY/Cjekri92z76bbE6NU
         Y2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735869887; x=1736474687;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4UjZolz5E/NeRAD/hPdz8QuR6mdLUg8da+IaKtziAes=;
        b=tNSYGJ+PhEI5x57iBNemecggfMlgajnppobBLF1OOJcztJQTp1HQY4Ca1lrXPvEEc4
         ne/0O75MD3suLlFbvUL7pwb9rS0RBK+KaA8aDYxXg4mCJU1s6XynO8n+mOnzv/V2MCpx
         6RXbhYwY7PxtPyL8buJ8K5vuAVONq3EDHAjA+RRQmTzGjcM/LLU2cNpfLdrwyojK8+W2
         tp/KizqUbJqBqOtX8q7XleRPwT37okT9TmFv7GZckWoX+k27DbH1xA8ZUkBigokqDHLW
         8dwqPf42wXN25HoxCXoqKjd3h+Yl0jl6mbzMHq4eF/6vQTk8l2XgHRX9gArRrlpNv4el
         KiHw==
X-Forwarded-Encrypted: i=1; AJvYcCX1KDDDMciQD0oPaPdsbYIjxnJ/8k1V04+VLn8oivG3PidNLKt/VSX+enZrzyEQ2Cnvw+FuGMsPcdgEuzBRCh7I@lists.infradead.org
X-Gm-Message-State: AOJu0YyOYIlLtbsvwGFF2ibyXbXebkLysThTzF9x594aQM5gKg3kiGLV
	TBDcJI+0ZzjaGknjlqAtqf7i8cox9FBk/Houaq4ur4v3iKmTMUphBZE/oRt0cqkki7obtBQBT3b
	3FJdjK/0nlQ==
X-Google-Smtp-Source: AGHT+IFn9sa16Ybx9bMnT3j8/6v7ZyNcSwDP48OOodsufyBW3mKo0tvoS5jljQA1jigXnWx+/SHMhWvEv0+uPw==
X-Received: from pfbc2.prod.google.com ([2002:a05:6a00:ad02:b0:725:eeaa:65e2])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:7896:b0:1e0:d9a0:4ff7 with SMTP id adf61e73a8af0-1e5e08011d6mr82625682637.32.1735869887482;
 Thu, 02 Jan 2025 18:04:47 -0800 (PST)
Date: Fri,  3 Jan 2025 02:04:18 +0000
In-Reply-To: <e8520e5503a489e2dea8526077976ae5a0ab1849.1735868489.git.yepeilin@google.com>
Mime-Version: 1.0
References: <e8520e5503a489e2dea8526077976ae5a0ab1849.1735868489.git.yepeilin@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <9ad3034a62361d91a99af24efa03f48c4c9e13ea.1735868489.git.yepeilin@google.com>
Subject: [PATCH bpf-next v2 3/3] bpf, arm64: Emit A64_{ADD,SUB}_I when
 possible in emit_{lse,ll_sc}_atomic()
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
X-CRM114-CacheID: sfid-20250102_180448_965680_5DA5356B 
X-CRM114-Status: GOOD (  14.42  )
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
to the base address by doing e.g.:

  if (off) {
          emit_a64_mov_i(1, tmp, off, ctx);
          emit(A64_ADD(1, tmp, tmp, dst), ctx);
  ...

As pointed out by Xu, we can use emit_a64_add_i() (added in the previous
patch) instead, which tries to combine the above into a single A64_ADD_I
or A64_SUB_I when possible.

Suggested-by: Xu Kuohai <xukuohai@huaweicloud.com>
Signed-off-by: Peilin Ye <yepeilin@google.com>
---
change in v2:
  * move the logic into a helper (added in v2 2/3) and use it (Xu)

v1: https://lore.kernel.org/bpf/953c7241e82496cb7a8b5a8724028ad646cd0896.1735342016.git.yepeilin@google.com/

 arch/arm64/net/bpf_jit_comp.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index 8ee9528d8795..8446848edddb 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -662,8 +662,7 @@ static int emit_lse_atomic(const struct bpf_insn *insn, struct jit_ctx *ctx)
 	u8 reg = dst;
 
 	if (off) {
-		emit_a64_mov_i(1, tmp, off, ctx);
-		emit(A64_ADD(1, tmp, tmp, dst), ctx);
+		emit_a64_add_i(1, tmp, reg, tmp, off, ctx);
 		reg = tmp;
 	}
 	if (arena) {
@@ -734,7 +733,7 @@ static int emit_ll_sc_atomic(const struct bpf_insn *insn, struct jit_ctx *ctx)
 	const s32 imm = insn->imm;
 	const s16 off = insn->off;
 	const bool isdw = BPF_SIZE(code) == BPF_DW;
-	u8 reg;
+	u8 reg = dst;
 	s32 jmp_offset;
 
 	if (BPF_MODE(code) == BPF_PROBE_ATOMIC) {
@@ -743,11 +742,8 @@ static int emit_ll_sc_atomic(const struct bpf_insn *insn, struct jit_ctx *ctx)
 		return -EINVAL;
 	}
 
-	if (!off) {
-		reg = dst;
-	} else {
-		emit_a64_mov_i(1, tmp, off, ctx);
-		emit(A64_ADD(1, tmp, tmp, dst), ctx);
+	if (off) {
+		emit_a64_add_i(1, tmp, reg, tmp, off, ctx);
 		reg = tmp;
 	}
 
-- 
2.47.1.613.gc27f4b7a9f-goog


