Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C558C5DF82
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 11:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PTRdsREDtSKZ/ZMnpJEUBQv+gdf+FU1Wtr3RxWfnMP4=; b=KPm3yulko3vT0hhu0DK+ne2pb2
	x1SMCpfP9cCWCa5k9M29gWi205Sr00awHgqR2N2LRnGB6L2yJoyI7X2yDaQFyxp/JrLvv/V//3zC5
	XfliNEC9Qwzn1pyo5HhsL1wN64w2+2uMNvHoPDKxdpwUfgRqWSsECeFB2Bb+XU8Gbe6qo0pd4e6+X
	D89/R2Kf8f8l1UTdPzEbfmhaI+QKxh1hJQnPTuLqVPUtm4wwbo/jYJtr2dhVH5ii6A6gdZ0Lltwta
	T2EtL3EKWnryrNkKT3IdgHgR4Q3yxuLmIIGFf/3uni2U9vw5/mMaO8PBtGXWCiYhNqi/zOK0OQHO6
	wJaixYUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0w9-0000000BSAA-2UFt;
	Thu, 20 Aug 2026 11:27:57 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0w7-0000000BS9g-1yZ9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 11:27:56 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so19761105e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 04:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787225273; x=1787830073; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PTRdsREDtSKZ/ZMnpJEUBQv+gdf+FU1Wtr3RxWfnMP4=;
        b=TYR6r2la0O1G4NhB/z15p2G6bDYgMCEb/rqnCP+zy5P9vnW0bT+sVmGL7UYvwXRoQr
         K0kgvGBr+35eYBX0S62K1/Z7qJlzi0VK8ol/WHBvjBgQEdU8FSlS5THm81y6lGPavTuS
         An+uWAzrE0nrX6cSNkrCgOAPI3O29px7BfLSbzXkaRChOhpODlMfm3j0J6q9k4tOpwoL
         aJC5PU5meaLM2TY+b6f9tqWNQnFdRCvlTi4dEWlDS+H8HS+9pUACy/W6eQs/uCNuVuVU
         Z1LoeQu0CZIjIngYajMMpSvmvWhzBa7P04lqvMeaB/CqwKnd6l19uku/Q67eDUmRJFHS
         UZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787225273; x=1787830073;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PTRdsREDtSKZ/ZMnpJEUBQv+gdf+FU1Wtr3RxWfnMP4=;
        b=DqmSczH01Gi53sTmhPzs3Rj4pvW2IjCBtPepPWzXQxFppxD8KOVNJcBdbK7YvVpICm
         XX6x5uGZFDnTKmKJAy7BUA1qOf9i/C7niif7+vRejeJNUE+SEr3rp2YaMiw7e23OysBs
         DZc3znaIvpgkXzTOpYQkjjdHkDCy29vI2Nz3gPWxOW6EXowASAgLPZr3xXjQVXJyz3qx
         8nXy1Tfz1WlmUaBrYgQjzmFIeGkdQuq4YauKBYmtyx5kAFEW1s805HHgUzvuDJlHO/6A
         iMZwaBe9r/si7nymEI1SFb1WLFvvI3rV8Y4bZirC7sN9QQ2w2uNi5k5Fwi03GG10QnFJ
         zvGg==
X-Forwarded-Encrypted: i=1; AHgh+RoDZs8Z7oY5UDGV1VpNetFQxmqsRRuGNiYxgDUnnRMU348Xl7nKRHhUdT9LFCon88uSwM+/i0v/Z6xKnn/fCVGC@lists.infradead.org
X-Gm-Message-State: AOJu0YxS/JvUJ5JgQsTqlgmt6u6E4eriIMxDs0lHSjiRnu3amvzvNwlo
	Y6Q7UQKmhrqJO9twyYoOOUEAksEOkc8Md2QyjXbepkpLWtGCqip2Vf+20M075zP7kOU=
X-Gm-Gg: AR+sD12RaEavc251VgIRWNshhuJLm2sT+LKigwEkdihYpxvhk9oHowFOzdQOm4ZiaKb
	TuwRuuOTM+eYbS88D2kEbq30rhuvoFnUZOkTfEaTw+9sF7Jx7DY9fuKCWAYzbFDPpVtX3uR8Z7p
	KLQL26Edom9KAiNRsNjPW2xYt9Ys9D52DGSzVVjjNvxMZir/2VW4afGG9/R+Y+7aD04gbZ1J+1p
	VZ7mocrCG1RWOXp7knIB9ZemEBAEiaOuoSjPjNfo3F5OysJhqw4tw9mWx8JGfYZD/0roHscqNc+
	QeWNayLAAGGstjTbLbwJr/CbZGfsCBH0iyTorPhAzlbXY+2fPwr6EQv27HRh/dMZzMffi4uQy1X
	fOUP4amxffFcCJnGmTlDFQpyEPSS8WabZYJhJNTTS2P1gAXaF554EZly1TLRDo39xvJkvOZ7TwA
	1FoRyR6h4U1t/SMFyOjLxWtivOH85vE7wGjZajHp8FJTZ3D523FyCsENTMPACbqs+iYg==
X-Received: by 2002:a05:600c:4e12:b0:499:b000:b828 with SMTP id 5b1f17b1804b1-499b000b8f5mr136887005e9.4.1787225273549;
        Thu, 20 Aug 2026 04:27:53 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b2269ba6sm34124935e9.1.2026.08.20.04.27.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 04:27:53 -0700 (PDT)
Message-ID: <04f3681c-71c6-467c-a859-ab5d39f3c928@linaro.org>
Date: Thu, 20 Aug 2026 12:27:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] coresight: tmc-etr: Prevent per-thread events from
 sharing a sink
From: James Clark <james.clark@linaro.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@arm.com>, Suyash Mahar <smahar@meta.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Qi Liu
 <liuqi115@huawei.com>, Junhao He <hejunhao3@huawei.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>
References: <20260728-james-cs-multiple-per-threads-v3-0-6aee7579f1dc@linaro.org>
 <20260728-james-cs-multiple-per-threads-v3-4-6aee7579f1dc@linaro.org>
 <20260813160504.GC8904@e132581.arm.com>
 <dcea48bc-6a64-413b-acf5-9783f979ab6d@linaro.org>
 <20260819084515.GF8904@e132581.arm.com>
 <a7e11c2c-fd83-4ea5-8218-29a5af768578@linaro.org>
Content-Language: en-US
In-Reply-To: <a7e11c2c-fd83-4ea5-8218-29a5af768578@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_042755_563875_56F66F9C 
X-CRM114-Status: GOOD (  47.17  )
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



On 20/08/2026 12:09, James Clark wrote:
> 
> 
> On 19/08/2026 09:45, Leo Yan wrote:
>> On Fri, Aug 14, 2026 at 10:09:01AM +0100, James Clark wrote:
>>
>> [...]
>>
>>> There isn't any sharing with "another perf session", unless there is a
>>> mistake somewhere? Checking that the owners are equivalent enforces 
>>> this. Or
>>> do you mean another event owned by the same process?
>>
>> Now I understand that the problem is constrained to different events
>> within the same session.
>>
>>> I'm not sure the exact model you had in mind was that still supports 
>>> this
>>> and fixes the bugs?
>>
>> Let me try to describe my understanding of the problem.
>>
>>    ./perf test -w named_threads 2 1000000 &
>>    ./perf record -e cs_etm//u --per-thread --pid $!
>>
>> We can simplify the flow as:
>>
>>                  | T1 |
>>    CPU0        ------------------------------
>>                     |   T2      |
>>    CPU1        ------------------------------
>>                                 `> T2 stops and the driver reports
>>                                    the warning when trying to sync
>>                                    ETR_BUF(T1), while T2 is associated
>>                                    with ETR_BUF(T2).
>>
>>    AUX_BUF(T1) |                            |
>>    ETR_BUF(T1) | Bounce buf0                |  -> Used by H/W trace
>>
>>
>>    AUX_BUF(T2) |                            |
>>    ETR_BUF(T2) | Bounce buf1                |  -> Not used by H/W trace
>>
>> With `--per-thread --pid $PID`, perf creates separate events for the
>> child threads, say T1 and T2. Perf allocates a separate AUX buffer
>> for each event, and the ETR driver also allocates a separate bounce
>> buffer for each event. However, because there is only one shared ETR
>> sink, only one of those bounce buffers can actually be used by the
>> hardware at a time.
>>
>> If T1 stops while T2 is still running, the ETR remains enabled. Later,
>> when T2 stops, the ETR is still using ETR_BUF(T1). This mismatch
>> triggers the warning and prevents the data from being copied.
>>
>> I am just wandering if we can improve the sink driver to only allocate
>> a single bounce buffer that is independent of any threads (and any
>> associated events).
>>
>>                  | T1 |
>>    CPU0        ------------------------------
>>                     |   T2      |
>>    CPU1        ------------------------------
>>                                 `> T2 stops and can sync trace
>>                                    from the shared bounce buffer
>>                                    to AUX_BUF(T2).
>>
>>    AUX_BUF(T1) |                            |
>>    AUX_BUF(T2) |                            |
>>
>>    ETR_BUF     | Bounce buf                 |  -> Used by H/W trace
>>
>> This might also simplify the CPU-wide case. Each CPU would still have
>> its own AUX buffer, but the ETR driver would maintain only one bounce
>> buffer for the shared sink. A reference count could track how many
>> events are using the sink, with the final event responsible for
> 
> Isn't this how it's already working? get_perf_etr_buf_cpu_wide() 
> allocates a single shared buffer with a refcount. I didn't change this, 
> I only changed the rules about what is considered shared or not so that 
> it matches the semantics of the perf events that back the tracing session.
> 
>> stopping the sink and copying the trace data from bounce buffer to aux
>> buffer.
>>
>>> The one in this change is pretty complete and only does 4 comparisons,
>>> which seems quite simple to me.
>>
>> Before going further with the heavily sink buffer refactoring, perhaps
>> a more pragmatic solution would be to reject the problematic case for
>> now. Can we do something like below?
>>
>> +void coresight_trace_id_is_perf_started(struct coresight_trace_id_map 
>> *id_map)
>> +{
>> +    PERF_SESSION(atomic_read(&id_map->perf_cs_etm_session_active));
>> +}
>>
>> @@ -399,6 +399,15 @@ etm_event_build_path(struct perf_event *event, 
>> int cpu,
>>               goto out;
>>       }
>> +    if (!coresight_trace_id_is_perf_started(&sink->perf_sink_id_map)) {
>> +        sink->perf_owner = event->owner;
>> +        sink->perf_target = event->hw.target;
>> +    } else {
>> +        if (sink->perf_owner != event->owner ||
>> +            sink->perf_target != event->hw.target)
>> +            goto out;
>> +    }
>> +
>>
>> We use a central place etm_event_build_path() to record and compare
>> event's owner and target process, then we don't need to spread the
>> check into sink drivers. We only care about if owner and target must
>> be consistent.
> 
> But we don't know where the target will run when the event is created. 
> That's why the check is delayed until etm_event_start() and the process 
> has been scheduled. Where it runs needs to be taken into account to 
> calculate if this sink can be shared.
> 
> Moving the check to event creation time would cause a regression for two 
> users that plan to trace two different threads (or different CPUs where 
> the processes are known to never run on a shared sink at the same time). 
> With your example the second user is completely prohibited from opening 
> per-thread events, but with the existing driver and this change it 
> works. I think that's quite a significant change in functionality, 
> what's the justification for taking those use cases away from users?
> 

Another way to put it is that the current code checks the PID, and I 
made it also check the target PID in the same place. That's the extent 
of the change.

Everything else are minor fixes to things that were already broken like 
we shouldn't be comparing PIDs numerically because they can be re-used. 
I can't see how adding one more condition to an existing comparison is 
complicated or is too big of a change.

>>
>> Regard of the inherit/inherit_thread, I always see they are consistent
>> within the same session. Should we ignore them?
> 
> Do you mean they are always consistent in Perf? I don't think the driver 
> can afford to bend the rules just because Perf promises to never do it. 
> It might not always do that, and any tool can do perf_event_open(), not 
> just Perf.
> 
> It's quite easy to imagine the bug report being: "I opened one event 
> with inherit set, and one event without. Why do I get trace from other 
> threads in my event without inherit set? I expect to see only trace from 
> one process".
> 
>>
>> Thanks,
>> Leo
> 


