Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C40D6CFA4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 21:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LJvCENf9OUao4NjSk9nvAVIfxbnn+tkq0I5XRhSJkfA=; b=Y18eK2DrQHUxMi7u71lWynIxef
	ksVxCXJYp9orNoEQWaa7BazXtBz2Y5qeSTr7/oKRlH6yKa+CIT2eZ/jkrYmmmO6GDM//yhsLcZXVs
	kwzVpP4n0I0sovu2m06UwPWBMEsSh3UOLU2n0biI8bSEY2Pp+Mc6sWP72rEke3s3rVVA1hI7Q5X7M
	eOuJC8MNrl26+Hgp33YhWaAgI2kbUL6cQOvt+lhumH/LyUDEw8hWzFRaGF7bxJrZ4a3cG/z0Tk9MQ
	z74/wbt3Uep2WGE6iF6fAeoX/n8YDMPYbvB2NuBVoe/8CpkIPWivP6I0g3syil3GPm223deMiDCJK
	zBnbVmgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj2L9-00000007mRR-2rpx;
	Thu, 22 Jan 2026 21:35:43 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj2L2-00000007mLr-1ZWA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 21:35:37 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2b708fa4093so4324485eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 13:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769117735; x=1769722535; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LJvCENf9OUao4NjSk9nvAVIfxbnn+tkq0I5XRhSJkfA=;
        b=JgvjfBUAPV7uZ0rga6jBWFGt1XpnUDKbFiVHJS1rZHKBVyEjeqWgFfPpuGDY0T+Xzb
         fs7CXEDDWF+YfGV8CKf5hwS+4LS2vON5L4PsPkpyt6uLFi0PDIgVVUGclj5Z8iAdlGPn
         GQXv+xzBUT+e4lyHcX4G5FLWGu/Kv2WYhF68CDnxkxQqVsSdMkLrOMTiL5uGP0vYhqsu
         6clo3fGjq4dAixIr4yqC6krXYtihwMbqb01Aw2jlGIvgFeO4cSWfGwJPPKmmq6cIe+Hw
         ANwCxFAZIkqIMYs6kh3zVAxQPVdCKJvE4J7FGlr5K1kqb6WrPLrNGZbo5GamUrYECsiX
         DO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769117735; x=1769722535;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LJvCENf9OUao4NjSk9nvAVIfxbnn+tkq0I5XRhSJkfA=;
        b=pe3YJeqLz0130l/8JxRcLkF5ixp+O1rhFMRnvtSDxg0PRPE6JSNHlNUYgYErD3NDp1
         D66bFkGwvQicJK2KTUeFXntz4X0BUFm3aoeIgb4oBLEfIGnWuNHM8s8ny8iOl4UoKJbX
         pmJ2HBCzhX78cpbqbiIoVGRK3E87D/i1nmpTJaFhWLQcjjNrlBiMzmxrl9DuNyavaSfx
         qg5r9TdRyPCPgvOvPMJhMFJ6FRJU8JARfFKDsEkICExzuQRZ36bw8nwaQDpyKiLCOLS1
         wXEvhwp6Dmaoafmafkkonqmmsvrhp0mZTwUqwzI+B9tp0DohLzUqshwG4uHQbBIv8wgz
         cDwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTbalQO3b3trTW4y+02fDgSwVCqvG1hC+pYjOkYnuiDYxFHa2xWf1K0YYlkWOq//ZDIFZgyHgvAmmGzqtwdHXl@lists.infradead.org
X-Gm-Message-State: AOJu0YxB+SPDnJYC6o/WdolVf5qGW/xYfbpOZhn3UeGx92WS2b3oN4dM
	MEpCUR6zRGpABFcqecOFWcfmsIfaeU9xmhaGq3BTRgXmyxu0bYzIvM9NkMZU0ubwNtq5IQ/YxId
	xYr1tulK5RA==
X-Received: from dybdr40.prod.google.com ([2002:a05:7300:b2a8:b0:2ab:9e42:f552])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:5707:b0:2ae:55ac:3ff6
 with SMTP id 5a478bee46e88-2b739964db9mr421136eec.1.1769117735061; Thu, 22
 Jan 2026 13:35:35 -0800 (PST)
Date: Thu, 22 Jan 2026 13:35:10 -0800
In-Reply-To: <20260122213516.671089-1-irogers@google.com>
Mime-Version: 1.0
References: <20260122213516.671089-1-irogers@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260122213516.671089-7-irogers@google.com>
Subject: [PATCH v3 06/12] perf disasm: Constify use of struct ins
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
X-CRM114-CacheID: sfid-20260122_133536_432249_70529605 
X-CRM114-Status: GOOD (  20.80  )
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

The struct ins holds variables that are read but not written, except
during some initialization. Change most uses to be for a "const struct
ins *" version to capture this immutability. So the x86__instructions
can be const pre-sort it and make the sorted variable true.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/arch/arm64/annotate/instructions.c |  2 +-
 tools/perf/arch/x86/annotate/instructions.c   | 26 +++++++++++----
 tools/perf/util/disasm.c                      | 32 ++++++++++---------
 tools/perf/util/disasm.h                      |  4 +--
 4 files changed, 40 insertions(+), 24 deletions(-)

diff --git a/tools/perf/arch/arm64/annotate/instructions.c b/tools/perf/arch/arm64/annotate/instructions.c
index 363af2f55122..44db33854dba 100644
--- a/tools/perf/arch/arm64/annotate/instructions.c
+++ b/tools/perf/arch/arm64/annotate/instructions.c
@@ -60,7 +60,7 @@ static int arm64_mov__parse(const struct arch *arch __maybe_unused,
 	return -1;
 }
 
-static int mov__scnprintf(struct ins *ins, char *bf, size_t size,
+static int mov__scnprintf(const struct ins *ins, char *bf, size_t size,
 			  struct ins_operands *ops, int max_ins_name);
 
 static const struct ins_ops arm64_mov_ops = {
diff --git a/tools/perf/arch/x86/annotate/instructions.c b/tools/perf/arch/x86/annotate/instructions.c
index 24b388bacdae..ffca3029388b 100644
--- a/tools/perf/arch/x86/annotate/instructions.c
+++ b/tools/perf/arch/x86/annotate/instructions.c
@@ -7,7 +7,7 @@
  * So this table should not have entries with the suffix unless it's
  * a complete different instruction than ones without the suffix.
  */
-static struct ins x86__instructions[] = {
+static const struct ins x86__instructions[] = {
 	{ .name = "adc",	.ops = &mov_ops,  },
 	{ .name = "add",	.ops = &mov_ops,  },
 	{ .name = "addsd",	.ops = &mov_ops,  },
@@ -19,9 +19,9 @@ static struct ins x86__instructions[] = {
 	{ .name = "btr",	.ops = &mov_ops,  },
 	{ .name = "bts",	.ops = &mov_ops,  },
 	{ .name = "call",	.ops = &call_ops, },
+	{ .name = "cmovae",	.ops = &mov_ops,  },
 	{ .name = "cmovbe",	.ops = &mov_ops,  },
 	{ .name = "cmove",	.ops = &mov_ops,  },
-	{ .name = "cmovae",	.ops = &mov_ops,  },
 	{ .name = "cmp",	.ops = &mov_ops,  },
 	{ .name = "cmpxch",	.ops = &mov_ops,  },
 	{ .name = "cmpxchg",	.ops = &mov_ops,  },
@@ -73,23 +73,23 @@ static struct ins x86__instructions[] = {
 	{ .name = "movaps",	.ops = &mov_ops,  },
 	{ .name = "movdqa",	.ops = &mov_ops,  },
 	{ .name = "movdqu",	.ops = &mov_ops,  },
+	{ .name = "movsb",	.ops = &mov_ops,  },
 	{ .name = "movsd",	.ops = &mov_ops,  },
+	{ .name = "movsl",	.ops = &mov_ops,  },
 	{ .name = "movss",	.ops = &mov_ops,  },
-	{ .name = "movsb",	.ops = &mov_ops,  },
 	{ .name = "movsw",	.ops = &mov_ops,  },
-	{ .name = "movsl",	.ops = &mov_ops,  },
 	{ .name = "movupd",	.ops = &mov_ops,  },
 	{ .name = "movups",	.ops = &mov_ops,  },
 	{ .name = "movzb",	.ops = &mov_ops,  },
-	{ .name = "movzw",	.ops = &mov_ops,  },
 	{ .name = "movzl",	.ops = &mov_ops,  },
+	{ .name = "movzw",	.ops = &mov_ops,  },
 	{ .name = "mulsd",	.ops = &mov_ops,  },
 	{ .name = "mulss",	.ops = &mov_ops,  },
 	{ .name = "nop",	.ops = &nop_ops,  },
 	{ .name = "or",		.ops = &mov_ops,  },
 	{ .name = "orps",	.ops = &mov_ops,  },
-	{ .name = "pand",	.ops = &mov_ops,  },
 	{ .name = "paddq",	.ops = &mov_ops,  },
+	{ .name = "pand",	.ops = &mov_ops,  },
 	{ .name = "pcmpeqb",	.ops = &mov_ops,  },
 	{ .name = "por",	.ops = &mov_ops,  },
 	{ .name = "rcl",	.ops = &mov_ops,  },
@@ -202,6 +202,20 @@ static int x86__annotate_init(struct arch *arch, char *cpuid)
 		if (x86__cpuid_parse(arch, cpuid))
 			err = SYMBOL_ANNOTATE_ERRNO__ARCH_INIT_CPUID_PARSING;
 	}
+
+#ifndef NDEBUG
+	{
+		static bool sorted_check;
+
+		if (!sorted_check) {
+			for (size_t i = 0; i < arch->nr_instructions - 1; i++) {
+				assert(strcmp(arch->instructions[i].name,
+					      arch->instructions[i + 1].name) <= 0);
+			}
+			sorted_check = true;
+		}
+	}
+#endif
 	arch->e_machine = EM_X86_64;
 	arch->e_flags = 0;
 	arch->initialized = true;
diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
index 9bc9b1de98db..2793697ce75c 100644
--- a/tools/perf/util/disasm.c
+++ b/tools/perf/util/disasm.c
@@ -43,9 +43,9 @@ static const struct ins_ops ret_ops;
 static const struct ins_ops load_store_ops;
 static const struct ins_ops arithmetic_ops;
 
-static int jump__scnprintf(struct ins *ins, char *bf, size_t size,
+static int jump__scnprintf(const struct ins *ins, char *bf, size_t size,
 			   struct ins_operands *ops, int max_ins_name);
-static int call__scnprintf(struct ins *ins, char *bf, size_t size,
+static int call__scnprintf(const struct ins *ins, char *bf, size_t size,
 			   struct ins_operands *ops, int max_ins_name);
 
 static void ins__sort(struct arch *arch);
@@ -66,7 +66,8 @@ static int arch__grow_instructions(struct arch *arch)
 		goto grow_from_non_allocated_table;
 
 	new_nr_allocated = arch->nr_instructions_allocated + 128;
-	new_instructions = realloc(arch->instructions, new_nr_allocated * sizeof(struct ins));
+	new_instructions = realloc((void *)arch->instructions,
+				   new_nr_allocated * sizeof(struct ins));
 	if (new_instructions == NULL)
 		return -1;
 
@@ -93,7 +94,7 @@ static int arch__associate_ins_ops(struct arch *arch, const char *name, const st
 	    arch__grow_instructions(arch))
 		return -1;
 
-	ins = &arch->instructions[arch->nr_instructions];
+	ins = (struct ins *)&arch->instructions[arch->nr_instructions];
 	ins->name = strdup(name);
 	if (!ins->name)
 		return -1;
@@ -146,6 +147,7 @@ static struct arch architectures[] = {
 		.init = x86__annotate_init,
 		.instructions = x86__instructions,
 		.nr_instructions = ARRAY_SIZE(x86__instructions),
+		.sorted_instructions = true,
 		.insn_suffix = "bwlq",
 		.objdump =  {
 			.comment_char = '#',
@@ -241,13 +243,13 @@ static void ins_ops__delete(struct ins_operands *ops)
 	zfree(&ops->target.name);
 }
 
-static int ins__raw_scnprintf(struct ins *ins, char *bf, size_t size,
+static int ins__raw_scnprintf(const struct ins *ins, char *bf, size_t size,
 			      struct ins_operands *ops, int max_ins_name)
 {
 	return scnprintf(bf, size, "%-*s %s", max_ins_name, ins->name, ops->raw);
 }
 
-static int ins__scnprintf(struct ins *ins, char *bf, size_t size,
+static int ins__scnprintf(const struct ins *ins, char *bf, size_t size,
 			  struct ins_operands *ops, int max_ins_name)
 {
 	if (ins->ops->scnprintf)
@@ -319,7 +321,7 @@ static int call__parse(const struct arch *arch, struct ins_operands *ops, struct
 	goto find_target;
 }
 
-static int call__scnprintf(struct ins *ins, char *bf, size_t size,
+static int call__scnprintf(const struct ins *ins, char *bf, size_t size,
 			   struct ins_operands *ops, int max_ins_name)
 {
 	if (ops->target.sym)
@@ -446,7 +448,7 @@ static int jump__parse(const struct arch *arch, struct ins_operands *ops, struct
 	return 0;
 }
 
-static int jump__scnprintf(struct ins *ins, char *bf, size_t size,
+static int jump__scnprintf(const struct ins *ins, char *bf, size_t size,
 			   struct ins_operands *ops, int max_ins_name)
 {
 	const char *c;
@@ -551,7 +553,7 @@ static int lock__parse(const struct arch *arch, struct ins_operands *ops, struct
 	return 0;
 }
 
-static int lock__scnprintf(struct ins *ins, char *bf, size_t size,
+static int lock__scnprintf(const struct ins *ins, char *bf, size_t size,
 			   struct ins_operands *ops, int max_ins_name)
 {
 	int printed;
@@ -680,7 +682,7 @@ static int mov__parse(const struct arch *arch, struct ins_operands *ops,
 	return -1;
 }
 
-static int mov__scnprintf(struct ins *ins, char *bf, size_t size,
+static int mov__scnprintf(const struct ins *ins, char *bf, size_t size,
 			   struct ins_operands *ops, int max_ins_name)
 {
 	return scnprintf(bf, size, "%-*s %s,%s", max_ins_name, ins->name,
@@ -699,7 +701,7 @@ static const struct ins_ops mov_ops = {
 #define	ADD_ZERO_EXT_XO_FORM	202
 #define	SUB_ZERO_EXT_XO_FORM	200
 
-static int arithmetic__scnprintf(struct ins *ins, char *bf, size_t size,
+static int arithmetic__scnprintf(const struct ins *ins, char *bf, size_t size,
 		struct ins_operands *ops, int max_ins_name)
 {
 	return scnprintf(bf, size, "%-*s %s", max_ins_name, ins->name,
@@ -743,7 +745,7 @@ static const struct ins_ops arithmetic_ops = {
 	.scnprintf = arithmetic__scnprintf,
 };
 
-static int load_store__scnprintf(struct ins *ins, char *bf, size_t size,
+static int load_store__scnprintf(const struct ins *ins, char *bf, size_t size,
 		struct ins_operands *ops, int max_ins_name)
 {
 	return scnprintf(bf, size, "%-*s %s", max_ins_name, ins->name,
@@ -806,7 +808,7 @@ static int dec__parse(const struct arch *arch __maybe_unused, struct ins_operand
 	return 0;
 }
 
-static int dec__scnprintf(struct ins *ins, char *bf, size_t size,
+static int dec__scnprintf(const struct ins *ins, char *bf, size_t size,
 			   struct ins_operands *ops, int max_ins_name)
 {
 	return scnprintf(bf, size, "%-*s %s", max_ins_name, ins->name,
@@ -818,7 +820,7 @@ static const struct ins_ops dec_ops = {
 	.scnprintf = dec__scnprintf,
 };
 
-static int nop__scnprintf(struct ins *ins __maybe_unused, char *bf, size_t size,
+static int nop__scnprintf(const struct ins *ins __maybe_unused, char *bf, size_t size,
 			  struct ins_operands *ops __maybe_unused, int max_ins_name)
 {
 	return scnprintf(bf, size, "%-*s", max_ins_name, "nop");
@@ -866,7 +868,7 @@ static void ins__sort(struct arch *arch)
 {
 	const int nmemb = arch->nr_instructions;
 
-	qsort(arch->instructions, nmemb, sizeof(struct ins), ins__cmp);
+	qsort((void *)arch->instructions, nmemb, sizeof(struct ins), ins__cmp);
 }
 
 static const struct ins_ops *__ins__find(const struct arch *arch, const char *name,
diff --git a/tools/perf/util/disasm.h b/tools/perf/util/disasm.h
index dc5233f2a773..4f5c9a985786 100644
--- a/tools/perf/util/disasm.h
+++ b/tools/perf/util/disasm.h
@@ -19,7 +19,7 @@ struct disasm_line;
 
 struct arch {
 	const char	*name;
-	struct ins	*instructions;
+	const struct ins	*instructions;
 	size_t		nr_instructions;
 	size_t		nr_instructions_allocated;
 	const struct ins_ops  *(*associate_instruction_ops)(struct arch *arch, const char *name);
@@ -91,7 +91,7 @@ struct ins_ops {
 	void (*free)(struct ins_operands *ops);
 	int (*parse)(const struct arch *arch, struct ins_operands *ops, struct map_symbol *ms,
 			struct disasm_line *dl);
-	int (*scnprintf)(struct ins *ins, char *bf, size_t size,
+	int (*scnprintf)(const struct ins *ins, char *bf, size_t size,
 			 struct ins_operands *ops, int max_ins_name);
 };
 
-- 
2.52.0.457.g6b5491de43-goog


