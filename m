Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42605C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 13:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q47hRQ8aof0UlFDXgmcMzO/kJRO5vpkzZCiWS2hBN/U=; b=pu8AOsRWLREKR3wcinaCjT9mN/
	uZ29jK8+uRwvcE5UqKabWVl57lg8RWwud/qUnipfnn1Y8RwHXE1QC8xL8pGLSN74NRwnftt1ebhS/
	5XsRZh5/ySjndgfolO7mBqwJkWbNsy6dbeETmoRw4vOwPSoaB3IsKYhWuijX62ke3y6QknzIBX3Wt
	Le2P9EaSBLy2f+dnC0FHT3eKGFBolJI9c2Qj86n6uk2eFFYtplwlXz3f0joDHTUT2pqvskPh92SLZ
	bgj67dLPPMzO6GMZ8mHqKisO3UrsDYG20h+5iXN7Y3W2thCwItGsnbNHuySLWEtcleswLNIFQMTZw
	rQnVtTXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiv6m-0000000AWJW-1Q25;
	Mon, 04 Aug 2025 13:20:08 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiuqR-0000000ATHD-2XJp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 13:03:16 +0000
Received: by mail-ed1-x543.google.com with SMTP id 4fb4d7f45d1cf-61576e33ce9so7995682a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Aug 2025 06:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754312594; x=1754917394; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q47hRQ8aof0UlFDXgmcMzO/kJRO5vpkzZCiWS2hBN/U=;
        b=jx4PS0tVPOt4A+luMwcyVC6KZ1MW8CO7+wkUNCRx1DLyaLQ+RfBqT1n0lh6FjroYV0
         8XNFkYRbMNmjvw10mPiZS8HnxYRwj923uqzJP2zCVEA44hJtltG/KV6AbZ98nGuKTnHR
         lpyEimxew+7RgiH0r/FahZt9rvL0BH5nz+vt2tYcBcoaMaGARoiOEpWuXL/OmV9CipGp
         1G2UVO6NEhGMpx/y57bAw0zZJWbMw9pELAJx3Hq23qOi6YaqVoxw48mmErYtZIMBcHa3
         U/whA8lcpe1OhDTLbHKZUXL3+xv3ARDnvoX17CkoXN+M0oV3ykXDV6UZYekyrPCmFoMS
         UvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754312594; x=1754917394;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q47hRQ8aof0UlFDXgmcMzO/kJRO5vpkzZCiWS2hBN/U=;
        b=o8YZhFEt3YVTW0DIc9Ond9t7i7MIV+MGgYUdIMovuwFBOIYv0g3Gq2jRruMT1DKdG+
         6Mdvpjlq1doPZzIiwhOHEkA4Mq9zvw1TT1FzQpQ8K6M+o/yMG7XkFQNNIKjMFEaZgpDd
         zSE0ma40oTCcmMG/DdDz6qftwBAlp0GtPfuQSV6C4RocGKvFnV9QRW+eqNnwZ14qWRHm
         /aywHVUOKwPgcwCkQ06LxUVVr93B3DFI9DldhD9pzbDg1ewmPyWWI+tEHFR/z//ZL9OI
         wtMG/7gt8c6hAsRw+0qXfE89Y1uUaao+rQpjoLsLYParip1FxNUK3lHMVUEZwCNLT/7V
         /osA==
X-Forwarded-Encrypted: i=1; AJvYcCXiN5i875mraeQKw3Iy1x/KXnjCuqwM7jQsaRfcQXjURtvqDWMNMv9Wzwr5xgWUaSGz0SUipn8bj32yJk5kCavk@lists.infradead.org
X-Gm-Message-State: AOJu0YxIoMAFh5PAd1EMfDuwdZuawvhH/i9lkdUKgNrZX9Cv8ntl60PD
	eN0OptBI1NZdmH23mmB4ELpb8meP81O5lLtQbERvTlC9+vXGJ61lzCt9BSexav/iuW4=
X-Gm-Gg: ASbGncsAtuzx1wn9R7EBvUc9SG9AHrHwQ1lOPCRpPyzkJcM3ugtiGJFz5a7CMdcXzo6
	GdL4wHcWLSrI6pzfFK34ffqk3HLzc4MsuVykafZXZfhA19swVMZ1WlHwvmYWKZIjx8+Q2jXiAOd
	AgmyCWykbPwqRFd/ugIuuXfpk4tyxzvABr8pAGdGZG41x9zykrPenKR1xLMsDExInZPqHa2R1oz
	ifEjrfaYAqxfoCv6hT6mX/6ci34JGgyZmuzuRakPqQRKzIos4zIfj3e9zBOHUaLuu3rBeQcBj+E
	TT0yMrzdfYlXJ8tIuOSQnB2pE94HyUJX4PSJUOGlE/NME0scED5yrql2K8N7vlUSLjanjAJMmko
	EIrs1oEE14teJ+i9rX0ZjLdRTCE4/JQ==
X-Google-Smtp-Source: AGHT+IGvSWWoom5PCcQotC2cJOEy0b1eBZ0+mNZIcNqIApwylioSaULTySuV/h+PeeW7g5S3kYnbAQ==
X-Received: by 2002:a05:6402:27cc:b0:607:35d:9fb4 with SMTP id 4fb4d7f45d1cf-615e5e52361mr8637535a12.15.1754312593561;
        Mon, 04 Aug 2025 06:03:13 -0700 (PDT)
Received: from [192.168.0.33] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8effda1sm6755395a12.1.2025.08.04.06.03.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 06:03:13 -0700 (PDT)
Message-ID: <ecd33fa3-8362-48f0-b3c2-d1a11d8b02e3@linaro.org>
Date: Mon, 4 Aug 2025 16:03:10 +0300
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
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <77d17dbf-1609-41b1-9244-488d2ce75b33@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_060315_674239_15E6B3D7 
X-CRM114-Status: GOOD (  30.65  )
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



On 8/4/25 15:49, David Hildenbrand wrote:
> On 04.08.25 14:29, Eugen Hristev wrote:
>>
>>
>> On 8/4/25 15:18, David Hildenbrand wrote:
>>> On 04.08.25 13:06, Eugen Hristev wrote:
>>>>
>>>>
>>>> On 8/4/25 13:54, Michal Hocko wrote:
>>>>> On Wed 30-07-25 16:04:28, David Hildenbrand wrote:
>>>>>> On 30.07.25 15:57, Eugen Hristev wrote:
>>>>> [...]
>>>>>>> Yes, registering after is also an option. Initially this is how I
>>>>>>> designed the kmemdump API, I also had in mind to add a flag, but, after
>>>>>>> discussing with Thomas Gleixner, he came up with the macro wrapper idea
>>>>>>> here:
>>>>>>> https://lore.kernel.org/lkml/87ikkzpcup.ffs@tglx/
>>>>>>> Do you think we can continue that discussion , or maybe start it here ?
>>>>>>
>>>>>> Yeah, I don't like that, but I can see how we ended up here.
>>>>>>
>>>>>> I also don't quite like the idea that we must encode here what to include in
>>>>>> a dump and what not ...
>>>>>>
>>>>>> For the vmcore we construct it at runtime in crash_save_vmcoreinfo_init(),
>>>>>> where we e.g., have
>>>>>>
>>>>>> VMCOREINFO_STRUCT_SIZE(pglist_data);
>>>>>>
>>>>>> Could we similar have some place where we construct what to dump similarly,
>>>>>> just not using the current values, but the memory ranges?
>>>>>
>>>>> All those symbols are part of kallsyms, right? Can we just use kallsyms
>>>>> infrastructure and a list of symbols to get what we need from there?
>>>>>
>>>>> In other words the list of symbols to be completely external to the code
>>>>> that is defining them?
>>>>
>>>> Some static symbols are indeed part of kallsyms. But some symbols are
>>>> not exported, for example patch 20/29, where printk related symbols are
>>>> not to be exported. Another example is with static variables, like in
>>>> patch 17/29 , not exported as symbols, but required for the dump.
>>>> Dynamic memory regions are not have to also be considered, have a look
>>>> for example at patch 23/29 , where dynamically allocated memory needs to
>>>> be registered.
>>>>
>>>> Do you think that I should move all kallsyms related symbols annotation
>>>> into a separate place and keep it for the static/dynamic regions in place ?
>>>
>>> If you want to use a symbol from kmemdump, then make that symbol
>>> available to kmemdump.
>>
>> That's what I am doing, registering symbols with kmemdump.
>> Maybe I do not understand what you mean, do you have any suggestion for
>> the static variables case (symbols not exported) ?
> 
> Let's use patch #20 as example:
> 
> What I am thinking is that you would not include "linux/kmemdump.h" and 
> not leak all of that KMEMDUMP_ stuff in all these files/subsystems that 
> couldn't less about kmemdump.
> 
> Instead of doing
> 
> static struct printk_ringbuffer printk_rb_dynamic;
> 
> You'd do
> 
> struct printk_ringbuffer printk_rb_dynamic;
> 
> and have it in some header file, from where kmemdump could lookup the 
> address.
> 
> So you move the logic of what goes into a dump from the subsystems to
> the kmemdump core.
> 

That works if the people maintaining these systems agree with it.
Attempts to export symbols from printk e.g. have been nacked :

 https://lore.kernel.org/all/20250218-175733-neomutt-senozhatsky@chromium.org/

So I am unsure whether just removing the static and adding them into
header files would be more acceptable.

Added in CC Cristoph Hellwig and Sergey Senozhatsky maybe they could
tell us directly whether they like or dislike this approach, as kmemdump
would be builtin and would not require exports.

One other thing to mention is the fact that the printk code dynamically
allocates memory that would need to be registered. There is no mechanism
for kmemdump to know when this process has been completed (or even if it
was at all, because it happens on demand in certain conditions).

Thanks !


