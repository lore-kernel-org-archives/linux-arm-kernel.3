Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F40E67A96
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 08:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2M/RYer8VqSFpIScaGLnqlWvdg8+Nw01gnVuCu5eeO8=; b=vebrlW0vaLuJEMih/FMbq9UshV
	JPVpChIP6uHAdta7/7FFL5kMf4QKRX/CVkc3Fuf+MiTr56aCIaT864/nwR+CTla0QDZmstaZDCj6u
	S8hkIZL8eeN6VfZ2zse/GnQEVl9RR5ZTmfSZDSf/aWsIuOjX7eGPG/JyZ2mIVs/yDtvu5jsTYh3Dv
	Ew0v7Es4YCKao0rC60aLzOPlBJMjeDLd0tlk3hsxFp4WWp6CwNtPskGNQIkDf4B/MgMamgpN7+xnj
	e4Jwk/TSzCYxKDH/zMhAsOfrTmsyVz2YsnNOWN7l94LvsTQe5zFTq6Al+ju2OLQ0aameCtpdnihf0
	Cu/0NGPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxLGw-0000000Emzg-20OE;
	Tue, 03 Mar 2026 08:38:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxLGu-0000000EmzK-0nmU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 08:38:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09E9A497;
	Tue,  3 Mar 2026 00:38:20 -0800 (PST)
Received: from [10.57.81.89] (unknown [10.57.81.89])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8222E3F7BD;
	Tue,  3 Mar 2026 00:38:24 -0800 (PST)
Message-ID: <0a10ea33-937a-4294-b9a1-9323c706434d@arm.com>
Date: Tue, 3 Mar 2026 08:38:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: contpte: fix set_access_flags() no-op check for
 SMMU/ATS faults
Content-Language: en-GB
To: Piotr Jaroszynski <pjaroszynski@nvidia.com>, Will Deacon
 <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Cc: Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Zi Yan <ziy@nvidia.com>,
 Breno Leitao <leitao@debian.org>, stable@vger.kernel.org
References: <20260303063751.2531716-1-pjaroszynski@nvidia.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20260303063751.2531716-1-pjaroszynski@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_003828_336431_11E303FE 
X-CRM114-Status: GOOD (  34.72  )
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

On 03/03/2026 06:37, Piotr Jaroszynski wrote:
> contpte_ptep_set_access_flags() compared the gathered ptep_get() value
> against the requested entry to detect no-ops. ptep_get() ORs AF/dirty
> from all sub-PTEs in the CONT block, so a dirty sibling can make the
> target appear already-dirty. When the gathered value matches entry, the
> function returns 0 even though the target sub-PTE still has PTE_RDONLY
> set in hardware.
> 
> For CPU page-table walks this is benign: with FEAT_HAFDBS the hardware
> may set AF/dirty on any sub-PTE and the CPU TLB treats the gathered
> result as authoritative for the entire range. But an SMMU without HTTU
> (or with HA/HD disabled in CD.TCR) evaluates each descriptor
> individually and will keep raising F_PERMISSION on the unchanged target
> sub-PTE, causing an infinite fault loop.

Ouch; thanks for the fix!

> 
> Gathering can therefore cause false no-ops when only a sibling has been
> updated:
>  - write faults: target still has PTE_RDONLY (needs PTE_RDONLY cleared)
>  - read faults:  target still lacks PTE_AF
> 
> Fix by checking all sub-PTEs' access flags individually (not via the
> gathered view) before returning no-op, and use the raw target PTE for
> the write-bit unfold decision. The access-flag mask matches the one
> used by __ptep_set_access_flags().
> 
> Per Arm ARM (DDI 0487) D8.7.1 ("The Contiguous bit"), any sub-PTE in a CONT
> range may become the effective cached translation and software must
> maintain consistent attributes across the range.
> 
> Fixes: 4602e5757bcc ("arm64/mm: wire up PTE_CONT for user mappings")
> 

nit: there shouldn't be whitespace here.

> Reviewed-by: Alistair Popple <apopple@nvidia.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Jason Gunthorpe <jgg@nvidia.com>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Breno Leitao <leitao@debian.org>
> Cc: stable@vger.kernel.org
> Signed-off-by: Piotr Jaroszynski <pjaroszynski@nvidia.com>

This fix looks good to me:

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>


> ---
>  arch/arm64/mm/contpte.c | 47 +++++++++++++++++++++++++++++++++++++----
>  1 file changed, 43 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> index bcac4f55f9c1..9868bfe4607c 100644
> --- a/arch/arm64/mm/contpte.c
> +++ b/arch/arm64/mm/contpte.c
> @@ -390,6 +390,23 @@ void contpte_clear_young_dirty_ptes(struct vm_area_struct *vma,
>  }
>  EXPORT_SYMBOL_GPL(contpte_clear_young_dirty_ptes);
>  
> +static bool contpte_all_subptes_match_access_flags(pte_t *ptep, pte_t entry)
> +{
> +	pte_t *cont_ptep = contpte_align_down(ptep);
> +	const pteval_t access_mask = PTE_RDONLY | PTE_AF | PTE_WRITE | PTE_DIRTY;
> +	pteval_t entry_access = pte_val(entry) & access_mask;
> +	int i;
> +
> +	for (i = 0; i < CONT_PTES; i++) {
> +		pteval_t pte_access = pte_val(__ptep_get(cont_ptep + i)) & access_mask;
> +
> +		if (pte_access != entry_access)
> +			return false;
> +	}

There are 2 forms of "dirty"; HW and SW. Here you are testing that all ptes in
the contpte block have the same form of dirty, which I think is the correct
thing to do. You could relax to just test that every pte has one of the forms of
dirty, But in that case, if a pte is sw-dirty but not hw-dirty, then the
PTE_RDONLY bit remains set and the SMMU will fault, I think?

If my reasoning is correct, then I think arm64 hugetlb has a similar bug; See
__cont_access_flags_changed(), which just checks for any form of dirty. So I
guess hugetlb is buggy in the same way and should be fixed to use this more
stringent approach?

Thanks,
Ryan

> +
> +	return true;
> +}
> +
>  int contpte_ptep_set_access_flags(struct vm_area_struct *vma,
>  					unsigned long addr, pte_t *ptep,
>  					pte_t entry, int dirty)
> @@ -399,13 +416,35 @@ int contpte_ptep_set_access_flags(struct vm_area_struct *vma,
>  	int i;
>  
>  	/*
> -	 * Gather the access/dirty bits for the contiguous range. If nothing has
> -	 * changed, its a noop.
> +	 * Check whether all sub-PTEs in the CONT block already have the
> +	 * requested access flags, using raw per-PTE values rather than the
> +	 * gathered ptep_get() view.
> +	 *
> +	 * ptep_get() gathers AF/dirty state across the whole CONT block,
> +	 * which is correct for CPU TLB semantics: with FEAT_HAFDBS the
> +	 * hardware may set AF/dirty on any sub-PTE and the CPU TLB treats
> +	 * the gathered result as authoritative for the entire range. But an
> +	 * SMMU without HTTU (or with HA/HD disabled in CD.TCR) evaluates
> +	 * each descriptor individually and will keep faulting on the target
> +	 * sub-PTE if its flags haven't actually been updated. Gathering can
> +	 * therefore cause false no-ops when only a sibling has been updated:
> +	 *  - write faults: target still has PTE_RDONLY (needs PTE_RDONLY cleared)
> +	 *  - read faults:  target still lacks PTE_AF
> +	 *
> +	 * Per Arm ARM (DDI 0487) D8.7.1, any sub-PTE in a CONT range may
> +	 * become the effective cached translation, so all entries must have
> +	 * consistent attributes. Check the full CONT block before returning
> +	 * no-op, and when any sub-PTE mismatches, proceed to update the whole
> +	 * range.
>  	 */
> -	orig_pte = pte_mknoncont(ptep_get(ptep));
> -	if (pte_val(orig_pte) == pte_val(entry))
> +	if (contpte_all_subptes_match_access_flags(ptep, entry))
>  		return 0;
>  
> +	/*
> +	 * Use raw target pte (not gathered) for write-bit unfold decision.
> +	 */
> +	orig_pte = pte_mknoncont(__ptep_get(ptep));
> +
>  	/*
>  	 * We can fix up access/dirty bits without having to unfold the contig
>  	 * range. But if the write bit is changing, we must unfold.


