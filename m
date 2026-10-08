Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22700CA600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 10:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EnmV+GF5F+3o4WuN9B2P/gYsWL8ntjLMdxMPioE157g=; b=VE5Ssc81GU6+XS90KEfUKpSKup
	hL2j6/BpRS3iFK9qaHjvqquYcGUOWtizsXbPuee9Kfv4bpBQnLjzPq2T9ZKC3/kSN7n+BIpGv0td6
	gfGU9UXyi8UvLIuRs7Z9Tdz1bsuFw5y79xq5Dvh4vSY5H+zbiFacBrnEf28OAcX8cfEaOLPPIHD6c
	4Tg/Rc2HBW+enw3j+5SszlIO8hXtcYk7cb3xNk7rlMYmDhgrQthQR05hROTJuKS3zjyl3P/cp7NBf
	BC+ZxMZB0g/Of+yJAInFbkytbU+SrBZJn+d+GtZ3YHPlRyhuy47bWpXGoR1a9DL6RzicnnVRDznf5
	AHEqIdPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xElBH-00000004597-2g2L;
	Thu, 08 Oct 2026 10:16:55 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xElBF-0000000458S-2tza
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 10:16:54 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a01933b584so25797685e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 03:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791454612; x=1792059412; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EnmV+GF5F+3o4WuN9B2P/gYsWL8ntjLMdxMPioE157g=;
        b=zapGh0QmdEY6iAouAxnjBjUOSGyolN8QnYSxbLwGKacDq7k+rWd7zlGodqMWAcbzmo
         DhfTXxaxS835DTmIpeRIOLX6izZnFIkD5g5dbV+o4+EStTqJ4Qjy+Avg6givO5Px/ZZb
         Xd+pJ3I/H+ZAwRUH/6tcUwmyJJVC9RMFfw8Nu4J44dFqdODSIiTYsz7s0rBQ+s1qwPlk
         P3gWL8Grpc2SkVTtuxgxyyuN6wQqGweB2NT311oY3gOnX5VwxVisKSulums84Nycc+Rk
         hx9ZG7KM00YfSzqk8Fc0qos4sNXmXk/baaHB79MjcEoAOroO+zpnsvCZnejSpAjk3awJ
         GtzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791454612; x=1792059412;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EnmV+GF5F+3o4WuN9B2P/gYsWL8ntjLMdxMPioE157g=;
        b=iZwDGSbWJNVHBsapD1dcWTQf+ZDkRFw+rnhEy3/pqeggbWrGyH93XYdaT5LM/L9YlG
         bjBJYcvAV7Y8Ue+nmWrdYHmIYhQ42FfuOFenMgVIL54la1CUbASlx8DsEIA16GmVzo2g
         Ee51n9IEyGPh+3rw5E/n3VTEngP5Z3M2vNs2AeZvkqVm/0FRY5tM3niV+88Yn2MnDVBM
         OM37Mj+Mjk2nNJGHZA5U1hEhiXXA4xTRyqH/7uoukZxkp5FRvnKhq/4+nQ0P0UP35V2Q
         D1HwlVrnHvJ1/KAIAMGZpdxVR1KGn8wSiID+f1J0+Sd2mktK/nuR4SfRg4K73dxXycYm
         mtgA==
X-Forwarded-Encrypted: i=1; AKwUvBxxssHpf8V9gvRaFpdppew+8dQUnmtRqwMebnmSYewVMS+undJCgQxnwYs2RBtDhCBFcKGxZszeVsMGmM+1xKCl@lists.infradead.org
X-Gm-Message-State: AFuF++mWeoCOyeRoeHww3pwJOxADoyx8sfHZ6CrJLYalYefnj2HfsH9I
	iVGblUvFXgp01kdqIT3IQl0u8+aCbYliQ55gYNKArSCD2DLXRDRGrmUkmBFJxoslm2o=
X-Gm-Gg: AYBFou2okjS4jnjhqfCx7+MgZKmQtSzbl6jJXV1ze40FAc/lDPjDv6sIJ2oqlE9MYlF
	y3cqDq9tZuBL8CY99iIdS4iuadFmB9NWpU1zIIdOdErFmpr3lT2T75DKy6Fgreq4aHOtxEheIQR
	bQpXsdf8B7KgjqqAS60+tIJKY5iEOLEQf5rP4p/8kAn8O7fXt86dJFA7yUg/CLJIE9Rud0XLep7
	BbafUe6pJUdAqyzptNn0KBSHS2eSl2xGA3JDmdbKXrOyn4we2XJu2NP4K5AEFwyLHdkVzRoUuYi
	0omwyOxvg7VxwNH2BOWVXYE4LHE6C87MlnmLBWd6MWzb5AT3R1kEthadlWv3rJ+MmPfzbxeNfQs
	oEBPxLQrjY3pKwmo90saAI0P9yGGj3WDVEpx9lsTwgDauv/HTgJzdvH5RBteJkUblPmFzJx5wHq
	yY2Xlrum02F3jSuWLwyweqT4HrvCV6BOZMWHfaEcKsj/utXEOSjSzid/Wk1wBLpNPmxjh/7DqEa
	iY=
X-Received: by 2002:a05:600c:820d:b0:49f:fe39:5bc8 with SMTP id 5b1f17b1804b1-4a180423b6bmr85575205e9.12.1791454611842;
        Thu, 08 Oct 2026 03:16:51 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1842abdb9sm57441605e9.6.2026.10.08.03.16.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 03:16:51 -0700 (PDT)
Message-ID: <a8373961-8ca5-4e8f-9f81-69d099bcaf3c@linaro.org>
Date: Thu, 8 Oct 2026 11:16:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/14] perf cs-etm: Turn on context packet timestamps
 in per-thread mode
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@arm.com>, John Garry <john.g.garry@oracle.com>,
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
 Leo Yan <leo.yan@linux.dev>, linux-arm-kernel@lists.infradead.org,
 coresight@lists.linaro.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>,
 linux-doc@vger.kernel.org
References: <20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org>
 <20260821-james-cs-unformatted-per-thread-fix-v2-3-00c4fd0701b4@linaro.org>
 <20260826153648.GK8904@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260826153648.GK8904@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_031653_768980_4496EC5B 
X-CRM114-Status: GOOD (  20.70  )
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



On 26/08/2026 16:36, Leo Yan wrote:
> On Fri, Aug 21, 2026 at 10:49:01AM +0100, James Clark wrote:
> 
>> @@ -453,13 +453,22 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
>>   	 */
>>   	evsel__set_sample_bit(cs_etm_evsel, CPU);
>>   
>> -	/*
>> -	 * Also the case of per-cpu mmaps, need the contextID in order to be notified
>> -	 * when a context switch happened.
>> -	 */
>>   	if (!perf_cpu_map__is_any_cpu_or_is_empty(cpus)) {
>> +		/*
>> +		 * Timestamps are required to interleave samples from different
>> +		 * CPUs.
>> +		 */
>>   		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", 1);
>> +		/* Context IDs are required to associate trace to a process */
>>   		evsel__set_config_if_unset(cs_etm_evsel, "contextid", 1);
>> +	} else {
>> +		/*
>> +		 * Enable context packet timestamps only (no periodic
> 
>> +		 * timestamps). Even in per-thread mode with a single process we
>> +		 * still need to correlate trace to a specific mmap around
>> +		 * execs, which can be done with just context packet timestamps.
> 
> Could we use terminology that is aligned with the ETM spec?
> 
>    "Disable periodic timestamps but generate timestamps for trace
>     synchronization  ... to a specific mmap around execs, which
>     can be done with just timestamps of trace synchronization."
> 

Done.

>> +		 */
>> +		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", UINT64_MAX);
> 
> It seems this will eventually convert UINT64_MAX to 0xf for the
> timestamp bit field. Why not use 0xf directly to avoid confusion?
> 

Then it wouldn't support the size of the field changing. I thought that 
was the point of the kernel publishing the fields dynamically. Hard 
coding widths and positions in userspace only caused issues in the past.

I don't think "...MAX" is confusing for what the intention is, but maybe 
a comment would be better than hard coding it?

>>   	}
>>   
>>   	/*
>>
>> -- 
>> 2.43.0
>>


