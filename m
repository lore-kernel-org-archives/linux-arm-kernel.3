Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9131EC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 13:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O6ZmtmfH6GprzqPSKWpF5OUQG35Zx632PU0ogU2OisM=; b=h3Sv+brLK5IseBV5lcrVAE1iaZ
	JhiE4uSpH8IfyiH6DLn2tkrcKCx5IFxL+90DewWWWKduSK4JARJDsBHpMg+OmAoR0c3P7Z2g+kVWW
	mjqRiK5O0LVBBexGmmpNxop35RtPsmhNtNCkxsYOCU3ovBWSEQ/Tzs4T1UbrQrHmE5X/Ykne8KAm+
	PCcEA51I5JCXfE+RXN4rl3MPJ6W18UMrYRbG1Wk1nPUEC8maRcTklyZWrD+TxKTEdiSTR0wLSymvs
	Tct0/EsMbfwkE5R9ZPVkg5B5/cnwqn/8OXWPXTLLJ2s4y0ihgUNvxE3Y+AgpBRMN0bVmWoaAMvMtd
	VsI6wV2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAU9w-0000000Fr3M-14j4;
	Thu, 01 May 2025 13:41:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAU2Z-0000000Fpmf-36JB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 13:33:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B891A168F;
	Thu,  1 May 2025 06:33:19 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6DA993F5A1;
	Thu,  1 May 2025 06:33:25 -0700 (PDT)
Date: Thu, 1 May 2025 14:33:22 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>, Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v3 28/42] KVM: arm64: Use KVM-specific HCRX_EL2 RES0 mask
Message-ID: <20250501133322.GJ1859293@e124191.cambridge.arm.com>
References: <20250426122836.3341523-1-maz@kernel.org>
 <20250426122836.3341523-29-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250426122836.3341523-29-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_063327_907946_E604139E 
X-CRM114-Status: GOOD (  22.78  )
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

On Sat, Apr 26, 2025 at 01:28:22PM +0100, Marc Zyngier wrote:
> We do not have a computed table for HCRX_EL2, so statically define
> the bits we know about. A warning will fire if the architecture
> grows bits that are not handled yet.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

> ---
>  arch/arm64/include/asm/kvm_arm.h | 18 ++++++++++++++----
>  arch/arm64/kvm/emulate-nested.c  |  5 +++++
>  arch/arm64/kvm/nested.c          |  4 ++--
>  3 files changed, 21 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
> index e7c73d16cd451..52b3aeb19efc6 100644
> --- a/arch/arm64/include/asm/kvm_arm.h
> +++ b/arch/arm64/include/asm/kvm_arm.h
> @@ -315,10 +315,20 @@
>  				 GENMASK(19, 18) |	\
>  				 GENMASK(15, 0))
>  
> -/* Polarity masks for HCRX_EL2 */
> -#define __HCRX_EL2_RES0         HCRX_EL2_RES0
> -#define __HCRX_EL2_MASK		(BIT(6))
> -#define __HCRX_EL2_nMASK	~(__HCRX_EL2_RES0 | __HCRX_EL2_MASK)
> +/*
> + * Polarity masks for HCRX_EL2, limited to the bits that we know about
> + * at this point in time. It doesn't mean that we actually *handle*
> + * them, but that at least those that are not advertised to a guest
> + * will be RES0 for that guest.
> + */
> +#define __HCRX_EL2_MASK		(BIT_ULL(6))
> +#define __HCRX_EL2_nMASK	(GENMASK_ULL(24, 14) | \
> +				 GENMASK_ULL(11, 7)  | \
> +				 GENMASK_ULL(5, 0))
> +#define __HCRX_EL2_RES0		~(__HCRX_EL2_nMASK | __HCRX_EL2_MASK)
> +#define __HCRX_EL2_RES1		~(__HCRX_EL2_nMASK | \
> +				  __HCRX_EL2_MASK  | \
> +				  __HCRX_EL2_RES0)

Convoluted way of writing 0, but it makes sense!

>  
>  /* Hyp Prefetch Fault Address Register (HPFAR/HDFAR) */
>  #define HPFAR_MASK	(~UL(0xf))
> diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
> index c30d970bf81cb..c581cf29bc59e 100644
> --- a/arch/arm64/kvm/emulate-nested.c
> +++ b/arch/arm64/kvm/emulate-nested.c
> @@ -2157,6 +2157,7 @@ int __init populate_nv_trap_config(void)
>  	BUILD_BUG_ON(__NR_CGT_GROUP_IDS__ > BIT(TC_CGT_BITS));
>  	BUILD_BUG_ON(__NR_FGT_GROUP_IDS__ > BIT(TC_FGT_BITS));
>  	BUILD_BUG_ON(__NR_FG_FILTER_IDS__ > BIT(TC_FGF_BITS));
> +	BUILD_BUG_ON(__HCRX_EL2_MASK & __HCRX_EL2_nMASK);
>  
>  	for (int i = 0; i < ARRAY_SIZE(encoding_to_cgt); i++) {
>  		const struct encoding_to_trap_config *cgt = &encoding_to_cgt[i];
> @@ -2182,6 +2183,10 @@ int __init populate_nv_trap_config(void)
>  		}
>  	}
>  
> +	if (__HCRX_EL2_RES0 != HCRX_EL2_RES0)
> +		kvm_info("Sanitised HCR_EL2_RES0 = %016llx, expecting %016llx\n",
> +			 __HCRX_EL2_RES0, HCRX_EL2_RES0);
> +
>  	kvm_info("nv: %ld coarse grained trap handlers\n",
>  		 ARRAY_SIZE(encoding_to_cgt));
>  
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index 479ffd25eea63..666df85230c9b 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -1058,8 +1058,8 @@ int kvm_init_nv_sysregs(struct kvm_vcpu *vcpu)
>  	set_sysreg_masks(kvm, HCR_EL2, res0, res1);
>  
>  	/* HCRX_EL2 */
> -	res0 = HCRX_EL2_RES0;
> -	res1 = HCRX_EL2_RES1;
> +	res0 = __HCRX_EL2_RES0;
> +	res1 = __HCRX_EL2_RES1;
>  	if (!kvm_has_feat(kvm, ID_AA64ISAR3_EL1, PACM, TRIVIAL_IMP))
>  		res0 |= HCRX_EL2_PACMEn;
>  	if (!kvm_has_feat(kvm, ID_AA64PFR2_EL1, FPMR, IMP))
> -- 
> 2.39.2
> 

