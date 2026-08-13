Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 296D9C5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 09:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZdTJChXJGAR0DnHOmnRlV6wzvlIC2AYAME9wmSj2Llk=; b=iw432DRLtDGaSU4bmpV8KG8YRa
	Z0nbkgMJQMCVhRrXH8qUUGSN+pi/P+jaoPQbu8SVaASTS5cynq/lF0JwNr7LGyYVlZi1rXGQ6HvOP
	TDKRGolJe1kTcSVDtzJ5xxuDo/RycpUzHd9He0W0OuNtIiR2wPrBcItMl18yEV8Ixqo1n2TLIBUeY
	grw2NRRvAxIQ5SX1+lVusnUZXs3tuV8yDyYKy+oX9JCdqti+sCKhdtw+UsG/a7ofBUK2rj7ezujBV
	/ouuRZDO4VPR8sG2FzVHrdz8zQsmOVl6xyO5pYq09svyYnpv3E+asX8jCO1M/4d0zS7OKWsQQmx9i
	j8Fn38vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuRbr-00000000GyW-2bsR;
	Thu, 13 Aug 2026 09:20:23 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuRbn-00000000Gxh-31Uq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 09:20:21 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ZdTJChXJGAR0DnHOmnRlV6wzvlIC2AYAME9wmSj2Llk=;
	b=5XqMTCmQFmikf2RTkS5Ip1YDOwGxk4YYx3LehF82+FIyYiEpOwa4rwl8Rs8iJueB2HttHsk79
	CLwRpXf6kQk8aqYRsg7KxROei/Xtg+8hy513G7jnShHl84jLRmIu+8bFkOHGchR6BloTA0RC4c3
	kPNq57tmW+Blcsaw3eYe+6k=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4hLKLF5jr5zLlXf;
	Thu, 13 Aug 2026 17:09:25 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 44FC140586;
	Thu, 13 Aug 2026 17:20:03 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 13 Aug 2026 17:20:02 +0800
Message-ID: <ad3939ac-3f47-4fe1-8759-f55806b53ef5@huawei.com>
Date: Thu, 13 Aug 2026 17:20:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 39/45] arm64: smp: Fall back to IRQ when IPI NMI
 request fails
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <mark.rutland@arm.com>, <maz@kernel.org>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <liaochang1@huawei.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <20260727163453.7969-40-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260727163453.7969-40-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_022020_372286_5494D08D 
X-CRM114-Status: GOOD (  26.37  )
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
> Existing IPI setup logic relies on ipi_should_be_nmi() to decide
> whether to request an NMI (if supported) or an ordinary IRQ. If NMI is
> not supported, using an ordinary IRQ is acceptable.
> 
> FEAT_NMI requires complementary support in the interrupt
> controller. If FEAT_NMI is present but interrupt controller support is
> absent, request_percpu_nmi() can fail.
> 
> One way to prevent this would be to extend ipi_should_be_nmi() to also
> check for interrupt controller support. However, since falling back to
> an ordinary IRQ is acceptable, treat ipi_should_be_nmi() as a hint
> instead. Whether an IPI is actually registered as an NMI is determined
> by the success or failure of request_percpu_nmi(). If the request
> fails, fall back to request_irq().
> 
> Track which IPIs were actually registered as NMIs and use that state
> in the per-CPU enable and disable paths. This avoids calling the
> percpu NMI helpers for an IPI that fell back to regular IRQ handling.

Hi Vladimir,

Should we update the following comment and mention that "regular IPI
will also be used when the nmi_bitmap is not set"?

936 void arch_trigger_cpumask_backtrace(const cpumask_t *mask, int
exclude_cpu)
 937 {
 938 >-------/*
 939 >------- * NOTE: though nmi_trigger_cpumask_backtrace() has "nmi_"
in the name,
 940 >------- * nothing about it truly needs to be implemented using an
NMI, it's
 941 >------- * just that it's _allowed_ to work with NMIs. If
ipi_should_be_nmi()
 942 >------- * returned false our backtrace attempt will just use a
regular IPI.
 943 >------- */
 944 >-------nmi_trigger_cpumask_backtrace(mask, exclude_cpu,
arm64_backtrace_ipi);
 945 }

otherwise, LGTM
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

> 
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  arch/arm64/kernel/smp.c | 31 +++++++++++++++++++++++--------
>  1 file changed, 23 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index 3dd4bc02caed..9bacdbb2aa44 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -69,11 +69,13 @@ static int nr_ipi __ro_after_init = NR_IPI;
>  
>  struct ipi_descs {
>  	struct irq_desc *descs[MAX_IPI];
> +	DECLARE_BITMAP(nmi_bitmap, MAX_IPI);
>  };
>  
>  static DEFINE_PER_CPU_READ_MOSTLY(struct ipi_descs, pcpu_ipi_desc);
>  
>  #define get_ipi_desc(__cpu, __ipi) (per_cpu_ptr(&pcpu_ipi_desc, __cpu)->descs[__ipi])
> +#define get_ipi_nmi_bitmap(__cpu) (per_cpu_ptr(&pcpu_ipi_desc, __cpu)->nmi_bitmap)
>  
>  struct ipi_irq_ops {
>  	void (*setup)(int ipi, int ncpus);
> @@ -1051,31 +1053,44 @@ static bool ipi_should_be_nmi(enum ipi_msg_type ipi)
>  
>  static void ipi_sgi_setup(int ipi, int ncpus)
>  {
> +	bool is_nmi = ipi_should_be_nmi(ipi);
>  	int err, irq, cpu;
>  
>  	if (WARN_ON_ONCE(ncpus))
>  		return;
>  
> -
>  	irq = ipi_irq_base + ipi;
>  
> -	if (ipi_should_be_nmi(ipi)) {
> -		err = request_percpu_nmi(irq, ipi_handler, "IPI", NULL, &irq_stat);
> -		WARN(err, "Could not request IRQ %d as NMI, err=%d\n", irq, err);
> -	} else {
> +	/*
> +	 * Try to request NMI if it should be
> +	 */
> +	if (is_nmi && request_percpu_nmi(irq, ipi_handler, "IPI", NULL, &irq_stat)) {
> +		/*
> +		 * Fallback to regular IRQ
> +		 */
> +		is_nmi = false;
> +	}
> +
> +       /*
> +        * Otherwise regular IRQ
> +        */
> +	if (!is_nmi) {
>  		err = request_percpu_irq(irq, ipi_handler, "IPI", &irq_stat);
>  		WARN(err, "Could not request IRQ %d as IRQ, err=%d\n", irq, err);
>  	}
>  
> -	for_each_possible_cpu(cpu)
> +	for_each_possible_cpu(cpu) {
>  		get_ipi_desc(cpu, ipi) = irq_to_desc(irq);
> +		if (is_nmi)
> +			set_bit(ipi, get_ipi_nmi_bitmap(cpu));
> +	}
>  
>  	irq_set_status_flags(irq, IRQ_HIDDEN);
>  }
>  
>  static void ipi_sgi_enable(int cpu, int ipi)
>  {
> -	if (ipi_should_be_nmi(ipi)) {
> +	if (test_bit(ipi, get_ipi_nmi_bitmap(cpu))) {
>  		prepare_percpu_nmi(ipi_irq_base + ipi);
>  		enable_percpu_nmi(ipi_irq_base + ipi, 0);
>  	} else {
> @@ -1085,7 +1100,7 @@ static void ipi_sgi_enable(int cpu, int ipi)
>  
>  static void ipi_sgi_disable(int cpu, int ipi)
>  {
> -	if (ipi_should_be_nmi(ipi)) {
> +	if (test_bit(ipi, get_ipi_nmi_bitmap(cpu))) {
>  		disable_percpu_nmi(ipi_irq_base + ipi);
>  		teardown_percpu_nmi(ipi_irq_base + ipi);
>  	} else {


