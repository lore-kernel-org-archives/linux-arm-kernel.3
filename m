Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87189E7C6E2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 20:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hbIIGfMQy8kU/29JW+xHk5T5mRSTZKfA14hCK/ZK1Tw=; b=qQgh5tT9aogtU6BuQJYItOF78Z
	Kj+Y+j8v45PiyXFkab2QWI7qFqa6E7H1uRSa9cq1Ba+/EXnKWjl/iJAo9i8Weuio8rpqxwf3VLE++
	VgPJWy6zORMYuicc00fzWA+tY84TonRYoIlI/ZlFiXbmpbv81Wn3CiB8evZtk58b2eny6mMN+savR
	YypcbqMz1Rxxv/EI3IMNvfEfC+DxeK+XHAiyoK6CpyEdI8CJo6GZl8mMQ2nTpCV1KKGlnvbLVAdYJ
	58VbTVXze9Oumza6lCcxfGVi1cr4DSck1Upi3igAD2b0rE+V01nkdBYXbCELqDeURFogu7DZIBS0r
	nwm3yqAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmHBL-00000002wje-46Pf;
	Sat, 31 Jan 2026 20:02:59 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmHB4-00000002wWJ-0JK9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 20:02:43 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2b7ef896edcso2308955eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 12:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769889759; x=1770494559; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hbIIGfMQy8kU/29JW+xHk5T5mRSTZKfA14hCK/ZK1Tw=;
        b=nX/P6Q33M3Xa47NJoX+1csFaMF3kE8dqf7Onja2rlnELPJ7gCECzNdz8R2EpBdIty3
         GucVYqH5TD53Oov9amjgNUZkBWf+8L8fT4ZRkkCBVAM8hBtaBwFWPnEa+R92wdEv+VgE
         ghmq8ro7OssIuT20Iz3lDsXQnx2ucpH0nI3sf3c6HL88ijDOtZC9RqTBzjtPVF/vt0CX
         RRr9W6030qSQUEV4wmqKEUmVSLVlY5Rq+fhE9mQYuA7KLiMBAW56/jWaGhr/q9FSZTaG
         oBLE6ttbEGqY6YX53GaQv4Zxa/5GGa7dVIl14+utgnkvX0ml+WUB/J67kFPKM+afmKnJ
         Ep4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769889759; x=1770494559;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hbIIGfMQy8kU/29JW+xHk5T5mRSTZKfA14hCK/ZK1Tw=;
        b=dsJaLXSkaAgZF5wSJREr+0rBMD8mVsREjIs+NOykgqzx+jzCoN/va6jBhFBx6KGa/7
         L0Efb/sTA+0NV1oLJIjlm0JOIciS3O8+3IhnQ6gbRpbldEVGKC06dRVxm57+ZBMxI+x5
         IeOfUgjUNqf/pNpj6Q6mQejcZEELNuE5YQ0tcxih+A9Pwm90UC0xdcdQKG6hgwtPkJhW
         Rsc41y5qS8aXXjJdEJhYSxPHU2S6grVSN/pEBd06UUrT+5bMIdcZv8CgFBHIUUrkTQo0
         yc+r+09ibK9PGYqnP4TzbTezZhXt36TDhdwxIex+Uh7wtnZ92k/+P97cc7beSW5lugao
         HMtw==
X-Forwarded-Encrypted: i=1; AJvYcCV04+QF/W1KMlAxPM/yloR8X8Ytov9LL8CKdNXyvG+PXenb3z89Kic0qI5EvAsOCkNTAdEsKPnK+zf35/kDug7h@lists.infradead.org
X-Gm-Message-State: AOJu0YyVmYKWrw09TOp7AZyenOX0Xdj6vqkzkBcTWt0aqRAWoVIP5XD2
	SHFCxGW7+UU6VewfjKbAFLaFje/96iQPcsuLENIWOoNe0a1NDyVgcrpQfYlzkM9+qw+GTZ8Pgi3
	bt/YjHItsMw==
X-Received: from dycoz4.prod.google.com ([2002:a05:7301:fc84:b0:2b6:bdce:fb0])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:434f:b0:2b7:1746:c947
 with SMTP id 5a478bee46e88-2b7c86268ebmr3367037eec.6.1769889759132; Sat, 31
 Jan 2026 12:02:39 -0800 (PST)
Date: Sat, 31 Jan 2026 12:02:23 -0800
In-Reply-To: <20260131200224.1296136-1-irogers@google.com>
Mime-Version: 1.0
References: <20260131200224.1296136-1-irogers@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <20260131200224.1296136-6-irogers@google.com>
Subject: [PATCH v2 5/6] perf header: Add e_machine/e_flags to the header
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
X-CRM114-CacheID: sfid-20260131_120242_128437_88557306 
X-CRM114-Status: GOOD (  22.44  )
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

Add 64-bits of feature data to record the ELF machine and flags. This
allows readers to initialize based on the data. For example, `perf kvm
stat` wants to initialize based on the kind of data to be read, but at
initialization time there are no threads to base this data upon and
using the host means cross platform support won't work. The values in
the perf_env also act as a cache for these within the session.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/env.h     |  3 +++
 tools/perf/util/header.c  | 33 +++++++++++++++++++++++++++++++++
 tools/perf/util/header.h  |  1 +
 tools/perf/util/session.c | 33 +++++++++++++++++++++++++++------
 4 files changed, 64 insertions(+), 6 deletions(-)

diff --git a/tools/perf/util/env.h b/tools/perf/util/env.h
index 76ba1a36e9ff..a4501cbca375 100644
--- a/tools/perf/util/env.h
+++ b/tools/perf/util/env.h
@@ -74,6 +74,9 @@ struct perf_env {
 	char			*os_release;
 	char			*version;
 	char			*arch;
+	/* e_machine expanded from 16 to 32-bits for alignment. */
+	u32			e_machine;
+	u32			e_flags;
 	int			nr_cpus_online;
 	int			nr_cpus_avail;
 	char			*cpu_desc;
diff --git a/tools/perf/util/header.c b/tools/perf/util/header.c
index eefd1cd73b6a..196bbe0c8407 100644
--- a/tools/perf/util/header.c
+++ b/tools/perf/util/header.c
@@ -378,6 +378,21 @@ static int write_arch(struct feat_fd *ff,
 	return do_write_string(ff, uts.machine);
 }
 
+static int write_e_machine(struct feat_fd *ff,
+			   struct evlist *evlist __maybe_unused)
+{
+	/* e_machine expanded from 16 to 32-bits for alignment. */
+	uint32_t e_flags;
+	uint32_t e_machine = perf_session__e_machine(evlist->session, &e_flags);
+	int ret;
+
+	ret = do_write(ff, &e_machine, sizeof(e_machine));
+	if (ret)
+		return ret;
+
+	return do_write(ff, &e_flags, sizeof(e_flags));
+}
+
 static int write_version(struct feat_fd *ff,
 			 struct evlist *evlist __maybe_unused)
 {
@@ -1784,6 +1799,12 @@ static void print_arch(struct feat_fd *ff, FILE *fp)
 	fprintf(fp, "# arch : %s\n", ff->ph->env.arch);
 }
 
+static void print_e_machine(struct feat_fd *ff, FILE *fp)
+{
+	fprintf(fp, "# e_machine : %u\n", ff->ph->env.e_machine);
+	fprintf(fp, "#   e_flags : %u\n", ff->ph->env.e_flags);
+}
+
 static void print_cpudesc(struct feat_fd *ff, FILE *fp)
 {
 	fprintf(fp, "# cpudesc : %s\n", ff->ph->env.cpu_desc);
@@ -2611,6 +2632,17 @@ FEAT_PROCESS_STR_FUN(arch, arch);
 FEAT_PROCESS_STR_FUN(cpudesc, cpu_desc);
 FEAT_PROCESS_STR_FUN(cpuid, cpuid);
 
+static int process_e_machine(struct feat_fd *ff, void *data __maybe_unused)
+{
+	int ret;
+
+	ret = do_read_u32(ff, &ff->ph->env.e_machine);
+	if (ret)
+		return ret;
+
+	return do_read_u32(ff, &ff->ph->env.e_flags);
+}
+
 #ifdef HAVE_LIBTRACEEVENT
 static int process_tracing_data(struct feat_fd *ff, void *data)
 {
@@ -3729,6 +3761,7 @@ const struct perf_header_feature_ops feat_ops[HEADER_LAST_FEATURE] = {
 	FEAT_OPN(HYBRID_TOPOLOGY,	hybrid_topology,	true),
 	FEAT_OPR(PMU_CAPS,	pmu_caps,	false),
 	FEAT_OPR(CPU_DOMAIN_INFO,	cpu_domain_info,	true),
+	FEAT_OPR(E_MACHINE,	e_machine,	false),
 };
 
 struct header_print_data {
diff --git a/tools/perf/util/header.h b/tools/perf/util/header.h
index 36cc74e2d14d..cc40ac796f52 100644
--- a/tools/perf/util/header.h
+++ b/tools/perf/util/header.h
@@ -54,6 +54,7 @@ enum {
 	HEADER_HYBRID_TOPOLOGY,
 	HEADER_PMU_CAPS,
 	HEADER_CPU_DOMAIN_INFO,
+	HEADER_E_MACHINE,
 	HEADER_LAST_FEATURE,
 	HEADER_FEAT_BITS	= 256,
 };
diff --git a/tools/perf/util/session.c b/tools/perf/util/session.c
index 72e8bb67d740..53f51c3f9603 100644
--- a/tools/perf/util/session.c
+++ b/tools/perf/util/session.c
@@ -2967,7 +2967,6 @@ struct perf_env *perf_session__env(struct perf_session *session)
 struct perf_session__e_machine_cb_args {
 	uint32_t e_flags;
 	uint16_t e_machine;
-	bool need_e_flags;
 };
 
 static int perf_session__e_machine_cb(struct thread *thread, void *_args)
@@ -2975,8 +2974,7 @@ static int perf_session__e_machine_cb(struct thread *thread, void *_args)
 	struct perf_session__e_machine_cb_args *args = _args;
 	struct machine *machine = maps__machine(thread__maps(thread));
 
-	args->e_machine = thread__e_machine(thread, machine,
-					    args->need_e_flags ? &args->e_flags : NULL);
+	args->e_machine = thread__e_machine(thread, machine, &args->e_flags);
 	return args->e_machine != EM_NONE ? 1 : 0;
 }
 
@@ -2988,8 +2986,8 @@ uint16_t perf_session__e_machine(struct perf_session *session, uint32_t *e_flags
 {
 	struct perf_session__e_machine_cb_args args = {
 		.e_machine = EM_NONE,
-		.need_e_flags = e_flags != NULL,
 	};
+	struct perf_env *env;
 
 	if (!session) {
 		/* Default to assuming a host machine. */
@@ -2999,12 +2997,35 @@ uint16_t perf_session__e_machine(struct perf_session *session, uint32_t *e_flags
 		return EM_HOST;
 	}
 
+	env = perf_session__env(session);
+	if (env && env->e_machine != EM_NONE) {
+		if (e_flags)
+			*e_flags = env->e_flags;
+
+		return env->e_machine;
+	}
+
 	machines__for_each_thread(&session->machines,
 				  perf_session__e_machine_cb,
 				  &args);
 
+	if (args.e_machine != EM_NONE) {
+		if (env) {
+			env->e_machine = args.e_machine;
+			env->e_flags = args.e_flags;
+		}
+		if (e_flags)
+			*e_flags = args.e_flags;
+
+		return args.e_machine;
+	}
+
+	/*
+	 * Couldn't determine from the perf_env or current set of
+	 * threads. Default to the host.
+	 */
 	if (e_flags)
-		*e_flags = args.e_flags;
+		*e_flags = EF_HOST;
 
-	return args.e_machine == EM_NONE ? EM_HOST : args.e_machine;
+	return EM_HOST;
 }
-- 
2.53.0.rc1.225.gd81095ad13-goog


