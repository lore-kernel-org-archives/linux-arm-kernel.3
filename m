Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F72C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 04:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=POAYFuatsjTYjBHcHVCN47CGnDhjmXEfOoH4Z/R9Y64=; b=Yli2rMw38lRddbFpHMSuCf9HWY
	FCvGI1JuD98A2tFMqpPRJX3//uPjWmIs6R+UL6d9DEmu/5iO0AGD+5zW4QNcYb0pGy7WF3L/OXsU3
	ZMjsRxNbWxPJ13Uq8JVzLVVXiVdOPekkkCTtQ9dkzxj36c7yuquA1UcyjzaS9Q6iY90diB5tI3FDl
	ab64dwIvvNJc5XIYnCSG3lYsmd+4CxKhkPuA8Xl2dh6zJ64qmumhxKF1XT6h1E6rkfmIWGb8VFdWP
	kX/yer5N2UHWlFhP8AxnYv7ZYHeohcijwGlm4v537lI/41oYIQx8cZDLyWuHS3XLqxBBZfTALfucG
	tfUPLEnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgwyy-0000000E2Ss-1isH;
	Tue, 07 Jul 2026 04:00:28 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgwyu-0000000E2SO-3JQp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 04:00:27 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=POAYFuatsjTYjBHcHVCN47CGnDhjmXEfOoH4Z/R9Y64=;
	b=Xref49WAmtlkgiqK4htjX4EDbnjld/iDK+oS7dMCDmlQiurhBTtLfVJXIuY1TF4Lt3OqOhDxg
	DiiFwUu+IN7NbDQARi5QUOaDikDT4mqt5Qv8uLOFgcDZxp48DJmtrd8D0vWjR99oy2UoQE8zmBL
	xRnDCQDHRXWAZIHwcyVI2CA=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4gvS2F4nM7z1T4Fk;
	Tue,  7 Jul 2026 11:51:17 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 99F9740579;
	Tue,  7 Jul 2026 12:00:16 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 7 Jul 2026 12:00:13 +0800
Message-ID: <bddf7a68-7789-4ec2-819c-aaaee8173c70@huawei.com>
Date: Tue, 7 Jul 2026 12:00:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/12] arm64: Add HOTPLUG_PARALLEL support for
 secondary CPUs
To: <catalin.marinas@arm.com>, <will@kernel.org>, <tsbogend@alpha.franken.de>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <peterz@infradead.org>,
	<kees@kernel.org>, <nathan@kernel.org>, <linusw@kernel.org>,
	<ojeda@kernel.org>, <david.kaplan@amd.com>, <lukas.bulwahn@redhat.com>,
	<ryan.roberts@arm.com>, <maz@kernel.org>, <timothy.hayes@arm.com>,
	<lpieralisi@kernel.org>, <thuth@redhat.com>, <menglong8.dong@gmail.com>,
	<oupton@kernel.org>, <yeoreum.yun@arm.com>, <miko.lenczewski@arm.com>,
	<broonie@kernel.org>, <kevin.brodsky@arm.com>, <james.clark@linaro.org>,
	<yangyicong@hisilicon.com>, <tabba@google.com>, <osandov@fb.com>,
	<arnd@arndb.de>, <anshuman.khandual@arm.com>, <david@kernel.org>,
	<akpm@linux-foundation.org>, <ljs@kernel.org>, <dev.jain@arm.com>,
	<yang@os.amperecomputing.com>, <chaitanyas.prakash@arm.com>,
	<kprateek.nayak@amd.com>, <chenl311@chinatelecom.cn>,
	<sshegde@linux.ibm.com>, <thorsten.blum@linux.dev>,
	<chang.seok.bae@intel.com>, <tim.c.chen@linux.intel.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mips@vger.kernel.org>
References: <20260624092537.2916971-1-ruanjinjie@huawei.com>
 <20260624092537.2916971-13-ruanjinjie@huawei.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260624092537.2916971-13-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_210025_468048_B4F82D89 
X-CRM114-Status: GOOD (  22.87  )
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



On 6/24/2026 5:25 PM, Jinjie Ruan wrote:
> Support for parallel secondary CPU bringup is already utilized by x86,
> MIPS and RISC-V. This patch brings this capability to the arm64
> architecture.
> 
> To fully enable HOTPLUG_PARALLEL, this patch implements an arm64-specific
> arch_cpuhp_init_parallel_bringup() handler.
> 
> In parallel bringup, early `set_cpu_present(cpu, 0)` inside
> cpu_die_early() removes the secondary CPU prematurely, causing the primary
> CPU's second-stage cpuhp_bringup_mask() sweep to skip it and drop
> failure logs.


Hi, Will,

In parallel bringup, cpu_die_early() calls set_cpu_present(cpu, 0),
which removes the failing secondary CPU from the mask. This causes the
primary CPU's cpuhp_bringup_mask() sweep to skip it and drop any failure
log.

Have you seen this before, and what do you think about the fix?


1830  */
1831 static bool __init cpuhp_bringup_cpus_parallel(unsigned int ncpus)
1832 {
1833 >-------const struct cpumask *mask = cpu_present_mask;
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
...

1861 >-------/* Bring the not-yet started CPUs up */
1862 >-------cpuhp_bringup_mask(mask, ncpus, CPUHP_BP_KICK_AP);
                               ^^^^^
1863 >-------cpuhp_bringup_mask(mask, ncpus, CPUHP_ONLINE);
                                ^^^^^

Best regards,
Jinjie

> 
> Remove this early unregistration from the secondary CPU, deferring the
> set_cpu_present(cpu, 0) call to the primary CPU's cleanup path to ensure
> robust parallel boot timeout detection.
> 
> Tested natively with ATF on QEMU arm64 virt machine with 64 cores
> and also tested with KVM arm64 guest with 128 vCPUs.
> 
> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/Kconfig      |  2 +-
>  arch/arm64/kernel/smp.c | 12 ++++++++++--
>  2 files changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 24496e9967a8..a9d8030e7492 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -231,7 +231,7 @@ config ARM64
>  	select HAVE_KPROBES
>  	select HAVE_KRETPROBES
>  	select HAVE_GENERIC_VDSO
> -	select HOTPLUG_SPLIT_STARTUP if SMP
> +	select HOTPLUG_PARALLEL if SMP
>  	select HOTPLUG_SMT if HOTPLUG_CPU
>  	select IRQ_DOMAIN
>  	select IRQ_FORCED_THREADING
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index 98ddbe50081d..a973b2d3bab1 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -93,6 +93,15 @@ static inline int op_cpu_kill(unsigned int cpu)
>  }
>  #endif
>  
> +extern const struct cpu_operations cpu_psci_ops;
> +
> +/* Establish whether parallel bringup can be supported. */
> +bool __init arch_cpuhp_init_parallel_bringup(void)
> +{
> +	const struct cpu_operations *ops = get_secondary_cpu_ops();
> +
> +	return ops == &cpu_psci_ops;
> +}
>  
>  /*
>   * Boot a secondary CPU, and assign it the specified idle task.
> @@ -137,6 +146,7 @@ void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu, bool is_alive)
>  	 * We failed to synchronise with the CPU, so check if it left us
>  	 * any breadcrumbs.
>  	 */
> +	set_cpu_present(cpu, 0);
>  	cpu_boot_data[cpu].task = NULL;
>  	status = READ_ONCE(cpu_boot_data[cpu].status);
>  	if (status == CPU_MMU_OFF)
> @@ -416,8 +426,6 @@ void __noreturn cpu_die_early(void)
>  
>  	pr_crit("CPU%d: will not boot\n", cpu);
>  
> -	/* Mark this CPU absent */
> -	set_cpu_present(cpu, 0);
>  	rcutree_report_cpu_dead();
>  
>  	if (IS_ENABLED(CONFIG_HOTPLUG_CPU)) {


