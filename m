Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF86C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 10:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q8QnKRPM8i0cNpsCUuFVq1PNhzYipEwLagNVEG2i8xw=; b=KOJNOh/Fc9pXce9ORvEHwehjO8
	if9/GiHiBfhDq281x3hOtehv5uRWM0XxG+nrrVTRHuZuDVEAvPox/4uNuxY128+N6XR/+xw36g0VS
	T+IGXULQipIzhBnwTYnh4yCALYdRZey/ovrbfC/O5F5zptMxej6pTMEQm2g9L5XsqQB7RnCMAekXs
	r9qzBQV9tUgQRj2su0b2Z1egV/d4xMsnyZRn/HCkOFX4zK3LNZcq3ZnjNcOHH74eviCPTcWMLnNju
	Qy3S3gfHPpc92jl/p0Nr1CF7i4CdbGEXr0uRiwJ+PUUUmcnyyr9fx4JkaBJbx57ov603Tg14vbBSw
	GAI+HGdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfb7x-00000006bQb-0rRD;
	Fri, 03 Jul 2026 10:28:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfb7u-00000006bPn-3QCc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 10:28:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E2181F91;
	Fri,  3 Jul 2026 03:28:01 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 11C553F905;
	Fri,  3 Jul 2026 03:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783074485; bh=HCfaiQ70wDFRE9iE7hAdyxdatvon4JcTAsPQjZG1BnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FhdgFc7m0+X94gzv10Bb3P3XVYELZ7ey/aqt8urO0IQxMb8K1w46DpvxF4JsXg8/x
	 L2GY3bCek9PXtG0GR4A2UCqgKELuPcjckiuHLErhDC6FwupKW8mmeqIMVyBTW8ckG/
	 Gj+zLIcvhJJ2/Dbpr259d9FeiOPzSB1RqjIZZfUo=
Date: Fri, 3 Jul 2026 11:27:47 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <tabba@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Sebastian Ene <sebastianene@google.com>
Subject: Re: [PATCH v2 6/6] KVM: arm64: ptdump: Introduce the shadow ptdump
 file
Message-ID: <scnwtpvy2gkkzwjmweiaiiinxx7xtisbpjjlrtf2nxkraqqpg3@haaa3d3ll4et>
References: <20260630121005.1130996-1-weilin.chang@arm.com>
 <20260630121005.1130996-7-weilin.chang@arm.com>
 <akbcl8vFrpq40qUM@sm-arm-grace07>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akbcl8vFrpq40qUM@sm-arm-grace07>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_032806_936028_BB2E6A3D 
X-CRM114-Status: GOOD (  28.42  )
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

On Fri, Jul 03, 2026 at 06:48:07AM +0900, Itaru Kitayama wrote:
> On Tue, Jun 30, 2026 at 01:10:05PM +0100, Wei-Lin Chang wrote:
> > Create a ptdump file for all shadow page tables. It will dump out all
> > valid shadow page tables at the time of request, with the mmu's index,
> > guest VTCR_EL2, VTTBR_EL2, and whether the guest stage-2 is enabled or
> > not.
> > 
> > Also detach the nested mmu array under the mmu_lock in
> > kvm_arch_flush_shadow_all() so readers cannot race with the array being
> > removed, then free the old array after dropping the lock.
> > 
> > Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
> > ---
> >  arch/arm64/kvm/nested.c | 12 ++++++--
> >  arch/arm64/kvm/ptdump.c | 61 ++++++++++++++++++++++++++++++++++++++++-
> >  2 files changed, 69 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> > index 6435efd65cb5..17a180ddf6ca 100644
> > --- a/arch/arm64/kvm/nested.c
> > +++ b/arch/arm64/kvm/nested.c
> > @@ -1283,6 +1283,7 @@ void kvm_nested_s2_flush(struct kvm *kvm)
> >  
> >  void kvm_arch_flush_shadow_all(struct kvm *kvm)
> >  {
> > +	struct kvm_s2_mmu *mmus;
> >  	int i;
> >  
> >  	for (i = 0; i < kvm->arch.nested_mmus_size; i++) {
> > @@ -1291,9 +1292,14 @@ void kvm_arch_flush_shadow_all(struct kvm *kvm)
> >  		if (!WARN_ON(atomic_read(&mmu->refcnt)))
> >  			kvm_free_stage2_pgd(mmu);
> >  	}
> > -	kvfree(kvm->arch.nested_mmus);
> > -	kvm->arch.nested_mmus = NULL;
> > -	kvm->arch.nested_mmus_size = 0;
> > +
> > +	scoped_guard(write_lock, &kvm->mmu_lock) {
> > +		mmus = kvm->arch.nested_mmus;
> > +		kvm->arch.nested_mmus = NULL;
> > +		kvm->arch.nested_mmus_size = 0;
> > +	}
> > +
> > +	kvfree(mmus);
> >  	kvm_uninit_stage2_mmu(kvm);
> >  }
> >  
> > diff --git a/arch/arm64/kvm/ptdump.c b/arch/arm64/kvm/ptdump.c
> > index 40f93b7c7ad9..1649eaa75798 100644
> > --- a/arch/arm64/kvm/ptdump.c
> > +++ b/arch/arm64/kvm/ptdump.c
> > @@ -181,6 +181,50 @@ static int kvm_ptdump_guest_canonical_show(struct seq_file *m, void *unused)
> >  	return 0;
> >  }
> >  
> > +static int kvm_ptdump_guest_nested_show(struct seq_file *m, void *unused)
> > +{
> > +	int ret = 0, i;
> > +	struct kvm_ptdump_guest_state *st = m->private;
> > +	struct kvm *kvm = st->kvm;
> > +	struct kvm_pgtable_walker walker = (struct kvm_pgtable_walker) {
> > +		.cb	= kvm_ptdump_visitor,
> > +		.arg	= &st->parser_state,
> > +		.flags	= KVM_PGTABLE_WALK_LEAF,
> > +	};
> > +
> > +	guard(write_lock)(&kvm->mmu_lock);
> > +
> > +	if (!kvm->arch.nested_mmus)
> > +		return 0;
> > +
> > +	for (i = 0; i < kvm->arch.nested_mmus_size; i++) {
> > +		struct kvm_s2_mmu *mmu = &kvm->arch.nested_mmus[i];
> > +
> > +		if (!mmu->pgt)
> > +			continue;
> > +
> > +		if (kvm_s2_mmu_valid(mmu)) {
> > +			memset(st, 0, sizeof(*st));
> > +			ret = kvm_ptdump_parser_init(st, kvm, mmu->pgt);
> > +			if (ret)
> > +				return ret;
> > +			st->parser_state = (struct ptdump_pg_state) {
> > +				.marker		= &st->ipa_marker[0],
> > +				.level		= -1,
> > +				.pg_level	= &st->level[0],
> > +				.seq		= m,
> > +			};
> > +			seq_printf(m, "nested mmu %d VTCR: 0x%016llx VTTBR: 0x%016llx s2: %s\n",
> > +				   i, mmu->tlb_vtcr, mmu->tlb_vttbr,
> > +				   mmu->nested_stage2_enabled ? "enabled" : "disabled");
> 
> This header information in the debugfs "shadow_page_tables" file, under
> the nested directory is showing guest hypervisor's configuration while
> the file is designed to show nested guest's shadwo stage 2 translation
> tables layouts owned by Host EL2 hypervisor. Is this intentional?

Yes, this is intentional. Here we are exposing guest hypervisor VTCR,
VTTBR, s2 enabled or not, because that is how the host hypervisor
distinguishes between different nested mmus (lookup_s2_mmu()).

Thanks,
Wei-Lin Chang

> 
> Thanks,
> Itaru.
> 
> > +			ret = kvm_pgtable_walk(mmu->pgt, 0, BIT(mmu->pgt->ia_bits), &walker);
> > +			if (ret)
> > +				return ret;
> > +		}
> > +	}
> > +	return ret;
> > +}
> > +
> >  static int kvm_ptdump_guest_open(struct inode *m, struct file *file,
> >  				 int (*show)(struct seq_file *, void *))
> >  {
> > @@ -212,6 +256,11 @@ static int kvm_ptdump_guest_canonical_open(struct inode *m, struct file *file)
> >  	return kvm_ptdump_guest_open(m, file, kvm_ptdump_guest_canonical_show);
> >  }
> >  
> > +static int kvm_ptdump_guest_nested_open(struct inode *m, struct file *file)
> > +{
> > +	return kvm_ptdump_guest_open(m, file, kvm_ptdump_guest_nested_show);
> > +}
> > +
> >  static int kvm_ptdump_guest_close(struct inode *m, struct file *file)
> >  {
> >  	struct kvm *kvm = m->i_private;
> > @@ -230,6 +279,13 @@ static const struct file_operations kvm_ptdump_guest_canonical_fops = {
> >  	.release	= kvm_ptdump_guest_close,
> >  };
> >  
> > +static const struct file_operations kvm_ptdump_guest_nested_fops = {
> > +	.open		= kvm_ptdump_guest_nested_open,
> > +	.read		= seq_read,
> > +	.llseek		= seq_lseek,
> > +	.release	= kvm_ptdump_guest_close,
> > +};
> > +
> >  static int kvm_pgtable_range_show(struct seq_file *m, void *unused)
> >  {
> >  	struct kvm *kvm = m->private;
> > @@ -307,6 +363,9 @@ void kvm_s2_ptdump_create_debugfs(struct kvm *kvm)
> >  			    kvm, &kvm_pgtable_range_fops);
> >  	debugfs_create_file("stage2_levels", 0400, kvm->debugfs_dentry,
> >  			    kvm, &kvm_pgtable_levels_fops);
> > -	if (cpus_have_final_cap(ARM64_HAS_NESTED_VIRT))
> > +	if (cpus_have_final_cap(ARM64_HAS_NESTED_VIRT)) {
> >  		kvm->arch.debugfs_nv_dentry = debugfs_create_dir("nested", kvm->debugfs_dentry);
> > +		debugfs_create_file("shadow_page_tables", 0400, kvm->arch.debugfs_nv_dentry,
> > +				    kvm, &kvm_ptdump_guest_nested_fops);
> > +	}
> >  }
> > -- 
> > 2.43.0
> > 

