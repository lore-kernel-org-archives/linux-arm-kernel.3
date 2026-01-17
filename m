Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 987F0C98327
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 15:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gF8+Zq1qK4nUISuq8ZYKam6dKSKTtWo9A81RsKUSatk=; b=UnpCQOTF8HxjvNkZaHa3r3V1Xt
	dfHlXseFEAPerryGLhwbccw1wsdKD44dQPh1DkWCpXM8cyXXPjA+CKU5FGOMr3AJHWA127QyuN7jM
	jAiIoFfC9Kud7QcRFybmlFx7MaOgDwHBZeRiIqcYfsL834iPTq38buVIhnIVF4c2VAuPdwLvREVIz
	xpaLjpq4AoPYoiIghhoOi3MLw7Vsj/F93pMWRjtpJENOXGFpXwHvRRE0nhQ48dZVL8MvAiCRfOY9G
	ywPcbn5N5veWEkjTu+IyfdRX7dNWQIC36eoH/RjddabQX+R23kkMD1td63ipuwkhrutQzIWgp5nv1
	trH1Wqgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vh8Vm-0000000FdVc-3Pg7;
	Sat, 17 Jan 2026 15:46:50 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vh8Vk-0000000FdV4-0XOx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 15:46:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=gF8+Zq1qK4nUISuq8ZYKam6dKSKTtWo9A81RsKUSatk=; b=fFxoiG5ouamEjvJWtIjJJqiZmZ
	ETa+cz75RUWA6SQbZuAAIwaD6U7YvThjuoYnJld2ETo7MDh6SNe9ENtr/+MUgD8W/Uslb4wpbD/cS
	W2Lsc2ZEzRzEUtD2Uv1FZ22e+IlEGXE28W+koektM/uK/4g4nlGqQni5usy4HXoir3zA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vh8VU-003DhI-R8; Sat, 17 Jan 2026 16:46:32 +0100
Date: Sat, 17 Jan 2026 16:46:32 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org, bmc-sw@aspeedtech.com
Subject: Re: [PATCH 3/5] gpio: aspeed-sgpio: Create llops to handle hardware
 access
Message-ID: <55fbb766-12b5-441a-b06c-d807097e5476@lunn.ch>
References: <20260117-upstream_sgpio-v1-0-850ef3ffb680@aspeedtech.com>
 <20260117-upstream_sgpio-v1-3-850ef3ffb680@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260117-upstream_sgpio-v1-3-850ef3ffb680@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260117_074648_168190_36ABCE8C 
X-CRM114-Status: GOOD (  20.24  )
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

On Sat, Jan 17, 2026 at 07:17:10PM +0800, Billy Tsai wrote:
> Add low-level operations (llops) to abstract the register access for SGPIO
> registers. With this abstraction layer, the driver can separate the
> hardware and software logic, making it easier to extend the driver to
> support different hardware register layouts.

With a quick look at the code, it appears the register numbers stay
the same? Is that true?

I think you have reinvented regmap.

> @@ -318,30 +278,25 @@ static int aspeed_sgpio_set_type(struct irq_data *d, unsigned int type)
>  	u32 type0 = 0;
>  	u32 type1 = 0;
>  	u32 type2 = 0;
> -	u32 bit, reg;
> -	const struct aspeed_sgpio_bank *bank;
>  	irq_flow_handler_t handler;
> -	struct aspeed_sgpio *gpio;
> -	void __iomem *addr;
> -	int offset;
> -
> -	irqd_to_aspeed_sgpio_data(d, &gpio, &bank, &bit, &offset);
> +	struct aspeed_sgpio *gpio = irq_data_get_irq_chip_data(d);
> +	int offset = irqd_to_hwirq(d);
>  
>  	switch (type & IRQ_TYPE_SENSE_MASK) {
>  	case IRQ_TYPE_EDGE_BOTH:
> -		type2 |= bit;
> +		type2 = 1;
>  		fallthrough;
>  	case IRQ_TYPE_EDGE_RISING:
> -		type0 |= bit;
> +		type0 = 1;
>  		fallthrough;
>  	case IRQ_TYPE_EDGE_FALLING:
>  		handler = handle_edge_irq;
>  		break;
>  	case IRQ_TYPE_LEVEL_HIGH:
> -		type0 |= bit;
> +		type0 = 1;
>  		fallthrough;
>  	case IRQ_TYPE_LEVEL_LOW:
> -		type1 |= bit;
> +		type1 = 1;
>  		handler = handle_level_irq;
>  		break;

This change is not obviously correct to me. It is not about
abstracting register accesses, what you actually write to the
registers appears to of changed. Maybe you could add a refactoring
patch first which does this change, with a commit message explaining
it, and then insert the register abstraction?


> @@ -374,16 +318,14 @@ static void aspeed_sgpio_irq_handler(struct irq_desc *desc)
>  {
>  	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
>  	struct irq_chip *ic = irq_desc_get_chip(desc);
> -	struct aspeed_sgpio *data = gpiochip_get_data(gc);
> +	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);

This rename does not belong in this patch. You want lots of small
patches, each doing one logical thing, with a good commit message, and
obviously correct. Changes like this make it a lot less obviously
correct.

>  	/* Disable IRQ and clear Interrupt status registers for all SGPIO Pins. */
> -	for (i = 0; i < ARRAY_SIZE(aspeed_sgpio_banks); i++) {
> -		bank =  &aspeed_sgpio_banks[i];
> +	for (i = 0; i < gpio->chip.ngpio; i += 2) {

Why are ARRAY_SIZE() gone? There probably is a good reason, so doing
this in a patch of its own, with a commit message explaining "Why?"
would make this easier to review.

      Andrew

