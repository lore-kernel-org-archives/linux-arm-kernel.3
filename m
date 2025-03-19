Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81BD9C35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 05:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:References:Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L7xBPeAI1ZGK/na4YhBc+S5M0v2o7F6+AZ1yRtBTaOg=; b=XF9/vVW877Nfewe1mqygtUqXR6
	pHXJ8VHjeq49zSIJA3jvvIeoEXWVukQC+xSnB5fEiEjY48EMSU8DMSa9PS1/rdFzlA5Eg8SMpO0gI
	oCiv2SXcCpY632zAMrSrBT0Iv1z5UgsUE/+r2fddEYTiAEMSSJMfbGQIf8sNs5xORgXNNQtI9nXpN
	xwFI02NBkNLfD+NpbvzFTX2CCPlNQSdvX0sE9m7iJDflOqXSI5/QjAzKgRWzMRlWvAkTopsBpXpf6
	2JOJgqLEaE0sFa3yAHs+uFGekOAa7ZfEmnh50pl9/iHflyJCqhg3ArO/Uw4j9B9IEtnOJm7p4/nTa
	YyIfcohw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tum0Y-000000083uP-0c4u;
	Wed, 19 Mar 2025 05:30:26 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tulf5-000000080vH-0SNX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 05:08:20 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6fd010df0f4so101122247b3.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 22:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742360894; x=1742965694; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L7xBPeAI1ZGK/na4YhBc+S5M0v2o7F6+AZ1yRtBTaOg=;
        b=Hkm/aZK19qspDVCizqXS02qtTnEkyHs4dMQRSt67XqspNC+65BrxJuv+FBFcpkwm22
         AwMJAq1xFW2yeZJOkjo9f4l22pB0Bk4Z6lrJi/W+Jc3lioXzRXLr/y6/gWOhdvyXZa4z
         bN6079pJxlEi+ckQcgr034y682AT+J3bxJZ3hMc3zCeHMm7Iw6LWulewGebJtM8qbDwK
         /Yw+bQ5D7OXy52O2kU7VG1KSn2sr8BTXSUu2TRUbLBF8jiccN/UbqD7Dv4yOzmSN7evP
         3vyQy4tBfj/Z6RrTO0HgVnqKfkjx9peEuc/8hcsmwQIRN0oZKTDIwxk9XMjcSSwQFYxO
         OXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742360894; x=1742965694;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L7xBPeAI1ZGK/na4YhBc+S5M0v2o7F6+AZ1yRtBTaOg=;
        b=caBk+9wBNcOYY7ISWHBtk7SRKh3MO/OHQ23Iv7IS00K76028YEhxeaBn3xnb1ca1wc
         avlvhuX9EWrqzykskBCtVMW58tojjPmTYvWFbOnhHmwEjUKi+4selGoPZOYVxBOs94ro
         juZYYUHmD+4gBXxhcRmNIUZbT8jOCLKHHjwO+mBN3Vm///+vPZUMPifz+2M4s3f+poDy
         2PmaSsgUh61Tb2gZJwUtedlY4Zwp0kyPtkQqcrmhvBkCI9FDY45TFxm+I2zVkT9y80Z4
         imrp5RODwZbttl1a2B5u5KeCNWlBNG/dnD6kWGti8D85siLbs6TgG4Pwv/nVSerfvnBW
         tzzA==
X-Forwarded-Encrypted: i=1; AJvYcCWmRihtYHCnn6H9ytZGUHXFDex8ecDp5iJNhLBl0b9gZihKLeDgbUnyLzrjs+oVCIZ7D9HkrCwZa4ZKTO5KW2gY@lists.infradead.org
X-Gm-Message-State: AOJu0YxYcC0uUfalss0ShvnoUFKDAo3BqgaMMwbC/JMvQShpI8Z+YK+U
	5nkpPfuv33uX9pD/QWvgTzJ1fmy0WzebCWRsZGnvLsxyfoYejV0egg7Sikm7ChD2vRkOa/lAIVU
	Xbit1Ig==
X-Google-Smtp-Source: AGHT+IED/ZLlykbehWpsCbnxI7/VEXCzdceMElPMiVtqa8xKpgrgI1AFRxFexUYRexGCPPRyPnT6SSPwC/n+
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:8a11:10b5:af90:6031])
 (user=irogers job=sendgmr) by 2002:a05:6902:1824:b0:e5b:33c4:7279 with SMTP
 id 3f1490d57ef6-e667b432965mr506276.4.1742360893839; Tue, 18 Mar 2025
 22:08:13 -0700 (PDT)
Date: Tue, 18 Mar 2025 22:07:39 -0700
In-Reply-To: <20250319050741.269828-1-irogers@google.com>
Message-Id: <20250319050741.269828-13-irogers@google.com>
Mime-Version: 1.0
References: <20250319050741.269828-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Subject: [PATCH v7 12/14] perf trace: Make syscall table stable
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
X-CRM114-CacheID: sfid-20250318_220815_141991_7D0FE3FB 
X-CRM114-Status: GOOD (  21.90  )
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


