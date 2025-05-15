Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8679C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 13:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9DBeSBbi6U3zLRkJS53qHOo+MmuTmB6ZFLiCDJKoJVE=; b=1FbiAMQD9O+biqYpSfYbGUNC9o
	6q2Rwl5Zh08PUxx7tIYMvE9bbOmahS8AL1PP+BKjiR3QVc9qZJwOf3ycUv9QBocfc0mIPqxS86+cA
	wKCwRNxs9Xk1UA5I7YB4UAUCljaaR3JILXG0Nk+nYDOk8+MOz1dE68ixvMZ1/AA6HT2WisW/dfK0u
	B46IJuRkWd+R/istIzKF5cKkE7z/j6RrbApvOMCQmJGiebv18kAoZwGmRb22xb2uud18rnJ9FJAvw
	osKeFE625j7p3Y98fCNrEg8IZmuTpelizRn42C3ryreziW43a0YHu5tbzn5yincmzTUQAf24Ay76t
	Z8M71UHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFYPV-00000000gxn-04GO;
	Thu, 15 May 2025 13:14:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFYDr-00000000fJo-1acJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 13:02:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747314122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9DBeSBbi6U3zLRkJS53qHOo+MmuTmB6ZFLiCDJKoJVE=;
	b=KFpwSxNCMNb7aqS6em+mQezHjGa8LJlvT/FmjdgOvzcrazOkpa/PNJ6e7SKZJE+zn1drVE
	VbtH+0Y5BXcb6ACjUy/UcBMlUaWDMRx7vgX5J0Yd5xQ0BomiwNHeid1BaShbPs1VDDXg17
	imWqMSBMIiCSUjfZY49egl6YRWUg3fo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-274-ljbKuADjMXGKIe9sQ7eLyA-1; Thu, 15 May 2025 09:01:58 -0400
X-MC-Unique: ljbKuADjMXGKIe9sQ7eLyA-1
X-Mimecast-MFC-AGG-ID: ljbKuADjMXGKIe9sQ7eLyA_1747314118
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-442d472cf7fso7382945e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 06:01:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747314117; x=1747918917;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9DBeSBbi6U3zLRkJS53qHOo+MmuTmB6ZFLiCDJKoJVE=;
        b=WzvkVcq8jtLlNkucOySq9SnPt/vkEBp3lBZC9NOIhROqxdNVoxlViAa19mj63mwzIW
         G1qf88sEcrp8+tr3Erai2Ac28K0OP84lrjruDELuAzCuaXyFeDsa2g8aSMipM+eVF1fk
         n7LyNDsqndmbG+rarQhzLLMr+qpHHtkx/X9dYeAdiEiDv737+xnS+cVe07W61r+h9eWa
         D49Lys/a3ckmNkl5aZJhwdR8jjEW/QqvIQSyn6VF1pGIiaqx5mFTpsTJsIg/gljo1pIj
         1s+yW/m7B2Rjd1vljJc1/cZbto3M/3AiLKYHe6+iJJYEBYaRqYEIrWZpXFpyikazYFgw
         9Guw==
X-Forwarded-Encrypted: i=1; AJvYcCU1A+xYPWTSvL6LZ1TdMXN6lRcEMIxqSGEN+tVllbxvOyxF7yYVpTmeY9p4oPu/R7hp3r0iU0qDr2+noF5FeefP@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1GCrJrxcGFeUjM2dme5NF4Vryr5QJfsLA4JKE+W4nNBhg6LYX
	olepqPXxjmi+hqSx3ZeSgwSwaku9MGqWfigrXgZaX2qOcI5nzw6OVlsnztexLvyBcNWJoomMSBM
	FSfw3NFl+TKUgb9zf9CTzXUze8xcawadzG5TFoIESp5fX7wwyAhgqNFblNQrlid8D3YAaAE33
X-Gm-Gg: ASbGncvoEe7A4x5USj7I3AHTqrIrKpHgfwcPd6uGKAZ/yuV/P6zEW67HRS71HfVXf/K
	Vm4w1CFlb37lETOfNdWKsNhj83pwiHILFDE3R9RMgFUXQxDrIig4uzMpmMM7QySQR/KcbqCL8P+
	HGyOWMV+J7ulisTRSYPkgLmByH5RODwD9QvrhdNt2jzrw0jkWaHiaSQxKuDLuRm9lidNtdN7YP/
	Loy0bL2aGIdQJsaUzBy9E77SLrsDZGD7v5Wvm5wuf78nv5lD/VW3rOa3zexHj/ipVtSM++zKtca
	O+//jqou6G0BuBzpiMsEDoG4lbAI01qEarn0w4o/nLanB4wP26T89gd/a1PoR4DeHgNFeDC72l+
	JsNmN3OfX+k/4Z4w+8NNxFTVkgM42mx2RAnGfr48=
X-Received: by 2002:a05:600c:4ecf:b0:442:e011:7eb with SMTP id 5b1f17b1804b1-442f2179993mr86156135e9.30.1747314117370;
        Thu, 15 May 2025 06:01:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuFQKN6vlr1SKNALYZAGvjhh5kNbmGxWG9WUosIntWg48TXe7G3ffUvQFumHJGN+QYlu+52g==
X-Received: by 2002:a05:600c:4ecf:b0:442:e011:7eb with SMTP id 5b1f17b1804b1-442f2179993mr86155395e9.30.1747314116736;
        Thu, 15 May 2025 06:01:56 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4a:8900:884a:b3af:e3c9:ec88? (p200300d82f4a8900884ab3afe3c9ec88.dip0.t-ipconnect.de. [2003:d8:2f4a:8900:884a:b3af:e3c9:ec88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f39ef811sm65186185e9.35.2025.05.15.06.01.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 06:01:55 -0700 (PDT)
Message-ID: <3aeb6b8e-040c-47ae-8b46-1ef66d5f11e4@redhat.com>
Date: Thu, 15 May 2025 15:01:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: Check pxd_leaf() instead of !pxd_table() while
 tearing down page tables
To: Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 catalin.marinas@arm.com, will@kernel.org
Cc: anshuman.khandual@arm.com, mark.rutland@arm.com,
 yang@os.amperecomputing.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
References: <20250515063450.86629-1-dev.jain@arm.com>
 <332ecda7-14c4-4dc3-aeff-26801b74ca04@redhat.com>
 <4904d02f-6595-4230-a321-23327596e085@arm.com>
 <6fe7848c-485e-4639-b65c-200ed6abe119@redhat.com>
 <35ef7691-7eac-4efa-838d-c504c88c042b@arm.com>
 <c06930f0-f98c-4089-aa33-6789b95fd08f@redhat.com>
 <bac0d8e2-6219-4eb2-b4c8-b82b208808b5@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <bac0d8e2-6219-4eb2-b4c8-b82b208808b5@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sK0BOnxNOsRI-lvOPwokQ6rcQuU8J67yFPT9GmtIeks_1747314118
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_060203_529768_0AFD59A7 
X-CRM114-Status: GOOD (  28.05  )
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

On 15.05.25 12:07, Ryan Roberts wrote:
> On 15/05/2025 09:53, David Hildenbrand wrote:
>> On 15.05.25 10:47, Dev Jain wrote:
>>>
>>>
>>> On 15/05/25 2:06 pm, David Hildenbrand wrote:
>>>> On 15.05.25 10:22, Dev Jain wrote:
>>>>>
>>>>>
>>>>> On 15/05/25 1:43 pm, David Hildenbrand wrote:
>>>>>> On 15.05.25 08:34, Dev Jain wrote:
>>>>>>> Commit 9c006972c3fe removes the pxd_present() checks because the caller
>>>>>>> checks pxd_present(). But, in case of vmap_try_huge_pud(), the caller
>>>>>>> only
>>>>>>> checks pud_present(); pud_free_pmd_page() recurses on each pmd through
>>>>>>> pmd_free_pte_page(), wherein the pmd may be none.
>>>>>> The commit states: "The core code already has a check for pXd_none()",
>>>>>> so I assume that assumption was not true in all cases?
>>>>>>
>>>>>> Should that one problematic caller then check for pmd_none() instead?
>>>>>
>>>>>     From what I could gather of Will's commit message, my interpretation is
>>>>> that the concerned callers are vmap_try_huge_pud and vmap_try_huge_pmd.
>>>>> These individually check for pxd_present():
>>>>>
>>>>> if (pmd_present(*pmd) && !pmd_free_pte_page(pmd, addr))
>>>>>       return 0;
>>>>>
>>>>> The problem is that vmap_try_huge_pud will also iterate on pte entries.
>>>>> So if the pud is present, then pud_free_pmd_page -> pmd_free_pte_page
>>>>> may encounter a none pmd and trigger a WARN.
>>>>
>>>> Yeah, pud_free_pmd_page()->pmd_free_pte_page() looks shaky.
>>>>
>>>> I assume we should either have an explicit pmd_none() check in
>>>> pud_free_pmd_page() before calling pmd_free_pte_page(), or one in
>>>> pmd_free_pte_page().
>>>>
>>>> With your patch, we'd be calling pte_free_kernel() on a NULL pointer,
>>>> which sounds wrong -- unless I am missing something important.
>>>
>>> Ah thanks, you seem to be right. We will be extracting table from a none
>>> pmd. Perhaps we should still bail out for !pxd_present() but without the
>>> warning, which the fix commit used to do.
>>
>> Right. We just make sure that all callers of pmd_free_pte_page() already check
>> for it.
>>
>> I'd just do something like:
> 
> I just reviewed the patch and had the same feedback as David. I agree with the
> patch below, with some small mods...
> 
>>
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index 8fcf59ba39db7..e98dd7af147d5 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -1274,10 +1274,8 @@ int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>>   
>>          pmd = READ_ONCE(*pmdp);
>>   
>> -       if (!pmd_table(pmd)) {
>> -               VM_WARN_ON(1);
>> -               return 1;
>> -       }
>> +       VM_WARN_ON(!pmd_present(pmd));
>> +       VM_WARN_ON(!pmd_table(pmd));
> 
> You don't need both of these warnings; pmd_table() is only true if the pmd is
> present (well actually only if it's _valid_ which is more strict than present),
> so the second one is sufficient on its own.

Ah, right.

> 
>>   
>>          table = pte_offset_kernel(pmdp, addr);
>>          pmd_clear(pmdp);
>> @@ -1305,7 +1303,8 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
> 
> Given you are removing the runtime check and early return in
> pmd_free_pte_page(), I think you should modify this function to use the same
> style too.

BTW, the "return 1" is weird. But looking at x86, we seem to be making a 
private copy of the page table first, to defer freeing the page tables 
after the TLB flush.

I wonder if there isn't a better way (e.g., clear PUDP + flush tlb, then 
walk over the effectively-disconnected page table). But I'm sure there 
is a good reason for that.

> 
>>          next = addr;
>>          end = addr + PUD_SIZE;
>>          do {
>> -               pmd_free_pte_page(pmdp, next);
>> +               if (pmd_present(*pmdp))
> 
> question: I wonder if it is better to use !pmd_none() as the condition here? It
> should either be none or a table at this point, so this allows the warning in
> pmd_free_pte_page() to catch more error conditions. No strong opinion though.

Same here. The existing callers check pmd_present().

-- 
Cheers,

David / dhildenb


