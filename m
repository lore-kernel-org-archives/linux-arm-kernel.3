Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A0CA10775EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 17:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dmw6+ND0i3Tgc5H49KoXcUWeou2VGDngKb0Z59ruRas=; b=aQyJMN1DqnRMPkG0/6LQg3lbGZ
	/yIHXE4btjviBsCsbqMJOIkTc78D1dihZUC+XjwwG45CV4dY4BVYL3hjz85vVeHb0n0Rbla1JOjks
	4kKOGSgFt0Z1jTHztqD2V0tp1sMFut2BVns5txvptRXqasJA89W3FvN854l2UIkviV0Aoo8QH8H2M
	w6saK9GfMXtvFPYZqyGdm82kj84l5o5Wvb0gA3Npxn0K12fk/fkNDj+jmfY+HX61ZZ9+ALoSvkroK
	JCYzdjA8Qwc+uEEF4PTTa79cxHBh1FVQfoeNl2wzjwnSyhplYvd+QNoY07Q1/RngtyzFBB7tfHOk3
	vd/0wYbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ulf-000000095f0-23FO;
	Wed, 18 Mar 2026 17:33:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ulc-000000095eS-2mkp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 17:33:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6FD8960132;
	Wed, 18 Mar 2026 17:33:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C83ECC19421;
	Wed, 18 Mar 2026 17:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773855191;
	bh=QJlszcZHGIFt4K21Ef8xpEuAsYLi2gaetpWuoMp7Hd8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jGL4GeOuAyUieQOuwxKxh1vz3otFFx+HYvXWdI+VUUy4dvqGiz6YX0vgey3otGsZp
	 uF676AhLcMUf6S8U6FPIazE+zv3HCFwd0vgk8sben2sxnv0FEwXCmvyl71sKgS/RGx
	 kZXfxGNEEHoxP+HSGR1LBIWoOwU8Qv5gDHlD8csyKpuKkLOCiHZlP6oW00p1jr8yeO
	 qmfY90WKjs9hMAehPbrJqbUiDkBXf8R+/X/3fdr8j/Hmpa9JBGon09ehUpjIPHAWVl
	 DcjjJMas3U5Z5mqiFVjwMPHPITZjypptBKnZyxltVNrp3pfuo+fJxjeB0RGNcNX2EU
	 yaVKUmcI8S4yA==
Date: Wed, 18 Mar 2026 17:33:23 +0000
From: Jean-Philippe Brucker <jpb@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>,
	Fuad Tabba <tabba@google.com>, Mark Rutland <mark.rutland@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v10 08/30] KVM: arm64: Rename SVE finalization constants
 to be more general
Message-ID: <20260318173323.GF2390801@myrica>
References: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
 <20260306-kvm-arm64-sme-v10-8-43f7683a0fb7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306-kvm-arm64-sme-v10-8-43f7683a0fb7@kernel.org>
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

On Fri, Mar 06, 2026 at 05:01:00PM +0000, Mark Brown wrote:
> Due to the overlap between SVE and SME vector length configuration
> created by streaming mode SVE we will finalize both at once.  Rename the
> existing finalization to use _VEC (vector) for the naming to avoid
> confusion.
> 
> Since this includes the userspace API we create an alias
> KVM_ARM_VCPU_VEC for the existing KVM_ARM_VCPU_SVE capability, existing
> code which does not enable SME will be unaffected and any SME only code
> will not need to use SVE constants.
> 
> No functional change.
> 
> Reviewed-by: Fuad Tabba <tabba@google.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Jean-Philippe Brucker <jpb@kernel.org>

> ---
>  arch/arm64/include/asm/kvm_host.h |  8 +++++---
>  arch/arm64/include/uapi/asm/kvm.h |  6 ++++++
>  arch/arm64/kvm/guest.c            | 10 +++++-----
>  arch/arm64/kvm/hyp/nvhe/pkvm.c    |  2 +-
>  arch/arm64/kvm/reset.c            | 20 ++++++++++----------
>  5 files changed, 27 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 3e7247b3890c..656464179ba8 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -1012,8 +1012,8 @@ struct kvm_vcpu_arch {
>  
>  /* KVM_ARM_VCPU_INIT completed */
>  #define VCPU_INITIALIZED	__vcpu_single_flag(cflags, BIT(0))
> -/* SVE config completed */
> -#define VCPU_SVE_FINALIZED	__vcpu_single_flag(cflags, BIT(1))
> +/* Vector config completed */
> +#define VCPU_VEC_FINALIZED	__vcpu_single_flag(cflags, BIT(1))
>  /* pKVM VCPU setup completed */
>  #define VCPU_PKVM_FINALIZED	__vcpu_single_flag(cflags, BIT(2))
>  
> @@ -1086,6 +1086,8 @@ struct kvm_vcpu_arch {
>  #define vcpu_has_sve(vcpu)	kvm_has_sve((vcpu)->kvm)
>  #endif
>  
> +#define vcpu_has_vec(vcpu) vcpu_has_sve(vcpu)
> +
>  #ifdef CONFIG_ARM64_PTR_AUTH
>  #define vcpu_has_ptrauth(vcpu)						\
>  	((cpus_have_final_cap(ARM64_HAS_ADDRESS_AUTH) ||		\
> @@ -1482,7 +1484,7 @@ struct kvm *kvm_arch_alloc_vm(void);
>  int kvm_arm_vcpu_finalize(struct kvm_vcpu *vcpu, int feature);
>  bool kvm_arm_vcpu_is_finalized(struct kvm_vcpu *vcpu);
>  
> -#define kvm_arm_vcpu_sve_finalized(vcpu) vcpu_get_flag(vcpu, VCPU_SVE_FINALIZED)
> +#define kvm_arm_vcpu_vec_finalized(vcpu) vcpu_get_flag(vcpu, VCPU_VEC_FINALIZED)
>  
>  #define kvm_has_mte(kvm)					\
>  	(system_supports_mte() &&				\
> diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
> index a792a599b9d6..c67564f02981 100644
> --- a/arch/arm64/include/uapi/asm/kvm.h
> +++ b/arch/arm64/include/uapi/asm/kvm.h
> @@ -107,6 +107,12 @@ struct kvm_regs {
>  #define KVM_ARM_VCPU_HAS_EL2		7 /* Support nested virtualization */
>  #define KVM_ARM_VCPU_HAS_EL2_E2H0	8 /* Limit NV support to E2H RES0 */
>  
> +/*
> + * An alias for _SVE since we finalize VL configuration for both SVE and SME
> + * simultaneously.
> + */
> +#define KVM_ARM_VCPU_VEC		KVM_ARM_VCPU_SVE
> +
>  struct kvm_vcpu_init {
>  	__u32 target;
>  	__u32 features[7];
> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> index 1c87699fd886..d15aa2da1891 100644
> --- a/arch/arm64/kvm/guest.c
> +++ b/arch/arm64/kvm/guest.c
> @@ -342,7 +342,7 @@ static int set_sve_vls(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>  	if (!vcpu_has_sve(vcpu))
>  		return -ENOENT;
>  
> -	if (kvm_arm_vcpu_sve_finalized(vcpu))
> +	if (kvm_arm_vcpu_vec_finalized(vcpu))
>  		return -EPERM; /* too late! */
>  
>  	if (WARN_ON(vcpu->arch.sve_state))
> @@ -497,7 +497,7 @@ static int get_sve_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>  	if (ret)
>  		return ret;
>  
> -	if (!kvm_arm_vcpu_sve_finalized(vcpu))
> +	if (!kvm_arm_vcpu_vec_finalized(vcpu))
>  		return -EPERM;
>  
>  	if (copy_to_user(uptr, vcpu->arch.sve_state + region.koffset,
> @@ -523,7 +523,7 @@ static int set_sve_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>  	if (ret)
>  		return ret;
>  
> -	if (!kvm_arm_vcpu_sve_finalized(vcpu))
> +	if (!kvm_arm_vcpu_vec_finalized(vcpu))
>  		return -EPERM;
>  
>  	if (copy_from_user(vcpu->arch.sve_state + region.koffset, uptr,
> @@ -599,7 +599,7 @@ static unsigned long num_sve_regs(const struct kvm_vcpu *vcpu)
>  		return 0;
>  
>  	/* Policed by KVM_GET_REG_LIST: */
> -	WARN_ON(!kvm_arm_vcpu_sve_finalized(vcpu));
> +	WARN_ON(!kvm_arm_vcpu_vec_finalized(vcpu));
>  
>  	return slices * (SVE_NUM_PREGS + SVE_NUM_ZREGS + 1 /* FFR */)
>  		+ 1; /* KVM_REG_ARM64_SVE_VLS */
> @@ -617,7 +617,7 @@ static int copy_sve_reg_indices(const struct kvm_vcpu *vcpu,
>  		return 0;
>  
>  	/* Policed by KVM_GET_REG_LIST: */
> -	WARN_ON(!kvm_arm_vcpu_sve_finalized(vcpu));
> +	WARN_ON(!kvm_arm_vcpu_vec_finalized(vcpu));
>  
>  	/*
>  	 * Enumerate this first, so that userspace can save/restore in
> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> index 2f029bfe4755..24acbe5594e2 100644
> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> @@ -445,7 +445,7 @@ static int pkvm_vcpu_init_sve(struct pkvm_hyp_vcpu *hyp_vcpu, struct kvm_vcpu *h
>  	int ret = 0;
>  
>  	if (!vcpu_has_feature(vcpu, KVM_ARM_VCPU_SVE)) {
> -		vcpu_clear_flag(vcpu, VCPU_SVE_FINALIZED);
> +		vcpu_clear_flag(vcpu, VCPU_VEC_FINALIZED);
>  		return 0;
>  	}
>  
> diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
> index 959532422d3a..f7c63e145d54 100644
> --- a/arch/arm64/kvm/reset.c
> +++ b/arch/arm64/kvm/reset.c
> @@ -92,7 +92,7 @@ static void kvm_vcpu_enable_sve(struct kvm_vcpu *vcpu)
>   * Finalize vcpu's maximum SVE vector length, allocating
>   * vcpu->arch.sve_state as necessary.
>   */
> -static int kvm_vcpu_finalize_sve(struct kvm_vcpu *vcpu)
> +static int kvm_vcpu_finalize_vec(struct kvm_vcpu *vcpu)
>  {
>  	void *buf;
>  	unsigned int vl;
> @@ -122,21 +122,21 @@ static int kvm_vcpu_finalize_sve(struct kvm_vcpu *vcpu)
>  	}
>  	
>  	vcpu->arch.sve_state = buf;
> -	vcpu_set_flag(vcpu, VCPU_SVE_FINALIZED);
> +	vcpu_set_flag(vcpu, VCPU_VEC_FINALIZED);
>  	return 0;
>  }
>  
>  int kvm_arm_vcpu_finalize(struct kvm_vcpu *vcpu, int feature)
>  {
>  	switch (feature) {
> -	case KVM_ARM_VCPU_SVE:
> -		if (!vcpu_has_sve(vcpu))
> +	case KVM_ARM_VCPU_VEC:
> +		if (!vcpu_has_vec(vcpu))
>  			return -EINVAL;
>  
> -		if (kvm_arm_vcpu_sve_finalized(vcpu))
> +		if (kvm_arm_vcpu_vec_finalized(vcpu))
>  			return -EPERM;
>  
> -		return kvm_vcpu_finalize_sve(vcpu);
> +		return kvm_vcpu_finalize_vec(vcpu);
>  	}
>  
>  	return -EINVAL;
> @@ -144,7 +144,7 @@ int kvm_arm_vcpu_finalize(struct kvm_vcpu *vcpu, int feature)
>  
>  bool kvm_arm_vcpu_is_finalized(struct kvm_vcpu *vcpu)
>  {
> -	if (vcpu_has_sve(vcpu) && !kvm_arm_vcpu_sve_finalized(vcpu))
> +	if (vcpu_has_vec(vcpu) && !kvm_arm_vcpu_vec_finalized(vcpu))
>  		return false;
>  
>  	return true;
> @@ -163,7 +163,7 @@ void kvm_arm_vcpu_destroy(struct kvm_vcpu *vcpu)
>  	kfree(vcpu->arch.ccsidr);
>  }
>  
> -static void kvm_vcpu_reset_sve(struct kvm_vcpu *vcpu)
> +static void kvm_vcpu_reset_vec(struct kvm_vcpu *vcpu)
>  {
>  	if (vcpu_has_sve(vcpu))
>  		memset(vcpu->arch.sve_state, 0, vcpu_sve_state_size(vcpu));
> @@ -203,11 +203,11 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
>  	if (loaded)
>  		kvm_arch_vcpu_put(vcpu);
>  
> -	if (!kvm_arm_vcpu_sve_finalized(vcpu)) {
> +	if (!kvm_arm_vcpu_vec_finalized(vcpu)) {
>  		if (vcpu_has_feature(vcpu, KVM_ARM_VCPU_SVE))
>  			kvm_vcpu_enable_sve(vcpu);
>  	} else {
> -		kvm_vcpu_reset_sve(vcpu);
> +		kvm_vcpu_reset_vec(vcpu);
>  	}
>  
>  	if (vcpu_el1_is_32bit(vcpu))
> 
> -- 
> 2.47.3
> 
> 

