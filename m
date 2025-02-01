Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C06EC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Feb 2025 07:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:References:Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lLTgvRbSl9eWDSfIwnWtHIUdhf1i5YhJ6/x5thJznSE=; b=C+TId5wJ63ouikokbOjmSNNM78
	6zyaqQwAF0xr0yGT/tlMng5HXF79pkZ9Rp+/92qNJPuKZYoMJwgIA/+ypAxSISD0nehLpfFI1vVs0
	sB4oeAb41F8NFQrTTBqWA058teSUgTg6PvWJcQR6sgefZiOcg+d3/D6HRbtCuIHZHvjKtr5e7krUq
	YVxy9KzKM+Rcrx0GkkmUTAHkAp8vUKX+BWmtfqfKrQprOOLftrp9qLR0CBDJXLDkmaa58LVmQJGYx
	cWqcBtn07KDsKbcS4B0TTT/6Xk2oNFj7gF5lcPiNnN9TMHBD6Or2WbGxSxKy4bevqfnc0AdC4EgVb
	oXuRJYNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1te7mb-0000000ByjY-3pjs;
	Sat, 01 Feb 2025 07:19:13 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1te7ik-0000000BxrB-29Rz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Feb 2025 07:15:15 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6f46924f63eso26770977b3.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jan 2025 23:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738394113; x=1738998913; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lLTgvRbSl9eWDSfIwnWtHIUdhf1i5YhJ6/x5thJznSE=;
        b=ucx3o0CXRAGaHrSWixA2J8xNPIqhoKeFrjhe+f3gS+uFrhQN2UoDMYxkCokFoCNhFW
         hGLWE24cgrQHBMN8NHcYl1J71xO6sKz6SOYumBuRFPVMr1/n0Vw5nWlDxsnEoeoPqbyp
         G8GpRr03Bdpy8iepKzSyEPSAO4XSOTFBK6zDDcN5+FX8w3PLMBfCJlr1kakEFl+5o5fW
         rKKq0uCZyTW8JEEZ0rHRgBGxhCbDkKzrqkf4xvy7lV9I72JBerjZRlYYALETtyLjuhQr
         RJ1qHxKDli2xqJlN0lHp05hLudsFuv37IZ2xfY7HZhqyUzAx4/8cv8EP02rLa6OeKfV6
         9fAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738394113; x=1738998913;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lLTgvRbSl9eWDSfIwnWtHIUdhf1i5YhJ6/x5thJznSE=;
        b=th7FrVNboEF4QYExJMhF+dmew5PdUvc5PTC4hPF2kz+VCwCJoM4TTbY9p7bZ7YdWQq
         Ofi738w0FhP3qMdpLRgMzv5fgaOcIJJMun7/caSRHDFMe9uCJm1RroJ/cDfm/Zkih3gM
         YbnjQC7qhjLCKzlmGIhHae5vTaFoNbG9v551RKnfckI9sHmlaMKaUyWBDkeqLMMMhIys
         AANQRMh7MgPN8hleVySUyc6769/8IB9iPa7Rly7APqQO1s7PsVTQFtkMiF0JsAA3PMUP
         5GLbuNnXPw56yAKZ2PP4Emwc+9bftyoCTSEZ5pLzOkOeyqT7cuHgqQlei166qpmKvtSr
         wGMw==
X-Forwarded-Encrypted: i=1; AJvYcCUZ6fbCc2VS6IViDXLrzhJ9FgEJegk2jJQBeJU572x8yVugHolRuY/1I5gQq9Uwn4kkDtlHrLXSRGWFSxsjWWQT@lists.infradead.org
X-Gm-Message-State: AOJu0YxDqBpZ9zFwPqywt549ot4TiyxazwUQgWKVQ+KjQX6cflA8sebX
	qkDXD0sPGwkFojL41/T+dbGpZm1MBw6vvjTNsZrOD+SfRNFhoMCiV50sO6AGf69tlQlTmRTiBsK
	QotCuWg==
X-Google-Smtp-Source: AGHT+IFgeefmpSw8rD/QDhEJWJpW/uyXDjKF/GKVwsAm/kSUwRRoDjGPolLarekXC8WI3kBTDc78RyqSEq8Z
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:de26:87db:e4d0:62b6])
 (user=irogers job=sendgmr) by 2002:a0d:e701:0:b0:6dd:bb6e:ec89 with SMTP id
 00721157ae682-6f8c199baf7mr396837b3.2.1738394113130; Fri, 31 Jan 2025
 23:15:13 -0800 (PST)
Date: Fri, 31 Jan 2025 23:14:50 -0800
In-Reply-To: <20250201071455.718247-1-irogers@google.com>
Message-Id: <20250201071455.718247-3-irogers@google.com>
Mime-Version: 1.0
References: <20250201071455.718247-1-irogers@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Subject: [PATCH v1 2/7] perf trace: Reorganize syscalls
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Charlie Jenkins <charlie@rivosinc.com>, 
	Bibo Mao <maobibo@loongson.cn>, Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	"=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?=" <bjorn@rivosinc.com>, Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_231514_555081_6B76B334 
X-CRM114-Status: GOOD (  25.96  )
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

Identify struct syscall information in the syscalls table by a machine
type and syscall number, not just system call number. Having the
machine type means that 32-bit system calls can be differentiated from
64-bit ones on a machine capable of both. Having a table for all
machine types and all system call numbers would be too large, so
maintain a sorted array of system calls as they are encountered.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-trace.c | 178 +++++++++++++++++++++++++------------
 1 file changed, 119 insertions(+), 59 deletions(-)

diff --git a/tools/perf/builtin-trace.c b/tools/perf/builtin-trace.c
index ac97632f13dc..10d3ad0d21f7 100644
--- a/tools/perf/builtin-trace.c
+++ b/tools/perf/builtin-trace.c
@@ -66,6 +66,7 @@
 #include "rb_resort.h"
 #include "../perf.h"
 #include "trace_augment.h"
+#include "dwarf-regs.h"
 
 #include <errno.h>
 #include <inttypes.h>
@@ -86,6 +87,7 @@
 
 #include <linux/ctype.h>
 #include <perf/mmap.h>
+#include <tools/libc_compat.h>
 
 #ifdef HAVE_LIBTRACEEVENT
 #include <event-parse.h>
@@ -143,7 +145,10 @@ struct trace {
 	struct perf_tool	tool;
 	struct syscalltbl	*sctbl;
 	struct {
+		/** Sorted sycall numbers used by the trace. */
 		struct syscall  *table;
+		/** Size of table. */
+		size_t		table_size;
 		struct {
 			struct evsel *sys_enter,
 				*sys_exit,
@@ -1445,22 +1450,37 @@ static const struct syscall_fmt *syscall_fmt__find_by_alias(const char *alias)
 	return __syscall_fmt__find_by_alias(syscall_fmts, nmemb, alias);
 }
 
-/*
- * is_exit: is this "exit" or "exit_group"?
- * is_open: is this "open" or "openat"? To associate the fd returned in sys_exit with the pathname in sys_enter.
- * args_size: sum of the sizes of the syscall arguments, anything after that is augmented stuff: pathname for openat, etc.
- * nonexistent: Just a hole in the syscall table, syscall id not allocated
+/**
+ * struct syscall
  */
 struct syscall {
+	/** @e_machine: The ELF machine associated with the entry. */
+	int e_machine;
+	/** @id: id value from the tracepoint, the system call number. */
+	int id;
 	struct tep_event    *tp_format;
 	int		    nr_args;
+	/**
+	 * @args_size: sum of the sizes of the syscall arguments, anything
+	 * after that is augmented stuff: pathname for openat, etc.
+	 */
+
 	int		    args_size;
 	struct {
 		struct bpf_program *sys_enter,
 				   *sys_exit;
 	}		    bpf_prog;
+	/** @is_exit: is this "exit" or "exit_group"? */
 	bool		    is_exit;
+	/**
+	 * @is_open: is this "open" or "openat"? To associate the fd returned in
+	 * sys_exit with the pathname in sys_enter.
+	 */
 	bool		    is_open;
+	/**
+	 * @nonexistent: Name lookup failed. Just a hole in the syscall table,
+	 * syscall id not allocated.
+	 */
 	bool		    nonexistent;
 	bool		    use_btf;
 	struct tep_format_field *args;
@@ -2066,22 +2086,21 @@ static int syscall__set_arg_fmts(struct syscall *sc)
 	return 0;
 }
 
-static int trace__read_syscall_info(struct trace *trace, int id)
+static int syscall__read_info(struct syscall *sc, struct trace *trace)
 {
 	char tp_name[128];
-	struct syscall *sc;
-	const char *name = syscalltbl__name(trace->sctbl, id);
+	const char *name;
 	int err;
 
-	if (trace->syscalls.table == NULL) {
-		trace->syscalls.table = calloc(trace->sctbl->syscalls.max_id + 1, sizeof(*sc));
-		if (trace->syscalls.table == NULL)
-			return -ENOMEM;
-	}
-	sc = trace->syscalls.table + id;
 	if (sc->nonexistent)
 		return -EEXIST;
 
+	if (sc->name) {
+		/* Info already read. */
+		return 0;
+	}
+
+	name = syscalltbl__name(trace->sctbl, sc->id);
 	if (name == NULL) {
 		sc->nonexistent = true;
 		return -EEXIST;
@@ -2104,11 +2123,12 @@ static int trace__read_syscall_info(struct trace *trace, int id)
 	 */
 	if (IS_ERR(sc->tp_format)) {
 		sc->nonexistent = true;
-		return PTR_ERR(sc->tp_format);
+		err = PTR_ERR(sc->tp_format);
+		sc->tp_format = NULL;
+		return err;
 	}
 
-	if (syscall__alloc_arg_fmts(sc, IS_ERR(sc->tp_format) ?
-					RAW_SYSCALL_ARGS_NUM : sc->tp_format->format.nr_fields))
+	if (syscall__alloc_arg_fmts(sc, sc->tp_format->format.nr_fields))
 		return -ENOMEM;
 
 	sc->args = sc->tp_format->format.fields;
@@ -2397,13 +2417,67 @@ static size_t syscall__scnprintf_args(struct syscall *sc, char *bf, size_t size,
 	return printed;
 }
 
+static void syscall__init(struct syscall *sc, int e_machine, int id)
+{
+	memset(sc, 0, sizeof(*sc));
+	sc->e_machine = e_machine;
+	sc->id = id;
+}
+
+static void syscall__exit(struct syscall *sc)
+{
+	if (!sc)
+		return;
+
+	zfree(&sc->arg_fmt);
+}
+
+static int syscall__cmp(const void *va, const void *vb)
+{
+	const struct syscall *a = va, *b = vb;
+
+	if (a->e_machine != b->e_machine)
+		return a->e_machine - b->e_machine;
+
+	return a->id - b->id;
+}
+
+static struct syscall *trace__find_syscall(struct trace *trace, int e_machine, int id)
+{
+	struct syscall key = {
+		.e_machine = e_machine,
+		.id = id,
+	};
+	struct syscall *sc, *tmp;
+
+	sc = bsearch(&key, trace->syscalls.table, trace->syscalls.table_size,
+		     sizeof(struct syscall), syscall__cmp);
+	if (sc)
+		return sc;
+
+	tmp = reallocarray(trace->syscalls.table, trace->syscalls.table_size + 1,
+			   sizeof(struct syscall));
+	if (!tmp)
+		return NULL;
+
+	trace->syscalls.table = tmp;
+	sc = &trace->syscalls.table[trace->syscalls.table_size++];
+	syscall__init(sc, e_machine, id);
+	qsort(trace->syscalls.table, trace->syscalls.table_size, sizeof(struct syscall),
+	      syscall__cmp);
+	sc = bsearch(&key, trace->syscalls.table, trace->syscalls.table_size,
+		     sizeof(struct syscall), syscall__cmp);
+	return sc;
+}
+
 typedef int (*tracepoint_handler)(struct trace *trace, struct evsel *evsel,
 				  union perf_event *event,
 				  struct perf_sample *sample);
 
-static struct syscall *trace__syscall_info(struct trace *trace,
-					   struct evsel *evsel, int id)
+static struct syscall *trace__syscall_info(struct trace *trace, struct evsel *evsel,
+					   int e_machine, int id)
 {
+	struct syscall *sc;
 	int err = 0;
 
 	if (id < 0) {
@@ -2428,28 +2502,20 @@ static struct syscall *trace__syscall_info(struct trace *trace,
 
 	err = -EINVAL;
 
-	if (id > trace->sctbl->syscalls.max_id) {
-		goto out_cant_read;
-	}
-
-	if ((trace->syscalls.table == NULL || trace->syscalls.table[id].name == NULL) &&
-	    (err = trace__read_syscall_info(trace, id)) != 0)
-		goto out_cant_read;
+	sc = trace__find_syscall(trace, e_machine, id);
+	if (sc)
+		err = syscall__read_info(sc, trace);
 
-	if (trace->syscalls.table && trace->syscalls.table[id].nonexistent)
-		goto out_cant_read;
-
-	return &trace->syscalls.table[id];
-
-out_cant_read:
-	if (verbose > 0) {
+	if (err && verbose > 0) {
 		char sbuf[STRERR_BUFSIZE];
-		fprintf(trace->output, "Problems reading syscall %d: %d (%s)", id, -err, str_error_r(-err, sbuf, sizeof(sbuf)));
-		if (id <= trace->sctbl->syscalls.max_id && trace->syscalls.table[id].name != NULL)
-			fprintf(trace->output, "(%s)", trace->syscalls.table[id].name);
+
+		fprintf(trace->output, "Problems reading syscall %d: %d (%s)", id, -err,
+			str_error_r(-err, sbuf, sizeof(sbuf)));
+		if (sc && sc->name)
+			fprintf(trace->output, "(%s)", sc->name);
 		fputs(" information\n", trace->output);
 	}
-	return NULL;
+	return err ? NULL : sc;
 }
 
 struct syscall_stats {
@@ -2596,14 +2662,6 @@ static void *syscall__augmented_args(struct syscall *sc, struct perf_sample *sam
 	return NULL;
 }
 
-static void syscall__exit(struct syscall *sc)
-{
-	if (!sc)
-		return;
-
-	zfree(&sc->arg_fmt);
-}
-
 static int trace__sys_enter(struct trace *trace, struct evsel *evsel,
 			    union perf_event *event __maybe_unused,
 			    struct perf_sample *sample)
@@ -2615,7 +2673,7 @@ static int trace__sys_enter(struct trace *trace, struct evsel *evsel,
 	int id = perf_evsel__sc_tp_uint(evsel, id, sample), err = -1;
 	int augmented_args_size = 0;
 	void *augmented_args = NULL;
-	struct syscall *sc = trace__syscall_info(trace, evsel, id);
+	struct syscall *sc = trace__syscall_info(trace, evsel, EM_HOST, id);
 	struct thread_trace *ttrace;
 
 	if (sc == NULL)
@@ -2689,7 +2747,7 @@ static int trace__fprintf_sys_enter(struct trace *trace, struct evsel *evsel,
 	struct thread_trace *ttrace;
 	struct thread *thread;
 	int id = perf_evsel__sc_tp_uint(evsel, id, sample), err = -1;
-	struct syscall *sc = trace__syscall_info(trace, evsel, id);
+	struct syscall *sc = trace__syscall_info(trace, evsel, EM_HOST, id);
 	char msg[1024];
 	void *args, *augmented_args = NULL;
 	int augmented_args_size;
@@ -2764,7 +2822,7 @@ static int trace__sys_exit(struct trace *trace, struct evsel *evsel,
 	struct thread *thread;
 	int id = perf_evsel__sc_tp_uint(evsel, id, sample), err = -1, callchain_ret = 0, printed = 0;
 	int alignment = trace->args_alignment;
-	struct syscall *sc = trace__syscall_info(trace, evsel, id);
+	struct syscall *sc = trace__syscall_info(trace, evsel, EM_HOST, id);
 	struct thread_trace *ttrace;
 
 	if (sc == NULL)
@@ -3117,7 +3175,7 @@ static int trace__event_handler(struct trace *trace, struct evsel *evsel,
 
 	if (evsel == trace->syscalls.events.bpf_output) {
 		int id = perf_evsel__sc_tp_uint(evsel, id, sample);
-		struct syscall *sc = trace__syscall_info(trace, evsel, id);
+		struct syscall *sc = trace__syscall_info(trace, evsel, EM_HOST, id);
 
 		if (sc) {
 			fprintf(trace->output, "%s(", sc->name);
@@ -3622,7 +3680,7 @@ static struct bpf_program *trace__find_syscall_bpf_prog(struct trace *trace, str
 
 static void trace__init_syscall_bpf_progs(struct trace *trace, int id)
 {
-	struct syscall *sc = trace__syscall_info(trace, NULL, id);
+	struct syscall *sc = trace__syscall_info(trace, NULL, EM_HOST, id);
 
 	if (sc == NULL)
 		return;
@@ -3633,20 +3691,20 @@ static void trace__init_syscall_bpf_progs(struct trace *trace, int id)
 
 static int trace__bpf_prog_sys_enter_fd(struct trace *trace, int id)
 {
-	struct syscall *sc = trace__syscall_info(trace, NULL, id);
+	struct syscall *sc = trace__syscall_info(trace, NULL, EM_HOST, id);
 	return sc ? bpf_program__fd(sc->bpf_prog.sys_enter) : bpf_program__fd(trace->skel->progs.syscall_unaugmented);
 }
 
 static int trace__bpf_prog_sys_exit_fd(struct trace *trace, int id)
 {
-	struct syscall *sc = trace__syscall_info(trace, NULL, id);
+	struct syscall *sc = trace__syscall_info(trace, NULL, EM_HOST, id);
 	return sc ? bpf_program__fd(sc->bpf_prog.sys_exit) : bpf_program__fd(trace->skel->progs.syscall_unaugmented);
 }
 
 static int trace__bpf_sys_enter_beauty_map(struct trace *trace, int key, unsigned int *beauty_array)
 {
 	struct tep_format_field *field;
-	struct syscall *sc = trace__syscall_info(trace, NULL, key);
+	struct syscall *sc = trace__syscall_info(trace, NULL, EM_HOST, key);
 	const struct btf_type *bt;
 	char *struct_offset, *tmp, name[32];
 	bool can_augment = false;
@@ -3744,7 +3802,7 @@ static struct bpf_program *trace__find_usable_bpf_prog_entry(struct trace *trace
 try_to_find_pair:
 	for (int i = 0; i < trace->sctbl->syscalls.nr_entries; ++i) {
 		int id = syscalltbl__id_at_idx(trace->sctbl, i);
-		struct syscall *pair = trace__syscall_info(trace, NULL, id);
+		struct syscall *pair = trace__syscall_info(trace, NULL, EM_HOST, id);
 		struct bpf_program *pair_prog;
 		bool is_candidate = false;
 
@@ -3894,7 +3952,7 @@ static int trace__init_syscalls_bpf_prog_array_maps(struct trace *trace)
 	 */
 	for (int i = 0; i < trace->sctbl->syscalls.nr_entries; ++i) {
 		int key = syscalltbl__id_at_idx(trace->sctbl, i);
-		struct syscall *sc = trace__syscall_info(trace, NULL, key);
+		struct syscall *sc = trace__syscall_info(trace, NULL, EM_HOST, key);
 		struct bpf_program *pair_prog;
 		int prog_fd;
 
@@ -4659,7 +4717,11 @@ static size_t thread__dump_stats(struct thread_trace *ttrace,
 			pct = avg ? 100.0 * stddev_stats(&stats->stats) / avg : 0.0;
 			avg /= NSEC_PER_MSEC;
 
-			sc = &trace->syscalls.table[syscall_stats_entry->syscall];
+			sc = trace__syscall_info(trace, /*evsel=*/NULL, EM_HOST,
+						 syscall_stats_entry->syscall);
+			if (!sc)
+				continue;
+
 			printed += fprintf(fp, "   %-15s", sc->name);
 			printed += fprintf(fp, " %8" PRIu64 " %6" PRIu64 " %9.3f %9.3f %9.3f",
 					   n, stats->nr_failures, syscall_stats_entry->msecs, min, avg);
@@ -5067,12 +5129,10 @@ static int trace__config(const char *var, const char *value, void *arg)
 
 static void trace__exit(struct trace *trace)
 {
-	int i;
-
 	strlist__delete(trace->ev_qualifier);
 	zfree(&trace->ev_qualifier_ids.entries);
 	if (trace->syscalls.table) {
-		for (i = 0; i <= trace->sctbl->syscalls.max_id; i++)
+		for (size_t i = 0; i < trace->syscalls.table_size; i++)
 			syscall__exit(&trace->syscalls.table[i]);
 		zfree(&trace->syscalls.table);
 	}
-- 
2.48.1.362.g079036d154-goog


