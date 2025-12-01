Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F04A2D116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 16:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T/5T6lo313puZ/SVQF0jyUpNeCSlBosPw8CY0HUbC1E=; b=QWSgPLnjUjBQijuF7VfuRutu0p
	WPHEm6OTQIIEnCedt92WoJ/eqyt27FDX7Ai74r86eInY2oz9BO/T/AL2o6kPX9NgGK1g4qIozYaZ6
	oKF+u+8eCPVlB5MDzUD3TDCBwdTpMWD197BTe4C7CsRf7II+21nrrph3gHfcNh1iyW0mGEX6B7VNC
	sIYSdKCdriNDvreuchJl1onteWU/gFOCKBcXm3Rabr0tcdNMuX3GrsvZ/1M7mE9P8n0Tgw4RcJYP5
	QIPIVaCl7gebcTDAxp1WQ8HgfIDhaQlRBUkduV2JawClIQ5kKwTAt2u4AyyZ89Gc/84ztqSv+GIND
	B4XAOa7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ6yG-00000004I29-2J8n;
	Mon, 01 Dec 2025 16:41:52 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ6yC-00000004HyD-24NE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 16:41:49 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-47755de027eso30016315e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 08:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764607307; x=1765212107; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T/5T6lo313puZ/SVQF0jyUpNeCSlBosPw8CY0HUbC1E=;
        b=RhsbbSHrriH2yo1l2GFYP0Ckezc+CIOnNdxS/gqOzBcHaASPZ7vf9gyFaoe3xC7nz0
         r+j3jZnCGZV/ANe2ycP13E/jNEscw7Y8BR90hZrKwvH9PIOVVaoflltyqoBQ2GogZPPi
         0P54aD9r11PGoYWis3A+acOhku954UZVySNWiyj3zk1raJG1UZIX2DoMaejg2ZmOmib3
         0acGhPvO/ulxdRa5DHXaX5kvNyrcohlc4MCd9ymr6jG1U0Fk2N/RaOgsgyrjmS0H2AJ+
         9HlR1ioMBb25A2Ndrskgv0gMlwxHvZ44Gt12R74MKP4UrZOESmkhF8+3oz8WCWIHWNck
         TdIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764607307; x=1765212107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T/5T6lo313puZ/SVQF0jyUpNeCSlBosPw8CY0HUbC1E=;
        b=hBqN2zFKgoVV3ow25bkywvBFkNdBP3wF3lRcEZc4EDAcgG5HTkphARXJg2Jy6eSbPC
         PZSoTPyYs2WIpSoGdCjnlKIcDifnwFjKkUvsQCn9oo1BqTRdCOKlipQhbsjc/NR0mYoK
         /VM3ErP1IbAiRYhV5FXsPWfM9GsmFUERrWCNz1yzdK7UQi/UxyUT1NdgN1GEJyLaxrt+
         5BgrMie+6C8H3iLzpuODBVU560+iUwEfCuAXpTtlhipiOpkwI7i+qshAEYNvk1T1uyh+
         UrECk5iU2mLEAsQ35TsgUBccWbSw0jj5SUGOBB86FtA+mv4+Fcb7O05+zCJGXNvifMO/
         Syag==
X-Forwarded-Encrypted: i=1; AJvYcCWXaLv3oVbirqirLMH6juzE/6lv9jbCi0f+Q7baDrwTQdinkWMkK/kejhODu8IO9KwAqXbAFioUsVSsUcXOwWJu@lists.infradead.org
X-Gm-Message-State: AOJu0YyUUCfdyt151Yup8ljTRkic97oOL00VAiyXvda3y3EAb0UxG6wn
	19so2MND8gPtJB2jA/lj+89JHEm6oRVdLDxnQqf2NbwWRkcOD6t4Z1hU/sGsOrmRuLw=
X-Gm-Gg: ASbGncsFGAqNxOG2CyUZxCCT8H/uw5MSqIxLW45/QlQb82160FnBpPTtFaZNjtg7FAN
	CFaJB33jZ/1GTzzpX6/7B5ymniUnhoj7ytVnIB+pppuA6oyaSVlHAvK7RfC4LcKfUKBM0VvIlsq
	4Q5NqBZZg7FJE/sK9QCWB0G6xcEere6hOs4NmmRpRDGXZv5eZpflQQUD4d1SP2HnZCfHVu63a8c
	2+JtmOITLgldgzB5rpBJi29rf6zL17JykXLFaASWCUSXlm0ADy0CiCfQWMOuc4zCaVUgHhmLPNO
	iPdmRXu291SOF4P5+KCgKwfGvuaY/29QEgsvd+i7FAke3kawgIC8a2mr1cQHwW7u6CCjHTBX3H7
	Qmt8vqb1ajzzOdqVlKzAAjEechoiEzo6emTH7yYaMbkj9iyluo9fWOXxiX+v8DfzGa9Ve2J1spV
	xKIBb7G+H1F8dhoOkNU4NR
X-Google-Smtp-Source: AGHT+IEE3voa2OXjkQohxBlLJHCO8n9F+sDfMVLCHbry/3Vx/3/QnGHskYaS+QvFk8/708DyHCFFKQ==
X-Received: by 2002:a05:600c:3587:b0:471:131f:85aa with SMTP id 5b1f17b1804b1-47904aecfd9mr268721295e9.13.1764607306655;
        Mon, 01 Dec 2025 08:41:46 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4791164d4f3sm255901275e9.13.2025.12.01.08.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 08:41:46 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 01 Dec 2025 16:41:06 +0000
Subject: [PATCH 3/7] perf cs-etm: Make a helper to find the Coresight evsel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-james-perf-config-bits-v1-3-22ecbbf8007c@linaro.org>
References: <20251201-james-perf-config-bits-v1-0-22ecbbf8007c@linaro.org>
In-Reply-To: <20251201-james-perf-config-bits-v1-0-22ecbbf8007c@linaro.org>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, John Garry <john.g.garry@oracle.com>, 
 Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_084148_554513_9B2249E6 
X-CRM114-Status: GOOD (  16.40  )
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

This pattern occurs a few times and we'll add another one later, so add
a helper function for it.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c | 50 +++++++++++++++++++++------------------
 1 file changed, 27 insertions(+), 23 deletions(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index ea891d12f8f4..22c6272e8c36 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -302,6 +302,19 @@ static int cs_etm_set_sink_attr(struct perf_pmu *pmu,
 	return 0;
 }
 
+static struct evsel *cs_etm_get_evsel(struct evlist *evlist,
+				      struct perf_pmu *cs_etm_pmu)
+{
+	struct evsel *evsel;
+
+	evlist__for_each_entry(evlist, evsel) {
+		if (evsel->core.attr.type == cs_etm_pmu->type)
+			return evsel;
+	}
+
+	return NULL;
+}
+
 static int cs_etm_recording_options(struct auxtrace_record *itr,
 				    struct evlist *evlist,
 				    struct record_opts *opts)
@@ -476,29 +489,21 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
 
 static u64 cs_etm_get_config(struct auxtrace_record *itr)
 {
-	u64 config = 0;
 	struct cs_etm_recording *ptr =
 			container_of(itr, struct cs_etm_recording, itr);
 	struct perf_pmu *cs_etm_pmu = ptr->cs_etm_pmu;
 	struct evlist *evlist = ptr->evlist;
-	struct evsel *evsel;
+	struct evsel *evsel = cs_etm_get_evsel(evlist, cs_etm_pmu);
 
-	evlist__for_each_entry(evlist, evsel) {
-		if (evsel->core.attr.type == cs_etm_pmu->type) {
-			/*
-			 * Variable perf_event_attr::config is assigned to
-			 * ETMv3/PTM.  The bit fields have been made to match
-			 * the ETMv3.5 ETRMCR register specification.  See the
-			 * PMU_FORMAT_ATTR() declarations in
-			 * drivers/hwtracing/coresight/coresight-perf.c for
-			 * details.
-			 */
-			config = evsel->core.attr.config;
-			break;
-		}
-	}
-
-	return config;
+	/*
+	 * Variable perf_event_attr::config is assigned to
+	 * ETMv3/PTM.  The bit fields have been made to match
+	 * the ETMv3.5 ETRMCR register specification.  See the
+	 * PMU_FORMAT_ATTR() declarations in
+	 * drivers/hwtracing/coresight/coresight-perf.c for
+	 * details.
+	 */
+	return evsel ? evsel->core.attr.config : 0;
 }
 
 #ifndef BIT
@@ -832,12 +837,11 @@ static int cs_etm_snapshot_start(struct auxtrace_record *itr)
 {
 	struct cs_etm_recording *ptr =
 			container_of(itr, struct cs_etm_recording, itr);
-	struct evsel *evsel;
+	struct evsel *evsel = cs_etm_get_evsel(ptr->evlist, ptr->cs_etm_pmu);
+
+	if (evsel)
+		return evsel__disable(evsel);
 
-	evlist__for_each_entry(ptr->evlist, evsel) {
-		if (evsel->core.attr.type == ptr->cs_etm_pmu->type)
-			return evsel__disable(evsel);
-	}
 	return -EINVAL;
 }
 

-- 
2.34.1


