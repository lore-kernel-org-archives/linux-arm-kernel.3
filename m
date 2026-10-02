Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207E7CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 11:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OUfzXk7gzJEOddY/hfe9OLAQHpkFenB0R/fhaQZ1l64=; b=4DaPxhnP50EVeKMCRtcUHS08Pl
	Ny22enL8u5ZCkei1pkZwsIVJrzNL5dPqiVj/fzPH45jom3GZDr4B3u+9PlRKYy6I4WbC4zrQfBIvF
	NenqyIebMj0RXLclsVjQ2n+M+hXp9oxV/L5kGeS+JKtjmRyv4lBRgtxckNo2VEwJZKIkWeIc0AX0/
	JlWmkiFp8GXq/ft5RI6KSxS7c+f1aiRC5TSgC+hVEJIWB/kFLHnwrf3uBPLxaAnz6OwoVoI0ba73v
	d2XyT2yfBzZWannPr1ZZ44EvwX89PZpHx8MLHybABrgGEJuojoZt0h/kU7cBMmNA65UKda3OHV+Zz
	BTjth84Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCbEo-0000000BS9h-1O8w;
	Fri, 02 Oct 2026 11:15:38 +0000
Received: from mail-wr2-x0e.google.com ([2a00:1450:4864:30::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCbEj-0000000BS64-2gI5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 11:15:36 +0000
Received: by mail-wr2-x0e.google.com with SMTP id ffacd0b85a97d-48afd5b1678so1596655f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 04:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790939732; x=1791544532; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OUfzXk7gzJEOddY/hfe9OLAQHpkFenB0R/fhaQZ1l64=;
        b=Bkc1LN3XK3v/6kugETFWz+8swc4mI0VO2cyhAK9yoJtiMeB1dJxGLO4Z/4cROunkyZ
         vkug1H4AT/5C9ORQe8SgREmIdYre0qiu6zyDXObIZLO6yJNVU3D5ULUu22CtelNYeYWu
         NjHaS998yXxfKj176wzakIAnpele4H2b2qqQ6K+fwDg1toCzWGA9l6Sc91+ipDVs3bpq
         5LTpHaz+T8ieMjIS8GDbJinFl202ld2DBuMmxuHjaOvwIAUkAgkBSroe6g4+QYy+JhMU
         BulYmkijIi4yyjdaZGQacIQxuU/eDE+jHNQk3p06/errZ1zy90WO6bz7Mst04Ru8aBn7
         ay+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790939732; x=1791544532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OUfzXk7gzJEOddY/hfe9OLAQHpkFenB0R/fhaQZ1l64=;
        b=cIf2k2MaZIRyQeb5DHaHqEjrSsArhgKioVoIz34+5GQMKSrMEKIlu9TvNbwCtGGMWc
         lLp1D/PLM5KmTR7DxJ08D9Qeu3PaFo8j+PE2yoCJ2gVG3fyyjzZtZ9yLjABoP5OC0+Ld
         ER/6WOaf+LeBpQWEpj5GMuace0KgUntM3DyM8koUdGZm3xJGMqZlXXB9APaALJB5ZVvG
         Tkd8Ct6Blm2lXlvlN3jWmRvbofxBrxy23+WAWkHdCw4ipPioF7BOsL897GOibXpWi1jP
         dD3oZrTpil/MQnZzyViYDc+ADvDiWsSRJj/uRzRr/NqSGlfaU9RfqOMNoDIqVI7Xa21P
         xFxw==
X-Forwarded-Encrypted: i=1; AKwUvBwcvS4wNI3DjPvyR99mAMIYF1JsRL/aycZgB0Wqx93WSoTdHuVm9ysLj43kYgAxHEyy/uQWw8r1vpOVIuFKsiwO@lists.infradead.org
X-Gm-Message-State: AFuF++mAsLEsduE+cv3BShZuD/4Ae1lve4ZJHreqA0yPYBybx/E29adV
	CjgJvl87ODa6I0Oyfe+rW32ESCYRmXDKTM+ewgm+KlZ87q0EnpM2VkeMpRX72MFO+7I=
X-Gm-Gg: AYBFou35nnCEzGrsxts/dfd/4MqhbKLWDMkwXetTUho7fZzkp8riHV4O58gURAFk9wW
	KAhEgN+kI9acRWYO1j/LJ/s/U7mjeRE8GVX62TkN6lqMnBMktqY18AnR0J48pmXNzyHDcR9qcyV
	sbpS6jbIBJkKqtwdk9gmyxYdjHfK2uwFUeRqy3bFyF3RNyRDz/vDfmSowM1F14Rz5Bx6rOKwVTc
	Kul00ldID7E4JYYtusyo4U/x1Q8ZiAnsIk2zshrhejfnCAKCGDma5Tjizz5E7cwLe1/PqDxgYry
	B1qCUhFottxLZ1BushdYkCB5eapVnx7juz1SbvBHXb62KkowMxuBjriGlHvJg/zjDLgg1zMaZX3
	cKWk0TFwVxsr+Wf4UrYk6al+1zxQfY06kMP2oBxeVnvbUmlRR7hROjXrAGK/DeKDkmXqJ+DHzj3
	aXc1mZb7N6UjKWh8FBE1dFJOoKGVDbaEOTRlUXaLPDSTiZBO9LNbAnm6TdPtlVog8kIMI647m6W
	A==
X-Received: by 2002:a05:600c:4e8e:b0:49f:ce78:3561 with SMTP id 5b1f17b1804b1-4a02759b360mr45109215e9.18.1790939731921;
        Fri, 02 Oct 2026 04:15:31 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38306dd4sm4752986f8f.43.2026.10.02.04.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 04:15:31 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 02 Oct 2026 12:15:14 +0100
Subject: [PATCH v3 4/4] perf: cs-etm: Respect --no-itrace option
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-james-cs-hw_id-output-failure-v3-4-1d8b6ef339c8@linaro.org>
References: <20261002-james-cs-hw_id-output-failure-v3-0-1d8b6ef339c8@linaro.org>
In-Reply-To: <20261002-james-cs-hw_id-output-failure-v3-0-1d8b6ef339c8@linaro.org>
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@linux.dev>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_041533_717931_E7FE6072 
X-CRM114-Status: GOOD (  22.58  )
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

If there is a bug in decoding then Perf will exit early and you can't
investigate by using the raw dump mode. Make the --no-itrace option stop
Coresight decoding after printing the aux header so decode errors don't
stop the rest of the samples being printed.

pmu_type and evsel_is_auxtrace need to be set so that the
unleader_auxtrace() behavior is the same as without --no-itrace.

Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/auxtrace.c |  2 +-
 tools/perf/util/auxtrace.h |  1 +
 tools/perf/util/cs-etm.c   | 66 +++++++++++++++++++++++++---------------------
 3 files changed, 38 insertions(+), 31 deletions(-)

diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
index ed2113190785..2557cbec37b3 100644
--- a/tools/perf/util/auxtrace.c
+++ b/tools/perf/util/auxtrace.c
@@ -123,7 +123,7 @@ static int evlist__regroup(struct evlist *evlist, struct evsel *leader, struct e
 	return 0;
 }
 
-static bool auxtrace__dont_decode(struct perf_session *session)
+bool auxtrace__dont_decode(struct perf_session *session)
 {
 	return !session->itrace_synth_opts ||
 	       session->itrace_synth_opts->dont_decode;
diff --git a/tools/perf/util/auxtrace.h b/tools/perf/util/auxtrace.h
index 5012bead1b92..c29a8444f08e 100644
--- a/tools/perf/util/auxtrace.h
+++ b/tools/perf/util/auxtrace.h
@@ -650,6 +650,7 @@ void auxtrace__free(struct perf_session *session);
 bool auxtrace__evsel_is_auxtrace(struct perf_session *session,
 				 struct evsel *evsel);
 u64 auxtrace_synth_id_range_start(struct evsel *evsel);
+bool auxtrace__dont_decode(struct perf_session *session);
 
 #define ITRACE_HELP \
 "				i[period]:    		synthesize instructions events\n" \
diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index c0152549e3e2..bdcf94813129 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -965,7 +965,7 @@ static int cs_etm__flush_events(struct perf_session *session,
 	struct cs_etm_auxtrace *etm = container_of(session->auxtrace,
 						   struct cs_etm_auxtrace,
 						   auxtrace);
-	if (dump_trace)
+	if (dump_trace || auxtrace__dont_decode(session))
 		return 0;
 
 	if (!tool->ordered_events)
@@ -3002,7 +3002,7 @@ static int cs_etm__process_event(struct perf_session *session,
 						   struct cs_etm_auxtrace,
 						   auxtrace);
 
-	if (dump_trace)
+	if (dump_trace || auxtrace__dont_decode(session))
 		return 0;
 
 	if (!tool->ordered_events) {
@@ -3552,27 +3552,49 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
 	int err = 0;
 	int aux_hw_id_found;
 	int i;
-	u64 *ptr = NULL;
+	u64 *ptr = (u64 *) auxtrace_info->priv;
 	u64 **metadata = NULL;
 
-	/* First the global part */
-	ptr = (u64 *) auxtrace_info->priv;
-	num_cpu = ptr[CS_PMU_TYPE_CPUS] & 0xffffffff;
+	etm = zalloc(sizeof(*etm));
+	if (!etm)
+		return -ENOMEM;
+
+	session->auxtrace = &etm->auxtrace;
+	etm->auxtrace.free = cs_etm__free;
+	etm->auxtrace.evsel_is_auxtrace = cs_etm__evsel_is_auxtrace;
+	etm->auxtrace.process_event = cs_etm__process_event;
+	etm->auxtrace.process_auxtrace_event = cs_etm__process_auxtrace_event;
+	etm->auxtrace.flush_events = cs_etm__flush_events;
+	etm->auxtrace.free_events = cs_etm__free_events;
+	etm->pmu_type = (unsigned int) ((ptr[CS_PMU_TYPE_CPUS] >> 32) & 0xffffffff);
+
+	/*
+	 * Don't go further than the minimum required to identify this event as
+	 * auxtrace with cs_etm__evsel_is_auxtrace() so unleader_auxtrace()
+	 * works.
+	 */
+	if (auxtrace__dont_decode(session))
+		return 0;
 
 	/*
 	 * Bound num_cpu by the event size: the global header consumes
 	 * CS_ETM_HEADER_SIZE bytes, and each CPU needs at least one u64
 	 * metadata entry after that.
 	 */
+	num_cpu = ptr[CS_PMU_TYPE_CPUS] & 0xffffffff;
 	priv_size = total_size - event_header_size - INFO_HEADER_SIZE -
 		    CS_ETM_HEADER_SIZE;
 	if (num_cpu <= 0 || priv_size <= 0 ||
-	    num_cpu > priv_size / (int)sizeof(u64))
-		return -EINVAL;
+	    num_cpu > priv_size / (int)sizeof(u64)) {
+		err = -EINVAL;
+		goto err_free_etm;
+	}
 
 	metadata = zalloc(sizeof(*metadata) * num_cpu);
-	if (!metadata)
-		return -ENOMEM;
+	if (!metadata) {
+		err = -ENOMEM;
+		goto err_free_etm;
+	}
 
 	/* Start parsing after the common part of the header */
 	i = CS_HEADER_VERSION_MAX;
@@ -3631,13 +3653,6 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
 		goto err_free_metadata;
 	}
 
-	etm = zalloc(sizeof(*etm));
-
-	if (!etm) {
-		err = -ENOMEM;
-		goto err_free_metadata;
-	}
-
 	/*
 	 * As all the ETMs run at the same exception level, the system should
 	 * have the same PID format crossing CPUs.  So cache the PID format
@@ -3647,7 +3662,7 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
 
 	err = auxtrace_queues__init_nr(&etm->queues, max_cpu + 1);
 	if (err)
-		goto err_free_etm;
+		goto err_free_metadata;
 
 	for (unsigned int j = 0; j < etm->queues.nr_queues; ++j) {
 		err = cs_etm__setup_queue(etm, &etm->queues.queue_array[j], j);
@@ -3685,7 +3700,6 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
 	etm->session = session;
 
 	etm->num_cpu = num_cpu;
-	etm->pmu_type = (unsigned int) ((ptr[CS_PMU_TYPE_CPUS] >> 32) & 0xffffffff);
 	etm->snapshot_mode = (ptr[CS_ETM_SNAPSHOT] != 0);
 	etm->metadata = metadata;
 	etm->auxtrace_type = auxtrace_info->type;
@@ -3712,14 +3726,6 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
 			    "you can specify the itrace option 'T' for timestamp decoding\n"
 			    "if the Coresight timestamp on the platform is same with the kernel time.\n\n");
 
-	etm->auxtrace.process_event = cs_etm__process_event;
-	etm->auxtrace.process_auxtrace_event = cs_etm__process_auxtrace_event;
-	etm->auxtrace.flush_events = cs_etm__flush_events;
-	etm->auxtrace.free_events = cs_etm__free_events;
-	etm->auxtrace.free = cs_etm__free;
-	etm->auxtrace.evsel_is_auxtrace = cs_etm__evsel_is_auxtrace;
-	session->auxtrace = &etm->auxtrace;
-
 	cs_etm__setup_timeless_decoding(etm);
 
 	etm->tc.time_shift = tc->time_shift;
@@ -3797,13 +3803,13 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
 
 err_free_queues:
 	cs_etm__free_queues(etm);
-	session->auxtrace = NULL;
-err_free_etm:
-	zfree(&etm);
 err_free_metadata:
 	/* No need to check @metadata[j], free(NULL) is supported */
 	for (int j = 0; j < num_cpu; j++)
 		zfree(&metadata[j]);
 	zfree(&metadata);
+err_free_etm:
+	session->auxtrace = NULL;
+	zfree(&etm);
 	return err;
 }

-- 
2.43.0


