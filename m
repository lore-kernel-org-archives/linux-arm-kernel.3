Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBDC1C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 13:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y3Xg5uGyUWPFK0JKe+SkBxjj0KdYhT/E05HPhtdLQE8=; b=LoP2oecUk1OajOae/w/SUBoWWT
	eSPJFwEYiYdDZJppkdvY0aHUo1lN/N/RZ8psVBx3BPybRiy1ITbFVydUFMEkGLGxJyeSRC9tG5M+Y
	OvuCDb8il8l9gmo75v3GRei8Ag1VTspfmqzQNsVKUz7DdYSA5BJC7/dKJItdQzqlHSPq+Tu6AYvLN
	iB3Fu2tiHMnHReZpI4frjoGBMSTdyGmg2oxSS3Lomfl97q635feW+7+LnxITw2A5NHxZQcoS8GX/M
	P8a0ZpPFRTqQgeppqs5CKF5O5AykYUO6LY7qePGXXTTa6DWlyUBRlFNQ/46Clm4q+tbXDC692Qnne
	D9JCX8tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxBW-00000008OdU-09TH;
	Wed, 02 Jul 2025 13:07:34 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWx99-00000008OGZ-4C1H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 13:05:09 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bXKpt1TgDz6M4tL;
	Wed,  2 Jul 2025 21:04:06 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id CBD6314038F;
	Wed,  2 Jul 2025 21:05:01 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 2 Jul
 2025 15:05:01 +0200
Date: Wed, 2 Jul 2025 14:04:59 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
CC: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "Sascha
 Bischoff" <sascha.bischoff@arm.com>, Timothy Hayes <timothy.hayes@arm.com>,
	Bjorn Helgaas <bhelgaas@google.com>, "Liam R. Howlett"
	<Liam.Howlett@oracle.com>, Peter Maydell <peter.maydell@linaro.org>, "Mark
 Rutland" <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-pci@vger.kernel.org>
Subject: Re: [PATCH v6 21/31] irqchip/gic-v5: Add GICv5 IRS/SPI support
Message-ID: <20250702140459.000063ef@huawei.com>
In-Reply-To: <20250626-gicv5-host-v6-21-48e046af4642@kernel.org>
References: <20250626-gicv5-host-v6-0-48e046af4642@kernel.org>
	<20250626-gicv5-host-v6-21-48e046af4642@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_060508_324660_820B5BCE 
X-CRM114-Status: GOOD (  19.60  )
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



There are more ID masks not using FIELD_PREP() in here, but
as mentioned in earlier reply, even if we decide those are worth
cleaning up, no reason it can't be as a trivial patch on top of the
series.

Otherwise just one comment walking back some feedback on an earlier
patch (as what you had there now makes sense)

Jonathan

> diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
> new file mode 100644
> index 000000000000..fba8efceb26e
> --- /dev/null
> +++ b/drivers/irqchip/irq-gic-v5-irs.c
> @@ -0,0 +1,434 @@

> -static int gicv5_irq_ppi_domain_translate(struct irq_domain *d,
> -					  struct irq_fwspec *fwspec,
> -					  irq_hw_number_t *hwirq,
> -					  unsigned int *type)
> +static const struct irq_chip gicv5_spi_irq_chip = {
> +	.name			= "GICv5-SPI",
> +	.irq_mask		= gicv5_spi_irq_mask,
> +	.irq_unmask		= gicv5_spi_irq_unmask,
> +	.irq_eoi		= gicv5_spi_irq_eoi,
> +	.irq_set_type		= gicv5_spi_irq_set_type,
> +	.irq_set_affinity	= gicv5_spi_irq_set_affinity,
> +	.irq_retrigger		= gicv5_spi_irq_retrigger,
> +	.irq_get_irqchip_state	= gicv5_spi_irq_get_irqchip_state,
> +	.irq_set_irqchip_state	= gicv5_spi_irq_set_irqchip_state,
> +	.flags			= IRQCHIP_SET_TYPE_MASKED |
> +				  IRQCHIP_SKIP_SET_WAKE	  |
> +				  IRQCHIP_MASK_ON_SUSPEND,
> +};
> +
> +static __always_inline int gicv5_irq_domain_translate(struct irq_domain *d,
> +						      struct irq_fwspec *fwspec,
> +						      irq_hw_number_t *hwirq,
> +						      unsigned int *type,
> +						      const u8 hwirq_typ)

>  {
>  	if (!is_of_node(fwspec->fwnode))
>  		return -EINVAL;
> @@ -235,20 +428,39 @@ static int gicv5_irq_ppi_domain_translate(struct irq_domain *d,
>  	if (fwspec->param_count < 3)
>  		return -EINVAL;
>  
> -	if (fwspec->param[0] != GICV5_HWIRQ_TYPE_PPI)
> +	if (fwspec->param[0] != hwirq_type)
>  		return -EINVAL;
>  
>  	*hwirq = fwspec->param[1];
>  
> -	/*
> -	 * Handling mode is hardcoded for PPIs, set the type using
> -	 * HW reported value.
> -	 */
> -	*type = gicv5_ppi_irq_is_level(*hwirq) ? IRQ_TYPE_LEVEL_LOW : IRQ_TYPE_EDGE_RISING;
> +	switch (hwirq_type) {
> +	case GICV5_HWIRQ_TYPE_PPI:
> +		/*
> +		 * Handling mode is hardcoded for PPIs, set the type using
> +		 * HW reported value.
> +		 */
> +		*type = gicv5_ppi_irq_is_level(*hwirq) ? IRQ_TYPE_LEVEL_LOW :
> +							 IRQ_TYPE_EDGE_RISING;
> +		break;
> +	case GICV5_HWIRQ_TYPE_SPI:
> +		*type = fwspec->param[2] & IRQ_TYPE_SENSE_MASK;

Ah fair enough in earlier patches on just enforcing 3 parameters for all cases.
Seems like a sensible simplification once this is taken into account. So ignore that one!

> +		break;
> +	default:
> +		BUILD_BUG_ON(1);
> +	}
>  
>  	return 0;
>  }

