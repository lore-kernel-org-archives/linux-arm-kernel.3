Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F215CF34DA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vDtHQxi1rdGP8DGFs7EsJXlWoID8JCx8fUIbOFScgks=; b=S05nUp3WQWgMqp1ojk335yNHkr
	Rv4bqJl1o+5Yy8uDkuP+J+vGEBjfYoRCdzPTx0lzagxNNFmDpKci8agO0ZZj9VGGn6myLWpIc8rF2
	er6epQ1njNCPzrgLykB60vkr6paO9Qn4R1W4duKt3Y+Z2MFdScJNaPFV6ycgjzZk6W/K+u3WVFgx8
	2q0yBJGYTNExxZrwhgD162IHXMGiseB0gc02VHvU8A2TN2zNpULXTYe4ij1jmK1QQ4o/CnbPcJagW
	J4MO6d0cz8LDBcvVPmWSlH0ll36QraM0GjOLb9M474iIzu/636p5MpTSfKbCX01rMJ61uWhi8oZnW
	iHwFwaAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkJ8-00000003VMu-0uxF;
	Wed, 19 Nov 2025 15:41:22 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkJ5-00000003VMM-1L50
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:41:20 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-477b1cc8fb4so5905265e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 07:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763566877; x=1764171677; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vDtHQxi1rdGP8DGFs7EsJXlWoID8JCx8fUIbOFScgks=;
        b=IAzsl9bzWtQzEQqQ6KvBqcLx0VyWTKr8Bwf2dV9rAD6cM3VEXKdcCfP+zFz7fHhFmA
         wELf7S4Yr36FVBfuwN8IJhfE2RrPhkbnhpURQ3Yshw4iVnFEnA6F2elR/rzpoMVWwVKY
         cUfUXINv+CGOG1/30X5WFdYlXP1Cd7P6JY5xzykt91ORgJxooGmPmaB/xahI2tKnXeKl
         eQUask6lY+2Tic8pAlYxkZ6ddnPgHU8oNX8A28roZAFCo/kU1zUVJBYo4xAns2MhVlcm
         Epy99QYjZC1VC64zwyLs/fg5OT9yMOVMl7GGpOT44a3mvafpX7R5sr0Xu8S85fu9/+DI
         MjmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763566877; x=1764171677;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vDtHQxi1rdGP8DGFs7EsJXlWoID8JCx8fUIbOFScgks=;
        b=Nv4CWNEgz7qedYLerog+oKh1r0Qln3YTlpxX+TGZumJFb4FiP2DkmSpsKREjIl1RQZ
         h3co83gmF1eR4sZGAuQHcBHO/w+jQqSr0hmcNZQPSm4v03pGLqOeHdrbD92ocMcRpsFL
         vO30aMaBHfBN5rMzbtg0ak0xXdvoM9nQXQs3BgaB6yTExN3AIoEDksLTdDBMQ+fScTzM
         ndoOC7mGf1x6ZVCP7LEG4wg05fLJoiCtNHL0OpKVoUjcoCV6quY94f/ArtHfkMUiqyxF
         GzuN9a9MrrMgHYIt43//d1mVncFrKTSjYMouuvpU14Sp5rSjLKrNYOeOQzjC31n7FSrx
         p5zw==
X-Forwarded-Encrypted: i=1; AJvYcCVa2B04NlpcoHoWUWqxETi3ML+Brtlmt+TCfhablDBtiODlC48wvlMx7Qugtk0uEEy9tZpZvo4PDQVPzM1aZOvJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxZc1ju8ocb4zAODJjqsurtlAq5dqkkGDPwayZ4CzDpQawXsVD9
	4rQo5fpgzJtlks+mcmOA5Vunp4NECGDfEf1jtGaCT9HIv2vQXc/pumx0F51vZ/oGaZQ=
X-Gm-Gg: ASbGncviw4HWBl+OYIu32xtTJPJXbZszmHLZjr0+2Lo6cITq2ql3rOF0JECy9lq9eMM
	3nAu9p2djruUilBZdu55TL9NEezA8onFo+yTMm6wiO4SNz6P4Qw0HF885A4PU/jKWnNIQ8GPte0
	SbwMIwxK76cLa/urT9KwX8ec6OFKtNVp0CPGCmmo6I8NlOyn20Q6HHFxRWLtAFzgSqBDmP0Otjw
	h39koo/vOS+HN/X7o102zASm31cMty0HlCF2jMBhkcCkR5J0m4dbR/WCt4JuhEWUHfvfsM1D6Uw
	/xN7u6pku5XbXLr+uZYdZFeYdkmjgIjWVgn/dI72vz1M5PamHDWO2D7ElJ+F8NX8vJzLBFX5LMF
	eDGtTxMEClkaeKSIXXl+1p/74k3AtJRg0b+nUOSctFb2lhVK4DrdvhIaNllQX1R9pJjltoroGdt
	YdiJlTtdmGkDabgS+83MvXfnOdDOA=
X-Google-Smtp-Source: AGHT+IFtyyePdy0Qgtx94y63TFvec5BUCQ8EPqlz77lMFSeDM7vk8ISrEXa/KVyjRqjmr4Ac00OZoQ==
X-Received: by 2002:a05:600c:4714:b0:471:d2f:7987 with SMTP id 5b1f17b1804b1-4778fea8d93mr177335635e9.26.1763566877358;
        Wed, 19 Nov 2025 07:41:17 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b1012af0sm54683435e9.6.2025.11.19.07.41.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 07:41:17 -0800 (PST)
Message-ID: <3d0eb1d5-c50e-4329-b406-8a5bca3b5f98@linaro.org>
Date: Wed, 19 Nov 2025 15:41:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/15] coresight: Move CPU hotplug callbacks to core
 layer
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Yabin Cui <yabinc@google.com>, Yuanfang Zhang <quic_yuanfang@quicinc.com>
References: <20251104-arm_coresight_path_power_management_improvement-v4-0-3d4bba674709@arm.com>
 <20251104-arm_coresight_path_power_management_improvement-v4-15-3d4bba674709@arm.com>
 <f01585fc-919d-4059-81e2-7131dd54553a@linaro.org>
 <20251119144813.GE8204@e132581.arm.com>
 <3ab75fd3-b739-4348-9a89-e67224e23488@linaro.org>
 <20251119153656.GF8204@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251119153656.GF8204@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_074119_401168_9F13868E 
X-CRM114-Status: GOOD (  22.62  )
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



On 19/11/2025 3:36 pm, Leo Yan wrote:
> On Wed, Nov 19, 2025 at 03:19:55PM +0000, James Clark wrote:
> 
> [...]
> 
>>>>> +static int coresight_dying_cpu(unsigned int cpu)
>>>>> +{
>>>>> +	struct coresight_device *source = per_cpu(csdev_source, cpu);
>>>>> +	struct coresight_path *path;
>>>>> +
>>>>> +	if (!source || !source->path)
>>>>> +		return 0;
>>>>> +
>>>>> +	/*
>>>>> +	 * The perf event layer will disable PMU events in the CPU hotplug.
>>>>> +	 * CoreSight driver should never handle the CS_MODE_PERF case.
>>>>> +	 */
>>>>> +	if (coresight_get_mode(source) != CS_MODE_SYSFS)
>>>>> +		return 0;
>>>>> +
>>>>> +	/*
>>>>> +	 * Save 'source->path' here, as it will be cleared in
>>>>> +	 * coresight_disable_source().
>>>>> +	 */
>>>>> +	path = source->path;
>>>>> +
>>>>> +	coresight_disable_source(source, NULL);
>>>>> +	coresight_disable_path(path);
>>>>> +	return 0;
>>>>
>>>> If the user is expected to re-enable and this new state is visible, don't
>>>> you need to use the regular coresight_disable_sysfs() function? It calls
>>>> coresight_disable_source_sysfs() which updates a refcount.
>>>
>>> Good point!  We only need to maintain refcnt for system tracers (e.g.,
>>> STM).  The per-CPU tracer is only binary states (on or off), we can
>>> simply use "mode" to track state and no need refcnt.
>>>
>>> I will use a separate patch to refactor refcnt.
>>
>> If you remove the refcount then wouldn't it break scripts that make multiple
>> enable calls? I thought the same logic for the system sources applies to CPU
>> sources.
> 
> I am not removing the refcount. Since we have csdev->mode to track the
> device state, I just keep refcount == 0 for the CPU source instead of
> refcount == 1.  This is transparnt for user space (no any change).
> 
> Before my change:
> 
>    echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
>    echo 1 > /sys/bus/coresight/devices/etm2/enable_source
>    refcount = 1
>    echo 1 > /sys/bus/coresight/devices/etm2/enable_source
>    refcount = 1
>    echo 1 > /sys/bus/coresight/devices/etm2/enable_source
>    refcount = 1
> 
>    echo 0 > /sys/bus/coresight/devices/etm2/enable_source
>    refcount = 0
> 
> After my change:
> 
>    echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
>    echo 1 > /sys/bus/coresight/devices/etm2/enable_source
>    refcount = 0
>    echo 1 > /sys/bus/coresight/devices/etm2/enable_source
>    refcount = 0
>    echo 1 > /sys/bus/coresight/devices/etm2/enable_source
>    refcount = 0
> 
>    echo 0 > /sys/bus/coresight/devices/etm2/enable_source
>    refcount = 0
> 
> As a result, the CPU PM flow doesn't need to bother refcount when to
> disable the path.
> 
> Thanks,
> Leo
> 

Oh ok I missed that it's not incremented for ETMs, that's fine then.

It's confusing that it behaves differently depending on some hidden 
property of the device. Not something that users should be expected to 
work out.

>> TBH I don't really know what problem the refcount and multiple balanced
>> enable/disable calls solves. But even if we decide it's not needed, it's too
>> late to change now.


