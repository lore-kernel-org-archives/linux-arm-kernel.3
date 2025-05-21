Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293F8C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 17:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cA4yq2BpmitIC2K51KVcgxHgEfq2CwmSLO4n7Kylrb4=; b=MbV71SLVsE83q9btk+M0AtlAHC
	ju23nsw22gFJrOVdXDIujVx9XmZMdST5+MRq2Xf64CEpjBv9XjUgC4G5gQJk8VQF+alwr8/6bmIh1
	saTZGK99V6fifU/5MbPvSe0i3tLXCwBYo//PT1SQTdJGXrpT8rJFBQFPA32rtpG38PpNaEFfnvhxP
	r27WxVbSR5dgH/pu4bjlr9qWQD8QOr/0s2P6hcq+SWew5FwHmudsCt5pcc7nxJfZs1JuqlS/ZuOdV
	ei68VzO993giCNrmKovTA3HogfsIJmURsny8aEamGG1ka9x1HY/2z4JRx4Yl1c++Lb+BRHnIxDUoR
	Z7JeWVPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHnFE-0000000GZYb-2bgc;
	Wed, 21 May 2025 17:28:44 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHnAp-0000000GZ3p-0tJc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 17:24:12 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so76752195e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 May 2025 10:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747848249; x=1748453049; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cA4yq2BpmitIC2K51KVcgxHgEfq2CwmSLO4n7Kylrb4=;
        b=fETUpVQb/6r+cX7Uqwosi2IDNisR2atw1jvIhNFg9Hy32vjGGwis4MaTqMxST+UrM8
         hR24tZ2/lOxLNdgU7HwtyIILw8YWodBmCEsbT+mgGHPq+pR5G5obSS6kuN/01iicbZk5
         aqwYoDN29lxHLUJ5/Z1RTmRLOxu2WGfquc1QQB5F/NnbucY7cuXn73bjAmFD72mFFXDP
         HemneKyyTmA5U8gTVe8sbepP7tVcOD1G7wvfAnXGUGE3wy9Wu84ToZ1qaWQXWSieWL/T
         GnX5knKrNro18HNSDRLfcIBMw5wWMD7J4UXNyjI8a8NkhueMyx0JuqJ2FakrtxeODNI6
         kpow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747848249; x=1748453049;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cA4yq2BpmitIC2K51KVcgxHgEfq2CwmSLO4n7Kylrb4=;
        b=Sa0O99K9jiBjDyqozPxu2juBoqNIKOUf1uBS8oBZ54J7bStqO5Ym21gAVmiqj2WOJD
         5TNUjFT5VPAAs1HaGNLAi8GSu2C2rHn/MXmVVNDJAiRqvmeuC5U4RDCxxkTrBQsxLzvv
         7N25HsArqlsBQ1zi4fYzt4T0uFVgiKPyikViSeUXCEfy/mWKfyYeQTAqnRvDDs/75HFO
         laOO/pUT9zT2v2YO/LSN97w4StP6XRXyK8OKxG/HoFME9VGmOLeBY/3yTIUNTHnlUCrx
         k6GaxcHbF6GpYUv7K46kls07jSGoi67EwXHMIP+YzZJuoYfJgm1wS8SZo7bkL3hOK64m
         yt9w==
X-Forwarded-Encrypted: i=1; AJvYcCXePjVdF2/PJNWW+eIPiNKC8qJJg3zr0hzg6KOTWOCaq/VWXlYxwXSE9ItwT+8WN3B/9XtVYQo+NEPXrPsqeHep@lists.infradead.org
X-Gm-Message-State: AOJu0YwM1e/NqCxuagiuaVIhNbY8RAO1/CewaBO3tuIMUYsAoYy3oxlM
	hXlgJUgT1bB1o0wLl/tVWu9SceQhq+h/TppuL75bvPwRWz7+fRPYDPI2SCJ66Rj87Cg=
X-Gm-Gg: ASbGncu84rI+8zFdYInjRzOtMeJaNdPl7pJSktdFpHTvO2+ld4HwV69tFDePI1DQqCz
	ninoTPARe2OYss0WRaX8jugTJjm8POg/kEy6iNM4u7F0ytrTtZaFl8MWkzsrqHIPun15oB0PiMj
	YADxlDwdIwussvv1NZt+t9hsXkbUpQOvSOt7puL7NJ7zeqquXY+n9wHGBnsUVQZj0DBOZyVQhkp
	85bGtQHuYryMKTNjelQWvf0HhL4JGbJten+TQL5d0OT6ev0uS1+0EFQ3TMpK0neAKuahV1a1L1+
	tEXivFd6BbdArnzoIjftYNE3MgPhnNUqEhn57U/FUntHR/S+JgJZup8KsMUds5BbM+VcYkT5z8n
	N97BYAC/ap2Qt2A==
X-Google-Smtp-Source: AGHT+IG/ZQkbgWpwbpaFLxW3V89+XT/xuoE4KmR4TICfAuMLq8I9lUBGVcOLnJ2gel5DZD6Qg+hzaw==
X-Received: by 2002:a05:6000:1a89:b0:3a3:7dc9:e64b with SMTP id ffacd0b85a97d-3a37dc9e655mr4602008f8f.3.1747848249132;
        Wed, 21 May 2025 10:24:09 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca4d224sm20989057f8f.12.2025.05.21.10.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 10:24:08 -0700 (PDT)
Date: Wed, 21 May 2025 19:24:06 +0200
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
Subject: Re: [PATCH v5 4/4] watchdog: Add support for VIA/WonderMedia SoC
 watchdog functionality
Message-ID: <aC4MNjZxnQu8b0kR@mai.linaro.org>
References: <20250521-vt8500-timer-updates-v5-0-7e4bd11df72e@gmail.com>
 <20250521-vt8500-timer-updates-v5-4-7e4bd11df72e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250521-vt8500-timer-updates-v5-4-7e4bd11df72e@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_102411_268650_3A0CDF6C 
X-CRM114-Status: GOOD (  36.79  )
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

On Wed, May 21, 2025 at 05:00:12PM +0400, Alexey Charkov wrote:
> VIA/WonderMedia SoCs can use their system timer's first channel as a
> watchdog device which will reset the system if the clocksource counter
> matches the value given in its match register 0 and if the watchdog
> function is enabled.
> 
> Since the watchdog function is tightly coupled to the timer itself, it
> is implemented as an auxiliary device of the timer device
> 
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
>  MAINTAINERS                   |  1 +
>  drivers/watchdog/Kconfig      | 15 ++++++++
>  drivers/watchdog/Makefile     |  1 +
>  drivers/watchdog/vt8500-wdt.c | 88 +++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 105 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5362095240627f613638197fda275db6edc16cf7..97d1842625dbdf7fdca3556260662dab469ed091 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3447,6 +3447,7 @@ F:	drivers/tty/serial/vt8500_serial.c
>  F:	drivers/video/fbdev/vt8500lcdfb.*
>  F:	drivers/video/fbdev/wm8505fb*
>  F:	drivers/video/fbdev/wmt_ge_rops.*
> +F:	drivers/watchdog/vt8500-wdt.c
>  F:	include/linux/vt8500-timer.h
>  
>  ARM/ZYNQ ARCHITECTURE
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 0d8d37f712e8cfb4bf8156853baa13c23a57d6d9..2e59303306feba7e15a015c2fce25b1290dc4cbc 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -1115,6 +1115,21 @@ config SUNPLUS_WATCHDOG
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called sunplus_wdt.
>  
> +config VT8500_WATCHDOG
> +	tristate "VIA/WonderMedia VT8500 watchdog support"
> +	depends on ARCH_VT8500 || COMPILE_TEST
> +	select WATCHDOG_CORE
> +	select AUXILIARY_BUS
> +	help
> +	  VIA/WonderMedia SoCs can use their system timer as a hardware
> +	  watchdog, as long as the first timer channel is free from other
> +	  uses and respective function is enabled in its registers. To
> +	  make use of it, say Y here and ensure that the device tree
> +	  lists at least two interrupts for the VT8500 timer device.
> +
> +	  To compile this driver as a module, choose M here.
> +	  The module will be called vt8500-wdt.

Module is not supported by the timers. That will change in a very near
future but unloading won't be supported, you should consider tying the
wdt life cycle with the subsystem it is connected to.

>  # X86 (i386 + ia64 + x86_64) Architecture
>  
>  config ACQUIRE_WDT
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index c9482904bf870a085c7fce2a439ac5089b6e6fee..3072786bf226c357102be3734fe6e701f753d45b 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -101,6 +101,7 @@ obj-$(CONFIG_MSC313E_WATCHDOG) += msc313e_wdt.o
>  obj-$(CONFIG_APPLE_WATCHDOG) += apple_wdt.o
>  obj-$(CONFIG_SUNPLUS_WATCHDOG) += sunplus_wdt.o
>  obj-$(CONFIG_MARVELL_GTI_WDT) += marvell_gti_wdt.o
> +obj-$(CONFIG_VT8500_WATCHDOG) += vt8500-wdt.o
>  
>  # X86 (i386 + ia64 + x86_64) Architecture
>  obj-$(CONFIG_ACQUIRE_WDT) += acquirewdt.o
> diff --git a/drivers/watchdog/vt8500-wdt.c b/drivers/watchdog/vt8500-wdt.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..a47ee714e7c0172e89a31b0d6c064fff338bd5b6
> --- /dev/null
> +++ b/drivers/watchdog/vt8500-wdt.c
> @@ -0,0 +1,88 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (C) 2025 Alexey Charkov <alchark@gmail.com */
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/container_of.h>
> +#include <linux/io.h>
> +#include <linux/limits.h>
> +#include <linux/minmax.h>
> +#include <linux/module.h>
> +#include <linux/types.h>
> +#include <linux/watchdog.h>
> +#include <linux/vt8500-timer.h>
> +
> +static int vt8500_watchdog_start(struct watchdog_device *wdd)
> +{
> +	struct vt8500_wdt_info *info = watchdog_get_drvdata(wdd);
> +	u32 deadline = min(wdd->timeout * 1000, wdd->max_hw_heartbeat_ms);
> +
> +	/* The deadline is matched against the hardware clocksource counter,
> +	 * which is a u32 value incrementing at VT8500_TIMER_HZ and continuing
> +	 * past wraparound. When the return value of timer_next is greater than
> +	 * U32_MAX then the match should occur after the hardware counter wraps
> +	 * around, thus we take only the lower 32 bits of timer_next return val
> +	 */
> +	deadline = info->timer_next((u64)deadline * (VT8500_TIMER_HZ / 1000));
> +	writel(deadline, info->wdt_match);
> +	writel(1, info->wdt_en);
> +	return 0;
> +}
> +
> +static int vt8500_watchdog_stop(struct watchdog_device *wdd)
> +{
> +	struct vt8500_wdt_info *info = watchdog_get_drvdata(wdd);
> +
> +	writel(0, info->wdt_en);
> +	return 0;
> +}
> +
> +static const struct watchdog_ops vt8500_watchdog_ops = {
> +	.start			= vt8500_watchdog_start,
> +	.stop			= vt8500_watchdog_stop,
> +};
> +
> +static const struct watchdog_info vt8500_watchdog_info = {
> +	.identity		= "VIA VT8500 watchdog",
> +	.options		= WDIOF_MAGICCLOSE |
> +				  WDIOF_KEEPALIVEPING |
> +				  WDIOF_SETTIMEOUT,
> +};
> +
> +static int vt8500_wdt_probe(struct auxiliary_device *auxdev,
> +			    const struct auxiliary_device_id *id)
> +{
> +	struct vt8500_wdt_info *info;
> +	struct watchdog_device *wdd;
> +
> +	wdd = devm_kzalloc(&auxdev->dev, sizeof(*wdd), GFP_KERNEL);
> +	if (!wdd)
> +		return -ENOMEM;
> +
> +	wdd->info = &vt8500_watchdog_info;
> +	wdd->ops = &vt8500_watchdog_ops;
> +	wdd->max_hw_heartbeat_ms = U32_MAX / (VT8500_TIMER_HZ / 1000);
> +	wdd->parent = &auxdev->dev;
> +
> +	info = container_of(auxdev, struct vt8500_wdt_info, auxdev);
> +	watchdog_set_drvdata(wdd, info);
> +
> +	return devm_watchdog_register_device(&auxdev->dev, wdd);
> +}
> +
> +static const struct auxiliary_device_id vt8500_wdt_ids[] = {
> +	{ .name = "timer_vt8500.vt8500-wdt" },
> +	{},
> +};
> +
> +MODULE_DEVICE_TABLE(auxiliary, my_auxiliary_id_table);
> +
> +static struct auxiliary_driver vt8500_wdt_driver = {
> +	.name =	"vt8500-wdt",
> +	.probe = vt8500_wdt_probe,
> +	.id_table = vt8500_wdt_ids,
> +};
> +module_auxiliary_driver(vt8500_wdt_driver);
> +
> +MODULE_AUTHOR("Alexey Charkov <alchark@gmail.com>");
> +MODULE_DESCRIPTION("Driver for the VIA VT8500 watchdog timer");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.49.0
> 

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

