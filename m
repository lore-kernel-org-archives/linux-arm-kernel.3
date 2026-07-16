Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A211C44511
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 16:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ln+zwa1+MaOwv3nXSuWvxjJBrdvM0Hk3iOScwUU3ZG8=; b=XEVheZJHSA5aNqETeMdbfO69jS
	/W1OEhq25PzkhR95EWsQ1jkJ4s2p4q2cZajbDbjbhx4l1ycguB/GPYjKgloNt2guTG7Y0/MhYX6YW
	8a0RDD28gA6OkOO5DtcY6UwSe3xJzqvLhDCdYtzJ1iXqLRLe9rnshB/tGPc7H2Uf+sgog5oaOtKcl
	mo2F3gjDJaGetbcWPmNs359RRxK8yJmn5feanjmXd2H0aMG+7JRfzaRyAPBy2U0AV2qRM35XGJAQz
	llxfrU7o00cVXOUyZLLGiJdaR+xRJdM9jnakSRC4rOKeaa7rHkQoUkmryUpdcwTtLtZb55yXrGVBs
	zdUBh+IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkOjs-000000007L0-0cWE;
	Thu, 16 Jul 2026 16:15:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkOjo-000000007JU-2tdW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 16:15:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C471C2F;
	Thu, 16 Jul 2026 09:14:55 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB4FA3F7B4;
	Thu, 16 Jul 2026 09:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784218500; bh=zQ7EW/DiYP7ct8mHMC81LF+qTsnzd6OWO+eVwdHzyOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vj3wK4wkYP+VHIMDqaQwR53oqkvcVu/gwVCkzmT0Jayp5iJGZcwxGnEUJuCeYt7xt
	 Ur+BsX+mAvEN5kY4Vw9NGmFXzZPXZeByGayKHAKOSBlBZYTeHAD59k960pHsdC0ixw
	 5joMwiEHE5jASc7wY48EALmiNo3H2nI1VumiBYFk=
Date: Thu, 16 Jul 2026 17:14:46 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Oliver Upton <oupton@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>, Fuad Tabba <tabba@google.com>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Itaru Kitayama <itaru.kitayama@fujitsu.com>, Sebastian Ene <sebastianene@google.com>
Subject: Re: [PATCH v4 2/6] KVM: arm64: nv: Avoid full shadow s2 unmap
Message-ID: <upkq27f2mo3fy27ubkxxgfwkgn2oamnbxom2o6gce5ocfyauo5@6tfu3ppaw7o6>
References: <20260714115926.2044757-1-weilin.chang@arm.com>
 <20260714115926.2044757-3-weilin.chang@arm.com>
 <aliCuX3ZIvxWlFE-@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aliCuX3ZIvxWlFE-@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_091504_903760_67A934FF 
X-CRM114-Status: GOOD (  38.95  )
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

On Thu, Jul 16, 2026 at 12:05:29AM -0700, Oliver Upton wrote:
> Hey,
> 
> On Tue, Jul 14, 2026 at 12:59:21PM +0100, Wei-Lin Chang wrote:
> > +static bool valid_entry(unsigned long entry)
> > +{
> > +	WARN_ON(entry & VALID_ENTRY && entry & UNKNOWN_IPA);
> > +	return entry & VALID_ENTRY;
> > +}
> > +
> > +static bool unknown_ipa_entry(unsigned long entry)
> > +{
> > +	WARN_ON(entry & VALID_ENTRY && entry & UNKNOWN_IPA);
> > +	return entry & UNKNOWN_IPA;
> > +}
> 
> These should be WARN_ON_ONCE(), but I find the condition you're
> asserting to be a bit confusing. An aliased reverse map entry is still a
> valid entry, would you not set the valid bit?

Sorry, VALID_ENTRY might not be the best name for this flag. I used it
to mean entries in the maple tree, that are not UNKNOWN_IPA, meaning the
canonical IPA <-> nested IPA relation is one-to-one.

So by definition UNKNOWN_IPA and "VALID_ENTRY" should not be set at the
same time. Unfortunately they can't be a single flag, as the stored
address can be 0, this can make the whole value 0 when being stored if
the single flag is also 0, effectively not doing the store.

Maybe it's better with just "KNOWN_IPA"?

> 
> > +void kvm_record_nested_revmap(gpa_t canonical_ipa, struct kvm_s2_mmu *mmu,
> > +			      gpa_t nested_ipa, size_t map_size)
> > +{
> > +	struct maple_tree *revmap_mt = &mmu->nested_revmap_mt;
> > +	gpa_t canonical_ipa_end;
> > +	u64 entry, new_entry = 0;
> > +
> > +	lockdep_assert_held_read(&kvm_s2_mmu_to_kvm(mmu)->mmu_lock);
> > +
> > +	if (mmu->nested_revmap_broken)
> > +		return;
> > +
> > +	if (WARN_ON(!IS_ALIGNED(canonical_ipa, map_size)))
> > +		canonical_ipa = ALIGN_DOWN(canonical_ipa, map_size);
> > +
> > +	canonical_ipa_end = canonical_ipa + map_size - 1;
> > +	MA_STATE(mas_rmap, revmap_mt, canonical_ipa, canonical_ipa_end);
> > +
> > +	mtree_lock(revmap_mt);
> > +	entry = xa_to_value(mas_find(&mas_rmap, canonical_ipa_end));
> > +
> > +	if (entry) {
> > +		/* parallel faults can be adding the same mapping */
> > +		if (valid_entry(entry) &&
> > +		    mas_rmap.index == canonical_ipa &&
> > +		    mas_rmap.last == canonical_ipa_end &&
> > +		    nested_ipa == (entry & ADDR_MASK))
> > +			goto unlock;
> > +		/*
> > +		 * Create a "UNKNOWN_IPA" range that spans all the overlapping
> > +		 * ranges and store it.
> > +		 */
> > +		while (entry && mas_rmap.index <= canonical_ipa_end) {
> > +			canonical_ipa = min(mas_rmap.index, canonical_ipa);
> > +			canonical_ipa_end = max(mas_rmap.last, canonical_ipa_end);
> > +			entry = xa_to_value(mas_find(&mas_rmap, canonical_ipa_end));
> > +		}
> > +		new_entry |= UNKNOWN_IPA;
> > +	} else {
> > +		new_entry |= nested_ipa;
> > +		new_entry |= VALID_ENTRY;
> > +	}
> > +
> > +	mas_set_range(&mas_rmap, canonical_ipa, canonical_ipa_end);
> > +	if (mas_store_gfp(&mas_rmap, xa_mk_value(new_entry),
> > +			  GFP_NOWAIT | __GFP_ACCOUNT))
> 
> The general pattern for handling this situation would be to preallocate
> nodes prior to acquiring the lock. If we can preallocate then we can
> just outright refuse to create a shadow stage-2 mapping if the update to
> the reverse map fails.

Preallocation was thought about, but it was found to be impractical in
this case [*], mainly because we must hold the lock in order to know
what range to store.

However, we can make this function return an error when storing to the
maple tree fails, and just not do the shadow mapping. This ties the
wellness of the maple tree to guest progress. For repeated failure I
think of these possibilities:

 - The maple tree code is somehow broken that stores never succeed.
 - We have so little available memory that maple tree stores don't
   succeed.

These cause the guest fault repeatedly, but do we still care about the
guest when these happen? Probably not for the OOM case, and it solves
itself when the kernel gets back memory. For the first case I'm not so
sure, and I might have missed some other important possibilities.

[*]: https://lore.kernel.org/kvmarm/867bq72n7l.wl-maz@kernel.org/

> 
> > +		mmu->nested_revmap_broken = true;
> > +unlock:
> > +	mtree_unlock(revmap_mt);
> > +}
> > +
> >  void kvm_init_nested_s2_mmu(struct kvm_s2_mmu *mmu)
> >  {
> >  	/* CnP being set denotes an invalid entry */
> >  	mmu->tlb_vttbr = VTTBR_CNP_BIT;
> >  	mmu->nested_stage2_enabled = false;
> >  	atomic_set(&mmu->refcnt, 0);
> > +	mt_init(&mmu->nested_revmap_mt);
> > +	mmu->nested_revmap_broken = false;
> >  }
> >  
> >  void kvm_vcpu_load_hw_mmu(struct kvm_vcpu *vcpu)
> > @@ -1225,6 +1305,89 @@ void kvm_nested_s2_wp(struct kvm *kvm)
> >  	kvm_invalidate_vncr_ipa(kvm, 0, BIT(kvm->arch.mmu.pgt->ia_bits));
> >  }
> >  
> > +static void reset_revmap_and_unmap(struct kvm_s2_mmu *mmu, bool may_block)
> > +{
> > +	mtree_destroy(&mmu->nested_revmap_mt);
> > +	mmu->nested_revmap_broken = false;
> > +	kvm_stage2_unmap_range(mmu, 0, kvm_phys_size(mmu), may_block);
> > +}
> > +
> > +static void unmap_mmu_cipa_range(struct kvm_s2_mmu *mmu, gpa_t canonical_ipa,
> > +				  size_t unmap_size, bool may_block)
> > +{
> > +	struct maple_tree *revmap_mt = &mmu->nested_revmap_mt;
> > +	gpa_t canonical_ipa_end = canonical_ipa + unmap_size - 1;
> > +	size_t entry_size;
> > +	gpa_t next_addr;
> > +	u64 entry;
> > +	MA_STATE(mas_rmap, revmap_mt, canonical_ipa, canonical_ipa_end);
> > +
> > +	lockdep_assert_held_write(&kvm_s2_mmu_to_kvm(mmu)->mmu_lock);
> > +
> > +	if (mmu->nested_revmap_broken) {
> > +		reset_revmap_and_unmap(mmu, may_block);
> > +		return;
> > +	}
> > +
> > +	if (!mmu->nested_stage2_enabled) {
> > +		kvm_stage2_unmap_range(mmu, canonical_ipa, unmap_size, may_block);
> > +		return;
> > +	}
> > +
> > +	mtree_lock(revmap_mt);
> > +	entry = xa_to_value(mas_find(&mas_rmap, canonical_ipa_end));
> > +
> > +	while (entry && mas_rmap.index <= canonical_ipa_end) {
> > +		entry_size = mas_rmap.last - mas_rmap.index + 1;
> > +		next_addr = mas_rmap.index + entry_size;
> > +		/*
> > +		 * Give up and invalidate this s2 mmu if the unmap range
> > +		 * touches any UNKNOWN_IPA range.
> > +		 */
> > +		if (unknown_ipa_entry(entry)) {
> > +			mtree_unlock(revmap_mt);
> > +			reset_revmap_and_unmap(mmu, may_block);
> > +			return;
> > +		}
> > +
> > +		/*
> > +		 * Ignore result, it is okay if a reverse mapping erase
> > +		 * fails.
> > +		 */
> > +		mas_store_gfp(&mas_rmap, NULL, GFP_NOWAIT | __GFP_ACCOUNT);
> 
> I wonder if we can handle this a bit more gracefully.
> 
> Ideally we'd be able to place a search mark on the entry flagging it as
> stale which could be used to avoid attempting to overinvalidate the
> shadow stage-2.
> 
> Interestingly enough, Liam recently gave the suggestion [*] of storing
> XA_ZERO_ENTRY for a similar use case where erasure happens in an atomic
> context. We should be able to do the exact same thing here and push the
> cleanup to the next insertion.

I see. Not saying I have a better idea, but this is relying on the fact
that replacing an existing range with another value does not require
memory allocation. I would say this is an obvious assumption and I don't
see it becoming false in the future, but still it's an implementation
detail and relying on it as a user feels strange...

What do you think?

Thanks,
Wei-Lin Chang

> 
> [*] https://lore.kernel.org/all/iv7sxqezzz42xieytbf3lskutricz7ltkr3wii3w4jbnbzto7f@2tz5hwa43l37/
> 
> Thanks,
> Oliver

