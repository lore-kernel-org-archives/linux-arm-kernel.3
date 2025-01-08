Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EFDE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 14:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I2Qn39K4UzsLsLGtfNH0/R87UIS/L19Vs2Fn7/eQxwo=; b=zmXynLlICIbbCcQhGOwO6HpkQP
	Fl0a1GZtlFuOHjfVAcYKR01pOZzM2eJLSrmPTeMVUJPmwtMaFbbETk+fIKnL/ukdDdbkL6/moT7Wi
	2i9yv5SdWENS4Ia3KMInvyZgWt6osY2o70ITpehnhRXoWBkbaq21HAeK5t+5Q5RAYSnY9V7Sp/mQi
	7n5byJT7fs1Ov5CJr8unGTmPakKRxHzL45AG626B53Ts63WAV5uqwwsGNKnhBpENji5pcZbnx5Oiq
	to4hCuC0Ya0xlYy2CYwfO7iNqU/sEziIhUObotW3aaaoXOqXOm9YTlJh9pnoYNHqNg4rd2gMJYDdk
	b30KzJhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVX9J-00000008oHu-3CHC;
	Wed, 08 Jan 2025 14:35:09 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVX4i-00000008nHB-3i6g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 14:30:26 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-436a03197b2so67975035e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 06:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736346623; x=1736951423; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I2Qn39K4UzsLsLGtfNH0/R87UIS/L19Vs2Fn7/eQxwo=;
        b=XikPvjTcA2yTQoN94U0dPq9jBucApivp9VmPsOaCQH6dZSliv7TTfcd/AzgOE5QkY3
         QrDoNR6pW3RFuGex0pyW52cImMFIlA7DkkGVhRKVbh21fRwir6TUNm8OcsJc02ql78gx
         ZT8T2LP0QfGzQQ9EUI1UX2ooysPZhBM5kGggVIlhwoPfgFA5QFBURpUHjxVkgDCd8WtW
         S51kSgTmNoiFY0dokzYQvZfpPB5DlIZJzsh2LdzOZGTSPq8uEO62KC1r65EhBQjxC135
         jTFq9N3rLJl4VGoZFVQW2IZlrAqy/grOunq/C1R2Ql7OAs/8u8vtV34wEJTt0Hu2Tu8T
         gVZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736346623; x=1736951423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I2Qn39K4UzsLsLGtfNH0/R87UIS/L19Vs2Fn7/eQxwo=;
        b=UJDldrfEdUum7xo86k7nhCqAcjGR9ItrOppC0yv4oFqoLgfX8fm1VxTMdQlld3mciW
         RP53R0xEgPy7DFpbpAaC08t1LxQSrhotsTaEFoBMf7TRsSWEA5sfDndBYwo8SmekY8qL
         yLMM6vmNSF2FlP6fQbbQJSPOjpPgcIv4BlQYB3YncgqZrog8AaRoJCJfykYz+ygZdrpx
         Za6CM3CJKzyuHTeH2ezGtD1ZuMmFKRTG9qUifI/pEMXzCEOh696/6URW/cqG+PvjdlYL
         JEFOI+TGIxQZ0Q3DujlAel3B8SOHlZUlE7Ta9H0dkcXR+UqF4AXFkX5CEMJbkfTydZnX
         suKQ==
X-Gm-Message-State: AOJu0YxCAh5pqTkASZF4BVloRbGiJGXgR7TgEefsZBddXH1+gZoZSwyT
	sKj985SDXMb8dgNDTXrDhg3jCJaPX+v46sR4amHpU4YhLwXIfstWriher52X8majpcYfw8HdBxh
	D
X-Gm-Gg: ASbGncv+sJ1MD8CS/dmICvwXDhXnAU3xuBSItnK+otQxGwwEJkzJf/WopiEH0cxwK2R
	jOK5bAXB3u7Y1MOnGAoY2AbdLUrKBYBc1ngmt+CuK0KflOM4Q4x2xdWtR62RD6rX+oHKNHsGUix
	cxP0gpvOge1rxxbvenIVi86BNW91yk0LneTmw2oyRvm91fW4+SF0zefvJSK9hzOERz5CBSHp2GX
	TxnLgN9440XfRGOWpTXXtl4VC4mq0aesCTen3YA/FVyCC38jYbT1Fpz
X-Google-Smtp-Source: AGHT+IHQgK8+Yd3JtaxOPOoCOGtnBLuVZ6/cDODvDBysXN7o1PBIvyAUjmPV1obXseFT3h2tmvjLfA==
X-Received: by 2002:a05:600c:468a:b0:434:a968:89a3 with SMTP id 5b1f17b1804b1-436e26a78a4mr26241125e9.9.1736346623428;
        Wed, 08 Jan 2025 06:30:23 -0800 (PST)
Received: from pop-os.. ([145.224.90.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2ddccf4sm22836965e9.19.2025.01.08.06.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 06:30:23 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	irogers@google.com,
	yeoreum.yun@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	namhyung@kernel.org,
	acme@kernel.org
Cc: robh@kernel.org,
	James Clark <james.clark@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>,
	Mike Leach <mike.leach@linaro.org>,
	Leo Yan <leo.yan@linux.dev>,
	Graham Woodward <graham.woodward@arm.com>,
	Michael Petlan <mpetlan@redhat.com>,
	Veronika Molnarova <vmolnaro@redhat.com>,
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
	Thomas Richter <tmricht@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Subject: [PATCH v3 3/5] perf tool: arm-spe: Pull out functions for aux buffer and tracking setup
Date: Wed,  8 Jan 2025 14:28:58 +0000
Message-Id: <20250108142904.401139-4-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250108142904.401139-1-james.clark@linaro.org>
References: <20250108142904.401139-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_063024_943035_D0370E6A 
X-CRM114-Status: GOOD (  16.76  )
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


