Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 883CACA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 12:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0WYQcGuErMUo2kj8MYEXUp1hSIeKyP4od7V3q7dorkY=; b=JVdOezqeZjsUWYz8hgUZItWYwh
	m6Otbr8KrWoIJxiyDM57qB8CIx6BIr5AXAQtXs30+rtqdMxuvFz3lGnVW0gGpsfSdIGf0doDbyQr4
	+oyjzjxK6cmTISTqp0AHqITLWPpPO5jbmCgtqQ70LgAZkZssNPbTUMWv68X3R/mvNNs8UAsAyHmYv
	OZBcQggOestSQS1XjKQwx04wSYn3jQ67Qd8VvEZbZmYS143ku0W1Wlz2b2Ex6lSuGJfljN3G6WRHy
	70KBbarHJNjo4BIfBatK52Hbq+9mcUIY+XWeUnYuMEgWcj7+cow5B9mZzDLoUaNRraq8U6+QZq5Pv
	zQBUJPwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGLU-000000099Y2-1Dni;
	Thu, 01 Oct 2026 12:57:08 +0000
Received: from mail-ed2-x0f.google.com ([2a00:1450:4864:33::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGLS-000000099XB-0DNK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 12:57:07 +0000
Received: by mail-ed2-x0f.google.com with SMTP id 4fb4d7f45d1cf-6aaf10bf094so9421895a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 05:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790859424; x=1791464224; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0WYQcGuErMUo2kj8MYEXUp1hSIeKyP4od7V3q7dorkY=;
        b=Ubzep5GZiYhiW9O+UMyXcqhCDk7e8YN1A8d6FVzDsxLBfY0NRcDAc9sh4MwoG20W/c
         WyvZohSfHT5tSvg4SMAfN7fmGeUeO/6/FOUmRJkQk6KVGBXKSx24NXf7UFlHPPXfPCYG
         MJvkQkBUvoN8KUBi4+R8hwY1vXGC17OuU2yd1Zzg+uiBg05npu5LZvrnYDwhND8HOz6Y
         BF245KgCHbp3uQLwDD/RGbNOKMQvuoz97rn4RrQJ7sFTU5HyfebwuhZrgxdSSGWb7ppz
         lSjihxnYhSKYNnPGy7KNGirnl1dKPxd/cZBhzcmt63fD4WzObG1zYT5jHVj/lYkTaZUZ
         gmmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790859424; x=1791464224;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0WYQcGuErMUo2kj8MYEXUp1hSIeKyP4od7V3q7dorkY=;
        b=QICHFyGbLqWImifRbUUZphyLnW/RAc5KKW8cvnjvNB4Gq64yjkLoIZivT9CpuEQvIK
         aQhq7Cn7+B3/SgRGktflQ4o6baTElvfgsG8WewccadIFV1jJUHgTksH4bE1ASslG6hxN
         Dqnvt9hD1rEKN5O6YxMrsZVO1HaB8DxrvNgmx1/4Mc5uRUKKXGadnT2pq2pe4RX3kWD5
         QTsEbrOWtujJSOYcaKbJiIIsuaRbQNzur8QNX1gAsaUywgOI9Sx0QZmbtaRsKXdS55gv
         tqKJK+AehYr0LaugRtkJIbpvEIHXozEnLoQJUJvHIz+dCoC+Y6egdJu5lCe067I2QtI9
         IIXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwbIjlaaMcBV5QNMnyr8J/XQy1G3W+tioNnd1zX2fkf0dHKEMYuRjC/pepQ2oQDcFJC37tA8N0ZkL9Ya+9/lgx1@lists.infradead.org
X-Gm-Message-State: AFq9FYK6bS2u826878I+rOqns7RA2S++1NgJP9SNzLDyCKR/w1kVF+pO
	uAJHkUDjeuX/56HWzgMef6T1dqTemjOUR+qhr5p3O16pnCc6ai2lY6IzdpfWQ2QlDlw=
X-Gm-Gg: AYBFou0mR9QNIBBMMHds4X2PKHVxSw2/qR2BXEFid28Dhjd+Ot7kTMNcIYdefS3JXZy
	Z1Zq5GKAdI1ne1f/bT1bNMczvmZnihHCTwmpT+XamwDyr4gmn1QPtbsaxZxrcsc6t6y69yid+NU
	PrWsBEbBVwGK7eGNoVYnndEgThXq+jA1LAlIk3H4UcuDrwCDBN6o98wb3q/zgNy7btW9dPeLN1d
	UYLGEsfBHzsvGaQJKOhNc80lq4ULQY+ryFKK4R9sWjIBNsxBCQbPzzVsukrvWuF4gRPe/XvndZc
	GmBPgZ0Axje05afKBNn6a54U/QH4n+dQ+AVo8GzOWt6Zg5W/pm034vX2Zx0MwDWv0PxTPUBjgUJ
	3iqkoke6Ym8Dxdem2ZxpSzrDwzhCbCMcVggQe7RFb/jokUcxr3+RNstZWsoAL9QP/AXfEYRy0My
	VwIwVCWjMfFqEYpQ2PeotgHnGGJoZWmfnCE7m44G2fnI5ct5MPesRfq/ChtkIKgXDma3OJbRTX
X-Received: by 2002:a05:6402:401e:b0:6aa:f809:ef3f with SMTP id 4fb4d7f45d1cf-6ae19895d15mr3847262a12.5.1790859424120;
        Thu, 01 Oct 2026 05:57:04 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae42b0782dsm1136509a12.0.2026.10.01.05.57.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 05:57:03 -0700 (PDT)
Message-ID: <b8fe413d-c927-4efd-8988-edf4bf1fd905@linaro.org>
Date: Thu, 1 Oct 2026 13:57:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] perf: cs-etm: Respect --no-itrace option
To: Leo Yan <leo.yan@arm.com>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Suyash Mahar <smahar@meta.com>,
 Amir Ayupov <aaupov@fb.com>, Arnaldo Carvalho de Melo <acme@redhat.com>,
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260821-james-cs-hw_id-output-failure-v1-0-9d532ddabcc3@linaro.org>
 <20260821-james-cs-hw_id-output-failure-v1-4-9d532ddabcc3@linaro.org>
 <20260904174503.GC8904@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260904174503.GC8904@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_055706_125043_D32A241F 
X-CRM114-Status: GOOD (  16.11  )
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



On 04/09/2026 18:45, Leo Yan wrote:
> On Fri, Aug 21, 2026 at 10:50:32AM +0100, James Clark wrote:
> 
> [...]
> 
>> @@ -3603,27 +3603,49 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
>>   	int err = 0;
>>   	int aux_hw_id_found;
>>   	int i;
>> -	u64 *ptr = NULL;
>> +	u64 *ptr = (u64 *) auxtrace_info->priv;
>>   	u64 **metadata = NULL;
>>   
>> -	/* First the global part */
>> -	ptr = (u64 *) auxtrace_info->priv;
>> -	num_cpu = ptr[CS_PMU_TYPE_CPUS] & 0xffffffff;
>> +	etm = zalloc(sizeof(*etm));
>> +	if (!etm)
>> +		return -ENOMEM;
>> +
>> +	session->auxtrace = &etm->auxtrace;
>> +	etm->auxtrace.free = cs_etm__free;
>> +	etm->auxtrace.evsel_is_auxtrace = cs_etm__evsel_is_auxtrace;
>> +	etm->auxtrace.process_event = cs_etm__process_event;
>> +	etm->auxtrace.process_auxtrace_event = cs_etm__process_auxtrace_event;
>> +	etm->auxtrace.flush_events = cs_etm__flush_events;
>> +	etm->auxtrace.free_events = cs_etm__free_events;
>> +	etm->pmu_type = (unsigned int) ((ptr[CS_PMU_TYPE_CPUS] >> 32) & 0xffffffff);
>> +
>> +	/*
>> +	 * Don't go further than the minimum required to identify this event as
>> +	 * auxtrace with cs_etm__evsel_is_auxtrace() so unleader_auxtrace()
>> +	 * works.
>> +	 */
>> +	if (auxtrace__dont_decode(session))
>> +		return 0;
> 
> TBH, I don't look in details, currently auxtrace__dont_decode() only
> exits in the common util/auxtrace.c, why other AUX trace can work well
> the option but cs-etm.c needs particular initialization?
> 
> Seems to me, we even don't need to do any initialization in cs-etm.c
> if the no-itrace flag is set.

Because we have 2 peek() passes over the file which can hit processing 
errors at this point. I assume other users have a fairly trivial 
process_auxtrace_info() callback which can never fail.

