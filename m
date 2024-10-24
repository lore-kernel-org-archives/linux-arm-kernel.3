Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D321CE8E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 16:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mnC0P4SwmqAdLecCWO204q8D9yI859IIZ9OfDdgWMWc=; b=ZKL+2OXjzLfmQWRNfmsYFH5Mc6
	Po1Ie9V9LNfYoFhgTA+P5HGPmsRcwwzeH+3ntpZ1a/unITXtQDfGrNUOcGz9+Es+JX+6a0ryxvQW/
	GuHGdW7M5O/zLEfnXi3nRWeHQpsv2/4RXsgn3TVvO/zPKdmBsILgQZmDJIj3dAFIfVIyZIPYicuSO
	s6STyCYyzTl1tEAXIt3l69JkKIcHfmyLt47IPyMha/Em5AJBro1QImoCBaebn5m38+0u2oAjWCnsZ
	k/FbKFW9EYeMO/Q4xVRfGbV/e5p6bTGcvUhQMtD3Ka6xLPgKOdeVquW9rSOwD42VsT7xa+WTYlft8
	HyGT39GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t40Go-0000000112K-3L0b;
	Thu, 24 Oct 2024 16:01:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zjD-00000000uCz-0iMV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 15:26:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22EB1339;
	Thu, 24 Oct 2024 08:26:51 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4866B3F528;
	Thu, 24 Oct 2024 08:26:20 -0700 (PDT)
Date: Thu, 24 Oct 2024 16:26:18 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v5 33/37] KVM: arm64: Add POE save/restore for AT
 emulation fast-path
Message-ID: <20241024152618.GE1403933@e124191.cambridge.arm.com>
References: <20241023145345.1613824-1-maz@kernel.org>
 <20241023145345.1613824-34-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023145345.1613824-34-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_082623_285980_B72A86FD 
X-CRM114-Status: GOOD (  16.12  )
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

On Wed, Oct 23, 2024 at 03:53:41PM +0100, Marc Zyngier wrote:
> Just like the other extensions affecting address translation,
> we must save/restore POE so that an out-of-context translation
> context can be restored and used with the AT instructions.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

> ---
>  arch/arm64/kvm/at.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
> index de7109111e404..ef1643faedeb4 100644
> --- a/arch/arm64/kvm/at.c
> +++ b/arch/arm64/kvm/at.c
> @@ -440,6 +440,8 @@ struct mmu_config {
>  	u64	tcr2;
>  	u64	pir;
>  	u64	pire0;
> +	u64	por_el0;
> +	u64	por_el1;
>  	u64	sctlr;
>  	u64	vttbr;
>  	u64	vtcr;
> @@ -458,6 +460,10 @@ static void __mmu_config_save(struct mmu_config *config)
>  			config->pir	= read_sysreg_el1(SYS_PIR);
>  			config->pire0	= read_sysreg_el1(SYS_PIRE0);
>  		}
> +		if (system_supports_poe()) {
> +			config->por_el1	= read_sysreg_el1(SYS_POR);
> +			config->por_el0	= read_sysreg_s(SYS_POR_EL0);
> +		}
>  	}
>  	config->sctlr	= read_sysreg_el1(SYS_SCTLR);
>  	config->vttbr	= read_sysreg(vttbr_el2);
> @@ -485,6 +491,10 @@ static void __mmu_config_restore(struct mmu_config *config)
>  			write_sysreg_el1(config->pir, SYS_PIR);
>  			write_sysreg_el1(config->pire0, SYS_PIRE0);
>  		}
> +		if (system_supports_poe()) {
> +			write_sysreg_el1(config->por_el1, SYS_POR);
> +			write_sysreg_s(config->por_el0, SYS_POR_EL0);
> +		}
>  	}
>  	write_sysreg_el1(config->sctlr,	SYS_SCTLR);
>  	write_sysreg(config->vttbr,	vttbr_el2);
> @@ -1105,6 +1115,10 @@ static u64 __kvm_at_s1e01_fast(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
>  			write_sysreg_el1(vcpu_read_sys_reg(vcpu, PIR_EL1), SYS_PIR);
>  			write_sysreg_el1(vcpu_read_sys_reg(vcpu, PIRE0_EL1), SYS_PIRE0);
>  		}
> +		if (kvm_has_s1poe(vcpu->kvm)) {
> +			write_sysreg_el1(vcpu_read_sys_reg(vcpu, POR_EL1), SYS_POR);
> +			write_sysreg_s(vcpu_read_sys_reg(vcpu, POR_EL0), SYS_POR_EL0);
> +		}
>  	}
>  	write_sysreg_el1(vcpu_read_sys_reg(vcpu, SCTLR_EL1),	SYS_SCTLR);
>  	__load_stage2(mmu, mmu->arch);
> -- 
> 2.39.2
> 

