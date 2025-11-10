Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BA0CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 09:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FdVTKsm8GAbvPx2SpTGUo+BQ4+zMzWzy9tfx/LEXR4E=; b=bo+mrpMxeKc0xa+8uWU2BbWql8
	8HHNWAUkNoR51nLLmHJu81tXnYvqI5xiM2Yp39Jf+eSTqeMTyV+5+cytWVkn8t1uGDyLpm1Ushra/
	cpIXpv5t1x20LOsqs/aNEmcvy1TlBecWydRtolzfc+P9VVa9rIrY2PxaFjIWs6ZBmgtXT2fMEvXci
	Jzd1C4w2hSmTqZ7OK5xLW5uqAyrX0ZaW/lhYopbFHh3KeGTrOgq7wn2OhVie0/EBq1tNtLJB9WNP+
	WDtaP/cTVTaD3+ar+mfQ/HyqGbtgaFGEgdI/FtBzbTov1nN4gwLu6wvN4zW/AGs+8fc4neBYi1aZC
	12Apurig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIOah-000000058Du-0F41;
	Mon, 10 Nov 2025 09:53:39 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIOae-000000058DE-34qR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 09:53:38 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-42b312a08a2so1162577f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 01:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762768415; x=1763373215; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FdVTKsm8GAbvPx2SpTGUo+BQ4+zMzWzy9tfx/LEXR4E=;
        b=DeZuglkGf4qyMOP8+sOMxm1EKjChinNe+5zjYMDRowWfZnEjBv3MxSihDXT6tbO10F
         exmBYv05KhTbbj27eb8QVAamxBH9HfcdrfafZgppfX9vSwkCK0luEP3wJNHxfg6mw8AC
         filrk08ihafQIDllcJQuETk7QY/YZ4YsO/Bn39MiQnIFRguOak5YxSiq7qeT1sJiddHD
         bU0d6mFMjsxGWx42lAJR9O5vH0UHwGoFijXPWslzTIj1+6tk90nTt6eL5K5Lk8CZTifU
         A1e0D3nh04JQEbGsAcox0CdajpmRUjusXiLGp0JM56xWr2poOKrLcfdE5ayR23WWDCi1
         2xjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762768415; x=1763373215;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FdVTKsm8GAbvPx2SpTGUo+BQ4+zMzWzy9tfx/LEXR4E=;
        b=tFODd4TYiBCrc4dcvzs0N0lhycXDhQd8pjs0tFrGJ0MattfTTTsUoOTVZUhu+LazB4
         hbBthnvHwOO9OXVkufDsP9zdQFCEwy1KTDa1VP25ugzjyn0byoWFvUON2FI6UuqM3EoI
         aoK5NkqWXK3XkkknmK5pLCszHLGc612Cw0QqC5twREO8HXoBOs0bAZdFaPlVo457NlDC
         1bti0xn1S+FEKQMu8NQM8uKHtgXNaLR/fE6KkNO5eLAmJ9fyNzTofc5BmRA2HlFK7miP
         Tt0CzdldKiObV/FBpyVlJfD+oZMQtearEWvdXcTEoC8298acwPAbYmM6pvEkL7+Z6RQh
         IU6g==
X-Forwarded-Encrypted: i=1; AJvYcCWmxIS1JVO76Cvby8wD1H4CR24wKmapKkYQaHMJ0uxgcphs49Bl7D0RDFhh7I6wGun96E9TmP8rIxM7oYn5gMEf@lists.infradead.org
X-Gm-Message-State: AOJu0YzZzGA19/kdepPF5RtFXV25V9HX/ZJHUD1vtxh/F9c/KjnmIs/a
	qqirBurTTVfM/KfmRS70p4+2GSSzFgr3RNtNhw8tcefKsz2wn6js1aMj
X-Gm-Gg: ASbGncujQGIFsMrVEvpUGMd3FWZ0uL82gs81MiCs0PO9JrAz7fPMWluNqR3/4z99F2p
	UxKjPrwWpGlc/o8twrlvL+6hNxAOjkCaHhndWilKWvcJM/0ICqpnPq1oc36EIAZvS2ZH9ns6UbK
	lAiUWzFEOloWSBVSiNtZILJxvPpbK66Jaa2kAcE4NVzbx4ioJbNX5ureD6pC6PWDTJ4QE6MlQAg
	PLknQ80v0FxK6R3jZmO2xUOpEJf8nf37fyZkVFedSjlWiRX0C2F00ieIFkPMvbqYgCoR8n5Q0SK
	W9h3rKtwp7GVEfItSsr0OhQ/DuOOFnx7Og0ss0EQ3FcYn2AvwiFbNOOOqCDs4wEOJba1osfIN91
	wL/drKlh+Y1zF/kXASsUDFoSmdzdq9cceTcgMDXoUKZfS16y8Ko++TPZWM0SlhNDqRI7nzsWzsv
	ash+rdbxVBr9X5/HoZgBMjHnXHL6QSwr0ultl9K+EBOyJIE8LtSOiVISjg7mc9qZ9B5V8KAHMXJ
	0RsNSlLwBB0YyiqzAvy0VjOVDid1sMnSqACd7vwCR4AkkhWi8aMMV3xxhQH
X-Google-Smtp-Source: AGHT+IGsooEmMcpiBszEC0S29az4N9pDXGOvaoT4Fy0Z8fKUBHepw/QGQNXOLUsDa6Q40qnzLaxOfw==
X-Received: by 2002:a05:6000:26d3:b0:429:d084:d226 with SMTP id ffacd0b85a97d-42b2dc2091fmr5677341f8f.24.1762768414585;
        Mon, 10 Nov 2025 01:53:34 -0800 (PST)
Received: from ?IPV6:2003:d8:2f30:b00:cea9:dee:d607:41d? (p200300d82f300b00cea90deed607041d.dip0.t-ipconnect.de. [2003:d8:2f30:b00:cea9:dee:d607:41d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b303386f1sm12732923f8f.3.2025.11.10.01.53.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 01:53:34 -0800 (PST)
Message-ID: <fbca7868-6f68-4b98-a2f2-e39eb46b7f12@gmail.com>
Date: Mon, 10 Nov 2025 10:53:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/huge_memory: restrict __GFP_ZEROTAGS to HW tagging
 architectures
To: Jan Polensky <japo@linux.ibm.com>, catalin.marinas@arm.com
Cc: akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org, will@kernel.org
References: <20251031170133.280742-1-catalin.marinas@arm.com>
 <20251109003613.1461433-1-japo@linux.ibm.com>
 <690ce196-58cb-4252-ab72-967e1e1574cf@gmail.com>
 <aRG05VS-IIxV2y_C@li-276bd24c-2dcc-11b2-a85c-945b6f05615c.ibm.com>
From: "David Hildenbrand (Red Hat)" <davidhildenbrandkernel@gmail.com>
Content-Language: en-US
In-Reply-To: <aRG05VS-IIxV2y_C@li-276bd24c-2dcc-11b2-a85c-945b6f05615c.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_015337_265409_795C577A 
X-CRM114-Status: GOOD (  28.49  )
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

On 10.11.25 10:48, Jan Polensky wrote:
> On Mon, Nov 10, 2025 at 10:09:31AM +0100, David Hildenbrand (Red Hat) wrote:
>> On 09.11.25 01:36, Jan Polensky wrote:
>>> The previous change added __GFP_ZEROTAGS when allocating the huge zero
>>> folio to ensure tag initialization for arm64 with MTE enabled. However,
>>> on s390 this flag is unnecessary and triggers a regression
>>> (observed as a crash during repeated 'dnf makecache').
>>>
>>> Restrict the use of __GFP_ZEROTAGS to architectures that support
>>> hardware memory tagging (currently arm64 with MTE or KASAN HW tags).
>>> This avoids unintended side effects on other platforms.
>>>
>>> Fixes: 1579227fe0f0 ("mm/huge_memory: initialise the tags of the huge zero folio")
>>> Link: https://lore.kernel.org/r/20251031170133.280742-1-catalin.marinas@arm.com
>>> Signed-off-by: Jan Polensky <japo@linux.ibm.com>
>>> ---
>>>    mm/huge_memory.c | 9 +++++----
>>>    1 file changed, 5 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>>> index aae283b00857..0c1794656d7a 100644
>>> --- a/mm/huge_memory.c
>>> +++ b/mm/huge_memory.c
>>> @@ -209,14 +209,15 @@ unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
>>>
>>>    static bool get_huge_zero_folio(void)
>>>    {
>>> +	gfp_t gfp = (GFP_TRANSHUGE | __GFP_ZERO) & ~__GFP_MOVABLE;
>>>    	struct folio *zero_folio;
>>>    retry:
>>>    	if (likely(atomic_inc_not_zero(&huge_zero_refcount)))
>>>    		return true;
>>> -
>>> -	zero_folio = folio_alloc((GFP_TRANSHUGE | __GFP_ZERO | __GFP_ZEROTAGS) &
>>> -				 ~__GFP_MOVABLE,
>>> -			HPAGE_PMD_ORDER);
>>> +#if IS_ENABLED(CONFIG_KASAN_HW_TAGS) || IS_ENABLED(CONFIG_ARM64_MTE)
>>> +	gfp |= __GFP_ZEROTAGS;
>>> +#endif
>>
>> That looks like the wrong approach. If an architecture does not support
>> __GFP_ZEROTAGS it should not trigger anything. __GFP_ZEROTAGS should be ignored.
>>
>> I think the problem is that post_alloc_hook() does
>>
>> if (zero_tags) {
>> 	/* Initialize both memory and memory tags. */
>> 	for (i = 0; i != 1 << order; ++i)
>> 		tag_clear_highpage(page + i);
>>
>> 	/* Take note that memory was initialized by the loop above. */
>> 	init = false;
>> }
>>
>> And tag_clear_highpage() is a NOP on other architectures.
>>
>> Gah.
>>
>> I wonder if the following would work:
>>
>>
>> diff --git a/include/linux/gfp_types.h b/include/linux/gfp_types.h
>> index 65db9349f9053..56b82e116cb79 100644
>> --- a/include/linux/gfp_types.h
>> +++ b/include/linux/gfp_types.h
>> @@ -47,7 +47,9 @@ enum {
>>          ___GFP_HARDWALL_BIT,
>>          ___GFP_THISNODE_BIT,
>>          ___GFP_ACCOUNT_BIT,
>> +#ifdef __HAVE_ARCH_TAG_CLEAR_HIGHPAGE
>>          ___GFP_ZEROTAGS_BIT,
>> +#endif
>>   #ifdef CONFIG_KASAN_HW_TAGS
>>          ___GFP_SKIP_ZERO_BIT,
>>          ___GFP_SKIP_KASAN_BIT,
>> @@ -85,7 +87,11 @@ enum {
>>   #define ___GFP_HARDWALL                BIT(___GFP_HARDWALL_BIT)
>>   #define ___GFP_THISNODE                BIT(___GFP_THISNODE_BIT)
>>   #define ___GFP_ACCOUNT         BIT(___GFP_ACCOUNT_BIT)
>> +#ifdef __HAVE_ARCH_TAG_CLEAR_HIGHPAGE
>>   #define ___GFP_ZEROTAGS                BIT(___GFP_ZEROTAGS_BIT)
>> +#else
>> +#define ___GFP_ZEROTAGS                0
>> +#endif
>>   #ifdef CONFIG_KASAN_HW_TAGS
>>   #define ___GFP_SKIP_ZERO       BIT(___GFP_SKIP_ZERO_BIT)
>>   #define ___GFP_SKIP_KASAN      BIT(___GFP_SKIP_KASAN_BIT)
>>
>>
>> Likely we'd have to make __HAVE_ARCH_TAG_CLEAR_HIGHPAGE a proper
>> kconfig option.
>>
>>
>> Then we could turn the default implementation of
>> tag_clear_highpage() into a BUILD_BUG.
>>
> I'd like to suggest to keep the enum untouched and only use the second
> part of your suggestion.

Why? We also do that for CONFIG_KASAN_HW_TAGS, CONFIG_LOCKDEP and 
CONFIG_SLAB_OBJ_EXT.

> Which works by the way for our arch (s390).
> 
>   include/linux/gfp_types.h | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/include/linux/gfp_types.h b/include/linux/gfp_types.h
> index 65db9349f905..c12d8a601bb3 100644
> --- a/include/linux/gfp_types.h
> +++ b/include/linux/gfp_types.h
> @@ -85,7 +85,11 @@ enum {
>   #define ___GFP_HARDWALL        BIT(___GFP_HARDWALL_BIT)
>   #define ___GFP_THISNODE        BIT(___GFP_THISNODE_BIT)
>   #define ___GFP_ACCOUNT     BIT(___GFP_ACCOUNT_BIT)
> +#ifdef __HAVE_ARCH_TAG_CLEAR_HIGHPAGE
>   #define ___GFP_ZEROTAGS        BIT(___GFP_ZEROTAGS_BIT)
> +#else
> +#define ___GFP_ZEROTAGS        0
> +#endif
>   #ifdef CONFIG_KASAN_HW_TAGS
>   #define ___GFP_SKIP_ZERO   BIT(___GFP_SKIP_ZERO_BIT)
>   #define ___GFP_SKIP_KASAN  BIT(___GFP_SKIP_KASAN_BIT)
> 
> This solution would be sufficient from my side, and I would appreciate a
> quick application if there are no objections.

As raised, to be sure that __HAVE_ARCH_TAG_CLEAR_HIGHPAGE is always seen 
early in that file, it should likely become a CONFIG_ thing.


