Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AFE6FEE4F2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 17:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4PFzA6x7XpGtL5gGAe9ZkCbhjFM0+Eu/npdy+Yhrt1I=; b=gc0txQb8OVjP8KZ+xVIsM2wkpm
	2nxXBpBBvBt3cxYfSope3QDKxVCUf57pyoqjaD13zzeWjqrOilqsdoRlR3CKfWCFh+m3oQGyvfp7J
	BB3/WSqcW7iUxfYv1M6pvvSztq2QnlZAQoDOYpIxNSngPjAA7HcTFB0Hm3vOO7TCG6Ay3KGTikW2j
	Zo/fdhZLMzyW8SHS/lIgIiuThpHqBbwX/bxDzrLhsS42RTYGkEy2Ding4gs315GG46sSd65n3E+Eq
	MCoOu7z0DRbmeuen+YncAh2YmhDbHSVhuika6ElRnod+xe21++AW4wRa+BernbV805oCnoab6X0N4
	272VAfPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwOQJ-0000000A7H4-0c68;
	Sat, 28 Feb 2026 17:48:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwOQI-0000000A7Gu-11dV;
	Sat, 28 Feb 2026 17:48:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5A97060054;
	Sat, 28 Feb 2026 17:48:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8689DC116D0;
	Sat, 28 Feb 2026 17:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772300892;
	bh=GPuD30vv6sqzucOUBpi9B4iP3HDC27EbjrmXMtZrSlM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z2mgJSbqwaIzBUJt2LWHO7DtyBBo6dByNe0+cm5mtPjD5SjBJgUbmpXTc2k1VzIlI
	 d9hm8GWkBdswB5dNllvs4U8G6OzMk5yVlvsL1ulYwew8QQZWh3npCAXZRUB/RDA0cy
	 7CV1tosjl3Xx2sKL8XbyeNG6Ihupamt1VWUP/EtfcktCbyMdn0jEBndwexVUAGp8jU
	 +Slna/T8En3j6/M/AuZR6CVTbUiGyNzZ681qDQwXbjAasALDVfmfRx9YEAdoLchTmG
	 xHIBKqER452Lx0N5zmJMizP+HaukA10kZvBZ5uq9YksmaKtJa2XpeJntxVDzel+SHi
	 9QWWBncCev2Zw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev
Cc: Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>,
	Aditya Bodkhe <aditya.b1@linux.ibm.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Athira Rajeev <atrajeev@linux.ibm.com>,
	Bill Wendling <morbo@google.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Guo Ren <guoren@kernel.org>,
	Howard Chu <howardchu95@gmail.com>,
	Ingo Molnar <mingo@redhat.com>,
	Jiri Olsa <jolsa@kernel.org>,
	John Garry <john.g.garry@oracle.com>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Justin Stitt <justinstitt@google.com>,
	=?UTF-8?q?Krzysztof=20=C5=81opatowski?= <krzysztof.m.lopatowski@gmail.com>,
	Leo Yan <leo.yan@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Namhyung Kim <namhyung@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Sergei Trofimovich <slyich@gmail.com>,
	Shimin Guo <shimin.guo@skydio.com>,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>,
	Thomas Falcon <thomas.falcon@intel.com>,
	Tianyou Li <tianyou.li@intel.com>,
	Will Deacon <will@kernel.org>,
	Zecheng Li <zecheng@google.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.18 011/752] perf annotate: Fix args leak of map_symbol
Date: Sat, 28 Feb 2026 12:35:22 -0500
Message-ID: <20260228174750.1542406-11-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260228174750.1542406-1-sashal@kernel.org>
References: <20260228174750.1542406-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
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

From: Ian Rogers <irogers@google.com>

[ Upstream commit 00419892bac28bf148450d762bbff990a6bd5494 ]

map_symbol__exit() needs calling on an annotate_args.ms, however, rather
than introduce proper reference count handling to symbol__annotate()
just switch to passing the map_symbol pointer parameter around, making
the puts the caller's responsibility.

Fix a number of cases to ensure the map in a map_symbol has a
reference count increment and add the then necessary map_symbol_exits.

Fixes: 56e144fe98260a0f ("perf mem_info: Add and use map_symbol__exit and addr_map_symbol__exit")
Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Ian Rogers <irogers@google.com>
Cc: Aditya Bodkhe <aditya.b1@linux.ibm.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Cc: Athira Rajeev <atrajeev@linux.ibm.com>
Cc: Bill Wendling <morbo@google.com>
Cc: Dr. David Alan Gilbert <linux@treblig.org>
Cc: Guo Ren <guoren@kernel.org>
Cc: Howard Chu <howardchu95@gmail.com>
Cc: Ian Rogers <irogers@google.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: John Garry <john.g.garry@oracle.com>
Cc: Julia Lawall <Julia.Lawall@inria.fr>
Cc: Justin Stitt <justinstitt@google.com>
Cc: Krzysztof Łopatowski <krzysztof.m.lopatowski@gmail.com>
Cc: Leo Yan <leo.yan@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-csky@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <pjw@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Sergei Trofimovich <slyich@gmail.com>
Cc: Shimin Guo <shimin.guo@skydio.com>
Cc: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Cc: Thomas Falcon <thomas.falcon@intel.com>
Cc: Tianyou Li <tianyou.li@intel.com>
Cc: Will Deacon <will@kernel.org>
Cc: Zecheng Li <zecheng@google.com>
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../arch/loongarch/annotate/instructions.c    | 14 ++++----
 tools/perf/arch/s390/annotate/instructions.c  | 11 +++---
 tools/perf/util/annotate.c                    |  2 +-
 tools/perf/util/capstone.c                    | 14 ++++----
 tools/perf/util/disasm.c                      | 36 ++++++++++---------
 tools/perf/util/disasm.h                      |  2 +-
 tools/perf/util/llvm.c                        |  6 ++--
 7 files changed, 47 insertions(+), 38 deletions(-)

diff --git a/tools/perf/arch/loongarch/annotate/instructions.c b/tools/perf/arch/loongarch/annotate/instructions.c
index 70262d5f14442..1c3abb43c8d72 100644
--- a/tools/perf/arch/loongarch/annotate/instructions.c
+++ b/tools/perf/arch/loongarch/annotate/instructions.c
@@ -10,9 +10,7 @@ static int loongarch_call__parse(struct arch *arch, struct ins_operands *ops, st
 {
 	char *c, *endptr, *tok, *name;
 	struct map *map = ms->map;
-	struct addr_map_symbol target = {
-		.ms = { .map = map, },
-	};
+	struct addr_map_symbol target;
 
 	c = strchr(ops->raw, '#');
 	if (c++ == NULL)
@@ -38,12 +36,16 @@ static int loongarch_call__parse(struct arch *arch, struct ins_operands *ops, st
 	if (ops->target.name == NULL)
 		return -1;
 
-	target.addr = map__objdump_2mem(map, ops->target.addr);
+	target = (struct addr_map_symbol) {
+		.ms = { .map = map__get(map), },
+		.addr = map__objdump_2mem(map, ops->target.addr),
+	};
 
 	if (maps__find_ams(ms->maps, &target) == 0 &&
 	    map__rip_2objdump(target.ms.map, map__map_ip(target.ms.map, target.addr)) == ops->target.addr)
 		ops->target.sym = target.ms.sym;
 
+	addr_map_symbol__exit(&target);
 	return 0;
 }
 
@@ -58,7 +60,7 @@ static int loongarch_jump__parse(struct arch *arch, struct ins_operands *ops, st
 	struct map *map = ms->map;
 	struct symbol *sym = ms->sym;
 	struct addr_map_symbol target = {
-		.ms = { .map = map, },
+		.ms = { .map = map__get(map), },
 	};
 	const char *c = strchr(ops->raw, '#');
 	u64 start, end;
@@ -90,7 +92,7 @@ static int loongarch_jump__parse(struct arch *arch, struct ins_operands *ops, st
 	} else {
 		ops->target.offset_avail = false;
 	}
-
+	addr_map_symbol__exit(&target);
 	return 0;
 }
 
diff --git a/tools/perf/arch/s390/annotate/instructions.c b/tools/perf/arch/s390/annotate/instructions.c
index c61193f1e0964..626e6d2cbc81a 100644
--- a/tools/perf/arch/s390/annotate/instructions.c
+++ b/tools/perf/arch/s390/annotate/instructions.c
@@ -6,9 +6,7 @@ static int s390_call__parse(struct arch *arch, struct ins_operands *ops,
 {
 	char *endptr, *tok, *name;
 	struct map *map = ms->map;
-	struct addr_map_symbol target = {
-		.ms = { .map = map, },
-	};
+	struct addr_map_symbol target;
 
 	tok = strchr(ops->raw, ',');
 	if (!tok)
@@ -36,12 +34,17 @@ static int s390_call__parse(struct arch *arch, struct ins_operands *ops,
 
 	if (ops->target.name == NULL)
 		return -1;
-	target.addr = map__objdump_2mem(map, ops->target.addr);
+
+	target = (struct addr_map_symbol) {
+		.ms = { .map = map__get(map), },
+		.addr = map__objdump_2mem(map, ops->target.addr),
+	};
 
 	if (maps__find_ams(ms->maps, &target) == 0 &&
 	    map__rip_2objdump(target.ms.map, map__map_ip(target.ms.map, target.addr)) == ops->target.addr)
 		ops->target.sym = target.ms.sym;
 
+	addr_map_symbol__exit(&target);
 	return 0;
 }
 
diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
index 1d6900033b3a0..dc80d922f450d 100644
--- a/tools/perf/util/annotate.c
+++ b/tools/perf/util/annotate.c
@@ -1031,7 +1031,7 @@ int symbol__annotate(struct map_symbol *ms, struct evsel *evsel,
 		return 0;
 
 	args.arch = arch;
-	args.ms = *ms;
+	args.ms = ms;
 
 	if (notes->src == NULL) {
 		notes->src = annotated_source__new();
diff --git a/tools/perf/util/capstone.c b/tools/perf/util/capstone.c
index be5fd44b1f9dc..2c7feab61b7bf 100644
--- a/tools/perf/util/capstone.c
+++ b/tools/perf/util/capstone.c
@@ -143,7 +143,7 @@ static void print_capstone_detail(cs_insn *insn, char *buf, size_t len,
 				  struct annotate_args *args, u64 addr)
 {
 	int i;
-	struct map *map = args->ms.map;
+	struct map *map = args->ms->map;
 	struct symbol *sym;
 
 	/* TODO: support more architectures */
@@ -222,7 +222,7 @@ int symbol__disassemble_capstone(const char *filename __maybe_unused,
 {
 #ifdef HAVE_LIBCAPSTONE_SUPPORT
 	struct annotation *notes = symbol__annotation(sym);
-	struct map *map = args->ms.map;
+	struct map *map = args->ms->map;
 	struct dso *dso = map__dso(map);
 	u64 start = map__rip_2objdump(map, sym->start);
 	u64 offset;
@@ -256,7 +256,7 @@ int symbol__disassemble_capstone(const char *filename __maybe_unused,
 	args->line = disasm_buf;
 	args->line_nr = 0;
 	args->fileloc = NULL;
-	args->ms.sym = sym;
+	args->ms->sym = sym;
 
 	dl = disasm_line__new(args);
 	if (dl == NULL)
@@ -268,7 +268,7 @@ int symbol__disassemble_capstone(const char *filename __maybe_unused,
 	    !strcmp(args->options->disassembler_style, "att"))
 		disassembler_style = true;
 
-	if (capstone_init(maps__machine(args->ms.maps), &handle, is_64bit, disassembler_style) < 0)
+	if (capstone_init(maps__machine(args->ms->maps), &handle, is_64bit, disassembler_style) < 0)
 		goto err;
 
 	needs_cs_close = true;
@@ -345,7 +345,7 @@ int symbol__disassemble_capstone_powerpc(const char *filename __maybe_unused,
 {
 #ifdef HAVE_LIBCAPSTONE_SUPPORT
 	struct annotation *notes = symbol__annotation(sym);
-	struct map *map = args->ms.map;
+	struct map *map = args->ms->map;
 	struct dso *dso = map__dso(map);
 	struct nscookie nsc;
 	u64 start = map__rip_2objdump(map, sym->start);
@@ -382,7 +382,7 @@ int symbol__disassemble_capstone_powerpc(const char *filename __maybe_unused,
 	    !strcmp(args->options->disassembler_style, "att"))
 		disassembler_style = true;
 
-	if (capstone_init(maps__machine(args->ms.maps), &handle, is_64bit, disassembler_style) < 0)
+	if (capstone_init(maps__machine(args->ms->maps), &handle, is_64bit, disassembler_style) < 0)
 		goto err;
 
 	needs_cs_close = true;
@@ -408,7 +408,7 @@ int symbol__disassemble_capstone_powerpc(const char *filename __maybe_unused,
 	args->line = disasm_buf;
 	args->line_nr = 0;
 	args->fileloc = NULL;
-	args->ms.sym = sym;
+	args->ms->sym = sym;
 
 	dl = disasm_line__new(args);
 	if (dl == NULL)
diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
index 50b9433f3f8e6..924429142631a 100644
--- a/tools/perf/util/disasm.c
+++ b/tools/perf/util/disasm.c
@@ -269,9 +269,7 @@ static int call__parse(struct arch *arch, struct ins_operands *ops, struct map_s
 {
 	char *endptr, *tok, *name;
 	struct map *map = ms->map;
-	struct addr_map_symbol target = {
-		.ms = { .map = map, },
-	};
+	struct addr_map_symbol target;
 
 	ops->target.addr = strtoull(ops->raw, &endptr, 16);
 
@@ -296,12 +294,16 @@ static int call__parse(struct arch *arch, struct ins_operands *ops, struct map_s
 	if (ops->target.name == NULL)
 		return -1;
 find_target:
-	target.addr = map__objdump_2mem(map, ops->target.addr);
+	target = (struct addr_map_symbol) {
+		.ms = { .map = map__get(map), },
+		.addr = map__objdump_2mem(map, ops->target.addr),
+	};
 
 	if (maps__find_ams(ms->maps, &target) == 0 &&
 	    map__rip_2objdump(target.ms.map, map__map_ip(target.ms.map, target.addr)) == ops->target.addr)
 		ops->target.sym = target.ms.sym;
 
+	addr_map_symbol__exit(&target);
 	return 0;
 
 indirect_call:
@@ -366,7 +368,7 @@ static int jump__parse(struct arch *arch, struct ins_operands *ops, struct map_s
 	struct map *map = ms->map;
 	struct symbol *sym = ms->sym;
 	struct addr_map_symbol target = {
-		.ms = { .map = map, },
+		.ms = { .map = map__get(map), },
 	};
 	const char *c = strchr(ops->raw, ',');
 	u64 start, end;
@@ -440,7 +442,7 @@ static int jump__parse(struct arch *arch, struct ins_operands *ops, struct map_s
 	} else {
 		ops->target.offset_avail = false;
 	}
-
+	addr_map_symbol__exit(&target);
 	return 0;
 }
 
@@ -1046,7 +1048,7 @@ static size_t disasm_line_size(int nr)
 struct disasm_line *disasm_line__new(struct annotate_args *args)
 {
 	struct disasm_line *dl = NULL;
-	struct annotation *notes = symbol__annotation(args->ms.sym);
+	struct annotation *notes = symbol__annotation(args->ms->sym);
 	int nr = notes->src->nr_events;
 
 	dl = zalloc(disasm_line_size(nr));
@@ -1064,7 +1066,7 @@ struct disasm_line *disasm_line__new(struct annotate_args *args)
 		} else if (disasm_line__parse(dl->al.line, &dl->ins.name, &dl->ops.raw) < 0)
 			goto out_free_line;
 
-		disasm_line__init_ins(dl, args->arch, &args->ms);
+		disasm_line__init_ins(dl, args->arch, args->ms);
 	}
 
 	return dl;
@@ -1119,7 +1121,7 @@ static int symbol__parse_objdump_line(struct symbol *sym,
 				      struct annotate_args *args,
 				      char *parsed_line, int *line_nr, char **fileloc)
 {
-	struct map *map = args->ms.map;
+	struct map *map = args->ms->map;
 	struct annotation *notes = symbol__annotation(sym);
 	struct disasm_line *dl;
 	char *tmp;
@@ -1151,7 +1153,7 @@ static int symbol__parse_objdump_line(struct symbol *sym,
 	args->line    = parsed_line;
 	args->line_nr = *line_nr;
 	args->fileloc = *fileloc;
-	args->ms.sym  = sym;
+	args->ms->sym  = sym;
 
 	dl = disasm_line__new(args);
 	(*line_nr)++;
@@ -1169,12 +1171,14 @@ static int symbol__parse_objdump_line(struct symbol *sym,
 	if (dl->ins.ops && ins__is_call(&dl->ins) && !dl->ops.target.sym) {
 		struct addr_map_symbol target = {
 			.addr = dl->ops.target.addr,
-			.ms = { .map = map, },
+			.ms = { .map = map__get(map), },
 		};
 
-		if (!maps__find_ams(args->ms.maps, &target) &&
+		if (!maps__find_ams(args->ms->maps, &target) &&
 		    target.ms.sym->start == target.al_addr)
 			dl->ops.target.sym = target.ms.sym;
+
+		addr_map_symbol__exit(&target);
 	}
 
 	annotation_line__add(&dl->al, &notes->src->source);
@@ -1338,7 +1342,7 @@ static int symbol__disassemble_raw(char *filename, struct symbol *sym,
 					struct annotate_args *args)
 {
 	struct annotation *notes = symbol__annotation(sym);
-	struct map *map = args->ms.map;
+	struct map *map = args->ms->map;
 	struct dso *dso = map__dso(map);
 	u64 start = map__rip_2objdump(map, sym->start);
 	u64 end = map__rip_2objdump(map, sym->end);
@@ -1375,7 +1379,7 @@ static int symbol__disassemble_raw(char *filename, struct symbol *sym,
 	args->line = disasm_buf;
 	args->line_nr = 0;
 	args->fileloc = NULL;
-	args->ms.sym = sym;
+	args->ms->sym = sym;
 
 	dl = disasm_line__new(args);
 	if (dl == NULL)
@@ -1501,7 +1505,7 @@ static int symbol__disassemble_objdump(const char *filename, struct symbol *sym,
 				       struct annotate_args *args)
 {
 	struct annotation_options *opts = &annotate_opts;
-	struct map *map = args->ms.map;
+	struct map *map = args->ms->map;
 	struct dso *dso = map__dso(map);
 	char *command;
 	FILE *file;
@@ -1644,7 +1648,7 @@ static int symbol__disassemble_objdump(const char *filename, struct symbol *sym,
 int symbol__disassemble(struct symbol *sym, struct annotate_args *args)
 {
 	struct annotation_options *options = args->options;
-	struct map *map = args->ms.map;
+	struct map *map = args->ms->map;
 	struct dso *dso = map__dso(map);
 	char symfs_filename[PATH_MAX];
 	bool delete_extract = false;
diff --git a/tools/perf/util/disasm.h b/tools/perf/util/disasm.h
index d2cb555e4a3be..a3ea9d6762816 100644
--- a/tools/perf/util/disasm.h
+++ b/tools/perf/util/disasm.h
@@ -97,7 +97,7 @@ struct ins_ops {
 
 struct annotate_args {
 	struct arch		  *arch;
-	struct map_symbol	  ms;
+	struct map_symbol	  *ms;
 	struct annotation_options *options;
 	s64			  offset;
 	char			  *line;
diff --git a/tools/perf/util/llvm.c b/tools/perf/util/llvm.c
index 2ebf1f5f65bf7..4ada9a10bd93f 100644
--- a/tools/perf/util/llvm.c
+++ b/tools/perf/util/llvm.c
@@ -118,7 +118,7 @@ int symbol__disassemble_llvm(const char *filename, struct symbol *sym,
 {
 #ifdef HAVE_LIBLLVM_SUPPORT
 	struct annotation *notes = symbol__annotation(sym);
-	struct map *map = args->ms.map;
+	struct map *map = args->ms->map;
 	struct dso *dso = map__dso(map);
 	u64 start = map__rip_2objdump(map, sym->start);
 	/* Malloc-ed buffer containing instructions read from disk. */
@@ -184,7 +184,7 @@ int symbol__disassemble_llvm(const char *filename, struct symbol *sym,
 	args->line = disasm_buf;
 	args->line_nr = 0;
 	args->fileloc = NULL;
-	args->ms.sym = sym;
+	args->ms->sym = sym;
 
 	dl = disasm_line__new(args);
 	if (dl == NULL)
@@ -242,7 +242,7 @@ int symbol__disassemble_llvm(const char *filename, struct symbol *sym,
 					 &line_storage_len);
 		args->line_nr = 0;
 		args->fileloc = NULL;
-		args->ms.sym = sym;
+		args->ms->sym = sym;
 
 		llvm_addr2line(filename, pc, &args->fileloc,
 			       (unsigned int *)&args->line_nr, false, NULL);
-- 
2.51.0


