Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0389DE77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 14:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uRj+HkeBHdq6QcWW+CFMSJJ5qmvrZBtFRluNN7+Cxyo=; b=fnpg90BcRfUbV5QNL553Pa0Rem
	0QjSML6jGa+dushHUTHWjUyKP8+m228pRUMOV9CRK17X8zHEpLTo6JqOiJKkjbkzpf7L1scr2NY0T
	OxHjggHVk4n9iBQXKsXPwCdpQTnHg/3TWJQNTBcLG+J+OtqZbZsxsjvRxh+m+1mEUfvfBehKD2vmL
	fqo81LPTRyKFKGJUfNppuWT+fQylEd7CIP6co7sdayv1QgIb114o+Wd+HcA3kKzjSjQRRd18VbY8t
	87YI1aoIFGP5kNEwcBvHi5AeNViSSc8ARqZQjgqOQVCeKAOjPoWO7RsscJsLk5IfLgR5+G57Ub4KL
	1TF+PA/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKeLH-000000087uE-0OtW;
	Mon, 09 Dec 2024 14:02:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKeGA-000000086uB-07y5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 13:57:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EFC4A339;
	Mon,  9 Dec 2024 05:57:40 -0800 (PST)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8169E3F720;
	Mon,  9 Dec 2024 05:57:11 -0800 (PST)
Date: Mon, 9 Dec 2024 13:57:08 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/4] arm64/sysreg: Get rid of the TCR2_EL1x SysregFields
Message-ID: <Z1b3NEoIALJYCdL9@J2N7QTR9R3.cambridge.arm.com>
References: <20241207190740.2607673-1-maz@kernel.org>
 <20241207190740.2607673-3-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241207190740.2607673-3-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_055714_152940_BB69CD4D 
X-CRM114-Status: GOOD (  21.13  )
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

On Sat, Dec 07, 2024 at 07:07:38PM +0000, Marc Zyngier wrote:
> TCR2_ELx is a pretty bizarre construct, as it is shared between
> TCR2_EL1 and TCR2_EL12. But the latter is obviously only an
> accessor to the former.

Minor nit, but I believe that the first 'TCR2_ELx' here should be
'TCR2_EL1x'.

> In order to make things more consistent, upgrade TCR2_EL1x to
> a full-blown sysreg definition for TCR2_EL1, and describe TCR2_EL12
> as a mapping to TCR2_EL1.
> 
> This results in a couple of minor changes to the actual code.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>

I agree the *_EL1x thins is horrid.

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
>  arch/arm64/kernel/cpufeature.c | 2 +-
>  arch/arm64/kvm/at.c            | 6 +++---
>  arch/arm64/mm/proc.S           | 5 +++--
>  arch/arm64/tools/sysreg        | 8 ++------
>  4 files changed, 9 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 6ce71f444ed84..7712df48758e9 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -2376,7 +2376,7 @@ static void cpu_enable_mops(const struct arm64_cpu_capabilities *__unused)
>  #ifdef CONFIG_ARM64_POE
>  static void cpu_enable_poe(const struct arm64_cpu_capabilities *__unused)
>  {
> -	sysreg_clear_set(REG_TCR2_EL1, 0, TCR2_EL1x_E0POE);
> +	sysreg_clear_set(REG_TCR2_EL1, 0, TCR2_EL1_E0POE);
>  	sysreg_clear_set(CPACR_EL1, 0, CPACR_ELx_E0POE);
>  }
>  #endif
> diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
> index 8c5d7990e5b31..0905b8778a9bb 100644
> --- a/arch/arm64/kvm/at.c
> +++ b/arch/arm64/kvm/at.c
> @@ -111,7 +111,7 @@ static bool s1pie_enabled(struct kvm_vcpu *vcpu, enum trans_regime regime)
>  		return vcpu_read_sys_reg(vcpu, TCR2_EL2) & TCR2_EL2_PIE;
>  	case TR_EL10:
>  		return  (__vcpu_sys_reg(vcpu, HCRX_EL2) & HCRX_EL2_TCR2En) &&
> -			(__vcpu_sys_reg(vcpu, TCR2_EL1) & TCR2_EL1x_PIE);
> +			(__vcpu_sys_reg(vcpu, TCR2_EL1) & TCR2_EL1_PIE);
>  	default:
>  		BUG();
>  	}
> @@ -140,8 +140,8 @@ static void compute_s1poe(struct kvm_vcpu *vcpu, struct s1_walk_info *wi)
>  		}
>  
>  		val = __vcpu_sys_reg(vcpu, TCR2_EL1);
> -		wi->poe = val & TCR2_EL1x_POE;
> -		wi->e0poe = val & TCR2_EL1x_E0POE;
> +		wi->poe = val & TCR2_EL1_POE;
> +		wi->e0poe = val & TCR2_EL1_E0POE;
>  	}
>  }
>  
> diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
> index b8edc5765441e..fb30c8804f87b 100644
> --- a/arch/arm64/mm/proc.S
> +++ b/arch/arm64/mm/proc.S
> @@ -501,7 +501,7 @@ alternative_else_nop_endif
>  #ifdef CONFIG_ARM64_HAFT
>  	cmp	x9, ID_AA64MMFR1_EL1_HAFDBS_HAFT
>  	b.lt	1f
> -	orr	tcr2, tcr2, TCR2_EL1x_HAFT
> +	orr	tcr2, tcr2, TCR2_EL1_HAFT
>  #endif /* CONFIG_ARM64_HAFT */
>  1:
>  #endif	/* CONFIG_ARM64_HW_AFDBM */
> @@ -532,7 +532,8 @@ alternative_else_nop_endif
>  #undef PTE_MAYBE_NG
>  #undef PTE_MAYBE_SHARED
>  
> -	orr	tcr2, tcr2, TCR2_EL1x_PIE
> +	orr	tcr2, tcr2, TCR2_EL1_PIE
> +	msr	REG_TCR2_EL1, x0
>  
>  .Lskip_indirection:
>  
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index b6846c601df6c..19d137d9c50ed 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -2999,7 +2999,7 @@ Sysreg	TTBR1_EL1	3	0	2	0	1
>  Fields	TTBRx_EL1
>  EndSysreg
>  
> -SysregFields	TCR2_EL1x
> +Sysreg	TCR2_EL1	3	0	2	0	3
>  Res0	63:16
>  Field	15	DisCH1
>  Field	14	DisCH0
> @@ -3013,14 +3013,10 @@ Field	3	POE
>  Field	2	E0POE
>  Field	1	PIE
>  Field	0	PnCH
> -EndSysregFields
> -
> -Sysreg	TCR2_EL1	3	0	2	0	3
> -Fields	TCR2_EL1x
>  EndSysreg
>  
>  Sysreg	TCR2_EL12	3	5	2	0	3
> -Fields	TCR2_EL1x
> +Mapping	TCR2_EL1
>  EndSysreg
>  
>  Sysreg	TCR2_EL2	3	4	2	0	3
> -- 
> 2.39.2
> 

