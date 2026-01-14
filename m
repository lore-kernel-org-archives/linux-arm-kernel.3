Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDEA9D29FEF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 12:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zm5kxemUqHHNC5WZIc5C1Ae0dp7ZQReOnSyfnewqqRY=; b=NA9vHr3lIoXLVKFVx2HBeD++6X
	Sp5eqf1jfqJs7N+CeKGcfZf4QDnxUpmHrNU6hX2F586ohDXB/3niXRuvTd4xbrad8BdGcin2hwJP5
	j6oyj60/K3eZcIgJmclbegyWzm/NKMbntHb189IzZRpZVlzyrN1yZOgtKX53ZxwVe15PmPHqTncNY
	N1QHz4c1pIQJd7JmUepMj2F24psat7R8oAxNCK/IeqC8DACJwEMT2oigSIjg2JG8xRs0RwEEd3YS0
	hQn8pGW5at4jdeXgiuD7CFzQLcXVmNXkA8wKl2CV8WQN4R555X7icQ//PLHwMk90oR3Wb4cDB4jQD
	ThRnddHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfzm0-000000098KC-2CIW;
	Wed, 14 Jan 2026 12:14:52 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfzlu-000000098Ds-3F9S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 12:14:51 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4775e891b5eso39457985e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 04:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768392885; x=1768997685; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zm5kxemUqHHNC5WZIc5C1Ae0dp7ZQReOnSyfnewqqRY=;
        b=StnYe9Rr+8KlnqZZTMSGloEroVSaNmLzDule7b5AQC0RASAUMXUfFl8Is0dXeVf98j
         88AiwmTUwc6pCnhAhvmPUbG0MTZm94ahulUM1Tut1ThKGMtCIqmUQXpBOzX38oOm4PfM
         iIpCCNtafXyExVN6OP/rEF1FTp5ykQp+oE+3YwIGZgKtAY3+oirxZ4i/txV4mAlJhvpv
         6rkbwFucXCYTu4YoqmiNg1dvYcQUSmolbnlbDFNtSsfFKCvzF4sbFC+38dCDBwk/krky
         jQWywivHt/wF/4WeDBAKQag0XUV5NLHhAhQycMMXzcLlf2O1bNGXrh6sSJP62KAPdVtP
         B/jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768392885; x=1768997685;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zm5kxemUqHHNC5WZIc5C1Ae0dp7ZQReOnSyfnewqqRY=;
        b=s9f0CjlDeZ45WNjt8CUlIE7QFhQuokWUoX1ZzmYt1W2C5/xNgBEKQqQWm0F43YVgde
         h5pGqTgweGDOCcAZKXP3VS0E8qrZPR6wjDUwLVtMA6XR6dM/iqT1YUqUiHHuL26kuxUb
         X5KpYBZYCgntM/iHLfd8p0h9IJ+sQj+1Z/p/en9xCVEdlQetv3kMnt6pEaqI7iz3XcIp
         jD5nNzzgxyUO1s9JSRYlyUcHBUwfdWWtsGtN96bv8wn3kzhtQF3YqHyARgcbhkjGSTB6
         aBCCu79FOYEbXoS0lyYyMC1wvGAIL/wAK+EdCihf2OfrcJBtVCsbFv6cOoiX4yfqCc6K
         Sv1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXWS9nJ14GgkttgLV2aIuAfH8HfFiNW9bcEzVy1EAujSr5diUZ52bUDD55n6Wswjdj1vU46Oj5pTc7eQUD7nXDb@lists.infradead.org
X-Gm-Message-State: AOJu0YwwNR3phmTyLJ+cb28krkT/lzNxS0IuL0EEoYQF+PirIDUhfWPd
	Z0rZBWLHKFjlZWx5FwFmUJvkOeJ8N/zUVKKgjUepCuHgR0nTed3DA8CiPxDI9BkxI68=
X-Gm-Gg: AY/fxX58kH3dVR6zl+vGSJpkeawpKJGJa4LVMUTTyPs4ZDNovTal8V1do7qMIeE1VM7
	BxIP7VdVYo9jiTdlN75iLTLD6aF+eQZV7D7ufD5pH7gmPNLxcrYUYLjpKV1PtAgG1SILbbAxnlX
	MAS3DOUoHQfzsAeUHraYBulRItISeoIU7RT4+6SxDNCUKUKxL2X1NLafoA0sCQr378oWyRTiEG7
	6T9AQtjR9md1+rDL5JPUps4mR+YWE3+H82S2SEdJMHyNEngs7kgFng6IH7pH3bGKbnlQRsVtXpj
	Q2W4K+SPa1NMAsvZnkG3a5iXLnad4z/rgIxkJRuxUQe66l+0aDBnFgiSr8r4QxfLrduh1QEz2s6
	4jp09agpPxv7i7v2Q9MkrvWqUYpZIg2zExu/UkmIy4+dGX4vWOaQZ9uSIeDtrmY4UvT+EtAUJRn
	v5DTG4ZQSGA78to6OV
X-Received: by 2002:a05:600c:4688:b0:477:a1a2:d829 with SMTP id 5b1f17b1804b1-47ee47c9e2emr20866425e9.13.1768392884789;
        Wed, 14 Jan 2026 04:14:44 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5fe83bsm50179354f8f.38.2026.01.14.04.14.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 04:14:44 -0800 (PST)
Message-ID: <4eda1bd6-ec36-4d0b-85de-ef0bd190e5e7@linaro.org>
Date: Wed, 14 Jan 2026 12:14:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/14] perf evsel: Refactor
 evsel__set_config_if_unset() arguments
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
 <aWbDg0kmo-isxkz2@x1>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aWbDg0kmo-isxkz2@x1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_041448_371858_8367F178 
X-CRM114-Status: GOOD (  33.09  )
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



On 13/01/2026 10:13 pm, Arnaldo Carvalho de Melo wrote:
> On Mon, Dec 22, 2025 at 03:14:27PM +0000, James Clark wrote:
>> Make the evsel argument first to match the other evsel__* functions
>> and remove the redundant pmu argument, which can be accessed via evsel.
> 
> I haven't checked if this is the exactly where this takes place but
> should be in this series, 32-bit build is broken:
> 
>     3: almalinux:9-i386WARNING: image platform (linux/386) does not match the expected platform (linux/amd64)
> WARNING: image platform (linux/386) does not match the expected platform (linux/amd64)
>      21.72 almalinux:9-i386              : FAIL gcc version 11.4.1 20231218 (Red Hat 11.4.1-3) (GCC)
>       1378 |         perf_pmu__format_pack(&bits, val, vp, /*zero=*/true);
>            |                               ^~~~~
>            |                               |
>            |                               u64 * {aka long long unsigned int *}
>      In file included from util/evsel.h:14,
>                       from util/evsel.c:38:
>      util/pmu.h:282:43: note: expected ‘long unsigned int *’ but argument is of type ‘u64 *’ {aka ‘long long unsigned int *’}
>        282 | void perf_pmu__format_pack(unsigned long *format, __u64 value, __u64 *v,
>            |                            ~~~~~~~~~~~~~~~^~~~~~
> 
> 
> What I have is in perf-tools-next/tmp.perf-tools-next BTW, I'll try and
> fix this tomorrow if you don't do it first. :-)

Taking a look, but I'm wondering if this is already not working 
properly. There are existing "unsigned long"s in pmu.c that operate on 
the config bits which is what I copied.

On this target an unsigned long is 32bits but struct 
perf_event_attr->configs are __u64. So it looks like it might leave the 
top bits unset sometimes.

I'll look at a fix for that which should fix the compilation error at 
the same time.

Another question is, do we actually care about this platform?

> 
> There are some more build problems in other containers/distros, I'll be
> reporting as replies to the patches that looks related
> 
> - Arnaldo
>   
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   tools/perf/arch/arm/util/cs-etm.c    | 9 +++------
>>   tools/perf/arch/arm64/util/arm-spe.c | 2 +-
>>   tools/perf/arch/x86/util/intel-pt.c  | 3 +--
>>   tools/perf/util/evsel.h              | 4 ++--
>>   tools/perf/util/pmu.c                | 6 +++---
>>   5 files changed, 10 insertions(+), 14 deletions(-)
>>
>> diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
>> index ea891d12f8f4..c28208361d91 100644
>> --- a/tools/perf/arch/arm/util/cs-etm.c
>> +++ b/tools/perf/arch/arm/util/cs-etm.c
>> @@ -441,10 +441,8 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
>>   	 * when a context switch happened.
>>   	 */
>>   	if (!perf_cpu_map__is_any_cpu_or_is_empty(cpus)) {
>> -		evsel__set_config_if_unset(cs_etm_pmu, cs_etm_evsel,
>> -					   "timestamp", 1);
>> -		evsel__set_config_if_unset(cs_etm_pmu, cs_etm_evsel,
>> -					   "contextid", 1);
>> +		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", 1);
>> +		evsel__set_config_if_unset(cs_etm_evsel, "contextid", 1);
>>   	}
>>   
>>   	/*
>> @@ -453,8 +451,7 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
>>   	 * timestamp tracing.
>>   	 */
>>   	if (opts->sample_time_set)
>> -		evsel__set_config_if_unset(cs_etm_pmu, cs_etm_evsel,
>> -					   "timestamp", 1);
>> +		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", 1);
>>   
>>   	/* Add dummy event to keep tracking */
>>   	err = parse_event(evlist, "dummy:u");
>> diff --git a/tools/perf/arch/arm64/util/arm-spe.c b/tools/perf/arch/arm64/util/arm-spe.c
>> index d5ec1408d0ae..51014f8bff97 100644
>> --- a/tools/perf/arch/arm64/util/arm-spe.c
>> +++ b/tools/perf/arch/arm64/util/arm-spe.c
>> @@ -274,7 +274,7 @@ static void arm_spe_setup_evsel(struct evsel *evsel, struct perf_cpu_map *cpus)
>>   	 */
>>   	if (!perf_cpu_map__is_any_cpu_or_is_empty(cpus)) {
>>   		evsel__set_sample_bit(evsel, CPU);
>> -		evsel__set_config_if_unset(evsel->pmu, evsel, "ts_enable", 1);
>> +		evsel__set_config_if_unset(evsel, "ts_enable", 1);
>>   	}
>>   
>>   	/*
>> diff --git a/tools/perf/arch/x86/util/intel-pt.c b/tools/perf/arch/x86/util/intel-pt.c
>> index b394ad9cc635..c131a727774f 100644
>> --- a/tools/perf/arch/x86/util/intel-pt.c
>> +++ b/tools/perf/arch/x86/util/intel-pt.c
>> @@ -664,8 +664,7 @@ static int intel_pt_recording_options(struct auxtrace_record *itr,
>>   		return 0;
>>   
>>   	if (opts->auxtrace_sample_mode)
>> -		evsel__set_config_if_unset(intel_pt_pmu, intel_pt_evsel,
>> -					   "psb_period", 0);
>> +		evsel__set_config_if_unset(intel_pt_evsel, "psb_period", 0);
>>   
>>   	err = intel_pt_validate_config(intel_pt_pmu, intel_pt_evsel);
>>   	if (err)
>> diff --git a/tools/perf/util/evsel.h b/tools/perf/util/evsel.h
>> index a08130ff2e47..2cf87bc67df7 100644
>> --- a/tools/perf/util/evsel.h
>> +++ b/tools/perf/util/evsel.h
>> @@ -575,8 +575,8 @@ void evsel__uniquify_counter(struct evsel *counter);
>>   	((((src) >> (pos)) & ((1ull << (size)) - 1)) << (63 - ((pos) + (size) - 1)))
>>   
>>   u64 evsel__bitfield_swap_branch_flags(u64 value);
>> -void evsel__set_config_if_unset(struct perf_pmu *pmu, struct evsel *evsel,
>> -				const char *config_name, u64 val);
>> +void evsel__set_config_if_unset(struct evsel *evsel, const char *config_name,
>> +				u64 val);
>>   
>>   bool evsel__is_offcpu_event(struct evsel *evsel);
>>   
>> diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
>> index 956ea273c2c7..e87c12946d71 100644
>> --- a/tools/perf/util/pmu.c
>> +++ b/tools/perf/util/pmu.c
>> @@ -1382,8 +1382,8 @@ bool evsel__is_aux_event(const struct evsel *evsel)
>>    * something to true, pass 1 for val rather than a pre shifted value.
>>    */
>>   #define field_prep(_mask, _val) (((_val) << (ffsll(_mask) - 1)) & (_mask))
>> -void evsel__set_config_if_unset(struct perf_pmu *pmu, struct evsel *evsel,
>> -				const char *config_name, u64 val)
>> +void evsel__set_config_if_unset(struct evsel *evsel, const char *config_name,
>> +				u64 val)
>>   {
>>   	u64 user_bits = 0, bits;
>>   	struct evsel_config_term *term = evsel__get_config_term(evsel, CFG_CHG);
>> @@ -1391,7 +1391,7 @@ void evsel__set_config_if_unset(struct perf_pmu *pmu, struct evsel *evsel,
>>   	if (term)
>>   		user_bits = term->val.cfg_chg;
>>   
>> -	bits = perf_pmu__format_bits(pmu, config_name);
>> +	bits = perf_pmu__format_bits(evsel->pmu, config_name);
>>   
>>   	/* Do nothing if the user changed the value */
>>   	if (bits & user_bits)
>>
>> -- 
>> 2.34.1
>>


