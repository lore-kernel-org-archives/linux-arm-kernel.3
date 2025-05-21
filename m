Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FEE4C54E71
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 17:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QQIoOwFVzAyIQl84tG3BZfFLX9/CoM/ZjsK30GrWEu8=; b=1GvOBvre2IAj1Yyip9Ju9JWjs5
	v4LXGKI/vSa/e3iXDp2xFFUkyHynm5DSKPt/dcQSgdj1HiketEzFAjPPv4awVKZA4u9mzAcwDcRIW
	7PUg29jEI7QHV7YNJSkxg+iCKAx68CpT0K3QP8x9Nl2azvSxt8w2jXLYvxCN1DdudKwq6sOdEgYQ9
	lKGelsM62yGNQ700rtiOn17S+vLbrPn9wehuq4NiEZ7bGS11p1HSotwJYbBi/lHGqXdTzE4UInFcU
	YMLro5UH8I6ez5n6YnUjVf28LNQr3Z6OVEqgYDj1RmyU8xaxE+qYQPmXbuzaKZjNE8fSqsg5HpuC2
	3ZeEpwUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHnHN-0000000GZoj-2AYj;
	Wed, 21 May 2025 17:30:57 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHnBf-0000000GZDf-1DOr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 17:25:04 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so54317475e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 May 2025 10:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747848302; x=1748453102; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QQIoOwFVzAyIQl84tG3BZfFLX9/CoM/ZjsK30GrWEu8=;
        b=cCMjvw+LFU+wEtTus7duWlSG45zVvaXEmqWu6i4rlImoId2K9nLvxt1cDAMppJ8u0G
         DqQwXy4EJ5p3hk+FWb5fXHWmzbDkBnZfbN8tKdfYYx1vhg/QPHMrzksROUnE3FAuRXMg
         hwPXmzQodmLCMWdpTSVFvSuC6RgqH3sT9db97zCXtZzIHgDNUhI+G168BJJFbILbjCy2
         N0K/cSWcRJT/eQFBdzkHxi8QgE+uKyw27rk4qVl+ADdz6UDraHBXv07ARq0CJ4IFeBVN
         xNH8hNFPjnPV/yFeP1f4fB5mrFBuEEMKINKuFlIOQ8RxHo8it8v5gQQXfSa/Y2rvSJyp
         HmhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747848302; x=1748453102;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QQIoOwFVzAyIQl84tG3BZfFLX9/CoM/ZjsK30GrWEu8=;
        b=CeyCyKt1UuRnnC8cAFPaLyvVFL2udAJNIk54lGJ6MI0tOuyr0Zz7BfmMeqbhG88bqq
         k5c7uvOutiZM5NncA8/hsJqnnVBq8sGOIw00vysPGXtiyJvNzayZZ+DHoIldQjnUcWW7
         CSBk2OBvC6atN0XwGzd+KCBJ+dEXT+ERUVmiog/u5E5RNAqoiTO455FPa7l7ZZvFA1H1
         5NdoZ7CU12VIvRb4hEDL9W0MNDIE23apu4BsXz3/lxD2UVkY6M1tB7rqHojZqWbAPqDr
         3iyxf/6qAs7j6Zaw7YADSzzgE5aYGVQnPZatoW47vDSfYrRITWEN714pKWOv1i9TisLq
         cZSw==
X-Forwarded-Encrypted: i=1; AJvYcCUWjGfwuxOiowdKRoD6dtF0ZSY6jH3EzpLypuCY9ff0LzKhqrr+OnMCEmTEsRuUmek5vWmqlvMvwNDFH8QCWa50@lists.infradead.org
X-Gm-Message-State: AOJu0YyPC1XniYS1CIGWu3tO1uaES/Fc8v8eZs5/TXM7eC9dwJ/sR1a7
	/1wVfoPxavbcan1YDyXDI+eJeSKIoRYKUh8iY6cxinF50aha8+f7h6eWciA/H3CEAYI=
X-Gm-Gg: ASbGncvxcl5EY9dp1mOxMQzeXz7dkwXlTfJLHdwf9+Bg2jaiZKXABhOIIThGn1Eaweu
	nfPhmfCso8zAwyEe6+5J4HKcsOEt/d22WvTgp+AqbALdt28Dr3SXKPfwWshEotBHnVjv45hmeW7
	7841BM9Klv/vrZwjRxcnSG9ey2iPezkT5FP/aVMazqF8QNzMhLcu1dAqgvcHQs4IODdn13lp/NH
	2xLKECLW665XlowonDGM6xi7eVLstG0sKT71HEj7JtfKgxxlar2QhTaz9bgZy9gF4lBDbpARbfR
	92nffkNbhMNfpBM+hudiGIAP9jMlhg4AuMv2b4T0Jp6bAoU7exL/ERZDsHVvSujuyvF5AO+bYLw
	pTu9ILFQaoATy+z2UxMKn2nXm
X-Google-Smtp-Source: AGHT+IHI4AxUxw+mdSEmbv3bxgCkVYGSjBYcBB0DvjMGh+B3X3aUNDr0IHkVD7jkRU6tYB30LfZlag==
X-Received: by 2002:a05:600c:a40a:b0:43b:c592:7e16 with SMTP id 5b1f17b1804b1-442f84c2092mr230085065e9.3.1747848301738;
        Wed, 21 May 2025 10:25:01 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f73d25b8sm79414855e9.17.2025.05.21.10.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 10:25:01 -0700 (PDT)
Date: Wed, 21 May 2025 19:24:59 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v5 3/4] clocksource/drivers/timer-vt8500: Prepare for
 watchdog functionality
Message-ID: <aC4Ma3E461XMBig0@mai.linaro.org>
References: <20250521-vt8500-timer-updates-v5-0-7e4bd11df72e@gmail.com>
 <20250521-vt8500-timer-updates-v5-3-7e4bd11df72e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250521-vt8500-timer-updates-v5-3-7e4bd11df72e@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_102503_346570_191ECA60 
X-CRM114-Status: GOOD (  45.46  )
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

On Wed, May 21, 2025 at 05:00:11PM +0400, Alexey Charkov wrote:
> VIA/WonderMedia system timer can generate a watchdog reset when its
> clocksource counter matches the value in the match register 0 and
> watchdog function is enabled. For this to work, obvously the clock event
> device must use a different match register (1~3) and respective interrupt.
> 
> Check if at least two interrupts are provided by the device tree, then use
> match register 1 for system clock events and reserve match register 0 for
> the watchdog. Instantiate an auxiliary device for the watchdog
> 
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
>  MAINTAINERS                        |   1 +
>  drivers/clocksource/Kconfig        |   1 +
>  drivers/clocksource/timer-vt8500.c | 111 ++++++++++++++++++++++++++++++++++---
>  include/linux/vt8500-timer.h       |  18 ++++++

It should endup in include/clocksource/vt8500-timer.h

>  4 files changed, 122 insertions(+), 9 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 783e5ee6854b69cca87b6f0763844d28b4b2213f..5362095240627f613638197fda275db6edc16cf7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3447,6 +3447,7 @@ F:	drivers/tty/serial/vt8500_serial.c
>  F:	drivers/video/fbdev/vt8500lcdfb.*
>  F:	drivers/video/fbdev/wm8505fb*
>  F:	drivers/video/fbdev/wmt_ge_rops.*
> +F:	include/linux/vt8500-timer.h
>  
>  ARM/ZYNQ ARCHITECTURE
>  M:	Michal Simek <michal.simek@amd.com>
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index 487c8525996724fbf9c6e9726dabb478d86513b9..92f071aade10b7c0f0bba4b47dc6228a5e50360f 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -178,6 +178,7 @@ config TEGRA186_TIMER
>  config VT8500_TIMER
>  	bool "VT8500 timer driver" if COMPILE_TEST
>  	depends on HAS_IOMEM
> +	select AUXILIARY_BUS
>  	help
>  	  Enables support for the VT8500 driver.
>  
> diff --git a/drivers/clocksource/timer-vt8500.c b/drivers/clocksource/timer-vt8500.c
> index 9f28f30dcaf83ab4e9c89952175b0d4c75bd6b40..cdea5245f8e41d65b8b9bebad3fe3a55f43a18fa 100644
> --- a/drivers/clocksource/timer-vt8500.c
> +++ b/drivers/clocksource/timer-vt8500.c
> @@ -11,6 +11,7 @@
>   * Alexey Charkov. Minor changes have been made for Device Tree Support.
>   */
>  
> +#include <linux/auxiliary_bus.h>
>  #include <linux/io.h>
>  #include <linux/irq.h>
>  #include <linux/interrupt.h>
> @@ -22,9 +23,6 @@
>  #include <linux/of_address.h>
>  #include <linux/of_irq.h>
>  
> -#define VT8500_TIMER_OFFSET	0x0100
> -#define VT8500_TIMER_HZ		3000000
> -
>  #define TIMER_MATCH_REG(x)	(4 * (x))
>  #define TIMER_COUNT_REG		0x0010	 /* clocksource counter */
>  
> @@ -53,8 +51,14 @@
>  #define msecs_to_loops(t) (loops_per_jiffy / 1000 * HZ * t)
>  
>  #define MIN_OSCR_DELTA		16
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/vt8500-timer.h>
>  
>  static void __iomem *regbase;
> +static unsigned int sys_timer_ch;	 /* which match register to use
> +					  * for the system timer
> +					  */

The comment format is a bit odd. It would be nicer on top of the
variable.

/*
 * Which match register to use for the system timer
 */

>  static u64 vt8500_timer_read(struct clocksource *cs)
>  {
> @@ -75,21 +79,26 @@ static struct clocksource clocksource = {
>  	.flags          = CLOCK_SOURCE_IS_CONTINUOUS,
>  };
>  
> +static u64 vt8500_timer_next(u64 cycles)
> +{
> +	return clocksource.read(&clocksource) + cycles;
> +}
> +
>  static int vt8500_timer_set_next_event(unsigned long cycles,
>  				    struct clock_event_device *evt)
>  {
>  	int loops = msecs_to_loops(10);
> -	u64 alarm = clocksource.read(&clocksource) + cycles;
> +	u64 alarm = vt8500_timer_next(cycles);
>  
> -	while (readl(regbase + TIMER_ACC_STS_REG) & TIMER_ACC_WR_MATCH(0)
> +	while (readl(regbase + TIMER_ACC_STS_REG) & TIMER_ACC_WR_MATCH(sys_timer_ch)
>  	       && --loops)
>  		cpu_relax();
> -	writel((unsigned long)alarm, regbase + TIMER_MATCH_REG(0));
> +	writel((unsigned long)alarm, regbase + TIMER_MATCH_REG(sys_timer_ch));
>  
>  	if ((signed)(alarm - clocksource.read(&clocksource)) <= MIN_OSCR_DELTA)
>  		return -ETIME;
>  
> -	writel(TIMER_INT_EN_MATCH(0), regbase + TIMER_INT_EN_REG);
> +	writel(TIMER_INT_EN_MATCH(sys_timer_ch), regbase + TIMER_INT_EN_REG);
>  
>  	return 0;
>  }
> @@ -131,7 +140,9 @@ static int __init vt8500_timer_init(struct device_node *np)
>  		return -ENXIO;
>  	}
>  
> -	timer_irq = irq_of_parse_and_map(np, 0);

It may be worth to repeat part of what is said in the changelog

> +	sys_timer_ch = of_irq_count(np) > 1 ? 1 : 0;
> +
> +	timer_irq = irq_of_parse_and_map(np, sys_timer_ch);
>  	if (!timer_irq) {
>  		pr_err("%s: Missing irq description in Device Tree\n",
>  								__func__);
> @@ -140,7 +151,7 @@ static int __init vt8500_timer_init(struct device_node *np)
>  
>  	writel(TIMER_CTRL_ENABLE, regbase + TIMER_CTRL_REG);
>  	writel(TIMER_STATUS_CLEARALL, regbase + TIMER_STATUS_REG);
> -	writel(~0, regbase + TIMER_MATCH_REG(0));
> +	writel(~0, regbase + TIMER_MATCH_REG(sys_timer_ch));
>  
>  	ret = clocksource_register_hz(&clocksource, VT8500_TIMER_HZ);
>  	if (ret) {
> @@ -166,4 +177,86 @@ static int __init vt8500_timer_init(struct device_node *np)
>  	return 0;
>  }
>  
> +static void vt8500_timer_aux_uninit(void *data)
> +{
> +	auxiliary_device_uninit(data);
> +}
> +
> +static void vt8500_timer_aux_delete(void *data)
> +{
> +	auxiliary_device_delete(data);
> +}
> +
> +static void vt8500_timer_aux_release(struct device *dev)
> +{
> +	struct auxiliary_device *aux;
> +
> +	aux = container_of(dev, struct auxiliary_device, dev);
> +	kfree(aux);

That will result in a double kfree because the data belongs to the
wdt_info structure. It is not a pointer allocated. So when the
wdt_info will be freed, it will free the area already freed by this
function.

Please note, a timer should never be unloaded, so not sure if the wdt
should handle the case.

> +}
> +
> +/*
> + * This probe gets called after the timer is already up and running. This will
> + * create the watchdog device as a child since the registers are shared.
> + */
> +static int vt8500_timer_probe(struct platform_device *pdev)
> +{
> +	struct vt8500_wdt_info *wdt_info;
> +	struct device *dev = &pdev->dev;
> +	int ret;

>>>>>

> +	if (!sys_timer_ch) {
> +		dev_info(dev, "Not enabling watchdog: only one irq was given");
> +		return 0;
> +	}
> +
> +	if (!regbase)
> +		return dev_err_probe(dev, -ENOMEM,
> +			"Timer not initialized, cannot create watchdog");

The block above seems to be a bit wobbly as it relies on
vt8500_timer_init() to have succeeded.

Why not have vt8500_timer_probe() called by vt8500_timer_init() (with
a proper name like vt8500_timer_wdt_init()) ?

<<<<<

> +	wdt_info = kzalloc(sizeof(*wdt_info), GFP_KERNEL);

devm_kzalloc()

> +	if (!wdt_info)
> +		return dev_err_probe(dev, -ENOMEM,
> +			"Failed to allocate vt8500-wdt info");

Is it possible kzalloc to return -EPROBE_DEFER ?

> +
> +	wdt_info->timer_next = &vt8500_timer_next;
> +	wdt_info->wdt_en = regbase + TIMER_WATCHDOG_EN_REG;
> +	wdt_info->wdt_match = regbase + TIMER_MATCH_REG(0);

The two fields above can be merged into one : wdt_info->regbase

Move TIMER_WATCHDOG_EN_REG to the watchdog driver code.

And as TIMER_MATCH_REG(__channel) == 4 * (__channel),
then TIMER_MATCH_REG == 0, so regbase + 0 == regbase

> +	wdt_info->auxdev.name = "vt8500-wdt";
> +	wdt_info->auxdev.dev.parent = dev;
> +	wdt_info->auxdev.dev.release = &vt8500_timer_aux_release;
> +
> +	ret = auxiliary_device_init(&wdt_info->auxdev);
> +	if (ret) {
> +		kfree(wdt_info);

Remove kfree because of devm_kzalloc

> +		return ret;
> +	}

nit: add line

> +	ret = devm_add_action_or_reset(dev, vt8500_timer_aux_uninit,
> +				       &wdt_info->auxdev);
> +	if (ret)
> +		return ret;
> +
> +	ret = auxiliary_device_add(&wdt_info->auxdev);
> +	if (ret)
> +		return ret;

nit: add line

> +	return devm_add_action_or_reset(dev, vt8500_timer_aux_delete,
> +					&wdt_info->auxdev);
> +}
> +
> +static const struct of_device_id vt8500_timer_of_match[] = {
> +	{ .compatible = "via,vt8500-timer", },
> +	{},
> +};
> +
> +static struct platform_driver vt8500_timer_driver = {
> +	.probe  = vt8500_timer_probe,
> +	.driver = {
> +		.name = "vt8500-timer",
> +		.of_match_table = vt8500_timer_of_match,
> +		.suppress_bind_attrs = true,
> +	},
> +};
> +
> +builtin_platform_driver(vt8500_timer_driver);
>
>
>  TIMER_OF_DECLARE(vt8500, "via,vt8500-timer", vt8500_timer_init);
> diff --git a/include/linux/vt8500-timer.h b/include/linux/vt8500-timer.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..b8e9000495c509e9c8e8f4098d6bd33de27b3ec4
> --- /dev/null
> +++ b/include/linux/vt8500-timer.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef LINUX_VT8500_TIMER_H_
> +#define LINUX_VT8500_TIMER_H_
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/io.h>
> +#include <linux/types.h>
> +
> +#define VT8500_TIMER_HZ		3000000
> +
> +struct vt8500_wdt_info {
> +	struct auxiliary_device auxdev;
> +	u64 (*timer_next)(u64 cycles);
> +	void __iomem *wdt_en;
> +	void __iomem *wdt_match;
> +};
> +
> +#endif /* LINUX_VT8500_TIMER_H_ */
> 
> -- 
> 2.49.0
> 

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

