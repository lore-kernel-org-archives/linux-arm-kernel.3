Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0901CC35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 13:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HRtKNqVWmSbvH/hB6VfWt31wHPCJGfHZAtYU9DtK8OA=; b=wsU2Pk+Y/Kvp33EK1Q0bKHwNAB
	uM7zoL5Qp5K/XbSURpK9OCGfiEvSBZogm+wA5ojaszFfgvRTCYVL+FiOSpOHyENrpfGUuQ643XDDE
	mS0U7jMzs78lzUXabNQ2HwBM+RoWDxqaJxEtwwGm+SXpbRNeeQmZXzgAMSFRD4K7OHDTrk15uHCr0
	n191CNn0crFxGifa/D7ekpLannwtFQmvokcnur7WJWxcB7bX3uetAMkLUcS4WbvFQQhzaIt8vpFu+
	KNE1TJ8POAY61jN0NiOq3U5X3OytgNMXSyDWTWM+/4hMX/BFwONVnreAr66y4nG/WqtjJV4/AhqXh
	HiJRUcYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3wD-00000005xoG-3zsL;
	Tue, 25 Mar 2025 13:03:25 +0000
Received: from mail-wm1-f53.google.com ([209.85.128.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3ks-00000005vwz-1osm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 12:51:43 +0000
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso34834585e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 05:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742907100; x=1743511900; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HRtKNqVWmSbvH/hB6VfWt31wHPCJGfHZAtYU9DtK8OA=;
        b=FkZD6VsC65xEX67khaC9OEaJtvF0aJ2MyHUH1JAmuKkaJbmpPUFpPf5+Jjl+Do+4G7
         xQ40XsiKF64rXvfPtrmKxCeVP6xULgjnZ8tKebcggf5UW1Xl6SdBa5BMt8OCqxuw8sdV
         6j/5bESNwOVaNWYvL1+35UAuoZWZcuDszeKV6AIuwOiTvu9Ho66o8jfAgxrSk4AIqYDL
         heBcheED5JZcYZzyoqy6sJ5AQoQUkDwCbN0gui+RvOVqyKQ4abBv9MIFC5nMAJY3CZFk
         nORIKPAvx2sxQKU7QDMcPp5lPUz3mLVGm8IhNkrN5b7W+TO5aV8RGjC+nComQ0S4NQcA
         2bCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742907100; x=1743511900;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HRtKNqVWmSbvH/hB6VfWt31wHPCJGfHZAtYU9DtK8OA=;
        b=jiXZX/0L/dTTEvYQZIDsUHEYLPp2uWQR2kfFZjesiNae9EUsJ5WFZ/fCboY3tMZfXZ
         nL2IcKxigkFrXY2wd8DxOQ7wCSpv9mEhg8YK1l+Spyxqr3Bzb9/RQ8jriTFhTX3J/Juk
         qZ9NZpuTN0OfmR6ekf8NOpiakge7WdHur5PbXcAmQPSZANzCc6NnETFE5VYIJVGgfJa9
         DhcHTxazo+m/LCdmt7F1x/NXRiMoZ4O383QJh/CNZaLbQVT1XyUX7rBOo9EsrRxNGqwq
         4hAbJthek15bKusIqwhPmKWRSksq6PLdM8unhz3ip4KILVFZpp+L6pMTZjI4MSKGsT1Q
         C6/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVKf/RzwBZArOb9Vm7IK5ba5Q24oInD/AwIuYZv7Xn5hN8DMGhLweJQyGn/3xXZq5KN5pLFVuSAN7+lxyocOVj4@lists.infradead.org
X-Gm-Message-State: AOJu0YwHJIg4U5YdyjVU8in5FODHDWEJGLzjbDKGWpfWg7skLh8/2Q14
	WzMmky1Ns+lZvpbNKt2PuNN80KFVnkc2S0EqiWWkuDD+mN/Rv3bN/mwFHVRl04zJoqBuDxijaq7
	B
X-Gm-Gg: ASbGnctzH9YdcZU/TEyZtqnjzqqwmzbEcfSJ6EniXDSjlZkdlcarSjd2gZDpox1AgFu
	ndPiKKu7ipskNNKOj+QUdqP1pv8xeE18e8guYyyYestnpDc7CH4mVUPs3AG5DYo70DMVy3tI5Zh
	bmfwUVH5OGa7qry4jhvY4vXogdEHnbpC5W7bhKeWt3YTKKmkURU7ESTsmDSD5l6ZggZNGG1uvjS
	o0nh6ZVV3rlF/46SsaasfF3VJL25qoT2gOCKctGq6r+LP0TJd6VoK9Ffh5HF6A4dCGb8DTJOXJj
	J3Usipl3hOsNJjuOh9/EpOIL9UHN5ThtkgiMyeSqp7EXsZdw2mkBaqCOkWQNTL9KBxi1ggbCGp6
	l+l5suwbr
X-Google-Smtp-Source: AGHT+IGuAoH/p1nMSeqv3bOifmTrMP/PnwzxrZnxOY/n0urwwA3R2/apocnxV/A6G60e0FGXp9uPtA==
X-Received: by 2002:a05:600c:1f92:b0:43b:c857:e9d7 with SMTP id 5b1f17b1804b1-43d502e338emr131930175e9.5.1742907100288;
        Tue, 25 Mar 2025 05:51:40 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d4fd9e960sm149122515e9.29.2025.03.25.05.51.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 05:51:39 -0700 (PDT)
Message-ID: <cc2dd75c-e279-4e55-ab88-75498e93146a@linaro.org>
Date: Tue, 25 Mar 2025 13:51:37 +0100
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
 <linux-arm-kernel@lists.infradead.org>, NXP S32 Linux Team <s32@nxp.com>
References: <20250324100008.346009-1-daniel.lezcano@linaro.org>
 <20250324100008.346009-2-daniel.lezcano@linaro.org>
 <d60fca36-0beb-2574-cb82-3969bbfb58a9@oss.nxp.com>
 <8c208e8c-2e1e-430c-916a-dbc6732881b0@linaro.org>
 <065d6f32-3161-8316-bbbd-4da18eef839b@oss.nxp.com>
 <098c5de8-9291-4f3e-a276-500825cac7c5@linaro.org>
 <068713cb-47ca-ae26-e113-9f5026be9196@oss.nxp.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <068713cb-47ca-ae26-e113-9f5026be9196@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_055142_478042_BF31388A 
X-CRM114-Status: GOOD (  31.21  )
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

On 25/03/2025 13:21, Ghennadi Procopciuc wrote:
> On 3/25/2025 2:09 PM, Daniel Lezcano wrote:
>> On 25/03/2025 12:40, Ghennadi Procopciuc wrote:
>>> On 3/25/2025 12:53 PM, Daniel Lezcano wrote:
>>> [ ... ]
>>>>>> +static int __init nxp_stm_clocksource_init(struct device *dev, const
>>>>>> char *name,
>>>>>> +                       void __iomem *base, struct clk *clk)
>>>>>> +{
>>>>>> +    struct stm_timer *stm_timer;
>>>>>> +    int ret;
>>>>>> +
>>>>>> +    stm_timer = devm_kzalloc(dev, sizeof(*stm_timer), GFP_KERNEL);
>>>>>> +    if (!stm_timer)
>>>>>> +        return -ENOMEM;
>>>>>> +
>>>>>> +    stm_timer->base = base;
>>>>>> +    stm_timer->rate = clk_get_rate(clk);
>>>>>> +
>>>>>> +    stm_timer->scs.cs.name = name;
>>>>>> +    stm_timer->scs.cs.rating = 460;
>>>>>> +    stm_timer->scs.cs.read = nxp_stm_clocksource_read;
>>>>>> +    stm_timer->scs.cs.enable = nxp_stm_clocksource_enable;
>>>>>> +    stm_timer->scs.cs.disable = nxp_stm_clocksource_disable;
>>>>>> +    stm_timer->scs.cs.suspend = nxp_stm_clocksource_suspend;
>>>>>> +    stm_timer->scs.cs.resume = nxp_stm_clocksource_resume;
>>>>>> +    stm_timer->scs.cs.mask = CLOCKSOURCE_MASK(32);
>>>>>> +    stm_timer->scs.cs.flags = CLOCK_SOURCE_IS_CONTINUOUS;
>>>>>> +
>>>>>> +    ret = clocksource_register_hz(&stm_timer->scs.cs,
>>>>>> stm_timer->rate);
>>>>>> +    if (ret)
>>>>>> +        return ret;
>>>>>
>>>>> clocksource_unregister during remove callback for cleanup?
>>>>
>>>> Sorry I don't get it :/
>>>>
>>>> There is no cleanup after the clocksource_register_hz() is successful
>>>>
>>>
>>> I noticed that other drivers, such as
>>> drivers/clocksource/timer-tegra186.c and
>>> drivers/clocksource/timer-sun5i.c, perform clocksource_unregister during
>>> their platform_driver.remove callback. Shouldn't this apply here as well?
>>
>> The tegra186 registers with one probe several timers and clocksources.
>> The timer-nxp probes for each node.
>>
>> The timer-sun5i.c has the remove callback but it is pointless as it can
>> not be compiled as module. So it should not have it.
>>
> 
> Ok.
> 
>>> [ ... ]
>>>>
>>>>>> +static int nxp_stm_clockevent_set_next_event(unsigned long delta,
>>>>>> struct clock_event_device *ced)
>>>>>> +{
>>>>>> +    struct stm_timer *stm_timer = ced_to_stm(ced);
>>>>>> +    u32 val;
>>>>>> +
>>>>>> +    nxp_stm_clockevent_disable(stm_timer);
>>>>>
>>>>> While examining the code base, I came across the
>>>>> drivers/clocksource/timer-imx-gpt.c file, specifically the
>>>>> mx1_2_set_next_event function, which includes a protection against
>>>>> missing events. Using a similar approach would allow us to keep the STM
>>>>> module enabled while only altering the channel's register state. This
>>>>> risk can also be mitigated by adjusting min_delta_ns based on tick
>>>>> frequency.
>>>>
>>>> How would you validate that ?
>>>>
>>>
>>> How would I validate that this works?
>>>
>>> If this is the question, I see that the core performs an auto adjustment
>>> of the minimum delta as part of the clockevents_program_min_delta
>>> function when CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST is enabled.
>>> Initially, I would examine how many times dev->set_next_event() returns
>>> -ETIME. At the end of the function, min_delta_ns should reflect the
>>> actual minimum delta the device can handle.
>>
>> That is an area of optimization and I would prefer to keep that as a
>> separate change focused on validating this approach.
>>
> 
> This suggestion supports the argument presented below.
> 
>>> [ ... ]
>>>>>> +static int __init nxp_stm_timer_probe(struct platform_device *pdev)
>>>>>> +{
>>>>>> +    struct device *dev = &pdev->dev;
>>>>>> +    struct device_node *np = dev->of_node;
>>>>>> +    struct stm_instances *stm_instances;
>>>>>> +    const char *name = of_node_full_name(np);
>>>>>> +    void __iomem *base;
>>>>>> +    int irq, ret;
>>>>>> +    struct clk *clk;
>>>>>> +
>>>>>> +    stm_instances =
>>>>>> (typeof(stm_instances))of_device_get_match_data(dev);
>>>>>> +    if (!stm_instances) {
>>>>>> +        dev_err(dev, "No STM instances associated with a cpu");
>>>>>> +        return -EINVAL;
>>>>>> +    }
>>>>>> +
>>>>>> +    base = devm_of_iomap(dev, np, 0, NULL);
>>>>>> +    if (IS_ERR(base)) {
>>>>>> +        dev_err(dev, "Failed to iomap %pOFn\n", np);
>>>>>> +        return PTR_ERR(base);
>>>>>> +    }
>>>>>> +
>>>>>> +    irq = irq_of_parse_and_map(np, 0);
>>>>>> +    if (irq <= 0) {
>>>>>> +        dev_err(dev, "Failed to parse and map IRQ: %d\n", irq);
>>>>>> +        return -EINVAL;
>>>>>> +    }
>>>>>
>>>>>    From commit description:
>>>>>
>>>>>> The first probed STM is used as a clocksource, the second will be the
>>>>>> broadcast timer and the rest are used as a clockevent with the
>>>>>> affinity set to a CPU.
>>>>>
>>>>> Why is the interrupt mandatory when the node is probed as a
>>>>> clocksource?
>>>>
>>>> It relies on the DT description and it does not hurt to have a
>>>> consistent code path for clockevent / clocksource even if the interrupt
>>>> is not requested for the clocksource later.
>>>>
>>>
>>> If so, in my opinion, it would make sense to use the same STM instance
>>> for both the clocksource and broadcast clockevent, as both functions can
>>> be accommodated within a single STM instance, which will help reduce the
>>> number of STM instances used.
>>
>> The broadcast timer is stopped when it is unused which is the case for
>> the s32 because there are no idle state powering down the local timers.
>> They have to have be separated.
>>
> 
> This wouldn't be the case if the STM is kept running/counting during the
> clock event setup, with only the clock event interrupt being disabled
> (CCR.CEN).

Are you asking to use two different channels for the same STM instance, 
one for the clocksource and one for the clockevent ?



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

