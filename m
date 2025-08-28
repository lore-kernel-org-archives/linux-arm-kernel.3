Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99ACFCA0FF6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 01:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xEU/CZtksWyoccTc/TZhk1SKF41MfmEVOIqTgF1iZjM=; b=mLy9ykHDiyHOlDaLCU/eDWq6KZ
	LrM8M06RTqxy6bW7Kw+myCpDhEJPED57kh+sxJu92fpkiH7p6fIXaKkOJfeRxwaImyeVxa0OnSnGp
	K/CZgoA1RLK2uv43Fz1hMi3TcjYl3GkLwx2GjJ2RIq37rl0GsfnaaN3lpyDFEfBuGpUqG93+FiV63
	K243NEhoec9R7zevujPVERpyioG/HIfG72yZXdGSTdiF8S0w2ExFYgFaO3GBTz9dbIWSDBA5NYVyI
	k9VGXKEOD32pupXUE545n1RVxdPfnkHKZQ7Aygzn1DATF/MpKWmirBIr8m+mDfwwXvQFThW2go4pG
	kRD4gILw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urndL-00000003xMv-0jWn;
	Fri, 29 Aug 2025 01:10:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urhfg-00000002rGp-3lP8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 18:48:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2474E60139;
	Thu, 28 Aug 2025 18:48:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CB2EC4CEEB;
	Thu, 28 Aug 2025 18:48:25 +0000 (UTC)
Date: Thu, 28 Aug 2025 19:48:23 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Yang Shi <yang@os.amperecomputing.com>, will@kernel.org,
	akpm@linux-foundation.org, Miko.Lenczewski@arm.com,
	dev.jain@arm.com, scott@os.amperecomputing.com, cl@gentwo.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v6 3/4] arm64: mm: support large block mapping when
 rodata=full
Message-ID: <aLCkd-E1wgszoZKd@arm.com>
References: <20250805081350.3854670-1-ryan.roberts@arm.com>
 <20250805081350.3854670-4-ryan.roberts@arm.com>
 <aLCNTsM-nn6SpfOO@arm.com>
 <5795892e-503e-496b-a5dd-be4776f15513@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5795892e-503e-496b-a5dd-be4776f15513@arm.com>
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

On Thu, Aug 28, 2025 at 06:45:32PM +0100, Ryan Roberts wrote:
> On 28/08/2025 18:09, Catalin Marinas wrote:
> > On Tue, Aug 05, 2025 at 09:13:48AM +0100, Ryan Roberts wrote:
> >> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> >> index abd9725796e9..f6cd79287024 100644
> >> --- a/arch/arm64/mm/mmu.c
> >> +++ b/arch/arm64/mm/mmu.c
> > [...]
> >> @@ -640,6 +857,16 @@ static inline void arm64_kfence_map_pool(phys_addr_t kfence_pool, pgd_t *pgdp) {
> >>  
> >>  #endif /* CONFIG_KFENCE */
> >>  
> >> +static inline bool force_pte_mapping(void)
> >> +{
> >> +	bool bbml2 = system_capabilities_finalized() ?
> >> +		system_supports_bbml2_noabort() : bbml2_noabort_available();
> >> +
> >> +	return (!bbml2 && (rodata_full || arm64_kfence_can_set_direct_map() ||
> >> +			   is_realm_world())) ||
> >> +		debug_pagealloc_enabled();
> >> +}
> >> +
> >>  static void __init map_mem(pgd_t *pgdp)
> >>  {
> >>  	static const u64 direct_map_end = _PAGE_END(VA_BITS_MIN);
> >> @@ -665,7 +892,7 @@ static void __init map_mem(pgd_t *pgdp)
> >>  
> >>  	early_kfence_pool = arm64_kfence_alloc_pool();
> >>  
> >> -	if (can_set_direct_map())
> >> +	if (force_pte_mapping())
> >>  		flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
> >>  
> >>  	/*
> >> @@ -1367,7 +1594,7 @@ int arch_add_memory(int nid, u64 start, u64 size,
> >>  
> >>  	VM_BUG_ON(!mhp_range_allowed(start, size, true));
> >>  
> >> -	if (can_set_direct_map())
> >> +	if (force_pte_mapping())
> >>  		flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
> >>  
> >>  	__create_pgd_mapping(swapper_pg_dir, start, __phys_to_virt(start),
> > 
> > Not sure this works in a heterogeneous configuration.
> > bbml2_noabort_available() only checks the current/boot CPU which may
> > return true but if secondary CPUs don't have the feature, it results in
> > system_supports_bbml2_noabort() being false with force_pte_mapping()
> > also false in the early map_mem() calls.
> 
> The intent is that we eagerly create a block-mapped linear map at boot if the
> boot CPU supports BBML2. If, once we have determined that a secondary CPU
> doesn't support BBML2 (and therefore the system doesn't support it) then we
> repaint the linear map using page mappings.
> 
> The repainting mechanism is added in the next patch.

Ah, I haven't reached that patch yet ;).

> I've tested this with heterogeneous configs and I'm confident it does work.

Great. The downside is that such configuration is rare, the logic is
fairly complex and won't get tested much. Hardware with such
configuration will take a slight hit on the boot time.

I don't remember the discussions around Miko's patches adding the BBML2
feature - do we have such heterogeneous configurations or are they just
theoretical at this stage?

> FYI, I actually have a new version of this ready to go - I was hoping to post
> tomorrow, subject to performance results. I thought you were implying in a
> previous mail that you weren't interested in reviewing until it was based on top
> of an -rc. Perhaps I misunderstood. Let me know if you want me to hold off on
> posting that given you are now reviewing this version.

In general I prefer patches on top of a fixed -rc, especially if I need
to apply them locally. But I was wondering if you are waiting for review
feedback before rebasing, so I had a quick look ;).

Please post a new version. I'll have a look at that since you were
planning to update a few bits anyway.

-- 
Catalin

