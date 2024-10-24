Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2603ECE8E86
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 14:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QtRNbSpGzbfMFFmqwiT8/B7D80tz9BA7bF04BZ8GRfs=; b=wSgneXHV6NDCChFye4qwAfAUGd
	HtOSz2/xN6r1TsuQDKjZycBfuOt/Efmh744cOHIfQh06b9UJP7TRV5oXI9mtQUqOYeLC29sRC2ZiZ
	RSm/bYOEazIkq2gjAq/8cmoGgsEyZK3Hx7EY+XiOVgdGQI+asxSvXjKwBalOnFEUtFCaFki0M2TdB
	53CJE7fdNsHB+L9mSnEwMfY+/RueYH0c9/LidM3Q6M24c7OU97iicaazYfpjuEJ11Akm5QEFt/ptM
	o/H04Xe4h1VUkFUNaQi6T0X6mm97yNuJQdaxN0PgGxqSgCFk/Yy7MXIKSbARjch+uTXATDufWFxa4
	YrYxoFhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zDT-00000000oze-1tQJ;
	Thu, 24 Oct 2024 14:53:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3z9r-00000000o7v-2x7z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 14:49:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 621A0339;
	Thu, 24 Oct 2024 07:50:20 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 83C733F528;
	Thu, 24 Oct 2024 07:49:49 -0700 (PDT)
Date: Thu, 24 Oct 2024 15:49:47 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v5 18/37] KVM: arm64: Add AT fast-path support for S1PIE
Message-ID: <20241024144947.GD1403933@e124191.cambridge.arm.com>
References: <20241023145345.1613824-1-maz@kernel.org>
 <20241023145345.1613824-19-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023145345.1613824-19-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_074951_892309_F4BDA920 
X-CRM114-Status: GOOD (  16.59  )
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

On Wed, Oct 23, 2024 at 03:53:26PM +0100, Marc Zyngier wrote:
> Emulating AT using AT instructions requires that the live state
> matches the translation regime the AT instruction targets.
> 
> If targeting the EL1&0 translation regime and that S1PIE is
> supported, we also need to restore that state (covering TCR2_EL1,
> PIR_EL1, and PIRE0_EL1).
> 
> Add the required system register switcheroo.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

> ---
>  arch/arm64/kvm/at.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
> index f04677127fbc0..b9d0992e91972 100644
> --- a/arch/arm64/kvm/at.c
> +++ b/arch/arm64/kvm/at.c
> @@ -412,6 +412,9 @@ struct mmu_config {
>  	u64	ttbr1;
>  	u64	tcr;
>  	u64	mair;
> +	u64	tcr2;
> +	u64	pir;
> +	u64	pire0;
>  	u64	sctlr;
>  	u64	vttbr;
>  	u64	vtcr;
> @@ -424,6 +427,13 @@ static void __mmu_config_save(struct mmu_config *config)
>  	config->ttbr1	= read_sysreg_el1(SYS_TTBR1);
>  	config->tcr	= read_sysreg_el1(SYS_TCR);
>  	config->mair	= read_sysreg_el1(SYS_MAIR);
> +	if (cpus_have_final_cap(ARM64_HAS_TCR2)) {
> +		config->tcr2	= read_sysreg_el1(SYS_TCR2);
> +		if (cpus_have_final_cap(ARM64_HAS_S1PIE)) {
> +			config->pir	= read_sysreg_el1(SYS_PIR);
> +			config->pire0	= read_sysreg_el1(SYS_PIRE0);
> +		}
> +	}
>  	config->sctlr	= read_sysreg_el1(SYS_SCTLR);
>  	config->vttbr	= read_sysreg(vttbr_el2);
>  	config->vtcr	= read_sysreg(vtcr_el2);
> @@ -444,6 +454,13 @@ static void __mmu_config_restore(struct mmu_config *config)
>  	write_sysreg_el1(config->ttbr1,	SYS_TTBR1);
>  	write_sysreg_el1(config->tcr,	SYS_TCR);
>  	write_sysreg_el1(config->mair,	SYS_MAIR);
> +	if (cpus_have_final_cap(ARM64_HAS_TCR2)) {
> +		write_sysreg_el1(config->tcr2, SYS_TCR2);
> +		if (cpus_have_final_cap(ARM64_HAS_S1PIE)) {
> +			write_sysreg_el1(config->pir, SYS_PIR);
> +			write_sysreg_el1(config->pire0, SYS_PIRE0);
> +		}
> +	}
>  	write_sysreg_el1(config->sctlr,	SYS_SCTLR);
>  	write_sysreg(config->vttbr,	vttbr_el2);
>  	write_sysreg(config->vtcr,	vtcr_el2);
> @@ -914,6 +931,13 @@ static u64 __kvm_at_s1e01_fast(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
>  	write_sysreg_el1(vcpu_read_sys_reg(vcpu, TTBR1_EL1),	SYS_TTBR1);
>  	write_sysreg_el1(vcpu_read_sys_reg(vcpu, TCR_EL1),	SYS_TCR);
>  	write_sysreg_el1(vcpu_read_sys_reg(vcpu, MAIR_EL1),	SYS_MAIR);
> +	if (kvm_has_feat(vcpu->kvm, ID_AA64MMFR3_EL1, TCRX, IMP)) {
> +		write_sysreg_el1(vcpu_read_sys_reg(vcpu, TCR2_EL1), SYS_TCR2);
> +		if (kvm_has_feat(vcpu->kvm, ID_AA64MMFR3_EL1, S1PIE, IMP)) {
> +			write_sysreg_el1(vcpu_read_sys_reg(vcpu, PIR_EL1), SYS_PIR);
> +			write_sysreg_el1(vcpu_read_sys_reg(vcpu, PIRE0_EL1), SYS_PIRE0);
> +		}
> +	}
>  	write_sysreg_el1(vcpu_read_sys_reg(vcpu, SCTLR_EL1),	SYS_SCTLR);
>  	__load_stage2(mmu, mmu->arch);
>  

