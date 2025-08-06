Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE4CC87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 09:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TLnz3o9ocsbKZkd4mi2GHRZKQa/a0FBBbJaZGX0Q0vc=; b=Rkkp1pCLy4JrRMjT+xdhAeGReC
	EIG9+ZnkITgAKjH+uK1dKphbQ4OSv4fu7blU+SLNhUHoyfeYOlBWjy1wJP6ONi6JvtO34Wa+V3m8y
	9curoiK+HrR3j7yWNwF+h2O9BOoEYTWS/skkFXHxoQK17Aze8rvsm5/ia8PImdoeHP+noerETdRx6
	fVyoanUfRTa6HIbvBLPqi2DrX9bUy9Ip/TWDd/GlhBth/Ow+ah/HQjaoeD74cu0mWBi0XNLspTrrS
	Qn5OwqGtIQaSiqcOUvx4zuL1fHyHAq3+wd5+WuveHTr+umgcPnmbTYwpQTtqV9zfB6areuP5+A9Tl
	TboPPXng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujaVZ-0000000EmX6-2RdI;
	Wed, 06 Aug 2025 09:32:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujaLL-0000000Ekry-3Sjr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 09:21:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754472114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TLnz3o9ocsbKZkd4mi2GHRZKQa/a0FBBbJaZGX0Q0vc=;
	b=Rs6lFDNdQFKMt7eeGUPW4wYjfy3NLgpV1HWldQGnB02i3cOCAMVfM20zNMTVoTIeCv4PX7
	66b7M1ttbj9rPp9K+S3Nsu9yhf2qEzSHsPMWg2m0gGKRBRYCcQsfiRpqA3oCVYTMDEQ0qv
	hUVuSCq6p/PcO8r33i0/xVvOIq1TWtw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-CjNo_Rm9MFOLWWLzN3wXWg-1; Wed, 06 Aug 2025 05:21:51 -0400
X-MC-Unique: CjNo_Rm9MFOLWWLzN3wXWg-1
X-Mimecast-MFC-AGG-ID: CjNo_Rm9MFOLWWLzN3wXWg_1754472110
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-458bf93f729so19462045e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 02:21:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754472110; x=1755076910;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TLnz3o9ocsbKZkd4mi2GHRZKQa/a0FBBbJaZGX0Q0vc=;
        b=qMCN8+RhRsRncUhh/1AzPgBxpXj/E5eliXfKwLvM/5ex8URSyXyDtZniqKivFWXbrw
         rWvfvAbktVeh9WIaa/SCe2XkmYAlMdLK7elTSkEalksGDRGSCJ8EcTM6s0py59cX8uuU
         viV1njSBei7i2ao24Ksf6B34cBUThkdWko3PVEKQMtWIAE6pZs6alffFzgcIvs7CtKj1
         f4BPk9CPImcNa17z/s5dr0CzQaacjz7fZ/RXlQGs0UWkrW03uH+JgFPKkPeNXcCVyCo9
         +XN2LM5WutNSvGnDbLFa5Vxy5vgRRWo7uPMzERgG4afxoF7ncQvkJLGzSM6LK3xozVw7
         4WBA==
X-Forwarded-Encrypted: i=1; AJvYcCWSSmcild8JANsb51vkX3H4x8Z9+9pbb5rwdMQStcL87SnpxCjj2tjA1K2DAm1giRjz5xsCmBHPQJ7wfC1cf1lv@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4qYz6Xuv19o7zfyFhS1r1hHlNv5j9w2bZ9IQEVsNZBCpKAgCY
	FdZQDmu9Grf+wYqHveXZJFgqXz9lWCxF9x0gsJ5QUuRUDrGCcYEgEt4jHmrH3Yt5jATT4RDHI8O
	FiB88Ls5WXTr2xKnf0/4KimshESA8Z3p/5LhO4P9Wjo1gs1Wq/UDy3JMLjSjniqkD5aT9im2wlX
	rB
X-Gm-Gg: ASbGncs3bT0C6F1IQKA/GXg0p9/8TxeeyOCprrzXBPc++TaT4uu0cxb2nt0TvHqx4Kn
	rtXZr4eEVdLON87tZuCBJHAbz2ctqGYDcA5fPqJU3KSCkUlzoq4/NnkB17kGVwUay43DC3ZgUaC
	JKQfTOxCX+adfK1fjsd7FWgi+taagKPye+Vgimy90yqXG3o72nTp9tujVVtWmp3V575nlbKXmXW
	6EldBRQKauGJhmkG5wDIDR6Hl2TGB/gg0P3OvQDkPqIak99JHIKolaDUrThnu0Z6BokE32nWwEQ
	6Xy5r7n+mOnMjEpQQqNxU8V3TKORgjEBhhUDNhs3J8Gv360pUmD3k3+eMaVb2Y1+l3ZZiw0V3XN
	KU1fM9UIuJKer/kaXDsfZa1zI/cv4XERQCfQj1PzqhZcYtCBIQ/Th7FCYpdYrUrLCdN8=
X-Received: by 2002:a05:600c:1c14:b0:43d:9d5:474d with SMTP id 5b1f17b1804b1-459eb99e605mr326405e9.0.1754472110319;
        Wed, 06 Aug 2025 02:21:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENkbPszpIki01VcMNi4ikQjySykp+PQiRvKbqALptq2NByD+y+1DiNLmRqKUdKH+LjkIWGPA==
X-Received: by 2002:a05:600c:1c14:b0:43d:9d5:474d with SMTP id 5b1f17b1804b1-459eb99e605mr325895e9.0.1754472109803;
        Wed, 06 Aug 2025 02:21:49 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f35:8a00:42f7:2657:34cc:a51f? (p200300d82f358a0042f7265734cca51f.dip0.t-ipconnect.de. [2003:d8:2f35:8a00:42f7:2657:34cc:a51f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459dbba5210sm109716695e9.2.2025.08.06.02.21.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 02:21:49 -0700 (PDT)
Message-ID: <54ee1971-d91a-4fe6-90b8-16212c8568d1@redhat.com>
Date: Wed, 6 Aug 2025 11:21:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] mm: Optimize mprotect() by PTE batching
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org,
 ryan.roberts@arm.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, vbabka@suse.cz, jannh@google.com,
 anshuman.khandual@arm.com, peterx@redhat.com, joey.gouly@arm.com,
 ioworker0@gmail.com, baohua@kernel.org, kevin.brodsky@arm.com,
 quic_zhenhuah@quicinc.com, christophe.leroy@csgroup.eu,
 yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org,
 hughd@google.com, yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250718090244.21092-1-dev.jain@arm.com>
 <20250718090244.21092-7-dev.jain@arm.com>
 <7567c594-7588-49e0-8b09-2a591181b24d@redhat.com>
 <9552ddff-d778-4934-9349-37c7237cbb78@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <9552ddff-d778-4934-9349-37c7237cbb78@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: a4CgxRSwLHgm3v0qbJtb2MBAb7e3tlLf8vV5JYjnjD0_1754472110
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_022155_929088_D04F88D2 
X-CRM114-Status: GOOD (  21.43  )
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

On 06.08.25 11:12, Lorenzo Stoakes wrote:
> On Wed, Aug 06, 2025 at 10:08:33AM +0200, David Hildenbrand wrote:
>> On 18.07.25 11:02, Dev Jain wrote:
>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>
>>
>> I wanted to review this, but looks like it's already upstream and I suspect
>> it's buggy (see the upstream report I cc'ed you on)
>>
>> [...]
>>
>>> +
>>> +/*
>>> + * This function is a result of trying our very best to retain the
>>> + * "avoid the write-fault handler" optimization. In can_change_pte_writable(),
>>> + * if the vma is a private vma, and we cannot determine whether to change
>>> + * the pte to writable just from the vma and the pte, we then need to look
>>> + * at the actual page pointed to by the pte. Unfortunately, if we have a
>>> + * batch of ptes pointing to consecutive pages of the same anon large folio,
>>> + * the anon-exclusivity (or the negation) of the first page does not guarantee
>>> + * the anon-exclusivity (or the negation) of the other pages corresponding to
>>> + * the pte batch; hence in this case it is incorrect to decide to change or
>>> + * not change the ptes to writable just by using information from the first
>>> + * pte of the batch. Therefore, we must individually check all pages and
>>> + * retrieve sub-batches.
>>> + */
>>> +static void commit_anon_folio_batch(struct vm_area_struct *vma,
>>> +		struct folio *folio, unsigned long addr, pte_t *ptep,
>>> +		pte_t oldpte, pte_t ptent, int nr_ptes, struct mmu_gather *tlb)
>>> +{
>>> +	struct page *first_page = folio_page(folio, 0);
>>
>> Who says that we have the first page of the folio mapped into the first PTE
>> of the batch?
> 
> Yikes, missed this sorry. Got too tied up in alogrithm here.
> 
> You mean in _this_ PTE of the batch right? As we're invoking these on each part
> of the PTE table.
> 
> I mean I guess we can simply do:
> 
> 	struct page *first_page = pte_page(ptent);
> 
> Right?

Yes, but we should forward the result from vm_normal_page(), which does
exactly that for you, and increment the page accordingly as required,
just like with the pte we are processing.

...

>>
>>> +			else
>>> +				prot_commit_flush_ptes(vma, addr, pte, oldpte, ptent,
>>> +					nr_ptes, /* idx = */ 0, /* set_write = */ false, tlb);
>>
>> Semi-broken intendation.
> 
> Because of else then 2 lines after?

prot_commit_flush_ptes(vma, addr, pte, oldpte, ptent,
		       nr_ptes, /* idx = */ 0, /* set_write = */ false, tlb);

Is what I would have expected.


I think a smart man once said, that if you need more than one line per statement in
an if/else clause, a set of {} can aid readability. But I don't particularly care :)

-- 
Cheers,

David / dhildenb


