Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96DE2D0D143
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 16:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CbT8XOkYcdMPnoZ82FJoEtPgqYxFFb5mjLUN404iVdo=; b=oVh/nws4Peo+1YSI+RAmM7fgLf
	gg4Bm7MS1YaJBxnmgnZ+k+boBRg1Fn0VQt6c3QRf/TL7qovUdzRczpAwcbOA7iMPiRIeeo1Hqp4OS
	S7o+SzOovBbPgtPx5UobBHrWwOq+yPqS4A0GWjtwtxLpLlQd7rLWkjy1Lnk6m6RK7rVkQjFxVVjfv
	8a1LKNU3Ef/dLwXP5NinbOtwaOXiF2VhYCn02snM7/Y78B/CdrLKMqIdteAchbqBSC7CiGn1m+Vql
	bcxaB3QrwWNMHQwHWzTLOzJBH6PvZbbzL4FNzLNhVSxM+4xDb6R6KiyU/XezbfWHr5oQwE0yCoc4O
	k/dh7m+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWnZ-0000000FLB0-3qEK;
	Wed, 07 Jan 2026 16:54:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWnX-0000000FLAc-45Fr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 16:54:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45325497;
	Wed,  7 Jan 2026 08:54:08 -0800 (PST)
Received: from [10.57.46.202] (unknown [10.57.46.202])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B76E33F6A8;
	Wed,  7 Jan 2026 08:54:11 -0800 (PST)
Message-ID: <846e1998-b508-4433-9db6-3a52ff23552f@arm.com>
Date: Wed, 7 Jan 2026 17:54:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: fix cleared E0POE bit after
 cpu_suspend()/resume()
To: Yeoreum Yun <yeoreum.yun@arm.com>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: rafael@kernel.org, pavel@kernel.org, catalin.marinas@arm.com,
 will@kernel.org, anshuman.khandual@arm.com, ryan.roberts@arm.com,
 yang@os.amperecomputing.com, joey.gouly@arm.com, stable@vger.kernel.org
References: <20260107162115.3292205-1-yeoreum.yun@arm.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260107162115.3292205-1-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_085416_054817_33960819 
X-CRM114-Status: GOOD (  17.40  )
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

On 07/01/2026 17:21, Yeoreum Yun wrote:
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
>
> Cc: stable@vger.kernel.org
> Fixes: bf83dae90fbc ("arm64: enable the Permission Overlay Extension for EL0")
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>
> Patch History
> ==============
> from v1 to v2:
>   - following @Kevin Brodsky suggestion.
>   - https://lore.kernel.org/all/20260105200707.2071169-1-yeoreum.yun@arm.com/
>
> NOTE:
>   This patch based on v6.19-rc4
> ---
>  arch/arm64/include/asm/suspend.h | 2 +-
>  arch/arm64/mm/proc.S             | 8 ++++++++
>  2 files changed, 9 insertions(+), 1 deletion(-)
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
> index 01e868116448..5d907ce3b6d3 100644
> --- a/arch/arm64/mm/proc.S
> +++ b/arch/arm64/mm/proc.S
> @@ -110,6 +110,10 @@ SYM_FUNC_START(cpu_do_suspend)
>  	 * call stack.
>  	 */
>  	str	x18, [x0, #96]
> +alternative_if ARM64_HAS_TCR2
> +	mrs	x2, REG_TCR2_EL1
> +	str	x2, [x0, #104]
> +alternative_else_nop_endif
>  	ret
>  SYM_FUNC_END(cpu_do_suspend)
>
> @@ -144,6 +148,10 @@ SYM_FUNC_START(cpu_do_resume)
>  	msr	tcr_el1, x8
>  	msr	vbar_el1, x9
>  	msr	mdscr_el1, x10
> +alternative_if ARM64_HAS_TCR2
> +	ldr	x2, [x0, #104]
> +	msr	REG_TCR2_EL1, x2
> +alternative_else_nop_endif

Maybe this could be pushed further down cpu_do_resume, next to DISR_EL1
maybe (since it's also conditional)? Otherwise the diff LGTM:

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>

- Kevin

>  	msr	sctlr_el1, x12
>  	set_this_cpu_offset x13
> --
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
>

