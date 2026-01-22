Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A5AD625F9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 07:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JZ50YiJoEVxCgYjte6CjV+ls97az2nN7mWUZv3Wr1mA=; b=hwEc7Jj1tgRiGEhhiVbsnwUTB7
	3nKo4NoOeBUtBG2pjf/IgBN5SbQMkZwUeX5nbLMcPiJ+az2ShtrBj9R05j9oVg3ULeqP82BHFufGE
	KzjKQhX0oGOnUsv251Qqvjq8DKch9qjkoD7EHMbwR6AJcY/TIjlA/vNO2WgysDc0+UPhmfu8udSk1
	m8zBDuNOYupAm4IIRKce/zlVhmRGBLog73+P6OCwYLrH16tIwiCtyca3aYZOXYhpRIeofA+YvS/hi
	49yNYj8OYPX5I9QEadJUoYIksVYR4+vDIlB42BlDh/yaw/DazAupimZF5am0u6hcvEPNwHE1gbRQA
	yaTY/PMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipAS-00000006YFk-24er;
	Thu, 22 Jan 2026 07:31:48 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipAH-00000006Y37-0vPl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 07:31:38 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2b72b6fc371so1034502eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 23:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769067096; x=1769671896; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JZ50YiJoEVxCgYjte6CjV+ls97az2nN7mWUZv3Wr1mA=;
        b=GIPdCK52CkQkV5RMJ9IGuEy/cJF/eGjCFmJuvxK/vy4vXC1iGnOAzdJS1beyhxqQrU
         +tr9Ic04RfcJHpBjFmecHixfdvEW4SzwYE0i/1YSOiSXDkcGKCs2qi4MIBNg0IGSRGs3
         5bFivqibhO/scdOVLkWZhDSfPVaAOKZT+6Negh7w0Y1OQ5rYSVU5j4/TmBgC4EL5nt+u
         hSvMtUYmwfYOg8i67os8TRo1qjK3nUJXpfOUsiQCsx2m6BZ//pNnCE2jmjeL0OfOuCjt
         x7XJpQz9uaGL1+inQbEtM857+fVvijDdvnjls5JX5/Br0eNPr85HK5rcZ7BE8oUfj7yS
         09pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769067096; x=1769671896;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JZ50YiJoEVxCgYjte6CjV+ls97az2nN7mWUZv3Wr1mA=;
        b=EyI96UiFKY0lz4gt/LPitOVJt64tI+nhegamELHvAjh/+COnCXLvKARPr6UxcIFVtf
         T+qzlEpVTYMFu1n7bvxVXynerLICAc9BSBogNpBn3H9ohXHBk3xsFuZU5Pxz7UMlloEe
         THBI+lAI1ErXlrBNx6s1aNuFi0gESptDvz8IpZFDWTRkXkqB4rfH3Mj2OfNfMOtuMa0U
         FOCdDRhuP7zUsojTOPDDpK7tL0J2bJydejopuIUuiyEWFZzKS/nNKGL1Dqe4pgITHIlz
         l4J39VCI0JXr+2HErJ6KkpBJfYwteBUkQXPOedXW1Olq1dFuisIaPAYhJTh8p8k0anEq
         DMMA==
X-Forwarded-Encrypted: i=1; AJvYcCUS5LSUBAdWKADidAzKlQfhBbtAa6RtDIe/1J10JlGJ5j/57fhxPT086X+gh6EEub2wCzKzfOBatxip57nQUhKn@lists.infradead.org
X-Gm-Message-State: AOJu0YzQGOFU1hFxeiRWSuBvOsEBmGkXEYc6mcuAKd35GsGtN5pthc5v
	nTHh0HNUODaegvZ7tgZW0DkA0vIyte3RCph7GmdomNJNXy/v0sAiijvM1YkRqPdr6xNsAhKHaTu
	4t3LQH1YMBA==
X-Received: from dll12.prod.google.com ([2002:a05:7022:20c:b0:123:17b9:69c2])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:f86:b0:11c:b397:2657
 with SMTP id a92af1059eb24-1246aa90798mr5597076c88.22.1769067095464; Wed, 21
 Jan 2026 23:31:35 -0800 (PST)
Date: Wed, 21 Jan 2026 23:31:19 -0800
In-Reply-To: <20260122073127.375139-1-irogers@google.com>
Mime-Version: 1.0
References: <20260122073127.375139-1-irogers@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260122073127.375139-4-irogers@google.com>
Subject: [PATCH v1 03/11] perf disasm: Constify use of struct arch
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
X-CRM114-CacheID: sfid-20260121_233137_322943_22600B89 
X-CRM114-Status: GOOD (  19.88  )
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

The struct arch holds variables that are read but not written, except
during some initialization. Change most uses to be for a "const struct
arch *" version to capture this immutability.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/arch/arm64/annotate/instructions.c |  2 +-
 .../arch/loongarch/annotate/instructions.c    | 12 ++++--
 tools/perf/arch/s390/annotate/instructions.c  |  7 ++--
 tools/perf/arch/x86/annotate/instructions.c   |  4 +-
 tools/perf/ui/browsers/annotate.c             |  2 +-
 tools/perf/util/annotate-data.c               |  2 +-
 tools/perf/util/annotate-data.h               |  2 +-
 tools/perf/util/annotate.c                    | 28 ++++++-------
 tools/perf/util/annotate.h                    | 10 ++---
 tools/perf/util/disasm.c                      | 42 ++++++++++---------
 tools/perf/util/disasm.h                      | 14 +++----
 11 files changed, 67 insertions(+), 58 deletions(-)

diff --git a/tools/perf/arch/arm64/annotate/instructions.c b/tools/perf/arch/arm64/annotate/instructions.c
index 16cb62d40bd9..5099fa36180d 100644
--- a/tools/perf/arch/arm64/annotate/instructions.c
+++ b/tools/perf/arch/arm64/annotate/instructions.c
@@ -10,7 +10,7 @@ struct arm64_annotate {
 		jump_insn;
 };
 
-static int arm64_mov__parse(struct arch *arch __maybe_unused,
+static int arm64_mov__parse(const struct arch *arch __maybe_unused,
 			    struct ins_operands *ops,
 			    struct map_symbol *ms __maybe_unused,
 			    struct disasm_line *dl __maybe_unused)
diff --git a/tools/perf/arch/loongarch/annotate/instructions.c b/tools/perf/arch/loongarch/annotate/instructions.c
index 70262d5f1444..4ca4fb6bbcf9 100644
--- a/tools/perf/arch/loongarch/annotate/instructions.c
+++ b/tools/perf/arch/loongarch/annotate/instructions.c
@@ -5,8 +5,10 @@
  * Copyright (C) 2020-2023 Loongson Technology Corporation Limited
  */
 
-static int loongarch_call__parse(struct arch *arch, struct ins_operands *ops, struct map_symbol *ms,
-		struct disasm_line *dl __maybe_unused)
+static int loongarch_call__parse(const struct arch *arch, struct ins_operands *ops,
+				 struct map_symbol *ms,
+				 struct disasm_line *dl __maybe_unused)
+
 {
 	char *c, *endptr, *tok, *name;
 	struct map *map = ms->map;
@@ -52,8 +54,10 @@ static struct ins_ops loongarch_call_ops = {
 	.scnprintf = call__scnprintf,
 };
 
-static int loongarch_jump__parse(struct arch *arch, struct ins_operands *ops, struct map_symbol *ms,
-		struct disasm_line *dl __maybe_unused)
+static int loongarch_jump__parse(const struct arch *arch, struct ins_operands *ops,
+				 struct map_symbol *ms,
+				 struct disasm_line *dl __maybe_unused)
+
 {
 	struct map *map = ms->map;
 	struct symbol *sym = ms->sym;
diff --git a/tools/perf/arch/s390/annotate/instructions.c b/tools/perf/arch/s390/annotate/instructions.c
index c61193f1e096..8d66c0ea3810 100644
--- a/tools/perf/arch/s390/annotate/instructions.c
+++ b/tools/perf/arch/s390/annotate/instructions.c
@@ -1,8 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/compiler.h>
 
-static int s390_call__parse(struct arch *arch, struct ins_operands *ops,
-			    struct map_symbol *ms, struct disasm_line *dl __maybe_unused)
+static int s390_call__parse(const struct arch *arch, struct ins_operands *ops,
+			    struct map_symbol *ms,
+			    struct disasm_line *dl __maybe_unused)
 {
 	char *endptr, *tok, *name;
 	struct map *map = ms->map;
@@ -50,7 +51,7 @@ static struct ins_ops s390_call_ops = {
 	.scnprintf = call__scnprintf,
 };
 
-static int s390_mov__parse(struct arch *arch __maybe_unused,
+static int s390_mov__parse(const struct arch *arch __maybe_unused,
 			   struct ins_operands *ops,
 			   struct map_symbol *ms __maybe_unused,
 			   struct disasm_line *dl __maybe_unused)
diff --git a/tools/perf/arch/x86/annotate/instructions.c b/tools/perf/arch/x86/annotate/instructions.c
index 803f9351a3fb..24b388bacdae 100644
--- a/tools/perf/arch/x86/annotate/instructions.c
+++ b/tools/perf/arch/x86/annotate/instructions.c
@@ -119,7 +119,7 @@ static struct ins x86__instructions[] = {
 	{ .name = "xorps",	.ops = &mov_ops, },
 };
 
-static bool amd__ins_is_fused(struct arch *arch, const char *ins1,
+static bool amd__ins_is_fused(const struct arch *arch, const char *ins1,
 			      const char *ins2)
 {
 	if (strstr(ins2, "jmp"))
@@ -142,7 +142,7 @@ static bool amd__ins_is_fused(struct arch *arch, const char *ins1,
 	return false;
 }
 
-static bool intel__ins_is_fused(struct arch *arch, const char *ins1,
+static bool intel__ins_is_fused(const struct arch *arch, const char *ins1,
 				const char *ins2)
 {
 	if (arch->family != 6 || arch->model < 0x1e || strstr(ins2, "jmp"))
diff --git a/tools/perf/ui/browsers/annotate.c b/tools/perf/ui/browsers/annotate.c
index 36aca8d6d003..3df61cd46652 100644
--- a/tools/perf/ui/browsers/annotate.c
+++ b/tools/perf/ui/browsers/annotate.c
@@ -30,7 +30,7 @@ struct annotate_browser {
 	struct rb_root		    entries;
 	struct rb_node		   *curr_hot;
 	struct annotation_line	   *selection;
-	struct arch		   *arch;
+	const struct arch	   *arch;
 	/*
 	 * perf top can delete hist_entry anytime.  Callers should make sure
 	 * its lifetime.
diff --git a/tools/perf/util/annotate-data.c b/tools/perf/util/annotate-data.c
index 07cf9c334be0..edfcd6e9df9c 100644
--- a/tools/perf/util/annotate-data.c
+++ b/tools/perf/util/annotate-data.c
@@ -160,7 +160,7 @@ bool has_reg_type(struct type_state *state, int reg)
 	return (unsigned)reg < ARRAY_SIZE(state->regs);
 }
 
-static void init_type_state(struct type_state *state, struct arch *arch)
+static void init_type_state(struct type_state *state, const struct arch *arch)
 {
 	memset(state, 0, sizeof(*state));
 	INIT_LIST_HEAD(&state->stack_vars);
diff --git a/tools/perf/util/annotate-data.h b/tools/perf/util/annotate-data.h
index 869307c7f130..9b222869e42d 100644
--- a/tools/perf/util/annotate-data.h
+++ b/tools/perf/util/annotate-data.h
@@ -117,7 +117,7 @@ extern struct annotated_data_type canary_type;
  */
 struct data_loc_info {
 	/* These are input field, should be filled by caller */
-	struct arch *arch;
+	const struct arch *arch;
 	struct thread *thread;
 	struct map_symbol *ms;
 	u64 ip;
diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
index 791d60f97c23..132af2556aec 100644
--- a/tools/perf/util/annotate.c
+++ b/tools/perf/util/annotate.c
@@ -761,7 +761,7 @@ static int disasm_line__print(struct disasm_line *dl, u64 start, int addr_fmt_wi
 }
 
 static struct annotated_data_type *
-__hist_entry__get_data_type(struct hist_entry *he, struct arch *arch,
+__hist_entry__get_data_type(struct hist_entry *he, const struct arch *arch,
 			    struct debuginfo *dbg, struct disasm_line *dl,
 			    int *type_offset);
 
@@ -980,11 +980,11 @@ void symbol__calc_percent(struct symbol *sym, struct evsel *evsel)
 	annotation__calc_percent(notes, evsel, symbol__size(sym));
 }
 
-int evsel__get_arch(struct evsel *evsel, struct arch **parch)
+int evsel__get_arch(struct evsel *evsel, const struct arch **parch)
 {
 	struct perf_env *env = evsel__env(evsel);
 	const char *arch_name = perf_env__arch(env);
-	struct arch *arch;
+	const struct arch *arch;
 	int err;
 
 	if (!arch_name) {
@@ -999,7 +999,7 @@ int evsel__get_arch(struct evsel *evsel, struct arch **parch)
 	}
 
 	if (arch->init) {
-		err = arch->init(arch, env ? env->cpuid : NULL);
+		err = arch->init((struct arch *)arch, env ? env->cpuid : NULL);
 		if (err) {
 			pr_err("%s: failed to initialize %s arch priv area\n",
 			       __func__, arch->name);
@@ -1010,14 +1010,14 @@ int evsel__get_arch(struct evsel *evsel, struct arch **parch)
 }
 
 int symbol__annotate(struct map_symbol *ms, struct evsel *evsel,
-		     struct arch **parch)
+		     const struct arch **parch)
 {
 	struct symbol *sym = ms->sym;
 	struct annotation *notes = symbol__annotation(sym);
 	struct annotate_args args = {
 		.options	= &annotate_opts,
 	};
-	struct arch *arch = NULL;
+	const struct arch *arch = NULL;
 	int err, nr;
 
 	err = evsel__get_arch(evsel, &arch);
@@ -2204,7 +2204,7 @@ void annotation_line__write(struct annotation_line *al, struct annotation *notes
 }
 
 int symbol__annotate2(struct map_symbol *ms, struct evsel *evsel,
-		      struct arch **parch)
+		      const struct arch **parch)
 {
 	struct symbol *sym = ms->sym;
 	struct annotation *notes = symbol__annotation(sym);
@@ -2457,7 +2457,7 @@ int annotate_check_args(void)
  * to revisit the format when it handles different architecture.
  * Fills @reg and @offset when return 0.
  */
-static int extract_reg_offset(struct arch *arch, const char *str,
+static int extract_reg_offset(const struct arch *arch, const char *str,
 			      struct annotated_op_loc *op_loc)
 {
 	char *p;
@@ -2538,7 +2538,7 @@ static int extract_reg_offset(struct arch *arch, const char *str,
  *                              # dst_reg1 = rbx, dst_reg2 = rcx, dst_mem = 1
  *                              # dst_multi_regs = 1, dst_offset = 8
  */
-int annotate_get_insn_location(struct arch *arch, struct disasm_line *dl,
+int annotate_get_insn_location(const struct arch *arch, struct disasm_line *dl,
 			       struct annotated_insn_loc *loc)
 {
 	struct ins_operands *ops;
@@ -2673,7 +2673,7 @@ static struct annotated_item_stat *annotate_data_stat(struct list_head *head,
 	return istat;
 }
 
-static bool is_stack_operation(struct arch *arch, struct disasm_line *dl)
+static bool is_stack_operation(const struct arch *arch, struct disasm_line *dl)
 {
 	if (arch__is(arch, "x86")) {
 		if (!strncmp(dl->ins.name, "push", 4) ||
@@ -2686,7 +2686,7 @@ static bool is_stack_operation(struct arch *arch, struct disasm_line *dl)
 	return false;
 }
 
-static bool is_stack_canary(struct arch *arch, struct annotated_op_loc *loc)
+static bool is_stack_canary(const struct arch *arch, struct annotated_op_loc *loc)
 {
 	/* On x86_64, %gs:40 is used for stack canary */
 	if (arch__is(arch, "x86")) {
@@ -2702,7 +2702,7 @@ static bool is_stack_canary(struct arch *arch, struct annotated_op_loc *loc)
  * Returns true if the instruction has a memory operand without
  * performing a load/store
  */
-static bool is_address_gen_insn(struct arch *arch, struct disasm_line *dl)
+static bool is_address_gen_insn(const struct arch *arch, struct disasm_line *dl)
 {
 	if (arch__is(arch, "x86")) {
 		if (!strncmp(dl->ins.name, "lea", 3))
@@ -2791,7 +2791,7 @@ void debuginfo_cache__delete(void)
 }
 
 static struct annotated_data_type *
-__hist_entry__get_data_type(struct hist_entry *he, struct arch *arch,
+__hist_entry__get_data_type(struct hist_entry *he, const struct arch *arch,
 			    struct debuginfo *dbg, struct disasm_line *dl,
 			    int *type_offset)
 {
@@ -2895,7 +2895,7 @@ struct annotated_data_type *hist_entry__get_data_type(struct hist_entry *he)
 {
 	struct map_symbol *ms = &he->ms;
 	struct evsel *evsel = hists_to_evsel(he->hists);
-	struct arch *arch;
+	const struct arch *arch;
 	struct disasm_line *dl;
 	struct annotated_data_type *mem_type;
 	struct annotated_item_stat *istat;
diff --git a/tools/perf/util/annotate.h b/tools/perf/util/annotate.h
index d4990bff29a7..58eaf4b2fa65 100644
--- a/tools/perf/util/annotate.h
+++ b/tools/perf/util/annotate.h
@@ -202,7 +202,7 @@ struct annotation_write_ops {
 struct annotation_print_data {
 	struct hist_entry *he;
 	struct evsel *evsel;
-	struct arch *arch;
+	const struct arch *arch;
 	struct debuginfo *dbg;
 	/* save data type info keyed by al->offset */
 	struct hashmap *type_hash;
@@ -441,10 +441,10 @@ void symbol__annotate_zero_histograms(struct symbol *sym);
 
 int symbol__annotate(struct map_symbol *ms,
 		     struct evsel *evsel,
-		     struct arch **parch);
+		     const struct arch **parch);
 int symbol__annotate2(struct map_symbol *ms,
 		      struct evsel *evsel,
-		      struct arch **parch);
+		      const struct arch **parch);
 
 enum symbol_disassemble_errno {
 	SYMBOL_ANNOTATE_ERRNO__SUCCESS		= 0,
@@ -546,7 +546,7 @@ struct annotated_insn_loc {
 	     i++, op_loc++)
 
 /* Get detailed location info in the instruction */
-int annotate_get_insn_location(struct arch *arch, struct disasm_line *dl,
+int annotate_get_insn_location(const struct arch *arch, struct disasm_line *dl,
 			       struct annotated_insn_loc *loc);
 
 /* Returns a data type from the sample instruction (if any) */
@@ -586,5 +586,5 @@ int annotation_br_cntr_entry(char **str, int br_cntr_nr, u64 *br_cntr,
 			     int num_aggr, struct evsel *evsel);
 int annotation_br_cntr_abbr_list(char **str, struct evsel *evsel, bool header);
 
-int evsel__get_arch(struct evsel *evsel, struct arch **parch);
+int evsel__get_arch(struct evsel *evsel, const struct arch **parch);
 #endif	/* __PERF_ANNOTATE_H */
diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
index 96c78b01e17a..d41a0f96a6f6 100644
--- a/tools/perf/util/disasm.c
+++ b/tools/perf/util/disasm.c
@@ -213,7 +213,7 @@ static void arch__sort(void)
 	qsort(architectures, nmemb, sizeof(struct arch), arch__cmp);
 }
 
-struct arch *arch__find(const char *name)
+const struct arch *arch__find(const char *name)
 {
 	const int nmemb = ARRAY_SIZE(architectures);
 	static bool sorted;
@@ -226,7 +226,7 @@ struct arch *arch__find(const char *name)
 	return bsearch(name, architectures, nmemb, sizeof(struct arch), arch__key_cmp);
 }
 
-bool arch__is(struct arch *arch, const char *name)
+bool arch__is(const struct arch *arch, const char *name)
 {
 	return !strcmp(arch->name, name);
 }
@@ -256,7 +256,7 @@ static int ins__scnprintf(struct ins *ins, char *bf, size_t size,
 	return ins__raw_scnprintf(ins, bf, size, ops, max_ins_name);
 }
 
-bool ins__is_fused(struct arch *arch, const char *ins1, const char *ins2)
+bool ins__is_fused(const struct arch *arch, const char *ins1, const char *ins2)
 {
 	if (!arch || !arch->ins_is_fused)
 		return false;
@@ -264,7 +264,7 @@ bool ins__is_fused(struct arch *arch, const char *ins1, const char *ins2)
 	return arch->ins_is_fused(arch, ins1, ins2);
 }
 
-static int call__parse(struct arch *arch, struct ins_operands *ops, struct map_symbol *ms,
+static int call__parse(const struct arch *arch, struct ins_operands *ops, struct map_symbol *ms,
 		struct disasm_line *dl __maybe_unused)
 {
 	char *endptr, *tok, *name;
@@ -362,7 +362,7 @@ static inline const char *validate_comma(const char *c, struct ins_operands *ops
 	return c;
 }
 
-static int jump__parse(struct arch *arch, struct ins_operands *ops, struct map_symbol *ms,
+static int jump__parse(const struct arch *arch, struct ins_operands *ops, struct map_symbol *ms,
 		struct disasm_line *dl __maybe_unused)
 {
 	struct map *map = ms->map;
@@ -525,7 +525,7 @@ static int comment__symbol(char *raw, char *comment, u64 *addrp, char **namep)
 	return 0;
 }
 
-static int lock__parse(struct arch *arch, struct ins_operands *ops, struct map_symbol *ms,
+static int lock__parse(const struct arch *arch, struct ins_operands *ops, struct map_symbol *ms,
 		struct disasm_line *dl __maybe_unused)
 {
 	ops->locked.ops = zalloc(sizeof(*ops->locked.ops));
@@ -592,7 +592,7 @@ static struct ins_ops lock_ops = {
  * But it doesn't care segment selectors like %gs:0x5678(%rcx), so just check
  * the input string after 'memory_ref_char' if exists.
  */
-static bool check_multi_regs(struct arch *arch, const char *op)
+static bool check_multi_regs(const struct arch *arch, const char *op)
 {
 	int count = 0;
 
@@ -613,8 +613,9 @@ static bool check_multi_regs(struct arch *arch, const char *op)
 	return count > 1;
 }
 
-static int mov__parse(struct arch *arch, struct ins_operands *ops, struct map_symbol *ms __maybe_unused,
-		struct disasm_line *dl __maybe_unused)
+static int mov__parse(const struct arch *arch, struct ins_operands *ops,
+		      struct map_symbol *ms __maybe_unused,
+		      struct disasm_line *dl __maybe_unused)
 {
 	char *s = strchr(ops->raw, ','), *target, *comment, prev;
 
@@ -719,7 +720,7 @@ static int arithmetic__scnprintf(struct ins *ins, char *bf, size_t size,
  * - Add to Zero Extended XO-form ( Ex: addze, addzeo )
  * - Subtract From Zero Extended XO-form ( Ex: subfze )
  */
-static int arithmetic__parse(struct arch *arch __maybe_unused, struct ins_operands *ops,
+static int arithmetic__parse(const struct arch *arch __maybe_unused, struct ins_operands *ops,
 		struct map_symbol *ms __maybe_unused, struct disasm_line *dl)
 {
 	int opcode = PPC_OP(dl->raw.raw_insn);
@@ -756,7 +757,7 @@ static int load_store__scnprintf(struct ins *ins, char *bf, size_t size,
  * used by powerpc and since binary instruction code is used to
  * extract opcode, regs and offset, no other parsing is needed here
  */
-static int load_store__parse(struct arch *arch __maybe_unused, struct ins_operands *ops,
+static int load_store__parse(const struct arch *arch __maybe_unused, struct ins_operands *ops,
 		struct map_symbol *ms __maybe_unused, struct disasm_line *dl __maybe_unused)
 {
 	ops->source.mem_ref = true;
@@ -776,8 +777,9 @@ static struct ins_ops load_store_ops = {
 	.scnprintf = load_store__scnprintf,
 };
 
-static int dec__parse(struct arch *arch __maybe_unused, struct ins_operands *ops, struct map_symbol *ms __maybe_unused,
-		struct disasm_line *dl __maybe_unused)
+static int dec__parse(const struct arch *arch __maybe_unused, struct ins_operands *ops,
+		      struct map_symbol *ms __maybe_unused,
+		      struct disasm_line *dl __maybe_unused)
 {
 	char *target, *comment, *s, prev;
 
@@ -867,7 +869,8 @@ static void ins__sort(struct arch *arch)
 	qsort(arch->instructions, nmemb, sizeof(struct ins), ins__cmp);
 }
 
-static struct ins_ops *__ins__find(struct arch *arch, const char *name, struct disasm_line *dl)
+static struct ins_ops *__ins__find(const struct arch *arch, const char *name,
+				     struct disasm_line *dl)
 {
 	struct ins *ins;
 	const int nmemb = arch->nr_instructions;
@@ -885,8 +888,8 @@ static struct ins_ops *__ins__find(struct arch *arch, const char *name, struct d
 	}
 
 	if (!arch->sorted_instructions) {
-		ins__sort(arch);
-		arch->sorted_instructions = true;
+		ins__sort((struct arch *)arch);
+		((struct arch *)arch)->sorted_instructions = true;
 	}
 
 	ins = bsearch(name, arch->instructions, nmemb, sizeof(struct ins), ins__key_cmp);
@@ -913,17 +916,18 @@ static struct ins_ops *__ins__find(struct arch *arch, const char *name, struct d
 	return ins ? ins->ops : NULL;
 }
 
-struct ins_ops *ins__find(struct arch *arch, const char *name, struct disasm_line *dl)
+struct ins_ops *ins__find(const struct arch *arch, const char *name, struct disasm_line *dl)
 {
 	struct ins_ops *ops = __ins__find(arch, name, dl);
 
 	if (!ops && arch->associate_instruction_ops)
-		ops = arch->associate_instruction_ops(arch, name);
+		ops = arch->associate_instruction_ops((struct arch *)arch, name);
 
 	return ops;
 }
 
-static void disasm_line__init_ins(struct disasm_line *dl, struct arch *arch, struct map_symbol *ms)
+static void disasm_line__init_ins(struct disasm_line *dl, const struct arch *arch,
+				    struct map_symbol *ms)
 {
 	dl->ins.ops = ins__find(arch, dl->ins.name, dl);
 
diff --git a/tools/perf/util/disasm.h b/tools/perf/util/disasm.h
index a3ea9d676281..273a9c906514 100644
--- a/tools/perf/util/disasm.h
+++ b/tools/perf/util/disasm.h
@@ -30,7 +30,7 @@ struct arch {
 	unsigned int	model;
 	unsigned int	family;
 	int		(*init)(struct arch *arch, char *cpuid);
-	bool		(*ins_is_fused)(struct arch *arch, const char *ins1,
+	bool		(*ins_is_fused)(const struct arch *arch, const char *ins1,
 					const char *ins2);
 	struct		{
 		char comment_char;
@@ -89,14 +89,14 @@ struct ins_operands {
 
 struct ins_ops {
 	void (*free)(struct ins_operands *ops);
-	int (*parse)(struct arch *arch, struct ins_operands *ops, struct map_symbol *ms,
+	int (*parse)(const struct arch *arch, struct ins_operands *ops, struct map_symbol *ms,
 			struct disasm_line *dl);
 	int (*scnprintf)(struct ins *ins, char *bf, size_t size,
 			 struct ins_operands *ops, int max_ins_name);
 };
 
 struct annotate_args {
-	struct arch		  *arch;
+	const struct arch	  *arch;
 	struct map_symbol	  *ms;
 	struct annotation_options *options;
 	s64			  offset;
@@ -105,14 +105,14 @@ struct annotate_args {
 	char			  *fileloc;
 };
 
-struct arch *arch__find(const char *name);
-bool arch__is(struct arch *arch, const char *name);
+const struct arch *arch__find(const char *name);
+bool arch__is(const struct arch *arch, const char *name);
 
-struct ins_ops *ins__find(struct arch *arch, const char *name, struct disasm_line *dl);
+struct ins_ops *ins__find(const struct arch *arch, const char *name, struct disasm_line *dl);
 
 bool ins__is_call(const struct ins *ins);
 bool ins__is_jump(const struct ins *ins);
-bool ins__is_fused(struct arch *arch, const char *ins1, const char *ins2);
+bool ins__is_fused(const struct arch *arch, const char *ins1, const char *ins2);
 bool ins__is_ret(const struct ins *ins);
 bool ins__is_lock(const struct ins *ins);
 
-- 
2.52.0.457.g6b5491de43-goog


