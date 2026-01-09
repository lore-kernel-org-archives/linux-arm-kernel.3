Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A4AD1A63C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 14:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cqcaAtAueNnkZ4ubSYCSYeT8q7sUoK7v01/pAfgrgL8=; b=C2XtqfyAb5ytD3yG3IOlc1dr7m
	4JQ050eeCtGO8nbjwDZBfHZjcL3wXNvwpMoQNWsbsFyKuJPLxv5LXOLrTnVRfLpQeOhtVYRmeQv1j
	tQcr85BA5Ijbt4ALk3Yn05wImcjL26I0HS4Ao4PSojg8wiSCpYC3ALDWGO9as8av4UF7mkOnKZv3Y
	MBNbXGV7M7PKuqAaq0YAvZiwmpVfMQtTPakl2+g5zhbvQlDSF3IaqsjFuYtJJwx7H7DAs1FN4+Ny0
	O86mIq4Mm2wCvIO25hScYz1z3KS24n5vSmoPUn3QBJW8DKG+KPjHhk8py5V1tr+oXc5JdDYPRjEYA
	XNna55dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veDaw-00000002PuZ-170w;
	Fri, 09 Jan 2026 14:36:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veDav-00000002PuR-08r1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 14:36:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6E9F060017;
	Fri,  9 Jan 2026 14:36:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9607C4CEF1;
	Fri,  9 Jan 2026 14:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767969363;
	bh=XyFQSkYbtQZx84gbWtGBs7EA771y4SuSKEiWeOXYfb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VmP0HPFfnWuSjkE7BBPHx2XBCZ2sQMrSsaXFYAJV4OAQnKcIF8D2wu+6yK3t/xrFn
	 zZ1jd8xcoaU2BbGKBQPdHo3xAr+fwrqrj2jouKYqmVpmyqgnAKDZ7a8nT1kav6k4mk
	 zC3hxdWKGP8NnCOyRIvxgHKjoytoytTKt7VXO+nNEEpqVSuSXZ0GZ10GCaCd804cd8
	 WSWZCIhDISZVwvwQgD9LIXTFrHi2DgwIOVZ9zTjoCVEEFSxT4CQy628iJbMnfY0Dia
	 NW3tMQ30uNgkvmV8+qyq3uskGYsESYD1fmOoJRfgYo50lbnGGmZJhO4/PmIvyez8Oz
	 dd+e2N9wY4HXg==
Date: Fri, 9 Jan 2026 14:35:57 +0000
From: Will Deacon <will@kernel.org>
To: Quentin Perret <qperret@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 14/30] KVM: arm64: Hook up reclaim hypercall to
 pkvm_pgtable_stage2_destroy()
Message-ID: <aWESTd5Scyna_3nc@willie-the-truck>
References: <20260105154939.11041-1-will@kernel.org>
 <20260105154939.11041-15-will@kernel.org>
 <bc246bvbf3cg7scut2dcey7tynxqzclyceqv4hhooqacsdzti7@hcaqfbnvebt2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc246bvbf3cg7scut2dcey7tynxqzclyceqv4hhooqacsdzti7@hcaqfbnvebt2>
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

On Tue, Jan 06, 2026 at 02:59:19PM +0000, Quentin Perret wrote:
> On Monday 05 Jan 2026 at 15:49:22 (+0000), Will Deacon wrote:
> > During teardown of a protected guest, its memory pages must be reclaimed
> > from the hypervisor by issuing the '__pkvm_reclaim_dying_guest_page'
> > hypercall.
> > 
> > Add a new helper, __pkvm_pgtable_stage2_reclaim(), which is called
> > during the VM teardown operation to reclaim pages from the hypervisor
> > and drop the GUP pin on the host.
> > 
> > Signed-off-by: Will Deacon <will@kernel.org>
> > ---
> >  arch/arm64/kvm/pkvm.c | 31 ++++++++++++++++++++++++++++++-
> >  1 file changed, 30 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> > index 1814e17d600e..8be91051699e 100644
> > --- a/arch/arm64/kvm/pkvm.c
> > +++ b/arch/arm64/kvm/pkvm.c
> > @@ -322,6 +322,32 @@ int pkvm_pgtable_stage2_init(struct kvm_pgtable *pgt, struct kvm_s2_mmu *mmu,
> >  	return 0;
> >  }
> >  
> > +static int __pkvm_pgtable_stage2_reclaim(struct kvm_pgtable *pgt, u64 start, u64 end)
> > +{
> > +	struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
> > +	pkvm_handle_t handle = kvm->arch.pkvm.handle;
> > +	struct pkvm_mapping *mapping;
> > +	int ret;
> > +
> > +	for_each_mapping_in_range_safe(pgt, start, end, mapping) {
> > +		struct page *page;
> > +
> > +		ret = kvm_call_hyp_nvhe(__pkvm_reclaim_dying_guest_page,
> > +					handle, mapping->gfn);
> > +		if (WARN_ON(ret))
> > +			return ret;
> > +
> > +		page = pfn_to_page(mapping->pfn);
> > +		WARN_ON_ONCE(mapping->nr_pages != 1);
> > +		unpin_user_pages_dirty_lock(&page, 1, true);
> > +		account_locked_vm(current->mm, 1, false);
> > +		pkvm_mapping_remove(mapping, &pgt->pkvm_mappings);
> > +		kfree(mapping);
> 
> Nit: this might take a while, worth adding a cond_resched() in here?

Commit 4ddfab5436b6 ("KVM: arm64: Reschedule as needed when destroying
the stage-2 page-tables") breaks the destruction operation up into
chunks so we now reschedule from the caller in stage2_destroy_range().

Do you think we need an additional reschedule?

Will

