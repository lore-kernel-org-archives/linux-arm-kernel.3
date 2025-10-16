Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF705CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 18:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i70GJVjmJQGS2wDspSfuHtxAzuvaUSabBZXsoebB2VU=; b=S+NfsKBmIIN8UcNjtQosx7Pacv
	C/+PmVmrpxUtV1c6mFYcud0F5akCe95Y4P8ZWNJns9cfdYFBvRzJdOEQweKcSbgeu6a3C+sXf/TrB
	IivM4A0AE8viZVxsagsLNP40Z0+pWgwJaK1rm7fOxr/BjAMnU/MTsPXDknsPH/ijXZsFeuIXNBPD3
	LczWlhtevl7ZcPRkeT2+0O/6/sSTO49NuxZiyoWwtmTH1z2nasCLQRNwluPke4TfCIxvM/ET2F7Zf
	M/4glNQdUrqEO+ftZkR7LYX1XNLow7Qb/6vetFwhZ6tt4Vw02OTB2Q2B2Ak5jHsoHILgFAlHv4e29
	zqPj3pcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9T0X-00000005iws-38KS;
	Thu, 16 Oct 2025 18:47:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9T0V-00000005iw0-0L2F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 18:47:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09F4F1688;
	Thu, 16 Oct 2025 11:47:12 -0700 (PDT)
Received: from [10.163.66.205] (unknown [10.163.66.205])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D55E3F738;
	Thu, 16 Oct 2025 11:47:17 -0700 (PDT)
Message-ID: <07a70cbf-dbb5-4444-8393-24c49e53a93f@arm.com>
Date: Fri, 17 Oct 2025 00:17:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: mm: make linear mapping permission update more
 robust for patial range
To: Yang Shi <yang@os.amperecomputing.com>, ryan.roberts@arm.com,
 cl@gentwo.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251013232803.3065100-1-yang@os.amperecomputing.com>
 <20251013232803.3065100-2-yang@os.amperecomputing.com>
 <00bf0498-8f11-466e-9f2a-f7e656ecddf9@arm.com>
 <8943fe0e-0bf7-49a4-bf58-efe08bfd037d@os.amperecomputing.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <8943fe0e-0bf7-49a4-bf58-efe08bfd037d@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_114723_154679_1F2CA2F9 
X-CRM114-Status: GOOD (  16.59  )
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


On 17/10/25 12:15 am, Yang Shi wrote:
>
>
> On 10/14/25 11:46 PM, Dev Jain wrote:
>>
>> On 14/10/25 4:57 am, Yang Shi wrote:
>>> The commit fcf8dda8cc48 ("arm64: pageattr: Explicitly bail out when 
>>> changing
>>> permissions for vmalloc_huge mappings") made permission update for
>>> partial range more robust. But the linear mapping permission update
>>> still assumes update the whole range by iterating from the first page
>>> all the way to the last page of the area.
>>>
>>> Make it more robust by updating the linear mapping permission from the
>>> page mapped by start address, and update the number of numpages.
>>>
>>> Fixes: fcf8dda8cc48 ("arm64: pageattr: Explicitly bail out when 
>>> changing permissions for vmalloc_huge mappings")
>>> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
>>> ---
>>>   arch/arm64/mm/pageattr.c | 6 +++---
>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
>>> index 5135f2d66958..c21a2c319028 100644
>>> --- a/arch/arm64/mm/pageattr.c
>>> +++ b/arch/arm64/mm/pageattr.c
>>> @@ -148,7 +148,6 @@ static int change_memory_common(unsigned long 
>>> addr, int numpages,
>>>       unsigned long size = PAGE_SIZE * numpages;
>>>       unsigned long end = start + size;
>>>       struct vm_struct *area;
>>> -    int i;
>>>         if (!PAGE_ALIGNED(addr)) {
>>>           start &= PAGE_MASK;
>>> @@ -184,8 +183,9 @@ static int change_memory_common(unsigned long 
>>> addr, int numpages,
>>>        */
>>>       if (rodata_full && (pgprot_val(set_mask) == PTE_RDONLY ||
>>>                   pgprot_val(clear_mask) == PTE_RDONLY)) {
>>> -        for (i = 0; i < area->nr_pages; i++) {
>>> - __change_memory_common((u64)page_address(area->pages[i]),
>>> +        unsigned long idx = (start - (unsigned long)area->addr) >> 
>>> PAGE_SHIFT;
>>> +        for (int i = 0; i < numpages; i++) {
>>> + __change_memory_common((u64)page_address(area->pages[idx++]),
>>>                              PAGE_SIZE, set_mask, clear_mask);
>>
>> Why not just use idx as the iterator in the for loop? Using i and 
>> then incrementing
>> idx is confusing.
>
> You meant something like:
>
> while (idx < idx + numpages)
>
> It is fine to me.

for loop is simpler :)


>
>>
>> As noted by Ryan, the fixes commit is wrong. The issues persists from 
>> commit c55191e.
>>
>> After fixing these:
>>
>> Reviewed-by: Dev Jain <dev.jain@arm.com>
>
> Thank you.
>
> Yang
>
>>
>>>           }
>>>       }
>

