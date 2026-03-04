Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8385BEB7EB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 08:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ohlWnh+Q4ts86aSM5+7uGCFx/1obS6W5KjCXH6kjEwQ=; b=BGW8dtlOvZJ2chwPq21v7tUcYc
	kvHTLpSUAN0peqZyPDBJ9UZQkI9A3tblBROgxUxFxsk7HC1dwYp9ddJTK7EUmNkAeF0ALSDujmdMH
	UC75Zab9o4NxKQTnV/nFM6xNmUWjRB88X7ovIqUFC7vY2vNjODx3H0NuHc5RQlKooClqz6vcFmz15
	nDqXTbD/jcZtP6LABFn1XvPZ0eBPLVLnIynOcyrfJRJXTuLhG9wxosoeTp/lIjqF5LqKloWUE5ozI
	XRkqzRbb9SF0fUYyCfXSrpPB4T7DO4mWSG4TfdYSL3DbySarMKceEHF46fEkCj1neO+jBMgSJ9ZRk
	onRh4cYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhzH-0000000GnB0-1wfn;
	Wed, 04 Mar 2026 08:53:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhzF-0000000GnAb-0G94
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 08:53:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5EDEF339;
	Wed,  4 Mar 2026 00:53:36 -0800 (PST)
Received: from [10.163.173.252] (unknown [10.163.173.252])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 435D93F7BD;
	Wed,  4 Mar 2026 00:53:38 -0800 (PST)
Message-ID: <e73c1597-9a98-402c-9665-e67c1270cde7@arm.com>
Date: Wed, 4 Mar 2026 14:23:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/2] arm64/mm: Reject memory removal that splits a
 kernel leaf mapping
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Yang Shi <yang@os.amperecomputing.com>, Christoph Lameter <cl@gentwo.org>,
 linux-kernel@vger.kernel.org
References: <20260224062423.972404-1-anshuman.khandual@arm.com>
 <20260224062423.972404-3-anshuman.khandual@arm.com>
 <6eee7f14-c3f2-4e16-b713-65c2ea141457@kernel.org>
 <2d07e814-a7a3-4cec-8a59-158420bde1f2@arm.com>
 <05e6034d-3493-4961-a97d-a80fff78289b@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <05e6034d-3493-4961-a97d-a80fff78289b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_005345_174926_92453A22 
X-CRM114-Status: GOOD (  18.80  )
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



On 03/03/26 2:30 PM, David Hildenbrand (Arm) wrote:
>>> I can understand the desire for this check, but I am confused about Fixes:
>>
>> Probably nothing is broken now I guess but the original memory hot remove
>> patch should have taken care of this scenario. Although don't have strong
>> opinions either way. We could drop both "Fixes" and "Closes" tags here if
>> that is preferred.
>>
> 
> We tend to only tag actual fixes. If we consider this a possible fix, we
> should ask ourselves whether this would be stable material.

Ryan had earlier asked for the Cc: stable to be dropped
as this was not an actual fix. But seems like we should
drop these Fixes/Closes tags as well.

> 
> ...
> 
>>>> +		return false;
>>>> +
>>>> +	pgdp = pgd_offset_k(addr);
>>>> +	pgd = pgdp_get(pgdp);
>>>> +	if (!pgd_present(pgd))
>>>> +		return false;
>>>
>>> How could we end up with non-present areas in a range we hotplugged earlier?
>>
>> We might not in reality but in order to be sure just an additional protection.
> 
> I'm rather wondering if this would indicate a real bug somewhere else
> that we would silently swallow.
> 
> Anyhow, no real preference from my side, just something I considered weird.
> 
> [...]
> 
>>>> +
>>>> +static bool can_unmap_without_split(unsigned long pfn, unsigned long nr_pages)
>>>> +{
>>>> +	unsigned long phys_start, phys_end, size, start, end;
>>>> +
>>>> +	phys_start = PFN_PHYS(pfn);
>>>> +	phys_end = phys_start + nr_pages * PAGE_SIZE;
>>>> +
>>>> +	/*
>>>> +	 * PFN range's linear map edges are leaf entry aligned
>>>> +	 */
>>>> +	start = __phys_to_virt(phys_start);
>>>> +	end =  __phys_to_virt(phys_end);
>>>> +	if (addr_splits_kernel_leaf(start) || addr_splits_kernel_leaf(end)) {
>>>> +		pr_warn("[%lx %lx] splits a leaf entry in linear map\n",
>>>> +			phys_start, phys_end);
>>>> +		return false;
>>>> +	}
>>>> +
>>>> +	/*
>>>> +	 * PFN range's vmemmap edges are leaf entry aligned
>>>> +	 */
>>>> +	size = nr_pages * sizeof(struct page);
>>>> +	start = (unsigned long)pfn_to_page(pfn);
>>>> +	end = start + size;
>>>
>>> As arm64 cannot be used with CONFIG_SPARSEMEM (only with
>>> CONFIG_SPARSEMEM_VMEMMAP, as it sets SPARSEMEM_VMEMMAP_ENABLE),
>>> I think you can just do
> 
> Just to clarify:
> 
> What I meant here is: with CONFIG_SPARSEMEM but without
> CONFIG_SPARSEMEM_VMEMMAP.

Alright but does the commit message or pfn_to_page() code
block here needs a comment about this ? OR it is apparent
enough ?

