Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE3AD1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 12:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KHHLz1RLwGhRDW3I6vWs3gc+AOBl/KmAdildvKxDrHU=; b=YekYSQFe8X8uUg+AvPKHdtstAA
	+ybMYlmwzrMcqcO5cVcPNsmxVqc9yVa2A0UBNVOHYie/Cw/4DVXOOOWic/V7VWd8gGYAc23uOxehR
	HxFYNOwaB/6SBN0dkeJD/Ad1zfWOzVADeX4Hu0ocn6qFRvCY+V8sb7qBIwaohJsTM1FNsUVbbsRnP
	oN+YCLiG8DHj2IgQDQ74YvqgrUon0IM+uEWftTjgo8YToOQNVFBu0PrVa3w0ztdLjEKKd11XzzWwS
	BCUdQHEBuKFKCoWlmmuVjlpj0o4Dk2U8OK1KVwiJ7RL83VIGm9FbS2p+7WZozoAypXLhgbyV+KAc1
	tOr5Lvpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSx8t-0000000EH5H-2dnj;
	Tue, 09 Dec 2025 12:48:35 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSx8q-0000000EH4s-3eSg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 12:48:34 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so48096765e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 04:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765284511; x=1765889311; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KHHLz1RLwGhRDW3I6vWs3gc+AOBl/KmAdildvKxDrHU=;
        b=PyAKX+DoPQlCEQ3ByU618VKbA7EtaRXroMn+sG7XAdxkkmA3tg09mnxihJCp3yxvIy
         3dLBrxN3XqCND1eZrmxjhadagCu8QfOvjfgCHFgpqmd21vtl5JLQCkojXiM84f/DG5Gr
         aO/qAM7rROY4hargHhVIIcZxyHyNuVLe1JTrjG8C7bgJHp8Rdku5AYKMqcia+rhOfxrE
         DOhEyrWtaTnLT2EPbwHA5oiD2RdZeYH9ViPwhGpjkaKum9ORQv94MbQ8WVnMjo36FqHI
         bh6aN4o9nmNQrZE5cM4WLoWHfk+H8DD5YDZr/LTnQgTuUTzg/jwDT7lI7ffbF4IRi4Hl
         rwVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765284511; x=1765889311;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KHHLz1RLwGhRDW3I6vWs3gc+AOBl/KmAdildvKxDrHU=;
        b=Ia9hKhdL2c9csYs8LP3kfZbxTrTGHnQc20qIjvc0CaK9CPYM7LY2DKszLJnbA9Hh6+
         zZfSlm2DMjSyRrbc5s+gY/hDiHphdJXP7XFEuO9l8/5P9WNtpMlWUlqMygEN66YhrEJA
         CZ6UjlEoyfbTxZOiRtolp92eYSI2XwttbQVs6XJkAGNmgY25rpPhPEeQDRxDC70V+cK2
         7Erj3G+HTLqHkizmEOhAfl3z0fwhOG8/9XRO03DKecF/qYxb5UVM131mEpsTAPMdPH/b
         z7hbMKuWSXdSNvIZCW8DLr4kV/yjemAG8+upD1Azv6T7A0KIe6ZVhJPM2IJMgRe3FzXU
         po3w==
X-Forwarded-Encrypted: i=1; AJvYcCWwr9IWUrfox2P/E0JyWQRJ8bqtY0eDP3c7ZivNmZx3kMo4Cd4FJdVaPph3NeS4jSqvAcXd6qiJwpanHHpgRQ7p@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8/uUVXuSKb6U1Xbt+If2Uc1+qYq5aDkUICaJWEnNn2zk5zMhH
	uekS0TcGo2zo0SIzqXZ56Go2x4q/1SQOAzseMx6kTkWTFAx7/NXx3QNq8NYqAFWXJeE=
X-Gm-Gg: ASbGncs47VnNaMK+WHnaCawV0wwOSaKc1wo04BPQDkLu8N+pPkyGMhQXIRSQXqrt8OQ
	Agt3YxBSv6WZT4cK5I13dQItTYxs7NDxpUNglE+rCQ4wx9lSpnYqV669PusXcj+Hbizle9OUbiI
	b5jzF32KuXawveBlByYiH0NwnygzJZ5Td15YlMAdbW/dVEC1Nl904C+6l5fyDXf40n0H11OsE2m
	CnUeWmJ0t59QTjTGsTzlZrz3QKRpw+19H5Ve5rgKwmX6XlHc/khdwNQi9A2iZD6jSCW7wih+qQV
	0ECwumopVE8VgBHQqxqAiajgI8WmCPlHy8qoneGxXbZ5zvYBfb+vTMOrgppR3w4BiDNsLcvTMJi
	eYHYCgH86vo8chdEFxWPIhcdzlWv2nx5PxySmIpVG5kMRMCGoPs9MHE5FCXSJQx/MQQzmouIzIp
	m/ymFWA0UgBBBQ5me8
X-Google-Smtp-Source: AGHT+IH/tQGmS6GHJ3t67HVfHiCgCGjoF1ojSeipg6AskG+8k553iiIIAwskXFnSZzNHJohzxVNrTA==
X-Received: by 2002:a05:600c:4e14:b0:475:e067:f23d with SMTP id 5b1f17b1804b1-47939e2b900mr105471285e9.25.1765284510892;
        Tue, 09 Dec 2025 04:48:30 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d352a52sm31770665f8f.38.2025.12.09.04.48.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 04:48:30 -0800 (PST)
Message-ID: <6ba6bde3-f56b-4354-b336-4739cb1edb71@linaro.org>
Date: Tue, 9 Dec 2025 12:48:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] perf parse-events: Refactor get_config_terms()
 to remove macros
To: Linux perf Profiling <linux-perf-users@vger.kernel.org>
Cc: linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, John Garry <john.g.garry@oracle.com>,
 Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, leo.yan@arm.com
References: <20251208-james-perf-config-bits-v2-0-4ac0281993b0@linaro.org>
 <20251208-james-perf-config-bits-v2-1-4ac0281993b0@linaro.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251208-james-perf-config-bits-v2-1-4ac0281993b0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_044832_983346_B43A6B74 
X-CRM114-Status: GOOD (  29.81  )
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



On 08/12/2025 2:22 pm, James Clark wrote:
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
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>   tools/perf/util/evsel_config.h |   1 +
>   tools/perf/util/parse-events.c | 146 ++++++++++++++++++++++++-----------------
>   2 files changed, 86 insertions(+), 61 deletions(-)
> 
> diff --git a/tools/perf/util/evsel_config.h b/tools/perf/util/evsel_config.h
> index bcd3a978f0c4..685fd8d5c4a8 100644
> --- a/tools/perf/util/evsel_config.h
> +++ b/tools/perf/util/evsel_config.h
> @@ -50,6 +50,7 @@ struct evsel_config_term {
>   		u64	      cfg_chg;
>   		char	      *str;
>   		int	      cpu;
> +		u64	      val;
>   	} val;
>   	bool weak;
>   };
> diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
> index 17c1c36a7bf9..d5b009b4ebab 100644
> --- a/tools/perf/util/parse-events.c
> +++ b/tools/perf/util/parse-events.c
> @@ -1116,105 +1116,107 @@ static int config_attr(struct perf_event_attr *attr,
>   	return 0;
>   }
>   
> -static int get_config_terms(const struct parse_events_terms *head_config,
> -			    struct list_head *head_terms)
> +static struct evsel_config_term *add_config_term(enum evsel_term_type type,
> +						 struct list_head *head_terms,
> +						 bool weak)
>   {
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
>   	struct parse_events_term *term;
>   
>   	list_for_each_entry(term, &head_config->terms, list) {
> +		struct evsel_config_term *new_term;
> +		enum evsel_term_type new_type;
> +		char *str = NULL;
> +		u64 val;
> +
>   		switch (term->type_term) {
>   		case PARSE_EVENTS__TERM_TYPE_SAMPLE_PERIOD:
> -			ADD_CONFIG_TERM_VAL(PERIOD, period, term->val.num, term->weak);
> +			new_type = EVSEL__CONFIG_TERM_PERIOD;
> +			val = term->val.num;
>   			break;
>   		case PARSE_EVENTS__TERM_TYPE_SAMPLE_FREQ:
> -			ADD_CONFIG_TERM_VAL(FREQ, freq, term->val.num, term->weak);
> +			new_type = EVSEL__CONFIG_TERM_FREQ;
> +			val = term->val.num;
>   			break;
>   		case PARSE_EVENTS__TERM_TYPE_TIME:
> -			ADD_CONFIG_TERM_VAL(TIME, time, term->val.num, term->weak);
> +			new_type = EVSEL__CONFIG_TERM_TIME;
> +			val = term->val.num;
>   			break;
>   		case PARSE_EVENTS__TERM_TYPE_CALLGRAPH:
> -			ADD_CONFIG_TERM_STR(CALLGRAPH, term->val.str, term->weak);
> +			new_type = EVSEL__CONFIG_TERM_CALLGRAPH;
> +			str = term->val.str;
>   			break;
>   		case PARSE_EVENTS__TERM_TYPE_BRANCH_SAMPLE_TYPE:
> -			ADD_CONFIG_TERM_STR(BRANCH, term->val.str, term->weak);
> +			new_type = EVSEL__CONFIG_TERM_BRANCH;
> +			str = term->val.str;
>   			break;
>   		case PARSE_EVENTS__TERM_TYPE_STACKSIZE:
> -			ADD_CONFIG_TERM_VAL(STACK_USER, stack_user,
> -					    term->val.num, term->weak);
> +			new_type = EVSEL__CONFIG_TERM_STACK_USER;
> +			val = term->val.num;
>   			break;
>   		case PARSE_EVENTS__TERM_TYPE_INHERIT:
> -			ADD_CONFIG_TERM_VAL(INHERIT, inherit,
> -					    term->val.num ? 1 : 0, term->weak);
> +			new_type = EVSEL__CONFIG_TERM_INHERIT;
> +			val = term->val.num ? 1 : 0;
>   			break;
>   		case PARSE_EVENTS__TERM_TYPE_NOINHERIT:
> -			ADD_CONFIG_TERM_VAL(INHERIT, inherit,
> -					    term->val.num ? 0 : 1, term->weak);
> +			new_type = EVSEL__CONFIG_TERM_INHERIT;
> +			val = term->val.num ? 0 : 1;
>   			break;
>   		case PARSE_EVENTS__TERM_TYPE_MAX_STACK:
> -			ADD_CONFIG_TERM_VAL(MAX_STACK, max_stack,
> -					    term->val.num, term->weak);
> +			new_type = EVSEL__CONFIG_TERM_MAX_STACK;
> +			val = term->val.num;
>   			break;
>   		case PARSE_EVENTS__TERM_TYPE_MAX_EVENTS:
> -			ADD_CONFIG_TERM_VAL(MAX_EVENTS, max_events,
> -					    term->val.num, term->weak);
> +			new_type = EVSEL__CONFIG_TERM_MAX_EVENTS;
> +			val = term->val.num;
>   			break;
>   		case PARSE_EVENTS__TERM_TYPE_OVERWRITE:
> -			ADD_CONFIG_TERM_VAL(OVERWRITE, overwrite,
> -					    term->val.num ? 1 : 0, term->weak);
> +			new_type = EVSEL__CONFIG_TERM_OVERWRITE;
> +			val = term->val.num ? 1 : 0;
>   			break;
>   		case PARSE_EVENTS__TERM_TYPE_NOOVERWRITE:
> -			ADD_CONFIG_TERM_VAL(OVERWRITE, overwrite,
> -					    term->val.num ? 0 : 1, term->weak);
> +			new_type = EVSEL__CONFIG_TERM_OVERWRITE;
> +			val = term->val.num ? 0 : 1;
>   			break;
>   		case PARSE_EVENTS__TERM_TYPE_DRV_CFG:
> -			ADD_CONFIG_TERM_STR(DRV_CFG, term->val.str, term->weak);
> +			new_type = EVSEL__CONFIG_TERM_DRV_CFG;
> +			str = term->val.str;
>   			break;
>   		case PARSE_EVENTS__TERM_TYPE_PERCORE:
> -			ADD_CONFIG_TERM_VAL(PERCORE, percore,
> -					    term->val.num ? true : false, term->weak);
> +			new_type = EVSEL__CONFIG_TERM_PERCORE;
> +			val = term->val.num ? true : false;
>   			break;
>   		case PARSE_EVENTS__TERM_TYPE_AUX_OUTPUT:
> -			ADD_CONFIG_TERM_VAL(AUX_OUTPUT, aux_output,
> -					    term->val.num ? 1 : 0, term->weak);
> +			new_type = EVSEL__CONFIG_TERM_AUX_OUTPUT;
> +			val = term->val.num ? 1 : 0;
>   			break;
>   		case PARSE_EVENTS__TERM_TYPE_AUX_ACTION:
> -			ADD_CONFIG_TERM_STR(AUX_ACTION, term->val.str, term->weak);
> +			new_type = EVSEL__CONFIG_TERM_AUX_ACTION;
> +			str = term->val.str;
>   			break;
>   		case PARSE_EVENTS__TERM_TYPE_AUX_SAMPLE_SIZE:
> -			ADD_CONFIG_TERM_VAL(AUX_SAMPLE_SIZE, aux_sample_size,
> -					    term->val.num, term->weak);
> +			new_type = EVSEL__CONFIG_TERM_AUX_SAMPLE_SIZE;
> +			val = term->val.num;
>   			break;
>   		case PARSE_EVENTS__TERM_TYPE_RATIO_TO_PREV:
> -			ADD_CONFIG_TERM_STR(RATIO_TO_PREV, term->val.str, term->weak);
> +			new_type = EVSEL__CONFIG_TERM_RATIO_TO_PREV;
> +			str = term->val.str;
>   			break;
>   		case PARSE_EVENTS__TERM_TYPE_USER:
>   		case PARSE_EVENTS__TERM_TYPE_CONFIG:
> @@ -1229,7 +1231,23 @@ do {								\
>   		case PARSE_EVENTS__TERM_TYPE_RAW:
>   		case PARSE_EVENTS__TERM_TYPE_CPU:
>   		default:
> -			break;
> +			/* Don't add a new term for these ones */
> +			continue;
> +		}
> +
> +		new_term = add_config_term(new_type, head_terms, term->weak);
> +		if (!new_term)
> +			return -ENOMEM;
> +
> +		if (str) {
> +			new_term->val.str = strdup(str);
> +			if (!new_term->val.str) {
> +				zfree(&new_term);
> +				return -ENOMEM;
> +			}
> +			new_term->free_str = true;
> +		} else {

This will incorrectly hit the else if term->val.str is NULL. Not sure if 
that can happen but will fix anyway.

> +			new_term->val.val = val;

There's an uninitialized variable warning for val here on release 
builds. Will fix too

>   		}
>   	}
>   	return 0;
> @@ -1290,10 +1308,16 @@ static int get_config_chgs(struct perf_pmu *pmu, struct parse_events_terms *head
>   		}
>   	}
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
>   	return 0;
>   }
>   
> 


