Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1922BC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 09:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GvIQ8d5TYCzCTqp4FjW1nkQDlwUNWCKgzYX5Dv2bm5E=; b=2YT9nTGqCbVEgXyGzcSmp2PqgR
	LBmTeulCHdQO28FWM1M5ab+mz46uGhPHi0XjazXT52/kCqq4/SH+7m/FDY150e53r5gC7TDWn1+G3
	2wuVRCgo6YkXmEEIgaqD9/tdIR6WUjlk4Kn/udzHuvzzwGcGQzYgP+mMYpFWDWikiPXl+fvElz1sQ
	W7ARuwhCbv+lcvAMe31b0BuTSQklMfhEuteKxukVm50B+k/K3kQgdjG/PTNjwhMcxT5b21wDq/RSb
	lFgNYnFn9+L0p337hm3KzoenM56ElsL+q/jlCEUKmeUZyHpuOac+52TmpAoafHgU5apdVStb8xB0z
	6SfAXmLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlP1p-00000004qiV-32mA;
	Fri, 21 Feb 2025 09:09:01 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlP0H-00000004qIg-3CSO;
	Fri, 21 Feb 2025 09:07:26 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1740128842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GvIQ8d5TYCzCTqp4FjW1nkQDlwUNWCKgzYX5Dv2bm5E=;
	b=sVkzAQAsvdHbBqFtg7QgnAn6l5yKDF8NHa3H9r8wViYVWLFwrnfbAMGvtA10nL3lIsm45q
	GsKjn76FujDmJY41kEqOTOpWcZmKE/EeNEqeaRkeDAqFlXWjWeD65PPhSHXy8NPXGus4s+
	OQStSauBYfW41bVXuRs5YT/UiFPpqB1KeYaueaetAAqbw1JB5ZS+/+INLYiepoToMsFB/e
	H6GENMhowl7fLn/3Kukx/Ydq+O5iwuHojqGLdNdPOr8OTjxX7CVQnWL+UHxxofNu5Oj7IY
	Mi0RzzLBxl4BDooHUzFWRqDHhJqZt+ogZYy0XYvl42YQkC9k6siMSYqJlxzhxQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1740128842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GvIQ8d5TYCzCTqp4FjW1nkQDlwUNWCKgzYX5Dv2bm5E=;
	b=1s81yxFBfBM6r5o8P7Xc//nNkIUNEmn04A1iCXJM+bKCkKdc0ram9G7uNYN43Z8lWU4v2X
	FpRM3tkDIFG0psCw==
To: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Heiner Kallweit
 <hkallweit1@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Subject: Re: [PATCH 2/4] irqchip: Add support for Amlogic A4 and A5 SoCs
In-Reply-To: <20250219-irqchip-gpio-a4-a5-v1-2-3c8e44ae42df@amlogic.com>
References: <20250219-irqchip-gpio-a4-a5-v1-0-3c8e44ae42df@amlogic.com>
 <20250219-irqchip-gpio-a4-a5-v1-2-3c8e44ae42df@amlogic.com>
Date: Fri, 21 Feb 2025 10:07:21 +0100
Message-ID: <87o6yvhdiu.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_010725_939178_4F38F980 
X-CRM114-Status: GOOD (  10.77  )
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

On Wed, Feb 19 2025 at 15:29, Xianwei Zhao via wrote:
>  
> +static int meson_ao_gpio_irq_set_type(struct meson_gpio_irq_controller *ctl,
> +				      unsigned int type, u32 *channel_hwirq)
> +{
> +	u32 val = 0;
> +	unsigned int idx;
> +
> +	idx = meson_gpio_irq_get_channel_idx(ctl, channel_hwirq);
> +
> +	type &= IRQ_TYPE_SENSE_MASK;
> +
> +	meson_gpio_irq_update_bits(ctl, REG_EDGE_POL_AO, BIT(idx), 0);
> +
> +	if (type == IRQ_TYPE_EDGE_BOTH) {
> +		val |= BIT(ctl->params->edge_both_offset + (idx));
> +		meson_gpio_irq_update_bits(ctl, REG_EDGE_POL_AO,
> +					   BIT(ctl->params->edge_both_offset + (idx)), val);
> +		return 0;
> +	}
> +
> +	if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_EDGE_FALLING))
> +		val |= BIT(ctl->params->pol_low_offset + idx);
> +
> +	if (type & (IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING))
> +		val |= BIT(ctl->params->edge_single_offset + idx);
> +
> +	meson_gpio_irq_update_bits(ctl, REG_EDGE_POL,
> +				   BIT(idx) | BIT(12 + idx), val);
> +
> +	return 0;
> +};

This function is a full copy of meson_s4_gpio_irq_set_type() with the
only difference of:

           s/REG_EDGE_POL_S4/REG_EDGE_POL_AO/

Can you please stick that register offset into the parameter structure
and use the function for both variants?

Thanks,

        tglx

