Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F30C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 15:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jfq663FOi5VReF455I+cgLjdnh8pMmbvEI+PrxOvHAY=; b=eSGbnhJptCYeGNzKcn8kJ6u+Lc
	TJIyFFHswgkA7kJGrD2IhuOXwI6J871PQ2MUqp83gg1Rbv2LX439ZtJL1na45U37Kfb5/3A9heK1E
	UDSsjRt7BRmq6T4yonYcMsYUOiJ9Ba+RDjpJIxdmKJSCtfUTFkvCrIAPh3vIyBzgXAWqSToSUFxGh
	5nCHNJmxu2fUN7TmlltcIMGAz/+2kxbHPnm4LJXDEEcdnUY9ZSovg3XDgM0Ei4ZrNtbjeFuPYs9wP
	g0azCrFMQVC3XrxfliqNkP4LSfNilhlDk2RfkdQTzVh/hCqYKkx0vZjmvVI3tVUctNN/csSqAB6db
	hvTlaXyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIZL-00000009n2O-0ner;
	Mon, 13 Jul 2026 15:27:43 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIZE-00000009n0Q-0B0c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 15:27:42 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-47122683cf3so1798431f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 08:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783956454; x=1784561254; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jfq663FOi5VReF455I+cgLjdnh8pMmbvEI+PrxOvHAY=;
        b=OOWtMbqJ/vUwJiKnAbpi57UtuCGDelPOPyFMiwydYrRmvQiLRUgMPZHv9z0NoMQHYC
         g3PT0klm1PXEV4TIymGnp/CymS9yNl9jsiQIaoGvS+HyWCozPWanihP7UN9vSopBMxCX
         gBu/PSUOnQMIwvxYY18kvyvyRISJbVjSWXgqapzawUnHyInl0e2jJ+ee2H8VbupsOBgT
         6qOHAutEHyboPB3vUTrJv3kGXoFUsP8LiWp9libcjRhZxGfp1wdnXStc0bWNm+m+Lr6g
         TUYHxRZXtpyXGSYtVuZl+LhjuXQqfpAeNkViPeUExI9sk4HFLOY0Yr/LgvnmdD7xDzqf
         3HeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783956454; x=1784561254;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jfq663FOi5VReF455I+cgLjdnh8pMmbvEI+PrxOvHAY=;
        b=sUu6usOmluWztwapmY5p50Oqtg9SX0Zv+NsHvuo7hyIeF1bLvU9vJx3Z3iq+B0X7ir
         uNpMJ1d3/MeOmbPt7EY6BwJeGIwY/aTWBvkOnRHm+TU9z853hZYJZfa6FkSVUIvewnxC
         5qUvbunDZn8jMPX4x9zKrxQBHnFoTC4QJNeN/O4dqf1/NkDhpB27IoaJoMtzixAVN4jX
         nNnGwNyry/LzmAk/GLwxQwp5Zu5idHHK/X6F0xbiIPvfj78KCozIJavUGQC3ILuLacrx
         bz+nT4yVzLhdLuddhrW7xnc8dnKGbr7jjJtjhPsIACnT102Nz5DaqotRsbrYnKo4RBc2
         H3rg==
X-Gm-Message-State: AOJu0YyDu4Cv3MCQxVaTfGyAr4CORxa/USvWO0iBm9AU9nMoB3H3+bGV
	dKM+DSqmjG3dUYKMSgS0Hod/+39s2iSnlyY2VcY4zof0DFRDD7OCH9XKly7YelXAOQ==
X-Gm-Gg: AfdE7clQI0GjLooh1mGtaM5FC+5Fb7uhXpVC1uCU7gS84Ux828OdZFMG4ZDNr0I4HVs
	xh8VRN3H5i4INUYzdXcq/4u+nX/PQ/3YgoMNItXa6otcXvo7LbnHSl8QMb11RKOKellbtECm1rX
	uyuMTo/SruUrAXbAA1r7MPb4cNWhkKx80OSzn7SAbJ1+l6bOYBojbheiajnCG5WnuAVBbGkleK8
	UI/uybzMbkprn38bOoDb5h69/vlUShwQfUdWvFWZcWGy8EvIG2Eqik3OShRuQmDLxq10/C88Sas
	DNwpSW5cddl7Gn7skX3LKUBlJ5waTFkFob4g/9hgTLoIQmVNYa80fxef1TgPji63BFilCRLMDe4
	/+82LDaVuZl0Y9CSKaiW+JUa9eVF4UhYyyVfJhKk7PY81A8J0S6SKzWmVai+dYio0JLwk3/w3rX
	WmjEvwapPS0Btu0+7fRrO5W/G65yMUGp93EDnkEYKYk+4eXjOSUow=
X-Received: by 2002:a7b:cd93:0:b0:494:596e:e8c4 with SMTP id 5b1f17b1804b1-494596ee8d1mr16030915e9.17.1783956453604;
        Mon, 13 Jul 2026 08:27:33 -0700 (PDT)
Received: from google.com (137.69.77.34.bc.googleusercontent.com. [34.77.69.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c9cc3sm57292f8f.35.2026.07.13.08.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 08:27:28 -0700 (PDT)
Date: Mon, 13 Jul 2026 16:27:16 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	jgg@ziepe.ca, mark.rutland@arm.com, qperret@google.com,
	tabba@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 08/25] KVM: arm64: iommu: Shadow host stage-2 page
 table
Message-ID: <alUD1IiSgNkhzFGR@google.com>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-9-smostafa@google.com>
 <alTnAy7jvjUamwUA@google.com>
 <alTvf7iiOWn4PKE8@google.com>
 <alUA7zsJO1FGnss-@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alUA7zsJO1FGnss-@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_082736_146817_C9BD5F0E 
X-CRM114-Status: GOOD (  57.94  )
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

On Mon, Jul 13, 2026 at 04:14:55PM +0100, Vincent Donnefort wrote:
> On Mon, Jul 13, 2026 at 02:00:31PM +0000, Mostafa Saleh wrote:
> > On Mon, Jul 13, 2026 at 02:24:19PM +0100, Vincent Donnefort wrote:
> > > On Fri, May 01, 2026 at 11:19:10AM +0000, Mostafa Saleh wrote:
> > > > Create a page-table for the IOMMU that shadows the host CPU stage-2
> > > > to establish DMA isolation.
> > > > 
> > > > An initial snapshot is created after the driver init, then
> > > > on every permission change a callback would be called for
> > > > the IOMMU driver to update the page table.
> > > > 
> > 
> > [...]
> > 
> > > > +	 */
> > > > +	if (pte && !kvm_pte_valid(pte))
> > > > +		return 0;
> > > > +
> > > > +	if (kvm_pte_valid(pte)) {
> > > > +		prot = pkvm_to_iommu_prot(kvm_pgtable_stage2_pte_prot(pte));
> > > > +		/* If the range is mapped in a single PTE, it must be the same type.*/
> > > > +		if (!addr_is_memory(start))
> > > > +			prot |= IOMMU_MMIO;
> > > > +
> > > > +		return kvm_iommu_ops->host_stage2_idmap(start, end, prot);
> > > 
> > > Do we really need to do that when is_memory()? 
> > > 
> > > fix_host_ownership_walker() by calling host_stage2_idmap_locked() and
> > > host_stage2_set_owner_locked() should already handle the memory region. That
> > > would also get rid of kvm_idmap_initialized.
> > > 
> > > So this one here could only take care of the MMIO?
> > > 
> > > Overall we would have a common point of synchro which is
> > > fix_host_ownership_walker() after which the host ownership is ready for both
> > > CPU stage-2 and the IOMMU?
> > > 
> > 
> > I am not sure I understand, this is another empty page table, so we
> > have to walk all of the host CPU stage-2 page table to shadow it in the
> > IOMMU. if you are refering to the case where it handle zero ptes for
> > memory, I can drop that but it will not change much in this logic.
> 
> In fixup_host_ownership() we already walk the hyp pgtable to know what needs to be
> map/unmapped from the host stage-2. Can't we rely on that for the IOMMU
> page-table as well?
> 
> As of, fix_host_ownership() could handle the host stage-2 __and__ the iommu? 

What I have in mind is the completely untested snippet:

index 75b00c323310..64cd175ad6c0 100644
--- a/arch/arm64/kvm/hyp/nvhe/setup.c
+++ b/arch/arm64/kvm/hyp/nvhe/setup.c
@@ -226,10 +226,11 @@ static int fix_host_ownership_walker(const struct kvm_pgtable_visit_ctx *ctx,
        case PKVM_PAGE_SHARED_OWNED:
                set_hyp_state(page, PKVM_PAGE_SHARED_OWNED);
                set_host_state(page, PKVM_PAGE_SHARED_BORROWED);
+               kvm_iommu_host_stage2_idmap(phys, PAGE_SIZE, IOMMU_READ | IOMMU_WRITE);
                break;
        case PKVM_PAGE_SHARED_BORROWED:
                set_hyp_state(page, PKVM_PAGE_SHARED_BORROWED);
-               set_host_state(page, PKVM_PAGE_SHARED_OWNED);
+               kvm_iommu_host_stage2_idmap(phys, PAGE_SIZE, IOMMU_READ | IOMMU_WRITE);
                break;
        default:
                return -EINVAL;
@@ -258,15 +259,20 @@ static int fix_host_ownership(void)
                .cb     = fix_host_ownership_walker,
                .flags  = KVM_PGTABLE_WALK_LEAF,
        };
+       u64 mmio = 0;
        int i, ret;

        for (i = 0; i < hyp_memblock_nr; i++) {
                struct memblock_region *reg = &hyp_memory[i];
                u64 start = (u64)hyp_phys_to_virt(reg->base);

+               kvm_iommu_host_stage2_idmap(mmio, start, IOMMU_READ | IOMMU_WRITE | IOMMU_MMIO);
+
                ret = kvm_pgtable_walk(&pkvm_pgtable, start, reg->size, &walker);
                if (ret)
                        return ret;
+
+               mmio = start + reg->size;
        }

I believe this does the same as kvm_iommu_snapshot_host_stage2(). WDYS?

> 
> > 
> > > > +	}
> > > > +
> > > > +	/* In case of invalid PTE, we need to figure out which part of it is MMIO */
> > 
> > [...]
> > 
> > > >  #include <nvhe/mm.h>
> > > > @@ -481,6 +482,14 @@ static int check_range_allowed_memory(u64 start, u64 end)
> > > >  	return 0;
> > > >  }
> > > >  
> > > > +u64 find_mem_range_from(u64 start, bool *is_memory)
> > > > +{
> > > > +	struct kvm_mem_range r;
> > > > +
> > > > +	*is_memory = !!find_mem_range(start, &r);
> > > > +	return r.end;
> > > > +}
> > > > +
> > > >  static bool range_is_memory(u64 start, u64 end)
> > > >  {
> > > >  	struct kvm_mem_range r;
> > > > @@ -577,8 +586,34 @@ int host_stage2_idmap_locked(phys_addr_t addr, u64 size,
> > > >  
> > > >  static void __host_update_page_state(phys_addr_t addr, u64 size, enum pkvm_page_state state)
> > > 
> > > I would really split this. I know that this is convinient, but as the function
> > > says, it only update the page state so it shouldn't hide an update to the IOMMU.
> > 
> > I mention a couple of alternatives in the commit message, I tried to
> > implement it differently which was harder to reason about as the calls
> > was scattered everywhere and any small refactor will possibly break it.
> > 
> > Did you have a split in my mind? I open to rework it.
> 
> Yes, I meant the option #2.
> 
> > 
> > > 
> > > Beside, we have examples already in Android where we want to update the
> > > page-state but not the IOMMU, so it doesn't feel future-proof...
> > > 
> > > >  {
> > > > +	enum pkvm_page_state old = get_host_state(hyp_phys_to_page(addr));
> > > > +	enum kvm_pgtable_prot prot = 0;
> > > > +
> > > >  	for_each_hyp_page(page, addr, size)
> > > >  		set_host_state(page, state);
> > > > +
> > > > +	/*
> > > > +	 * Any transition to PKVM_NOPAGE, unmaps the page from the host
> > > > +	 * Any transition to PKVM_PAGE_SHARED_BORROWED, maps the page in the host
> > > > +	 * Any transition to PKVM_PAGE_SHARED_OWNED is ignored as page is already mapped.
> > > > +	 * Transitions to PKVM_PAGE_OWNED from anything but PKVM_NOPAGE are ignored.
> > > > +	 * Transitions to PKVM_PAGE_OWNED from PKVM_NOPAGE will map the page.
> > > > +	 */
> > > > +	if ((state == PKVM_PAGE_SHARED_OWNED) ||
> > > > +		((state == PKVM_PAGE_OWNED) && (old != PKVM_NOPAGE)))
> > > > +		return;
> > > > +
> > > > +	if ((state == PKVM_PAGE_SHARED_BORROWED) ||
> > > > +		(state == PKVM_PAGE_OWNED))
> > > > +		prot = PKVM_HOST_MEM_PROT;
> > > 
> > > ... and that would avoid that sort of things here. The caller decides if the IOMMU
> > > is updated or not.
> > 
> > Typically, the IOMMU is updated if the CPU is.
> > 
> > > 
> > > And as the patch says, we "shadow" the host stage2. So probably modifying
> > > host_stage2_idmap and host_stage2_set_owner_metdata() sounds really a better
> > > approach.
> > 
> > Initially, before the pKVM merge upstream I was doing something similar
> > as that only required one hook [1]. However, after rebasing I found that
> > would be too complicated and I have to add many more (as mentioned in
> > the commit message). But I can re-visit this approach in v7.
> 
> What bit would be more complicated? As you've wrote in the commit message, in
> option#2 you only need two calls really:
> 
>   * host_stage2_set_owner_locked()
>   * host_stage2_set_owner_metadata_locked().
> 
> This fits better the narative for the "shadow" page-table: when we map the host
> stage-2, we map the iommu and when we unmap the host stage-2, we unmap the
> iommu.
> 
> > 
> > [1] https://lore.kernel.org/all/20250819215156.2494305-11-smostafa@google.com/
> > 
> > Thanks,
> > Mostafa
> > 

