Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8475BC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 18:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vp69JVh1PSMiw7t8NnWm4jkR0koTFb4QvGVLbLCNb+w=; b=rBc0f0h9Z6XzRyayvorfRih4eF
	DIoqeLcSJSelsHU4V6FjuKPX2o1d1KG+G5Z2ZpiqbrzUnlxCqrlkUR7/T8ZgCaedgcnBvKskP3nLF
	GRH4v2dk9qGMTn8VlG/hrP6huMdCx4AWlfS/dwhH2Oqq/iuUPpd1UVRmQf5gufyjpMl5QS/q7EcVA
	qLhHsifzgtYTLsimkGXDmz/2hpr97bJP5o8Z9wwrb0RAGXXVaklOxt+s6ndV53cv0EkoLm0+LDUUq
	9ZSVHbaAWjfpg1R/x4tGwp82qsCXfvtIEo9ul/7MCfM7OEaEjblx4dQj9zhbQ8bD5BUJwBjONg8bD
	3TsE47Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDowm-00000006GAQ-1Tz3;
	Sat, 10 May 2025 18:29:16 +0000
Received: from fgw23-7.mail.saunalahti.fi ([62.142.5.84])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDouh-00000006G4a-3DtW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 May 2025 18:27:09 +0000
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id 5c52b789-2dcc-11f0-96ba-005056bdd08f;
	Sat, 10 May 2025 21:27:01 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 10 May 2025 21:26:58 +0300
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Ray Jui <rjui@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Vladimir Zapolskiy <vz@mleia.com>, Keerthy <j-keerthy@ti.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH RFC 8/9] gpio: timberdale: Make irq_chip immutable
Message-ID: <aB-acnUBnidSw7r4@surfacebook.localdomain>
References: <20250509-gpio-v1-0-639377c98288@nxp.com>
 <20250509-gpio-v1-8-639377c98288@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509-gpio-v1-8-639377c98288@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_112707_969897_3C26F056 
X-CRM114-Status: UNSURE (   9.17  )
X-CRM114-Notice: Please train this message.
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

Fri, May 09, 2025 at 12:45:39PM +0800, Peng Fan (OSS) kirjoitti:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Kernel warns about mutable irq_chips:
> "not an immutable chip, please consider fixing!"
> 
> Constify timbgpio_irqchip, flag the irq_chip as IRQCHIP_IMMUTABLE,
> add the new helper functions, and call the appropriate gpiolib functions.

...

>  	struct timbgpio *tgpio = irq_data_get_irq_chip_data(d);
>  	int offset = d->irq - tgpio->irq_base;
> +	irq_hw_number_t hwirq = irqd_to_hwirq(d);
>  	unsigned long flags;

While at it, replace direct accesses to IRQ data `irq` member.

  	int offset = hwirq - tgpio->irq_base;

...

>  static void timbgpio_irq_enable(struct irq_data *d)
>  {
>  	struct timbgpio *tgpio = irq_data_get_irq_chip_data(d);
>  	int offset = d->irq - tgpio->irq_base;
> +	irq_hw_number_t hwirq = irqd_to_hwirq(d);
>  	unsigned long flags;

Ditto.

> +	gpiochip_enable_irq(&tgpio->gpio, hwirq);
> +
>  	spin_lock_irqsave(&tgpio->lock, flags);
>  	tgpio->last_ier |= 1UL << offset;
>  	iowrite32(tgpio->last_ier, tgpio->membase + TGPIO_IER);

>  }

-- 
With Best Regards,
Andy Shevchenko



