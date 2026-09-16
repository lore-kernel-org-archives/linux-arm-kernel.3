Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACF9C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 09:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9klhCRQ2JK/Zzt1mCcKryj4pkGbz3FBRTqrcllkqgzU=; b=4UcA+B6opJl7zfioQ0vhBGrEbI
	EYh+JVMcJrvMt4485+u6nTu40ibb6o/vwHWrdDx1YLKuReAQh9gpvEEs8lrfu9K2fAYdWM7j7bJUC
	g3GiwFAuZUuZgATQGGCoIH6TnA+sUENaYrx6lg59ZrMXRkqlKhE72ZQuxWyxa+230G4TJJ7SXOyJC
	jBKoPku/eGKfvRTlnWis3D6KzOD1dxVjkCF/duRIY0jA9cl0og8vfZXnPFzE1mpW87atbqcf9DMZ+
	h5kr+Cs1x9mv6j2XAizJtDfy/G4keHoBQ/96JRzc1v1PfiMuP9YwSHYIEGwnFsMvKPxuMTiAXZyy0
	8WpF35iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lWZ-00000008n1w-3bGx;
	Wed, 16 Sep 2026 09:01:51 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lWU-00000008n01-2Ucw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 09:01:49 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=9klhCRQ2JK/Zzt1mCcKryj4pkGbz3FBRTqrcllkqgzU=;
	b=oyPzwbIGSL93WiilF9OkD1KQYXlqWFVqQ218TdpgxuXQUIy41Esnhp8qxiPmF4PWk3koD3bC2
	WOlfTZKXBGpIuCfy/sVfv3UfWhJjXNvGqsUhmflvMvNSEgiTMUGYFPLVm3paqeVPPG0fMiCacej
	TJw2+c9iH3qIMH6f9Ryrm/8=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4hlCJw4lxwz1cyPY;
	Wed, 16 Sep 2026 16:50:40 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id A364040563;
	Wed, 16 Sep 2026 17:01:38 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 16 Sep 2026 17:01:38 +0800
Message-ID: <aa6bd598-e801-424a-b2b6-73c3a5ba0900@huawei.com>
Date: Wed, 16 Sep 2026 17:01:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 30/38] arm64: smp: Abstract SGI and LPI operations
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<maz@kernel.org>, <lpieralisi@kernel.org>, <liaochang1@huawei.com>
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
 <20260914102102.68597-31-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260914102102.68597-31-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_020147_034800_8806471B 
X-CRM114-Status: GOOD (  20.09  )
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



在 2026/9/14 18:20, Vladimir Murzin 写道:
> SGI and LPI backed IPIs require different setup, enable, disable and
> send operations. These differences are currently handled by repeatedly
> checking percpu_ipi_descs. As the implementation specific logic grows,
> these checks make the common IPI code increasingly difficult to
> follow.
> 
> Introduce an operations structure for each implementation to
> encapsulate the specific of SGI and LPI handling, leaving the common
> IPI paths generic.
> 
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/kernel/smp.c | 135 ++++++++++++++++++++++++++--------------
>  1 file changed, 88 insertions(+), 47 deletions(-)
> 
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index 3d7060aedd66..46cdcc114997 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -77,11 +77,18 @@ static DEFINE_PER_CPU_READ_MOSTLY(struct ipi_descs, pcpu_ipi_desc);
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
> @@ -242,7 +249,7 @@ asmlinkage notrace void secondary_start_kernel(void)
>  	 */
>  	notify_cpu_starting(cpu);
>  
> -	ipi_setup(cpu);
> +	ipi_enable(cpu);
>  
>  	numa_add_cpu(cpu);
>  
> @@ -937,13 +944,7 @@ void __noreturn panic_smp_self_stop(void)
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
> @@ -1074,54 +1075,37 @@ static bool ipi_should_be_nmi(enum ipi_msg_type ipi)
>  	}
>  }
>  
> -static void ipi_setup(int cpu)
> +static void ipi_enable(int cpu)
>  {
> -	int i;
> +	int ipi;
>  
>  	if (WARN_ON_ONCE(!ipi_irq_base))
>  		return;
>  
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
> +	for (ipi = 0; ipi < nr_ipi; ipi++)
> +		ipi_ops->enable(cpu, ipi);
>  }
>  
>  #ifdef CONFIG_HOTPLUG_CPU
>  static void ipi_teardown(int cpu)
>  {
> -	int i;
> +	int ipi;
>  
>  	if (WARN_ON_ONCE(!ipi_irq_base))
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
> -			disable_irq_nosync(irq_desc_get_irq(get_ipi_desc(cpu, i)));
> -		}
> -	}
> +	for (ipi = 0; ipi < nr_ipi; ipi++)
> +		ipi_ops->disable(cpu, ipi);
>  }
>  #endif
>  
> -static void ipi_setup_sgi(int ipi)
> +static void ipi_sgi_setup(int ipi, int ncpus)
>  {
>  	int err, irq, cpu;
>  
> +	if (WARN_ON_ONCE(ncpus))
> +		return;
> +
>  	irq = ipi_irq_base + ipi;
>  
>  	if (ipi_should_be_nmi(ipi)) {
> @@ -1138,7 +1122,53 @@ static void ipi_setup_sgi(int ipi)
>  	irq_set_status_flags(irq, IRQ_HIDDEN);
>  }
>  
> -static void ipi_setup_lpi(int ipi, int ncpus)
> +static void ipi_sgi_enable(int cpu, int ipi)
> +{
> +	int irq = ipi_irq_base + ipi;
> +
> +	if (ipi_should_be_nmi(ipi)) {
> +		prepare_percpu_nmi(irq);
> +		enable_percpu_nmi(irq, 0);
> +	} else {
> +		enable_percpu_irq(irq, 0);
> +	}
> +}
> +
> +static void ipi_sgi_disable(int cpu, int ipi)
> +{
> +	int irq = ipi_irq_base + ipi;
> +
> +	if (ipi_should_be_nmi(ipi)) {
> +		disable_percpu_nmi(irq);
> +		teardown_percpu_nmi(irq);
> +	} else {
> +		disable_percpu_irq(irq);
> +	}
> +}
> +
> +static void ipi_sgi_send(const cpumask_t *mask, unsigned int nr)
> +{
> +	__ipi_send_mask(get_ipi_desc(0, nr), mask);
> +}
> +
> +static const struct ipi_irq_ops ipi_sgi_ops = {
> +	.setup = ipi_sgi_setup,
> +	.disable = ipi_sgi_disable,
> +	.enable = ipi_sgi_enable,
> +	.send = ipi_sgi_send,
> +};
> +
> +static void ipi_lpi_enable(int cpu, int ipi)
> +{
> +	enable_irq(irq_desc_get_irq(get_ipi_desc(cpu, ipi)));
> +}
> +
> +static void ipi_lpi_disable(int cpu, int ipi)
> +{
> +	disable_irq_nosync(irq_desc_get_irq(get_ipi_desc(cpu, ipi)));
> +}
> +
> +static void ipi_lpi_setup(int ipi, int ncpus)
>  {
>  	for (int cpu = 0; cpu < ncpus; cpu++) {
>  		int err, irq;
> @@ -1158,6 +1188,20 @@ static void ipi_setup_lpi(int ipi, int ncpus)
>  	}
>  }
>  
> +static void ipi_lpi_send(const cpumask_t *mask, unsigned int nr) {

Sashiko pointed out a typo in the formatting.

static void ipi_lpi_send(const cpumask_t *mask, unsigned int nr)
{

> +	int cpu;
> +
> +	for_each_cpu(cpu, mask)
> +		__ipi_send_single(get_ipi_desc(cpu, nr), cpu);
> +}
> +
> +static const struct ipi_irq_ops ipi_lpi_ops = {
> +	.setup = ipi_lpi_setup,
> +	.disable = ipi_lpi_disable,
> +	.enable = ipi_lpi_enable,
> +	.send = ipi_lpi_send,
> +};
> +
>  void __init set_smp_ipi_range_percpu(int ipi_base, int n, int ncpus)
>  {
>  	int i;
> @@ -1165,18 +1209,15 @@ void __init set_smp_ipi_range_percpu(int ipi_base, int n, int ncpus)
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


