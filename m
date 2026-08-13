Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 855CCC5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 08:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0I9FO0C9paSWnLx+IFjypc0SDQ0xxMmIVvm2n8CFUW0=; b=xFt7i1Z2Q7w3qf90zX2Nr2gJ9c
	AZJCrvhg8ygdcfg5yfND0mYc4B3+l+uVHdFYVH5tdMsL+fvRikkOjlEaYJXitEJhtjq+Bli/sQygq
	AvNpShkMw6erAlnSDUVCBtYaSOr275jeFIXpS+IsEPQqODBjugJp9KoDoXIOdExcmgmPibPFB77wA
	JMO/a9ZkGiUbZD5C1I0EYRbE/V6mckYQAN3f3ru6jFsmzW3Wkqi5Vrpk2NXec8qswPwQi8Xa+Tqmn
	CbjcTE033+c0/RGr+DSnGjTE0DrjZ18I/Rqm5kk63GYnxqgkDoXUnaqTQm0HExApuDk6ZtfcgGwAJ
	TA3OcgCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQNP-000000004UA-2PIl;
	Thu, 13 Aug 2026 08:01:23 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQNL-000000004NM-1WRj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 08:01:22 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=0I9FO0C9paSWnLx+IFjypc0SDQ0xxMmIVvm2n8CFUW0=;
	b=3a/t762tLiyyGyslsQyASsnveo8mB9l57yxzHOiPqupMShofxnmAXn1Zch1Zy8PNB5ABCkiiO
	mpaDgOtQxeLxg7W9448guNI/jBs23+3EwUsl5uskylcBM8QFQU0DsfyiCVM7JBp3b6EWgO4Qeon
	/D9irX1EEw8aqb1C5KE7ILo=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4hLHby6FpPz1T4JN;
	Thu, 13 Aug 2026 15:51:10 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 9B79840561;
	Thu, 13 Aug 2026 16:01:02 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 13 Aug 2026 16:01:01 +0800
Message-ID: <290a5478-5415-4b0d-a790-79fa7e430888@huawei.com>
Date: Thu, 13 Aug 2026 16:01:01 +0800
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
X-CRM114-CacheID: sfid-20260813_010120_051272_F36D46AB 
X-CRM114-Status: GOOD (  26.00  )
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
> 
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  arch/arm64/kernel/smp.c | 163 +++++++++++++++++++++++++---------------
>  1 file changed, 101 insertions(+), 62 deletions(-)

Hi, Vladimir,

I believe that the modifications here do not need to be so extensive. By
maintaining the order of the related function definitions consistent
with the original, the changes can be reduced to only 126 lines, and the
modifications will be easier to review.

arch/arm64/kernel/smp.c | 126
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------------------------------------
 1 file changed, 81 insertions(+), 45 deletions(-)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 534fc58df62a..b6b020118712 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -75,11 +75,18 @@ static DEFINE_PER_CPU_READ_MOSTLY(struct ipi_descs,
pcpu_ipi_desc);

 #define get_ipi_desc(__cpu, __ipi) (per_cpu_ptr(&pcpu_ipi_desc,
__cpu)->descs[__ipi])

-static bool percpu_ipi_descs __ro_after_init;
+struct ipi_irq_ops {
+       void (*setup)(int ipi, int ncpus);
+       void (*enable)(int cpu, int ipi);
+       void (*disable)(int cpu, int ipi);
+       void (*send)(const cpumask_t *mask, unsigned int nr);
+};
+
+static const struct ipi_irq_ops *ipi_ops __ro_after_init;

 static bool crash_stop;

-static void ipi_setup(int cpu);
+static void ipi_enable(int cpu);

 #ifdef CONFIG_HOTPLUG_CPU
 static void ipi_teardown(int cpu);
@@ -240,7 +247,7 @@ asmlinkage notrace void secondary_start_kernel(void)
         */
        notify_cpu_starting(cpu);

-       ipi_setup(cpu);
+       ipi_enable(cpu);

        numa_add_cpu(cpu);

@@ -916,13 +923,7 @@ static void __noreturn ipi_cpu_crash_stop(unsigned
int cpu, struct pt_regs *regs

 static void arm64_send_ipi(const cpumask_t *mask, unsigned int nr)
 {
-       unsigned int cpu;
-
-       if (!percpu_ipi_descs)
-               __ipi_send_mask(get_ipi_desc(0, nr), mask);
-       else
-               for_each_cpu(cpu, mask)
-                       __ipi_send_single(get_ipi_desc(cpu, nr), cpu);
+       ipi_ops->send(mask, nr);
 }

 static void arm64_backtrace_ipi(cpumask_t *mask)
@@ -1048,25 +1049,15 @@ static bool ipi_should_be_nmi(enum ipi_msg_type ipi)
        }
 }

-static void ipi_setup(int cpu)
+static void ipi_enable(int cpu)
 {
        int i;

        if (WARN_ON_ONCE(!ipi_irq_base))
                return;

-       for (i = 0; i < nr_ipi; i++) {
-               if (!percpu_ipi_descs) {
-                       if (ipi_should_be_nmi(i)) {
-                               prepare_percpu_nmi(ipi_irq_base + i);
-                               enable_percpu_nmi(ipi_irq_base + i, 0);
-                       } else {
-                               enable_percpu_irq(ipi_irq_base + i, 0);
-                       }
-               } else {
-                       enable_irq(irq_desc_get_irq(get_ipi_desc(cpu, i)));
-               }
-       }
+       for (i = 0; i < nr_ipi; i++)
+               ipi_ops->enable(cpu, i);
 }

 #ifdef CONFIG_HOTPLUG_CPU
@@ -1077,25 +1068,18 @@ static void ipi_teardown(int cpu)
        if (WARN_ON_ONCE(!ipi_irq_base))
                return;

-       for (i = 0; i < nr_ipi; i++) {
-               if (!percpu_ipi_descs) {
-                       if (ipi_should_be_nmi(i)) {
-                               disable_percpu_nmi(ipi_irq_base + i);
-                               teardown_percpu_nmi(ipi_irq_base + i);
-                       } else {
-                               disable_percpu_irq(ipi_irq_base + i);
-                       }
-               } else {
-                       disable_irq(irq_desc_get_irq(get_ipi_desc(cpu, i)));
-               }
-       }
+       for (i = 0; i < nr_ipi; i++)
+               ipi_ops->disable(cpu, i);
 }
 #endif

-static void ipi_setup_sgi(int ipi)
+static void ipi_sgi_setup(int ipi, int ncpus)
 {
        int err, irq, cpu;

+       if (WARN_ON_ONCE(ncpus))
+               return;
+
        irq = ipi_irq_base + ipi;

        if (ipi_should_be_nmi(ipi)) {
@@ -1112,7 +1096,39 @@ static void ipi_setup_sgi(int ipi)
        irq_set_status_flags(irq, IRQ_HIDDEN);
 }

-static void ipi_setup_lpi(int ipi, int ncpus)
+static void ipi_sgi_enable(int cpu, int ipi)
+{
+       if (ipi_should_be_nmi(ipi)) {
+               prepare_percpu_nmi(ipi_irq_base + ipi);
+               enable_percpu_nmi(ipi_irq_base + ipi, 0);
+       } else {
+               enable_percpu_irq(ipi_irq_base + ipi, 0);
+       }
+}
+
+static void ipi_sgi_disable(int cpu, int ipi)
+{
+       if (ipi_should_be_nmi(ipi)) {
+               disable_percpu_nmi(ipi_irq_base + ipi);
+               teardown_percpu_nmi(ipi_irq_base + ipi);
+       } else {
+               disable_percpu_irq(ipi_irq_base + ipi);
+       }
+}
+
+static void ipi_sgi_send(const cpumask_t *mask, unsigned int nr)
+{
+       __ipi_send_mask(get_ipi_desc(0, nr), mask);
+}
+
+static const struct ipi_irq_ops ipi_sgi_ops = {
+       .setup = ipi_sgi_setup,
+       .enable = ipi_sgi_enable,
+       .disable = ipi_sgi_disable,
+       .send = ipi_sgi_send,
+};
+
+static void ipi_lpi_setup(int ipi, int ncpus)
 {
        for (int cpu = 0; cpu < ncpus; cpu++) {
                int err, irq;
@@ -1132,6 +1148,30 @@ static void ipi_setup_lpi(int ipi, int ncpus)
        }
 }

+static void ipi_lpi_enable(int cpu, int ipi)
+{
+       enable_irq(irq_desc_get_irq(get_ipi_desc(cpu, ipi)));
+}
+
+static void ipi_lpi_disable(int cpu, int ipi)
+{
+       disable_irq(irq_desc_get_irq(get_ipi_desc(cpu, ipi)));
+}
+
+static void ipi_lpi_send(const cpumask_t *mask, unsigned int nr) {
+       int cpu;
+
+       for_each_cpu(cpu, mask)
+               __ipi_send_single(get_ipi_desc(cpu, nr), cpu);
+}
+
+static const struct ipi_irq_ops ipi_lpi_ops = {
+       .setup = ipi_lpi_setup,
+       .enable = ipi_lpi_enable,
+       .disable = ipi_lpi_disable,
+       .send = ipi_lpi_send,
+};
+
 void __init set_smp_ipi_range_percpu(int ipi_base, int n, int ncpus)
 {
        int i;
@@ -1139,18 +1179,14 @@ void __init set_smp_ipi_range_percpu(int
ipi_base, int n, int ncpus)
        WARN_ON(n < MAX_IPI);
        nr_ipi = min(n, MAX_IPI);

-       percpu_ipi_descs = !!ncpus;
+       ipi_ops = ncpus ? &ipi_lpi_ops : &ipi_sgi_ops;
        ipi_irq_base = ipi_base;

-       for (i = 0; i < nr_ipi; i++) {
-               if (!percpu_ipi_descs)
-                       ipi_setup_sgi(i);
-               else
-                       ipi_setup_lpi(i, ncpus);
-       }
+       for (i = 0; i < nr_ipi; i++)
+               ipi_ops->setup(i, ncpus);

        /* Setup the boot CPU immediately */
-       ipi_setup(smp_processor_id());
+       ipi_enable(smp_processor_id());
 }


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

Could the order of different callbacks in ipi_sgi_ops and ipi_sgi_ops
consistent with this definition?

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

An extra blank line.

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

An extra blank line.

Best regards,
Jinjie

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


