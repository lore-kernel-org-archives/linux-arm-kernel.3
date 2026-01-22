Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBB1D625FA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 07:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G3Q6y9uuDnZT4fchJSYQvOs3qoNM/plkLt24+BhC4KM=; b=N1ZR3xbVj1BQehJiBuM2f6PPZ9
	WRyVv2ExpOj+s/P2XhHCmKEd44XL3pR/QRrFu2he9ACikR16MztwopfPrQVHGUcmgjgZtcXI4c3lP
	XXRtjijr5tqus/FlvPLCrdnbDdUY/173BDBKlyiFxjomEtPISlg0Y3S8txbBpGbtJnleExLvGY8oG
	j/Rl0xZp+lHgaUfu5YOTG00SBbKPQvP8FFx0fG/3yePK5xM6AhZJ8fx/meEw/WF2g/SxQGqQ9eqoE
	3uijGm9/JHoBu2oLL0R+eB7Gtl9fxyZFfedJ+bfaqDMyvXVz/CU4Wbj0XQdn/SIQBIe350fxzFo/z
	VxzXsXrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipAY-00000006YMb-2NoB;
	Thu, 22 Jan 2026 07:31:54 +0000
Received: from mail-dl1-x124a.google.com ([2607:f8b0:4864:20::124a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipAJ-00000006Y5E-1PK1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 07:31:40 +0000
Received: by mail-dl1-x124a.google.com with SMTP id a92af1059eb24-12339e20a86so914211c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 23:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769067098; x=1769671898; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G3Q6y9uuDnZT4fchJSYQvOs3qoNM/plkLt24+BhC4KM=;
        b=uVsIt0w0NoUaKvsdszAxwnIzYDz+rYRl7vYpw9ggQrj/hL6lKM2qFWKL4iMuaWXWbC
         vOxsCPv5lKv4wFuxjI1pXOx3kL39nCVta7oBxbwP2Be0BIZ4jvQRDKrfRubUJ+2Ve2gB
         N/whs5OZzDQ/pDPi7CAKxZiGVLmW0D/HBzFR7CX7ZYpdEYSIrcEltruNST3Lh8P0Um11
         0q8dfHxXYlmLPajeJSBhF3VTh0djSRqvqF6lg1l3Lcm8J883dAnzHO+taVRTmi7cvy8k
         5T+Auqga1Q4LTACB60Ok062CB+Z9mJ6yzKhwJH5ol13K+b0QCUYZEOmsIL/Y840uxix7
         6Scg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769067098; x=1769671898;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G3Q6y9uuDnZT4fchJSYQvOs3qoNM/plkLt24+BhC4KM=;
        b=FEZl63Eg/dAdBmS98VTNxPIIEWH8/ho+wES2yf/A3oJJHfz6ShRtrl4N0gEOqu3Jzi
         345X1j6Qhai7MCDY6Vsx+UMskMGAwqGvDNfyc8mQQeOZArnSqPrp2W2IGlP0QoIsuBft
         ERK4dzaOzsx9/DIo/ZFFNyt54bWAXdQYmJAi0pgVMEIKGry38o4rDmWn9fABlZFxy7To
         Ls2xGC5cX+YGlbl43hC81QrxWpSszpohmh6iuhROvP0XIYkjnXUUqPcxYIMzMr+NyJ3w
         1urzipaKUrS8irtmet3J6HP8y85Iq0OrJA5mDQBEYd5eN5jaMYujQHDyLCfhL9TCmiyw
         u4rQ==
X-Forwarded-Encrypted: i=1; AJvYcCXB0Pd9/lEypUQlesKX+rqtRuOcESIKm/QaKjNkvgjWcscfel5jTSp/W4whoGgbW3ZTSHSY+ZMwqmpOKkIpyuGk@lists.infradead.org
X-Gm-Message-State: AOJu0YzGSovtv3rUw5L6SD2Lysf0X/s6bWrBhoA96KvTekzcDB+/N+YM
	z40gKs4Gd2uRqSe7Cln0UiryI5RT3PykFb1HNURDlUxHdd6X6XagMhNPNHqNPKIjJlqFAjpLw9J
	GYFWIYQxzBg==
X-Received: from dlbvv19.prod.google.com ([2002:a05:7022:5f13:b0:119:9f33:34a6])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:6b93:b0:122:3a5:fc42
 with SMTP id a92af1059eb24-1246aa67352mr4639077c88.20.1769067097397; Wed, 21
 Jan 2026 23:31:37 -0800 (PST)
Date: Wed, 21 Jan 2026 23:31:20 -0800
In-Reply-To: <20260122073127.375139-1-irogers@google.com>
Mime-Version: 1.0
References: <20260122073127.375139-1-irogers@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260122073127.375139-5-irogers@google.com>
Subject: [PATCH v1 04/11] perf disasm: Constify use of struct ins_op
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Zecheng Li <zecheng@google.com>, 
	Tianyou Li <tianyou.li@intel.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Julia Lawall <Julia.Lawall@inria.fr>, Suchit Karunakaran <suchitkarunakaran@gmail.com>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Aditya Bodkhe <aditya.b1@linux.ibm.com>, 
	Howard Chu <howardchu95@gmail.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Shimin Guo <shimin.guo@skydio.com>, 
	Sergei Trofimovich <slyich@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_233139_402698_6650224D 
X-CRM114-Status: GOOD (  17.56  )
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

The struct ins_op holds variables to function pointers that are read
but not written. Change uses to be for a "const struct ins_op *"
version to capture this immutability.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/arch/arm/annotate/instructions.c   |  4 +-
 tools/perf/arch/arm64/annotate/instructions.c |  6 +--
 tools/perf/arch/csky/annotate/instructions.c  |  6 +--
 .../arch/loongarch/annotate/instructions.c    |  8 ++--
 tools/perf/arch/mips/annotate/instructions.c  |  4 +-
 .../perf/arch/powerpc/annotate/instructions.c |  6 +--
 .../perf/arch/riscv64/annotate/instructions.c |  4 +-
 tools/perf/arch/s390/annotate/instructions.c  |  8 ++--
 tools/perf/arch/sparc/annotate/instructions.c |  4 +-
 tools/perf/util/disasm.c                      | 46 +++++++++----------
 tools/perf/util/disasm.h                      |  6 +--
 11 files changed, 51 insertions(+), 51 deletions(-)

diff --git a/tools/perf/arch/arm/annotate/instructions.c b/tools/perf/arch/arm/annotate/instructions.c
index 5e667b0f5512..b997d127fedd 100644
--- a/tools/perf/arch/arm/annotate/instructions.c
+++ b/tools/perf/arch/arm/annotate/instructions.c
@@ -11,10 +11,10 @@ struct arm_annotate {
 		jump_insn;
 };
 
-static struct ins_ops *arm__associate_instruction_ops(struct arch *arch, const char *name)
+static const struct ins_ops *arm__associate_instruction_ops(struct arch *arch, const char *name)
 {
 	struct arm_annotate *arm = arch->priv;
-	struct ins_ops *ops;
+	const struct ins_ops *ops;
 	regmatch_t match[2];
 
 	if (!regexec(&arm->call_insn, name, 2, match, 0))
diff --git a/tools/perf/arch/arm64/annotate/instructions.c b/tools/perf/arch/arm64/annotate/instructions.c
index 5099fa36180d..363af2f55122 100644
--- a/tools/perf/arch/arm64/annotate/instructions.c
+++ b/tools/perf/arch/arm64/annotate/instructions.c
@@ -63,15 +63,15 @@ static int arm64_mov__parse(const struct arch *arch __maybe_unused,
 static int mov__scnprintf(struct ins *ins, char *bf, size_t size,
 			  struct ins_operands *ops, int max_ins_name);
 
-static struct ins_ops arm64_mov_ops = {
+static const struct ins_ops arm64_mov_ops = {
 	.parse	   = arm64_mov__parse,
 	.scnprintf = mov__scnprintf,
 };
 
-static struct ins_ops *arm64__associate_instruction_ops(struct arch *arch, const char *name)
+static const struct ins_ops *arm64__associate_instruction_ops(struct arch *arch, const char *name)
 {
 	struct arm64_annotate *arm = arch->priv;
-	struct ins_ops *ops;
+	const struct ins_ops *ops;
 	regmatch_t match[2];
 
 	if (!regexec(&arm->jump_insn, name, 2, match, 0))
diff --git a/tools/perf/arch/csky/annotate/instructions.c b/tools/perf/arch/csky/annotate/instructions.c
index 14270311d215..4a55c84a320a 100644
--- a/tools/perf/arch/csky/annotate/instructions.c
+++ b/tools/perf/arch/csky/annotate/instructions.c
@@ -3,10 +3,10 @@
 
 #include <linux/compiler.h>
 
-static struct ins_ops *csky__associate_ins_ops(struct arch *arch,
-					       const char *name)
+static const struct ins_ops *csky__associate_ins_ops(struct arch *arch,
+						     const char *name)
 {
-	struct ins_ops *ops = NULL;
+	const struct ins_ops *ops = NULL;
 
 	/* catch all kind of jumps */
 	if (!strcmp(name, "bt") ||
diff --git a/tools/perf/arch/loongarch/annotate/instructions.c b/tools/perf/arch/loongarch/annotate/instructions.c
index 4ca4fb6bbcf9..ee360faad420 100644
--- a/tools/perf/arch/loongarch/annotate/instructions.c
+++ b/tools/perf/arch/loongarch/annotate/instructions.c
@@ -49,7 +49,7 @@ static int loongarch_call__parse(const struct arch *arch, struct ins_operands *o
 	return 0;
 }
 
-static struct ins_ops loongarch_call_ops = {
+static const struct ins_ops loongarch_call_ops = {
 	.parse	   = loongarch_call__parse,
 	.scnprintf = call__scnprintf,
 };
@@ -98,15 +98,15 @@ static int loongarch_jump__parse(const struct arch *arch, struct ins_operands *o
 	return 0;
 }
 
-static struct ins_ops loongarch_jump_ops = {
+static const struct ins_ops loongarch_jump_ops = {
 	.parse	   = loongarch_jump__parse,
 	.scnprintf = jump__scnprintf,
 };
 
 static
-struct ins_ops *loongarch__associate_ins_ops(struct arch *arch, const char *name)
+const struct ins_ops *loongarch__associate_ins_ops(struct arch *arch, const char *name)
 {
-	struct ins_ops *ops = NULL;
+	const struct ins_ops *ops = NULL;
 
 	if (!strcmp(name, "bl"))
 		ops = &loongarch_call_ops;
diff --git a/tools/perf/arch/mips/annotate/instructions.c b/tools/perf/arch/mips/annotate/instructions.c
index b50b46c613d6..0fbe0a7df95a 100644
--- a/tools/perf/arch/mips/annotate/instructions.c
+++ b/tools/perf/arch/mips/annotate/instructions.c
@@ -1,9 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 
 static
-struct ins_ops *mips__associate_ins_ops(struct arch *arch, const char *name)
+const struct ins_ops *mips__associate_ins_ops(struct arch *arch, const char *name)
 {
-	struct ins_ops *ops = NULL;
+	const struct ins_ops *ops = NULL;
 
 	if (!strncmp(name, "bal", 3) ||
 	    !strncmp(name, "bgezal", 6) ||
diff --git a/tools/perf/arch/powerpc/annotate/instructions.c b/tools/perf/arch/powerpc/annotate/instructions.c
index ca567cfdcbdb..d1be55425e35 100644
--- a/tools/perf/arch/powerpc/annotate/instructions.c
+++ b/tools/perf/arch/powerpc/annotate/instructions.c
@@ -1,10 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/compiler.h>
 
-static struct ins_ops *powerpc__associate_instruction_ops(struct arch *arch, const char *name)
+static const struct ins_ops *powerpc__associate_instruction_ops(struct arch *arch, const char *name)
 {
 	int i;
-	struct ins_ops *ops;
+	const struct ins_ops *ops;
 
 	/*
 	 * - Interested only if instruction starts with 'b'.
@@ -189,7 +189,7 @@ static int cmp_offset(const void *a, const void *b)
 	return (val1->value - val2->value);
 }
 
-static struct ins_ops *check_ppc_insn(struct disasm_line *dl)
+static const struct ins_ops *check_ppc_insn(struct disasm_line *dl)
 {
 	int raw_insn = dl->raw.raw_insn;
 	int opcode = PPC_OP(raw_insn);
diff --git a/tools/perf/arch/riscv64/annotate/instructions.c b/tools/perf/arch/riscv64/annotate/instructions.c
index 55cf911633f8..a34798864fab 100644
--- a/tools/perf/arch/riscv64/annotate/instructions.c
+++ b/tools/perf/arch/riscv64/annotate/instructions.c
@@ -1,9 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 
 static
-struct ins_ops *riscv64__associate_ins_ops(struct arch *arch, const char *name)
+const struct ins_ops *riscv64__associate_ins_ops(struct arch *arch, const char *name)
 {
-	struct ins_ops *ops = NULL;
+	const struct ins_ops *ops = NULL;
 
 	if (!strncmp(name, "jal", 3) ||
 	    !strncmp(name, "jr", 2) ||
diff --git a/tools/perf/arch/s390/annotate/instructions.c b/tools/perf/arch/s390/annotate/instructions.c
index 8d66c0ea3810..38f7e918ebf8 100644
--- a/tools/perf/arch/s390/annotate/instructions.c
+++ b/tools/perf/arch/s390/annotate/instructions.c
@@ -46,7 +46,7 @@ static int s390_call__parse(const struct arch *arch, struct ins_operands *ops,
 	return 0;
 }
 
-static struct ins_ops s390_call_ops = {
+static const struct ins_ops s390_call_ops = {
 	.parse	   = s390_call__parse,
 	.scnprintf = call__scnprintf,
 };
@@ -100,14 +100,14 @@ static int s390_mov__parse(const struct arch *arch __maybe_unused,
 }
 
 
-static struct ins_ops s390_mov_ops = {
+static const struct ins_ops s390_mov_ops = {
 	.parse	   = s390_mov__parse,
 	.scnprintf = mov__scnprintf,
 };
 
-static struct ins_ops *s390__associate_ins_ops(struct arch *arch, const char *name)
+static const struct ins_ops *s390__associate_ins_ops(struct arch *arch, const char *name)
 {
-	struct ins_ops *ops = NULL;
+	const struct ins_ops *ops = NULL;
 
 	/* catch all kind of jumps */
 	if (strchr(name, 'j') ||
diff --git a/tools/perf/arch/sparc/annotate/instructions.c b/tools/perf/arch/sparc/annotate/instructions.c
index 68c31580ccfc..a08d8734c883 100644
--- a/tools/perf/arch/sparc/annotate/instructions.c
+++ b/tools/perf/arch/sparc/annotate/instructions.c
@@ -117,9 +117,9 @@ static int is_branch_float_cond(const char *cond)
 	return 0;
 }
 
-static struct ins_ops *sparc__associate_instruction_ops(struct arch *arch, const char *name)
+static const struct ins_ops *sparc__associate_instruction_ops(struct arch *arch, const char *name)
 {
-	struct ins_ops *ops = NULL;
+	const struct ins_ops *ops = NULL;
 
 	if (!strcmp(name, "call") ||
 	    !strcmp(name, "jmp") ||
diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
index d41a0f96a6f6..dbeb89047fd1 100644
--- a/tools/perf/util/disasm.c
+++ b/tools/perf/util/disasm.c
@@ -33,15 +33,15 @@
 static regex_t	 file_lineno;
 
 /* These can be referred from the arch-dependent code */
-static struct ins_ops call_ops;
-static struct ins_ops dec_ops;
-static struct ins_ops jump_ops;
-static struct ins_ops mov_ops;
-static struct ins_ops nop_ops;
-static struct ins_ops lock_ops;
-static struct ins_ops ret_ops;
-static struct ins_ops load_store_ops;
-static struct ins_ops arithmetic_ops;
+static const struct ins_ops call_ops;
+static const struct ins_ops dec_ops;
+static const struct ins_ops jump_ops;
+static const struct ins_ops mov_ops;
+static const struct ins_ops nop_ops;
+static const struct ins_ops lock_ops;
+static const struct ins_ops ret_ops;
+static const struct ins_ops load_store_ops;
+static const struct ins_ops arithmetic_ops;
 
 static int jump__scnprintf(struct ins *ins, char *bf, size_t size,
 			   struct ins_operands *ops, int max_ins_name);
@@ -85,7 +85,7 @@ static int arch__grow_instructions(struct arch *arch)
 	goto out_update_instructions;
 }
 
-static int arch__associate_ins_ops(struct arch* arch, const char *name, struct ins_ops *ops)
+static int arch__associate_ins_ops(struct arch *arch, const char *name, const struct ins_ops *ops)
 {
 	struct ins *ins;
 
@@ -334,7 +334,7 @@ static int call__scnprintf(struct ins *ins, char *bf, size_t size,
 	return scnprintf(bf, size, "%-*s *%" PRIx64, max_ins_name, ins->name, ops->target.addr);
 }
 
-static struct ins_ops call_ops = {
+static const struct ins_ops call_ops = {
 	.parse	   = call__parse,
 	.scnprintf = call__scnprintf,
 };
@@ -487,7 +487,7 @@ static void jump__delete(struct ins_operands *ops __maybe_unused)
 	 */
 }
 
-static struct ins_ops jump_ops = {
+static const struct ins_ops jump_ops = {
 	.free	   = jump__delete,
 	.parse	   = jump__parse,
 	.scnprintf = jump__scnprintf,
@@ -579,7 +579,7 @@ static void lock__delete(struct ins_operands *ops)
 	zfree(&ops->target.name);
 }
 
-static struct ins_ops lock_ops = {
+static const struct ins_ops lock_ops = {
 	.free	   = lock__delete,
 	.parse	   = lock__parse,
 	.scnprintf = lock__scnprintf,
@@ -688,7 +688,7 @@ static int mov__scnprintf(struct ins *ins, char *bf, size_t size,
 			 ops->target.name ?: ops->target.raw);
 }
 
-static struct ins_ops mov_ops = {
+static const struct ins_ops mov_ops = {
 	.parse	   = mov__parse,
 	.scnprintf = mov__scnprintf,
 };
@@ -738,7 +738,7 @@ static int arithmetic__parse(const struct arch *arch __maybe_unused, struct ins_
 	return 0;
 }
 
-static struct ins_ops arithmetic_ops = {
+static const struct ins_ops arithmetic_ops = {
 	.parse     = arithmetic__parse,
 	.scnprintf = arithmetic__scnprintf,
 };
@@ -772,7 +772,7 @@ static int load_store__parse(const struct arch *arch __maybe_unused, struct ins_
 	return 0;
 }
 
-static struct ins_ops load_store_ops = {
+static const struct ins_ops load_store_ops = {
 	.parse     = load_store__parse,
 	.scnprintf = load_store__scnprintf,
 };
@@ -813,7 +813,7 @@ static int dec__scnprintf(struct ins *ins, char *bf, size_t size,
 			 ops->target.name ?: ops->target.raw);
 }
 
-static struct ins_ops dec_ops = {
+static const struct ins_ops dec_ops = {
 	.parse	   = dec__parse,
 	.scnprintf = dec__scnprintf,
 };
@@ -824,11 +824,11 @@ static int nop__scnprintf(struct ins *ins __maybe_unused, char *bf, size_t size,
 	return scnprintf(bf, size, "%-*s", max_ins_name, "nop");
 }
 
-static struct ins_ops nop_ops = {
+static const struct ins_ops nop_ops = {
 	.scnprintf = nop__scnprintf,
 };
 
-static struct ins_ops ret_ops = {
+static const struct ins_ops ret_ops = {
 	.scnprintf = ins__raw_scnprintf,
 };
 
@@ -869,7 +869,7 @@ static void ins__sort(struct arch *arch)
 	qsort(arch->instructions, nmemb, sizeof(struct ins), ins__cmp);
 }
 
-static struct ins_ops *__ins__find(const struct arch *arch, const char *name,
+static const struct ins_ops *__ins__find(const struct arch *arch, const char *name,
 				     struct disasm_line *dl)
 {
 	struct ins *ins;
@@ -880,7 +880,7 @@ static struct ins_ops *__ins__find(const struct arch *arch, const char *name,
 		 * For powerpc, identify the instruction ops
 		 * from the opcode using raw_insn.
 		 */
-		struct ins_ops *ops;
+		const struct ins_ops *ops;
 
 		ops = check_ppc_insn(dl);
 		if (ops)
@@ -916,9 +916,9 @@ static struct ins_ops *__ins__find(const struct arch *arch, const char *name,
 	return ins ? ins->ops : NULL;
 }
 
-struct ins_ops *ins__find(const struct arch *arch, const char *name, struct disasm_line *dl)
+const struct ins_ops *ins__find(const struct arch *arch, const char *name, struct disasm_line *dl)
 {
-	struct ins_ops *ops = __ins__find(arch, name, dl);
+	const struct ins_ops *ops = __ins__find(arch, name, dl);
 
 	if (!ops && arch->associate_instruction_ops)
 		ops = arch->associate_instruction_ops((struct arch *)arch, name);
diff --git a/tools/perf/util/disasm.h b/tools/perf/util/disasm.h
index 273a9c906514..dc5233f2a773 100644
--- a/tools/perf/util/disasm.h
+++ b/tools/perf/util/disasm.h
@@ -22,7 +22,7 @@ struct arch {
 	struct ins	*instructions;
 	size_t		nr_instructions;
 	size_t		nr_instructions_allocated;
-	struct ins_ops  *(*associate_instruction_ops)(struct arch *arch, const char *name);
+	const struct ins_ops  *(*associate_instruction_ops)(struct arch *arch, const char *name);
 	bool		sorted_instructions;
 	bool		initialized;
 	const char	*insn_suffix;
@@ -52,7 +52,7 @@ struct arch {
 
 struct ins {
 	const char     *name;
-	struct ins_ops *ops;
+	const struct ins_ops *ops;
 };
 
 struct ins_operands {
@@ -108,7 +108,7 @@ struct annotate_args {
 const struct arch *arch__find(const char *name);
 bool arch__is(const struct arch *arch, const char *name);
 
-struct ins_ops *ins__find(const struct arch *arch, const char *name, struct disasm_line *dl);
+const struct ins_ops *ins__find(const struct arch *arch, const char *name, struct disasm_line *dl);
 
 bool ins__is_call(const struct ins *ins);
 bool ins__is_jump(const struct ins *ins);
-- 
2.52.0.457.g6b5491de43-goog


