Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBFBFC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 14:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mPWdoFecdc2MfMc/n7LgSs8D6os+jhSdfWxgej28200=; b=k1O8UGcsVmWIxEK/9zeqH3sxk9
	26A4FV/L/hsm66etgVgardTPJqyc/R1UTBjmQKSuEWbjxLKtfec+hcl1qLp8VO+EKJ4LPK4PqGS32
	4JObcxpCvpDMwXeiXK/cV9+RjYmjWBVmsNu49bAX8pOMBxK9gNrvswwLJY1BIGbh567ra7YX3WsqM
	rEjeVIZzWbcFM8kY50K1OUYYSAULUpU+MXUO0Myf/ZAPoHCGtxU8ocABj9YWgDnIuT4W9hNHCXVac
	U9AaP+GBdlWeR8uohAYaFIdXSzXvq6ShS1SG4hM+mKeBtgqb2jelXWOBLwpQjrbb11GlUYUYhB+Lk
	2G9ySclg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHkCp-0000000G4Lz-1Njb;
	Wed, 21 May 2025 14:14:03 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHjZJ-0000000Fwtg-0Li5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 13:33:14 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-742c7a52e97so3203020b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 May 2025 06:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747834392; x=1748439192; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=mPWdoFecdc2MfMc/n7LgSs8D6os+jhSdfWxgej28200=;
        b=nckykF3zhXo9VBdzCHOw5fKIyy5APE+AlyoXWnarZPlJtNXHM6b0inUznngreRbOD4
         oR9CdHRw6mm6UE50mndL+XdpVxdCTYCvLaFLimtVuUaDGq6yMdCNzFjzQX/who9Lz+VZ
         LEhpMwmWLOITGFTJ3x+Tk3F4q9/sIEFfaS3s3mt4FGQfdEuzqWuzneTVfLQ1NcS2LezY
         ydzcljem8V1c/9Ui/thfTWhQbuC+pcjMwlAj6BpSMI4m/Gtyc6eWR/5ZazQcBN1T4cNC
         ry7798t9wZj97ajJFjM4EsINVbVlT4fRJ5ZrP+GVKdzzXS7UXFnOivNFLT7SDKS3T+c/
         j4xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747834392; x=1748439192;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mPWdoFecdc2MfMc/n7LgSs8D6os+jhSdfWxgej28200=;
        b=V+1v/TwuITqUVK87S0VUZPrURZJ0HQ9aCiAM8pozWP3IEbT3cioFZvjYUuCYkA4CIJ
         NpKXy2ZYhFoKYPlYBba38EI3MkglYgh/u4oH1tXcp344iOCEcPHQGJPfvyJtpIcFR5Lt
         3mhBRkFg0wRgQbwtGanFgKkze90UuUaC2yjsEnHb8wX8bQaUENr7YkaoD4sc2IH3qIfA
         yO11JQE+RcGb/ArD+2GWt8Gfm8V1OTnSROcaIT7XDaZDr1NPHyuds48I/hYGSFQNLVV/
         wj4tsi44qLJ9/Sldg2iivjRkX/VbT+x6c4Zg/Cd7KABKBP3zJtMc+f3zpRNp2Cqtl1xn
         zKmQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5LXLWrGg7Tdyz5bQXEtVosHlKV0WQBx8p3Tvh47BX03F3g5fTuvNx9uXhr3W58KrOUTQ4bIwWFOlSK1tEZPNg@lists.infradead.org
X-Gm-Message-State: AOJu0YxZEi5/SCnTr0GbBLsDXMOjl9W5xal5Kr4zjhqMV/BOpeDgArIh
	naofakStFbaIJVIXIBpZJp4+jGWHwTLjGDpU/Yk9D12kfdECGg8p+1RXaCxOT0F1
X-Gm-Gg: ASbGncufSrFXr8rPExvo+/Goi42rfotAX5ywmFbj0bGwiNEY0essibMu/EZKRjx+NE9
	/68sz2VTh710/5efx67Pi1kLPGkBEr+vVlXJjb4u0K5jimgElF0zuJ5yPcmWD9aTHv+jDDyzR67
	u9yTNjqFQJD1Wxf0ZoGgWn+/9vQJLsw0oVQpjOu04OoT3v27MRARkwKeROmGq9lkLz9zdiLcz3l
	mwR/ZkRSPfr/Qg9l8ZYSO85AjJkxMslbbr9Ij2rWLlKt9CGlohwQhS4YiVkY7CrreLGIMJkZGT/
	g0Uj6yKWi9aEKoIu4gKPs6Yh91kKqZe6lus7y4gNz0vaelHmV7dI+4CMEPAPnORLXhN1VYVocyO
	9ntSgaCV30zS/1PH0FAi4Gta4
X-Google-Smtp-Source: AGHT+IGFkJiaJbqiYwggMHn731DfZj84x94VQNiW1co7LmBgrVQ+jHH2JFGp04j6FK9ukP7//F9AYg==
X-Received: by 2002:a05:6a00:a81:b0:73e:96f:d4c1 with SMTP id d2e1a72fcca58-742acce29f3mr27233123b3a.13.1747834392168;
        Wed, 21 May 2025 06:33:12 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96e2106sm9875941b3a.17.2025.05.21.06.33.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 06:33:11 -0700 (PDT)
Message-ID: <ad056ba1-8fce-4735-b71e-f22c22eacc18@roeck-us.net>
Date: Wed, 21 May 2025 06:33:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] watchdog: Add support for VIA/WonderMedia SoC
 watchdog functionality
To: Alexey Charkov <alchark@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250521-vt8500-timer-updates-v4-0-2d4306a16ae4@gmail.com>
 <20250521-vt8500-timer-updates-v4-4-2d4306a16ae4@gmail.com>
 <38df2f02-efc4-465b-aa64-4c9e2c1919d8@roeck-us.net>
 <CABjd4YxZVQSuavEYojc8U4AqwUN3GkweiNNHqn=NDTE70xZm8w@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CABjd4YxZVQSuavEYojc8U4AqwUN3GkweiNNHqn=NDTE70xZm8w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_063313_129911_FC1F8F4C 
X-CRM114-Status: GOOD (  30.31  )
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

On 5/20/25 23:20, Alexey Charkov wrote:
> On Wed, May 21, 2025 at 3:15 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 5/20/25 13:01, Alexey Charkov wrote:
>>> VIA/WonderMedia SoCs can use their system timer's first channel as a
>>> watchdog device which will reset the system if the clocksource counter
>>> matches the value given in its match register 0 and if the watchdog
>>> function is enabled.
>>>
>>> Since the watchdog function is tightly coupled to the timer itself, it
>>> is implemented as an auxiliary device of the timer device
>>>
>>> Signed-off-by: Alexey Charkov <alchark@gmail.com>
>>> ---
>>>    MAINTAINERS                   |  1 +
>>>    drivers/watchdog/Kconfig      | 15 ++++++++
>>>    drivers/watchdog/Makefile     |  1 +
>>>    drivers/watchdog/vt8500-wdt.c | 80 +++++++++++++++++++++++++++++++++++++++++++
>>>    4 files changed, 97 insertions(+)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 5362095240627f613638197fda275db6edc16cf7..97d1842625dbdf7fdca3556260662dab469ed091 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -3447,6 +3447,7 @@ F:      drivers/tty/serial/vt8500_serial.c
>>>    F:  drivers/video/fbdev/vt8500lcdfb.*
>>>    F:  drivers/video/fbdev/wm8505fb*
>>>    F:  drivers/video/fbdev/wmt_ge_rops.*
>>> +F:   drivers/watchdog/vt8500-wdt.c
>>>    F:  include/linux/vt8500-timer.h
>>>
>>>    ARM/ZYNQ ARCHITECTURE
>>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
>>> index 0d8d37f712e8cfb4bf8156853baa13c23a57d6d9..8049ae630301a98123f97f6e3ee868bd3bf1534a 100644
>>> --- a/drivers/watchdog/Kconfig
>>> +++ b/drivers/watchdog/Kconfig
>>> @@ -2003,6 +2003,21 @@ config PIC32_DMT
>>>          To compile this driver as a loadable module, choose M here.
>>>          The module will be called pic32-dmt.
>>>
>>> +config VT8500_WATCHDOG
>>> +     tristate "VIA/WonderMedia VT8500 watchdog support"
>>> +     depends on ARCH_VT8500 || COMPILE_TEST
>>> +     select WATCHDOG_CORE
>>> +     select AUXILIARY_BUS
>>> +     help
>>> +       VIA/WonderMedia SoCs can use their system timer as a hardware
>>> +       watchdog, as long as the first timer channel is free from other
>>> +       uses and respective function is enabled in its registers. To
>>> +       make use of it, say Y here and ensure that the device tree
>>> +       lists at least two interrupts for the VT8500 timer device.
>>> +
>>> +       To compile this driver as a module, choose M here.
>>> +       The module will be called vt8500-wdt.
>>> +
>>>    # PARISC Architecture
>>>
>>>    # POWERPC Architecture
>>> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
>>> index c9482904bf870a085c7fce2a439ac5089b6e6fee..3072786bf226c357102be3734fe6e701f753d45b 100644
>>> --- a/drivers/watchdog/Makefile
>>> +++ b/drivers/watchdog/Makefile
>>> @@ -101,6 +101,7 @@ obj-$(CONFIG_MSC313E_WATCHDOG) += msc313e_wdt.o
>>>    obj-$(CONFIG_APPLE_WATCHDOG) += apple_wdt.o
>>>    obj-$(CONFIG_SUNPLUS_WATCHDOG) += sunplus_wdt.o
>>>    obj-$(CONFIG_MARVELL_GTI_WDT) += marvell_gti_wdt.o
>>> +obj-$(CONFIG_VT8500_WATCHDOG) += vt8500-wdt.o
>>>
>>>    # X86 (i386 + ia64 + x86_64) Architecture
>>>    obj-$(CONFIG_ACQUIRE_WDT) += acquirewdt.o
>>> diff --git a/drivers/watchdog/vt8500-wdt.c b/drivers/watchdog/vt8500-wdt.c
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..54fe5ad7695de36f6b3c1d28e955f00bef00e9db
>>> --- /dev/null
>>> +++ b/drivers/watchdog/vt8500-wdt.c
>>> @@ -0,0 +1,80 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/* Copyright (C) 2025 Alexey Charkov <alchark@gmail.com */
>>> +
>>> +#include <linux/auxiliary_bus.h>
>>> +#include <linux/container_of.h>
>>> +#include <linux/io.h>
>>> +#include <linux/limits.h>
>>> +#include <linux/module.h>
>>> +#include <linux/types.h>
>>> +#include <linux/watchdog.h>
>>> +#include <linux/vt8500-timer.h>
>>> +
>>> +static int vt8500_watchdog_start(struct watchdog_device *wdd)
>>> +{
>>> +     struct vt8500_wdt_info *info = watchdog_get_drvdata(wdd);
>>> +     u64 deadline = info->timer_next(wdd->timeout * VT8500_TIMER_HZ);
>>> +
>>
>> wdd->timeout is the soft timeout, which may be larger
>> than the maximum hardware timeout. That means you'll need
>> to use something like "min(wdd->timeout, U32_MAX / VT8500_TIMER_HZ)
>> * VT8500_TIMER_HZ" as parameter to the timer_next call.
> 
> Indeed. For some reason I thought the core splits up large user
> requested timeout values into at most max_hw_heartbeat_ms long chunks
> and feeds those to the driver via the timeout field, but now I see it
> doesn't.
> 
> Do I get it right that the core worker will try and do its last ping
> of the hardware at exactly max_hw_heartbeat_ms before the user
> specified deadline?
> 

Where do you see that ? In the watchdog core:

         hw_heartbeat_ms = min_not_zero(timeout_ms, wdd->max_hw_heartbeat_ms);
         keepalive_interval = ms_to_ktime(hw_heartbeat_ms / 2);

>>> +     writel((u32)deadline, info->wdt_match);
>>
>> Can deadline overflow ?
> 
> Yes. The underlying hardware counter is a u32 value incrementing at
> VT8500_TIMER_HZ and continuing past wraparound. This register sets the
> next match value: once the hardware counter reaches the value of
> (u32)deadline (which might be after the counter wrapping around iff
> deadline > U32_MAX) the system resets. Perhaps it warrants a comment
> in code.
> 

Ok. Yes, a comment would help.

Thanks,
Guenter

> Thanks for your review, Guenter!
> 
> Best regards,
> Alexey


