Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC25EA3C59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 12:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X6+X8KtCjVEsQE5PZNXPbRjFX/a475Cwf6EH1k8MerA=; b=2rESFPQzPzAWLHb9eoZFTj8FMO
	cxPDjZsSflEI6M8yBg1M2ZycDrVkkWF7VWPMfS3GrG10YsNxkARLAll0vumAMF2e8h2aw/wfvqRoB
	yL3A5E9tuFy2Kwb/nNOIRKywy0H5Me4aGQkwANMiA1RjjfHiyb57L2TQgxSFxtXPyqFkUA+5O9f9p
	H6neWY+BHtLINzQbyZ3lY8cEBJEhj8T+C2K0JEf9EEB2svewuRlxye49FeJogroqzwDdUXuYosVe9
	xp3SYtErbBRnMZtFvPgy9Qrl6JR0m3HzJC0CYKsG5p+966Dse6R53pzbiG1Rw6hOfkePX0zhDq9gi
	2ym+z5iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAoty-0000000APnq-3mIw;
	Thu, 09 Apr 2026 12:54:32 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAotx-0000000APmy-0FYo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 12:54:30 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4889e045bc6so9025755e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 05:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775739267; x=1776344067; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X6+X8KtCjVEsQE5PZNXPbRjFX/a475Cwf6EH1k8MerA=;
        b=bG0NfBVjMshVoF93P0jiXhcGahoM//JCEDbrRQIpPt3XGS3H329Zpff59n82j3n56O
         ycXUtpzG96NfOevHZtsGEULKOfVx+IPSmh0s7LYAqw2i6sh+T80ehR7zus++2eocClxa
         mUJQJNROUZqXaDrSxErC0OKDd3Nra+P/gBwbRs+jYHGgqlA+/+yI6egB+aEL/4Jb32aC
         kcomJfRcXgJ44NrmSvrWyx8h8Wtk6NEgJG34ccsKDPprSu8ZocXaY1tbRXv9YVmPStE1
         bvLaB6NpFIeSMqERjh0RTa0im5+aM1e02fB00EA088/gxtJAGznOKlWfR5HNlEbUbgW/
         oBRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775739267; x=1776344067;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X6+X8KtCjVEsQE5PZNXPbRjFX/a475Cwf6EH1k8MerA=;
        b=cm+usPayFVXmcxnZj6nXzBRvwSb+08Xzl+PRj8QKiUjzdS1gc2hpa/BEkTXhCcGBry
         B8kYUdbJ7qMyT+PxO/nmDInrhNwcx79gPnBxzozxXURwRfLeckouBiWpiOF3pg11qaYQ
         7MrEAKJkzxSzkRDFitbr3FJry4WGCYPD28VWBN/JeOmt4fjrgx4yNn3UTMpEl9RTwiBj
         u9ZEhTy6y0fBpDDJVTaU9Z5pUCUeml6ixdM9lZWR634LRqZFRvdvf5wv6CPDvVaK5r7P
         xh/jU22haBXW/16ODAz/aDgREtq/2n63yCL45pXcQ6qk12SDbQq3IMcsVvGrAtJ8QKUK
         tsnw==
X-Forwarded-Encrypted: i=1; AJvYcCVj4z0GyM45RrLNeWGF69/7fYhgJaOF+jkKUYl0pqldguwhRHh+EZwupRUoVMr7c9KzONQq3cqqf+G45RmpCGga@lists.infradead.org
X-Gm-Message-State: AOJu0YwiIloODJ9gg4hEAYEn+VnJeH8KiC3EJRAEzKLgK35OYkUUcOSt
	O2lYesSbUUuJjrxMtPIzpxouZHKzPRGg3nGNdrzMZtXTqCqAXjUvwW5acx3oBhbvRWM=
X-Gm-Gg: AeBDieuVPIZ8xjU61Dal+qdnDDcWm1umY7aQbMzPn2ZwEjh2KVi2lPK5/UNUAWSBCb3
	j83TLCIi/EHwpSIxkN9bmrBLeiD1CRRMI0JYYjtlpoiZHvH9e0pfT4UZ3G1qPn3pgfhKcT8DR4/
	Ps9zi2iaTGTLHFTqZbSlrFzzx4NDPAPKUBVDDX00ZQqTg6lVSqlTtskCGN/QYJgKmDhcP3rqNoG
	YOopR7WlIJJcqrYkwjCVO2BCHdxQP0DJjzN9MY6eJz/PMfPLdCwbOcwf1F5b9Ztz4qfknB9q96/
	x/CYb4bklM5QKj7xq7ZbfHU6b53IDDKtrirZ5ZMcQwthcK6hlSpGP4PlDd/A+4s9gj710xtlvQ1
	yC0cLXEeJCtrX4DioVGzIG1qA/FTdaeb2mP8p0wS3ijvhW795oC+2ayrYGgZwcaXs11G7tYWR9J
	NhOSOT9IxTbYevPsA9Lila8v+CWOea
X-Received: by 2002:a05:600c:c10f:b0:488:869c:edaa with SMTP id 5b1f17b1804b1-488ccfa937dmr34946715e9.7.1775739267062;
        Thu, 09 Apr 2026 05:54:27 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ccfbbb7fsm40549525e9.0.2026.04.09.05.54.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 05:54:26 -0700 (PDT)
Message-ID: <52ab7b4c-22e8-4567-beb4-f73295d87b78@linaro.org>
Date: Thu, 9 Apr 2026 13:54:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 16/20] coresight: Add PM callbacks for sink device
From: James Clark <james.clark@linaro.org>
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
Content-Language: en-US
In-Reply-To: <e7c6f497-f8f0-409b-b80a-a064b222c08d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_055429_155617_C8218906 
X-CRM114-Status: GOOD (  39.84  )
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



On 09/04/2026 11:52 am, James Clark wrote:
> 
> 
> On 05/04/2026 4:02 pm, Leo Yan wrote:
>> Unlike system level sinks, per-CPU sinks may lose power during CPU idle
>> states.  Currently, this applies specifically to TRBE.  This commit
>> invokes save and restore callbacks for the sink in the CPU PM notifier.
>>
>> If the sink provides PM callbacks but the source does not, this is
>> unsafe because the sink cannot be disabled safely unless the source
>> can also be controlled, so veto low power entry to avoid lockups.
>>
>> Tested-by: James Clark <james.clark@linaro.org>
>> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
>> Reviewed-by: James Clark <james.clark@linaro.org>
>> Signed-off-by: Leo Yan <leo.yan@arm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-core.c | 46 ++++++++++++++++++ 
>> ++++++++--
>>   1 file changed, 43 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/ 
>> hwtracing/coresight/coresight-core.c
>> index 
>> c1e8debc76aba7eb5ecf7efe2a3b9b8b3e11b10c..a918bf6398a932de30fe9b4947020cc4c1cfb2f7 100644
>> --- a/drivers/hwtracing/coresight/coresight-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>> @@ -1736,14 +1736,15 @@ static void coresight_release_device_list(void)
>>   /* Return: 1 if PM is required, 0 if skip, <0 on error */
>>   static int coresight_pm_check(struct coresight_path *path)
>>   {
>> -    struct coresight_device *source;
>> -    bool source_has_cb;
>> +    struct coresight_device *source, *sink;
>> +    bool source_has_cb, sink_has_cb;
>>       if (!path)
>>           return 0;
>>       source = coresight_get_source(path);
>> -    if (!source)
>> +    sink = coresight_get_sink(path);
>> +    if (!source || !sink)
>>           return 0;
>>       /* Don't save and restore if the source is inactive */
>> @@ -1759,16 +1760,36 @@ static int coresight_pm_check(struct 
>> coresight_path *path)
>>       if (source_has_cb)
>>           return 1;
>> +    sink_has_cb = coresight_ops(sink)->pm_save_disable &&
>> +              coresight_ops(sink)->pm_restore_enable;
>> +    /*
>> +     * It is not permitted that the source has no callbacks while the 
>> sink
>> +     * does, as the sink cannot be disabled without disabling the 
>> source,
>> +     * which may lead to lockups. Alternatively, the ETM driver should
>> +     * enable self-hosted PM mode at probe (see etm4_probe()).
>> +     */
>> +    if (sink_has_cb) {
>> +        pr_warn_once("coresight PM failed: source has no PM callbacks; "
>> +                 "cannot safely control sink\n");
> 
> This prints out on my Orion board on a fresh boot because of how 
> pm_save_enable is setup there. Do we really need the configuration of 
> pm_save_enable for ETE/TRBE if we know that it always needs saving?
> 
> It also stops warning if I rmmod and modprobe the module after booting. 
> Seems like pm_save_enable is different depending on how the module is 
> loaded which doesn't seem right.
> 
>> +        return -EINVAL;
>> +    }
>> +
>>       return 0;
>>   }
>>   static int coresight_pm_device_save(struct coresight_device *csdev)
>>   {
>> +    if (!csdev || !coresight_ops(csdev)->pm_save_disable)
>> +        return 0;
>> +
>>       return coresight_ops(csdev)->pm_save_disable(csdev);
>>   }
>>   static void coresight_pm_device_restore(struct coresight_device *csdev)
>>   {
>> +    if (!csdev || !coresight_ops(csdev)->pm_restore_enable)
>> +        return;
>> +
>>       coresight_ops(csdev)->pm_restore_enable(csdev);
>>   }
>> @@ -1787,15 +1808,32 @@ static int coresight_pm_save(struct 
>> coresight_path *path)
>>       to = list_prev_entry(coresight_path_last_node(path), link);
>>       coresight_disable_path_from_to(path, from, to);
>> +    ret = coresight_pm_device_save(coresight_get_sink(path));
>> +    if (ret)
>> +        goto sink_failed;
>> +
> 
> The comment directly above this says "Up to the node before sink to 
> avoid latency". But then this line goes and saves the sink anyway. So 
> I'm not sure what's meant by the comment?
> 
>>       return 0;
>> +
>> +sink_failed:
>> +    if (!coresight_enable_path_from_to(path, coresight_get_mode(source),
>> +                       from, to))
>> +        coresight_pm_device_restore(source);
>> +
>> +    pr_err("Failed in coresight PM save on CPU%d: %d\n",
>> +           smp_processor_id(), ret);
>> +    this_cpu_write(percpu_pm_failed, true);
> 
> Why does only a failing sink set percpu_pm_failed when failing to save 
> the source exits early. Sashiko has a similar comment that this could 
> result in restoring uninitialised source save data later, but a comment 
> in this function about why the flow is like this would be helpful.
> 
> We have coresight_disable_path_from_to() which always succeeds and 
> doesn't return an error. TRBE is the only sink with a pm_save_disable()
> callback, but it always succeeds anyway.
> 
> Would it not be much simpler to require that sink save/restore callbacks 
> always succeed and don't return anything? Seems like this 
> percpu_pm_failed stuff is extra complexity for a scenario that doesn't 
> exist? The only thing that can fail is saving the source but it doesn't 
> goto sink_failed when that happens.
> 
> Ideally etm4_cpu_save() wouldn't have a return value either. It would be 
> good if we could find away to skip or ignore the timeouts in there 
> somehow because that's the only reason it can fail.
> 

etm4_disable_trace_unit() and etm4_enable_hw() also have timeouts but 
the timeouts only print warnings, they don't cause early exits or return 
error values.

Can we do the same for etm4_cpu_save()? It would be better to read and 
restore potentially 'unstable' register values than to early exit and 
restore known uninitialised values as it is here.

>> +    return ret;
>>   }
>>   static void coresight_pm_restore(struct coresight_path *path)
>>   {
>>       struct coresight_device *source = coresight_get_source(path);
>> +    struct coresight_device *sink = coresight_get_sink(path);
>>       struct coresight_node *from, *to;
>>       int ret;
>> +    coresight_pm_device_restore(sink);
>> +
>>       from = coresight_path_first_node(path);
>>       /* Up to the node before sink to avoid latency */
>>       to = list_prev_entry(coresight_path_last_node(path), link);
>> @@ -1808,6 +1846,8 @@ static void coresight_pm_restore(struct 
>> coresight_path *path)
>>       return;
>>   path_failed:
>> +    coresight_pm_device_save(sink);
>> +
>>       pr_err("Failed in coresight PM restore on CPU%d: %d\n",
>>              smp_processor_id(), ret);
>>
> 


