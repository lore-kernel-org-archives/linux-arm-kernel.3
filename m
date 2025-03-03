Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86775C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 09:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ykua7q7gnustm8lPrA9ZG6NARq70FXycw/3eNBtt0hs=; b=SnNrjc8SIXmCrLdVkeLbOdZHYb
	p23RVjSUkx6Gif0fNen5BjUUjOBTymCfryif7ylMUzAbRW3CCdKqsfrLwMPbK1wJLNL2n0JTQp4KO
	BVpwoPeUC6GLCdTlZ/7BfWVKNGBmE9NUIS9G3IRDazBbmDUKnMnE3W4wMGTve3A665zvYdWDvYNYT
	fehLoSd4QnB0JGu3wLLBpTpUaEgKN398x07idgUz+eBHMLSaJqXK5egnm1HQMCAUPchH/h9cUdckg
	oUqHH6j2OAvGuCMYS2aQbYEr7eicwX8Dfgr8c3/ZDC02PFZL5Zcr09PM2yU2gQmpsLnEA+RrYouUQ
	6FcIo7/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp2aI-00000000GUm-1HxT;
	Mon, 03 Mar 2025 09:59:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp2YI-00000000G2E-0ejU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 09:57:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740995853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ykua7q7gnustm8lPrA9ZG6NARq70FXycw/3eNBtt0hs=;
	b=JzVrq0hNxNd8dxr7Qxov2MANuOLxmUKNlHetNlncRYNqG91lDrzHBkx3XjldVzWlLEvfCd
	kA2W23epW4K5Cv83wSLJcWM5VnaNICX2gGJL3J+kyGaKRIJCTZNDU5Zco3UYgAVvL8bNGN
	t+n99stkSkDmyu+90MI+Fq4vQGPXGoc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-332-tdlEV4CCMuW4WrolC4VqCQ-1; Mon, 03 Mar 2025 04:57:24 -0500
X-MC-Unique: tdlEV4CCMuW4WrolC4VqCQ-1
X-Mimecast-MFC-AGG-ID: tdlEV4CCMuW4WrolC4VqCQ_1740995844
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3910cd78330so199402f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 01:57:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740995843; x=1741600643;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ykua7q7gnustm8lPrA9ZG6NARq70FXycw/3eNBtt0hs=;
        b=SBfatgXJBLfbI2reg/2AukuERBovHExr3eENNAvdYyiQJaHoKvU+mruNvuOI95+/5T
         6j5wNjvD65oylwpHMBkYi2fLycKKbajfxF1rKJHSVsm1EllepwfWYDmR+lJ7Rmj/ePRt
         E47RA7OQrwYpBH/9D0ljgwftWY7d+rrYM+NKlqJKUyDVFuL/+x8FOQ+mvHwIpf7GfdDs
         EedKxwO8Z/IzclMheNcLNhKUcP9/AKkfzr/PXFPcH3wKYBZDWCoWA1B1aHUhipT7jKSh
         Op4PtRltsq8gxfN8ACaerlLxUV0Q5IMC2lwTpfitP0SWn13R7OwJfc96PQb094dZJGsR
         E8IA==
X-Forwarded-Encrypted: i=1; AJvYcCVld+Fe6bQE16CzexzbqtiQI5ZM3G6FOO4eZp12yRq68fM8TZ0nUYPeBU9vrmkW+rYZa9pYkHhc1iyZNHRu+26/@lists.infradead.org
X-Gm-Message-State: AOJu0YwebxE/sC/ausozft61qsluPLIz+ZFBvaE3wCbb9lqycIenvaLb
	jo1EXr2J5bPwEfw7GxeMuLXYJeBNRJp1NOHRHepE4075nB8lTH537NFt6Li3wS+h3vUKZ1DwfvI
	weSCKXruesC/y+0twT6hzK1SIvLeKGEyf3Kt+gfq12um7wybpbsALzPT0SVP3ccgWoY9IGIWA
X-Gm-Gg: ASbGncuKP6lpg7PFErfArpP9jY78AevdDUnRFkL+5eGW2+PTEU9+FPOIcxM8o2M4MjS
	gdFkC4XTGfelhcNS971zuGmYxuRl6R6KY1UqxoqviX2sRrdth05zOfHWkjpbbFy25sP2wAaTGF+
	XDNf5OaGNDPWTwC2i5IK4RRPTU7wp61cpOb0JZiKXEIpSMbeiv09fb3I84qKoZXfX4NKvRVlK+y
	/Q4LdPKL/PBNnn3zorCvCc+yBY85bSkW/SZHmIcRCEWs1YK9sbp4aUyNZzRZcqUDg6eHERSUf6G
	qOoXQLMUIuYKgCXMi+GzW4VfXNL0NAtEIkTT2mWuyeUPc0GkUOfQRTXgpoMJKfkzKzO4KmDDME6
	LoMf/gfxm5NNomBdsug9mn/Yy+ZvNxxFqD1JOWO47Fvg=
X-Received: by 2002:a05:6000:178b:b0:390:e7c1:59d3 with SMTP id ffacd0b85a97d-390ec7c6abamr9721383f8f.2.1740995843578;
        Mon, 03 Mar 2025 01:57:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHyA1rt+UhzjYjejJGIWpt5BNfcz7BL9jMerlSYdXlUaUi7HhGoy2uwdvEypDw3lLTiKoqZLw==
X-Received: by 2002:a05:6000:178b:b0:390:e7c1:59d3 with SMTP id ffacd0b85a97d-390ec7c6abamr9721350f8f.2.1740995843219;
        Mon, 03 Mar 2025 01:57:23 -0800 (PST)
Received: from ?IPV6:2003:cb:c734:9600:af27:4326:a216:2bfb? (p200300cbc7349600af274326a2162bfb.dip0.t-ipconnect.de. [2003:cb:c734:9600:af27:4326:a216:2bfb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4795da5sm14193732f8f.15.2025.03.03.01.57.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 01:57:22 -0800 (PST)
Message-ID: <7e987f17-ffcb-45e0-8588-2d569d90f776@redhat.com>
Date: Mon, 3 Mar 2025 10:57:21 +0100
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
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZgEEwEIAEICGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAhkBFiEEG9nKrXNcTDpGDfzKTd4Q9wD/g1oFAl8Ox4kFCRKpKXgACgkQTd4Q
 9wD/g1oHcA//a6Tj7SBNjFNM1iNhWUo1lxAja0lpSodSnB2g4FCZ4R61SBR4l/psBL73xktp
 rDHrx4aSpwkRP6Epu6mLvhlfjmkRG4OynJ5HG1gfv7RJJfnUdUM1z5kdS8JBrOhMJS2c/gPf
 wv1TGRq2XdMPnfY2o0CxRqpcLkx4vBODvJGl2mQyJF/gPepdDfcT8/PY9BJ7FL6Hrq1gnAo4
 3Iv9qV0JiT2wmZciNyYQhmA1V6dyTRiQ4YAc31zOo2IM+xisPzeSHgw3ONY/XhYvfZ9r7W1l
 pNQdc2G+o4Di9NPFHQQhDw3YTRR1opJaTlRDzxYxzU6ZnUUBghxt9cwUWTpfCktkMZiPSDGd
 KgQBjnweV2jw9UOTxjb4LXqDjmSNkjDdQUOU69jGMUXgihvo4zhYcMX8F5gWdRtMR7DzW/YE
 BgVcyxNkMIXoY1aYj6npHYiNQesQlqjU6azjbH70/SXKM5tNRplgW8TNprMDuntdvV9wNkFs
 9TyM02V5aWxFfI42+aivc4KEw69SE9KXwC7FSf5wXzuTot97N9Phj/Z3+jx443jo2NR34XgF
 89cct7wJMjOF7bBefo0fPPZQuIma0Zym71cP61OP/i11ahNye6HGKfxGCOcs5wW9kRQEk8P9
 M/k2wt3mt/fCQnuP/mWutNPt95w9wSsUyATLmtNrwccz63XOwU0EVcufkQEQAOfX3n0g0fZz
 Bgm/S2zF/kxQKCEKP8ID+Vz8sy2GpDvveBq4H2Y34XWsT1zLJdvqPI4af4ZSMxuerWjXbVWb
 T6d4odQIG0fKx4F8NccDqbgHeZRNajXeeJ3R7gAzvWvQNLz4piHrO/B4tf8svmRBL0ZB5P5A
 2uhdwLU3NZuK22zpNn4is87BPWF8HhY0L5fafgDMOqnf4guJVJPYNPhUFzXUbPqOKOkL8ojk
 CXxkOFHAbjstSK5Ca3fKquY3rdX3DNo+EL7FvAiw1mUtS+5GeYE+RMnDCsVFm/C7kY8c2d0G
 NWkB9pJM5+mnIoFNxy7YBcldYATVeOHoY4LyaUWNnAvFYWp08dHWfZo9WCiJMuTfgtH9tc75
 7QanMVdPt6fDK8UUXIBLQ2TWr/sQKE9xtFuEmoQGlE1l6bGaDnnMLcYu+Asp3kDT0w4zYGsx
 5r6XQVRH4+5N6eHZiaeYtFOujp5n+pjBaQK7wUUjDilPQ5QMzIuCL4YjVoylWiBNknvQWBXS
 lQCWmavOT9sttGQXdPCC5ynI+1ymZC1ORZKANLnRAb0NH/UCzcsstw2TAkFnMEbo9Zu9w7Kv
 AxBQXWeXhJI9XQssfrf4Gusdqx8nPEpfOqCtbbwJMATbHyqLt7/oz/5deGuwxgb65pWIzufa
 N7eop7uh+6bezi+rugUI+w6DABEBAAHCwXwEGAEIACYCGwwWIQQb2cqtc1xMOkYN/MpN3hD3
 AP+DWgUCXw7HsgUJEqkpoQAKCRBN3hD3AP+DWrrpD/4qS3dyVRxDcDHIlmguXjC1Q5tZTwNB
 boaBTPHSy/Nksu0eY7x6HfQJ3xajVH32Ms6t1trDQmPx2iP5+7iDsb7OKAb5eOS8h+BEBDeq
 3ecsQDv0fFJOA9ag5O3LLNk+3x3q7e0uo06XMaY7UHS341ozXUUI7wC7iKfoUTv03iO9El5f
 XpNMx/YrIMduZ2+nd9Di7o5+KIwlb2mAB9sTNHdMrXesX8eBL6T9b+MZJk+mZuPxKNVfEQMQ
 a5SxUEADIPQTPNvBewdeI80yeOCrN+Zzwy/Mrx9EPeu59Y5vSJOx/z6OUImD/GhX7Xvkt3kq
 Er5KTrJz3++B6SH9pum9PuoE/k+nntJkNMmQpR4MCBaV/J9gIOPGodDKnjdng+mXliF3Ptu6
 3oxc2RCyGzTlxyMwuc2U5Q7KtUNTdDe8T0uE+9b8BLMVQDDfJjqY0VVqSUwImzTDLX9S4g/8
 kC4HRcclk8hpyhY2jKGluZO0awwTIMgVEzmTyBphDg/Gx7dZU1Xf8HFuE+UZ5UDHDTnwgv7E
 th6RC9+WrhDNspZ9fJjKWRbveQgUFCpe1sa77LAw+XFrKmBHXp9ZVIe90RMe2tRL06BGiRZr
 jPrnvUsUUsjRoRNJjKKA/REq+sAnhkNPPZ/NNMjaZ5b8Tovi8C0tmxiCHaQYqj7G2rgnT0kt
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250303094947.GB13345@e133081.arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8Lc_-dsCJ-aMH-Jh36A_zqAGXULQ3GeF0trzYsQCtl8_1740995844
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_015734_271706_A6C2A63B 
X-CRM114-Status: GOOD (  26.16  )
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

On 03.03.25 10:49, Mikołaj Lenczewski wrote:
> Hi David,
> 
> Thanks for taking the time to review.
> 
> On Mon, Mar 03, 2025 at 10:17:12AM +0100, David Hildenbrand wrote:
>> On 28.02.25 19:24, Mikołaj Lenczewski wrote:
>>> If we support bbml2 without conflict aborts, we can avoid the final
>>> flush and have hardware manage the tlb entries for us. Avoiding flushes
>>> is a win.
>>>
>>> Signed-off-by: Mikołaj Lenczewski <miko.lenczewski@arm.com>
>>> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
>>> ---
>>>    arch/arm64/mm/contpte.c | 3 ---
>>>    1 file changed, 3 deletions(-)
>>>
>>> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
>>> index 145530f706a9..77ed03b30b72 100644
>>> --- a/arch/arm64/mm/contpte.c
>>> +++ b/arch/arm64/mm/contpte.c
>>> @@ -72,9 +72,6 @@ static void contpte_convert(struct mm_struct *mm, unsigned long addr,
>>>    		__flush_tlb_range(&vma, start_addr, addr, PAGE_SIZE, true, 3);
>>>    	__set_ptes(mm, start_addr, start_ptep, pte, CONT_PTES);
>>> -
>>> -	if (system_supports_bbml2_noabort())
>>> -		__flush_tlb_range(&vma, start_addr, addr, PAGE_SIZE, true, 3);
>>>    }
>>>    void __contpte_try_fold(struct mm_struct *mm, unsigned long addr,
>>
>> What's the point of not squashing this into #2? :)
>>
>> If this split was requested during earlier review, at least seeing patch #2
>> on its own confused me.
> 
> This split is a holdover from an earlier patchset, where it was still
> unknown whether the removal of the second flush was permitted with
> BBML2. Partly this was due to us being worried about conflict aborts
> after the removal, and partly this was because the "delay" is a separate
> optimisation that we could apply even if it turned out the final patch
> was not architecturally sound.
> 
> Now that we do not handle conflict aborts (preferring only systems that
> handle BBML2 without ever raising aborts), the first issue is not a
> problem. The reasoning behind the second patch is also a little bit
> outdated, but I can see the logical split between a tlbi reorder, and
> the removal of the tlbi. If this is truly redundant though, I would be
> happy to squash the two into a single patch.

Thanks for the information.

Does patch #2 (reordering the tlbi) have any benefit on its own? I read 
"other threads will not see an invalid pagetable entry", but I am not 
sure that is correct. A concurrent HW page table walker would still find 
the invalid PTE? It's just a matter of TLB state.

If there is no benefit in having patch #2 independently, I'd just squash 
them. Reordering to then remove is more complicated than just removing 
it IMHO.

-- 
Cheers,

David / dhildenb


