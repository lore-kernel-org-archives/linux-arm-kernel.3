Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 898D6C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 10:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oYPTNkU1oXcU63qUP69dE6PMjwC9Rly3gS0x3zHD7xU=; b=yzD0FMWsajy+Yxy8o6sZ57ljlJ
	M2F4WX9WxdlTeukevYwN/14WHL++cogzE3LGsSGFMU5XFyIJMU7jvR+QId2EjDw88R7LgvdFabXsm
	e8JkugTPTWxOrcO4AhO6uShE0g4mRtET+2ymbfgufW4oCPREY23NsQcW01ORu7Wg7XOW1xmetnCbS
	aJSN5d1NnoprikwBqRhOGuQoMMGlyCEikgQ+9geM9W/ajMEVEXnJgY7bocKmZx8WW/T0DyZKyEtUw
	hyFS4AUxkw4d+pOAcMx5OjBsHtTkeM4mfoENJK2WEXvcaCzzm+m5NxWjj5jBcmxG40O7a6ydiuslo
	Y+0Z1YAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td5RT-00000006kkF-2WsN;
	Wed, 29 Jan 2025 10:37:07 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td5Q8-00000006kfY-0N21
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 10:35:46 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-385de59c1a0so3855558f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jan 2025 02:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738146942; x=1738751742; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oYPTNkU1oXcU63qUP69dE6PMjwC9Rly3gS0x3zHD7xU=;
        b=k77Jjx9Gpdnl0vrmIVXlc1fRgqkRKhKGXAVaRQ4Zx6OdW9MEZKBRCXgDtKpgB4pdBd
         4N87kr+IQLVf98C9C3RgMKiZNsQHbqIyOpTIOFo/Mj4+DAkxHw+5gtSZQwIpXb2F5GCx
         G0JbD9AKPGtUZ2poRVpvd6VhiNL5G75rViraXQn72o7MGlwB7rtORwSGZPYj2Jx63sCF
         BqgojjqqTQ/kWr1T6uo9H85HEutyq5hiQAgFVydTELiUFyDL3GIgRkMBp+aCmIn1JdMJ
         ll0U0ZpIlATdqyIJXjejDDj8lJtf2nLJ/5muYslG7Nvq3248EplyV3ojhJUKHTxnJo7M
         LNbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738146942; x=1738751742;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oYPTNkU1oXcU63qUP69dE6PMjwC9Rly3gS0x3zHD7xU=;
        b=Rm3FmIsbDQazeYZ24GqOholrLsnZOncUsJSKEnyNp5eUjt6H9j+ZIP2HMPrTM3h/8/
         YuLh6djRhYr81bcGog9j7SIE1bJ4AMKqd3gYb5RQeDdsrbAsHKTDOMKTJx6XybfHjDWJ
         YTSb0ZvroR7clX3tg/iT5gp5GWZxuQ+N2I0/zXDK611DW5kuV+bHdr/A9+tWEo6qeP3J
         j5/LSHApe5/DXAKtApZk/fFG2js7b/7ICbiON2Kf2R3F9raQxIL7Yhua3RA2lidgpikE
         iUYnvxkGKFbvX/cRtmqj4Vi/Ox8DhPaGDQmf1hJrSUBcZn/NKUf0ABfr4VqaaQaPfJy2
         pcBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSjoaprE7JtvlbvyTUYh9unIkjf0Y1MjyjBxHc790xyqL8mYtkveLhpbSGGyPeOVW/bFvb3hQy/URfpJVpAPNo@lists.infradead.org
X-Gm-Message-State: AOJu0YyY+9eXtb3paEk8FkFh0bq6ROkJlF8V3EWZf8pYEHHq/M+tp5CI
	7lcKRBL7O1Kp6juO8cHVkm1XkbopkFQmrZUYO6/+VD8dgfmag7vw9MwJBjH/m5o=
X-Gm-Gg: ASbGncs0O25h1rfOQOH4rW/6lzao9u7Tj4UY/1GAoqpaXrZvJryXA3mE7utYEkk8ADH
	MQ+eOeuxVZX75JdaAXlf3gkVLmPyvpu5VrCNkGMjMaq5MypcdEaVtoK4TukMrSnk1b0WH1983ka
	xWuf8rcdHZ3Je1K26BdJD6wtiRktWjqRAVbOIG5bu9M2ywjp4rv3MbmnCvBsvwUxzJ74Ra0yWUh
	A9HOlRG4FTcVk8f1fhpTcnEj5Sop2K/AaBbrTUqUY7egSEyoTvNz/7+5uS81ingxSH9505b0be/
	ktQ3rx79kw7Mn+kXg8PboBDaiA==
X-Google-Smtp-Source: AGHT+IEw8x4QitkXPvA/KMOW1uNnZVD9kQCqkDsmI+tFIUapbqvmdppAq+d0EJl8EjcOlLoePYWIWQ==
X-Received: by 2002:a05:6000:18a9:b0:38a:1b94:ecc1 with SMTP id ffacd0b85a97d-38c5195f9c8mr2292172f8f.25.1738146942076;
        Wed, 29 Jan 2025 02:35:42 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.107])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1c3558sm16493301f8f.84.2025.01.29.02.35.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 02:35:41 -0800 (PST)
Message-ID: <070c70ac-c76b-4d1a-acb6-d29cc85967b9@linaro.org>
Date: Wed, 29 Jan 2025 10:35:40 +0000
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
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <b3d9e4f0-cca8-45a5-a5b7-239cdeed2751@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_023544_946751_83583C14 
X-CRM114-Status: GOOD (  30.58  )
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



On 29/01/2025 12:46 am, Jie Gan wrote:
> 
> 
> On 1/28/2025 7:55 PM, James Clark wrote:
>>
>>
>> On 24/01/2025 7:25 am, Jie Gan wrote:
>>> The Coresight TMC Control Unit hosts miscellaneous configuration 
>>> registers
>>> which control various features related to TMC ETR sink.
>>>
>>> Based on the trace ID, which is programmed in the related CTCU ATID
>>> register of a specific ETR, trace data with that trace ID gets into
>>> the ETR buffer, while other trace data gets dropped.
>>>
>>> Enabling source device sets one bit of the ATID register based on
>>> source device's trace ID.
>>> Disabling source device resets the bit according to the source
>>> device's trace ID.
>>>
>>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>>> ---
>>>   drivers/hwtracing/coresight/Kconfig          |  12 +
>>>   drivers/hwtracing/coresight/Makefile         |   1 +
>>>   drivers/hwtracing/coresight/coresight-ctcu.c | 276 +++++++++++++++++++
>>>   drivers/hwtracing/coresight/coresight-ctcu.h |  30 ++
>>>   include/linux/coresight.h                    |   3 +-
>>>   5 files changed, 321 insertions(+), 1 deletion(-)
>>>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu.c
>>>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu.h
>>  >
>>
>> [...]
>>
>>> +/*
>>> + * ctcu_set_etr_traceid: Retrieve the ATID offset and trace ID.
>>> + *
>>> + * Returns 0 indicates success. None-zero result means failure.
>>> + */
>>> +static int ctcu_set_etr_traceid(struct coresight_device *csdev, 
>>> struct coresight_path *cs_path,
>>> +                bool enable)
>>> +{
>>> +    struct coresight_device *sink = coresight_get_sink(cs_path->path);
>>> +    struct ctcu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>>> +    u8 trace_id = cs_path->trace_id;
>>> +    int port_num;
>>> +
>>> +    if ((sink == NULL) || !IS_VALID_CS_TRACE_ID(trace_id) || 
>>> IS_ERR_OR_NULL(drvdata)) {
>>> +        dev_err(&csdev->dev, "Invalid parameters\n");
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    port_num = ctcu_get_active_port(sink, csdev);
>>> +    if (port_num < 0)
>>> +        return -EINVAL;
>>> +
>>> +    /*
>>> +     * Skip the disable session if more than one TPDM device that
>>> +     * connected to the same TPDA device has been enabled.
>>> +     */
>>> +    if (enable)
>>> +        atomic_inc(&drvdata->traceid_refcnt[port_num][trace_id]);
>>> +    else {
>>> +        if (atomic_dec_return(&drvdata->traceid_refcnt[port_num] 
>>> [trace_id]) > 0) {
>>> +            dev_dbg(&csdev->dev, "Skip the disable session\n");
>>> +            return 0;
>>> +        }
>>> +    }
>>> +
>>> +    dev_dbg(&csdev->dev, "traceid is %d\n", cs_path->trace_id);
>>> +
>>> +    return __ctcu_set_etr_traceid(csdev, trace_id, port_num, enable);
>>
>> Hi Jie,
>>
>> Using atomic_dec_return() here doesn't prevent 
>> __ctcu_set_etr_traceid() from running concurrent enable and disables. 
>> Once you pass the atomic_dec_return() a second call to enable it will 
>> mess it up.
>>
>> I think you need a spinlock around the whole thing and then the 
>> refcounts don't need to be atomics.
>>
> Hi, James
> Thanks for comment. I may not fully tested my codes here. What I was 
> thinking is there's no way the refcnt could become a negative number 
> under current framework. So I just added spinlock in 
> __ctcu_set_etr_traceid() to ensure concurrent sessions correctly 
> manipulate the register.
> 
> As the trace_id related to the bit of the ATID register, I think the 
> concurrent processes are working fine with spinlock around read/write 
> register.
> 
> I may not fully got your point here. Please help me to correct it.
> 
> Thanks,
> Jie
> 
> 

No it can't become negative, but the refcount can be a different state 
to the one that was actually written:


   CPU0                             CPU1
   ----                             ----
   ctcu_set_etr_traceid(enable)
                                    ctcu_set_etr_traceid(disable)
   atomic_inc()
   recount == 1
                                    atomic_dec()
                                    recount == 0

                                    __ctcu_set_etr_traceid(disable)
                                    Lock and write disable state to
                                    device

   __ctcu_set_etr_traceid(enable)
   Lock and write enable state to
   device


As you can see this leaves the device in an enabled state but the 
refcount is 0.

This is also quite large if you use atomic types:

  /* refcnt for each traceid of each sink */
  atomic_t traceid_refcnt[ATID_MAX_NUM][CORESIGHT_TRACE_ID_RES_TOP];

Presumably you can't have the refcount for each ID be higher than the 
max number of TPDMs connected? If you make the locked area a bit wider 
you don't need atomic types and also solve the above problem. So you 
could do u8, or DECLARE_BITMAP() and bitmap_read() etc to read 3 bit 
values. Or however wide it needs to be.


