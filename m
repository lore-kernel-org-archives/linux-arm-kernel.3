Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A7FE677E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 15:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2iYsj2HXEXbwN0vBYKJUN3Lkbk015SqHZecYgVjo6J0=; b=oi77J/6Guf4YbnzWl7fiNEeZ3J
	8CFuvOZaZLPfwmPA36rOs5rajH/DVkYRPykQWLvtlfsgEOIrkderzYcSmR2MvFIyNN92pRXYUEKul
	aufjIAimzOnUqKAP5laViL8Ym/WhJWujQCn6cNCt3gAZzAjIp5NwRqMMl7cuzSoBxH+LI0vtlCrch
	71RtnpXNl29cejEe1D5z8pOtp5uqrF89CAERhP0WSMvPfToAr8X7v/S4sOma/dsHBAPvFON9W773y
	u6NDMBaLkffB5iFwva0C/WC/ScYkMlxdw1oQ16zNqsHnLnOIvIngYMZFvyHyr9EZBAtlLTnHQJym3
	dCTZJqJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXhce-0000000Dtif-06L4;
	Mon, 22 Dec 2025 15:14:56 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXhcZ-0000000Dtfx-1akV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 15:14:52 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-430f57cd471so2202024f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 07:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766416489; x=1767021289; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2iYsj2HXEXbwN0vBYKJUN3Lkbk015SqHZecYgVjo6J0=;
        b=HJRYBRtjkDXdVhDEgqqA8ihP4mTisdLeAzRNHDHiH4rJB4JSWGOd8krSjBcbU2ftX9
         cZA1B4sUCeiawVS6EA29g3tTnBNHvdaS+lmD+7i98kgrp9OnU5r1t8adBvx8tcZjoS0U
         mZ3ELR+km6ap7sfnrpjlGZBRJ++n9Eo2GzyHQKl0LkazE9RJUgPD/DMJPfpY/JMOT/28
         9unvz5mtXEj3UCitl9RvcN7xcIhXHeAfLmKbo2Zd20ugFzv0nhiDphBrPWKjSZ4vjX/H
         p7x2tIkAZCNzQ7cCVsTLNpQIoR3rhNM2BBAj+T+N7nXu0TWi/InrLGcdjya3yRALQ33Z
         NtSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766416489; x=1767021289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2iYsj2HXEXbwN0vBYKJUN3Lkbk015SqHZecYgVjo6J0=;
        b=PNIKSooGS4FDZtSiNuQOkTVduEdMD6iXsOBE+HVR7y00ftbzg59L2w9JF6rUAwbCGY
         oUq4VJ+ISEBibgGltwXvUjCAWVlcFMAGaS1NHS2t+GU23a3Y0HQHLyhepUOUQyCSRsSo
         SuI/lbfEh7f8vM9TRfiOqiJMin9tOBTDyHuPmvywMq21QlCorIFri3dF5+aSe1HEo8dZ
         XE1JR3PPrrlwqSBF/aTP6wDZoMj6uAYwTG8A/68w9/3hknNm8aE9Istm3ZXIPcgTvkFZ
         AQ4yJxSHXEsMoZJF9dE3M5ACDucQlbgXptJ1u4sJt91D3RQnIXzBzF8gXKwCSUNthfBD
         jCyw==
X-Forwarded-Encrypted: i=1; AJvYcCUZpJFwiqHxiYHqlvQYVH4UYGtgLkyYsqsnX1JW5+uUk0Ema6V7l2t11RYIoW19gsWIfhhbNCnRAGJy85tmn4aW@lists.infradead.org
X-Gm-Message-State: AOJu0YxqQOopSfiHcQGdGORJBz12apyzCp2x5s+HFI7PVK/mIub7RrlL
	dRsNliYizeFmz79V9RHTekQHin4zaFwTQGYjuzorZHWsHhrBqXHCLO2YKpBEEtq2XrI=
X-Gm-Gg: AY/fxX7QEBp8vhD1Ee7Ug3sLjjUnelhTajN4WrqWxHaG7ld82zAxAylohA8yw1tlrMI
	9Y17pl6ZpSGS2+U/WViuywYvs28003d18MyEsz6S/7/Bouhpy6bltDlfwgWN3tKB/vwYXUpT1L2
	P2GOfXRoYKDvyS/RJ2nt9I7JpUtiJxAyWT9QFsHYZeAXf9x/MOYhYw3PDs3mlxlU7IprXFvyKzo
	Q9MdH3waUip3W4sC2dvuC8zsyUAZNNdn8eeLdOdTWtCKIT4ReZVeDMFC3uSHk+cvjmJW442uzN7
	ZYTAngcbn9jZLjx67qMo5fa1VfQNZDuT2c7nX1Dll2puGqAM07coR4BDlc5mCJafH2uXUo5vufY
	m/nPuLAlIQtdA5899DBQA3f4GP40eGz+2XOR/+IYfNkOBO0KsdVXVU3ySpfEck39M0XBzbTHC30
	tKb9+ir2srdc5nwENVCrbXIMaUF44SuHc=
X-Google-Smtp-Source: AGHT+IGLZG6rDLL8DZTvheHrtZ8wcdGMWVbVjIluTaogXPZPgmpF6avXPlRYPjqEHI5VM9k96uhutw==
X-Received: by 2002:a05:6000:26cb:b0:430:fcbb:2e6b with SMTP id ffacd0b85a97d-4324e4d2d51mr14009093f8f.27.1766416488996;
        Mon, 22 Dec 2025 07:14:48 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea830fesm22750093f8f.20.2025.12.22.07.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 07:14:48 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 22 Dec 2025 15:14:27 +0000
Subject: [PATCH v4 02/14] perf evsel: Refactor evsel__set_config_if_unset()
 arguments
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-james-perf-config-bits-v4-2-0608438186fc@linaro.org>
References: <20251222-james-perf-config-bits-v4-0-0608438186fc@linaro.org>
In-Reply-To: <20251222-james-perf-config-bits-v4-0-0608438186fc@linaro.org>
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
X-CRM114-CacheID: sfid-20251222_071451_449813_ECDFC2B7 
X-CRM114-Status: GOOD (  16.73  )
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

Make the evsel argument first to match the other evsel__* functions
and remove the redundant pmu argument, which can be accessed via evsel.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c    | 9 +++------
 tools/perf/arch/arm64/util/arm-spe.c | 2 +-
 tools/perf/arch/x86/util/intel-pt.c  | 3 +--
 tools/perf/util/evsel.h              | 4 ++--
 tools/perf/util/pmu.c                | 6 +++---
 5 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index ea891d12f8f4..c28208361d91 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -441,10 +441,8 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
 	 * when a context switch happened.
 	 */
 	if (!perf_cpu_map__is_any_cpu_or_is_empty(cpus)) {
-		evsel__set_config_if_unset(cs_etm_pmu, cs_etm_evsel,
-					   "timestamp", 1);
-		evsel__set_config_if_unset(cs_etm_pmu, cs_etm_evsel,
-					   "contextid", 1);
+		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", 1);
+		evsel__set_config_if_unset(cs_etm_evsel, "contextid", 1);
 	}
 
 	/*
@@ -453,8 +451,7 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
 	 * timestamp tracing.
 	 */
 	if (opts->sample_time_set)
-		evsel__set_config_if_unset(cs_etm_pmu, cs_etm_evsel,
-					   "timestamp", 1);
+		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", 1);
 
 	/* Add dummy event to keep tracking */
 	err = parse_event(evlist, "dummy:u");
diff --git a/tools/perf/arch/arm64/util/arm-spe.c b/tools/perf/arch/arm64/util/arm-spe.c
index d5ec1408d0ae..51014f8bff97 100644
--- a/tools/perf/arch/arm64/util/arm-spe.c
+++ b/tools/perf/arch/arm64/util/arm-spe.c
@@ -274,7 +274,7 @@ static void arm_spe_setup_evsel(struct evsel *evsel, struct perf_cpu_map *cpus)
 	 */
 	if (!perf_cpu_map__is_any_cpu_or_is_empty(cpus)) {
 		evsel__set_sample_bit(evsel, CPU);
-		evsel__set_config_if_unset(evsel->pmu, evsel, "ts_enable", 1);
+		evsel__set_config_if_unset(evsel, "ts_enable", 1);
 	}
 
 	/*
diff --git a/tools/perf/arch/x86/util/intel-pt.c b/tools/perf/arch/x86/util/intel-pt.c
index b394ad9cc635..c131a727774f 100644
--- a/tools/perf/arch/x86/util/intel-pt.c
+++ b/tools/perf/arch/x86/util/intel-pt.c
@@ -664,8 +664,7 @@ static int intel_pt_recording_options(struct auxtrace_record *itr,
 		return 0;
 
 	if (opts->auxtrace_sample_mode)
-		evsel__set_config_if_unset(intel_pt_pmu, intel_pt_evsel,
-					   "psb_period", 0);
+		evsel__set_config_if_unset(intel_pt_evsel, "psb_period", 0);
 
 	err = intel_pt_validate_config(intel_pt_pmu, intel_pt_evsel);
 	if (err)
diff --git a/tools/perf/util/evsel.h b/tools/perf/util/evsel.h
index a08130ff2e47..2cf87bc67df7 100644
--- a/tools/perf/util/evsel.h
+++ b/tools/perf/util/evsel.h
@@ -575,8 +575,8 @@ void evsel__uniquify_counter(struct evsel *counter);
 	((((src) >> (pos)) & ((1ull << (size)) - 1)) << (63 - ((pos) + (size) - 1)))
 
 u64 evsel__bitfield_swap_branch_flags(u64 value);
-void evsel__set_config_if_unset(struct perf_pmu *pmu, struct evsel *evsel,
-				const char *config_name, u64 val);
+void evsel__set_config_if_unset(struct evsel *evsel, const char *config_name,
+				u64 val);
 
 bool evsel__is_offcpu_event(struct evsel *evsel);
 
diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index 956ea273c2c7..e87c12946d71 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -1382,8 +1382,8 @@ bool evsel__is_aux_event(const struct evsel *evsel)
  * something to true, pass 1 for val rather than a pre shifted value.
  */
 #define field_prep(_mask, _val) (((_val) << (ffsll(_mask) - 1)) & (_mask))
-void evsel__set_config_if_unset(struct perf_pmu *pmu, struct evsel *evsel,
-				const char *config_name, u64 val)
+void evsel__set_config_if_unset(struct evsel *evsel, const char *config_name,
+				u64 val)
 {
 	u64 user_bits = 0, bits;
 	struct evsel_config_term *term = evsel__get_config_term(evsel, CFG_CHG);
@@ -1391,7 +1391,7 @@ void evsel__set_config_if_unset(struct perf_pmu *pmu, struct evsel *evsel,
 	if (term)
 		user_bits = term->val.cfg_chg;
 
-	bits = perf_pmu__format_bits(pmu, config_name);
+	bits = perf_pmu__format_bits(evsel->pmu, config_name);
 
 	/* Do nothing if the user changed the value */
 	if (bits & user_bits)

-- 
2.34.1


