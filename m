Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A418DC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 10:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gb1sQLiOdkTwXGQI8snYFomx3ioTPL04QJ+FR44XH0Q=; b=ijFeLXArJ9P3jTHIeNPMeuCx5a
	qfmgluep9JVo97lw2M+J0CZOKHj27y0oe6Vx1UeA51gKfzNQn+oMo+m3ISYMLcxMISUIw4/cGz5HG
	nac21gOpTSfnND0aahJe24d3iIB8P66Hdv5DK3khgJD5sud5Np757o/CYmLJWndUYCIe/CT8EZ5ul
	U+kIYajwd81mY0y5ehOixF2O8fXBhbmKdy7iuxAP770G/pLVZHBYdgmp26Vbkd+sk+3D3sbztA7mB
	6pd565cOWKRm5EFeRyEFT+cZNWK2CcDIg0Jm8uQCCrBeK1rro2afHbHYwvqbwTEhFuZlZQCqyNDE9
	8212PuDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFVvC-00000000JCZ-2c89;
	Thu, 15 May 2025 10:34:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFVUb-00000000Fzt-1TXd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 10:07:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5097114BF;
	Thu, 15 May 2025 03:06:55 -0700 (PDT)
Received: from [10.1.32.187] (XHFQ2J9959.cambridge.arm.com [10.1.32.187])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 73AA93F673;
	Thu, 15 May 2025 03:07:05 -0700 (PDT)
Message-ID: <bac0d8e2-6219-4eb2-b4c8-b82b208808b5@arm.com>
Date: Thu, 15 May 2025 11:07:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: Check pxd_leaf() instead of !pxd_table() while
 tearing down page tables
Content-Language: en-GB
To: David Hildenbrand <david@redhat.com>, Dev Jain <dev.jain@arm.com>,
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
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <c06930f0-f98c-4089-aa33-6789b95fd08f@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_030709_476136_5A5E5FAF 
X-CRM114-Status: GOOD (  24.83  )
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

On 15/05/2025 09:53, David Hildenbrand wrote:
> On 15.05.25 10:47, Dev Jain wrote:
>>
>>
>> On 15/05/25 2:06 pm, David Hildenbrand wrote:
>>> On 15.05.25 10:22, Dev Jain wrote:
>>>>
>>>>
>>>> On 15/05/25 1:43 pm, David Hildenbrand wrote:
>>>>> On 15.05.25 08:34, Dev Jain wrote:
>>>>>> Commit 9c006972c3fe removes the pxd_present() checks because the caller
>>>>>> checks pxd_present(). But, in case of vmap_try_huge_pud(), the caller
>>>>>> only
>>>>>> checks pud_present(); pud_free_pmd_page() recurses on each pmd through
>>>>>> pmd_free_pte_page(), wherein the pmd may be none.
>>>>> The commit states: "The core code already has a check for pXd_none()",
>>>>> so I assume that assumption was not true in all cases?
>>>>>
>>>>> Should that one problematic caller then check for pmd_none() instead?
>>>>
>>>>    From what I could gather of Will's commit message, my interpretation is
>>>> that the concerned callers are vmap_try_huge_pud and vmap_try_huge_pmd.
>>>> These individually check for pxd_present():
>>>>
>>>> if (pmd_present(*pmd) && !pmd_free_pte_page(pmd, addr))
>>>>      return 0;
>>>>
>>>> The problem is that vmap_try_huge_pud will also iterate on pte entries.
>>>> So if the pud is present, then pud_free_pmd_page -> pmd_free_pte_page
>>>> may encounter a none pmd and trigger a WARN.
>>>
>>> Yeah, pud_free_pmd_page()->pmd_free_pte_page() looks shaky.
>>>
>>> I assume we should either have an explicit pmd_none() check in
>>> pud_free_pmd_page() before calling pmd_free_pte_page(), or one in
>>> pmd_free_pte_page().
>>>
>>> With your patch, we'd be calling pte_free_kernel() on a NULL pointer,
>>> which sounds wrong -- unless I am missing something important.
>>
>> Ah thanks, you seem to be right. We will be extracting table from a none
>> pmd. Perhaps we should still bail out for !pxd_present() but without the
>> warning, which the fix commit used to do.
> 
> Right. We just make sure that all callers of pmd_free_pte_page() already check
> for it.
> 
> I'd just do something like:

I just reviewed the patch and had the same feedback as David. I agree with the
patch below, with some small mods...

> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 8fcf59ba39db7..e98dd7af147d5 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1274,10 +1274,8 @@ int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>  
>         pmd = READ_ONCE(*pmdp);
>  
> -       if (!pmd_table(pmd)) {
> -               VM_WARN_ON(1);
> -               return 1;
> -       }
> +       VM_WARN_ON(!pmd_present(pmd));
> +       VM_WARN_ON(!pmd_table(pmd));

You don't need both of these warnings; pmd_table() is only true if the pmd is
present (well actually only if it's _valid_ which is more strict than present),
so the second one is sufficient on its own.

>  
>         table = pte_offset_kernel(pmdp, addr);
>         pmd_clear(pmdp);
> @@ -1305,7 +1303,8 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)

Given you are removing the runtime check and early return in
pmd_free_pte_page(), I think you should modify this function to use the same
style too.

>         next = addr;
>         end = addr + PUD_SIZE;
>         do {
> -               pmd_free_pte_page(pmdp, next);
> +               if (pmd_present(*pmdp))

question: I wonder if it is better to use !pmd_none() as the condition here? It
should either be none or a table at this point, so this allows the warning in
pmd_free_pte_page() to catch more error conditions. No strong opinion though.

Thanks,
Ryan

> +                       pmd_free_pte_page(pmdp, next);
>         } while (pmdp++, next += PMD_SIZE, next != end);
>  
>         pud_clear(pudp);
> 
> 


