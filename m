Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D48C5DF93
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 14:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qzq4K4zywOLKIkm46X0El1Ge3XWDdOQH6fEYeoIoJu0=; b=F5Y5ZfzyCeGsTeVxiO33sKW1xt
	sm2j1FjAoxK8ZJJZ+fNmzXz7m+0us4jLRUr84uIfEvvcJgXM+aRxYpFT77ZWVL0ky5aYa4rE8Djwx
	qGso+hxZs+EeHv9m43NmBzHde8IUAx7/kXS/K62xQcliBO1R/4Es34uaYiOKhSViaoj5k7Fq2+jXA
	1CUP/GPmr/HbGPoy7MvrS8DSw4SPJwisXkPZWHJh1S5dnzndZB1Yma+jU0UCKfDNI4Q967EXWTJi4
	XAUwmYbEjJ9KeJn36JRPi76aqGT6Z7spruf8/s2kUM7smRu9S4trzLoV7uN5yGTTxPujtEuvBdLkM
	JCO1q/aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxQIy-0000000DYyF-1BWl;
	Fri, 21 Aug 2026 14:33:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxQIv-0000000DYxH-2J5H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 14:33:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA075153B;
	Fri, 21 Aug 2026 07:33:04 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 26AE93F85F;
	Fri, 21 Aug 2026 07:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787322788; bh=0Xa7Oehcy9x1McUKUPlTBOCPe3WmYJS7pLp5g3Y//5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sOB5zNlWly8ECDNc6e96+rPB4KK8F8ATbYU6GSwUAWXmJ77Kyrb6Zlvr37vN+qZ/U
	 +zYbTubLHh8rD3ZXaZIj3DxaCtXn3nOL/b4mnX0kRza/RCZrLO0x8dt6Av4B+FXCN8
	 oBTO+ZfpcnRLZGPd4ej4+3Ssg1OxdkQXzgirz2PM=
Date: Fri, 21 Aug 2026 15:32:58 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Mark Brown <broonie@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Shuah Khan <shuah@kernel.org>, Fuad Tabba <tabba@google.com>, Oliver Upton <oupton@kernel.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
	Yao Yuan <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v19 06/14] KVM: arm64: Validate GCS exception lock when
 emulating ERET
Message-ID: <vdmz43ogvmwu4liilfqzdrgsf5v765bucl7mybhfdxj7yrywkd@5mssukdegdwg>
References: <20260812-arm64-gcs-v19-0-9105afd828ac@kernel.org>
 <20260812-arm64-gcs-v19-6-9105afd828ac@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812-arm64-gcs-v19-6-9105afd828ac@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_073309_667802_4CCC1DB4 
X-CRM114-Status: GOOD (  23.08  )
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

On Wed, Aug 12, 2026 at 08:12:05PM +0100, Mark Brown wrote:
> As per DDI0487 R_TYTWB GCS adds an additional case where an illegal
> exception return can be generated. If all of:
> 
>  - PSTATE.EXLOCK is 0.
>  - The EL is not being changed by the ERET.
>  - GCSCR_ELx.EXLOCKEN is 1.
> 
> are true then the return is illegal. Emulate this behaviour when
> emulating ERET for nested guests, while we're at it using the symbolic
> definition for EXLOCK in SPSR.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_nested.h | 39 +++++++++++++++++++++++++++++++++++++
>  arch/arm64/kvm/emulate-nested.c     |  5 ++++-
>  arch/arm64/kvm/hyp/vhe/switch.c     |  4 ++++
>  3 files changed, 47 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_nested.h b/arch/arm64/include/asm/kvm_nested.h
> index 012d711034d1..f25ddee89206 100644
> --- a/arch/arm64/include/asm/kvm_nested.h
> +++ b/arch/arm64/include/asm/kvm_nested.h
> @@ -240,6 +240,45 @@ static inline bool kvm_auth_eretax(struct kvm_vcpu *vcpu, u64 *elr)
>  }
>  #endif
>  
> +#ifdef CONFIG_ARM64_GCS
> +/*
> + * A subset of the pseudocode ELFromSPSR(), validity checks are
> + * assumed to have been done in code that is not GCS specific.
> + */
> +static inline int exlock_el_from_spsr(u64 spsr)
> +{
> +	return FIELD_GET(GENMASK(3, 2), spsr);
> +}

It feels a bit odd to me to have this function named exlock specific, as
it's just spsr_to_el, right?

Thanks,
Wei-Lin Chang

> +
> +/* See IllegalExceptionReturn() pseudocode */
> +static inline bool kvm_check_illegal_exlock_return(struct kvm_vcpu *vcpu,
> +						   u64 spsr)
> +{
> +	u64 cur_el, target_el;
> +
> +	if (!kvm_has_gcs(vcpu->kvm))
> +		return false;
> +
> +	if (vcpu->arch.ctxt.regs.pstate & PSR_EXLOCK_BIT)
> +		return false;
> +
> +	cur_el = exlock_el_from_spsr(vcpu->arch.ctxt.regs.pstate);
> +	target_el = exlock_el_from_spsr(spsr);
> +
> +	if (cur_el != target_el)
> +		return false;
> +
> +	return vcpu_read_sys_reg(vcpu, GCSCR_EL2) & GCSCR_ELx_EXLOCKEN;
> +}
> +
> +#else
> +static inline bool kvm_check_illegal_exlock_return(struct kvm_vcpu *vcpu,
> +						   u64 spsr)
> +{
> +	return false;
> +}
> +#endif
> +
>  #define KVM_NV_GUEST_MAP_SZ	(KVM_PGTABLE_PROT_SW1 | KVM_PGTABLE_PROT_SW0)
>  
>  static inline u64 kvm_encode_nested_level(struct kvm_s2_trans *trans)

[...]

