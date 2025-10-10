Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C92FECAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 04:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vXp9FK80IBNcMVhCOtsMWfNtGvpQvwTItDMeUKloxVA=; b=X2Kkyr0AFPl8WQUuaw5MuTdGbT
	+3d/TlwMRixIT+56IZL4qAKhcRZTmdseprp4EeroobDAusdfcHUl+JnEycE1BZeSF8pj/UCGc3A69
	aPhePWFaiQ5BtOx2iYSXIfLvQnqCj7fCX3XVO1zrBFHkF8GIW/NpLOfRuYWt0yveqgxA9KeRRJO5l
	uM0TIZsv0he6K6lTfiVue9mi6EqZjUsbxbXSh9CP3snAQFpn/r0eDupg2YBimwkzOurdXIv1/hEu9
	UFHxcOnsBdLTq2mJ4dLbtT0JCq1lSXoCSWH77jw7Urlpb7cYbjpnWfJLbsKcBBhwk8sZryFSrCiIC
	wz4xE0Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v74Ii-00000007cxk-3O9d;
	Fri, 10 Oct 2025 04:00:16 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v74Ig-00000007cx3-15Uw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 04:00:16 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=vXp9FK80IBNcMVhCOtsMWfNtGvpQvwTItDMeUKloxVA=;
	b=l9lGzF70bPdjT0nV5RiTGSfa8jTXN4gvTl8kJcHJnZvZ1D4yh8qRTU2qP2yITch55LKQU+AKi
	jIDXYtXSit6MOPt1HHgSH2Mm0HJ4zI6ctgMGGNr0lvVCLujslUlnm5EN4pxHJjQsbjPXJyKwen8
	+il0WfnGnegPH1HI50rMITA=
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4cjY032lryznTWt;
	Fri, 10 Oct 2025 11:59:15 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 6B67D180042;
	Fri, 10 Oct 2025 12:00:03 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 10 Oct 2025 12:00:02 +0800
Message-ID: <46d6bf56-3e7a-92d9-218f-4135d8850be9@huawei.com>
Date: Fri, 10 Oct 2025 11:59:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3 13/26] genirq: Factor-in percpu irqaction creation
Content-Language: en-US
To: Marc Zyngier <maz@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-acpi@vger.kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Rob
 Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>, Suzuki K Poulose <suzuki.poulose@arm.com>, James
 Clark <james.clark@linaro.org>, Jonathan Cameron
	<jonathan.cameron@huawei.com>
References: <20250922082833.2038905-1-maz@kernel.org>
 <20250922082833.2038905-14-maz@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20250922082833.2038905-14-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_210014_954655_F176F8E3 
X-CRM114-Status: GOOD (  23.67  )
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



On 2025/9/22 16:28, Marc Zyngier wrote:
> Move the code creating a per-cpu irqaction into its own helper, so that
> future changes to this code can be kept localised.
> 
> At the same time, fix the documentation which appears to say the wrong
> thing when it comes to interrupts being automatically enabled
> (percpu_devid interrupts never are).
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  kernel/irq/manage.c | 40 ++++++++++++++++++++++++----------------
>  1 file changed, 24 insertions(+), 16 deletions(-)
> 
> diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
> index c94837382037e..d9ddc30678b5d 100644
> --- a/kernel/irq/manage.c
> +++ b/kernel/irq/manage.c
> @@ -2442,6 +2442,24 @@ int setup_percpu_irq(unsigned int irq, struct irqaction *act)
>  	return retval;
>  }
>  
> +static
> +struct irqaction *create_percpu_irqaction(irq_handler_t handler, unsigned long flags,
> +					  const char *devname, void __percpu *dev_id)
> +{
> +	struct irqaction *action;
> +
> +	action = kzalloc(sizeof(struct irqaction), GFP_KERNEL);
> +	if (!action)
> +		return NULL;
> +
> +	action->handler = handler;
> +	action->flags = flags | IRQF_PERCPU | IRQF_NO_SUSPEND;
> +	action->name = devname;
> +	action->percpu_dev_id = dev_id;
> +
> +	return action;
> +}

This helper could be more universal by consider by distinguishing dev_id
and percpu_dev_id， so we can use it in request_nmi() and
request_threaded_irq() .

> +
>  /**
>   * __request_percpu_irq - allocate a percpu interrupt line
>   * @irq:	Interrupt line to allocate
> @@ -2450,9 +2468,9 @@ int setup_percpu_irq(unsigned int irq, struct irqaction *act)
>   * @devname:	An ascii name for the claiming device
>   * @dev_id:	A percpu cookie passed back to the handler function
>   *
> - * This call allocates interrupt resources and enables the interrupt on the
> - * local CPU. If the interrupt is supposed to be enabled on other CPUs, it
> - * has to be done on each CPU using enable_percpu_irq().
> + * This call allocates interrupt resources, but doesn't enable the interrupt
> + * on any CPU, as all percpu-devid interrupts are flagged with IRQ_NOAUTOEN.
> + * It has to be done on each CPU using enable_percpu_irq().
>   *
>   * @dev_id must be globally unique. It is a per-cpu variable, and
>   * the handler gets called with the interrupted CPU's instance of
> @@ -2477,15 +2495,10 @@ int __request_percpu_irq(unsigned int irq, irq_handler_t handler,
>  	if (flags && flags != IRQF_TIMER)
>  		return -EINVAL;
>  
> -	action = kzalloc(sizeof(struct irqaction), GFP_KERNEL);
> +	action = create_percpu_irqaction(handler, flags, devname, dev_id);
>  	if (!action)
>  		return -ENOMEM;
>  
> -	action->handler = handler;
> -	action->flags = flags | IRQF_PERCPU | IRQF_NO_SUSPEND;
> -	action->name = devname;
> -	action->percpu_dev_id = dev_id;
> -
>  	retval = irq_chip_pm_get(&desc->irq_data);
>  	if (retval < 0) {
>  		kfree(action);
> @@ -2546,16 +2559,11 @@ int request_percpu_nmi(unsigned int irq, irq_handler_t handler,
>  	if (irq_is_nmi(desc))
>  		return -EINVAL;
>  
> -	action = kzalloc(sizeof(struct irqaction), GFP_KERNEL);
> +	action = create_percpu_irqaction(handler, IRQF_NO_THREAD | IRQF_NOBALANCING,
> +					 name, dev_id);
>  	if (!action)
>  		return -ENOMEM;
>  
> -	action->handler = handler;
> -	action->flags = IRQF_PERCPU | IRQF_NO_SUSPEND | IRQF_NO_THREAD
> -		| IRQF_NOBALANCING;
> -	action->name = name;
> -	action->percpu_dev_id = dev_id;
> -
>  	retval = irq_chip_pm_get(&desc->irq_data);
>  	if (retval < 0)
>  		goto err_out;

