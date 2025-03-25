Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93364C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 12:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ARk/2qD3B4yeKBJrJ3RO2HvqNw7n1OqVVP/7taXakjQ=; b=OR3laclk2DkRLFoZ2gRsJLS4Rl
	n5x6DkqEvs/Xzo0wuOcjAqKE8aoFcMuTCMw0SryNEb1BAau0mocBblVJR+QdJhvsoPVlW8VsKNGrL
	8+JH9KaW70yqMnFjPjQs6PuIupKA9xzngSlpRkdqi2gCMx1UBDqR4IBzSdrsxVn3lDkAVcslfjf7O
	IykU3EVc2Pv9uEeroAJyRMSij/j+YSb4jVMxgIx1aYJWpNhT7/HcO86NUDP8tcAO/etNwvYTyYKOb
	3NFJdARf3CQRSPBQMDsPODxb1GFk30cNAqVRiie7Zht3VeEuMV/P79hjcco1uTzDOxteuQvi6CGJu
	Gx1RWc3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3Pq-00000005pRn-3uUj;
	Tue, 25 Mar 2025 12:29:58 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx363-00000005klT-0oWp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 12:09:32 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso38326625e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 05:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742904569; x=1743509369; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ARk/2qD3B4yeKBJrJ3RO2HvqNw7n1OqVVP/7taXakjQ=;
        b=FhZnkKB3PXGnj1RnTHpYzMZg4SNizQrk6c4bLpAzx/64CXGssdBYRZ/APrul2TsvxL
         LCDFVHj2Umj7cI2d6vtIiN3Z6aw3QRkYpa2kAgDz9KKgHOq5xWPiZh+Hx/66EkbxZsVO
         X1WftdH1LvkjeOjs14+lnykQO/rH4iBa41PeAM2mUzTv9pbo9MskIPpLHhDOY6eRVJif
         urvnqax3mNqpfbwRH6v3GSSpGSUeKDr9EVghncupQkWLsf73NBDi38uyqv5/Ihq0JYTu
         /CzraGwB8TsVCUAMy33hYUOa8gXlUUeNgZw1kCEt8a6DdPUuE7n3UXCsf5Qq+pGq9lNw
         EqjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742904569; x=1743509369;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ARk/2qD3B4yeKBJrJ3RO2HvqNw7n1OqVVP/7taXakjQ=;
        b=RH7mhOkrpvaYHejbsgFK65XzswnDP8AzPhLK0X0LWDuIjvg8XMfeUjVXKAuueCfBwp
         Z0MTvSfuXMV7RBogZha3Ogaf2a6y5zdnqq6kTlWgbweQ40s0k39XoKf0qJiOzyLz6aFV
         C1GldWq8LD3M0r4NOJGEocQeKOybNNhVTKJZg46Q/fu+8EHkw+b1b0bbH1K724eJNWWm
         6nRjZHRcNWkX+4Jic/sfxT1MNMVZhoprI0cLr1k3I9+5ii/mOXnmm01mUYNDNMViRAUX
         aeBkRuwj9WEjmRuWvl/1LRdc5NZ4UjIwMHIjgApW9IrFOz8o9pEcZZZZcFCN1dgPYHls
         f4qw==
X-Forwarded-Encrypted: i=1; AJvYcCWQsH2QwAMXDK2cX7f8hoW6cTFNkkgsa/wczzZlOjiVuINAM3sTDIFs+dSZ13TjFZP8ciywagcoPYyuxjqOF0+A@lists.infradead.org
X-Gm-Message-State: AOJu0YwPrDMCLVRlj67YH9eEat9FsITEnVg5EQr/xlQXqRZPLW3ihhzK
	JjsCINV6PzxDzFqY1J1BoyfyV1xuR4yYGR7QzSDC4GXZjGmHNK45tvpRqUmoduUM4T4WipMXEC5
	K
X-Gm-Gg: ASbGncupY8FqHFK5jmm0b3Lrh+Vdkt6VVJAO0oElm1EIXAFIrW3Hy3eYyymnlBno32w
	EG81kaQxzagwjOkbQCn/a/sONi+62sJHo9tD7w2EohzxJQrxTNGGwQpty/1mmkMdZ0SAgaYIzWl
	WgCNexvfIivGm4f424d+2VxO0UBPcLkyuqTaywoNw5g+eKTkLiU+kKVlj8XyUN6JPRtD+BSA5V3
	obxT+6MGHHchNbXDeGYIxBA1oapo53xI1dNKNEOQDTXDMen6hshA6ppDqAoodPnk+ihtKrXojyH
	WhwXFy4jhhOJEcar04n/sAcbBkoW5sF+XHjb34sTeLee2w7Bd9yRJzqJPiPTxbvHBNXF9QC4mK7
	Nl0zPecLj
X-Google-Smtp-Source: AGHT+IFBskiUUo+unot0SkV98dwQ4vT5wISCZj5gpa4ljqIKxNqSBAYOzS1BvS0WNWyEBmzZqIRDIw==
X-Received: by 2002:a05:6000:178c:b0:391:2ab1:d4b8 with SMTP id ffacd0b85a97d-3997f900c60mr12951478f8f.1.1742904569413;
        Tue, 25 Mar 2025 05:09:29 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39abdaf0c0bsm9161805f8f.63.2025.03.25.05.09.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 05:09:28 -0700 (PDT)
Message-ID: <098c5de8-9291-4f3e-a276-500825cac7c5@linaro.org>
Date: Tue, 25 Mar 2025 13:09:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clocksource/drivers/nxp-timer: Add the System Timer
 Module for the s32g platform
To: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, Thomas Fossati <thomas.fossati@linaro.org>,
 Larisa Grigore <Larisa.Grigore@nxp.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
References: <20250324100008.346009-1-daniel.lezcano@linaro.org>
 <20250324100008.346009-2-daniel.lezcano@linaro.org>
 <d60fca36-0beb-2574-cb82-3969bbfb58a9@oss.nxp.com>
 <8c208e8c-2e1e-430c-916a-dbc6732881b0@linaro.org>
 <065d6f32-3161-8316-bbbd-4da18eef839b@oss.nxp.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <065d6f32-3161-8316-bbbd-4da18eef839b@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_050931_235965_FCB73630 
X-CRM114-Status: GOOD (  33.24  )
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

On 25/03/2025 12:40, Ghennadi Procopciuc wrote:
> On 3/25/2025 12:53 PM, Daniel Lezcano wrote:
> [ ... ]
>>>> +static int __init nxp_stm_clocksource_init(struct device *dev, const
>>>> char *name,
>>>> +                       void __iomem *base, struct clk *clk)
>>>> +{
>>>> +    struct stm_timer *stm_timer;
>>>> +    int ret;
>>>> +
>>>> +    stm_timer = devm_kzalloc(dev, sizeof(*stm_timer), GFP_KERNEL);
>>>> +    if (!stm_timer)
>>>> +        return -ENOMEM;
>>>> +
>>>> +    stm_timer->base = base;
>>>> +    stm_timer->rate = clk_get_rate(clk);
>>>> +
>>>> +    stm_timer->scs.cs.name = name;
>>>> +    stm_timer->scs.cs.rating = 460;
>>>> +    stm_timer->scs.cs.read = nxp_stm_clocksource_read;
>>>> +    stm_timer->scs.cs.enable = nxp_stm_clocksource_enable;
>>>> +    stm_timer->scs.cs.disable = nxp_stm_clocksource_disable;
>>>> +    stm_timer->scs.cs.suspend = nxp_stm_clocksource_suspend;
>>>> +    stm_timer->scs.cs.resume = nxp_stm_clocksource_resume;
>>>> +    stm_timer->scs.cs.mask = CLOCKSOURCE_MASK(32);
>>>> +    stm_timer->scs.cs.flags = CLOCK_SOURCE_IS_CONTINUOUS;
>>>> +
>>>> +    ret = clocksource_register_hz(&stm_timer->scs.cs, stm_timer->rate);
>>>> +    if (ret)
>>>> +        return ret;
>>>
>>> clocksource_unregister during remove callback for cleanup?
>>
>> Sorry I don't get it :/
>>
>> There is no cleanup after the clocksource_register_hz() is successful
>>
> 
> I noticed that other drivers, such as
> drivers/clocksource/timer-tegra186.c and
> drivers/clocksource/timer-sun5i.c, perform clocksource_unregister during
> their platform_driver.remove callback. Shouldn't this apply here as well?

The tegra186 registers with one probe several timers and clocksources. 
The timer-nxp probes for each node.

The timer-sun5i.c has the remove callback but it is pointless as it can 
not be compiled as module. So it should not have it.

> [ ... ]
>>
>>>> +static int nxp_stm_clockevent_set_next_event(unsigned long delta,
>>>> struct clock_event_device *ced)
>>>> +{
>>>> +    struct stm_timer *stm_timer = ced_to_stm(ced);
>>>> +    u32 val;
>>>> +
>>>> +    nxp_stm_clockevent_disable(stm_timer);
>>>
>>> While examining the code base, I came across the
>>> drivers/clocksource/timer-imx-gpt.c file, specifically the
>>> mx1_2_set_next_event function, which includes a protection against
>>> missing events. Using a similar approach would allow us to keep the STM
>>> module enabled while only altering the channel's register state. This
>>> risk can also be mitigated by adjusting min_delta_ns based on tick
>>> frequency.
>>
>> How would you validate that ?
>>
> 
> How would I validate that this works?
> 
> If this is the question, I see that the core performs an auto adjustment
> of the minimum delta as part of the clockevents_program_min_delta
> function when CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST is enabled.
> Initially, I would examine how many times dev->set_next_event() returns
> -ETIME. At the end of the function, min_delta_ns should reflect the
> actual minimum delta the device can handle.

That is an area of optimization and I would prefer to keep that as a 
separate change focused on validating this approach.

> [ ... ]
>>>> +static int __init nxp_stm_timer_probe(struct platform_device *pdev)
>>>> +{
>>>> +    struct device *dev = &pdev->dev;
>>>> +    struct device_node *np = dev->of_node;
>>>> +    struct stm_instances *stm_instances;
>>>> +    const char *name = of_node_full_name(np);
>>>> +    void __iomem *base;
>>>> +    int irq, ret;
>>>> +    struct clk *clk;
>>>> +
>>>> +    stm_instances =
>>>> (typeof(stm_instances))of_device_get_match_data(dev);
>>>> +    if (!stm_instances) {
>>>> +        dev_err(dev, "No STM instances associated with a cpu");
>>>> +        return -EINVAL;
>>>> +    }
>>>> +
>>>> +    base = devm_of_iomap(dev, np, 0, NULL);
>>>> +    if (IS_ERR(base)) {
>>>> +        dev_err(dev, "Failed to iomap %pOFn\n", np);
>>>> +        return PTR_ERR(base);
>>>> +    }
>>>> +
>>>> +    irq = irq_of_parse_and_map(np, 0);
>>>> +    if (irq <= 0) {
>>>> +        dev_err(dev, "Failed to parse and map IRQ: %d\n", irq);
>>>> +        return -EINVAL;
>>>> +    }
>>>
>>>   From commit description:
>>>
>>>> The first probed STM is used as a clocksource, the second will be the
>>>> broadcast timer and the rest are used as a clockevent with the
>>>> affinity set to a CPU.
>>>
>>> Why is the interrupt mandatory when the node is probed as a clocksource?
>>
>> It relies on the DT description and it does not hurt to have a
>> consistent code path for clockevent / clocksource even if the interrupt
>> is not requested for the clocksource later.
>>
> 
> If so, in my opinion, it would make sense to use the same STM instance
> for both the clocksource and broadcast clockevent, as both functions can
> be accommodated within a single STM instance, which will help reduce the
> number of STM instances used.

The broadcast timer is stopped when it is unused which is the case for 
the s32 because there are no idle state powering down the local timers. 
They have to have be separated.



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

