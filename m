Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 682D6CA9EBD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 02:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VeVooY1BF4c0BpixgBp6X7gNCFTO8VvE12rUCObKIh4=; b=ISYHZpFFRgGZBZtMXjl2S+NDzr
	TiKCG3jOxx9fibK21GUm695JxTqg1jvDUC72PVD4XySoLpKk5ash0xBjdh2Hh6vhDlkj33W/jshJ/
	XWZ0uPY2ONdyLF7S0H9crezn6gEyIWZlc+ZlZikGgFgOEgOLTGhn8V/1iETd7ipTWvi1QqVzEVH9O
	Xk+tI7XAtS4wJm+xZKCJ24n8cmQebCNw0ykdnE0O4NE8HUrwT3SshKGJleIqeP0TJR0PoaRdx9Uky
	0sBlALO/Bxj+WCvuwS9PxZBbS2Dqf7NEGg57lRj02LSaPa9NjGQ1XJYXl5RmLC+8aeGVIKEbrdD5O
	av4tVQRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFN9i-00000007RWi-2jYA;
	Sat, 10 Oct 2026 02:49:50 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFN9e-00000007RWC-3Xxj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 02:49:49 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=VeVooY1BF4c0BpixgBp6X7gNCFTO8VvE12rUCObKIh4=;
	b=D3mXrfC+Fc4CB4Yo3EcK9GJ6poDIy695WU9/R//ot6IbyJkNXnjf9N6r8HQpmTGnGr6nw0g27
	aI+MIyvYoV6LK6y4qznx9uxttRl/MS/KfK5wwYYVMsk1RUDkhd293ZJTRKUuBBWIctcYO2+FKBN
	aEDW1VsGjk6bRso3TCRWpBo=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4j1nv212CpzLlSh;
	Sat, 10 Oct 2026 10:37:18 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id D3C894057A;
	Sat, 10 Oct 2026 10:49:33 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 10 Oct
 2026 10:49:33 +0800
Message-ID: <a9b77612-3b81-4491-ae57-baee0400540a@huawei.com>
Date: Sat, 10 Oct 2026 10:49:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/23] arm64: cpufeature: Check arm64_ftr_regs[] before
 the first store
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ben
 Horgan <ben.horgan@arm.com>, =?UTF-8?Q?=C8=98tefania_Ion?=
	<stefion@google.com>, Catalin Marinas <catalin.marinas@arm.com>, Pankaj Patil
	<pankaj.patil@oss.qualcomm.com>, Borislav Petkov <bp@alien8.de>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tarun
 Sahu <tarunsahu@google.com>, Fuad Tabba <fuad.tabba@linux.dev>, David
 Woodhouse <dwmw@amazon.co.uk>, Peter Zijlstra <peterz@infradead.org>, Marc
 Zyngier <maz@kernel.org>
References: <20261009100738.31288-1-will@kernel.org>
 <20261009100738.31288-6-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20261009100738.31288-6-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.68]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_194947_516817_7DAAB0DD 
X-CRM114-Status: GOOD (  17.91  )
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



在 2026/10/9 18:07, Will Deacon 写道:
> From: Fuad Tabba <fuad.tabba@linux.dev>
> 
> sort_ftr_regs() sorts nothing. It checks that arm64_ftr_regs[] is in
> sys_id order, which the binary search in get_arm64_ftr_reg() relies on,
> and that no register's fields overlap. It runs at the top of

It also checks whether the register field extends beyond 64 bits

> init_cpu_features(), after the boot CPU's __cpuinfo_store_cpu(). A
> subsequent patch makes __cpuinfo_store_cpu() look registers up in the
> table.
> 
> Rename it validate_ftr_regs() and call it from smp_prepare_boot_cpu(),
> ahead of cpuinfo_store_boot_cpu().
> 
> Suggested-by: Will Deacon <will@kernel.org>
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/cpu.h   | 1 +
>  arch/arm64/kernel/cpufeature.c | 5 +----
>  arch/arm64/kernel/smp.c        | 2 ++
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/cpu.h b/arch/arm64/include/asm/cpu.h
> index 3c008821219c..f332fbd8e46d 100644
> --- a/arch/arm64/include/asm/cpu.h
> +++ b/arch/arm64/include/asm/cpu.h
> @@ -75,6 +75,7 @@ DECLARE_PER_CPU(struct cpuinfo_arm64, cpu_data);
>  void cpuinfo_store_cpu(void);
>  void __init cpuinfo_store_boot_cpu(void);
>  
> +void __init validate_ftr_regs(void);
>  void __init init_cpu_features(struct cpuinfo_arm64 *info);
>  void update_cpu_features(int cpu, struct cpuinfo_arm64 *info,
>  				 struct cpuinfo_arm64 *boot);
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 32102c3912fa..727e1665c987 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -962,7 +962,7 @@ s64 arm64_ftr_safe_value(const struct arm64_ftr_bits *ftrp, s64 new,
>  	return ret;
>  }
>  
> -static void __init sort_ftr_regs(void)
> +void __init validate_ftr_regs(void)
>  {
>  	unsigned int i;
>  
> @@ -1207,9 +1207,6 @@ bool gmid_el1_accessible(const struct cpuinfo_arm64 *info)
>  
>  void __init init_cpu_features(struct cpuinfo_arm64 *info)
>  {
> -	/* Before we start using the tables, make sure it is sorted */
> -	sort_ftr_regs();
> -
>  	init_cpu_ftr_reg(SYS_CTR_EL0, info->reg_ctr);
>  	init_cpu_ftr_reg(SYS_DCZID_EL0, info->reg_dczid);
>  	init_cpu_ftr_reg(SYS_CNTFRQ_EL0, info->reg_cntfrq);
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index a61dc3016a11..eac217b9ebf1 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -455,6 +455,8 @@ void __init smp_prepare_boot_cpu(void)
>  	 */
>  	set_my_cpu_offset(per_cpu_offset(smp_processor_id()));
>  
> +	/* Check arm64_ftr_regs[] before anything looks registers up in it. */
> +	validate_ftr_regs();

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  	cpuinfo_store_boot_cpu();
>  	setup_boot_cpu_features();
>  

-- 
Best regards,
Jinjie


