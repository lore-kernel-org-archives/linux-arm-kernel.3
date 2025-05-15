Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2995C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 09:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6wCm2hbe7pzfo8PHyjt4GV45GfCZjxvxaOq9wSw4smU=; b=ogt9khFOiHebWUf7tEm+1OAOeT
	LkA8d8/qqowINzfVmBzGQc8cDGvYeI8DKhPQfDFKh4mmTIqmyUhA3pkdAMwoU+k3Lhj5BWjpTn9Xa
	vwxY4L3EIXxlkjWtco3mhcfgPNz42J4Q7sBjhjM21dgujPtwxeOuuXDlzIoXXRnh2LpbyhN+MKHsO
	N5RwwnVXhW8e21+4idLNdG4ZUe65ysW6gMDxqNWTGsuJsOS1vtTrwDFonLb06ZftKlSKcY/xgroXy
	lRv4Woz2R6PbgmNYYj8clgQATatT8xwGjLgKaviSy1RqXR6YT1houWQy1CBX2RGhJCMUbof6cRuMP
	0jq1P6iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFV1U-00000000BNx-0tTB;
	Thu, 15 May 2025 09:37:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUs7-000000009dF-1zvf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 09:27:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B583314BF;
	Thu, 15 May 2025 02:27:10 -0700 (PDT)
Received: from [10.162.40.26] (K4MQJ0H1H2.blr.arm.com [10.162.40.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 54E303F5A1;
	Thu, 15 May 2025 02:27:19 -0700 (PDT)
Message-ID: <91fc96c3-4931-4f07-a0a9-507ac7b5ae6d@arm.com>
Date: Thu, 15 May 2025 14:57:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: Check pxd_leaf() instead of !pxd_table() while
 tearing down page tables
To: David Hildenbrand <david@redhat.com>, catalin.marinas@arm.com,
 will@kernel.org
Cc: ryan.roberts@arm.com, anshuman.khandual@arm.com, mark.rutland@arm.com,
 yang@os.amperecomputing.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
References: <20250515063450.86629-1-dev.jain@arm.com>
 <332ecda7-14c4-4dc3-aeff-26801b74ca04@redhat.com>
 <4904d02f-6595-4230-a321-23327596e085@arm.com>
 <6fe7848c-485e-4639-b65c-200ed6abe119@redhat.com>
 <35ef7691-7eac-4efa-838d-c504c88c042b@arm.com>
 <c06930f0-f98c-4089-aa33-6789b95fd08f@redhat.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <c06930f0-f98c-4089-aa33-6789b95fd08f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_022723_598768_BCF32A94 
X-CRM114-Status: GOOD (  20.50  )
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



On 15/05/25 2:23 pm, David Hildenbrand wrote:
> On 15.05.25 10:47, Dev Jain wrote:
>>
>>
>> On 15/05/25 2:06 pm, David Hildenbrand wrote:
>>> On 15.05.25 10:22, Dev Jain wrote:
>>>>
>>>>
>>>> On 15/05/25 1:43 pm, David Hildenbrand wrote:
>>>>> On 15.05.25 08:34, Dev Jain wrote:
>>>>>> Commit 9c006972c3fe removes the pxd_present() checks because the 
>>>>>> caller
>>>>>> checks pxd_present(). But, in case of vmap_try_huge_pud(), the caller
>>>>>> only
>>>>>> checks pud_present(); pud_free_pmd_page() recurses on each pmd 
>>>>>> through
>>>>>> pmd_free_pte_page(), wherein the pmd may be none.
>>>>> The commit states: "The core code already has a check for pXd_none()",
>>>>> so I assume that assumption was not true in all cases?
>>>>>
>>>>> Should that one problematic caller then check for pmd_none() instead?
>>>>
>>>>    From what I could gather of Will's commit message, my 
>>>> interpretation is
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
> Right. We just make sure that all callers of pmd_free_pte_page() already 
> check for it.
> 
> I'd just do something like:
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 8fcf59ba39db7..e98dd7af147d5 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1274,10 +1274,8 @@ int pmd_free_pte_page(pmd_t *pmdp, unsigned long 
> addr)
> 
>          pmd = READ_ONCE(*pmdp);
> 
> -       if (!pmd_table(pmd)) {
> -               VM_WARN_ON(1);
> -               return 1;
> -       }
> +       VM_WARN_ON(!pmd_present(pmd));
> +       VM_WARN_ON(!pmd_table(pmd));

And also return 1?
Also we should BUG_ON(!pmd_present(pmd)) to avoid the null dereference?

> 
>          table = pte_offset_kernel(pmdp, addr);
>          pmd_clear(pmdp);
> @@ -1305,7 +1303,8 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long 
> addr)
>          next = addr;
>          end = addr + PUD_SIZE;
>          do {
> -               pmd_free_pte_page(pmdp, next);
> +               if (pmd_present(*pmdp))
> +                       pmd_free_pte_page(pmdp, next);

Ah yes, the "caller" of pmd_free_pte_page() is not only 
vmap_try_huge_pmd but this also...my mind has been foggy lately...
need to solve a math problem or two to sharpen it :)

>          } while (pmdp++, next += PMD_SIZE, next != end);
> 
>          pud_clear(pudp);
> 
> 


