Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28AE1C43327
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 11:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WooDa3sXBRqdIKDpMlEkUfaz9YYduiF8MeFpCAj9gBM=; b=nEO++s7cwiOMOYWA+TSow9ZrbD
	eNwtnWYHrK14FWXesMLYop8+uX44FbD2c4tYtjuARWq+bJSWvznR9kTm/CsGUWpdMaDuV0gX7SEpF
	bccjH1qkNxYEpq4L/ej1iqzaJveOobJR9YngdIRxy7KoECoHhiVpjAYofaTnLUDjbvVUk0uKBzWfO
	Ewu1NnRRLCd99/YPWzh3/iR1SlDqme6iLhgzkPoCRpSqBVc+FH97vUNyllWJ1VKxO8F9hS130ih1g
	C6ZXNOudlFNAajyO73v1sMe/sN6d3ngXgqGxeAw0CcKcYKNjHnc1ZLkhNe2d4GKnHEz/2rVg8abqH
	ZyZjQHkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfF9W-00000004G6c-2UpV;
	Thu, 02 Jul 2026 11:00:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfF9T-00000004G68-2Z3K
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 11:00:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2ED7C356E;
	Thu,  2 Jul 2026 04:00:10 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3DF0D3F905;
	Thu,  2 Jul 2026 04:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782990014; bh=V8/qMswdwNdFf1xTboS6y3yLYa9m8hQRVWhaPq1J4IM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JVaOa8eriyqzJawPpuRgeIqLCrB+8Yo4VF9ifU2rQej6fbPs5/v66rNca3vSR9xN0
	 3B7t580oiWlsZ8o6ztB88TGYgiozJW/2yeDTgz6oWFj64pVUjE1GMgjnxbUSrsMW/t
	 Bk7UFus/qKXHG2Lz8PtuRJch+z5zZw3brPnB8D0M=
From: Leonardo Bras <leo.bras@arm.com>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: Leonardo Bras <leo.bras@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Itaru Kitayama <itaru.kitayama@fujitsu.com>,
	Sebastian Ene <sebastianene@google.com>
Subject: Re: [PATCH v2 6/6] KVM: arm64: ptdump: Introduce the shadow ptdump file
Date: Thu,  2 Jul 2026 12:00:10 +0100
Message-ID: <akZEujlMp2H1cYOH@LeoBrasDK>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <w6ffknve2o3l5pgk7mblovsu5xzjwsgf7qyjd66nqwbtsea4ue@h5wj26fbb6kb>
References: <20260630121005.1130996-1-weilin.chang@arm.com> <20260630121005.1130996-7-weilin.chang@arm.com> <akUyI3Z9JbggzE5P@LeoBrasDK> <w6ffknve2o3l5pgk7mblovsu5xzjwsgf7qyjd66nqwbtsea4ue@h5wj26fbb6kb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_040015_732607_5E6003B6 
X-CRM114-Status: GOOD (  27.65  )
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

On Wed, Jul 01, 2026 at 06:35:41PM +0100, Wei-Lin Chang wrote:
> On Wed, Jul 01, 2026 at 04:28:35PM +0100, Leonardo Bras wrote:
> > On Tue, Jun 30, 2026 at 01:10:05PM +0100, Wei-Lin Chang wrote:
> > > Create a ptdump file for all shadow page tables. It will dump out all
> > > valid shadow page tables at the time of request, with the mmu's index,
> > > guest VTCR_EL2, VTTBR_EL2, and whether the guest stage-2 is enabled or
> > > not.
> > > 
> > > Also detach the nested mmu array under the mmu_lock in
> > > kvm_arch_flush_shadow_all() so readers cannot race with the array being
> > > removed, then free the old array after dropping the lock.
> > 
> > Out of curiosity: why drop the lock before kfree'ing ?
> 
> Because kvfree() can sleep! :)
> 

Damn, I was certain to read kfree, not kvfree(), LOL

You are right, then :)

Thanks!
Leoy


> Thanks,
> Wei-Lin Chang
> 
> > 
> > Thanks!
> > Leo
> > 
> > > 
> > > Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
> > > ---
> > >  arch/arm64/kvm/nested.c | 12 ++++++--
> > >  arch/arm64/kvm/ptdump.c | 61 ++++++++++++++++++++++++++++++++++++++++-
> > >  2 files changed, 69 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> > > index 6435efd65cb5..17a180ddf6ca 100644
> > > --- a/arch/arm64/kvm/nested.c
> > > +++ b/arch/arm64/kvm/nested.c
> > > @@ -1283,6 +1283,7 @@ void kvm_nested_s2_flush(struct kvm *kvm)
> > >  
> > >  void kvm_arch_flush_shadow_all(struct kvm *kvm)
> > >  {
> > > +	struct kvm_s2_mmu *mmus;
> > >  	int i;
> > >  
> > >  	for (i = 0; i < kvm->arch.nested_mmus_size; i++) {
> > > @@ -1291,9 +1292,14 @@ void kvm_arch_flush_shadow_all(struct kvm *kvm)
> > >  		if (!WARN_ON(atomic_read(&mmu->refcnt)))
> > >  			kvm_free_stage2_pgd(mmu);
> > >  	}
> > > -	kvfree(kvm->arch.nested_mmus);
> > > -	kvm->arch.nested_mmus = NULL;
> > > -	kvm->arch.nested_mmus_size = 0;
> > > +
> > > +	scoped_guard(write_lock, &kvm->mmu_lock) {
> > > +		mmus = kvm->arch.nested_mmus;
> > > +		kvm->arch.nested_mmus = NULL;
> > > +		kvm->arch.nested_mmus_size = 0;
> > > +	}
> > > +
> > > +	kvfree(mmus);
> > >  	kvm_uninit_stage2_mmu(kvm);
> > >  }
> > >  
> > > diff --git a/arch/arm64/kvm/ptdump.c b/arch/arm64/kvm/ptdump.c
> > > index 40f93b7c7ad9..1649eaa75798 100644
> > > --- a/arch/arm64/kvm/ptdump.c
> > > +++ b/arch/arm64/kvm/ptdump.c
> > > @@ -181,6 +181,50 @@ static int kvm_ptdump_guest_canonical_show(struct seq_file *m, void *unused)
> > >  	return 0;
> > >  }
> > >  
> > > +static int kvm_ptdump_guest_nested_show(struct seq_file *m, void *unused)
> > > +{
> > > +	int ret = 0, i;
> > > +	struct kvm_ptdump_guest_state *st = m->private;
> > > +	struct kvm *kvm = st->kvm;
> > > +	struct kvm_pgtable_walker walker = (struct kvm_pgtable_walker) {
> > > +		.cb	= kvm_ptdump_visitor,
> > > +		.arg	= &st->parser_state,
> > > +		.flags	= KVM_PGTABLE_WALK_LEAF,
> > > +	};
> > > +
> > > +	guard(write_lock)(&kvm->mmu_lock);
> > > +
> > > +	if (!kvm->arch.nested_mmus)
> > > +		return 0;
> > > +
> > > +	for (i = 0; i < kvm->arch.nested_mmus_size; i++) {
> > > +		struct kvm_s2_mmu *mmu = &kvm->arch.nested_mmus[i];
> > > +
> > > +		if (!mmu->pgt)
> > > +			continue;
> > > +
> > > +		if (kvm_s2_mmu_valid(mmu)) {
> > > +			memset(st, 0, sizeof(*st));
> > > +			ret = kvm_ptdump_parser_init(st, kvm, mmu->pgt);
> > > +			if (ret)
> > > +				return ret;
> > > +			st->parser_state = (struct ptdump_pg_state) {
> > > +				.marker		= &st->ipa_marker[0],
> > > +				.level		= -1,
> > > +				.pg_level	= &st->level[0],
> > > +				.seq		= m,
> > > +			};
> > > +			seq_printf(m, "nested mmu %d VTCR: 0x%016llx VTTBR: 0x%016llx s2: %s\n",
> > > +				   i, mmu->tlb_vtcr, mmu->tlb_vttbr,
> > > +				   mmu->nested_stage2_enabled ? "enabled" : "disabled");
> > > +			ret = kvm_pgtable_walk(mmu->pgt, 0, BIT(mmu->pgt->ia_bits), &walker);
> > > +			if (ret)
> > > +				return ret;
> > > +		}
> > > +	}
> > > +	return ret;
> > > +}
> > > +
> > >  static int kvm_ptdump_guest_open(struct inode *m, struct file *file,
> > >  				 int (*show)(struct seq_file *, void *))
> > >  {
> > > @@ -212,6 +256,11 @@ static int kvm_ptdump_guest_canonical_open(struct inode *m, struct file *file)
> > >  	return kvm_ptdump_guest_open(m, file, kvm_ptdump_guest_canonical_show);
> > >  }
> > >  
> > > +static int kvm_ptdump_guest_nested_open(struct inode *m, struct file *file)
> > > +{
> > > +	return kvm_ptdump_guest_open(m, file, kvm_ptdump_guest_nested_show);
> > > +}
> > > +
> > >  static int kvm_ptdump_guest_close(struct inode *m, struct file *file)
> > >  {
> > >  	struct kvm *kvm = m->i_private;
> > > @@ -230,6 +279,13 @@ static const struct file_operations kvm_ptdump_guest_canonical_fops = {
> > >  	.release	= kvm_ptdump_guest_close,
> > >  };
> > >  
> > > +static const struct file_operations kvm_ptdump_guest_nested_fops = {
> > > +	.open		= kvm_ptdump_guest_nested_open,
> > > +	.read		= seq_read,
> > > +	.llseek		= seq_lseek,
> > > +	.release	= kvm_ptdump_guest_close,
> > > +};
> > > +
> > >  static int kvm_pgtable_range_show(struct seq_file *m, void *unused)
> > >  {
> > >  	struct kvm *kvm = m->private;
> > > @@ -307,6 +363,9 @@ void kvm_s2_ptdump_create_debugfs(struct kvm *kvm)
> > >  			    kvm, &kvm_pgtable_range_fops);
> > >  	debugfs_create_file("stage2_levels", 0400, kvm->debugfs_dentry,
> > >  			    kvm, &kvm_pgtable_levels_fops);
> > > -	if (cpus_have_final_cap(ARM64_HAS_NESTED_VIRT))
> > > +	if (cpus_have_final_cap(ARM64_HAS_NESTED_VIRT)) {
> > >  		kvm->arch.debugfs_nv_dentry = debugfs_create_dir("nested", kvm->debugfs_dentry);
> > > +		debugfs_create_file("shadow_page_tables", 0400, kvm->arch.debugfs_nv_dentry,
> > > +				    kvm, &kvm_ptdump_guest_nested_fops);
> > > +	}
> > >  }
> > > -- 
> > > 2.43.0
> > > 

