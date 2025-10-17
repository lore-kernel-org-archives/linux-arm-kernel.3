Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FCA4CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 15:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zqrBbJQHrzdg5ihOkfwdj5j2Jktg19twrQpQ3paXEHA=; b=Z+HO7FxQA64xJDtrGBBOArXrvu
	bCz8YvCC3ybIpDUc/e4mcGkY3BpZZ6uojn2CQhL3/eRtxu9hs5dg3ZPR4Mx2nqsZv0eDLkd+flK8I
	OtukGKKBgP1xxIf3MZWGHODJpeKcsiYkzRcTfkEan7H2PySlyWxpLLiplZ+8H399XNtLUBmbsTBdm
	j5SYCEdzG7BnCNqvDmYVKZW0zqUGm6JiHTNtX8vCDOdLLrS98htNmUZimkRCxWCc35SXnFymJjxn0
	TG8hchP5CmRBKt2Gbffy9Itjloblfqb8RhRNPpbZFjMFWrg4jdoOI74NB+kk+RtABzHmrwnIQ1O90
	MhK0B8Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9miq-00000008KAd-48zO;
	Fri, 17 Oct 2025 15:50:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mig-00000008K9B-0mSj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 15:50:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 722161595;
	Fri, 17 Oct 2025 08:50:09 -0700 (PDT)
Received: from [10.163.68.204] (unknown [10.163.68.204])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A5A7C3F66E;
	Fri, 17 Oct 2025 08:50:14 -0700 (PDT)
Message-ID: <ceae80d4-ae63-4bf7-bf97-1d6b5b090aad@arm.com>
Date: Fri, 17 Oct 2025 21:20:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: mm: relax VM_ALLOW_HUGE_VMAP if BBML2_NOABORT
 is supported
To: Yang Shi <yang@os.amperecomputing.com>, ryan.roberts@arm.com,
 cl@gentwo.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251013232803.3065100-1-yang@os.amperecomputing.com>
 <20251013232803.3065100-3-yang@os.amperecomputing.com>
 <eaa67b0d-e256-4db6-82e7-c4d56df70c09@arm.com>
 <05331884-9723-48ff-a3ce-c2ea023bbabd@os.amperecomputing.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <05331884-9723-48ff-a3ce-c2ea023bbabd@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_085022_208295_714FCB55 
X-CRM114-Status: GOOD (  21.73  )
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


On 17/10/25 12:20 am, Yang Shi wrote:
>
>
> On 10/14/25 11:50 PM, Dev Jain wrote:
>>
>> On 14/10/25 4:57 am, Yang Shi wrote:
>>> When changing permissions for vmalloc area, VM_ALLOW_HUGE_VMAP area is
>>> exclueded because kernel can't split the va mapping if it is called on
>>> partial range.
>>> It is no longer true if the machines support BBML2_NOABORT after commit
>>> a166563e7ec3 ("arm64: mm: support large block mapping when 
>>> rodata=full").
>>> So we can relax this restriction and update the comments accordingly.
>>>
>>> Fixes: a166563e7ec3 ("arm64: mm: support large block mapping when 
>>> rodata=full")
>>> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
>>> ---
>>>   arch/arm64/mm/pageattr.c | 13 +++++++------
>>>   1 file changed, 7 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
>>> index c21a2c319028..b4dcae6273a8 100644
>>> --- a/arch/arm64/mm/pageattr.c
>>> +++ b/arch/arm64/mm/pageattr.c
>>> @@ -157,13 +157,13 @@ static int change_memory_common(unsigned long 
>>> addr, int numpages,
>>>         /*
>>>        * Kernel VA mappings are always live, and splitting live section
>>> -     * mappings into page mappings may cause TLB conflicts. This means
>>> -     * we have to ensure that changing the permission bits of the 
>>> range
>>> -     * we are operating on does not result in such splitting.
>>> +     * mappings into page mappings may cause TLB conflicts on the 
>>> machines
>>> +     * which don't support BBML2_NOABORT.
>>>        *
>>>        * Let's restrict ourselves to mappings created by vmalloc (or 
>>> vmap).
>>> -     * Disallow VM_ALLOW_HUGE_VMAP mappings to guarantee that only 
>>> page
>>> -     * mappings are updated and splitting is never needed.
>>> +     * Disallow VM_ALLOW_HUGE_VMAP mappings if the systems don't 
>>> support
>>> +     * BBML2_NOABORT to guarantee that only page mappings are 
>>> updated and
>>> +     * splitting is never needed on those machines.
>>>        *
>>>        * So check whether the [addr, addr + size) interval is entirely
>>>        * covered by precisely one VM area that has the VM_ALLOC flag 
>>> set.
>>> @@ -171,7 +171,8 @@ static int change_memory_common(unsigned long 
>>> addr, int numpages,
>>>       area = find_vm_area((void *)addr);
>>>       if (!area ||
>>>           end > (unsigned long)kasan_reset_tag(area->addr) + 
>>> area->size ||
>>> -        ((area->flags & (VM_ALLOC | VM_ALLOW_HUGE_VMAP)) != VM_ALLOC))
>>> +        !(area->flags & VM_ALLOC) || ((area->flags & 
>>> VM_ALLOW_HUGE_VMAP) &&
>>> +        !system_supports_bbml2_noabort()))
>>>           return -EINVAL;
>>>         if (!numpages)
>>
>> This will conflict with my upcoming vmalloc-huge series, so best to 
>> leave it to me,
>> I already have this included :)
>
> My point is that I hope this can be merged as a hotfix for 6.18. I 
> have no strong opinion on either the maintainers take this one or from 
> your series. But if this will go into 6.18 as a hotfix, it should be 
> also a prerequisite patch (standalone)  in your series, and the rest 
> of your series should be based on top of it. Of course this argument 
> will not stand if we don't care to have it fixed for 6.18.

I see what you mean, but I don't think this patch should be treated as a 
hotfix. We forgot to relax a

restriction - that's fine. That is not an incorrectness in the linear 
map series. A fix usually

fixes an incorrectness.


>
> Thanks,
> Yang
>
>

