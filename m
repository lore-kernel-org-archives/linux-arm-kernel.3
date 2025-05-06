Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB9DC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 18:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xzVtOMRvqr4t0G1TYddk8v9l3UI3FBrHFszhipiSpNM=; b=3cgQxmyJcuATWtpu1CexqvQEFO
	03AvlYz1nvEXGNBiC0/0h7PiZg7ciLAgEKkiwnh3xNcgJ70L3WqNINyCZKXKi9DOodzBCweIEtJTl
	DFyYSZHLEnU6kmbq6HxCQRZ6Eix8vWzx+lXExZGG4brvblEElro7562AqElqojJF+tWRSiXiyI+gf
	Ek1O93jnsN/v0SQhYUnf2fl4WEl8eJ7dG7EOQFg+yaLYJOAToRHpY3simTW0Txv1WSqzgJRfcUHE1
	3mjqarj9bYlesNiuQLxRfEXwW+fQbW/I/S932NuHdT4pep9LYXf5qYWmx0cjhUcrf1KjVgh60zNgJ
	dO5qgQHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCN54-0000000D6uM-2TTp;
	Tue, 06 May 2025 18:31:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCJJR-0000000CKX4-2ESV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 14:30:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746541824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xzVtOMRvqr4t0G1TYddk8v9l3UI3FBrHFszhipiSpNM=;
	b=LzSUbZoIf6iWFRNyNFaZeT/oIzqZYSkcLQINAK1VjH6UkndSpZe8E9BBy2WzTQEoQ6UoFC
	RZu3rxOwmPF/cgMsYrrrgmW7ESUunbC2P9wIT6PTaNQ9MLcuwBdlFlsigS0k/mfImzVPus
	hU3FXvUirhXk9qcRcECJTrqJe41mjIc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-E90oWvp1P42f1WIEcyElXA-1; Tue, 06 May 2025 10:30:23 -0400
X-MC-Unique: E90oWvp1P42f1WIEcyElXA-1
X-Mimecast-MFC-AGG-ID: E90oWvp1P42f1WIEcyElXA_1746541822
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d734da1a3so26787725e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 07:30:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746541822; x=1747146622;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xzVtOMRvqr4t0G1TYddk8v9l3UI3FBrHFszhipiSpNM=;
        b=P9MzImqwb5YLoegmVBKNHfxsXzRBFR/kYOucXFIrTzTqTPx519gSouB76/oItfbQSr
         K+SjMImDv4vNu02qhcISkVQPUdRo10Th0JmRtYfqXsfwvUB9w4ER/ekfakMoyvZaudVX
         n8Fnhfx+ghtLxw+dLmXvlS/7USMFOtvTkO08S8KGmMs5Ox7Si8f+0ErRC7Jo8dZzgJaq
         FfH/ifMCk6NZao8kocc1cq/rXjKqwHoqyRaUlpnAxp4jw/Ukq8g2o1I5YyiVbbdwQeBA
         yfPm2qtLIC7VMvphiDYxVGhpGIw71YD3EVummL6kM3T8IzoPnL22AEAk+yQyim/iU/mq
         iFGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTUFlYOHMw/HOnE6LVo1H1rPMVKG1gXdifxfRtSYZEWgH/uBHvTTTmSs87Jjbw43dScma4kDXioiLw7zSeSqGv@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6EsINt/sZykV+qab8daZJLxkjCvEGXEUjSq/6JDyLt5lNjUby
	qQVlSbO/ByIuOcBalH7hn1u4kisSaeJaPR5Lg2DQEYJeME4uwqW96Yh8sQjkGf6kyT4Bkz9Eca9
	VA4tANWU36YuG87BACluFjUNWBrEa2CKaEWzV/GU2yBaqGpW8s2Qbq0ONTtKLLt3xWdpTZ1bW
X-Gm-Gg: ASbGncsg1h948AT9Trlc6DWkcv7iCu3GdeR29KyG9qU2t0LspMO9rZF5xQUsj4TEcsC
	S9n2Ik2s8xLfxlFIgbju0rrXlAIfbydNYFKdrquHcZt4lbCh58IAv9rzVUMVvDsa52uzwEbXHuX
	tld9lWD4q1vEx1wNihtGZFoCN3wjVj0EKQDncAHkhDNBEVf1dB+FD4L67b1WqkVUBjSEy3LRIE0
	RL/wtkG0YBSH68MWGIBtIspx1b/SaZid/i5NewCUE9g4LCfIpW3RgpW9qF3XK2GnIkBAPTTgPhu
	W4sDIsBHT9/2HjumfOkJUe5HuN4wNmnswpFXqtfcDTAXo2+ccJ0=
X-Received: by 2002:a05:600c:8212:b0:43c:fae1:5151 with SMTP id 5b1f17b1804b1-441d0531289mr27396225e9.25.1746541821975;
        Tue, 06 May 2025 07:30:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrqKUakJ81rTTSc/yI/KVHcy9QDl42wyvP7IrrpqAdZZC+8BrwTI3phEb3ObqqDYnpHb1cyg==
X-Received: by 2002:a05:600c:8212:b0:43c:fae1:5151 with SMTP id 5b1f17b1804b1-441d0531289mr27395905e9.25.1746541821582;
        Tue, 06 May 2025 07:30:21 -0700 (PDT)
Received: from ?IPV6:2a01:599:915:8911:b13f:d972:e237:7fe2? ([2a01:599:915:8911:b13f:d972:e237:7fe2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2ad7ab1sm218825645e9.4.2025.05.06.07.30.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 07:30:20 -0700 (PDT)
Message-ID: <f0c57d50-075e-4ff3-9bcd-4b223eb9fd8a@redhat.com>
Date: Tue, 6 May 2025 16:30:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] mm: Add batched versions of
 ptep_modify_prot_start/commit
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, ryan.roberts@arm.com, willy@infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
 will@kernel.org, Liam.Howlett@oracle.com, vbabka@suse.cz, jannh@google.com,
 anshuman.khandual@arm.com, peterx@redhat.com, joey.gouly@arm.com,
 ioworker0@gmail.com, baohua@kernel.org, kevin.brodsky@arm.com,
 quic_zhenhuah@quicinc.com, christophe.leroy@csgroup.eu,
 yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org,
 namit@vmware.com, hughd@google.com, yang@os.amperecomputing.com,
 ziy@nvidia.com
References: <20250429052336.18912-1-dev.jain@arm.com>
 <20250429052336.18912-4-dev.jain@arm.com>
 <8780e63d-22c1-4133-a800-dec50fd1b5fa@lucifer.local>
 <f52746e9-f57a-4e65-af48-f5de3c5887c6@arm.com>
 <ec68b9ac-5d89-4048-a680-788525870e15@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <ec68b9ac-5d89-4048-a680-788525870e15@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OCnycx5hE7e8Aym5XZU7fjX7tbXmVNn_eDtUeugqcgk_1746541822
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_073025_655962_61D7EEB3 
X-CRM114-Status: GOOD (  18.81  )
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

On 30.04.25 16:37, Lorenzo Stoakes wrote:
> On Wed, Apr 30, 2025 at 11:55:12AM +0530, Dev Jain wrote:
>>
>>
>> On 29/04/25 7:22 pm, Lorenzo Stoakes wrote:
>>> On Tue, Apr 29, 2025 at 10:53:32AM +0530, Dev Jain wrote:
>>>> Batch ptep_modify_prot_start/commit in preparation for optimizing mprotect.
>>>> Architecture can override these helpers.
>>>>
>>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>>> ---
>>>>    include/linux/pgtable.h | 38 ++++++++++++++++++++++++++++++++++++++
>>>>    1 file changed, 38 insertions(+)
>>>>
>>>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>>>> index b50447ef1c92..ed287289335f 100644
>>>> --- a/include/linux/pgtable.h
>>>> +++ b/include/linux/pgtable.h
>>>> @@ -891,6 +891,44 @@ static inline void wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
>>>>    }
>>>>    #endif
>>>>
>>>> +/* See the comment for ptep_modify_prot_start */
>>>
>>> I feel like you really should add a little more here, perhaps point out
>>> that it's batched etc.
>>
>> Sure. I couldn't easily figure out a way to write the documentation nicely,
>> I'll do it this time.
> 
> Thanks! Though see the discussion with Ryan also.
> 
>>
>>>
>>>> +#ifndef modify_prot_start_ptes
>>>> +static inline pte_t modify_prot_start_ptes(struct vm_area_struct *vma,
>>>> +		unsigned long addr, pte_t *ptep, unsigned int nr)
>>>
>>> This name is a bit confusing, it's not any ptes, it's those pte entries
>>> belonging to a large folio capped to the PTE table right that you are
>>> batching right?
>>
>> yes, but I am just following the convention. See wrprotect_ptes(), etc. I
>> don't have a strong preference anyways.
>>
>>>
>>> Perhaps modify_prot_start_large_folio() ? Or something with 'batched' in
>>> the name?
>>
>> How about modify_prot_start_batched_ptes()?
> 
> I like this :) Ryan - that work for you, or do you feel _batched_ should be
> dropped here?


modify_prot_start_folio_ptes ?

But I would rather go with

modify_prot_folio_ptes_start

The "batched" is implicit, and "large folio" is not required if it's 
more than one pte ...

:)

-- 
Cheers,

David / dhildenb


