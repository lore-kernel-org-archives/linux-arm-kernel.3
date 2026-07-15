Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C4D5C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 03:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sAlT/hdiMjcuftcBzs39fQKwgSfOlubr11BXpOQZe60=; b=jXxs+3hb8LnpKQW5GTCSqYooiD
	EDA627JHV7r1MWakT6X0J80JXsx65ZFpKhhB1VWRZrrv7mlwPCdEv4NxfA06tLWXFHP+pvDvwD/c1
	BJehUHJ+BymyEzSkM9sWnYfGcZ7gUQ58+02KkzEEujmvZ+HqC4Za/YoPKZtIuVX1sQ3itohv0gk9m
	izzxyamlXFnlxTgJkc6Yk8l451hWBv5lgqiy9WzbJ0qFCg6CFzNsjSqm5AmmhZ1/eD8Q6RohDp2Iu
	1ld4meVzvh8jIjh10gic8oLYDJXdLAL4b/uFL9U69juk6N6zttp/jCoxugKn1E7hskPv4vYvhiXav
	enVBRPUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjqLo-0000000DgsB-0dI0;
	Wed, 15 Jul 2026 03:32:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjqLf-0000000DgqG-14ee
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 03:31:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDC96339;
	Tue, 14 Jul 2026 20:31:41 -0700 (PDT)
Received: from [10.164.18.40] (unknown [10.164.18.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E47B03F915;
	Tue, 14 Jul 2026 20:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784086306; bh=eLKwuGJoJsIHeWJ4YMqsFz5ZrWo7Q9PIiUGspHsiu5s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rQ4i2MP/E8rGhbitmZxBMF/eBICIDl4M9VpN0LVW/s45WpNvdHjMQvfUFGYkVZKLC
	 K6dRT3KTvI9iWA+dVcIejo09e7sjeTMQUeQphJtTliE0mP9yWN86gGssY2NprEypZ+
	 7PcsDpK5swHcKJJJXdkFPTHN+fe2i0JNkVH6l2lA=
Message-ID: <71e8601c-ce7e-4a4e-aa0e-66c9f2a5c9b5@arm.com>
Date: Wed, 15 Jul 2026 09:01:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/6] arm64/vmalloc: Allow arch_vmap_pte_range_map_size
 to batch multiple CONT_PTE
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org,
 urezki@gmail.com, will@kernel.org, Xueyuan.chen21@gmail.com,
 ajd@linux.ibm.com, david@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, rppt@kernel.org, ryan.roberts@arm.com,
 dev.jain@arm.com, "Barry Song (Xiaomi)" <baohua@kernel.org>,
 Wen Jiang <jiangwen6@xiaomi.com>, Leo Yan <leo.yan@arm.com>
References: <20260709073823.6643-1-jiangwen6@xiaomi.com>
 <20260709073823.6643-3-jiangwen6@xiaomi.com>
 <bc4ab9da-0b16-4203-9901-4845323c3e5c@arm.com>
 <CAHKocdFn9DP=wGLYJrhndxTnxz=eMeWYjK1m2OzPotcvz_sVjA@mail.gmail.com>
 <CAHKocdEOveLGiad3pOFMNGEKec-wvnwY7w88-8k1Npm1t_YTcA@mail.gmail.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <CAHKocdEOveLGiad3pOFMNGEKec-wvnwY7w88-8k1Npm1t_YTcA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_203151_537843_B401573E 
X-CRM114-Status: GOOD (  22.81  )
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

On 15/07/26 8:19 AM, Wen Jiang wrote:
> On Tue, 14 Jul 2026 at 17:24, Wen Jiang <jiangwenxiaomi@gmail.com> wrote:
>>
>> On Tue, 14 Jul 2026 at 15:13, Anshuman Khandual
>> <anshuman.khandual@arm.com> wrote:
>>>
>>>
>>>
>>> On 09/07/26 1:08 PM, Wen Jiang wrote:
>>>> From: "Barry Song (Xiaomi)" <baohua@kernel.org>
>>>>
>>>> Allow arch_vmap_pte_range_map_size to batch across multiple CONT_PTE
>>>> blocks, reducing both PTE setup and TLB flush iterations.
>>>
>>> Too little commit description for the proposed change here.
>>>>
>>>> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
>>>> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
>>>> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
>>>> Tested-by: Leo Yan <leo.yan@arm.com>
>>>> Reviewed-by: Dev Jain <dev.jain@arm.com>
>>>> ---
>>>>  arch/arm64/include/asm/vmalloc.h | 6 +++++-
>>>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
>>>> index 4ec1acd3c1b34..7d9c7dc795c42 100644
>>>> --- a/arch/arm64/include/asm/vmalloc.h
>>>> +++ b/arch/arm64/include/asm/vmalloc.h
>>>> @@ -23,6 +23,8 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
>>>>                                               unsigned long end, u64 pfn,
>>>>                                               unsigned int max_page_shift)
>>>>  {
>>>> +     unsigned long size;
>>>> +
>>>>       /*
>>>>        * If the block is at least CONT_PTE_SIZE in size, and is naturally
>>>>        * aligned in both virtual and physical space, then we can pte-map the
>>>> @@ -40,7 +42,9 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
>>>>       if (!IS_ALIGNED(PFN_PHYS(pfn), CONT_PTE_SIZE))
>>>>               return PAGE_SIZE;
>>>>
>>>> -     return CONT_PTE_SIZE;
>>>> +     size = min3(end - addr, 1UL << max_page_shift, PMD_SIZE >> 1);
>>>> +     size = rounddown_pow_of_two(size);
>>>> +     return size;
>>>
>>> Please do explain the fact in a comment that huge pte mappings
>>> upto PMD_SIZE are being allowed here, if the given block is
>>> CONT_PTE_SIZE aligned.
>>>
> 
> Hi Anshuman,
> 
> Would the following comment address your concern?
> 
> diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
> --- a/arch/arm64/include/asm/vmalloc.h
> +++ b/arch/arm64/include/asm/vmalloc.h
> @@ -29,6 +29,8 @@ static inline unsigned long
> arch_vmap_pte_range_map_size(unsigned long addr,
>   * If the block is at least CONT_PTE_SIZE in size, and is naturally
>   * aligned in both virtual and physical space, then we can pte-map the
>   * block using the PTE_CONT bit for more efficient use of the TLB.
> + * The returned mapping size may cover multiple CONT_PTE_SIZE blocks,
> + * capped below PMD_SIZE.

Yes sounds good.
>   */
>   if (max_page_shift < CONT_PTE_SHIFT)
>   return PAGE_SIZE;
> 
>>> IIUC arch_vmap_pte_range_map_size() gets used only when config
>>> CONFIG_HUGETLB_PAGE is enabled. Hence should not these new huge
>>> sizes being supported here also be added as valid HugeTLB sizes
>>> thus updating __hugetlb_valid_size() and adding corresponding
>>> new HugeTLB page sizes with hugetlb_add_hstate() ?
>>>
>>> OR could arch_vmap_pte_range_map_size() and set_huge_pte_at()
>>> can be updated for vmalloc without doing corresponding changes
>>> into HugeTLB itself ?
>>
>> These sizes are not new HugeTLB page sizes. They are only vmalloc mapping
>> spans selected for a particular virtually and physically aligned range, so that
>> the PTEs can be installed with the contiguous bit in larger batches.
>>
>> Therefore I do not think they should be added to __hugetlb_valid_size() or
>> registered with hugetlb_add_hstate(). Those describe the HugeTLB hstate sizes,
>> while this change only affects how vmalloc chooses the PTE-level mapping span.
>>
>> Thanks,
>> Wen
>>>>  }
>>>>
>>>>  #define arch_vmap_pte_range_unmap_size arch_vmap_pte_range_unmap_size
>>>


