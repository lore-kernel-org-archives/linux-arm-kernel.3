Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC897CF6C1F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 09:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oum+pytf/nQbx6llDES9sgvrJWVFukr4AF9wrdOA7Cw=; b=auLZm9+luPM+ltxB/niz+4paAH
	23CiP4kmT3Cxxb+eghdpdkwittu+8Rjy0lU/Ej0/GLeqlJYg4FSNWLwtk/4Hzea0JHPmyA4b3iHhz
	tuIvvbFhTR7/mkBx2V7zz1p0pb6Q/3ZCM5LinZ8nAi3N67REU+DfNatQcdGew/ZGdfucNUkPqEmnB
	g7GRHX4yZ5vJjSjv6l+PnSNTtRfJx0G0gZTV+WZltvDAGrUT+rowOKVs3xRznLD4nWiTgDg2j8PX5
	m39BgGzRpHCayDuZ6h6YZEKdhuXG9iRsNcnznP5hubVEkJiqMLSHgW28W0nVjgUASnMBM7yry9ccx
	qzE2mz7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQ4o-0000000EZ2M-06io;
	Wed, 07 Jan 2026 09:43:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQ4l-0000000EYzO-0QK4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 09:43:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B94A497;
	Wed,  7 Jan 2026 01:43:23 -0800 (PST)
Received: from [10.57.49.120] (unknown [10.57.49.120])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A2A9C3F5A1;
	Wed,  7 Jan 2026 01:43:27 -0800 (PST)
Message-ID: <af65f271-5af9-432d-bec9-e44638db9b9f@arm.com>
Date: Wed, 7 Jan 2026 10:43:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: fix cleared E0POE bit after cpu_suspend()/resume()
To: Yeoreum Yun <yeoreum.yun@arm.com>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: rafael@kernel.org, pavel@kernel.org, catalin.marinas@arm.com,
 will@kernel.org, anshuman.khandual@arm.com, ryan.roberts@arm.com,
 yang@os.amperecomputing.com, joey.gouly@arm.com
References: <20260105200707.2071169-1-yeoreum.yun@arm.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260105200707.2071169-1-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_014335_273748_73D72EC9 
X-CRM114-Status: GOOD (  19.34  )
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

On 05/01/2026 21:07, Yeoreum Yun wrote:
> TCR2_ELx.E0POE is set during smp_init().
> However, this bit is not reprogrammed when the CPU enters suspension and
> later resumes via cpu_resume(), as __cpu_setup() does not re-enable E0POE
> and there is no save/restore logic for the TCR2_ELx system register.
>
> As a result, the E0POE feature no longer works after cpu_resume().
>
> To address this, save and restore TCR2_EL1 in the cpu_suspend()/cpu_resume()
> path, rather than adding related logic to __cpu_setup(), taking into account
> possible future extensions of the TCR2_ELx feature.

This is a very good catch!

> Fixes: bf83dae90fbc ("arm64: enable the Permission Overlay Extension for EL0")

We should also Cc: stable@vger.kernel.org as this should be backported
to stable kernels that support POE.

> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
> NOTE:
>   This patch based on v6.19-rc4
> ---
>  arch/arm64/include/asm/suspend.h |  2 +-
>  arch/arm64/mm/proc.S             | 22 ++++++++++++++--------
>  2 files changed, 15 insertions(+), 9 deletions(-)
>
> diff --git a/arch/arm64/include/asm/suspend.h b/arch/arm64/include/asm/suspend.h
> index e65f33edf9d6..e9ce68d50ba4 100644
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
> index 01e868116448..3888f2ca43fb 100644
> --- a/arch/arm64/mm/proc.S
> +++ b/arch/arm64/mm/proc.S
> @@ -97,8 +97,11 @@ SYM_FUNC_START(cpu_do_suspend)
>  	mrs	x9, mdscr_el1
>  	mrs	x10, oslsr_el1
>  	mrs	x11, sctlr_el1
> -	get_this_cpu_offset x12
> -	mrs	x13, sp_el0
> +alternative_if ARM64_HAS_TCR2
> +	mrs	x12, REG_TCR2_EL1
> +alternative_else_nop_endif
> +	get_this_cpu_offset x13
> +	mrs	x14, sp_el0
>  	stp	x2, x3, [x0]
>  	stp	x4, x5, [x0, #16]
>  	stp	x6, x7, [x0, #32]
> @@ -109,7 +112,7 @@ SYM_FUNC_START(cpu_do_suspend)
>  	 * Save x18 as it may be used as a platform register, e.g. by shadow
>  	 * call stack.
>  	 */
> -	str	x18, [x0, #96]
> +	stp	x14, x18, [x0, #96]

If TCR2_EL1 isn't supported, we store and reload an unused arbitrary
value. I think it'd be better to make it all conditional and add it at
the end, something like:

    alternative_if ARM64_HAS_TCR2
        mrs    x2, REG_TCR2_EL1
        str    x2, [x0, #104]
    alternative_else_nop_endif

Same idea on the resume path. This also avoids the noise of renaming
existing registers.

- Kevin

>  	ret
>  SYM_FUNC_END(cpu_do_suspend)
>
> @@ -130,8 +133,8 @@ SYM_FUNC_START(cpu_do_resume)
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
> @@ -144,10 +147,13 @@ SYM_FUNC_START(cpu_do_resume)
>  	msr	tcr_el1, x8
>  	msr	vbar_el1, x9
>  	msr	mdscr_el1, x10
> +alternative_if ARM64_HAS_TCR2
> +	msr	REG_TCR2_EL1, x13
> +alternative_else_nop_endif
>
>  	msr	sctlr_el1, x12
> -	set_this_cpu_offset x13
> -	msr	sp_el0, x14
> +	set_this_cpu_offset x14
> +	msr	sp_el0, x15
>  	/*
>  	 * Restore oslsr_el1 by writing oslar_el1
>  	 */
> @@ -161,7 +167,7 @@ alternative_if ARM64_HAS_RAS_EXTN
>  	msr_s	SYS_DISR_EL1, xzr
>  alternative_else_nop_endif
>
> -	ptrauth_keys_install_kernel_nosync x14, x1, x2, x3
> +	ptrauth_keys_install_kernel_nosync x15, x1, x2, x3
>  	isb
>  	ret
>  SYM_FUNC_END(cpu_do_resume)
> --
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
>

