Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1085EF31E21
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 14:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NiWD2TfKS+KrlOtiE0LvlvJQfh6VQe1EFXjlolc+ryk=; b=JYi0eYDEws0N1fqEzca9QfAOub
	gJY0NvuNE8b1ygvk/Aw4FZhDMD2SVV2hG/ts3hB+IboVzq+yoc5yoI9eMu+9RrTE7GSzcWgwebcWE
	WhM9j7vyibgfTIfJM7lxUrCKlnNEYVXBxhTf/yW4c8sjSbxKSmvxuQM0SqPW2zaGTyjYjC6O9zY9w
	mcK/K6r6gT9idM19OM+v4sNMe1D/vxNlAkdKLD7GuK/8pgGjQ/WgS2jUC/DJwU15u0BttNfwiBDsd
	3IX3POER90PDxGFVWwUbaXiT6xn8yRAR2IAmemzjExJCMq97L06ixF+n0RQc7DWsZGQnh4w900Mpl
	u5scstbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAqPR-0000000Ahni-1fvR;
	Thu, 09 Apr 2026 14:31:05 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAqPN-0000000Ahn8-3sE7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 14:31:03 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-483487335c2so10480915e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 07:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775745060; x=1776349860; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NiWD2TfKS+KrlOtiE0LvlvJQfh6VQe1EFXjlolc+ryk=;
        b=YClmO3jiSTnSx4nRSRY9H/7or4SzC93JL571dCKgoIdbcceghYQbByFlaYkOBAnLkr
         qGvkA1p+heBJ+elPjyW5AeHMlZPNDa2hKgZRioFVM2hEgdRIojxPkey58XqVPvie5Q2X
         bPgFXrAbRPkELyB3qcEPUTGTgSgHXyo2eClUjCOFEUltso7d6HM1SbGu0GTO49XiV9nY
         onIZzCx76JgqPgYhGvoPKI2Rui84GiSbFM13UXd3ECseNI2eH4Wk2vuhGIKxcTFkt1pU
         kI0FZifbJHnxh0XURyZlXf70qgYv8ANncjk2lceyZ6aOd9/5IRqwT4YKkoEUtjpliNUw
         kW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775745060; x=1776349860;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NiWD2TfKS+KrlOtiE0LvlvJQfh6VQe1EFXjlolc+ryk=;
        b=fB79BdDBJFQWYaNKhDf8ueFlKMc+E8y9j750Uujj/oCSOenuB8T6ou9LEN4V/XpS/Q
         TgrhU0XR0HlT9nGopKJEImj9zkjxgZIKHYqtTSYbAc9oWfv/u+HrqcGKjLC44CBPFlhx
         5jSJ2twELJ5OACJ42QS2y0MuUHC1W2vLPXKwu8rCKnhmyP4aC1jP/h1pnYtF7oPGWTsW
         pVHTRMAFO4iCu2oinYsm0wwvdlYKMm1wBBmY5YHfruaGCgJYKXAhJhK8ReUQGqXZv8eA
         cNMsk+qKDWHV3PBWTqi6ElxDjHcGin6ZR9mqR9CU4R9zz0nKQHqVmzVhvWhRBji+qH5h
         ZZiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnogQNQoIjiy+khFisKQAUsAR3rwdXakcwzn47QaY9KmvSrqhKZAoxglAQG07eW7YCcGPZIcar5A9W4uPpKt5h@lists.infradead.org
X-Gm-Message-State: AOJu0YxPbwZRrpQmqvuWFwA1XRkNBgEwSqm8zgxsLil08H260lxTsV8E
	rAFNltURjU7lJEcZRPuwtr1Spxj7rbncEEAtQZuzoZbMDZbWDSirN6kn9cMF4OEUQgU=
X-Gm-Gg: AeBDiet0JX+dLTe6G1xymQ2mtHhPA3U5MNe43JFXqN4iAGGRkTiu0JNnr0yWs/3qz2I
	alIpo12GQ7Pu1/3s2VYqxSl17PMbyKqz3JB+sqfm9ifu8skEyOq31qGZ3QynOMNUxw97egGmw9h
	YpdqOnnl2qyrgJX7yHrcDYXW6Q11YxcQGSErajYwjdNhvJqyJm286WAQUHVHZPvsxQFrvfh0wmM
	M4klOOGU0spDp/BG7roc0F1xdtgPOj/AeY/l87Hv2OtA5gAbFBBCTq3t+mhY6ojyKAupyQN8exO
	MJWoza66ZfCORzPCH5rlC+u7qsTdckJSrtxsihj6IVBlkO8y03E8HdIb0iiAuaAGX3GfVWn1erF
	013cec+cWk8QyStus2XXCuEs1PYVyfXYhxDLsj31NcBOX5kviTG3TM8QMDbzRtTKkETRzc44hVZ
	Xl8/i+CiyMdVomguywq7YGoYaT8Vrz
X-Received: by 2002:a05:600c:34ce:b0:488:b098:b653 with SMTP id 5b1f17b1804b1-488b098b75amr229886185e9.13.1775745059614;
        Thu, 09 Apr 2026 07:30:59 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488cd17984fsm35607065e9.7.2026.04.09.07.30.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 07:30:59 -0700 (PDT)
Message-ID: <ffe95710-cd52-484e-821e-a3d92ba17c33@linaro.org>
Date: Thu, 9 Apr 2026 15:30:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 16/20] coresight: Add PM callbacks for sink device
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
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <f20b5a00-1d68-48d6-90c8-97dca2e279a4@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_073102_019939_91F31BFB 
X-CRM114-Status: GOOD (  32.75  )
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



On 09/04/2026 2:14 pm, Suzuki K Poulose wrote:
> On 09/04/2026 11:52, James Clark wrote:
>>
>>
>> On 05/04/2026 4:02 pm, Leo Yan wrote:
>>> Unlike system level sinks, per-CPU sinks may lose power during CPU idle
>>> states.  Currently, this applies specifically to TRBE.  This commit
>>> invokes save and restore callbacks for the sink in the CPU PM notifier.
>>>
>>> If the sink provides PM callbacks but the source does not, this is
>>> unsafe because the sink cannot be disabled safely unless the source
>>> can also be controlled, so veto low power entry to avoid lockups.
>>>
>>> Tested-by: James Clark <james.clark@linaro.org>
>>> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
>>> Reviewed-by: James Clark <james.clark@linaro.org>
>>> Signed-off-by: Leo Yan <leo.yan@arm.com>
>>> ---
>>>   drivers/hwtracing/coresight/coresight-core.c | 46 +++++++++++++++++ 
>>> + ++++++++--
>>>   1 file changed, 43 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/ 
>>> hwtracing/coresight/coresight-core.c
>>> index 
>>> c1e8debc76aba7eb5ecf7efe2a3b9b8b3e11b10c..a918bf6398a932de30fe9b4947020cc4c1cfb2f7 100644
>>> --- a/drivers/hwtracing/coresight/coresight-core.c
>>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>>> @@ -1736,14 +1736,15 @@ static void coresight_release_device_list(void)
>>>   /* Return: 1 if PM is required, 0 if skip, <0 on error */
>>>   static int coresight_pm_check(struct coresight_path *path)
>>>   {
>>> -    struct coresight_device *source;
>>> -    bool source_has_cb;
>>> +    struct coresight_device *source, *sink;
>>> +    bool source_has_cb, sink_has_cb;
>>>       if (!path)
>>>           return 0;
>>>       source = coresight_get_source(path);
>>> -    if (!source)
>>> +    sink = coresight_get_sink(path);
>>> +    if (!source || !sink)
>>>           return 0;
>>>       /* Don't save and restore if the source is inactive */
>>> @@ -1759,16 +1760,36 @@ static int coresight_pm_check(struct 
>>> coresight_path *path)
>>>       if (source_has_cb)
>>>           return 1;
>>> +    sink_has_cb = coresight_ops(sink)->pm_save_disable &&
>>> +              coresight_ops(sink)->pm_restore_enable;
>>> +    /*
>>> +     * It is not permitted that the source has no callbacks while 
>>> the sink
>>> +     * does, as the sink cannot be disabled without disabling the 
>>> source,
>>> +     * which may lead to lockups. Alternatively, the ETM driver should
>>> +     * enable self-hosted PM mode at probe (see etm4_probe()).
>>> +     */
>>> +    if (sink_has_cb) {
>>> +        pr_warn_once("coresight PM failed: source has no PM 
>>> callbacks; "
>>> +                 "cannot safely control sink\n");
>>
>> This prints out on my Orion board on a fresh boot because of how 
>> pm_save_enable is setup there. Do we really need the configuration of 
>> pm_save_enable for ETE/TRBE if we know that it always needs saving?
>>
>> It also stops warning if I rmmod and modprobe the module after 
>> booting. Seems like pm_save_enable is different depending on how the 
>> module is loaded which doesn't seem right.
> 
> Thats because the warning is pr_warn_*once*()
> 
> Suzuki
> 
> 

I don't think so, I tested it with a printf instead of a warn once and 
also tested modprobeing straight after a reboot.

>>
>>> +        return -EINVAL;
>>> +    }
>>> +
>>>       return 0;
>>>   }
>>>   static int coresight_pm_device_save(struct coresight_device *csdev)
>>>   {
>>> +    if (!csdev || !coresight_ops(csdev)->pm_save_disable)
>>> +        return 0;
>>> +
>>>       return coresight_ops(csdev)->pm_save_disable(csdev);
>>>   }
>>>   static void coresight_pm_device_restore(struct coresight_device 
>>> *csdev)
>>>   {
>>> +    if (!csdev || !coresight_ops(csdev)->pm_restore_enable)
>>> +        return;
>>> +
>>>       coresight_ops(csdev)->pm_restore_enable(csdev);
>>>   }
>>> @@ -1787,15 +1808,32 @@ static int coresight_pm_save(struct 
>>> coresight_path *path)
>>>       to = list_prev_entry(coresight_path_last_node(path), link);
>>>       coresight_disable_path_from_to(path, from, to);
>>> +    ret = coresight_pm_device_save(coresight_get_sink(path));
>>> +    if (ret)
>>> +        goto sink_failed;
>>> +
>>
>> The comment directly above this says "Up to the node before sink to 
>> avoid latency". But then this line goes and saves the sink anyway. So 
>> I'm not sure what's meant by the comment?
>>
>>>       return 0;
>>> +
>>> +sink_failed:
>>> +    if (!coresight_enable_path_from_to(path, 
>>> coresight_get_mode(source),
>>> +                       from, to))
>>> +        coresight_pm_device_restore(source);
>>> +
>>> +    pr_err("Failed in coresight PM save on CPU%d: %d\n",
>>> +           smp_processor_id(), ret);
>>> +    this_cpu_write(percpu_pm_failed, true);
>>
>> Why does only a failing sink set percpu_pm_failed when failing to save 
>> the source exits early. Sashiko has a similar comment that this could 
>> result in restoring uninitialised source save data later, but a 
>> comment in this function about why the flow is like this would be 
>> helpful.
>>
>> We have coresight_disable_path_from_to() which always succeeds and 
>> doesn't return an error. TRBE is the only sink with a pm_save_disable()
>> callback, but it always succeeds anyway.
>>
>> Would it not be much simpler to require that sink save/restore 
>> callbacks always succeed and don't return anything? Seems like this 
>> percpu_pm_failed stuff is extra complexity for a scenario that doesn't 
>> exist? The only thing that can fail is saving the source but it 
>> doesn't goto sink_failed when that happens.
>>
>> Ideally etm4_cpu_save() wouldn't have a return value either. It would 
>> be good if we could find away to skip or ignore the timeouts in there 
>> somehow because that's the only reason it can fail.
>>
>>> +    return ret;
>>>   }
>>>   static void coresight_pm_restore(struct coresight_path *path)
>>>   {
>>>       struct coresight_device *source = coresight_get_source(path);
>>> +    struct coresight_device *sink = coresight_get_sink(path);
>>>       struct coresight_node *from, *to;
>>>       int ret;
>>> +    coresight_pm_device_restore(sink);
>>> +
>>>       from = coresight_path_first_node(path);
>>>       /* Up to the node before sink to avoid latency */
>>>       to = list_prev_entry(coresight_path_last_node(path), link);
>>> @@ -1808,6 +1846,8 @@ static void coresight_pm_restore(struct 
>>> coresight_path *path)
>>>       return;
>>>   path_failed:
>>> +    coresight_pm_device_save(sink);
>>> +
>>>       pr_err("Failed in coresight PM restore on CPU%d: %d\n",
>>>              smp_processor_id(), ret);
>>>
>>
> 


