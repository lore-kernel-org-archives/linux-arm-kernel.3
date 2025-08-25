Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B5BCA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 15:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pDTMpOHUU+5woUIgWQOxnynpQcS2ptNxqXsiFnt7QfQ=; b=QTwEV/47cB0z3VmFD54lz4TTXe
	XkzLLfWOwLBYg/uSsniaPazOhPidR5w9rMWKmLhBktf/jDsG+/BMTIOzqfjEoBdFLBVz05yrterGl
	G7JOnJtyG4bvzdT8m1fcbSXCN37TWtPxdRf3AWQXbNepHqzaRbR+onmGeRLK3Nd+TD15Cm1rsdb2s
	3aXfRv/sRg7Aly8rxKm/NRRPTKzmilzvY8YPPsDBFATJjIPpmlaFaANBLJvsllUoNVcknD5ZDjNQB
	zILRwTDcuL8dclzNFJrOsdNnqty7tQhZHWhPZQsVeFYwnHbUCL5vvrjv4J5K1W4p0SpHc1Il50Fft
	utT8AkVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYgo-00000008Nks-1NwT;
	Mon, 25 Aug 2025 15:00:54 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqXNW-000000086OI-0W54
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 13:36:55 +0000
Received: by mail-ed1-x543.google.com with SMTP id 4fb4d7f45d1cf-6188b5ad4f0so6126692a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 06:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756129012; x=1756733812; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pDTMpOHUU+5woUIgWQOxnynpQcS2ptNxqXsiFnt7QfQ=;
        b=tfrrggVhEPc5BadVskfc3zWf4oalAIK9d/if2bV899VlhFptVanYmttwUB9nscY1Rm
         PSTGbWOvUML5IYoSlnti3ZVVPBYlpT+/XOtusDEGTfYYKC05AqexTh/uiGJDlME8s3BE
         eytJQaZZHpAUfogqgPQw0NCjqs1TuTkNpphvIsVPDd0Dkb/nhs7uolqSVa/X8/J3gfZ+
         HRuxRDsnaxhwLauP5PrVJbRRsfKg/0WB3Lmr5FHCN0rJll84nRn+3xHP9Jwrf39toAeP
         MbsgFmIMUMmANqqD/zdXiIjspz3C1RgkSO0TKiLG2IbOCEa26CjHVTZtvncbCu7n9Kjc
         3R5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756129012; x=1756733812;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pDTMpOHUU+5woUIgWQOxnynpQcS2ptNxqXsiFnt7QfQ=;
        b=MIfqUE8gKAMWgJ3QSsx34eZwxVHFqfihhvxE2vPILpk2RTp+jguBEMUPpl/b9ODES6
         d/MU+b8Gecouy0yHEjBVFXrNECovdbXWHoKZiDQ1TA+BfowWt4ocpsN0IVrzwSDqQFAv
         njBbGzNUsvXOshLPqQDcEAqXByyMUcrlXru8AOwHNbfbPQ/FbZNSjONaCmx4jzTJXRFs
         lKaU5hS936t6NQi15OpHG46G0WYrdrNEDQDYY3trGjv8mrkj2LqWgq3TceK9QItKcugI
         xPaGXB5AE7bXuw5OtqRKtncpowVcs7QE2z7NKWsNh2Uq9EY7uSIZTJALmVW+IhFSTyNR
         vjEg==
X-Forwarded-Encrypted: i=1; AJvYcCV9JwbuapmJab1aJLJRS4Li6VLyHrR4KgfkXBZ7IS0QJUwXTmF7ZM6FI0qCr7ngNftwSb/I0VsXe6pXnN7Bk6eh@lists.infradead.org
X-Gm-Message-State: AOJu0YwmQlItW1RHNFp0qRPswAdhwGqAijJ+qstPbxZdN36CDie5WhEN
	cGOc5qExkIcw2iAloB70GpQ7V3k/6mszO2fYGKzqChaxYcUhicQmIuxr5v6g9zNKKNA=
X-Gm-Gg: ASbGncv6boqI9//iO2q6Vf96XJ7kUM9WcBnsWh9yuSPVcIITd22De3t3EgH4KoAqabd
	84aAQWq69IIfSq5XAxzgoYnPnAV1blXwLM1IleVCXAZK5BVq9UY/v0nvqZJMZ5lcsUop8rbnmJo
	Ouzoes9zjO7DmGkpv+plh98CN5/AnVpgSknuiUFf9RDKiWfBQtehiQ3xz7Hu2b7hB4Xb56OpGo6
	5TBMHNWEoJpJh6dFPBbThSc06g/hZW1ixYK1J5a4YyRAFRv6GEa4y+zJU84P3H6B3yKlcn308hQ
	y567anW3bmIuA8oRYdSSE9TshMVjquFcnR08UrCn48Y4VGAQhT7yqLKwylwCU4PIPgKOp90srHU
	2b64wNdRv+tv0B9XjLuozSsMPM1DfdQ==
X-Google-Smtp-Source: AGHT+IFLBUsjEEaRTMKTTS5UYe1p7dIIzUWH6NZxIBU0sDo3Xlc4F0hHutvr4vh9c1wWtrm9SoU6bw==
X-Received: by 2002:a17:907:7202:b0:af9:bfef:156b with SMTP id a640c23a62f3a-afe296a7876mr865808766b.59.1756129012418;
        Mon, 25 Aug 2025 06:36:52 -0700 (PDT)
Received: from [192.168.0.24] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe91744c66sm72984966b.88.2025.08.25.06.36.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 06:36:52 -0700 (PDT)
Message-ID: <01c67173-818c-48cf-8515-060751074c37@linaro.org>
Date: Mon, 25 Aug 2025 16:36:50 +0300
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
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <f1f290fc-b2f0-483b-96d5-5995362e5a8b@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_063654_180096_E9A403CE 
X-CRM114-Status: GOOD (  43.09  )
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



On 8/25/25 16:20, David Hildenbrand wrote:
> 
>>>
>>> IIRC, kernel/vmcore_info.c is never built as a module, as it also
>>> accesses non-exported symbols.
>>
>> Hello David,
>>
>> I am looking again into this, and there are some things which in my
>> opinion would be difficult to achieve.
>> For example I looked into my patch #11 , which adds the `runqueues` into
>> kmemdump.
>>
>> The runqueues is a variable of `struct rq` which is defined in
>> kernel/sched/sched.h , which is not supposed to be included outside of
>> sched.
>> Now moving all the struct definition outside of sched.h into another
>> public header would be rather painful and I don't think it's a really
>> good option (The struct would be needed to compute the sizeof inside
>> vmcoreinfo). Secondly, it would also imply moving all the nested struct
>> definitions outside as well. I doubt this is something that we want for
>> the sched subsys. How the subsys is designed, out of my understanding,
>> is to keep these internal structs opaque outside of it.
> 
> All the kmemdump module needs is a start and a length, correct? So the 
> only tricky part is getting the length.

I also have in mind the kernel user case. How would a kernel programmer
want to add some kernel structs/info/buffers into kmemdump such that the
dump would contain their data ? Having "KMEMDUMP_VAR(...)" looks simple
enough.
Otherwise maybe the programmer has to write helpers to compute lengths
etc, and stitch them into kmemdump core.
I am not saying it's impossible, but just tiresome perhaps.

> 
> One could just add a const variable that holds this information, or even 
> better, a simple helper function to calculate that.
> 
> Maybe someone else reading along has a better idea.

This could work, but it requires again adding some code into the
specific subsystem. E.g. struct_rq_get_size()
I am open to ideas , and thank you very much for your thoughts.

> 
> Interestingly, runqueues is a percpu variable, which makes me wonder if 
> what you had would work as intended (maybe it does, not sure).

I would not really need to dump the runqueues. But the crash tool which
I am using for testing, requires it. Without the runqueues it will not
progress further to load the kernel dump.
So I am not really sure what it does with the runqueues, but it works.
Perhaps using crash/gdb more, to actually do something with this data,
would give more insight about its utility.
For me, it is a prerequisite to run crash, and then to be able to
extract the log buffer from the dump.

> 
>>
>>  From my perspective it's much simpler and cleaner to just add the
>> kmemdump annotation macro inside the sched/core.c as it's done in my
>> patch. This macro translates to a noop if kmemdump is not selected.
> 
> I really don't like how we are spreading kmemdump all over the kernel, 
> and adding complexity with __section when really, all we need is a place 
> to obtain a start and a length.
> 

I understand. The section idea was suggested by Thomas. Initially I was
skeptic, but I like how it turned out.

> So we should explore if there is anything easier possible.
> 
>>>
>>>>
>>>> So I am unsure whether just removing the static and adding them into
>>>> header files would be more acceptable.
>>>>
>>>> Added in CC Cristoph Hellwig and Sergey Senozhatsky maybe they could
>>>> tell us directly whether they like or dislike this approach, as kmemdump
>>>> would be builtin and would not require exports.
>>>>
>>>> One other thing to mention is the fact that the printk code dynamically
>>>> allocates memory that would need to be registered. There is no mechanism
>>>> for kmemdump to know when this process has been completed (or even if it
>>>> was at all, because it happens on demand in certain conditions).
>>>
>>> If we are talking about memblock allocations, they sure are finished at
>>> the time ... the buddy is up.
>>>
>>> So it's just a matter of placing yourself late in the init stage where
>>> the buddy is already up and running.
>>>
>>> I assume dumping any dynamically allocated stuff through the buddy is
>>> out of the picture for now.
>>>
>>
>> The dumping mechanism needs to work for dynamically allocated stuff, and
>> right now, it works for e.g. printk, if the buffer is dynamically
>> allocated later on in the boot process.
> 
> You are talking about the memblock_alloc() result, correct? Like
> 
> new_log_buf = memblock_alloc(new_log_buf_len, LOG_ALIGN);
> 
> The current version is always stored in
> 
> static char *log_buf = __log_buf;
> 
> 
> Once early boot is done and memblock gets torn down, you can just use 
> log_buf and be sure that it will not change anymore.
> 
>>
>> To have this working outside of printk, it would be required to walk
>> through all the printk structs/allocations and select the required info.
>> Is this something that we want to do outside of printk ?
> 
> I don't follow, please elaborate.
> 
> How is e.g., log_buf_len_get() + log_buf_addr_get() not sufficient, 
> given that you run your initialization after setup_log_buf() ?
> 
> 

My initial thought was the same. However I got some feedback from Petr
Mladek here :

https://lore.kernel.org/lkml/aBm5QH2p6p9Wxe_M@localhost.localdomain/

Where he explained how to register the structs correctly.
It can be that setup_log_buf is called again at a later time perhaps.

