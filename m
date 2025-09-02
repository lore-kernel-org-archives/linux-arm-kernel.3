Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A94FBCA100D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 19:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+IOP6KQgl7sg4RNv1HB15N9tnpQImYkfB9yocklRZDY=; b=N7mmiZuTrCTUMuHzq0r2AoSfMI
	Dg9RnqKH+/n5nis9WZKHukvWgTSu7JIslVGmKy+ph3sX4iUR57O/RCMEqaYNU++p4Zety5y8PxovC
	ms+8TWTboD53Na6uSh4esXSC+ktvAHvN3tQuh4RwpOC0qGkPgixD/TVdZaKttR94yxqk8Dq+aI0fs
	4I0eZQbHhQuD1DWSBo5e4EBh8psCeAW72hFAydGIG4KcK/ZZO345GkTzCXJKjTLCc+6Jpmy4KQdwP
	ekF3OsN0GonG4bBRIH9FXEyrHkX6CWp2sqHhOk1jr2RPDVwHm2sXRZbbHgYPFcb8HZBZot1d1zY6e
	8fa78ptA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWNe-00000001ZDM-3G3l;
	Tue, 02 Sep 2025 19:09:22 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQjO-0000000HWSg-2KDD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 13:07:27 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756818444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+IOP6KQgl7sg4RNv1HB15N9tnpQImYkfB9yocklRZDY=;
	b=0MpqbOb0MmctHgGLQpEoK7RvCrWqhe11k7zTcy8rW2Qfo7mEGcPn5YRQkw8nA/4UE4khMk
	qVglqTWaaErQgvpR6lBTxWvoGi008hP0GLsPHU7H/pp+UX2aUaLx1+7feoS6miXFyPEg9Z
	iqBXxrZmrXN+K4gbv0NKs1+w3YlIfGOPH2Uk/IWlXPSXd83ArVwnQB3A+coNOQYY0xi91a
	EQqlpauvguqFqYMV0d3U09qWOkil3jRoUezBM+Ji7uhtq2xn8/ZdOw0STltaDV+3yXvIiL
	w+eONQLePF81UOj2KAyLncrk+TWHd7+J8U4A22FRez4iuwC+eMkgWjBEaJfnHg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756818444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+IOP6KQgl7sg4RNv1HB15N9tnpQImYkfB9yocklRZDY=;
	b=AKhUPcaeUUqBybjPoJeHUXRY72ygfIw8wlfOfdrh1iP5zgu2ytXtU3whmTaefPi79pOvkS
	oV/Hg036JfwXYfDg==
To: Ryan Chen <ryan_chen@aspeedtech.com>, ryan_chen
 <ryan_chen@aspeedtech.com>, Eddie James <eajames@linux.ibm.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew
 Jeffery <andrew@codeconstruct.com.au>, Lee Jones <lee@kernel.org>,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/4] irqchip/aspeed-scu-ic: Add support AST2700 SCU
 interrupt controllers
In-Reply-To: <20250831021438.976893-5-ryan_chen@aspeedtech.com>
References: <20250831021438.976893-1-ryan_chen@aspeedtech.com>
 <20250831021438.976893-5-ryan_chen@aspeedtech.com>
Date: Tue, 02 Sep 2025 15:07:21 +0200
Message-ID: <87y0qx0zqu.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_060726_736537_BC21F012 
X-CRM114-Status: GOOD (  27.99  )
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

On Sun, Aug 31 2025 at 10:14, Ryan Chen wrote:

> The AST2700 continues the multi-instance SCU interrupt controller model
> introduced in the AST2600, with four independent interrupt domains
> (scu-ic0 to 3).
>
> Unlike earlier generations that combine interrupt enable and status bits
> into a single register, the AST2700 separates these into distinct IER and
> ISR registers. Support for this layout is implemented by using register
> offsets and separate chained IRQ handlers.
>
> The variant table is extended to cover AST2700 IC instances, enabling
> shared initialization logic while preserving support for previous SoCs.
>
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  drivers/irqchip/irq-aspeed-scu-ic.c | 123 +++++++++++++++++++++-------
>  1 file changed, 95 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/irqchip/irq-aspeed-scu-ic.c b/drivers/irqchip/irq-aspeed-scu-ic.c
> index cbfc35919281..ffdd9b4e44c1 100644
> --- a/drivers/irqchip/irq-aspeed-scu-ic.c
> +++ b/drivers/irqchip/irq-aspeed-scu-ic.c
> @@ -17,12 +17,16 @@
>  
>  #define ASPEED_SCU_IC_STATUS		GENMASK(28, 16)
>  #define ASPEED_SCU_IC_STATUS_SHIFT	16
> +#define AST2700_SCU_IC_STATUS		GENMASK(15, 0)
>  
>  struct aspeed_scu_ic_variant {
>  	const char		*compatible;
>  	unsigned long	irq_enable;
>  	unsigned long	irq_shift;
>  	unsigned int	num_irqs;
> +	bool			split_ier_isr;

How does that end up aligned?

> +	unsigned long	ier;
> +	unsigned long	isr;
>  };
>  
>  #define SCU_VARIANT(_compat, _shift, _enable, _num) { \
> @@ -30,13 +34,20 @@ struct aspeed_scu_ic_variant {
>  	.irq_shift		=	_shift,		\
>  	.irq_enable		=	_enable,	\
>  	.num_irqs		=	_num,		\
> +	.split_ier_isr	=	_split,		\

Ditto.

> +	.ier			=	_ier,		\
> +	.isr			=	_isr,		\

But what's worse is that '_split, _ier and _isr' come out of thin air as
SCU_VARIANT does not have corresponding arguments. So how is that
supposed to work?

>  }
>  
>  struct aspeed_scu_ic {
> @@ -45,9 +56,12 @@ struct aspeed_scu_ic {
>  	unsigned int		num_irqs;
>  	void __iomem		*base;
>  	struct irq_domain	*irq_domain;
> +	bool				split_ier_isr;

Sigh...

> +	unsigned long		ier;
> +	unsigned long		isr;
>  };
>  
> -static void aspeed_scu_ic_irq_handler(struct irq_desc *desc)
> +static void aspeed_scu_ic_irq_handler_combined(struct irq_desc *desc)
>  {
>  	struct aspeed_scu_ic *scu_ic = irq_desc_get_handler_data(desc);
>  	struct irq_chip *chip = irq_desc_get_chip(desc);
> @@ -84,33 +98,69 @@ static void aspeed_scu_ic_irq_handler(struct irq_desc *desc)
>  	chained_irq_exit(chip, desc);
>  }
>  
> +static void aspeed_scu_ic_irq_handler_split(struct irq_desc *desc)
> +{

...

>  static void aspeed_scu_ic_irq_mask(struct irq_data *data)
>  {
>  	struct aspeed_scu_ic *scu_ic = irq_data_get_irq_chip_data(data);
> -	unsigned int mask = BIT(data->hwirq + scu_ic->irq_shift) |
> -		(scu_ic->irq_enable << ASPEED_SCU_IC_STATUS_SHIFT);
>  
> -	/*
> -	 * Status bits are cleared by writing 1. In order to prevent the mask
> -	 * operation from clearing the status bits, they should be under the
> -	 * mask and written with 0.
> -	 */
> -	writel(readl(scu_ic->base) & ~mask, scu_ic->base);
> +	if (scu_ic->split_ier_isr) {
> +		writel(readl(scu_ic->base) & ~BIT(data->hwirq + scu_ic->irq_shift),
> +		       scu_ic->base + scu_ic->ier);
> +	} else {
> +		unsigned int mask = BIT(data->hwirq + scu_ic->irq_shift) |
> +			(scu_ic->irq_enable << ASPEED_SCU_IC_STATUS_SHIFT);
> +
> +		/*
> +		 * Status bits are cleared by writing 1. In order to prevent the mask
> +		 * operation from clearing the status bits, they should be under the
> +		 * mask and written with 0.
> +		 */
> +		writel(readl(scu_ic->base) & ~mask, scu_ic->base);
> +	}

So you have two different handlers. Why can't you provide two different
mask/unmask/ functions along with a seperate irq chip instead of
cluttering the code with conditionals. Thes two variants share no code
at all.

> -	irq_set_chained_handler_and_data(irq, aspeed_scu_ic_irq_handler,
> -					 scu_ic);
> +	if (scu_ic->split_ier_isr)
> +		irq_set_chained_handler_and_data(irq, aspeed_scu_ic_irq_handler_split,
> +						 scu_ic);
> +	else
> +		irq_set_chained_handler_and_data(irq, aspeed_scu_ic_irq_handler_combined,
> +						 scu_ic);
>

Please get rid of the line break. You have 100 characters....

Thanks,

        tglx

