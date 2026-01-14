Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B621D37E32
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 13:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WhwfNazPWHuLWawIgxRJ1ZBzLc6u01DE788YteykMdA=; b=s3k8fxAWCcqfLWHav9i/ybdqAU
	Kpmo7NzeoUcaGpSLXnMOAuyQrA5lE75nJilPIRtwuN/wIjjk74yf1/Uf533EdHbrvWkmMI+D4469e
	RcFc5+Ku3gTt0s6bH1Xrq2H9RY/yWPUjpLTArkxc6a9t1mLA3XzWku+kkRvoTFu/WWZvQ9hHafsbW
	bZoWrhzmqXEBx78yDZKG+6rl+IN81RJKxiwGWyuRWA1EtYk2BRQphHmrRcn60jV2kFiiBRHjeigVY
	0txDFNOS/r6MGDLxBLOIDDAxlBkt0ZuDg7N+atNq6lB4t3BirNCj0GEARNkklsbihIQCi3Kq/KDQX
	b2JaP0Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg10R-00000009LPy-3vH8;
	Wed, 14 Jan 2026 13:33:51 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg10O-00000009LP5-1XoF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 13:33:49 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-42fb4eeb482so5020025f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 05:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768397626; x=1769002426; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WhwfNazPWHuLWawIgxRJ1ZBzLc6u01DE788YteykMdA=;
        b=GK1yp7R5we958oC5X8GD/MV1wKb2LTS7TEqmN6174C86700Td34t+jeDvgm5hAefix
         V3eMKsylzKE1EbCl17+gJzXNCG5PaVjUmf5aDuzL786A6qttWk/MKrJrzmCQ94we5ebZ
         JxoyfRKN0n3VEFnPncM9jKeQSUe3D/GxkLYHQVQQpU2uMu4CIRQ94r01oKbsVGbwD3os
         vdUZiJcz8NjWS+Tjaf8asoSIGZD7FPyXJ4eP1VbdaRz6SgOLvAL1fWYv9qlirfzLpcif
         eFa8w+/RPXdqe0F4Vw0Zog+cdiV0g4xB5bmhjeF+eE95AySc3nN/OCA1/fOj3uL4Xe0u
         F63A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768397626; x=1769002426;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WhwfNazPWHuLWawIgxRJ1ZBzLc6u01DE788YteykMdA=;
        b=oanwKy/qXKjGvkIkWqH6D+IRcIRWzZEwyGgM4f39e/s6CwfFTyTuQIhCQtwg+matS2
         U4gdfP1GRzsxGwGslNDlHbR67czVvqgdkWwVvPb5k41XpumQ0Kf5ScWIs5lKTGIDdDlY
         QdQUnNLSW42bZcZLh65SAyeRy9u272biJP51CIg8z2G3497jlE0xH1tokubkMLwf92J3
         0UAbU1Q9E+zp8Q9qUOYHCfprWi/cnf0p702JUvW3jriQl3uGTE0uexWHqLJczzUBHzKk
         8MgbIGoGVhqJtCPGQGsJaqbfBgr/09WYulb0WAw46ojg30RSydT3/pr6x+y5g1WvDE3V
         BUWA==
X-Forwarded-Encrypted: i=1; AJvYcCW9B6rawhAWUvhb+pAzJvS5C0j15fJOxeMjSwdpLl7jmmJFZRxVHm8G6j5Vol+jEwA6iRtuzzWviE+C2e9VclZU@lists.infradead.org
X-Gm-Message-State: AOJu0YwynDv6zQ3dVo9/l/agtpBJGdYBdCsfUSCLXlbNq5k5C8iqfiw1
	P3He3bpIOe6LbbqboU/5AziNd9+mJEOjmKuiKGmiVXv6Dthp0xieHxn7dRfGFMjVFLo=
X-Gm-Gg: AY/fxX5UmywGNKIR5JyGborHYt9uDSOvb6GoTjAc60MuLXdlgaMK6vc+yTN0duDi0iy
	7zrSDF8dgmTdzLfk1IfNlHtEDTS2k+JFvMjp4NwfikREg75RaVvfIU3yUrlMwxFniEmmXdfl2HB
	Ox0WORlccRY11D77MM94VVl+zUhUbukit7rVjXuFlrmMR/VJxmscvgMIwp7MbzkrxOdDkdfssZx
	ucXkg/jarCwiwFsg/HLa3eMZOGtTXJeVTp++O5kF5pYro8ZxXRQ54rAVaG3ZhsuWPXjp//djwl/
	TFbb+q7t/ZB46nW+KQAzp647oRVgIs+1XyflJpG21yUqBbpXJDh3BLQprN8XBZp2nPxhSl2Nyiv
	RGXvUy4x965t23teDgzK33xtSpuyF3Evp2YL+yJbDTuHRb5w9MEYkoa63HKBLzLs2rB1JB0GMCs
	/wxRcb98IZHIfg6P5AXTR/WPa4HHM=
X-Received: by 2002:a05:6000:2c03:b0:430:f7c9:94c3 with SMTP id ffacd0b85a97d-4342c5011f7mr3399526f8f.25.1768397626345;
        Wed, 14 Jan 2026 05:33:46 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dacc5sm49990183f8f.5.2026.01.14.05.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 05:33:45 -0800 (PST)
Message-ID: <3905ee5b-79fe-408c-b776-125c51ac7824@linaro.org>
Date: Wed, 14 Jan 2026 13:33:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/14] perf evsel: Refactor
 evsel__set_config_if_unset() arguments
From: James Clark <james.clark@linaro.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, John Garry <john.g.garry@oracle.com>,
 Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20251222-james-perf-config-bits-v4-0-0608438186fc@linaro.org>
 <20251222-james-perf-config-bits-v4-2-0608438186fc@linaro.org>
 <aWbDg0kmo-isxkz2@x1> <4eda1bd6-ec36-4d0b-85de-ef0bd190e5e7@linaro.org>
Content-Language: en-US
In-Reply-To: <4eda1bd6-ec36-4d0b-85de-ef0bd190e5e7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_053348_472179_71813F8F 
X-CRM114-Status: GOOD (  32.94  )
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



On 14/01/2026 12:14 pm, James Clark wrote:
> 
> 
> On 13/01/2026 10:13 pm, Arnaldo Carvalho de Melo wrote:
>> On Mon, Dec 22, 2025 at 03:14:27PM +0000, James Clark wrote:
>>> Make the evsel argument first to match the other evsel__* functions
>>> and remove the redundant pmu argument, which can be accessed via evsel.
>>
>> I haven't checked if this is the exactly where this takes place but
>> should be in this series, 32-bit build is broken:
>>
>>     3: almalinux:9-i386WARNING: image platform (linux/386) does not 
>> match the expected platform (linux/amd64)
>> WARNING: image platform (linux/386) does not match the expected 
>> platform (linux/amd64)
>>      21.72 almalinux:9-i386              : FAIL gcc version 11.4.1 
>> 20231218 (Red Hat 11.4.1-3) (GCC)
>>       1378 |         perf_pmu__format_pack(&bits, val, vp, /*zero=*/ 
>> true);
>>            |                               ^~~~~
>>            |                               |
>>            |                               u64 * {aka long long 
>> unsigned int *}
>>      In file included from util/evsel.h:14,
>>                       from util/evsel.c:38:
>>      util/pmu.h:282:43: note: expected ‘long unsigned int *’ but 
>> argument is of type ‘u64 *’ {aka ‘long long unsigned int *’}
>>        282 | void perf_pmu__format_pack(unsigned long *format, __u64 
>> value, __u64 *v,
>>            |                            ~~~~~~~~~~~~~~~^~~~~~
>>
>>
>> What I have is in perf-tools-next/tmp.perf-tools-next BTW, I'll try and
>> fix this tomorrow if you don't do it first. :-)
> 
> Taking a look, but I'm wondering if this is already not working 
> properly. There are existing "unsigned long"s in pmu.c that operate on 
> the config bits which is what I copied.
> 
> On this target an unsigned long is 32bits but struct perf_event_attr- 
>  >configs are __u64. So it looks like it might leave the top bits unset 
> sometimes.
> 
> I'll look at a fix for that which should fix the compilation error at 
> the same time.

False alarm, I was confusing a pointer to a single unsigned long with 
what are actually DECLARE_BITMAP()s. So they're two longs in this case 
for 64 bits.

I'll send a fix for the compilation issue and double check the patches 
to make sure that misunderstanding hasn't caused any issues.

> 
> Another question is, do we actually care about this platform?
> 
>>
>> There are some more build problems in other containers/distros, I'll be
>> reporting as replies to the patches that looks related
>>
>> - Arnaldo
>>> Signed-off-by: James Clark <james.clark@linaro.org>
>>> ---
>>>   tools/perf/arch/arm/util/cs-etm.c    | 9 +++------
>>>   tools/perf/arch/arm64/util/arm-spe.c | 2 +-
>>>   tools/perf/arch/x86/util/intel-pt.c  | 3 +--
>>>   tools/perf/util/evsel.h              | 4 ++--
>>>   tools/perf/util/pmu.c                | 6 +++---
>>>   5 files changed, 10 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/ 
>>> util/cs-etm.c
>>> index ea891d12f8f4..c28208361d91 100644
>>> --- a/tools/perf/arch/arm/util/cs-etm.c
>>> +++ b/tools/perf/arch/arm/util/cs-etm.c
>>> @@ -441,10 +441,8 @@ static int cs_etm_recording_options(struct 
>>> auxtrace_record *itr,
>>>        * when a context switch happened.
>>>        */
>>>       if (!perf_cpu_map__is_any_cpu_or_is_empty(cpus)) {
>>> -        evsel__set_config_if_unset(cs_etm_pmu, cs_etm_evsel,
>>> -                       "timestamp", 1);
>>> -        evsel__set_config_if_unset(cs_etm_pmu, cs_etm_evsel,
>>> -                       "contextid", 1);
>>> +        evsel__set_config_if_unset(cs_etm_evsel, "timestamp", 1);
>>> +        evsel__set_config_if_unset(cs_etm_evsel, "contextid", 1);
>>>       }
>>>       /*
>>> @@ -453,8 +451,7 @@ static int cs_etm_recording_options(struct 
>>> auxtrace_record *itr,
>>>        * timestamp tracing.
>>>        */
>>>       if (opts->sample_time_set)
>>> -        evsel__set_config_if_unset(cs_etm_pmu, cs_etm_evsel,
>>> -                       "timestamp", 1);
>>> +        evsel__set_config_if_unset(cs_etm_evsel, "timestamp", 1);
>>>       /* Add dummy event to keep tracking */
>>>       err = parse_event(evlist, "dummy:u");
>>> diff --git a/tools/perf/arch/arm64/util/arm-spe.c b/tools/perf/arch/ 
>>> arm64/util/arm-spe.c
>>> index d5ec1408d0ae..51014f8bff97 100644
>>> --- a/tools/perf/arch/arm64/util/arm-spe.c
>>> +++ b/tools/perf/arch/arm64/util/arm-spe.c
>>> @@ -274,7 +274,7 @@ static void arm_spe_setup_evsel(struct evsel 
>>> *evsel, struct perf_cpu_map *cpus)
>>>        */
>>>       if (!perf_cpu_map__is_any_cpu_or_is_empty(cpus)) {
>>>           evsel__set_sample_bit(evsel, CPU);
>>> -        evsel__set_config_if_unset(evsel->pmu, evsel, "ts_enable", 1);
>>> +        evsel__set_config_if_unset(evsel, "ts_enable", 1);
>>>       }
>>>       /*
>>> diff --git a/tools/perf/arch/x86/util/intel-pt.c b/tools/perf/arch/ 
>>> x86/util/intel-pt.c
>>> index b394ad9cc635..c131a727774f 100644
>>> --- a/tools/perf/arch/x86/util/intel-pt.c
>>> +++ b/tools/perf/arch/x86/util/intel-pt.c
>>> @@ -664,8 +664,7 @@ static int intel_pt_recording_options(struct 
>>> auxtrace_record *itr,
>>>           return 0;
>>>       if (opts->auxtrace_sample_mode)
>>> -        evsel__set_config_if_unset(intel_pt_pmu, intel_pt_evsel,
>>> -                       "psb_period", 0);
>>> +        evsel__set_config_if_unset(intel_pt_evsel, "psb_period", 0);
>>>       err = intel_pt_validate_config(intel_pt_pmu, intel_pt_evsel);
>>>       if (err)
>>> diff --git a/tools/perf/util/evsel.h b/tools/perf/util/evsel.h
>>> index a08130ff2e47..2cf87bc67df7 100644
>>> --- a/tools/perf/util/evsel.h
>>> +++ b/tools/perf/util/evsel.h
>>> @@ -575,8 +575,8 @@ void evsel__uniquify_counter(struct evsel *counter);
>>>       ((((src) >> (pos)) & ((1ull << (size)) - 1)) << (63 - ((pos) + 
>>> (size) - 1)))
>>>   u64 evsel__bitfield_swap_branch_flags(u64 value);
>>> -void evsel__set_config_if_unset(struct perf_pmu *pmu, struct evsel 
>>> *evsel,
>>> -                const char *config_name, u64 val);
>>> +void evsel__set_config_if_unset(struct evsel *evsel, const char 
>>> *config_name,
>>> +                u64 val);
>>>   bool evsel__is_offcpu_event(struct evsel *evsel);
>>> diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
>>> index 956ea273c2c7..e87c12946d71 100644
>>> --- a/tools/perf/util/pmu.c
>>> +++ b/tools/perf/util/pmu.c
>>> @@ -1382,8 +1382,8 @@ bool evsel__is_aux_event(const struct evsel 
>>> *evsel)
>>>    * something to true, pass 1 for val rather than a pre shifted value.
>>>    */
>>>   #define field_prep(_mask, _val) (((_val) << (ffsll(_mask) - 1)) & 
>>> (_mask))
>>> -void evsel__set_config_if_unset(struct perf_pmu *pmu, struct evsel 
>>> *evsel,
>>> -                const char *config_name, u64 val)
>>> +void evsel__set_config_if_unset(struct evsel *evsel, const char 
>>> *config_name,
>>> +                u64 val)
>>>   {
>>>       u64 user_bits = 0, bits;
>>>       struct evsel_config_term *term = evsel__get_config_term(evsel, 
>>> CFG_CHG);
>>> @@ -1391,7 +1391,7 @@ void evsel__set_config_if_unset(struct perf_pmu 
>>> *pmu, struct evsel *evsel,
>>>       if (term)
>>>           user_bits = term->val.cfg_chg;
>>> -    bits = perf_pmu__format_bits(pmu, config_name);
>>> +    bits = perf_pmu__format_bits(evsel->pmu, config_name);
>>>       /* Do nothing if the user changed the value */
>>>       if (bits & user_bits)
>>>
>>> -- 
>>> 2.34.1
>>>
> 


