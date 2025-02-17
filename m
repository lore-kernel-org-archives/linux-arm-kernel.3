Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C273C021A6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 09:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yFdEGk76Z8IF8jmdF4E6VELhXn1U7cH2XbnMNEOUO1Q=; b=R4VlYb9NwLYiIivnsFZM0HrLMX
	JDd+GvIFiIYNJh68glo0vG4LFCqHmzqePPvX0+NmXHT/SZkaZTax5E3iEHZCU+rLhSkkFIy0GQRRO
	jmX34PRn01G6muoDca6rBAXiK2uX+dimwv2krfZqDifBQi2F7mDKHI0805Hni+8ulB8VtV2WCZJyv
	/6xnuyqhegeyMbHPawlIy62remIbhbyI+SmwXzgAJlfEkxxqPEVEU7XGHBdNTUxn5PolSwDc8intn
	CVjPTtN2nugk5fDwgH4FTEnm8PBXCXZqXwGX/tALYGQzL4vWWjMj3PmQaoefRJzYUiNb9uCJyiZm5
	BGfWL1zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjxcX-00000003xt2-36VJ;
	Mon, 17 Feb 2025 09:40:57 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjxLZ-00000003uvq-3LfF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 09:23:27 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-38f403edb4eso428460f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 01:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739784204; x=1740389004; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yFdEGk76Z8IF8jmdF4E6VELhXn1U7cH2XbnMNEOUO1Q=;
        b=Avr1ZvmTvBPdgb6xXE/g7ANiabXzRAcE2iR4kCvzzQEm+EKlCaWPzs/+p5tVhg5io5
         W4Ope9hfxmwgf2ZuCsHpCLqwc40WT0dFD7SRUtysTHuQmqCgEgx1Y5nVRhDiv0sZ0sAJ
         73BoczC4RmgNNe+V37qtVVwfDR6xRhhoZeWKQFvVsf7ze+U4L21DnA9r3ZmrkvjzBoDl
         yw+MtBJKKhfKCVs30oRLd9+a4Gd2415nRJ/5rgZhCXltaXu5B/fgPE9ICBPOgtMJ0iRK
         AbPhR/dUgUoCKxxj0eVd/lAYc/M1IeqeSxyFl/Ymb6+PrKzVCPWNnmDJW9CZze1TbFxB
         fnsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739784204; x=1740389004;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yFdEGk76Z8IF8jmdF4E6VELhXn1U7cH2XbnMNEOUO1Q=;
        b=jK3wpCXzr0zUj6k+iTLcrVM1Cyujt6V/pyx/TWJHihwDqKSCkvkHbGYI2W1vL8R9zB
         6mKzY5exe51X4Fe9vg603VB8jUvzXb3eIosVnCtBi4+fm9uU+smC2yGB4aoJmlcslrl6
         dieGEZis82wXWA1ZnXR2TF4ji7NDQqdOJWMziD5swkCn8vPmPvSo2URoFuOO2tWVVbXG
         H29IB5RTuYbe6GmkotRRwg9mfzIs3DqqwPQuYZa8LXQldNbSa0rWreUn7+p+pSpS1YIE
         UBXGnAjRkZMNkqc/pkX/18qTVl2KtDIAnXQVoGuWrJ1h2e7lIdr0G5EBoV85JD1ll2YR
         syhA==
X-Forwarded-Encrypted: i=1; AJvYcCXwwFd9hGF70wuPFLBK6LGaFEUubv1ym8SaZQ89Lul1bq8Znj+V5+K4oCB1WP1rOt6tWwXkuwl3ra5rO/rceav1@lists.infradead.org
X-Gm-Message-State: AOJu0YwcrEGPlQe0qpZkrq0rhb+sNGkgzHBrivGt2uOluIJVeVLIVIQk
	L/fhGeXG4UjqVU4+vRhoyP5CtIlzT3fprTbAfwOuq7W74isk9WJ6cxxAJU7at6o=
X-Gm-Gg: ASbGncvPHkq6wROd/0BZBXQMax3CD4MSMi/SO4EjUfs0+n43ptmuObZMDOJlU3gl19j
	EaOTvZqTf9ovNuSCv6iAGlbiRU/wLyQ/kprzrpTMX9vnUHrHMaEVQcQkfZL6I0C0VQ0MVaS0w8n
	M6zdzIkHy6R5ECGl64TFRVnX4COS1aI9bxn8/9tN+ioyQJH49jJcZSo3mnGB4059eUq/0I4bvff
	UlQ3vZktae0eoLl9LFdxehU3bKyA4kjEfyoR1lbi5RTDUl52FRPXbjuY4SEDCY3/tXZEQTbiGJP
	lSHHYLthbTAPdfT3SkqnoIeXAg==
X-Google-Smtp-Source: AGHT+IHIAU1bziAKxZvRP07ZCo+6IKM9hGRF5YvWCGZkvCvo55+fOBkWCNJRs18IttuXSjIV+ShShQ==
X-Received: by 2002:a05:6000:1865:b0:38f:4d20:4a0a with SMTP id ffacd0b85a97d-38f4d204b59mr531618f8f.28.1739784203790;
        Mon, 17 Feb 2025 01:23:23 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f8273sm11466058f8f.89.2025.02.17.01.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 01:23:23 -0800 (PST)
Message-ID: <8ee69b17-e7ac-4f73-abbe-93f4e29fe51d@linaro.org>
Date: Mon, 17 Feb 2025 09:23:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/7] Coresight: Introduce a new struct coresight_path
To: Jie Gan <quic_jiegan@quicinc.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250207064213.2314482-1-quic_jiegan@quicinc.com>
 <20250207064213.2314482-5-quic_jiegan@quicinc.com>
 <a633f52c-81e8-4c0d-aca7-cc18360866eb@linaro.org>
 <4b521b49-7104-4f25-82cb-4f9be7b235f4@quicinc.com>
 <b61af324-7488-4a4f-9f9e-2ecb004fc4c7@linaro.org>
 <5e6edfce-ef2e-48d2-ad0c-0120606394fb@quicinc.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <5e6edfce-ef2e-48d2-ad0c-0120606394fb@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_012325_845122_65842196 
X-CRM114-Status: GOOD (  22.79  )
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



On 17/02/2025 1:14 am, Jie Gan wrote:
> 
> 
> On 2/14/2025 7:09 PM, James Clark wrote:
>>
>>
>> On 14/02/2025 1:34 am, Jie Gan wrote:
>>>
>>>
>>> On 2/14/2025 12:00 AM, James Clark wrote:
>>>>
>>>>
>>>> On 07/02/2025 6:42 am, Jie Gan wrote:
>>>>> Add 'struct coresight_path' to store the data that is needed by
>>>>> coresight_enable_path/coresight_disable_path. The structure will be
>>>>> transmitted to any required devices to enable related 
>>>>> funcationalities.
>>>>>
>>>>> The trace_id will be allocated after the path is built. Consequently,
>>>>> The ETM3x and ETM4x devices will directly read the trace_id from path
>>>>> which result in etm_read_alloc_trace_id and etm4_read_alloc_trace_id
>>>>> being deleted.
>>>>>
>>>>> Co-developed-by: James Clark <james.clark@linaro.org>
>>>>> Signed-off-by: James Clark <james.clark@linaro.org>
>>>>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>>>>> ---
>>>>>   drivers/hwtracing/coresight/coresight-core.c  | 106 ++++++++++++ 
>>>>> +-----
>>>>>   drivers/hwtracing/coresight/coresight-dummy.c |   5 +-
>>>>>   .../hwtracing/coresight/coresight-etm-perf.c  |  30 +++--
>>>>>   .../hwtracing/coresight/coresight-etm-perf.h  |   2 +-
>>>>>   drivers/hwtracing/coresight/coresight-etm.h   |   1 -
>>>>>   .../coresight/coresight-etm3x-core.c          |  54 ++-------
>>>>>   .../coresight/coresight-etm4x-core.c          |  54 ++-------
>>>>>   drivers/hwtracing/coresight/coresight-etm4x.h |   1 -
>>>>>   drivers/hwtracing/coresight/coresight-priv.h  |  12 +-
>>>>>   drivers/hwtracing/coresight/coresight-stm.c   |   3 +-
>>>>>   drivers/hwtracing/coresight/coresight-sysfs.c |  17 ++-
>>>>>   drivers/hwtracing/coresight/coresight-tpdm.c  |   3 +-
>>>>>   include/linux/coresight.h                     |  12 +-
>>>>>   13 files changed, 143 insertions(+), 157 deletions(-)
>>>>>
>>>> [...]
>>>>> @@ -352,7 +352,7 @@ static void *etm_setup_aux(struct perf_event 
>>>>> *event, void **pages,
>>>>>        * CPUs, we can handle it and fail the session.
>>>>>        */
>>>>>       for_each_cpu(cpu, mask) {
>>>>> -        struct list_head *path;
>>>>> +        struct coresight_path *path;
>>>>>           struct coresight_device *csdev;
>>>>>           csdev = per_cpu(csdev_src, cpu);
>>>>> @@ -405,15 +405,15 @@ static void *etm_setup_aux(struct perf_event 
>>>>> *event, void **pages,
>>>>>               cpumask_clear_cpu(cpu, mask);
>>>>>               continue;
>>>>>           }
>>>>> -
>>>>>           /* ensure we can allocate a trace ID for this CPU */
>>>>> -        trace_id = coresight_trace_id_get_cpu_id_map(cpu, &sink- 
>>>>> >perf_sink_id_map);
>>>>> -        if (!IS_VALID_CS_TRACE_ID(trace_id)) {
>>>>> +        trace_id = coresight_path_assign_trace_id(path, 
>>>>> CS_MODE_PERF);
>>>>> +
>>>>> +        /* Can be 0 and valid, ETE doesn't need an ID */
>>>>> +        if (trace_id < 0) {
>>>>
>>>> Not sure why I wrote it like this, but I think we should leave it as 
>>>> it was with !IS_VALID_CS_TRACE_ID(). Even with ETE it calls the 
>>>> trace ID allocator, so nothing has changed here.
>>>>
>>> Sure, Will restore. For ETE or ETM, we dont need traverse the path, 
>>> just directly allocate the trace id based on cpu id.
>>>
>>> Jie
>>>
>>>
>>
>> Sorry I meant to only keep the !IS_VALID_CS_TRACE_ID() bit. We still 
>> need to call the new coresight_path_assign_trace_id() otherwise it 
>> doesn't get assigned to the path. I saw that got removed in v11.
>>
>>
> Sorry for the misunderstanding, I was focused on "nothing has changed 
> here", lol.
> 
> I got your point here.
> So the updated codes should be:
> ...
>                  /* ensure we can allocate a trace ID for this CPU */
>                  trace_id = coresight_path_assign_trace_id(path, 
> CS_MODE_PERF);
>                  if (!IS_VALID_CS_TRACE_ID(trace_id)) {
>                          cpumask_clear_cpu(cpu, mask);
>                          coresight_release_path(path);
>                          continue;
>                  }
> ...
> 
> 
> Thanks,
> Jie

Yes that looks good.


