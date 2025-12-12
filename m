Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B870D4922D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 14:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UHks+Tz5Tz1S6b0QtdZfqGNmwtHIR1PhIe2ld/ROsMY=; b=axdNl2mv/D4dBQrPLBn+4nwffj
	/g0kTHO6+kzvsEH21UeWUnnqnMTlirPTPUntpu/gxzQ/gvR8OIGt8L3CGuigBxjLwyFqJQ26vaOWU
	dSo4j0esvcTIDABDIbLhLBE4jxMPnS+rNFenlw2U30TZAfh08+aLS5gGXkaJ5XTCuND36W31xT1wM
	VsaoxdHzTGG1TzChY1voIQKYBXlHgKl2TCKutCqXiEYWlSDd7cf7gonvbfJ3ZTq0/hxM40OekRChk
	ZDxHvRtODmfQRfpNXPehr9KuyeiaeJnBRVE9ODsEzQ5WxuKN7A2/LRLyhHSYYUjXdsiFQDTIP1g16
	N2eMTLyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU4NI-00000000cws-3sVD;
	Fri, 12 Dec 2025 14:44:04 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU4NG-00000000cwN-23jo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 14:44:04 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b770f4accc0so226415666b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 06:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765550640; x=1766155440; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UHks+Tz5Tz1S6b0QtdZfqGNmwtHIR1PhIe2ld/ROsMY=;
        b=FLB+S68CLgOLifafwSfqK8aWeEjJuYpzn6Yp8HMmH8O4QqbGpTw6dRzMziWIh84/Ox
         RZY+y87cpbF38pTIkfuqFcwTKrzYXT1IeUEx93U9gaXs2a+fMwmhjYr9uVOZv0iIbZtp
         j/aPz7txAgAuXc6YTjv36B3AawYw3CDtadNs8Jc/EiruHqN/qC1n6HHNnV/r5ktod3e8
         1kiXkxkKrec4QI6sc18Dz6BmYf0lB6tIA2mjKV7Y5SDKRYtLQojfuDufYXAGPz4o4LVw
         lcq9+zhCcV2mvOLgx4XYBG+BSvXGXV94NuQ0nsNHLrTgSmWIEmHIWKBxMj7OksBRhZ7B
         fa5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765550640; x=1766155440;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UHks+Tz5Tz1S6b0QtdZfqGNmwtHIR1PhIe2ld/ROsMY=;
        b=BQ1WVfBbvGEVuKNdTfOv9gy8qQcuUPAItroSp8Uv0NKK2SsCsHtFY/Ha2EvlAL9Yq8
         /EQEEiGlAQnkkL5775mVgbtK8zFD/C9PijYHL7ZauvnBysiAqjwwjhUnyPB3+Fvbnx4I
         SAYNkvqrtvYJALRESby5EStpJVUJKVhqbEbjypKdYZbIeplfq+9Hk9YJlhttghjaqylJ
         Gd9RZvxfdbyOLNz3tpaEZNyhZN6pbcB7q5nYSWw1t+uWUIO0vPWiI3iIxxWa+ODOqvkw
         bOUwZXrzThg4Su9vzaPc1/pN2YbFYU6t6P03zfUwRXkcwTVKAAt1rC5bLoFwWkhVqWGP
         pzfQ==
X-Forwarded-Encrypted: i=1; AJvYcCULvhZW9d5t6+3gIt6+rqT5XJSJyDysuc259P/bYV7Js6G59/Res8UWftpzsIVmBggauhyR56sjgDJZ9jXq1Kt/@lists.infradead.org
X-Gm-Message-State: AOJu0YzjcS6v6MyOhQrVEsIN+q7DC3gQJQPjkeVxLQo76nsEULAzBpfi
	2V5dQE/Zc2B0Ky54E3lFFwuhH0gJjIi9Mm3siWOBdBQNFbrqPbib5LOE7gwokKSvJJI=
X-Gm-Gg: AY/fxX6/x0D4hM6ic2KBWOdRuqq33JBkqMFJaw3+cgtvFaARcdyLPxdUMqbZdSkWR8q
	Bzt8K6i9VzdcclHYCoTzROK8ymOuGs8xGt/G8Dm8XgehoaSlAVWfFczDgvjteDS/XJiPThMIQQO
	kTctirDaCNiGl76ADWKYRAe/oYEX7s50azWQFFUBL90SqXrvu2sEG4Jr+GtyffWeiR0svpv29Kp
	f6c2Tc8UdQ+R2FBFu0D8LaY9IfbWSJabHY94t1sAwDaCU8NfWodyH1IRIeISf8gTT6xVM7VZgOD
	n0Svh5oLo1+lv5+8Wk7uSGSD9ZLMbK612b5/ivvRgDsXLjSN1eadnd/LH3C6LIv8w1tsLMzim5P
	yql7LNNWA4yljWdVTg6VDidl1hcpL2RJbzzUQeYv55qho8ToCd3rPNARba4PBT+6lmlBZvy6s9l
	zgUWRNkD+z16KLeAGplBhr
X-Google-Smtp-Source: AGHT+IE3svTtW70pxSeY9K0szvV0szRg7UnbT0HaZetFEyEZG4iGhZlbXeVU+9M6CTK3kAp5gnBY8g==
X-Received: by 2002:a17:907:8694:b0:b73:1e09:7377 with SMTP id a640c23a62f3a-b7d23aa5631mr230371666b.58.1765550639940;
        Fri, 12 Dec 2025 06:43:59 -0800 (PST)
Received: from [192.168.0.108] ([130.185.218.160])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa29be92sm574681666b.10.2025.12.12.06.43.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Dec 2025 06:43:59 -0800 (PST)
Message-ID: <99e9614d-a956-40dc-a86b-a4c5aea0fe8a@linaro.org>
Date: Fri, 12 Dec 2025 16:43:57 +0200
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
 <d275d2fb-8670-4832-b9c4-de98376e58ad@linaro.org>
 <CAP-5=fW6_MVrezxT6ssjhWnYtF_51nvuFCCSPaHzqwYw9EK4Wg@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAP-5=fW6_MVrezxT6ssjhWnYtF_51nvuFCCSPaHzqwYw9EK4Wg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_064402_709407_C802327A 
X-CRM114-Status: GOOD (  17.45  )
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



On 09/12/2025 20:09, Ian Rogers wrote:
> On Tue, Dec 9, 2025 at 9:55 AM James Clark <james.clark@linaro.org> wrote:
>>
>> On 09/12/2025 15:58, Ian Rogers wrote:
>>> On Tue, Dec 9, 2025 at 4:48 AM James Clark <james.clark@linaro.org> wrote:
>>>>
>>>> On 08/12/2025 2:22 pm, James Clark wrote:
>>>>> The ADD_CONFIG_TERM() macros build the __type argument out of a partial
>>>>> EVSEL__CONFIG_TERM_x enum name. This means that they can't be called
>>>>> from a function where __type is a variable and it's also impossible to
>>>>> grep the codebase to find usages of these enums as they're never typed
>>>>> in full.
>>>>>
>>>>> Fix this by removing the macros and replacing them with an
>>>>> add_config_term() function. It seems the main reason these existed in
>>>>> the first place was to avoid type punning and to write to a specific
>>>>> field in the union, but the same thing can be achieved with a single
>>>>> write to a u64 'val' field.
>>>>>
>>>>> Signed-off-by: James Clark <james.clark@linaro.org>
>>>>> ---
>>>>>     tools/perf/util/evsel_config.h |   1 +
>>>>>     tools/perf/util/parse-events.c | 146 ++++++++++++++++++++++++-----------------
>>>>>     2 files changed, 86 insertions(+), 61 deletions(-)
>>>>>
>>>>> diff --git a/tools/perf/util/evsel_config.h b/tools/perf/util/evsel_config.h
>>>>> index bcd3a978f0c4..685fd8d5c4a8 100644
>>>>> --- a/tools/perf/util/evsel_config.h
>>>>> +++ b/tools/perf/util/evsel_config.h
>>>>> @@ -50,6 +50,7 @@ struct evsel_config_term {
>>>>>                 u64           cfg_chg;
>>>>>                 char          *str;
>>>>>                 int           cpu;
>>>>> +             u64           val;
>>>>>         } val;
>>>>>         bool weak;
>>>>>     };
>>>>> diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
>>>>> index 17c1c36a7bf9..d5b009b4ebab 100644
>>>>> --- a/tools/perf/util/parse-events.c
>>>>> +++ b/tools/perf/util/parse-events.c
>>>>> @@ -1116,105 +1116,107 @@ static int config_attr(struct perf_event_attr *attr,
>>>>>         return 0;
>>>>>     }
>>>>>
>>>>> -static int get_config_terms(const struct parse_events_terms *head_config,
>>>>> -                         struct list_head *head_terms)
>>>>> +static struct evsel_config_term *add_config_term(enum evsel_term_type type,
>>>>> +                                              struct list_head *head_terms,
>>>>> +                                              bool weak)
>>>>>     {
>>>>> -#define ADD_CONFIG_TERM(__type, __weak)                              \
>>>>> -     struct evsel_config_term *__t;                  \
>>>>> -                                                             \
>>>>> -     __t = zalloc(sizeof(*__t));                             \
>>>>> -     if (!__t)                                               \
>>>>> -             return -ENOMEM;                                 \
>>>>> -                                                             \
>>>>> -     INIT_LIST_HEAD(&__t->list);                             \
>>>>> -     __t->type       = EVSEL__CONFIG_TERM_ ## __type;        \
>>>>> -     __t->weak       = __weak;                               \
>>>>> -     list_add_tail(&__t->list, head_terms)
>>>>> -
>>>>> -#define ADD_CONFIG_TERM_VAL(__type, __name, __val, __weak)   \
>>>>> -do {                                                         \
>>>>> -     ADD_CONFIG_TERM(__type, __weak);                        \
>>>>> -     __t->val.__name = __val;                                \
>>>>> -} while (0)
>>>>> +     struct evsel_config_term *t;
>>>>>
>>>>> -#define ADD_CONFIG_TERM_STR(__type, __val, __weak)           \
>>>>> -do {                                                         \
>>>>> -     ADD_CONFIG_TERM(__type, __weak);                        \
>>>>> -     __t->val.str = strdup(__val);                           \
>>>>> -     if (!__t->val.str) {                                    \
>>>>> -             zfree(&__t);                                    \
>>>>> -             return -ENOMEM;                                 \
>>>>> -     }                                                       \
>>>>> -     __t->free_str = true;                                   \
>>>>> -} while (0)
>>>>> +     t = zalloc(sizeof(*t));
>>>>> +     if (!t)
>>>>> +             return NULL;
>>>>> +
>>>>> +     INIT_LIST_HEAD(&t->list);
>>>>> +     t->type = type;
>>>>> +     t->weak = weak;
>>>>> +     list_add_tail(&t->list, head_terms);
>>>>>
>>>>> +     return t;
>>>>> +}
>>>>> +
>>>>> +static int get_config_terms(const struct parse_events_terms *head_config,
>>>>> +                         struct list_head *head_terms)
>>>>> +{
>>>>>         struct parse_events_term *term;
>>>>>
>>>>>         list_for_each_entry(term, &head_config->terms, list) {
>>>>> +             struct evsel_config_term *new_term;
>>>>> +             enum evsel_term_type new_type;
>>>>> +             char *str = NULL;
>>>>> +             u64 val;
>>>>> +
>>>>>                 switch (term->type_term) {
>>>>>                 case PARSE_EVENTS__TERM_TYPE_SAMPLE_PERIOD:
>>>>> -                     ADD_CONFIG_TERM_VAL(PERIOD, period, term->val.num, term->weak);
>>>>> +                     new_type = EVSEL__CONFIG_TERM_PERIOD;
>>>>> +                     val = term->val.num;
>>>>>                         break;
>>>>>                 case PARSE_EVENTS__TERM_TYPE_SAMPLE_FREQ:
>>>>> -                     ADD_CONFIG_TERM_VAL(FREQ, freq, term->val.num, term->weak);
>>>>> +                     new_type = EVSEL__CONFIG_TERM_FREQ;
>>>>> +                     val = term->val.num;
>>>>>                         break;
>>>>>                 case PARSE_EVENTS__TERM_TYPE_TIME:
>>>>> -                     ADD_CONFIG_TERM_VAL(TIME, time, term->val.num, term->weak);
>>>>> +                     new_type = EVSEL__CONFIG_TERM_TIME;
>>>>> +                     val = term->val.num;
>>>>>                         break;
>>>>>                 case PARSE_EVENTS__TERM_TYPE_CALLGRAPH:
>>>>> -                     ADD_CONFIG_TERM_STR(CALLGRAPH, term->val.str, term->weak);
>>>>> +                     new_type = EVSEL__CONFIG_TERM_CALLGRAPH;
>>>>> +                     str = term->val.str;
>>>>>                         break;
>>>>>                 case PARSE_EVENTS__TERM_TYPE_BRANCH_SAMPLE_TYPE:
>>>>> -                     ADD_CONFIG_TERM_STR(BRANCH, term->val.str, term->weak);
>>>>> +                     new_type = EVSEL__CONFIG_TERM_BRANCH;
>>>>> +                     str = term->val.str;
>>>>>                         break;
>>>>>                 case PARSE_EVENTS__TERM_TYPE_STACKSIZE:
>>>>> -                     ADD_CONFIG_TERM_VAL(STACK_USER, stack_user,
>>>>> -                                         term->val.num, term->weak);
>>>>> +                     new_type = EVSEL__CONFIG_TERM_STACK_USER;
>>>>> +                     val = term->val.num;
>>>>>                         break;
>>>>>                 case PARSE_EVENTS__TERM_TYPE_INHERIT:
>>>>> -                     ADD_CONFIG_TERM_VAL(INHERIT, inherit,
>>>>> -                                         term->val.num ? 1 : 0, term->weak);
>>>>> +                     new_type = EVSEL__CONFIG_TERM_INHERIT;
>>>>> +                     val = term->val.num ? 1 : 0;
>>>>>                         break;
>>>>>                 case PARSE_EVENTS__TERM_TYPE_NOINHERIT:
>>>>> -                     ADD_CONFIG_TERM_VAL(INHERIT, inherit,
>>>>> -                                         term->val.num ? 0 : 1, term->weak);
>>>>> +                     new_type = EVSEL__CONFIG_TERM_INHERIT;
>>>>> +                     val = term->val.num ? 0 : 1;
>>>>>                         break;
>>>>>                 case PARSE_EVENTS__TERM_TYPE_MAX_STACK:
>>>>> -                     ADD_CONFIG_TERM_VAL(MAX_STACK, max_stack,
>>>>> -                                         term->val.num, term->weak);
>>>>> +                     new_type = EVSEL__CONFIG_TERM_MAX_STACK;
>>>>> +                     val = term->val.num;
>>>>>                         break;
>>>>>                 case PARSE_EVENTS__TERM_TYPE_MAX_EVENTS:
>>>>> -                     ADD_CONFIG_TERM_VAL(MAX_EVENTS, max_events,
>>>>> -                                         term->val.num, term->weak);
>>>>> +                     new_type = EVSEL__CONFIG_TERM_MAX_EVENTS;
>>>>> +                     val = term->val.num;
>>>>>                         break;
>>>>>                 case PARSE_EVENTS__TERM_TYPE_OVERWRITE:
>>>>> -                     ADD_CONFIG_TERM_VAL(OVERWRITE, overwrite,
>>>>> -                                         term->val.num ? 1 : 0, term->weak);
>>>>> +                     new_type = EVSEL__CONFIG_TERM_OVERWRITE;
>>>>> +                     val = term->val.num ? 1 : 0;
>>>>>                         break;
>>>>>                 case PARSE_EVENTS__TERM_TYPE_NOOVERWRITE:
>>>>> -                     ADD_CONFIG_TERM_VAL(OVERWRITE, overwrite,
>>>>> -                                         term->val.num ? 0 : 1, term->weak);
>>>>> +                     new_type = EVSEL__CONFIG_TERM_OVERWRITE;
>>>>> +                     val = term->val.num ? 0 : 1;
>>>>>                         break;
>>>>>                 case PARSE_EVENTS__TERM_TYPE_DRV_CFG:
>>>>> -                     ADD_CONFIG_TERM_STR(DRV_CFG, term->val.str, term->weak);
>>>>> +                     new_type = EVSEL__CONFIG_TERM_DRV_CFG;
>>>>> +                     str = term->val.str;
>>>>>                         break;
>>>>>                 case PARSE_EVENTS__TERM_TYPE_PERCORE:
>>>>> -                     ADD_CONFIG_TERM_VAL(PERCORE, percore,
>>>>> -                                         term->val.num ? true : false, term->weak);
>>>>> +                     new_type = EVSEL__CONFIG_TERM_PERCORE;
>>>>> +                     val = term->val.num ? true : false;
>>>>>                         break;
>>>>>                 case PARSE_EVENTS__TERM_TYPE_AUX_OUTPUT:
>>>>> -                     ADD_CONFIG_TERM_VAL(AUX_OUTPUT, aux_output,
>>>>> -                                         term->val.num ? 1 : 0, term->weak);
>>>>> +                     new_type = EVSEL__CONFIG_TERM_AUX_OUTPUT;
>>>>> +                     val = term->val.num ? 1 : 0;
>>>>>                         break;
>>>>>                 case PARSE_EVENTS__TERM_TYPE_AUX_ACTION:
>>>>> -                     ADD_CONFIG_TERM_STR(AUX_ACTION, term->val.str, term->weak);
>>>>> +                     new_type = EVSEL__CONFIG_TERM_AUX_ACTION;
>>>>> +                     str = term->val.str;
>>>>>                         break;
>>>>>                 case PARSE_EVENTS__TERM_TYPE_AUX_SAMPLE_SIZE:
>>>>> -                     ADD_CONFIG_TERM_VAL(AUX_SAMPLE_SIZE, aux_sample_size,
>>>>> -                                         term->val.num, term->weak);
>>>>> +                     new_type = EVSEL__CONFIG_TERM_AUX_SAMPLE_SIZE;
>>>>> +                     val = term->val.num;
>>>>>                         break;
>>>>>                 case PARSE_EVENTS__TERM_TYPE_RATIO_TO_PREV:
>>>>> -                     ADD_CONFIG_TERM_STR(RATIO_TO_PREV, term->val.str, term->weak);
>>>>> +                     new_type = EVSEL__CONFIG_TERM_RATIO_TO_PREV;
>>>>> +                     str = term->val.str;
>>>>>                         break;
>>>>>                 case PARSE_EVENTS__TERM_TYPE_USER:
>>>>>                 case PARSE_EVENTS__TERM_TYPE_CONFIG:
>>>>> @@ -1229,7 +1231,23 @@ do {                                                           \
>>>>>                 case PARSE_EVENTS__TERM_TYPE_RAW:
>>>>>                 case PARSE_EVENTS__TERM_TYPE_CPU:
>>>>>                 default:
>>>>> -                     break;
>>>>> +                     /* Don't add a new term for these ones */
>>>>> +                     continue;
>>>>> +             }
>>>>> +
>>>>> +             new_term = add_config_term(new_type, head_terms, term->weak);
>>>>> +             if (!new_term)
>>>>> +                     return -ENOMEM;
>>>>> +
>>>>> +             if (str) {
>>>>> +                     new_term->val.str = strdup(str);
>>>>> +                     if (!new_term->val.str) {
>>>>> +                             zfree(&new_term);
>>>>> +                             return -ENOMEM;
>>>>> +                     }
>>>>> +                     new_term->free_str = true;
>>>>> +             } else {
>>>>
>>>> This will incorrectly hit the else if term->val.str is NULL. Not sure if
>>>> that can happen but will fix anyway.
>>>>
>>>>> +                     new_term->val.val = val;
>>>>
>>>> There's an uninitialized variable warning for val here on release
>>>> builds. Will fix too
>>>
>>> I'm not sure how I feel about the change, but did you check that it is
>>> ubsan clean? I worry it is introducing writes to "val" and then reads
>>> from say "period" in the evsel_config_term val union. I believe ubsan
>>> will flag this as:
>>> https://en.cppreference.com/w/cpp/language/union.html
>>> "It is undefined behavior to read from the member of the union that
>>> wasn't most recently written."
>>>
>>> Thanks,
>>> Ian
>>>
>>
>> Maybe for C++, but not for C [1]:
>>
>>     Accessing my_union.i after most recently writing to the other member,
>>     my_union.d, is an allowed form of type-punning in C, provided that the
>>     member read is not larger than the one whose value was set
>>
>> Type punning with unions is widely used in the kernel and there are a
>> couple of instances in Perf. There are tons of discussions about it on
>> the mailing lists too. I can check it with ubsan though.
> 
> Thanks. I'm mostly worried about ubsan being clean. One of those
> mailing list discussions, or sadly outside the usual trolls lack of
> discussion, is my trying to remove a prevalent source of type punning:
> https://lore.kernel.org/lkml/20251016205126.2882625-1-irogers@google.com/
> 
> Ian
> 

No ubsan issues on any Perf tests from this, but I did forget a free in 
the new test that I saw with asan so I'll send a new version.


>> [1]: https://en.wikipedia.org/wiki/Type_punning#C_and_C++
>>
>>>>>                 }
>>>>>         }
>>>>>         return 0;
>>>>> @@ -1290,10 +1308,16 @@ static int get_config_chgs(struct perf_pmu *pmu, struct parse_events_terms *head
>>>>>                 }
>>>>>         }
>>>>>
>>>>> -     if (bits)
>>>>> -             ADD_CONFIG_TERM_VAL(CFG_CHG, cfg_chg, bits, false);
>>>>> +     if (bits) {
>>>>> +             struct evsel_config_term *new_term;
>>>>> +
>>>>> +             new_term = add_config_term(EVSEL__CONFIG_TERM_CFG_CHG,
>>>>> +                                        head_terms, false);
>>>>> +             if (!new_term)
>>>>> +                     return -ENOMEM;
>>>>> +             new_term->val.cfg_chg = bits;
>>>>> +     }
>>>>>
>>>>> -#undef ADD_CONFIG_TERM
>>>>>         return 0;
>>>>>     }
>>>>>
>>>>>
>>>>
>>


