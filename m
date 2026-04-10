Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D6AE99057
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 08:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2smJlwhqiNmS54t3AokiGG1a9tNHjlOSG7wCwwj92t4=; b=X69EACIEJDLtQDo8UchKbg/8B4
	+ZBqACozQUicXPRLb/ssxlmwYceD4XktjBfvK82gHJcg5Wkevx1WHirsRbe3yBUzaJc6cRBrwUdPA
	x1Uj48p37weoGkWhUJM27FVSTdahTBVZhmGL7rM4+hEYYeY1m8e8e3QaoqyPmzsNFQpMKjuEpR1t7
	ICeSaZcL/IoWu8nO67pMMdQVgqIs+pt0yGT6ov5baPBIDdICkmVyeN++DHNwzYHUG8en3uwG0Aymc
	Uc1iIG+TiGJh6bKnBP+SEn6iRLgrQBydWMolanTpyjOv89DempdRBW74UUVIXipuHRYw5AfAbbYQ7
	rGJYc+yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB7eb-0000000BrnZ-0Hf5;
	Fri, 10 Apr 2026 08:55:53 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB7eZ-0000000BrmT-1UqZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 08:55:52 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-43d0deb7ad5so1323942f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 01:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775811349; x=1776416149; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2smJlwhqiNmS54t3AokiGG1a9tNHjlOSG7wCwwj92t4=;
        b=LMqnq4l1PRExAhGucz7N8Q86366vVielqN7jlE8QhtPJUwHQM+hXWxNjvyR5yUgliC
         YIU+UTYvEXi2aQ9l74lKky/mCGVIbXBv7uOPUJIQo57Pn/rhZhRCieWhG6s13pqm+dAR
         VdCCa1eZxCTNP6bRtOaQxIXxTviDeZ2RMfANluyEQDTa/sOE+QxYWdIZ/2HvDNXC8kLL
         fWSRz6J17a0SpuLh1tXS4jn83SGUiAXhvcFtOaIb4MXovvIiUoUdW8DATqhNdKA2T1/N
         7s6spVwzDjiy5GZJIDQeNkoyXgvgK+MywGgeH6FWQLzcLKc0l+iAjWSlAhIxs/WX3s5O
         r0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775811349; x=1776416149;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2smJlwhqiNmS54t3AokiGG1a9tNHjlOSG7wCwwj92t4=;
        b=hcHpdNwzyQ9KlB2/FnRWNtJ6rhqUl05cLGttMrVkrhNZfvMOTWyMpYA+VJooB3sp2h
         wwwqrHCHAnBRMix+jEx8l8JoQc7OQhNt8fcG0xgNHOj6cAtEJLHtqLviEB3oDNFy+pmw
         0h+UXQmuRbUBmg7BY84DpIisUDIgMAttbV1xRdGib8Fq9TQjdL1cmIp99s4cm4EPuOhC
         9z7/UIy94P+MeYFzlXUMZNY+caNYB8uNuZpxVDBuhlUbzNfOD24unfeS6rw0l8QVSFNx
         iV84Z4l7m9WOwp4xjsdow68125z+AXRKWUufjAJDJeSpxZGTarsHtM3dAtZtOx+32lzR
         OSeg==
X-Forwarded-Encrypted: i=1; AJvYcCWdTJn24bC4sdbOvzVFGtb0ala/RQiGkulddREeo7Hf16W0cV6t0i2wM0lU8w7iceZd8wWEk1ASvQ1lO/kYLHTH@lists.infradead.org
X-Gm-Message-State: AOJu0YwqZV1vQmDF4RGu29F4FMl+479GagpYOMI+Ix8iTH5Ynj6Sjv8s
	atkP9ofqczKTlYkH8m8jhNvC4VAZHGHR3jFKSE/t2lG8ZvrqdoNbh63TC71oARqKmdo=
X-Gm-Gg: AeBDietcL0ZXAySQAzgZ+WOPaFVixr4L86wQ65oiYuwvpBWPSQhTsnrYb5NEYHJYAGJ
	XJRS1GnoeQfLaa92nEGvxc6u89Qw+thq//XUKTFFpsFfwhSGK8HKGM0BaT7JB9yPEHPkivOAAdo
	Tsg8ZQjdb2NLUArTOCuLGft0+j/XT4OcGuviMfS+D+5UyyIllSwyStmVygcnCDJgYlV+tPZ8KxJ
	yuzAylW6zhzSddwEYJ+cJQB1fMbIjg1Ak0zDAawltWmv2QhYB7vPf6fav1ZHBjzTvayXhE3UJ0z
	e/WBLCPtjOt6uPkj1BdOgIY72H8BmpI1DCI4nKdf6mLYu9BPDuAs7BC+8+kumdLIobQT+QMc8r6
	EN/rqKO2GVfLkA2zW3PJNVf1UVJNX9J5fjbggnfkuGbPDg7Sf1x4EOoIkwhNxD20YnMsF+fw6kD
	o6inUDMn9XT9idMKl+hZs7tNuFwABE
X-Received: by 2002:a05:6000:24c2:b0:43c:f90b:5668 with SMTP id ffacd0b85a97d-43d642a7a6dmr3328102f8f.23.1775811349355;
        Fri, 10 Apr 2026 01:55:49 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e46a85sm5844389f8f.24.2026.04.10.01.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 01:55:48 -0700 (PDT)
Message-ID: <5904a513-349d-4b66-8550-0435cee074c5@linaro.org>
Date: Fri, 10 Apr 2026 09:55:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 16/20] coresight: Add PM callbacks for sink device
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>,
 Keita Morisaki <keyz@google.com>, Yuanfang Zhang
 <quic_yuanfang@quicinc.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>
References: <20260405-arm_coresight_path_power_management_improvement-v10-0-13e94754a8be@arm.com>
 <20260405-arm_coresight_path_power_management_improvement-v10-16-13e94754a8be@arm.com>
 <e7c6f497-f8f0-409b-b80a-a064b222c08d@linaro.org>
 <20260409154437.GU356832@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260409154437.GU356832@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_015551_433118_EDD8536B 
X-CRM114-Status: GOOD (  39.05  )
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



On 09/04/2026 4:44 pm, Leo Yan wrote:
> On Thu, Apr 09, 2026 at 11:52:00AM +0100, James Clark wrote:
> 
> [...]
> 
>>> @@ -1787,15 +1808,32 @@ static int coresight_pm_save(struct coresight_path *path)
>>>    	to = list_prev_entry(coresight_path_last_node(path), link);
>>>    	coresight_disable_path_from_to(path, from, to);
>>> +	ret = coresight_pm_device_save(coresight_get_sink(path));
>>> +	if (ret)
>>> +		goto sink_failed;
>>> +
>>
>> The comment directly above this says "Up to the node before sink to avoid
>> latency". But then this line goes and saves the sink anyway. So I'm not sure
>> what's meant by the comment?
> 
> I will refine the comment to: "Control the path up to the node before
> the _system_ sink to avoid latency caused by memory copying; afterwards,
> saves context if the sink provides a callback".
> 
> 

But list_prev_entry(coresight_path_last_node(path)) doesn't do any thing 
special for system sinks, it always returns from source up to the sink 
regardless of the type. Shouldn't it be more like:

    /* Disable up to the node before sink */
    to = list_prev_entry(coresight_path_last_node(path), link);
    coresight_disable_path_from_to(path, from, to);

    /*
     * Save sink. Most sinks don't implement a save callback to avoid
     * latency caused by memory copying.
     */
    ret = coresight_pm_device_save(coresight_get_sink(path));


>>>    	return 0;
>>> +
>>> +sink_failed:
>>> +	if (!coresight_enable_path_from_to(path, coresight_get_mode(source),
>>> +					   from, to))
>>> +		coresight_pm_device_restore(source);
>>> +
>>> +	pr_err("Failed in coresight PM save on CPU%d: %d\n",
>>> +	       smp_processor_id(), ret);
>>> +	this_cpu_write(percpu_pm_failed, true);
>>
>> Why does only a failing sink set percpu_pm_failed when failing to save the
>> source exits early.
> 
> My purpose is to use "percpu_pm_failed == true" to prevent further
> issues if we already know the link has failed.  To be clear, this is not
> a recovery mechanism; it simply means "if link enabling or disabling
> fails in CPU PM, do not continue to avoid potential hardware lockups.”
> 
> The source save failure is a bit special, it fails at the beginning of
> the CoreSight CPU PM flow, and the returned error prevents the CPU idle
> flow from proceeding.  As a result, there is nothing further to do.
> 
>> Sashiko has a similar comment that this could result in
>> restoring uninitialised source save data later, but a comment in this
>> function about why the flow is like this would be helpful.
> 
> The comment of "Restoring uninitialised source save data later" does not
> make sense.
> 
> When the save fails, the notifier only rolls back the callbacks that ran
> before the failing callback by invoking CPU_PM_ENTER_FAILED.  And there
> is no CPU_PM_EXIT, as the idle state is never entered.
> 

Make sense.

>> We have coresight_disable_path_from_to() which always succeeds and doesn't
>> return an error. TRBE is the only sink with a pm_save_disable()
>> callback, but it always succeeds anyway.
>>
>> Would it not be much simpler to require that sink save/restore callbacks
>> always succeed and don't return anything? Seems like this percpu_pm_failed
>> stuff is extra complexity for a scenario that doesn't exist? The only thing
>> that can fail is saving the source but it doesn't goto sink_failed when that
>> happens.
> 
> As you suggested, I can simplify the code with assuming sink ops
> always success, but we might expect complaints from Sashiko.
> 

If we're keeping the exit value for sources and we're sharing the same 
callback signature with sinks then it makes sense to keep the error 
handling then. I was thinking it would be nice to remove it if we got 
rid of both.

>> Ideally etm4_cpu_save() wouldn't have a return value either. It would be
>> good if we could find away to skip or ignore the timeouts in there somehow
>> because that's the only reason it can fail.
> 
> Seems to me, ETMv4 has a timeout log and returns error is not bad, as
> it can be helpful to locate issue in a cheap way (sometimes, hang
> issue caused by lockup might be a time-consumed debugging).
> 
> Thanks,
> Leo


