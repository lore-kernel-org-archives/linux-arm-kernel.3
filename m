Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C3F6C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 14:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dkuuWKeJYmtkm56YSgRvcU4oboHFdcC4bjctcTZXYsw=; b=EXW9RBDmv6Yolr8XOS2EjYpxWY
	3LByvbYuIFbTjj54J++iv+Zqnq34rduXs4dc/GitN1IwL9KMEJbS/lS5pErsv4EhdfQT1rsa5p4GM
	sd0Otxbq0OvwnkA5Tvu8NTDXn0BQNSg9OHWAMrrVCKtn53XV5k6RwRdDi+yR6xzVkbRfQd73aNE5X
	PObKFwUPOA6Sa+XuiyCgITLN/3IqhZM9kyldv+FgO9Vq20RXMLwg3H63VZBfWkrhQBgtb7ecwyc2o
	3ggQZBKDoCm6BaIOak/4C8lq+15J05E6ciP68F0WKf4j+dpTsR7BlYL0Hb7NFImIcOpI2hyAkebAC
	yjQqWRVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td8kp-000000074rW-1PBY;
	Wed, 29 Jan 2025 14:09:19 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td8jV-000000074dq-0rrG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 14:07:58 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-385ef8b64b3so6081545f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jan 2025 06:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738159675; x=1738764475; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dkuuWKeJYmtkm56YSgRvcU4oboHFdcC4bjctcTZXYsw=;
        b=o+FWnso28AEd9ny5vC7w98Ca9RfsFLgX4vi8HVU+1BfhoSLonfY+vO76lie+gZ5Vv9
         kbqwxefzotVvALQQfXRZQcsrlHcUYh9GtcjzAc8bmjTjpzK9pSbmA3AH/o8l/NLCeP9U
         tp6MIYWB2cyv2gkNrxJ5B+u67PKfPnDIOLgYP+UpKIDfigdtEJ4YrJvQ7i7dlGDt699T
         VM6h2O8CO+VUohPR/yRnVG8ojMjn1WarbUYimtjfNr72mJ/9OJI3gG1w6O5dMfwqRpVK
         o9JcTwAEmoaQXGYQfOHhu4eM0hBBtITzU4+udBh01rTypYQ9xipphAflZUn5n106LCrq
         VzUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738159675; x=1738764475;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dkuuWKeJYmtkm56YSgRvcU4oboHFdcC4bjctcTZXYsw=;
        b=Q+l9Efmmb/h7Xwn11YDKTRlxH8VAkTNso5etdtoJfy7moVUnOLGi2VS+JLFRUNhQmI
         oxYI7fF4q5u2ZTGmRz4Fm5exmCF3tBqActGWnRIet3F2v6css4DeDbR9lQaNb6yrs9Gi
         TiHdOR3qoiHpOuY2W6KBGCx0k6s2SwCkHnnTtXrYdE3dfMENbe+jaH2x2VcGSWasJgYS
         9t5SZTABV068gc1VRCLbLTH6IBBTvt2EufZJG/LtmIgRhnqPqx2cgiXTs7EewN/ThhBh
         NWFmYU5MT+CyXtcSK0qPlDTXgeVEhtOfmrntwV4zOh0YocsSoiXhQUN95W806REUbNqs
         ixEw==
X-Forwarded-Encrypted: i=1; AJvYcCWdaHK6ZQ021GtookA6jI0FSbd01jDhAlO4CNoUpRjVo8z9uvH56JfYuYQQtf7zPI5qDXqGiOPM1VBjzdFhE0R8@lists.infradead.org
X-Gm-Message-State: AOJu0Ywhi3J5ZoPGe51SEwFWJwkm4jjOb8t9i4LO7MKbcYlt+Gm53fgn
	py1NdC3OMNeqZTMPBv3aoX01Fyha4kHkdASmV+ZKNg+pBRQ9gseh+slahYjEIaM=
X-Gm-Gg: ASbGncsYawMPBPUS4nwKemR4BjI9WQL+ScUiX2/MDjg55LMUG37xYEthsZIP8tMNrg8
	fgCuv/SaIZ7a3ecMREHlv/2QpS3mvUt67r4ECUipprYMx9O9Oa4yjkfR6bfSvCCsH2NvRj1xE8y
	DA5iJYohtFzyn7JUoUTvgknHVSPUB1BzyWl7weJjmfiI5/lFcFgUEDdttxYAZe0dp+zPso/PZIF
	LFCi6eI2Jw0Do98lP1pket9K5YhmayYVLp3z9JbCsTDaUj2mabQxKm0DH41HJ4qrwch1S2rF7FB
	PB3X6s4gCWFafwCx6uaigKMnmS8KOiGSetvy
X-Google-Smtp-Source: AGHT+IHfaiytgwBKkLFsb74qxfBwYXhML0vsZSRUcqxi74NrfeZsxJrNuB1BToWwWaD5gvoZ47QV1g==
X-Received: by 2002:a05:6000:1f85:b0:38a:3732:4462 with SMTP id ffacd0b85a97d-38c520af328mr3030005f8f.48.1738159674943;
        Wed, 29 Jan 2025 06:07:54 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.107])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a17d5d4sm16929484f8f.21.2025.01.29.06.07.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 06:07:54 -0800 (PST)
Message-ID: <90f53256-8c75-4b43-aac6-5cb9084efe1c@linaro.org>
Date: Wed, 29 Jan 2025 14:07:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/6] Coresight: Add Coresight TMC Control Unit driver
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
References: <20250124072537.1801030-1-quic_jiegan@quicinc.com>
 <20250124072537.1801030-6-quic_jiegan@quicinc.com>
 <44bd0d5e-a232-49c3-ba2f-e63e2f2c99be@linaro.org>
 <b3d9e4f0-cca8-45a5-a5b7-239cdeed2751@quicinc.com>
 <070c70ac-c76b-4d1a-acb6-d29cc85967b9@linaro.org>
 <29bbb602-61fd-44e1-afb5-f158c8d61c97@quicinc.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <29bbb602-61fd-44e1-afb5-f158c8d61c97@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_060757_267988_0C33B12D 
X-CRM114-Status: GOOD (  29.79  )
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



On 29/01/2025 1:02 pm, Jie Gan wrote:
> 
> 
> On 1/29/2025 6:35 PM, James Clark wrote:
>>
>>
>> On 29/01/2025 12:46 am, Jie Gan wrote:
>>>
>>>
>>> On 1/28/2025 7:55 PM, James Clark wrote:
>>>>
>>>>
>>>> On 24/01/2025 7:25 am, Jie Gan wrote:
>>>>> The Coresight TMC Control Unit hosts miscellaneous configuration 
>>>>> registers
>>>>> which control various features related to TMC ETR sink.
>>>>>
>>>>> Based on the trace ID, which is programmed in the related CTCU ATID
>>>>> register of a specific ETR, trace data with that trace ID gets into
>>>>> the ETR buffer, while other trace data gets dropped.
>>>>>
>>>>> Enabling source device sets one bit of the ATID register based on
>>>>> source device's trace ID.
>>>>> Disabling source device resets the bit according to the source
>>>>> device's trace ID.
>>>>>
>>>>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>>>>> ---
>>>>>   drivers/hwtracing/coresight/Kconfig          |  12 +
>>>>>   drivers/hwtracing/coresight/Makefile         |   1 +
>>>>>   drivers/hwtracing/coresight/coresight-ctcu.c | 276 ++++++++++++++ 
>>>>> + ++++
>>>>>   drivers/hwtracing/coresight/coresight-ctcu.h |  30 ++
>>>>>   include/linux/coresight.h                    |   3 +-
>>>>>   5 files changed, 321 insertions(+), 1 deletion(-)
>>>>>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu.c
>>>>>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu.h
>>>>  >
>>>>
>>>> [...]
>>>>
>>>>> +/*
>>>>> + * ctcu_set_etr_traceid: Retrieve the ATID offset and trace ID.
>>>>> + *
>>>>> + * Returns 0 indicates success. None-zero result means failure.
>>>>> + */
>>>>> +static int ctcu_set_etr_traceid(struct coresight_device *csdev, 
>>>>> struct coresight_path *cs_path,
>>>>> +                bool enable)
>>>>> +{
>>>>> +    struct coresight_device *sink = coresight_get_sink(cs_path- 
>>>>> >path);
>>>>> +    struct ctcu_drvdata *drvdata = dev_get_drvdata(csdev- 
>>>>> >dev.parent);
>>>>> +    u8 trace_id = cs_path->trace_id;
>>>>> +    int port_num;
>>>>> +
>>>>> +    if ((sink == NULL) || !IS_VALID_CS_TRACE_ID(trace_id) || 
>>>>> IS_ERR_OR_NULL(drvdata)) {
>>>>> +        dev_err(&csdev->dev, "Invalid parameters\n");
>>>>> +        return -EINVAL;
>>>>> +    }
>>>>> +
>>>>> +    port_num = ctcu_get_active_port(sink, csdev);
>>>>> +    if (port_num < 0)
>>>>> +        return -EINVAL;
>>>>> +
>>>>> +    /*
>>>>> +     * Skip the disable session if more than one TPDM device that
>>>>> +     * connected to the same TPDA device has been enabled.
>>>>> +     */
>>>>> +    if (enable)
>>>>> +        atomic_inc(&drvdata->traceid_refcnt[port_num][trace_id]);
>>>>> +    else {
>>>>> +        if (atomic_dec_return(&drvdata->traceid_refcnt[port_num] 
>>>>> [trace_id]) > 0) {
>>>>> +            dev_dbg(&csdev->dev, "Skip the disable session\n");
>>>>> +            return 0;
>>>>> +        }
>>>>> +    }
>>>>> +
>>>>> +    dev_dbg(&csdev->dev, "traceid is %d\n", cs_path->trace_id);
>>>>> +
>>>>> +    return __ctcu_set_etr_traceid(csdev, trace_id, port_num, enable);
>>>>
>>>> Hi Jie,
>>>>
>>>> Using atomic_dec_return() here doesn't prevent 
>>>> __ctcu_set_etr_traceid() from running concurrent enable and 
>>>> disables. Once you pass the atomic_dec_return() a second call to 
>>>> enable it will mess it up.
>>>>
>>>> I think you need a spinlock around the whole thing and then the 
>>>> refcounts don't need to be atomics.
>>>>
>>> Hi, James
>>> Thanks for comment. I may not fully tested my codes here. What I was 
>>> thinking is there's no way the refcnt could become a negative number 
>>> under current framework. So I just added spinlock in 
>>> __ctcu_set_etr_traceid() to ensure concurrent sessions correctly 
>>> manipulate the register.
>>>
>>> As the trace_id related to the bit of the ATID register, I think the 
>>> concurrent processes are working fine with spinlock around read/write 
>>> register.
>>>
>>> I may not fully got your point here. Please help me to correct it.
>>>
>>> Thanks,
>>> Jie
>>>
>>>
>>
>> No it can't become negative, but the refcount can be a different state 
>> to the one that was actually written:
>>
>>
>>    CPU0                             CPU1
>>    ----                             ----
>>    ctcu_set_etr_traceid(enable)
>>                                     ctcu_set_etr_traceid(disable)
>>    atomic_inc()
>>    recount == 1
>>                                     atomic_dec()
>>                                     recount == 0
>>
>>                                     __ctcu_set_etr_traceid(disable)
>>                                     Lock and write disable state to
>>                                     device
>>
>>    __ctcu_set_etr_traceid(enable)
>>    Lock and write enable state to
>>    device
>>
>>
>> As you can see this leaves the device in an enabled state but the 
>> refcount is 0.
> Yes, you are right. I didnt consider this scenario. We definitely need 
> spinlock here.
> 
>>
>> This is also quite large if you use atomic types:
>>
>>   /* refcnt for each traceid of each sink */
>>   atomic_t traceid_refcnt[ATID_MAX_NUM][CORESIGHT_TRACE_ID_RES_TOP];
>>
>> Presumably you can't have the refcount for each ID be higher than the 
>> max number of TPDMs connected? If you make the locked area a bit wider 
>> you don't need atomic types and also solve the above problem. So you 
>> could do u8, or DECLARE_BITMAP() and bitmap_read() etc to read 3 bit 
>> values. Or however wide it needs to be.
> The original purpose of using atomic here is trying to narrow the locked 
> area.
> 
> I think u8 is ok here.
> u8 traceid_refcnt[ATID_MAX_NUM][CORESIGHT_TRACE_ID_RES_TOP] will cost 
> 224 bytes, I think it's acceptable here.
> 
> Thanks,
> Jie
> 

Yep u8 sounds ok then



