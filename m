Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC81CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 22:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t9kW9wxmbYR0zK6wTk5cssPV12k29fXpKDHVyEt5l6g=; b=xSiar7ZUYmLcGEMWKgazqBFQ5L
	O9YvLVE9ByvbV6TcltHqEI2tRcxWmWT4L+zbSkcXAoFEjUu6JhYVZrWjlhkMABOdeGO47Udr9rQQE
	P1WqKTFrLkQoh5UvfFEik+0AP8WPZsFXa+DB8Bg3qgqLrbpaXCe8hdMG7MewnZN296WseSv5tKGEg
	qIPeSMuaYcu+DR04MtOKi4RSGYIizRq3Gf5Z07PTvbdFub18oCLpfvDh7eK1+433f5QYmBKi4Za5P
	U3L6hVwEeqfZebgvxrNqI6gXoIZx0dH0gkDwMigC8POoiPdWqySeUYlgRHYyy1IEuPqnk2fPt8fwA
	OXr2sueg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUB7L-0000000BwH9-3iMa;
	Mon, 01 Jun 2026 22:28:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUB7K-0000000BwGq-0xuD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 22:28:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 54B276001D;
	Mon,  1 Jun 2026 22:28:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F3D71F00893;
	Mon,  1 Jun 2026 22:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780352897;
	bh=t9kW9wxmbYR0zK6wTk5cssPV12k29fXpKDHVyEt5l6g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kkEMaOzk11QJr+Q7Sr/AQBjqPi1yH/uZhUKLQJj1zni60iihNwEZy8zCtJ4CboOJd
	 73A8dNgNWdmoZfGgoE6rFir6mtHM05eSZ5PPzyq4pRHkMzD584vIdBRn9Daain4l8i
	 ntv/VxdH1CXhptzix/FwRz4d/+E138PMtZv3hDF+32WMbjomSSA+GvQo3YBOcnEbgP
	 NWGp297AQqntrIqiUhSp9V5Gtd0xSBbnLcLHpbp1jtlgjk6EawzCHjM4lSIctypMAs
	 gB49wFWNUQ6lDrObYrMIKmdybuUNUaanjBhBRFnAfhiP5Ir0Oyg2ULplrVZEb5qdf3
	 oyPpwbAZshTgQ==
Date: Mon, 1 Jun 2026 15:28:15 -0700
From: Oliver Upton <oupton@kernel.org>
To: Steffen Eiden <seiden@linux.ibm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Grapentin <gra@linux.ibm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	David Hildenbrand <david@kernel.org>,
	Friedrich Welter <fritz@linux.ibm.com>,
	Gautam Gala <ggala@linux.ibm.com>,
	Hariharan Mari <hari55@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Hendrik Brueckner <brueckner@linux.ibm.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>, Marc Zyngier <maz@kernel.org>,
	Nico Boehr <nrb@linux.ibm.com>,
	Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v1 09/26] KVM: arm64: Refactor idreg caching into
 dedicated structure
Message-ID: <ah4Hf7IiX77uiGfn@kernel.org>
References: <20260529155601.2927240-1-seiden@linux.ibm.com>
 <20260529155601.2927240-10-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529155601.2927240-10-seiden@linux.ibm.com>
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

On Fri, May 29, 2026 at 05:55:42PM +0200, Steffen Eiden wrote:
> +struct kvm_vm_id_regs {
> +	/*
> +	 * Emulated CPU ID registers per VM
> +	 * (Op0, Op1, CRn, CRm, Op2) of the ID registers to be saved in it
> +	 * is (3, 0, 0, crm, op2), where 1<=crm<8, 0<=op2<8.
> +	 *
> +	 * These emulated idregs are VM-wide, but accessed from the context of a vCPU.
> +	 * Atomic access to multiple idregs are guarded by kvm_arch.config_lock.
> +	 */
> +#define IDREG_IDX(id)		(((sys_reg_CRm(id) - 1) << 3) | sys_reg_Op2(id))
> +#define KVM_ARM_ID_REG_NUM	(IDREG_IDX(sys_reg(3, 0, 0, 7, 7)) + 1)
> +	u64 normal[KVM_ARM_ID_REG_NUM];

nit: ftr_reg would be slightly more clear.

Thanks,
Oliver

> +	u64 midr_el1;
> +	u64 revidr_el1;
> +	u64 aidr_el1;
> +	u64 ctr_el0;
> +};
> +
> +static inline u64 *__vm_id_reg(struct kvm_vm_id_regs *id_regs, u32 reg)
>  {
>  	switch (reg) {
>  	case sys_reg(3, 0, 0, 1, 0) ... sys_reg(3, 0, 0, 7, 7):
> -		return &ka->id_regs[IDREG_IDX(reg)];
> +		return &id_regs->normal[IDREG_IDX(reg)];
>  	case SYS_CTR_EL0:
> -		return &ka->ctr_el0;
> +		return &id_regs->ctr_el0;
>  	case SYS_MIDR_EL1:
> -		return &ka->midr_el1;
> +		return &id_regs->midr_el1;
>  	case SYS_REVIDR_EL1:
> -		return &ka->revidr_el1;
> +		return &id_regs->revidr_el1;
>  	case SYS_AIDR_EL1:
> -		return &ka->aidr_el1;
> +		return &id_regs->aidr_el1;
>  	default:
>  		WARN_ON_ONCE(1);
>  		return NULL;
> @@ -1419,7 +1423,7 @@ static inline u64 *__vm_id_reg(struct kvm_arch *ka, u32 reg)
>  }
>  
>  #define kvm_read_vm_id_reg(kvm, reg)					\
> -	({ u64 __val = *__vm_id_reg(&(kvm)->arch, reg); __val; })
> +	({ u64 __val = *__vm_id_reg(&(kvm)->arch.id_regs, reg); __val; })
>  
>  void kvm_set_vm_id_reg(struct kvm *kvm, u32 reg, u64 val);
>  
> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
> index 014fe04daabf..58a439c3ab9c 100644
> --- a/arch/arm64/kvm/config.c
> +++ b/arch/arm64/kvm/config.c
> @@ -1398,7 +1398,7 @@ void __init check_feature_map(void)
>  
>  static bool idreg_feat_match(struct kvm *kvm, const struct reg_bits_to_feat_map *map)
>  {
> -	u64 regval = kvm->arch.id_regs[map->regidx];
> +	u64 regval = kvm->arch.id_regs.normal[map->regidx];
>  	u64 regfld = (regval >> map->shift) & GENMASK(map->width - 1, 0);
>  
>  	if (map->sign) {
> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> index eb1c10120f9f..94620f142f42 100644
> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> @@ -343,7 +343,7 @@ static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struc
>  	DECLARE_BITMAP(allowed_features, KVM_VCPU_MAX_FEATURES);
>  
>  	/* CTR_EL0 is always under host control, even for protected VMs. */
> -	hyp_vm->kvm.arch.ctr_el0 = host_kvm->arch.ctr_el0;
> +	hyp_vm->kvm.arch.id_regs.ctr_el0 = host_kvm->arch.id_regs.ctr_el0;
>  
>  	/* Preserve the vgic model so that GICv3 emulation works */
>  	hyp_vm->kvm.arch.vgic.vgic_model = host_kvm->arch.vgic.vgic_model;
> @@ -358,7 +358,7 @@ static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struc
>  			    KVM_VCPU_MAX_FEATURES);
>  
>  		if (test_bit(KVM_ARCH_FLAG_WRITABLE_IMP_ID_REGS, &host_arch_flags))
> -			hyp_vm->kvm.arch.midr_el1 = host_kvm->arch.midr_el1;
> +			hyp_vm->kvm.arch.id_regs.midr_el1 = host_kvm->arch.id_regs.midr_el1;
>  
>  		return;
>  	}
> @@ -493,7 +493,8 @@ static int vm_copy_id_regs(struct pkvm_hyp_vcpu *hyp_vcpu)
>  	if (test_and_set_bit(KVM_ARCH_FLAG_ID_REGS_INITIALIZED, &kvm->arch.flags))
>  		return 0;
>  
> -	memcpy(kvm->arch.id_regs, host_kvm->arch.id_regs, sizeof(kvm->arch.id_regs));
> +	memcpy(kvm->arch.id_regs.normal, host_kvm->arch.id_regs.normal,
> +	       sizeof(kvm->arch.id_regs.normal));
>  
>  	return 0;
>  }
> diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> index b5a0de84ce01..e8d773d38905 100644
> --- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> +++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> @@ -292,7 +292,7 @@ static u64 read_id_reg(const struct kvm_vcpu *vcpu,
>  		return 0;
>  
>  	if (reg >= sys_reg(3, 0, 0, 1, 0) && reg <= sys_reg(3, 0, 0, 7, 7))
> -		return kvm->arch.id_regs[IDREG_IDX(reg)];
> +		return kvm->arch.id_regs.normal[IDREG_IDX(reg)];
>  
>  	return 0;
>  }
> @@ -543,7 +543,7 @@ void kvm_init_pvm_id_regs(struct kvm_vcpu *vcpu)
>  	 * for protected VMs.
>  	 */
>  	for (r = sys_reg(3, 0, 0, 4, 0); r <= sys_reg(3, 0, 0, 7, 7); r += sys_reg(0, 0, 0, 0, 1))
> -		ka->id_regs[IDREG_IDX(r)] = pvm_calc_id_reg(vcpu, r);
> +		ka->id_regs.normal[IDREG_IDX(r)] = pvm_calc_id_reg(vcpu, r);
>  
>  	set_bit(KVM_ARCH_FLAG_ID_REGS_INITIALIZED, &kvm->arch.flags);
>  }
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index b9aa892616ab..195ecdac7bd6 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -2477,7 +2477,7 @@ static int set_id_reg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *rd,
>  
>  void kvm_set_vm_id_reg(struct kvm *kvm, u32 reg, u64 val)
>  {
> -	u64 *p = __vm_id_reg(&kvm->arch, reg);
> +	u64 *p = __vm_id_reg(&kvm->arch.id_regs, reg);
>  
>  	lockdep_assert_held(&kvm->arch.config_lock);
>  
> -- 
> 2.53.0
> 

