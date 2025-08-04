Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20468C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 11:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AbCL33p6FgXvGTA+R2ME1gzKoUWjtIJjxxkRY3HfTrM=; b=18wrXShQRlBnQZOPoq+AaIxZJX
	ruP6h1pdr8Q9aySpIe6grWLvkNX0OWs83GDyErbBAadH5tIFqduTPalKcbWHcQ8pjkmnPSI7aq6Ll
	/KnaOd634c/Ei2oGUTPlc36B3lur9TNxZsvn2wRLK5isM7L03+ke0T7NS5WI1cujwbL2cc5tzP9II
	DXsc8qQzVDWPIXNj6e5eCtDHC12zdiNWLx9M3cYNrX7yxMX4tbSxzFyh5vkiqnTgT0CAL2ou83jrR
	LC3FqVoa8wb338148NKCQVnYnStaqje8r+W39g0mfm2dEPKhTC7GG17nfg8zp6iCzeimMlHTsAbze
	rrYCSFPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uitIn-0000000AHrB-0tDl;
	Mon, 04 Aug 2025 11:24:25 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uit1D-0000000AFhR-36Pi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 11:06:17 +0000
Received: by mail-ej1-x644.google.com with SMTP id a640c23a62f3a-af93150f7c2so528276566b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Aug 2025 04:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754305574; x=1754910374; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AbCL33p6FgXvGTA+R2ME1gzKoUWjtIJjxxkRY3HfTrM=;
        b=yJkl1Avp4l1or2ECskK6KZYWZW7aQUL0wibrSLPREJnIAseMxRufZDXBtfSfJjX/hq
         xrpiN+S42T5G3PQPiCSghbou8LvfECfmRVLA3/VcW9HOtaxOFtGktJ+aopybV+/YNAFy
         9NHiM46xGeCGESKcir9ku8DYb5L8jpoSfGrW1ZNtnugb7c054c/GnfytUwGy6VAhVTpk
         pHYWoMPVWjgpWINzSpZhzssyhyRDZCpzRH45id0VECXk0Cjcr9q9c3aBMJ2Qn/dTIZTR
         wQ8sLJNG9RtgZjKeAjHoCYSuxsvrH5A217rxq3wSlsgqyLk9Cbnhi25qHfe6vOpHtdOr
         BKtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754305574; x=1754910374;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AbCL33p6FgXvGTA+R2ME1gzKoUWjtIJjxxkRY3HfTrM=;
        b=IEQbzUks6vNtrttlTCfZVBdYE3UV3jZIS/uIJ9Dixkw6qEp+FUbxwkjBtiObWB01Sp
         D7AzUGETT7dN5bVpcUAn0x+6IUMPnAkjKtMhJ0Wy8s0dW65gN8kNinOfyVMK0uwX9UWK
         P/JCjjv2YTdjSt9AnzyGFuHR92rrVASgJmvvEET7fZawhR4urgpQv+RP06c+JwcX/ds4
         O0oG5JEmEIL4nPE2FGOsYFiiHxkb0+S2DHTwbG0FTFYSz7YO3u8VLT9Oun+JVoORQkJa
         i5cukiWUPqh0/K8/HZQS8lUNsx1rjzYbzZ4+H+hkq2A8X8VDoeSWcpPK9FfOMtW6kZ+3
         2/+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUEqYvR5toFJF4+/YF7++GnXU7VjQZEJvIYlgozs1lKmNs5Ks/EcXersaHNK3OBjYoOenkjvp20LXgIWX831rNM@lists.infradead.org
X-Gm-Message-State: AOJu0YwuBdaohK0KJaqkywlE6n9qB5XEZxlsYjIDVSuMYVKnZO+TRTxA
	+CA6rsYXV0Kf/Hx7gCT6iRLLmkAI5gE9bUZBi2YpKFShNQVTmuHg+eP675JDfReb3ys=
X-Gm-Gg: ASbGnctio23b4YNW/pW5peFvMMqMZ3JaowWVT3crMpv79u5NPmN5mQoBabahO+gfqID
	+bMG6BwTw7lC6jOl1IP3lLBokSq8AcRakjnGE9rKqvXHS6StN+itPan8NfxpU1ywgvPALMBW1nn
	R0ZYT8erppx35eMXKu2szlwguiFxyJpPz+8C+HIc9ByiE2r8hbfLRBH8YCr7SBujMLd3mvHuBX6
	JhvgWQWIau4TEXpHQY3uX34wWQDnYhQvoY6L3Jgl8gJWCT9h6Mbs6i6aTQeL0xZ9DjG0OaYV57o
	iG379IL4YfodzkFQWlMBc3Vu+B0fARgNd+ydC3Cm15aIZtDk25JS2vxi7cQU8MP+D3kU+uGpiKf
	1pyjtXfUZlTdAFO8tp1Ku1m185cuddQ==
X-Google-Smtp-Source: AGHT+IE4XPeXZCbPPTnUeGFh37dBHmQZ35wpgsW3hiGwLGtsXzKowOSWjqCke7T73Fj9hT1fEebjmg==
X-Received: by 2002:a17:907:3f2a:b0:ae3:8c9b:bd61 with SMTP id a640c23a62f3a-af93ffa2d63mr907152566b.12.1754305573593;
        Mon, 04 Aug 2025 04:06:13 -0700 (PDT)
Received: from [192.168.0.33] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a076409sm721053666b.12.2025.08.04.04.06.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 04:06:13 -0700 (PDT)
Message-ID: <e2c031e8-43bd-41e5-9074-c8b1f89e04e6@linaro.org>
Date: Mon, 4 Aug 2025 14:06:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v2 22/29] mm/numa: Register information into Kmemdump
To: Michal Hocko <mhocko@suse.com>, David Hildenbrand <david@redhat.com>
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
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <aJCRgXYIjbJ01RsK@tiehlicka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_040615_795267_FAB2A7DA 
X-CRM114-Status: GOOD (  18.98  )
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



On 8/4/25 13:54, Michal Hocko wrote:
> On Wed 30-07-25 16:04:28, David Hildenbrand wrote:
>> On 30.07.25 15:57, Eugen Hristev wrote:
> [...]
>>> Yes, registering after is also an option. Initially this is how I
>>> designed the kmemdump API, I also had in mind to add a flag, but, after
>>> discussing with Thomas Gleixner, he came up with the macro wrapper idea
>>> here:
>>> https://lore.kernel.org/lkml/87ikkzpcup.ffs@tglx/
>>> Do you think we can continue that discussion , or maybe start it here ?
>>
>> Yeah, I don't like that, but I can see how we ended up here.
>>
>> I also don't quite like the idea that we must encode here what to include in
>> a dump and what not ...
>>
>> For the vmcore we construct it at runtime in crash_save_vmcoreinfo_init(),
>> where we e.g., have
>>
>> VMCOREINFO_STRUCT_SIZE(pglist_data);
>>
>> Could we similar have some place where we construct what to dump similarly,
>> just not using the current values, but the memory ranges?
> 
> All those symbols are part of kallsyms, right? Can we just use kallsyms
> infrastructure and a list of symbols to get what we need from there?
> 
> In other words the list of symbols to be completely external to the code
> that is defining them?

Some static symbols are indeed part of kallsyms. But some symbols are
not exported, for example patch 20/29, where printk related symbols are
not to be exported. Another example is with static variables, like in
patch 17/29 , not exported as symbols, but required for the dump.
Dynamic memory regions are not have to also be considered, have a look
for example at patch 23/29 , where dynamically allocated memory needs to
be registered.

Do you think that I should move all kallsyms related symbols annotation
into a separate place and keep it for the static/dynamic regions in place ?

Thanks for looking into my patch,
Eugen

