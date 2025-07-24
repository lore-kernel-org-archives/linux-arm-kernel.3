Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C21C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 13:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dIWn080nuURUx3hMQ6ny1/n/H0wZYCL5P3LADAwSujE=; b=CO3SviMQxqdW+gdAgnMVwYX0+S
	yde9nPbf3o5/MVe1PKbdj41yFbx+6DiiGd8zPXdw1tSYx+D0hngY98AGMxLei8QpiCkay7EwFN4AS
	RY0iENySua6FkdywVs0+UUzvIGfs6EANndfBswFWVCbYEHvddQi1oyxTg8EAuD4WUUo923BmjGbCo
	FTNF7+1BIYXILF4eMa7eNIi98z1K1TX2RLn2+5IA9E6KLrOkLertHt5viFNOHiPs8PhIxIXJBM2XS
	+L12Vqfdp2zD4KfxWCd87RIAwr2pCx74qiCf3noaFzEJF4ZAnDrURgK+McaVYGX2C4BADKraSgEDD
	oY75uA6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewN4-00000007Z50-08iu;
	Thu, 24 Jul 2025 13:52:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uet4K-00000007BuG-1JLQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 10:20:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 047311A00;
	Thu, 24 Jul 2025 03:20:47 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A55DC3F5A1;
	Thu, 24 Jul 2025 03:20:49 -0700 (PDT)
Date: Thu, 24 Jul 2025 11:20:47 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>
Subject: Re: [PATCH v9 34/43] arm64: RME: Propagate number of breakpoints and
 watchpoints to userspace
Message-ID: <20250724102047.GB2753450@e124191.cambridge.arm.com>
References: <20250611104844.245235-1-steven.price@arm.com>
 <20250611104844.245235-35-steven.price@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611104844.245235-35-steven.price@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_032056_425531_0FE86510 
X-CRM114-Status: GOOD (  20.47  )
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

On Wed, Jun 11, 2025 at 11:48:31AM +0100, Steven Price wrote:
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> The RMM describes the maximum number of BPs/WPs available to the guest
> in the Feature Register 0. Propagate those numbers into ID_AA64DFR0_EL1,
> which is visible to userspace. A VMM needs this information in order to
> set up realm parameters.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: Steven Price <steven.price@arm.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

> ---
>  arch/arm64/include/asm/kvm_rme.h |  2 ++
>  arch/arm64/kvm/rme.c             | 22 ++++++++++++++++++++++
>  arch/arm64/kvm/sys_regs.c        |  2 +-
>  3 files changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_rme.h b/arch/arm64/include/asm/kvm_rme.h
> index af5150c084ce..c8564d5aaff4 100644
> --- a/arch/arm64/include/asm/kvm_rme.h
> +++ b/arch/arm64/include/asm/kvm_rme.h
> @@ -94,6 +94,8 @@ void kvm_init_rme(void);
>  u32 kvm_realm_ipa_limit(void);
>  u32 kvm_realm_vgic_nr_lr(void);
>  
> +u64 kvm_realm_reset_id_aa64dfr0_el1(const struct kvm_vcpu *vcpu, u64 val);
> +
>  bool kvm_rme_supports_sve(void);
>  
>  int kvm_realm_enable_cap(struct kvm *kvm, struct kvm_enable_cap *cap);
> diff --git a/arch/arm64/kvm/rme.c b/arch/arm64/kvm/rme.c
> index 12cc34192b97..ce8e48ab8753 100644
> --- a/arch/arm64/kvm/rme.c
> +++ b/arch/arm64/kvm/rme.c
> @@ -87,6 +87,28 @@ u32 kvm_realm_vgic_nr_lr(void)
>  	return u64_get_bits(rmm_feat_reg0, RMI_FEATURE_REGISTER_0_GICV3_NUM_LRS);
>  }
>  
> +u64 kvm_realm_reset_id_aa64dfr0_el1(const struct kvm_vcpu *vcpu, u64 val)
> +{
> +	u32 bps = u64_get_bits(rmm_feat_reg0, RMI_FEATURE_REGISTER_0_NUM_BPS);
> +	u32 wps = u64_get_bits(rmm_feat_reg0, RMI_FEATURE_REGISTER_0_NUM_WPS);
> +	u32 ctx_cmps;
> +
> +	if (!kvm_is_realm(vcpu->kvm))
> +		return val;
> +
> +	/* Ensure CTX_CMPs is still valid */
> +	ctx_cmps = FIELD_GET(ID_AA64DFR0_EL1_CTX_CMPs, val);
> +	ctx_cmps = min(bps, ctx_cmps);
> +
> +	val &= ~(ID_AA64DFR0_EL1_BRPs_MASK | ID_AA64DFR0_EL1_WRPs_MASK |
> +		 ID_AA64DFR0_EL1_CTX_CMPs);
> +	val |= FIELD_PREP(ID_AA64DFR0_EL1_BRPs_MASK, bps) |
> +	       FIELD_PREP(ID_AA64DFR0_EL1_WRPs_MASK, wps) |
> +	       FIELD_PREP(ID_AA64DFR0_EL1_CTX_CMPs, ctx_cmps);
> +
> +	return val;
> +}
> +
>  static int get_start_level(struct realm *realm)
>  {
>  	/*
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index da2d390ce9a5..b974eddfad53 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -1847,7 +1847,7 @@ static u64 sanitise_id_aa64dfr0_el1(const struct kvm_vcpu *vcpu, u64 val)
>  	/* Hide BRBE from guests */
>  	val &= ~ID_AA64DFR0_EL1_BRBE_MASK;
>  
> -	return val;
> +	return kvm_realm_reset_id_aa64dfr0_el1(vcpu, val);
>  }
>  
>  static int set_id_aa64dfr0_el1(struct kvm_vcpu *vcpu,
> -- 
> 2.43.0
> 

