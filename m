Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CBFC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 07:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YopDoBUX3VUuGxZ98wWXcclxYcbXiMdcqqK+dQPjMV0=; b=M67DsAqJ8L6KcgTIKsgdHvgbAO
	tFdtEL983SoNXiIqDHo1f3j5uUHTk9kYzJvshI6wpePtdoq2KvZUHwDwrdG4BI4dgWTISYhLZntYV
	UQu9hb4mw8gRVIVTCzZBH4EFlWzSZaXYwh6PrnkPYV05/NqVtFIbZxP7dIbAvXJlbR0lBdUFD07e5
	rz9Q6KL/40KRmnFY3Fe6faeNIKLQcDk7H+Xhw6qsyymgCvnHSc6puPVk68mp0wtmT0ecWOGkKS2WK
	Kx5TzJuB1hjzAy0oTzLsl2aWyKrZ8x41pY0zE8jomiS1vb9KmMa9WXAeLQjaQF0hj4RPz0b2RA1nE
	ntjL5uew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkGA1-0000000GcAW-25oj;
	Thu, 16 Jul 2026 07:05:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkG9z-0000000GcAO-3t6R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 07:05:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B213410C6;
	Thu, 16 Jul 2026 07:05:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23AC21F000E9;
	Thu, 16 Jul 2026 07:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784185531;
	bh=YopDoBUX3VUuGxZ98wWXcclxYcbXiMdcqqK+dQPjMV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PSjg/wj8XxdKXdQE3lrWqGi6vaA347qT/KZX2t3fM6cUrLFi8YTAij6RJ+XRsEUrl
	 32WckwFWrDHhE9FALOpwwtJUk+GeqryMmfYEEoVhi9NyNwB3k1PX8vmyYTJwRiNU9z
	 1Uo5XR+vmgwHkJnl95XrN1XdUalNVmEDhm/CR05hsJ/vchr53rIpFsWbG2lzVO3/L2
	 FHbYhufVVPDIqPaZysIhWPW2fOfIuLIjTafjQyWzSBKtfQ80iYb6UoA4MazUyb05LT
	 kbHRs7i9jamucUEZBbpNgMKirqOHqHxVyYZnOhN1XQqC+vAuiVGIjsmbNMpzMguY/3
	 KCh9sAVnCgfWA==
Date: Thu, 16 Jul 2026 00:05:29 -0700
From: Oliver Upton <oupton@kernel.org>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
	Fuad Tabba <tabba@google.com>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Itaru Kitayama <itaru.kitayama@fujitsu.com>,
	Sebastian Ene <sebastianene@google.com>
Subject: Re: [PATCH v4 2/6] KVM: arm64: nv: Avoid full shadow s2 unmap
Message-ID: <aliCuX3ZIvxWlFE-@kernel.org>
References: <20260714115926.2044757-1-weilin.chang@arm.com>
 <20260714115926.2044757-3-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714115926.2044757-3-weilin.chang@arm.com>
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

Hey,

On Tue, Jul 14, 2026 at 12:59:21PM +0100, Wei-Lin Chang wrote:
> +static bool valid_entry(unsigned long entry)
> +{
> +	WARN_ON(entry & VALID_ENTRY && entry & UNKNOWN_IPA);
> +	return entry & VALID_ENTRY;
> +}
> +
> +static bool unknown_ipa_entry(unsigned long entry)
> +{
> +	WARN_ON(entry & VALID_ENTRY && entry & UNKNOWN_IPA);
> +	return entry & UNKNOWN_IPA;
> +}

These should be WARN_ON_ONCE(), but I find the condition you're
asserting to be a bit confusing. An aliased reverse map entry is still a
valid entry, would you not set the valid bit?

> +void kvm_record_nested_revmap(gpa_t canonical_ipa, struct kvm_s2_mmu *mmu,
> +			      gpa_t nested_ipa, size_t map_size)
> +{
> +	struct maple_tree *revmap_mt = &mmu->nested_revmap_mt;
> +	gpa_t canonical_ipa_end;
> +	u64 entry, new_entry = 0;
> +
> +	lockdep_assert_held_read(&kvm_s2_mmu_to_kvm(mmu)->mmu_lock);
> +
> +	if (mmu->nested_revmap_broken)
> +		return;
> +
> +	if (WARN_ON(!IS_ALIGNED(canonical_ipa, map_size)))
> +		canonical_ipa = ALIGN_DOWN(canonical_ipa, map_size);
> +
> +	canonical_ipa_end = canonical_ipa + map_size - 1;
> +	MA_STATE(mas_rmap, revmap_mt, canonical_ipa, canonical_ipa_end);
> +
> +	mtree_lock(revmap_mt);
> +	entry = xa_to_value(mas_find(&mas_rmap, canonical_ipa_end));
> +
> +	if (entry) {
> +		/* parallel faults can be adding the same mapping */
> +		if (valid_entry(entry) &&
> +		    mas_rmap.index == canonical_ipa &&
> +		    mas_rmap.last == canonical_ipa_end &&
> +		    nested_ipa == (entry & ADDR_MASK))
> +			goto unlock;
> +		/*
> +		 * Create a "UNKNOWN_IPA" range that spans all the overlapping
> +		 * ranges and store it.
> +		 */
> +		while (entry && mas_rmap.index <= canonical_ipa_end) {
> +			canonical_ipa = min(mas_rmap.index, canonical_ipa);
> +			canonical_ipa_end = max(mas_rmap.last, canonical_ipa_end);
> +			entry = xa_to_value(mas_find(&mas_rmap, canonical_ipa_end));
> +		}
> +		new_entry |= UNKNOWN_IPA;
> +	} else {
> +		new_entry |= nested_ipa;
> +		new_entry |= VALID_ENTRY;
> +	}
> +
> +	mas_set_range(&mas_rmap, canonical_ipa, canonical_ipa_end);
> +	if (mas_store_gfp(&mas_rmap, xa_mk_value(new_entry),
> +			  GFP_NOWAIT | __GFP_ACCOUNT))

The general pattern for handling this situation would be to preallocate
nodes prior to acquiring the lock. If we can preallocate then we can
just outright refuse to create a shadow stage-2 mapping if the update to
the reverse map fails.

> +		mmu->nested_revmap_broken = true;
> +unlock:
> +	mtree_unlock(revmap_mt);
> +}
> +
>  void kvm_init_nested_s2_mmu(struct kvm_s2_mmu *mmu)
>  {
>  	/* CnP being set denotes an invalid entry */
>  	mmu->tlb_vttbr = VTTBR_CNP_BIT;
>  	mmu->nested_stage2_enabled = false;
>  	atomic_set(&mmu->refcnt, 0);
> +	mt_init(&mmu->nested_revmap_mt);
> +	mmu->nested_revmap_broken = false;
>  }
>  
>  void kvm_vcpu_load_hw_mmu(struct kvm_vcpu *vcpu)
> @@ -1225,6 +1305,89 @@ void kvm_nested_s2_wp(struct kvm *kvm)
>  	kvm_invalidate_vncr_ipa(kvm, 0, BIT(kvm->arch.mmu.pgt->ia_bits));
>  }
>  
> +static void reset_revmap_and_unmap(struct kvm_s2_mmu *mmu, bool may_block)
> +{
> +	mtree_destroy(&mmu->nested_revmap_mt);
> +	mmu->nested_revmap_broken = false;
> +	kvm_stage2_unmap_range(mmu, 0, kvm_phys_size(mmu), may_block);
> +}
> +
> +static void unmap_mmu_cipa_range(struct kvm_s2_mmu *mmu, gpa_t canonical_ipa,
> +				  size_t unmap_size, bool may_block)
> +{
> +	struct maple_tree *revmap_mt = &mmu->nested_revmap_mt;
> +	gpa_t canonical_ipa_end = canonical_ipa + unmap_size - 1;
> +	size_t entry_size;
> +	gpa_t next_addr;
> +	u64 entry;
> +	MA_STATE(mas_rmap, revmap_mt, canonical_ipa, canonical_ipa_end);
> +
> +	lockdep_assert_held_write(&kvm_s2_mmu_to_kvm(mmu)->mmu_lock);
> +
> +	if (mmu->nested_revmap_broken) {
> +		reset_revmap_and_unmap(mmu, may_block);
> +		return;
> +	}
> +
> +	if (!mmu->nested_stage2_enabled) {
> +		kvm_stage2_unmap_range(mmu, canonical_ipa, unmap_size, may_block);
> +		return;
> +	}
> +
> +	mtree_lock(revmap_mt);
> +	entry = xa_to_value(mas_find(&mas_rmap, canonical_ipa_end));
> +
> +	while (entry && mas_rmap.index <= canonical_ipa_end) {
> +		entry_size = mas_rmap.last - mas_rmap.index + 1;
> +		next_addr = mas_rmap.index + entry_size;
> +		/*
> +		 * Give up and invalidate this s2 mmu if the unmap range
> +		 * touches any UNKNOWN_IPA range.
> +		 */
> +		if (unknown_ipa_entry(entry)) {
> +			mtree_unlock(revmap_mt);
> +			reset_revmap_and_unmap(mmu, may_block);
> +			return;
> +		}
> +
> +		/*
> +		 * Ignore result, it is okay if a reverse mapping erase
> +		 * fails.
> +		 */
> +		mas_store_gfp(&mas_rmap, NULL, GFP_NOWAIT | __GFP_ACCOUNT);

I wonder if we can handle this a bit more gracefully.

Ideally we'd be able to place a search mark on the entry flagging it as
stale which could be used to avoid attempting to overinvalidate the
shadow stage-2.

Interestingly enough, Liam recently gave the suggestion [*] of storing
XA_ZERO_ENTRY for a similar use case where erasure happens in an atomic
context. We should be able to do the exact same thing here and push the
cleanup to the next insertion.

[*] https://lore.kernel.org/all/iv7sxqezzz42xieytbf3lskutricz7ltkr3wii3w4jbnbzto7f@2tz5hwa43l37/

Thanks,
Oliver

