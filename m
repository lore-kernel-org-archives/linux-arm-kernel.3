Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2A4606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 12:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WbZ5kulE;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=PIZ/WQPn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eQmQECDJWHvO2kywZft/qBs1hdVqb5TuQeF4KeKH0xE=; b=WbZ5kulE5S44gylZ2dOg2fC0J4
	NTqeI3PBjN6Pf67W4C1LCHVlpTEq4hUcqo02iuh6LROhYhx4wBdC7FylonLmkER3yj1D2j6HEGarV
	JAPEJlrAvBgLXT0cE2rhXrhPTBLPdFMv+jkJV2Xgm8M7/RiDiAM9awxk6RwpVWnI/U/jV7WHw0KhF
	QKXpCM5poo5M2gDObkBcIw5wB3C9pVwKbHgdfn4nuoizWqBY3ttZXo0vWCHMhLqObA0Gwu56skw/3
	aemCXf4sBC1sKOodLniiT7AQP1JoOEOTRNguwvFIVEPCqWb1gePfwLArR6ZLuQiakE/O8RUZJVRMw
	w0lirq1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPPE-00000009DaB-3Nyd;
	Thu, 29 Oct 2026 12:38:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPP4-00000009DRc-3jk8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 12:38:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E11F1682;
	Thu, 29 Oct 2026 05:38:41 -0700 (PDT)
Received: from e143914.arm.com (e143914.arm.com [10.2.213.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2BD4B3F673;
	Thu, 29 Oct 2026 05:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793277524; bh=5Ohowt5GpvCq73G4D7RyNV1azF5WSg2W9v5c047K+uY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PIZ/WQPnaAiPAJ8YMlVfqT/5txKEid+kjPXMwOoYS4LtAwnRhNd0RyPa4rDoYP5ze
	 zWce3D5nc5Q35Az1u3s99o+0jug2TIiohTxnNsCtomHQNw34o8QyD0GY74dS5Yb4t0
	 +nn6V8FvTIp9vq9JWpYrrfNH0jj32LEW04QwbqrE=
Date: Thu, 29 Oct 2026 12:38:38 +0000
From: Joey Gouly <joey.gouly@arm.com>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	James Clark <james.clark@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Thomas Huth <thuth@redhat.com>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
Subject: Re: [PATCH v2 4/4] KVM: arm64: Convert TCR_EL2 to config-driven
 sanitisation
Message-ID: <auM-TnZ0i_1G01ad@e143914.arm.com>
References: <20260917214215.74135-1-weilin.chang@arm.com>
 <20260917214215.74135-5-weilin.chang@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917214215.74135-5-weilin.chang@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_053847_136424_A80C27A2 
X-CRM114-Status: GOOD (  27.70  )
X-Spam-Score: -4.4 (----)
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

On Thu, Sep 17, 2026 at 10:42:14PM +0100, Wei-Lin Chang wrote:
> Feature dependencies of the fields in TCR_EL2 are extracted from
> Registers.json of the BSD licenced AARCHMRS
> (AARCHMRS_OPENSOURCE_A_profile_FAT-2026-06).
> 
> Places where we slightly deviate from the above:
> 
>  - Stick to the ARM ARM M.c requirement for TCR_EL2.TCMA*, which only
>    depends on FEAT_MTE2. This avoids updating ID_AA64PFR2_EL1 with new
>    VMTE* definitions that we don't know the meaning of, as they aren't
>    present in the ARM ARM yet.
> 
>  - Ignore TCR_EL2.DS's requirement of needing the effective value of
>    TCR2_EL2.D128 be 0. This requires runtime detection of TCR2_EL2.D128
>    and we don't have D128 support yet.
> 
>  - TCR_EL2.AS is dependent on FEAT_ASID16, this information is missing
>    from the json.

In the 2026-9 release, FEAT_ASID16 is now there for TCR_EL2.AS.
Otherwise I think this matches the newer release.

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

Thanks,
Joey

> 
> Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
> ---
>  arch/arm64/include/asm/kvm_host.h |   2 +-
>  arch/arm64/kvm/config.c           | 113 ++++++++++++++++++++++++++++++
>  arch/arm64/kvm/nested.c           |   4 ++
>  3 files changed, 118 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 27fe0cd5b2d7..6a5e22ca3430 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -516,7 +516,6 @@ enum vcpu_sysreg {
>  	HACR_EL2,	/* Hypervisor Auxiliary Control Register */
>  	TTBR0_EL2,	/* Translation Table Base Register 0 (EL2) */
>  	TTBR1_EL2,	/* Translation Table Base Register 1 (EL2) */
> -	TCR_EL2,	/* Translation Control Register (EL2) */
>  	PIRE0_EL2,	/* Permission Indirection Register 0 (EL2) */
>  	PIR_EL2,	/* Permission Indirection Register 1 (EL2) */
>  	POR_EL2,	/* Permission Overlay Register 2 (EL2) */
> @@ -541,6 +540,7 @@ enum vcpu_sysreg {
>  	/* Anything from this can be RES0/RES1 sanitised */
>  	MARKER(__SANITISED_REG_START__),
>  	SCTLR_EL2,	/* System Control Register (EL2) */
> +	TCR_EL2,	/* Translation Control Register (EL2) */
>  	TCR2_EL2,	/* Extended Translation Control Register (EL2) */
>  	SCTLR2_EL2,	/* System Control Register 2 (EL2) */
>  	MDCR_EL2,	/* Monitor Debug Configuration Register (EL2) */
> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
> index 1053676551af..080b3510b783 100644
> --- a/arch/arm64/kvm/config.c
> +++ b/arch/arm64/kvm/config.c
> @@ -203,8 +203,11 @@ struct reg_feat_map_desc {
>  #define FEAT_CPA2		ID_AA64ISAR3_EL1, CPA, CPA2
>  #define FEAT_ASID2		ID_AA64MMFR4_EL1, ASID2, IMP
>  #define FEAT_MEC		ID_AA64MMFR3_EL1, MEC, IMP
> +#define FEAT_HAF		ID_AA64MMFR1_EL1, HAFDBS, AF
>  #define FEAT_HAFT		ID_AA64MMFR1_EL1, HAFDBS, HAFT
> +#define FEAT_HAFDBS		ID_AA64MMFR1_EL1, HAFDBS, DBM
>  #define FEAT_HDBSS		ID_AA64MMFR1_EL1, HAFDBS, HDBSS
> +#define FEAT_HPDS		ID_AA64MMFR1_EL1, HPDS, IMP
>  #define FEAT_HPDS2		ID_AA64MMFR1_EL1, HPDS, HPDS2
>  #define FEAT_BTI		ID_AA64PFR1_EL1, BT, IMP
>  #define FEAT_ExS		ID_AA64MMFR0_EL1, EXS, IMP
> @@ -215,6 +218,10 @@ struct reg_feat_map_desc {
>  #define FEAT_MixedEndEL0	ID_AA64MMFR0_EL1, BIGENDEL0, IMP
>  #define FEAT_MTE_ASYNC		ID_AA64PFR1_EL1, MTE_frac, ASYNC
>  #define FEAT_MTE_STORE_ONLY	ID_AA64PFR2_EL1, MTESTOREONLY, IMP
> +#define FEAT_MTE_CANONICAL_TAGS	ID_AA64PFR1_EL1, MTEX, MTE4
> +#define FEAT_MTE_NO_ADDRESS_TAGS	ID_AA64PFR1_EL1, MTEX, MTE4
> +#define FEAT_E0PD		ID_AA64MMFR2_EL1, E0PD, IMP
> +#define FEAT_SVE		ID_AA64PFR0_EL1, SVE, IMP
>  #define FEAT_PAN		ID_AA64MMFR1_EL1, PAN, IMP
>  #define FEAT_PAN3		ID_AA64MMFR1_EL1, PAN, PAN3
>  #define FEAT_SSBS		ID_AA64PFR1_EL1, SSBS, IMP
> @@ -227,6 +234,19 @@ struct reg_feat_map_desc {
>  #define FEAT_GCIE		ID_AA64PFR2_EL1, GCIE, IMP
>  #define FEAT_NV3		ID_AA64MMFR4_EL1, NV_frac, NV3
>  
> +static bool feat_asid16(struct kvm *kvm)
> +{
> +	return kvm_has_feat_enum(kvm, ID_AA64MMFR0_EL1, ASIDBITS, 16);
> +}
> +
> +static bool feat_mte_no_addr_tags_or_canonical_tags(struct kvm *kvm)
> +{
> +	bool no_addr_tags = kvm_has_feat(kvm, FEAT_MTE_NO_ADDRESS_TAGS);
> +	bool canonical_tags = kvm_has_feat(kvm, FEAT_MTE_CANONICAL_TAGS);
> +
> +	return no_addr_tags || canonical_tags;
> +}
> +
>  static bool not_feat_aa64el3(struct kvm *kvm)
>  {
>  	return !kvm_has_feat(kvm, FEAT_AA64EL3);
> @@ -1044,6 +1064,91 @@ static const struct reg_bits_to_feat_map sctlr2_feat_map[] = {
>  static const DECLARE_FEAT_MAP(sctlr2_desc, SCTLR2_EL1,
>  			      sctlr2_feat_map, FEAT_SCTLR2);
>  
> +static const struct reg_bits_to_feat_map vhe_tcr_el2_feat_map[] = {
> +	NEEDS_FEAT(VHE_TCR_EL2_MTX1	|
> +		   VHE_TCR_EL2_MTX0,
> +		   feat_mte_no_addr_tags_or_canonical_tags),
> +	NEEDS_FEAT(VHE_TCR_EL2_DS, feat_lpa2),
> +	NEEDS_FEAT(VHE_TCR_EL2_TCMA1	|
> +		   VHE_TCR_EL2_TCMA0,
> +		   FEAT_MTE2),
> +	NEEDS_FEAT(VHE_TCR_EL2_E0PD1	|
> +		   VHE_TCR_EL2_E0PD0,
> +		   FEAT_E0PD),
> +	NEEDS_FEAT(VHE_TCR_EL2_NFD1	|
> +		   VHE_TCR_EL2_NFD0,
> +		   FEAT_SVE),
> +	NEEDS_FEAT(VHE_TCR_EL2_TBID1	|
> +		   VHE_TCR_EL2_TBID0,
> +		   feat_pauth),
> +	NEEDS_FEAT(VHE_TCR_EL2_HWU162	|
> +		   VHE_TCR_EL2_HWU161	|
> +		   VHE_TCR_EL2_HWU160	|
> +		   VHE_TCR_EL2_HWU159	|
> +		   VHE_TCR_EL2_HWU062	|
> +		   VHE_TCR_EL2_HWU061	|
> +		   VHE_TCR_EL2_HWU060	|
> +		   VHE_TCR_EL2_HWU059,
> +		   FEAT_HPDS2),
> +	NEEDS_FEAT(VHE_TCR_EL2_HPD1	|
> +		   VHE_TCR_EL2_HPD0,
> +		   FEAT_HPDS),
> +	NEEDS_FEAT(VHE_TCR_EL2_HD, FEAT_HAFDBS),
> +	NEEDS_FEAT(VHE_TCR_EL2_HA, FEAT_HAF),
> +	NEEDS_FEAT(VHE_TCR_EL2_AS, feat_asid16),
> +	NEEDS_FEAT(VHE_TCR_EL2_TBI1		|
> +		   VHE_TCR_EL2_TBI0		|
> +		   VHE_TCR_EL2_IPS		|
> +		   VHE_TCR_EL2_TG1		|
> +		   VHE_TCR_EL2_SH1		|
> +		   VHE_TCR_EL2_ORGN1		|
> +		   VHE_TCR_EL2_IRGN1		|
> +		   VHE_TCR_EL2_EPD1		|
> +		   VHE_TCR_EL2_A1		|
> +		   VHE_TCR_EL2_T1SZ		|
> +		   VHE_TCR_EL2_TG0		|
> +		   VHE_TCR_EL2_SH0		|
> +		   VHE_TCR_EL2_ORGN0		|
> +		   VHE_TCR_EL2_IRGN0		|
> +		   VHE_TCR_EL2_EPD0		|
> +		   VHE_TCR_EL2_T0SZ,
> +		   FEAT_AA64EL2),
> +	FORCE_RES0(VHE_TCR_EL2_RES0),
> +	FORCE_RES1(VHE_TCR_EL2_RES1),
> +};
> +
> +static const DECLARE_FEAT_MAP(vhe_tcr_el2_desc, VHE_TCR_EL2,
> +			      vhe_tcr_el2_feat_map, FEAT_AA64EL2);
> +
> +static const struct reg_bits_to_feat_map tcr_el2_feat_map[] = {
> +	NEEDS_FEAT(TCR_EL2_MTX,
> +		   feat_mte_no_addr_tags_or_canonical_tags),
> +	NEEDS_FEAT(TCR_EL2_DS, feat_lpa2),
> +	NEEDS_FEAT(TCR_EL2_TCMA, FEAT_MTE2),
> +	NEEDS_FEAT(TCR_EL2_TBID, feat_pauth),
> +	NEEDS_FEAT(TCR_EL2_HWU62	|
> +		   TCR_EL2_HWU61	|
> +		   TCR_EL2_HWU60	|
> +		   TCR_EL2_HWU59,
> +		   FEAT_HPDS2),
> +	NEEDS_FEAT(TCR_EL2_HPD, FEAT_HPDS),
> +	NEEDS_FEAT(TCR_EL2_HD, FEAT_HAFDBS),
> +	NEEDS_FEAT(TCR_EL2_HA, FEAT_HAF),
> +	NEEDS_FEAT(TCR_EL2_TBI		|
> +		   TCR_EL2_PS		|
> +		   TCR_EL2_TG0		|
> +		   TCR_EL2_SH0		|
> +		   TCR_EL2_ORGN0	|
> +		   TCR_EL2_IRGN0	|
> +		   TCR_EL2_T0SZ,
> +		   FEAT_AA64EL2),
> +	FORCE_RES0(TCR_EL2_RES0),
> +	FORCE_RES1(TCR_EL2_RES1),
> +};
> +
> +static const DECLARE_FEAT_MAP(tcr_el2_desc, TCR_EL2,
> +			      tcr_el2_feat_map, FEAT_AA64EL2);
> +
>  static const struct reg_bits_to_feat_map tcr2_el2_feat_map[] = {
>  	NEEDS_FEAT_FLAG(TCR2_EL2_FNG1	|
>  			TCR2_EL2_FNG0	|
> @@ -1398,6 +1503,8 @@ void __init check_feature_map(void)
>  	check_reg_desc(&hcr_desc);
>  	check_reg_desc(&nvhcr_desc);
>  	check_reg_desc(&sctlr2_desc);
> +	check_reg_desc(&vhe_tcr_el2_desc);
> +	check_reg_desc(&tcr_el2_desc);
>  	check_reg_desc(&tcr2_el2_desc);
>  	check_reg_desc(&sctlr_el1_desc);
>  	check_reg_desc(&sctlr_el2_desc);
> @@ -1611,6 +1718,12 @@ struct resx get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg)
>  	case SCTLR2_EL2:
>  		resx = compute_reg_resx_bits(kvm, &sctlr2_desc, 0, 0);
>  		break;
> +	case TCR_EL2:
> +		if (kvm_has_feat(kvm, FEAT_E2H0))
> +			resx = compute_reg_resx_bits(kvm, &tcr_el2_desc, 0, 0);
> +		else
> +			resx = compute_reg_resx_bits(kvm, &vhe_tcr_el2_desc, 0, 0);
> +		break;
>  	case TCR2_EL2:
>  		resx = compute_reg_resx_bits(kvm, &tcr2_el2_desc, 0, 0);
>  		break;
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index 4a860904c1ce..2536ea4297b0 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -1957,6 +1957,10 @@ int kvm_init_nv_sysregs(struct kvm_vcpu *vcpu)
>  	resx = get_reg_fixed_bits(kvm, HFGITR2_EL2);
>  	set_sysreg_masks(kvm, HFGITR2_EL2, resx);
>  
> +	/* TCR_EL2 */
> +	resx = get_reg_fixed_bits(kvm, TCR_EL2);
> +	set_sysreg_masks(kvm, TCR_EL2, resx);
> +
>  	/* TCR2_EL2 */
>  	resx = get_reg_fixed_bits(kvm, TCR2_EL2);
>  	set_sysreg_masks(kvm, TCR2_EL2, resx);
> -- 
> 2.43.0
> 

