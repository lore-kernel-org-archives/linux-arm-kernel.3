Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA10BE7C6E0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 20:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EJGw1P1OvUFdmQODbC64bcyHD5Xw5EoFZDxVopOgqFI=; b=PK5h9llJ913nhfZCRMr98WWnTt
	BM8J57tMe8KKrYNF0AUnZk8Hh8+rKi9GImv8/CTi8i5vcF9RtdzLM4J/7Z+6keCOtoNzJxhYbHD0/
	2jjlP2I4blW7uvmmAozxkWoNVyv8nP0PGo0DcePbu/Pp1Bbg4inkZTXuzhCONEIfCCEnoestPzzch
	/WdW/Dte9l3ojPSQQ8t60HXXqAPaV41n7uzJBFWutExzYtSqfppgzij/ukk8Pws7NXIAajaF3F9bE
	iCCTiDK7BUOnOMFrElQ+dz1uYRqzhICITvPoFwFNSio2vaBFYoFD6Pe47PGmxUsdQPkiX3yI0Qv/M
	gsv8qWvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmHBE-00000002wdC-1Lbd;
	Sat, 31 Jan 2026 20:02:52 +0000
Received: from mail-dl1-x1249.google.com ([2607:f8b0:4864:20::1249])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmHAy-00000002wTK-1jdX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 20:02:38 +0000
Received: by mail-dl1-x1249.google.com with SMTP id a92af1059eb24-124a5098029so976687c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 12:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769889755; x=1770494555; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EJGw1P1OvUFdmQODbC64bcyHD5Xw5EoFZDxVopOgqFI=;
        b=F6ianH7sYRqTAiYV3hUTSyZpc5H6rntDeT0M8KaAJkaV24hQAMpv8xhVzIXPk8cab7
         X35hxVJlMYcj5taERbyeK15M6coLfHKkNHSaCdnf3qMlRpI6FsCcSx9AdW2aV770z2fT
         YmEEzqZ7t8ykHmfvxjU/LRjWjx7k1WX5cSycwlOrVlqqWvqDP3yfnYlaRBICu6ZcMBeL
         M9P0eD0vUSFpVp5AbxfWWTmQK64JwH8qHPJVGhB/GfnF2dgLIPdV2tHhTP3tve7PyahL
         C3sble2CTRPpVpsnyH/xDnkaJvtfSLO38s/77MIqpMpZ79SAh+lNPUfCft81fzz9hXZN
         ezKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769889755; x=1770494555;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EJGw1P1OvUFdmQODbC64bcyHD5Xw5EoFZDxVopOgqFI=;
        b=JmyAPZbegiNWj+C9ks6XJwrfbHTu5Ik2bz5yFpF4hAarbqrQ6d/vmw9Xjo4rHHJXes
         KgUEvqekU64pkqP/8yZrQ6Z2v1Y14fpJGpk8An1fpUYJ+Jk1bs5h38NceDvd1DLTcX9V
         dHGkwXao/LtnAGVcdxlp9Ed2xrGAQ5pnD27WOWPV3B0XHmrRzdjXF8X0DxwYnXDRF0Qn
         g5zSsY8McjxbZU+d7xBz34e4HKXgYUCiHeopBMi6QLIKqgRzzQYQfVtq0Rxq0u+Ftf6B
         ycHbEyyzfgEU1xysc/ilfieeFjvpvv0xkDmm6QjIVuPUpfjFyuxN2HHobKcYNgM7ites
         MfkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHaZNuNDbQIdgsyfnj7I5RCbI5cve6H7AcxnD9J9LZORE+IckWw/kY/AbYuRWxACh7DyDOPDmwXkuLXs/t9pPX@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx3Khb1mJN87DzJK2/YI+HDi973w3e9E15g1SkKFuUDSg3k3YA
	Wtq4Vwe44Oz3z2KYf5KFDZfb5fwBP10BMB5SFDK49n+xWKxUuR+FAmjP4yu5e3rJwybvab3F2FR
	Arbu6lnhkOA==
X-Received: from dlbqc9.prod.google.com ([2002:a05:7023:a89:b0:120:56a0:1dd9])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:438a:b0:119:e569:f274
 with SMTP id a92af1059eb24-125c1021a87mr2986854c88.29.1769889754794; Sat, 31
 Jan 2026 12:02:34 -0800 (PST)
Date: Sat, 31 Jan 2026 12:02:21 -0800
In-Reply-To: <20260131200224.1296136-1-irogers@google.com>
Mime-Version: 1.0
References: <20260131200224.1296136-1-irogers@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <20260131200224.1296136-4-irogers@google.com>
Subject: [PATCH v2 3/6] perf kvm: Wire up e_machine
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Shimin Guo <shimin.guo@skydio.com>, Yunseong Kim <ysk@kzalloc.com>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Quan Zhou <zhouquan@iscas.ac.cn>, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Blake Jones <blakejones@google.com>, Swapnil Sapkal <swapnil.sapkal@amd.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Howard Chu <howardchu95@gmail.com>, 
	Anubhav Shelat <ashelat@redhat.com>, Aditya Bodkhe <aditya.b1@linux.ibm.com>, 
	Chun-Tse Shao <ctshao@google.com>, Andi Kleen <ak@linux.intel.com>, 
	Dmitry Vyukov <dvyukov@google.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_120236_530765_7808FDDC 
X-CRM114-Status: GOOD (  24.77  )
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

Pass the e_machine to the kvm functions so that they aren't just wired
to EM_HOST. In the case of a session move some setup until the session
is created. As the session isn't fully running the default EM_HOST is
returned as no e_machine can be found in a running machine. This is,
however, some marginal progress to cross platform support.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-kvm.c                      | 45 ++++++++------
 tools/perf/util/evsel.c                       |  2 +-
 tools/perf/util/evsel.h                       |  1 +
 .../perf/util/kvm-stat-arch/kvm-stat-arm64.c  |  6 +-
 .../util/kvm-stat-arch/kvm-stat-loongarch.c   |  2 +-
 .../perf/util/kvm-stat-arch/kvm-stat-riscv.c  |  6 +-
 tools/perf/util/kvm-stat.c                    | 62 +++++++++----------
 tools/perf/util/kvm-stat.h                    | 20 +++---
 8 files changed, 77 insertions(+), 67 deletions(-)

diff --git a/tools/perf/builtin-kvm.c b/tools/perf/builtin-kvm.c
index bd9bda32157f..93ba07c58290 100644
--- a/tools/perf/builtin-kvm.c
+++ b/tools/perf/builtin-kvm.c
@@ -2,6 +2,7 @@
 #include "builtin.h"
 #include "perf.h"
 
+#include <dwarf-regs.h>
 #include "util/build-id.h"
 #include "util/evsel.h"
 #include "util/evlist.h"
@@ -615,11 +616,11 @@ static const char *get_filename_for_perf_kvm(void)
 
 #if defined(HAVE_LIBTRACEEVENT)
 
-static bool register_kvm_events_ops(struct perf_kvm_stat *kvm)
+static bool register_kvm_events_ops(struct perf_kvm_stat *kvm, uint16_t e_machine)
 {
 	const struct kvm_reg_events_ops *events_ops;
 
-	for (events_ops = kvm_reg_events_ops(); events_ops->name; events_ops++) {
+	for (events_ops = kvm_reg_events_ops(e_machine); events_ops->name; events_ops++) {
 		if (!strcmp(events_ops->name, kvm->report_event)) {
 			kvm->events_ops = events_ops->ops;
 			return true;
@@ -841,11 +842,11 @@ static bool handle_child_event(struct perf_kvm_stat *kvm,
 	return true;
 }
 
-static bool skip_event(const char *event)
+static bool skip_event(uint16_t e_machine, const char *event)
 {
 	const char * const *skip_events;
 
-	for (skip_events = kvm_skip_events(); *skip_events; skip_events++)
+	for (skip_events = kvm_skip_events(e_machine); *skip_events; skip_events++)
 		if (!strcmp(event, *skip_events))
 			return true;
 
@@ -901,9 +902,10 @@ static bool handle_end_event(struct perf_kvm_stat *kvm,
 
 	if (kvm->duration && time_diff > kvm->duration) {
 		char decode[KVM_EVENT_NAME_LEN];
+		uint16_t e_machine = perf_session__e_machine(kvm->session);
 
 		kvm->events_ops->decode_key(kvm, &event->key, decode);
-		if (!skip_event(decode)) {
+		if (!skip_event(e_machine, decode)) {
 			pr_info("%" PRIu64 " VM %d, vcpu %d: %s event took %" PRIu64 "usec\n",
 				 sample->time, sample->pid, vcpu_record->vcpu_id,
 				 decode, time_diff / NSEC_PER_USEC);
@@ -921,6 +923,8 @@ struct vcpu_event_record *per_vcpu_record(struct thread *thread,
 	/* Only kvm_entry records vcpu id. */
 	if (!thread__priv(thread) && kvm_entry_event(evsel)) {
 		struct vcpu_event_record *vcpu_record;
+		struct machine *machine = maps__machine(thread__maps(thread));
+		uint16_t e_machine = thread__e_machine(thread, machine, /*e_flags=*/NULL);
 
 		vcpu_record = zalloc(sizeof(*vcpu_record));
 		if (!vcpu_record) {
@@ -928,7 +932,7 @@ struct vcpu_event_record *per_vcpu_record(struct thread *thread,
 			return NULL;
 		}
 
-		vcpu_record->vcpu_id = evsel__intval(evsel, sample, vcpu_id_str());
+		vcpu_record->vcpu_id = evsel__intval(evsel, sample, vcpu_id_str(e_machine));
 		thread__set_priv(thread, vcpu_record);
 	}
 
@@ -1163,6 +1167,7 @@ static int cpu_isa_config(struct perf_kvm_stat *kvm)
 {
 	char buf[128], *cpuid;
 	int err;
+	uint16_t e_machine;
 
 	if (kvm->live) {
 		struct perf_cpu cpu = {-1};
@@ -1182,7 +1187,8 @@ static int cpu_isa_config(struct perf_kvm_stat *kvm)
 		return -EINVAL;
 	}
 
-	err = cpu_isa_init(kvm, cpuid);
+	e_machine = perf_session__e_machine(kvm->session);
+	err = cpu_isa_init(kvm, e_machine, cpuid);
 	if (err == -ENOTSUP)
 		pr_err("CPU %s is not supported.\n", cpuid);
 
@@ -1413,7 +1419,7 @@ static int kvm_events_live_report(struct perf_kvm_stat *kvm)
 
 	if (!verify_vcpu(kvm->trace_vcpu) ||
 	    !is_valid_key(kvm) ||
-	    !register_kvm_events_ops(kvm)) {
+		!register_kvm_events_ops(kvm, EM_HOST)) {
 		goto out;
 	}
 
@@ -1568,6 +1574,11 @@ static int read_events(struct perf_kvm_stat *kvm)
 		goto out_delete;
 	}
 
+	if (!register_kvm_events_ops(kvm, perf_session__e_machine(kvm->session))) {
+		ret = -EINVAL;
+		goto out_delete;
+	}
+
 	/*
 	 * Do not use 'isa' recorded in kvm_exit tracepoint since it is not
 	 * traced in the old kernel.
@@ -1610,9 +1621,6 @@ static int kvm_events_report_vcpu(struct perf_kvm_stat *kvm)
 	if (!is_valid_key(kvm))
 		goto exit;
 
-	if (!register_kvm_events_ops(kvm))
-		goto exit;
-
 	if (kvm->use_stdio) {
 		use_browser = 0;
 		setup_pager();
@@ -1653,15 +1661,16 @@ kvm_events_record(struct perf_kvm_stat *kvm, int argc, const char **argv)
 	};
 	const char * const *events_tp;
 	int ret;
+	uint16_t e_machine = EM_HOST;
 
 	events_tp_size = 0;
-	ret = setup_kvm_events_tp(kvm);
+	ret = setup_kvm_events_tp(kvm, e_machine);
 	if (ret < 0) {
 		pr_err("Unable to setup the kvm tracepoints\n");
 		return ret;
 	}
 
-	for (events_tp = kvm_events_tp(); *events_tp; events_tp++)
+	for (events_tp = kvm_events_tp(e_machine); *events_tp; events_tp++)
 		events_tp_size++;
 
 	rec_argc = ARRAY_SIZE(record_args) + argc + 2 +
@@ -1676,7 +1685,7 @@ kvm_events_record(struct perf_kvm_stat *kvm, int argc, const char **argv)
 
 	for (j = 0; j < events_tp_size; j++) {
 		rec_argv[i++] = STRDUP_FAIL_EXIT("-e");
-		rec_argv[i++] = STRDUP_FAIL_EXIT(kvm_events_tp()[j]);
+		rec_argv[i++] = STRDUP_FAIL_EXIT(kvm_events_tp(e_machine)[j]);
 	}
 
 	rec_argv[i++] = STRDUP_FAIL_EXIT("-o");
@@ -1770,7 +1779,7 @@ static struct evlist *kvm_live_event_list(void)
 	if (evlist == NULL)
 		return NULL;
 
-	for (events_tp = kvm_events_tp(); *events_tp; events_tp++) {
+	for (events_tp = kvm_events_tp(EM_HOST); *events_tp; events_tp++) {
 
 		tp = strdup(*events_tp);
 		if (tp == NULL)
@@ -1895,7 +1904,7 @@ static int kvm_events_live(struct perf_kvm_stat *kvm,
 	/*
 	 * generate the event list
 	 */
-	err = setup_kvm_events_tp(kvm);
+	err = setup_kvm_events_tp(kvm, EM_HOST);
 	if (err < 0) {
 		pr_err("Unable to setup the kvm tracepoints\n");
 		return err;
@@ -2005,7 +2014,7 @@ static int __cmd_record(const char *file_name, int argc, const char **argv)
 
 	BUG_ON(i + 2 != rec_argc);
 
-	ret = kvm_add_default_arch_event(&i, rec_argv);
+	ret = kvm_add_default_arch_event(EM_HOST, &i, rec_argv);
 	if (ret)
 		goto EXIT;
 
@@ -2092,7 +2101,7 @@ static int __cmd_top(int argc, const char **argv)
 
 	BUG_ON(i != argc);
 
-	ret = kvm_add_default_arch_event(&i, rec_argv);
+	ret = kvm_add_default_arch_event(EM_HOST, &i, rec_argv);
 	if (ret)
 		goto EXIT;
 
diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
index 5ac1a05601b1..848d0faf6698 100644
--- a/tools/perf/util/evsel.c
+++ b/tools/perf/util/evsel.c
@@ -1008,7 +1008,7 @@ int evsel__group_desc(struct evsel *evsel, char *buf, size_t size)
 	return ret;
 }
 
-static uint16_t evsel__e_machine(struct evsel *evsel)
+uint16_t evsel__e_machine(struct evsel *evsel)
 {
 	struct perf_session *session = evsel__session(evsel);
 
diff --git a/tools/perf/util/evsel.h b/tools/perf/util/evsel.h
index 95c4bd0f0f2e..eefb5d569971 100644
--- a/tools/perf/util/evsel.h
+++ b/tools/perf/util/evsel.h
@@ -546,6 +546,7 @@ static inline bool evsel__is_dummy_event(struct evsel *evsel)
 
 struct perf_session *evsel__session(struct evsel *evsel);
 struct perf_env *evsel__env(struct evsel *evsel);
+uint16_t evsel__e_machine(struct evsel *evsel);
 
 int evsel__store_ids(struct evsel *evsel, struct evlist *evlist);
 
diff --git a/tools/perf/util/kvm-stat-arch/kvm-stat-arm64.c b/tools/perf/util/kvm-stat-arch/kvm-stat-arm64.c
index 8003ff415b1a..c640dcd8af7c 100644
--- a/tools/perf/util/kvm-stat-arch/kvm-stat-arm64.c
+++ b/tools/perf/util/kvm-stat-arch/kvm-stat-arm64.c
@@ -22,7 +22,7 @@ static void event_get_key(struct evsel *evsel,
 			  struct event_key *key)
 {
 	key->info = 0;
-	key->key = evsel__intval(evsel, sample, kvm_exit_reason());
+	key->key = evsel__intval(evsel, sample, kvm_exit_reason(EM_AARCH64));
 	key->exit_reasons = arm64_exit_reasons;
 
 	/*
@@ -40,14 +40,14 @@ static bool event_begin(struct evsel *evsel,
 			struct perf_sample *sample __maybe_unused,
 			struct event_key *key __maybe_unused)
 {
-	return evsel__name_is(evsel, kvm_entry_trace());
+	return evsel__name_is(evsel, kvm_entry_trace(EM_AARCH64));
 }
 
 static bool event_end(struct evsel *evsel,
 		      struct perf_sample *sample,
 		      struct event_key *key)
 {
-	if (evsel__name_is(evsel, kvm_exit_trace())) {
+	if (evsel__name_is(evsel, kvm_exit_trace(EM_AARCH64))) {
 		event_get_key(evsel, sample, key);
 		return true;
 	}
diff --git a/tools/perf/util/kvm-stat-arch/kvm-stat-loongarch.c b/tools/perf/util/kvm-stat-arch/kvm-stat-loongarch.c
index a15ce072ac34..66c07e3ca40f 100644
--- a/tools/perf/util/kvm-stat-arch/kvm-stat-loongarch.c
+++ b/tools/perf/util/kvm-stat-arch/kvm-stat-loongarch.c
@@ -70,7 +70,7 @@ static bool event_end(struct evsel *evsel,
 	 *   kvm:kvm_enter   means returning to vmm and then to guest
 	 *   kvm:kvm_reenter means returning to guest immediately
 	 */
-	return evsel__name_is(evsel, kvm_entry_trace()) ||
+	return evsel__name_is(evsel, kvm_entry_trace(EM_LOONGARCH)) ||
 	       evsel__name_is(evsel, kvm_reenter_trace);
 }
 
diff --git a/tools/perf/util/kvm-stat-arch/kvm-stat-riscv.c b/tools/perf/util/kvm-stat-arch/kvm-stat-riscv.c
index b2c5d3220795..8d4d5d6ce720 100644
--- a/tools/perf/util/kvm-stat-arch/kvm-stat-riscv.c
+++ b/tools/perf/util/kvm-stat-arch/kvm-stat-riscv.c
@@ -27,7 +27,7 @@ static void event_get_key(struct evsel *evsel,
 	int xlen = 64; // TODO: 32-bit support.
 
 	key->info = 0;
-	key->key = evsel__intval(evsel, sample, kvm_exit_reason()) & ~CAUSE_IRQ_FLAG(xlen);
+	key->key = evsel__intval(evsel, sample, kvm_exit_reason(EM_RISCV)) & ~CAUSE_IRQ_FLAG(xlen);
 	key->exit_reasons = riscv_exit_reasons;
 }
 
@@ -35,14 +35,14 @@ static bool event_begin(struct evsel *evsel,
 			struct perf_sample *sample __maybe_unused,
 			struct event_key *key __maybe_unused)
 {
-	return evsel__name_is(evsel, kvm_entry_trace());
+	return evsel__name_is(evsel, kvm_entry_trace(EM_RISCV));
 }
 
 static bool event_end(struct evsel *evsel,
 		      struct perf_sample *sample,
 		      struct event_key *key)
 {
-	if (evsel__name_is(evsel, kvm_exit_trace())) {
+	if (evsel__name_is(evsel, kvm_exit_trace(EM_RISCV))) {
 		event_get_key(evsel, sample, key);
 		return true;
 	}
diff --git a/tools/perf/util/kvm-stat.c b/tools/perf/util/kvm-stat.c
index b1affd97917b..858b5dbd39f6 100644
--- a/tools/perf/util/kvm-stat.c
+++ b/tools/perf/util/kvm-stat.c
@@ -6,7 +6,7 @@
 
 bool kvm_exit_event(struct evsel *evsel)
 {
-	return evsel__name_is(evsel, kvm_exit_trace());
+	return evsel__name_is(evsel, kvm_exit_trace(evsel__e_machine(evsel)));
 }
 
 void exit_event_get_key(struct evsel *evsel,
@@ -14,7 +14,7 @@ void exit_event_get_key(struct evsel *evsel,
 			struct event_key *key)
 {
 	key->info = 0;
-	key->key  = evsel__intval(evsel, sample, kvm_exit_reason());
+	key->key  = evsel__intval(evsel, sample, kvm_exit_reason(evsel__e_machine(evsel)));
 }
 
 
@@ -31,7 +31,7 @@ bool exit_event_begin(struct evsel *evsel,
 
 bool kvm_entry_event(struct evsel *evsel)
 {
-	return evsel__name_is(evsel, kvm_entry_trace());
+	return evsel__name_is(evsel, kvm_entry_trace(evsel__e_machine(evsel)));
 }
 
 bool exit_event_end(struct evsel *evsel,
@@ -66,9 +66,9 @@ void exit_event_decode_key(struct perf_kvm_stat *kvm,
 	scnprintf(decode, KVM_EVENT_NAME_LEN, "%s", exit_reason);
 }
 
-int setup_kvm_events_tp(struct perf_kvm_stat *kvm)
+int setup_kvm_events_tp(struct perf_kvm_stat *kvm, uint16_t e_machine)
 {
-	switch (EM_HOST) {
+	switch (e_machine) {
 	case EM_PPC:
 	case EM_PPC64:
 		return __setup_kvm_events_tp_powerpc(kvm);
@@ -77,9 +77,9 @@ int setup_kvm_events_tp(struct perf_kvm_stat *kvm)
 	}
 }
 
-int cpu_isa_init(struct perf_kvm_stat *kvm, const char *cpuid)
+int cpu_isa_init(struct perf_kvm_stat *kvm, uint16_t e_machine, const char *cpuid)
 {
-	switch (EM_HOST) {
+	switch (e_machine) {
 	case EM_AARCH64:
 		return __cpu_isa_init_arm64(kvm);
 	case EM_LOONGARCH:
@@ -95,14 +95,14 @@ int cpu_isa_init(struct perf_kvm_stat *kvm, const char *cpuid)
 	case EM_386:
 		return __cpu_isa_init_x86(kvm, cpuid);
 	default:
-		pr_err("Unsupported kvm-stat host %d\n", EM_HOST);
+		pr_err("Unsupported kvm-stat host %d\n", e_machine);
 		return -1;
 	}
 }
 
-const char *vcpu_id_str(void)
+const char *vcpu_id_str(uint16_t e_machine)
 {
-	switch (EM_HOST) {
+	switch (e_machine) {
 	case EM_AARCH64:
 	case EM_RISCV:
 	case EM_S390:
@@ -114,14 +114,14 @@ const char *vcpu_id_str(void)
 	case EM_386:
 		return "vcpu_id";
 	default:
-		pr_err("Unsupported kvm-stat host %d\n", EM_HOST);
+		pr_err("Unsupported kvm-stat host %d\n", e_machine);
 		return NULL;
 	}
 }
 
-const char *kvm_exit_reason(void)
+const char *kvm_exit_reason(uint16_t e_machine)
 {
-	switch (EM_HOST) {
+	switch (e_machine) {
 	case EM_AARCH64:
 		return "ret";
 	case EM_LOONGARCH:
@@ -137,14 +137,14 @@ const char *kvm_exit_reason(void)
 	case EM_386:
 		return "exit_reason";
 	default:
-		pr_err("Unsupported kvm-stat host %d\n", EM_HOST);
+		pr_err("Unsupported kvm-stat host %d\n", e_machine);
 		return NULL;
 	}
 }
 
-const char *kvm_entry_trace(void)
+const char *kvm_entry_trace(uint16_t e_machine)
 {
-	switch (EM_HOST) {
+	switch (e_machine) {
 	case EM_AARCH64:
 	case EM_RISCV:
 	case EM_X86_64:
@@ -158,14 +158,14 @@ const char *kvm_entry_trace(void)
 	case EM_S390:
 		return "kvm:kvm_s390_sie_enter";
 	default:
-		pr_err("Unsupported kvm-stat host %d\n", EM_HOST);
+		pr_err("Unsupported kvm-stat host %d\n", e_machine);
 		return NULL;
 	}
 }
 
-const char *kvm_exit_trace(void)
+const char *kvm_exit_trace(uint16_t e_machine)
 {
-	switch (EM_HOST) {
+	switch (e_machine) {
 	case EM_AARCH64:
 	case EM_LOONGARCH:
 	case EM_RISCV:
@@ -178,14 +178,14 @@ const char *kvm_exit_trace(void)
 	case EM_S390:
 		return "kvm:kvm_s390_sie_exit";
 	default:
-		pr_err("Unsupported kvm-stat host %d\n", EM_HOST);
+		pr_err("Unsupported kvm-stat host %d\n", e_machine);
 		return NULL;
 	}
 }
 
-const char * const *kvm_events_tp(void)
+const char * const *kvm_events_tp(uint16_t e_machine)
 {
-	switch (EM_HOST) {
+	switch (e_machine) {
 	case EM_AARCH64:
 		return __kvm_events_tp_arm64();
 	case EM_LOONGARCH:
@@ -201,14 +201,14 @@ const char * const *kvm_events_tp(void)
 	case EM_386:
 		return __kvm_events_tp_x86();
 	default:
-		pr_err("Unsupported kvm-stat host %d\n", EM_HOST);
+		pr_err("Unsupported kvm-stat host %d\n", e_machine);
 		return NULL;
 	}
 }
 
-const struct kvm_reg_events_ops *kvm_reg_events_ops(void)
+const struct kvm_reg_events_ops *kvm_reg_events_ops(uint16_t e_machine)
 {
-	switch (EM_HOST) {
+	switch (e_machine) {
 	case EM_AARCH64:
 		return __kvm_reg_events_ops_arm64();
 	case EM_LOONGARCH:
@@ -224,14 +224,14 @@ const struct kvm_reg_events_ops *kvm_reg_events_ops(void)
 	case EM_386:
 		return __kvm_reg_events_ops_x86();
 	default:
-		pr_err("Unsupported kvm-stat host %d\n", EM_HOST);
+		pr_err("Unsupported kvm-stat host %d\n", e_machine);
 		return NULL;
 	}
 }
 
-const char * const *kvm_skip_events(void)
+const char * const *kvm_skip_events(uint16_t e_machine)
 {
-	switch (EM_HOST) {
+	switch (e_machine) {
 	case EM_AARCH64:
 		return __kvm_skip_events_arm64();
 	case EM_LOONGARCH:
@@ -247,14 +247,14 @@ const char * const *kvm_skip_events(void)
 	case EM_386:
 		return __kvm_skip_events_x86();
 	default:
-		pr_err("Unsupported kvm-stat host %d\n", EM_HOST);
+		pr_err("Unsupported kvm-stat host %d\n", e_machine);
 		return NULL;
 	}
 }
 
-int kvm_add_default_arch_event(int *argc, const char **argv)
+int kvm_add_default_arch_event(uint16_t e_machine, int *argc, const char **argv)
 {
-	switch (EM_HOST) {
+	switch (e_machine) {
 	case EM_PPC:
 	case EM_PPC64:
 		return __kvm_add_default_arch_event_powerpc(argc, argv);
diff --git a/tools/perf/util/kvm-stat.h b/tools/perf/util/kvm-stat.h
index a54cd4496df9..794dc8ed1e52 100644
--- a/tools/perf/util/kvm-stat.h
+++ b/tools/perf/util/kvm-stat.h
@@ -138,10 +138,10 @@ bool kvm_entry_event(struct evsel *evsel);
 /*
  * arch specific callbacks and data structures
  */
-int setup_kvm_events_tp(struct perf_kvm_stat *kvm);
+int setup_kvm_events_tp(struct perf_kvm_stat *kvm, uint16_t e_machine);
 int __setup_kvm_events_tp_powerpc(struct perf_kvm_stat *kvm);
 
-int cpu_isa_init(struct perf_kvm_stat *kvm, const char *cpuid);
+int cpu_isa_init(struct perf_kvm_stat *kvm, uint16_t e_machine, const char *cpuid);
 int __cpu_isa_init_arm64(struct perf_kvm_stat *kvm);
 int __cpu_isa_init_loongarch(struct perf_kvm_stat *kvm);
 int __cpu_isa_init_powerpc(struct perf_kvm_stat *kvm);
@@ -149,12 +149,12 @@ int __cpu_isa_init_riscv(struct perf_kvm_stat *kvm);
 int __cpu_isa_init_s390(struct perf_kvm_stat *kvm, const char *cpuid);
 int __cpu_isa_init_x86(struct perf_kvm_stat *kvm, const char *cpuid);
 
-const char *vcpu_id_str(void);
-const char *kvm_exit_reason(void);
-const char *kvm_entry_trace(void);
-const char *kvm_exit_trace(void);
+const char *vcpu_id_str(uint16_t e_machine);
+const char *kvm_exit_reason(uint16_t e_machine);
+const char *kvm_entry_trace(uint16_t e_machine);
+const char *kvm_exit_trace(uint16_t e_machine);
 
-const char * const *kvm_events_tp(void);
+const char * const *kvm_events_tp(uint16_t e_machine);
 const char * const *__kvm_events_tp_arm64(void);
 const char * const *__kvm_events_tp_loongarch(void);
 const char * const *__kvm_events_tp_powerpc(void);
@@ -162,7 +162,7 @@ const char * const *__kvm_events_tp_riscv(void);
 const char * const *__kvm_events_tp_s390(void);
 const char * const *__kvm_events_tp_x86(void);
 
-const struct kvm_reg_events_ops *kvm_reg_events_ops(void);
+const struct kvm_reg_events_ops *kvm_reg_events_ops(uint16_t e_machine);
 const struct kvm_reg_events_ops *__kvm_reg_events_ops_arm64(void);
 const struct kvm_reg_events_ops *__kvm_reg_events_ops_loongarch(void);
 const struct kvm_reg_events_ops *__kvm_reg_events_ops_powerpc(void);
@@ -170,7 +170,7 @@ const struct kvm_reg_events_ops *__kvm_reg_events_ops_riscv(void);
 const struct kvm_reg_events_ops *__kvm_reg_events_ops_s390(void);
 const struct kvm_reg_events_ops *__kvm_reg_events_ops_x86(void);
 
-const char * const *kvm_skip_events(void);
+const char * const *kvm_skip_events(uint16_t e_machine);
 const char * const *__kvm_skip_events_arm64(void);
 const char * const *__kvm_skip_events_loongarch(void);
 const char * const *__kvm_skip_events_powerpc(void);
@@ -178,7 +178,7 @@ const char * const *__kvm_skip_events_riscv(void);
 const char * const *__kvm_skip_events_s390(void);
 const char * const *__kvm_skip_events_x86(void);
 
-int kvm_add_default_arch_event(int *argc, const char **argv);
+int kvm_add_default_arch_event(uint16_t e_machine, int *argc, const char **argv);
 int __kvm_add_default_arch_event_powerpc(int *argc, const char **argv);
 int __kvm_add_default_arch_event_x86(int *argc, const char **argv);
 
-- 
2.53.0.rc1.225.gd81095ad13-goog


