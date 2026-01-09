Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77518D26D72
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 16:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mYq4XTnbwe8g/sd+bNMtb4SVhwA4K4IuyRiWM4Te0+M=; b=TaB5QbU0Nd2m0slJ8VKf9ngmaD
	LrI5pRD3cT3Uudk/+r1egwz9r+546WY72UlEbZvemi8CUPqz52sTf8evwKT+ghhqIoEiO+0KvcXzD
	F8XS8EAqYCUM6QKts+/IcO3YiJc4Zxs6x36csakFExUk3hHm5mW+VDnGSboCe3ru8529EG2clGhMU
	pt1SW82aDwqJPf8jrZ+i2MmJqLY4w0La02wwDyWOijxx30KfOID2ITOrRfF1bZ+3Jd+TBrpKs5/UI
	q7JQdDPiCgj/BnfRy6pjl4MibLZOhInU22t/FH+AUKph2+SqvWQHLz7dT0W6AEAoVANUioznnLPw6
	WBb3hRKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veFSq-00000002dLY-3NtH;
	Fri, 09 Jan 2026 16:35:52 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veFSn-00000002dL9-3Nl2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 16:35:50 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-477563e28a3so22654195e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 08:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767976548; x=1768581348; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mYq4XTnbwe8g/sd+bNMtb4SVhwA4K4IuyRiWM4Te0+M=;
        b=zSLx0PK2hDFuN/OMPqVoTxuVKlMgxLqImh2J3aq6bXJEU16zwVLszSzSXiHbpOhOIs
         jXB9zMJSOizFrx5joWBNM+0iczrUwjKdSIUdvknClz4Vk7z5OH/I0wGcHHEe020Bfuz6
         an/39tTy92WwMYC5LQXkqDuwIHcdGP4jDxnL19nNnkPjiB73YGE+EnsXfJyndjvl7TI0
         YJx1qYAFAW7Cf+e8iL33rx/M/AHgqbIsdVINE2gKC49UUaxf1eUTLs3ZyBTCgas2Q22E
         KAQG6KNyMvQIr8uM5/WU6ybVvAJfAfANgdlGmU04/Grup7vSF0GtGQSPjC7RZg9/4D7T
         Jqyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767976548; x=1768581348;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mYq4XTnbwe8g/sd+bNMtb4SVhwA4K4IuyRiWM4Te0+M=;
        b=oU2ClhUIkhld+uUE5qWXo7S6NGC7t6Su7TcnO1O10gm7+dE6mBMhTLiLrJ0eh6zCNB
         HGA2mu6jJunfHUVbISTh1mjMwtlU0K1L/ZJQTiDQh0fUIZUu1oUkJpHLOGC5z/kAgiqX
         +CG8w01F1r6Ujij9Yu0WEvKd8AB5GxS5XUCf4Fw+5Qs0Ft16aNnLx4l3ZyLbH9H+57nS
         jiRIjJ/dBSz+7bGbbC0BHIjNmID+YgYLHxMjsZoWDx+CGJlxlAtdS6/BtN+yv/9AQ6gM
         8Abwlw0WWCsxiO/VHjjEj9odVJNuAHF08BA7LDb58wmG2Y2JZRDIxnyIaso4zCewkI/s
         iykQ==
X-Forwarded-Encrypted: i=1; AJvYcCXu4fpyAU+GNfp3zWopCxgz1C9dXBpeysNK+UkxM5ryGmrNsGvFsLt8RPggZnhGCu+w+1LQgLMf971iwvRcfkSG@lists.infradead.org
X-Gm-Message-State: AOJu0YwSlCnKydJKybM60y2y686Cu/R1IaJ0YNPZAP3wT55iuY5BePTe
	aYiJfNUP32mGsyV4igRwND1JawLhxNNMpZEbeV55YyY68SnnWb5nCqqxnEltzCgwqJ8=
X-Gm-Gg: AY/fxX5UQ2Ab58gxLFqP5+bUFHy4SdiBrQwEELh9ltk++N75F+cVdSkxD3K5uIEBGi7
	w6jV3p02QyKectENTN50bKGmd6L6RYaeTHtNCuraCjWpkeBiUVTl7gJY8pmqQb0OnmNI5YVOLL/
	yd8Qv0AVpFu4lMAPbsrqf9jrXNyst1gQftjFNGgqmZoXmr0HdRyHCCaROpvmCJfIHcUx75JjbyL
	X9C+pzsWKX1ZBROiQWIy08Mtcm6Q71Gq4/9plmyRjGVXMI+v7vHCcOq9AT2c2g9ccIii2Qg09li
	/CzD0R36kOtFJ7vYLTxrRCGx4iWqGs2gbPWbWMoiE/HtqpPDROp2BRBalEbnMHdmTkX2CCxoqCK
	Q61w1CdmJ9BTHUzX6Q4H5RH+fvhxnWSmH0shw34iINmZajN7XGCuBXGC+4JiX0qI8zFbXtAu4zJ
	1W6AmG5G6Bar9I1AY8
X-Google-Smtp-Source: AGHT+IEAjgf+lbfDMBhJeK65teYZfj9k9R/EgG3oHcJdbO0MuQcicmWirw3jnMponF1BxGAtxSDoHA==
X-Received: by 2002:a05:600c:5916:b0:475:d7fd:5c59 with SMTP id 5b1f17b1804b1-47d81810b1fmr125710995e9.16.1767976547522;
        Fri, 09 Jan 2026 08:35:47 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f661a03sm228438135e9.13.2026.01.09.08.35.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 08:35:47 -0800 (PST)
Message-ID: <c1d3c9e4-68e2-495f-8171-6780a9badf56@linaro.org>
Date: Fri, 9 Jan 2026 16:35:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v6 29/35] KVM: arm64: Pin the SPE buffer in the host
 and map it at stage 2
From: James Clark <james.clark@linaro.org>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: mark.rutland@arm.com, james.morse@arm.com, maz@kernel.org,
 oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, will@kernel.org, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
References: <20251114160717.163230-1-alexandru.elisei@arm.com>
 <20251114160717.163230-30-alexandru.elisei@arm.com>
 <38443801-af4e-4ce1-a1c2-603eca8d90da@linaro.org>
Content-Language: en-US
In-Reply-To: <38443801-af4e-4ce1-a1c2-603eca8d90da@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_083549_877146_555DEDF5 
X-CRM114-Status: GOOD (  28.31  )
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



On 09/01/2026 4:29 pm, James Clark wrote:
> 
> 
> On 14/11/2025 4:07 pm, Alexandru Elisei wrote:
>> If the SPU encounters a translation fault when it attempts to write a
>> profiling record to memory, it stops profiling and asserts the PMBIRQ
>> interrupt.  Interrupts are not delivered instantaneously to the CPU, and
>> this creates a profiling blackout window where the profiled CPU executes
>> instructions, but no samples are collected.
>>
>> This is not desirable, and the SPE driver avoids it by keeping the buffer
>> mapped for the entire the profiling session.
>>
>> KVM maps memory at stage 2 when the guest accesses it, following a 
>> fault on
>> a missing stage 2 translation, which means that the problem is present 
>> in a
>> SPE enabled virtual machine. Worse yet, the blackout windows are
>> unpredictable: the guest profiling the same process can during one
>> profiling session, not trigger any stage 2 faults (the entire buffer 
>> memory
>> is already mapped at stage 2), but worst case scenario, during another
>> profiling session, trigger stage 2 faults for every record it attempts to
>> write (if KVM keeps removing the buffer pages from stage 2), or something
>> in between - some records trigger a stage 2 fault, some don't.
>>
>> The solution is for KVM to follow what the SPE driver does: keep the 
>> buffer
>> mapped at stage 2 while ProfilingBufferEnabled() is true. To accomplish
> 
> Hi Alex,
> 
> The problem is that the driver enables and disables the buffer every 
> time the target process is switched out unless you explicitly ask for 
> per-CPU mode. Is there some kind of heuristic you can add to prevent 
> pinning and unpinning unless something actually changes?
> 
> Otherwise it's basically unusable with normal perf commands and larger 
> buffer sizes. Take these basic examples were I've added a filter so no 
> SPE data is even recorded:
> 
>   $ perf record -e arm_spe/min_latency=1000,event_filter=10/ -m,256M --\
>       true
> 
> On a kernel with lockep and kmemleak etc this takes 20s to complete. On 
> a normal kernel build it still takes 4s.
> 
> Much worse is anything more complicated than just 'true' which will have 
> more context switching:
> 
> $ perf record -e arm_spe/min_latency=1000,event_filter=10/ -m,256M --\
>      perf stat true
> 
> This takes 3 minutes or 50 seconds to complete (with and without kernel 
> debugging features respectively)
> 
> For comparison, running these on the host all take less than half a 
> second. I measured each pin/unpin taking about 0.2s and the basic 'true' 
> example resulting in 100 context switches which adds up to the 20s.
> 
> Another interesting stat is that the second example says 'true' ends up 
> running at an average clock speed of 4Mhz:
> 
>            12683357      cycles   #    0.004 GHz
> 
> You also get warnings like this
> 
>   rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
>   rcu:     Tasks blocked on level-0 rcu_node (CPUs 0-0): P53/1:b..l
>   rcu:     (detected by 0, t=6503 jiffies, g=8461, q=43 ncpus=1)
>   task:perf            state:R  running task     stack:0     pid:53 
> tgid:53    ppid:52     task_flags:0x400000 flags:0x00000008
>   Call trace:
>    __switch_to+0x1b8/0x2d8 (T)
>    __schedule+0x8b4/0x1050
>    preempt_schedule_common+0x2c/0xb8
>    preempt_schedule+0x30/0x38
>    _raw_spin_unlock+0x60/0x70
>    finish_fault+0x330/0x408
>    do_pte_missing+0x7d4/0x1188
>    handle_mm_fault+0x244/0x568
>    do_page_fault+0x21c/0x548
>    do_translation_fault+0x44/0x68
>    do_mem_abort+0x4c/0x100
>    el0_da+0x58/0x200
>    el0t_64_sync_handler+0xc0/0x130
>    el0t_64_sync+0x198/0x1a0
> 
> If we can't add a heuristic to keep the buffer pinned, it almost seems 
> like the random blackouts would be preferable to pinning being so slow.
> 

One other comment to add to this, is that increasing the buffer size is 
the normal reaction to profiling overheads being high. I think that's 
how I came across this in the first place. Or if you want to avoid 
overhead entirely you set a buffer that's large enough to handle the 
whole run.

In this case in a VM it actually has the opposite effect to doing the 
same thing on a host. The bigger you make it the worse the problem gets.


