Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A8AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 14:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g7iBLKI/TaFFZvOKdERySTto1DEdoOqdcbn/lUOJJc0=; b=pTt2D6n/5JUw9GT7ik54Bvn+QZ
	5kNPE/vIqBGfYgsh/RxH0tSzKgZaz4RYYmPk/mQyA8qqWejpR6D2D3wzkUR1LRCSfcXfN7xOrGp4L
	zkT3iXUFdfWiMSHBk802q7nivKCWltYzjfKAWzEuUByEZ8A8DCbbMjRw0Ds3AiaIN9j2i9pZ4xKWC
	t/bn7p6wc7I22fAVsY/oQx9eZ5j2+dww6AObHtjd+jJMXpnU6F5CEhYTYty4F4ayS2oEC4AOj022y
	/yXESyEbEBOTDK6GizeQWg/Di2WCEWl5mo4PiqJo/SxZXlw+4/QnSRBgYzOD6/jJ7phETpxj4viEr
	TGgqNDOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdpm-000000057dI-12BS;
	Fri, 20 Dec 2024 14:18:30 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdnu-000000057IR-3muB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 14:16:36 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2156e078563so18008655ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 06:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734704194; x=1735308994; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g7iBLKI/TaFFZvOKdERySTto1DEdoOqdcbn/lUOJJc0=;
        b=XjYKBji+3IPrhsWD/ViClkPtQceu5eSMI3svx/Fn0ropa8Y6emzz5sDm9sTBW6oZi6
         UorgrtMSTtfdDqOZKNtkLSNpKZB3AVEWF4cG2dlNUheyWPa7a8aZH79oXYqpKbNYNF4r
         89iioUa9IXRHjCg2RRe3hMD+/26y8CoOoo3MMRy+Er2eddW8xU2G7/4iY4xN/kg4abXs
         rQCaflyhaPFdxXPO0Q7Y85ZDB8VXGa7tAoRDsv8NgtJfXE8tkRxDlE0EM9Fks3gTdGnV
         6uoPzUEKXzwkPT8ut6jWvgoFmlCIOKXxhXFukdAvt8CvayKMnXo2iDD8j+Rjl1pKAN0u
         xPAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734704194; x=1735308994;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g7iBLKI/TaFFZvOKdERySTto1DEdoOqdcbn/lUOJJc0=;
        b=iq/F99pWaxJOYsVBj8bH8wnIwTwAmAJRv3oZwzAW0cIZgPPfKLIVwx2EqavlMX7og0
         jp0jlbUy/orB7u3dda2Ipt6Me3y31rxbORnNHm5MHNS6/fmqIP9M43wui8/B5n/HhBld
         ATCQgteR0ASrbLKVDq/vsHEJ8np2DnZyh4IlDxOi0AD31zqJ7PHUyuQh0CYIHlAxy8fb
         0PBKSkH6bxYf5tBc01z7D1OUYp6nfQBHaKCrLNt0ebM/SAZP+iCmXr4SvhR8dFN56agM
         byq6nRSIUBQTgen2wKSZy1dp4VEYqPO5bzdAzolqPmnB9n9McLaTgtedAsq3GmZbUU23
         RLpA==
X-Forwarded-Encrypted: i=1; AJvYcCX8ZD2tPA1SZZvt0l3Szv5RLtxNQRAIMoXlWZL/r0oYg6ljHENQt2QOAAUvbb8JQtPLLlgz6vuzeE7pB7TL2q5t@lists.infradead.org
X-Gm-Message-State: AOJu0YxL8RXY69e9mJ5XoT/HA4fL9FYYGGeYvDlmo7KcfBPH5K9kLCIJ
	T3x1p6eUil9ulECmEdwDKSWCOKw/lbTN53zZHfwDgn1YuJ4O5cE7+CNNrgq6ueo=
X-Gm-Gg: ASbGnctShw9jVENTEoioAlIGwxA0ZodCNk0YJmi1GwscX7NNr69NmRYjjUNaT4K9awY
	ubLwfMlyEJ2Hu55S55n0aSfNSgDFG33l8S16qQLmKsdw+jGeAEpUWL0au74+2jTCOtRhbnD5f6h
	roroBAxl07Bk6DCmFIxxKVP98FNmF8yHvK6ehaz8GP4ROmX0niPxwfZjHzK8R2lqj7hbAPPVs4h
	/ZEi1zhlIfLMDKFAnUysgyGgimD/LtyATtFavTpI/zapgsDVATOYGSjFoKFAzLR/DehIiBSuQDk
	i4SwnUijjvP6/x+HAv390YoZF6wRItw31LwMZm//v2EnQ7HRW2IlEEs=
X-Google-Smtp-Source: AGHT+IEEYygST4Gz03iGTM9RRiblbKn1x180pLztYOSIYhLMIpPKwcn4PYi8F34LVLcH4FrG3CDhdg==
X-Received: by 2002:a17:902:d481:b0:216:770e:f46 with SMTP id d9443c01a7336-219e6f26692mr39017935ad.54.1734704193630;
        Fri, 20 Dec 2024 06:16:33 -0800 (PST)
Received: from ?IPV6:2409:8a28:f44:3764:dc48:fb1b:dd06:cba7? ([2409:8a28:f44:3764:dc48:fb1b:dd06:cba7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc972734sm29423545ad.88.2024.12.20.06.16.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 06:16:33 -0800 (PST)
Message-ID: <33ce9b58-4787-49cd-a7f2-34272cb3ecf7@bytedance.com>
Date: Fri, 20 Dec 2024 22:16:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] mm: Move common parts of pagetable_*_[cd]tor to
 helpers
Content-Language: en-US
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, Andy Lutomirski <luto@kernel.org>,
 "Mike Rapoport (IBM)" <rppt@kernel.org>, Ryan Roberts
 <ryan.roberts@arm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 loongarch@lists.linux.dev, x86@kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>
References: <20241219164425.2277022-1-kevin.brodsky@arm.com>
 <20241219164425.2277022-2-kevin.brodsky@arm.com>
 <20241219171920.GB26279@noisy.programming.kicks-ass.net>
 <75cb4ff8-eb0c-4519-a30a-f8be717ba278@arm.com>
 <0daabd32-cba4-4345-baa8-e8c66bc899ff@bytedance.com>
 <2f65f93e-9d44-4acc-b63c-8f5a35f59699@arm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <2f65f93e-9d44-4acc-b63c-8f5a35f59699@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_061634_945994_48AD3310 
X-CRM114-Status: GOOD (  20.87  )
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



On 2024/12/20 21:50, Kevin Brodsky wrote:
> On 20/12/2024 12:46, Qi Zheng wrote:
>> Hi Kevin,
>>
>> On 2024/12/20 18:49, Kevin Brodsky wrote:
>>> [...]
>>>
>>> Qi, shall we collaborate to make our series complementary? I believe my
>>> series covers patch 2 and 4 of your series, but it goes further by
>>> covering all levels and all architectures, and patches introducing
>>> ctor/dtor are already split as Alexander suggested on your series. So my
>>> suggestion would be:
>>>
>>> * Remove patch 1 in my series - I'd just introduce
>>> pagetable_{p4d,pgd}_[cd]tor with the same implementation as
>>> pagetable_pud_[cd]tor.
>>> * Remove patch 2 and 4 from your series and rebase it on mine.
>>
>> I quickly went through your patch series. It looks like my patch 2 and
>> your patch 6 are duplicated, so you want me to remove my patch 2.
>>
>> But I think you may not be able to simple let arm64, riscv and x86 to
>> use generic p4d_{alloc_one,free}(). Because even if
>> CONFIG_PGTABLE_LEVELS > 4, the pgtable_l5_enabled() may not be true.
>>
>> For example, in arm64:
>>
>> #if CONFIG_PGTABLE_LEVELS > 4
>>
>> static __always_inline bool pgtable_l5_enabled(void)
>> {
>>      if (!alternative_has_cap_likely(ARM64_ALWAYS_BOOT))
>>          return vabits_actual == VA_BITS;
>>      return alternative_has_cap_unlikely(ARM64_HAS_VA52);
>> }
> 
> Correct. That's why the implementation of p4d_free() I introduce in
> patch 6 checks mm_p4d_folded(), which is implemented as
> !pgtable_l5_enabled() on those architectures (see last paragraph in
> commit message). In fact it turns out Alexander suggested exactly this
> approach [2].

OK, I see.

> 
>>
>> Did I miss something?
>>
>> My patch series is not only for cleanup, but also for fixes of
>> UAF issue [1], so is it possible to rebase your patch series onto
>> mine? I can post v3 ASAP.
> 
> I see, yours should be merged first then. The issue is that yours would
> depend on some of the patches in mine, not the other way round.
> 
> My suggestion would then be for you to take patch 5, 6 and 7 from my
> series, as they match Alexander's suggestions (and patch 5 is I think a
> useful simplification), and replace patch 2 in your series with those. I
> would then rebase my series on top and adapt it accordingly. Does that
> sound reasonable?

Sounds good. But maybe just patch 5 and 6. Because I actually did
the work of your patch 7 in my patch 2 and 4.

So, is it okay to do something like the following?

1. I separate the ctor()/dtor() part from my patch 2, and then replace
    the rest with your patch 6.
2. take your patch 5 form your series

If it's ok, I will post the v3 next Monday. ;)

Thanks!

> 
> - Kevin
> 
> [2]
> https://lore.kernel.org/all/Z2RKpdv7pL34MIEt@tuxmaker.boeblingen.de.ibm.com/
> 

