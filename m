Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC61C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 06:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rDBpbpsYgqLkOcx3zNUIeqrEAl0fb06VtvHqHgTH7CQ=; b=ev7PYLrfihRRH8teqSJv2PBd2f
	BFTYRFXjObFAW6ef9S/izBBqVSfjUn8sdfqvKU17IlCVT2WqAfY3vPezOBnQnL8kkts0J0WUTKW+p
	kHXvUzKWB+5lKzO1KvyGhsbG/wj3DnwXtLv/sK3oL/3TgZsJ4zzwgtn7n5b9j3KXNHfGU5VKbeare
	1mxP49C1o+FUcl7TmV6VDL3mU9qAdpSpDby9m9FpRWQY5J2IjYPtT4/P5N4zM1Bb79ghfGMHkd2nv
	bGdb5lOBdr4KrCXGSY8gA6j6LImcsSHmK9Wb0cWN6PBd1fIMX9WEhuEd4BmTj/Yzzf01CkuUlH6GS
	zSWkKPvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJo9v-0000000A4rC-00PI;
	Tue, 27 May 2025 06:51:35 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJo0q-0000000A3Sv-04EU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 06:42:13 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2349fe994a9so2943605ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 May 2025 23:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748328130; x=1748932930; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rDBpbpsYgqLkOcx3zNUIeqrEAl0fb06VtvHqHgTH7CQ=;
        b=ufNKvzcLQVRrsJkfSWF4OU6TjkGqZVBj9Y9Sl0Qr3Zjh5JcyLOzMle9eyPTWFrYkdc
         GlUeV4i0H2V5V5r2fkgx29NTrC5zo6XdrU/EjRgevaIZamJqfiUCiaY57/VXnqCBiUk0
         NnXixqmtkoSG3PVg0CCUdXTNVcvTA04VAGXyNPoB4FrolTbcJ7Zt7dIoJRYp7k4Ok/VJ
         EbCMCV/4Ud4+W4g3pPC6QzQD8kTEkNIQUsnx9HyXChsor+HMH5QZocVtDLQZ4UKokQHn
         1a5LBleLvUGXLkJUPHUsel7fv7yRuhCzgEQjGCib+fk/lYiksDB1Q45foNdWR0bn1zgo
         uQVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748328130; x=1748932930;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rDBpbpsYgqLkOcx3zNUIeqrEAl0fb06VtvHqHgTH7CQ=;
        b=gD2v1vmIvSLR0ea7KLMuDZ0ANhVNVVSlcr8SXJK+gvPftGZYXClLfg7IdkvnIfzIEa
         7Kv5KvemCyX8j7UgR1CsT+3mI+j9RSLvJxnZAgjrLxjQu3DVhIfb+G2nfqWmLqII9+pU
         asZnPA1KMnwxxZDi2T31G1hEEaztGNE4uYxHmwwIUPk5M/J5yB/xdyEjiYVpASZABzGo
         07qQU6HsYrBab4ISGnTWzpdTMeb0uKv7zr7TyIVpgt96bL4YJ/osydAt0QJ2/wiBTBHp
         HFvguSa5O//4WOvMkydf8tJDTA2QamPM+IMz24aFFW0BajnUnPPSUv10hJHPmL7kcRxr
         iBpg==
X-Forwarded-Encrypted: i=1; AJvYcCXkqSZeFfoilnmKV+W7zPlpqsvnqiMNDFs7g4BVoXRwW1tv2PJ7KZO5NgJ//npeLsFDbcF82wey1/zMkCRD+Ra8@lists.infradead.org
X-Gm-Message-State: AOJu0YwSi7Wt0fFWX8z7/y4sHGCyDCwxWpJTTMIvlM9ODmlJ5Usqk78n
	pdGTbmS+4lmwsLabLrXWYJW91fRkCltHaguHeoYyX16ATz5Z8rhsBkY3lr/+vZRS8OA5wo1IH5C
	zgGZVkZBXGQ==
X-Google-Smtp-Source: AGHT+IGMXvuiR1zerHk3aQo+rgRobZgtLILUogGw7uq9DS/VlrJI0H6VM+HSxBsgDTEpNX/0OCWvgMYdst7A
X-Received: from pllk4.prod.google.com ([2002:a17:902:7604:b0:234:3f28:4851])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:32c8:b0:223:f9a4:3f99
 with SMTP id d9443c01a7336-23414f9f230mr185352785ad.29.1748328130225; Mon, 26
 May 2025 23:42:10 -0700 (PDT)
Date: Mon, 26 May 2025 23:41:45 -0700
In-Reply-To: <20250527064153.149939-1-irogers@google.com>
Mime-Version: 1.0
References: <20250527064153.149939-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250527064153.149939-4-irogers@google.com>
Subject: [PATCH v1 03/11] perf evlist: Change env variable to session
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	Charlie Jenkins <charlie@rivosinc.com>, Colin Ian King <colin.i.king@gmail.com>, 
	Andi Kleen <ak@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, Graham Woodward <graham.woodward@arm.com>, 
	Ilkka Koskinen <ilkka@os.amperecomputing.com>, Zhongqiu Han <quic_zhonhan@quicinc.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, Howard Chu <howardchu95@gmail.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Levi Yun <yeoreum.yun@arm.com>, 
	Weilin Wang <weilin.wang@intel.com>, Michael Petlan <mpetlan@redhat.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Chun-Tse Shao <ctshao@google.com>, Ben Gainey <ben.gainey@arm.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_234212_066660_01704F7C 
X-CRM114-Status: GOOD (  24.32  )
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

The session holds a perf_env pointer env. In UI code container_of is
used to turn the env to a session, but this assumes the session
header's env is in use. Rather than a dubious container_of, hold the
session in the evlist and derive the env from the session with
evsel__env, perf_session__env, etc.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-report.c      |  6 +++++-
 tools/perf/builtin-script.c      |  2 +-
 tools/perf/builtin-top.c         |  2 +-
 tools/perf/tests/topology.c      |  1 +
 tools/perf/ui/browser.h          |  4 ++--
 tools/perf/ui/browsers/header.c  |  4 +---
 tools/perf/ui/browsers/hists.c   |  2 +-
 tools/perf/util/amd-sample-raw.c |  2 +-
 tools/perf/util/arm-spe.c        |  2 +-
 tools/perf/util/evlist.h         |  2 +-
 tools/perf/util/evsel.c          | 12 +++++++++---
 tools/perf/util/evsel.h          |  1 +
 tools/perf/util/header.c         |  2 +-
 tools/perf/util/s390-cpumsf.c    |  2 +-
 tools/perf/util/sample-raw.c     |  7 ++++---
 tools/perf/util/sample-raw.h     |  2 +-
 tools/perf/util/session.c        |  4 +++-
 17 files changed, 35 insertions(+), 22 deletions(-)

diff --git a/tools/perf/builtin-report.c b/tools/perf/builtin-report.c
index 9238cb993015..9b7bf1dcaa1b 100644
--- a/tools/perf/builtin-report.c
+++ b/tools/perf/builtin-report.c
@@ -1264,6 +1264,8 @@ static int process_attr(const struct perf_tool *tool __maybe_unused,
 			union perf_event *event,
 			struct evlist **pevlist)
 {
+	struct perf_session *session;
+	struct perf_env *env;
 	u64 sample_type;
 	int err;
 
@@ -1276,7 +1278,9 @@ static int process_attr(const struct perf_tool *tool __maybe_unused,
 	 * on events sample_type.
 	 */
 	sample_type = evlist__combined_sample_type(*pevlist);
-	callchain_param_setup(sample_type, perf_env__arch((*pevlist)->env));
+	session = (*pevlist)->session;
+	env = perf_session__env(session);
+	callchain_param_setup(sample_type, perf_env__arch(env));
 	return 0;
 }
 
diff --git a/tools/perf/builtin-script.c b/tools/perf/builtin-script.c
index 55b7c5ed8245..165668d67a6a 100644
--- a/tools/perf/builtin-script.c
+++ b/tools/perf/builtin-script.c
@@ -2533,7 +2533,7 @@ static int process_attr(const struct perf_tool *tool, union perf_event *event,
 	 * on events sample_type.
 	 */
 	sample_type = evlist__combined_sample_type(evlist);
-	callchain_param_setup(sample_type, perf_env__arch((*pevlist)->env));
+	callchain_param_setup(sample_type, perf_env__arch(perf_session__env(scr->session)));
 
 	/* Enable fields for callchain entries */
 	if (symbol_conf.use_callchain &&
diff --git a/tools/perf/builtin-top.c b/tools/perf/builtin-top.c
index 0427dc027519..3c89568dd6d0 100644
--- a/tools/perf/builtin-top.c
+++ b/tools/perf/builtin-top.c
@@ -1654,7 +1654,6 @@ int cmd_top(int argc, const char **argv)
 			"Couldn't read the cpuid for this machine: %s\n",
 			str_error_r(errno, errbuf, sizeof(errbuf)));
 	}
-	top.evlist->env = &perf_env;
 
 	argc = parse_options(argc, argv, options, top_usage, 0);
 	if (argc)
@@ -1827,6 +1826,7 @@ int cmd_top(int argc, const char **argv)
 		top.session = NULL;
 		goto out_delete_evlist;
 	}
+	top.session->env = &perf_env;
 
 	if (!evlist__needs_bpf_sb_event(top.evlist))
 		top.record_opts.no_bpf_event = true;
diff --git a/tools/perf/tests/topology.c b/tools/perf/tests/topology.c
index bc7d10630dad..ec01150d208d 100644
--- a/tools/perf/tests/topology.c
+++ b/tools/perf/tests/topology.c
@@ -43,6 +43,7 @@ static int session_write_header(char *path)
 
 	session->evlist = evlist__new_default();
 	TEST_ASSERT_VAL("can't get evlist", session->evlist);
+	session->evlist->session = session;
 
 	perf_header__set_feat(&session->header, HEADER_CPU_TOPOLOGY);
 	perf_header__set_feat(&session->header, HEADER_NRCPUS);
diff --git a/tools/perf/ui/browser.h b/tools/perf/ui/browser.h
index f59ad4f14d33..9d4404f9b87f 100644
--- a/tools/perf/ui/browser.h
+++ b/tools/perf/ui/browser.h
@@ -71,8 +71,8 @@ int ui_browser__help_window(struct ui_browser *browser, const char *text);
 bool ui_browser__dialog_yesno(struct ui_browser *browser, const char *text);
 int ui_browser__input_window(const char *title, const char *text, char *input,
 			     const char *exit_msg, int delay_sec);
-struct perf_env;
-int tui__header_window(struct perf_env *env);
+struct perf_session;
+int tui__header_window(struct perf_session *session);
 
 void ui_browser__argv_seek(struct ui_browser *browser, off_t offset, int whence);
 unsigned int ui_browser__argv_refresh(struct ui_browser *browser);
diff --git a/tools/perf/ui/browsers/header.c b/tools/perf/ui/browsers/header.c
index 2213b4661600..5b5ca32e3eef 100644
--- a/tools/perf/ui/browsers/header.c
+++ b/tools/perf/ui/browsers/header.c
@@ -93,16 +93,14 @@ static int ui__list_menu(int argc, char * const argv[])
 	return list_menu__run(&menu);
 }
 
-int tui__header_window(struct perf_env *env)
+int tui__header_window(struct perf_session *session)
 {
 	int i, argc = 0;
 	char **argv;
-	struct perf_session *session;
 	char *ptr, *pos;
 	size_t size;
 	FILE *fp = open_memstream(&ptr, &size);
 
-	session = container_of(env, struct perf_session, header.env);
 	perf_header__fprintf_info(session, fp, true);
 	fclose(fp);
 
diff --git a/tools/perf/ui/browsers/hists.c b/tools/perf/ui/browsers/hists.c
index d26b925e3d7f..d9d3fb44477a 100644
--- a/tools/perf/ui/browsers/hists.c
+++ b/tools/perf/ui/browsers/hists.c
@@ -3233,7 +3233,7 @@ static int evsel__hists_browse(struct evsel *evsel, int nr_events, const char *h
 		case 'i':
 			/* env->arch is NULL for live-mode (i.e. perf top) */
 			if (env->arch)
-				tui__header_window(env);
+				tui__header_window(evsel__session(evsel));
 			continue;
 		case 'F':
 			symbol_conf.filter_relative ^= 1;
diff --git a/tools/perf/util/amd-sample-raw.c b/tools/perf/util/amd-sample-raw.c
index 022c9eb39509..ac24b4cb4a91 100644
--- a/tools/perf/util/amd-sample-raw.c
+++ b/tools/perf/util/amd-sample-raw.c
@@ -354,7 +354,7 @@ static void parse_cpuid(struct perf_env *env)
  */
 bool evlist__has_amd_ibs(struct evlist *evlist)
 {
-	struct perf_env *env = evlist->env;
+	struct perf_env *env = perf_session__env(evlist->session);
 	int ret, nr_pmu_mappings = perf_env__nr_pmu_mappings(env);
 	const char *pmu_mapping = perf_env__pmu_mappings(env);
 	char name[sizeof("ibs_fetch")];
diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index 2a9775649cc2..2d36c062e71d 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -760,7 +760,7 @@ static bool arm_spe__synth_ds(struct arm_spe_queue *speq,
 		const char *cpuid;
 
 		pr_warning_once("Old SPE metadata, re-record to improve decode accuracy\n");
-		cpuid = perf_env__cpuid(spe->session->evlist->env);
+		cpuid = perf_env__cpuid(perf_session__env(spe->session));
 		midr = strtol(cpuid, NULL, 16);
 	} else {
 		/* CPU ID is -1 for per-thread mode */
diff --git a/tools/perf/util/evlist.h b/tools/perf/util/evlist.h
index 85859708393e..121879aef60f 100644
--- a/tools/perf/util/evlist.h
+++ b/tools/perf/util/evlist.h
@@ -70,7 +70,7 @@ struct evlist {
 	struct mmap *overwrite_mmap;
 	struct evsel *selected;
 	struct events_stats stats;
-	struct perf_env	*env;
+	struct perf_session *session;
 	void (*trace_event_sample_raw)(struct evlist *evlist,
 				       union perf_event *event,
 				       struct perf_sample *sample);
diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
index d55482f094bf..24c93ea5ba0a 100644
--- a/tools/perf/util/evsel.c
+++ b/tools/perf/util/evsel.c
@@ -48,6 +48,7 @@
 #include "record.h"
 #include "debug.h"
 #include "trace-event.h"
+#include "session.h"
 #include "stat.h"
 #include "string2.h"
 #include "memswap.h"
@@ -3839,11 +3840,16 @@ int evsel__open_strerror(struct evsel *evsel, struct target *target,
 			 err, str_error_r(err, sbuf, sizeof(sbuf)), evsel__name(evsel));
 }
 
+struct perf_session *evsel__session(struct evsel *evsel)
+{
+	return evsel && evsel->evlist ? evsel->evlist->session : NULL;
+}
+
 struct perf_env *evsel__env(struct evsel *evsel)
 {
-	if (evsel && evsel->evlist && evsel->evlist->env)
-		return evsel->evlist->env;
-	return &perf_env;
+	struct perf_session *session = evsel__session(evsel);
+
+	return session ? perf_session__env(session) : &perf_env;
 }
 
 static int store_evsel_ids(struct evsel *evsel, struct evlist *evlist)
diff --git a/tools/perf/util/evsel.h b/tools/perf/util/evsel.h
index 6dbc9690e0c9..847acf9f6795 100644
--- a/tools/perf/util/evsel.h
+++ b/tools/perf/util/evsel.h
@@ -537,6 +537,7 @@ static inline bool evsel__is_dummy_event(struct evsel *evsel)
 	       (evsel->core.attr.config == PERF_COUNT_SW_DUMMY);
 }
 
+struct perf_session *evsel__session(struct evsel *evsel);
 struct perf_env *evsel__env(struct evsel *evsel);
 
 int evsel__store_ids(struct evsel *evsel, struct evlist *evlist);
diff --git a/tools/perf/util/header.c b/tools/perf/util/header.c
index e3cdc3b7b4ab..c3621f718cb3 100644
--- a/tools/perf/util/header.c
+++ b/tools/perf/util/header.c
@@ -4228,7 +4228,7 @@ int perf_session__read_header(struct perf_session *session)
 	if (session->evlist == NULL)
 		return -ENOMEM;
 
-	session->evlist->env = &header->env;
+	session->evlist->session = session;
 	session->machines.host.env = &header->env;
 
 	/*
diff --git a/tools/perf/util/s390-cpumsf.c b/tools/perf/util/s390-cpumsf.c
index 0ce52f0280b8..c17dbe232c54 100644
--- a/tools/perf/util/s390-cpumsf.c
+++ b/tools/perf/util/s390-cpumsf.c
@@ -1142,7 +1142,7 @@ int s390_cpumsf_process_auxtrace_info(union perf_event *event,
 	sf->machine = &session->machines.host; /* No kvm support */
 	sf->auxtrace_type = auxtrace_info->type;
 	sf->pmu_type = PERF_TYPE_RAW;
-	sf->machine_type = s390_cpumsf_get_type(session->evlist->env->cpuid);
+	sf->machine_type = s390_cpumsf_get_type(perf_session__env(session)->cpuid);
 
 	sf->auxtrace.process_event = s390_cpumsf_process_event;
 	sf->auxtrace.process_auxtrace_event = s390_cpumsf_process_auxtrace_event;
diff --git a/tools/perf/util/sample-raw.c b/tools/perf/util/sample-raw.c
index f3f6bd9d290e..bcf442574d6e 100644
--- a/tools/perf/util/sample-raw.c
+++ b/tools/perf/util/sample-raw.c
@@ -6,15 +6,16 @@
 #include "env.h"
 #include "header.h"
 #include "sample-raw.h"
+#include "session.h"
 
 /*
  * Check platform the perf data file was created on and perform platform
  * specific interpretation.
  */
-void evlist__init_trace_event_sample_raw(struct evlist *evlist)
+void evlist__init_trace_event_sample_raw(struct evlist *evlist, struct perf_env *env)
 {
-	const char *arch_pf = perf_env__arch(evlist->env);
-	const char *cpuid = perf_env__cpuid(evlist->env);
+	const char *arch_pf = perf_env__arch(env);
+	const char *cpuid = perf_env__cpuid(env);
 
 	if (arch_pf && !strcmp("s390", arch_pf))
 		evlist->trace_event_sample_raw = evlist__s390_sample_raw;
diff --git a/tools/perf/util/sample-raw.h b/tools/perf/util/sample-raw.h
index ea01c5811503..896e9a87e373 100644
--- a/tools/perf/util/sample-raw.h
+++ b/tools/perf/util/sample-raw.h
@@ -11,5 +11,5 @@ void evlist__s390_sample_raw(struct evlist *evlist, union perf_event *event,
 bool evlist__has_amd_ibs(struct evlist *evlist);
 void evlist__amd_sample_raw(struct evlist *evlist, union perf_event *event,
 			    struct perf_sample *sample);
-void evlist__init_trace_event_sample_raw(struct evlist *evlist);
+void evlist__init_trace_event_sample_raw(struct evlist *evlist, struct perf_env *env);
 #endif /* __PERF_EVLIST_H */
diff --git a/tools/perf/util/session.c b/tools/perf/util/session.c
index 3af518243daf..beb74d9fcc07 100644
--- a/tools/perf/util/session.c
+++ b/tools/perf/util/session.c
@@ -177,7 +177,7 @@ struct perf_session *__perf_session__new(struct perf_data *data,
 				perf_session__set_comm_exec(session);
 			}
 
-			evlist__init_trace_event_sample_raw(session->evlist);
+			evlist__init_trace_event_sample_raw(session->evlist, &session->header.env);
 
 			/* Open the directory data. */
 			if (data->is_dir) {
@@ -193,6 +193,8 @@ struct perf_session *__perf_session__new(struct perf_data *data,
 	} else  {
 		session->machines.host.env = &perf_env;
 	}
+	if (session->evlist)
+		session->evlist->session = session;
 
 	session->machines.host.single_address_space =
 		perf_env__single_address_space(session->machines.host.env);
-- 
2.49.0.1151.ga128411c76-goog


