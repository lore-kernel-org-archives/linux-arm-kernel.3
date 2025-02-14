Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30982C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 11:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V7+4mem2ft+RVvvLEGTsxFIwY8eDWNZdbE4U/VEn5OU=; b=enYg+UzCt4gQ80vA3GneXR/dK2
	xwseE3gtQzht6mX39+TQ9bEvECeknnJ4X5CFs2IFA1pM5470QBYM9vKmoxnIf1BxTQjeKWhtrj0YY
	TqKaxRTXNuklHzgaMGNKl6PQ8QMHzFiq0mChDSAjN77E/hyDY+2bdqtvijSY9jwKeQDaRE1oILbtd
	684v0Kq5Whkg3Vbi+7wl7dlARzmTKvlwoqGT5tcSQh2f9pnI9GhvuPRWx2COuMV9731XZxOQD11j2
	v6+LmEjMr0sxI/udgQvPDXz4Ne+WPwqfJUEhGomghkToUhGwzQoOlZKyOdZdRcJbqWOGlEHF6lIgw
	b4t0Ig+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1titar-0000000EcWx-1Umc;
	Fri, 14 Feb 2025 11:10:49 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1titZQ-0000000EcIy-0cNd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 11:09:21 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-38f2c4382d1so348398f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 03:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739531358; x=1740136158; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V7+4mem2ft+RVvvLEGTsxFIwY8eDWNZdbE4U/VEn5OU=;
        b=mqNZgObzrEOodwngogcGA1S599N6GX+0PTqPO+/0G+UvISnyUiwjKcEwGJxIsayI0N
         tZooJ3Ljcg5OKn8rwDqBl3coGUWxUGZGenT6F+H60fhDlg37F+cORlDOaVJUdU8xBT86
         lyXfvK51q0T4bxxupeD1gkPiY0g09rVl2ujnDCyCOanzjjzg/i1CZFYk5VhvR7BEJ7H1
         0N6Oqli7YLA61npPQOTi0G9ewzlnlsFLLDMArKl1RgL32zivml6jxn7do1WdL+rnrHeP
         8fZrY1X/cJCoqXBktyLosWr1vh5LzGJ0ClwaCPrY7RrkYroZnBKSgmS8SrBibcNnj0Hx
         kOfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739531358; x=1740136158;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V7+4mem2ft+RVvvLEGTsxFIwY8eDWNZdbE4U/VEn5OU=;
        b=sWWiephWx18Tq1oQJqzvXu8MIRAAMrYpnY9p04wW/sSMbO+LqVliTplfVTjXQ9MsQF
         ONAVp36dxueIMet1lh+XNqP83QWBAVJKhASrF9uPS3WGkCfD1zejwg9jU3GQu8gABzxD
         cFUfVp1AAoPrjeZ8dg/CuNhEz+3kzMRCVz4E/obQOpzzPGseUWmPkL3YYjZJY5T224I4
         DW7oKoDH0mpnMIg0wC+77tzquAaB/PC3AN6bBTk8jJGNkn9XxrLwl7kI3uxlbXJO0e/Q
         jitH6ubn9Sp4BjjgzV+OetSmQfSQzwsYxBukYI8xeIDVaQ/VpyjL3Ye/ApyYzpTvqZk8
         Z8vQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAOrSpYH/KcTpODd51Ipj0fyXxuLLikzRNSfnEgFMBPmIGSzbxAuoWpkPMbNZ7gJFLGfhBGpFoUAg8pyri6CDB@lists.infradead.org
X-Gm-Message-State: AOJu0YxjHZfFX7yLUP/7C+bM8M73sq+izoqKMdvuGo07RGsTYFHCPyQu
	mnteoCZJteCF71VjURW0uUDgCqSnUo/AkrhevMJZ26tdNMxg8dKlWEncokS3NBc=
X-Gm-Gg: ASbGncssWNWP+rm8iVliiRRRZ5ewaxf4h2Bwcp8ITFgL6LHVSUFvyHETkQbcxWVLBac
	BFZiudREiWA3zVBRlOdxK3q7BZHbu10pED0egwLhc0lCGpL2LZ34yXiFhea9FPBOmyYN4qBfeME
	dGUue2UvZYmN2zDTCxOFMK2OyDFo+GoxOW3DpLHojBp3V4BzrC+XnEI657WYbTh1+xINxNA6R5Q
	BsPFfGqoWP49VsQ3Y63ZWt97mWm7ZheBh1cE0+rt+7FO7oy75kG0/Mn/HmoCWGulK10cew1CYsg
	9KwBArN3PMJBUSspS8A2/ydv7w==
X-Google-Smtp-Source: AGHT+IHSYzmRWK6x5dqInVV0CJ5pE2+xfHMxdXlGP6JgPhn1Wonrdhujy16nNDJTyIehflsH4kOBJw==
X-Received: by 2002:a05:6000:71c:b0:38f:2b64:5327 with SMTP id ffacd0b85a97d-38f2b6457ccmr2854936f8f.24.1739531358487;
        Fri, 14 Feb 2025 03:09:18 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f25913eb6sm4373298f8f.51.2025.02.14.03.09.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2025 03:09:18 -0800 (PST)
Message-ID: <b61af324-7488-4a4f-9f9e-2ecb004fc4c7@linaro.org>
Date: Fri, 14 Feb 2025 11:09:16 +0000
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
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <4b521b49-7104-4f25-82cb-4f9be7b235f4@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_030920_202465_E16C4B88 
X-CRM114-Status: GOOD (  18.27  )
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



On 14/02/2025 1:34 am, Jie Gan wrote:
> 
> 
> On 2/14/2025 12:00 AM, James Clark wrote:
>>
>>
>> On 07/02/2025 6:42 am, Jie Gan wrote:
>>> Add 'struct coresight_path' to store the data that is needed by
>>> coresight_enable_path/coresight_disable_path. The structure will be
>>> transmitted to any required devices to enable related funcationalities.
>>>
>>> The trace_id will be allocated after the path is built. Consequently,
>>> The ETM3x and ETM4x devices will directly read the trace_id from path
>>> which result in etm_read_alloc_trace_id and etm4_read_alloc_trace_id
>>> being deleted.
>>>
>>> Co-developed-by: James Clark <james.clark@linaro.org>
>>> Signed-off-by: James Clark <james.clark@linaro.org>
>>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>>> ---
>>>   drivers/hwtracing/coresight/coresight-core.c  | 106 +++++++++++++-----
>>>   drivers/hwtracing/coresight/coresight-dummy.c |   5 +-
>>>   .../hwtracing/coresight/coresight-etm-perf.c  |  30 +++--
>>>   .../hwtracing/coresight/coresight-etm-perf.h  |   2 +-
>>>   drivers/hwtracing/coresight/coresight-etm.h   |   1 -
>>>   .../coresight/coresight-etm3x-core.c          |  54 ++-------
>>>   .../coresight/coresight-etm4x-core.c          |  54 ++-------
>>>   drivers/hwtracing/coresight/coresight-etm4x.h |   1 -
>>>   drivers/hwtracing/coresight/coresight-priv.h  |  12 +-
>>>   drivers/hwtracing/coresight/coresight-stm.c   |   3 +-
>>>   drivers/hwtracing/coresight/coresight-sysfs.c |  17 ++-
>>>   drivers/hwtracing/coresight/coresight-tpdm.c  |   3 +-
>>>   include/linux/coresight.h                     |  12 +-
>>>   13 files changed, 143 insertions(+), 157 deletions(-)
>>>
>> [...]
>>> @@ -352,7 +352,7 @@ static void *etm_setup_aux(struct perf_event 
>>> *event, void **pages,
>>>        * CPUs, we can handle it and fail the session.
>>>        */
>>>       for_each_cpu(cpu, mask) {
>>> -        struct list_head *path;
>>> +        struct coresight_path *path;
>>>           struct coresight_device *csdev;
>>>           csdev = per_cpu(csdev_src, cpu);
>>> @@ -405,15 +405,15 @@ static void *etm_setup_aux(struct perf_event 
>>> *event, void **pages,
>>>               cpumask_clear_cpu(cpu, mask);
>>>               continue;
>>>           }
>>> -
>>>           /* ensure we can allocate a trace ID for this CPU */
>>> -        trace_id = coresight_trace_id_get_cpu_id_map(cpu, &sink- 
>>> >perf_sink_id_map);
>>> -        if (!IS_VALID_CS_TRACE_ID(trace_id)) {
>>> +        trace_id = coresight_path_assign_trace_id(path, CS_MODE_PERF);
>>> +
>>> +        /* Can be 0 and valid, ETE doesn't need an ID */
>>> +        if (trace_id < 0) {
>>
>> Not sure why I wrote it like this, but I think we should leave it as 
>> it was with !IS_VALID_CS_TRACE_ID(). Even with ETE it calls the trace 
>> ID allocator, so nothing has changed here.
>>
> Sure, Will restore. For ETE or ETM, we dont need traverse the path, just 
> directly allocate the trace id based on cpu id.
> 
> Jie
> 
> 

Sorry I meant to only keep the !IS_VALID_CS_TRACE_ID() bit. We still 
need to call the new coresight_path_assign_trace_id() otherwise it 
doesn't get assigned to the path. I saw that got removed in v11.



