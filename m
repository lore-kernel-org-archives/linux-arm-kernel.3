Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08CCECCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 08:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kapyuiv8tsDIKt44CfN5IZYLsxk7UX5m2+M0d9ZIPEg=; b=AJlM618GfbnHCw0z/oc7iQ3O0d
	/jBxOFciPEhKXbCPam98FwKmg5X0iAWbEUUEAjnBa7Dyr0lS4++Jhf6W+SL4WmbrWx+sV0rJFkFe5
	bE5kvIYCsCb4ObDcWbtAO1KJQubMcVc5geib7ycX7Zp2IvKxtTa9X3Rq6zfACMZFP73M8Sx/HOV1X
	NIIJwXxdXqMQeH2SQIhNRpkfI/liyPaoNFrb/TUBprqclrBh8gj7oD25Gi5TugQIF+8rOVJ3CzBmi
	BCUIRYroKs5XI4rKl5hJUVTygQPUfZ/FPgGM16JvYmT/C89yZM1m1aeOpgi5qg/kly+09XqkEZrhg
	HZh3mPZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9JpG-000000044uQ-32SO;
	Thu, 16 Oct 2025 08:59:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9JpE-000000044tG-2GUA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 08:59:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760605147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=kapyuiv8tsDIKt44CfN5IZYLsxk7UX5m2+M0d9ZIPEg=;
	b=NL2khYwUeELqGQUu+1p6YjzXxtR/6GjeotOfiGrVUhZtePLQ8T4odvRilzfU0LyCcL6rZx
	HWu/4xp/4w7cLe1FZHNIc7+flpdv4m5Bgtq66h1p99C7R40lHPQHn1jqMczVu8DLMHiLmC
	N5MFGXyHGPltRV5ngbELFp2z8Qzo2Xo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-491-8lSjsw5ZNvqwkoF1pDQZGw-1; Thu, 16 Oct 2025 04:59:06 -0400
X-MC-Unique: 8lSjsw5ZNvqwkoF1pDQZGw-1
X-Mimecast-MFC-AGG-ID: 8lSjsw5ZNvqwkoF1pDQZGw_1760605145
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-47114018621so1877065e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 01:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760605145; x=1761209945;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kapyuiv8tsDIKt44CfN5IZYLsxk7UX5m2+M0d9ZIPEg=;
        b=Mdt2GeK0EeMc1GaTc7MdaqQBzoltQ4xZXyBR8NvUrPyp+OuBSGg4Cng6s08Efy+eKG
         DyKPFRuj4DiZT2mKFU4j9oFQZTWo1JL1NvhPlvE81VZJaKwCrJpRnWGHgyO6MVSKqC3a
         w3MDTXJvpdM8dIhOAM4Add7ljBlBeyWD7hAjcASwbCbaHQqJZGKsdVcVr23hphKZfM6Y
         aX1Eq5EoxIJNUxbNE93k7h06EcOZnLEkBblALDlx2l0fP94RCdMkf4MN/9xw0WHYNI0u
         fNVqKkucaRfS9tabMV48YIrzB5XG4A2W2EwyPMrw/k8K3s8lKgcXDvyE31Q456aTSteo
         v1kg==
X-Forwarded-Encrypted: i=1; AJvYcCUaJGUUxpM0sv6xGC+Q/5h03JcjF/o6QUFXg4vGrRCIVRiP0ng17GUu9yAOxTv++Acc4mSWiEsG3gzXxIVd05vM@lists.infradead.org
X-Gm-Message-State: AOJu0YxLdla/wyz6FEpIkkO+8JuQTntZ4g3Pp55vJkkaw+RgRV+uELso
	Zjd6RTzA6Vo63sdJ2JO+ev4pibYYeHMocGuIl+giDoP+kQsuFo5NDCHBQ6tBRktUnSoUlPfYDRn
	0uFd3fvrFnxxdGaQZJfdpIC6lLzUPNp8q/74qwq1+jX0P2M5zMvAmlioJiKzMyZV3BvialgtHNx
	N1
X-Gm-Gg: ASbGncsoonuDoSYXpC4cjmhcHyQDprxZENLoKoVYB25u1ju9WE+BeN7mu3vGvJ/0gWd
	lDWij41Wy+hXXx9T8TyYC+1zUuwhrgaP1WYPfAYG9CT0FxQ0f3ITOYh9EB0pWQhUjGuIMQFAoLb
	AP3ZBKc/gqr7NryJShnN8cs2yGwHtAZz6xSOTZz0o7tjXfZgaDxwxIPeYPBVQWHQE6sPVrafVHI
	dYz7CtXC5fTbYiBlt8WjLRj8RaQETPB+8O9jxLLDVyBDewQOQz2Linyy0M239YD4/2rnzrqOvSP
	TZq0uujBxZtT8vQurDjFhAChoY7bhdQPGAXdsJHlSZW9n58OAs6FimZ5pBWTObpzMTE7BLOeSLc
	GE/7cz4kO5lZ0lQj+INWrqYObzEGFpWYs4/VaeRCYGeA4lK+bGos78DCUi3wlwvBInqHVKGnChb
	QIvbjc9CoVbLRp6/6rfioaTuObNIY=
X-Received: by 2002:a05:600c:c4b8:b0:471:a98:998d with SMTP id 5b1f17b1804b1-4710a989a70mr15406405e9.12.1760605144916;
        Thu, 16 Oct 2025 01:59:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0u7pM/I5UH2Tdmf79ws175Qz9y0o5UXmeZBEsLNdrgt2fV/TSg5wXNlsc+YKlMr/W4eYM/g==
X-Received: by 2002:a05:600c:c4b8:b0:471:a98:998d with SMTP id 5b1f17b1804b1-4710a989a70mr15406125e9.12.1760605144496;
        Thu, 16 Oct 2025 01:59:04 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f0c:c200:fa4a:c4ff:1b32:21ce? (p200300d82f0cc200fa4ac4ff1b3221ce.dip0.t-ipconnect.de. [2003:d8:2f0c:c200:fa4a:c4ff:1b32:21ce])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471144c82b8sm13134415e9.15.2025.10.16.01.59.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 01:59:03 -0700 (PDT)
Message-ID: <1f7c3b59-3276-4f6e-946b-5f6ac9807e93@redhat.com>
Date: Thu, 16 Oct 2025 10:59:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -v2 1/2] mm: add spurious fault fixing support for huge
 pmd
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Huang, Ying" <ying.huang@linux.alibaba.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Yang Shi <yang@os.amperecomputing.com>,
 "Christoph Lameter (Ampere)" <cl@gentwo.org>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Anshuman Khandual
 <anshuman.khandual@arm.com>, Yicong Yang <yangyicong@hisilicon.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Yin Fengwei <fengwei_yin@linux.alibaba.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20251013092038.6963-1-ying.huang@linux.alibaba.com>
 <20251013092038.6963-2-ying.huang@linux.alibaba.com>
 <4c453dcc-2837-4f1a-905b-3462270f5e31@lucifer.local>
 <87ldlcpnbx.fsf@DESKTOP-5N7EMDA>
 <d748bc6b-2aff-4cee-a233-008f4d2555fa@lucifer.local>
 <87bjm7lh4u.fsf@DESKTOP-5N7EMDA>
 <3fc642be-b8f3-4fcb-b13c-3359cd52e921@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <3fc642be-b8f3-4fcb-b13c-3359cd52e921@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: N1Z7NL4VYLymnx_UIazpYvGHOxmyvt1AwloAoNx49kc_1760605145
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_015908_658070_A0D1B3CA 
X-CRM114-Status: GOOD (  21.28  )
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

On 16.10.25 10:25, Lorenzo Stoakes wrote:
> On Thu, Oct 16, 2025 at 10:22:57AM +0800, Huang, Ying wrote:
>> Lorenzo Stoakes <lorenzo.stoakes@oracle.com> writes:
>>
>>> On Wed, Oct 15, 2025 at 04:43:14PM +0800, Huang, Ying wrote:
>>> OK this is great, let's put it all in the kdoc for the new shared spurious
>>> faulting function! :) and additionally add it to the commit message.
>>
>> Sure.  Will do it in the next version.
> 
> Thanks!
> 
>>
>> [snip]
>>
>>>>>>
>>>>>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>>>>>> index 32e8457ad535..341622ec80e4 100644
>>>>>> --- a/include/linux/pgtable.h
>>>>>> +++ b/include/linux/pgtable.h
>>>>>> @@ -1232,6 +1232,10 @@ static inline void arch_swap_restore(swp_entry_t entry, struct folio *folio)
>>>>>>   #define flush_tlb_fix_spurious_fault(vma, address, ptep) flush_tlb_page(vma, address)
>>>>>>   #endif
>>>>>>
>>>>>> +#ifndef flush_tlb_fix_spurious_fault_pmd
>>>>>> +#define flush_tlb_fix_spurious_fault_pmd(vma, address, ptep) do { } while (0)
>>>>>> +#endif
>>>>>
>>>>> flush_tlb_fix_spurious_fault(), when the arch doesn't declare it, defaults to
>>>>> flush_tlb_page() - why do we just do nothing in this case here?
>>>>
>>>> Because all architectures do nothing for the spurious PMD page fault
>>>> fixing until the [2/2] of this series.  Where, we make it necessary to
>>>> flush the local TLB for spurious PMD page fault fixing on arm64
>>>> architecture.
>>>>
>>>> If we follow the design of flush_tlb_fix_spurious_fault(), we need to
>>>> change all architecture implementation to do nothing in this patch to
>>>> keep the current behavior.  I don't think that it's a good idea.  Do
>>>> you agree?
>>>
>>> Yeah probably we should keep the same behaviour as before, which is
>>> obviously, prior to this series, we did nothing.
>>>
>>> I guess in the PTE case we _always_ want to flush the TLB, whereas in the
>>> PMD case we otherwise don't have any need to at the point at which the
>>> spurious flush is performed.
>>>
>>> But from your explanation above re: the stale TLB entry this _only_ needs
>>> to be done for architectures which might encounter this problem rather than
>>> needing a TLB flush in general.
>>>
>>> Given we're generalising the code and one case always flushes the TLB and
>>> the other doesn't maybe it's worth putting a comment in the generalised
>>> function mentioning this?
>>
>> I'm not sure whether it's a good idea to document architecture behaviors
>> in the general code.  The behavior may be changed architecture by
>> architecture in the future.
> 
> Right, but we are unconditionaly doing a TLB flush in the PTE case but not PMD
> so let's document that to be clear :)

Agreed! That's a big benefit of merging the code, it sticks out what is 
not common already.

-- 
Cheers

David / dhildenb


