Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B4BECD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 04:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5SGz66je+LRLaETDbOtXJVclJNeFgRznknoRRB7yPmc=; b=edGdeYdZ02eU6wsJNJsTrQZ7UM
	fro3/5Ri58+cFiKzshYfdrtPBvbQNnnZpk8ACoRSLokmAS6xwr4hPgObSXcuL8hOMDVQrqUr006/7
	nyj3wl28gzarg2sKY8ckCujLKP0Y8/JYmCi4KASR4Sax3ZLAKWEfDS6pJlBVbh/Afs8M6Dpjcuo3p
	V7HtRHzNqpB9YrRwDLOqHlLfXVJ+QDfsAhplXsJ/7kSvwqbxiIMjkZsmWU8OMQ+cJEMyTWK/u8JlC
	V7tK5090OzGOdm8mn8PfR5s5Z9eVNqWZ4Kkze7ITyip0I+VaI1mmWExw4Xt+rlyffh9JlX0sJeyNo
	UzeZJ7rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXtAW-0000000AKsQ-3A11;
	Fri, 12 Jun 2026 04:06:56 +0000
Received: from esa4.hc1455-7.c3s2.iphmx.com ([68.232.139.117])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXtAT-0000000AKs3-27Xl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 04:06:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781237213; x=1812773213;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ABzEIZDD2jKBPDc5Y/2VBD3Ut+7r1stkLEvCBcmneRw=;
  b=HTKJldDGWDMalLPsbYWzLibq3H8Z3iX0IF8qe0u3X3cLHZZsHEmv6+7w
   yuVFO3MkR4YbPoankrYkizNFdOgew5G/BAwHfGehrZGSUWQ5SoBcmJz15
   h+nYrhOjxoYT/Wcq2VMtPEvzvO/jTI3xd/1edkyRfBSg0sqQSoeGhtAWQ
   Bi36Br6w6+Zx/AIVcLw5EPsU//vwKW705E6sBVYrOHCRmOhBk8E4Eorqb
   +CPeh2E2z67KwqcFH9f0C1Us2BE4k+CSFWSBR4q3xeXkaKP4H6bDGC/CE
   MEYv9orN9TqmvSmpdoqJim7uz4t3opaLPf63wlyMC1Smq38ggWv9XSt+6
   A==;
X-CSE-ConnectionGUID: bHovbl13T62rFJ9WT9VSuA==
X-CSE-MsgGUID: t7RD86DdSDeUvOE/029zkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="243288573"
X-IronPort-AV: E=Sophos;i="6.24,200,1774278000"; 
   d="scan'208";a="243288573"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 13:06:47 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id AD5B31C1C70F
	for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 04:06:47 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 684208D29DF
	for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 04:06:47 +0000 (UTC)
Received: from sm-arm-grace07 (unknown [10.124.178.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTPS id 91611405ED9;
	Fri, 12 Jun 2026 04:06:43 +0000 (UTC)
Date: Fri, 12 Jun 2026 13:06:40 +0900
From: Itaru Kitayama <itaru.kitayama@fujitsu.com>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 2/2] KVM: arm64: nv: Expose shadow page tables in
 debugfs
Message-ID: <aiuF0KSvvv-ZozI1@sm-arm-grace07>
References: <20260317182638.1592507-1-weilin.chang@arm.com>
 <20260317182638.1592507-3-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317182638.1592507-3-weilin.chang@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_210654_053291_811068FB 
X-CRM114-Status: GOOD (  35.00  )
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

Hi Wei Lin,
On Tue, Mar 17, 2026 at 06:26:38PM +0000, Wei-Lin Chang wrote:
> Exposing shadow page tables in debugfs improves the debugability and
> testability of NV. With this patch a new directory "nested" is created
> for each VM created if the host is NV capable. Within the directory each
> valid s2 mmu will have its shadow page table exposed as a readable file
> with the file name formatted as 0x<vttbr>-0x<vtcr>-s2-{en,dis}abled. The
> creation and removal of the files happen at the points when an s2 mmu
> becomes valid, or the context it represents change. In the future the
> "nested" directory can also hold other NV related information.
> 
> This is gated behind CONFIG_PTDUMP_STAGE2_DEBUGFS.
> 
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Reviewed-by: Sebastian Ene <sebastianene@google.com>
> Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
> ---
>  arch/arm64/include/asm/kvm_host.h |  9 +++++++++
>  arch/arm64/include/asm/kvm_mmu.h  |  4 ++++
>  arch/arm64/kvm/nested.c           |  6 +++++-
>  arch/arm64/kvm/ptdump.c           | 27 +++++++++++++++++++++++++++
>  4 files changed, 45 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 5d5a3bbdb95e..52977c9a11c3 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -217,6 +217,10 @@ struct kvm_s2_mmu {
>  	 */
>  	bool	nested_stage2_enabled;
>  
> +#ifdef CONFIG_PTDUMP_STAGE2_DEBUGFS
> +	struct dentry *shadow_pt_debugfs_dentry;
> +#endif
> +
>  	/*
>  	 * true when this MMU needs to be unmapped before being used for a new
>  	 * purpose.
> @@ -405,6 +409,11 @@ struct kvm_arch {
>  	 * the associated pKVM instance in the hypervisor.
>  	 */
>  	struct kvm_protected_vm pkvm;
> +
> +#ifdef CONFIG_PTDUMP_STAGE2_DEBUGFS
> +	/* Nested virtualization info */
> +	struct dentry *debugfs_nv_dentry;
> +#endif
>  };
>  
>  struct kvm_vcpu_fault_info {
> diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/asm/kvm_mmu.h
> index d968aca0461a..01e9c72d6aa7 100644
> --- a/arch/arm64/include/asm/kvm_mmu.h
> +++ b/arch/arm64/include/asm/kvm_mmu.h
> @@ -393,8 +393,12 @@ static inline bool kvm_supports_cacheable_pfnmap(void)
>  
>  #ifdef CONFIG_PTDUMP_STAGE2_DEBUGFS
>  void kvm_s2_ptdump_create_debugfs(struct kvm *kvm);
> +void kvm_nested_s2_ptdump_create_debugfs(struct kvm_s2_mmu *mmu);
> +void kvm_nested_s2_ptdump_remove_debugfs(struct kvm_s2_mmu *mmu);
>  #else
>  static inline void kvm_s2_ptdump_create_debugfs(struct kvm *kvm) {}
> +static inline void kvm_nested_s2_ptdump_create_debugfs(struct kvm_s2_mmu *mmu) {}
> +static inline void kvm_nested_s2_ptdump_remove_debugfs(struct kvm_s2_mmu *mmu) {}
>  #endif /* CONFIG_PTDUMP_STAGE2_DEBUGFS */
>  
>  #endif /* __ASSEMBLER__ */
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index eeea5e692370..31d74ed8449e 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -730,8 +730,10 @@ static struct kvm_s2_mmu *get_s2_mmu_nested(struct kvm_vcpu *vcpu)
>  	kvm->arch.nested_mmus_next = (i + 1) % kvm->arch.nested_mmus_size;
>  
>  	/* Make sure we don't forget to do the laundry */
> -	if (kvm_s2_mmu_valid(s2_mmu))
> +	if (kvm_s2_mmu_valid(s2_mmu)) {
> +		kvm_nested_s2_ptdump_remove_debugfs(s2_mmu);
>  		s2_mmu->pending_unmap = true;
> +	}
>  
>  	/*
>  	 * The virtual VMID (modulo CnP) will be used as a key when matching
> @@ -745,6 +747,8 @@ static struct kvm_s2_mmu *get_s2_mmu_nested(struct kvm_vcpu *vcpu)
>  	s2_mmu->tlb_vtcr = vcpu_read_sys_reg(vcpu, VTCR_EL2);
>  	s2_mmu->nested_stage2_enabled = vcpu_read_sys_reg(vcpu, HCR_EL2) & HCR_VM;
>  
> +	kvm_nested_s2_ptdump_create_debugfs(s2_mmu);
> +

This function can sleep, so I get while running your shadow stage 2 KVM
selftest a messge:

[ 4408.411009] BUG: sleeping function called from invalid context at kernel/locking/rwsem.c:1624
[ 4408.411075] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 164, name: shadow_stage2
[ 4408.411136] preempt_count: 2, expected: 0
[ 4408.411172] RCU nest depth: 0, expected: 0
[ 4408.411228] CPU: 1 UID: 0 PID: 164 Comm: shadow_stage2 Tainted: G        W           7.1.0-rc2+ #48 PREEMPT(full)
[ 4408.411336] Tainted: [W]=WARN
[ 4408.411368] Hardware name:  , BIOS
[ 4408.411403] Call trace:
[ 4408.411427]  show_stack+0x24/0x50 (C)
[ 4408.411524]  dump_stack_lvl+0x90/0x158
[ 4408.411633]  dump_stack+0x1c/0x38
[ 4408.411741]  __might_resched+0x168/0x208
[ 4408.411839]  __might_sleep+0x54/0xb0
[ 4408.411936]  down_write+0x30/0xe8
[ 4408.412048]  start_dirop+0x3c/0xc0
[ 4408.412149]  simple_start_creating+0xb8/0xc8
[ 4408.412241]  debugfs_start_creating.part.0+0x68/0x180
[ 4408.412375]  __debugfs_create_file+0x80/0x1f8
[ 4408.412505]  debugfs_create_file_full+0x28/0x68
[ 4408.412637]  kvm_nested_s2_ptdump_create_debugfs+0xa0/0x108
[ 4408.412734]  kvm_vcpu_load_hw_mmu+0x27c/0x320
[ 4408.412839]  kvm_arch_vcpu_load+0x318/0x5a0
[ 4408.412971]  kvm_emulate_nested_eret+0x148/0x3d8
[ 4408.413072]  kvm_handle_eret+0x110/0x138
[ 4408.413190]  handle_exit+0x6c/0x1e8
[ 4408.413306]  kvm_arch_vcpu_ioctl_run+0x3c4/0xc90
[ 4408.413396]  kvm_vcpu_ioctl+0x1a0/0xa68
[ 4408.413508]  __arm64_sys_ioctl+0xd0/0x160
[L1] L2 exit[ 4408.413631]  invoke_syscall+0xa8/0x138
[ 4408.413723]  el0_svc_common.constprop.0+0x4c/0x140
[ 4408.413821]  do_el0_svc+0x28/0x58
[ 4408.413911]  el0_svc+0x48/0x230
[ 4408.414035]  el0t_64_sync_handler+0xc0/0x108
[ 4408.414166]  el0t_64_sync+0x1b4/0x1b8

I tried to move this function out under the KVM MMU lock, but then I see
a debug entry is duplicated error. I am not sure where exactly this 
nested stage 2 debugfs entry create function should go, your help is
much appreciated.

Thanks,
Itaru.

>  out:
>  	atomic_inc(&s2_mmu->refcnt);
>  
> diff --git a/arch/arm64/kvm/ptdump.c b/arch/arm64/kvm/ptdump.c
> index 98763b291956..aebbbad85d38 100644
> --- a/arch/arm64/kvm/ptdump.c
> +++ b/arch/arm64/kvm/ptdump.c
> @@ -10,12 +10,14 @@
>  #include <linux/kvm_host.h>
>  #include <linux/seq_file.h>
>  
> +#include <asm/cpufeature.h>
>  #include <asm/kvm_mmu.h>
>  #include <asm/kvm_pgtable.h>
>  #include <asm/ptdump.h>
>  
>  #define MARKERS_LEN		2
>  #define KVM_PGTABLE_MAX_LEVELS	(KVM_PGTABLE_LAST_LEVEL + 1)
> +#define S2FNAMESZ	sizeof("0x0123456789abcdef-0x0123456789abcdef-s2-disabled")
>  
>  struct kvm_ptdump_guest_state {
>  	struct kvm_s2_mmu	*mmu;
> @@ -277,6 +279,28 @@ static const struct file_operations kvm_pgtable_levels_fops = {
>  	.release	= kvm_pgtable_debugfs_close,
>  };
>  
> +void kvm_nested_s2_ptdump_create_debugfs(struct kvm_s2_mmu *mmu)
> +{
> +	struct dentry *dent;
> +	char file_name[S2FNAMESZ];
> +
> +	snprintf(file_name, sizeof(file_name), "0x%llx-0x%llx-s2-%sabled",
> +		 mmu->tlb_vttbr,
> +		 mmu->tlb_vtcr,
> +		 mmu->nested_stage2_enabled ? "en" : "dis");
> +
> +	dent = debugfs_create_file(file_name, 0400,
> +				   mmu->arch->debugfs_nv_dentry, mmu,
> +				   &kvm_ptdump_guest_fops);
> +
> +	mmu->shadow_pt_debugfs_dentry = dent;
> +}
> +
> +void kvm_nested_s2_ptdump_remove_debugfs(struct kvm_s2_mmu *mmu)
> +{
> +	debugfs_remove(mmu->shadow_pt_debugfs_dentry);
> +}
> +
>  void kvm_s2_ptdump_create_debugfs(struct kvm *kvm)
>  {
>  	debugfs_create_file("stage2_page_tables", 0400, kvm->debugfs_dentry,
> @@ -285,4 +309,7 @@ void kvm_s2_ptdump_create_debugfs(struct kvm *kvm)
>  			    &kvm->arch.mmu, &kvm_pgtable_range_fops);
>  	debugfs_create_file("stage2_levels", 0400, kvm->debugfs_dentry,
>  			    &kvm->arch.mmu, &kvm_pgtable_levels_fops);
> +	if (cpus_have_final_cap(ARM64_HAS_NESTED_VIRT))
> +		kvm->arch.debugfs_nv_dentry =
> +			debugfs_create_dir("nested", kvm->debugfs_dentry);
>  }
> -- 
> 2.43.0
> 

