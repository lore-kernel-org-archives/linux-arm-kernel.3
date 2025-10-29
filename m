Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22861CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 15:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iPuK+VGyQwSflpxe9Kn/c/W9eXle2GUO25lwhLsZYxQ=; b=Ndlo45BjR3ATioXsyCMp88jEOb
	oFZHkNFZtK+IQE+vHISluQGkzKeP+XkI6N67xYVYZZWHXAHF8TNjJ9jrLhtF8XS4unDoDB+xmEc8K
	8WL8vNxrTeMouM+Q+4A0o8CO0fqe1P/TTZvFwOiE/VTiQKghjtHKuw5moLYMzND5zKK4ggrhsg7Du
	kU7RTvmIwWWBwdHZfyNd6zyC6femjKxBPZtVcA5lQMg/LkUZAzfUeUOLyaLoiA/Yen/PurEJVF/Xp
	9n3lQoGyHjU5PNDOvY7GamQ6SyT2JR5I76MEK2A7aL1Tt8z1tJRg60q7hu6n6zhk+X/X/Sm2REMyt
	9Vq7WbSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8Nt-00000001r0j-3BR2;
	Wed, 29 Oct 2025 15:46:49 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8Nq-00000001qxS-2dkO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 15:46:47 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-475e01db75aso33911755e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 08:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761752805; x=1762357605; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iPuK+VGyQwSflpxe9Kn/c/W9eXle2GUO25lwhLsZYxQ=;
        b=Sqj9z8ftUrBh1bCc/XLYJEUV7X9fwuExRfpnsjJrWwWMQPzmYUGA0DdRl6tw4hg/kJ
         5HZREcuIr78DnKmbOEiMSvu0lyP41m8R2xpdysidkqcb3dN1ufZIxDfz6wT4ILIsIhlO
         ASX/jTXow1wgdaCQfxjDhj0sub8Pyawq9q3EscC0BfqbK4KR+ka1IKt389ds0fy45eE9
         KwABsib1G55OdGXQZZS34OIpjttrShHIhvoOJ9qBGNG764ocXpVFI6xZ2LEuJwcW02yE
         O46W4mlofANeJR9U+2UbaXQpBCoGp0z51CZBWX6RDgzuJR538FWEVafxq2nDCUv/afXP
         eUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761752805; x=1762357605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iPuK+VGyQwSflpxe9Kn/c/W9eXle2GUO25lwhLsZYxQ=;
        b=ACUwwR8y7/5Vs4e9dPMEOu2Hq3k91v7T5zY/eehGg9QoZcMusk6dzbFFzc9ZWSIPNq
         PExUvngeH6t6D/IU0LdM2QRuoKQ13qAN3tjksoeE6uih59yGRaCwKdeVVFgPnr7Rb7dS
         Z9oqwSftyoDsLU/V8fpHXzSw/ORyTuZTddntniZmKGTrL97uTLAmb5oC2xUBwFz1JmXG
         TaZ3p9wYb1zlGAEVvrYztDOcpUXkdrlVBuep5mduJEyIV6Xl5IJfkc8mglOtn+JrryrB
         DlpIFXTuMHcet34zCTYOs5UrP0ArASxNLhl6kT3gZ2Sn60xkMExc+/5poImHwJC5myOP
         AU3g==
X-Gm-Message-State: AOJu0Yz3Ne7kTFd/tyoAdJ6zSnWpzdW1mCGo4iOabswHIOA1vA1+Bpbc
	UZyy9KhPU5LJcNCAtRfPJbRralsh3I3BEGxMHvun3mR8O0kR+Fc7EEf2bmEpAj4NIQU=
X-Gm-Gg: ASbGnctHiF/dAsNBoAmeKMCEfJMO0YzAtn5CzPDvBVT/av07bvHUBzdli4dEzPPJOEl
	Gnhk3HoYMEhhGvwuLS3ut0Hni1ECSvA+eqeuzeidE0PtFYsFTGPzlUiaDPsNuTd27IKOnqB+jwX
	WRF7FiPazO6MK81koZJWTcQzWT1lTNrPlMLBLXsJcuc71Oau6QGyExnpCoc+O8OCv2iECb4dbky
	3qXKwBux7oGE6dLPMhzJneC9RJhNqeL9n765SuLL0INzqWeMZX2KlXCW4RXpuqFN/IAY8+2pAYm
	wqOy3SD+DJeYDqdRKno7oCdyiwtHUsWCFTA2yTKGPbTAqYhzUU6CvkCZ8obu4zFppobDSqdwsOi
	ynDsivn2JMBwtqJLvA8JDQN9mi01XepmulnYXuLwhrdBFdpIz8Mklvou9Xi2+Io9qBotidHhOqm
	tKgkwHFqpw+w==
X-Google-Smtp-Source: AGHT+IGsC9+Wjmni3+2e4yMVeUDUDuanVVJlv44swuGrvwo+8Mt7mgUfpsdfmreH7PVIKww4YZHrQw==
X-Received: by 2002:a05:600c:3b15:b0:475:dd89:acb with SMTP id 5b1f17b1804b1-4771e3a88ccmr29964175e9.22.1761752804464;
        Wed, 29 Oct 2025 08:46:44 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e3b9994sm53745535e9.16.2025.10.29.08.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 08:46:43 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Wed, 29 Oct 2025 15:46:04 +0000
Subject: [PATCH v9 4/5] perf tools: Add support for
 perf_event_attr::config4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-james-perf-feat_spe_eft-v9-4-d22536b9cf94@linaro.org>
References: <20251029-james-perf-feat_spe_eft-v9-0-d22536b9cf94@linaro.org>
In-Reply-To: <20251029-james-perf-feat_spe_eft-v9-0-d22536b9cf94@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_084646_731418_5D07DB9C 
X-CRM114-Status: GOOD (  17.24  )
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

perf_event_attr has gained a new field, config4, so add support for it
extending the existing configN support.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Ian Rogers <irogers@google.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/parse-events.c | 13 ++++++++++++-
 tools/perf/util/parse-events.c  | 11 +++++++++++
 tools/perf/util/parse-events.h  |  1 +
 tools/perf/util/parse-events.l  |  1 +
 tools/perf/util/pmu.c           |  8 ++++++++
 tools/perf/util/pmu.h           |  1 +
 6 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/tools/perf/tests/parse-events.c b/tools/perf/tests/parse-events.c
index e4cdb517c10e..128d21dc389f 100644
--- a/tools/perf/tests/parse-events.c
+++ b/tools/perf/tests/parse-events.c
@@ -647,6 +647,7 @@ static int test__checkevent_pmu(struct evlist *evlist)
 	TEST_ASSERT_EVSEL("wrong config1",    1 == evsel->core.attr.config1, evsel);
 	TEST_ASSERT_EVSEL("wrong config2",    3 == evsel->core.attr.config2, evsel);
 	TEST_ASSERT_EVSEL("wrong config3",    0 == evsel->core.attr.config3, evsel);
+	TEST_ASSERT_EVSEL("wrong config4",    0 == evsel->core.attr.config4, evsel);
 	/*
 	 * The period value gets configured within evlist__config,
 	 * while this test executes only parse events method.
@@ -669,6 +670,7 @@ static int test__checkevent_list(struct evlist *evlist)
 		TEST_ASSERT_EVSEL("wrong config1", 0 == evsel->core.attr.config1, evsel);
 		TEST_ASSERT_EVSEL("wrong config2", 0 == evsel->core.attr.config2, evsel);
 		TEST_ASSERT_EVSEL("wrong config3", 0 == evsel->core.attr.config3, evsel);
+		TEST_ASSERT_EVSEL("wrong config4", 0 == evsel->core.attr.config4, evsel);
 		TEST_ASSERT_EVSEL("wrong exclude_user", !evsel->core.attr.exclude_user, evsel);
 		TEST_ASSERT_EVSEL("wrong exclude_kernel", !evsel->core.attr.exclude_kernel, evsel);
 		TEST_ASSERT_EVSEL("wrong exclude_hv", !evsel->core.attr.exclude_hv, evsel);
@@ -849,6 +851,15 @@ static int test__checkterms_simple(struct parse_events_terms *terms)
 	TEST_ASSERT_VAL("wrong val", term->val.num == 4);
 	TEST_ASSERT_VAL("wrong config", !strcmp(term->config, "config3"));
 
+	/* config4=5 */
+	term = list_entry(term->list.next, struct parse_events_term, list);
+	TEST_ASSERT_VAL("wrong type term",
+			term->type_term == PARSE_EVENTS__TERM_TYPE_CONFIG4);
+	TEST_ASSERT_VAL("wrong type val",
+			term->type_val == PARSE_EVENTS__TERM_TYPE_NUM);
+	TEST_ASSERT_VAL("wrong val", term->val.num == 5);
+	TEST_ASSERT_VAL("wrong config", !strcmp(term->config, "config4"));
+
 	/* umask=1*/
 	term = list_entry(term->list.next, struct parse_events_term, list);
 	TEST_ASSERT_VAL("wrong type term",
@@ -2516,7 +2527,7 @@ struct terms_test {
 
 static const struct terms_test test__terms[] = {
 	[0] = {
-		.str   = "config=10,config1,config2=3,config3=4,umask=1,read,r0xead",
+		.str   = "config=10,config1,config2=3,config3=4,config4=5,umask=1,read,r0xead",
 		.check = test__checkterms_simple,
 	},
 };
diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
index 0c0dc20b1c13..ee4f55cbd3cb 100644
--- a/tools/perf/util/parse-events.c
+++ b/tools/perf/util/parse-events.c
@@ -215,6 +215,8 @@ __add_event(struct list_head *list, int *idx,
 						PERF_PMU_FORMAT_VALUE_CONFIG2, "config2");
 			perf_pmu__warn_invalid_config(pmu, attr->config3, name,
 						PERF_PMU_FORMAT_VALUE_CONFIG3, "config3");
+			perf_pmu__warn_invalid_config(pmu, attr->config4, name,
+						PERF_PMU_FORMAT_VALUE_CONFIG4, "config4");
 		}
 	}
 	/*
@@ -700,6 +702,7 @@ const char *parse_events__term_type_str(enum parse_events__term_type term_type)
 		[PARSE_EVENTS__TERM_TYPE_CONFIG1]		= "config1",
 		[PARSE_EVENTS__TERM_TYPE_CONFIG2]		= "config2",
 		[PARSE_EVENTS__TERM_TYPE_CONFIG3]		= "config3",
+		[PARSE_EVENTS__TERM_TYPE_CONFIG4]		= "config4",
 		[PARSE_EVENTS__TERM_TYPE_NAME]			= "name",
 		[PARSE_EVENTS__TERM_TYPE_SAMPLE_PERIOD]		= "period",
 		[PARSE_EVENTS__TERM_TYPE_SAMPLE_FREQ]		= "freq",
@@ -749,6 +752,7 @@ config_term_avail(enum parse_events__term_type term_type, struct parse_events_er
 	case PARSE_EVENTS__TERM_TYPE_CONFIG1:
 	case PARSE_EVENTS__TERM_TYPE_CONFIG2:
 	case PARSE_EVENTS__TERM_TYPE_CONFIG3:
+	case PARSE_EVENTS__TERM_TYPE_CONFIG4:
 	case PARSE_EVENTS__TERM_TYPE_NAME:
 	case PARSE_EVENTS__TERM_TYPE_METRIC_ID:
 	case PARSE_EVENTS__TERM_TYPE_SAMPLE_PERIOD:
@@ -819,6 +823,10 @@ do {											\
 		CHECK_TYPE_VAL(NUM);
 		attr->config3 = term->val.num;
 		break;
+	case PARSE_EVENTS__TERM_TYPE_CONFIG4:
+		CHECK_TYPE_VAL(NUM);
+		attr->config4 = term->val.num;
+		break;
 	case PARSE_EVENTS__TERM_TYPE_SAMPLE_PERIOD:
 		CHECK_TYPE_VAL(NUM);
 		break;
@@ -1064,6 +1072,7 @@ static int config_term_tracepoint(struct perf_event_attr *attr,
 	case PARSE_EVENTS__TERM_TYPE_CONFIG1:
 	case PARSE_EVENTS__TERM_TYPE_CONFIG2:
 	case PARSE_EVENTS__TERM_TYPE_CONFIG3:
+	case PARSE_EVENTS__TERM_TYPE_CONFIG4:
 	case PARSE_EVENTS__TERM_TYPE_LEGACY_HARDWARE_CONFIG:
 	case PARSE_EVENTS__TERM_TYPE_LEGACY_CACHE_CONFIG:
 	case PARSE_EVENTS__TERM_TYPE_NAME:
@@ -1207,6 +1216,7 @@ do {								\
 		case PARSE_EVENTS__TERM_TYPE_CONFIG1:
 		case PARSE_EVENTS__TERM_TYPE_CONFIG2:
 		case PARSE_EVENTS__TERM_TYPE_CONFIG3:
+		case PARSE_EVENTS__TERM_TYPE_CONFIG4:
 		case PARSE_EVENTS__TERM_TYPE_LEGACY_HARDWARE_CONFIG:
 		case PARSE_EVENTS__TERM_TYPE_LEGACY_CACHE_CONFIG:
 		case PARSE_EVENTS__TERM_TYPE_NAME:
@@ -1245,6 +1255,7 @@ static int get_config_chgs(struct perf_pmu *pmu, struct parse_events_terms *head
 		case PARSE_EVENTS__TERM_TYPE_CONFIG1:
 		case PARSE_EVENTS__TERM_TYPE_CONFIG2:
 		case PARSE_EVENTS__TERM_TYPE_CONFIG3:
+		case PARSE_EVENTS__TERM_TYPE_CONFIG4:
 		case PARSE_EVENTS__TERM_TYPE_LEGACY_HARDWARE_CONFIG:
 		case PARSE_EVENTS__TERM_TYPE_LEGACY_CACHE_CONFIG:
 		case PARSE_EVENTS__TERM_TYPE_NAME:
diff --git a/tools/perf/util/parse-events.h b/tools/perf/util/parse-events.h
index 1012b441e9cd..3577ab213730 100644
--- a/tools/perf/util/parse-events.h
+++ b/tools/perf/util/parse-events.h
@@ -59,6 +59,7 @@ enum parse_events__term_type {
 	PARSE_EVENTS__TERM_TYPE_CONFIG1,
 	PARSE_EVENTS__TERM_TYPE_CONFIG2,
 	PARSE_EVENTS__TERM_TYPE_CONFIG3,
+	PARSE_EVENTS__TERM_TYPE_CONFIG4,
 	PARSE_EVENTS__TERM_TYPE_NAME,
 	PARSE_EVENTS__TERM_TYPE_SAMPLE_PERIOD,
 	PARSE_EVENTS__TERM_TYPE_SAMPLE_FREQ,
diff --git a/tools/perf/util/parse-events.l b/tools/perf/util/parse-events.l
index 8e0ea441e57f..251ce4321878 100644
--- a/tools/perf/util/parse-events.l
+++ b/tools/perf/util/parse-events.l
@@ -287,6 +287,7 @@ config			{ return term(yyscanner, PARSE_EVENTS__TERM_TYPE_CONFIG); }
 config1			{ return term(yyscanner, PARSE_EVENTS__TERM_TYPE_CONFIG1); }
 config2			{ return term(yyscanner, PARSE_EVENTS__TERM_TYPE_CONFIG2); }
 config3			{ return term(yyscanner, PARSE_EVENTS__TERM_TYPE_CONFIG3); }
+config4			{ return term(yyscanner, PARSE_EVENTS__TERM_TYPE_CONFIG4); }
 name			{ return term(yyscanner, PARSE_EVENTS__TERM_TYPE_NAME); }
 period			{ return term(yyscanner, PARSE_EVENTS__TERM_TYPE_SAMPLE_PERIOD); }
 freq			{ return term(yyscanner, PARSE_EVENTS__TERM_TYPE_SAMPLE_FREQ); }
diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index d597263fab4f..dce03c19dc4d 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -1566,6 +1566,10 @@ static int pmu_config_term(const struct perf_pmu *pmu,
 			assert(term->type_val == PARSE_EVENTS__TERM_TYPE_NUM);
 			pmu_format_value(bits, term->val.num, &attr->config3, zero);
 			break;
+		case PARSE_EVENTS__TERM_TYPE_CONFIG4:
+			assert(term->type_val == PARSE_EVENTS__TERM_TYPE_NUM);
+			pmu_format_value(bits, term->val.num, &attr->config4, zero);
+			break;
 		case PARSE_EVENTS__TERM_TYPE_LEGACY_HARDWARE_CONFIG:
 			assert(term->type_val == PARSE_EVENTS__TERM_TYPE_NUM);
 			assert(term->val.num < PERF_COUNT_HW_MAX);
@@ -1641,6 +1645,9 @@ static int pmu_config_term(const struct perf_pmu *pmu,
 	case PERF_PMU_FORMAT_VALUE_CONFIG3:
 		vp = &attr->config3;
 		break;
+	case PERF_PMU_FORMAT_VALUE_CONFIG4:
+		vp = &attr->config4;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -2000,6 +2007,7 @@ int perf_pmu__for_each_format(struct perf_pmu *pmu, void *state, pmu_format_call
 		"config1=0..0xffffffffffffffff",
 		"config2=0..0xffffffffffffffff",
 		"config3=0..0xffffffffffffffff",
+		"config4=0..0xffffffffffffffff",
 		"legacy-hardware-config=0..9,",
 		"legacy-cache-config=0..0xffffff,",
 		"name=string",
diff --git a/tools/perf/util/pmu.h b/tools/perf/util/pmu.h
index 1ebcf0242af8..67431f765266 100644
--- a/tools/perf/util/pmu.h
+++ b/tools/perf/util/pmu.h
@@ -23,6 +23,7 @@ enum {
 	PERF_PMU_FORMAT_VALUE_CONFIG1,
 	PERF_PMU_FORMAT_VALUE_CONFIG2,
 	PERF_PMU_FORMAT_VALUE_CONFIG3,
+	PERF_PMU_FORMAT_VALUE_CONFIG4,
 	PERF_PMU_FORMAT_VALUE_CONFIG_END,
 };
 

-- 
2.34.1


