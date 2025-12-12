Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC257D59D66
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 15:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xSulanRhWm+TOJEsIJX6kByj32cTVV8wVNthl+pdTvs=; b=IMEOYRK+vIDq8AwxHKL15lNAfr
	v6pBUvL8B0AiyE+heAZGVBv+a2CcC+5N6scZzkQ9+rOsLq3e2YnpyLfnRrPZak6N50jIBFy06fMjn
	15IjDs7WoBzHT+wB1feYK1hXxEXzaTdCTZfC4wb90AoG4ac6mW+nGcv68fF5tc/xfvDmtJgrjLLB9
	1PXIAWUw71NI7tUAbzM73HOo4izFYX/0788/64muzmD/cMHXQATbMGwXvNA4qeY85yJ1jb1wVL+RX
	hFCIyBTwHIvw3SQ5ySW/PTfLP4R4p+PjUCLiNFgqDd6/n8TM8KziZ2hqrk+KF+m7fwX1xRdV5RhxG
	jL3/Q50Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU58Z-00000000j7O-44cF;
	Fri, 12 Dec 2025 15:32:55 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU58T-00000000j3h-1rPj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 15:32:54 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-63c489f1e6cso2746395a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 07:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765553567; x=1766158367; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xSulanRhWm+TOJEsIJX6kByj32cTVV8wVNthl+pdTvs=;
        b=aBxKeYtjkap4CJNrwGYV8BWfQPogNQ03iZ2IfcIuVEAsMY+G+/1V5awMB/0zuVSxUO
         gaDvh+cV0u59MoDP81Dx2hYarA6IYwWDlLtIONPIGJLqK67YxXU8U6xECIwn5Ok6PQp2
         Blcg+3btCs83QIc4Gnv6ARQ+Dy6VSzAOyMY+Whzp9KecTn6V2RMwXffluBrBN+xtoVp1
         C4wlh/A6c6ptI+wyuvdexkvdBryaGKi6ay6jCMAivbSqQBVKWhyLuEY7B24ujGInElxm
         lm1SaT3slsRrncS5LFviuWAEEJBYQsJKbhlrzGmjlZ52kzmw/5fcW8oiGrV92ibLH4rW
         QLDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765553567; x=1766158367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xSulanRhWm+TOJEsIJX6kByj32cTVV8wVNthl+pdTvs=;
        b=ErdljOj7Ta3yaZ+g4pZ6cfIvMSk4E4mOQEgLZ02uHaJg0AfW9FA/SzzvmLz7R9OKM4
         1iUFKGSl4v0dYlK7UtHBsNNsaEAWXTIPGyLT8zYTjwUx/iSHqhiFU0XDWmb7Le09NKJF
         iBBIFKlYY4oOREwdO575SezuA/YljeF0j0mmMV6G2apfITZqRmMZYDqCTUKqUGDpeuTy
         32HqXEknbr46TaQX0ULpeJJ6TiQsTfGALy5MLcTyHZippCrWDvh79CcURacj16YrOtv/
         9Mxh/D6sam6XBHbs5/9Ks9Q1kRadSZf8KgsPyomhZuzkBB4bCZ5jP7ByuckDFPNo+AMj
         q7qw==
X-Forwarded-Encrypted: i=1; AJvYcCVT0VY7zvPMW+mpraXEIx/KjGLCLnk+7Mp0BDjMss7iY0qGMFh94Xn26WZUXlc8ccNbqpOhRchlEfjN4lBS3LLc@lists.infradead.org
X-Gm-Message-State: AOJu0YzhjzPSMKWSNcRidM6fAm5j6LuyCv7joYuQmqXzmOsPNOnPi/bI
	zvZRder4GXUQGe0867qLbgfBl0XtAOhDNKi6jqxpEizMoucL5tYDCnIkaWxbjt7Az4A=
X-Gm-Gg: AY/fxX7pokPLJY/DmWXAxrklmE69DtTeySTgE1s1IxsP+/6VsvZtAWX160VNoeVW/d0
	lzaiPi+T5vSGaMziqN1XdN88EyPQPLSU72ps58+RUisPi7xqKTqEQf2qknHqZsv0GPZBc8/FAk3
	7UxjFwWDtw7d5kzg0pahCiQxsMZ9BYHM+0DPPzX8DClR/4h6HoyT9X5lF5FhhrMHn4aY7TrlpLl
	A/MjeXSv65kTtMga0gena2RwJQYHgk0Q0lsMQxFauGxtMcpgiviTkRsJx+QtR/mJY8JHIl7GSy2
	DzlpdxTGGoA3zBrn00lM4ImQjVbZGsxuTvKtqK9Kkgz1AkZ/GDn2SDbVGG0fFMIAF8WYSqdX9uY
	+hAAAUcRpbOMnVXrBTR4KvFHHt2nVQibtzljA3r4m0N6ptd3nLpaYW/MULcM9ykcoPczZejKddq
	zW5hC1yReeaaHWw9nvNCh2
X-Google-Smtp-Source: AGHT+IE0jsBzIwoiXf1j1BrrX+hYReRJK59uu92Fpw79dVuN+GXXuARzuNi4SxAAGM0C7gWCzIiRtA==
X-Received: by 2002:aa7:c642:0:b0:640:931e:ccac with SMTP id 4fb4d7f45d1cf-6498745a2a9mr3880322a12.7.1765553567457;
        Fri, 12 Dec 2025 07:32:47 -0800 (PST)
Received: from e133063.arm.com ([130.185.218.160])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6498210ed32sm5433234a12.29.2025.12.12.07.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 07:32:46 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Fri, 12 Dec 2025 17:32:20 +0200
Subject: [PATCH v3 03/12] perf parse-events: Track all user changed config
 bits
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-james-perf-config-bits-v3-3-aa36a4846776@linaro.org>
References: <20251212-james-perf-config-bits-v3-0-aa36a4846776@linaro.org>
In-Reply-To: <20251212-james-perf-config-bits-v3-0-aa36a4846776@linaro.org>
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
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_073249_528989_6E13E758 
X-CRM114-Status: GOOD (  17.75  )
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

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/evsel.c        |  6 ++-
 tools/perf/util/evsel_config.h |  6 ++-
 tools/perf/util/parse-events.c | 98 +++++++++++++++++++++++-------------------
 tools/perf/util/pmu.c          |  2 +-
 4 files changed, 65 insertions(+), 47 deletions(-)

diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
index 9cd706f6279313c2cc53eba1adbd45f352090f75..dcadf022405d398bf394b3da7f0db5c81a3ec268 100644
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
diff --git a/tools/perf/util/evsel_config.h b/tools/perf/util/evsel_config.h
index 685fd8d5c4a88fb8ae601ded60c1fc36dde73403..7b565d76c0bc4277effbbf950110986b423f571c 100644
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
index 46422286380f33a48087e7079a45bb21beb2d573..7ef63b808d0542999fd1303b9f94cae68e38030f 100644
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
+static int add_cfg_chg(struct perf_pmu *pmu,
+		       struct parse_events_terms *head_config,
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
+static int get_config_chgs(struct perf_pmu *pmu,
+			   struct parse_events_terms *head_config,
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
index 2c26c8d76bed920c7b5b43beb867e4d1bcaa2970..e02f74d4020c151082ecc434c29c0ec4c2c9b2c8 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -1387,7 +1387,7 @@ void evsel__set_config_if_unset(struct perf_pmu *pmu, struct evsel *evsel,
 				const char *config_name, u64 val)
 {
 	u64 user_bits = 0, bits;
-	struct evsel_config_term *term = evsel__get_config_term(evsel, CFG_CHG);
+	struct evsel_config_term *term = evsel__get_config_term(evsel, USR_CHG_CONFIG);
 
 	if (term)
 		user_bits = term->val.cfg_chg;

-- 
2.34.1


