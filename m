Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 281A410775FD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 17:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7LQwXJkc7wNVsx5z/he+gvqxI+rfjnDCqnjW/XWfX00=; b=qzPuWbu7eL6wUHmNCVMttdkhVk
	rmqtjzsQEoxRDH1jkP4Cs4iJACsN7j09I5G+beFuANsgoKToE9H/+D0LmnN/psKDSJcYaA4hyJaA2
	6T9oPD6pVwderVlXVsYxGw/Be9eiCELxS6nFxDsgrtt+Ona8GIXVnAKKzpTMZMvalCCinRT5J00lZ
	lC6YrtkGINb2z4UHu0+vSHiAGsN/HhWSXWUMgHnqI53QBa+w9vuB7fSh8w9odkO4Bntqf0Ft+HTBD
	qqxTtRg4sMkwdfEu0mhWE2L9M2+YyK+vvI3xSYWo6YJLhmyntRieYfZOrZ4crcV6mDBd79qVz6U4+
	edfBA5/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2v77-0000000988j-21Ss;
	Wed, 18 Mar 2026 17:55:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2v73-0000000988F-3vzA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 17:55:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8E93843FC7;
	Wed, 18 Mar 2026 17:55:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A08CC19421;
	Wed, 18 Mar 2026 17:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773856521;
	bh=P7kc8uMgiIZ6+hoGNZb7Lk8njJKNoXVRMLqykWqJoGk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EiKdhGp6pdH65RIGYoSzbzMf8ER0a1QHMKbgVNC7S8zStXsscXtq7PQbte82l2Tqg
	 +WtCvx/g5Q5O/WCLTI+Szz0cAJGQpCbK467KwxsAMJOz+W3Y6THn1N6Bpo1+7hbPN1
	 PGL+UUQUudWs2KZ5ZYFNskog3b7S5KQ1hJaoiZi7rTaK/2UB6Do89Mcw2qYnPt7KEo
	 hoVqp7yZg39DZfMY1Dl0qY3PFub6rgRwYvu0mKzzEgcYkdiE8U5A6Z0S/75h+Ewlix
	 wRjjgkfsSlrmIinJhYWiXXRkj30qXUQ64JQiz2lKyT16nVfr/fcjV1GB2vaTK02sLa
	 SFPy2O2pbJp+g==
Date: Wed, 18 Mar 2026 17:55:34 +0000
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
Subject: Re: [PATCH v10 16/30] KVM: arm64: Support TPIDR2_EL0
Message-ID: <20260318175534.GN2390801@myrica>
References: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
 <20260306-kvm-arm64-sme-v10-16-43f7683a0fb7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306-kvm-arm64-sme-v10-16-43f7683a0fb7@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_105522_235906_26D456E6 
X-CRM114-Status: GOOD (  24.56  )
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

On Fri, Mar 06, 2026 at 05:01:08PM +0000, Mark Brown wrote:
> SME adds a new thread ID register, TPIDR2_EL0. This is used in userspace
> for delayed saving of the ZA state but in terms of the architecture is
> not really connected to SME other than being part of FEAT_SME. It has an
> independent fine grained trap and the runtime connection with the rest
> of SME is purely software defined.
> 
> Expose the register as a system register if the guest supports SME,
> context switching it along with the other EL0 TPIDRs.

I guess the register also needs to be added to locate_register(),
read_sr_from_cpu and write_sr_to_cpu now

> 
> Reviewed-by: Fuad Tabba <tabba@google.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_host.h          |  1 +
>  arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h | 15 +++++++++++++++
>  arch/arm64/kvm/sys_regs.c                  |  3 ++-
>  3 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index e5194ffc40a7..ec1ede0c3c12 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -445,6 +445,7 @@ enum vcpu_sysreg {
>  	CSSELR_EL1,	/* Cache Size Selection Register */
>  	TPIDR_EL0,	/* Thread ID, User R/W */
>  	TPIDRRO_EL0,	/* Thread ID, User R/O */
> +	TPIDR2_EL0,	/* Thread ID, Register 2 */
>  	TPIDR_EL1,	/* Thread ID, Privileged */
>  	CNTKCTL_EL1,	/* Timer Control Register (EL1) */
>  	PAR_EL1,	/* Physical Address Register */
> diff --git a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> index 5624fd705ae3..8c3b3d6df99f 100644
> --- a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> +++ b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> @@ -88,6 +88,17 @@ static inline bool ctxt_has_sctlr2(struct kvm_cpu_context *ctxt)
>  	return kvm_has_sctlr2(kern_hyp_va(vcpu->kvm));
>  }
>  
> +static inline bool ctxt_has_sme(struct kvm_cpu_context *ctxt)
> +{
> +	struct kvm_vcpu *vcpu;
> +
> +	if (!system_supports_sme())
> +		return false;

kvm_has_sme() already checks this

Thanks,
Jean

> +
> +	vcpu = ctxt_to_vcpu(ctxt);
> +	return kvm_has_sme(kern_hyp_va(vcpu->kvm));
> +}
> +
>  static inline bool ctxt_is_guest(struct kvm_cpu_context *ctxt)
>  {
>  	return host_data_ptr(host_ctxt) != ctxt;
> @@ -127,6 +138,8 @@ static inline void __sysreg_save_user_state(struct kvm_cpu_context *ctxt)
>  {
>  	ctxt_sys_reg(ctxt, TPIDR_EL0)	= read_sysreg(tpidr_el0);
>  	ctxt_sys_reg(ctxt, TPIDRRO_EL0)	= read_sysreg(tpidrro_el0);
> +	if (ctxt_has_sme(ctxt))
> +		ctxt_sys_reg(ctxt, TPIDR2_EL0)	= read_sysreg_s(SYS_TPIDR2_EL0);
>  }
>  
>  static inline void __sysreg_save_el1_state(struct kvm_cpu_context *ctxt)
> @@ -204,6 +217,8 @@ static inline void __sysreg_restore_user_state(struct kvm_cpu_context *ctxt)
>  {
>  	write_sysreg(ctxt_sys_reg(ctxt, TPIDR_EL0),	tpidr_el0);
>  	write_sysreg(ctxt_sys_reg(ctxt, TPIDRRO_EL0),	tpidrro_el0);
> +	if (ctxt_has_sme(ctxt))
> +		write_sysreg_s(ctxt_sys_reg(ctxt, TPIDR2_EL0), SYS_TPIDR2_EL0);
>  }
>  
>  static inline void __sysreg_restore_el1_state(struct kvm_cpu_context *ctxt,
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index f13ff8e630f2..66248fd48a7d 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -3511,7 +3511,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>  	  .visibility = s1poe_visibility },
>  	{ SYS_DESC(SYS_TPIDR_EL0), NULL, reset_unknown, TPIDR_EL0 },
>  	{ SYS_DESC(SYS_TPIDRRO_EL0), NULL, reset_unknown, TPIDRRO_EL0 },
> -	{ SYS_DESC(SYS_TPIDR2_EL0), undef_access },
> +	{ SYS_DESC(SYS_TPIDR2_EL0), NULL, reset_unknown, TPIDR2_EL0,
> +	  .visibility = sme_visibility},
>  
>  	{ SYS_DESC(SYS_SCXTNUM_EL0), undef_access },
>  
> 
> -- 
> 2.47.3
> 
> 

