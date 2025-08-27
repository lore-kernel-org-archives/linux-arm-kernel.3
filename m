Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB5B2CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 20:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=34OvV722MPzNFlMItm96/YWXn21qA16CuhrE4XzmGx8=; b=WyLyZCUwmu2OoHaaT9Q2l9Mtv+
	15pkZ9R/gi4puDKryr2E7rqt8NgemFEXXox+xbOBQIvlPWDY6YHdFU22GFgPzdG7A6ya/bSdUb6vd
	+1DhJzNrW1ZWi3CJxs+6TDBWtKzOhCx4UPVB69bs1VcTdQFgGiiZYA8GMGalr1mKqecm9I0mIQ+CX
	nBPZY2ZMmkF/NRO5L+DTpnWYfMUTxqFAkGAMKZN9SsnuEKBAi4v5bI7uuWw1H33PIXraY+z8i+yYh
	Pg/ZbD+xaiUAnYH5SYUvJJoC+app7kyMd54Ih5ZBAR2ZLoo25Z8rMQLXSIMTjx5wyzn3kge7xs1yY
	urwVw0gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urN9d-0000000GoYB-0ws3;
	Wed, 27 Aug 2025 20:54:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urMQ9-0000000GhvE-17J1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 20:07:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756325220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=34OvV722MPzNFlMItm96/YWXn21qA16CuhrE4XzmGx8=;
	b=GbSuM5eitr89r5wzgUsJiTZhFzNTLC6FmzxoYNM1T29PJol4037pFausdWLd/3Eidut1D+
	a4cBNUHspu7kO324ZDUJkhQ+QN8j9rR/Jw8+RdB6pmpeDc+ZzdkMvWBNIxMwdOULF6od0u
	3ERtr20SdlYpIzZ2W13s3LN0+nOQ14E=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-316-DmRepzpTPzWp2FjwBOHZEw-1; Wed, 27 Aug 2025 16:06:58 -0400
X-MC-Unique: DmRepzpTPzWp2FjwBOHZEw-1
X-Mimecast-MFC-AGG-ID: DmRepzpTPzWp2FjwBOHZEw_1756325217
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45a1b0c5366so922975e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 13:06:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756325217; x=1756930017;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=34OvV722MPzNFlMItm96/YWXn21qA16CuhrE4XzmGx8=;
        b=K+t8LUvRIr9Ix+kRqKSjUcjk2O4I0IoVLRLILD3YfRyIDbKEZEfPVfggMYv1DKvsU0
         ATzfcGCjTAsTucg0iLTghtoV4OUTY4h26i3JEsisjs+4zzwUg9I+47jAhRVL2bfLQHyF
         6ssh7xCkIMiPWkt1TTiAFyEQ/+cWS8olVtiuaRJhFox7rhuCF63TTz/UsC8zz6HfyjDQ
         zY6iMqgCCyZ8rvb2JI6N53sdo5qOAfH+CTiK0F6k2q5vYF1DznbaZ1UaM57BEyC9IZmV
         FEES7dqg2B/PsI3MY3XwegPzy0g0KR2j8uuEvueXm4HiSKVy2A94RAl5t32NSyy0vMGB
         xw7A==
X-Forwarded-Encrypted: i=1; AJvYcCWDqTKsx1rfOu1LBowJpdQlPplAcr5qpeRbBdA5HjbowkIAQ9MrEOHcf5cqSaK46Ika+6/RkMNJMBfU1osiShUl@lists.infradead.org
X-Gm-Message-State: AOJu0YzSBkRkaojtWENBHHgDqjsXppre53+krqQPzWj6wTd/6tqwMGxD
	IKJp/r7lRIlePbKMAkmHkvXXrsUvMxPKNG8pl9MZKqMJhB0hv65XeaEv4sUY09k48PoOdQnYinU
	51vG21E9VOrN3UvFpAIwJmY/cXhw67TSwfMA/0/gumMx+tRsdNyuil/Vd3banPau4qpDo/FxFvX
	tM
X-Gm-Gg: ASbGncszh3rKiRmk5xzSeFHphsPhWMW4b0AZ9pwn0eoAjbny9x9Ho5IcFl+y3fv1GNb
	ivlxR5uNxCWUtVdCCAeawYAn23XWsBLaDpg3RHNzsO9MK4WVK9aK2KKRvBAkKWjvXeM5QN8VUZ4
	FQT7kP8bCbvNV1is3JNLanrSLP8fUe9gvo6MEHkNvtgZhvq8UxHrx0Uvk0icAFbzVRORAQMdhln
	zibn64AKueFqZ3wT7ZfdKxYcmVZ7BVBdWVitm+AHdi+AIQtZkHtYobYIVeJnjtkpeVH7Vo7Hr3A
	8wAU7BwdKK+D0ImONHZsEvkZN66mUizo08d/IGb0DjQBiz4qYUR8lx25dTQ1l+gDQPZYY/RCPzT
	1lvcslUrLYHc8BwF5H++6ex32UP43oC+A6w3u/4Ja8tYa7bNTMkikJU3n0PxEt3CSOpo=
X-Received: by 2002:a05:600c:1f88:b0:45b:67e9:121f with SMTP id 5b1f17b1804b1-45b67e91509mr86611855e9.16.1756325217219;
        Wed, 27 Aug 2025 13:06:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXzVIJandfkyzN4nAPdwoddzU0BU5CzUGYNuM+t5+vjzDcOupCShGxfr6j1Z4VGI1P/srbHQ==
X-Received: by 2002:a05:600c:1f88:b0:45b:67e9:121f with SMTP id 5b1f17b1804b1-45b67e91509mr86611575e9.16.1756325216769;
        Wed, 27 Aug 2025 13:06:56 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1f:d000:d4e1:a22e:7d95:bb63? (p200300d82f1fd000d4e1a22e7d95bb63.dip0.t-ipconnect.de. [2003:d8:2f1f:d000:d4e1:a22e:7d95:bb63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b797dd1e7sm905425e9.19.2025.08.27.13.06.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 13:06:56 -0700 (PDT)
Message-ID: <c59f2528-31b0-4b9d-8d20-f204a0600ff6@redhat.com>
Date: Wed, 27 Aug 2025 22:06:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v2 22/29] mm/numa: Register information into Kmemdump
To: Eugen Hristev <eugen.hristev@linaro.org>, Michal Hocko <mhocko@suse.com>
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
 <98afe1bd-99d2-4b5d-866a-e9541390fab4@linaro.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <98afe1bd-99d2-4b5d-866a-e9541390fab4@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: e6E3Spf4pt2f7JhJU4RMEiYSJFfYWyrwymPsgJBNLNI_1756325217
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_130701_462935_70251841 
X-CRM114-Status: GOOD (  27.68  )
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

On 27.08.25 16:08, Eugen Hristev wrote:
> 
> 
> On 8/27/25 15:18, David Hildenbrand wrote:
>> On 27.08.25 13:59, Eugen Hristev wrote:
>>>
>>>
>>> On 8/25/25 16:58, David Hildenbrand wrote:
>>>> On 25.08.25 15:36, Eugen Hristev wrote:
>>>>>
>>>>>
>>>>> On 8/25/25 16:20, David Hildenbrand wrote:
>>>>>>
>>>>>>>>
>>>>>>>> IIRC, kernel/vmcore_info.c is never built as a module, as it also
>>>>>>>> accesses non-exported symbols.
>>>>>>>
>>>>>>> Hello David,
>>>>>>>
>>>>>>> I am looking again into this, and there are some things which in my
>>>>>>> opinion would be difficult to achieve.
>>>>>>> For example I looked into my patch #11 , which adds the `runqueues` into
>>>>>>> kmemdump.
>>>>>>>
>>>>>>> The runqueues is a variable of `struct rq` which is defined in
>>>>>>> kernel/sched/sched.h , which is not supposed to be included outside of
>>>>>>> sched.
>>>>>>> Now moving all the struct definition outside of sched.h into another
>>>>>>> public header would be rather painful and I don't think it's a really
>>>>>>> good option (The struct would be needed to compute the sizeof inside
>>>>>>> vmcoreinfo). Secondly, it would also imply moving all the nested struct
>>>>>>> definitions outside as well. I doubt this is something that we want for
>>>>>>> the sched subsys. How the subsys is designed, out of my understanding,
>>>>>>> is to keep these internal structs opaque outside of it.
>>>>>>
>>>>>> All the kmemdump module needs is a start and a length, correct? So the
>>>>>> only tricky part is getting the length.
>>>>>
>>>>> I also have in mind the kernel user case. How would a kernel programmer
>>>>> want to add some kernel structs/info/buffers into kmemdump such that the
>>>>> dump would contain their data ? Having "KMEMDUMP_VAR(...)" looks simple
>>>>> enough.
>>>>
>>>> The other way around, why should anybody have a saying in adding their
>>>> data to kmemdump? Why do we have that all over the kernel?
>>>>
>>>> Is your mechanism really so special?
>>>>
>>>> A single composer should take care of that, and it's really just start +
>>>> len of physical memory areas.
>>>>
>>>>> Otherwise maybe the programmer has to write helpers to compute lengths
>>>>> etc, and stitch them into kmemdump core.
>>>>> I am not saying it's impossible, but just tiresome perhaps.
>>>>
>>>> In your patch set, how many of these instances did you encounter where
>>>> that was a problem?
>>>>
>>>>>>
>>>>>> One could just add a const variable that holds this information, or even
>>>>>> better, a simple helper function to calculate that.
>>>>>>
>>>>>> Maybe someone else reading along has a better idea.
>>>>>
>>>>> This could work, but it requires again adding some code into the
>>>>> specific subsystem. E.g. struct_rq_get_size()
>>>>> I am open to ideas , and thank you very much for your thoughts.
>>>>>
>>>>>>
>>>>>> Interestingly, runqueues is a percpu variable, which makes me wonder if
>>>>>> what you had would work as intended (maybe it does, not sure).
>>>>>
>>>>> I would not really need to dump the runqueues. But the crash tool which
>>>>> I am using for testing, requires it. Without the runqueues it will not
>>>>> progress further to load the kernel dump.
>>>>> So I am not really sure what it does with the runqueues, but it works.
>>>>> Perhaps using crash/gdb more, to actually do something with this data,
>>>>> would give more insight about its utility.
>>>>> For me, it is a prerequisite to run crash, and then to be able to
>>>>> extract the log buffer from the dump.
>>>>
>>>> I have the faint recollection that percpu vars might not be stored in a
>>>> single contiguous physical memory area, but maybe my memory is just
>>>> wrong, that's why I was raising it.
>>>>
>>>>>
>>>>>>
>>>>>>>
>>>>>>>     From my perspective it's much simpler and cleaner to just add the
>>>>>>> kmemdump annotation macro inside the sched/core.c as it's done in my
>>>>>>> patch. This macro translates to a noop if kmemdump is not selected.
>>>>>>
>>>>>> I really don't like how we are spreading kmemdump all over the kernel,
>>>>>> and adding complexity with __section when really, all we need is a place
>>>>>> to obtain a start and a length.
>>>>>>
>>>>>
>>>>> I understand. The section idea was suggested by Thomas. Initially I was
>>>>> skeptic, but I like how it turned out.
>>>>
>>>> Yeah, I don't like it. Taste differs ;)
>>>>
>>>> I am in particular unhappy about custom memblock wrappers.
>>>>
>>>> [...]
>>>>
>>>>>>>
>>>>>>> To have this working outside of printk, it would be required to walk
>>>>>>> through all the printk structs/allocations and select the required info.
>>>>>>> Is this something that we want to do outside of printk ?
>>>>>>
>>>>>> I don't follow, please elaborate.
>>>>>>
>>>>>> How is e.g., log_buf_len_get() + log_buf_addr_get() not sufficient,
>>>>>> given that you run your initialization after setup_log_buf() ?
>>>>>>
>>>>>>
>>>>>
>>>>> My initial thought was the same. However I got some feedback from Petr
>>>>> Mladek here :
>>>>>
>>>>> https://lore.kernel.org/lkml/aBm5QH2p6p9Wxe_M@localhost.localdomain/
>>>>>
>>>>> Where he explained how to register the structs correctly.
>>>>> It can be that setup_log_buf is called again at a later time perhaps.
>>>>>
>>>>
>>>> setup_log_buf() is a __init function, so there is only a certain time
>>>> frame where it can be called.
>>>>
>>>> In particular, once the buddy is up, memblock allocations are impossible
>>>> and it would be deeply flawed to call this function again.
>>>>
>>>> Let's not over-engineer this.
>>>>
>>>> Peter is on CC, so hopefully he can share his thoughts.
>>>>
>>>
>>> Hello David,
>>>
>>> I tested out this snippet (on top of my series, so you can see what I
>>> changed):
>>>
>>>
>>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>>> index 18ba6c1e174f..7ac4248a00e5 100644
>>> --- a/kernel/sched/core.c
>>> +++ b/kernel/sched/core.c
>>> @@ -67,7 +67,6 @@
>>>    #include <linux/wait_api.h>
>>>    #include <linux/workqueue_api.h>
>>>    #include <linux/livepatch_sched.h>
>>> -#include <linux/kmemdump.h>
>>>
>>>    #ifdef CONFIG_PREEMPT_DYNAMIC
>>>    # ifdef CONFIG_GENERIC_IRQ_ENTRY
>>> @@ -120,7 +119,12 @@
>>> EXPORT_TRACEPOINT_SYMBOL_GPL(sched_update_nr_running_tp);
>>>    EXPORT_TRACEPOINT_SYMBOL_GPL(sched_compute_energy_tp);
>>>
>>>    DEFINE_PER_CPU_SHARED_ALIGNED(struct rq, runqueues);
>>> -KMEMDUMP_VAR_CORE(runqueues, sizeof(runqueues));
>>> +
>>> +size_t runqueues_get_size(void);
>>> +size_t runqueues_get_size(void)
>>> +{
>>> +       return sizeof(runqueues);
>>> +}
>>>
>>>    #ifdef CONFIG_SCHED_PROXY_EXEC
>>>    DEFINE_STATIC_KEY_TRUE(__sched_proxy_exec);
>>> diff --git a/kernel/vmcore_info.c b/kernel/vmcore_info.c
>>> index d808c5e67f35..c6dd2d6e96dd 100644
>>> --- a/kernel/vmcore_info.c
>>> +++ b/kernel/vmcore_info.c
>>> @@ -24,6 +24,12 @@
>>>    #include "kallsyms_internal.h"
>>>    #include "kexec_internal.h"
>>>
>>> +typedef void* kmemdump_opaque_t;
>>> +
>>> +size_t runqueues_get_size(void);
>>> +
>>> +extern kmemdump_opaque_t runqueues;
>>
>> I would have tried that through:
>>
>> struct rq;
>> extern struct rq runqueues;
>>
>> But the whole PER_CPU_SHARED_ALIGNED makes this all weird, and likely
>> not the way we would want to handle that.
>>
>>>    /* vmcoreinfo stuff */
>>>    unsigned char *vmcoreinfo_data;
>>>    size_t vmcoreinfo_size;
>>> @@ -230,6 +236,9 @@ static int __init crash_save_vmcoreinfo_init(void)
>>>
>>>           kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_VMCOREINFO,
>>>                                (void *)vmcoreinfo_data, vmcoreinfo_size);
>>> +       kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_runqueues,
>>> +                            (void *)&runqueues, runqueues_get_size());
>>> +
>>>           return 0;
>>>    }
>>>
>>> With this, no more .section, no kmemdump code into sched, however, there
>>> are few things :
>>
>> I would really just do here something like the following:
>>
>> /**
>>    * sched_get_runqueues_area - obtain the runqueues area for dumping
>>    * @start: ...
>>    * @size: ...
>>    *
>>    * The obtained area is only to be used for dumping purposes.
>>    */
>> void sched_get_runqueues_area(void *start, size_t size)
>> {
>> 	start = &runqueues;
>> 	size = sizeof(runqueues);
>> }
>>
>> might be cleaner.
>>
> 
> How about this in the header:
> 
> #define DECLARE_DUMP_AREA_FUNC(subsys, symbol) \
> 
> void subsys ## _get_ ## symbol ##_area(void **start, size_t *size);
> 
> 
> 
> #define DEFINE_DUMP_AREA_FUNC(subsys, symbol) \
> 
> void subsys ## _get_ ## symbol ##_area(void **start, size_t *size)\
> 
> {\
> 
>          *start = &symbol;\
> 
>          *size = sizeof(symbol);\
> 
> }
> 
> 
> then, in sched just
> 
> DECLARE_DUMP_AREA_FUNC(sched, runqueues);
> 
> DEFINE_DUMP_AREA_FUNC(sched, runqueues);
> 
> or a single macro that wraps both.
> 
> would make it shorter and neater.
> 
> What do you think ?

Looks a bit over-engineered, and will require us to import a header 
(likely kmemdump.h) in these files, which I don't really enjoy.

I would start simple, without any such macro-magic. It's a very simple 
function after all, and likely you won't end up having many of these?

-- 
Cheers

David / dhildenb


