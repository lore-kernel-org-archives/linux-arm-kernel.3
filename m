Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE4E9D3B98C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 17:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZUOgxr+7cSYt/btR8gXlm/+anfYygWBdHJEIEgIls30=; b=JXM82hhCeM6WEgv2y8JdoNecMw
	KY3fv+sZOt2wh0WM6PGow0xp9MEzK2ZMVjMyIpiSz/GSzJvlwUrRcTRnIseoX44LTH+7m/6A3y79r
	OuvJy5DFhQGjeC7NXZUx0sPURtiz8jKH9Bc2M+XlhE88OQg9Hyz+2Amy6fcuf7YRe2o7c8k4IyNtw
	Og86ECsqivNWg3f3Likvhbt9qnaHpQwGu/ug/iwx/gBJ5//+sevFiMJwT8zcEOGfPcqzMQNCYsQ2J
	T5PK84kXR/5kcYq1js+rJ/BxV/Cds7ADxupN4g87U2BC2bfzt9Bx921ThGpUeMBeQTOa0aSh5uRvs
	GSnb9SPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT1wL-0000000EcZr-0YF4;
	Tue, 09 Dec 2025 17:55:57 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT1wI-0000000EcZT-0H1I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 17:55:55 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-42e2e628f8aso2828165f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 09:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765302952; x=1765907752; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZUOgxr+7cSYt/btR8gXlm/+anfYygWBdHJEIEgIls30=;
        b=mZYuX36C/2eStSHPXmIeZfxPpfS6wY3LXGelHnC/JdqtdvJlRkyeJXsWle8jW/2kqV
         0YLJCg4QTwnYsxmloW1j2hJ9KdWfEmBmuN/K0peYRHRjO3DSP/gmsrmzXGEI+WbJX2AJ
         zet6tPjVn9blTCj+exhkHZEf/YykVjCn407q7XzeAyTytjkWPwrUXZcUKQgYHy1+Pm+r
         uxt3h8gnuabTT+NvHbXDXIm7Zp+g5M16XYd4mYSMPbIxrPKQwmc6Egjufcz7dcvWHcrg
         Hxa12IgdnaFmGv1G1IjxrV8thhTTNAPxCIG+hHBZkB8Ph9E+6Tgc8aotivT2ruSqjOSy
         UMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765302952; x=1765907752;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZUOgxr+7cSYt/btR8gXlm/+anfYygWBdHJEIEgIls30=;
        b=M/wg4aBwR3NcDR6WMZrqrjZSP25MtzBcDG8Vl1R7S1ktG2iNOnGZzaGESiIUWga0id
         TEZXJ72D7/aCC46pFs/AvkHwSKcG8/9xAOOncxP0cdMfG3ytj5+imusbu8FxNAOW4ymv
         /79Ucz6V04bWh2xmjxCJR/Uj6yoG2kgtDqZC1qbn5qhjZOino6JnhJfGY6DwdaBBqVsY
         mBp+0OZIEUqausdtk4GSYwP2/Jqf+RLxPhoY1rGc4AoDkpjDyXeihtKmgLsGRPa1l3Ql
         aYs87Hl2n6UbtduEIlSbqIHNjSKJRZnWVDi06dEO/nbZXFL3bOVXRxVfF9isQ1U83SJy
         CZvA==
X-Forwarded-Encrypted: i=1; AJvYcCV7ssgijUu7k4Gh3rQLrPiVjpnZDeTjqiY7U209CDl/ITJwirhj7AuK9XMJkxZ4AgI2UhhwRiXHt4LIxGHbpDtn@lists.infradead.org
X-Gm-Message-State: AOJu0Ywuel2e36dyc+kPOcPmLrRjJIzleI52lMlOCyiUe+H0f02SQHrE
	nC2I6PbJQ4CzwdLTwKSDPnEznp2C/DlrATnt09ItMqL8B7+H4Qe/IOdfgpcr3UcJK48=
X-Gm-Gg: AY/fxX6PqJru/iOA9mxUC+HX44YkWs7T4R2yQxppKNSVVEfV65pp0qa2i1xt8inSdlW
	o78xMwM5kgH7nxFUF/eanReTLcboId9aiBH5XZximkOxe0NaqRChYpM822Mh9DE4uEWSriAc1Uv
	Wzmex72+ee5ccingfpkRVyn06LTHKSdQPf+EddKLnvGPZq8eWbNiH90VjY0cALrVmQwu37HuW1l
	IA9slTCnvHIpK26+XkdhU638oE2x+KRyOpNN9jMiBa5nEveKn+jpA/ljLoei+dHujgqPPnZcxS3
	WmGFIfpIYDie2tnbiQeOIflrCSCPSJbXbPycIsip1SRTt2jCFF6GTHdhMAWUW5FCRzwW1uzI6Uf
	eU+bpSyj40MMJGL2XWFnlwEVL6ZNgewD/8uczYPgh1vbEHYFUBke5981dxeoMdCiX/LjwdTcGs3
	YpmcSrU46AnPQl14xvug==
X-Google-Smtp-Source: AGHT+IGc4OjZMP1xzbym2F8zYcMdwysP1sgVkT7Ss3kIptxke0S8T0dAWuWUBtezxhVnNmhyFD50nQ==
X-Received: by 2002:a05:6000:2884:b0:429:f14a:9807 with SMTP id ffacd0b85a97d-42f89f6348amr11888073f8f.40.1765302951729;
        Tue, 09 Dec 2025 09:55:51 -0800 (PST)
Received: from [192.168.1.183] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d331af5sm31559379f8f.31.2025.12.09.09.55.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 09:55:51 -0800 (PST)
Message-ID: <d275d2fb-8670-4832-b9c4-de98376e58ad@linaro.org>
Date: Tue, 9 Dec 2025 17:55:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] perf parse-events: Refactor get_config_terms()
 to remove macros
To: Ian Rogers <irogers@google.com>
Cc: Linux perf Profiling <linux-perf-users@vger.kernel.org>,
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, John Garry <john.g.garry@oracle.com>,
 Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, leo.yan@arm.com
References: <20251208-james-perf-config-bits-v2-0-4ac0281993b0@linaro.org>
 <20251208-james-perf-config-bits-v2-1-4ac0281993b0@linaro.org>
 <6ba6bde3-f56b-4354-b336-4739cb1edb71@linaro.org>
 <CAP-5=fV_Y5W2RyJhBgnk49JuTf8EsyisY-LfL3sVhC4TVRC_gg@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAP-5=fV_Y5W2RyJhBgnk49JuTf8EsyisY-LfL3sVhC4TVRC_gg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_095554_268264_1CE0299E 
X-CRM114-Status: GOOD (  19.46  )
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



On 09/12/2025 15:58, Ian Rogers wrote:
> On Tue, Dec 9, 2025 at 4:48 AM James Clark <james.clark@linaro.org> wrote:
>>
>> On 08/12/2025 2:22 pm, James Clark wrote:
>>> The ADD_CONFIG_TERM() macros build the __type argument out of a partial
>>> EVSEL__CONFIG_TERM_x enum name. This means that they can't be called
>>> from a function where __type is a variable and it's also impossible to
>>> grep the codebase to find usages of these enums as they're never typed
>>> in full.
>>>
>>> Fix this by removing the macros and replacing them with an
>>> add_config_term() function. It seems the main reason these existed in
>>> the first place was to avoid type punning and to write to a specific
>>> field in the union, but the same thing can be achieved with a single
>>> write to a u64 'val' field.
>>>
>>> Signed-off-by: James Clark <james.clark@linaro.org>
>>> ---
>>>    tools/perf/util/evsel_config.h |   1 +
>>>    tools/perf/util/parse-events.c | 146 ++++++++++++++++++++++++-----------------
>>>    2 files changed, 86 insertions(+), 61 deletions(-)
>>>
>>> diff --git a/tools/perf/util/evsel_config.h b/tools/perf/util/evsel_config.h
>>> index bcd3a978f0c4..685fd8d5c4a8 100644
>>> --- a/tools/perf/util/evsel_config.h
>>> +++ b/tools/perf/util/evsel_config.h
>>> @@ -50,6 +50,7 @@ struct evsel_config_term {
>>>                u64           cfg_chg;
>>>                char          *str;
>>>                int           cpu;
>>> +             u64           val;
>>>        } val;
>>>        bool weak;
>>>    };
>>> diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
>>> index 17c1c36a7bf9..d5b009b4ebab 100644
>>> --- a/tools/perf/util/parse-events.c
>>> +++ b/tools/perf/util/parse-events.c
>>> @@ -1116,105 +1116,107 @@ static int config_attr(struct perf_event_attr *attr,
>>>        return 0;
>>>    }
>>>
>>> -static int get_config_terms(const struct parse_events_terms *head_config,
>>> -                         struct list_head *head_terms)
>>> +static struct evsel_config_term *add_config_term(enum evsel_term_type type,
>>> +                                              struct list_head *head_terms,
>>> +                                              bool weak)
>>>    {
>>> -#define ADD_CONFIG_TERM(__type, __weak)                              \
>>> -     struct evsel_config_term *__t;                  \
>>> -                                                             \
>>> -     __t = zalloc(sizeof(*__t));                             \
>>> -     if (!__t)                                               \
>>> -             return -ENOMEM;                                 \
>>> -                                                             \
>>> -     INIT_LIST_HEAD(&__t->list);                             \
>>> -     __t->type       = EVSEL__CONFIG_TERM_ ## __type;        \
>>> -     __t->weak       = __weak;                               \
>>> -     list_add_tail(&__t->list, head_terms)
>>> -
>>> -#define ADD_CONFIG_TERM_VAL(__type, __name, __val, __weak)   \
>>> -do {                                                         \
>>> -     ADD_CONFIG_TERM(__type, __weak);                        \
>>> -     __t->val.__name = __val;                                \
>>> -} while (0)
>>> +     struct evsel_config_term *t;
>>>
>>> -#define ADD_CONFIG_TERM_STR(__type, __val, __weak)           \
>>> -do {                                                         \
>>> -     ADD_CONFIG_TERM(__type, __weak);                        \
>>> -     __t->val.str = strdup(__val);                           \
>>> -     if (!__t->val.str) {                                    \
>>> -             zfree(&__t);                                    \
>>> -             return -ENOMEM;                                 \
>>> -     }                                                       \
>>> -     __t->free_str = true;                                   \
>>> -} while (0)
>>> +     t = zalloc(sizeof(*t));
>>> +     if (!t)
>>> +             return NULL;
>>> +
>>> +     INIT_LIST_HEAD(&t->list);
>>> +     t->type = type;
>>> +     t->weak = weak;
>>> +     list_add_tail(&t->list, head_terms);
>>>
>>> +     return t;
>>> +}
>>> +
>>> +static int get_config_terms(const struct parse_events_terms *head_config,
>>> +                         struct list_head *head_terms)
>>> +{
>>>        struct parse_events_term *term;
>>>
>>>        list_for_each_entry(term, &head_config->terms, list) {
>>> +             struct evsel_config_term *new_term;
>>> +             enum evsel_term_type new_type;
>>> +             char *str = NULL;
>>> +             u64 val;
>>> +
>>>                switch (term->type_term) {
>>>                case PARSE_EVENTS__TERM_TYPE_SAMPLE_PERIOD:
>>> -                     ADD_CONFIG_TERM_VAL(PERIOD, period, term->val.num, term->weak);
>>> +                     new_type = EVSEL__CONFIG_TERM_PERIOD;
>>> +                     val = term->val.num;
>>>                        break;
>>>                case PARSE_EVENTS__TERM_TYPE_SAMPLE_FREQ:
>>> -                     ADD_CONFIG_TERM_VAL(FREQ, freq, term->val.num, term->weak);
>>> +                     new_type = EVSEL__CONFIG_TERM_FREQ;
>>> +                     val = term->val.num;
>>>                        break;
>>>                case PARSE_EVENTS__TERM_TYPE_TIME:
>>> -                     ADD_CONFIG_TERM_VAL(TIME, time, term->val.num, term->weak);
>>> +                     new_type = EVSEL__CONFIG_TERM_TIME;
>>> +                     val = term->val.num;
>>>                        break;
>>>                case PARSE_EVENTS__TERM_TYPE_CALLGRAPH:
>>> -                     ADD_CONFIG_TERM_STR(CALLGRAPH, term->val.str, term->weak);
>>> +                     new_type = EVSEL__CONFIG_TERM_CALLGRAPH;
>>> +                     str = term->val.str;
>>>                        break;
>>>                case PARSE_EVENTS__TERM_TYPE_BRANCH_SAMPLE_TYPE:
>>> -                     ADD_CONFIG_TERM_STR(BRANCH, term->val.str, term->weak);
>>> +                     new_type = EVSEL__CONFIG_TERM_BRANCH;
>>> +                     str = term->val.str;
>>>                        break;
>>>                case PARSE_EVENTS__TERM_TYPE_STACKSIZE:
>>> -                     ADD_CONFIG_TERM_VAL(STACK_USER, stack_user,
>>> -                                         term->val.num, term->weak);
>>> +                     new_type = EVSEL__CONFIG_TERM_STACK_USER;
>>> +                     val = term->val.num;
>>>                        break;
>>>                case PARSE_EVENTS__TERM_TYPE_INHERIT:
>>> -                     ADD_CONFIG_TERM_VAL(INHERIT, inherit,
>>> -                                         term->val.num ? 1 : 0, term->weak);
>>> +                     new_type = EVSEL__CONFIG_TERM_INHERIT;
>>> +                     val = term->val.num ? 1 : 0;
>>>                        break;
>>>                case PARSE_EVENTS__TERM_TYPE_NOINHERIT:
>>> -                     ADD_CONFIG_TERM_VAL(INHERIT, inherit,
>>> -                                         term->val.num ? 0 : 1, term->weak);
>>> +                     new_type = EVSEL__CONFIG_TERM_INHERIT;
>>> +                     val = term->val.num ? 0 : 1;
>>>                        break;
>>>                case PARSE_EVENTS__TERM_TYPE_MAX_STACK:
>>> -                     ADD_CONFIG_TERM_VAL(MAX_STACK, max_stack,
>>> -                                         term->val.num, term->weak);
>>> +                     new_type = EVSEL__CONFIG_TERM_MAX_STACK;
>>> +                     val = term->val.num;
>>>                        break;
>>>                case PARSE_EVENTS__TERM_TYPE_MAX_EVENTS:
>>> -                     ADD_CONFIG_TERM_VAL(MAX_EVENTS, max_events,
>>> -                                         term->val.num, term->weak);
>>> +                     new_type = EVSEL__CONFIG_TERM_MAX_EVENTS;
>>> +                     val = term->val.num;
>>>                        break;
>>>                case PARSE_EVENTS__TERM_TYPE_OVERWRITE:
>>> -                     ADD_CONFIG_TERM_VAL(OVERWRITE, overwrite,
>>> -                                         term->val.num ? 1 : 0, term->weak);
>>> +                     new_type = EVSEL__CONFIG_TERM_OVERWRITE;
>>> +                     val = term->val.num ? 1 : 0;
>>>                        break;
>>>                case PARSE_EVENTS__TERM_TYPE_NOOVERWRITE:
>>> -                     ADD_CONFIG_TERM_VAL(OVERWRITE, overwrite,
>>> -                                         term->val.num ? 0 : 1, term->weak);
>>> +                     new_type = EVSEL__CONFIG_TERM_OVERWRITE;
>>> +                     val = term->val.num ? 0 : 1;
>>>                        break;
>>>                case PARSE_EVENTS__TERM_TYPE_DRV_CFG:
>>> -                     ADD_CONFIG_TERM_STR(DRV_CFG, term->val.str, term->weak);
>>> +                     new_type = EVSEL__CONFIG_TERM_DRV_CFG;
>>> +                     str = term->val.str;
>>>                        break;
>>>                case PARSE_EVENTS__TERM_TYPE_PERCORE:
>>> -                     ADD_CONFIG_TERM_VAL(PERCORE, percore,
>>> -                                         term->val.num ? true : false, term->weak);
>>> +                     new_type = EVSEL__CONFIG_TERM_PERCORE;
>>> +                     val = term->val.num ? true : false;
>>>                        break;
>>>                case PARSE_EVENTS__TERM_TYPE_AUX_OUTPUT:
>>> -                     ADD_CONFIG_TERM_VAL(AUX_OUTPUT, aux_output,
>>> -                                         term->val.num ? 1 : 0, term->weak);
>>> +                     new_type = EVSEL__CONFIG_TERM_AUX_OUTPUT;
>>> +                     val = term->val.num ? 1 : 0;
>>>                        break;
>>>                case PARSE_EVENTS__TERM_TYPE_AUX_ACTION:
>>> -                     ADD_CONFIG_TERM_STR(AUX_ACTION, term->val.str, term->weak);
>>> +                     new_type = EVSEL__CONFIG_TERM_AUX_ACTION;
>>> +                     str = term->val.str;
>>>                        break;
>>>                case PARSE_EVENTS__TERM_TYPE_AUX_SAMPLE_SIZE:
>>> -                     ADD_CONFIG_TERM_VAL(AUX_SAMPLE_SIZE, aux_sample_size,
>>> -                                         term->val.num, term->weak);
>>> +                     new_type = EVSEL__CONFIG_TERM_AUX_SAMPLE_SIZE;
>>> +                     val = term->val.num;
>>>                        break;
>>>                case PARSE_EVENTS__TERM_TYPE_RATIO_TO_PREV:
>>> -                     ADD_CONFIG_TERM_STR(RATIO_TO_PREV, term->val.str, term->weak);
>>> +                     new_type = EVSEL__CONFIG_TERM_RATIO_TO_PREV;
>>> +                     str = term->val.str;
>>>                        break;
>>>                case PARSE_EVENTS__TERM_TYPE_USER:
>>>                case PARSE_EVENTS__TERM_TYPE_CONFIG:
>>> @@ -1229,7 +1231,23 @@ do {                                                           \
>>>                case PARSE_EVENTS__TERM_TYPE_RAW:
>>>                case PARSE_EVENTS__TERM_TYPE_CPU:
>>>                default:
>>> -                     break;
>>> +                     /* Don't add a new term for these ones */
>>> +                     continue;
>>> +             }
>>> +
>>> +             new_term = add_config_term(new_type, head_terms, term->weak);
>>> +             if (!new_term)
>>> +                     return -ENOMEM;
>>> +
>>> +             if (str) {
>>> +                     new_term->val.str = strdup(str);
>>> +                     if (!new_term->val.str) {
>>> +                             zfree(&new_term);
>>> +                             return -ENOMEM;
>>> +                     }
>>> +                     new_term->free_str = true;
>>> +             } else {
>>
>> This will incorrectly hit the else if term->val.str is NULL. Not sure if
>> that can happen but will fix anyway.
>>
>>> +                     new_term->val.val = val;
>>
>> There's an uninitialized variable warning for val here on release
>> builds. Will fix too
> 
> I'm not sure how I feel about the change, but did you check that it is
> ubsan clean? I worry it is introducing writes to "val" and then reads
> from say "period" in the evsel_config_term val union. I believe ubsan
> will flag this as:
> https://en.cppreference.com/w/cpp/language/union.html
> "It is undefined behavior to read from the member of the union that
> wasn't most recently written."
> 
> Thanks,
> Ian
> 

Maybe for C++, but not for C [1]:

   Accessing my_union.i after most recently writing to the other member,
   my_union.d, is an allowed form of type-punning in C, provided that the
   member read is not larger than the one whose value was set

Type punning with unions is widely used in the kernel and there are a 
couple of instances in Perf. There are tons of discussions about it on 
the mailing lists too. I can check it with ubsan though.

[1]: https://en.wikipedia.org/wiki/Type_punning#C_and_C++

>>>                }
>>>        }
>>>        return 0;
>>> @@ -1290,10 +1308,16 @@ static int get_config_chgs(struct perf_pmu *pmu, struct parse_events_terms *head
>>>                }
>>>        }
>>>
>>> -     if (bits)
>>> -             ADD_CONFIG_TERM_VAL(CFG_CHG, cfg_chg, bits, false);
>>> +     if (bits) {
>>> +             struct evsel_config_term *new_term;
>>> +
>>> +             new_term = add_config_term(EVSEL__CONFIG_TERM_CFG_CHG,
>>> +                                        head_terms, false);
>>> +             if (!new_term)
>>> +                     return -ENOMEM;
>>> +             new_term->val.cfg_chg = bits;
>>> +     }
>>>
>>> -#undef ADD_CONFIG_TERM
>>>        return 0;
>>>    }
>>>
>>>
>>


