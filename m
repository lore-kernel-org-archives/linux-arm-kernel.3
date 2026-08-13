Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC70C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 09:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JmZfKyWiV9miiP+3KF3mlHsS37sxL8csgt0vhNVEDe8=; b=B0qdhUL2FfMAZK2kh6mn/W7Qm2
	dgsARSVecVAJh71o7pM0oCA2S0geoL4fkvL6sKLu2ICgqDc9ff7tFiq6jnpeHI5zdw/UggIfDZds/
	kaJjag5sm7hc1v/2CWF8ZHxve2jmrxZuL3kJBdecv2cP8o8P6diNpqG4R7oc75r0HPo7ycUFBCJDS
	ope2Qn08+BeNsBmflGU9VAqdxtHA4kg0Rbr3uSvG4XlPp96SbQPsnNQiYq0frkyL+Q1hbcmKV9jjH
	i819ALttxTLHehTmn4tFAwzEQwilx61dLYuj46F5fSSpE0LRFBK6HCcKNb3pFcNcp6Vlb6DJXtY1l
	Ns/7wgEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuRfC-00000000Hjr-29nU;
	Thu, 13 Aug 2026 09:23:50 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuRfA-00000000HiV-0iyU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 09:23:49 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=JmZfKyWiV9miiP+3KF3mlHsS37sxL8csgt0vhNVEDe8=;
	b=HbYHmnUbdx/66LS9GA3pmfmVr/QQLWQTKkNw+lrvHRrgsuH258o9pm6nfdNCzfzMoi4BpaBzZ
	lUiEjCx9JuX8xNFiBquLCK+Opmy4xinEQFCnsxT+2gV3OcmGenVf4NZKH06/dvHXijx998Ft49B
	wz/0zketCUeuMp3gx7AW8aE=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4hLKQ92X7dzpSvD;
	Thu, 13 Aug 2026 17:12:49 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id BC1772025F;
	Thu, 13 Aug 2026 17:23:34 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 13 Aug 2026 17:23:34 +0800
Message-ID: <3f27e2d0-8f5d-4d0c-8945-a4fa84327f7a@huawei.com>
Date: Thu, 13 Aug 2026 17:23:33 +0800
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
X-CRM114-CacheID: sfid-20260813_022348_520325_5C989275 
X-CRM114-Status: GOOD (  23.62  )
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
> 
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>


Should we replace ipi_should_be_nmi() with test_bit(ipi,
get_ipi_nmi_bitmap(cpu) in smp_send_stop()?

irq_desc_get_irq(get_ipi_desc(cpu, ipi)) has been used more than 3
times, can we define a new macro for use?

git grep "irq_desc_get_irq(get_ipi_desc(cpu, ipi))"
arch/arm64/kernel/smp.c:
enable_nmi(irq_desc_get_irq(get_ipi_desc(cpu, ipi)));
arch/arm64/kernel/smp.c:
enable_irq(irq_desc_get_irq(get_ipi_desc(cpu, ipi)));
arch/arm64/kernel/smp.c:
disable_nmi_nosync(irq_desc_get_irq(get_ipi_desc(cpu, ipi)));
arch/arm64/kernel/smp.c:
disable_irq(irq_desc_get_irq(get_ipi_desc(cpu, ipi)));


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


