Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9DB9CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 14:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EiMUeIi8y+epZU6HAqV2r+psiszsXZEBuLE/WMc5IQY=; b=DqSMILUoIklE20Uh+oHSttoMpW
	i2gWBhmR5VazBXakWPf74408BpacGZEpTL0qY+ZOYrmF/MyTa9uQlH/A4UhTjdUxce9ESGpqe5pLU
	m8m5xld/oeahhqrhnR/NjojA0CWPdb/uqGKgP+yDoQjaekm0yjcR74vAHD7DWQL8bkBCLXq3NSRZd
	VRiOs/YdVATCvOsZNhvnM03/yGCfThUVw8kpGbb0ThjMznfAmgPkb4YKO+f0rJNrZ2cpQ3oe0u6xV
	IB083HFFHtIus5cXNSo52ZlJWphWARpkdD6MnJxgDqRSH9mM8yHdQUgjIPDKhmp/xfrMuX0EqO2My
	XhxkYdhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc2A1-00000006SGZ-1IzZ;
	Tue, 23 Jun 2026 14:31:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc293-00000006Rto-3voG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 14:30:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AEA2A40956;
	Tue, 23 Jun 2026 14:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49DDB1F000E9;
	Tue, 23 Jun 2026 14:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782225033;
	bh=EiMUeIi8y+epZU6HAqV2r+psiszsXZEBuLE/WMc5IQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KOq6/lfV8oHFwgOQtqizFAEjGigvyNnrPPPME4rJ7fQBPAT9y43B4VikWd9fOhh15
	 Emasy8nRZyC1mHi65PJVFwzg5HqMoLO7WzdtjCw1mNN0EnciTOZGLinXjJHLuWoo0G
	 8w/JCqCYYdtlVF4dMvmYjFO2Dp6sZLayyMtlKthRwEVLLihq+f9/KBCEvkn1SegSgz
	 K9yUBNzPgfXp7pt4IgPlimzWgvJGQwD4BYm5zQX2Oy8tYD1YfAWGQvrUM6GVkpQjaB
	 +zMJc/KUkgD9W/fTzsrVjEC47zFO3HiWkdUXTqz43hXnGRNfomnFMhuGy8OOVZi/5B
	 JebptHaUkz79Q==
Date: Tue, 23 Jun 2026 15:30:28 +0100
From: Will Deacon <will@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Bradley Morgan <include@grrlz.net>, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <tabba@google.com>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: account pKVM reclaim against the VM mm
Message-ID: <ajqYhOU6A1hdqTxO@willie-the-truck>
References: <20260621213155.6019-1-include@grrlz.net>
 <86zf0nq8ki.wl-maz@kernel.org>
 <ajqNANUBCamSjfHM@willie-the-truck>
 <86se6dqsav.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86se6dqsav.wl-maz@kernel.org>
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

On Tue, Jun 23, 2026 at 02:50:48PM +0100, Marc Zyngier wrote:
> On Tue, 23 Jun 2026 14:41:20 +0100,
> Will Deacon <will@kernel.org> wrote:
> > 
> > On Mon, Jun 22, 2026 at 09:32:29AM +0100, Marc Zyngier wrote:
> > > On Sun, 21 Jun 2026 22:31:55 +0100,
> > > Bradley Morgan <include@grrlz.net> wrote:
> > > > 
> > > > Protected guest faults charge long term pins to the VM's mm. Teardown
> > > > can run later from file release, where current->mm may be unrelated.
> > > >
> > > > Drop the charge from kvm->mm instead.
> > > > 
> > > > Fixes: 4e6e03f9eadd ("KVM: arm64: Hook up reclaim hypercall to pkvm_pgtable_stage2_destroy()")
> > > > Signed-off-by: Bradley Morgan <include@grrlz.net>
> > > > ---
> > > >  arch/arm64/kvm/pkvm.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> > > > index 053e4f733e4b..428723b1b0f5 100644
> > > > --- a/arch/arm64/kvm/pkvm.c
> > > > +++ b/arch/arm64/kvm/pkvm.c
> > > > @@ -352,7 +352,7 @@ static int __pkvm_pgtable_stage2_reclaim(struct kvm_pgtable *pgt, u64 start, u64
> > > >  		page = pfn_to_page(mapping->pfn);
> > > >  		WARN_ON_ONCE(mapping->nr_pages != 1);
> > > >  		unpin_user_pages_dirty_lock(&page, 1, true);
> > > > -		account_locked_vm(current->mm, 1, false);
> > > > +		account_locked_vm(kvm->mm, 1, false);
> > > >  		pkvm_mapping_remove(mapping, &pgt->pkvm_mappings);
> > > >  		kfree(mapping);
> > > >  	}
> > > 
> > > Seems correct to me, as the final mmdrop(kvm->mm) occurs after S2
> > > teardown.
> > > 
> > > Will, what do you think?
> > 
> > Thanks, this looks correct to me.
> > 
> > While I was thinking about it, I also started looking at the use of
> > 'current->mm' in kvm_arch_prepare_memory_region() in case that should
> > also be 'kvm->mm'. However, I then realised that I don't really grok
> > that code at all because it does a bunch of checking on the VMAs with
> > mmap_read_lock(current->mm) held, but then that lock is dropped
> > immediately after doing the checks so I'm not really sure what they
> > are protected against. Presumably, the address space could be modified
> > as soon as the lock is dropped?
> > 
> > But it's hot, so I'm probably missing something here.
> 
> I think this is just trying to catch a few obvious issues, such as
> dirty logging on device memory, but that only works for well behaved
> userspace that is making "a honest mistake".
> 
> For the more trying ones, we end-up doing the same checks again at
> fault time anyway.

Got it, so it's a best-effort check. Although it does mean that memslot
changes have to be done by the same mm as kvm->mm, otherwise you could
get a spurious error back from the kernel.

Will

