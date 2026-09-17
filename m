Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E01C0C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 12:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+zlJ5jz2kN0YvLvgk4BOhxj/9a64emmfZfUdw4MOTMM=; b=M/VW1NeEkoL2777E0//JoFf3h7
	TI6iL+Uwe87fYwTVnIALN6ba110ev6zzvccNnLG43bkCMoXFoKMC4fuYqqS7/6tQ1fdVrObwJyzYv
	3Mq7kKhsN15nYfVE1JkaR8w+SFTS6CFCZRjxWDkXdwAiNISxrbPT5vGPUoFaVGUGGO6sJJ/zjxyCU
	1BQKXtVcoDfxGqdx1UQS4SNPaXt2SxdRDIqjvXLSOr1imhDBpa5STZdfZ1wU8MdXVWXURRb6yU7Xv
	79WHa1ZgEZAT6AqLjIsyGP5rzsTqxdW6rQCGOy9fMe4GfjX1ZqE1sEQ61qWu21ifWe2uWjTfLDAd7
	1gGpoM6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7At1-0000000BFjL-38NG;
	Thu, 17 Sep 2026 12:06:43 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Asy-0000000BFiH-0xbe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 12:06:42 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=+zlJ5jz2kN0YvLvgk4BOhxj/9a64emmfZfUdw4MOTMM=;
	b=4q4vjrkTUCXKLTMtujghu1eQ1Zme+sc/BL+0HesWEnOvuXN3nORa4ZfmvJcbBSiHZzMD3ZcT8
	B134asOLVgQR3UxXPAmxxJSfQEk+JK4jfyGfP68k/pFQV9ffTuytjtDyTfcpSOduw39knhM91AJ
	aO31HcnZ3qR6lyf8tGZVl4A=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4hlvMl57yhz1K9B1;
	Thu, 17 Sep 2026 19:55:31 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 3DB2640586;
	Thu, 17 Sep 2026 20:06:31 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 17 Sep 2026 20:06:30 +0800
Message-ID: <77313765-ba3d-40ba-b693-0b78a518d504@huawei.com>
Date: Thu, 17 Sep 2026 20:06:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 36/38] genirq: Trust local irqchip when considering IRQ
 for NMI
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<maz@kernel.org>, <lpieralisi@kernel.org>, <liaochang1@huawei.com>
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
 <20260914102102.68597-37-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260914102102.68597-37-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_050640_970732_9B8B41DA 
X-CRM114-Status: GOOD (  17.19  )
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



在 2026/9/14 18:21, Vladimir Murzin 写道:
> Generic IRQ code sanitises whether an IRQ can be considered for NMI
> use. Currently, it only considers IRQs managed by the root irqchip.
> 
> GICv5 IPIs belong to a logical domain built on top of the LPI domain.
> Consequently, generic IRQ code rejects these IPIs for NMI use, even
> though their hardware state is managed by the root LPI domain.
> 
> One way to allow GICv5 IPIs to be used as NMIs would be to adjust the
> sanitisation logic to account for this domain hierarchy. However, the
> generic IRQ code can instead trust the local irqchip.
> 
> Remove the root irqchip check and use the local irqchip when
> considering an IRQ for NMI use.
> 
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  include/linux/irq.h | 2 +-
>  kernel/irq/manage.c | 5 -----
>  2 files changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/include/linux/irq.h b/include/linux/irq.h
> index f485369b1b4f..92d3ad639ae8 100644
> --- a/include/linux/irq.h
> +++ b/include/linux/irq.h
> @@ -563,7 +563,7 @@ struct irq_chip {
>   * IRQCHIP_ONESHOT_SAFE:              One shot does not require mask/unmask
>   * IRQCHIP_EOI_THREADED:              Chip requires eoi() on unmask in threaded mode
>   * IRQCHIP_SUPPORTS_LEVEL_MSI:        Chip can provide two doorbells for Level MSIs
> - * IRQCHIP_SUPPORTS_NMI:              Chip can deliver NMIs, only for root irqchips
> + * IRQCHIP_SUPPORTS_NMI:              Chip can deliver NMIs
>   * IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND:  Invokes __enable_irq()/__disable_irq() for wake irqs
>   *                                    in the suspend path if they are in disabled state
>   * IRQCHIP_AFFINITY_PRE_STARTUP:      Default affinity update before startup
> diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
> index 57eff26fa646..c9ad79743ef6 100644
> --- a/kernel/irq/manage.c
> +++ b/kernel/irq/manage.c
> @@ -1370,11 +1370,6 @@ static bool irq_supports_nmi(struct irq_desc *desc)
>  {
>  	struct irq_data *d = irq_desc_get_irq_data(desc);
>  
> -#ifdef CONFIG_IRQ_DOMAIN_HIERARCHY
> -	/* Only IRQs directly managed by the root irqchip can be set as NMI */
> -	if (d->parent_data)
> -		return false;
> -#endif

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  	/* Don't support NMIs for chips behind a slow bus */
>  	if (d->chip->irq_bus_lock || d->chip->irq_bus_sync_unlock)
>  		return false;

-- 
Best regards,
Jinjie


