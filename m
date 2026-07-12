Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C07DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 15:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EB4yDpb44w+GJHdAYOL5yRV8WP3HkDbon7ZVHvgT3yQ=; b=icPEPQ746le9aRLj/hHrYSCCmf
	fW13Sfp8vEGEcpkIyBC6dzcKA+4cD7Bi5la5fzRRBrW+DQL36TImLIZWKpnfa24lgJXHTLuDpaUkf
	srHyN1doAwwNjGuUhBtUUjhIbXQkXQ1ORo14ZRnDHyJMDgIplWnGJsKo3wpBw3nzLPkncxdceLnDi
	1jwl0cZe5Z8GK/HS2seWv2DNw0GbiGvgm04NJOm7M2Y1YKpZJu6qHnRz2vDTjIiHDk+r5xr/jHh02
	GTLS+CoKlTFk6qC+GokO8pCKq+S3XpOd/ZbYKotey2O1ezextjjRWyY7VquZkjBA8CrhEa6TTfwT5
	Ti9CTU1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiw7S-00000007ZYc-0wmo;
	Sun, 12 Jul 2026 15:29:26 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiw7P-00000007ZYE-2yyL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 15:29:25 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-493b8d92a4eso50185e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 08:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783870162; x=1784474962; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EB4yDpb44w+GJHdAYOL5yRV8WP3HkDbon7ZVHvgT3yQ=;
        b=BQbd9ZMHPunR165XZsUHknhEwUwbZ60Oz82wmfKx2rR74FBkmYVPO08XyhdrY2ePjO
         d3d736XiXVnLpg8LzaJVZEP0jDE3zIMcB6zhY60oXK5HfYDO/h30DAq7PaDEy0QuAPsP
         PGCVa5d+pK51+kVqmkViRG+g2nUhR4Xj+xwFB4GKsdyif7fmR5mAUqkgKxqManoBMtqf
         jduJuBvKKJivkS0txQxUZomf2W1HPGXGlhTRpPYCb4Dx3/VkGq96+sFwzs8/i4XxJSsE
         sGj9LP2V4TKiNPruh77u70EzpiCjTwuog0kFGmvHHdkDPlCj/ya0Q3S2h0mDYNt5yjTa
         TQuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783870162; x=1784474962;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EB4yDpb44w+GJHdAYOL5yRV8WP3HkDbon7ZVHvgT3yQ=;
        b=f4BGJWAahx0DpuBROz1OjL8uEAgA9FQIX6Db9MMWMwfi3OvbipVvbw8Vyw0hrG5CzI
         e9FpaQmGuDx7Ylkb/JBWxCi/1Q8IC08rhF/NdlQlnSUZdTxsosqLjsXZFK8RS92bNz2J
         kIXQtfodT8z+mW0P3G/lrqi7dSvf6WiuCubRnbQpiqKIs54fEUFIyn0Y75RtHdWiQXix
         9/Tk+bPDT4EqvbsI4NhEJpQLXcJILbp8GvrrL30RLCHxjmPRSzJ+uGVXODYXo4OOxMN/
         hgyCD2mA0xcWnm9zpj0oEDrKgZuInGxngMphtvTkB08m1T2quXTW7PJRyPhYEZM333Ua
         PlOQ==
X-Gm-Message-State: AOJu0YwddTqEahvQ+BabF8luxpnNOkpi/DBLgipxnPkMqydamjm6TyXk
	UqzsY/NqrJXJpnM7jTQb/d+Pd/wHLXlqbzabD3h/8R8N7IaVQkwkKM0puw9ElEjkLg==
X-Gm-Gg: AfdE7clTbq0oEG9IjaqqvYEj39+I+vTo0nWAwp9RDLlrTri2BqBxKbxKwMRwh29Ed61
	cuuefL+SQ6fjbkwvjzeeKRnpa6jHhBEVubG7wURvAPv3IKEV5KghJ7gEN0nnzXyj+FHYzk298GA
	60BESWtZrKfd+BObldFd5d32aN2AU1GouIIsFaKgjEIDb52n0UiWAobOsZITfulzwCFdhwMMNGq
	QNSmmXsuBVOizWZ+5onO7PS7NJoXLqLLNfmrYpe9Itf13wxzXTVszU8cjfFbCbVYblygWPNBHyW
	Xy8QQtqjpITPurM0sdWffV8Msu/ihg8ozQbnb2OgT6PLQ8aqwrjJkziw2LDNIRFrwq6z9icuKwJ
	VDMHfj+j9AuBPFzCSacLB/F3WMDJ6v0Wj2yRHeAtNF0CWKvnaUaQ1BIO8EjvRwwC1xru1xxRXj/
	mUN7O2yp0+I9/sFo3VuMlkV5G8XmZvlVnBvC7Rxsvfz2E+Q9UD
X-Received: by 2002:a05:600c:8889:20b0:493:a96b:f9fe with SMTP id 5b1f17b1804b1-493f856ecc9mr2162265e9.4.1783870161311;
        Sun, 12 Jul 2026 08:29:21 -0700 (PDT)
Received: from google.com (220.60.76.34.bc.googleusercontent.com. [34.76.60.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb742d0esm297830905e9.13.2026.07.12.08.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 08:29:20 -0700 (PDT)
Date: Sun, 12 Jul 2026 15:29:16 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	jgg@ziepe.ca, mark.rutland@arm.com, qperret@google.com,
	tabba@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 02/25] KVM: arm64: Donate MMIO to the hypervisor
Message-ID: <alOyzOL16dhYk724@google.com>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-3-smostafa@google.com>
 <alEnH98wFppYjmnE@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alEnH98wFppYjmnE@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_082923_831128_DE55933C 
X-CRM114-Status: GOOD (  56.34  )
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

On Fri, Jul 10, 2026 at 06:08:47PM +0100, Vincent Donnefort wrote:
> On Fri, May 01, 2026 at 11:19:04AM +0000, Mostafa Saleh wrote:
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
> >  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |   2 +
> >  arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 119 +++++++++++++++++-
> >  arch/arm64/kvm/hyp/pgtable.c                  |   9 +-
> >  3 files changed, 121 insertions(+), 9 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > index 3cbfae0e3dda..ff440204d2c7 100644
> > --- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > +++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > @@ -36,6 +36,8 @@ int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn);
> >  int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn);
> >  int __pkvm_host_unshare_hyp(u64 pfn);
> >  int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
> > +int __pkvm_host_donate_hyp_mmio(phys_addr_t addr, size_t size, unsigned long *haddr);
> > +int __pkvm_hyp_donate_host_mmio(phys_addr_t addr, size_t size);
> 
> Can we have u64 pfn, u64 nr_pages here to match all the other functions?
> 

I see the convention is that phys_addr_t is used for physical addresses
as (addr_is_memory(), host_stage2_idmap_locked(()...) while u64 is used
for pfn.

> Also, as this is used by a "module" perhaps a sort of kerneldoc would be nice,
> especially to explain this isn't mapped into the hyp idmap range.

Sure I can add a comment.

> 
> >  int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
> >  int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
> >  int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
> > diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > index 28a471d1927c..2fb20a63a417 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > @@ -353,6 +353,38 @@ int __pkvm_prot_finalize(void)
> >  	return 0;
> >  }
> >  
> > +/* Unmap MMIO region while skipping donated PTEs. */
> > +static int host_stage2_unmap_mmio_region(u64 start, u64 size)
> > +{
> > +	struct kvm_pgtable *pgt = &host_mmu.pgt;
> > +	u64 unmap_start = start;
> > +	u64 addr = start;
> > +	kvm_pte_t pte;
> > +	int ret = 0;
> > +	u8 level;
> > +
> > +	while (addr < start + size) {
> > +		ret = kvm_pgtable_get_leaf(pgt, addr, &pte, &level);
> > +		if (ret)
> > +			return ret;
> > +		if (!kvm_pte_valid(pte) && pte != 0) {
> > +			if (addr > unmap_start) {
> > +				ret = kvm_pgtable_stage2_unmap(pgt, unmap_start,
> > +							       addr - unmap_start);
> > +				if (ret)
> > +					return ret;
> > +			}
> > +			addr += kvm_granule_size(level);
> > +			unmap_start = addr;
> > +		} else {
> > +			addr += kvm_granule_size(level);
> > +		}
> > +	}
> > +	if (addr > unmap_start)
> > +		ret = kvm_pgtable_stage2_unmap(pgt, unmap_start, addr - unmap_start);
> 
> Ah shame, that's a lot of table walking. I guess we could:
> 
>  * create our own custom walker here but that would duplicate a lot of logic
>    from pgtable.c. So doesn't look great.

Yes, that seems too complicated.

> 
>  * Retry kvm_pgtable_stage2_unmap() as long as it return -EPERM... but then we
>    it needs to return where it has stopped?

Yes, that is not possible with its current interface.

> 
>  * Modify kvm_pgtable_stage2_unmap() to just skip the refcounted entries?
>    There's already a flag something that looks like this: KVM_PGTABLE_WALK_IGNORE_EAGAIN
> 

I thought about this, my main concern is that now any unmap will fail
silently if it hits a refcounted page. Propably not too bad as that only
is used in recycling.

> I am not so convinced by the first two points but the last one is probably worth
> exploring.
>  
> > +	return ret;
> > +}
> > +
> >  static int host_stage2_unmap_dev_all(void)
> >  {
> >  	struct kvm_pgtable *pgt = &host_mmu.pgt;
> > @@ -363,11 +395,11 @@ static int host_stage2_unmap_dev_all(void)
> >  	/* Unmap all non-memory regions to recycle the pages */
> >  	for (i = 0; i < hyp_memblock_nr; i++, addr = reg->base + reg->size) {
> >  		reg = &hyp_memory[i];
> > -		ret = kvm_pgtable_stage2_unmap(pgt, addr, reg->base - addr);
> > +		ret = host_stage2_unmap_mmio_region(addr, reg->base - addr);
> >  		if (ret)
> >  			return ret;
> >  	}
> > -	return kvm_pgtable_stage2_unmap(pgt, addr, BIT(pgt->ia_bits) - addr);
> > +	return host_stage2_unmap_mmio_region(addr, BIT(pgt->ia_bits) - addr);
> >  }
> >  
> >  /*
> > @@ -1087,6 +1119,89 @@ int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
> >  	return ret;
> >  }
> >  
> > +int __pkvm_host_donate_hyp_mmio(phys_addr_t addr, size_t size, unsigned long *haddr)
> > +{
> > +	kvm_pte_t pte;
> > +	u64 offset;
> > +	int ret;
> > +
> > +	/* Only before de-privilege. */
> > +	if (static_branch_unlikely(&kvm_protected_mode_initialized))
> > +		return -EPERM;
> > +
> > +	if (!PAGE_ALIGNED(addr | size))
> > +		return -EINVAL;
> 
> Would be nice here to have pfn_range_is_valid() even though this is only
> used by modules? (ditto __pkvm_hyp_donate_host_mmio())

Will do.

> 
> > +
> > +	ret = __pkvm_create_private_mapping(addr, size, PAGE_HYP_DEVICE, haddr);
> > +	if (ret)
> > +		return ret;
> 
> Perhaps better to do it once it's been annotated into the host s2, so that we
> don't burn the private range in case of failure.

This really should not fail, or the system is already have bigger
problems, and that also does not allocate much space (128K), I see
that is easier to do this way than having to fix the host stage-2
if the allocation fails.

> 
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
> > +	if (!PAGE_ALIGNED(addr | size))
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
> 
> It should probably verify it is also mapped as we expect into the hyp.

I thought about that, but the caller is be trusted and I was aiming
for simplicity, so the check for PKVM_ID_HYP seemed enough, but no
strong opinion.

> 
> 
> > +		if (FIELD_GET(KVM_HOST_DONATION_PTE_OWNER_MASK, pte) != PKVM_ID_HYP) {
> > +			ret = -EPERM;
> > +			goto unlock;
> > +		}
> > +	}
> > +	WARN_ON(host_stage2_idmap_locked(addr, size, PKVM_HOST_MMIO_PROT));
> 
> Perhaps we are better of simply zapping the entry and not map it proactively?

I do not think it matters that much, this is a failure path, and the
space is too small anyway. But no strong opinion also.

> 
> And even if we can't "reclaim" the VA-space from the private range, it would be
> good to unmap it. I have made a function for that as part of the allocator
> series:
> 
> https://lore.kernel.org/all/20260706175415.2604046-3-vdonnefort@google.com/
>
I do not think that is a big problem at the moment all the other
users of the VA space leak it on failure, I can re-use this logic
when the allocator seires lands, otherwise I'd avoid adding more code.

Thanks,
Mostafa



