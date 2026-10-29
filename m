Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03870606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 17:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1pNpjIHt;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BvIzDU88
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=C1qVyaNAsqSgFRygYkb470TRs5P9I5eHBZ1RH/YvP80=; b=1pNpjIHtJmi5kP4g/svyloiSr5
	yoyj4gi8T/xnDNKeCi82VTQgU1gk/MzU0FnyWk8Va137Rq7b4+LhZbMDhivkZIDeTONdslKY1APaZ
	o5IEEmxg1zBobjp06ixzGdBKjS6VCkwzJrNqYKOBmyLYBaxp9rwC2kYIz0R7aFtJHz0PtNoA85I6z
	NO48qTki6kQbWPZmmHnArhgVPPBYHtNIGhhAXL7/2fHUZH9zilXggpJdOyBRiUvX5oxE2NkzS5LuY
	KJLgrRAKGDQ1Bh/dwB3o7omqB33QzfcFRwpGQCP2q+rjvRwwIFmHrHMCg4k9xG68o9Dmzi0jwkXih
	gbilWKuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMUEJ-0000000A0gc-3DXI;
	Thu, 29 Oct 2026 17:47:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMUEI-0000000A0gR-21WL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 17:47:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4139E436E5;
	Thu, 29 Oct 2026 17:47:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1D3F1F01824;
	Thu, 29 Oct 2026 17:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793296078;
	bh=C1qVyaNAsqSgFRygYkb470TRs5P9I5eHBZ1RH/YvP80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BvIzDU88haRFrjaB++4TIsTwsVPuSqyVnjza8CGYJg9xF1YgdDFo7r07B9J5ucUnr
	 MVRDEd9aloSA/hwWIauZ/kHAJesCuCJoSljiUZKwddOfOMgK8ijk5hwMhLNUul3DFY
	 vB5a1qIEtaLfewyE04hEi1WSiV4tNaVShlu1wRvWCRVDK+4B32o+flVsb9N8geCt/I
	 XJyqYmqOL5n3Ey58r8SRTdgbLB4l/2vccEjUy2g28bbdrIt66VnX3hzksSgvaNaaK1
	 qmzwXuujBtJzbWbseYmcz6miy9LYwj3S23pMd77suWmt7SrN8didHiIhVPgjHqOPeQ
	 HFx4VxtsMrwpQ==
Date: Thu, 29 Oct 2026 17:47:52 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, fuad.tabba@linux.dev, 
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	will@kernel.org, mark.rutland@arm.com, linux-perf-users@vger.kernel.org, 
	catalin.marinas@arm.com, james.clark@linaro.org
Subject: Re: [RFC PATCH v7 18/28] KVM: arm64: config: Use functions from
 spe.c to test FEAT_SPE_{FnE,FDS}
Message-ID: <auOBFeXOmUYNHeAV@gremlin>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
 <20260903160623.315525-19-alexandru.elisei@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903160623.315525-19-alexandru.elisei@arm.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Sep 03, 2026 at 05:06:13PM +0100, Alexandru Elisei wrote:
> KVM's FGU mechanism will trap the registers introduced by FEAT_SPE_FnE and
> FEAT_SPE_FDS if the feature is not present for the VM. Move the functions
> that check for the presence of these features out of config.c and into
> spe.c, since that's where the bulk of SPE virtualization lies.
>
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>

Aside from naming nit below, LGTM and:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  arch/arm64/include/asm/kvm_spe.h | 11 +++++++++++
>  arch/arm64/kvm/config.c          | 30 +++++-------------------------
>  arch/arm64/kvm/spe.c             | 22 ++++++++++++++++++++++
>  3 files changed, 38 insertions(+), 25 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_spe.h b/arch/arm64/include/asm/kvm_spe.h
> index 3d8e9720daca..618051dcf59f 100644
> --- a/arch/arm64/include/asm/kvm_spe.h
> +++ b/arch/arm64/include/asm/kvm_spe.h
> @@ -43,6 +43,9 @@ u8 kvm_spe_get_pmsver(struct kvm *kvm);
>
>  bool kvm_spe_write_sysreg(struct kvm_vcpu *vcpu, int reg, u64 val);
>  u64 kvm_spe_read_sysreg(struct kvm_vcpu *vcpu, int reg);
> +
> +bool kvm_spe_has_feat_spe_fne(struct kvm *kvm);
> +bool kvm_spe_has_feat_spe_fds(struct kvm *kvm);

These both say spe twice, can probably cut the 2nd one in each case I think
:) Could you drop the 'feat' too, kvm_spe_has_fne() and kvm_spe_has_fds()
seem better!

>  #else
>  struct kvm_spe {
>  };
> @@ -99,6 +102,14 @@ static inline u64 kvm_spe_read_sysreg(struct kvm_vcpu *vcpu, int reg)
>  {
>  	return 0;
>  }
> +static inline bool kvm_spe_has_feat_spe_fne(struct kvm *kvm)
> +{
> +	return false;
> +}
> +static inline bool kvm_spe_has_feat_spe_fds(struct kvm *kvm)
> +{
> +	return false;
> +}
>  #endif /* CONFIG_KVM_ARM_SPE */
>
>  #endif /* __ARM64_KVM_SPE_H__ */
> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
> index 1053676551af..78e414ed736d 100644
> --- a/arch/arm64/kvm/config.c
> +++ b/arch/arm64/kvm/config.c
> @@ -7,6 +7,7 @@
>  #include <linux/kvm_host.h>
>  #include <asm/kvm_emulate.h>
>  #include <asm/kvm_nested.h>
> +#include <asm/kvm_spe.h>
>  #include <asm/sysreg.h>
>
>  /*
> @@ -159,7 +160,6 @@ struct reg_feat_map_desc {
>  #define FEAT_GICv3		ID_AA64PFR0_EL1, GIC, IMP
>  #define FEAT_LOR		ID_AA64MMFR1_EL1, LO, IMP
>  #define FEAT_SPEv1p2		ID_AA64DFR0_EL1, PMSVer, V1P2
> -#define FEAT_SPEv1p4		ID_AA64DFR0_EL1, PMSVer, V1P4
>  #define FEAT_SPEv1p5		ID_AA64DFR0_EL1, PMSVer, V1P5
>  #define FEAT_ATS1A		ID_AA64ISAR2_EL1, ATS1A, IMP
>  #define FEAT_SPECRES2		ID_AA64ISAR1_EL1, SPECRES, COSP_RCTX
> @@ -292,26 +292,6 @@ static bool feat_sme_smps(struct kvm *kvm)
>  		(read_sysreg_s(SYS_SMIDR_EL1) & SMIDR_EL1_SMPS));
>  }
>
> -static bool feat_spe_fds(struct kvm *kvm)
> -{
> -	/*
> -	 * Revisit this if KVM ever supports SPE -- this really should
> -	 * look at the guest's view of PMSIDR_EL1.
> -	 */
> -	return (kvm_has_feat(kvm, FEAT_SPEv1p4) &&
> -		(read_sysreg_s(SYS_PMSIDR_EL1) & PMSIDR_EL1_FDS));
> -}
> -
> -static bool feat_spe_fne(struct kvm *kvm)
> -{
> -	/*
> -	 * Revisit this if KVM ever supports SPE -- this really should
> -	 * look at the guest's view of PMSIDR_EL1.
> -	 */
> -	return (kvm_has_feat(kvm, FEAT_SPEv1p2) &&
> -		(read_sysreg_s(SYS_PMSIDR_EL1) & PMSIDR_EL1_FnE));
> -}
> -
>  static bool feat_trbe_mpam(struct kvm *kvm)
>  {
>  	/*
> @@ -547,7 +527,7 @@ static const struct reg_bits_to_feat_map hdfgrtr_feat_map[] = {
>  		   HDFGRTR_EL2_PMBPTR_EL1	|
>  		   HDFGRTR_EL2_PMBLIMITR_EL1,
>  		   FEAT_SPE),
> -	NEEDS_FEAT(HDFGRTR_EL2_nPMSNEVFR_EL1, feat_spe_fne),
> +	NEEDS_FEAT(HDFGRTR_EL2_nPMSNEVFR_EL1, kvm_spe_has_feat_spe_fne),
>  	NEEDS_FEAT(HDFGRTR_EL2_nBRBDATA		|
>  		   HDFGRTR_EL2_nBRBCTL		|
>  		   HDFGRTR_EL2_nBRBIDR,
> @@ -615,7 +595,7 @@ static const struct reg_bits_to_feat_map hdfgwtr_feat_map[] = {
>  		   HDFGWTR_EL2_PMBPTR_EL1	|
>  		   HDFGWTR_EL2_PMBLIMITR_EL1,
>  		   FEAT_SPE),
> -	NEEDS_FEAT(HDFGWTR_EL2_nPMSNEVFR_EL1, feat_spe_fne),
> +	NEEDS_FEAT(HDFGWTR_EL2_nPMSNEVFR_EL1, kvm_spe_has_feat_spe_fne),
>  	NEEDS_FEAT(HDFGWTR_EL2_nBRBDATA		|
>  		   HDFGWTR_EL2_nBRBCTL,
>  		   FEAT_BRBE),
> @@ -851,7 +831,7 @@ static const struct reg_bits_to_feat_map hdfgrtr2_feat_map[] = {
>  		   HDFGRTR2_EL2_nPMSSDATA,
>  		   FEAT_PMUv3_SS),
>  	NEEDS_FEAT(HDFGRTR2_EL2_nPMIAR_EL1, FEAT_SEBEP),
> -	NEEDS_FEAT(HDFGRTR2_EL2_nPMSDSFR_EL1, feat_spe_fds),
> +	NEEDS_FEAT(HDFGRTR2_EL2_nPMSDSFR_EL1, kvm_spe_has_feat_spe_fds),
>  	NEEDS_FEAT(HDFGRTR2_EL2_nPMBMAR_EL1, FEAT_SPE_nVM),
>  	NEEDS_FEAT(HDFGRTR2_EL2_nSPMACCESSR_EL1	|
>  		   HDFGRTR2_EL2_nSPMCNTEN	|
> @@ -884,7 +864,7 @@ static const struct reg_bits_to_feat_map hdfgwtr2_feat_map[] = {
>  		   feat_pmuv3p9),
>  	NEEDS_FEAT(HDFGWTR2_EL2_nPMSSCR_EL1, FEAT_PMUv3_SS),
>  	NEEDS_FEAT(HDFGWTR2_EL2_nPMIAR_EL1, FEAT_SEBEP),
> -	NEEDS_FEAT(HDFGWTR2_EL2_nPMSDSFR_EL1, feat_spe_fds),
> +	NEEDS_FEAT(HDFGWTR2_EL2_nPMSDSFR_EL1, kvm_spe_has_feat_spe_fds),
>  	NEEDS_FEAT(HDFGWTR2_EL2_nPMBMAR_EL1, FEAT_SPE_nVM),
>  	NEEDS_FEAT(HDFGWTR2_EL2_nSPMACCESSR_EL1	|
>  		   HDFGWTR2_EL2_nSPMCNTEN	|
> diff --git a/arch/arm64/kvm/spe.c b/arch/arm64/kvm/spe.c
> index 8c173a1f48bd..3b285b45332b 100644
> --- a/arch/arm64/kvm/spe.c
> +++ b/arch/arm64/kvm/spe.c
> @@ -113,6 +113,28 @@ void kvm_spe_destroy_vm(struct kvm *kvm)
>  	module_put(spe_pmu->pmu.module);
>  }
>
> +bool kvm_spe_has_feat_spe_fds(struct kvm *kvm)
> +{
> +	struct arm_spe_pmu *spe_pmu = kvm->arch.kvm_spe.spe_pmu;
> +
> +	if (!spe_pmu)
> +		return false;
> +
> +	return kvm_has_feat(kvm, ID_AA64DFR0_EL1, PMSVer, V1P4) &&
> +	       FIELD_GET(PMSIDR_EL1_FDS, spe_pmu->pmsidr_el1);
> +}
> +
> +bool kvm_spe_has_feat_spe_fne(struct kvm *kvm)
> +{
> +	struct arm_spe_pmu *spe_pmu = kvm->arch.kvm_spe.spe_pmu;
> +
> +	if (!spe_pmu)
> +		return false;
> +
> +	return kvm_has_feat(kvm, ID_AA64DFR0_EL1, PMSVer, V1P2) &&
> +	       FIELD_GET(PMSIDR_EL1_FnE, spe_pmu->pmsidr_el1);
> +}
> +
>  bool kvm_spe_write_sysreg(struct kvm_vcpu *vcpu, int reg, u64 val)
>  {
>  	struct kvm_spe *kvm_spe = &vcpu->kvm->arch.kvm_spe;
> --
> 2.43.0
>
>

--
Cheers, Lorenzo

