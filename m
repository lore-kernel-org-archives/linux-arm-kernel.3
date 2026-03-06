Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D02F513E9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 02:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a2xsuPOlkpXJkxnBZO/kwFy+hjDmp8icPdTrY3Ycqwo=; b=ymDDMIoReq2M63gVQca1a3aqbr
	GaVni7FR14Ni/nHxivXQ8l6FhPLQExjUuih63Dlmf8iBKiDpEVGf479aF2eRYsyJxFSe9Ep/MBS79
	8uGQdsY09pRnXGowRMm6tspiXFLF4B+TbAfcCWGL3UMMRuvU0nOHnux+xZ8P2mfjwOhXmlz8ngigp
	Wwu8Z53eR6tmnRO3fvMxnDGL955PkiUrsk+ptdJgM+UcPeA0gH4UzTsz09NY5EndWRMCBBvTckTCD
	HJw+H6mHF2HKm5ikcNx5zEsPb3K+olcuCh9txeJVZ+jnXNIwPE83IliEaLqdGScoo1XKbmllPVzGB
	6MZVvUEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyLD0-00000002tpy-18Cv;
	Fri, 06 Mar 2026 02:46:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyLCx-00000002toc-3l5Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 02:46:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 025EC1655;
	Thu,  5 Mar 2026 18:46:22 -0800 (PST)
Received: from [10.164.18.48] (unknown [10.164.18.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C857D3F694;
	Thu,  5 Mar 2026 18:46:25 -0800 (PST)
Message-ID: <3e16b499-9209-4e62-99e9-791ef68d7b02@arm.com>
Date: Fri, 6 Mar 2026 08:16:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 2/2] arm64/mm: Reject memory removal that splits a
 kernel leaf mapping
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Yang Shi <yang@os.amperecomputing.com>,
 Christoph Lameter <cl@gentwo.org>, linux-kernel@vger.kernel.org
References: <20260305053148.3765710-1-anshuman.khandual@arm.com>
 <20260305053148.3765710-3-anshuman.khandual@arm.com>
 <a2b81b60-eb8e-44a2-84fe-8c61bc5fadbe@kernel.org>
 <3884dd41-8ab1-45ee-8daa-198384d59c20@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <3884dd41-8ab1-45ee-8daa-198384d59c20@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_184631_979229_7328A214 
X-CRM114-Status: GOOD (  12.38  )
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



On 05/03/26 6:09 PM, David Hildenbrand (Arm) wrote:
> On 3/5/26 13:37, David Hildenbrand (Arm) wrote:
>> On 3/5/26 06:31, Anshuman Khandual wrote:
>>> Linear and vmemmap mappings that get torn down during a memory hot remove
>>> operation might contain leaf level entries on any page table level. If the
>>> requested memory range's linear or vmemmap mappings falls within such leaf
>>> entries, new mappings need to be created for the remaining memory mapped on
>>> the leaf entry earlier, following standard break before make aka BBM rules.
>>> But kernel cannot tolerate BBM and hence remapping to fine grained leaves
>>> would not be possible on systems without BBML2_NOABORT.
>>>
>>> Currently memory hot remove operation does not perform such restructuring,
>>> and so removing memory ranges that could split a kernel leaf level mapping
>>> need to be rejected.
>>>
>>> While memory_hotplug.c does appear to permit hot removing arbitrary ranges
>>> of memory, the higher layers that drive memory_hotplug (e.g. ACPI, virtio,
>>> ...) all appear to treat memory as fixed size devices. So it is impossible
>>> to hot unplug a different amount than was previously hot plugged, and hence
>>> we should never see a rejection in practice, but adding the check makes us
>>> robust against a future change.
>>>
>>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>>> Cc: Will Deacon <will@kernel.org>
>>> Cc: linux-arm-kernel@lists.infradead.org
>>> Cc: linux-kernel@vger.kernel.org
>>> Link: https://lore.kernel.org/all/aWZYXhrT6D2M-7-N@willie-the-truck/
>>> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
>>> Suggested-by: Ryan Roberts <ryan.roberts@arm.com>
>>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>>> ---
>>
>> [...]
>>
>>> +
>>> +	/*
>>> +	 * PFN range's linear map edges are leaf entry aligned
>>> +	 */
>>
>> Nit: single-line comments are usually written as
>>
>> /* ... */
>>
>>> +	start = __phys_to_virt(phys_start);
>>> +	end =  __phys_to_virt(phys_end);
>>> +	if (addr_splits_kernel_leaf(start) || addr_splits_kernel_leaf(end)) {
>>> +		pr_warn("[%lx %lx] splits a leaf entry in linear map\n",
>>> +			phys_start, phys_end);
>>> +		return false;
>>> +	}
>>> +
>>> +	/*
>>> +	 * PFN range's vmemmap edges are leaf entry aligned
>>> +	 */
>>
>> Dito.
>>
>> LGTM, thanks!
>>
>> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
>>
> 
> In fact,
> 
> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
> 
> :)
> 

Thanks for the review. Sure, will respin with the comment fixes next week.

