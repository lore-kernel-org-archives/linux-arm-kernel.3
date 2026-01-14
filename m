Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B804D37E5E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 15:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2iYsj2HXEXbwN0vBYKJUN3Lkbk015SqHZecYgVjo6J0=; b=RxVUDr9GGBK2x1uTUwZ3OE4Thd
	gJOp36jtQaBe4EqeIRUraFQAw2mIVizzFYVKOsl5kdExHdWt7N+dGzuPWlL7Rm4e6FTxRRGtpCqg9
	Q0d2gLRWlXJs6VJIaAte3hWBHUVYsERQcuMu8Nb0xlbdsaoulTIKAXwDTnjLbQLM9jbtGiQvHe7cy
	srgLJNOlK8YgmoLYD3ODdc4IUPdZcVQvOAz9dK/aBMsS3E29Z5cOLVK4sp5eUyiWslpmLw2AHhHAw
	WQ0Ah2Kb30XGY4n/Yveyib9UFvsLqfvcsArkkE4EK2rfpYJsiopg/8MfTadB3n6DjtIl7jaRpnjJY
	1UwvbuMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3Fk-00000009o6d-0Boy;
	Wed, 14 Jan 2026 15:57:48 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3Fd-00000009o1Q-0Vja
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 15:57:45 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-47ee807a4c5so3876545e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 07:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768406259; x=1769011059; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2iYsj2HXEXbwN0vBYKJUN3Lkbk015SqHZecYgVjo6J0=;
        b=ppM5+cjUvmPvXhVkYqazUZyQ/8EoK8HGk03xFZeC3vHXmT7Jmu37KtA/X7P7YHzuhi
         gLL7st1KwNzwXW4eEIeaJUsxyH0DGrtp6Y6gty3BuF8rLcVe95hZRxP90T5teJIpmXfo
         vqdpFBmcvUEI/tGKZkjfkZKLo7cHUERJv4kPDnMa9FDRK65WCjUkCvI9l01aw3p8SPQB
         x2clDCNHHHHXtd0S5T4Ww21bedqLklEIFhyHUiOt5jpdTlmBtRqSrE3luUstdigHGu1V
         W2iQqlcK+adm/jWtn8kZXtdMsDwtU1WqIFn5+njMaSs8YJUkkpwtchUDYXnLhWM5aYFR
         QzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768406259; x=1769011059;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2iYsj2HXEXbwN0vBYKJUN3Lkbk015SqHZecYgVjo6J0=;
        b=mQlELoVHklXl+8Z+OWbHXV79rS0P3xh3GAfW3KwFN8BQpwQVfwikJS5+6YptOnoINF
         RqKkB4eqedJJAMeVpzMnhQuaFBSosQHBgIYUK7xGpMfJPLsV8vhHaHrcY1JVUc4SfM0v
         VfpWeaec52oK0IIkOZky5W8CIcidOPMCHkW+2jEQ5OF4GA2BvLBn9Lj9diviM/DeN1NM
         Vm4rS5xd2tbn9k8CS7Xu3NyXI03+mTsYv+vDLSzSEJ/IpKriX6tTZh0GK42WEcjUaznN
         PuIlzKltp/3e6q0Hbo/Rk+DISFvvr9mOZNNwrv3oO6BYAXtek/r/Zamqg0XULh8Ual9o
         O+cg==
X-Forwarded-Encrypted: i=1; AJvYcCUEY6OQeezpbSNJ0LnqvUWsHxFsCap2v7/eDsV7CxluBYkQgww83MMaMhE57hecO8oppUE4SbyK1wqjOEpNzWuo@lists.infradead.org
X-Gm-Message-State: AOJu0YyXQNAgsiTp2gojo69t9CxywFTxePhVuwxYscpjy8jEpM/iCHlv
	UnAYOo158Aq3lNE6Mxaf08iFcR3N6ZcHFlHg7ByknY2D7H8qpaj06lHqu2Od5WETK0U=
X-Gm-Gg: AY/fxX4Pq8HCPec8JfvIbgGcQ26xeD4HrdlWoGJjexmew9hBR90Kp0s1vk3ux4OEvff
	HSz0n3G7mISw/4ddfMSyUtXuJRiFhCyZULiMd/7kzwLRmWDRuf3AhBLCiOvTFRobuOlVepAs/6+
	6GdCTpemjGnaaGqCwDnTg2ZtqCtsQ5Es0/AdAOWZro6Snuy0n4tEGlUlF08GR+/JxVDHyGsNDmn
	M4TnEZrZttBjSNcNQ6vQ+Xe7DNAGstyBgp+8CjceWNNylqvB5TJ9iosIg2mlFaxXi0JoC0+LYlp
	BcJUDAsUDCfiWNbOD78q3wXaBPr9fS3sQX5NE64VnpH6g9soOWfjj4Xu1wpEUDjEObMFEfifAQH
	/eUCkn794+aYK/SvF42oerJJPLxTPJAUQOHlVC8Wk+1vCbD3lyPOim66a/QhtZp+bc/QuWvoOKM
	sRlmkQ/OkDLAAAOJT2IfpauAWCpXsJO2s=
X-Received: by 2002:a05:600c:a46:b0:47a:975b:e3e6 with SMTP id 5b1f17b1804b1-47ee3371a0amr41542255e9.18.1768406259151;
        Wed, 14 Jan 2026 07:57:39 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee85e8807sm7426475e9.16.2026.01.14.07.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:57:38 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 14 Jan 2026 15:57:14 +0000
Subject: [PATCH v5 02/14] perf evsel: Refactor evsel__set_config_if_unset()
 arguments
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-james-perf-config-bits-v5-2-0ef97aaf1ac0@linaro.org>
References: <20260114-james-perf-config-bits-v5-0-0ef97aaf1ac0@linaro.org>
In-Reply-To: <20260114-james-perf-config-bits-v5-0-0ef97aaf1ac0@linaro.org>
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
X-CRM114-CacheID: sfid-20260114_075741_219138_9388870A 
X-CRM114-Status: GOOD (  16.53  )
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


