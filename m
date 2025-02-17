Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D0DC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 04:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+tOQ187njbe5z4RyF0k4IJnhNqgW/KM/sOwzxrx3J+s=; b=GEUHfpq0iivbx22cSNJWqb93Ui
	npc5uQ+ZU1rJ2F/dAEyahICpLP8gIKg35+hQbGV/QRtsdrb/LudbkvCqVYnhdS4MDCpfVJ/hkM7uy
	OgQmXmd+hni2PrMOVE4Onco3FXJRloB8bsIdKhVAlxaRSO+KgXT6THnJ0zD5gaZDW4QT4qlCLEilu
	qkGTp1857fshH8VHAOhjHYyzAPQnR6SEXqw6JHkT+ucVjry8wMU1c+kEPcf/lukslS2aIMpDMgNvT
	f2QwEQQaUuZYmOs6Te9aJs6RirAi2LkTVwHZDAHAkdhcnAObgg+pn8bhCz5shCmSPt/wpuASY90wW
	BartPxfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjsrM-00000003Fk5-0It1;
	Mon, 17 Feb 2025 04:35:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjsp9-00000003FTd-2NWf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 04:33:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3077E1063;
	Sun, 16 Feb 2025 20:33:58 -0800 (PST)
Received: from [10.162.16.135] (unknown [10.162.16.135])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C2B43F59E;
	Sun, 16 Feb 2025 20:33:34 -0800 (PST)
Message-ID: <72f188c5-c078-4ff5-81a6-3a0c8b2edaea@arm.com>
Date: Mon, 17 Feb 2025 10:03:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 12/16] arm64/mm: Support huge pte-mapped pages in vmap
To: Ryan Roberts <ryan.roberts@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Muchun Song <muchun.song@linux.dev>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 Dev Jain <dev.jain@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Steve Capper <steve.capper@linaro.org>, Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250205151003.88959-1-ryan.roberts@arm.com>
 <20250205151003.88959-13-ryan.roberts@arm.com>
 <9a0d3009-18fc-4b53-941a-b6d830fce36a@arm.com>
 <21da59a8-165d-4423-a00d-d5859f42ec11@arm.com>
 <0dd74f57-902a-4a6d-9f77-31963b5953d1@arm.com>
 <d6af21f1-e539-4fa6-a3f8-c4859b1325c5@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <d6af21f1-e539-4fa6-a3f8-c4859b1325c5@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_203339_643287_E69F89F1 
X-CRM114-Status: GOOD (  13.53  )
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



On 2/13/25 14:39, Ryan Roberts wrote:
> 
>>>>> +#define arch_vmap_pte_range_map_size arch_vmap_pte_range_map_size
>>>>> +static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
>>>>> +						unsigned long end, u64 pfn,
>>>>> +						unsigned int max_page_shift)
>>>>> +{
>>>>> +	if (max_page_shift < CONT_PTE_SHIFT)
>>>>> +		return PAGE_SIZE;
>>>>> +
>>>>> +	if (end - addr < CONT_PTE_SIZE)
>>>>> +		return PAGE_SIZE;
>>>>> +
>>>>> +	if (!IS_ALIGNED(addr, CONT_PTE_SIZE))
>>>>> +		return PAGE_SIZE;
>>>>> +
>>>>> +	if (!IS_ALIGNED(PFN_PHYS(pfn), CONT_PTE_SIZE))
>>>>> +		return PAGE_SIZE;
>>>>> +
>>>>> +	return CONT_PTE_SIZE;
>>>>
>>>> A small nit:
>>>>
>>>> Should the rationale behind picking CONT_PTE_SIZE be added here as an in code
>>>> comment or something in the function - just to make things bit clear.
>>>
>>> I'm not sure what other size we would pick?
>>
>> The suggestion was to add a small comment in the above helper function explaining
>> the rationale for various conditions in there while returning either PAGE_SIZE or
>> CONT_PTE_SIZE to improve readability etc.
> 
> OK I've added the following:
> 
> /*
>  * If the block is at least CONT_PTE_SIZE in size, and is naturally
>  * aligned in both virtual and physical space, then we can pte-map the
>  * block using the PTE_CONT bit for more efficient use of the TLB.
>  */

Sounds good, thanks !

