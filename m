Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD658CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 00:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/DprGrl9e7Kz/gK4ZQarAvFpOQC1FXR4i36X1x0X3X4=; b=r/p2utxd1aTtvHPIoO+cncNzYs
	O/wgTaPzveWyk0QagoBYivMhYL8O/qaCgeKZHhme0bsTw1pbmzn+7BgfXn7hkHMzElt3j+EkyR0jz
	e8iur/iHAt/j8089QE3yafo+ffUzKCzhUqekD/Qd2hWZJNcsQOEFQrMaJwBXg1dr/WIR3FFV3ETlm
	HgatPkidqVz/LgExEd2p3cDr0h7NADnrVa6IkZaXCI0BqpmWUQ2dm9R1p14tvArLsBx2gbVlrtLYr
	u7hJc5smxzjZtZ5pkq8fom47AxOX/J8rIpvIG3kONw9VjME8g2J+WoJqOkdvRDmxenwaMlp2+UWig
	ZqAu6vqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwUuR-0000000HRuG-2Eo8;
	Thu, 11 Sep 2025 00:11:31 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwUuP-0000000HRtf-1Pvn;
	Thu, 11 Sep 2025 00:11:30 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-32b590d819aso104111a91.3;
        Wed, 10 Sep 2025 17:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757549488; x=1758154288; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/DprGrl9e7Kz/gK4ZQarAvFpOQC1FXR4i36X1x0X3X4=;
        b=bwKEYIjOAMIDKs2DvCzeWNAyTyDZezOSsRNhLbSXy21byRSiYyvqULfRyKyOsFUXC9
         6iv6R8Bpc23FSsoXx7VkVTfvVhRUodpQsTVYDvCCpj8/h6GhySlVK6Z2GXxefx50mblb
         K2mdCiJSG4lZCR8HMUMQrvmZDvO/Ip/nwb9LrzW4BEDZzthwGOQ9753vQnAQ73uuNXKj
         MMxBjRwZN3tgD90rgeAJN6mlVaudXiB/hO3nqiMzQ4i99ijGA8+KC3cQRZsEOg1m8r9O
         OM2rljoJ4ZjOb5U6KqO6aV2ihY6GceZIwPFRPQnNNA/bPWKhC1wdjBdKHaVCg3KgcbJn
         FObg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757549488; x=1758154288;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/DprGrl9e7Kz/gK4ZQarAvFpOQC1FXR4i36X1x0X3X4=;
        b=TmAVvdjlUZKJECjjYEq1+RW/OzjyD0a6Sl2aO9P8HJXYfVL3IQunFm/KBwAbcmo73Y
         Kd7U7Irp1ESs+XtC9OHYqrdGlCwThOCxQjqRbRdYhK/pxEB8buPEgIGC6vwy38EH0Xj/
         seI1fzQlGlCf0TZvaCPfY5810/lFsXAtqjxnBfZ/CAE5EbFa6cxPIsTUGx6wJgCo7isI
         WMaCWBf6lZrx+MVfG2nYSrvji0jBq9lpcDXIaqmquuHHkreJo8AyL/qWG5l2Q4bfKFzU
         zwt8KYUAom6DEjJMHj8gYTL8mqf7zJgzTYO5Z9kaJC+ifjkGHlyOQfxxlHpwadvZ8FJm
         6dmQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+BLhKWrK1dd8n/ablPJ+EXeNBED3cn6p6qB4oYHJMmZ9QRlMrAdFhbXRxBXmqyVEUGonf5qc2OlRbiQdqCHO7@lists.infradead.org, AJvYcCUinrUzwiRx9DiJCRRr1wwkHUB1HTRgUNYP1BIEGtrMwSjM3me2TLybbYJhxI0oj0Hq4htpYc8yBwxwTaA=@lists.infradead.org, AJvYcCXntpkHWrDq5IT/L4zV0/2P8HFBJoUDrRS0MvCXjkE6MtzhNrCxwiOVq68iMsRxbhRiK5myhllLnMJyB0lNjmI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwYgFNlIwg0PCkTAMEUlYsh5DmChPzomvOK2nKbaQiWz0m4zZiS
	YB1rtWfFrKEV4oVkbVeldl34PTBSE7tMj0UykVIdmD5XqBF3wsg9wIZO
X-Gm-Gg: ASbGnctiReDeqVOjQUj4Huhl4NwsOf3rkNEGjUu4sN4CEM6oBbqJGSsqLiweJTPh8X2
	mFU5XoR4QjO+NQr0jOC2vPigVKB/DbZZaEGxE5UXqLXLh90psg2n9R3lzo9VbQWiqzilHXk+aeP
	WlFaBjGRZzBc9KF1HtFUFjsLr6KhAj688XXGWZ2ACd20Uv/CX2kKpezSRdc3dAfcTfKAi/q+yAo
	gCJN1m04XiRgnF0MWA1l0Sf3zY3rgaPZ/S41GgcC2z/OFyQRBPyw7uxwfl8LrX2trpAxj2nq2uA
	AvMTwJF6vWqwU9Re9kx+c2XlT7YReTJrKvQrNU4rH/Ud6ItI3r/t1/5qzvsEWF6RTB1JfiIM52+
	wkT8z//FkYpYy22M05spvRqEKdaZg8YKtyWqmEbQPg4Cw7gln1A==
X-Google-Smtp-Source: AGHT+IGh6jj8tUAVO4xZEgg1cYXyd1dv7OFPe+9zkElp63vXFZLpgGfDXrx3xfdSlohQ5ds3u2EMGg==
X-Received: by 2002:a17:90b:52c4:b0:32b:b26e:156f with SMTP id 98e67ed59e1d1-32d440d9ce7mr23339735a91.33.1757549487838;
        Wed, 10 Sep 2025 17:11:27 -0700 (PDT)
Received: from [10.229.36.175] ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32dd632692bsm437067a91.25.2025.09.10.17.11.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 17:11:27 -0700 (PDT)
Message-ID: <e0941449-7a62-4bbb-8790-616f393f2cc8@gmail.com>
Date: Wed, 10 Sep 2025 17:11:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/15] gpio: brcmstb: use new generic GPIO chip API
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>,
 Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>,
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
 <20250910-gpio-mmio-gpio-conv-part4-v2-7-f3d1a4c57124@linaro.org>
Content-Language: en-US
From: Doug Berger <opendmb@gmail.com>
In-Reply-To: <20250910-gpio-mmio-gpio-conv-part4-v2-7-f3d1a4c57124@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_171129_419153_0F5168B3 
X-CRM114-Status: GOOD (  29.52  )
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

On 9/10/2025 12:12 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Convert the driver to using the new generic GPIO chip interfaces from
> linux/gpio/generic.h.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>   drivers/gpio/gpio-brcmstb.c | 112 ++++++++++++++++++++++++--------------------
>   1 file changed, 60 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
> index e29a9589b3ccbd17d10f6671088dca3e76537927..be3ff916e134a674d3e1d334a7d431b7ad767a33 100644
> --- a/drivers/gpio/gpio-brcmstb.c
> +++ b/drivers/gpio/gpio-brcmstb.c
> @@ -3,6 +3,7 @@
>   
>   #include <linux/bitops.h>
>   #include <linux/gpio/driver.h>
> +#include <linux/gpio/generic.h>
>   #include <linux/of.h>
>   #include <linux/module.h>
>   #include <linux/irqdomain.h>
> @@ -37,7 +38,7 @@ enum gio_reg_index {
>   struct brcmstb_gpio_bank {
>   	struct list_head node;
>   	int id;
> -	struct gpio_chip gc;
> +	struct gpio_generic_chip chip;
>   	struct brcmstb_gpio_priv *parent_priv;
>   	u32 width;
>   	u32 wake_active;
> @@ -72,19 +73,18 @@ __brcmstb_gpio_get_active_irqs(struct brcmstb_gpio_bank *bank)
>   {
>   	void __iomem *reg_base = bank->parent_priv->reg_base;
>   
> -	return bank->gc.read_reg(reg_base + GIO_STAT(bank->id)) &
> -	       bank->gc.read_reg(reg_base + GIO_MASK(bank->id));
> +	return gpio_generic_read_reg(&bank->chip, reg_base + GIO_STAT(bank->id)) &
> +	       gpio_generic_read_reg(&bank->chip, reg_base + GIO_MASK(bank->id));
>   }
>   
>   static unsigned long
>   brcmstb_gpio_get_active_irqs(struct brcmstb_gpio_bank *bank)
>   {
>   	unsigned long status;
> -	unsigned long flags;
>   
> -	raw_spin_lock_irqsave(&bank->gc.bgpio_lock, flags);
> +	guard(gpio_generic_lock_irqsave)(&bank->chip);
> +
>   	status = __brcmstb_gpio_get_active_irqs(bank);
> -	raw_spin_unlock_irqrestore(&bank->gc.bgpio_lock, flags);
>   
>   	return status;
>   }
> @@ -92,26 +92,26 @@ brcmstb_gpio_get_active_irqs(struct brcmstb_gpio_bank *bank)
>   static int brcmstb_gpio_hwirq_to_offset(irq_hw_number_t hwirq,
>   					struct brcmstb_gpio_bank *bank)
>   {
> -	return hwirq - bank->gc.offset;
> +	return hwirq - bank->chip.gc.offset;
>   }
>   
>   static void brcmstb_gpio_set_imask(struct brcmstb_gpio_bank *bank,
>   		unsigned int hwirq, bool enable)
>   {
> -	struct gpio_chip *gc = &bank->gc;
>   	struct brcmstb_gpio_priv *priv = bank->parent_priv;
>   	u32 mask = BIT(brcmstb_gpio_hwirq_to_offset(hwirq, bank));
>   	u32 imask;
> -	unsigned long flags;
>   
> -	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
> -	imask = gc->read_reg(priv->reg_base + GIO_MASK(bank->id));
> +	guard(gpio_generic_lock_irqsave)(&bank->chip);
> +
> +	imask = gpio_generic_read_reg(&bank->chip,
> +				      priv->reg_base + GIO_MASK(bank->id));
>   	if (enable)
>   		imask |= mask;
>   	else
>   		imask &= ~mask;
> -	gc->write_reg(priv->reg_base + GIO_MASK(bank->id), imask);
> -	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +	gpio_generic_write_reg(&bank->chip,
> +			       priv->reg_base + GIO_MASK(bank->id), imask);
>   }
>   
>   static int brcmstb_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
> @@ -150,7 +150,8 @@ static void brcmstb_gpio_irq_ack(struct irq_data *d)
>   	struct brcmstb_gpio_priv *priv = bank->parent_priv;
>   	u32 mask = BIT(brcmstb_gpio_hwirq_to_offset(d->hwirq, bank));
>   
> -	gc->write_reg(priv->reg_base + GIO_STAT(bank->id), mask);
> +	gpio_generic_write_reg(&bank->chip,
> +			       priv->reg_base + GIO_STAT(bank->id), mask);
>   }
>   
>   static int brcmstb_gpio_irq_set_type(struct irq_data *d, unsigned int type)
> @@ -162,7 +163,6 @@ static int brcmstb_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>   	u32 edge_insensitive, iedge_insensitive;
>   	u32 edge_config, iedge_config;
>   	u32 level, ilevel;
> -	unsigned long flags;
>   
>   	switch (type) {
>   	case IRQ_TYPE_LEVEL_LOW:
> @@ -194,23 +194,25 @@ static int brcmstb_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>   		return -EINVAL;
>   	}
>   
> -	raw_spin_lock_irqsave(&bank->gc.bgpio_lock, flags);
> +	guard(gpio_generic_lock_irqsave)(&bank->chip);
>   
> -	iedge_config = bank->gc.read_reg(priv->reg_base +
> -			GIO_EC(bank->id)) & ~mask;
> -	iedge_insensitive = bank->gc.read_reg(priv->reg_base +
> -			GIO_EI(bank->id)) & ~mask;
> -	ilevel = bank->gc.read_reg(priv->reg_base +
> -			GIO_LEVEL(bank->id)) & ~mask;
> +	iedge_config = gpio_generic_read_reg(&bank->chip,
> +				priv->reg_base + GIO_EC(bank->id)) & ~mask;
> +	iedge_insensitive = gpio_generic_read_reg(&bank->chip,
> +				priv->reg_base + GIO_EI(bank->id)) & ~mask;
> +	ilevel = gpio_generic_read_reg(&bank->chip,
> +				priv->reg_base + GIO_LEVEL(bank->id)) & ~mask;
>   
> -	bank->gc.write_reg(priv->reg_base + GIO_EC(bank->id),
> -			iedge_config | edge_config);
> -	bank->gc.write_reg(priv->reg_base + GIO_EI(bank->id),
> -			iedge_insensitive | edge_insensitive);
> -	bank->gc.write_reg(priv->reg_base + GIO_LEVEL(bank->id),
> -			ilevel | level);
> +	gpio_generic_write_reg(&bank->chip,
> +			       priv->reg_base + GIO_EC(bank->id),
> +			       iedge_config | edge_config);
> +	gpio_generic_write_reg(&bank->chip,
> +			       priv->reg_base + GIO_EI(bank->id),
> +			       iedge_insensitive | edge_insensitive);
> +	gpio_generic_write_reg(&bank->chip,
> +			       priv->reg_base + GIO_LEVEL(bank->id),
> +			       ilevel | level);
>   
> -	raw_spin_unlock_irqrestore(&bank->gc.bgpio_lock, flags);
>   	return 0;
>   }
>   
> @@ -263,7 +265,7 @@ static void brcmstb_gpio_irq_bank_handler(struct brcmstb_gpio_bank *bank)
>   {
>   	struct brcmstb_gpio_priv *priv = bank->parent_priv;
>   	struct irq_domain *domain = priv->irq_domain;
> -	int hwbase = bank->gc.offset;
> +	int hwbase = bank->chip.gc.offset;
>   	unsigned long status;
>   
>   	while ((status = brcmstb_gpio_get_active_irqs(bank))) {
> @@ -303,7 +305,7 @@ static struct brcmstb_gpio_bank *brcmstb_gpio_hwirq_to_bank(
>   
>   	/* banks are in descending order */
>   	list_for_each_entry_reverse(bank, &priv->bank_list, node) {
> -		i += bank->gc.ngpio;
> +		i += bank->chip.gc.ngpio;
>   		if (hwirq < i)
>   			return bank;
>   	}
> @@ -332,7 +334,7 @@ static int brcmstb_gpio_irq_map(struct irq_domain *d, unsigned int irq,
>   
>   	dev_dbg(&pdev->dev, "Mapping irq %d for gpio line %d (bank %d)\n",
>   		irq, (int)hwirq, bank->id);
> -	ret = irq_set_chip_data(irq, &bank->gc);
> +	ret = irq_set_chip_data(irq, &bank->chip.gc);
>   	if (ret < 0)
>   		return ret;
>   	irq_set_lockdep_class(irq, &brcmstb_gpio_irq_lock_class,
> @@ -394,7 +396,7 @@ static void brcmstb_gpio_remove(struct platform_device *pdev)
>   	 * more important to actually perform all of the steps.
>   	 */
>   	list_for_each_entry(bank, &priv->bank_list, node)
> -		gpiochip_remove(&bank->gc);
> +		gpiochip_remove(&bank->chip.gc);
>   }
>   
>   static int brcmstb_gpio_of_xlate(struct gpio_chip *gc,
> @@ -412,7 +414,7 @@ static int brcmstb_gpio_of_xlate(struct gpio_chip *gc,
>   	if (WARN_ON(gpiospec->args_count < gc->of_gpio_n_cells))
>   		return -EINVAL;
>   
> -	offset = gpiospec->args[0] - bank->gc.offset;
> +	offset = gpiospec->args[0] - bank->chip.gc.offset;
>   	if (offset >= gc->ngpio || offset < 0)
>   		return -EINVAL;
>   
> @@ -493,19 +495,17 @@ static int brcmstb_gpio_irq_setup(struct platform_device *pdev,
>   static void brcmstb_gpio_bank_save(struct brcmstb_gpio_priv *priv,
>   				   struct brcmstb_gpio_bank *bank)
>   {
> -	struct gpio_chip *gc = &bank->gc;
>   	unsigned int i;
>   
>   	for (i = 0; i < GIO_REG_STAT; i++)
> -		bank->saved_regs[i] = gc->read_reg(priv->reg_base +
> -						   GIO_BANK_OFF(bank->id, i));
> +		bank->saved_regs[i] = gpio_generic_read_reg(&bank->chip,
> +					priv->reg_base + GIO_BANK_OFF(bank->id, i));
>   }
>   
>   static void brcmstb_gpio_quiesce(struct device *dev, bool save)
>   {
>   	struct brcmstb_gpio_priv *priv = dev_get_drvdata(dev);
>   	struct brcmstb_gpio_bank *bank;
> -	struct gpio_chip *gc;
>   	u32 imask;
>   
>   	/* disable non-wake interrupt */
> @@ -513,8 +513,6 @@ static void brcmstb_gpio_quiesce(struct device *dev, bool save)
>   		disable_irq(priv->parent_irq);
>   
>   	list_for_each_entry(bank, &priv->bank_list, node) {
> -		gc = &bank->gc;
> -
>   		if (save)
>   			brcmstb_gpio_bank_save(priv, bank);
>   
> @@ -523,8 +521,9 @@ static void brcmstb_gpio_quiesce(struct device *dev, bool save)
>   			imask = bank->wake_active;
>   		else
>   			imask = 0;
> -		gc->write_reg(priv->reg_base + GIO_MASK(bank->id),
> -			       imask);
> +		gpio_generic_write_reg(&bank->chip,
> +				       priv->reg_base + GIO_MASK(bank->id),
> +				       imask);
>   	}
>   }
>   
> @@ -538,12 +537,12 @@ static void brcmstb_gpio_shutdown(struct platform_device *pdev)
>   static void brcmstb_gpio_bank_restore(struct brcmstb_gpio_priv *priv,
>   				      struct brcmstb_gpio_bank *bank)
>   {
> -	struct gpio_chip *gc = &bank->gc;
>   	unsigned int i;
>   
>   	for (i = 0; i < GIO_REG_STAT; i++)
> -		gc->write_reg(priv->reg_base + GIO_BANK_OFF(bank->id, i),
> -			      bank->saved_regs[i]);
> +		gpio_generic_write_reg(&bank->chip,
> +				       priv->reg_base + GIO_BANK_OFF(bank->id, i),
> +				       bank->saved_regs[i]);
>   }
>   
>   static int brcmstb_gpio_suspend(struct device *dev)
> @@ -585,6 +584,7 @@ static const struct dev_pm_ops brcmstb_gpio_pm_ops = {
>   
>   static int brcmstb_gpio_probe(struct platform_device *pdev)
>   {
> +	struct gpio_generic_chip_config config;
>   	struct device *dev = &pdev->dev;
>   	struct device_node *np = dev->of_node;
>   	void __iomem *reg_base;
> @@ -665,17 +665,24 @@ static int brcmstb_gpio_probe(struct platform_device *pdev)
>   			bank->width = bank_width;
>   		}
>   
> +		gc = &bank->chip.gc;
> +
>   		/*
>   		 * Regs are 4 bytes wide, have data reg, no set/clear regs,
>   		 * and direction bits have 0 = output and 1 = input
>   		 */
> -		gc = &bank->gc;
> -		err = bgpio_init(gc, dev, 4,
> -				reg_base + GIO_DATA(bank->id),
> -				NULL, NULL, NULL,
> -				reg_base + GIO_IODIR(bank->id), flags);
> +
> +		config = (struct gpio_generic_chip_config) {
> +			.dev = dev,
> +			.sz = 4,
> +			.dat = reg_base + GIO_DATA(bank->id),
> +			.dirin = reg_base + GIO_IODIR(bank->id),
> +			.flags = flags,
> +		};
> +
> +		err = gpio_generic_chip_init(&bank->chip, &config);
>   		if (err) {
> -			dev_err(dev, "bgpio_init() failed\n");
> +			dev_err(dev, "failed to initialize generic GPIO chip\n");
>   			goto fail;
>   		}
>   
> @@ -700,7 +707,8 @@ static int brcmstb_gpio_probe(struct platform_device *pdev)
>   		 * be retained from S5 cold boot
>   		 */
>   		need_wakeup_event |= !!__brcmstb_gpio_get_active_irqs(bank);
> -		gc->write_reg(reg_base + GIO_MASK(bank->id), 0);
> +		gpio_generic_write_reg(&bank->chip,
> +				       reg_base + GIO_MASK(bank->id), 0);
>   
>   		err = gpiochip_add_data(gc, bank);
>   		if (err) {
> 
I suppose I'm OK with all of this, but I'm just curious about the longer 
term plans for the member accesses. Is there an intent to have helpers 
for things like?:
chip.gc.offset
chip.gc.ngpio

Thanks,
     Doug

