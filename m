Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9874DC54F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 06:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=osa5wtVgN75Qz2+/E2ShchmseliLYV0sbPvRf6suVCQ=; b=Uzfgz/4k3FWKwRfGaqC2lbnqfp
	I8rkN/UwgisQZarbDvESgPn+5pKFhmEu3RW9FrIDKCl1gS8U9MUjgLMcBVwp/dBpv1mfpHLQBK44H
	pRAua+a0A/bEHBe1LEfuGn6MPAnLKTMNzy9ykI44/IPzJpH8eyxjuovKbG/Ydb1b1O+FtAJTW7zTX
	CmbcS7KESyo8sVMCZfciGlq6i9xrluiMYc+BqlHrVLcOqZCbql4Euxaextb+FkA16P5h7ubJ0biJx
	99Qqfq3cj1jQ0hz152qkywr7zfhLyMRKxLWWBBrpLAVCCphzf77ifCrhdqVWn4DWQi6mlS7a391zd
	MMUczbtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJoE6-0000000A5MM-1oUB;
	Tue, 27 May 2025 06:55:54 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJo0t-0000000A3UF-41UB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 06:42:17 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-22c31b55ac6so37935845ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 May 2025 23:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748328135; x=1748932935; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=osa5wtVgN75Qz2+/E2ShchmseliLYV0sbPvRf6suVCQ=;
        b=EB5+WdfTbTyCDiRpiYKTsU5fO5fDBxN2n3fjV9xAb67ot3fNV/YyE8IUoz3NuUrkub
         Lm5lT3Sk/gaGm29qZFyESGdDgKYvAosociyHyp6QKn/wMM6UYz7wsi3Kz2k81EAJGHX8
         bbICztwXYBsRxFf34uf8DxTbmmdOjHV2Wu1vWUkX7FODI+zYm7kY+dhiRBDGr1ekLo1d
         vO/xf3ub+6biviC31cGG5FjSjhXfxh9ecNd3M11+wsjw4Q4DsruBew1FAxPxwJ33Vy2n
         l5+O0XbPi1a1NtcfjfpQc2usyBiGe2ctDtvRMYVZj7V2c8hro7XEWJb8HJ9B5sQf8GP9
         /Szw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748328135; x=1748932935;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=osa5wtVgN75Qz2+/E2ShchmseliLYV0sbPvRf6suVCQ=;
        b=vhsfaSOv3SVVQLPIiwOrijlEYVFYF2NwpiPNluws5Y9Hx9Ef3Alj0YgxJX1vAmrmS/
         +LmVEI1+UG1pBb/Olfl6bs6Ewycm4ecRGBxBIe1qI3Sht80m3EYGDvOASDndSKHFqaqy
         xpCWHMKqwOBzt5MDlBxZ3zBH+rMngC9yF5LnnHcIH/W6qat+Q8HZVP9o3y5gSvdT1u0X
         ae5ASeg6lXa/DpbZx+A0rFEm6Rb6gV2u8nGnLLERSuE9cc1mc1yMbd/frbaV8RD4DkDI
         YsGlu+AwZ2ytmQ7y/qZuxr0iudzk4rDIR/o5Jo78qc8OoDQTZroOhAZAe65iqCYCBgV+
         gWQQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0p9JKoPiKDJIq3TnSwKtcn9UJLpPyz0vMzgl022TD4DGfsyj5YEMkn/Z4rkvHCKNXaiPO2gTWnQhVXyDKEg/z@lists.infradead.org
X-Gm-Message-State: AOJu0YyFDl/kc85wEBOI7TK3Io3F+cVeQy/dPu+qgyDUO3OCJd05kXaa
	hf8W2ocOFo2c5tf4oS+yYk9tzipsNw7B9czwWIJrAA6BLp8kTkBaeS+DUgpBrdiXxwOq1+NgbA0
	8tyBwxKsP2Q==
X-Google-Smtp-Source: AGHT+IHBlK8YqoPMAr7xh9aEs9BuP63hCf3vUPjkswlC+FGyc/S92WE6qVaUgB/MfYWJFOpNBewMgTCnn2Lz
X-Received: from plgf13.prod.google.com ([2002:a17:902:ce8d:b0:234:711c:9397])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2402:b0:234:8aad:73cd
 with SMTP id d9443c01a7336-2348aad7438mr34457945ad.30.1748328134808; Mon, 26
 May 2025 23:42:14 -0700 (PDT)
Date: Mon, 26 May 2025 23:41:47 -0700
In-Reply-To: <20250527064153.149939-1-irogers@google.com>
Mime-Version: 1.0
References: <20250527064153.149939-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250527064153.149939-6-irogers@google.com>
Subject: [PATCH v1 05/11] perf test: Avoid use perf_env
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
X-CRM114-CacheID: sfid-20250526_234216_008732_7EDA45F1 
X-CRM114-Status: GOOD (  19.03  )
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

The perf_env global variable holds the host perf_env data but its use
is hit and miss. Switch to using local perf_env variables and ensure
scoped perf_env__init and perf_env__exit. This loses command line
setting of the perf_env, but this doesn't matter for tests. So the
perf_env is fully initialized, clear it with memset in perf_env__init.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/code-reading.c  |  5 +++-
 tools/perf/tests/dlfilter-test.c | 50 ++++++++++++++++++--------------
 tools/perf/util/env.c            |  1 +
 3 files changed, 33 insertions(+), 23 deletions(-)

diff --git a/tools/perf/tests/code-reading.c b/tools/perf/tests/code-reading.c
index cf6edbe697b2..4b2461e93b2b 100644
--- a/tools/perf/tests/code-reading.c
+++ b/tools/perf/tests/code-reading.c
@@ -651,11 +651,13 @@ static int do_test_code_reading(bool try_kcore)
 	struct dso *dso;
 	const char *events[] = { "cycles", "cycles:u", "cpu-clock", "cpu-clock:u", NULL };
 	int evidx = 0;
+	struct perf_env host_env;
 
 	pid = getpid();
 
 	machine = machine__new_host();
-	machine->env = &perf_env;
+	perf_env__init(&host_env);
+	machine->env = &host_env;
 
 	ret = machine__create_kernel_maps(machine);
 	if (ret < 0) {
@@ -798,6 +800,7 @@ static int do_test_code_reading(bool try_kcore)
 	perf_cpu_map__put(cpus);
 	perf_thread_map__put(threads);
 	machine__delete(machine);
+	perf_env__exit(&host_env);
 
 	return err;
 }
diff --git a/tools/perf/tests/dlfilter-test.c b/tools/perf/tests/dlfilter-test.c
index 54f59d1246bc..6427e3382711 100644
--- a/tools/perf/tests/dlfilter-test.c
+++ b/tools/perf/tests/dlfilter-test.c
@@ -319,11 +319,12 @@ static int run_perf_script(struct test_data *td)
 
 static int test__dlfilter_test(struct test_data *td)
 {
+	struct perf_env host_env;
 	u64 sample_type = TEST_SAMPLE_TYPE;
 	pid_t pid = 12345;
 	pid_t tid = 12346;
 	u64 id = 99;
-	int err;
+	int err = TEST_OK;
 
 	if (get_dlfilters_path(td->name, td->dlfilters, PATH_MAX))
 		return test_result("dlfilters not found", TEST_SKIP);
@@ -353,37 +354,42 @@ static int test__dlfilter_test(struct test_data *td)
 
 	pr_debug("Creating new host machine structure\n");
 	td->machine = machine__new_host();
-	td->machine->env = &perf_env;
+	perf_env__init(&host_env);
+	td->machine->env = &host_env;
 
 	td->fd = creat(td->perf_data_file_name, 0644);
 	if (td->fd < 0)
 		return test_result("Failed to create test perf.data file", TEST_FAIL);
 
 	err = perf_header__write_pipe(td->fd);
-	if (err < 0)
-		return test_result("perf_header__write_pipe() failed", TEST_FAIL);
-
+	if (err < 0) {
+		err = test_result("perf_header__write_pipe() failed", TEST_FAIL);
+		goto out;
+	}
 	err = write_attr(td, sample_type, &id);
-	if (err)
-		return test_result("perf_event__synthesize_attr() failed", TEST_FAIL);
-
-	if (write_comm(td->fd, pid, tid, "test-prog"))
-		return TEST_FAIL;
-
-	if (write_mmap(td->fd, pid, tid, MAP_START, 0x10000, 0, td->prog_file_name))
-		return TEST_FAIL;
-
-	if (write_sample(td, sample_type, id, pid, tid) != TEST_OK)
-		return TEST_FAIL;
-
+	if (err) {
+		err = test_result("perf_event__synthesize_attr() failed", TEST_FAIL);
+		goto out;
+	}
+	if (write_comm(td->fd, pid, tid, "test-prog")) {
+		err = TEST_FAIL;
+		goto out;
+	}
+	if (write_mmap(td->fd, pid, tid, MAP_START, 0x10000, 0, td->prog_file_name)) {
+		err = TEST_FAIL;
+		goto out;
+	}
+	if (write_sample(td, sample_type, id, pid, tid) != TEST_OK) {
+		err = TEST_FAIL;
+		goto out;
+	}
 	if (verbose > 1)
 		system_cmd("%s script -i %s -D", td->perf, td->perf_data_file_name);
 
-	err = run_perf_script(td);
-	if (err)
-		return TEST_FAIL;
-
-	return TEST_OK;
+	err = run_perf_script(td) ? TEST_FAIL : TEST_OK;
+out:
+	perf_env__exit(&host_env);
+	return err;
 }
 
 static void unlink_path(const char *path)
diff --git a/tools/perf/util/env.c b/tools/perf/util/env.c
index 36411749e007..b363c933e782 100644
--- a/tools/perf/util/env.c
+++ b/tools/perf/util/env.c
@@ -254,6 +254,7 @@ void perf_env__exit(struct perf_env *env)
 
 void perf_env__init(struct perf_env *env)
 {
+	memset(env, 0, sizeof(*env));
 #ifdef HAVE_LIBBPF_SUPPORT
 	env->bpf_progs.infos = RB_ROOT;
 	env->bpf_progs.btfs = RB_ROOT;
-- 
2.49.0.1151.ga128411c76-goog


