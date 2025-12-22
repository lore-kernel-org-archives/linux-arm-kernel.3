Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E3BCE674B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 15:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LRxhQKZyRKVmSnLrclrpBhqFP+Noob/HLauI0TzjRkA=; b=wRoUtzqPzighFtoE1pfkYFf+yB
	vN2QGESGP8/C+dLVqk7Aq18cKtEM3Ws/gpT7LW7P6iE3oLekScdTf5bO320Q3sy2vVsCR0iseEwbu
	tpmaSDdj0fwurGN3Tl2pQiS13keSKVIKWoBVwu59QzL99BzYZ1UhPZRQy8qE143311rcd5lEH/zpi
	+7JrEGUKwsMKYsThdcPNtAddALWa5LR5Afpew8xRo3HFlTL4Fns3jeCzEHNcJXU+W4rFlp2QGdEst
	35o52/2A0uzT+TnD/u05X2+JH5b20HBLHdMHPJc7TsdP7CPQ5NT8fTqwtkS7+K49kVxgOYMsbDAfS
	YbjyW6zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXhcr-0000000Dtrt-3g9a;
	Mon, 22 Dec 2025 15:15:10 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXhcc-0000000DthB-1QeS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 15:14:55 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-42fed090e5fso1911878f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 07:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766416492; x=1767021292; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LRxhQKZyRKVmSnLrclrpBhqFP+Noob/HLauI0TzjRkA=;
        b=UmSnhicvi68qDNs2EeMXhnYRjFPtUOBk6EPPO1dhRysWsuMyoofcXqMK+wKpnMAd4M
         BuzbzosL0jV+4SLCUJIbYAyyMi4ybOipucHCGkSNh19/I89Pb2MYq6RwRYwwLVh3+DXv
         ma5ze+m0rBNO8eWX0I1e8ueJ5CsRaLBLNrhNaoQoJpZY3NdpWs/A2Q+Zka5UyyRPDAb0
         1A2Lksu4m53kBBxO2EDlOXzIi0vWS7rpMY40tpYN0AzLpTpK6RIpUi7YalcWgAlWpliB
         B7Fj3DQdlVC90APV/xu2PxTG+w39HI8DeDRtW0cL4D+B9jHUcnbWnAjAVzTDTJEc99uB
         auBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766416492; x=1767021292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LRxhQKZyRKVmSnLrclrpBhqFP+Noob/HLauI0TzjRkA=;
        b=d1xnE17wkHNxUEVsc4sQ4kK+RUqzm8bgeK/9rJor9tgiRoY0JMJfOOwGrRx4VYhMdg
         MW9uaAQCe77iDwvBhY7ORlv92No/v5J04xqvD7pJ/j/F4rI/DtQmIV13XdubcPDsngQX
         tT6R6bn68iJ9rx+YAJB17UT2MZdKMx1pTO8Eac3YJwJhbEX5fwQ2h3H6bgb00kzj79hh
         9CZd0dOTAZ1Ih8t0tiPYiW4eCW3/GYw1FOJapABGGEBY0cNaTSbM6Vmrcx+OVy5x9Y/w
         9/Pz1IrNvK5DTQmwY0A4jQ3rb+Gp1jo5nTZG7uF3qNDfZy7LO92CbIWcNVRWHdjR37WJ
         gunA==
X-Forwarded-Encrypted: i=1; AJvYcCWUT4pEDZJ//TrmY7n1PlJyAOlg13BF8NKNkZif1xbEYb83YKE1wjUwwx6uCxZXzH8MZLMMowltWjaaNbI0PTd2@lists.infradead.org
X-Gm-Message-State: AOJu0YyN0tP92MouzprWyzMBVrXhDpsoGwzhhUVsZ0ESuWyRAwH3qdZt
	OB9S75va8cSaO3x3DiJ1aXTYZGm8nFMSGM5AC8UxHAzgqRAFiFneAcjfGVX/BVWDMJ8=
X-Gm-Gg: AY/fxX6A5TJ4pZpQ9r21mMOr0yeMrEGh1W4PfcqzoWVdIeVT7dgkB9cxY7bUEwVOw9B
	PyEZmesn75b5WJGEY4o58kcka06gbD4qhU1w9mp58Snqm/z7LAE180Q4TgTE6vxhx0wuiMROs9P
	wwVYI36D7EVFowWL09yEWtjHvMwhev84NWqCA4Z8DX5LPIf+JbmcPhzo+nV6LdHDREc39xSnu8N
	QRLWyxF9RBsAOKL3vN24yrWT7is+aAXMsNzsUlUIBKcU8ag6JgLGFNg+5mBcovNI2T2Lk4TyZqW
	Qqutc5kCdG/GnWEmgqR0wX5Z+fHayuaTTGuNTvmTIOHAdN1bbN1g8HZKanY+nHBWQ66RI3YVQvl
	w0YqW9s+RhJDswVGU6q2C8Ku1y0c2BaGopttCxt4Z3Bdp7RUnSlJ87FUljb/vXjcYpiVn1pVN9t
	jT4lBa+R6E4jtHxq6F8SJ3
X-Google-Smtp-Source: AGHT+IHwBl/i824ujclP4sQLnrEvoMmybqJO1H8NlqTrzpxaH4/PUebErsbiPsvXrvCvQSiuhI0y+w==
X-Received: by 2002:a05:6000:1acc:b0:431:327:5dc2 with SMTP id ffacd0b85a97d-4324e50a6acmr13487321f8f.51.1766416492214;
        Mon, 22 Dec 2025 07:14:52 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea830fesm22750093f8f.20.2025.12.22.07.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 07:14:51 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 22 Dec 2025 15:14:30 +0000
Subject: [PATCH v4 05/14] perf parse-events: Track all user changed config
 bits
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-james-perf-config-bits-v4-5-0608438186fc@linaro.org>
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
X-CRM114-CacheID: sfid-20251222_071454_523195_015B4F0A 
X-CRM114-Status: GOOD (  19.15  )
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
index 45ab97beeb34..354e28e94523 100644
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
 	u64 user_bits = 0, bits;
-	struct evsel_config_term *term = evsel__get_config_term(evsel, CFG_CHG);
+	struct evsel_config_term *term = evsel__get_config_term(evsel,
+								USR_CHG_CONFIG);
 
 	if (term)
 		user_bits = term->val.cfg_chg;
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
index 599fdf5e28ba..2fe92b4b6e02 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -1374,7 +1374,7 @@ pmu_find_format(const struct list_head *formats, const char *name)
 	return NULL;
 }
 
-__u64 perf_pmu__format_bits(struct perf_pmu *pmu, const char *name)
+__u64 perf_pmu__format_bits(const struct perf_pmu *pmu, const char *name)
 {
 	struct perf_pmu_format *format = pmu_find_format(&pmu->format, name);
 	__u64 bits = 0;
@@ -1389,7 +1389,7 @@ __u64 perf_pmu__format_bits(struct perf_pmu *pmu, const char *name)
 	return bits;
 }
 
-int perf_pmu__format_type(struct perf_pmu *pmu, const char *name)
+int perf_pmu__format_type(const struct perf_pmu *pmu, const char *name)
 {
 	struct perf_pmu_format *format = pmu_find_format(&pmu->format, name);
 
diff --git a/tools/perf/util/pmu.h b/tools/perf/util/pmu.h
index e34db47ae5ef..7bf5b23d0ea1 100644
--- a/tools/perf/util/pmu.h
+++ b/tools/perf/util/pmu.h
@@ -247,8 +247,8 @@ int perf_pmu__config_terms(const struct perf_pmu *pmu,
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


