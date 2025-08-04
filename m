Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 254E3C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 13:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bh2VbEr4+GPS+zCP6PyGLcsH4RZmjBkc+JIVLTQNkVU=; b=QcHxAHyP2WMejgvFJv/v+NiA+w
	nnR8Hu9yxzp/pM7Fh0kBrypdZRXgdvP7Y5UX9ULff/JPPy9n60Ak51eFo5kOMmsR9eV7jxGT0hsJO
	5NFjQoJvkDmDlWN+CkSoFmhufXbDjL8bAwUu7xyRK7v6GtEaWJxwrth7TOwAtHofT17TbYYBYmPvv
	3flqo+XInsszIrhe6POGShoTTvcuEo5e0pqwJBbg/T0AAS9oTtEj4dSJaMhFaL1pNddgQYmLHLb+c
	PyngnOeHhn5D1OarSJjMkh05udaa22BLGCOsNM+aiLxywDMbS7AMwdBgywUKHkne7ObGWuwaqqhyB
	qcxkKEAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiuoq-0000000ASsy-2WPL;
	Mon, 04 Aug 2025 13:01:36 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiuJe-0000000ANNY-1Cve
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 12:29:23 +0000
Received: by mail-ej1-x643.google.com with SMTP id a640c23a62f3a-af949bdf36cso332732266b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Aug 2025 05:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754310561; x=1754915361; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bh2VbEr4+GPS+zCP6PyGLcsH4RZmjBkc+JIVLTQNkVU=;
        b=YL6zl0MHgoYV88ZeTWSxXwX5HP5kTVt0a6FFLGFdPkuwrwst7ZGgmitG7xGlA++6H0
         ZKN2sKkFTzqVVAwaQL5j4VLwzp4y92dzEbAGQgxRcw2kxs8xErS7q5KwDigEM1opi9Ey
         8UNccruUG8qbRs8xn866JGJGKhWnjeTPoBtQDEgt2FQHBgSzKq+O9Oc9zMYIBF/c7/h7
         goyNAM4+7MmtPQKuCUVPL4+rfwRxcxqV3BIvYzN98Z+/mdu8pcUVRPVolW7fKBsx0H3B
         BESPoR9j6bKzoFuexm4hh/kjlyij0LEvEwpgMulrbITKgytj0YotliaEdHxpfggF8saa
         5aKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754310561; x=1754915361;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bh2VbEr4+GPS+zCP6PyGLcsH4RZmjBkc+JIVLTQNkVU=;
        b=qhiTf4EquhEU9FBcrusMrxwCofn5x6MO480UHHd3/S9+zG4CwIexLCk1Ccm+0Ncy10
         7jpZv+xMFU+MH07UNnyzoFiLHr+gOGiaPg+plPy0BEL44sV9cJc7pS/uzyjjuVhc2t8V
         08Js8voPixNPxt/5Hb0KRIdZdV6MIN6ikAh36BTLgpV96Pz7TOZgFzFuaqSRAzJcNzyX
         nplh70TfiV9jL+hy+bIhrKHENEAaiAdq9CZ2R/u+cnabluDAnkE8xSGQ/wI0lZB07CN9
         iyMXa940pp183hJkEhPspcOP2juMsYZfOAThh81J8d/artV9dKh8g7ALy397Cchxv7XD
         Dy2g==
X-Forwarded-Encrypted: i=1; AJvYcCWkZwGMTnuF/VPd7MfOItnwpqv8/haHlRiDZD8UKEcGy4cRU9XMNJN36Fc7isrIP1zbqneN9VBErVd6+BNGQXQf@lists.infradead.org
X-Gm-Message-State: AOJu0YyAiCwa3MCAvsuZYF3vUK2TYP3b2X4GSvgZ8bCCpetGpvLnebiq
	pDeCDR2XJYDXIudU+VwUYpvF1WN87jfceDp07pdRBw+0cv1pJ2E7fmGc9nYkFRC7HY8=
X-Gm-Gg: ASbGncsd6G6NHy204ZmDlBpcnhG3kL4GBJt5aZLfrldHPkF8jXHx4HCUWn3Vck1AgIK
	idQ+zxWv2pnM3+Pe+SY84BluqzpiNEzzC1wgMvSJmEuu1HH/WIVq5c2pf4B6QZ7clfxU1VdWkDB
	MD2p4UhSTh5ya3i7MG7Jb3nUG2E99r2G7DHtLZFF6+dAUpH1gfGmxz8Sagz8z/K8acUTHkrg6wc
	ixjIjkHY8fiJmYbKjbTy+LAXRZjhWlxAep1jIlgkyDT3IdHBZDrsOsjD7tgzrVWm1fYXgEoX7xn
	xzm6Z0+4NbUrsUUO9z21nLzSIWyUtMPZM3n8xFltI/kXiPMFjBc3BDhL6mx2z1A6619/0LHRM9s
	IPzV+sgugwiQ9JjaDVBdgVcpHIlDijw==
X-Google-Smtp-Source: AGHT+IEosZgeKp1ejcWL+SBts1B/aCmksQ8kDwupILaEdVqhNGaIFVMrjj1IxUFnhsLruybLH3boPw==
X-Received: by 2002:a17:906:298c:b0:af9:68d5:118d with SMTP id a640c23a62f3a-af968d534d9mr304131066b.58.1754310560610;
        Mon, 04 Aug 2025 05:29:20 -0700 (PDT)
Received: from [192.168.0.33] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a38aasm730599066b.37.2025.08.04.05.29.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 05:29:20 -0700 (PDT)
Message-ID: <f43a61b4-d302-4009-96ff-88eea6651e16@linaro.org>
Date: Mon, 4 Aug 2025 15:29:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v2 22/29] mm/numa: Register information into Kmemdump
To: David Hildenbrand <david@redhat.com>, Michal Hocko <mhocko@suse.com>
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
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <23e7ec80-622e-4d33-a766-312c1213e56b@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_052922_334777_F74D4C1D 
X-CRM114-Status: GOOD (  21.42  )
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



On 8/4/25 15:18, David Hildenbrand wrote:
> On 04.08.25 13:06, Eugen Hristev wrote:
>>
>>
>> On 8/4/25 13:54, Michal Hocko wrote:
>>> On Wed 30-07-25 16:04:28, David Hildenbrand wrote:
>>>> On 30.07.25 15:57, Eugen Hristev wrote:
>>> [...]
>>>>> Yes, registering after is also an option. Initially this is how I
>>>>> designed the kmemdump API, I also had in mind to add a flag, but, after
>>>>> discussing with Thomas Gleixner, he came up with the macro wrapper idea
>>>>> here:
>>>>> https://lore.kernel.org/lkml/87ikkzpcup.ffs@tglx/
>>>>> Do you think we can continue that discussion , or maybe start it here ?
>>>>
>>>> Yeah, I don't like that, but I can see how we ended up here.
>>>>
>>>> I also don't quite like the idea that we must encode here what to include in
>>>> a dump and what not ...
>>>>
>>>> For the vmcore we construct it at runtime in crash_save_vmcoreinfo_init(),
>>>> where we e.g., have
>>>>
>>>> VMCOREINFO_STRUCT_SIZE(pglist_data);
>>>>
>>>> Could we similar have some place where we construct what to dump similarly,
>>>> just not using the current values, but the memory ranges?
>>>
>>> All those symbols are part of kallsyms, right? Can we just use kallsyms
>>> infrastructure and a list of symbols to get what we need from there?
>>>
>>> In other words the list of symbols to be completely external to the code
>>> that is defining them?
>>
>> Some static symbols are indeed part of kallsyms. But some symbols are
>> not exported, for example patch 20/29, where printk related symbols are
>> not to be exported. Another example is with static variables, like in
>> patch 17/29 , not exported as symbols, but required for the dump.
>> Dynamic memory regions are not have to also be considered, have a look
>> for example at patch 23/29 , where dynamically allocated memory needs to
>> be registered.
>>
>> Do you think that I should move all kallsyms related symbols annotation
>> into a separate place and keep it for the static/dynamic regions in place ?
> 
> If you want to use a symbol from kmemdump, then make that symbol 
> available to kmemdump.

That's what I am doing, registering symbols with kmemdump.
Maybe I do not understand what you mean, do you have any suggestion for
the static variables case (symbols not exported) ?

> 
> IOW, if we were to rip out kmemdump tomorrow, we wouldn't have to touch 
> any non-kmemdump-specific files.
> 


