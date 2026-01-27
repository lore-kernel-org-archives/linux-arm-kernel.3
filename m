Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97ABCD2D8EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 10:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qUNmyGc+FT/VrW8njqgn+09LeRl2mTos4GyalWWtPKA=; b=fFytTKOCuiOrzeQHFPOV9ioVfa
	Z9vbWWYxGwof/1BDxWzkLkSsCi4+qWGsvFuop+1IGdX3WPPjUsBnx1fRJwS4Gl+BsOAWC8ZaJOSRn
	vQIqUw9icMhTSI3gFD3psA+XA95KtmU0mDmnWuZ9pGBdGPPBm2yB7lavUP+ywxz+gjefLZvIJwxKo
	p2XUW2M4aFOkrmltrhsVG4dfmq0GduxCx2HyIdRaUjqbSK6Zh+nFeC79tyCi0Uz7cMntjMsyrwZX7
	ZC+7P23NXs0f8pQfd3icL9ae08T14RKygmaZk3zuevdfCLws+urnjAoIda+7E9xssXI7OqoGVYCwZ
	Yt4/zZEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkgNx-0000000E3xQ-3GfJ;
	Tue, 27 Jan 2026 10:33:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkgNu-0000000E3ws-1B7Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 10:33:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 833811595;
	Tue, 27 Jan 2026 02:33:14 -0800 (PST)
Received: from [10.57.94.246] (unknown [10.57.94.246])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A0B33F73F;
	Tue, 27 Jan 2026 02:33:19 -0800 (PST)
Message-ID: <62b1723a-2ff3-4cac-ad99-a0e8d388ef12@arm.com>
Date: Tue, 27 Jan 2026 10:33:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/10] arm64: mm: Map the kernel data/bss read-only in
 the linear map
Content-Language: en-GB
To: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org,
 catalin.marinas@arm.com, mark.rutland@arm.com,
 Ard Biesheuvel <ardb@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>,
 Kees Cook <kees@kernel.org>, linux-hardening@vger.kernel.org
References: <20260126092630.1800589-12-ardb+git@google.com>
 <20260126092630.1800589-21-ardb+git@google.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20260126092630.1800589-21-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_023323_018283_4E9DC222 
X-CRM114-Status: GOOD (  20.86  )
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

On 26/01/2026 09:26, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> On systems where the bootloader adheres to the original arm64 boot
> protocol, the placement of the kernel in the physical address space is
> highly predictable, and this makes the placement of its linear alias in
> the kernel virtual address space equally predictable, given the lack of
> randomization of the linear map.
> 
> The linear aliases of the kernel text and rodata regions are already
> mapped read-only, but the kernel data and bss are mapped read-write in
> this region. This is not needed, so map them read-only as well.
> 
> Note that the statically allocated kernel page tables do need to be
> modifiable via the linear map, so leave these mapped read-write.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/include/asm/sections.h |  1 +
>  arch/arm64/mm/mmu.c               | 10 ++++++++--
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/sections.h b/arch/arm64/include/asm/sections.h
> index 51b0d594239e..f7fe2bcbfd03 100644
> --- a/arch/arm64/include/asm/sections.h
> +++ b/arch/arm64/include/asm/sections.h
> @@ -23,6 +23,7 @@ extern char __irqentry_text_start[], __irqentry_text_end[];
>  extern char __mmuoff_data_start[], __mmuoff_data_end[];
>  extern char __entry_tramp_text_start[], __entry_tramp_text_end[];
>  extern char __relocate_new_kernel_start[], __relocate_new_kernel_end[];
> +extern char __pgdir_start[];
>  
>  static inline size_t entry_tramp_text_size(void)
>  {
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 18415d4743bf..fdbbb018adc5 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1122,7 +1122,9 @@ static void __init map_mem(void)
>  {
>  	static const u64 direct_map_end = _PAGE_END(VA_BITS_MIN);
>  	phys_addr_t kernel_start = __pa_symbol(_text);
> -	phys_addr_t kernel_end = __pa_symbol(__init_begin);
> +	phys_addr_t init_begin = __pa_symbol(__init_begin);
> +	phys_addr_t init_end = __pa_symbol(__init_end);
> +	phys_addr_t kernel_end = __pa_symbol(__pgdir_start);
>  	phys_addr_t start, end;
>  	phys_addr_t early_kfence_pool;
>  	int flags = NO_EXEC_MAPPINGS;
> @@ -1158,7 +1160,9 @@ static void __init map_mem(void)
>  	 * Note that contiguous mappings cannot be remapped in this way,
>  	 * so we should avoid them here.
>  	 */
> -	__map_memblock(kernel_start, kernel_end, PAGE_KERNEL,
> +	__map_memblock(kernel_start, init_begin, PAGE_KERNEL,
> +		       flags | NO_CONT_MAPPINGS);
> +	__map_memblock(init_end, kernel_end, PAGE_KERNEL,
>  		       flags | NO_CONT_MAPPINGS);

I'm probably being dumb again... why map [init_end, kernel_end) RW here, only to
remap RO below? Why not just map RO here?

>  
>  	/* map all the memory banks */
> @@ -1172,6 +1176,8 @@ static void __init map_mem(void)
>  			       flags);
>  	}
>  
> +	__map_memblock(init_end, kernel_end, PAGE_KERNEL_RO,
> +		       flags | NO_CONT_MAPPINGS);

This seems iffy since __map_memblock() doesn't flush the tlb. If you want to
update an existing mapping you want to be calling update_mapping_prot() right?

Thanks,
Ryan

>  	arm64_kfence_map_pool(early_kfence_pool);
>  }
>  


