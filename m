Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE027E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 10:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I2Qn39K4UzsLsLGtfNH0/R87UIS/L19Vs2Fn7/eQxwo=; b=ReXv3mIaBaBbdw78f+elQR3lqP
	Qxl0rVRWCwTj5QQrFMsgpfs0dt4BHi08GtUZkqExYhIOm0rGbHXytO3pBbHej25Yzu3bHDcoL4OOE
	4GNqv6WQNGI0D34AmqRUPfcLA3Cg0nv4MCEJgNewFK1TMw1d7qm1h00/ukO92qrNnIXXl6S/bI519
	cBDxrVKwPKSs09TyMDW0eRWhmeE8Hz32wAa3iRa+CH3xMXyaarTba25zGPj00YOTvmAeaVi5oGUHP
	zf+1hBA8nl3W4Q5zuMS+TFpVNgH/fKaXvKuFTGn9q0IldkuFOBr+70fkNcqdTk+Umj4oUmrSMdw8J
	6eRLHSdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ2Th-0000000BoAc-2F0T;
	Tue, 24 Dec 2024 10:49:29 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ2P5-0000000BnBV-1Ojo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 10:44:44 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4362bae4d7dso36397995e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Dec 2024 02:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735037082; x=1735641882; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I2Qn39K4UzsLsLGtfNH0/R87UIS/L19Vs2Fn7/eQxwo=;
        b=tAk61A024DZhQmm/APjGpfUUwtd66DSB/AcmRhuuTYou3Op6W1nPXz9HUKUTukTifd
         kgP6lSXW9jNJvqVt7SJcJscpcId0izjSjXkXf+7sB6tBegmYGrSk5pa2E+7rgpQUU/4C
         IuPajcjBXlBEkTL4tq7YPa80m2eLlrJlitzDiRWXe3RiOILEYIQZkmT9hJSXgUdU4nOn
         lPWuFnuzlu7XaeW4UCEBdb6GbYGrYlH4XlFW5k85bwMNas8cLNYkYzxagqOInmspK2p9
         Xwxuq7WGSZG/fCdK4l1pDfgsEV9O22BTkRhcaSyWSQH7f9WIyYNyX+07LIkfz0YP/Jbz
         AB7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735037082; x=1735641882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I2Qn39K4UzsLsLGtfNH0/R87UIS/L19Vs2Fn7/eQxwo=;
        b=uWezZ/F6JPzH0cP/V3uzW3+O8gaGgfv+hYZn4LhIkhkwX0PSZ49oRIoDkBBUer3pI4
         KSnRv2QL6wi+gcwZuFCjFkW/RsytWcAo8wLeK+kAPXF9e+cqLu2GdHWPcUClOG71U4Q1
         7RuWpaYU/ReNebK9LQ0kGb78VgxOm4XssjC9FOfnpRwcVggGC4howAKK664x1vugJ7lH
         ExcyZubz08j0XXARuHeDvSkqLctv7s4bMNdOV89Qp+rS9QL5OELrhajFNCKYcHcfg0Nh
         Hk2W2Jry1W0A1uJR+G6C5IKsAKDD4xHD49aqydTHy7mdZuzfN6fu8HfcQeF48A+vUTmN
         urpQ==
X-Gm-Message-State: AOJu0Yw/a/Hkv6NiIv2o4PgrvtOURpjB+lfB1rI3UglKAoV+lVXO/roW
	nVT/AMUO4dE/hzQOVcNc/MbMicd2IJ+QdzDMjKcfOkiDz5J9hoD9yE9wU0vuVtOJR5WnngGM13s
	B
X-Gm-Gg: ASbGncueDuICkMhMQY9y7vtSzLLjw9xCsaeuleAMHJyQMlYIEr8IYbWuEiepirI35hv
	xTY11fapU+ijbH6F1zEfJioH7CdVQiObQJM99vxwN3zm/bvyskLvMWg3YKd4WtvSsmxoYW12DNQ
	ksxbDMghnLZGKqjJa8F/LGDJV4B9WVoC89pAXC/Twy5QWZ95zUDC4MJLCNwFZi5WgmwjXwip87Y
	GOZ9oCN9TEn1+twwRqVbsQCcOXjzn5iezuI7a0eec7zvyKK92ekDfk=
X-Google-Smtp-Source: AGHT+IEPwGkn3TrrCW7UYR3VV36eBnjzsw1wNAbjqFQScWTBytZf17+BoI5sSqfPq7qT3qahHgFAcw==
X-Received: by 2002:a05:6000:184e:b0:385:ed1e:2105 with SMTP id ffacd0b85a97d-38a221f2f0cmr14225299f8f.26.1735037081570;
        Tue, 24 Dec 2024 02:44:41 -0800 (PST)
Received: from pop-os.. ([145.224.66.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c847714sm13938184f8f.54.2024.12.24.02.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 02:44:41 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	irogers@google.com,
	yeoreum.yun@arm.com,
	will@kernel.org,
	mark.rutland@arm.com
Cc: robh@kernel.org,
	James Clark <james.clark@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>,
	Mike Leach <mike.leach@linaro.org>,
	Leo Yan <leo.yan@linux.dev>,
	Graham Woodward <graham.woodward@arm.com>,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Subject: [PATCH v2 2/5] perf tool: arm-spe: Pull out functions for aux buffer and tracking setup
Date: Tue, 24 Dec 2024 10:44:09 +0000
Message-Id: <20241224104414.179365-3-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241224104414.179365-1-james.clark@linaro.org>
References: <20241224104414.179365-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_024443_379354_896D07A2 
X-CRM114-Status: GOOD (  16.46  )
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

These won't be used in the next commit in discard mode, so put them in
their own functions. No functional changes intended.

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm64/util/arm-spe.c | 83 +++++++++++++++++-----------
 1 file changed, 51 insertions(+), 32 deletions(-)

diff --git a/tools/perf/arch/arm64/util/arm-spe.c b/tools/perf/arch/arm64/util/arm-spe.c
index 22b19dcc6beb..1b543855f206 100644
--- a/tools/perf/arch/arm64/util/arm-spe.c
+++ b/tools/perf/arch/arm64/util/arm-spe.c
@@ -274,33 +274,9 @@ static void arm_spe_setup_evsel(struct evsel *evsel, struct perf_cpu_map *cpus)
 		evsel__set_sample_bit(evsel, PHYS_ADDR);
 }
 
-static int arm_spe_recording_options(struct auxtrace_record *itr,
-				     struct evlist *evlist,
-				     struct record_opts *opts)
+static int arm_spe_setup_aux_buffer(struct record_opts *opts)
 {
-	struct arm_spe_recording *sper =
-			container_of(itr, struct arm_spe_recording, itr);
-	struct evsel *evsel, *tmp;
-	struct perf_cpu_map *cpus = evlist->core.user_requested_cpus;
 	bool privileged = perf_event_paranoid_check(-1);
-	struct evsel *tracking_evsel;
-	int err;
-
-	sper->evlist = evlist;
-
-	evlist__for_each_entry(evlist, evsel) {
-		if (evsel__is_aux_event(evsel)) {
-			if (!strstarts(evsel->pmu->name, ARM_SPE_PMU_NAME)) {
-				pr_err("Found unexpected auxtrace event: %s\n",
-				       evsel->pmu->name);
-				return -EINVAL;
-			}
-			opts->full_auxtrace = true;
-		}
-	}
-
-	if (!opts->full_auxtrace)
-		return 0;
 
 	/*
 	 * we are in snapshot mode.
@@ -330,6 +306,9 @@ static int arm_spe_recording_options(struct auxtrace_record *itr,
 			pr_err("Failed to calculate default snapshot size and/or AUX area tracing mmap pages\n");
 			return -EINVAL;
 		}
+
+		pr_debug2("%sx snapshot size: %zu\n", ARM_SPE_PMU_NAME,
+			  opts->auxtrace_snapshot_size);
 	}
 
 	/* We are in full trace mode but '-m,xyz' wasn't specified */
@@ -355,14 +334,15 @@ static int arm_spe_recording_options(struct auxtrace_record *itr,
 		}
 	}
 
-	if (opts->auxtrace_snapshot_mode)
-		pr_debug2("%sx snapshot size: %zu\n", ARM_SPE_PMU_NAME,
-			  opts->auxtrace_snapshot_size);
+	return 0;
+}
 
-	evlist__for_each_entry_safe(evlist, tmp, evsel) {
-		if (evsel__is_aux_event(evsel))
-			arm_spe_setup_evsel(evsel, cpus);
-	}
+static int arm_spe_setup_tracking_event(struct evlist *evlist,
+					struct record_opts *opts)
+{
+	int err;
+	struct evsel *tracking_evsel;
+	struct perf_cpu_map *cpus = evlist->core.user_requested_cpus;
 
 	/* Add dummy event to keep tracking */
 	err = parse_event(evlist, "dummy:u");
@@ -388,6 +368,45 @@ static int arm_spe_recording_options(struct auxtrace_record *itr,
 	return 0;
 }
 
+static int arm_spe_recording_options(struct auxtrace_record *itr,
+				     struct evlist *evlist,
+				     struct record_opts *opts)
+{
+	struct arm_spe_recording *sper =
+			container_of(itr, struct arm_spe_recording, itr);
+	struct evsel *evsel, *tmp;
+	struct perf_cpu_map *cpus = evlist->core.user_requested_cpus;
+
+	int err;
+
+	sper->evlist = evlist;
+
+	evlist__for_each_entry(evlist, evsel) {
+		if (evsel__is_aux_event(evsel)) {
+			if (!strstarts(evsel->pmu->name, ARM_SPE_PMU_NAME)) {
+				pr_err("Found unexpected auxtrace event: %s\n",
+				       evsel->pmu->name);
+				return -EINVAL;
+			}
+			opts->full_auxtrace = true;
+		}
+	}
+
+	if (!opts->full_auxtrace)
+		return 0;
+
+	evlist__for_each_entry_safe(evlist, tmp, evsel) {
+		if (evsel__is_aux_event(evsel))
+			arm_spe_setup_evsel(evsel, cpus);
+	}
+
+	err = arm_spe_setup_aux_buffer(opts);
+	if (err)
+		return err;
+
+	return arm_spe_setup_tracking_event(evlist, opts);
+}
+
 static int arm_spe_parse_snapshot_options(struct auxtrace_record *itr __maybe_unused,
 					 struct record_opts *opts,
 					 const char *str)
-- 
2.34.1


