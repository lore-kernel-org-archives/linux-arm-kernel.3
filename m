Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59074CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 22:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sXAjMZONLXS92iE/8p7owRokXqorXNYFSEQk5KFyCzU=; b=33BB2tieTuzsX1/N9qG6gh+U93
	Beewx39LFb0jFaWlL2V9dOj6sS1Sh+CgvzGCJhJsYekIadJY4oVC2mNRGixTbaMC35+8Uss5ym8Ph
	9RcAm+Z8J1oFU929nQar71znQbf7OGC+fAeewzn5kE6XLYtoS1L8kOs/UeI1xWiwtIlm7IuvQ1Tp7
	NHBvCII2Z21s+4N5nl5gn5sSG6E8PPqE9d2njD3yT3ZCe2kty0V66XPbZbt7dZuc61Xxlc18OyluS
	UnJWHQTyiCNKgbkQoARWDr8Raqr3MA4z9//+xsVvQN51cTIG29jO7Qi9lE8eGH14pmQfSnfDvrRUZ
	6ymxyfSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS0RZ-000000031vq-3Ekw;
	Tue, 26 May 2026 22:40:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS0RX-000000031vM-3tQr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 22:40:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55CDD2BCD;
	Tue, 26 May 2026 15:40:05 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 004C43F7B4;
	Tue, 26 May 2026 15:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779835210; bh=4ZsHIv4N6/NCP2/ajrwyNNKnubLcTNHLLsZjty2wESk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AXsm1hzpBuEeCpbPMpGNwj2zpuAZiBw7QvuDvzJn9YdzvELwZzalI22u5I6syuUcx
	 g+ZcRViMTXlEw9buABxdoeHEgSz8zotJJ8soarEZVxPWzYrGlbdZ02BjicfyFt8/RX
	 kNBBLV9MAeurOwPVEHaKHASILTG6HMQewD3U3pDU=
Date: Tue, 26 May 2026 23:39:58 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, Lorenzo.Pieralisi2@arm.com
Subject: Re: [PATCH v14 19/44] arm64: RMI: Allocate/free RECs to match vCPUs
Message-ID: <2uvtjhncf57yek5i4fupdefunukmidzw452mcavnmixpr5u3qd@uoaktzpak3nl>
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-20-steven.price@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513131757.116630-20-steven.price@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_154012_063832_AE25C32E 
X-CRM114-Status: GOOD (  36.59  )
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

Hi,

On Wed, May 13, 2026 at 02:17:27PM +0100, Steven Price wrote:
> The RMM maintains a data structure known as the Realm Execution Context
> (or REC). It is similar to struct kvm_vcpu and tracks the state of the
> virtual CPUs. KVM must delegate memory and request the structures are
> created when vCPUs are created, and suitably tear down on destruction.
> 
> RECs may require additional pages (e.g. for storing larger register
> state for SVE). The RMM can request extra pages for this purpose using
> the Stateful RMI Operations (SRO) functionality to request pages during
> REC creation. These pages are then passed back to the host from the RMM
> ('reclaimed') when the REC is destroyed. The kernel tracking object
> (struct rmi_sro_state) is stored in the realm_rec structure to avoid
> memory allocation during the destruction path.
> 
> Note that only some of register state for the REC can be set by KVM, the
> rest is defined by the RMM (zeroed). The register state then cannot be
> changed by KVM after the REC is created (except when the guest
> explicitly requests this e.g. by performing a PSCI call).
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v13:
>  * Support SRO for REC creation/destruction instead of auxiliary
>    granules.
> Changes since v12:
>  * Use the new range-based delegation RMI.
> Changes since v11:
>  * Remove the KVM_ARM_VCPU_REC feature. User space no longer needs to
>    configure each VCPU separately, RECs are created on the first VCPU
>    run of the guest.
> Changes since v9:
>  * Size the aux_pages array according to the PAGE_SIZE of the host.
> Changes since v7:
>  * Add comment explaining the aux_pages array.
>  * Rename "undeleted_failed" variable to "should_free" to avoid a
>    confusing double negative.
> Changes since v6:
>  * Avoid reporting the KVM_ARM_VCPU_REC feature if the guest isn't a
>    realm guest.
>  * Support host page size being larger than RMM's granule size when
>    allocating/freeing aux granules.
> Changes since v5:
>  * Separate the concept of vcpu_is_rec() and
>    kvm_arm_vcpu_rec_finalized() by using the KVM_ARM_VCPU_REC feature as
>    the indication that the VCPU is a REC.
> Changes since v2:
>  * Free rec->run earlier in kvm_destroy_realm() and adapt to previous patches.
> ---
>  arch/arm64/include/asm/kvm_emulate.h |   2 +-
>  arch/arm64/include/asm/kvm_host.h    |   3 +
>  arch/arm64/include/asm/kvm_rmi.h     |  17 +++++
>  arch/arm64/kvm/arm.c                 |   6 ++
>  arch/arm64/kvm/reset.c               |   1 +
>  arch/arm64/kvm/rmi.c                 | 105 +++++++++++++++++++++++++++
>  6 files changed, 133 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
> index 82fd777bd9bb..2e69fe494716 100644
> --- a/arch/arm64/include/asm/kvm_emulate.h
> +++ b/arch/arm64/include/asm/kvm_emulate.h
> @@ -714,7 +714,7 @@ static inline bool kvm_realm_is_created(struct kvm *kvm)
>  
>  static inline bool vcpu_is_rec(const struct kvm_vcpu *vcpu)
>  {
> -	return false;
> +	return kvm_is_realm(vcpu->kvm);
>  }
>  
>  #endif /* __ARM64_KVM_EMULATE_H__ */
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 3512696ed506..39b5de03d0fe 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -969,6 +969,9 @@ struct kvm_vcpu_arch {
>  
>  	/* Hyp-readable copy of kvm_vcpu::pid */
>  	pid_t pid;
> +
> +	/* Realm meta data */
> +	struct realm_rec rec;
>  };
>  
>  /*
> diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/asm/kvm_rmi.h
> index 8bd743093ccf..d99bf4fc3c39 100644
> --- a/arch/arm64/include/asm/kvm_rmi.h
> +++ b/arch/arm64/include/asm/kvm_rmi.h
> @@ -59,6 +59,22 @@ struct realm {
>  	unsigned int ia_bits;
>  };
>  
> +/**
> + * struct realm_rec - Additional per VCPU data for a Realm
> + *
> + * @mpidr: MPIDR (Multiprocessor Affinity Register) value to identify this VCPU
> + * @rec_page: Kernel VA of the RMM's private page for this REC
> + * @aux_pages: Additional pages private to the RMM for this REC
> + * @run: Kernel VA of the RmiRecRun structure shared with the RMM
> + * @sro: A preallocated SRO state context
> + */
> +struct realm_rec {
> +	unsigned long mpidr;
> +	void *rec_page;
> +	struct rec_run *run;
> +	struct rmi_sro_state *sro;
> +};
> +
>  void kvm_init_rmi(void);
>  u32 kvm_realm_ipa_limit(void);
>  
> @@ -66,6 +82,7 @@ int kvm_init_realm(struct kvm *kvm);
>  int kvm_activate_realm(struct kvm *kvm);
>  void kvm_destroy_realm(struct kvm *kvm);
>  void kvm_realm_destroy_rtts(struct kvm *kvm);
> +void kvm_destroy_rec(struct kvm_vcpu *vcpu);
>  
>  static inline bool kvm_realm_is_private_address(struct realm *realm,
>  						unsigned long addr)
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index eb2b61fe1f0a..93d34762db91 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -586,6 +586,8 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
>  	/* Force users to call KVM_ARM_VCPU_INIT */
>  	vcpu_clear_flag(vcpu, VCPU_INITIALIZED);
>  
> +	vcpu->arch.rec.mpidr = INVALID_HWID;
> +
>  	vcpu->arch.mmu_page_cache.gfp_zero = __GFP_ZERO;
>  
>  	/* Set up the timer */
> @@ -1651,6 +1653,10 @@ static int kvm_vcpu_init_check_features(struct kvm_vcpu *vcpu,
>  	if (test_bit(KVM_ARM_VCPU_HAS_EL2, &features))
>  		return -EINVAL;
>  
> +	/* Realms are incompatible with AArch32 */
> +	if (vcpu_is_rec(vcpu))
> +		return -EINVAL;
> +
>  	return 0;
>  }
>  
> diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
> index b963fd975aac..c18cdca7d125 100644
> --- a/arch/arm64/kvm/reset.c
> +++ b/arch/arm64/kvm/reset.c
> @@ -161,6 +161,7 @@ void kvm_arm_vcpu_destroy(struct kvm_vcpu *vcpu)
>  	free_page((unsigned long)vcpu->arch.ctxt.vncr_array);
>  	kfree(vcpu->arch.vncr_tlb);
>  	kfree(vcpu->arch.ccsidr);
> +	kvm_destroy_rec(vcpu);
>  }
>  
>  static void kvm_vcpu_reset_sve(struct kvm_vcpu *vcpu)
> diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
> index 849111817af7..353a5ca45e78 100644
> --- a/arch/arm64/kvm/rmi.c
> +++ b/arch/arm64/kvm/rmi.c
> @@ -173,9 +173,108 @@ static int realm_ensure_created(struct kvm *kvm)
>  	return -ENXIO;
>  }
>  
> +static int kvm_create_rec(struct kvm_vcpu *vcpu)
> +{
> +	struct user_pt_regs *vcpu_regs = vcpu_gp_regs(vcpu);
> +	unsigned long mpidr = kvm_vcpu_get_mpidr_aff(vcpu);
> +	struct realm *realm = &vcpu->kvm->arch.realm;
> +	struct realm_rec *rec = &vcpu->arch.rec;
> +	unsigned long rec_page_phys;
> +	struct rec_params *params;
> +	int r, i;
> +
> +	if (rec->run)
> +		return -EBUSY;
> +
> +	/*
> +	 * The RMM will report PSCI v1.0 to Realms and the KVM_ARM_VCPU_PSCI_0_2
> +	 * flag covers v0.2 and onwards.
> +	 */
> +	if (!vcpu_has_feature(vcpu, KVM_ARM_VCPU_PSCI_0_2))
> +		return -EINVAL;
> +
> +	BUILD_BUG_ON(sizeof(*params) > PAGE_SIZE);
> +	BUILD_BUG_ON(sizeof(*rec->run) > PAGE_SIZE);
> +
> +	params = (struct rec_params *)get_zeroed_page(GFP_KERNEL);
> +	rec->rec_page = (void *)__get_free_page(GFP_KERNEL);
> +	rec->run = (void *)get_zeroed_page(GFP_KERNEL);

Should this be cast to (struct rec_run *) ?

> +	rec->sro = kmalloc_obj(*rec->sro);
> +	if (!params || !rec->rec_page || !rec->run || !rec->sro) {
> +		r = -ENOMEM;
> +		goto out_free_pages;
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(params->gprs); i++)
> +		params->gprs[i] = vcpu_regs->regs[i];
> +
> +	params->pc = vcpu_regs->pc;
> +
> +	if (vcpu->vcpu_id == 0)
> +		params->flags |= REC_PARAMS_FLAG_RUNNABLE;
> +
> +	rec_page_phys = virt_to_phys(rec->rec_page);
> +
> +	if (rmi_delegate_page(rec_page_phys)) {
> +		r = -ENXIO;
> +		goto out_free_pages;
> +	}
> +
> +	params->mpidr = mpidr;
> +
> +	if (rmi_rec_create(virt_to_phys(realm->rd), rec_page_phys,
> +			   virt_to_phys(params), rec->sro)) {
> +		r = -ENXIO;
> +		goto out_undelegate_rmm_rec;
> +	}
> +
> +	rec->mpidr = mpidr;
> +
> +	free_page((unsigned long)params);
> +	return 0;
> +
> +out_undelegate_rmm_rec:
> +	if (WARN_ON(rmi_undelegate_page(rec_page_phys)))
> +		rec->rec_page = NULL;
> +out_free_pages:
> +	free_page((unsigned long)rec->run);
> +	free_page((unsigned long)rec->rec_page);
> +	free_page((unsigned long)params);
> +	kfree(rec->sro);
> +	rec->run = NULL;
> +	return r;
> +}
> +

[...]

Thanks,
Wei-Lin Chang

