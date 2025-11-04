Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84186CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 14:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HFHv6PkV1dMaTEs7iOYxXns5gwENVE27Q0JLsIIb2l4=; b=vlG8NwH+VRaPgzf6tUi/UJn1WU
	YLFBASlpaoLRV619bU22ARTeUgWuSzuYv7MS7knXFNNSM5sVq4WB2kyQ7QqfxKFBt9U6hdkjeMazv
	h5zdhAFOkakXA4+WzAaJ03av7QeYdIBlUA3l+iGdqypo2j53e0VpPnI85nbY0/f7Wp0SqD2/Ysp4j
	+uMB4ixNUlm8UH79RV/q50ySnWH7YJ27cVMYOMGl0Ew7B/KX8rtrnyLIA0mXfn3YEVYoQ0pE+rmjH
	64yqnJpo7bwZ5NTTMxxjsTccTGHwG8DPX8H72Pn878Dv9Z9TQRwp5CLsOpkfEeeUF0EwAQyprxZLd
	GlG3Wgfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGHls-0000000Bxj8-1plQ;
	Tue, 04 Nov 2025 14:12:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGHlr-0000000Bxik-0aMQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 14:12:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 36010601EE;
	Tue,  4 Nov 2025 14:12:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B567AC116C6;
	Tue,  4 Nov 2025 14:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762265545;
	bh=tB1xOKoMP6zqzjBGwfOlaz+yzb6NsVriS1G6Ao19wgA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X9hh3dcff03JCyveat68ID3z3zwzQU2RfCqeW5+nY/2WqOlssMYU095DJlD/IKurj
	 puZK4rJEe1qOLOohR6KBUCCHD+bGT3OkLxDUNM7T8KYiElQGb9aOt47PkwqcyiG5IA
	 sksBjZv6cIx/U08EshW8klsrzHcAwsFVgfFg5qP0RZE8obKP3HO01CDh2K6hdABzug
	 ih1q5pO3lpkfWRAcWgPl36pSCaPh9hiILp4nhXT0YCxR3xHckGwEcnh7tI7/XD5fjY
	 qOJinFtorZzap28TgO9adSvGEkdIxkWt7fqsNaLRWC0dniDhvgy7xU17iB+mt5ZUMP
	 dsV07VqgsMKRg==
Date: Tue, 4 Nov 2025 14:12:21 +0000
From: Will Deacon <will@kernel.org>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: catalin.marinas@arm.com, steven.price@arm.com, suzuki.poulose@arm.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: mm: Support memory hotplug in a Realm
Message-ID: <aQoJxdEVoVqBKLPx@willie-the-truck>
References: <20251013150938.1428357-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013150938.1428357-2-jean-philippe@linaro.org>
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

On Mon, Oct 13, 2025 at 04:09:39PM +0100, Jean-Philippe Brucker wrote:
> Call the RIPAS change functions when adding and removing memory to/from
> a Realm.
> 
> The host initiates hotplug and the guest uses a range of predefined
> guest-physical addresses to install the new memory blocks. This patch
> then switches the RIPAS of those blocks from EMPTY to RAM. The guest can
> then online the blocks and use them.
> 
> Unplug is initiated by the host as well. After offlining the blocks
> the guest removes the mapping, and this patch switches the RIPAS from
> RAM to EMPTY.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
> To test this with a CCA-enabled host and virtio-mem:
>     $ qemu-system-aarch64
>         -m 1G,maxmem=1T
>         -M confidential-guest-support=rme0 -object rme-guest,id=rme0
>         -object memory-backend-ram,id=mem0,size=1G
>         -device virtio-mem-pci,id=hpm0,memdev=mem0,node=0
>         ...
> 
> Make offlining more likely to succeed:
>     # echo online_movable > /sys/devices/system/memory/auto_online_blocks
> 
> Plug and unplug some memory (2M granule)
>     (qemu) qom-set hpm0 requested-size 1G
>     (qemu) qom-set hpm0 requested-size 256M
> 
> Or via ACPI hotplug (requires EDK2 with Realm support)
>     (qemu) object_add memory-backend-ram,id=mem1,size=1G
>     (qemu) device_add pc-dimm,id=dimm1,memdev=mem1
>     (qemu) device_del dimm1
>     (qemu) object_del mem1
> ---
>  arch/arm64/include/asm/rsi.h |  3 +++
>  arch/arm64/kernel/rsi.c      | 23 +++++++++++++++++++++++
>  arch/arm64/mm/mmu.c          | 11 +++++++++--
>  3 files changed, 35 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/rsi.h b/arch/arm64/include/asm/rsi.h
> index 88b50d660e85a..5ffc7e40a1f32 100644
> --- a/arch/arm64/include/asm/rsi.h
> +++ b/arch/arm64/include/asm/rsi.h
> @@ -18,6 +18,9 @@ void __init arm64_rsi_init(void);
>  
>  bool arm64_rsi_is_protected(phys_addr_t base, size_t size);
>  
> +int arm64_rsi_add_memory(phys_addr_t start, phys_addr_t end);
> +int arm64_rsi_remove_memory(phys_addr_t start, phys_addr_t end);
> +
>  static inline bool is_realm_world(void)
>  {
>  	return static_branch_unlikely(&rsi_present);
> diff --git a/arch/arm64/kernel/rsi.c b/arch/arm64/kernel/rsi.c
> index c64a06f58c0bc..b983b85f03dfb 100644
> --- a/arch/arm64/kernel/rsi.c
> +++ b/arch/arm64/kernel/rsi.c
> @@ -138,6 +138,29 @@ static int realm_ioremap_hook(phys_addr_t phys, size_t size, pgprot_t *prot)
>  	return 0;
>  }
>  
> +/*
> + * Convert a range of IPAs from EMPTY to RAM
> + */
> +int arm64_rsi_add_memory(phys_addr_t start, phys_addr_t end)
> +{
> +	if (!is_realm_world())
> +		return 0;
> +
> +	return rsi_set_memory_range_protected(start, end);
> +}
> +
> +/*
> + * Convert a range of IPAs from RAM to EMPTY. The pages will be wiped by
> + * UNDELEGATE before being returned to the host.
> + */
> +int arm64_rsi_remove_memory(phys_addr_t start, phys_addr_t end)
> +{
> +	if (!is_realm_world())
> +		return 0;
> +
> +	return rsi_set_memory_range_shared(start, end);
> +}

Probably worth having this in a header so that the static key can be
inlined for the common case where we're not in a realm.

> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index b8d37eb037fcc..095b094e8a82f 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -44,6 +44,7 @@
>  #include <asm/tlbflush.h>
>  #include <asm/pgalloc.h>
>  #include <asm/kfence.h>
> +#include <asm/rsi.h>
>  
>  #define NO_BLOCK_MAPPINGS	BIT(0)
>  #define NO_CONT_MAPPINGS	BIT(1)
> @@ -1874,6 +1875,10 @@ int arch_add_memory(int nid, u64 start, u64 size,
>  
>  	VM_BUG_ON(!mhp_range_allowed(start, size, true));
>  
> +	ret = arm64_rsi_add_memory(start, start + size);
> +	if (ret)
> +		return ret;
> +
>  	if (force_pte_mapping())
>  		flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
>  
> @@ -1885,10 +1890,11 @@ int arch_add_memory(int nid, u64 start, u64 size,
>  
>  	ret = __add_pages(nid, start >> PAGE_SHIFT, size >> PAGE_SHIFT,
>  			   params);
> -	if (ret)
> +	if (ret) {
>  		__remove_pgd_mapping(swapper_pg_dir,
>  				     __phys_to_virt(start), size);
> -	else {
> +		WARN_ON(arm64_rsi_remove_memory(start, start + size));
> +	} else {
>  		/* Address of hotplugged memory can be smaller */
>  		max_pfn = max(max_pfn, PFN_UP(start + size));
>  		max_low_pfn = max_pfn;
> @@ -1904,6 +1910,7 @@ void arch_remove_memory(u64 start, u64 size, struct vmem_altmap *altmap)
>  
>  	__remove_pages(start_pfn, nr_pages, altmap);
>  	__remove_pgd_mapping(swapper_pg_dir, __phys_to_virt(start), size);
> +	WARN_ON(arm64_rsi_remove_memory(start, start + size));

Hmm. This looks correct to me, but I wonder whether you've pushed the
rsi calls too far down? That is, I can understand this code being called
via virtio-mem and needing to transition the physical pages between
EMPTY/RAM, but these functions have other callers (e.g. via
memunmap_pages()) where it's not at all clear that the RMM should be
called.

Will

