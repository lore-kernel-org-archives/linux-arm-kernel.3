Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980A5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 23:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CjDwefjv1AyM6E5mlH5FqnsJuTuUDUpYfBrPdP92PPw=; b=SzhuqORyVqvOj24iVF/Sck2eqf
	GJfFTlCPsNKUqEHA9dK1HVoxon6GcvumoJNQw6m5Zsn27PXcwZAERwfLaE47GCvJeoA9GWz2lGew5
	mhCOuLIfxzewJqVyhKJzjr8/xFwXlSDafQgD3WLt4LgajVfkt24oKdHYIzzyXGq50w40bFGWZWJry
	CHxDslGV+tdsdLzivIbcXu8RvJ7yZa1Dl/bo+Phpnj5D/hsK4/LdVWejQ7LGeEar++h1fuwCdW/C7
	GoRFsP7HfYHhOwjrlhU6W6p3IYcghAWpvyplAHeM+xT/Skg6La0boifLtOZUQ4InzMm0tJk4bcr2W
	Jgq8pfqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4cm-00000003Eum-0lxv;
	Wed, 01 Jul 2026 23:45:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4ck-00000003Eu7-0mam
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 23:45:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C2C4F43674;
	Wed,  1 Jul 2026 23:45:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7379C1F000E9;
	Wed,  1 Jul 2026 23:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782949545;
	bh=CjDwefjv1AyM6E5mlH5FqnsJuTuUDUpYfBrPdP92PPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FFU227dB/thlEfqyQeBLjjYcz78UnSO2U27UwZJj9qRALcl0SZVeUJ2cYh9N24eSe
	 UOUb0mIsVvaSU0QOEpfk4PzmFzIlfRtfnGL2Iqs+LF5mB9Y/JMQLMRydkVmdlsrDcp
	 HwmApjgNK0D3VOeyBWoe2Kz/N6u9KOgYAZqkPkZKGseuhY745VDyvLO64XrbqIC3lo
	 WICLgo+SK+6peCB8HVzbsx93uzYKuUXtupqQ7Xmv2v8Hxmp2oEOVLfVlKbuC8BEPNH
	 b+p0Hw4xWWSFXBf9uDg5wvh9Hi+tn/uhxGgaLsPu7ACr/brXnUTjV0LgFfano2sA9D
	 8gpvFQD29zDgQ==
Date: Wed, 1 Jul 2026 16:45:44 -0700
From: Oliver Upton <oupton@kernel.org>
To: Colton Lewis <coltonlewis@google.com>
Cc: stable@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mingwei Zhang <mizhang@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
	Ahmed Genidi <ahmed.genidi@arm.com>,
	Ben Horgan <ben.horgan@arm.com>, Leo Yan <leo.yan@arm.com>
Subject: Re: [PATCH 4/5] KVM: arm64: Initialize HCR_EL2.E2H early
Message-ID: <akWmqLQ31UvRLCxt@kernel.org>
References: <20260701204342.2654385-1-coltonlewis@google.com>
 <20260701204342.2654385-5-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701204342.2654385-5-coltonlewis@google.com>
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

On Wed, Jul 01, 2026 at 08:43:41PM +0000, Colton Lewis wrote:
> From: Mark Rutland <mark.rutland@arm.com>
> 
> [ Upstream commit 7a68b55ff39b0d2dcd92ee241b12b23a7e03c621 ]
> 
> On CPUs without FEAT_E2H0, HCR_EL2.E2H is RES1, but may reset to an
> UNKNOWN value out of reset and consequently may not read as 1 unless it
> has been explicitly initialized.
> 
> We handled this for the head.S boot code in commits:
> 
>   3944382fa6f22b54 ("arm64: Treat HCR_EL2.E2H as RES1 when ID_AA64MMFR4_EL1.E2H0 is negative")
>   b3320142f3db9b3f ("arm64: Fix early handling of FEAT_E2H0 not being implemented")
> 
> Unfortunately, we forgot to apply a similar fix to the KVM PSCI entry
> points used when relaying CPU_ON, CPU_SUSPEND, and SYSTEM SUSPEND. When
> KVM is entered via these entry points, the value of HCR_EL2.E2H may be
> consumed before it has been initialized (e.g. by the 'init_el2_state'
> macro).
> 
> Initialize HCR_EL2.E2H early in these paths such that it can be consumed
> reliably. The existing code in head.S is factored out into a new
> 'init_el2_hcr' macro, and this is used in the __kvm_hyp_init_cpu()
> function common to all the relevant PSCI entry points.
> 
> For clarity, I've tweaked the assembly used to check whether
> ID_AA64MMFR4_EL1.E2H0 is negative. The bitfield is extracted as a signed
> value, and this is checked with a signed-greater-or-equal (GE) comparison.
> 
> As the hyp code will reconfigure HCR_EL2 later in ___kvm_hyp_init(), all
> bits other than E2H are initialized to zero in __kvm_hyp_init_cpu().
> 
> Fixes: 3944382fa6f22b54 ("arm64: Treat HCR_EL2.E2H as RES1 when ID_AA64MMFR4_EL1.E2H0 is negative")
> Fixes: b3320142f3db9b3f ("arm64: Fix early handling of FEAT_E2H0 not being implemented")
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Cc: Ahmed Genidi <ahmed.genidi@arm.com>
> Cc: Ben Horgan <ben.horgan@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Leo Yan <leo.yan@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Oliver Upton <oliver.upton@linux.dev>
> Cc: Will Deacon <will@kernel.org>
> Link: https://lore.kernel.org/r/20250227180526.1204723-2-mark.rutland@arm.com
> [maz: fixed LT->GE thinko]
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> 
> [ Backport: Resolved conflict in arch/arm64/kvm/hyp/nvhe/hyp-init.S
>   by extracting EL2 state initialization into __kvm_init_el2_state
>   and calling it after HCR setup. ]
> ---
>  arch/arm64/include/asm/el2_setup.h | 26 ++++++++++++++++++++++++++
>  arch/arm64/kernel/head.S           | 19 +------------------
>  arch/arm64/kvm/hyp/nvhe/hyp-init.S | 16 +++++++++++++---
>  3 files changed, 40 insertions(+), 21 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
> index b7afaa026842b..3498dc5d02c18 100644
> --- a/arch/arm64/include/asm/el2_setup.h
> +++ b/arch/arm64/include/asm/el2_setup.h
> @@ -16,6 +16,32 @@
>  #include <asm/sysreg.h>
>  #include <linux/irqchip/arm-gic-v3.h>
>  
> +.macro init_el2_hcr	val
> +	mov_q	x0, \val
> +
> +	/*
> +	 * Compliant CPUs advertise their VHE-onlyness with
> +	 * ID_AA64MMFR4_EL1.E2H0 < 0. On such CPUs HCR_EL2.E2H is RES1, but it
> +	 * can reset into an UNKNOWN state and might not read as 1 until it has
> +	 * been initialized explicitly.
> +	 *
> +	 * Fruity CPUs seem to have HCR_EL2.E2H set to RAO/WI, but
> +	 * don't advertise it (they predate this relaxation).
> +	 *
> +	 * Initalize HCR_EL2.E2H so that later code can rely upon HCR_EL2.E2H
> +	 * indicating whether the CPU is running in E2H mode.
> +	 */
> +	mrs_s	x1, SYS_ID_AA64MMFR4_EL1
> +	sbfx	x1, x1, #ID_AA64MMFR4_EL1_E2H0_SHIFT, #ID_AA64MMFR4_EL1_E2H0_WIDTH
> +	cmp	x1, #0
> +	b.ge	.LnVHE_\@
> +
> +	orr	x0, x0, #HCR_E2H
> +.LnVHE_\@:
> +	msr	hcr_el2, x0
> +	isb
> +.endm
> +
>  .macro __init_el2_sctlr
>  	mov_q	x0, INIT_SCTLR_EL2_MMU_OFF
>  	msr	sctlr_el2, x0
> diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
> index e0e710b36da37..ff7769821166a 100644
> --- a/arch/arm64/kernel/head.S
> +++ b/arch/arm64/kernel/head.S
> @@ -575,25 +575,8 @@ SYM_INNER_LABEL(init_el2, SYM_L_LOCAL)
>  	msr	sctlr_el2, x0
>  	isb
>  0:
> -	mov_q	x0, HCR_HOST_NVHE_FLAGS
> -
> -	/*
> -	 * Compliant CPUs advertise their VHE-onlyness with
> -	 * ID_AA64MMFR4_EL1.E2H0 < 0. HCR_EL2.E2H can be
> -	 * RES1 in that case. Publish the E2H bit early so that
> -	 * it can be picked up by the init_el2_state macro.
> -	 *
> -	 * Fruity CPUs seem to have HCR_EL2.E2H set to RAO/WI, but
> -	 * don't advertise it (they predate this relaxation).
> -	 */
> -	mrs_s	x1, SYS_ID_AA64MMFR4_EL1
> -	tbz	x1, #(ID_AA64MMFR4_EL1_E2H0_SHIFT + ID_AA64MMFR4_EL1_E2H0_WIDTH - 1), 1f
> -
> -	orr	x0, x0, #HCR_E2H
> -1:
> -	msr	hcr_el2, x0
> -	isb
>  
> +	init_el2_hcr	HCR_HOST_NVHE_FLAGS
>  	init_el2_state
>  
>  	/* Hypervisor stub */
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-init.S b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
> index 1cc06e6797bda..a08363b9b10fd 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-init.S
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
> @@ -75,6 +75,16 @@ __do_hyp_init:
>  	eret
>  SYM_CODE_END(__kvm_hyp_init)
>  
> +/*
> + * Initialize EL2 CPU state to sane values.
> + *
> + * HCR_EL2.E2H must have been initialized already.
> + */
> +SYM_CODE_START_LOCAL(__kvm_init_el2_state)
> +	init_el2_state				// Clobbers x0..x2
> +	finalise_el2_state
> +	ret
> +SYM_CODE_END(__kvm_init_el2_state)
>  /*
>   * Initialize the hypervisor in EL2.
>   *
> @@ -202,9 +212,9 @@ SYM_CODE_START_LOCAL(__kvm_hyp_init_cpu)
>  
>  2:	msr	SPsel, #1			// We want to use SP_EL{1,2}
>  
> -	/* Initialize EL2 CPU state to sane values. */
> -	init_el2_state				// Clobbers x0..x2
> -	finalise_el2_state
> +	init_el2_hcr	0
> +
> +	bl	__kvm_init_el2_state

Please don't churn unrelated code. Leave everything where it is and make
sure init_el2_hcr is done before the others.

Thanks,
Oliver

