Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F1EB109B47A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 14:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p3OGKyUeGX+FBqvhuWl781mm0Ug2VtGZVSOCsdmBQik=; b=DAnWVA9EFMvM5czmV6PmahkrRA
	LcDGHI+w5YEDXLPaDc8l3CSI3gw7w54D9nfILutZd20Jwm6tdZQ8PIxG3kVwBpibOkitPN7O18xVI
	h4T3GLVuBWg8t7VBDWEknmdjD5qgFyhdYigvVsCpgzb1Te+2ZHuLRDm4Cb4nttyKLZ5V5ZPv/uJer
	iRRIZwCTFgp+PuBWLfhzl/zU1QPbC+ZCtXgxTyXRHibJal64muyn+NAmbPwA0wkeHQZ4h/CJS9qgt
	SQU7A8lDCBleSb5LX+yUfB0Q1B2j1rKJPSsU4mtxkBrQkie7g+Pky05JS1kHhqOUZZj+HjdfmBajs
	qIAkh0aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7aBi-0000000D76p-3bOy;
	Tue, 31 Mar 2026 14:35:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7aBg-0000000D76T-1aKd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 14:35:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 40A96497F;
	Tue, 31 Mar 2026 07:35:16 -0700 (PDT)
Received: from [10.57.17.66] (unknown [10.57.17.66])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C02E3F641;
	Tue, 31 Mar 2026 07:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774967722; bh=Grl7oKLDID+CLf3qslXdDCfSH7IfOizXAxEjYRkXgHo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=coTAnRI0mY/4Z0D72BMbvQXEdeNWe1no5kS7ITjGugJlwOGUnlQQW7AqPOXZTKoEh
	 G8XJCiNFU8cctBKsg7IF6aLoW2OuUN2IMlOJ2RKv6ICjIeVId3wSCvrtiH2U9CdQhW
	 fKbdVTdi7he6PopG3lXGd/jjggoZk92QOs9uqaCo=
Message-ID: <d3f6cf8c-3bfe-41a6-86ce-e6515aa5ef96@arm.com>
Date: Tue, 31 Mar 2026 15:35:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: mm: Fix rodata=full block mapping support
 for realm guests
Content-Language: en-GB
To: Ryan Roberts <ryan.roberts@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "David Hildenbrand (Arm)" <david@kernel.org>, Dev Jain <dev.jain@arm.com>,
 Yang Shi <yang@os.amperecomputing.com>, Jinjiang Tu <tujinjiang@huawei.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260330161705.3349825-1-ryan.roberts@arm.com>
 <20260330161705.3349825-2-ryan.roberts@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260330161705.3349825-2-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_073524_525195_C01AF335 
X-CRM114-Status: GOOD (  46.56  )
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

On 30/03/2026 17:17, Ryan Roberts wrote:
> Commit a166563e7ec37 ("arm64: mm: support large block mapping when
> rodata=full") enabled the linear map to be mapped by block/cont while
> still allowing granular permission changes on BBML2_NOABORT systems by
> lazily splitting the live mappings. This mechanism was intended to be
> usable by realm guests since they need to dynamically share dma buffers
> with the host by "decrypting" them - which for Arm CCA, means marking
> them as shared in the page tables.
> 
> However, it turns out that the mechanism was failing for realm guests
> because realms need to share their dma buffers (via
> __set_memory_enc_dec()) much earlier during boot than
> split_kernel_leaf_mapping() was able to handle. The report linked below
> showed that GIC's ITS was one such user. But during the investigation I
> found other callsites that could not meet the
> split_kernel_leaf_mapping() constraints.
> 
> The problem is that we block map the linear map based on the boot CPU
> supporting BBML2_NOABORT, then check that all the other CPUs support it
> too when finalizing the caps. If they don't, then we stop_machine() and
> split to ptes. For safety, split_kernel_leaf_mapping() previously
> wouldn't permit splitting until after the caps were finalized. That
> ensured that if any secondary cpus were running that didn't support
> BBML2_NOABORT, we wouldn't risk breaking them.
> 
> I've fix this problem by reducing the black-out window where we refuse
> to split; there are now 2 windows. The first is from T0 until the page
> allocator is inititialized. Splitting allocates memory for the page
> allocator so it must be in use. The second covers the period between
> starting to online the secondary cpus until the system caps are
> finalized (this is a very small window).
> 
> All of the problematic callers are calling __set_memory_enc_dec() before
> the secondary cpus come online, so this solves the problem. However, one
> of these callers, swiotlb_update_mem_attributes(), was trying to split
> before the page allocator was initialized. So I have moved this call
> from arch_mm_preinit() to mem_init(), which solves the ordering issue.
> 
> I've added warnings and return an error if any attempt is made to split
> in the black-out windows.
> 
> Note there are other issues which prevent booting all the way to user
> space, which will be fixed in subsequent patches.
> 
> Reported-by: Jinjiang Tu <tujinjiang@huawei.com>
> Closes: https://lore.kernel.org/all/0b2a4ae5-fc51-4d77-b177-b2e9db74f11d@huawei.com/
> Fixes: a166563e7ec37 ("arm64: mm: support large block mapping when rodata=full")
> Cc: stable@vger.kernel.org
> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>

I have tested with a hacked cpufeature code to enable BBML2_NOABORT
for FVP MIDRs.

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Tested-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Suzuki

> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>   arch/arm64/include/asm/mmu.h |  2 ++
>   arch/arm64/mm/init.c         |  9 +++++++-
>   arch/arm64/mm/mmu.c          | 45 +++++++++++++++++++++++++-----------
>   3 files changed, 42 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
> index 137a173df1ff8..472610433aaea 100644
> --- a/arch/arm64/include/asm/mmu.h
> +++ b/arch/arm64/include/asm/mmu.h
> @@ -112,5 +112,7 @@ void kpti_install_ng_mappings(void);
>   static inline void kpti_install_ng_mappings(void) {}
>   #endif
>   
> +extern bool page_alloc_available;
> +
>   #endif	/* !__ASSEMBLER__ */
>   #endif
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index 96711b8578fd0..b9b248d24fd10 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -350,7 +350,6 @@ void __init arch_mm_preinit(void)
>   	}
>   
>   	swiotlb_init(swiotlb, flags);
> -	swiotlb_update_mem_attributes();
>   
>   	/*
>   	 * Check boundaries twice: Some fundamental inconsistencies can be
> @@ -377,6 +376,14 @@ void __init arch_mm_preinit(void)
>   	}
>   }
>   
> +bool page_alloc_available __ro_after_init;
> +
> +void __init mem_init(void)
> +{
> +	page_alloc_available = true;
> +	swiotlb_update_mem_attributes();
> +}
> +
>   void free_initmem(void)
>   {
>   	void *lm_init_begin = lm_alias(__init_begin);
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index a6a00accf4f93..223947487a223 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -768,30 +768,51 @@ static inline bool force_pte_mapping(void)
>   }
>   
>   static DEFINE_MUTEX(pgtable_split_lock);
> +static bool linear_map_requires_bbml2;
>   
>   int split_kernel_leaf_mapping(unsigned long start, unsigned long end)
>   {
>   	int ret;
>   
> -	/*
> -	 * !BBML2_NOABORT systems should not be trying to change permissions on
> -	 * anything that is not pte-mapped in the first place. Just return early
> -	 * and let the permission change code raise a warning if not already
> -	 * pte-mapped.
> -	 */
> -	if (!system_supports_bbml2_noabort())
> -		return 0;
> -
>   	/*
>   	 * If the region is within a pte-mapped area, there is no need to try to
>   	 * split. Additionally, CONFIG_DEBUG_PAGEALLOC and CONFIG_KFENCE may
>   	 * change permissions from atomic context so for those cases (which are
>   	 * always pte-mapped), we must not go any further because taking the
> -	 * mutex below may sleep.
> +	 * mutex below may sleep. Do not call force_pte_mapping() here because
> +	 * it could return a confusing result if called from a secondary cpu
> +	 * prior to finalizing caps. Instead, linear_map_requires_bbml2 gives us
> +	 * what we need.
>   	 */
> -	if (force_pte_mapping() || is_kfence_address((void *)start))
> +	if (!linear_map_requires_bbml2 || is_kfence_address((void *)start))
>   		return 0;
>   
> +	if (!system_supports_bbml2_noabort()) {
> +		/*
> +		 * !BBML2_NOABORT systems should not be trying to change
> +		 * permissions on anything that is not pte-mapped in the first
> +		 * place. Just return early and let the permission change code
> +		 * raise a warning if not already pte-mapped.
> +		 */
> +		if (system_capabilities_finalized())
> +			return 0;
> +
> +		/*
> +		 * Boot-time: split_kernel_leaf_mapping_locked() allocates from
> +		 * page allocator. Can't split until it's available.
> +		 */
> +		if (WARN_ON(!page_alloc_available))
> +			return -EBUSY;
> +
> +		/*
> +		 * Boot-time: Started secondary cpus but don't know if they
> +		 * support BBML2_NOABORT yet. Can't allow splitting in this
> +		 * window in case they don't.
> +		 */
> +		if (WARN_ON(num_online_cpus() > 1))
> +			return -EBUSY;
> +	}
> +
>   	/*
>   	 * Ensure start and end are at least page-aligned since this is the
>   	 * finest granularity we can split to.
> @@ -891,8 +912,6 @@ static int range_split_to_ptes(unsigned long start, unsigned long end, gfp_t gfp
>   	return ret;
>   }
>   
> -static bool linear_map_requires_bbml2 __initdata;
> -
>   u32 idmap_kpti_bbml2_flag;
>   
>   static void __init init_idmap_kpti_bbml2_flag(void)


