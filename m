Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A96CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 14:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z4He8DvFvL1dh/MxjkfNIXzNzaswx/ysDh66+XD0Vvo=; b=SVRhVM7zPBvBXoRLIBzZLUCW1X
	H1/HqbaDXZvgAt37JfS9ejmTgPDcUMU5kU6lxtXYI6ikjonWJKqS+NAdejFBJTxDP/NCkL2fPItpu
	G5+Kz96JJSD4n5TNCuYtQp1oCGykulu772rBxNJHyM44d+UkDlFBuJjaKFnpFOAx/zTUwJWhadAHt
	ctlrOquDMf4k96gZDVqvqmtsdivO4VAXzbWAmgcReD8mCOuGpuw4bJYDnDCCgiOP0qLCk6X18/9CN
	51UISm+G6CUwntAS483fo1ujvwKYSWEULhenOMas5iRtsWfmm9CiqNwDlUWicWpOZ+nJcIzyYqLto
	g3VtbafA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v29Va-000000021z6-3s4P;
	Fri, 26 Sep 2025 14:33:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v29VZ-000000021yw-3MWR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 14:33:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EB08A61E23;
	Fri, 26 Sep 2025 14:33:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84764C4CEF4;
	Fri, 26 Sep 2025 14:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758897192;
	bh=RFIOttVJp0eh/XAlE3x53bbYZOC5tbTcft+rUVFuLtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dYUWlJbG6nnFq6TmgkPCUvJrKhSOr//l2/p9YO9Ob/mS79D4oFiTdapaQWgNvE0Tp
	 d/vCDqpw50xMSBlk3aVLOoeuaOU4Flxrd56aMguc7oRiVNj0q6AU2XUmY7xmZGdRxu
	 yzvEHEz66UsLqIhGLS5TxmJVhzOSIieMbM2IQUCN7s18qZz+JDhAXKNMJgcPOg7GLu
	 G8DS28biYdg1311fE2giZqug6ZU0/T98pwCuu7T7rl2DSOAxkvDj3/RAEi8bpsnrPW
	 j/b2ihU2NVzZ9jZRiUCwLRy/gCm3LcdbKtiwae+0N+ASIwwY/Gq0RWtAa9tDE9acYS
	 l5Kc8mI9MFUYw==
Date: Fri, 26 Sep 2025 15:33:06 +0100
From: Will Deacon <will@kernel.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	jgg@ziepe.ca, mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v4 02/28] KVM: arm64: Donate MMIO to the hypervisor
Message-ID: <aNakIop0jdz9gH-t@willie-the-truck>
References: <20250819215156.2494305-1-smostafa@google.com>
 <20250819215156.2494305-3-smostafa@google.com>
 <aMA13Sowq91XEqP9@willie-the-truck>
 <aMlly_9kDE04Inn2@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aMlly_9kDE04Inn2@google.com>
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

On Tue, Sep 16, 2025 at 01:27:39PM +0000, Mostafa Saleh wrote:
> On Tue, Sep 09, 2025 at 03:12:45PM +0100, Will Deacon wrote:
> > On Tue, Aug 19, 2025 at 09:51:30PM +0000, Mostafa Saleh wrote:
> > > diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > > index 861e448183fd..c9a15ef6b18d 100644
> > > --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > > +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > > @@ -799,6 +799,70 @@ int ___pkvm_host_donate_hyp(u64 pfn, u64 nr_pages, enum kvm_pgtable_prot prot)
> > >  	return ret;
> > >  }
> > >  
> > > +int __pkvm_host_donate_hyp_mmio(u64 pfn)
> > > +{
> > > +	u64 phys = hyp_pfn_to_phys(pfn);
> > > +	void *virt = __hyp_va(phys);
> > > +	int ret;
> > > +	kvm_pte_t pte;
> > > +
> > > +	host_lock_component();
> > > +	hyp_lock_component();
> > > +
> > > +	ret = kvm_pgtable_get_leaf(&host_mmu.pgt, phys, &pte, NULL);
> > > +	if (ret)
> > > +		goto unlock;
> > > +
> > > +	if (pte && !kvm_pte_valid(pte)) {
> > > +		ret = -EPERM;
> > > +		goto unlock;
> > > +	}
> > 
> > Shouldn't we first check that the pfn is indeed MMIO? Otherwise, testing
> > the pte for the ownership information isn't right.
> 
> I will add it, although the input should be trusted as it comes from the
> hypervisor SMMUv3 driver.

(more on this below)

> > > +int __pkvm_hyp_donate_host_mmio(u64 pfn)
> > > +{
> > > +	u64 phys = hyp_pfn_to_phys(pfn);
> > > +	u64 virt = (u64)__hyp_va(phys);
> > > +	size_t size = PAGE_SIZE;
> > > +
> > > +	host_lock_component();
> > > +	hyp_lock_component();
> > 
> > Shouldn't we check that:
> > 
> >   1. pfn is mmio
> >   2. pfn is owned by hyp
> >   3. The host doesn't have something mapped at pfn already
> > 
> > ?
> > 
> 
> I thought about this initially, but as
> - This code is only called from the hypervisor with trusted
>   inputs (only at boot)
> - Only called on error path
> 
> So WARN_ON in case of failure to unmap MMIO pages seemed is good enough,
> to avoid extra code.
> 
> But I can add the checks if you think they are necessary, we will need
> to add new helpers for MMIO state though.

I'd personally prefer to put the checks here so that callers don't have
to worry (or forget!) about them. That also means that the donation
function can be readily reused in the same way as the existing functions
which operate on memory pages.

How much work is it to add the MMIO helpers?

> > > +	WARN_ON(kvm_pgtable_hyp_unmap(&pkvm_pgtable, virt, size) != size);
> > > +	WARN_ON(host_stage2_try(kvm_pgtable_stage2_set_owner, &host_mmu.pgt, phys,
> > > +				PAGE_SIZE, &host_s2_pool, PKVM_ID_HOST));
> > > +	hyp_unlock_component();
> > > +	host_unlock_component();
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
> > >  {
> > >  	return ___pkvm_host_donate_hyp(pfn, nr_pages, PAGE_HYP);
> > > diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> > > index c351b4abd5db..ba06b0c21d5a 100644
> > > --- a/arch/arm64/kvm/hyp/pgtable.c
> > > +++ b/arch/arm64/kvm/hyp/pgtable.c
> > > @@ -1095,13 +1095,8 @@ static int stage2_unmap_walker(const struct kvm_pgtable_visit_ctx *ctx,
> > >  	kvm_pte_t *childp = NULL;
> > >  	bool need_flush = false;
> > >  
> > > -	if (!kvm_pte_valid(ctx->old)) {
> > > -		if (stage2_pte_is_counted(ctx->old)) {
> > > -			kvm_clear_pte(ctx->ptep);
> > > -			mm_ops->put_page(ctx->ptep);
> > > -		}
> > > -		return 0;
> > > -	}
> > > +	if (!kvm_pte_valid(ctx->old))
> > > +		return stage2_pte_is_counted(ctx->old) ? -EPERM : 0;
> > 
> > Can this code be reached for the guest? For example, if
> > pkvm_pgtable_stage2_destroy() runs into an MMIO-guarded pte on teardown?
> 
> AFAICT, VMs page table is destroyed from reclaim_pgtable_pages() =>
> kvm_pgtable_stage2_destroy() => kvm_pgtable_stage2_destroy_range() ... =>
> stage2_free_walker()
> 
> Which doesn't interact with “stage2_unmap_walker”, so that should be
> fine.

Fair enough. I feel like this might bite us later on but, with what you
have, we'll see the -EPERM and then we can figure out what to do then.

Will

