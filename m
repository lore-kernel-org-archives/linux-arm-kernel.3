Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DDBEC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 13:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Xhhf7HOlGHP/+Ew73mE+84gy9qClegxqAGKGx6kZAE=; b=nARGgGWTzDP3R1ug1qaiGYxYhn
	koLjf7XxLmxOja7I4X34D3TFaVGPg22bX4ZKJeSyJoZGhAI7BOJ7ql7TCXAHcJD4KOkKXheacvL3V
	+SvfoAszLnBnWKxT0hpCDNegFDZe2ucGuTTgJleRRI30RhpD5Udpb/zAYHhyhMgQJDORuQfNO/EP8
	YPMbZ981eApS4JK8xCI3okKIBOphFk7B7DDbM1WomijJvP8noDF+DHKgVFcRMD9vKFijAYF+E74+9
	2ghaNVC7r1Y8O5wwqjV9SwQ8HYBZ6Gz+Px49ExTXzSkRsy2TVA3Zw/5bWOzUSWHvmRKGOnKEqJhrc
	Chu8+AxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiuwd-0000000AUqr-1Fes;
	Mon, 04 Aug 2025 13:09:39 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiudb-0000000AQkm-1btZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 12:50:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754311798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+Xhhf7HOlGHP/+Ew73mE+84gy9qClegxqAGKGx6kZAE=;
	b=TgV00bXK9aPS6j5TcKnUxRcbB7nBAcRAjkKTQd2BqJpTh1z1Qv70ogjpKF5RyUFN5XjD7/
	kfW13qm+qBCIstnIHh7uvoqutw+4IWoW96asL3mi+Hd1xJraHD13rEM0wu1FAP5V21Vcul
	m0GeU1BUSLVlj+dLf7hcf5YTZvjM1tQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-nJdO0h7fPBCs7Hxrya8qfw-1; Mon, 04 Aug 2025 08:49:56 -0400
X-MC-Unique: nJdO0h7fPBCs7Hxrya8qfw-1
X-Mimecast-MFC-AGG-ID: nJdO0h7fPBCs7Hxrya8qfw_1754311796
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3b78c983014so1067822f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Aug 2025 05:49:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754311796; x=1754916596;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+Xhhf7HOlGHP/+Ew73mE+84gy9qClegxqAGKGx6kZAE=;
        b=i1XSEQzhX4Chp+nvyABm7g0GfqbD3C0y1PxpeFMX4cOX1x9tkAesgxLLC1a8/W5ho2
         Jv7c5ox4zKa4INo7XJWysx9gWI1umBzaf/qfjTkmun0zg0wALEUnK3JDIs65L4HwZ9lO
         s2j/uIYhmVMgN/osqv4c0mjF7xjS9oHcNUmvE8ZLfYUgzGrAE4lDxHfQsix/7FuwoMoM
         e4xAlr5mVKUTdIg9m2TPVtuFrL0Ff4sgDLxgzgjyfRzihWi+yR4Xpfz+Me417o0naXFM
         tMLKEaudDCFX7tMeOK+nBYM7iJRpnhML8+qlJjrTeMrxE/wkHqV0uIEDJuL32C6kY/p2
         QZqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTrbcVjZYc7Nc9h4AuzJ05pxGiVriqVhbuaqQQqQXwhBTgJlKqZUo8g5Kf+rWAXjL7yf03LTgwud1KpoQEpIze@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1g2K+h+MiG/fJq8WET5tDTQovojjtn2VjJNfeRyhNjFa21lZ2
	nqf5UqhLrfUQUAoR5RSIDNhupAXwGJ3Pbqs0P34xY7ttXwiyukAq3U76K7/NEK9mzTpMChrqmnO
	8rpL6MnlUbfvHydlQCr3tFSWoD6TDUg29G7I7YgWYDrF5vly9BBBVxD+iSooWj1TCD42OUlwoIc
	zr
X-Gm-Gg: ASbGncu+DaM/qEHgET8Kqh9Uuw6RRS5TeRt5F8M2uHihwffDhkxmyLALm2l5iSOi/aO
	SclDRhDflL4+DBZlScrDjh88LrTSHJpVfvrFdzsA4Hc1d7EDQeS5te9osvirKCDSYlk2FJuhMD/
	q5fQDSzfThQaDH0hrpf9GTyEPLYARY+Wr7Bd5ZBk1kdyBmiDG0kFYyyIt5YPIeYSEHxlAEFiYuk
	xh397Kj3Cl8MCkBdWab9AUnp6j0QcBYpzyrzEtBAowrexHFaZ0Qo0PhXNH5IWU/BT5bPAE9wT1S
	9mszyAfKY3TFHHvXCpGeVTevZUjQc3Tr9ApJFrRxRpieKUa2h2N/3a/mhGSXln2IuDjpkPrueRG
	PFMYjQ/Kg4zAIUGCqrgoAhq3eVA9G31+1CkokRBDqLSgGFiAj+EJdcxV0FQot3HJ5QL4=
X-Received: by 2002:a5d:584c:0:b0:3a6:ec1d:1cba with SMTP id ffacd0b85a97d-3b8d947083emr7216516f8f.20.1754311795510;
        Mon, 04 Aug 2025 05:49:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFXgDt/YpWGgP2V8sWDg7uI7r5JelqiIRnbxs/Y/QppAtTZ4vWQf600coJVI3Z9N9Z5dRAbg==
X-Received: by 2002:a5d:584c:0:b0:3a6:ec1d:1cba with SMTP id ffacd0b85a97d-3b8d947083emr7216499f8f.20.1754311795008;
        Mon, 04 Aug 2025 05:49:55 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f0e:2c00:d6bb:8859:fbbc:b8a9? (p200300d82f0e2c00d6bb8859fbbcb8a9.dip0.t-ipconnect.de. [2003:d8:2f0e:2c00:d6bb:8859:fbbc:b8a9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589edf56e0sm169284285e9.1.2025.08.04.05.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 05:49:54 -0700 (PDT)
Message-ID: <77d17dbf-1609-41b1-9244-488d2ce75b33@redhat.com>
Date: Mon, 4 Aug 2025 14:49:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v2 22/29] mm/numa: Register information into Kmemdump
To: Eugen Hristev <eugen.hristev@linaro.org>, Michal Hocko <mhocko@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org, tglx@linutronix.de,
 andersson@kernel.org, pmladek@suse.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 corbet@lwn.net, mojha@qti.qualcomm.com, rostedt@goodmis.org,
 jonechou@google.com, tudor.ambarus@linaro.org
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
 <20250724135512.518487-23-eugen.hristev@linaro.org>
 <ffc43855-2263-408d-831c-33f518249f96@redhat.com>
 <e66f29c2-9f9f-4b04-b029-23383ed4aed4@linaro.org>
 <751514db-9e03-4cf3-bd3e-124b201bdb94@redhat.com>
 <aJCRgXYIjbJ01RsK@tiehlicka>
 <e2c031e8-43bd-41e5-9074-c8b1f89e04e6@linaro.org>
 <23e7ec80-622e-4d33-a766-312c1213e56b@redhat.com>
 <f43a61b4-d302-4009-96ff-88eea6651e16@linaro.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <f43a61b4-d302-4009-96ff-88eea6651e16@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: stV-S7DrpvX3A_tajz5r_ltceXvLqSI4SAXgl9R59QM_1754311796
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_054959_500454_CF3F3465 
X-CRM114-Status: GOOD (  23.53  )
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

On 04.08.25 14:29, Eugen Hristev wrote:
> 
> 
> On 8/4/25 15:18, David Hildenbrand wrote:
>> On 04.08.25 13:06, Eugen Hristev wrote:
>>>
>>>
>>> On 8/4/25 13:54, Michal Hocko wrote:
>>>> On Wed 30-07-25 16:04:28, David Hildenbrand wrote:
>>>>> On 30.07.25 15:57, Eugen Hristev wrote:
>>>> [...]
>>>>>> Yes, registering after is also an option. Initially this is how I
>>>>>> designed the kmemdump API, I also had in mind to add a flag, but, after
>>>>>> discussing with Thomas Gleixner, he came up with the macro wrapper idea
>>>>>> here:
>>>>>> https://lore.kernel.org/lkml/87ikkzpcup.ffs@tglx/
>>>>>> Do you think we can continue that discussion , or maybe start it here ?
>>>>>
>>>>> Yeah, I don't like that, but I can see how we ended up here.
>>>>>
>>>>> I also don't quite like the idea that we must encode here what to include in
>>>>> a dump and what not ...
>>>>>
>>>>> For the vmcore we construct it at runtime in crash_save_vmcoreinfo_init(),
>>>>> where we e.g., have
>>>>>
>>>>> VMCOREINFO_STRUCT_SIZE(pglist_data);
>>>>>
>>>>> Could we similar have some place where we construct what to dump similarly,
>>>>> just not using the current values, but the memory ranges?
>>>>
>>>> All those symbols are part of kallsyms, right? Can we just use kallsyms
>>>> infrastructure and a list of symbols to get what we need from there?
>>>>
>>>> In other words the list of symbols to be completely external to the code
>>>> that is defining them?
>>>
>>> Some static symbols are indeed part of kallsyms. But some symbols are
>>> not exported, for example patch 20/29, where printk related symbols are
>>> not to be exported. Another example is with static variables, like in
>>> patch 17/29 , not exported as symbols, but required for the dump.
>>> Dynamic memory regions are not have to also be considered, have a look
>>> for example at patch 23/29 , where dynamically allocated memory needs to
>>> be registered.
>>>
>>> Do you think that I should move all kallsyms related symbols annotation
>>> into a separate place and keep it for the static/dynamic regions in place ?
>>
>> If you want to use a symbol from kmemdump, then make that symbol
>> available to kmemdump.
> 
> That's what I am doing, registering symbols with kmemdump.
> Maybe I do not understand what you mean, do you have any suggestion for
> the static variables case (symbols not exported) ?

Let's use patch #20 as example:

What I am thinking is that you would not include "linux/kmemdump.h" and 
not leak all of that KMEMDUMP_ stuff in all these files/subsystems that 
couldn't less about kmemdump.

Instead of doing

static struct printk_ringbuffer printk_rb_dynamic;

You'd do

struct printk_ringbuffer printk_rb_dynamic;

and have it in some header file, from where kmemdump could lookup the 
address.

So you move the logic of what goes into a dump from the subsystems to
the kmemdump core.

-- 
Cheers,

David / dhildenb


