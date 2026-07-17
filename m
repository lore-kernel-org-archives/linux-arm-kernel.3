Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F0C3C44516
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 09:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8W/meSwvdYRV6A9iNQXWRD4L+/91qYrCSMqAVpS++w4=; b=Yf7bN3i0GP+F4P4AfOtVBTI+aG
	uNb5cEHUZNhPXNM45bgB/ZSSC0cHjVaa4w9wvKfOT0GBVDUcr3B8qNwOJQXjWDTRotvZnLzIjJ/Gf
	g4yk1CAdEFU1osODNGa45vp8WdYo+DZNQFtycwErlZ8KnsBrPytdEPzv9SQPU6H5RFazHq8URITN0
	u03hWSanKLLTDXKvxV5rbjAi4VlJ1i2KYYSd7F/3JGNuVLOJzy8NON9QmKJmUwbsOkoolcynFhkpM
	WX8+kztYFEjbNcQ1EsTsfWMqd3N8+F3uueAoWTnJ1FtRPCQMUAgSzjdZDVX0gjLSbBkkObfCqAfWo
	y+LyGCCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkf7s-00000001s8K-18WA;
	Fri, 17 Jul 2026 09:45:00 +0000
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkf7p-00000001s7F-2dZ8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 09:44:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1784281495; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=8W/meSwvdYRV6A9iNQXWRD4L+/91qYrCSMqAVpS++w4=;
	b=FA3AgGMfv8fYuZ7IuxSuDc6f86f35ftFma33Lp+Gex+qRjnMrO88Gn3ZhoWaN0fz64aRwOrA0QXDjyqfeSPmz1AdYphxfAvCEyieZifEs4Uuuq+DN4b43He0vLLU8kajZihPqnVyuD+nG3Ljg8Cv2BcMu0WDa132/OqcNL1Jxeo=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=yaoyuan@linux.alibaba.com;NM=1;PH=DS;RN=9;SR=0;TI=SMTPD_---0X7GsvxE_1784281494;
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0X7GsvxE_1784281494 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 17 Jul 2026 17:44:54 +0800
Date: Fri, 17 Jul 2026 17:44:53 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Steffen Eiden <seiden@linux.ibm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v2 06/28] KVM: arm64: Classify CPTR_EL2 as a
 SR_LOC_SPECIAL register
Message-ID: <rkvqx2ires4z5jg7e5ezqfwuxvx5r2nz2kop5sjrr4i4d6lndu@pmccxanixsnq>
References: <20260714091641.1970822-1-maz@kernel.org>
 <20260714091641.1970822-7-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714091641.1970822-7-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_024457_820028_D5ADECBD 
X-CRM114-Status: GOOD (  22.24  )
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

On Tue, Jul 14, 2026 at 10:16:19AM +0800, Marc Zyngier wrote:
> It may not be obvious unless you look at it closely, but CPTR_EL2
> is treated very differently from other registers. It is one the
> registers that, despite looking very similar between EL1 and EL2
> when E2H==1, have RES0 bits that get in the way.
>
> Make it clear that CPTR_EL2 is odd by classifying it as SR_LOC_SPECIAL,
> just like CNTHCTL_EL2 (and for the same reasons). This makes it
> possible to use vcpu_read_sys_reg() with it, and will be necessary
> once we support FEAT_NV2P1.
>
> Reviewed-by: Joey Gouly <joey.gouly@arm.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_emulate.h |  2 +-
>  arch/arm64/kvm/sys_regs.c            | 20 ++++++++++++++++++--
>  2 files changed, 19 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
> index 5bf3d7e1d92c7..9831166695186 100644
> --- a/arch/arm64/include/asm/kvm_emulate.h
> +++ b/arch/arm64/include/asm/kvm_emulate.h
> @@ -617,7 +617,7 @@ static __always_inline void kvm_incr_pc(struct kvm_vcpu *vcpu)
>   */
>  static inline u64 vcpu_sanitised_cptr_el2(const struct kvm_vcpu *vcpu)
>  {
> -	u64 cptr = __vcpu_sys_reg(vcpu, CPTR_EL2);
> +	u64 cptr = vcpu_read_sys_reg(vcpu, CPTR_EL2);
>
>  	if (!vcpu_el2_e2h_is_set(vcpu))
>  		cptr = translate_cptr_el2_to_cpacr_el1(cptr);
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 5d5c579d45790..6b47d936efb32 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -183,8 +183,6 @@ static void locate_register(const struct kvm_vcpu *vcpu, enum vcpu_sysreg reg,
>  	switch (reg) {
>  		MAPPED_EL2_SYSREG(SCTLR_EL2,   SCTLR_EL1,
>  				  translate_sctlr_el2_to_sctlr_el1	     );
> -		MAPPED_EL2_SYSREG(CPTR_EL2,    CPACR_EL1,
> -				  translate_cptr_el2_to_cpacr_el1	     );
>  		MAPPED_EL2_SYSREG(TTBR0_EL2,   TTBR0_EL1,
>  				  translate_ttbr0_el2_to_ttbr0_el1	     );
>  		MAPPED_EL2_SYSREG(TTBR1_EL2,   TTBR1_EL1,   NULL	     );
> @@ -210,6 +208,19 @@ static void locate_register(const struct kvm_vcpu *vcpu, enum vcpu_sysreg reg,
>  		loc->loc = ((is_hyp_ctxt(vcpu) && vcpu_el2_e2h_is_set(vcpu)) ?
>  			    SR_LOC_SPECIAL : SR_LOC_MEMORY);
>  		break;
> +	case CPTR_EL2:
> +		/*
> +		 * CPTR_EL2 is just as special, and needs a certain amount
> +		 * of handholding. It always lives in memory, due to being
> +		 * heavily trapped thanks to CPACR_EL1.TCPAC being RES0.
> +		 * FEAT_NV2p1 fixes this.
> +		 */
> +		locate_mapped_el2_register(vcpu, CPTR_EL2, CPACR_EL1,
> +					   translate_cptr_el2_to_cpacr_el1,
> +					   loc);
> +		if (is_hyp_ctxt(vcpu) && vcpu_el2_e2h_is_set(vcpu))
> +			loc->loc = SR_LOC_SPECIAL;
> +		break;
>  	default:
>  		loc->loc = locate_direct_register(vcpu, reg);
>  	}
> @@ -314,6 +325,8 @@ u64 vcpu_read_sys_reg(const struct kvm_vcpu *vcpu, enum vcpu_sysreg reg)
>  			val &= CNTKCTL_VALID_BITS;
>  			val |= __vcpu_sys_reg(vcpu, reg) & ~CNTKCTL_VALID_BITS;
>  			return val;
> +		case CPTR_EL2:
> +			return __vcpu_sys_reg(vcpu, reg);
>  		default:
>  			WARN_ON_ONCE(1);
>  		}
> @@ -359,6 +372,9 @@ void vcpu_write_sys_reg(struct kvm_vcpu *vcpu, u64 val, enum vcpu_sysreg reg)
>  			 */
>  			write_sysreg_el1(val, SYS_CNTKCTL);
>  			break;
> +		case CPTR_EL2:
> +			write_sysreg_el1(val, SYS_CPACR);
> +			break;

Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>

>  		default:
>  			WARN_ON_ONCE(1);
>  		}
> --
> 2.47.3
>

