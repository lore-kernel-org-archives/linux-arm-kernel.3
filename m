Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35267CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 09:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0lZPE/bH6SuGSQVpdFKCn/Qw+gV61APnt/lm/zaiU9g=; b=ucl1k8YbxcV3R1qw8h/B7zSQY/
	TWqGRHbQBIYSBlfN8Ykcpn7WkjR20J6+oQRbMwpIrVf5lLBoNMsfbI8kmLs3ukn0XEFDvOxgZ7/Ju
	HBRyMuzI19hMhf85U/0zNM24R0JvhofWjVO7O9O9Nl5RZdoV19Jin9bi6+4qV44giU7ZbrsSZGNfh
	bX2nloJJe73ZWtZGTI4+QxSwFW+rfOx4Ua+NLrdCk8rhS7wKeyYKPqsfD6GNgXPhuDBiID7ghNfrj
	tAzHDDFQVN0bThNykatQC3Z6aaAF8fdhDophPf40XK6B16HdN90aG63DJc9PtFXwpQXtAqwy32wqM
	A01jRHOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v79nX-00000008Chz-2lsz;
	Fri, 10 Oct 2025 09:52:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v79nV-00000008ChM-3f1B
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 09:52:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3FF9C1595;
	Fri, 10 Oct 2025 02:52:15 -0700 (PDT)
Received: from [10.57.81.94] (unknown [10.57.81.94])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 014A93F66E;
	Fri, 10 Oct 2025 02:52:20 -0700 (PDT)
Message-ID: <6f40ee64-6ef6-4741-8319-ae330df881a9@arm.com>
Date: Fri, 10 Oct 2025 10:52:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: pageattr: Explicitly bail out when changing
 permissions for vmalloc_huge mappings
Content-Language: en-GB
To: Yang Shi <yang@os.amperecomputing.com>, Dev Jain <dev.jain@arm.com>,
 catalin.marinas@arm.com, will@kernel.org
Cc: gshan@redhat.com, rppt@kernel.org, steven.price@arm.com,
 suzuki.poulose@arm.com, tianyaxiong@kylinos.cn, ardb@kernel.org,
 david@redhat.com, urezki@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250328062103.79462-1-dev.jain@arm.com>
 <831e9e0c-a61b-40d8-a8d2-747b760ba6b3@os.amperecomputing.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <831e9e0c-a61b-40d8-a8d2-747b760ba6b3@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_025226_036887_03063012 
X-CRM114-Status: GOOD (  27.18  )
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

Hi Yang,


On 09/10/2025 21:26, Yang Shi wrote:
> 
> 
> On 3/27/25 11:21 PM, Dev Jain wrote:
>> arm64 uses apply_to_page_range to change permissions for kernel VA mappings,
>> which does not support changing permissions for leaf mappings. This function
>> will change permissions until it encounters a leaf mapping, and will bail
>> out. To avoid this partial change, explicitly disallow changing permissions
>> for VM_ALLOW_HUGE_VMAP mappings.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   arch/arm64/mm/pageattr.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
>> index 39fd1f7ff02a..8337c88eec69 100644
>> --- a/arch/arm64/mm/pageattr.c
>> +++ b/arch/arm64/mm/pageattr.c
>> @@ -96,7 +96,7 @@ static int change_memory_common(unsigned long addr, int
>> numpages,
>>        * we are operating on does not result in such splitting.
>>        *
>>        * Let's restrict ourselves to mappings created by vmalloc (or vmap).
>> -     * Those are guaranteed to consist entirely of page mappings, and
>> +     * Disallow VM_ALLOW_HUGE_VMAP vmalloc mappings so that
>>        * splitting is never needed.
>>        *
>>        * So check whether the [addr, addr + size) interval is entirely
>> @@ -105,7 +105,7 @@ static int change_memory_common(unsigned long addr, int
>> numpages,
>>       area = find_vm_area((void *)addr);
>>       if (!area ||
>>           end > (unsigned long)kasan_reset_tag(area->addr) + area->size ||
>> -        !(area->flags & VM_ALLOC))
>> +        ((area->flags & (VM_ALLOC | VM_ALLOW_HUGE_VMAP)) != VM_ALLOC))
>>           return -EINVAL;
> 
> I happened to find this patch when I was looking into fixing "splitting is never
> needed" comment to reflect the latest change with BBML2_NOABORT and tried to
> relax this restriction. I agree with the justification for this patch to make
> the code more robust for permission update on partial range. But the following
> linear mapping permission update code seems still assume partial range update
> never happens:
> 
> for (i = 0; i < area->nr_pages; i++) {
> 
> It iterates all pages for this vm area from the first page then update their
> permissions. So I think we should do the below to make it more robust to partial
> range update like this patch did:

Ahh so the issue is that [addr, addr + numpages * PAGE_SIZE) may only cover a
portion of the vm area? But the current code updates the permissions for the
whole vm area? Ouch...

> 
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -185,8 +185,9 @@ static int change_memory_common(unsigned long addr, int
> numpages,
>          */
>         if (rodata_full && (pgprot_val(set_mask) == PTE_RDONLY ||
>                             pgprot_val(clear_mask) == PTE_RDONLY)) {
> -               for (i = 0; i < area->nr_pages; i++) {
> -  __change_memory_common((u64)page_address(area->pages[i]),
> +               unsigned long idx = (start - (unsigned long)area->addr) >>
> PAGE_SHIFT;
> +               for (i = 0; i < numpages; i++) {
> +  __change_memory_common((u64)page_address(area->pages[idx++]),
>                                                PAGE_SIZE, set_mask, clear_mask);
>                 }
>         }
> 
> Just build tested. Does it look reasonable?

Yes that looks correct to me! Will you submit a patch?

Thanks,
Ryan

> 
> Thanks,
> Yang
> 
> 
>>         if (!numpages)
> 


