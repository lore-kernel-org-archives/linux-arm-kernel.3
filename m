Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C6BCA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 17:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xvE4LTDafzST+ebfuxrN2rVGDKvjsNA49QvlFFlyWIM=; b=A0sSZ6BCr87WvtVb5797MGpvqS
	dd1Sz4WQYZc22vK32gzHwH77xRCm4wCDrLwEyW0rceJht8UYs0Rdbc+tDWVz6koMp95dNk5YfrreP
	YM9GGz1Bim1mMiHmrrmCWqHO3guR+pJ+qHSXGoOwbWQFpP146aim9zfUC/KcaYeFI6i1orqiD1yBU
	wBAykCt/Ltk37zc8FhWgV0p5JUKiuDgHMGhF5Q7iwxyajoCbMUm2tCHND5i/RyHzeSMyaFRylsnVP
	ha8HOAql2KDUambjNjPbYILJ89Ksz/KnCMzz9V6RYN88u0I9fA4w8fQkSpt+n/JUnBuwzxp9IgX5L
	iTJGvpKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urJrw-0000000GIiT-3CUG;
	Wed, 27 Aug 2025 17:23:32 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urGpb-0000000Fh09-3YGw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 14:08:57 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3cd59c5a953so244478f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 07:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756303734; x=1756908534; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xvE4LTDafzST+ebfuxrN2rVGDKvjsNA49QvlFFlyWIM=;
        b=y3btGQttEK9DYO5dW+L2BpYzJfTVNn1jbsR6LHF8/LaIr/Gx6P0K4y0tbayRzuzkcN
         G1gSWU+YQwTCdT9teVbrZyEkY0yGHVrn6HRaklLnO1111bA6oBKwhog5lyUYR4o6vj3T
         jYj1Z65E95a5uzKQ0hFhYOieT1bBVsH7qPk7RT9+Q2aKIEQI4mZ/wj7l8VMyjqEFS1L/
         pwIcGbo2PKDa05tgpZQBA/l6VQM3uRNf7QG2vV3YXuQH1Nyjm0MkiT0thDlWJ3oyI2bk
         ZV1s/cRLPKoZH2J22wCTBPR9TqJt6elej56eyEZhRDq1xEq8yzd1wXjk+vjZMr6z92WD
         9LsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756303734; x=1756908534;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xvE4LTDafzST+ebfuxrN2rVGDKvjsNA49QvlFFlyWIM=;
        b=Q6caZwl0RK9uN2hEiQMGirE921FkVseb/kDznTERnJ2DGkOyjLn/RTMQLPzPVgg7ov
         yRHBopiphdsquIKDXR7L+KmZ9jnI+9ga5YLD0pIAJuqfen9/yWambNcUPUUd898dJTnG
         Cqk2KD+URGVIcZ/ObdazfkaZ7JdwrS0WCLhoidClwI8ZOcV4INPPUWxG9zSsX+u6Ug8r
         iW86kylL4gWUBOhd+HaRjiuDa8Toz23drReQtegudbr3phYAADqdobzTyTPJ8baB1zS/
         m7o2hzTCzS5jE7cXg2d0FSKiGntAlDW3KGqwjf7iZ5zLsqykhHXyO1x0J0XoiiQzdKld
         MvhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdf4nJHIHkRJ5OCl/pbKOacl21wT7ajuRIhH0447D1gxmJpMDB6G1p8Gf/BbLhWmkoWd75ebE0COrdJx6TLdFu@lists.infradead.org
X-Gm-Message-State: AOJu0YzhX7Y4neUSnQC5rRd+VtGPy44sXiCXHD+WGWpI7D6FlP4NW5bh
	8a907TkweDIBdO8HwivwKpIFeuXwD04417iN76XZYbB57CHOE7CVncpU+MBjLjqw1UM=
X-Gm-Gg: ASbGncvgCJSeTRdnCF7TDfOGP04ScgV1wLvLhxDUhdJfRvem+hhKB0IaOhC6SSVg7ep
	maVJW11BNJwl5KtSxTgl67hxsufSJq+1uBOR8o6R0bv6d1xsk8EwM7Y3jw+RTSClhMVOE5kVngV
	QqQtNukLg4u6plT4/1uiFdwCwdJGWyZHrQuvt6Tktob1MTncFp4OqbJqB8LtdrCDwrRhAZc9AFR
	BFqbVwjpzLmBLTzvzHukqypritPxT/qL4xWj2RU7iVpPKHkq1gMMwqPgp7hVOjq+B0l/xj8Pt+o
	9RfvDwMMG7tM+fhmol9jrnZ+p8jeWgfrmNyUpbFZAszqGtTw0xJBfJAhI/OAYzcidOwGwqbPX2c
	b7WkUHlcFXKjhTQLVG/wckJv4fPqWDQ==
X-Google-Smtp-Source: AGHT+IHkXcu1NEQam2q8j8cNwacl8Imtu6GXIMZzfeXxsacEy+DVaG4nf82ZkbK5vX8UXnyEqjuJwg==
X-Received: by 2002:a05:6000:188e:b0:3cd:9794:cbcf with SMTP id ffacd0b85a97d-3cd9794cc94mr128751f8f.60.1756303733978;
        Wed, 27 Aug 2025 07:08:53 -0700 (PDT)
Received: from [192.168.0.24] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cc56bde919sm4094896f8f.59.2025.08.27.07.08.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 07:08:53 -0700 (PDT)
Message-ID: <98afe1bd-99d2-4b5d-866a-e9541390fab4@linaro.org>
Date: Wed, 27 Aug 2025 17:08:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v2 22/29] mm/numa: Register information into Kmemdump
To: David Hildenbrand <david@redhat.com>, Michal Hocko <mhocko@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org, tglx@linutronix.de,
 andersson@kernel.org, pmladek@suse.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 corbet@lwn.net, mojha@qti.qualcomm.com, rostedt@goodmis.org,
 jonechou@google.com, tudor.ambarus@linaro.org,
 Christoph Hellwig <hch@infradead.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
 <20250724135512.518487-23-eugen.hristev@linaro.org>
 <ffc43855-2263-408d-831c-33f518249f96@redhat.com>
 <e66f29c2-9f9f-4b04-b029-23383ed4aed4@linaro.org>
 <751514db-9e03-4cf3-bd3e-124b201bdb94@redhat.com>
 <aJCRgXYIjbJ01RsK@tiehlicka>
 <e2c031e8-43bd-41e5-9074-c8b1f89e04e6@linaro.org>
 <23e7ec80-622e-4d33-a766-312c1213e56b@redhat.com>
 <f43a61b4-d302-4009-96ff-88eea6651e16@linaro.org>
 <77d17dbf-1609-41b1-9244-488d2ce75b33@redhat.com>
 <ecd33fa3-8362-48f0-b3c2-d1a11d8b02e3@linaro.org>
 <9f13df6f-3b76-4d02-aa74-40b913f37a8a@redhat.com>
 <64a93c4a-5619-4208-9e9f-83848206d42b@linaro.org>
 <f1f290fc-b2f0-483b-96d5-5995362e5a8b@redhat.com>
 <01c67173-818c-48cf-8515-060751074c37@linaro.org>
 <aab5e2af-04d6-485f-bf81-557583f2ae4b@redhat.com>
 <1b52419c-101b-487e-a961-97bd405c5c33@linaro.org>
 <99d2cc96-03ea-4026-883e-1ee083a96c39@redhat.com>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <99d2cc96-03ea-4026-883e-1ee083a96c39@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_070855_929121_36B8EB54 
X-CRM114-Status: GOOD (  42.89  )
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



On 8/27/25 15:18, David Hildenbrand wrote:
> On 27.08.25 13:59, Eugen Hristev wrote:
>>
>>
>> On 8/25/25 16:58, David Hildenbrand wrote:
>>> On 25.08.25 15:36, Eugen Hristev wrote:
>>>>
>>>>
>>>> On 8/25/25 16:20, David Hildenbrand wrote:
>>>>>
>>>>>>>
>>>>>>> IIRC, kernel/vmcore_info.c is never built as a module, as it also
>>>>>>> accesses non-exported symbols.
>>>>>>
>>>>>> Hello David,
>>>>>>
>>>>>> I am looking again into this, and there are some things which in my
>>>>>> opinion would be difficult to achieve.
>>>>>> For example I looked into my patch #11 , which adds the `runqueues` into
>>>>>> kmemdump.
>>>>>>
>>>>>> The runqueues is a variable of `struct rq` which is defined in
>>>>>> kernel/sched/sched.h , which is not supposed to be included outside of
>>>>>> sched.
>>>>>> Now moving all the struct definition outside of sched.h into another
>>>>>> public header would be rather painful and I don't think it's a really
>>>>>> good option (The struct would be needed to compute the sizeof inside
>>>>>> vmcoreinfo). Secondly, it would also imply moving all the nested struct
>>>>>> definitions outside as well. I doubt this is something that we want for
>>>>>> the sched subsys. How the subsys is designed, out of my understanding,
>>>>>> is to keep these internal structs opaque outside of it.
>>>>>
>>>>> All the kmemdump module needs is a start and a length, correct? So the
>>>>> only tricky part is getting the length.
>>>>
>>>> I also have in mind the kernel user case. How would a kernel programmer
>>>> want to add some kernel structs/info/buffers into kmemdump such that the
>>>> dump would contain their data ? Having "KMEMDUMP_VAR(...)" looks simple
>>>> enough.
>>>
>>> The other way around, why should anybody have a saying in adding their
>>> data to kmemdump? Why do we have that all over the kernel?
>>>
>>> Is your mechanism really so special?
>>>
>>> A single composer should take care of that, and it's really just start +
>>> len of physical memory areas.
>>>
>>>> Otherwise maybe the programmer has to write helpers to compute lengths
>>>> etc, and stitch them into kmemdump core.
>>>> I am not saying it's impossible, but just tiresome perhaps.
>>>
>>> In your patch set, how many of these instances did you encounter where
>>> that was a problem?
>>>
>>>>>
>>>>> One could just add a const variable that holds this information, or even
>>>>> better, a simple helper function to calculate that.
>>>>>
>>>>> Maybe someone else reading along has a better idea.
>>>>
>>>> This could work, but it requires again adding some code into the
>>>> specific subsystem. E.g. struct_rq_get_size()
>>>> I am open to ideas , and thank you very much for your thoughts.
>>>>
>>>>>
>>>>> Interestingly, runqueues is a percpu variable, which makes me wonder if
>>>>> what you had would work as intended (maybe it does, not sure).
>>>>
>>>> I would not really need to dump the runqueues. But the crash tool which
>>>> I am using for testing, requires it. Without the runqueues it will not
>>>> progress further to load the kernel dump.
>>>> So I am not really sure what it does with the runqueues, but it works.
>>>> Perhaps using crash/gdb more, to actually do something with this data,
>>>> would give more insight about its utility.
>>>> For me, it is a prerequisite to run crash, and then to be able to
>>>> extract the log buffer from the dump.
>>>
>>> I have the faint recollection that percpu vars might not be stored in a
>>> single contiguous physical memory area, but maybe my memory is just
>>> wrong, that's why I was raising it.
>>>
>>>>
>>>>>
>>>>>>
>>>>>>    From my perspective it's much simpler and cleaner to just add the
>>>>>> kmemdump annotation macro inside the sched/core.c as it's done in my
>>>>>> patch. This macro translates to a noop if kmemdump is not selected.
>>>>>
>>>>> I really don't like how we are spreading kmemdump all over the kernel,
>>>>> and adding complexity with __section when really, all we need is a place
>>>>> to obtain a start and a length.
>>>>>
>>>>
>>>> I understand. The section idea was suggested by Thomas. Initially I was
>>>> skeptic, but I like how it turned out.
>>>
>>> Yeah, I don't like it. Taste differs ;)
>>>
>>> I am in particular unhappy about custom memblock wrappers.
>>>
>>> [...]
>>>
>>>>>>
>>>>>> To have this working outside of printk, it would be required to walk
>>>>>> through all the printk structs/allocations and select the required info.
>>>>>> Is this something that we want to do outside of printk ?
>>>>>
>>>>> I don't follow, please elaborate.
>>>>>
>>>>> How is e.g., log_buf_len_get() + log_buf_addr_get() not sufficient,
>>>>> given that you run your initialization after setup_log_buf() ?
>>>>>
>>>>>
>>>>
>>>> My initial thought was the same. However I got some feedback from Petr
>>>> Mladek here :
>>>>
>>>> https://lore.kernel.org/lkml/aBm5QH2p6p9Wxe_M@localhost.localdomain/
>>>>
>>>> Where he explained how to register the structs correctly.
>>>> It can be that setup_log_buf is called again at a later time perhaps.
>>>>
>>>
>>> setup_log_buf() is a __init function, so there is only a certain time
>>> frame where it can be called.
>>>
>>> In particular, once the buddy is up, memblock allocations are impossible
>>> and it would be deeply flawed to call this function again.
>>>
>>> Let's not over-engineer this.
>>>
>>> Peter is on CC, so hopefully he can share his thoughts.
>>>
>>
>> Hello David,
>>
>> I tested out this snippet (on top of my series, so you can see what I
>> changed):
>>
>>
>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>> index 18ba6c1e174f..7ac4248a00e5 100644
>> --- a/kernel/sched/core.c
>> +++ b/kernel/sched/core.c
>> @@ -67,7 +67,6 @@
>>   #include <linux/wait_api.h>
>>   #include <linux/workqueue_api.h>
>>   #include <linux/livepatch_sched.h>
>> -#include <linux/kmemdump.h>
>>
>>   #ifdef CONFIG_PREEMPT_DYNAMIC
>>   # ifdef CONFIG_GENERIC_IRQ_ENTRY
>> @@ -120,7 +119,12 @@
>> EXPORT_TRACEPOINT_SYMBOL_GPL(sched_update_nr_running_tp);
>>   EXPORT_TRACEPOINT_SYMBOL_GPL(sched_compute_energy_tp);
>>
>>   DEFINE_PER_CPU_SHARED_ALIGNED(struct rq, runqueues);
>> -KMEMDUMP_VAR_CORE(runqueues, sizeof(runqueues));
>> +
>> +size_t runqueues_get_size(void);
>> +size_t runqueues_get_size(void)
>> +{
>> +       return sizeof(runqueues);
>> +}
>>
>>   #ifdef CONFIG_SCHED_PROXY_EXEC
>>   DEFINE_STATIC_KEY_TRUE(__sched_proxy_exec);
>> diff --git a/kernel/vmcore_info.c b/kernel/vmcore_info.c
>> index d808c5e67f35..c6dd2d6e96dd 100644
>> --- a/kernel/vmcore_info.c
>> +++ b/kernel/vmcore_info.c
>> @@ -24,6 +24,12 @@
>>   #include "kallsyms_internal.h"
>>   #include "kexec_internal.h"
>>
>> +typedef void* kmemdump_opaque_t;
>> +
>> +size_t runqueues_get_size(void);
>> +
>> +extern kmemdump_opaque_t runqueues;
> 
> I would have tried that through:
> 
> struct rq;
> extern struct rq runqueues;
> 
> But the whole PER_CPU_SHARED_ALIGNED makes this all weird, and likely
> not the way we would want to handle that.
> 
>>   /* vmcoreinfo stuff */
>>   unsigned char *vmcoreinfo_data;
>>   size_t vmcoreinfo_size;
>> @@ -230,6 +236,9 @@ static int __init crash_save_vmcoreinfo_init(void)
>>
>>          kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_VMCOREINFO,
>>                               (void *)vmcoreinfo_data, vmcoreinfo_size);
>> +       kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_runqueues,
>> +                            (void *)&runqueues, runqueues_get_size());
>> +
>>          return 0;
>>   }
>>
>> With this, no more .section, no kmemdump code into sched, however, there
>> are few things :
> 
> I would really just do here something like the following:
> 
> /**
>   * sched_get_runqueues_area - obtain the runqueues area for dumping
>   * @start: ...
>   * @size: ...
>   *
>   * The obtained area is only to be used for dumping purposes.
>   */
> void sched_get_runqueues_area(void *start, size_t size)
> {
> 	start = &runqueues;
> 	size = sizeof(runqueues);
> }
> 
> might be cleaner.
> 

How about this in the header:

#define DECLARE_DUMP_AREA_FUNC(subsys, symbol) \

void subsys ## _get_ ## symbol ##_area(void **start, size_t *size);



#define DEFINE_DUMP_AREA_FUNC(subsys, symbol) \

void subsys ## _get_ ## symbol ##_area(void **start, size_t *size)\

{\

        *start = &symbol;\

        *size = sizeof(symbol);\

}


then, in sched just

DECLARE_DUMP_AREA_FUNC(sched, runqueues);

DEFINE_DUMP_AREA_FUNC(sched, runqueues);

or a single macro that wraps both.

would make it shorter and neater.

What do you think ?

> 
> Having said that, if you realize that there is a fundamental issue with 
> what I propose, please speak up.
> 
> So far, I feel like there are only limited number of "suboptimal" cases 
> of this kind, but I might be wrong of course.
> 


