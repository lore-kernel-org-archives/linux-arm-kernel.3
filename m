Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76947D625F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 07:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7SyQiS0lnXgAvEhozlNZ8ceN/SCct+/3Su0Yxs9eoEA=; b=255fRgj8w91N8fZzoYY8X60+4n
	TDNSACCpk+vEcAOzeOS5zKIZxwcVK41z6ajdNGPLgVicSFh8YAhiPHlwxlvu+EZC2tZjsG3uk7bA1
	aCnxhdDx9pGmMQSHcp4IpM2ay9kWyKVrrt38jp/Xo66TcfXB3tYF9PX1q+qreoB8U4KgCVTcS1tWC
	aqvcHBE1wpGip0SvX5blqMzK9dbVOaaLPolRLF8hu+uRR4MdLOyRe03h5T7UGBafX2QH9xUCLhnRl
	0CyjiCKe84IKk/KkssE7DwpOXQv33z0TMy/AXGYN6kdPhIl99y8JKpZnF6kZ1fZN3kBvIg41mtKgl
	cZp5KYkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipAN-00000006Y9d-1kfi;
	Thu, 22 Jan 2026 07:31:43 +0000
Received: from mail-dl1-x124a.google.com ([2607:f8b0:4864:20::124a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipAF-00000006Y1M-0YZD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 07:31:36 +0000
Received: by mail-dl1-x124a.google.com with SMTP id a92af1059eb24-1233b91de6bso1403736c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 23:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769067094; x=1769671894; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7SyQiS0lnXgAvEhozlNZ8ceN/SCct+/3Su0Yxs9eoEA=;
        b=ZpWwlkc1SOQXiNc8AHqB4/R22Oey/3i3giTPLRmQFmCwNYbDe37c0RIhI+I4pv/FUn
         mJL6SZr3oY7SMrqNJKdS8k+CnG/fiIRr1WDS1sZyxZ92rxnCdoZHF5zLghcbw7RiUQqT
         f+/NDBsUD32i8g9F1rLUivN7u3TsWoWgiqcTICc4p0tGNx4Hx5v3EYBzZUwby/mdsllc
         Uza3+CIilUtw47TDkG+J7Ee9liyaoxGasJlpsA30WJ365dcmhqUQMT0ZfhQIWhLtF7wI
         +pfnj1H6ZiVGRiPkwXVEe1omnUuQBiXqAX1WJhWqAYZmuDf26BFYbfLZS9P10AC7TmjB
         FAtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769067094; x=1769671894;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7SyQiS0lnXgAvEhozlNZ8ceN/SCct+/3Su0Yxs9eoEA=;
        b=jGSlHrZnTxGHQSCQpAJu011hZ2M9sxTnagIz+e0tbMuFTQu39oAHp4hW/Hkit5j8NH
         Qmntve5tpMpi0JgcOpHIyj172gQEWS8FNwtB4NH60nAYVqgRrrhN+fxPNb4XSI7sGy5z
         kVO+NU0J2O0xOsY6AINrJitgTeeEo2HB8DwMswE9kcwvIh7WF2LgjlxJGmg8OM85lX8J
         Z+VvEd/uCD0uGaNLjLOYxhqaDMSVOnUf6RfFBo7GoopdVdgSnAciAVzKaqy117hiNkQX
         Cx7EZYlWyOHK1l+WtlUrRJZT5Va1RbW6JYYNFzplwBPQm3fYMQZSZ8kTlHGGdwJMLLXh
         ly0w==
X-Forwarded-Encrypted: i=1; AJvYcCVN+qhJkuewCYz/Lyu3A0YGv7OV4mAeIrFoTRPp2icaH61U7dqypEMImk4ECiT72QItdMEOPNTc9YyoD0Oejtkm@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9DVAg0Y4SVooJA3zU0myHAGGbgamoP9ZELkAIBJxmeHc+1qzF
	+4JvREzuXhvw+ysBr3EEEfrXsLYbhN0WjsTC9LFKQS3efgD/lh92Zk9ArGpa9iddDIU7vvFW+tG
	PWAj1eEvNtw==
X-Received: from dlbcm22.prod.google.com ([2002:a05:7022:6896:b0:11e:60ad:95af])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:4584:b0:11b:c2fd:3960
 with SMTP id a92af1059eb24-1244b35fd1amr12854378c88.28.1769067093485; Wed, 21
 Jan 2026 23:31:33 -0800 (PST)
Date: Wed, 21 Jan 2026 23:31:18 -0800
In-Reply-To: <20260122073127.375139-1-irogers@google.com>
Mime-Version: 1.0
References: <20260122073127.375139-1-irogers@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260122073127.375139-3-irogers@google.com>
Subject: [PATCH v1 02/11] perf annotate: Fix args leak of map_symbol
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
X-CRM114-CacheID: sfid-20260121_233135_184795_E654EF3E 
X-CRM114-Status: GOOD (  17.64  )
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

map_symbol__exit needs calling on an annotate_args.ms, however, rather
than introduce proper reference count handling to symbol__annotate
just switch to passing the map_symbol pointer parameter around, making
the puts the caller's responsibility.

Signed-off-by: Ian Rogers <irogers@google.com>
Fixes: 56e144fe9826 ("perf mem_info: Add and use map_symbol__exit and addr_map_symbol__exit")
---
 tools/perf/util/annotate.c |  2 +-
 tools/perf/util/capstone.c | 14 +++++++-------
 tools/perf/util/disasm.c   | 32 +++++++++++++++++---------------
 tools/perf/util/disasm.h   |  2 +-
 tools/perf/util/llvm.c     |  6 +++---
 5 files changed, 29 insertions(+), 27 deletions(-)

diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
index cc7764455faf..791d60f97c23 100644
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
index be5fd44b1f9d..2c7feab61b7b 100644
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
index 50b9433f3f8e..96c78b01e17a 100644
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
@@ -1172,7 +1174,7 @@ static int symbol__parse_objdump_line(struct symbol *sym,
 			.ms = { .map = map, },
 		};
 
-		if (!maps__find_ams(args->ms.maps, &target) &&
+		if (!maps__find_ams(args->ms->maps, &target) &&
 		    target.ms.sym->start == target.al_addr)
 			dl->ops.target.sym = target.ms.sym;
 	}
@@ -1338,7 +1340,7 @@ static int symbol__disassemble_raw(char *filename, struct symbol *sym,
 					struct annotate_args *args)
 {
 	struct annotation *notes = symbol__annotation(sym);
-	struct map *map = args->ms.map;
+	struct map *map = args->ms->map;
 	struct dso *dso = map__dso(map);
 	u64 start = map__rip_2objdump(map, sym->start);
 	u64 end = map__rip_2objdump(map, sym->end);
@@ -1375,7 +1377,7 @@ static int symbol__disassemble_raw(char *filename, struct symbol *sym,
 	args->line = disasm_buf;
 	args->line_nr = 0;
 	args->fileloc = NULL;
-	args->ms.sym = sym;
+	args->ms->sym = sym;
 
 	dl = disasm_line__new(args);
 	if (dl == NULL)
@@ -1501,7 +1503,7 @@ static int symbol__disassemble_objdump(const char *filename, struct symbol *sym,
 				       struct annotate_args *args)
 {
 	struct annotation_options *opts = &annotate_opts;
-	struct map *map = args->ms.map;
+	struct map *map = args->ms->map;
 	struct dso *dso = map__dso(map);
 	char *command;
 	FILE *file;
@@ -1644,7 +1646,7 @@ static int symbol__disassemble_objdump(const char *filename, struct symbol *sym,
 int symbol__disassemble(struct symbol *sym, struct annotate_args *args)
 {
 	struct annotation_options *options = args->options;
-	struct map *map = args->ms.map;
+	struct map *map = args->ms->map;
 	struct dso *dso = map__dso(map);
 	char symfs_filename[PATH_MAX];
 	bool delete_extract = false;
diff --git a/tools/perf/util/disasm.h b/tools/perf/util/disasm.h
index d2cb555e4a3b..a3ea9d676281 100644
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
index 2ebf1f5f65bf..4ada9a10bd93 100644
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
2.52.0.457.g6b5491de43-goog


