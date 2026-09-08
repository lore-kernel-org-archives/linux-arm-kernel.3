Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C461C79FAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 09:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sShEmy1XuzfNNWN3+4kC09Nfe5OSu2vtRKrpboDP/5I=; b=un9D+v8m575tkIvbPVx/BLcIMH
	e/124ormjTPQHqTzddirm7cYi9zREv5lE7RjwAD1JZ68PSUAwv6ZzoQpO35vT2ZcX6YHC+olwlaPb
	Kob6bBGLFCjwRnvep2qv0/69+exZ5ddjCe/O2eMfKvHghSs7yAIsS7hNpEIVobHQ/SF8ukh3seNTw
	9KPmHewAvLBermZ/J82Hv2Ym8U6rrfVvMo+zOrUmsbBJlhtZfU70qDeKUiYXa9qnKhImd/o51SglI
	jy1Jg6LqoElcAlpRWPlf48dHlMlLL4yuH71lrGzKFxxKgTbDWeLrFluZRiWBoWOUwfhn/SdQi7/5J
	tRNw+hgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rqv-00000008Wln-3YGw;
	Tue, 08 Sep 2026 09:10:53 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rqr-00000008WjP-3hIX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 09:10:53 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=sShEmy1XuzfNNWN3+4kC09Nfe5OSu2vtRKrpboDP/5I=;
	b=AmEyBD5jV7g6LrGvy2qZh3W5SPD/whMxLAr7Bz1vlW98e9Ku/4oTeU37m9gDGfltTLZCDiiEH
	rweT38ZOn7PffvjnZFeGI6cBf1ikvyEB/AQQ8PJTg/Iwd7/DqHP9u3+evIOgeT1KKEOoHSshTsd
	js6UCb4Y5BAuAUEDENWwTUA=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4hfHv81fr9zLlTC;
	Tue,  8 Sep 2026 16:59:48 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id E825440586;
	Tue,  8 Sep 2026 17:10:41 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 8 Sep 2026 17:10:41 +0800
Message-ID: <a7f78676-4b01-436f-9fef-dbabae849c45@huawei.com>
Date: Tue, 8 Sep 2026 17:10:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/19] arm64: smp: Use generic HOTPLUG_SPLIT_STARTUP
 machinery for CPU onlining
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Borislav Petkov <bp@alien8.de>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David
 Woodhouse <dwmw@amazon.co.uk>, Peter Zijlstra <peterz@infradead.org>, Marc
 Zyngier <maz@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-12-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260907164024.17164-12-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_021050_529965_7B0D066E 
X-CRM114-Status: GOOD (  19.33  )
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
> In preparation for enabling parallel bringup of secondary CPUs on arm64,
> take the baby step of moving from HOTPLUG_CORE_SYNC_FULL to
> HOTPLUG_SPLIT_STARTUP.
> 
> Rework the cpu_die_early() path to use a private cpumask, otherwise
> clearing the incoming CPU from the present mask in the 'kick' stage will
> prevent the hotplug stage machine from progressing and
> arch_cpuhp_cleanup_kick_cpu() will not be called.
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/Kconfig           | 2 +-
>  arch/arm64/include/asm/smp.h | 1 +
>  arch/arm64/kernel/smp.c      | 9 +++++----
>  3 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 89d1f0f2269c..fd8cf792b7fd 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -230,7 +230,7 @@ config ARM64
>  	select HAVE_SYSCALL_TRACEPOINTS
>  	select HAVE_KPROBES
>  	select HAVE_KRETPROBES
> -	select HOTPLUG_CORE_SYNC_FULL
> +	select HOTPLUG_SPLIT_STARTUP
>  	select HOTPLUG_SMT if HOTPLUG_CPU
>  	select IRQ_DOMAIN
>  	select IRQ_FORCED_THREADING
> diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
> index fe343c30d620..7b986a6a765b 100644
> --- a/arch/arm64/include/asm/smp.h
> +++ b/arch/arm64/include/asm/smp.h
> @@ -89,6 +89,7 @@ asmlinkage void secondary_start_kernel(void);
>  struct secondary_data {
>  	struct task_struct *task;
>  	long status;
> +	cpumask_t cpu_died_early_mask;
>  };
>  
>  extern struct secondary_data secondary_data;
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index 00362ed6e1ab..c5e9d5d5e003 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -62,7 +62,7 @@
>   * so we need some other way of telling a new secondary core
>   * where to place its SVC stack
>   */
> -struct secondary_data secondary_data;
> +struct secondary_data secondary_data = {};
>  /* Number of CPUs which aren't online, but looping in kernel text. */
>  static int cpus_stuck_in_kernel;
>  
> @@ -108,7 +108,7 @@ static int boot_secondary(unsigned int cpu, struct task_struct *idle)
>  	return -EOPNOTSUPP;
>  }
>  
> -int __cpu_up(unsigned int cpu, struct task_struct *idle)
> +int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *idle)
>  {
>  	int ret;
>  
> @@ -146,6 +146,8 @@ void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu, bool is_alive)
>  		cpus_stuck_in_kernel++;
>  		break;
>  	case CPU_KILL_ME:
> +		if (cpumask_test_cpu(cpu, &secondary_data.cpu_died_early_mask))
> +			set_cpu_present(cpu, false);

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  		if (!op_cpu_kill(cpu)) {
>  			pr_crit("CPU%u: died during early boot\n", cpu);
>  			break;
> @@ -406,8 +408,7 @@ void __noreturn cpu_die_early(void)
>  
>  	pr_crit("CPU%d: will not boot\n", cpu);
>  
> -	/* Mark this CPU absent */
> -	set_cpu_present(cpu, 0);
> +	cpumask_set_cpu(cpu, &secondary_data.cpu_died_early_mask);
>  
>  	if (IS_ENABLED(CONFIG_HOTPLUG_CPU)) {
>  		update_cpu_boot_status(CPU_KILL_ME);


