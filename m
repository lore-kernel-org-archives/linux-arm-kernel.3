Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C2FFCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 11:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/aWllBelj9phVV4rdfuzscm09GkfDh4V09uRcDBag6c=; b=R7kCEhEpuTYOnCxRqnlFp419cv
	F1YVAoA5MOFGqF/fvVOztOXCFrVAi1NClkkqOMbMZX5O+1RHELijagz60hM0wJQdfPzNJuAZ7U/tT
	bv1wBjQPZWLAR/aIS2zVlVYsqgVawff4WENpibXBFACqPrPVoPNp973fQOYdEIIs109kx+Zuiyig/
	ZOPQsCExnTy9HAGSRmyc5UEiUd07iCmTeXFYzvJGgttO/lRemstaqsyGaPRau+c9pf1Ra6/JXrIto
	sRS58tT0uSgRhz/tL3GU4esn1OE+NOJuUZzi0paMcbr8bJsvC+Oy/aVRvwSzAWW3Ax/0tCdZYeE7o
	YZMLtRPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQOA-00000005Ln7-3lm8;
	Mon, 10 Nov 2025 11:48:50 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQO8-00000005Lld-3FVS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 11:48:50 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-47778704516so5596785e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 03:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762775327; x=1763380127; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/aWllBelj9phVV4rdfuzscm09GkfDh4V09uRcDBag6c=;
        b=TVzwimee+xp0sYmG8D2Yb8Gy5oC/IN+lIQbc5lMECkLvnUdoPROv7AVehhr0M7M+9x
         DnqB6gHht9Ch5NLCpKpd+uIoVg71Z1Nlu4XXJeFYmnsihVMnLijaIXLJ97Rg7nHXXAkH
         uv620k8L18Zsnq8j5o1GZzWm2oupUkPoXFCN19cPYlr/dfevNBmKMFk1FT7q9M8wzZ1B
         ueKCOAPPvsdpO1hTdBzJnJV8Cjll3ijQQayfJlECjQ2dVuTscXKA+iexrjzrIJO7bTVU
         Phx3ZE8Q4Csdm77r4I4MAMfLXc8c52ZhyeZQdnvO+ebXb+BQg6xNpqltJjCcwUo80M+I
         OA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762775327; x=1763380127;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/aWllBelj9phVV4rdfuzscm09GkfDh4V09uRcDBag6c=;
        b=g4vX7dCee2IlvS0zurGZDeWLe05pygFbNy+2GoPlA78NoQ85Tx6sq/yY5mhqkjlyO9
         b7u/R97iclk2GC/x6aN++eC0rX3v+x6iOGJCb9oreM3ONLuUwHjMKZFjuzXV/ylNKm2u
         zkyGPMNNuLTyNJYerTCeJ2qRlgX4apjhUyW2XbeXrVtd0Ej0f2++1BVP2die/dpaH9Ap
         y1Vq+gsFEU6VDn6dld0DRPeRVJi4Rc/9FXyYNWuPcg3XkjFwHvb1glc8ye/JSzoGfCs1
         jisrVmKJK32/FkNKw+BjMYIU+LqoNNzY3E1EKjyylx3AN/Glh8HrdUmM6DFMz+B+pA2+
         d3Uw==
X-Forwarded-Encrypted: i=1; AJvYcCXh4YhI4g03sIUpjvhIJo+/UP8raZOsBSb5jtGDw5NvDsrhDMH4fmelqiZYR5FtLun1vQfww5fnW1fzGUzLNzfJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyK7iMBYwzrB4aMUUf8cQMhJoQzk1dd0KMQpZ/UalFz3QG/5u77
	I3jxTI1xmjsMy1Ae4qSQil8UTZ31eXwKCQyWRMZErjWXzZQi67IQR5jHuKY40ewXzMo=
X-Gm-Gg: ASbGncvfxF/46eSDGSILibqpjh4wF4+PUP9+YdY9nQtCX07ZUPLAOqA2NOZsE4Ge1zh
	9ndFSspnY/7J7/Qf9cB/IZXRjx/EHUN4mqPyoqBkThh93wIDilcA26ohwhpSYFA+dZoZrzGx7Hz
	KIdYj0sSrI22UmTqXl4dGAv42QCFShxUUroeUCUsSzI/vYdxPmtSi/IilH8FsrMeQ2rlc06CQ1h
	6fQWR1FnrcCLZrThqpt7X8V/iqTE2Af2oKr/82ZH4SrZqBUgz50jUHF9OitJ7BrPYhvFnSHrJCl
	ZgXXRQzQgamydVm0TA4/Ttnn37nAbLUOXTX+Ijn5ZFTcKs3Eq692cF57rM741swuElIar1oaFVX
	RQ5DQEBoOxvejGMJbGMY8WtmXK2n8WpHk6xGymi/Zb+JadkolGWyXjZCnJjPQT5pG3oGKUYwNFW
	SWa3HUoKaU466wcscd
X-Google-Smtp-Source: AGHT+IEBqNAVsS7d+j7KcMrwl3aOvm+6sOF6E787cRBydc9w9p5vkc8jGW1xUVvipZCiQPXMOlPHAg==
X-Received: by 2002:a05:600c:a45:b0:477:5897:a0c4 with SMTP id 5b1f17b1804b1-4777322e2c0mr80078855e9.4.1762775326932;
        Mon, 10 Nov 2025 03:48:46 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63dfecsm22295113f8f.12.2025.11.10.03.48.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 03:48:46 -0800 (PST)
Message-ID: <1599cba5-aa4a-4991-8865-258830ef248f@linaro.org>
Date: Mon, 10 Nov 2025 11:48:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/15] coresight: Add 'in_idle' argument to
 enable/disable path functions
From: James Clark <james.clark@linaro.org>
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
References: <20251104-arm_coresight_path_power_management_improvement-v4-0-3d4bba674709@arm.com>
 <20251104-arm_coresight_path_power_management_improvement-v4-10-3d4bba674709@arm.com>
 <2ed517c5-b434-4a51-9843-dd7ab6229bec@linaro.org>
Content-Language: en-US
In-Reply-To: <2ed517c5-b434-4a51-9843-dd7ab6229bec@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_034848_850119_B63DC0D3 
X-CRM114-Status: GOOD (  22.30  )
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



On 10/11/2025 11:25 am, James Clark wrote:
> 
> 
> On 04/11/2025 3:21 pm, Leo Yan wrote:
>> Introduce an 'in_idle' argument to the path enable and disable
>> functions. When set to true for idle flow, it skips to touch the sink
>> device to avoid long latency caused by the sink operations.
>>
>> This is a preparation for managing the path during CPU idle.
>>
>> Signed-off-by: Leo Yan <leo.yan@arm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-core.c | 35 ++++++++++++++++++ 
>> +++-------
>>   1 file changed, 26 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/ 
>> hwtracing/coresight/coresight-core.c
>> index 
>> 3ea31ed121f7b59d7822fba4df4c43efb1c76fe7..6c12692efb51c63f3aa9da6f65a349eae1926f4d 100644
>> --- a/drivers/hwtracing/coresight/coresight-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>> @@ -475,7 +475,8 @@ EXPORT_SYMBOL_GPL(coresight_resume_source);
>>    * disabled.
>>    */
>>   static void coresight_disable_path_from(struct coresight_path *path,
>> -                    struct coresight_node *nd)
>> +                    struct coresight_node *nd,
>> +                    bool in_idle)
>>   {
>>       u32 type;
>>       struct coresight_device *csdev, *parent, *child;
>> @@ -498,6 +499,10 @@ static void coresight_disable_path_from(struct 
>> coresight_path *path,
>>                           CORESIGHT_DEV_TYPE_SINK :
>>                           CORESIGHT_DEV_TYPE_LINK;
>> +        /* To reduce latency, CPU idle does not touch the sink */
>> +        if (in_idle && type == CORESIGHT_DEV_TYPE_SINK)
>> +            continue;
>> +
>>           switch (type) {
>>           case CORESIGHT_DEV_TYPE_SINK:
>>               coresight_disable_sink(csdev);
>> @@ -527,7 +532,7 @@ static void coresight_disable_path_from(struct 
>> coresight_path *path,
>>   void coresight_disable_path(struct coresight_path *path)
>>   {
>> -    coresight_disable_path_from(path, NULL);
>> +    coresight_disable_path_from(path, NULL, false);
> 
> Something like a 'reason' enum would be more readable than a boolean. We 
> might have more than two options in the future anyway.
> 
>>   }
>>   EXPORT_SYMBOL_GPL(coresight_disable_path);
>> @@ -550,8 +555,9 @@ static int coresight_enable_helpers(struct 
>> coresight_device *csdev,
>>       return 0;
>>   }
>> -int coresight_enable_path(struct coresight_path *path, enum cs_mode 
>> mode,
>> -              void *sink_data)
>> +static int coresight_enable_path_internal(struct coresight_path *path,
>> +                      enum cs_mode mode, void *sink_data,
>> +                      bool in_idle)
>>   {
>>       int ret = 0;
>>       u32 type;
>> @@ -564,10 +570,6 @@ int coresight_enable_path(struct coresight_path 
>> *path, enum cs_mode mode,
>>           csdev = nd->csdev;
>>           type = csdev->type;
>> -        /* Enable all helpers adjacent to the path first */
>> -        ret = coresight_enable_helpers(csdev, mode, path);
>> -        if (ret)
>> -            goto err_disable_path;
>>           /*
>>            * ETF devices are tricky... They can be a link or a sink,
>>            * depending on how they are configured.  If an ETF has been
>> @@ -579,6 +581,15 @@ int coresight_enable_path(struct coresight_path 
>> *path, enum cs_mode mode,
>>                           CORESIGHT_DEV_TYPE_SINK :
>>                           CORESIGHT_DEV_TYPE_LINK;
>> +        /* To reduce latency, CPU idle does not touch the sink */
>> +        if (in_idle && type == CORESIGHT_DEV_TYPE_SINK)
>> +            continue;
> 
> I can imagine that not being wanted for all sink types in the future, so 
> we could let the sink decide this. But it's probably fine to leave in 
> the core for now and it would be easy to change later.

I got to patch 12 and it adds a special condition in the core to do 
something different for TRBE. We already have pm_is_needed() so 
shouldn't the sinks be deciding this for themselves?

> 
>> +
>> +        /* Enable all helpers adjacent to the path first */
>> +        ret = coresight_enable_helpers(csdev, mode, path);
>> +        if (ret)
>> +            goto err_disable_path;
>> +
>>           switch (type) {
>>           case CORESIGHT_DEV_TYPE_SINK:
>>               ret = coresight_enable_sink(csdev, mode, sink_data);
>> @@ -614,10 +625,16 @@ int coresight_enable_path(struct coresight_path 
>> *path, enum cs_mode mode,
>>   err_disable_helpers:
>>       coresight_disable_helpers(csdev, path);
>>   err_disable_path:
>> -    coresight_disable_path_from(path, nd);
>> +    coresight_disable_path_from(path, nd, in_idle);
>>       goto out;
>>   }
>> +int coresight_enable_path(struct coresight_path *path, enum cs_mode 
>> mode,
>> +              void *sink_data)
>> +{
>> +    return coresight_enable_path_internal(path, mode, sink_data, false);
>> +}
>> +
>>   struct coresight_device *coresight_get_sink(struct coresight_path 
>> *path)
>>   {
>>       struct coresight_device *csdev;
>>
> 


