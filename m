Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A203C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 12:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GK+r8CB/zopdHXRJVOxigdSQmwtLGrthh+WgPUejIE4=; b=Qr2RidUrjZoTvKeKQyUf/TJtWk
	4bygynoCQNdVuQjJR9xBDI6SWV6tYZtxIMcUOEfftwjz9cpK4jpxK+Jw9ihKDuFahYZY6p5eM9915
	anwnvqdGpMTisE36pagXFkXNE8Kw4lmBKRi380QfGMjUdlFm2zHa++n3q5oofvkXbkJuY04qjRNLZ
	bDWl7oVpZt8Z1bcteZ6Eu3/WWctu9ELkJ/jVM2U5tpJIrpwwcrzZZnKOLQGfcWXNV1EJcW835FMyE
	qLh4mVRzHEnfxuqsAhGTbOc66Ix+AYDppxyN3CgRMUoNJlxTw7eVSjZkBqzapbWgkEi2aPdesLoLb
	n+5LAwXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp4yp-00000000l7X-1cpp;
	Mon, 03 Mar 2025 12:33:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp4Bh-00000000bvp-44X1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 11:42:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741002140;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=GK+r8CB/zopdHXRJVOxigdSQmwtLGrthh+WgPUejIE4=;
	b=BIldS06+DAZmGjaNxP9m5gzL5IEb7oC+0yQXrtCFSX3j1MhQSRFLqRJRAqIsCYz6hc95OO
	jy5vZvjkF3B1xne2C8HYaVL9FJ8NqHdO6IMaH2G3hWR0w8Bunx210brIpBjvSTyWRk79oA
	ruqzhfeJj/wCCIyBx/9OVbjpbweJTjk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-Ey4QWUhiPD2JnDgXdiFj5w-1; Mon, 03 Mar 2025 06:42:19 -0500
X-MC-Unique: Ey4QWUhiPD2JnDgXdiFj5w-1
X-Mimecast-MFC-AGG-ID: Ey4QWUhiPD2JnDgXdiFj5w_1741002138
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4394b8bd4e1so19273185e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 03:42:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741002138; x=1741606938;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GK+r8CB/zopdHXRJVOxigdSQmwtLGrthh+WgPUejIE4=;
        b=cNUJDXlTOQPnrmdVzfJXDBWlLyk3b/W9bcijtSDUKDVJmgomDBF+6eGaEVlLZuGOpY
         E0LttfvxzHCzFJijl4UvXd48PamcvwdVOiJRT/6414CJY+WPttVSkKst5SZbyO8P317H
         LIC3v67gXU0LcNbVEmIa4Cv8KX55qdAu0I92Hs7aDSdbz+1ACGI4oriaBO/4K/NzeCD9
         PpEoTlqDrzOmKDw8zWAnVac6zbfkAKOOpgIAsPi9pEqa6vf0MXkEibMdccWiIgk+/+1I
         Rw3BjBcx89Bm2UiMl3Ddg7lAtMC8N0+XAMsy2dOH4m+2OH7MCq7l3E0fWSIv5JvI5CnA
         keaw==
X-Forwarded-Encrypted: i=1; AJvYcCWdkfDGhux58Pozpec1Z274EpHRdJs81hl1dT8r8gBqYtE0M35a0TujA5fn9lao+JFRZfJZoP9YauAUWxgAhD0b@lists.infradead.org
X-Gm-Message-State: AOJu0YyWV37u183QDEcLWHhbu0KKSXJhAy1Wkszbmby/V+sNzJfN2/mT
	T+DTgn3Os5irsiVuUcBbcl2qhu5+O58Cf0e3Q/av/BjKRTfvIghGmCS8ShO4Wn5KlnrVDHTHIXO
	l+ROJyOBQs3ELncfQfBQnPxQIouMRXDGxKD3LwcpU3Kbg1A9igj7nNleYoW5wKvJ1Me7pzDPf
X-Gm-Gg: ASbGncvU/6Q0yfXTOFRuumOdcguy727/DxK+Qp4XFGWBNNlGmBT4DYdmuXM7p2STaUN
	p1Mdo761M0UgQ/TiSFQtDvqq2cYryZI62hW80nVpUKnMYta7qvYIyjk/dpaUEds7T93dgY5qAgp
	ZCoG5hPSEBv3c2NOm8TBkiY8EqHL4sR3mS+8b3vFmpWmiuoGmfsi8OmaUD1EoNxevLMc7UuoKdo
	XDHrRtcmQj4Q4ga0Bm0oM9kswPblSpc62oEzl70xvOlJP71jdr3pKGo0ERLCpWuzOeGiyGPVUGH
	GvDmre8hkSEWin/KIoMdLnLYeNPndsZf/Oj/kjGZXXUQxvjU3W6ZadkmAUyEr3kI3f2FczUzmiF
	HJDyfKmLlRJhnIbnNFQriOXMCIJCAj+JMai6MMzo1YQA=
X-Received: by 2002:a05:600c:3506:b0:439:8e46:ee73 with SMTP id 5b1f17b1804b1-43ba6704446mr119492785e9.15.1741002138245;
        Mon, 03 Mar 2025 03:42:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEe6WbxcsGzXZWMC0pjNXpsivZUSmi+rYJFcr/S86qicmIKfyXyNyDXrqfgaMGgOQqTiegQEw==
X-Received: by 2002:a05:600c:3506:b0:439:8e46:ee73 with SMTP id 5b1f17b1804b1-43ba6704446mr119492405e9.15.1741002137875;
        Mon, 03 Mar 2025 03:42:17 -0800 (PST)
Received: from ?IPV6:2003:cb:c734:9600:af27:4326:a216:2bfb? (p200300cbc7349600af274326a2162bfb.dip0.t-ipconnect.de. [2003:cb:c734:9600:af27:4326:a216:2bfb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba532ba6sm186494095e9.12.2025.03.03.03.42.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 03:42:17 -0800 (PST)
Message-ID: <0ff27dbb-401b-4793-be70-1ff9c8010e4a@redhat.com>
Date: Mon, 3 Mar 2025 12:42:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64/mm: Elide tlbi in contpte_convert() under
 BBML2
To: =?UTF-8?Q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>
Cc: ryan.roberts@arm.com, suzuki.poulose@arm.com,
 yang@os.amperecomputing.com, catalin.marinas@arm.com, will@kernel.org,
 joro@8bytes.org, jean-philippe@linaro.org, mark.rutland@arm.com,
 joey.gouly@arm.com, oliver.upton@linux.dev, james.morse@arm.com,
 broonie@kernel.org, maz@kernel.org, akpm@linux-foundation.org, jgg@ziepe.ca,
 nicolinc@nvidia.com, mshavit@google.com, jsnitsel@redhat.com,
 smostafa@google.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev
References: <20250228182403.6269-2-miko.lenczewski@arm.com>
 <20250228182403.6269-5-miko.lenczewski@arm.com>
 <f270bb5d-aa54-45d3-89ed-2b757ab3a4b0@redhat.com>
 <20250303094947.GB13345@e133081.arm.com>
 <7e987f17-ffcb-45e0-8588-2d569d90f776@redhat.com>
 <20250303105539.GA74129@e133081.arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250303105539.GA74129@e133081.arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -1w94iIwhngvRQM1KksQ9j7IqpZ93OaVYnMzOLEbaqo_1741002138
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_034222_080482_B40F74A8 
X-CRM114-Status: GOOD (  31.14  )
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

On 03.03.25 11:55, Mikołaj Lenczewski wrote:
> On Mon, Mar 03, 2025 at 10:57:21AM +0100, David Hildenbrand wrote:
>> On 03.03.25 10:49, Mikołaj Lenczewski wrote:
>>> Hi David,
>>>
>>> Thanks for taking the time to review.
>>>
>>> On Mon, Mar 03, 2025 at 10:17:12AM +0100, David Hildenbrand wrote:
>>>> On 28.02.25 19:24, Mikołaj Lenczewski wrote:
>>>>> If we support bbml2 without conflict aborts, we can avoid the final
>>>>> flush and have hardware manage the tlb entries for us. Avoiding flushes
>>>>> is a win.
>>>>>
>>>>> Signed-off-by: Mikołaj Lenczewski <miko.lenczewski@arm.com>
>>>>> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
>>>>> ---
>>>>>     arch/arm64/mm/contpte.c | 3 ---
>>>>>     1 file changed, 3 deletions(-)
>>>>>
>>>>> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
>>>>> index 145530f706a9..77ed03b30b72 100644
>>>>> --- a/arch/arm64/mm/contpte.c
>>>>> +++ b/arch/arm64/mm/contpte.c
>>>>> @@ -72,9 +72,6 @@ static void contpte_convert(struct mm_struct *mm, unsigned long addr,
>>>>>     		__flush_tlb_range(&vma, start_addr, addr, PAGE_SIZE, true, 3);
>>>>>     	__set_ptes(mm, start_addr, start_ptep, pte, CONT_PTES);
>>>>> -
>>>>> -	if (system_supports_bbml2_noabort())
>>>>> -		__flush_tlb_range(&vma, start_addr, addr, PAGE_SIZE, true, 3);
>>>>>     }
>>>>>     void __contpte_try_fold(struct mm_struct *mm, unsigned long addr,
>>>>
>>>> What's the point of not squashing this into #2? :)
>>>>
>>>> If this split was requested during earlier review, at least seeing patch #2
>>>> on its own confused me.
>>>
>>> This split is a holdover from an earlier patchset, where it was still
>>> unknown whether the removal of the second flush was permitted with
>>> BBML2. Partly this was due to us being worried about conflict aborts
>>> after the removal, and partly this was because the "delay" is a separate
>>> optimisation that we could apply even if it turned out the final patch
>>> was not architecturally sound.
>>>
>>> Now that we do not handle conflict aborts (preferring only systems that
>>> handle BBML2 without ever raising aborts), the first issue is not a
>>> problem. The reasoning behind the second patch is also a little bit
>>> outdated, but I can see the logical split between a tlbi reorder, and
>>> the removal of the tlbi. If this is truly redundant though, I would be
>>> happy to squash the two into a single patch.
>>
>> Thanks for the information.
>>
>> Does patch #2 (reordering the tlbi) have any benefit on its own? I read
>> "other threads will not see an invalid pagetable entry", but I am not sure
>> that is correct. A concurrent HW page table walker would still find the
>> invalid PTE? It's just a matter of TLB state.
> 
> I think I understand what you mean. I agree that it is possible for a
> concurrent walk to see an invalid TLBI state, if it is on the same TLB
> that the repaint is happening on. For other TLBs, the flush has not yet
> propagated our invalidated PTEs (from `__ptep_get_and_clear()`) though?

What I am saying is: if there is no TLB entry yet, HW will walk the page 
table to find no present PTE and trigger a fault.

> That invalidation will only be seen by other TLBs after the
> `__flush_tlb_range()`, so we should save a few faults because only
> "local" threads will ever see the invalid entry, as opposed to all
> threads that try to read our modified range?

So what you say is, that deferring the flush means that if there is 
already a TLB entry, flushing deferred reduces the likelihood that a 
page table walk is triggered that could find no present PTE: 
consequently, reducing the likelihood that a page fault is triggered.

(I use the word likelihood, because I assume other action could result 
in a TLB entry getting flushed in the meantime, such as TLB entry reuse)

Correct?

Or it is the case that I
> have misunderstood something basic here, or that I have misinterpreted
> what you have written?

No, that makes it clearer, thanks.

-- 
Cheers,

David / dhildenb


