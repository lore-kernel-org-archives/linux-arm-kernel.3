Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B89CA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 14:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nyb7W0i1P3IjF0jcI+ICuOqZQ1VFzRLlpkO8ArSEv2U=; b=jx0gG/maEQDk9wG2BH8eIaqox/
	rIUaKOmatA5s7N36vDfdFm06tlj4McBG16KxHX6e1+SXrPhE4Z8MAJMgbHUwtKslUDOxPHOGsVwxt
	CKrqyqkj1ctdw7Jh/KYu/CKcjuUaAbyLTVGnA9FlB90oYo+Ln4Jjm9qfrOv9maMDA3FDxUK69dRPQ
	3tVg7uKSlldPk2pDFpsC9fM9s4amo/r9wWv6X7BDhEoAbR8dzxU1I6PqtEkTEv8EePK0B0swZ24s4
	mXaLK8mZldgBe9guBVNznnmXkYyUvPV24PlN1UrZlbjiJu6EopnLcCh5XIf5ziiTFw7GbP2Ws0MzX
	5T2a72cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYfK-00000008LkE-06a1;
	Mon, 25 Aug 2025 14:59:22 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqWjA-00000007zuQ-0V0D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 12:55:14 +0000
Received: by mail-wr1-x441.google.com with SMTP id ffacd0b85a97d-3c79f0a604aso1006870f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 05:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756126510; x=1756731310; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nyb7W0i1P3IjF0jcI+ICuOqZQ1VFzRLlpkO8ArSEv2U=;
        b=Hv17zMgWtMIaJYJsJIadhnz01/k7lBIKqe/KxXGOMLtC4yhbFlUiN2AZUQd6ol41X+
         5U7y9Bwhl5E7NfrAdWqzSNaYwfIhpeY2+xEhu2M+Vp7ud3Y98k5/WULKBi+oXVF0vnEA
         v+xfQkEkWoGbPCgRdQsrWIbZ2uAnuva9kACo1wg7jIBDwHiR1sNiEGQpqrUJtJ5RVoIM
         f3IWiYGH5PA14AvGJ+ZLyCsJCbkWMBkd0UeKPT7K4ronGRORejtqUOvoSAeLXkKGBBmL
         201uF7BirNRW3F11AcyPJVST1u8t2mlp1epwWGbreARBwdrePOfSiFiqv4M8JDoOTnKP
         XJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756126510; x=1756731310;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nyb7W0i1P3IjF0jcI+ICuOqZQ1VFzRLlpkO8ArSEv2U=;
        b=ZjlU7K2JsKqLyIqWXwkuCWtWw6531jPHofCm5Px1At3TxElo0RRr/GAL5/vFGE9D/m
         KJj+PkZgC/djxqRo+NhgEi+v2QV0C09HMtZJy8LGFV7rwIldMdse34Kw/mo3kH0045w4
         VyKn7eedOSr2yhAN29ur7N5XTPQfB86gyTKcC3MOAgw5xLJFOYAxbS9d0AaohX3a+NYc
         Yjl1S4Kps64TjbFJdXVOCl8q7jDIPWcwny2ip+rH3TAV8OtCJfGnTAFBx8B6bJVneHY5
         icIsehjQbCXrfbt1rKd2UzWQ+tX6pFcGECwefJw2vkO+ZGfTJgji61G63glJmfsLWqht
         Rs5A==
X-Forwarded-Encrypted: i=1; AJvYcCUmJmlMr9WSBmj9WO0pysWHQgbfxfEWYebcJAywdNEjQOioA37xg/Z2C9qnZe41J2tseLV2A38sC1JWS8VsKqvp@lists.infradead.org
X-Gm-Message-State: AOJu0YyAwFU5xTOOhcErno3FQ3EEL8d9rgufB4X/Ts328DvsV579iQEU
	w/NHdZHDnLazox6s2nBqCFyreQQmI9AEYZ5PhPdbCJ+u3vG2jvOGLkaIFPQwzlrPp8M=
X-Gm-Gg: ASbGncvUZfCT1+ynM7S5Pz8BgOH0IIipZfDVDWh9OQKpqhDpX30eVgQI/SruglNd7Mx
	QV91/RZPdN1JyN0Qa9Xv9BWr4GCaa9JlDz2aF6tsYhRnztON1WgGraQjkEM0g5YQN/HCWnA8aXN
	3Y7qDP1f53ZcxxLqz3hvvoKTsofsweceUloVN54rpIod1l7NMBsNGyuniJN6BNmzbHkHd7cxexH
	xBBE9td304wKSQxgCIt2CZxNrsV6YsKbsFXd/1+USmei9XWpX0hRnKpEyRK9sftgwipsv3DYgLd
	PuupPp8guo9cbcw+R1iukr5AYNjD3jSng3Z4ias7wSFm6W2mpDhJ24oSpdqazV/rtZt3zk3Omfy
	Mb7/455Iq9Du7JmqIBIYJCyN7pyL69g==
X-Google-Smtp-Source: AGHT+IGiatYdBiQIlX08WDb3q8TgWhNu9cU7pZ5BZYgWH52vQcA/WE9cIPHsPYf1nJo7amAILSvRZA==
X-Received: by 2002:a05:6000:40dd:b0:3a4:d6ed:8df8 with SMTP id ffacd0b85a97d-3c5dc734927mr8857444f8f.39.1756126509927;
        Mon, 25 Aug 2025 05:55:09 -0700 (PDT)
Received: from [192.168.0.24] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b57487910sm107774225e9.15.2025.08.25.05.55.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 05:55:09 -0700 (PDT)
Message-ID: <64a93c4a-5619-4208-9e9f-83848206d42b@linaro.org>
Date: Mon, 25 Aug 2025 15:55:07 +0300
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
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <9f13df6f-3b76-4d02-aa74-40b913f37a8a@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_055512_315641_C87B9F8D 
X-CRM114-Status: GOOD (  42.15  )
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



On 8/4/25 16:26, David Hildenbrand wrote:
> On 04.08.25 15:03, Eugen Hristev wrote:
>>
>>
>> On 8/4/25 15:49, David Hildenbrand wrote:
>>> On 04.08.25 14:29, Eugen Hristev wrote:
>>>>
>>>>
>>>> On 8/4/25 15:18, David Hildenbrand wrote:
>>>>> On 04.08.25 13:06, Eugen Hristev wrote:
>>>>>>
>>>>>>
>>>>>> On 8/4/25 13:54, Michal Hocko wrote:
>>>>>>> On Wed 30-07-25 16:04:28, David Hildenbrand wrote:
>>>>>>>> On 30.07.25 15:57, Eugen Hristev wrote:
>>>>>>> [...]
>>>>>>>>> Yes, registering after is also an option. Initially this is how I
>>>>>>>>> designed the kmemdump API, I also had in mind to add a flag, but, after
>>>>>>>>> discussing with Thomas Gleixner, he came up with the macro wrapper idea
>>>>>>>>> here:
>>>>>>>>> https://lore.kernel.org/lkml/87ikkzpcup.ffs@tglx/
>>>>>>>>> Do you think we can continue that discussion , or maybe start it here ?
>>>>>>>>
>>>>>>>> Yeah, I don't like that, but I can see how we ended up here.
>>>>>>>>
>>>>>>>> I also don't quite like the idea that we must encode here what to include in
>>>>>>>> a dump and what not ...
>>>>>>>>
>>>>>>>> For the vmcore we construct it at runtime in crash_save_vmcoreinfo_init(),
>>>>>>>> where we e.g., have
>>>>>>>>
>>>>>>>> VMCOREINFO_STRUCT_SIZE(pglist_data);
>>>>>>>>
>>>>>>>> Could we similar have some place where we construct what to dump similarly,
>>>>>>>> just not using the current values, but the memory ranges?
>>>>>>>
>>>>>>> All those symbols are part of kallsyms, right? Can we just use kallsyms
>>>>>>> infrastructure and a list of symbols to get what we need from there?
>>>>>>>
>>>>>>> In other words the list of symbols to be completely external to the code
>>>>>>> that is defining them?
>>>>>>
>>>>>> Some static symbols are indeed part of kallsyms. But some symbols are
>>>>>> not exported, for example patch 20/29, where printk related symbols are
>>>>>> not to be exported. Another example is with static variables, like in
>>>>>> patch 17/29 , not exported as symbols, but required for the dump.
>>>>>> Dynamic memory regions are not have to also be considered, have a look
>>>>>> for example at patch 23/29 , where dynamically allocated memory needs to
>>>>>> be registered.
>>>>>>
>>>>>> Do you think that I should move all kallsyms related symbols annotation
>>>>>> into a separate place and keep it for the static/dynamic regions in place ?
>>>>>
>>>>> If you want to use a symbol from kmemdump, then make that symbol
>>>>> available to kmemdump.
>>>>
>>>> That's what I am doing, registering symbols with kmemdump.
>>>> Maybe I do not understand what you mean, do you have any suggestion for
>>>> the static variables case (symbols not exported) ?
>>>
>>> Let's use patch #20 as example:
>>>
>>> What I am thinking is that you would not include "linux/kmemdump.h" and
>>> not leak all of that KMEMDUMP_ stuff in all these files/subsystems that
>>> couldn't less about kmemdump.
>>>
>>> Instead of doing
>>>
>>> static struct printk_ringbuffer printk_rb_dynamic;
>>>
>>> You'd do
>>>
>>> struct printk_ringbuffer printk_rb_dynamic;
>>>
>>> and have it in some header file, from where kmemdump could lookup the
>>> address.
>>>
>>> So you move the logic of what goes into a dump from the subsystems to
>>> the kmemdump core.
>>>
>>
>> That works if the people maintaining these systems agree with it.
>> Attempts to export symbols from printk e.g. have been nacked :
>>
>>   https://lore.kernel.org/all/20250218-175733-neomutt-senozhatsky@chromium.org/
> 
> Do you really need the EXPORT_SYMBOL?
> 
> Can't you just not export symbols, building the relevant kmemdump part 
> into the core not as a module.
> 
> IIRC, kernel/vmcore_info.c is never built as a module, as it also 
> accesses non-exported symbols.

Hello David,

I am looking again into this, and there are some things which in my
opinion would be difficult to achieve.
For example I looked into my patch #11 , which adds the `runqueues` into
kmemdump.

The runqueues is a variable of `struct rq` which is defined in
kernel/sched/sched.h , which is not supposed to be included outside of
sched.
Now moving all the struct definition outside of sched.h into another
public header would be rather painful and I don't think it's a really
good option (The struct would be needed to compute the sizeof inside
vmcoreinfo). Secondly, it would also imply moving all the nested struct
definitions outside as well. I doubt this is something that we want for
the sched subsys. How the subsys is designed, out of my understanding,
is to keep these internal structs opaque outside of it.

From my perspective it's much simpler and cleaner to just add the
kmemdump annotation macro inside the sched/core.c as it's done in my
patch. This macro translates to a noop if kmemdump is not selected.

How do you see this done another way ?

> 
>>
>> So I am unsure whether just removing the static and adding them into
>> header files would be more acceptable.
>>
>> Added in CC Cristoph Hellwig and Sergey Senozhatsky maybe they could
>> tell us directly whether they like or dislike this approach, as kmemdump
>> would be builtin and would not require exports.
>>
>> One other thing to mention is the fact that the printk code dynamically
>> allocates memory that would need to be registered. There is no mechanism
>> for kmemdump to know when this process has been completed (or even if it
>> was at all, because it happens on demand in certain conditions).
> 
> If we are talking about memblock allocations, they sure are finished at 
> the time ... the buddy is up.
> 
> So it's just a matter of placing yourself late in the init stage where 
> the buddy is already up and running.
> 
> I assume dumping any dynamically allocated stuff through the buddy is 
> out of the picture for now.
> 

The dumping mechanism needs to work for dynamically allocated stuff, and
right now, it works for e.g. printk, if the buffer is dynamically
allocated later on in the boot process.

To have this working outside of printk, it would be required to walk
through all the printk structs/allocations and select the required info.
Is this something that we want to do outside of printk ? E.g. for the
printk panic-dump case, the whole dumping is done by registering a
dumper that does the job inside printk. There is no mechanism walking
through printk data in another subsystem (in my example, pstore).
So for me it is logical to register the data inside the printk.

Does this make sense ?


