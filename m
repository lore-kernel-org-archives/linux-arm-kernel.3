Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B62C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 03:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:References:Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L7xBPeAI1ZGK/na4YhBc+S5M0v2o7F6+AZ1yRtBTaOg=; b=ptCU6VzvCDKa585JW6nOHqyrbG
	FwiQBbma+U34b2BmzqerdvHEEV9bHofP/eErghSkqLb/W8PRYGEPIxvL/4S4bbP6UZr1Mir/Coc1y
	giQJ1Dhy5OxuCgC6tjGunotN16mJmfmMrw2jCQ8rqjF2sYjsV05aF+niR2KgiXXJsqW1Hd+Qfuy5f
	F2ckNKJThK+rB8f46Q+7dzlPPDRtjXm2SkFG2IrCO9GdGf7TLPmgu+1SdVJY6fEvHO+PTg205rR/G
	8QxuHjzBHwuaPCEe07Wwue80nVeyd3HG+RHWscvRlZWe7227bGEn9nJfjL3mtTRY6zTQejL69+FM0
	nDwo1n2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuO4O-00000004aHx-3Www;
	Tue, 18 Mar 2025 03:56:48 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuNgm-00000004WN9-3BDh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 03:32:30 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e54da6701d2so7696438276.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 20:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742268743; x=1742873543; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L7xBPeAI1ZGK/na4YhBc+S5M0v2o7F6+AZ1yRtBTaOg=;
        b=qrh0w+3A4p9VoCIJQ10rVMfTm8TpR/hhVJ9j7f55G7qORemSjU/kgcG2wNBCVVCylE
         4Jji8zrzIYo2ZVx5Snks+HR2qlqa7ci0t1vmEhExRYxLY85nY7kGpjYI78sDntOUmZ33
         GL38eFpL9h6qtJRn6LPRihwf7efLf2X3TXYCofw5o+cSz/jT1PEfIMAjuYqp3UP5Prt3
         S3rMk3P5JHtVcqDxCBNNnpjzAd+RhBlc8Vecveb2aBHC9aAooJynaMDFC6Ux3fCeH8mJ
         YibJJg+2jgJG9KnXf0tTrm8mCMikgES2PvaF67F2fLeZFiSxdImFl3Xd3zhHu3p0hfiI
         4JmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742268743; x=1742873543;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L7xBPeAI1ZGK/na4YhBc+S5M0v2o7F6+AZ1yRtBTaOg=;
        b=oIEdp1v1RPpGfrowMLISyW5OKkWGe545d9R4P8dr0tIvCnaBgBYN7p03xQnKVWv0lG
         OAKPpt8FgFfM7GhRDhbVsBk2s6tqngKkbDaN7vTL8ohZmLGt0HgZRH8+c5H85AyqPM8p
         Ab+CxWR/LgC4vy/fsHKA4537lWDQ3oP5tLAXvIRuGVPCq8oOcFTupGRYLYU7t5U18MGy
         ospXGr+suXj4dqXtpOr3HJ7j/9Guwbw5n/Ex8SiVRi8spZF+PNYTEuAksx1sKEKMOfcA
         OA00Lgm2/8Ycj5LHVOcywIMG6UjNB58ofcZFUOe9hBTblrOq1fNfUrLKxvPuBpcH6oOv
         lVDg==
X-Forwarded-Encrypted: i=1; AJvYcCVQ6Coh2n7JIgvdXJCBRgUkD9BF7KrvIGaiLmp0/gFRcLQ0ITIjdqDG70eN/OMHZiZVlKqMxYTnr6xux/ph0woO@lists.infradead.org
X-Gm-Message-State: AOJu0YzDJLTIboap8tdHkkIumN4Eeyx3pJ7AYHvOMt+nBSwDMlI+cvqD
	WubNijqeQeSKkPICnRZj7fS1k2ETDppoC/vPdWMb6Eh+3Xbd5s6WX6GrwozfAPipsuLoEpH74NE
	ZITSEyQ==
X-Google-Smtp-Source: AGHT+IFesFgROp1XE2mNJD85/+gXB9dKm0RtUVOiKrqT+K9I0LL2YHgQxyTSTsOCO8NGiyj2C//m84F0vwxS
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:ef29:15ce:a42a:b69f])
 (user=irogers job=sendgmr) by 2002:a25:b803:0:b0:e63:65c4:798a with SMTP id
 3f1490d57ef6-e63f65df420mr8224276.7.1742268743473; Mon, 17 Mar 2025 20:32:23
 -0700 (PDT)
Date: Mon, 17 Mar 2025 20:31:49 -0700
In-Reply-To: <20250318033150.119174-1-irogers@google.com>
Message-Id: <20250318033150.119174-13-irogers@google.com>
Mime-Version: 1.0
References: <20250318033150.119174-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Subject: [PATCH v6 12/13] perf trace: Make syscall table stable
From: Ian Rogers <irogers@google.com>
To: Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, guoren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Charlie Jenkins <charlie@rivosinc.com>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	"=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?=" <bjorn@rivosinc.com>, Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, linux-riscv@lists.infradead.org, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_203224_804586_C4CA0534 
X-CRM114-Status: GOOD (  21.04  )
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

Namhyung fixed the syscall table being reallocated and moving by
reloading the system call pointer after a move:
https://lore.kernel.org/lkml/Z9YHCzINiu4uBQ8B@google.com/
This could be brittle so this patch changes the syscall table to be an
array of pointers of "struct syscall" that don't move. Remove
unnecessary copies and searches with this change.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-trace.c | 87 +++++++++++++++++++++++---------------
 1 file changed, 53 insertions(+), 34 deletions(-)

diff --git a/tools/perf/builtin-trace.c b/tools/perf/builtin-trace.c
index 1c080d95c1e2..a5f31472980b 100644
--- a/tools/perf/builtin-trace.c
+++ b/tools/perf/builtin-trace.c
@@ -151,7 +151,7 @@ struct trace {
 	struct perf_tool	tool;
 	struct {
 		/** Sorted sycall numbers used by the trace. */
-		struct syscall  *table;
+		struct syscall  **table;
 		/** Size of table. */
 		size_t		table_size;
 		struct {
@@ -2473,24 +2473,41 @@ static size_t syscall__scnprintf_args(struct syscall *sc, char *bf, size_t size,
 	return printed;
 }
 
-static void syscall__init(struct syscall *sc, int e_machine, int id)
+static struct syscall *syscall__new(int e_machine, int id)
 {
-	memset(sc, 0, sizeof(*sc));
+	struct syscall *sc = zalloc(sizeof(*sc));
+
+	if (!sc)
+		return NULL;
+
 	sc->e_machine = e_machine;
 	sc->id = id;
+	return sc;
 }
 
-static void syscall__exit(struct syscall *sc)
+static void syscall__delete(struct syscall *sc)
 {
 	if (!sc)
 		return;
 
-	zfree(&sc->arg_fmt);
+	free(sc->arg_fmt);
+	free(sc);
+}
+
+static int syscall__bsearch_cmp(const void *key, const void *entry)
+{
+	const struct syscall *a = key, *b = *((const struct syscall **)entry);
+
+	if (a->e_machine != b->e_machine)
+		return a->e_machine - b->e_machine;
+
+	return a->id - b->id;
 }
 
 static int syscall__cmp(const void *va, const void *vb)
 {
-	const struct syscall *a = va, *b = vb;
+	const struct syscall *a = *((const struct syscall **)va);
+	const struct syscall *b = *((const struct syscall **)vb);
 
 	if (a->e_machine != b->e_machine)
 		return a->e_machine - b->e_machine;
@@ -2504,27 +2521,33 @@ static struct syscall *trace__find_syscall(struct trace *trace, int e_machine, i
 		.e_machine = e_machine,
 		.id = id,
 	};
-	struct syscall *sc, *tmp;
+	struct syscall *sc, **tmp;
 
 	if (trace->syscalls.table) {
-		sc = bsearch(&key, trace->syscalls.table, trace->syscalls.table_size,
-			     sizeof(struct syscall), syscall__cmp);
-		if (sc)
-			return sc;
+		struct syscall **sc_entry = bsearch(&key, trace->syscalls.table,
+						    trace->syscalls.table_size,
+						    sizeof(trace->syscalls.table[0]),
+						    syscall__bsearch_cmp);
+
+		if (sc_entry)
+			return *sc_entry;
 	}
 
+	sc = syscall__new(e_machine, id);
+	if (!sc)
+		return NULL;
+
 	tmp = reallocarray(trace->syscalls.table, trace->syscalls.table_size + 1,
-			   sizeof(struct syscall));
-	if (!tmp)
+			   sizeof(trace->syscalls.table[0]));
+	if (!tmp) {
+		syscall__delete(sc);
 		return NULL;
+	}
 
 	trace->syscalls.table = tmp;
-	sc = &trace->syscalls.table[trace->syscalls.table_size++];
-	syscall__init(sc, e_machine, id);
-	qsort(trace->syscalls.table, trace->syscalls.table_size, sizeof(struct syscall),
+	trace->syscalls.table[trace->syscalls.table_size++] = sc;
+	qsort(trace->syscalls.table, trace->syscalls.table_size, sizeof(trace->syscalls.table[0]),
 	      syscall__cmp);
-	sc = bsearch(&key, trace->syscalls.table, trace->syscalls.table_size,
-		     sizeof(struct syscall), syscall__cmp);
 	return sc;
 }
 
@@ -3855,14 +3878,14 @@ static int trace__bpf_sys_enter_beauty_map(struct trace *trace, int e_machine, i
 	return -1;
 }
 
-static struct bpf_program *trace__find_usable_bpf_prog_entry(struct trace *trace, struct syscall *_sc)
+static struct bpf_program *trace__find_usable_bpf_prog_entry(struct trace *trace,
+							     struct syscall *sc)
 {
-	struct syscall sc = *_sc; /* Copy as trace__syscall_info may invalidate pointer. */
 	struct tep_format_field *field, *candidate_field;
 	/*
 	 * We're only interested in syscalls that have a pointer:
 	 */
-	for (field = sc.args; field; field = field->next) {
+	for (field = sc->args; field; field = field->next) {
 		if (field->flags & TEP_FIELD_IS_POINTER)
 			goto try_to_find_pair;
 	}
@@ -3870,18 +3893,17 @@ static struct bpf_program *trace__find_usable_bpf_prog_entry(struct trace *trace
 	return NULL;
 
 try_to_find_pair:
-	for (int i = 0, num_idx = syscalltbl__num_idx(sc.e_machine); i < num_idx; ++i) {
-		int id = syscalltbl__id_at_idx(sc.e_machine, i);
-		/* calling trace__syscall_info() may invalidate '_sc' */
-		struct syscall *pair = trace__syscall_info(trace, NULL, sc.e_machine, id);
+	for (int i = 0, num_idx = syscalltbl__num_idx(sc->e_machine); i < num_idx; ++i) {
+		int id = syscalltbl__id_at_idx(sc->e_machine, i);
+		struct syscall *pair = trace__syscall_info(trace, NULL, sc->e_machine, id);
 		struct bpf_program *pair_prog;
 		bool is_candidate = false;
 
-		if (pair == NULL || pair->id == sc.id ||
+		if (pair == NULL || pair->id == sc->id ||
 		    pair->bpf_prog.sys_enter == trace->skel->progs.syscall_unaugmented)
 			continue;
 
-		for (field = sc.args, candidate_field = pair->args;
+		for (field = sc->args, candidate_field = pair->args;
 		     field && candidate_field; field = field->next, candidate_field = candidate_field->next) {
 			bool is_pointer = field->flags & TEP_FIELD_IS_POINTER,
 			     candidate_is_pointer = candidate_field->flags & TEP_FIELD_IS_POINTER;
@@ -3948,7 +3970,8 @@ static struct bpf_program *trace__find_usable_bpf_prog_entry(struct trace *trace
 				goto next_candidate;
 		}
 
-		pr_debug("Reusing \"%s\" BPF sys_enter augmenter for \"%s\"\n", pair->name, sc.name);
+		pr_debug("Reusing \"%s\" BPF sys_enter augmenter for \"%s\"\n", pair->name,
+			 sc->name);
 		return pair_prog;
 	next_candidate:
 		continue;
@@ -4044,11 +4067,7 @@ static int trace__init_syscalls_bpf_prog_array_maps(struct trace *trace, int e_m
 		pair_prog = trace__find_usable_bpf_prog_entry(trace, sc);
 		if (pair_prog == NULL)
 			continue;
-		/*
-		 * Get syscall info again as find usable entry above might
-		 * modify the syscall table and shuffle it.
-		 */
-		sc = trace__syscall_info(trace, NULL, e_machine, key);
+
 		sc->bpf_prog.sys_enter = pair_prog;
 
 		/*
@@ -5316,7 +5335,7 @@ static void trace__exit(struct trace *trace)
 	zfree(&trace->ev_qualifier_ids.entries);
 	if (trace->syscalls.table) {
 		for (size_t i = 0; i < trace->syscalls.table_size; i++)
-			syscall__exit(&trace->syscalls.table[i]);
+			syscall__delete(trace->syscalls.table[i]);
 		zfree(&trace->syscalls.table);
 	}
 	zfree(&trace->perfconfig_events);
-- 
2.49.0.rc1.451.g8f38331e32-goog


