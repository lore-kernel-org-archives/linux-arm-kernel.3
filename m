Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF5FCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 19:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hUNMuC5N5IY5Q+K6dDeWLNqBcEpUoABgqaCx/l7JFbs=; b=hD0aiUZ/h8ptOdOCbANp3ZJFSP
	rh9ArT16Sf4SZqgY+GJ8uN0qsIC9zWnUAibm51DnSLm1jchhhSA2GHr/yeoEvwPmFN5C2l6CdEuok
	FaK8Bwikzz+4MzjjRoKiuVWrM87dni29eUXCQo6JZzRMuGuw2Gs3KSTddjYSOLXtLNZ4Zhz1o4AyY
	wbPi6cPEvaGdxQzZiZIi6vO5Fna9Kp/ksYp5Zxft/c/trSaPiNrm5cmDUec1o71v7uK8Nb5Em1r/D
	UMPzJAsZTGKTPdMO9AsA2Z5myV8IeNKcXAt+7TnxQSEgrPPhHLIXOY9mY83X3iiaLOyKhODCQ9hQV
	AJk7CJ+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uriN5-000000032bq-3Dtt;
	Thu, 28 Aug 2025 19:33:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urg83-00000002Mwt-2c5j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 17:09:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C7EDA60139;
	Thu, 28 Aug 2025 17:09:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B923AC4CEEB;
	Thu, 28 Aug 2025 17:09:36 +0000 (UTC)
Date: Thu, 28 Aug 2025 18:09:34 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Yang Shi <yang@os.amperecomputing.com>, will@kernel.org,
	akpm@linux-foundation.org, Miko.Lenczewski@arm.com,
	dev.jain@arm.com, scott@os.amperecomputing.com, cl@gentwo.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v6 3/4] arm64: mm: support large block mapping when
 rodata=full
Message-ID: <aLCNTsM-nn6SpfOO@arm.com>
References: <20250805081350.3854670-1-ryan.roberts@arm.com>
 <20250805081350.3854670-4-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805081350.3854670-4-ryan.roberts@arm.com>
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

On Tue, Aug 05, 2025 at 09:13:48AM +0100, Ryan Roberts wrote:
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index abd9725796e9..f6cd79287024 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
[...]
> @@ -640,6 +857,16 @@ static inline void arm64_kfence_map_pool(phys_addr_t kfence_pool, pgd_t *pgdp) {
>  
>  #endif /* CONFIG_KFENCE */
>  
> +static inline bool force_pte_mapping(void)
> +{
> +	bool bbml2 = system_capabilities_finalized() ?
> +		system_supports_bbml2_noabort() : bbml2_noabort_available();
> +
> +	return (!bbml2 && (rodata_full || arm64_kfence_can_set_direct_map() ||
> +			   is_realm_world())) ||
> +		debug_pagealloc_enabled();
> +}
> +
>  static void __init map_mem(pgd_t *pgdp)
>  {
>  	static const u64 direct_map_end = _PAGE_END(VA_BITS_MIN);
> @@ -665,7 +892,7 @@ static void __init map_mem(pgd_t *pgdp)
>  
>  	early_kfence_pool = arm64_kfence_alloc_pool();
>  
> -	if (can_set_direct_map())
> +	if (force_pte_mapping())
>  		flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
>  
>  	/*
> @@ -1367,7 +1594,7 @@ int arch_add_memory(int nid, u64 start, u64 size,
>  
>  	VM_BUG_ON(!mhp_range_allowed(start, size, true));
>  
> -	if (can_set_direct_map())
> +	if (force_pte_mapping())
>  		flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
>  
>  	__create_pgd_mapping(swapper_pg_dir, start, __phys_to_virt(start),

Not sure this works in a heterogeneous configuration.
bbml2_noabort_available() only checks the current/boot CPU which may
return true but if secondary CPUs don't have the feature, it results in
system_supports_bbml2_noabort() being false with force_pte_mapping()
also false in the early map_mem() calls.

I don't see a nice solution other than making BBML2 no-abort a boot CPU
feature.

-- 
Catalin

