Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB665F30955
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 12:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MuxXa7oIq6CaE9OM/HG649+ufY3EqR2B2FLMP0XD2cc=; b=3fnFrDkG7fNyh16FOyFvQFVIs6
	eAYWFjg84bSYI84jKsdxv5k2Zbyke9k5z7M9yL4PpYqPpNKk9EZ5ADUwCJG3srLD5gH/rJ181zHn9
	XStPOOs98cv9mJ+uqMTSnO4JWVukA069XmEZkR4oVWvEN0TMwiCS4SI2uy7zKo+EVhypn0XlDI/YU
	m3iNzidIzM4dU9VQjUFh28lb7SbiPAWW8At2QyQ+sHDUIQkwHEB4i11594m/U22Ls9UFhd4ooJNV8
	vY2EbrkfGblEqwQIYT5GY8HTHl1KahB6fwC7wDBCt1w+lcb6B99vi8RXpQ2obMxmAsugQ3/IiEQ99
	qhqdrQ+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy7z6-00000001mkX-14su;
	Thu, 05 Mar 2026 12:39:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy7z3-00000001mjm-2xhI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 12:39:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 670814390C;
	Thu,  5 Mar 2026 12:39:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7F75C116C6;
	Thu,  5 Mar 2026 12:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772714357;
	bh=KHW4zGFxdwtgS6DZ4KhYyjuMBJUABIaJ1Yd4ZcE2WkU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SK8khnZEPjBqHDibVqZgldRd8kodqYHKeDVbUmohIiR8IWxOdaBzkdpRq51LctnYK
	 iSUUsL179ubvsOSrJhfT3BAw7HQhKc/auJ7YF476GEGuW8hIKu30z1RXE5suh73xFk
	 OmUDRSe87FrND8tFRvPlxa+yYJY0+O0UWKPanNyv8u6mHCb+E57Aa8bUtS1X1qqb3u
	 Cgj9jdifKdvtjuLtU0bxEnhLAazWQJ9XIpPnWZNZZ6VAtvDpRaw+GAQK5TwwuMM/Y8
	 zhLiCMcv67AY+pjXqPlXtjpCDNyzU7ydr4842wUo8by0RQMD5q/qPjepDHy/Ri9Rbb
	 RF8uWHcGrdKzA==
Message-ID: <8443cc2a-fd39-4af8-b3cc-370f6987b85c@kernel.org>
Date: Thu, 5 Mar 2026 13:39:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 1/2] arm64/mm: Enable batched TLB flush in
 unmap_hotplug_range()
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Yang Shi <yang@os.amperecomputing.com>,
 Christoph Lameter <cl@gentwo.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260305053148.3765710-1-anshuman.khandual@arm.com>
 <20260305053148.3765710-2-anshuman.khandual@arm.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260305053148.3765710-2-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_043917_791029_D6B172F7 
X-CRM114-Status: GOOD (  25.36  )
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

On 3/5/26 06:31, Anshuman Khandual wrote:
> During a memory hot remove operation, both linear and vmemmap mappings for
> the memory range being removed, get unmapped via unmap_hotplug_range() but
> mapped pages get freed only for vmemmap mapping. This is just a sequential
> operation where each table entry gets cleared, followed by a leaf specific
> TLB flush, and then followed by memory free operation when applicable.
> 
> This approach was simple and uniform both for vmemmap and linear mappings.
> But linear mapping might contain CONT marked block memory where it becomes
> necessary to first clear out all entire in the range before a TLB flush.
> This is as per the architecture requirement. Hence batch all TLB flushes
> during the table tear down walk and finally do it in unmap_hotplug_range().
> 
> Prior to this fix, it was hypothetically possible for a speculative access
> to a higher address in the contiguous block to fill the TLB with shattered
> entries for the entire contiguous range after a lower address had already
> been cleared and invalidated. Due to the table entries being shattered, the
> subsequent TLB invalidation for the higher address would not then clear the
> TLB entries for the lower address, meaning stale TLB entries could persist.
> 
> Besides it also helps in improving the performance via TLBI range operation
> along with reduced synchronization instructions. The time spent executing
> unmap_hotplug_range() improved 97% measured over a 2GB memory hot removal
> in KVM guest.
> 
> This scheme is not applicable during vmemmap mapping tear down where memory
> needs to be freed and hence a TLB flush is required after clearing out page
> table entry.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Closes: https://lore.kernel.org/all/aWZYXhrT6D2M-7-N@willie-the-truck/
> Fixes: bbd6ec605c0f ("arm64/mm: Enable memory hot remove")
> Cc: stable@vger.kernel.org
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/arm64/mm/mmu.c | 46 +++++++++++++++++++++++++++++----------------
>  1 file changed, 30 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index a6a00accf4f9..f7ccda22d39e 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1458,10 +1458,18 @@ static void unmap_hotplug_pte_range(pmd_t *pmdp, unsigned long addr,
>  
>  		WARN_ON(!pte_present(pte));
>  		__pte_clear(&init_mm, addr, ptep);
> -		flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> -		if (free_mapped)
> +		if (free_mapped) {
> +			/*
> +			 * CONT blocks are not supported in the vmemmap
> +			 */

Same nit as on patch #2,

/* CONT blocks are not supported in the vmemmap */


Same for the other comments.

Thanks!

Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>

-- 
Cheers,

David

