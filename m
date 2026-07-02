Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 024D2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 21:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yOOIF1Ylc+jMIKv/xiNheZ9A6MAB+XBIfWjxKW5BduE=; b=hrsDJFgQ6ZgY6aAP37YbRZ1DLE
	wsL5b98dHG8YrrMtj19N6kPxVYoWSKbb9pAHECyRZ4qvyc5so9rwjev5eofn+9vz54FbKbT6qegcf
	hR4LdXCHaVy8xRqjO4ixpbf68Xw09kVkx3FeXjxKQ4RlHStgNtiaGVbyLuWSEO47pYu/pzZDUiP/V
	fejQprfoT9kUqTScDNIwShaQYV5xFjaVAu+UtUd+WqmwQ7V4eoVWlXUdPgzdmkp9g0Ce8WFSaYLTQ
	+/+04/HxL9HDv3v/IPouyN915poF/TuA39qO3M0AGhaapqPTiCuW6FI0rmLxWTnM6orXiLxZV31ES
	4g4tiqxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfPGf-00000005ZPZ-417U;
	Thu, 02 Jul 2026 21:48:21 +0000
Received: from esa12.hc1455-7.c3s2.iphmx.com ([139.138.37.100])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfPGc-00000005ZLz-2FV9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 21:48:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1783028898; x=1814564898;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eQ/r81yq7SBHVmjU6sNi5AKmD7P2Gx79kRYPEcoBKn4=;
  b=oiiCURkxSbpP3KXUrfawjzyni06g+sbW5f6r4GOE1jId4mZF9FbegaaF
   URQfMF1/uQHnEAGWtU1YyRHuIfUjFE8FhVz2a5eIaRbj+U+gUYnswvI5J
   HShOJa7ZJSwcDVk4qC1TMRybJhStARn7seSa/jr3TdRTjvgy/gsdyc+cu
   0XDyy/yfbS48wTh3ksTzkF+wEWHh2/w8uYUJF+I9GMR7/fjrUOmguEFLT
   c+alq3RC92nvrsesEt9AQDFMczYkzMOwuIjEJ7PHvAaN3a0QBH8iXkun3
   xGIdUz3vepPXTFH+wEXxXogtOHTl9KjRldalCw1JfZUhwa9Hta/TxzD+Q
   w==;
X-CSE-ConnectionGUID: 1EQ4Y8HORlyUc0km+33fcg==
X-CSE-MsgGUID: Vmt8kpjMQ8aSHKU2kz1IPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="223815932"
X-IronPort-AV: E=Sophos;i="6.25,144,1779116400"; 
   d="scan'208";a="223815932"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 06:48:15 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id BF91FE455
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Jul 2026 21:48:15 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 7322E180F553
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Jul 2026 21:48:15 +0000 (UTC)
Received: from sm-arm-grace07 (unknown [10.124.178.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTPS id 7205640260E;
	Thu,  2 Jul 2026 21:48:10 +0000 (UTC)
Date: Fri, 3 Jul 2026 06:48:07 +0900
From: Itaru Kitayama <itaru.kitayama@fujitsu.com>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sebastian Ene <sebastianene@google.com>
Subject: Re: [PATCH v2 6/6] KVM: arm64: ptdump: Introduce the shadow ptdump
 file
Message-ID: <akbcl8vFrpq40qUM@sm-arm-grace07>
References: <20260630121005.1130996-1-weilin.chang@arm.com>
 <20260630121005.1130996-7-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630121005.1130996-7-weilin.chang@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_144819_686094_EEBF4CBD 
X-CRM114-Status: GOOD (  28.09  )
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

On Tue, Jun 30, 2026 at 01:10:05PM +0100, Wei-Lin Chang wrote:
> Create a ptdump file for all shadow page tables. It will dump out all
> valid shadow page tables at the time of request, with the mmu's index,
> guest VTCR_EL2, VTTBR_EL2, and whether the guest stage-2 is enabled or
> not.
> 
> Also detach the nested mmu array under the mmu_lock in
> kvm_arch_flush_shadow_all() so readers cannot race with the array being
> removed, then free the old array after dropping the lock.
> 
> Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
> ---
>  arch/arm64/kvm/nested.c | 12 ++++++--
>  arch/arm64/kvm/ptdump.c | 61 ++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 69 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index 6435efd65cb5..17a180ddf6ca 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -1283,6 +1283,7 @@ void kvm_nested_s2_flush(struct kvm *kvm)
>  
>  void kvm_arch_flush_shadow_all(struct kvm *kvm)
>  {
> +	struct kvm_s2_mmu *mmus;
>  	int i;
>  
>  	for (i = 0; i < kvm->arch.nested_mmus_size; i++) {
> @@ -1291,9 +1292,14 @@ void kvm_arch_flush_shadow_all(struct kvm *kvm)
>  		if (!WARN_ON(atomic_read(&mmu->refcnt)))
>  			kvm_free_stage2_pgd(mmu);
>  	}
> -	kvfree(kvm->arch.nested_mmus);
> -	kvm->arch.nested_mmus = NULL;
> -	kvm->arch.nested_mmus_size = 0;
> +
> +	scoped_guard(write_lock, &kvm->mmu_lock) {
> +		mmus = kvm->arch.nested_mmus;
> +		kvm->arch.nested_mmus = NULL;
> +		kvm->arch.nested_mmus_size = 0;
> +	}
> +
> +	kvfree(mmus);
>  	kvm_uninit_stage2_mmu(kvm);
>  }
>  
> diff --git a/arch/arm64/kvm/ptdump.c b/arch/arm64/kvm/ptdump.c
> index 40f93b7c7ad9..1649eaa75798 100644
> --- a/arch/arm64/kvm/ptdump.c
> +++ b/arch/arm64/kvm/ptdump.c
> @@ -181,6 +181,50 @@ static int kvm_ptdump_guest_canonical_show(struct seq_file *m, void *unused)
>  	return 0;
>  }
>  
> +static int kvm_ptdump_guest_nested_show(struct seq_file *m, void *unused)
> +{
> +	int ret = 0, i;
> +	struct kvm_ptdump_guest_state *st = m->private;
> +	struct kvm *kvm = st->kvm;
> +	struct kvm_pgtable_walker walker = (struct kvm_pgtable_walker) {
> +		.cb	= kvm_ptdump_visitor,
> +		.arg	= &st->parser_state,
> +		.flags	= KVM_PGTABLE_WALK_LEAF,
> +	};
> +
> +	guard(write_lock)(&kvm->mmu_lock);
> +
> +	if (!kvm->arch.nested_mmus)
> +		return 0;
> +
> +	for (i = 0; i < kvm->arch.nested_mmus_size; i++) {
> +		struct kvm_s2_mmu *mmu = &kvm->arch.nested_mmus[i];
> +
> +		if (!mmu->pgt)
> +			continue;
> +
> +		if (kvm_s2_mmu_valid(mmu)) {
> +			memset(st, 0, sizeof(*st));
> +			ret = kvm_ptdump_parser_init(st, kvm, mmu->pgt);
> +			if (ret)
> +				return ret;
> +			st->parser_state = (struct ptdump_pg_state) {
> +				.marker		= &st->ipa_marker[0],
> +				.level		= -1,
> +				.pg_level	= &st->level[0],
> +				.seq		= m,
> +			};
> +			seq_printf(m, "nested mmu %d VTCR: 0x%016llx VTTBR: 0x%016llx s2: %s\n",
> +				   i, mmu->tlb_vtcr, mmu->tlb_vttbr,
> +				   mmu->nested_stage2_enabled ? "enabled" : "disabled");

This header information in the debugfs "shadow_page_tables" file, under
the nested directory is showing guest hypervisor's configuration while
the file is designed to show nested guest's shadwo stage 2 translation
tables layouts owned by Host EL2 hypervisor. Is this intentional?

Thanks,
Itaru.

> +			ret = kvm_pgtable_walk(mmu->pgt, 0, BIT(mmu->pgt->ia_bits), &walker);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +	return ret;
> +}
> +
>  static int kvm_ptdump_guest_open(struct inode *m, struct file *file,
>  				 int (*show)(struct seq_file *, void *))
>  {
> @@ -212,6 +256,11 @@ static int kvm_ptdump_guest_canonical_open(struct inode *m, struct file *file)
>  	return kvm_ptdump_guest_open(m, file, kvm_ptdump_guest_canonical_show);
>  }
>  
> +static int kvm_ptdump_guest_nested_open(struct inode *m, struct file *file)
> +{
> +	return kvm_ptdump_guest_open(m, file, kvm_ptdump_guest_nested_show);
> +}
> +
>  static int kvm_ptdump_guest_close(struct inode *m, struct file *file)
>  {
>  	struct kvm *kvm = m->i_private;
> @@ -230,6 +279,13 @@ static const struct file_operations kvm_ptdump_guest_canonical_fops = {
>  	.release	= kvm_ptdump_guest_close,
>  };
>  
> +static const struct file_operations kvm_ptdump_guest_nested_fops = {
> +	.open		= kvm_ptdump_guest_nested_open,
> +	.read		= seq_read,
> +	.llseek		= seq_lseek,
> +	.release	= kvm_ptdump_guest_close,
> +};
> +
>  static int kvm_pgtable_range_show(struct seq_file *m, void *unused)
>  {
>  	struct kvm *kvm = m->private;
> @@ -307,6 +363,9 @@ void kvm_s2_ptdump_create_debugfs(struct kvm *kvm)
>  			    kvm, &kvm_pgtable_range_fops);
>  	debugfs_create_file("stage2_levels", 0400, kvm->debugfs_dentry,
>  			    kvm, &kvm_pgtable_levels_fops);
> -	if (cpus_have_final_cap(ARM64_HAS_NESTED_VIRT))
> +	if (cpus_have_final_cap(ARM64_HAS_NESTED_VIRT)) {
>  		kvm->arch.debugfs_nv_dentry = debugfs_create_dir("nested", kvm->debugfs_dentry);
> +		debugfs_create_file("shadow_page_tables", 0400, kvm->arch.debugfs_nv_dentry,
> +				    kvm, &kvm_ptdump_guest_nested_fops);
> +	}
>  }
> -- 
> 2.43.0
> 

