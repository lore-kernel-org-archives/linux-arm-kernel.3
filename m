Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7110C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 12:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J5XVn+IP9JYSxt++vE5Bn2naLeVaA94FGOjdJNX08aM=; b=ski8MnY7z5KzggJU1LI50vDzX6
	+kRpclFEQwZaNGvsG6oJ1b8RG/hpG6wbQiKSrJ56qxQnr/yYFmuKl7IMJvJzt3YCRYxqQNRey3mMN
	NMKizlwR9UdKJcyRrtPfdlvdH6LHEANdap7N2qkjFXu+N2bgm4Ux5qpoWCYy8+dobdgmD+7quyV9M
	XI78DOWbCQHQFWqNyxaRpe25gar4ktYm/pQPmOJ+nFmqe0BlUQ0lW1vqNK+g/JV6h+VIK68y1Tzrn
	KWVACoLAe9Be7BigNrZSjXZlFdvp3Le9NZa9zaq8ezTGq8sKK7vxEghrSGLyS3NWEJG2iwrfXzRvn
	SDzUCl3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ua3-00000008yNe-04Ig;
	Tue, 08 Sep 2026 12:05:39 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3uZs-00000008yLy-4841
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 12:05:33 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=J5XVn+IP9JYSxt++vE5Bn2naLeVaA94FGOjdJNX08aM=;
	b=j+l79iC6Ga0wp9hlWjwrZ8HywTNPofAg7yfW6EsEYDaAPIDozcVE3sgD8h1Qs8DnyZsYQ6jUs
	QazBbYKcRUMkqESQOIid8vXj0DIuRuXUIGCEf6a0gbKq91YGnPasAXNfdmbwUbYvaGpbOQVfx83
	4vcLksJIyTiYp6Su4hHU1hg=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4hfMmk4xnRzmV8f;
	Tue,  8 Sep 2026 19:54:30 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id A05094055B;
	Tue,  8 Sep 2026 20:05:24 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 8 Sep 2026 20:05:24 +0800
Message-ID: <1489d67c-05f5-4c41-a360-dffe2cb95687@huawei.com>
Date: Tue, 8 Sep 2026 20:05:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/19] firmware/psci: Extend ->cpu_on() callback to take
 an additional argument
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Borislav Petkov <bp@alien8.de>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David
 Woodhouse <dwmw@amazon.co.uk>, Peter Zijlstra <peterz@infradead.org>, Marc
 Zyngier <maz@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-16-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260907164024.17164-16-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_050532_351402_F7816F8A 
X-CRM114-Status: GOOD (  16.20  )
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

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

在 2026/9/8 0:40, Will Deacon 写道:
> In preparation for hooking up the 'context ID' parameter introduced by
> PSCI v0.2 to the CPU_ON call, extend the ->cpu_on() callback to take
> an additional argument and modify all callers to pass 0 for now.
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm/kernel/psci_smp.c   |  4 ++--
>  arch/arm64/kernel/psci.c     |  2 +-
>  drivers/firmware/psci/psci.c | 20 ++++++++++++++------
>  include/linux/psci.h         |  3 ++-
>  4 files changed, 19 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm/kernel/psci_smp.c b/arch/arm/kernel/psci_smp.c
> index 3bb0c4dcfc5c..bf05dbf433b1 100644
> --- a/arch/arm/kernel/psci_smp.c
> +++ b/arch/arm/kernel/psci_smp.c
> @@ -49,10 +49,10 @@ static int psci_boot_secondary(unsigned int cpu, struct task_struct *idle)
>  		return psci_ops.cpu_on(cpu_logical_map(cpu),
>  			((phys_addr_t)(&secondary_startup)
>  			- XIP_VIRT_ADDR(CONFIG_XIP_PHYS_ADDR)
> -			+ CONFIG_XIP_PHYS_ADDR));
> +			+ CONFIG_XIP_PHYS_ADDR), 0);
>  #else
>  		return psci_ops.cpu_on(cpu_logical_map(cpu),
> -					virt_to_idmap(&secondary_startup));
> +					virt_to_idmap(&secondary_startup), 0);
>  #endif
>  	return -ENODEV;
>  }
> diff --git a/arch/arm64/kernel/psci.c b/arch/arm64/kernel/psci.c
> index fabd732d0a2d..6b25a12ed143 100644
> --- a/arch/arm64/kernel/psci.c
> +++ b/arch/arm64/kernel/psci.c
> @@ -39,7 +39,7 @@ static int __init cpu_psci_cpu_prepare(unsigned int cpu)
>  static int cpu_psci_cpu_boot(unsigned int cpu)
>  {
>  	phys_addr_t pa_secondary_entry = __pa_symbol(secondary_entry);
> -	int err = psci_ops.cpu_on(cpu_logical_map(cpu), pa_secondary_entry);
> +	int err = psci_ops.cpu_on(cpu_logical_map(cpu), pa_secondary_entry, 0);
>  	if (err && err != -EPERM)
>  		pr_err("failed to boot CPU%d (%d)\n", cpu, err);
>  
> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> index 8bb3f7c37678..95034485cb4d 100644
> --- a/drivers/firmware/psci/psci.c
> +++ b/drivers/firmware/psci/psci.c
> @@ -219,22 +219,30 @@ static int psci_0_2_cpu_off(u32 state)
>  	return __psci_cpu_off(PSCI_0_2_FN_CPU_OFF, state);
>  }
>  
> -static int __psci_cpu_on(u32 fn, unsigned long cpuid, unsigned long entry_point)
> +static int __psci_cpu_on(u32 fn, unsigned long cpuid, unsigned long entry_point,
> +			 unsigned long context)
>  {
>  	int err;
>  
> -	err = invoke_psci_fn(fn, cpuid, entry_point, 0);
> +	err = invoke_psci_fn(fn, cpuid, entry_point, context);
>  	return psci_to_linux_errno(err);
>  }
>  
> -static int psci_0_1_cpu_on(unsigned long cpuid, unsigned long entry_point)
> +static int psci_0_1_cpu_on(unsigned long cpuid, unsigned long entry_point,
> +			   unsigned long mbz)
>  {
> -	return __psci_cpu_on(psci_0_1_function_ids.cpu_on, cpuid, entry_point);
> +	if (mbz)
> +		return -EINVAL;
> +
> +	return __psci_cpu_on(psci_0_1_function_ids.cpu_on, cpuid, entry_point,
> +			     0);
>  }
>  
> -static int psci_0_2_cpu_on(unsigned long cpuid, unsigned long entry_point)
> +static int psci_0_2_cpu_on(unsigned long cpuid, unsigned long entry_point,
> +			   unsigned long context)
>  {
> -	return __psci_cpu_on(PSCI_FN_NATIVE(0_2, CPU_ON), cpuid, entry_point);
> +	return __psci_cpu_on(PSCI_FN_NATIVE(0_2, CPU_ON), cpuid, entry_point,
> +			     context);
>  }
>  
>  static int __psci_migrate(u32 fn, unsigned long cpuid)
> diff --git a/include/linux/psci.h b/include/linux/psci.h
> index 4ca0060a3fc4..0f43868a0bee 100644
> --- a/include/linux/psci.h
> +++ b/include/linux/psci.h
> @@ -25,7 +25,8 @@ struct psci_operations {
>  	u32 (*get_version)(void);
>  	int (*cpu_suspend)(u32 state, unsigned long entry_point);
>  	int (*cpu_off)(u32 state);
> -	int (*cpu_on)(unsigned long cpuid, unsigned long entry_point);
> +	int (*cpu_on)(unsigned long cpuid, unsigned long entry_point,
> +		      unsigned long context);
>  	int (*migrate)(unsigned long cpuid);
>  	int (*affinity_info)(unsigned long target_affinity,
>  			unsigned long lowest_affinity_level);


