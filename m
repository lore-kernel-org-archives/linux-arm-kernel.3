Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 408B9C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 09:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8oV5ye1wgWjHNd8tXu58PgTkZM2DHpGDoyc6w2RJVgo=; b=b8UVmEeNldw4uMpgDeHoaOVAAO
	87qQ874mcV3HDQcPGJRyiG/CNNslzHQV9gpwtnYlfzkaHpA/lil6vl1Tzwxs4KUuANlkPHNcAXT7H
	gs6m3lLLouxpxtqD61xszsN1feEAzGUUjbYPC6ACyN+25vaWaHuh91wxy7hihI+U5LLOQkUoARVD8
	Vo8avMIKsLoodWrKwZYVzcsu+8D25dnlxWNbngbIhm7hq3Q4Z+py+vhODPBntJ2PJsjnyIHXLrUq9
	5YieUbACn/kwZ7w3mrshb+DAqFzJDQ4kphJTh69dR+/7Jk1CKQ8tliIapc9XL8iH/uu6uZEyzAhhm
	dOtgIqww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rhW-00000008UVB-4BX7;
	Tue, 08 Sep 2026 09:01:11 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rhT-00000008UUQ-26Yu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 09:01:09 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=8oV5ye1wgWjHNd8tXu58PgTkZM2DHpGDoyc6w2RJVgo=;
	b=Bi42GNvfGmpW9FSu3mshrdNpZpnDhVG9tNARiG2dNch48diDG04bYgVFUK/u/5lk1LvZYZJeA
	WlWN1ZQo/NqoSIivdLTrfiBbF6MXzohJdbUkaAZAJ2x/ktqZYC8q9RxALGt6T02y4Q78mjzEe0C
	fJCsq1jWGdepbc9gEwc4Z2E=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4hfHgx0nHkzcb3G;
	Tue,  8 Sep 2026 16:50:05 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id BBEAF4057D;
	Tue,  8 Sep 2026 17:01:01 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 8 Sep 2026 17:01:01 +0800
Message-ID: <a6694c1a-6437-4173-97a0-f3c892707d7f@huawei.com>
Date: Tue, 8 Sep 2026 17:01:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/19] arm64: smp: Use generic HOTPLUG_CORE_SYNC_FULL
 machinery for CPU onlining
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Borislav Petkov <bp@alien8.de>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David
 Woodhouse <dwmw@amazon.co.uk>, Peter Zijlstra <peterz@infradead.org>, Marc
 Zyngier <maz@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-11-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260907164024.17164-11-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_020108_345320_CB1BC4D2 
X-CRM114-Status: GOOD (  23.31  )
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
> Select HOTPLUG_CORE_SYNC_FULL on arm64 to replace the 'cpu_running'
> completion with the generic code for synchronising with secondary CPUs
> during boot.
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/Kconfig           |  2 +-
>  arch/arm64/include/asm/smp.h |  1 -
>  arch/arm64/kernel/smp.c      | 39 +++++++++++++++++-------------------
>  3 files changed, 19 insertions(+), 23 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index b5a51b0ef944..89d1f0f2269c 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -230,7 +230,7 @@ config ARM64
>  	select HAVE_SYSCALL_TRACEPOINTS
>  	select HAVE_KPROBES
>  	select HAVE_KRETPROBES
> -	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
> +	select HOTPLUG_CORE_SYNC_FULL
>  	select HOTPLUG_SMT if HOTPLUG_CPU
>  	select IRQ_DOMAIN
>  	select IRQ_FORCED_THREADING
> diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
> index 10ea4f543069..fe343c30d620 100644
> --- a/arch/arm64/include/asm/smp.h
> +++ b/arch/arm64/include/asm/smp.h
> @@ -12,7 +12,6 @@
>  #define CPU_BOOT_STATUS_MASK		((UL(1) << CPU_STUCK_REASON_SHIFT) - 1)
>  
>  #define CPU_MMU_OFF			(-1)
> -#define CPU_BOOT_SUCCESS		(0)
>  /* The cpu invoked ops->cpu_die, synchronise it with cpu_kill */
>  #define CPU_KILL_ME			(1)
>  /* The cpu couldn't die gracefully and is looping in the kernel */
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index ff68640d0c0b..00362ed6e1ab 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -108,12 +108,9 @@ static int boot_secondary(unsigned int cpu, struct task_struct *idle)
>  	return -EOPNOTSUPP;
>  }
>  
> -static DECLARE_COMPLETION(cpu_running);
> -
>  int __cpu_up(unsigned int cpu, struct task_struct *idle)
>  {
>  	int ret;
> -	long status;
>  
>  	/*
>  	 * We need to tell the secondary core where to find its stack and the
> @@ -124,27 +121,24 @@ int __cpu_up(unsigned int cpu, struct task_struct *idle)
>  
>  	/* Now bring the CPU into our world */
>  	ret = boot_secondary(cpu, idle);
> -	if (ret) {
> -		if (ret != -EPERM)
> -			pr_err("CPU%u: failed to boot: %d\n", cpu, ret);
> -		return ret;
> -	}
> +	if (ret && ret != -EPERM)
> +		pr_err("CPU%u: failed to boot: %d\n", cpu, ret);
> +	return ret;
> +}
>  
> -	/*
> -	 * CPU was successfully started, wait for it to come online or
> -	 * time out.
> -	 */
> -	wait_for_completion_timeout(&cpu_running,
> -				    msecs_to_jiffies(5000));
> -	if (cpu_online(cpu))
> -		return 0;
> +void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu, bool is_alive)
> +{
> +	long status;
> +
> +	if (is_alive)
> +		return;
>  
> -	pr_crit("CPU%u: failed to come online\n", cpu);
>  	secondary_data.task = NULL;
>  	status = READ_ONCE(secondary_data.status);
>  	if (status == CPU_MMU_OFF)
>  		status = READ_ONCE(__early_cpu_boot_status);
>  
> +	/* A CPU has failed to boot. Try to figure out what happened. */
>  	switch (status & CPU_BOOT_STATUS_MASK) {
>  	default:
>  		pr_err("CPU%u: failed in unknown state : 0x%lx\n",
> @@ -171,8 +165,6 @@ int __cpu_up(unsigned int cpu, struct task_struct *idle)
>  	case CPU_PANIC_KERNEL:
>  		panic("CPU%u detected unsupported configuration\n", cpu);
>  	}
> -
> -	return -EIO;
>  }
>  
>  static void init_gic_priority_masking(void)
> @@ -234,6 +226,13 @@ asmlinkage notrace void secondary_start_kernel(void)
>  	 * Log the CPU info before it is marked online and might get read.
>  	 */
>  	cpuinfo_store_cpu();
> +
> +	/*
> +	 * Synchronise with the core bringing us online so that it knows
> +	 * we made it into the kernel. We're still not 'online'.
> +	 */
> +	cpuhp_ap_sync_alive();
> +
>  	update_cpu_features(cpu);
>  	store_cpu_topology(cpu);
>  
> @@ -255,9 +254,7 @@ asmlinkage notrace void secondary_start_kernel(void)
>  	pr_info("CPU%u: Booted secondary processor 0x%010lx [0x%08x]\n",
>  					 cpu, (unsigned long)mpidr,
>  					 read_cpuid_id());
> -	update_cpu_boot_status(CPU_BOOT_SUCCESS);
>  	set_cpu_online(cpu, true);
> -	complete(&cpu_running);

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  
>  	/*
>  	 * Secondary CPUs enter the kernel with all DAIF exceptions masked.


