Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F30D116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 16:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FfR7ElwjGMeri5/LxymMctivyxTyAEttbJyLwb22O4o=; b=Hd76Zp7Q6ARIvkapiKKTOOyyxd
	8wlicttpJb+hqceTYMdGsVA2s65NKEsfExPiYsNb8VB7tV49wOzsgs+OjzFSXRP0JHSmdrg2f/9qt
	Cu1eggKez77JXTUx9hi+9ATyLovbqAcN9ixLkbSNCfJieCPUSlsLEfTFXhGbgb20RDsxfbWqUTpwV
	mAGvB75b3lc6btbXj2Q1/AfqmqWwLjGnI6orzbAArODyuti+MsIMl+bbXAMjdZ9RXlFpV68oy6ufh
	EQzO1J4BG4tJHx3CpzKHmaT07IpCkr6AscaRlsQivTtELtHtFKTFNlDagOBeos9SePXMoH29K/UnS
	L78MrwjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ6yC-00000004Hyf-1YyR;
	Mon, 01 Dec 2025 16:41:48 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ6yA-00000004HxT-0bug
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 16:41:47 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so32039215e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 08:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764607304; x=1765212104; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FfR7ElwjGMeri5/LxymMctivyxTyAEttbJyLwb22O4o=;
        b=LygM3xJrXXGBZiZUEDjJqleciygfW/OYAI+FeAQWiiC9rSXzQVZoP0Z/y5YWlrnTOf
         BrWf/qjjByO9lWt17DzzVH0DmtGTPPK5ZJE6Yc0zPdaqUWEdTqOjDf12xLhE8Xs+MelM
         mPnDnHS7fO1fx4vFIjtMluXiWED09AxC/jmxxLbnm9/udwHIMMBxA1wlIzvzsnnKF63v
         1VD0d03blZ2JfkTnkxEviaNyGkKIuxIUJvRKa8Ac9gkU7IkpCMahn8zsW2pdrdOV7dGP
         zIfQAPCpcO04i6bnEpA0NDjeLvPnhyAO5P3K259nyU5xkG6IuvZAwnn4h5g72suKOys1
         c1yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764607304; x=1765212104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FfR7ElwjGMeri5/LxymMctivyxTyAEttbJyLwb22O4o=;
        b=v+S8NC00XNkNvDQh3xG4WpWsXsbD4QJijXEs2u7zZrK+o7FTI8WJkhIvJbxrm4wOav
         NfheaItfNvBXT+bXUDBGM09AIbgmmd71OPsMCnzpXwfKm/EadG5oJHiWWXlvy9e2JRFB
         bdIfJ8j3CCMJNgWpD5hohq98SObbO8zMgOBJ/up14VcnxFWRWTHB3b5Ny6fw2w6mmnUm
         IqNwVjSTVOR44lPhm0BXxAA5aEk6nmdrJJTH2btqiOom7MQu/Q4e7P6HiXrUo7vsPqZI
         lK/8DSgcPVFDeOLfrLGdTs725WIdHxDWgbMgZMIqyGu61SGmA3KlkrEwMEuw89aRQckr
         htNg==
X-Forwarded-Encrypted: i=1; AJvYcCUUBRuaDgANgnge2Rif9qR0pJnMHPDAgUJEt4hzWkGI87Vcq0306oFViyMpn+tfG2xSn6Xb6CXJ9ySxSDtRrt4U@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi3RqOHoFyu0OYkcP5a3Fug/4gb6sCjidOa8hln/TB4OoUim48
	6a45F4eUxdq7nWKlq6vI8i0PeJB/3LgcPKdUTm+er8YTK/Iup4euIXLYR/GE/DDbn1o=
X-Gm-Gg: ASbGncviosENzA8hYtPoyeA0Lt2u9JhRpwTXZkMaI7EBWfrCLapB0VmOeaPjRh/XYGr
	y9oAo+p0eSW/DvQkZLuhxRs7LKw0Jk5TLFS4E9RKY4xXMxO8k8srovl6l7N76GS99Y8PZS/ZoJ9
	jo2CGjQxAtgYwebbhwEVprlz7p5oa4mCvZQjygPXuVCO4p9q24spu0/JHDNnIcfJwcd6ACL66Hd
	tBSNTA4Nf4vWAOnTLmGJnKWyFFhsNeUsNgynpIbQNIXKSfkp8lvanL1FkQzQH2nK/OUiuuh4zeI
	wfuub2ZhIjxbdUY0jDS+wcxkqJRxDqn5XJpeehbPZtRh5stuEM8ir8TmVHgZH9W1ZtCXVmUPRVR
	w2fCApur8e+x9OwpRRkbd1I6k25VuLhvGQjwUoNeffU+dCvCvRWNRwZNGYPDtIUcLsHSQCHsuRP
	zNNR6y8PLhMLh07KBsuny3j2FwCLjZYfU=
X-Google-Smtp-Source: AGHT+IFs/oaEFLmVc1n33HTh9cmjBtXa2KO56yE2ZPb/iAdAngVrwNGZgh5ta3HeUo0YoAjxOysIHA==
X-Received: by 2002:a05:600c:3511:b0:476:d494:41d2 with SMTP id 5b1f17b1804b1-477c112f7b1mr386734245e9.29.1764607304153;
        Mon, 01 Dec 2025 08:41:44 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4791164d4f3sm255901275e9.13.2025.12.01.08.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 08:41:43 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 01 Dec 2025 16:41:04 +0000
Subject: [PATCH 1/7] perf tools: Track all user changed config bits
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-james-perf-config-bits-v1-1-22ecbbf8007c@linaro.org>
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
X-CRM114-CacheID: sfid-20251201_084146_226597_F6ECA144 
X-CRM114-Status: GOOD (  18.47  )
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
 tools/perf/util/parse-events.c | 89 +++++++++++++++++-------------------------
 tools/perf/util/pmu.c          |  2 +-
 4 files changed, 47 insertions(+), 56 deletions(-)

diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
index aee42666e882..40d68f346007 100644
--- a/tools/perf/util/evsel.c
+++ b/tools/perf/util/evsel.c
@@ -1238,7 +1238,11 @@ static void evsel__apply_config_terms(struct evsel *evsel,
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
index bcd3a978f0c4..b38190dc5a40 100644
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
index 17c1c36a7bf9..f1cc6e96a371 100644
--- a/tools/perf/util/parse-events.c
+++ b/tools/perf/util/parse-events.c
@@ -1235,63 +1235,46 @@ do {								\
 	return 0;
 }
 
+#define ADD_CONFIG_CHG(format_type, term_type, new_term)		\
+{									\
+	struct parse_events_term *term;					\
+	u64 bits = 0;							\
+	int type;							\
+									\
+	list_for_each_entry(term, &head_config->terms, list) {		\
+		if (term->type_term == PARSE_EVENTS__TERM_TYPE_USER) {  \
+			type = perf_pmu__format_type(pmu, term->config);\
+			if (type != format_type)			\
+				continue;				\
+			bits |= perf_pmu__format_bits(pmu, term->config); \
+		} else if (term->type_term == term_type) {		\
+			bits = ~(u64)0;					\
+		}							\
+	}								\
+									\
+	if (bits)							\
+		ADD_CONFIG_TERM_VAL(new_term, cfg_chg, bits, false);	\
+	return 0;							\
+}
+
 /*
- * Add EVSEL__CONFIG_TERM_CFG_CHG where cfg_chg will have a bit set for
- * each bit of attr->config that the user has changed.
+ * Add EVSEL__CONFIG_TERM_USR_CFG_CONFIGn where cfg_chg will have a bit set for
+ * each bit of attr->configN that the user has changed.
  */
-static int get_config_chgs(struct perf_pmu *pmu, struct parse_events_terms *head_config,
+static int get_config_chgs(struct perf_pmu *pmu,
+			   struct parse_events_terms *head_config,
 			   struct list_head *head_terms)
 {
-	struct parse_events_term *term;
-	u64 bits = 0;
-	int type;
-
-	list_for_each_entry(term, &head_config->terms, list) {
-		switch (term->type_term) {
-		case PARSE_EVENTS__TERM_TYPE_USER:
-			type = perf_pmu__format_type(pmu, term->config);
-			if (type != PERF_PMU_FORMAT_VALUE_CONFIG)
-				continue;
-			bits |= perf_pmu__format_bits(pmu, term->config);
-			break;
-		case PARSE_EVENTS__TERM_TYPE_CONFIG:
-			bits = ~(u64)0;
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
-		}
-	}
-
-	if (bits)
-		ADD_CONFIG_TERM_VAL(CFG_CHG, cfg_chg, bits, false);
+	ADD_CONFIG_CHG(PERF_PMU_FORMAT_VALUE_CONFIG,
+		       PARSE_EVENTS__TERM_TYPE_CONFIG, USR_CHG_CONFIG);
+	ADD_CONFIG_CHG(PERF_PMU_FORMAT_VALUE_CONFIG1,
+		       PARSE_EVENTS__TERM_TYPE_CONFIG1, USR_CHG_CONFIG1);
+	ADD_CONFIG_CHG(PERF_PMU_FORMAT_VALUE_CONFIG2,
+		       PARSE_EVENTS__TERM_TYPE_CONFIG2, USR_CHG_CONFIG2);
+	ADD_CONFIG_CHG(PERF_PMU_FORMAT_VALUE_CONFIG3,
+		       PARSE_EVENTS__TERM_TYPE_CONFIG3, USR_CHG_CONFIG3);
+	ADD_CONFIG_CHG(PERF_PMU_FORMAT_VALUE_CONFIG4,
+		       PARSE_EVENTS__TERM_TYPE_CONFIG4, USR_CHG_CONFIG4);
 
 #undef ADD_CONFIG_TERM
 	return 0;
diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index 1b7c712d8f99..7a7db31be70d 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -1384,7 +1384,7 @@ void evsel__set_config_if_unset(struct perf_pmu *pmu, struct evsel *evsel,
 				const char *config_name, u64 val)
 {
 	u64 user_bits = 0, bits;
-	struct evsel_config_term *term = evsel__get_config_term(evsel, CFG_CHG);
+	struct evsel_config_term *term = evsel__get_config_term(evsel, USR_CHG_CONFIG);
 
 	if (term)
 		user_bits = term->val.cfg_chg;

-- 
2.34.1


