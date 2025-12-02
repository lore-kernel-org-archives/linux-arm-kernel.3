Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A7FD116F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 12:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z+ls4lUKyqIXh7xVjbyit136L3KGyzdT9oph+fPZ8XY=; b=oNOQoCGoJY+sk3pN45a1Ueeh6U
	zoQNsUSOsWd98Rcv+7L3fIdiBzTTAYTH+f3jFwXeeQ3NKSNzwugNZZGFsj7XVEBVK/OlOWtatpNVA
	qq7Ebl0e8Gw8yn85H6COWACdLYrYWrX/73+sud7Zx0WOzVU+vKnAKEh/QQaAONj0WkXtnWyvU0Pwt
	QB00/1690mKwvQhkO0Zl1GOrZQGgXMU9d4gWitwYw9R86sTKNpm7Ue6ULoXxz2Uj/N5FhHevR5Rd3
	A7QWwkW+n+SZprAJOYCPDhf3WTS7MV2u/egZbGv/dCX011C5o8Si4grOuqB16EeNfY1cmd6rgf59w
	ikOALiug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQPyy-00000005Ozz-1wso;
	Tue, 02 Dec 2025 12:59:52 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQPyw-00000005OzZ-0jH4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 12:59:51 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-42e2ba54a6fso1069080f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 04:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764680388; x=1765285188; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z+ls4lUKyqIXh7xVjbyit136L3KGyzdT9oph+fPZ8XY=;
        b=ZXZVA129EaVQmkQeCEczcnnzInnTNIjKPMbirpiQgF66WHTsnn/HRgJvnHBUK4ICAT
         AP/9rBluCrZzJXRpxtTTVW23CUmBM97TpTUW2bbcGSSwtBnkaWCkJyTOmKSJjJdsEoq4
         dwZhH/Mc6fxfZPQSN8TwYOiWNGUZYV9Yg6s1lobmV83eV89w5uYIzjqWEGYibJD8tKU9
         qnhF7EVzEcI63awSbt38lRPHRW6gJEWuScwVpig55QIF79xzeQBJRrdzbnBiDNxqMmk2
         aXW/gjzWOvqGsqK6sHQ6E9UqodeiPHIKM72cIxdVBN0Bi3e0bL8RXmNaPjwhKavtSoKr
         rP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764680388; x=1765285188;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z+ls4lUKyqIXh7xVjbyit136L3KGyzdT9oph+fPZ8XY=;
        b=qhW3n1Irf0jkiRX3PladmHrUvutKo4I3ip+X49A0jYrTk5MuCGYqx4GebHDmrUEGgn
         VvqUb4G+NRDtJ25Y/RRXK3ZFz+2wrqflyvCD2lfgLs2Q1Qtjpjkvb1cjZ6LWE/AD+ZPU
         wvY64ex97yF4W/CcLzOQqVEI2nSsoxR9K7E7ygtpMXUmHS2UzpG8BSJMODS3i3Mtckqb
         krajKGSvO5KzZ+zv4LVFsnv+IuzYCEA+2SnaphFqKeg0x9MVF/oy4rmf4EeVjVBxzYvb
         69QtL7/TRjyiFuVJbbFH5mQ3f+lj1yg51noyqpNPHUtPG1DhBEqprfthPFZU+mGnmygZ
         8IuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVQv5NeYYixg4V0UR3udvAH0oeMOVLXhN6cJ21bzYEwV7D7iRJRSfCdLUUM+XC19mlk7YWYY/aGIM+2nv26/5y@lists.infradead.org
X-Gm-Message-State: AOJu0YwcKuBGBOxYpWWIo9GcWB/ZilVKmvzNFtAeAJlbBmo2t7w82/sz
	0e4gf1T25fUzjdBfoVJxxI3Cxs86KIRCRlD9Jfw+QdrOSaShMyfi43bhn4hEjrQOwT0=
X-Gm-Gg: ASbGnctpCjQ219/8j+SvUCxSmqW3QPEJQunB0vuKBZ6wPJJeXXJx0CgpfXcDovCeURt
	tWYYKjxDQVKwJSY+f5ezXcVPKvA2bLdhFtzwBgyH/WFVXO8TZx7qsi3z2GSpZlOdRn7NGNTeMCf
	J6IfSCYgV/lRhdQ8YZyNMA3rQ4ZKKh31VOf7UBE93XFavxP6/HWaVopxYVp7TunyavenQRWv8wv
	YVg+CM+AM6HQKFFpWOn5s/ertBLIabP3Qj/Hp6Dnf1oc1qofzXuD1C7KD+s6YI8seQb1FQ6gL7u
	ik1Gmw21smaVzfldA10N7sUqdnVFT9g7v868K9BBOArOUo081/XeCHNF91aA5gU12JSpLpc743p
	qITXY+P1ULioFG9UWrz8qFhngkEeAhY4Ba7xM3iChZZxBuZOpV2yi8QUE6Y5fg3TPmVjmhBV7Pd
	WKtg42kmSUk6hPstTj
X-Google-Smtp-Source: AGHT+IGscgmO9lGvKECfXYxarz54H8vd6b6Z8s96skxFG4vOheFhB/1RykCLMjNWz27fHa4U3hWjMg==
X-Received: by 2002:a05:6000:1887:b0:42b:3cd2:e9bc with SMTP id ffacd0b85a97d-42cc1d352d7mr43033216f8f.39.1764680388191;
        Tue, 02 Dec 2025 04:59:48 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca1a310sm34376220f8f.26.2025.12.02.04.59.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 04:59:47 -0800 (PST)
Message-ID: <653a7555-18e6-4066-993d-412a63a63f51@linaro.org>
Date: Tue, 2 Dec 2025 12:59:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] perf arm-spe: Don't hard code config attribute
To: Leo Yan <leo.yan@arm.com>
References: <20251201-james-perf-config-bits-v1-0-22ecbbf8007c@linaro.org>
 <20251201-james-perf-config-bits-v1-7-22ecbbf8007c@linaro.org>
 <20251202122835.GY724103@e132581.arm.com>
 <20251202124240.GA724103@e132581.arm.com>
Content-Language: en-US
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Mike Leach <mike.leach@linaro.org>,
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 Leo Yan <leo.yan@linux.dev>, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251202124240.GA724103@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_045950_240938_21ABFFEE 
X-CRM114-Status: GOOD (  24.35  )
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



On 02/12/2025 12:42 pm, Leo Yan wrote:
> On Tue, Dec 02, 2025 at 12:28:35PM +0000, Coresight ML wrote:
>> On Mon, Dec 01, 2025 at 04:41:10PM +0000, Coresight ML wrote:
>>> Use the config attribute that's published by the driver instead of
>>> hard coding "attr.config".
>>>
>>> Signed-off-by: James Clark <james.clark@linaro.org>
>>> ---
>>>   tools/perf/arch/arm64/util/arm-spe.c | 15 ++++++++-------
>>>   1 file changed, 8 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/tools/perf/arch/arm64/util/arm-spe.c b/tools/perf/arch/arm64/util/arm-spe.c
>>> index d5ec1408d0ae..6c3dc97fde30 100644
>>> --- a/tools/perf/arch/arm64/util/arm-spe.c
>>> +++ b/tools/perf/arch/arm64/util/arm-spe.c
>>> @@ -256,7 +256,7 @@ static __u64 arm_spe_pmu__sample_period(const struct perf_pmu *arm_spe_pmu)
>>>   
>>>   static void arm_spe_setup_evsel(struct evsel *evsel, struct perf_cpu_map *cpus)
>>>   {
>>> -	u64 bit;
>>> +	u64 pa_enable_bit;
>>>   
>>>   	evsel->core.attr.freq = 0;
>>>   	evsel->core.attr.sample_period = arm_spe_pmu__sample_period(evsel->pmu);
>>> @@ -288,9 +288,10 @@ static void arm_spe_setup_evsel(struct evsel *evsel, struct perf_cpu_map *cpus)
>>>   	 * inform that the resulting output's SPE samples contain physical addresses
>>>   	 * where applicable.
>>>   	 */
>>> -	bit = perf_pmu__format_bits(evsel->pmu, "pa_enable");
>>> -	if (evsel->core.attr.config & bit)
>>> -		evsel__set_sample_bit(evsel, PHYS_ADDR);
>>> +
>>> +	if (!evsel__get_config_val(evsel->pmu, evsel, "pa_enable", &pa_enable_bit))
>>> +		if (pa_enable_bit)
>>> +			evsel__set_sample_bit(evsel, PHYS_ADDR);
>>
>> Hmm... I am a bit concerned for the evsel__get_config_val() usage
>> throughout the series.
>>
>> evsel__get_config_val() returns a whole config value rather than the
>> bit field specified by the format name.  If other bits (but not the
>> "pa_enable" bit) are set in the same config set, would it wrongly set
>> the PHYS_ADDR sample bit?
> 
> I saw you used FIELD_GET() to read specific bit field in
> evsel__get_config_val().  This is not concerned anymore.
> 
> Sorry for noise.
> 
>> Seems to me, for reading specific format, perf_pmu__format_bits() is
>> more suitable than evsel__get_config_val().
> 
> For me, this comment is still valid, given perf_pmu__format_bits()
> will always exist.
> 

perf_pmu__format_bits() only returns the mask for the format attribute 
that's published by the kernel. It never changes depending on what 
options the user provides and doesn't even say which config field that 
mask applies to. It's fairly useless on its own and should probably be 
made private to pmu.c if we manage to refactor its uses out of 
intel-pt.c. Although they're a bit more involved there than here so I 
won't touch it now.

evsel__get_config_val() returns the value that the user provided for a 
named attribute which is what we need to do here.

> Thanks,
> Leo


