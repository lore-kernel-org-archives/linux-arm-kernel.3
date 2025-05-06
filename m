Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A6DDC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 14:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PYAEfE/9FBteAebOm2v05JfB5Qfap1wkkuURbt+yBIg=; b=C+jFRPlkQ7HddQ+QpxwrN0wW8c
	6rswChrXNBYCCmtg922c4hITYFLH36pw91Y0RPLsIedB68LmD2C7SQ1mKUBnZHv2E6cBNog9JMEwz
	LplssZaaqxuw3CQLPiKXsqmPqYR4jr8iPUn0EX/CsVcN7ANmeB9y0fAYM5iPOjd6cVcYYPhpYlLLR
	pndr0x7HOeoR6rJIMZGTnRSQFbVM4yOceP5t6K4sMpBC61W1mSTA9g8OPAyK7+QivnAiq3K9XMLlk
	q+AwLmT2MY0ktDR5MVw5HwznG4R72iV+eedY1VyIPCkQb+0y7mC4IpY9F4Ev5Lvjj37QG+/PyXtOR
	4uzf/Erg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCJTp-0000000CMOL-1PvX;
	Tue, 06 May 2025 14:41:09 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCGhB-0000000BmRq-3HZG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 11:42:47 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-39ee682e0ddso3718782f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 04:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746531764; x=1747136564; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PYAEfE/9FBteAebOm2v05JfB5Qfap1wkkuURbt+yBIg=;
        b=iiaEIXdFVWK1CGcIODc/ESka77OpGtBtEWgAvF28pZRDDhxbsdLRIXFPJ/1DDHnT9c
         GX076MwBC3YoW4wVO2+KQ2kied6hPwoCr1y7jk5gSGZX4NzYQ+w6mUuApt655SclmKwM
         berlXQAJGWu8Y8ECRY2+SXsXtdZAwGTEl3kXBK1PiUF8DnJesibj6g+Y3JpPEMLJ57PI
         6aazQqRqDIXno27woNZSXid2sAgYbIewj/73Zk678VTyKrzyRC1eB+L07lbL2QxSp990
         TwrJP4gzbnjdC2r+C2x7aKp3tyUkgKsIPIaC62kxEG0O4B9XgojqMJ4c3tYt9ckdi1zp
         yHyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746531764; x=1747136564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYAEfE/9FBteAebOm2v05JfB5Qfap1wkkuURbt+yBIg=;
        b=Ynk36a9tTcRGY/gFtptduDhRdlySvbMLGaY3nDi4Y1D3GP4NprjyAXwOXFfb6wBbah
         7I8DG8axKTmZ702hQLET4py/bfVIIca21mBlYGJ2NN96MX0gW6YgR0gJe7GAj3YAEhjO
         BAhWcNL2eX1ZCVPbp2hO6DohUcOApThBqpHUWA17777xF6FA88sJNvAzvndvok/0fU/L
         jCrOJ15TuRvidhiODUmmjhsqedzgHnB2KbV8D9Njc90Y6HRjIyHNGgHIl+MDW8f0kWLn
         +85Abt1DmqSfCPW/SNGn6rmIasD1hiNv/DPc1t4mMgjyCqZM+AW/PuDB14mWuGMvMPHm
         8IKQ==
X-Gm-Message-State: AOJu0YwmYvjPwABj1K+QZhJ65LrS5S/fDg78qTfC8rYlVgRpplEKW5ih
	Fl5PkdlbI8+/km69Kxo9YajUL66FS/7oYbAbVn7mjU1NFPguT1nX5SaI2WYnbWE=
X-Gm-Gg: ASbGncseOvFP+gUK4+mnrNxitCPdvJQx0icfcundZWBV+FeCisRfif/fLV0VAXcD1hd
	ZsU1UB6qOl2qJSebAxuCEHdVEHNarEbQg1lb0jU3QNr45r+9HOFmgqQtvldT1EJUvZYrvFjDk/2
	ZjImfObnzw4Sp5Vf3darauB+MRSGzA+Ghf5wK/AYpJhLeo/MaajlTlNewxDzdjGD6dTQhmw8NBt
	levLPMmuXB5sgLqEXyTENMsTGUxxinGPuEeNokaD8qcdtoow7USGTSK/OVmG8w1jKwQKls6sHXA
	SSQTnmn9A9tyfZ+zaRytRI7DdbmDVNx7oVwqsShC7EwoUEI=
X-Google-Smtp-Source: AGHT+IFQ2JTWwoxwIXrjoruUdsPwI8vW3JX1LtZAIkilV7YOBYnZOgxCGJbWEt0SH3QdtOoeDv42Tw==
X-Received: by 2002:a05:6000:2483:b0:39c:1257:c96c with SMTP id ffacd0b85a97d-3a0ac3ea5ebmr2296006f8f.56.1746531764463;
        Tue, 06 May 2025 04:42:44 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae344esm13198473f8f.25.2025.05.06.04.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 04:42:44 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 06 May 2025 12:41:41 +0100
Subject: [PATCH 09/10] perf tools: Add support for perf_event_attr::config4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-james-perf-feat_spe_eft-v1-9-dd480e8e4851@linaro.org>
References: <20250506-james-perf-feat_spe_eft-v1-0-dd480e8e4851@linaro.org>
In-Reply-To: <20250506-james-perf-feat_spe_eft-v1-0-dd480e8e4851@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, leo.yan@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, James Clark <james.clark@linaro.org>, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_044245_870515_BEEBD587 
X-CRM114-Status: GOOD (  17.98  )
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

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/parse-events.c | 14 +++++++++++++-
 tools/perf/util/parse-events.c  | 11 +++++++++++
 tools/perf/util/parse-events.h  |  1 +
 tools/perf/util/parse-events.l  |  1 +
 tools/perf/util/pmu.c           |  8 ++++++++
 tools/perf/util/pmu.h           |  1 +
 6 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/tools/perf/tests/parse-events.c b/tools/perf/tests/parse-events.c
index 5ec2e5607987..5f624a63d550 100644
--- a/tools/perf/tests/parse-events.c
+++ b/tools/perf/tests/parse-events.c
@@ -615,6 +615,8 @@ static int test__checkevent_pmu(struct evlist *evlist)
 	TEST_ASSERT_VAL("wrong config1",    1 == evsel->core.attr.config1);
 	TEST_ASSERT_VAL("wrong config2",    3 == evsel->core.attr.config2);
 	TEST_ASSERT_VAL("wrong config3",    0 == evsel->core.attr.config3);
+	TEST_ASSERT_VAL("wrong config4",    0 == evsel->core.attr.config4);
+
 	/*
 	 * The period value gets configured within evlist__config,
 	 * while this test executes only parse events method.
@@ -637,6 +639,7 @@ static int test__checkevent_list(struct evlist *evlist)
 		TEST_ASSERT_VAL("wrong config1", 0 == evsel->core.attr.config1);
 		TEST_ASSERT_VAL("wrong config2", 0 == evsel->core.attr.config2);
 		TEST_ASSERT_VAL("wrong config3", 0 == evsel->core.attr.config3);
+		TEST_ASSERT_VAL("wrong config4", 0 == evsel->core.attr.config4);
 		TEST_ASSERT_VAL("wrong exclude_user", !evsel->core.attr.exclude_user);
 		TEST_ASSERT_VAL("wrong exclude_kernel", !evsel->core.attr.exclude_kernel);
 		TEST_ASSERT_VAL("wrong exclude_hv", !evsel->core.attr.exclude_hv);
@@ -813,6 +816,15 @@ static int test__checkterms_simple(struct parse_events_terms *terms)
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
@@ -2451,7 +2463,7 @@ struct terms_test {
 
 static const struct terms_test test__terms[] = {
 	[0] = {
-		.str   = "config=10,config1,config2=3,config3=4,umask=1,read,r0xead",
+		.str   = "config=10,config1,config2=3,config3=4,config4=5,umask=1,read,r0xead",
 		.check = test__checkterms_simple,
 	},
 };
diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
index 5152fd5a6ead..7e37f91e7b49 100644
--- a/tools/perf/util/parse-events.c
+++ b/tools/perf/util/parse-events.c
@@ -247,6 +247,8 @@ __add_event(struct list_head *list, int *idx,
 					      PERF_PMU_FORMAT_VALUE_CONFIG2, "config2");
 		perf_pmu__warn_invalid_config(pmu, attr->config3, name,
 					      PERF_PMU_FORMAT_VALUE_CONFIG3, "config3");
+		perf_pmu__warn_invalid_config(pmu, attr->config4, name,
+					      PERF_PMU_FORMAT_VALUE_CONFIG4, "config4");
 	}
 	if (init_attr)
 		event_attr_init(attr);
@@ -783,6 +785,7 @@ const char *parse_events__term_type_str(enum parse_events__term_type term_type)
 		[PARSE_EVENTS__TERM_TYPE_CONFIG1]		= "config1",
 		[PARSE_EVENTS__TERM_TYPE_CONFIG2]		= "config2",
 		[PARSE_EVENTS__TERM_TYPE_CONFIG3]		= "config3",
+		[PARSE_EVENTS__TERM_TYPE_CONFIG4]		= "config4",
 		[PARSE_EVENTS__TERM_TYPE_NAME]			= "name",
 		[PARSE_EVENTS__TERM_TYPE_SAMPLE_PERIOD]		= "period",
 		[PARSE_EVENTS__TERM_TYPE_SAMPLE_FREQ]		= "freq",
@@ -830,6 +833,7 @@ config_term_avail(enum parse_events__term_type term_type, struct parse_events_er
 	case PARSE_EVENTS__TERM_TYPE_CONFIG1:
 	case PARSE_EVENTS__TERM_TYPE_CONFIG2:
 	case PARSE_EVENTS__TERM_TYPE_CONFIG3:
+	case PARSE_EVENTS__TERM_TYPE_CONFIG4:
 	case PARSE_EVENTS__TERM_TYPE_NAME:
 	case PARSE_EVENTS__TERM_TYPE_METRIC_ID:
 	case PARSE_EVENTS__TERM_TYPE_SAMPLE_PERIOD:
@@ -898,6 +902,10 @@ do {									   \
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
@@ -1097,6 +1105,7 @@ static int config_term_tracepoint(struct perf_event_attr *attr,
 	case PARSE_EVENTS__TERM_TYPE_CONFIG1:
 	case PARSE_EVENTS__TERM_TYPE_CONFIG2:
 	case PARSE_EVENTS__TERM_TYPE_CONFIG3:
+	case PARSE_EVENTS__TERM_TYPE_CONFIG4:
 	case PARSE_EVENTS__TERM_TYPE_NAME:
 	case PARSE_EVENTS__TERM_TYPE_SAMPLE_PERIOD:
 	case PARSE_EVENTS__TERM_TYPE_SAMPLE_FREQ:
@@ -1237,6 +1246,7 @@ do {								\
 		case PARSE_EVENTS__TERM_TYPE_CONFIG1:
 		case PARSE_EVENTS__TERM_TYPE_CONFIG2:
 		case PARSE_EVENTS__TERM_TYPE_CONFIG3:
+		case PARSE_EVENTS__TERM_TYPE_CONFIG4:
 		case PARSE_EVENTS__TERM_TYPE_NAME:
 		case PARSE_EVENTS__TERM_TYPE_METRIC_ID:
 		case PARSE_EVENTS__TERM_TYPE_RAW:
@@ -1274,6 +1284,7 @@ static int get_config_chgs(struct perf_pmu *pmu, struct parse_events_terms *head
 		case PARSE_EVENTS__TERM_TYPE_CONFIG1:
 		case PARSE_EVENTS__TERM_TYPE_CONFIG2:
 		case PARSE_EVENTS__TERM_TYPE_CONFIG3:
+		case PARSE_EVENTS__TERM_TYPE_CONFIG4:
 		case PARSE_EVENTS__TERM_TYPE_NAME:
 		case PARSE_EVENTS__TERM_TYPE_SAMPLE_PERIOD:
 		case PARSE_EVENTS__TERM_TYPE_SAMPLE_FREQ:
diff --git a/tools/perf/util/parse-events.h b/tools/perf/util/parse-events.h
index e176a34ab088..6e90c26066d4 100644
--- a/tools/perf/util/parse-events.h
+++ b/tools/perf/util/parse-events.h
@@ -58,6 +58,7 @@ enum parse_events__term_type {
 	PARSE_EVENTS__TERM_TYPE_CONFIG1,
 	PARSE_EVENTS__TERM_TYPE_CONFIG2,
 	PARSE_EVENTS__TERM_TYPE_CONFIG3,
+	PARSE_EVENTS__TERM_TYPE_CONFIG4,
 	PARSE_EVENTS__TERM_TYPE_NAME,
 	PARSE_EVENTS__TERM_TYPE_SAMPLE_PERIOD,
 	PARSE_EVENTS__TERM_TYPE_SAMPLE_FREQ,
diff --git a/tools/perf/util/parse-events.l b/tools/perf/util/parse-events.l
index 7ed86e3e34e3..8e2986d55bc4 100644
--- a/tools/perf/util/parse-events.l
+++ b/tools/perf/util/parse-events.l
@@ -317,6 +317,7 @@ config			{ return term(yyscanner, PARSE_EVENTS__TERM_TYPE_CONFIG); }
 config1			{ return term(yyscanner, PARSE_EVENTS__TERM_TYPE_CONFIG1); }
 config2			{ return term(yyscanner, PARSE_EVENTS__TERM_TYPE_CONFIG2); }
 config3			{ return term(yyscanner, PARSE_EVENTS__TERM_TYPE_CONFIG3); }
+config4			{ return term(yyscanner, PARSE_EVENTS__TERM_TYPE_CONFIG4); }
 name			{ return term(yyscanner, PARSE_EVENTS__TERM_TYPE_NAME); }
 period			{ return term(yyscanner, PARSE_EVENTS__TERM_TYPE_SAMPLE_PERIOD); }
 freq			{ return term(yyscanner, PARSE_EVENTS__TERM_TYPE_SAMPLE_FREQ); }
diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index b7ebac5ab1d1..fc50df65d540 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -1427,6 +1427,10 @@ static int pmu_config_term(const struct perf_pmu *pmu,
 			assert(term->type_val == PARSE_EVENTS__TERM_TYPE_NUM);
 			pmu_format_value(bits, term->val.num, &attr->config3, zero);
 			break;
+		case PARSE_EVENTS__TERM_TYPE_CONFIG4:
+			assert(term->type_val == PARSE_EVENTS__TERM_TYPE_NUM);
+			pmu_format_value(bits, term->val.num, &attr->config4, zero);
+			break;
 		case PARSE_EVENTS__TERM_TYPE_USER: /* Not hardcoded. */
 			return -EINVAL;
 		case PARSE_EVENTS__TERM_TYPE_NAME ... PARSE_EVENTS__TERM_TYPE_HARDWARE:
@@ -1474,6 +1478,9 @@ static int pmu_config_term(const struct perf_pmu *pmu,
 	case PERF_PMU_FORMAT_VALUE_CONFIG3:
 		vp = &attr->config3;
 		break;
+	case PERF_PMU_FORMAT_VALUE_CONFIG4:
+		vp = &attr->config4;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -1787,6 +1794,7 @@ int perf_pmu__for_each_format(struct perf_pmu *pmu, void *state, pmu_format_call
 		"config1=0..0xffffffffffffffff",
 		"config2=0..0xffffffffffffffff",
 		"config3=0..0xffffffffffffffff",
+		"config4=0..0xffffffffffffffff",
 		"name=string",
 		"period=number",
 		"freq=number",
diff --git a/tools/perf/util/pmu.h b/tools/perf/util/pmu.h
index b93014cc3670..1ce5377935db 100644
--- a/tools/perf/util/pmu.h
+++ b/tools/perf/util/pmu.h
@@ -22,6 +22,7 @@ enum {
 	PERF_PMU_FORMAT_VALUE_CONFIG1,
 	PERF_PMU_FORMAT_VALUE_CONFIG2,
 	PERF_PMU_FORMAT_VALUE_CONFIG3,
+	PERF_PMU_FORMAT_VALUE_CONFIG4,
 	PERF_PMU_FORMAT_VALUE_CONFIG_END,
 };
 

-- 
2.34.1


