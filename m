Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC1B8D206A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 14:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K76Qia/ZXCjjiEWFg52fUrDZVdVaau3amc8W3Ejug+E=; b=fEthIh/03eqzKb7KlzhBexO455
	iCKBQtIos5Hgh2aL8W32mvswcG2cfYt6LYT4Se+i15/bQVtMNcEbI02WU0Hz4FQfPUSDcXmOcdnyg
	b565otippEDIcO71BPjnxZvpFxhfSc/P9F7gJGv02+aVGoLoBgzgQsltYTicMQ5780nAL1rYPmygY
	l+mQoc3qv/MXDd/vBjmYtjOQMhnvCSvulxuer37WwNBZtTuiya49ztna5/l/qKPMHsVQ9pTJCj4dC
	8pQFpuOQlKW48h/CeTpSxYG7B365R/dz6FKjRfu5IWgLk5aAPHQdbO2cUPvVQsoO+Qxqg9TgE1u7f
	/9cqqt3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRA13-000000086Cj-0OWt;
	Thu, 04 Dec 2025 14:09:05 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRA11-000000086CI-2WhO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 14:09:04 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso10509295e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 06:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764857342; x=1765462142; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K76Qia/ZXCjjiEWFg52fUrDZVdVaau3amc8W3Ejug+E=;
        b=dyiEcUOEWY8DmYpbVb/lHWymAHtJNi3CYRjTJ9uYM4mJyRdd0At3/OD6ynrJyTdjit
         dhSOlPqPo0TVZXZa1O3Iax1EawEcM5ziU1UUFBdKK8878hNmelexW3uZ1Df/Lkn+mEPK
         RtONsLdxUMXhrzOAfIf3zx/OQ95S3P+KXfDXGX/k818/YDnlkQoZgvSvAfQmDFMd2Ilm
         2ryk7YG/aNVIXMdLBeFjdkPR/mfZWr4oLkh1+qnW5KbjaDzUsj3r7H8WnopJ7apegqVF
         HDtETwef2kK72tGoloaoTzIS+wtKgdzw0tdtzrN4x0MREQBbUKcLPZBQob+iQaAn+FeA
         ucKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764857342; x=1765462142;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K76Qia/ZXCjjiEWFg52fUrDZVdVaau3amc8W3Ejug+E=;
        b=Kkx+NHbhDHy0H+ycQ7NiAWqfef/468/JiGG4VtF/5oMaiuWoI/iIq83ToIOjKHlyHE
         DPjt9+AxDnyTLC+okjh3ulLS/I8QEC5onfL0PcuHLp1atW4sURrXYlUTOipEGwTjZ251
         dj7aRGrHde7gPzHdaQG1uPaXM3oT9fj02MGOvDY+UPxynFvDwIbqb83XKnnTC+wQUyv6
         lVhORRfyot0UJzImQF9gGQeaB0ZOybgJcvZJu931nZ+Ls60xmUkyPnRq4V5Hdj8DEpMf
         UljnYYRUfuAsSQ7Vz1Q8TynNe2Ni1F9ow0iYudP1VIOfMIcO3qf1luHDb1qka2IMqsZg
         xAug==
X-Forwarded-Encrypted: i=1; AJvYcCXLzj6fvnXQnxdwQyPR5k7crg/6BWJ7ai6R3U3AUXF8qrzmM5KnY54eVuZnaVEqhOC8+UtUKH2QumAmeJVwSGiL@lists.infradead.org
X-Gm-Message-State: AOJu0YyLn7RLrHfrNa+miMsejberLOtjqhiae6Fcf4m8FKabmeiA+ofq
	RIj7d1f+2B99qv8ZHE/93+SbktV1rvNZPcVGTKES0wJwjG7ja34BHSLeGf/ZaAUSN7Q=
X-Gm-Gg: ASbGncvTe59cTRwarDBg0OJDWmpUvkm3e7xvLLpnF1QBJlPowN8LC1DGdkWTthj96OD
	LgUvIzhRdHW2u3jXeBXJt3pQQApdpklP4qEKUE5TT3ASLNJosEAOm/2JLhk1jAejI4WoM2gyqAK
	0ms4uw+7JYa+9W7bLMUwKHx6rYRqn2VdyjPOr7YqbhvdbTlW9nfzDR2w7y35YRXhYYNaQjdgSNg
	zHaBWBrJhoCHd5ifw2cT7/qOaITTCSxSEiUo2lYk4Eomh1gyxyb6pOi0KISYvoHKsETTWgbff/2
	h0rQXY6S1pMger5qv1CDrZNKP9hJJ7ADMBGg/brjglk92GuaBS7lGYwVcoOcBc//M0iz/VJj72G
	5uPHLP67bTXC9QsPzMVMJrcdKrYJLhbmry+IfPxfJ2TR2n1YjlAl3YOsYjeAhL8DMjGBZZapCWR
	uCurECB8A7D5BX0WAf
X-Google-Smtp-Source: AGHT+IE2K35j9CdlrIvdH8Bojq1tholsrKjYuSZd1hMIs3XjAOQLvnDBCIItIYw5O13dYS68vstw3Q==
X-Received: by 2002:a5d:490a:0:b0:42b:3366:6330 with SMTP id ffacd0b85a97d-42f731cf312mr4668252f8f.57.1764857341593;
        Thu, 04 Dec 2025 06:09:01 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbe90f0sm3477398f8f.9.2025.12.04.06.09.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 06:09:01 -0800 (PST)
Message-ID: <857538e7-cac2-4871-9711-4c434420df8a@linaro.org>
Date: Thu, 4 Dec 2025 14:08:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] perf cs-etm: Don't hard code config attribute when
 configuring the event
To: Leo Yan <leo.yan@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, John Garry <john.g.garry@oracle.com>,
 Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20251201-james-perf-config-bits-v1-0-22ecbbf8007c@linaro.org>
 <20251201-james-perf-config-bits-v1-6-22ecbbf8007c@linaro.org>
 <20251202121528.GX724103@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251202121528.GX724103@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_060903_698501_5DBFE500 
X-CRM114-Status: GOOD (  21.46  )
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



On 02/12/2025 12:15 pm, Leo Yan wrote:
> On Mon, Dec 01, 2025 at 04:41:09PM +0000, Coresight ML wrote:
> 
> [...]
> 
>> @@ -103,13 +103,20 @@ static int cs_etm_validate_context_id(struct perf_pmu *cs_etm_pmu, struct evsel
>>   				      struct perf_cpu cpu)
>>   {
>>   	int err;
>> -	__u64 val;
>> -	u64 contextid = evsel->core.attr.config &
>> -		(perf_pmu__format_bits(cs_etm_pmu, "contextid") |
>> -		 perf_pmu__format_bits(cs_etm_pmu, "contextid1") |
>> -		 perf_pmu__format_bits(cs_etm_pmu, "contextid2"));
>> +	u64 ctxt, ctxt1, ctxt2;
>> +	__u64 trcidr2;
>>   
>> -	if (!contextid)
>> +	err = evsel__get_config_val(cs_etm_pmu, evsel, "contextid", &ctxt);
>> +	if (err)
>> +		return err;
>> +	err = evsel__get_config_val(cs_etm_pmu, evsel, "contextid1", &ctxt1);
>> +	if (err)
>> +		return err;
>> +	err = evsel__get_config_val(cs_etm_pmu, evsel, "contextid2", &ctxt2);
>> +	if (err)
>> +		return err;
> 
> Seems to me, this is not right.  The current code checks any context
> ID setting but it can tolerate if missing "contexid[*]" format.
> 
> After calling evsel__get_config_val(), if any "contextid[*]" format is
> missed, it returns error and will diretly bail out.  As a result,
> cs_etm_validate_context_id() will always return error.
> 

Missed by the driver or the user? evsel__get_config_val() only returns 
an error when "contextid" isn't published by the driver, not when the 
user doesn't supply one of those options. The actual user supplied value 
is in the out param, not the return value.

Having said that, this does make it an error if the driver did stop 
publishing one, which might be too inflexible and is a new behavior. I 
can change to it ignore the errors instead.

>> +
>> +	if (!ctxt && !ctxt1 && !ctxt2)
>>   		return 0;
>>   
>>   	/* Not supported in etmv3 */
>> @@ -120,12 +127,11 @@ static int cs_etm_validate_context_id(struct perf_pmu *cs_etm_pmu, struct evsel
>>   	}
>>   
>>   	/* Get a handle on TRCIDR2 */
>> -	err = cs_etm_get_ro(cs_etm_pmu, cpu, metadata_etmv4_ro[CS_ETMV4_TRCIDR2], &val);
>> +	err = cs_etm_get_ro(cs_etm_pmu, cpu, metadata_etmv4_ro[CS_ETMV4_TRCIDR2], &trcidr2);
>>   	if (err)
>>   		return err;
>>   
>> -	if (contextid &
>> -	    perf_pmu__format_bits(cs_etm_pmu, "contextid1")) {
>> +	if (ctxt1) {
>>   		/*
>>   		 * TRCIDR2.CIDSIZE, bit [9-5], indicates whether contextID
>>   		 * tracing is supported:
>> @@ -133,15 +139,14 @@ static int cs_etm_validate_context_id(struct perf_pmu *cs_etm_pmu, struct evsel
>>   		 *  0b00100 Maximum of 32-bit Context ID size.
>>   		 *  All other values are reserved.
>>   		 */
>> -		if (BMVAL(val, 5, 9) != 0x4) {
>> +		if (BMVAL(trcidr2, 5, 9) != 0x4) {
>>   			pr_err("%s: CONTEXTIDR_EL1 isn't supported, disable with %s/contextid1=0/\n",
>>   			       CORESIGHT_ETM_PMU_NAME, CORESIGHT_ETM_PMU_NAME);
>>   			return -EINVAL;
>>   		}
>>   	}
>>   
>> -	if (contextid &
>> -	    perf_pmu__format_bits(cs_etm_pmu, "contextid2")) {
>> +	if (ctxt2) {
>>   		/*
>>   		 * TRCIDR2.VMIDOPT[30:29] != 0 and
>>   		 * TRCIDR2.VMIDSIZE[14:10] == 0b00100 (32bit virtual contextid)
>> @@ -149,7 +154,7 @@ static int cs_etm_validate_context_id(struct perf_pmu *cs_etm_pmu, struct evsel
>>   		 * virtual context id is < 32bit.
>>   		 * Any value of VMIDSIZE >= 4 (i.e, > 32bit) is fine for us.
>>   		 */
>> -		if (!BMVAL(val, 29, 30) || BMVAL(val, 10, 14) < 4) {
>> +		if (!BMVAL(trcidr2, 29, 30) || BMVAL(trcidr2, 10, 14) < 4) {
>>   			pr_err("%s: CONTEXTIDR_EL2 isn't supported, disable with %s/contextid2=0/\n",
>>   			       CORESIGHT_ETM_PMU_NAME, CORESIGHT_ETM_PMU_NAME);
>>   			return -EINVAL;
>> @@ -163,10 +168,14 @@ static int cs_etm_validate_timestamp(struct perf_pmu *cs_etm_pmu, struct evsel *
>>   				     struct perf_cpu cpu)
>>   {
>>   	int err;
>> -	__u64 val;
>> +	u64 val;
>> +	__u64 trcidr0;
>>   
>> -	if (!(evsel->core.attr.config &
>> -	      perf_pmu__format_bits(cs_etm_pmu, "timestamp")))
>> +	err = evsel__get_config_val(cs_etm_pmu, evsel, "timestamp", &val);
>> +	if (err)
>> +		return err;
>> +
>> +	if (!val)
>>   		return 0;
> 
> Similiar issue here.  The current code returns 0 if not find "timestamp"
> format.  With this change, it returns error instead.
> 
> Thanks,
> Leo


