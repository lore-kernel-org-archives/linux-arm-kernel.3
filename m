Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABCDECA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 18:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yGCivEvUAu+3ELX/MGFXmtb10AeMfiWEmS7oX0zW3pw=; b=V1/uYebyVgjFfB/rWa/s908Y0W
	skC4KWjg0ZKGdHSD5qPVesCtUQKGNPq0LODc6DI6CkhVBvTOckotQx0PyQA2H2XOes16dOKjCjT7+
	2dgYa+QGluAbHs1AyZgiGBqQnk6Jlg0KFVbMQMwHUWNM/4zc/iX1OMMhCzpayMr/3IW+/SR+9aTLO
	ZTcxus5YeIARyfPgeugsrOlzzyuibMciSKfsr8qNLN0jFKQMW0Rmi7Etm76oz/jfs/EF3eJEsb6Z0
	2lhgCa2bVYPCu6jLqsEITV8mxoLXO8BwrxVpJAlr2uJHtQw/K5/YE+GqQ7Noj5wljO5t+ARwWtsgS
	UZKl+bhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uonfr-0000000EhNr-1Sef;
	Wed, 20 Aug 2025 18:36:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uokTA-0000000ECdq-2Gs5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 15:11:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C16C51D31;
	Wed, 20 Aug 2025 08:11:11 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.68])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 356AE3F738;
	Wed, 20 Aug 2025 08:11:16 -0700 (PDT)
Date: Wed, 20 Aug 2025 16:11:13 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, broonie@kernel.org,
	oliver.upton@linux.dev, anshuman.khandual@arm.com, robh@kernel.org,
	james.morse@arm.com, mark.rutland@arm.com, joey.gouly@arm.com,
	ahmed.genidi@arm.com, kevin.brodsky@arm.com,
	scott@os.amperecomputing.com, mbenes@suse.cz,
	james.clark@linaro.org, frederic@kernel.org, rafael@kernel.org,
	pavel@kernel.org, ryan.roberts@arm.com, suzuki.poulose@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH v3 3/5] arm64: save/restore SCTLR2_EL1 when
 cpu_suspend()/resume()
Message-ID: <aKXlkdHeBo+erWcB@e133380.arm.com>
References: <20250813120118.3953541-1-yeoreum.yun@arm.com>
 <20250813120118.3953541-4-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813120118.3953541-4-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_081120_676060_06AC401A 
X-CRM114-Status: GOOD (  18.85  )
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

Hi,

On Wed, Aug 13, 2025 at 01:01:16PM +0100, Yeoreum Yun wrote:
> SCTLR2_EL1 register is optional starting from ARMv8.8/ARMv9.3,
> and becomes mandatory from ARMv8.9/ARMv9.4
> and serveral architectural feature are controled by bits in
> these registers (i.e) FEAT_PAuth_LR or FEAT_CPA/CPA2
> 
> Save and restore SCTLR2_EL1 when cpu_suspend() and resume().
> so that configured value can sustain consistency before suspend and
> after resume.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  arch/arm64/include/asm/suspend.h |  2 +-
>  arch/arm64/mm/proc.S             | 26 ++++++++++++++++++--------
>  2 files changed, 19 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/suspend.h b/arch/arm64/include/asm/suspend.h
> index 0cde2f473971..eb60c9735553 100644
> --- a/arch/arm64/include/asm/suspend.h
> +++ b/arch/arm64/include/asm/suspend.h
> @@ -2,7 +2,7 @@
>  #ifndef __ASM_SUSPEND_H
>  #define __ASM_SUSPEND_H
>  
> -#define NR_CTX_REGS 13
> +#define NR_CTX_REGS 14
>  #define NR_CALLEE_SAVED_REGS 12
>  
>  /*
> diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
> index 8c75965afc9e..f297bea7103b 100644
> --- a/arch/arm64/mm/proc.S
> +++ b/arch/arm64/mm/proc.S
> @@ -87,8 +87,14 @@ SYM_FUNC_START(cpu_do_suspend)
>  	mrs	x9, mdscr_el1
>  	mrs	x10, oslsr_el1
>  	mrs	x11, sctlr_el1
> -	get_this_cpu_offset x12
> -	mrs	x13, sp_el0
> +alternative_if_not ARM64_HAS_SCTLR2
> +	mov	x12, xzr

Looking at this, maybe it can just be a nop for the !ARM64_HAS_SCTLR2
case.

(So, alternative_if ... alternative_if_else_nop_endif, similarly to
what you have in cpu_do_resume.)

The memory used to save this state should not be accessible to anything
less privileged than the kernel anyway, so leaking whatever was in x12
does not really feel like a concern...


> +alternative_else
> +	mrs_s	x12, SYS_SCTLR2_EL1
> +alternative_endif
> +	get_this_cpu_offset x13
> +	mrs	x14, sp_el0
> +
>  	stp	x2, x3, [x0]
>  	stp	x4, x5, [x0, #16]
>  	stp	x6, x7, [x0, #32]
> @@ -99,7 +105,7 @@ SYM_FUNC_START(cpu_do_suspend)
>  	 * Save x18 as it may be used as a platform register, e.g. by shadow
>  	 * call stack.
>  	 */
> -	str	x18, [x0, #96]
> +	stp	x14, x18, [x0, #96]
>  	ret
>  SYM_FUNC_END(cpu_do_suspend)
>  
> @@ -120,8 +126,8 @@ SYM_FUNC_START(cpu_do_resume)
>  	 * the buffer to minimize the risk of exposure when used for shadow
>  	 * call stack.
>  	 */
> -	ldr	x18, [x0, #96]
> -	str	xzr, [x0, #96]
> +	ldp	x15, x18, [x0, #96]
> +	str	xzr, [x0, #104]
>  	msr	tpidr_el0, x2
>  	msr	tpidrro_el0, x3
>  	msr	contextidr_el1, x4
> @@ -136,8 +142,12 @@ SYM_FUNC_START(cpu_do_resume)
>  	msr	mdscr_el1, x10
>  
>  	msr	sctlr_el1, x12
> -	set_this_cpu_offset x13
> -	msr	sp_el0, x14
> +alternative_if ARM64_HAS_SCTLR2
> +	msr_s	SYS_SCTLR2_EL1, x13
> +alternative_else_nop_endif
> +
> +	set_this_cpu_offset x14
> +	msr	sp_el0, x15
>  	/*
>  	 * Restore oslsr_el1 by writing oslar_el1
>  	 */
> @@ -151,7 +161,7 @@ alternative_if ARM64_HAS_RAS_EXTN
>  	msr_s	SYS_DISR_EL0, xzr
>  alternative_else_nop_endif
>  
> -	ptrauth_keys_install_kernel_nosync x14, x1, x2, x3
> +	ptrauth_keys_install_kernel_nosync x15, x1, x2, x3
>  	isb
>  	ret
>  SYM_FUNC_END(cpu_do_resume)
> -- 
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}

Otherwise, this looks OK to me.

Cheers
---Dave

