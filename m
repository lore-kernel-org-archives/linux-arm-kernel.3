Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB81C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 07:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LLp5MpbKRZcQy5kIiW+rVCn3SKCXVFaiVdq9xrOItaA=; b=kEGLSnhAAnSq8yOP35UCoSe71w
	MUahBsxBco/K62MdHoK1lzlFja4dWGak/Ww07MthyjpQwbCVOFz2mXIXEdPgc9+XG/p8NH5ydXbkZ
	mF70m5tfziNU22JLdPNpxzjyjA/utfdPHHCOk0LbMwrI6zFomW4lKqU4d+j/+jQlL1rNMEV76FqyR
	5Lk5R5O5X7s1OCPVegCbG8+iwzO7KfdxBd3uP9dijfpUNul6qvZzNWKv7wPbk1ouo/YBqTTqBlozS
	CXA8gSnyTtTBiWOf0DcAkmWgzEKMB+a1P2AGz1RSxAJNAHNISjgtBwgSCY8Ae5Q3wzY2RE01koDLz
	+td13FnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3qe4-00000008Jjv-2qfR;
	Tue, 08 Sep 2026 07:53:32 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3qdy-00000008Jil-0XIT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 07:53:30 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=LLp5MpbKRZcQy5kIiW+rVCn3SKCXVFaiVdq9xrOItaA=;
	b=rdphmNXi90D+3lsmnxg58VtVlzJJcX0L0ASUSawkWkwzeDG5yQnArgfm7LgVpGovSzwOMEi3D
	k90h4SKzB3LyZjpuhuwyoguBh2Ym6Ur8jNJHSQqSw77k9wBogpsPrLf5bnjB6Lcw1r5oWri5qPl
	E9tkMKFZiIZT74wxSNj8bgU=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4hfG9n6Bm0zcb3H;
	Tue,  8 Sep 2026 15:42:21 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 65D4640561;
	Tue,  8 Sep 2026 15:53:18 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 8 Sep 2026 15:53:17 +0800
Message-ID: <01fefdd7-f007-4ac8-93f0-5267dddae451@huawei.com>
Date: Tue, 8 Sep 2026 15:53:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/19] arm64: smp: Tidy up cpuinfo init and cpufeature
 updates
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Borislav Petkov <bp@alien8.de>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David
 Woodhouse <dwmw@amazon.co.uk>, Peter Zijlstra <peterz@infradead.org>, Marc
 Zyngier <maz@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-7-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260907164024.17164-7-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_005326_914618_FDBEB0E4 
X-CRM114-Status: GOOD (  27.03  )
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
> Populating the 'cpuinfo_arm64' structure during CPU bringup and
> subsequently checking/updating cpufeature structures is slightly
> convoluted and differs unnecessarily between the boot CPU and secondary
> CPUs.
> 
> Rework the code so that cpuinfo_store_cpu() is used to populate the
> 'cpuinfo_arm64' structure for each CPU, with secondary CPUs then calling
> update_cpu_features() to update the global view of the available
> features. This allows us to internalise the 'boot_cpu_data' in
> cpufeature.c and paves the way for parallelising the ID register probing
> during bring-up of secondary CPUs.
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/cpu.h   |  7 +++----
>  arch/arm64/kernel/cpufeature.c | 21 +++++++++++++++++----
>  arch/arm64/kernel/cpuinfo.c    | 11 -----------
>  arch/arm64/kernel/smp.c        |  3 ++-
>  4 files changed, 22 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/cpu.h b/arch/arm64/include/asm/cpu.h
> index 3c008821219c..733178520c45 100644
> --- a/arch/arm64/include/asm/cpu.h
> +++ b/arch/arm64/include/asm/cpu.h
> @@ -73,11 +73,10 @@ struct cpuinfo_arm64 {
>  DECLARE_PER_CPU(struct cpuinfo_arm64, cpu_data);
>  
>  void cpuinfo_store_cpu(void);
> -void __init cpuinfo_store_boot_cpu(void);
>  
> -void __init init_cpu_features(struct cpuinfo_arm64 *info);
> -void update_cpu_features(int cpu, struct cpuinfo_arm64 *info,
> -				 struct cpuinfo_arm64 *boot);
> +void __init init_cpu_features(void);

init_cpu_features() now only used in cpufeature.c, we can remove this
declaration and make it static in cpufeature.c.

> +void update_cpu_features(int cpu);
> +
>  bool gmid_el1_accessible(const struct cpuinfo_arm64 *info);
>  
>  #endif /* __ASM_CPU_H */
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 32102c3912fa..33279a264145 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -117,6 +117,7 @@ EXPORT_SYMBOL(system_cpucaps);
>  static struct arm64_cpu_capabilities const __ro_after_init *cpucap_ptrs[ARM64_NCAPS];
>  
>  DECLARE_BITMAP(boot_cpucaps, ARM64_NCAPS);
> +static struct cpuinfo_arm64 boot_cpu_data;
>  
>  /*
>   * arm64_use_ng_mappings must be placed in the .data section, otherwise it
> @@ -1205,11 +1206,19 @@ bool gmid_el1_accessible(const struct cpuinfo_arm64 *info)
>  	return mte >= ID_AA64PFR1_EL1_MTE_MTE2;
>  }
>  
> -void __init init_cpu_features(struct cpuinfo_arm64 *info)
> +void __init init_cpu_features(void)
>  {

Maybe rename to init_boot_cpu_features() ?


Otherwise LGTM
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

> +	struct cpuinfo_arm64 *info = &per_cpu(cpu_data, 0);
> +
>  	/* Before we start using the tables, make sure it is sorted */
>  	sort_ftr_regs();
>  
> +	/*
> +	 * We keep a copy of the boot CPU registers so that physical hotplug
> +	 * of CPU 0 can still be properly checked.
> +	 */
> +	boot_cpu_data = *info;
> +
>  	init_cpu_ftr_reg(SYS_CTR_EL0, info->reg_ctr);
>  	init_cpu_ftr_reg(SYS_DCZID_EL0, info->reg_dczid);
>  	init_cpu_ftr_reg(SYS_CNTFRQ_EL0, info->reg_cntfrq);
> @@ -1404,12 +1413,14 @@ static int update_32bit_cpu_features(int cpu, struct cpuinfo_32bit *info,
>   * non-boot CPU. Also performs SANITY checks to make sure that there
>   * aren't any insane variations from that of the boot CPU.
>   */
> -void update_cpu_features(int cpu,
> -			 struct cpuinfo_arm64 *info,
> -			 struct cpuinfo_arm64 *boot)
> +void update_cpu_features(int cpu)
>  {
> +	struct cpuinfo_arm64 *boot, *info;
>  	int taint = 0;
>  
> +	boot = &boot_cpu_data;
> +	info = per_cpu_ptr(&cpu_data, cpu);
> +
>  	/*
>  	 * The kernel can handle differing I-cache policies, but otherwise
>  	 * caches should look identical. Userspace JITs will make use of
> @@ -3978,6 +3989,8 @@ static void __init setup_boot_cpu_capabilities(void)
>  
>  void __init setup_boot_cpu_features(void)
>  {
> +	init_cpu_features();
> +
>  	/*
>  	 * Initialize the indirect array of CPU capabilities pointers before we
>  	 * handle the boot CPU.
> diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
> index 45c63f3d75c5..b423301a13cc 100644
> --- a/arch/arm64/kernel/cpuinfo.c
> +++ b/arch/arm64/kernel/cpuinfo.c
> @@ -31,7 +31,6 @@
>   * values depending on configuration at or after reset.
>   */
>  DEFINE_PER_CPU(struct cpuinfo_arm64, cpu_data);
> -static struct cpuinfo_arm64 boot_cpu_data;
>  
>  static inline const char *icache_policy_str(int l1ip)
>  {
> @@ -531,14 +530,4 @@ void cpuinfo_store_cpu(void)
>  {
>  	struct cpuinfo_arm64 *info = this_cpu_ptr(&cpu_data);
>  	__cpuinfo_store_cpu(info);
> -	update_cpu_features(smp_processor_id(), info, &boot_cpu_data);
> -}
> -
> -void __init cpuinfo_store_boot_cpu(void)
> -{
> -	struct cpuinfo_arm64 *info = &per_cpu(cpu_data, 0);
> -	__cpuinfo_store_cpu(info);
> -
> -	boot_cpu_data = *info;
> -	init_cpu_features(&boot_cpu_data);
>  }
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index ff045080ca1b..f4cabf9e19e6 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -235,6 +235,7 @@ asmlinkage notrace void secondary_start_kernel(void)
>  	 * Log the CPU info before it is marked online and might get read.
>  	 */
>  	cpuinfo_store_cpu();
> +	update_cpu_features(cpu);
>  	store_cpu_topology(cpu);
>  
>  	/*
> @@ -455,7 +456,7 @@ void __init smp_prepare_boot_cpu(void)
>  	 */
>  	set_my_cpu_offset(per_cpu_offset(smp_processor_id()));
>  
> -	cpuinfo_store_boot_cpu();
> +	cpuinfo_store_cpu();
>  	setup_boot_cpu_features();
>  
>  	/* Conditionally switch to GIC PMR for interrupt masking */


