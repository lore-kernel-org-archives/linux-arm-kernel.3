Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F332AD37E5F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 15:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=41HNGLiNRNt3A8GGSfSayOntB8acpqhbS5SlmFJ/Hg4=; b=fnUb7tjnYSppOeM6TN2zQamBFV
	6yunxQdb+1x1sb+Dx32mi0PsHvtdEb1DNBeSaOw48ZhQeXZajd27zG1cZkAScSBDqHLFitO080nZI
	3R3FgXKTXrLP7YzZKvg2kTkPobKrdVw5335yEhagMjCiYYOl2FaBVn0ckl/HzOGap6xnYsO0aYISV
	R38fSKlhbG8nvBGXzsgSzyqunQi/HB28eiwaSxFR3mMtYVJgjAmakHWiTQiV8qs9GG+pXBs0P3up8
	DZqgCNUjZPBIduxPdq1g7IByn+cgeqZSeTH0jK8Dd6JXqNyuhT3aqTXAT/FM3TKnNtuQVqUvl5Ioy
	flH6ci0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3Ft-00000009oFM-1B32;
	Wed, 14 Jan 2026 15:57:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3Fk-00000009o69-13v8
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Jan 2026 15:57:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=41HNGLiNRNt3A8GGSfSayOntB8acpqhbS5SlmFJ/Hg4=; b=U2oolSY32KRRMCtwRCoM+MekQa
	jHljRRsjPQnojuisn/uJ0uWcxVpbXPTLsnSEfSZZgpDIdLiXhkN77mKgHYscCg6F/u/LeAoseC3nO
	a3+Jt+kOxzMEZkJmgf+mWhnQOuk0wPaKpFKyGMg2SrJsO9xv6zzIlqeT2fnvjJPQrX6Pfc3K75atk
	vLhOKR35MC6w8S7CiLs8amYaoWt1aVUhyfDgvBbPT+gGnR8VcyNLhGbqBxDegf2y1lj7N+1pe6c5y
	O9cmyxnb11fWMXC7XAes4/d5rypXSEbe683OIdLzc5LFLPbrInclQ7LBlAJc5V6iH3iCWooAY0DqH
	Ob0qUfZw==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3Fh-00000005BJS-0e0H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 15:57:47 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-47bdbc90dcaso60200705e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 07:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768406263; x=1769011063; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=41HNGLiNRNt3A8GGSfSayOntB8acpqhbS5SlmFJ/Hg4=;
        b=qgxRbJrEi0EWwvx4SicyjUs4w97BrLN34s3Zt2cLnn6LhIgjaTcUoSOEHiCW5mE6bb
         JGNpIy+u6R0odd2MtlgdueHchAbKvxdTPaOCl7UHiNSUCW7OXtn1WS93VTUdCQC0Acrf
         b/SvCitlbN21ihVYSqiXHR04yhdGPFt8sXmKCY8SNGzRtjtta1CMI0R3ngpTfqrc/bt+
         cDUQFO9nuBH1ylCUCy9n5BK2vFx9deeUXKODBVKiiMjciKhw4PXtyvOnLechGOHTxjzW
         5qErUiwDeo6gEHHfKwvltLcFZwba7WRckRprohktqrXW1pZ7XZAANlTv9jcy0MEvjQWZ
         qIYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768406263; x=1769011063;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=41HNGLiNRNt3A8GGSfSayOntB8acpqhbS5SlmFJ/Hg4=;
        b=WQlGPoJzP/esbGeWO01PiPP27l3QT6bmCky5NQs5EAJkpcs3MLXcf/YURIB6US0Wkl
         hh9i625cB8vht+CwpZnNpk5VcH4rxORuLIhxybE2h27DOVFAGt5fZzA8TUfYng0MtFPB
         2CWm4jgSFZCyQROTrhjMa3krzyTbRfqIRTuKe7c+qFvAQXy8pJ3k+nhPY2Pec0EBGpUE
         kdCJ6vWMJwOFEbfMb6KAZJs9VFGJdUer5BluNHQ6wOfxAlTBDwse/9Ud1ACzSIxo6LNE
         ZUBOWL5wK0ziLFJuchWY6/RQYvjnXSHOWfIEt+ks2f04bdsQa/l7qT+sIqnsWPyTIzuq
         ZZYA==
X-Forwarded-Encrypted: i=1; AJvYcCXhO35eu0GMor3ponqpQMRYJ0S8clT0IFz2vRvL80Dwn+0H8x0pdKWqygIhou/V8U0nr7b2rasYABvSwuNXT+8a@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4bBNriGL8xRB84VF6bbmnCTLqoS5H2vu3dwQmxRvyM7d95fjI
	qIHX5ZQeOw7fr1WFwx7mF4jsjYW8LSaFuSt2p8IqbuKKLgL8KbxuW9ycLC33yINoUqw=
X-Gm-Gg: AY/fxX6freDSZAFSb5CW12IoYMm/Z3XT0qTTNWQG7KocKiWL98C0sNy7coSNEMLfJzJ
	zjLdmi19Zxko16sHSNj/XjA6nKlZUL6lYMTM15oqnBJpENvH1UH7uMykPyWWIws/Q7kRRfIKP9M
	OPx33ChRBMNPZ6BbMff1iGA25Ti3kbB8zzEthcmroRWFeO0M3TYYQUTzqJA3zVKFCh3yIH+gOj5
	IUpvpo+Wi6cfMDsVd57UHdM5Zdt4sb2pl8pmlnyMYcjyjzW640huFs7ayl3xaTfh0pQ/zwmPv/3
	NMwKT5kA4kuj174plegeXMxX4Ka7DVpHk9EvtswXdvF6PyuV6ootBDfUS7rgqfa8yi7u9NH8457
	zoqiN5AZ2ekVWE7DBIG0zYjkU6oN5sB0xYYBL7Z2a7goqCA22CF879Gsv+ROyEaKXTvof296kj2
	fqbqfchbJ3N5m2zplurVB+rssME73KrB0=
X-Received: by 2002:a05:600c:8b2f:b0:479:3a86:dc1e with SMTP id 5b1f17b1804b1-47ee4840941mr32659375e9.36.1768406263009;
        Wed, 14 Jan 2026 07:57:43 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee85e8807sm7426475e9.16.2026.01.14.07.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:57:42 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 14 Jan 2026 15:57:17 +0000
Subject: [PATCH v5 05/14] perf parse-events: Track all user changed config
 bits
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-james-perf-config-bits-v5-5-0ef97aaf1ac0@linaro.org>
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
X-CRM114-CacheID: sfid-20260114_155745_294825_48D12721 
X-CRM114-Status: GOOD (  18.68  )
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

Currently we only track which bits were set by the user in attr->config.
But all configN fields should be treated equally as they can all have
default and user overridden values.

Track them all by making get_config_chgs() generic and calling it once
for each config value.

Reviewed-by: Ian Rogers <irogers@google.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/evsel.c        |  9 +++-
 tools/perf/util/evsel_config.h |  6 ++-
 tools/perf/util/parse-events.c | 98 +++++++++++++++++++++++-------------------
 tools/perf/util/pmu.c          |  4 +-
 tools/perf/util/pmu.h          |  4 +-
 5 files changed, 70 insertions(+), 51 deletions(-)

diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
index 9ef94632106b..27f4b5212dc6 100644
--- a/tools/perf/util/evsel.c
+++ b/tools/perf/util/evsel.c
@@ -1242,7 +1242,11 @@ static void evsel__apply_config_terms(struct evsel *evsel,
 		case EVSEL__CONFIG_TERM_AUX_SAMPLE_SIZE:
 			/* Already applied by auxtrace */
 			break;
-		case EVSEL__CONFIG_TERM_CFG_CHG:
+		case EVSEL__CONFIG_TERM_USR_CHG_CONFIG:
+		case EVSEL__CONFIG_TERM_USR_CHG_CONFIG1:
+		case EVSEL__CONFIG_TERM_USR_CHG_CONFIG2:
+		case EVSEL__CONFIG_TERM_USR_CHG_CONFIG3:
+		case EVSEL__CONFIG_TERM_USR_CHG_CONFIG4:
 			break;
 		case EVSEL__CONFIG_TERM_RATIO_TO_PREV:
 			rtp_buf = term->val.str;
@@ -1326,7 +1330,8 @@ void evsel__set_config_if_unset(struct evsel *evsel, const char *config_name,
 				u64 val)
 {
 	u64 user_bits = 0;
-	struct evsel_config_term *term = evsel__get_config_term(evsel, CFG_CHG);
+	struct evsel_config_term *term = evsel__get_config_term(evsel,
+								USR_CHG_CONFIG);
 	struct perf_pmu_format *format = pmu_find_format(&evsel->pmu->format,
 							 config_name);
 	int fbit;
diff --git a/tools/perf/util/evsel_config.h b/tools/perf/util/evsel_config.h
index 685fd8d5c4a8..7b565d76c0bc 100644
--- a/tools/perf/util/evsel_config.h
+++ b/tools/perf/util/evsel_config.h
@@ -27,7 +27,11 @@ enum evsel_term_type {
 	EVSEL__CONFIG_TERM_AUX_OUTPUT,
 	EVSEL__CONFIG_TERM_AUX_ACTION,
 	EVSEL__CONFIG_TERM_AUX_SAMPLE_SIZE,
-	EVSEL__CONFIG_TERM_CFG_CHG,
+	EVSEL__CONFIG_TERM_USR_CHG_CONFIG,
+	EVSEL__CONFIG_TERM_USR_CHG_CONFIG1,
+	EVSEL__CONFIG_TERM_USR_CHG_CONFIG2,
+	EVSEL__CONFIG_TERM_USR_CHG_CONFIG3,
+	EVSEL__CONFIG_TERM_USR_CHG_CONFIG4,
 	EVSEL__CONFIG_TERM_RATIO_TO_PREV,
 };
 
diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
index 46422286380f..1f6e2213326d 100644
--- a/tools/perf/util/parse-events.c
+++ b/tools/perf/util/parse-events.c
@@ -1253,66 +1253,32 @@ static int get_config_terms(const struct parse_events_terms *head_config,
 	return 0;
 }
 
-/*
- * Add EVSEL__CONFIG_TERM_CFG_CHG where cfg_chg will have a bit set for
- * each bit of attr->config that the user has changed.
- */
-static int get_config_chgs(struct perf_pmu *pmu, struct parse_events_terms *head_config,
-			   struct list_head *head_terms)
+static int add_cfg_chg(const struct perf_pmu *pmu,
+		       const struct parse_events_terms *head_config,
+		       struct list_head *head_terms,
+		       int format_type,
+		       enum parse_events__term_type term_type,
+		       enum evsel_term_type new_term_type)
 {
 	struct parse_events_term *term;
 	u64 bits = 0;
 	int type;
 
 	list_for_each_entry(term, &head_config->terms, list) {
-		switch (term->type_term) {
-		case PARSE_EVENTS__TERM_TYPE_USER:
+		if (term->type_term == PARSE_EVENTS__TERM_TYPE_USER) {
 			type = perf_pmu__format_type(pmu, term->config);
-			if (type != PERF_PMU_FORMAT_VALUE_CONFIG)
+			if (type != format_type)
 				continue;
 			bits |= perf_pmu__format_bits(pmu, term->config);
-			break;
-		case PARSE_EVENTS__TERM_TYPE_CONFIG:
+		} else if (term->type_term == term_type) {
 			bits = ~(u64)0;
-			break;
-		case PARSE_EVENTS__TERM_TYPE_CONFIG1:
-		case PARSE_EVENTS__TERM_TYPE_CONFIG2:
-		case PARSE_EVENTS__TERM_TYPE_CONFIG3:
-		case PARSE_EVENTS__TERM_TYPE_CONFIG4:
-		case PARSE_EVENTS__TERM_TYPE_LEGACY_HARDWARE_CONFIG:
-		case PARSE_EVENTS__TERM_TYPE_LEGACY_CACHE_CONFIG:
-		case PARSE_EVENTS__TERM_TYPE_NAME:
-		case PARSE_EVENTS__TERM_TYPE_SAMPLE_PERIOD:
-		case PARSE_EVENTS__TERM_TYPE_SAMPLE_FREQ:
-		case PARSE_EVENTS__TERM_TYPE_BRANCH_SAMPLE_TYPE:
-		case PARSE_EVENTS__TERM_TYPE_TIME:
-		case PARSE_EVENTS__TERM_TYPE_CALLGRAPH:
-		case PARSE_EVENTS__TERM_TYPE_STACKSIZE:
-		case PARSE_EVENTS__TERM_TYPE_NOINHERIT:
-		case PARSE_EVENTS__TERM_TYPE_INHERIT:
-		case PARSE_EVENTS__TERM_TYPE_MAX_STACK:
-		case PARSE_EVENTS__TERM_TYPE_MAX_EVENTS:
-		case PARSE_EVENTS__TERM_TYPE_NOOVERWRITE:
-		case PARSE_EVENTS__TERM_TYPE_OVERWRITE:
-		case PARSE_EVENTS__TERM_TYPE_DRV_CFG:
-		case PARSE_EVENTS__TERM_TYPE_PERCORE:
-		case PARSE_EVENTS__TERM_TYPE_AUX_OUTPUT:
-		case PARSE_EVENTS__TERM_TYPE_AUX_ACTION:
-		case PARSE_EVENTS__TERM_TYPE_AUX_SAMPLE_SIZE:
-		case PARSE_EVENTS__TERM_TYPE_METRIC_ID:
-		case PARSE_EVENTS__TERM_TYPE_RAW:
-		case PARSE_EVENTS__TERM_TYPE_CPU:
-		case PARSE_EVENTS__TERM_TYPE_RATIO_TO_PREV:
-		default:
-			break;
 		}
 	}
 
 	if (bits) {
 		struct evsel_config_term *new_term;
 
-		new_term = add_config_term(EVSEL__CONFIG_TERM_CFG_CHG,
-					   head_terms, false);
+		new_term = add_config_term(new_term_type, head_terms, false);
 		if (!new_term)
 			return -ENOMEM;
 		new_term->val.cfg_chg = bits;
@@ -1321,6 +1287,50 @@ static int get_config_chgs(struct perf_pmu *pmu, struct parse_events_terms *head
 	return 0;
 }
 
+/*
+ * Add EVSEL__CONFIG_TERM_USR_CFG_CONFIGn where cfg_chg will have a bit set for
+ * each bit of attr->configN that the user has changed.
+ */
+static int get_config_chgs(const struct perf_pmu *pmu,
+			   const struct parse_events_terms *head_config,
+			   struct list_head *head_terms)
+{
+	int ret;
+
+	ret = add_cfg_chg(pmu, head_config, head_terms,
+			  PERF_PMU_FORMAT_VALUE_CONFIG,
+			  PARSE_EVENTS__TERM_TYPE_CONFIG,
+			  EVSEL__CONFIG_TERM_USR_CHG_CONFIG);
+	if (ret)
+		return ret;
+
+	ret = add_cfg_chg(pmu, head_config, head_terms,
+			  PERF_PMU_FORMAT_VALUE_CONFIG1,
+			  PARSE_EVENTS__TERM_TYPE_CONFIG1,
+			  EVSEL__CONFIG_TERM_USR_CHG_CONFIG1);
+	if (ret)
+		return ret;
+
+	ret = add_cfg_chg(pmu, head_config, head_terms,
+			  PERF_PMU_FORMAT_VALUE_CONFIG2,
+			  PARSE_EVENTS__TERM_TYPE_CONFIG2,
+			  EVSEL__CONFIG_TERM_USR_CHG_CONFIG2);
+	if (ret)
+		return ret;
+
+	ret = add_cfg_chg(pmu, head_config, head_terms,
+			  PERF_PMU_FORMAT_VALUE_CONFIG3,
+			  PARSE_EVENTS__TERM_TYPE_CONFIG3,
+			  EVSEL__CONFIG_TERM_USR_CHG_CONFIG3);
+	if (ret)
+		return ret;
+
+	return add_cfg_chg(pmu, head_config, head_terms,
+			   PERF_PMU_FORMAT_VALUE_CONFIG4,
+			   PARSE_EVENTS__TERM_TYPE_CONFIG4,
+			   EVSEL__CONFIG_TERM_USR_CHG_CONFIG4);
+}
+
 int parse_events_add_tracepoint(struct parse_events_state *parse_state,
 				struct list_head *list,
 				const char *sys, const char *event,
diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index 7967d9159742..dc5dab69151f 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -1349,7 +1349,7 @@ struct perf_pmu_format *pmu_find_format(const struct list_head *formats,
 	return NULL;
 }
 
-__u64 perf_pmu__format_bits(struct perf_pmu *pmu, const char *name)
+__u64 perf_pmu__format_bits(const struct perf_pmu *pmu, const char *name)
 {
 	struct perf_pmu_format *format = pmu_find_format(&pmu->format, name);
 	__u64 bits = 0;
@@ -1364,7 +1364,7 @@ __u64 perf_pmu__format_bits(struct perf_pmu *pmu, const char *name)
 	return bits;
 }
 
-int perf_pmu__format_type(struct perf_pmu *pmu, const char *name)
+int perf_pmu__format_type(const struct perf_pmu *pmu, const char *name)
 {
 	struct perf_pmu_format *format = pmu_find_format(&pmu->format, name);
 
diff --git a/tools/perf/util/pmu.h b/tools/perf/util/pmu.h
index 3a53e1882cf1..7655d996090a 100644
--- a/tools/perf/util/pmu.h
+++ b/tools/perf/util/pmu.h
@@ -272,8 +272,8 @@ int perf_pmu__config_terms(const struct perf_pmu *pmu,
 			   struct parse_events_terms *terms,
 			   bool zero, bool apply_hardcoded,
 			   struct parse_events_error *error);
-__u64 perf_pmu__format_bits(struct perf_pmu *pmu, const char *name);
-int perf_pmu__format_type(struct perf_pmu *pmu, const char *name);
+__u64 perf_pmu__format_bits(const struct perf_pmu *pmu, const char *name);
+int perf_pmu__format_type(const struct perf_pmu *pmu, const char *name);
 int perf_pmu__check_alias(struct perf_pmu *pmu, struct parse_events_terms *head_terms,
 			  struct perf_pmu_info *info, bool *rewrote_terms,
 			  u64 *alternate_hw_config, struct parse_events_error *err);

-- 
2.34.1


