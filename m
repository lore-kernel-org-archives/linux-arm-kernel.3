Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F22FC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 18:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ciQ1DWmOl90RU8Z0TC+0zcZO7jcoRA4J346GsiDnDic=; b=JqPtfYQEYyzh11XQf0HWZth3Tc
	FQhv/FXB08yX+aAGSAu+Sy9lauQNV2qk+BckAvM5cybrW01IUZSlclse5Q+VKMFmXQRKcElX6LIW0
	Pun7lnaA9IkH71WdCNn3IzTewtP8sOxJKEnb9MOj70E6KpFnpypyMdGXp8Tyn13yDJ8wiSEHrgNIH
	+YMs2vis8Uk3SZ3wxShwrRWGhpXEFV24CZzkrTGSoUN9kbKR5dZL7Nj7KOd8OU1RCoIFUxnnkhJ0h
	KBysDfVxxel/IJfBaKbSA88ncKVugkq3FBV86abFPOhcPK1tNzFal79chF9mFbTcRkAWt+zNtttHU
	6hd7qnLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk4LA-0000000FfrW-2w0F;
	Wed, 15 Jul 2026 18:28:16 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk4L8-0000000Ffr1-3c04
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 18:28:16 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-493b8d92a4eso6775e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 11:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784140092; x=1784744892; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ciQ1DWmOl90RU8Z0TC+0zcZO7jcoRA4J346GsiDnDic=;
        b=m2hnS1APHvpL2kn1NaY07JYQqAZl0I3xeCrp25v2VXaMqZhZQAxy/eKJdLeNd64P7k
         d3N11Ai326vrW7g+QeGfFJ5MjCQ9ltac+FUVYSTMTj/5enwmkEeB81zMo8aKmPak6O5q
         kJMwL+ihNbVdIKrbvx0AP9VXZwBJw1ycyPbh0J/TCv0xsgtap7l19dnFf1D3mjltTuXn
         /2zBXa8ADcGN3EamzYDNnWreUtXOZ/88ZxZX+H9KLwPNdZw2s5tIYyWpD3LjK0VoOyJQ
         GluerFi62HW/qrGTakOj1gtyUPhRvfMc1Bslo8wO7ZQcMgjE0/7vTfdRxwDMwpvgPRNo
         ogoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784140092; x=1784744892;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ciQ1DWmOl90RU8Z0TC+0zcZO7jcoRA4J346GsiDnDic=;
        b=o+Jzx44j8xzwiIIIIZfyy2Nwvy0WMeUeYeBppOsvq6wfNdk+S2BrRkkX9PR/ainTbT
         9m26Fxxf6GAINLE1UuQIs736xlafN404OQ/wzpIt/uncm+96z/X4n6HBa19xvt4FDTg7
         XsrkU6SGulkzoPVUy0mfWkQjV1r1PgZGEyUaa9dumkc31h9xDG8C1nHM0oe+k6VQ/dN/
         aFBX0XvzoX1uGP4YlSaPLMeN1Io51unpJ7oXC29dc3DKj+JTBBNtTVpCHlWZLqzVyu3p
         RUPLjkaYPLAXcT2/3tamNCbbsaInrcxcjrVOEDHSbO5GI791hg7SI9S+Q8x7Xs4ut2Kk
         tZFQ==
X-Gm-Message-State: AOJu0Yz3aw9otiJz3p0s+kqZN9fin+exs2nzKhCXWv5RUXVhH3kbgtdO
	8Cpc+RepoQgXPP75lQwzVd7/0SQbfMigLtITIYStUQIFG8PEVfrsKNmCwQ9JvKxgKQ==
X-Gm-Gg: AfdE7cmwtNybykZs+iK/fm4DbSh8fQXrAC/Lt7wm60QezCYs4EZ/cPirIKDxCE2PgOF
	qFOqW/F1oBFkYwgOKhqbKcDY9rk5nPqzuW3pNOL1SlihZdljoleDLEL6AcDCp5J5WKMwiEjYoOj
	9ACkj1I1qw9YHuoZAaU55cFc+WbVasB0kZh2JhKyKxjC91ZlgkLm/Njjq2bL9bCkFEm7mltxLq1
	0wRhj/yaIaVpxXI8mLfzSwd6UXR2ZXY9+wmhFgXk/DDPuTHniBmA6WmQW3c4kkgzNdYghL2+9ET
	E1n/yO7GZfU8FgB+uMAemeakIHRnrnhffEkIvIlQ8/3GqDseBONG47Q4suYOUDkgvl4EdIirZPg
	6eDR3QbHoe87fpiXkNOYOMvbVtxVhDY2zv/AqIqGaA754sMbfz3TZ6aC49icnoUSOdLnqH9o4By
	up1cG37HDu5j3DfGvpLyA+AjOSNYcADQ84CRsMvV3Og8+4npvk
X-Received: by 2002:a05:600c:5797:b0:493:b86f:c913 with SMTP id 5b1f17b1804b1-49541e941fbmr34885e9.1.1784140091687;
        Wed, 15 Jul 2026 11:28:11 -0700 (PDT)
Received: from google.com (220.60.76.34.bc.googleusercontent.com. [34.76.60.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541e9ac02sm771805e9.14.2026.07.15.11.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 11:28:10 -0700 (PDT)
Date: Wed, 15 Jul 2026 18:28:06 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v7 02/24] KVM: arm64: Donate MMIO to the hypervisor
Message-ID: <alfRNu-Y7EMol7Gd@google.com>
References: <20260715115906.2664882-1-smostafa@google.com>
 <20260715115906.2664882-3-smostafa@google.com>
 <alfCz_WQR_Al2lFw@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alfCz_WQR_Al2lFw@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_112814_957798_16B1CFC9 
X-CRM114-Status: GOOD (  41.73  )
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

On Wed, Jul 15, 2026 at 06:26:39PM +0100, Vincent Donnefort wrote:
> On Wed, Jul 15, 2026 at 11:58:43AM +0000, Mostafa Saleh wrote:
> > Add a function to donate MMIO to the hypervisor so IOMMU hypervisor
> > drivers can protect and access the MMIO of IOMMUs.
> > 
> > As donating MMIO is very rare, and we don’t need to encode the full
> > state, it’s reasonable to have a separate function to do this.
> > It will init the host s2 page table with an invalid leaf with the owner ID
> > to prevent the host from mapping the page on faults.
> > 
> > Also, prevent kvm_pgtable_stage2_unmap() from removing owner ID from
> > stage-2 PTEs, as this can be triggered from recycle logic under memory
> > pressure. There is no code relying on this, as all ownership changes is
> > done via kvm_pgtable_stage2_set_owner()
> > 
> > For the error path in IOMMU drivers, add a function to donate MMIO
> > back from hyp to host. However, that leaks the hypervisor virtual
> > address range which should be acceptable as this is quite rare and
> > it matches the behaviour of fix_map/block.
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  7 ++
> >  arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 91 ++++++++++++++++++-
> >  arch/arm64/kvm/hyp/pgtable.c                  | 11 +--
> >  3 files changed, 102 insertions(+), 7 deletions(-)
> > 
[...]
> > +	u64 offset;
> > +	int ret;
> > +
> > +	/* Only before de-privilege. */
> > +	if (static_branch_unlikely(&kvm_protected_mode_initialized))
> > +		return -EPERM;
> > +
> > +	if (!PAGE_ALIGNED(addr | size) ||
> 
> You wouldn't need that with u64 pfn, u64 nr_pages :) 

Well that need to be added somewhere :) but I am ok changing the args.

> 
> > +	    !pfn_range_is_valid(hyp_phys_to_pfn(addr), size >> PAGE_SHIFT))
> > +		return -EINVAL;
> > +
> > +	ret = __pkvm_create_private_mapping(addr, size, PAGE_HYP_DEVICE, haddr);
> > +	if (ret)
> > +		return ret;
> > +
> > +	host_lock_component();
> > +	for (offset = 0; offset < size; offset += PAGE_SIZE) {
> > +		if (addr_is_memory(addr + offset)) {
> > +			ret = -EINVAL;
> > +			goto unlock;
> > +		}
> > +		ret = kvm_pgtable_get_leaf(&host_mmu.pgt, addr + offset, &pte, NULL);
> > +		if (ret)
> > +			goto unlock;
> 
> Is that called for big regions? because that looks quite inefficient even for
> something that is init and IIRC we want to use this for GIC hardening too?
> 

It is 128KB, and that's called once at boot (where we walk the whole
addres space anyway) so I don't think it has any impact, and we do
that in other hot paths as __pkvm_guest_share_host().

> Perhaps it wouldn't be complicated to walk hyp_memory[] to make sure this
> doesn't overlap any memory region. And then to reuse check_page_state_range() to
> verify the host stage-2? 

tbh, I think that current implementation is simpler, as we need to
write a special callback for check_page_state_range()

> 
> > +		if (pte && !kvm_pte_valid(pte)) {
> > +			ret = -EPERM;
> > +			goto unlock;
> > +		}
> > +	}
> > +	/*
> > +	 * We set HYP as the owner of the MMIO pages in the host stage-2, for:
> > +	 * - host aborts: host_stage2_adjust_range() would fail for invalid non zero PTEs.
> > +	 * - recycle under memory pressure: host_stage2_unmap_dev_all() would call
> > +	 *   kvm_pgtable_stage2_unmap() which will not clear non zero invalid ptes (counted).
> > +	 * - other MMIO donation: Would fail as we check that the PTE is valid or empty.
> > +	 */
> 
> Not sure we want that level of detail, it will probably become stall very
> quickly. Perhaps we can simply say "the annotation is refcounted and protects
> this region until it is released with __pkvm_hyp_donate_host_mmio()" or
> something like that?
> 
> Also that makes me think, do we want to add this to the ownership_selftest?

Sure, I can look into that.

> 
> > +	ret = host_stage2_try(kvm_pgtable_stage2_annotate, &host_mmu.pgt,
> > +			      addr, size, &host_s2_pool,
> > +			      KVM_HOST_INVALID_PTE_TYPE_DONATION,
> > +			      FIELD_PREP(KVM_HOST_DONATION_PTE_OWNER_MASK, PKVM_ID_HYP));
> > +unlock:
> > +	host_unlock_component();
> > +	return ret;
> > +}
> > +
> > +int __pkvm_hyp_donate_host_mmio(phys_addr_t addr, size_t size)
> > +{
> > +	kvm_pte_t pte;
> > +	u64 offset;
> > +	int ret = 0;
> > +
> > +	if (static_branch_unlikely(&kvm_protected_mode_initialized))
> > +		return -EPERM;
> > +
> > +	if (!PAGE_ALIGNED(addr | size) ||
> > +	    !pfn_range_is_valid(hyp_phys_to_pfn(addr), size >> PAGE_SHIFT))
> > +		return -EINVAL;
> > +
> > +	host_lock_component();
> > +	for (offset = 0; offset < size; offset += PAGE_SIZE) {
> > +		if (addr_is_memory(addr + offset)) {
> > +			ret = -EINVAL;
> > +			goto unlock;
> > +		}
> > +		ret = kvm_pgtable_get_leaf(&host_mmu.pgt, addr + offset, &pte, NULL);
> > +		if (ret)
> > +			goto unlock;
> > +		if (!pte || kvm_pte_valid(pte)) {
> > +			ret = -EINVAL;
> > +			goto unlock;
> > +		}
> > +		if (FIELD_GET(KVM_HOST_DONATION_PTE_OWNER_MASK, pte) != PKVM_ID_HYP) {
> > +			ret = -EPERM;
> > +			goto unlock;
> > +		}
> > +	}
> > +	WARN_ON(host_stage2_idmap_locked(addr, size, PKVM_HOST_MMIO_PROT));
> > +unlock:
> > +	host_unlock_component();
> > +	return ret;
> > +}
> > +
> >  int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages)
> >  {
> >  	u64 phys = hyp_pfn_to_phys(pfn);
> > diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> > index 91a7dfad6686..3073184cf6ad 100644
> > --- a/arch/arm64/kvm/hyp/pgtable.c
> > +++ b/arch/arm64/kvm/hyp/pgtable.c
> > @@ -1161,13 +1161,12 @@ static int stage2_unmap_walker(const struct kvm_pgtable_visit_ctx *ctx,
> >  	kvm_pte_t *childp = NULL;
> >  	bool need_flush = false;
> >  
> > -	if (!kvm_pte_valid(ctx->old)) {
> > -		if (stage2_pte_is_counted(ctx->old)) {
> > -			kvm_clear_pte(ctx->ptep);
> > -			mm_ops->put_page(ctx->ptep);
> > -		}
> > +	/*
> > +	 * That also ignores stage2_pte_is_counted() instead of clearing
> > +	 * the PTE as the MMIO can be owned by the hypervisor.
> 
> Not sure we should reference something pKVM specific in that code. Perhaps just
> say we don't touch refcounted PTEs?

Sure, I can simplify it.

Thanks,
Mostafa

