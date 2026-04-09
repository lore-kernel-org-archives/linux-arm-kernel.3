Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51305F31E21
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 14:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=glQxMUqadEVymCnqDfGq2ZBintLE4i3ka6uPjURpGxU=; b=xAk4vmyz17JIKLhglvu9jNZiS/
	W0qGldn0IgT+7jEHp9pWf55fCqMC2DOsq3whVx+mHnP9LYpOJrA13iZ6mQVeMmGjWuHxcLOs+rPx9
	0gQ9Z71xfD3KX/fJHGtZHCKzA/tj+WwAoWcvgbbfTvX6TtzPBR8IqaGtfIj+ISoMq5GB8U/raPDHc
	zMZ1th/s+peb2a14YbOmVk7fb2C4JWJsydrjVgJuZtwUlJB3PMtjOLvIcOQlkmMes9ENoFlEdPBNx
	fxlHVAaz8w/RflRsk8kY1Og1wjQFZnMsNbs5cTevpVJBjGQkB9jNbMsoIi9jiiVZ/O/8AFjnJXNCw
	BoXJ7/2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAqQN-0000000Ai0T-2nQM;
	Thu, 09 Apr 2026 14:32:03 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAqQG-0000000AhzZ-3uE7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 14:32:02 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso11149465e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 07:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775745115; x=1776349915; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=glQxMUqadEVymCnqDfGq2ZBintLE4i3ka6uPjURpGxU=;
        b=XrP1C6zhm6LNhTqz8fKRjCEfXfOY8YdEtKmqod8qkmML3jwlxd2UiKZnnXWEBTcanT
         qhnlMuTNTPoAF77nvSsE1tTBDLznq7+c9Z4MAdHi+DApyC0+8xWHbGCNSt1yoacKgM+o
         U1R7YLN9NdnQ3JseYQsAKYlCxM7bSahrzq7ntKmMoJXx0ZkXu5QKzeebrkMwCzgGa0ah
         Wtbpm/1PB5ylTebwStuyiKB8lMucEasFWvHk+fzVUAS+6/Iuh46otIKkasrlLuAfBlNa
         WjSevpyOsmQkPg+b/a/KdkgMymLJ6u4wAF1bgS5PAMMCR4PZTslVnKBQr6BqFre7Md++
         Cnsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775745115; x=1776349915;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=glQxMUqadEVymCnqDfGq2ZBintLE4i3ka6uPjURpGxU=;
        b=Rzo051bh/q0JKBn2ygkTRkVAETkyPsxnJdrV4leTvnntw3Ju7Q3mmRUuR0M9WOYypK
         VKt2RfSSDLzbmVQWIViMlfs0C0RxMh+EqKOUmUjl+C275qGG4L7NZwG+YJqS6+1NJDIU
         vL5vSFzuemvnn0a9p+6JOxAghU77tIZXQkG/14sW3h3kX/6aK2+CFCsy27qWlRsR709a
         Y9LawKPK2VMmX0OYj+P2g7ndvkqed4A8wGIvN8TmMSdxweQoOqW8zg4L9IPc2r8vFT5c
         ymE93O2fIBbCdxkKean7NNd97jb5A4S3Wt7knv5u97JZGEnNuqQD/1tqmN7sWSAtBjRU
         oAPA==
X-Forwarded-Encrypted: i=1; AJvYcCXgiQMtvs4WSNX2ayfc4gZEU8fZCa2xPwzmzR5bQrEPdMfnhQOSyto/U+DcKaGqbkhNjB9fbsLueNUQ014d73/h@lists.infradead.org
X-Gm-Message-State: AOJu0YxkZYQMY5uXU8mKS6yyNPRTyV7XciFClpA8NjPNoKGKuf+o30Pf
	pKq9HChPtsfNnIET+KHLOlCtGG/9C0eh2hE/7oQdsGV0/CQRccwOuFvz+Y9z7WtONXA=
X-Gm-Gg: AeBDies52jQsx55NxALRoskUJ8uq32qsV49G0IvRurMHLvZ9B9RGkbX5B+k3fVxdwqD
	gaUClRfTtpLhDrhgK0XyAONwuOTjvH+ioMOWPXvuLN4YeStxiU+f98WHjCFbS9kTW7u1fsGZzDP
	LOy1gb5XbeCBMdI25MYfH5nXOLIjC3Phk+CRTjnEcip9K7vnYkSCdKeKGJUSPprO7kzA4squDBN
	a9GkDuBoELJUW998gRB2RSH5rjE4AgLISaN1Qa+SzOW3vjNXolYG68KFel9zEUE7gaN2W4slxUJ
	2PjqMwhI6t8HOUopIAQ1M0TXSb1cOJ3gOlJDHj2O7m4Uc//y1uCRXv6zNaObaH94cQxEFIGe24c
	PHDTp6zUTFCNFvP4zJ1VCwXRyiNKt+uz4EAnkdEZrWzhZmQ1pfIN4/Bwv/OIg1jbqLxxz2LzUCF
	49sSFkMXLytHKs9aku74MAdB7CPmgx
X-Received: by 2002:a05:600c:4512:b0:488:9324:3ab8 with SMTP id 5b1f17b1804b1-4889977604emr353746005e9.18.1775745115037;
        Thu, 09 Apr 2026 07:31:55 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d525c931sm1662245e9.0.2026.04.09.07.31.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 07:31:54 -0700 (PDT)
Message-ID: <7454ccf2-7f94-4891-b12c-47e8ac54cfca@linaro.org>
Date: Thu, 9 Apr 2026 15:31:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 16/20] coresight: Add PM callbacks for sink device
From: James Clark <james.clark@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>,
 Keita Morisaki <keyz@google.com>, Yuanfang Zhang
 <quic_yuanfang@quicinc.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Mike Leach <mike.leach@arm.com>
References: <20260405-arm_coresight_path_power_management_improvement-v10-0-13e94754a8be@arm.com>
 <20260405-arm_coresight_path_power_management_improvement-v10-16-13e94754a8be@arm.com>
 <e7c6f497-f8f0-409b-b80a-a064b222c08d@linaro.org>
 <f20b5a00-1d68-48d6-90c8-97dca2e279a4@arm.com>
 <ffe95710-cd52-484e-821e-a3d92ba17c33@linaro.org>
Content-Language: en-US
In-Reply-To: <ffe95710-cd52-484e-821e-a3d92ba17c33@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_073200_389013_C8E671A4 
X-CRM114-Status: GOOD (  30.36  )
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



On 09/04/2026 3:30 pm, James Clark wrote:
> 
> 
> On 09/04/2026 2:14 pm, Suzuki K Poulose wrote:
>> On 09/04/2026 11:52, James Clark wrote:
>>>
>>>
>>> On 05/04/2026 4:02 pm, Leo Yan wrote:
>>>> Unlike system level sinks, per-CPU sinks may lose power during CPU idle
>>>> states.  Currently, this applies specifically to TRBE.  This commit
>>>> invokes save and restore callbacks for the sink in the CPU PM notifier.
>>>>
>>>> If the sink provides PM callbacks but the source does not, this is
>>>> unsafe because the sink cannot be disabled safely unless the source
>>>> can also be controlled, so veto low power entry to avoid lockups.
>>>>
>>>> Tested-by: James Clark <james.clark@linaro.org>
>>>> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
>>>> Reviewed-by: James Clark <james.clark@linaro.org>
>>>> Signed-off-by: Leo Yan <leo.yan@arm.com>
>>>> ---
>>>>   drivers/hwtracing/coresight/coresight-core.c | 46 ++++++++++++++++ 
>>>> + + ++++++++--
>>>>   1 file changed, 43 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/ 
>>>> hwtracing/coresight/coresight-core.c
>>>> index 
>>>> c1e8debc76aba7eb5ecf7efe2a3b9b8b3e11b10c..a918bf6398a932de30fe9b4947020cc4c1cfb2f7 100644
>>>> --- a/drivers/hwtracing/coresight/coresight-core.c
>>>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>>>> @@ -1736,14 +1736,15 @@ static void coresight_release_device_list(void)
>>>>   /* Return: 1 if PM is required, 0 if skip, <0 on error */
>>>>   static int coresight_pm_check(struct coresight_path *path)
>>>>   {
>>>> -    struct coresight_device *source;
>>>> -    bool source_has_cb;
>>>> +    struct coresight_device *source, *sink;
>>>> +    bool source_has_cb, sink_has_cb;
>>>>       if (!path)
>>>>           return 0;
>>>>       source = coresight_get_source(path);
>>>> -    if (!source)
>>>> +    sink = coresight_get_sink(path);
>>>> +    if (!source || !sink)
>>>>           return 0;
>>>>       /* Don't save and restore if the source is inactive */
>>>> @@ -1759,16 +1760,36 @@ static int coresight_pm_check(struct 
>>>> coresight_path *path)
>>>>       if (source_has_cb)
>>>>           return 1;
>>>> +    sink_has_cb = coresight_ops(sink)->pm_save_disable &&
>>>> +              coresight_ops(sink)->pm_restore_enable;
>>>> +    /*
>>>> +     * It is not permitted that the source has no callbacks while 
>>>> the sink
>>>> +     * does, as the sink cannot be disabled without disabling the 
>>>> source,
>>>> +     * which may lead to lockups. Alternatively, the ETM driver should
>>>> +     * enable self-hosted PM mode at probe (see etm4_probe()).
>>>> +     */
>>>> +    if (sink_has_cb) {
>>>> +        pr_warn_once("coresight PM failed: source has no PM 
>>>> callbacks; "
>>>> +                 "cannot safely control sink\n");
>>>
>>> This prints out on my Orion board on a fresh boot because of how 
>>> pm_save_enable is setup there. Do we really need the configuration of 
>>> pm_save_enable for ETE/TRBE if we know that it always needs saving?
>>>
>>> It also stops warning if I rmmod and modprobe the module after 
>>> booting. Seems like pm_save_enable is different depending on how the 
>>> module is loaded which doesn't seem right.
>>
>> Thats because the warning is pr_warn_*once*()
>>
>> Suzuki
>>
>>
> 
> I don't think so, I tested it with a printf instead of a warn once and 
> also tested modprobeing straight after a reboot.
> 

I also printed the pointers to the callbacks and they really do change.

>>>
>>>> +        return -EINVAL;
>>>> +    }
>>>> +
>>>>       return 0;
>>>>   }
>>>>   static int coresight_pm_device_save(struct coresight_device *csdev)
>>>>   {
>>>> +    if (!csdev || !coresight_ops(csdev)->pm_save_disable)
>>>> +        return 0;
>>>> +
>>>>       return coresight_ops(csdev)->pm_save_disable(csdev);
>>>>   }
>>>>   static void coresight_pm_device_restore(struct coresight_device 
>>>> *csdev)
>>>>   {
>>>> +    if (!csdev || !coresight_ops(csdev)->pm_restore_enable)
>>>> +        return;
>>>> +
>>>>       coresight_ops(csdev)->pm_restore_enable(csdev);
>>>>   }
>>>> @@ -1787,15 +1808,32 @@ static int coresight_pm_save(struct 
>>>> coresight_path *path)
>>>>       to = list_prev_entry(coresight_path_last_node(path), link);
>>>>       coresight_disable_path_from_to(path, from, to);
>>>> +    ret = coresight_pm_device_save(coresight_get_sink(path));
>>>> +    if (ret)
>>>> +        goto sink_failed;
>>>> +
>>>
>>> The comment directly above this says "Up to the node before sink to 
>>> avoid latency". But then this line goes and saves the sink anyway. So 
>>> I'm not sure what's meant by the comment?
>>>
>>>>       return 0;
>>>> +
>>>> +sink_failed:
>>>> +    if (!coresight_enable_path_from_to(path, 
>>>> coresight_get_mode(source),
>>>> +                       from, to))
>>>> +        coresight_pm_device_restore(source);
>>>> +
>>>> +    pr_err("Failed in coresight PM save on CPU%d: %d\n",
>>>> +           smp_processor_id(), ret);
>>>> +    this_cpu_write(percpu_pm_failed, true);
>>>
>>> Why does only a failing sink set percpu_pm_failed when failing to 
>>> save the source exits early. Sashiko has a similar comment that this 
>>> could result in restoring uninitialised source save data later, but a 
>>> comment in this function about why the flow is like this would be 
>>> helpful.
>>>
>>> We have coresight_disable_path_from_to() which always succeeds and 
>>> doesn't return an error. TRBE is the only sink with a pm_save_disable()
>>> callback, but it always succeeds anyway.
>>>
>>> Would it not be much simpler to require that sink save/restore 
>>> callbacks always succeed and don't return anything? Seems like this 
>>> percpu_pm_failed stuff is extra complexity for a scenario that 
>>> doesn't exist? The only thing that can fail is saving the source but 
>>> it doesn't goto sink_failed when that happens.
>>>
>>> Ideally etm4_cpu_save() wouldn't have a return value either. It would 
>>> be good if we could find away to skip or ignore the timeouts in there 
>>> somehow because that's the only reason it can fail.
>>>
>>>> +    return ret;
>>>>   }
>>>>   static void coresight_pm_restore(struct coresight_path *path)
>>>>   {
>>>>       struct coresight_device *source = coresight_get_source(path);
>>>> +    struct coresight_device *sink = coresight_get_sink(path);
>>>>       struct coresight_node *from, *to;
>>>>       int ret;
>>>> +    coresight_pm_device_restore(sink);
>>>> +
>>>>       from = coresight_path_first_node(path);
>>>>       /* Up to the node before sink to avoid latency */
>>>>       to = list_prev_entry(coresight_path_last_node(path), link);
>>>> @@ -1808,6 +1846,8 @@ static void coresight_pm_restore(struct 
>>>> coresight_path *path)
>>>>       return;
>>>>   path_failed:
>>>> +    coresight_pm_device_save(sink);
>>>> +
>>>>       pr_err("Failed in coresight PM restore on CPU%d: %d\n",
>>>>              smp_processor_id(), ret);
>>>>
>>>
>>
> 


