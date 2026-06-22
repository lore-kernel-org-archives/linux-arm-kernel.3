Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CA5CDB46B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 07:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DjhxJIXwZtlu+S1mzuRLvpGJ+I0yWr65Zu0vmWK+UsM=; b=rUjlbGaYojeeByrxBsymDmaVbv
	8WNJU+l+tD16gNsXzv9wsVtmBErRpWHzBGqjr50481ysYllBS9fa20EgTB7SR2rNVtK25C5sYAudV
	JiDZpxCLmYWSXuF8zrN0ug+x1DDrG7oHMPXzsn+2KZ49P/tPmODW8Vc9TdO9dh0cptZJ2+wfrStO9
	awlIVcPYeEd9Qy59t7uu1Q/7K3FgoF/UvTPSNU1ZsPAbaA8Lw5Jc8JOp+jcYWT8WVMW3EKietxGR0
	APtO26BP8BtZqChxUt6DbHJpuSoxAk0GV8Utb0RWqN7JwYYpXxEduqEFARvd3J6FUOhOjyCNe6sL1
	MBX6zKTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbZQL-00000004ZWl-4Ayp;
	Mon, 22 Jun 2026 07:50:29 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbZQI-00000004ZUR-3ACI;
	Mon, 22 Jun 2026 07:50:28 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=DjhxJIXwZtlu+S1mzuRLvpGJ+I0yWr65Zu0vmWK+UsM=;
	b=dTXHI5OT3kJg6ZwKeZ7l+1YDr6b1hpRbY8s8z0T12kaOnMUVi+FGyMWPDPdkApaBuVatBA7uC
	Z0GKJFORdTMX2Azn6tNgGnMd1iV5ZufaianvsXLsU15PMBLIB0HzyaukESDfsIE8SzVz6SZBDp5
	/oThe3zRYAqwKkDmxGgBWFo=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4gkKrn1qmxz12LDT;
	Mon, 22 Jun 2026 15:41:29 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 8201240561;
	Mon, 22 Jun 2026 15:50:17 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 22 Jun 2026 15:50:14 +0800
Message-ID: <49895e73-0fab-4410-93ba-f850f0586b1d@huawei.com>
Date: Mon, 22 Jun 2026 15:50:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/3] cpu/hotplug: Introduce
 CONFIG_PARALLEL_SMT_PRIMARY_FIRST
To: Thomas Gleixner <tglx@kernel.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <tsbogend@alpha.franken.de>, <pjw@kernel.org>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <peterz@infradead.org>, <kees@kernel.org>,
	<nathan@kernel.org>, <linusw@kernel.org>, <ojeda@kernel.org>,
	<david.kaplan@amd.com>, <lukas.bulwahn@redhat.com>, <ryan.roberts@arm.com>,
	<maz@kernel.org>, <timothy.hayes@arm.com>, <lpieralisi@kernel.org>,
	<thuth@redhat.com>, <oupton@kernel.org>, <yeoreum.yun@arm.com>,
	<miko.lenczewski@arm.com>, <broonie@kernel.org>, <kevin.brodsky@arm.com>,
	<james.clark@linaro.org>, <tabba@google.com>, <mrigendra.chaubey@gmail.com>,
	<arnd@arndb.de>, <anshuman.khandual@arm.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mips@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20260611133809.3854977-1-ruanjinjie@huawei.com>
 <20260611133809.3854977-2-ruanjinjie@huawei.com> <87a4srdgk0.ffs@fw13>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <87a4srdgk0.ffs@fw13>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_005027_132202_591CE4C9 
X-CRM114-Status: GOOD (  21.47  )
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



On 6/18/2026 11:17 PM, Thomas Gleixner wrote:
> On Thu, Jun 11 2026 at 21:38, Jinjie Ruan wrote:
> 
>> During parallel CPU bringup, x86 requires primary SMT threads to boot
>> first to avoid siblings stopping during microcode updates. This constraint
>> is architecture-specific and unnecessary for other platforms
>> like arm64.
>>
>> Introduce CONFIG_PARALLEL_SMT_PRIMARY_FIRST to decouple this constraint.
>> Platforms requiring this temporal order (e.g., x86) can select it
>> in Kconfig. Other architectures (e.g., arm64) can leave it unselected
>> to entirely bypass the SMT branch via the preprocessor.
>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  arch/Kconfig       | 4 ++++
>>  arch/mips/Kconfig  | 1 +
>>  arch/riscv/Kconfig | 1 +
>>  arch/x86/Kconfig   | 1 +
>>  kernel/cpu.c       | 6 +++++-
>>  5 files changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/Kconfig b/arch/Kconfig
>> index e86880045158..0365d2df2659 100644
>> --- a/arch/Kconfig
>> +++ b/arch/Kconfig
>> @@ -102,6 +102,10 @@ config HOTPLUG_PARALLEL
>>  	bool
>>  	select HOTPLUG_SPLIT_STARTUP
>>  
>> +config PARALLEL_SMT_PRIMARY_FIRST
> 
> Proper namespaces are overrated, right?
> 
> All related options start with HOTPLUG_....

Sure, will update to `HOTPLUG_PARALLEL_SMT`		

> 
>> +	bool
>> +	depends on HOTPLUG_PARALLEL
>> +
>>  config GENERIC_IRQ_ENTRY
>>  	bool
>>  
>> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
>> index 4364f3dba688..84e11ac0cf71 100644
>> --- a/arch/mips/Kconfig
>> +++ b/arch/mips/Kconfig
>> @@ -642,6 +642,7 @@ config EYEQ
>>  	select MIPS_CPU_SCACHE
>>  	select MIPS_GIC
>>  	select MIPS_L1_CACHE_SHIFT_7
>> +	select PARALLEL_SMT_PRIMARY_FIRST if HOTPLUG_PARALLEL
>>  	select PCI_DRIVERS_GENERIC
>>  	select SMP_UP if SMP
>>  	select SWAP_IO_SPACE
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index d235396c4514..0cc49aecc841 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -210,6 +210,7 @@ config RISCV
>>  	select OF
>>  	select OF_EARLY_FLATTREE
>>  	select OF_IRQ
>> +	select PARALLEL_SMT_PRIMARY_FIRST if HOTPLUG_PARALLEL
> 
> Why does RISCV need this? It does not select HOTPLUG_SMT to begin with.

You are right, this was initially done to keep in line with the legacy
implementation.

> 
>> +#ifdef CONFIG_PARALLEL_SMT_PRIMARY_FIRST
>>  #ifdef CONFIG_HOTPLUG_SMT
> 
> More #ifdeffery is better, right?
> 
>>  static inline bool cpuhp_smt_aware(void)
>>  {
>> @@ -1811,7 +1812,8 @@ static inline const struct cpumask *cpuhp_get_primary_thread_mask(void)
>>  {
>>  	return cpu_none_mask;
>>  }
>> -#endif
>> +#endif /* CONFIG_HOTPLUG_SMT */
>> +#endif /* CONFIG_PARALLEL_SMT_PRIMARY_FIRST */
>>  
>>  bool __weak arch_cpuhp_init_parallel_bringup(void)
>>  {
>> @@ -1837,6 +1839,7 @@ static bool __init cpuhp_bringup_cpus_parallel(unsigned int ncpus)
>>  	if (!__cpuhp_parallel_bringup)
>>  		return false;
>>  
>> +#ifdef CONFIG_PARALLEL_SMT_PRIMARY_FIRST
> 
> Seriously?
> 
>>  	if (cpuhp_smt_aware()) {
>>  		const struct cpumask *pmask = cpuhp_get_primary_thread_mask();
>>  		static struct cpumask tmp_mask __initdata;
>> @@ -1857,6 +1860,7 @@ static bool __init cpuhp_bringup_cpus_parallel(unsigned int ncpus)
>>  		cpumask_andnot(&tmp_mask, mask, pmask);
>>  		mask = &tmp_mask;
>>  	}
>> +#endif /* CONFIG_PARALLEL_SMT_PRIMARY_FIRST */
> 
> Something simple like the uncompiled below should just work, no?

Yes, everything looks good, except for a minor compilation issue.

> 
> ---
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -102,6 +102,10 @@ config HOTPLUG_PARALLEL
>  	bool
>  	select HOTPLUG_SPLIT_STARTUP
>  
> +config HOTPLUG_PARALLEL_SMT
> +	bool
> +	select HOTPLUG_PARALLEL
> +

+config HOTPLUG_PARALLEL_SMT
+       bool
+       select HOTPLUG_PARALLEL
+       select HOTPLUG_SMT

We should select HOTPLUG_SMT here to prevent the compilation issue where
HOTPLUG_PARALLEL_SMT is enabled without HOTPLUG_SMT.

>  config GENERIC_IRQ_ENTRY
>  	bool
>  
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -657,7 +657,7 @@ config EYEQ
>  	select USB_UHCI_BIG_ENDIAN_DESC if CPU_BIG_ENDIAN
>  	select USB_UHCI_BIG_ENDIAN_MMIO if CPU_BIG_ENDIAN
>  	select USE_OF
> -	select HOTPLUG_PARALLEL if HOTPLUG_CPU
> +	select HOTPLUG_PARALLEL_SMT if HOTPLUG_CPU
>  	help
>  	  Select this to build a kernel supporting EyeQ SoC from Mobileye.
>  
> @@ -2295,7 +2295,6 @@ config MIPS_CPS
>  	select MIPS_CM
>  	select MIPS_CPS_PM if HOTPLUG_CPU
>  	select SMP
> -	select HOTPLUG_SMT if HOTPLUG_PARALLEL
>  	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
>  	select SYNC_R4K if (CEVT_R4K || CSRC_R4K)
>  	select SYS_SUPPORTS_HOTPLUG_CPU
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -304,7 +304,7 @@ config X86
>  	select HAVE_USER_RETURN_NOTIFIER
>  	select HAVE_GENERIC_VDSO
>  	select VDSO_GETRANDOM			if X86_64
> -	select HOTPLUG_PARALLEL			if SMP && X86_64
> +	select HOTPLUG_PARALLEL_SMT		if SMP && X86_64
>  	select HOTPLUG_SMT			if SMP
>  	select HOTPLUG_SPLIT_STARTUP		if SMP && X86_32
>  	select IRQ_FORCED_THREADING
> --- a/kernel/cpu.c
> +++ b/kernel/cpu.c
> @@ -1792,7 +1792,7 @@ static int __init parallel_bringup_parse
>  }
>  early_param("cpuhp.parallel", parallel_bringup_parse_param);
>  
> -#ifdef CONFIG_HOTPLUG_SMT
> +#ifdef CONFIG_HOTPLUG_PARALLEL_SMT
>  static inline bool cpuhp_smt_aware(void)
>  {
>  	return cpu_smt_max_threads > 1;
> 


