Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6498C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 07:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pyYC1iMrBwdNnUzlPwAf62D4fFDGiJfRBxsWNmJqGik=; b=LyOxE4AFCv/SNJ
	XveUYnfXoJpb7Lrc3l4b4+1HVLDmvarKQkaWymvfk6b3PRWajnOoax4CYpXujx5cYuou6Oeu1sj2y
	IUdsoA1zhVbSNJw+s+SLtlXG76VjvyTn1tvkRXdWGv4MooVkKujW4g7MsSIO/mMqsdyo8+lTxp7vE
	AYrn2kjU7FzTCKoi2GFnL355z+lT5/uKsnoz1IZWzX7AaJag1PYDmZafr25ktA9xmkMDnMWqQNr5V
	U3dIrq6PRRcYcGys5Yc5SdCei2LcfOAjvJR7YUgLVXM14IbykGuCjlqHGBhB5Mu/yuVEHJ0laIwTs
	CafoWmdJpyvqYf0+he4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi674-00000004OTY-402Q;
	Fri, 10 Jul 2026 07:57:34 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi670-00000004OSv-3ckX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 07:57:33 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=pyYC1iMrBwdNnUzlPwAf62D4fFDGiJfRBxsWNmJqGik=;
	b=Xt0DiEH3wTBnHHgJm7NYat6g6r9RA18DzQ3dDpiUFOFYseyRgFCHML/vmIY+uCj3Xq42UiYNr
	7MrUTsuTZFCJtipf9ngZ1oXz2vux1xSxm5CgyH0gbh45L2A/cRvlL9k7AXZxbPTizcNfDt+2YNa
	VNDpU+Z4XO1QPn3H4YygFM8=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4gxP872RsDzmV98;
	Fri, 10 Jul 2026 15:48:07 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id BE2FA4056C;
	Fri, 10 Jul 2026 15:57:22 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 10 Jul 2026 15:57:22 +0800
Message-ID: <495a9d3f-ad12-4927-84c0-6f8f89cf9a06@huawei.com>
Date: Fri, 10 Jul 2026 15:57:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 07/36] arm64: entry: mask DAIF before returning from C
 EL1 handlers
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-8-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260709121333.23507-8-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_005731_546005_C8613409 
X-CRM114-Status: GOOD (  15.82  )
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
Cc: mark.rutland@arm.com, maz@kernel.org, will@kernel.org, catalin.marinas@arm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 7/9/2026 8:13 PM, Vladimir Murzin wrote:
> From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> 
> Most EL1 exceptions already call `local_daif_mask()` before returning,
> with the exception of debug exception handlers which do not change
> DAIF, and the IRQ/FIQ/Error handlers.
> 
> However, DAIF get masked in `kernel_exit()` in all cases when
> returning from EL1 C handlers anyway.
> 
> Move this masking from assembly to C by adding `local_daif_mask()`
> before `irqentry_nmi_exit()` when it is called by EL1 handlers.
> 
> Remove the `disable_daif` assembly macro, as this was its only use.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  arch/arm64/include/asm/assembler.h | 4 ----
>  arch/arm64/kernel/entry-common.c   | 2 ++
>  arch/arm64/kernel/entry.S          | 4 ----
>  3 files changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
> index effae53e9739..0b58b550e8dc 100644
> --- a/arch/arm64/include/asm/assembler.h
> +++ b/arch/arm64/include/asm/assembler.h
> @@ -34,10 +34,6 @@
>  	wx\n	.req	w\n
>  	.endr
>  
> -	.macro disable_daif
> -	msr	daifset, #0xf
> -	.endm
> -
>  /*
>   * Save/restore interrupts.
>   */
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index ceb4eb11232a..2be42d7f4eaa 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -495,6 +495,7 @@ static __always_inline void __el1_pnmi(struct pt_regs *regs,
>  
>  	state = irqentry_nmi_enter(regs);
>  	do_interrupt_handler(regs, handler);
> +	local_daif_mask();
>  	irqentry_nmi_exit(regs, state);
>  }
>  
> @@ -540,6 +541,7 @@ asmlinkage void noinstr el1h_64_error_handler(struct pt_regs *regs)
>  	local_daif_restore(DAIF_ERRCTX);
>  	state = irqentry_nmi_enter(regs);
>  	do_serror(regs, esr);
> +	local_daif_mask();
>  	irqentry_nmi_exit(regs, state);

This is similar to my patch below:

https://lore.kernel.org/all/20260703100135.2512312-4-ruanjinjie@huawei.com/

I think there are at least three problems：

1、disable_daif is missing for el1h_64_sync_handler() and __el1_irq()

2、The order after moving to the C code is incorrect. disable_daif should
be the exit point for C, that is, after irqentry_nmi_exit(), it is
unclear why this order change occurred ?

3、local_daif_mask () has added some pseudo NMI operations and
trace_hardirqs_off ().

>  }
>  
> diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
> index e0db14e9c843..f63049ac32dc 100644
> --- a/arch/arm64/kernel/entry.S
> +++ b/arch/arm64/kernel/entry.S
> @@ -333,10 +333,6 @@ alternative_else_nop_endif
>  	.endm
>  
>  	.macro	kernel_exit, el
> -	.if	\el != 0
> -	disable_daif
> -	.endif
> -
>  #ifdef CONFIG_ARM64_PSEUDO_NMI
>  alternative_if_not ARM64_HAS_GIC_PRIO_MASKING
>  	b	.Lskip_pmr_restore\@


