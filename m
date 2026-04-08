Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A0EC105D992
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 01:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S3K8W6XadrkzzITKWyFi2YXLD4Lw3Sy7gIPpFStdzas=; b=FmLM1G3nivWOeR
	KnP0JjUJA1AYXI5i35h+nmEdOPZcDODi1heXSyY1iN94o/7VHELaeGl/9eHPCcm6mK7QsVB0O5Jaq
	vIZg9FLIbx8zqwWdnGCc278F+I7l4U6WDbLk739MFYlWuVtKBlZI0y8c28I/blwtyrtX3BW6wOvHo
	MThNSamUk1LiK/8JNBlxsvAu/GscH1YAlWf1CiHsra4iYf81zPYOW76RTWcyGdsmQ/TA1Me1OiKHn
	6IS135Ggy6lAKWYuD3/m1xYWFoP17BksJIvpB+aQMzAwBBkKrSv1o9G6kaXSyXAOqwT54HOdMEm3C
	jbcPhY+kOZ7W26R0nhwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAI2c-000000086NK-3fdO;
	Wed, 08 Apr 2026 01:49:14 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAI2a-000000086Mp-1eR0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 01:49:13 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=S3K8W6XadrkzzITKWyFi2YXLD4Lw3Sy7gIPpFStdzas=;
	b=Sg46r535GiLVioFW1VZ6hVRbW3bOYspGoSM8qlS4aVWdXlyr3jDecCP5rchSULCeyuSqGgylI
	Rj4QP9h1f2mm1Ub3VgjbMUmxa/lIz2yYL1GIIamRlO2fmTG9td87AhUXY3ZtOpDuFXW0qZrqoNf
	xr2013impAhBIJyTgI70HS8=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4fr5Rx0GCszpSwg;
	Wed,  8 Apr 2026 09:43:09 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id AA6F34056D;
	Wed,  8 Apr 2026 09:49:08 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 8 Apr 2026 09:49:07 +0800
Message-ID: <eaf342d3-ff06-8428-6977-dbffd3d42340@huawei.com>
Date: Wed, 8 Apr 2026 09:49:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 07/10] arm64: entry: Consistently prefix arm64-specific
 wrappers
Content-Language: en-US
To: Mark Rutland <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
References: <20260407131650.3813777-1-mark.rutland@arm.com>
 <20260407131650.3813777-8-mark.rutland@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260407131650.3813777-8-mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_184912_756733_1AA2A179 
X-CRM114-Status: GOOD (  15.56  )
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
Cc: vladimir.murzin@arm.com, peterz@infradead.org, linux-kernel@vger.kernel.org, tglx@kernel.org, luto@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 2026/4/7 21:16, Mark Rutland wrote:
> For historical reasons, arm64's entry code has arm64-specific functions
> named enter_from_kernel_mode() and exit_to_kernel_mode(), which are
> wrappers for similarly-named functions from the generic irqentry code.
> Other arm64-specific wrappers have an 'arm64_' prefix to clearly
> distinguish them from their generic counterparts, e.g.
> arm64_enter_from_user_mode() and arm64_exit_to_user_mode().
> 
> For consistency and clarity, add an 'arm64_' prefix to these functions.
> 
> There should be no functional change as a result of this patch.
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Thomas Gleixner <tglx@kernel.org>
> Cc: Vladimir Murzin <vladimir.murzin@arm.com>
> Cc: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kernel/entry-common.c | 38 ++++++++++++++++----------------
>  1 file changed, 19 insertions(+), 19 deletions(-)

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

> 
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index 3625797e9ee8f..3d01cdacdc7a2 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -35,7 +35,7 @@
>   * Before this function is called it is not safe to call regular kernel code,
>   * instrumentable code, or any code which may trigger an exception.
>   */
> -static noinstr irqentry_state_t enter_from_kernel_mode(struct pt_regs *regs)
> +static noinstr irqentry_state_t arm64_enter_from_kernel_mode(struct pt_regs *regs)
>  {
>  	irqentry_state_t state;
>  
> @@ -51,8 +51,8 @@ static noinstr irqentry_state_t enter_from_kernel_mode(struct pt_regs *regs)
>   * After this function returns it is not safe to call regular kernel code,
>   * instrumentable code, or any code which may trigger an exception.
>   */
> -static void noinstr exit_to_kernel_mode(struct pt_regs *regs,
> -					irqentry_state_t state)
> +static void noinstr arm64_exit_to_kernel_mode(struct pt_regs *regs,
> +					      irqentry_state_t state)
>  {
>  	mte_check_tfsr_exit();
>  	irqentry_exit(regs, state);
> @@ -298,11 +298,11 @@ static void noinstr el1_abort(struct pt_regs *regs, unsigned long esr)
>  	unsigned long far = read_sysreg(far_el1);
>  	irqentry_state_t state;
>  
> -	state = enter_from_kernel_mode(regs);
> +	state = arm64_enter_from_kernel_mode(regs);
>  	local_daif_inherit(regs);
>  	do_mem_abort(far, esr, regs);
>  	local_daif_mask();
> -	exit_to_kernel_mode(regs, state);
> +	arm64_exit_to_kernel_mode(regs, state);
>  }
>  
>  static void noinstr el1_pc(struct pt_regs *regs, unsigned long esr)
> @@ -310,55 +310,55 @@ static void noinstr el1_pc(struct pt_regs *regs, unsigned long esr)
>  	unsigned long far = read_sysreg(far_el1);
>  	irqentry_state_t state;
>  
> -	state = enter_from_kernel_mode(regs);
> +	state = arm64_enter_from_kernel_mode(regs);
>  	local_daif_inherit(regs);
>  	do_sp_pc_abort(far, esr, regs);
>  	local_daif_mask();
> -	exit_to_kernel_mode(regs, state);
> +	arm64_exit_to_kernel_mode(regs, state);
>  }
>  
>  static void noinstr el1_undef(struct pt_regs *regs, unsigned long esr)
>  {
>  	irqentry_state_t state;
>  
> -	state = enter_from_kernel_mode(regs);
> +	state = arm64_enter_from_kernel_mode(regs);
>  	local_daif_inherit(regs);
>  	do_el1_undef(regs, esr);
>  	local_daif_mask();
> -	exit_to_kernel_mode(regs, state);
> +	arm64_exit_to_kernel_mode(regs, state);
>  }
>  
>  static void noinstr el1_bti(struct pt_regs *regs, unsigned long esr)
>  {
>  	irqentry_state_t state;
>  
> -	state = enter_from_kernel_mode(regs);
> +	state = arm64_enter_from_kernel_mode(regs);
>  	local_daif_inherit(regs);
>  	do_el1_bti(regs, esr);
>  	local_daif_mask();
> -	exit_to_kernel_mode(regs, state);
> +	arm64_exit_to_kernel_mode(regs, state);
>  }
>  
>  static void noinstr el1_gcs(struct pt_regs *regs, unsigned long esr)
>  {
>  	irqentry_state_t state;
>  
> -	state = enter_from_kernel_mode(regs);
> +	state = arm64_enter_from_kernel_mode(regs);
>  	local_daif_inherit(regs);
>  	do_el1_gcs(regs, esr);
>  	local_daif_mask();
> -	exit_to_kernel_mode(regs, state);
> +	arm64_exit_to_kernel_mode(regs, state);
>  }
>  
>  static void noinstr el1_mops(struct pt_regs *regs, unsigned long esr)
>  {
>  	irqentry_state_t state;
>  
> -	state = enter_from_kernel_mode(regs);
> +	state = arm64_enter_from_kernel_mode(regs);
>  	local_daif_inherit(regs);
>  	do_el1_mops(regs, esr);
>  	local_daif_mask();
> -	exit_to_kernel_mode(regs, state);
> +	arm64_exit_to_kernel_mode(regs, state);
>  }
>  
>  static void noinstr el1_breakpt(struct pt_regs *regs, unsigned long esr)
> @@ -420,11 +420,11 @@ static void noinstr el1_fpac(struct pt_regs *regs, unsigned long esr)
>  {
>  	irqentry_state_t state;
>  
> -	state = enter_from_kernel_mode(regs);
> +	state = arm64_enter_from_kernel_mode(regs);
>  	local_daif_inherit(regs);
>  	do_el1_fpac(regs, esr);
>  	local_daif_mask();
> -	exit_to_kernel_mode(regs, state);
> +	arm64_exit_to_kernel_mode(regs, state);
>  }
>  
>  asmlinkage void noinstr el1h_64_sync_handler(struct pt_regs *regs)
> @@ -491,13 +491,13 @@ static __always_inline void __el1_irq(struct pt_regs *regs,
>  {
>  	irqentry_state_t state;
>  
> -	state = enter_from_kernel_mode(regs);
> +	state = arm64_enter_from_kernel_mode(regs);
>  
>  	irq_enter_rcu();
>  	do_interrupt_handler(regs, handler);
>  	irq_exit_rcu();
>  
> -	exit_to_kernel_mode(regs, state);
> +	arm64_exit_to_kernel_mode(regs, state);
>  }
>  static void noinstr el1_interrupt(struct pt_regs *regs,
>  				  void (*handler)(struct pt_regs *))

