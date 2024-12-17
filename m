Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E42A2E77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 11:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Swt8An6cH0UytiEm5BcU77Mv2Ddjr7IJCM9GFGK4Ig=; b=c33oOALQMzgRgqvjoyl1UtwdSV
	jBRvuzS5Hhp+06u1v6DIZQMl7SGPyJWYDvGgnBSLmCmQLSH12sv+AlFKMLtTwt0L2TeaicS9UNbjv
	XgOJnv4TXZeUttANIePsOBJ7/j2odngqiBkp/DnK/cbt/DBuzQIp79zNrKU5mUTDTzyxQcgP4RVZ5
	DpvtoLanYsZauzDuF9uk5SA50bU7OJnHtRtS/vCTeaOqnE57PPsVkwhHF73AtTufhtzw53r8YQDVi
	8go2AFaDcYjPmqvzhF7d+I6JG5vn1NGMdA8HrBaw4hsiiPqkh+uWUs94uztSKvntLwd19WxeQNZND
	7zCuhPjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNWEm-0000000DKSv-2Tga;
	Tue, 17 Dec 2024 11:59:40 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNWBi-0000000DJiv-1YiE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 11:56:31 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso36004785e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 03:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734436589; x=1735041389; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Swt8An6cH0UytiEm5BcU77Mv2Ddjr7IJCM9GFGK4Ig=;
        b=gB5aRSpO5WNIB6jamHPK5SBkROfe7JOWn8DXyLgnw+CaWOMBKrgQQzcwXjU7F82Ykn
         TAGH2HOW9Y/ayjqx8Wv7FoC1dnc69PSpys4yAYyqZOgrPuOZka/0djfH9R1FvRGX2ZMj
         6SBiYTMVFvgeSUUUI5WPBy9wAGOt0KOJMRDI+/Z9XcsgH2yvuLOOQBlojFoDNdgGf7Y+
         Qe7pu/v1najQg3CvvKXWbRqkWHsPxSyKDhxUci54ZZufCbHb6FZ1CdKUWO0Bz34m/3l6
         QW+5JWgHFpa9gVegdtvWqP2hDIefZq5gnB57kexnUVWQkG7FXMVnkpQlAW/0K+97IpM1
         XwLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734436589; x=1735041389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Swt8An6cH0UytiEm5BcU77Mv2Ddjr7IJCM9GFGK4Ig=;
        b=EYBqqMhDWxQSrra4LF7tkxaWOANS+cOfR+02Csy/Ip/m/MX+IYS0puieYIsmdGXqJ4
         UiVK4M2MK4M4YsxWZuVTYgH/b7ZN44WMCd/d9tdu7pX0kmAiq6MYUULLl4btpseciA3w
         I4qvOWLTgYIzL6MJ9I4do6s8/Pq7Uw3kZO55XBb83xGiYvi27sEKEUhrESCb03O4ekX9
         eGVwv4EzT3fgXh2UOaaiKRfcvRvqAtNIOXodzI3sjoYLrW76bmxAu6uT5hoBZaRVzT6W
         v/e6FBCqYc9tKgXxwd0N4VIusum3TjS/kxWB2LoMi1CDPqwgpE7KebmazFCSAoPIZekm
         jPYA==
X-Gm-Message-State: AOJu0YzZ9PlHwPcYjMcC5eFNbRSxXtNDUl2X+EpWB3NVzI0cQ41RMk5b
	IPkosr5B0YytnhwjSDdLUDiMMwqIOKe8KVpbFTd7oiCFcCdx3uTjqZJKtfbk9hcEyb3HDC1GhjX
	I
X-Gm-Gg: ASbGncvLlmmh9lKG08GQSUrotlp6Y+vNarzxGL47v2wlKcuZrLK6wxyeNf27o+Wct3g
	7XW8YJr2laxLBU3S4xPV5Vxd6lEHaFvhlEo+Nk3TZzOTu+OhAHkjuNlezW1tsToCslDCPukkqlr
	H07a8oLMO0tXefdhQZCoQMZqJVrYRMC9cmwga2eNEgFi8O+TKW/tjRdpJhoXg0Q74IhlagwdRBB
	NFzSpZfuM/ZeY22KpTRDPk/uHZ7J9MFjhYEHxzEDbaPu9oHVrYT6qGC
X-Google-Smtp-Source: AGHT+IHYPBPQkQDRXyVGehPAmC7A1dmxHnikbhEhvzazvTv4q/sZtDwu0z2Pco+deD3aSmH2xXPBEw==
X-Received: by 2002:a05:6000:1f82:b0:385:ed16:cac with SMTP id ffacd0b85a97d-3889ad33ff4mr10801795f8f.56.1734436589050;
        Tue, 17 Dec 2024 03:56:29 -0800 (PST)
Received: from pop-os.. ([145.224.66.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436360159aasm114935825e9.6.2024.12.17.03.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 03:56:28 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Cc: James Clark <james.clark@linaro.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>,
	Mike Leach <mike.leach@linaro.org>,
	Leo Yan <leo.yan@linux.dev>,
	Graham Woodward <graham.woodward@arm.com>,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Subject: [PATCH 2/5] perf tool: arm-spe: Pull out functions for aux buffer and tracking setup
Date: Tue, 17 Dec 2024 11:56:05 +0000
Message-Id: <20241217115610.371755-3-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217115610.371755-1-james.clark@linaro.org>
References: <20241217115610.371755-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_035630_422423_AFA3AD94 
X-CRM114-Status: GOOD (  17.23  )
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


