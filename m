Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEFBEF55132
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Mar 2026 09:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VCfP2n03UmP2Gyi/wszYkFcZJsFegmS+/KM+muaSkU8=; b=4k84FqhBL6FKRzazMZDebPqb2J
	ERXJWWo/TISoIgADrsYjFkYtDMOa9dOA65H4ukaKbfNFB+PXZPCip1roFXI92iE3cpYhOkKvSzGsP
	JF7MnxQ1NTF5rI322CnBM3qmms3AhECuF5xZw0lilpD3pob4XpnitRLtAWRJwL3xq0+BP2f7vAVHD
	OCW/EWQQYB4YI/PYloq/0efP6/v1TbWCbgBx9XUFJF10aUVBi2DLMRxqcqvRkzgRxG4UTjYT6R3A2
	2hVT03QrG4bdbTajvZVwYSXXGyiTpO0Tuzeqgh31/LQAfXN867oe7O/zdkVCyQXFP2u0pBOIUHsWq
	7pUCuxDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzAJP-00000005ptw-12Ej;
	Sun, 08 Mar 2026 09:20:35 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzAJM-00000005ptY-3Rwb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Mar 2026 09:20:34 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-8cb4136d865so1432317785a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Mar 2026 01:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772961631; x=1773566431; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VCfP2n03UmP2Gyi/wszYkFcZJsFegmS+/KM+muaSkU8=;
        b=Uc1hUceVTSqz31dAys4eMUUo3HZz2YH4Y7NT5zag449WgUIgD0NyG7EOssgJuXV/Ad
         b1ZOcUm3kP3u+NgjihSsncKevDU317UODFKEBbI62aeIt9gj/RholOn5xJxgzIewNwVU
         9avjot56bZ07COAfg2ljhFAMsUV+nu7SftRhqoPwOTulpi+0hj1Vr1EUzmsaWnDcSnX3
         BPJnwGtXPDZRE5/MjNgn8fsiINpRbV50VksDLc7Y/C6sBCPjW6354eOV/dkVGNz8/Xe3
         ETmj0dtuoFJ56lK4Ur/qZrn3PKsj7uOu5+cdSBe+qUTHBe/jRLa7oAhLJvqGmJr54TT+
         Ok8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772961631; x=1773566431;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VCfP2n03UmP2Gyi/wszYkFcZJsFegmS+/KM+muaSkU8=;
        b=r0+NGH49HXw8WxLBbCOge1Mcej4EvCwTFSafEArDB12aOAlJy2jjK8cYoDILntb1GH
         HZW7sTJ33/HDNlkyVpvUzETutXhdjXgx6EukcVDnO0Mhhhl8sfBXp5OlFm6G0q0rCTcT
         u5IS15whnMJK1+NAkhc3meAZnq3BErEzvvE4kuPq0pYPRf7M3bqZIfFZ2paWIlOoYHzI
         buYrwMXhdHaXb6WN7gR1+T7tZFqy83AnBikHAIAwBgXaFtuRZWbcbczKy9WIFQVgzLiO
         iWq+TXOsKMjdknDZaS8SJHejaXMcTqCiqwe5+BdEzD7USDiVvY96vgGtx0HHRgrXEODE
         SB8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVHhkNE4xB+PS6bUf4GvBuG6BKLC2eqN+R0yk8gflQeE5PEu5CjfYdS/eckskE9pkQlRwzviWcgZIcGny4LfNIm@lists.infradead.org
X-Gm-Message-State: AOJu0YxNFV45ElgKv6mafnoqvrhhxDgU/zaGXnE88KIKDqe4I2UCIUo4
	1p5SPnSMX/hykVGryI8C8oOPw6aANp/fwDBi4+XSGjCpY9Qs8LRvZu2L
X-Gm-Gg: ATEYQzzQdxky3ULcuS6U2nRcDq+K8QWpp4ZWyxHX8feqUKV4F7jZTTZYk+T7uRmnMt0
	e6d0H++UKBsyAZcmFiiLXZYlkXmh0uEPcJh4dTTO/k0RG3lKdSOJMEFm9k/dzxgZmTkwc4fHCKA
	VBp+uoXqWzrchy3A/f8ZkN1dQSFoQJn9TkeB0NUNREBXHJTfm3RFZHf286ZEF/ZO6IKqMwvxdXV
	eIewchMm89RTT2Jq2HHkOZDWz4N3832aytmt7i8ORA0L8JtZJyvzUH1lDKEqqIYTPNcjAH1T36j
	caqNidf/bY2xcIKB/kpqGrreZsIWi/GG5UMUZRdT4D5BVgvJa2ZHx6tmnHH2YK77p8ua9HSUoxG
	dg4EUxqr/LYKvgARxqFviM6MhrxJIN6VQ9kT2YOR0V+4Hd+k8h3rLvUMX1qN9/TMdgrC1qo0GYZ
	e3XUa5Es5wkP1It5WtAn5UHG5E7r3J
X-Received: by 2002:a05:6214:248b:b0:89a:929:9e4e with SMTP id 6a1803df08f44-89a30a174cbmr113884606d6.14.1772961630635;
        Sun, 08 Mar 2026 01:20:30 -0800 (PST)
Received: from localhost ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a316da67esm51697736d6.25.2026.03.08.01.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 01:20:30 -0800 (PST)
Date: Sun, 8 Mar 2026 12:20:28 +0300
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linusw@kernel.org>,
	James Hilliard <james.hilliard1@gmail.com>, aprizel@wens.tw,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v2] pinctrl: sunxi: Implement gpiochip::get_direction()
Message-ID: <aa0_XDMMtReKQ0Vh@skv.local>
Mail-Followup-To: Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linusw@kernel.org>,
	James Hilliard <james.hilliard1@gmail.com>, aprizel@wens.tw,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260224092419.1275016-1-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260224092419.1275016-1-wens@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_012032_880648_08FE7DD7 
X-CRM114-Status: GOOD (  33.47  )
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

On 26-02-24 17:24, Chen-Yu Tsai wrote:
> After commit 471e998c0e31 ("gpiolib: remove redundant callback check"),
> a warning will be printed if the gpio driver does not implement this
> callback. The warning was added in commit e623c4303ed1 ("gpiolib:
> sanitize the return value of gpio_chip::get_direction()"), but was
> masked by the "redundant" check.
> 
> The warning can be triggered by any action that calls the callback,
> such as dumping the GPIO state from /sys/kernel/debug/gpio.
> 
> Implement it for the sunxi driver. This is simply a matter of reading
> out the mux value from the registers, then checking if it is one of
> the GPIO functions and which direction it is.
> 
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> Please merge for fixes.
> 
> Changes since v1:
> - Corrected commit attribution for the warning
> - Add example scenario that triggers the warning
> ---
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 51 +++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> index 0fb057a07dcc..27b2a3e9d78d 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -204,6 +204,32 @@ sunxi_pinctrl_desc_find_function_by_pin(struct sunxi_pinctrl *pctl,
>  	return NULL;
>  }
>  
> +static struct sunxi_desc_function *
> +sunxi_pinctrl_desc_find_function_by_pin_and_mux(struct sunxi_pinctrl *pctl,
> +						const u16 pin_num,
> +						const u8 muxval)
> +{
> +	for (unsigned int i = 0; i < pctl->desc->npins; i++) {
> +		const struct sunxi_desc_pin *pin = pctl->desc->pins + i;
> +		struct sunxi_desc_function *func = pin->functions;
> +
> +		if (pin->pin.number != pin_num)
> +			continue;
> +
> +		if (pin->variant && !(pctl->variant & pin->variant))
> +			continue;
> +
> +		while (func->name) {
> +			if (func->muxval == muxval)
> +				return func;
> +
> +			func++;
> +		}
> +	}
> +
> +	return NULL;
> +}
> +
>  static int sunxi_pctrl_get_groups_count(struct pinctrl_dev *pctldev)
>  {
>  	struct sunxi_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
> @@ -930,6 +956,30 @@ static const struct pinmux_ops sunxi_pmx_ops = {
>  	.strict			= true,
>  };
>  
> +static int sunxi_pinctrl_gpio_get_direction(struct gpio_chip *chip,
> +					    unsigned int offset)
> +{
> +	struct sunxi_pinctrl *pctl = gpiochip_get_data(chip);
> +	const struct sunxi_desc_function *func;
> +	u32 pin = offset + chip->base;
> +	u32 reg, shift, mask;
> +	u8 muxval;
> +
> +	sunxi_mux_reg(pctl, offset, &reg, &shift, &mask);
> +
> +	muxval = (readl(pctl->membase + reg) & mask) >> shift;
> +
> +	func = sunxi_pinctrl_desc_find_function_by_pin_and_mux(pctl, pin, muxval);
> +	if (!func)
> +		return -ENODEV;


This change introduces regression in linux-next. Several drivers on
Allwinner A64 fail to probe. For example,

 gpio gpiochip1: (1c20800.pinctrl): gpiochip_lock_as_irq: cannot get GPIO direction
 sun50i-a64-pinctrl 1c20800.pinctrl: unable to lock HW IRQ 69 for IRQ
 genirq: Failed to request resources for inv_mpu (irq 163) on irqchip sunxi_pio_edge

inv_mpu6050_i2c tries to get interrupt without initializing gpio before.

muxval in the case of uninitialized gpio is 0x7 (IO Disable) and
returned func value is NULL.


Some pinctrl return error for alternate configuration. For example,
pinctrl-stm32 returns -EINVAL [1].


But other drivers return one of non-error values.

pinctrl-axp209 defaults to GPIO_LINE_DIRECTION_OUT [2] 
        /*
	 * This shouldn't really happen if the pin is in use already,
	 * or if it's not in use yet, it doesn't matter since we're
	 * going to change the value soon anyway. Default to output.
	 */
	if ((val & AXP20X_GPIO_FUNCTIONS) > 2)
		return GPIO_LINE_DIRECTION_OUT;

pinctrl-upboard defaults to GPIO_LINE_DIRECTION_IN [3].
       /* If the pin is in function mode or high-z, input direction is
       returned */


pinctrl-rza2 defaults to GPIO_LINE_DIRECTION_IN as well [4].
        /*
	 * This GPIO controller has a default Hi-Z state that is not input or
	 * output, so force the pin to input now.
	 */


Should default be here GPIO_LINE_DIRECTION_IN here as well instead of -ENODEV?

> +	if (!strcmp(func->name, "gpio_out"))
> +		return GPIO_LINE_DIRECTION_OUT;
> +	if (!strcmp(func->name, "gpio_in") || !strcmp(func->name, "irq"))
> +		return GPIO_LINE_DIRECTION_IN;
> +	return -EINVAL;



Alternative solution would be converting handling of return value in
gpiochip_lock_as_irq to warning level. Since the value dir isn't
used. The call flushes the direction setting if something changed
behind our back. [5]

--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4107,11 +4107,9 @@ int gpiochip_lock_as_irq(struct gpio_chip *gc, unsigned int offset)
        if (!gc->can_sleep && gc->get_direction) {
                int dir = gpiod_get_direction(desc);
 
-               if (dir < 0) {
-                       gpiochip_err(gc, "%s: cannot get GPIO direction\n",
+               if (dir < 0)
+                       gpiochip_warn(gc, "%s: cannot get GPIO direction\n",
                                     __func__);
-                       return dir;
-               }
        }


1. https://elixir.bootlin.com/linux/v7.0-rc1/source/drivers/pinctrl/stm32/pinctrl-stm32.c#L437
2. https://elixir.bootlin.com/linux/v7.0-rc1/source/drivers/pinctrl/pinctrl-axp209.c#L175
3. https://elixir.bootlin.com/linux/v7.0-rc1/source/drivers/pinctrl/pinctrl-upboard.c#L840
4. https://elixir.bootlin.com/linux/v7.0-rc1/source/drivers/pinctrl/renesas/pinctrl-rza2.c#L148
5. https://elixir.bootlin.com/linux/v7.0-rc1/source/drivers/gpio/gpiolib.c#L4084

-- 
Best regards,
Andrey Skvortsov

