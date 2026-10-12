Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA772CA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 07:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ml3XzqnfvkPoJalIiDoqIEaqIWpXPrO+zTg3b+pyBTg=; b=VWOhDUgUlbJt3dYYr2wUIsUuv/
	liPJWhQay0mGKd2sReimHOQ97Sw2hjv0gux5Gn8fozcPMt0F87j4wdfhXA7WBrv/Ra+6kXQlTz5ij
	0+u1U0IqhwDL1Pykk9NusRyu5UQyWI9TGVHRCXH/ufrmt6JGgOFQoFSrN2nSc3+UbPvkt1kNh39xa
	w5e81C4mhSD5DVI7uKFtY+/L2DX3YG1myzHrVSF+wP1l9hopCkkspfimoAGwFfVaZFzifPpRDwtuR
	twT0fX9xhdv3KWzT7aHHhRdd91dO0xAhc6R3tVXQRtAm/e1fImZ5YsP9mRGdKyy4o7ucc/vM8GW8w
	eWh9Xwtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGAd3-00000009rIQ-28fc;
	Mon, 12 Oct 2026 07:39:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGAd0-00000009rHk-1AcS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 07:39:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04CB61650;
	Mon, 12 Oct 2026 00:39:15 -0700 (PDT)
Received: from [10.164.19.62] (unknown [10.164.19.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 137743F882;
	Mon, 12 Oct 2026 00:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791790758; bh=QFylubiAn6XF6+4lXPZWi1iu+KACNJaGKaA1OI3cGV0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i0lGTdAoo7yNW9SwE9EHgLeyVZtho3vPYbLDUzDNLp0AxWuYAdwb5P/QXd71ZeYdL
	 OFHKbtD9gIlK5bb/aEwzvDVLDFJC+bn0oTyJtfKJ13Vjfq7MvuaZfl0HhJzwaQRrAl
	 ULUyyhH0aFG1ImOrjhUsnfRaO5vb7E26yyFrvCc0=
Message-ID: <4f812ef0-ab14-48c5-908b-b7d82ce418b3@arm.com>
Date: Mon, 12 Oct 2026 13:09:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 05/10] arm64/vmalloc: allow
 arch_vmap_pte_range_map_size() to batch multiple CONT_PTE
To: Uladzislau Rezki <urezki@gmail.com>, ryan.roberts@arm.com
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org,
 will@kernel.org, Xueyuan.chen21@gmail.com, ajd@linux.ibm.com,
 anshuman.khandual@arm.com, baohua@kernel.org, chleroy@kernel.org,
 david@kernel.org, jiangwen6@xiaomi.com, leo.yan@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, rppt@kernel.org
References: <20261002090947.869220-1-jiangwen6@xiaomi.com>
 <20261002090947.869220-6-jiangwen6@xiaomi.com> <astarANeoldvqBxc@milan>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <astarANeoldvqBxc@milan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_003922_488975_57A8BD79 
X-CRM114-Status: GOOD (  17.12  )
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



On 11/10/26 3:15 pm, Uladzislau Rezki wrote:
> On Fri, Oct 02, 2026 at 05:09:42PM +0800, Wen Jiang wrote:
>> From: "Barry Song (Xiaomi)" <baohua@kernel.org>
>>
>> Allow arch_vmap_pte_range_map_size to batch across multiple CONT_PTE
>> blocks, reducing both PTE setup and TLB flush iterations.
>>
>> Previously the function returned a single CONT_PTE_SIZE for an aligned
>> range, so the caller mapped one CONT_PTE block per iteration. Now, for a
>> CONT_PTE_SIZE-aligned range, it returns the largest CONT_PTE-aligned size
>> that fits within both the remaining range and the caller's max_page_shift,
>> so a single pte_set_huge() call installs several CONT_PTE blocks at once.
>>
>> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
>> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
>> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
>> Tested-by: Leo Yan <leo.yan@arm.com>
>> ---
>>  arch/arm64/include/asm/vmalloc.h | 12 ++++++++----
>>  1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
>> index 4ec1acd3c1b34..c29704a19e276 100644
>> --- a/arch/arm64/include/asm/vmalloc.h
>> +++ b/arch/arm64/include/asm/vmalloc.h
>> @@ -23,10 +23,12 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
>>  						unsigned long end, u64 pfn,
>>  						unsigned int max_page_shift)
>>  {
>> +	unsigned long size;
>> +
>>  	/*
>> -	 * If the block is at least CONT_PTE_SIZE in size, and is naturally
>> -	 * aligned in both virtual and physical space, then we can pte-map the
>> -	 * block using the PTE_CONT bit for more efficient use of the TLB.
>> +	 * If the range is at least CONT_PTE_SIZE and naturally aligned in both
>> +	 * virtual and physical space, return the largest CONT_PTE-aligned size
>> +	 * that fits, for more efficient use of the TLB.
>>  	 */
>>  	if (max_page_shift < CONT_PTE_SHIFT)
>>  		return PAGE_SIZE;
>> @@ -40,7 +42,9 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
>>  	if (!IS_ALIGNED(PFN_PHYS(pfn), CONT_PTE_SIZE))
>>  		return PAGE_SIZE;
>>  
>> -	return CONT_PTE_SIZE;
>> +	size = min(end - addr, 1UL << max_page_shift);
>> +	size = round_down(size, CONT_PTE_SIZE);
>> +	return size;
>>  }
>>  
>>  #define arch_vmap_pte_range_unmap_size arch_vmap_pte_range_unmap_size
>> -- 
>> 2.34.1
>>
> This is arch/arm64 code. Can you, Jain or Ryan from ARM folk review this change?
> 
> Thank you!
> 

I will come to this soon.


> --
> Uladzislau Rezki


