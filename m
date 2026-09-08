Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D2D3C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 12:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aiCnsHSGi62GZAt7gncihY9+iSVioavtrqNUZOmgZrc=; b=gnHmK9pNuh1SuNfDxyHbWdUJD7
	i82YXLGgn4A8Uxyh7zdCbmREDltJv/3Nm5iLyNitui3jw+5QjljKyk0rQM2hozYJ4qgdy8buC9SVD
	ZgQKP8cBGkOKhzzivtMr7y6xDIc+9rmvrQw08dUHx59oFZZllojRVyavkmzIc6ZPKj7V4L0Ts6L3k
	QBGfa/qTlxmLluevDXyN68en/oz2MK8ArbvpPyWPDGU8TqBk/T+09B0DXZh0OELGgju20So5NQrhT
	aYzb9uCQOK8ZtKFlGCyNupJWqrJEJncfRkYt9TMVWxEd8QOJvVh7kit6sKq/WXCI4DMjKJrT+6acT
	GA2E6Zaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ukW-00000008zWu-45ST;
	Tue, 08 Sep 2026 12:16:28 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ukT-00000008zWX-45NB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 12:16:27 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=aiCnsHSGi62GZAt7gncihY9+iSVioavtrqNUZOmgZrc=;
	b=0W3ndBv3Nf/NRIhDeXn7W8zYcBX7LWEJaIrBWPpX4nY8R6ucFiMVr54mv2WAYQOJ+l1i8sLxh
	EKgIrGCXTJUoDIB6Q/zhgiq30OHuj5t9jWhWsY+EDOBNnLGodHKtjX/XYJPOApnDSQF6aHJT4Zg
	e57yBEhk29zTIEr7+mY2GmY=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4hfN1L1crRz1cyT9;
	Tue,  8 Sep 2026 20:05:26 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 5892940586;
	Tue,  8 Sep 2026 20:16:19 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 8 Sep 2026 20:16:18 +0800
Message-ID: <e3d5a233-b32a-4e6c-99f2-e2d634baa9cf@huawei.com>
Date: Tue, 8 Sep 2026 20:16:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/19] arm64: smp: Pass secondary CPU boot parameters via
 firmware if possible
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Borislav Petkov <bp@alien8.de>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David
 Woodhouse <dwmw@amazon.co.uk>, Peter Zijlstra <peterz@infradead.org>, Marc
 Zyngier <maz@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-18-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260907164024.17164-18-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_051626_338626_77BB3D32 
X-CRM114-Status: GOOD (  21.67  )
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



在 2026/9/8 0:40, Will Deacon 写道:
> In preparation for parallel bringup of secondary CPUs, the global
> 'secondary_data' structure used for initial paramater passing must be
> localised.
> 
> Pass the idle 'task_struct' pointer for secondary CPUs directly to
> ->cpu_boot() if the backend supports it.
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

> 
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/smp.h |  1 +
>  arch/arm64/kernel/head.S     | 12 +++++++++++-
>  arch/arm64/kernel/psci.c     |  4 ++--
>  arch/arm64/kernel/smp.c      | 25 +++++++++++--------------
>  4 files changed, 25 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
> index 7b986a6a765b..7f2cd84b7785 100644
> --- a/arch/arm64/include/asm/smp.h
> +++ b/arch/arm64/include/asm/smp.h
> @@ -95,6 +95,7 @@ struct secondary_data {
>  extern struct secondary_data secondary_data;
>  extern long __early_cpu_boot_status;
>  extern void secondary_entry(void);
> +extern void secondary_entry_with_arg(void);
>  
>  extern void arch_send_call_function_single_ipi(int cpu);
>  extern void arch_send_call_function_ipi_mask(const struct cpumask *mask);
> diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
> index 87a822e5c4ca..17868b497d7c 100644
> --- a/arch/arm64/kernel/head.S
> +++ b/arch/arm64/kernel/head.S
> @@ -335,6 +335,7 @@ SYM_FUNC_END(init_kernel_el)
>  	 * cores are held until we're ready for them to initialise.
>  	 */
>  SYM_FUNC_START(secondary_holding_pen)
> +	mov	x19, xzr
>  	mov	x0, xzr
>  	bl	init_kernel_el			// w0=cpu_boot_mode
>  	mrs	x2, mpidr_el1
> @@ -353,10 +354,16 @@ SYM_FUNC_END(secondary_holding_pen)
>  	 * be used where CPUs are brought online dynamically by the kernel.
>  	 */
>  SYM_FUNC_START(secondary_entry)
> +	mov	x0, xzr
> +	b	secondary_entry_with_arg
> +SYM_FUNC_END(secondary_entry)
> +
> +SYM_FUNC_START(secondary_entry_with_arg)
> +	mov	x19, x0
>  	mov	x0, xzr
>  	bl	init_kernel_el			// w0=cpu_boot_mode
>  	b	secondary_startup
> -SYM_FUNC_END(secondary_entry)
> +SYM_FUNC_END(secondary_entry_with_arg)
>  
>  SYM_FUNC_START_LOCAL(secondary_startup)
>  	/*
> @@ -391,10 +398,13 @@ SYM_FUNC_START_LOCAL(__secondary_switched)
>  	msr	vbar_el1, x5
>  	isb
>  
> +	mov	x2, x19
> +	cbnz	x2, 1f
>  	adr_l	x0, secondary_data
>  	ldr	x2, [x0, #CPU_BOOT_TASK]
>  	cbz	x2, __secondary_too_slow
>  
> +1:
>  	init_cpu_task x2, x1, x3
>  
>  #ifdef CONFIG_ARM64_PTR_AUTH
> diff --git a/arch/arm64/kernel/psci.c b/arch/arm64/kernel/psci.c
> index 3ba4fa14b9e3..c13e635e8a11 100644
> --- a/arch/arm64/kernel/psci.c
> +++ b/arch/arm64/kernel/psci.c
> @@ -38,8 +38,8 @@ static int __init cpu_psci_cpu_prepare(unsigned int cpu)
>  
>  static int cpu_psci_cpu_boot(unsigned int cpu, unsigned long context)
>  {
> -	phys_addr_t pa_secondary_entry = __pa_symbol(secondary_entry);
> -	int err = psci_ops.cpu_on(cpu_logical_map(cpu), pa_secondary_entry,
> +	void *entry_va = context ? secondary_entry_with_arg : secondary_entry;
> +	int err = psci_ops.cpu_on(cpu_logical_map(cpu), __pa_symbol(entry_va),
>  				  context);
>  	if (err && err != -EPERM)
>  		pr_err("failed to boot CPU%d (%d)\n", cpu, err);
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index b57f8f752f78..95d5328c3f5a 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -93,34 +93,31 @@ static inline int op_cpu_kill(unsigned int cpu)
>  }
>  #endif
>  
> -
>  /*
>   * Boot a secondary CPU, and assign it the specified idle task.
>   * This also gives us the initial stack to use for this CPU.
>   */
> -static int boot_secondary(unsigned int cpu, struct task_struct *idle)
> -{
> -	const struct cpu_operations *ops = get_secondary_cpu_ops();
> -
> -	if (ops->cpu_boot)
> -		return ops->cpu_boot(cpu, 0);
> -
> -	return -EOPNOTSUPP;
> -}
> -
>  int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *idle)
>  {
> -	int ret;
> +	const struct cpu_operations *ops = get_secondary_cpu_ops();
> +	int ret = -EOPNOTSUPP;
> +	void *arg = NULL;
>  
>  	/*
>  	 * We need to tell the secondary core where to find its stack and the
>  	 * page tables.
>  	 */
> -	secondary_data.task = idle;
> +	if (ops->cpu_boot_has_arg && ops->cpu_boot_has_arg())
> +		arg = idle;
> +	else
> +		secondary_data.task = idle;
> +
>  	update_cpu_boot_status(CPU_MMU_OFF);
>  
>  	/* Now bring the CPU into our world */
> -	ret = boot_secondary(cpu, idle);
> +	if (ops->cpu_boot)
> +		ret = ops->cpu_boot(cpu, (unsigned long)arg);
> +
>  	if (ret && ret != -EPERM)
>  		pr_err("CPU%u: failed to boot: %d\n", cpu, ret);
>  	return ret;


