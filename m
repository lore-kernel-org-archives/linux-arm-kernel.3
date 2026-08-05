Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D44FC55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 12:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWYvdwwhHXOZMdpKG9po4fGYOA5/a+2jpomAjIrH0/E=; b=lPnJQKgopMZkdl7/LrBb5b/7zK
	cRBB/5p6z4YWEF1kX+wg4HkfuJT+H5tdsdmFwm95KCxSARNeuR7bL1PoyYlUxqkUIYOuXDaZ+Bs7y
	IZZzQ4NWAriM2Ww7rV0egIwHFTqKPGUGQwVt6mA1cPE0cgGxWmw6MCBXOokWmg2T4qC+U2d0/9Vem
	XFKzWtUBFjLGanM5UwFwWFIW8LD4TxuBSnluiHK/Q/zDjq+hJJPg54Gdbix11jQuVHwmeBw2ei/no
	5AByaF3PrDUvEnbmiaCD8cVEGQEdcWa1JN9To55VdH7+C3eWZTvqvPcGUkfxAD28GMOsSsPemUTf0
	V1cc8xRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrb1d-00000003wZc-3s7A;
	Wed, 05 Aug 2026 12:47:13 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrb1b-00000003wZG-090q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 12:47:12 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-6a17c7c3c6eso5451a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 05:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785934029; x=1786538829; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XWYvdwwhHXOZMdpKG9po4fGYOA5/a+2jpomAjIrH0/E=;
        b=CkC3HvHnPmVzGMveXgHTum1AcwsA9gJj/YRzREiiI7Sk6sKOQdRV96FG2yAMxA4KGN
         FsWi/qHyMtTd5nZmnOL/fCofzZHVqgguVZKPQ9E2pdIoPbCEAc/0YdwnOm8PQZZY02Tc
         YOcoRp5EqiUZcXDTbJGSSd8X5yxPCuGzR+lZgx+JvCY3WWiPIgrEkFRVqi3NeH/LFYi5
         i50LxK6lvEWYTN2SiUUXiyN7h7q7dP8e13VWKuGuPHE3MaIDdrSGO0T5JL00+dUINoRN
         kZDOujkhsNetp2LSIBR7WJGQAn9HuUUl0C7i1PREvgERg2E0e7poa7DoMWUUm5LLDWHx
         Wp9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785934029; x=1786538829;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XWYvdwwhHXOZMdpKG9po4fGYOA5/a+2jpomAjIrH0/E=;
        b=EnltUnmmr2O4aO1LeLuTDqnjR18MDquOmkCXj9V0hSQIXXYCti6e6La+gNyqYJI9OM
         LEWsfLkoLwvXYqszGIJ+9uAD0oGIGah9r36dc95z+pasz5B41UBbnEdV6/nQIWjFRdFm
         f78Jxsw4vYNIfPL2dmKouFdBq4OUdjElR3rhzRNAm3nl4oZfxY8TkM3v1PTN8beuo3hw
         fExSbUZYoNuAncMzwzHqv430znj0MuxjZyXCDWOcnWlgneKCSjcooz+UIzaFRRFStet2
         lB1wSaW0tlkqvlKfsQMDvwcoY+9MAkyAuAL5tpxdiUvoFeoZ0TEkkClJzbpex1bS4ZGu
         aOGg==
X-Gm-Message-State: AOJu0Yz4uZS6zLz9Ril9BF9Ap+ZHCCNOFN0p96gM0KXxgz2nM5uqm6v2
	lV45ZcHMqvmZ3a9NxQUjCj4zp/H2igiCLc6EEFpvTLMMTt/TB7l6VVIk4c1Jv4WG9A==
X-Gm-Gg: AR+sD114tXZ8ILrqQNRK77buJ0s+B44SmXQ5fOMAugEOZhmkQ7JtkVl0ZCv3r1uUro+
	czMGqFvaReSpG3W4f/G9V268aQ1K6Z+xY2a235WKPYt5Tf6dDGgii3jYROoIM+VZPKAC+DZyuch
	cTpVwtgxTAHIBQF9COMaRqTe6oJcTkR1KjUoIK9c2PDuDu/L9id0/ei0FLvHXDag7qTb/izw7HA
	qbl3n2aXidGsnNKN98guyRlzvlD/IA74lCtu18uuwGAzsFWXZu4NzHKssvCe1bHRfRUFdDEz1UJ
	lT52IWUfyFp7QVQiBpdj6xla0Au6C3rdyzPyExq9ULQ02NUvcqw+7fucXuoi1mWneCdwK6AdmSo
	XAFDSmRBy1uKPka087UnbYp774wauzKzoazV9FlT5y1W3bZpnlqsYKS961TJeEla4/279vthbRT
	oBpb5wXT3tq7VBIdsFC45MWPE/3rr6BsLUdy0WA4gVaEPAKvne1nDRBERTB2eiwJU3h/vMDcHlI
	RdZ/k8sGt3Jb2ByrNXCx/ygpJORFnyqbBPnFY0L3Oa3
X-Received: by 2002:aa7:d747:0:b0:6a1:8b8f:bec4 with SMTP id 4fb4d7f45d1cf-6a18b8fc391mr1793a12.4.1785934028557;
        Wed, 05 Aug 2026 05:47:08 -0700 (PDT)
Received: from google.com (63.235.189.35.bc.googleusercontent.com. [35.189.235.63])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a1453d3825sm2028486a12.0.2026.08.05.05.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 05:47:07 -0700 (PDT)
Date: Wed, 5 Aug 2026 12:47:03 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, keirf@google.com
Subject: Re: [PATCH v7 02/24] KVM: arm64: Donate MMIO to the hypervisor
Message-ID: <anMwxy9gEEt_Wu6M@google.com>
References: <20260715115906.2664882-1-smostafa@google.com>
 <20260715115906.2664882-3-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260715115906.2664882-3-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_054711_166319_8201D45C 
X-CRM114-Status: GOOD (  37.46  )
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

On Wed, Jul 15, 2026 at 11:58:43AM +0000, Mostafa Saleh wrote:
> Add a function to donate MMIO to the hypervisor so IOMMU hypervisor
> drivers can protect and access the MMIO of IOMMUs.
> 
> As donating MMIO is very rare, and we don’t need to encode the full
> state, it’s reasonable to have a separate function to do this.
> It will init the host s2 page table with an invalid leaf with the owner ID
> to prevent the host from mapping the page on faults.
> 
> Also, prevent kvm_pgtable_stage2_unmap() from removing owner ID from
> stage-2 PTEs, as this can be triggered from recycle logic under memory
> pressure. There is no code relying on this, as all ownership changes is
> done via kvm_pgtable_stage2_set_owner()
> 
> For the error path in IOMMU drivers, add a function to donate MMIO
> back from hyp to host. However, that leaks the hypervisor virtual
> address range which should be acceptable as this is quite rare and
> it matches the behaviour of fix_map/block.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  7 ++
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 91 ++++++++++++++++++-
>  arch/arm64/kvm/hyp/pgtable.c                  | 11 +--
>  3 files changed, 102 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> index 29935c7da1de..51b0eb3844a9 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> @@ -36,6 +36,13 @@ int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn);
>  int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn);
>  int __pkvm_host_unshare_hyp(u64 pfn);
>  int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
> +/*
> + * Donate MMIO range to the hypervisor, it will be mapped in the hypervisor's
> + * private range and unmapped from the host stage-2.
> + */
> +int __pkvm_host_donate_hyp_mmio(phys_addr_t addr, size_t size, unsigned long *haddr);
> +/* Remaps MMIO range in the host, typically used in error path. */
> +int __pkvm_hyp_donate_host_mmio(phys_addr_t addr, size_t size);
>  int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
>  int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
>  int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index 4e329e39a695..d803b3dd4cb4 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -378,7 +378,11 @@ static int host_stage2_unmap_dev_all(void)
>  	u64 addr = 0;
>  	int i, ret;
>  
> -	/* Unmap all non-memory regions to recycle the pages */
> +	/*
> +	 * Unmap all non-memory regions to recycle the pages.
> +	 * That relies on kvm_pgtable_stage2_unmap() not clearing
> +	 * counted PTEs which include hypervisor MMIO.
> +	 */
>  	for (i = 0; i < hyp_memblock_nr; i++, addr = reg->base + reg->size) {
>  		reg = &hyp_memory[i];
>  		ret = kvm_pgtable_stage2_unmap(pgt, addr, reg->base - addr);
> @@ -1119,6 +1123,91 @@ int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
>  	return ret;
>  }
>  
> +int __pkvm_host_donate_hyp_mmio(phys_addr_t addr, size_t size, unsigned long *haddr)
> +{
> +	kvm_pte_t pte;
> +	u64 offset;
> +	int ret;
> +
> +	/* Only before de-privilege. */
> +	if (static_branch_unlikely(&kvm_protected_mode_initialized))
> +		return -EPERM;
> +
> +	if (!PAGE_ALIGNED(addr | size) ||
> +	    !pfn_range_is_valid(hyp_phys_to_pfn(addr), size >> PAGE_SHIFT))
> +		return -EINVAL;
> +
> +	ret = __pkvm_create_private_mapping(addr, size, PAGE_HYP_DEVICE, haddr);

> +	if (ret)
> +		return ret;
> +
> +	host_lock_component();
> +	for (offset = 0; offset < size; offset += PAGE_SIZE) {
> +		if (addr_is_memory(addr + offset)) {
> +			ret = -EINVAL;
> +			goto unlock;

If this fails we are left with the mapping inside the hyp because the unlock
doesn't destroy the private mapping. Is this intended ?

> +		}
> +		ret = kvm_pgtable_get_leaf(&host_mmu.pgt, addr + offset, &pte, NULL);
> +		if (ret)
> +			goto unlock;
> +		if (pte && !kvm_pte_valid(pte)) {
> +			ret = -EPERM;
> +			goto unlock;
> +		}
> +	}
> +	/*
> +	 * We set HYP as the owner of the MMIO pages in the host stage-2, for:
> +	 * - host aborts: host_stage2_adjust_range() would fail for invalid non zero PTEs.
> +	 * - recycle under memory pressure: host_stage2_unmap_dev_all() would call
> +	 *   kvm_pgtable_stage2_unmap() which will not clear non zero invalid ptes (counted).
> +	 * - other MMIO donation: Would fail as we check that the PTE is valid or empty.
> +	 */
> +	ret = host_stage2_try(kvm_pgtable_stage2_annotate, &host_mmu.pgt,
> +			      addr, size, &host_s2_pool,
> +			      KVM_HOST_INVALID_PTE_TYPE_DONATION,
> +			      FIELD_PREP(KVM_HOST_DONATION_PTE_OWNER_MASK, PKVM_ID_HYP));
> +unlock:
> +	host_unlock_component();
> +	return ret;
> +}
> +
> +int __pkvm_hyp_donate_host_mmio(phys_addr_t addr, size_t size)

This function seems to only update the host stage-2 annotation but it
doesn't destroy the hyp mapping.

I was looking to make use of this patch in an upcoming posting for the
v2 ITS hardening but in my case I don't need the private VA range
creation.

Thanks,
Sebastian

> +{
> +	kvm_pte_t pte;
> +	u64 offset;
> +	int ret = 0;
> +
> +	if (static_branch_unlikely(&kvm_protected_mode_initialized))
> +		return -EPERM;
> +
> +	if (!PAGE_ALIGNED(addr | size) ||
> +	    !pfn_range_is_valid(hyp_phys_to_pfn(addr), size >> PAGE_SHIFT))
> +		return -EINVAL;
> +
> +	host_lock_component();
> +	for (offset = 0; offset < size; offset += PAGE_SIZE) {
> +		if (addr_is_memory(addr + offset)) {
> +			ret = -EINVAL;
> +			goto unlock;
> +		}
> +		ret = kvm_pgtable_get_leaf(&host_mmu.pgt, addr + offset, &pte, NULL);
> +		if (ret)
> +			goto unlock;
> +		if (!pte || kvm_pte_valid(pte)) {
> +			ret = -EINVAL;
> +			goto unlock;
> +		}
> +		if (FIELD_GET(KVM_HOST_DONATION_PTE_OWNER_MASK, pte) != PKVM_ID_HYP) {
> +			ret = -EPERM;
> +			goto unlock;
> +		}
> +	}
> +	WARN_ON(host_stage2_idmap_locked(addr, size, PKVM_HOST_MMIO_PROT));
> +unlock:
> +	host_unlock_component();
> +	return ret;
> +}
> +
>  int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages)
>  {
>  	u64 phys = hyp_pfn_to_phys(pfn);
> diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> index 91a7dfad6686..3073184cf6ad 100644
> --- a/arch/arm64/kvm/hyp/pgtable.c
> +++ b/arch/arm64/kvm/hyp/pgtable.c
> @@ -1161,13 +1161,12 @@ static int stage2_unmap_walker(const struct kvm_pgtable_visit_ctx *ctx,
>  	kvm_pte_t *childp = NULL;
>  	bool need_flush = false;
>  
> -	if (!kvm_pte_valid(ctx->old)) {
> -		if (stage2_pte_is_counted(ctx->old)) {
> -			kvm_clear_pte(ctx->ptep);
> -			mm_ops->put_page(ctx->ptep);
> -		}
> +	/*
> +	 * That also ignores stage2_pte_is_counted() instead of clearing
> +	 * the PTE as the MMIO can be owned by the hypervisor.
> +	 */
> +	if (!kvm_pte_valid(ctx->old))
>  		return 0;
> -	}
>  
>  	if (kvm_pte_table(ctx->old, ctx->level)) {
>  		childp = kvm_pte_follow(ctx->old, mm_ops);
> -- 
> 2.55.0.141.g00534a21ce-goog
> 

