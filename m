Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21875F01829
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 11:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GMeo7ZBvH0cA0HOgk+OCA6MPWQsPbZFhZV7ybP7ZCL4=; b=U8G/T1FaNJqwxKj5awqZq/XIEZ
	QPFuQ9qWzC5KjZHGqDxQ1pSyyXdsJE6Qj6ja2kt5zKupGa8jnc6nrMROc40Yd4XrhZ+GvDPqaq2cn
	GHju3ni17mkmuc4/ZoD28pggZQqlRFi3cyX+jGdlkzPdxBtEvQcnMt6SXKf7UrDK/gONs9Bc4kSEO
	WBVgHuDD23NmIy7fGsbqC3Z4tf/fAszj/OX5FdKQonM8g1y6Zmm9+73sDtM+4ghR60SauoC62zRL3
	4x8qOlY2C/jqo1jFDYWNICO99+/W/Z8dJQkhyoAn3s5o3yLxE0EDp3xoALowfeYtTqDJQFwbYHwJU
	PeZH06cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyTSB-00000003ZdV-0Tlm;
	Fri, 06 Mar 2026 11:34:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyTS9-00000003Zd8-36YA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 11:34:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F2ADD497;
	Fri,  6 Mar 2026 03:34:37 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 173053F836;
	Fri,  6 Mar 2026 03:34:40 -0800 (PST)
Date: Fri, 6 Mar 2026 11:34:37 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH v2 14/35] KVM: arm64: Handle aborts from protected VMs
Message-ID: <aaq7zdxyyphiXhRG@raptor>
References: <20260119124629.2563-1-will@kernel.org>
 <20260119124629.2563-15-will@kernel.org>
 <aY2tX6V0pCqwGth5@raptor>
 <aag8edDkKgfTr_hD@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aag8edDkKgfTr_hD@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_033445_867905_041AF681 
X-CRM114-Status: GOOD (  46.74  )
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

Hi Will,

On Wed, Mar 04, 2026 at 02:06:49PM +0000, Will Deacon wrote:
> On Thu, Feb 12, 2026 at 10:37:19AM +0000, Alexandru Elisei wrote:
> > On Mon, Jan 19, 2026 at 12:46:07PM +0000, Will Deacon wrote:
> > > Introduce a new abort handler for resolving stage-2 page faults from
> > > protected VMs by pinning and donating anonymous memory. This is
> > > considerably simpler than the infamous user_mem_abort() as we only have
> > > to deal with translation faults at the pte level.
> > > 
> > > Signed-off-by: Will Deacon <will@kernel.org>
> > > ---
> > >  arch/arm64/kvm/mmu.c | 89 ++++++++++++++++++++++++++++++++++++++++----
> > >  1 file changed, 81 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > > index a23a4b7f108c..b21a5bf3d104 100644
> > > --- a/arch/arm64/kvm/mmu.c
> > > +++ b/arch/arm64/kvm/mmu.c
> > > @@ -1641,6 +1641,74 @@ static int gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> > >  	return ret != -EAGAIN ? ret : 0;
> > >  }
> > >  
> > > +static int pkvm_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> > > +		struct kvm_memory_slot *memslot, unsigned long hva)
> > > +{
> > > +	unsigned int flags = FOLL_HWPOISON | FOLL_LONGTERM | FOLL_WRITE;
> > > +	struct kvm_pgtable *pgt = vcpu->arch.hw_mmu->pgt;
> > > +	struct mm_struct *mm = current->mm;
> > > +	struct kvm *kvm = vcpu->kvm;
> > > +	void *hyp_memcache;
> > > +	struct page *page;
> > > +	int ret;
> > > +
> > > +	ret = prepare_mmu_memcache(vcpu, true, &hyp_memcache);
> > > +	if (ret)
> > > +		return -ENOMEM;
> > > +
> > > +	ret = account_locked_vm(mm, 1, true);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	mmap_read_lock(mm);
> > > +	ret = pin_user_pages(hva, 1, flags, &page);
> > > +	mmap_read_unlock(mm);
> > 
> > If the page is part of a large folio, the entire folio gets pinned here, not
> > just the page returned by pin_user_pages(). Do you reckon that should be
> > considered when calling account_locked_vm()?
> 
> I don't _think_ so.
> 
> Since we only ask for a single page when we call pin_user_pages(), the
> folio refcount will be adjusted by 1, even for large folios. Trying to

The large folios, **_pincount** is adjusted by 1 with FOLL_LONGTERM. For
non-large folio, the refcount is increased by GUP_PIN_COUNTING_BIAS == 1024
(try_grab_folio() is where the magic happens).

> adjust the accounting based on whether the pinned page forms part of a
> large folio feels error-prone, not least because the migration triggered
> by the longterm pin could actually end up splitting the folio but also

Hmm.. as far as I can tell pin_user_pages() uses MIGRATE_SYNC to migrate folios
not suitable for longterm pinning, and after migration has completed it attemps
to pin the userspace address again.

Also, split_folio() and friends cannot split folio_maybe_dma_pinned_folio(),
according to the comments for the various functions.

> because we'd have to avoid double accounting on subsequent faults to the
> same folio. It also feels fragile if the mm code is able to split
> partially pinned folios in future (like it appears to be able to for
> partially mapped folios).

I'm not sure why mm would want to split a folio_maybe_dma_pinned_folio(). But
I'm far from being a mm expert, so I do understand why relying on this might
feel fragile.

> 
> > > +	if (ret == -EHWPOISON) {
> > > +		kvm_send_hwpoison_signal(hva, PAGE_SHIFT);
> > > +		ret = 0;
> > > +		goto dec_account;
> > > +	} else if (ret != 1) {
> > > +		ret = -EFAULT;
> > > +		goto dec_account;
> > > +	} else if (!folio_test_swapbacked(page_folio(page))) {
> > > +		/*
> > > +		 * We really can't deal with page-cache pages returned by GUP
> > > +		 * because (a) we may trigger writeback of a page for which we
> > > +		 * no longer have access and (b) page_mkclean() won't find the
> > > +		 * stage-2 mapping in the rmap so we can get out-of-whack with
> > > +		 * the filesystem when marking the page dirty during unpinning
> > > +		 * (see cc5095747edf ("ext4: don't BUG if someone dirty pages
> > > +		 * without asking ext4 first")).
> > 
> > I've been trying to wrap my head around this. Would you mind providing a few
> > more hints about what the issue is? I'm sure the approach is correct, it's
> > likely just me not being familiar with the code.
> 
> The fundamental problem is that unmapping page-cache pages from the host
> stage-2 can confuse filesystems who don't know that either the page is
> now inaccessible (and so may attempt to access it) or that the page can
> be accessed concurrently by the guest without updating the page state.
> 
> To fix those issues, we would need to support MMU notifiers for protected
> memory but that would allow the host to mess with the guest stage-2
> page-table, which breaks the security model that we're trying to uphold.

Aha, got it, thanks for the explanation!

Alex

> 
> > > @@ -2190,15 +2258,20 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
> > >  		goto out_unlock;
> > >  	}
> > >  
> > > -	VM_WARN_ON_ONCE(kvm_vcpu_trap_is_permission_fault(vcpu) &&
> > > -			!write_fault && !kvm_vcpu_trap_is_exec_fault(vcpu));
> > > +	if (kvm_vm_is_protected(vcpu->kvm)) {
> > > +		ret = pkvm_mem_abort(vcpu, fault_ipa, memslot, hva);
> > 
> > I guess the reason this comes after handling an access fault is because you want
> > the WARN_ON() to trigger in pkvm_pgtable_stage2_mkyoung().
> 
> Right, we should only ever see translation faults for protected guests
> and that's all that pkvm_mem_abort() is prepared to handle, so we call
> it last.
> 
> Will

