Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC66CC54754
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 13:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7AscH72kusvfmxq1vDBuFrvyZXC0sH+IlByii+SXbSs=; b=FnENbFVNOXumULpvSyJ6W/TPjS
	Mv5XLPgojJzOVacila1TfHboW6BiLsmY8UyOUVIcFKTi0LbL8mNtnH1iU5vCPpeHgiBNxa3n0dUjY
	OVUR4vnlBTdc8DU5whRQSAS8e/csEJtuwFrR+vQC/QQ2a5NbAWoPTbcVaVnOi2qpIjNlQuUTvSlIC
	mnWq9vlsM6+ZPBkrErFz5r5SXiIP2mcjj+2AaCGA9kKmQqfGkzL7UKwpjT/XZ/JsB1YzPo8gKFcnq
	OoU6YW8VHdnS0wupa9sJ9BNnqtjNVGaChOLWS/4LuaTkFQL+1ZOxL2s//833WDamD+WBNqQpnyJrI
	HWtktM3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHMuG-0000000Czek-38xX;
	Tue, 20 May 2025 13:21:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHMrL-0000000CzC0-3jvP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 13:18:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AACCC1516;
	Tue, 20 May 2025 06:18:05 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 963163F5A1;
	Tue, 20 May 2025 06:18:18 -0700 (PDT)
Date: Tue, 20 May 2025 14:18:16 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH 09/10] perf tools: Add support for
 perf_event_attr::config4
Message-ID: <20250520131816.GQ412060@e132581.arm.com>
References: <20250506-james-perf-feat_spe_eft-v1-0-dd480e8e4851@linaro.org>
 <20250506-james-perf-feat_spe_eft-v1-9-dd480e8e4851@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506-james-perf-feat_spe_eft-v1-9-dd480e8e4851@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_061820_028008_3E903555 
X-CRM114-Status: GOOD (  23.60  )
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

On Tue, May 06, 2025 at 12:41:41PM +0100, James Clark wrote:
> perf_event_attr has gained a new field, config4, so add support for it
> extending the existing configN support.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Leo Yan <leo.yan@arm.com>

> ---
>  tools/perf/tests/parse-events.c | 14 +++++++++++++-
>  tools/perf/util/parse-events.c  | 11 +++++++++++
>  tools/perf/util/parse-events.h  |  1 +
>  tools/perf/util/parse-events.l  |  1 +
>  tools/perf/util/pmu.c           |  8 ++++++++
>  tools/perf/util/pmu.h           |  1 +
>  6 files changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/perf/tests/parse-events.c b/tools/perf/tests/parse-events.c
> index 5ec2e5607987..5f624a63d550 100644
> --- a/tools/perf/tests/parse-events.c
> +++ b/tools/perf/tests/parse-events.c
> @@ -615,6 +615,8 @@ static int test__checkevent_pmu(struct evlist *evlist)
>  	TEST_ASSERT_VAL("wrong config1",    1 == evsel->core.attr.config1);
>  	TEST_ASSERT_VAL("wrong config2",    3 == evsel->core.attr.config2);
>  	TEST_ASSERT_VAL("wrong config3",    0 == evsel->core.attr.config3);
> +	TEST_ASSERT_VAL("wrong config4",    0 == evsel->core.attr.config4);
> +
>  	/*
>  	 * The period value gets configured within evlist__config,
>  	 * while this test executes only parse events method.
> @@ -637,6 +639,7 @@ static int test__checkevent_list(struct evlist *evlist)
>  		TEST_ASSERT_VAL("wrong config1", 0 == evsel->core.attr.config1);
>  		TEST_ASSERT_VAL("wrong config2", 0 == evsel->core.attr.config2);
>  		TEST_ASSERT_VAL("wrong config3", 0 == evsel->core.attr.config3);
> +		TEST_ASSERT_VAL("wrong config4", 0 == evsel->core.attr.config4);
>  		TEST_ASSERT_VAL("wrong exclude_user", !evsel->core.attr.exclude_user);
>  		TEST_ASSERT_VAL("wrong exclude_kernel", !evsel->core.attr.exclude_kernel);
>  		TEST_ASSERT_VAL("wrong exclude_hv", !evsel->core.attr.exclude_hv);
> @@ -813,6 +816,15 @@ static int test__checkterms_simple(struct parse_events_terms *terms)
>  	TEST_ASSERT_VAL("wrong val", term->val.num == 4);
>  	TEST_ASSERT_VAL("wrong config", !strcmp(term->config, "config3"));
>  
> +	/* config4=5 */
> +	term = list_entry(term->list.next, struct parse_events_term, list);
> +	TEST_ASSERT_VAL("wrong type term",
> +			term->type_term == PARSE_EVENTS__TERM_TYPE_CONFIG4);
> +	TEST_ASSERT_VAL("wrong type val",
> +			term->type_val == PARSE_EVENTS__TERM_TYPE_NUM);
> +	TEST_ASSERT_VAL("wrong val", term->val.num == 5);
> +	TEST_ASSERT_VAL("wrong config", !strcmp(term->config, "config4"));
> +
>  	/* umask=1*/
>  	term = list_entry(term->list.next, struct parse_events_term, list);
>  	TEST_ASSERT_VAL("wrong type term",
> @@ -2451,7 +2463,7 @@ struct terms_test {
>  
>  static const struct terms_test test__terms[] = {
>  	[0] = {
> -		.str   = "config=10,config1,config2=3,config3=4,umask=1,read,r0xead",
> +		.str   = "config=10,config1,config2=3,config3=4,config4=5,umask=1,read,r0xead",
>  		.check = test__checkterms_simple,
>  	},
>  };
> diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
> index 5152fd5a6ead..7e37f91e7b49 100644
> --- a/tools/perf/util/parse-events.c
> +++ b/tools/perf/util/parse-events.c
> @@ -247,6 +247,8 @@ __add_event(struct list_head *list, int *idx,
>  					      PERF_PMU_FORMAT_VALUE_CONFIG2, "config2");
>  		perf_pmu__warn_invalid_config(pmu, attr->config3, name,
>  					      PERF_PMU_FORMAT_VALUE_CONFIG3, "config3");
> +		perf_pmu__warn_invalid_config(pmu, attr->config4, name,
> +					      PERF_PMU_FORMAT_VALUE_CONFIG4, "config4");
>  	}
>  	if (init_attr)
>  		event_attr_init(attr);
> @@ -783,6 +785,7 @@ const char *parse_events__term_type_str(enum parse_events__term_type term_type)
>  		[PARSE_EVENTS__TERM_TYPE_CONFIG1]		= "config1",
>  		[PARSE_EVENTS__TERM_TYPE_CONFIG2]		= "config2",
>  		[PARSE_EVENTS__TERM_TYPE_CONFIG3]		= "config3",
> +		[PARSE_EVENTS__TERM_TYPE_CONFIG4]		= "config4",
>  		[PARSE_EVENTS__TERM_TYPE_NAME]			= "name",
>  		[PARSE_EVENTS__TERM_TYPE_SAMPLE_PERIOD]		= "period",
>  		[PARSE_EVENTS__TERM_TYPE_SAMPLE_FREQ]		= "freq",
> @@ -830,6 +833,7 @@ config_term_avail(enum parse_events__term_type term_type, struct parse_events_er
>  	case PARSE_EVENTS__TERM_TYPE_CONFIG1:
>  	case PARSE_EVENTS__TERM_TYPE_CONFIG2:
>  	case PARSE_EVENTS__TERM_TYPE_CONFIG3:
> +	case PARSE_EVENTS__TERM_TYPE_CONFIG4:
>  	case PARSE_EVENTS__TERM_TYPE_NAME:
>  	case PARSE_EVENTS__TERM_TYPE_METRIC_ID:
>  	case PARSE_EVENTS__TERM_TYPE_SAMPLE_PERIOD:
> @@ -898,6 +902,10 @@ do {									   \
>  		CHECK_TYPE_VAL(NUM);
>  		attr->config3 = term->val.num;
>  		break;
> +	case PARSE_EVENTS__TERM_TYPE_CONFIG4:
> +		CHECK_TYPE_VAL(NUM);
> +		attr->config4 = term->val.num;
> +		break;
>  	case PARSE_EVENTS__TERM_TYPE_SAMPLE_PERIOD:
>  		CHECK_TYPE_VAL(NUM);
>  		break;
> @@ -1097,6 +1105,7 @@ static int config_term_tracepoint(struct perf_event_attr *attr,
>  	case PARSE_EVENTS__TERM_TYPE_CONFIG1:
>  	case PARSE_EVENTS__TERM_TYPE_CONFIG2:
>  	case PARSE_EVENTS__TERM_TYPE_CONFIG3:
> +	case PARSE_EVENTS__TERM_TYPE_CONFIG4:
>  	case PARSE_EVENTS__TERM_TYPE_NAME:
>  	case PARSE_EVENTS__TERM_TYPE_SAMPLE_PERIOD:
>  	case PARSE_EVENTS__TERM_TYPE_SAMPLE_FREQ:
> @@ -1237,6 +1246,7 @@ do {								\
>  		case PARSE_EVENTS__TERM_TYPE_CONFIG1:
>  		case PARSE_EVENTS__TERM_TYPE_CONFIG2:
>  		case PARSE_EVENTS__TERM_TYPE_CONFIG3:
> +		case PARSE_EVENTS__TERM_TYPE_CONFIG4:
>  		case PARSE_EVENTS__TERM_TYPE_NAME:
>  		case PARSE_EVENTS__TERM_TYPE_METRIC_ID:
>  		case PARSE_EVENTS__TERM_TYPE_RAW:
> @@ -1274,6 +1284,7 @@ static int get_config_chgs(struct perf_pmu *pmu, struct parse_events_terms *head
>  		case PARSE_EVENTS__TERM_TYPE_CONFIG1:
>  		case PARSE_EVENTS__TERM_TYPE_CONFIG2:
>  		case PARSE_EVENTS__TERM_TYPE_CONFIG3:
> +		case PARSE_EVENTS__TERM_TYPE_CONFIG4:
>  		case PARSE_EVENTS__TERM_TYPE_NAME:
>  		case PARSE_EVENTS__TERM_TYPE_SAMPLE_PERIOD:
>  		case PARSE_EVENTS__TERM_TYPE_SAMPLE_FREQ:
> diff --git a/tools/perf/util/parse-events.h b/tools/perf/util/parse-events.h
> index e176a34ab088..6e90c26066d4 100644
> --- a/tools/perf/util/parse-events.h
> +++ b/tools/perf/util/parse-events.h
> @@ -58,6 +58,7 @@ enum parse_events__term_type {
>  	PARSE_EVENTS__TERM_TYPE_CONFIG1,
>  	PARSE_EVENTS__TERM_TYPE_CONFIG2,
>  	PARSE_EVENTS__TERM_TYPE_CONFIG3,
> +	PARSE_EVENTS__TERM_TYPE_CONFIG4,
>  	PARSE_EVENTS__TERM_TYPE_NAME,
>  	PARSE_EVENTS__TERM_TYPE_SAMPLE_PERIOD,
>  	PARSE_EVENTS__TERM_TYPE_SAMPLE_FREQ,
> diff --git a/tools/perf/util/parse-events.l b/tools/perf/util/parse-events.l
> index 7ed86e3e34e3..8e2986d55bc4 100644
> --- a/tools/perf/util/parse-events.l
> +++ b/tools/perf/util/parse-events.l
> @@ -317,6 +317,7 @@ config			{ return term(yyscanner, PARSE_EVENTS__TERM_TYPE_CONFIG); }
>  config1			{ return term(yyscanner, PARSE_EVENTS__TERM_TYPE_CONFIG1); }
>  config2			{ return term(yyscanner, PARSE_EVENTS__TERM_TYPE_CONFIG2); }
>  config3			{ return term(yyscanner, PARSE_EVENTS__TERM_TYPE_CONFIG3); }
> +config4			{ return term(yyscanner, PARSE_EVENTS__TERM_TYPE_CONFIG4); }
>  name			{ return term(yyscanner, PARSE_EVENTS__TERM_TYPE_NAME); }
>  period			{ return term(yyscanner, PARSE_EVENTS__TERM_TYPE_SAMPLE_PERIOD); }
>  freq			{ return term(yyscanner, PARSE_EVENTS__TERM_TYPE_SAMPLE_FREQ); }
> diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
> index b7ebac5ab1d1..fc50df65d540 100644
> --- a/tools/perf/util/pmu.c
> +++ b/tools/perf/util/pmu.c
> @@ -1427,6 +1427,10 @@ static int pmu_config_term(const struct perf_pmu *pmu,
>  			assert(term->type_val == PARSE_EVENTS__TERM_TYPE_NUM);
>  			pmu_format_value(bits, term->val.num, &attr->config3, zero);
>  			break;
> +		case PARSE_EVENTS__TERM_TYPE_CONFIG4:
> +			assert(term->type_val == PARSE_EVENTS__TERM_TYPE_NUM);
> +			pmu_format_value(bits, term->val.num, &attr->config4, zero);
> +			break;
>  		case PARSE_EVENTS__TERM_TYPE_USER: /* Not hardcoded. */
>  			return -EINVAL;
>  		case PARSE_EVENTS__TERM_TYPE_NAME ... PARSE_EVENTS__TERM_TYPE_HARDWARE:
> @@ -1474,6 +1478,9 @@ static int pmu_config_term(const struct perf_pmu *pmu,
>  	case PERF_PMU_FORMAT_VALUE_CONFIG3:
>  		vp = &attr->config3;
>  		break;
> +	case PERF_PMU_FORMAT_VALUE_CONFIG4:
> +		vp = &attr->config4;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -1787,6 +1794,7 @@ int perf_pmu__for_each_format(struct perf_pmu *pmu, void *state, pmu_format_call
>  		"config1=0..0xffffffffffffffff",
>  		"config2=0..0xffffffffffffffff",
>  		"config3=0..0xffffffffffffffff",
> +		"config4=0..0xffffffffffffffff",
>  		"name=string",
>  		"period=number",
>  		"freq=number",
> diff --git a/tools/perf/util/pmu.h b/tools/perf/util/pmu.h
> index b93014cc3670..1ce5377935db 100644
> --- a/tools/perf/util/pmu.h
> +++ b/tools/perf/util/pmu.h
> @@ -22,6 +22,7 @@ enum {
>  	PERF_PMU_FORMAT_VALUE_CONFIG1,
>  	PERF_PMU_FORMAT_VALUE_CONFIG2,
>  	PERF_PMU_FORMAT_VALUE_CONFIG3,
> +	PERF_PMU_FORMAT_VALUE_CONFIG4,
>  	PERF_PMU_FORMAT_VALUE_CONFIG_END,
>  };
>  
> 
> -- 
> 2.34.1
> 

