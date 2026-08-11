Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE85FC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 13:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yUXmmail2F57NS+i2xOY6B3sG07h7vxhJGJkM1CjHFk=; b=aC5UNgHN3Eaae6b5NAB1EHJJKB
	zsaATU5XFKAFjDKKlPafC0Zbfx2kQ16eKr4Se4ZkkXgrNutwdxmoOQDKsPpBKgYZdQruGLK59lFmo
	y4W2YiGKL7PXsuya7cYWTry6SBsumF2eowfT6qctMy0V/CrzTla6+2AohSJzPa+MutCQWTz5ljuE2
	Z7sNParXAJ6Z42FYGqm0PucDHQExTzz3IJzUSfmAhJ5YkfaU3WBmI/TD5FmCfkXf3eg1tR+cU3p9X
	UPdX404yXakegof2mmkcRoyLf6b+2NY3aS51G6BMwRkX2mtQzGZVNO9vhrZOtdUcB66HxBTR8vvLj
	RKiWtuxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtmRN-0000000E60P-1KJB;
	Tue, 11 Aug 2026 13:22:49 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtmRJ-0000000E5zC-0RNE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 13:22:47 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=yUXmmail2F57NS+i2xOY6B3sG07h7vxhJGJkM1CjHFk=;
	b=fZ1+cgEMIT2T3wV1QE+tmHHA6WRjpFy5WB68VLGaveBVUvSn/UijNNZp8lj/ggdvfoSAUiWch
	R0e+VtM2hdOyUCH6oB3sF/7MGgpvlRggI7rP+0Fyh8Zyan0QC0PyS+VP460b2EqJ9dqCBob4TMN
	MV3hye27KeJJO8KqNXJVdUY=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4hKBqb22zWzcb3L;
	Tue, 11 Aug 2026 21:12:27 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id EE80740538;
	Tue, 11 Aug 2026 21:22:32 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 11 Aug 2026 21:22:32 +0800
Message-ID: <e8cc44c9-b7a9-4576-ac38-49756b9afbfe@huawei.com>
Date: Tue, 11 Aug 2026 21:22:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 38/45] arm64: smp: Abstract SGI and LPI operations
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <mark.rutland@arm.com>, <maz@kernel.org>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <liaochang1@huawei.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <20260727163453.7969-39-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260727163453.7969-39-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_062245_814053_4C589BAD 
X-CRM114-Status: GOOD (  19.86  )
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



在 2026/7/28 0:34, Vladimir Murzin 写道:
> SGI and LPI backed IPIs require different setup, enable, disable and
> send operations. These differences are currently handled by repeatedly
> checking percpu_ipi_descs. As the implementation specific logic grows,
> these checks make the common IPI code increasingly difficult to
> follow.
> 
> Introduce an operations structure for each implementation to
> encapsulate the specific of SGI and LPI handling, leaving the common
> IPI paths generic.

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

> 
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  arch/arm64/kernel/smp.c | 163 +++++++++++++++++++++++++---------------
>  1 file changed, 101 insertions(+), 62 deletions(-)
> 
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index 6e5b673613ca..3dd4bc02caed 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -75,11 +75,18 @@ static DEFINE_PER_CPU_READ_MOSTLY(struct ipi_descs, pcpu_ipi_desc);
>  
>  #define get_ipi_desc(__cpu, __ipi) (per_cpu_ptr(&pcpu_ipi_desc, __cpu)->descs[__ipi])
>  
> -static bool percpu_ipi_descs __ro_after_init;
> +struct ipi_irq_ops {
> +	void (*setup)(int ipi, int ncpus);
> +	void (*disable)(int cpu, int ipi);
> +	void (*enable)(int cpu, int ipi);
> +	void (*send)(const cpumask_t *mask, unsigned int nr);
> +};
> +
> +static const struct ipi_irq_ops *ipi_ops __ro_after_init;
>  
>  static bool crash_stop;
>  
> -static void ipi_setup(int cpu);
> +static void ipi_enable(int cpu);
>  
>  #ifdef CONFIG_HOTPLUG_CPU
>  static void ipi_teardown(int cpu);
> @@ -240,7 +247,7 @@ asmlinkage notrace void secondary_start_kernel(void)
>  	 */
>  	notify_cpu_starting(cpu);
>  
> -	ipi_setup(cpu);
> +	ipi_enable(cpu);
>  
>  	numa_add_cpu(cpu);
>  
> @@ -916,13 +923,7 @@ static void __noreturn ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs
>  
>  static void arm64_send_ipi(const cpumask_t *mask, unsigned int nr)
>  {
> -	unsigned int cpu;
> -
> -	if (!percpu_ipi_descs)
> -		__ipi_send_mask(get_ipi_desc(0, nr), mask);
> -	else
> -		for_each_cpu(cpu, mask)
> -			__ipi_send_single(get_ipi_desc(cpu, nr), cpu);
> +	ipi_ops->send(mask, nr);
>  }
>  
>  static void arm64_backtrace_ipi(cpumask_t *mask)
> @@ -1048,53 +1049,13 @@ static bool ipi_should_be_nmi(enum ipi_msg_type ipi)
>  	}
>  }
>  
> -static void ipi_setup(int cpu)
> -{
> -	int i;
> -
> -	if (WARN_ON_ONCE(!ipi_irq_base))
> -		return;
> -
> -	for (i = 0; i < nr_ipi; i++) {
> -		if (!percpu_ipi_descs) {
> -			if (ipi_should_be_nmi(i)) {
> -				prepare_percpu_nmi(ipi_irq_base + i);
> -				enable_percpu_nmi(ipi_irq_base + i, 0);
> -			} else {
> -				enable_percpu_irq(ipi_irq_base + i, 0);
> -			}
> -		} else {
> -			enable_irq(irq_desc_get_irq(get_ipi_desc(cpu, i)));
> -		}
> -	}
> -}
> -
> -#ifdef CONFIG_HOTPLUG_CPU
> -static void ipi_teardown(int cpu)
> +static void ipi_sgi_setup(int ipi, int ncpus)
>  {
> -	int i;
> +	int err, irq, cpu;
>  
> -	if (WARN_ON_ONCE(!ipi_irq_base))
> +	if (WARN_ON_ONCE(ncpus))
>  		return;
>  
> -	for (i = 0; i < nr_ipi; i++) {
> -		if (!percpu_ipi_descs) {
> -			if (ipi_should_be_nmi(i)) {
> -				disable_percpu_nmi(ipi_irq_base + i);
> -				teardown_percpu_nmi(ipi_irq_base + i);
> -			} else {
> -				disable_percpu_irq(ipi_irq_base + i);
> -			}
> -		} else {
> -			disable_irq(irq_desc_get_irq(get_ipi_desc(cpu, i)));
> -		}
> -	}
> -}
> -#endif
> -
> -static void ipi_setup_sgi(int ipi)
> -{
> -	int err, irq, cpu;
>  
>  	irq = ipi_irq_base + ipi;
>  
> @@ -1112,7 +1073,50 @@ static void ipi_setup_sgi(int ipi)
>  	irq_set_status_flags(irq, IRQ_HIDDEN);
>  }
>  
> -static void ipi_setup_lpi(int ipi, int ncpus)
> +static void ipi_sgi_enable(int cpu, int ipi)
> +{
> +	if (ipi_should_be_nmi(ipi)) {
> +		prepare_percpu_nmi(ipi_irq_base + ipi);
> +		enable_percpu_nmi(ipi_irq_base + ipi, 0);
> +	} else {
> +		enable_percpu_irq(ipi_irq_base + ipi, 0);
> +	}
> +}
> +
> +static void ipi_sgi_disable(int cpu, int ipi)
> +{
> +	if (ipi_should_be_nmi(ipi)) {
> +		disable_percpu_nmi(ipi_irq_base + ipi);
> +		teardown_percpu_nmi(ipi_irq_base + ipi);
> +	} else {
> +		disable_percpu_irq(ipi_irq_base + ipi);
> +	}
> +}
> +
> +static void ipi_sgi_send(const cpumask_t *mask, unsigned int nr)
> +{
> +	__ipi_send_mask(get_ipi_desc(0, nr), mask);
> +}
> +
> +static const struct ipi_irq_ops ipi_sgi_ops = {
> +	.disable = ipi_sgi_disable,
> +	.enable = ipi_sgi_enable,
> +	.setup = ipi_sgi_setup,
> +	.send = ipi_sgi_send,
> +};
> +
> +
> +static void ipi_lpi_enable(int cpu, int ipi)
> +{
> +	enable_irq(irq_desc_get_irq(get_ipi_desc(cpu, ipi)));
> +}
> +
> +static void ipi_lpi_disable(int cpu, int ipi)
> +{
> +	disable_irq(irq_desc_get_irq(get_ipi_desc(cpu, ipi)));
> +}
> +
> +static void ipi_lpi_setup(int ipi, int ncpus)
>  {
>  	for (int cpu = 0; cpu < ncpus; cpu++) {
>  		int err, irq;
> @@ -1132,6 +1136,44 @@ static void ipi_setup_lpi(int ipi, int ncpus)
>  	}
>  }
>  
> +static void ipi_lpi_send(const cpumask_t *mask, unsigned int nr) {
> +	int cpu;
> +
> +	for_each_cpu(cpu, mask)
> +		__ipi_send_single(get_ipi_desc(cpu, nr), cpu);
> +}
> +
> +static const struct ipi_irq_ops ipi_lpi_ops = {
> +	.disable = ipi_lpi_disable,
> +	.enable = ipi_lpi_enable,
> +	.setup = ipi_lpi_setup,
> +	.send = ipi_lpi_send,
> +};
> +
> +static void ipi_enable(int cpu)
> +{
> +	int ipi;
> +
> +	if (WARN_ON_ONCE(!ipi_irq_base))
> +		return;
> +
> +	for (ipi = 0; ipi < nr_ipi; ipi++)
> +		ipi_ops->enable(cpu, ipi);
> +}
> +
> +#ifdef CONFIG_HOTPLUG_CPU
> +static void ipi_teardown(int cpu)
> +{
> +	int ipi;
> +
> +	if (WARN_ON_ONCE(!ipi_irq_base))
> +		return;
> +
> +	for (ipi = 0; ipi < nr_ipi; ipi++)
> +		ipi_ops->disable(cpu, ipi);
> +}
> +#endif
> +
>  void __init set_smp_ipi_range_percpu(int ipi_base, int n, int ncpus)
>  {
>  	int i;
> @@ -1139,18 +1181,15 @@ void __init set_smp_ipi_range_percpu(int ipi_base, int n, int ncpus)
>  	WARN_ON(n < MAX_IPI);
>  	nr_ipi = min(n, MAX_IPI);
>  
> -	percpu_ipi_descs = !!ncpus;
>  	ipi_irq_base = ipi_base;
>  
> -	for (i = 0; i < nr_ipi; i++) {
> -		if (!percpu_ipi_descs)
> -			ipi_setup_sgi(i);
> -		else
> -			ipi_setup_lpi(i, ncpus);
> -	}
> +	ipi_ops = ncpus ? &ipi_lpi_ops : &ipi_sgi_ops;
> +
> +	for (i = 0; i < nr_ipi; i++)
> +		ipi_ops->setup(i, ncpus);
>  
>  	/* Setup the boot CPU immediately */
> -	ipi_setup(smp_processor_id());
> +	ipi_enable(smp_processor_id());
>  }
>  
>  void arch_smp_send_reschedule(int cpu)


