Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E9F610775F9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 17:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bkaRCesCTiqKngTcA7P2cuN+wqvjhjhDSY9+JE2zjaY=; b=RGcnabcgn2pgmMHyZcwGN8wgPp
	gDHxVSp3mIslN1ZRlDFCHMZV5jNpBI+ud3NYmKm8D2ojq485bHrh9jyOwu3XQ+o6PIcmV87m2/0iC
	Ub8qrNjHzYjxLcxbDbE+i1Nh2+AIDP1E5l0f61SomUPQZ7yyg4gZRe4PVazu5FBlxv8Saz323i8P/
	Np7madGp64+YsmyrDg+pxNTASeKK2bqScZjxyXdxkihmpFuvK+f9QeuRGFHo8JEmDUwwjY9AdbwMu
	ONzGpGNzhI1rnE+VzJCdFc+7QqnDwxezL3Upt4P6CnMA5agxRJIezH/hmubyKGzDgS/jzpErIe1MJ
	jSEWnTPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2uw5-000000096gC-1Joq;
	Wed, 18 Mar 2026 17:44:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2uw1-000000096fk-3NlO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 17:44:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 28A364067D;
	Wed, 18 Mar 2026 17:43:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 160C6C19421;
	Wed, 18 Mar 2026 17:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773855837;
	bh=8j5ISp0xYhKYamM4gdwPaX+j/ehel7TMQlVsm04pGYo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TYWwi0HJz0iAl7z0DezpAO2th+uEsjsMXkAbRQOwZZSGB/y3WQ1eDTfNlXXhYsvxp
	 nrQeRLvq2Rin9Onb7GiiOV0AtP07eEjoEkDv297OJ/Ea09/OLhmSCwveJ6++AKoCnl
	 +fFgsFVBb4UwCMPk7iSjs0TMAyZxIja06L6APXPBKjOWr4GSavFqyw6iN4DfjxRcON
	 R5iYGcQujuEVIUHiGSoK1MQlznw3Q/9uK7eRur2p1zwKWSJyYEtrHqNLVPLCihS5ia
	 tu4Hd1oR5jhFMskQ6TUuusdhJYCRhOmK68TLRY+TyJwxe4dh/5fhe/ACNLRqGOClCP
	 gqg0B3Zbfr+CQ==
Date: Wed, 18 Mar 2026 17:44:10 +0000
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
Subject: Re: [PATCH v10 09/30] KVM: arm64: Define internal features for SME
Message-ID: <20260318174410.GG2390801@myrica>
References: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
 <20260306-kvm-arm64-sme-v10-9-43f7683a0fb7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306-kvm-arm64-sme-v10-9-43f7683a0fb7@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_104358_606485_6F9DC4C5 
X-CRM114-Status: GOOD (  24.16  )
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

On Fri, Mar 06, 2026 at 05:01:01PM +0000, Mark Brown wrote:
> In order to simplify interdependencies in the rest of the series define
> the feature detection for SME and its subfeatures.  Due to the need for
> vector length configuration we define a flag for SME like for SVE.  We
> also have two subfeatures which add architectural state, FA64 and SME2,
> which are configured via the normal ID register scheme.
> 
> Also provide helpers which check if the vCPU is in streaming mode or has
> ZA enabled.
> 
> Reviewed-by: Fuad Tabba <tabba@google.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_host.h | 35 ++++++++++++++++++++++++++++++++++-
>  arch/arm64/kvm/sys_regs.c         |  2 +-
>  2 files changed, 35 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 656464179ba8..906dbefc5b33 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -353,6 +353,8 @@ struct kvm_arch {
>  #define KVM_ARCH_FLAG_WRITABLE_IMP_ID_REGS		10
>  	/* Unhandled SEAs are taken to userspace */
>  #define KVM_ARCH_FLAG_EXIT_SEA				11
> +	/* SME exposed to guest */
> +#define KVM_ARCH_FLAG_GUEST_HAS_SME			12
>  	unsigned long flags;
>  
>  	/* VM-wide vCPU feature set */
> @@ -1086,7 +1088,16 @@ struct kvm_vcpu_arch {
>  #define vcpu_has_sve(vcpu)	kvm_has_sve((vcpu)->kvm)
>  #endif
>  
> -#define vcpu_has_vec(vcpu) vcpu_has_sve(vcpu)
> +#define kvm_has_sme(kvm)	(system_supports_sme() &&		\
> +				 test_bit(KVM_ARCH_FLAG_GUEST_HAS_SME, &(kvm)->arch.flags))

Can the GUEST_HAS_SME flag ever be set if !system_supports_sme()?  Seems
like it depends on KVM_ARM_VCPU_SME feature which can't be set if the
system doesn't support it, so the system_supports_sme() check is redundant

> +
> +#ifdef __KVM_NVHE_HYPERVISOR__
> +#define vcpu_has_sme(vcpu)	kvm_has_sme(kern_hyp_va((vcpu)->kvm))
> +#else
> +#define vcpu_has_sme(vcpu)	kvm_has_sme((vcpu)->kvm)
> +#endif
> +
> +#define vcpu_has_vec(vcpu) (vcpu_has_sve(vcpu) || vcpu_has_sme(vcpu))
>  
>  #ifdef CONFIG_ARM64_PTR_AUTH
>  #define vcpu_has_ptrauth(vcpu)						\
> @@ -1627,6 +1638,28 @@ void kvm_set_vm_id_reg(struct kvm *kvm, u32 reg, u64 val);
>  #define kvm_has_sctlr2(k)				\
>  	(kvm_has_feat((k), ID_AA64MMFR3_EL1, SCTLRX, IMP))
>  
> +#define kvm_has_fa64(k)					\
> +	(system_supports_fa64() &&			\
> +	 kvm_has_feat((k), ID_AA64SMFR0_EL1, FA64, IMP))
> +
> +#define kvm_has_sme2(k)					\
> +	(system_supports_sme2() &&			\
> +	 kvm_has_feat((k), ID_AA64PFR1_EL1, SME, SME2))

Similarly it looks like KVM already prevents setting these features if the
cpufeatures value doesn't have them, so the system_supports* checks are
redundant?

Thanks,
Jean

> +
> +#ifdef __KVM_NVHE_HYPERVISOR__
> +#define vcpu_has_sme2(vcpu)	kvm_has_sme2(kern_hyp_va((vcpu)->kvm))
> +#define vcpu_has_fa64(vcpu)	kvm_has_fa64(kern_hyp_va((vcpu)->kvm))
> +#else
> +#define vcpu_has_sme2(vcpu)	kvm_has_sme2((vcpu)->kvm)
> +#define vcpu_has_fa64(vcpu)	kvm_has_fa64((vcpu)->kvm)
> +#endif
> +
> +#define vcpu_in_streaming_mode(vcpu) \
> +	(__vcpu_sys_reg(vcpu, SVCR) & SVCR_SM_MASK)
> +
> +#define vcpu_za_enabled(vcpu) \
> +	(__vcpu_sys_reg(vcpu, SVCR) & SVCR_ZA_MASK)
> +
>  static inline bool kvm_arch_has_irq_bypass(void)
>  {
>  	return true;
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 1b4cacb6e918..f94fe57adcad 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -1948,7 +1948,7 @@ static unsigned int sve_visibility(const struct kvm_vcpu *vcpu,
>  static unsigned int sme_visibility(const struct kvm_vcpu *vcpu,
>  				   const struct sys_reg_desc *rd)
>  {
> -	if (kvm_has_feat(vcpu->kvm, ID_AA64PFR1_EL1, SME, IMP))
> +	if (vcpu_has_sme(vcpu))
>  		return 0;
>  
>  	return REG_HIDDEN;
> 
> -- 
> 2.47.3
> 
> 

