Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54889D30CC2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 20:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kxRLsVUToAf8OSgm8rmvnRidI0FvR8JENH3xCQusjIk=; b=TsydKCLoO3bGADBhJtHCy3figA
	U67VC1p/flMEEiEJt6ERHER6nUro+Yv2lvbYTm6wUW7hRN4WUOnEcPc6TIIeYK4XrUtD/Dst+VmN3
	K2X4HKAucJpeawJgSWRuqmHWzmnPGott3hmD+WkAQGmKvFxD/nBMpWyZhZdnbSZTfs5A4KbqHHSig
	nurrSXzzbICPY62SrWnJsT0Tkr4EbA9s1nfC35DqY3xqYMG0NYrODhhy4CSIs+dLMGOJqdj5aGKXW
	hb9iaAfAnXs7blQdF49NM/Tfs1TTvFSuNACovV/wRUHgkdtz4l37GWup5A9llu3ubgbL4TseiBFzl
	rMItqLHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vflOB-00000007iCg-2jcN;
	Tue, 13 Jan 2026 20:53:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vflO9-00000007iCJ-263d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 20:53:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9A3294410C;
	Tue, 13 Jan 2026 20:53:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA8FEC116C6;
	Tue, 13 Jan 2026 20:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768337596;
	bh=VMV2RvEfBJ8otAFoiuzDC5SC5BsgXrgHNsXODQKZXPg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HW8PlZNFHAuBXbgBaxLlqw58ZLp8/CL/bQacN8eSHGX0ROVQnxl1DLSYPnkJzdpSk
	 XWfS+WBcu6chNvdHjXpEVwQ807vHp6xTxkdIOiwfnvmLOGTdYfnlP3z5EqziEoI6Ik
	 EJji/KqHG0U9uBL1i62X3h5wS7731445IGyYUOfrdjZPKU52G2JkqaITE1X9YMWfPx
	 eS9+XX/Cvi6QfKkuuJt0qeXIzs6nUdM5NnL9e7Izxnt2taOO3lUySYjwNcIgbR+aRF
	 AsMsb8rTAxFqUGNYSUnGCVWF2laNY6vQdzOP4MUR0D73+ePvCCW+FWGWFDtxMzV9PJ
	 NRjc5ci4ibdyw==
Date: Tue, 13 Jan 2026 17:53:13 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Leo Yan <leo.yan@linux.dev>, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 01/14] perf parse-events: Refactor get_config_terms()
 to remove macros
Message-ID: <aWawuXJU0BVE4q-v@x1>
References: <20251222-james-perf-config-bits-v4-0-0608438186fc@linaro.org>
 <20251222-james-perf-config-bits-v4-1-0608438186fc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222-james-perf-config-bits-v4-1-0608438186fc@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_125317_582063_E04313A1 
X-CRM114-Status: GOOD (  30.51  )
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

On Mon, Dec 22, 2025 at 03:14:26PM +0000, James Clark wrote:
> The ADD_CONFIG_TERM() macros build the __type argument out of a partial
> EVSEL__CONFIG_TERM_x enum name. This means that they can't be called
> from a function where __type is a variable and it's also impossible to
> grep the codebase to find usages of these enums as they're never typed
> in full.
> 
> Fix this by removing the macros and replacing them with an
> add_config_term() function. It seems the main reason these existed in
> the first place was to avoid type punning and to write to a specific
> field in the union, but the same thing can be achieved with a single
> write to a u64 'val' field.
> 
> Running the Perf tests with "-fsanitize=undefined -fno-sanitize-recover"
> results in no new issues as a result of this change.
> 
> Reviewed-by: Ian Rogers <irogers@google.com>

So I see the tags here, will try applying...

- Arnaldo

> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  tools/perf/util/evsel_config.h |   1 +
>  tools/perf/util/parse-events.c | 146 ++++++++++++++++++++++++-----------------
>  2 files changed, 86 insertions(+), 61 deletions(-)
> 
> diff --git a/tools/perf/util/evsel_config.h b/tools/perf/util/evsel_config.h
> index bcd3a978f0c4..685fd8d5c4a8 100644
> --- a/tools/perf/util/evsel_config.h
> +++ b/tools/perf/util/evsel_config.h
> @@ -50,6 +50,7 @@ struct evsel_config_term {
>  		u64	      cfg_chg;
>  		char	      *str;
>  		int	      cpu;
> +		u64	      val;
>  	} val;
>  	bool weak;
>  };
> diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
> index 17c1c36a7bf9..46422286380f 100644
> --- a/tools/perf/util/parse-events.c
> +++ b/tools/perf/util/parse-events.c
> @@ -1116,105 +1116,107 @@ static int config_attr(struct perf_event_attr *attr,
>  	return 0;
>  }
>  
> -static int get_config_terms(const struct parse_events_terms *head_config,
> -			    struct list_head *head_terms)
> +static struct evsel_config_term *add_config_term(enum evsel_term_type type,
> +						 struct list_head *head_terms,
> +						 bool weak)
>  {
> -#define ADD_CONFIG_TERM(__type, __weak)				\
> -	struct evsel_config_term *__t;			\
> -								\
> -	__t = zalloc(sizeof(*__t));				\
> -	if (!__t)						\
> -		return -ENOMEM;					\
> -								\
> -	INIT_LIST_HEAD(&__t->list);				\
> -	__t->type       = EVSEL__CONFIG_TERM_ ## __type;	\
> -	__t->weak	= __weak;				\
> -	list_add_tail(&__t->list, head_terms)
> -
> -#define ADD_CONFIG_TERM_VAL(__type, __name, __val, __weak)	\
> -do {								\
> -	ADD_CONFIG_TERM(__type, __weak);			\
> -	__t->val.__name = __val;				\
> -} while (0)
> +	struct evsel_config_term *t;
>  
> -#define ADD_CONFIG_TERM_STR(__type, __val, __weak)		\
> -do {								\
> -	ADD_CONFIG_TERM(__type, __weak);			\
> -	__t->val.str = strdup(__val);				\
> -	if (!__t->val.str) {					\
> -		zfree(&__t);					\
> -		return -ENOMEM;					\
> -	}							\
> -	__t->free_str = true;					\
> -} while (0)
> +	t = zalloc(sizeof(*t));
> +	if (!t)
> +		return NULL;
> +
> +	INIT_LIST_HEAD(&t->list);
> +	t->type = type;
> +	t->weak	= weak;
> +	list_add_tail(&t->list, head_terms);
>  
> +	return t;
> +}
> +
> +static int get_config_terms(const struct parse_events_terms *head_config,
> +			    struct list_head *head_terms)
> +{
>  	struct parse_events_term *term;
>  
>  	list_for_each_entry(term, &head_config->terms, list) {
> +		struct evsel_config_term *new_term;
> +		enum evsel_term_type new_type;
> +		bool str_type = false;
> +		u64 val;
> +
>  		switch (term->type_term) {
>  		case PARSE_EVENTS__TERM_TYPE_SAMPLE_PERIOD:
> -			ADD_CONFIG_TERM_VAL(PERIOD, period, term->val.num, term->weak);
> +			new_type = EVSEL__CONFIG_TERM_PERIOD;
> +			val = term->val.num;
>  			break;
>  		case PARSE_EVENTS__TERM_TYPE_SAMPLE_FREQ:
> -			ADD_CONFIG_TERM_VAL(FREQ, freq, term->val.num, term->weak);
> +			new_type = EVSEL__CONFIG_TERM_FREQ;
> +			val = term->val.num;
>  			break;
>  		case PARSE_EVENTS__TERM_TYPE_TIME:
> -			ADD_CONFIG_TERM_VAL(TIME, time, term->val.num, term->weak);
> +			new_type = EVSEL__CONFIG_TERM_TIME;
> +			val = term->val.num;
>  			break;
>  		case PARSE_EVENTS__TERM_TYPE_CALLGRAPH:
> -			ADD_CONFIG_TERM_STR(CALLGRAPH, term->val.str, term->weak);
> +			new_type = EVSEL__CONFIG_TERM_CALLGRAPH;
> +			str_type = true;
>  			break;
>  		case PARSE_EVENTS__TERM_TYPE_BRANCH_SAMPLE_TYPE:
> -			ADD_CONFIG_TERM_STR(BRANCH, term->val.str, term->weak);
> +			new_type = EVSEL__CONFIG_TERM_BRANCH;
> +			str_type = true;
>  			break;
>  		case PARSE_EVENTS__TERM_TYPE_STACKSIZE:
> -			ADD_CONFIG_TERM_VAL(STACK_USER, stack_user,
> -					    term->val.num, term->weak);
> +			new_type = EVSEL__CONFIG_TERM_STACK_USER;
> +			val = term->val.num;
>  			break;
>  		case PARSE_EVENTS__TERM_TYPE_INHERIT:
> -			ADD_CONFIG_TERM_VAL(INHERIT, inherit,
> -					    term->val.num ? 1 : 0, term->weak);
> +			new_type = EVSEL__CONFIG_TERM_INHERIT;
> +			val = term->val.num ? 1 : 0;
>  			break;
>  		case PARSE_EVENTS__TERM_TYPE_NOINHERIT:
> -			ADD_CONFIG_TERM_VAL(INHERIT, inherit,
> -					    term->val.num ? 0 : 1, term->weak);
> +			new_type = EVSEL__CONFIG_TERM_INHERIT;
> +			val = term->val.num ? 0 : 1;
>  			break;
>  		case PARSE_EVENTS__TERM_TYPE_MAX_STACK:
> -			ADD_CONFIG_TERM_VAL(MAX_STACK, max_stack,
> -					    term->val.num, term->weak);
> +			new_type = EVSEL__CONFIG_TERM_MAX_STACK;
> +			val = term->val.num;
>  			break;
>  		case PARSE_EVENTS__TERM_TYPE_MAX_EVENTS:
> -			ADD_CONFIG_TERM_VAL(MAX_EVENTS, max_events,
> -					    term->val.num, term->weak);
> +			new_type = EVSEL__CONFIG_TERM_MAX_EVENTS;
> +			val = term->val.num;
>  			break;
>  		case PARSE_EVENTS__TERM_TYPE_OVERWRITE:
> -			ADD_CONFIG_TERM_VAL(OVERWRITE, overwrite,
> -					    term->val.num ? 1 : 0, term->weak);
> +			new_type = EVSEL__CONFIG_TERM_OVERWRITE;
> +			val = term->val.num ? 1 : 0;
>  			break;
>  		case PARSE_EVENTS__TERM_TYPE_NOOVERWRITE:
> -			ADD_CONFIG_TERM_VAL(OVERWRITE, overwrite,
> -					    term->val.num ? 0 : 1, term->weak);
> +			new_type = EVSEL__CONFIG_TERM_OVERWRITE;
> +			val = term->val.num ? 0 : 1;
>  			break;
>  		case PARSE_EVENTS__TERM_TYPE_DRV_CFG:
> -			ADD_CONFIG_TERM_STR(DRV_CFG, term->val.str, term->weak);
> +			new_type = EVSEL__CONFIG_TERM_DRV_CFG;
> +			str_type = true;
>  			break;
>  		case PARSE_EVENTS__TERM_TYPE_PERCORE:
> -			ADD_CONFIG_TERM_VAL(PERCORE, percore,
> -					    term->val.num ? true : false, term->weak);
> +			new_type = EVSEL__CONFIG_TERM_PERCORE;
> +			val = term->val.num ? true : false;
>  			break;
>  		case PARSE_EVENTS__TERM_TYPE_AUX_OUTPUT:
> -			ADD_CONFIG_TERM_VAL(AUX_OUTPUT, aux_output,
> -					    term->val.num ? 1 : 0, term->weak);
> +			new_type = EVSEL__CONFIG_TERM_AUX_OUTPUT;
> +			val = term->val.num ? 1 : 0;
>  			break;
>  		case PARSE_EVENTS__TERM_TYPE_AUX_ACTION:
> -			ADD_CONFIG_TERM_STR(AUX_ACTION, term->val.str, term->weak);
> +			new_type = EVSEL__CONFIG_TERM_AUX_ACTION;
> +			str_type = true;
>  			break;
>  		case PARSE_EVENTS__TERM_TYPE_AUX_SAMPLE_SIZE:
> -			ADD_CONFIG_TERM_VAL(AUX_SAMPLE_SIZE, aux_sample_size,
> -					    term->val.num, term->weak);
> +			new_type = EVSEL__CONFIG_TERM_AUX_SAMPLE_SIZE;
> +			val = term->val.num;
>  			break;
>  		case PARSE_EVENTS__TERM_TYPE_RATIO_TO_PREV:
> -			ADD_CONFIG_TERM_STR(RATIO_TO_PREV, term->val.str, term->weak);
> +			new_type = EVSEL__CONFIG_TERM_RATIO_TO_PREV;
> +			str_type = true;
>  			break;
>  		case PARSE_EVENTS__TERM_TYPE_USER:
>  		case PARSE_EVENTS__TERM_TYPE_CONFIG:
> @@ -1229,7 +1231,23 @@ do {								\
>  		case PARSE_EVENTS__TERM_TYPE_RAW:
>  		case PARSE_EVENTS__TERM_TYPE_CPU:
>  		default:
> -			break;
> +			/* Don't add a new term for these ones */
> +			continue;
> +		}
> +
> +		new_term = add_config_term(new_type, head_terms, term->weak);
> +		if (!new_term)
> +			return -ENOMEM;
> +
> +		if (str_type) {
> +			new_term->val.str = strdup(term->val.str);
> +			if (!new_term->val.str) {
> +				zfree(&new_term);
> +				return -ENOMEM;
> +			}
> +			new_term->free_str = true;
> +		} else {
> +			new_term->val.val = val;
>  		}
>  	}
>  	return 0;
> @@ -1290,10 +1308,16 @@ static int get_config_chgs(struct perf_pmu *pmu, struct parse_events_terms *head
>  		}
>  	}
>  
> -	if (bits)
> -		ADD_CONFIG_TERM_VAL(CFG_CHG, cfg_chg, bits, false);
> +	if (bits) {
> +		struct evsel_config_term *new_term;
> +
> +		new_term = add_config_term(EVSEL__CONFIG_TERM_CFG_CHG,
> +					   head_terms, false);
> +		if (!new_term)
> +			return -ENOMEM;
> +		new_term->val.cfg_chg = bits;
> +	}
>  
> -#undef ADD_CONFIG_TERM
>  	return 0;
>  }
>  
> 
> -- 
> 2.34.1
> 

