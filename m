Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4704ECCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 19:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9k9/XI8CsiYqEmuX8HZnzEnBP7pXKRSVVKQWm8zHdm4=; b=nGPhX4t7Y65+Y8kRMH3MiaS2c8
	Cudbl5wSLWOm8b2SsLMtyeckFop0LotyWsahSbaZNp3Gs/U2IdgIU7uwzNuTvW3InOG+rGmXgsRuF
	y2micZ4QYDqGSeVoOgn+VWPcJ4rl+ceDwPwIhBUuxh//9lfROmIo5z5Hu+g+FzuXHKupaRKO7VYoi
	LZsOjjNWPrPr138gfGTcRMafqfU++weKfM/2g9ejsTCZ6fABxQ+uruC/0h8QommVdNYk4EwWnpnso
	4llV5fccEBx3N+cZND44aijr9lS9Wau5IZr7sScolEz0Kvfx6ue0MR2e3t7akZfmnY1LChOtRATPi
	CFjVrhXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvOA-0000000ElSU-0RBm;
	Mon, 20 Oct 2025 19:17:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvO4-0000000ElP9-2RlC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 19:17:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760987863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9k9/XI8CsiYqEmuX8HZnzEnBP7pXKRSVVKQWm8zHdm4=;
	b=gMem3QZ35bcoVmnkt0HY2au3AjeXwO4v1r+gCEM5HTrfxiRWFKDMlNPETT+5x5kgiblh6c
	sStm0WPcXPnXuKEDvkSSauaPcypBHR+dl6H+wD986/wJOauR7vrgw1/+6xld7F6+N0wVG9
	GQMxxmKZNpgaORO+rCh7jqaG89kHqRM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-124-yx-BXNrROXGnKEoqHSDfRw-1; Mon, 20 Oct 2025 15:17:41 -0400
X-MC-Unique: yx-BXNrROXGnKEoqHSDfRw-1
X-Mimecast-MFC-AGG-ID: yx-BXNrROXGnKEoqHSDfRw_1760987861
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3f7b5c27d41so2830332f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 12:17:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760987860; x=1761592660;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9k9/XI8CsiYqEmuX8HZnzEnBP7pXKRSVVKQWm8zHdm4=;
        b=J3S+PyQxoYrQww9B+hcvzIJiaOzqE8o7KTlmfjYnrk5O/92IsVacytNDbazN6H76qn
         82Ox/7bcdEWNg66G6HPpZQxxVgWYm1hVs22y1WJ0RVSFuT8moiOqXtDIwFvP2vfvxvH9
         4uM3nbMOzkRK8/HEX0Kkuw03EzRno9UbvWMQhW2NpJxDtKqnPDNOmoWEUvEa8/S2U4zw
         Kykv6Y4X6KRPnBTsPXCi9nkGyipFNSerlw/yo6DtkirV/NIr3gycoI1ge2eOeuOiv6DB
         b+MX7SP3QuJjxpWvpoF7EKrAyX5mfOvmZOT6zvLLGgNvZxPYsxmgWmEMsXg+xrjByeZv
         WYqg==
X-Forwarded-Encrypted: i=1; AJvYcCVyxJQrxQ//Tml+3UeL+pEfuGIq6kxUA5vmaaJMuNyJhKPasXsb9Z8+5CDVsFi69L7jIZLIma0QmRFtb7lYTpib@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+RPxsmZvEfareuhAQApf01f7MGajZcJHVZw2jZdpMc0KtXoAH
	SHLdeV2ugBBkrTXtYzF7+OwtzdOYPh15oOGTdycIDWBeQvNt6UaXtRPgOTrQrcqReZwcXZe+KZ4
	1TN4gttvNdxFzv226VknrJxq9uPBMdoRYWKSi9EAxH9dMW3oa1hR34q9CrSR8ncQuJZ4aPw4H05
	QD
X-Gm-Gg: ASbGncu8Nmvas4PImc2AopTLlqDnABnFoYmoll+g0gNCXV0h6FXJxOwbtsprrD6dT2e
	XhiTy4DkNZQC56aIeJJnXHvWMbFH8HxDZGCAPDsJDQk0jYTdnALhvo/Yt4F4pP9KTxlyK8NC+v8
	wKNIN6uXmjjDgUtxM0NdMhjtS9AkXP7aQYkm/pthASt4syxEbEKkygUYL9mXUKD9yhDgr6UV5vX
	XMbEgyS7ZwyQ0jtZH7mftcu3Wu2Z0KAFCeBD2Fq7fE5BaEJEY4UdIJb0TXZXVRh70QvPfpZigLA
	qFVGdoqOivbF/TUuH7hDPiDEkr2or1bXY98DlKmRiipnd9RhkcHkT3q9nm1vBDbmMXiFVUFAEHk
	4LRhpA04Q1VPVvEEtOvuCPTrPItfFZihcs+6FYgYsBLfZjnhJh6koQsAYWPO/y/Xt6p+I34MkpJ
	8D1tga3eMVa3USpcrCWDDpgKHOcjo=
X-Received: by 2002:a5d:64e8:0:b0:425:82b4:a099 with SMTP id ffacd0b85a97d-426fb64fb3bmr13513372f8f.0.1760987860568;
        Mon, 20 Oct 2025 12:17:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG981rLI5qROjih4tCXUS232eMtXMZElPCvd/sQ6LftPvcIGaIy/eNWcaPZ+/ZZMFOFmzOcxQ==
X-Received: by 2002:a5d:64e8:0:b0:425:82b4:a099 with SMTP id ffacd0b85a97d-426fb64fb3bmr13513360f8f.0.1760987860154;
        Mon, 20 Oct 2025 12:17:40 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f0c:c200:fa4a:c4ff:1b32:21ce? (p200300d82f0cc200fa4ac4ff1b3221ce.dip0.t-ipconnect.de. [2003:d8:2f0c:c200:fa4a:c4ff:1b32:21ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a993sm16658313f8f.24.2025.10.20.12.17.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:17:39 -0700 (PDT)
Message-ID: <02686adb-7575-4eb4-8d60-c5374de60752@redhat.com>
Date: Mon, 20 Oct 2025 21:17:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64, mm: avoid always making PTE dirty in pte_mkwrite()
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Huang Ying <ying.huang@linux.alibaba.com>
Cc: Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Gavin Shan <gshan@redhat.com>, Ard Biesheuvel <ardb@kernel.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Yicong Yang <yangyicong@hisilicon.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20251015023712.46598-1-ying.huang@linux.alibaba.com>
 <aPKFmHg-FrkGJxWd@arm.com> <0e6d1f1f-a917-4e36-80de-03ba94c6d850@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <0e6d1f1f-a917-4e36-80de-03ba94c6d850@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3kZ5gBMH04EGmZqa_wTLXYpltYikz_odqc1FhKAbWwE_1760987861
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_121744_705408_2D7D2475 
X-CRM114-Status: GOOD (  26.85  )
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

On 20.10.25 04:09, Anshuman Khandual wrote:
> 
> 
> On 17/10/25 11:36 PM, Catalin Marinas wrote:
>> On Wed, Oct 15, 2025 at 10:37:12AM +0800, Huang Ying wrote:
>>> Current pte_mkwrite_novma() makes PTE dirty unconditionally.  This may
>>> mark some pages that are never written dirty wrongly.  For example,
>>> do_swap_page() may map the exclusive pages with writable and clean PTEs
>>> if the VMA is writable and the page fault is for read access.
>>> However, current pte_mkwrite_novma() implementation always dirties the
>>> PTE.  This may cause unnecessary disk writing if the pages are
>>> never written before being reclaimed.
>>>
>>> So, change pte_mkwrite_novma() to clear the PTE_RDONLY bit only if the
>>> PTE_DIRTY bit is set to make it possible to make the PTE writable and
>>> clean.
>>>
>>> The current behavior was introduced in commit 73e86cb03cf2 ("arm64:
>>> Move PTE_RDONLY bit handling out of set_pte_at()").  Before that,
>>> pte_mkwrite() only sets the PTE_WRITE bit, while set_pte_at() only
>>> clears the PTE_RDONLY bit if both the PTE_WRITE and the PTE_DIRTY bits
>>> are set.
>>>
>>> To test the performance impact of the patch, on an arm64 server
>>> machine, run 16 redis-server processes on socket 1 and 16
>>> memtier_benchmark processes on socket 0 with mostly get
>>> transactions (that is, redis-server will mostly read memory only).
>>> The memory footprint of redis-server is larger than the available
>>> memory, so swap out/in will be triggered.  Test results show that the
>>> patch can avoid most swapping out because the pages are mostly clean.
>>> And the benchmark throughput improves ~23.9% in the test.
>>>
>>> Fixes: 73e86cb03cf2 ("arm64: Move PTE_RDONLY bit handling out of set_pte_at()")
>>> Signed-off-by: Huang Ying <ying.huang@linux.alibaba.com>
>>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>>> Cc: Will Deacon <will@kernel.org>
>>> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>> Cc: Gavin Shan <gshan@redhat.com>
>>> Cc: Ard Biesheuvel <ardb@kernel.org>
>>> Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>>> Cc: Yicong Yang <yangyicong@hisilicon.com>
>>> Cc: linux-arm-kernel@lists.infradead.org
>>> Cc: linux-kernel@vger.kernel.org
>>> ---
>>>   arch/arm64/include/asm/pgtable.h | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>>> index aa89c2e67ebc..0944e296dd4a 100644
>>> --- a/arch/arm64/include/asm/pgtable.h
>>> +++ b/arch/arm64/include/asm/pgtable.h
>>> @@ -293,7 +293,8 @@ static inline pmd_t set_pmd_bit(pmd_t pmd, pgprot_t prot)
>>>   static inline pte_t pte_mkwrite_novma(pte_t pte)
>>>   {
>>>   	pte = set_pte_bit(pte, __pgprot(PTE_WRITE));
>>> -	pte = clear_pte_bit(pte, __pgprot(PTE_RDONLY));
>>> +	if (pte_sw_dirty(pte))
>>> +		pte = clear_pte_bit(pte, __pgprot(PTE_RDONLY));
>>>   	return pte;
>>>   }
>>
>> This seems to be the right thing. I recall years ago I grep'ed
>> (obviously not hard enough) and most pte_mkwrite() places had a
>> pte_mkdirty(). But I missed do_swap_page() and possibly others.
>>
>> For this patch:
>>
>> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
>>
>> I wonder whether we should also add (as a separate patch):
>>
>> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
>> index 830107b6dd08..df1c552ef11c 100644
>> --- a/mm/debug_vm_pgtable.c
>> +++ b/mm/debug_vm_pgtable.c
>> @@ -101,6 +101,7 @@ static void __init pte_basic_tests(struct pgtable_debug_args *args, int idx)
>>   	WARN_ON(pte_dirty(pte_mkclean(pte_mkdirty(pte))));
>>   	WARN_ON(pte_write(pte_wrprotect(pte_mkwrite(pte, args->vma))));
>>   	WARN_ON(pte_dirty(pte_wrprotect(pte_mkclean(pte))));
>> +	WARN_ON(pte_dirty(pte_mkwrite_novma(pte_mkclean(pte))));
>>   	WARN_ON(!pte_dirty(pte_wrprotect(pte_mkdirty(pte))));
>>   }
>>
>> For completeness, also (and maybe other combinations):
>>
>> 	WARN_ON(!pte_write(pte_mkdirty(pte_mkwrite_novma(pte))));
> 
> Adding similar tests to pte_wrprotect().
> 
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index 830107b6dd08..573632ebf304 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c
> @@ -102,6 +102,11 @@ static void __init pte_basic_tests(struct pgtable_debug_args *args, int idx)
>          WARN_ON(pte_write(pte_wrprotect(pte_mkwrite(pte, args->vma))));
>          WARN_ON(pte_dirty(pte_wrprotect(pte_mkclean(pte))));
>          WARN_ON(!pte_dirty(pte_wrprotect(pte_mkdirty(pte))));
> +
> +       WARN_ON(pte_dirty(pte_mkwrite_novma(pte_mkclean(pte))));
> +       WARN_ON(!pte_write(pte_mkdirty(pte_mkwrite_novma(pte))));
> +       WARN_ON(!pte_write(pte_mkwrite_novma(pte_wrprotect(pte))));
> +       WARN_ON(pte_write(pte_wrprotect(pte_mkwrite_novma(pte))));
>   }
> 
>   static void __init pte_advanced_tests(struct pgtable_debug_args *args)
> @@ -195,6 +200,9 @@ static void __init pmd_basic_tests(struct pgtable_debug_args *args, int idx)
>          WARN_ON(pmd_write(pmd_wrprotect(pmd_mkwrite(pmd, args->vma))));
>          WARN_ON(pmd_dirty(pmd_wrprotect(pmd_mkclean(pmd))));
>          WARN_ON(!pmd_dirty(pmd_wrprotect(pmd_mkdirty(pmd))));
> +
> +       WARN_ON(!pmd_write(pmd_mkwrite_novma(pmd_wrprotect(pmd))));
> +       WARN_ON(pmd_write(pmd_wrprotect(pmd_mkwrite_novma(pmd))));
>          /*
>           * A huge page does not point to next level page table
>           * entry. Hence this must qualify as pmd_bad().
>>
>> I cc'ed linux-mm in case we missed anything. If nothing raised, I'll
>> queue it next week.

Can we please send patches touching mm/debug_vm_pgtable.c properly to 
linux-mm?

I wrote tools/testing/selftests/mm/mkdirty.c a while ago. I wonder 
whether that could also be expressed in these tests here.

But my memory comes back: ARCH_HAS_DEBUG_VM_PGTABLE is not set by all 
architectures (and in particluar not sparc64 which I fixed back then)

-- 
Cheers

David / dhildenb


