Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23550C36005
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 11:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sMQzkzaFSuyekUR/FYFhcWqSgLmiNobKxeZ/ukBdnew=; b=t2GSi7FkaDsrZacfaKkGKQ7Gju
	B9qcGmm7XikN4ZaVyY1UenDWf6gtrfwTqyAvdhPQZM1fNcSCXCbNvSkA5rNnXGe6rgaQv+4+aMCp/
	ls5xohMeNrEpE4fH+QQM6V/iOq5GhadmdINPiZf8LWPI6J5DZI4jNOIjUSN78tJifmeNHcygTwRrf
	T4Li1FchysOca3MQzH44EDWkRoQBUAr4PsbtixrwPrtALXYxFuvoeOWLZsVSjyVY6ETvgkJXzufyW
	nCBb/Un+NOPx4l8NjpePe+Jf7f4u1LYF+NpU4d5W7ebbIhxfA2uPC2DQ8RY/qrMm0l6PjkX7BFFoT
	Y9eXBZEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tx1yS-00000005Ywd-0EZg;
	Tue, 25 Mar 2025 10:57:36 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx1uN-00000005Vgt-46je
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 10:53:25 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso24555475e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 03:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742900002; x=1743504802; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sMQzkzaFSuyekUR/FYFhcWqSgLmiNobKxeZ/ukBdnew=;
        b=ixasA7bLBhVZ7KLYRYzpoHbQ2xlA2QmHSHFPAGm3eNb6owX2Ie2vqiWk9qVtSDGqmA
         aRiZf8JfArOi7mY8MPnp2SrKv1xQ9LatZcZAIVr/JRLkVPlknOtcqH6a3L3RsCmY6VK1
         k4hXttiJNEg2+/lLi+puqSPDw3TlznY/8Fal+sVYd2XJekYNhzS+DLCwmlWVfQCZQP1z
         lKAFfZjqeH2EGKIDgJw4qti16Ppi0m1o1s582ede1NlL+KjoromC+GxVC/7B/WfduxA6
         bpoMWtbrrNEN8yAnN/yKbIVq1vCisGVtOQxTQAA4ux1M+SnYRTf+uKebt25OH1ii26qQ
         cdaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742900002; x=1743504802;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sMQzkzaFSuyekUR/FYFhcWqSgLmiNobKxeZ/ukBdnew=;
        b=hU3yaFlXutGb3FXiuHUAceqwg2sMmGkSRAOPfKpWKdSlOl3faOWT1FnL1lDN/yYP6P
         s/7zvvdRhQ4/7x5q2ToUW32H9nNzXeEeYEZXCUxpoHHE0g3kVTrN3VixHYD/E1jPEFdU
         JBN+xofJZtKfZihMGKTJv4FT08m7Up/S1jutkw4d+vOkuAHsjT18yQ4HPVzNozLZ9iDp
         TigLSRbX/tavjnjUexWy0fE19JTMIieSPBVNp/OORqyxoP9gr6/anXBTYpoMwJcHHdCn
         AAE7a7f6WJlo75tpsrtH6zBe5ESxSsqGLxRMy5XVXkcKntWTMkzncJfluQTYKFZEivAP
         m4WQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaRinSOBiCzH/Zpbsk5hTfvc/W+0c3XPO1SG6Md9bv42S51IdpU34yE3u+UA/sAMtPsWiezm8qJfvFA0i4+V1a@lists.infradead.org
X-Gm-Message-State: AOJu0Yzfx3HzUw4ZnN/QG3FNwUzZ96kglQlRxVMNg8UMHHrfmsQDjI3W
	qCbAnDYw0Yoi8gkABiCq5OFrw3NMvlizXlv5PENDDJpp79OxqASKjAJoa/LZYkk=
X-Gm-Gg: ASbGncuMY4zP1LCBVpnxQWcQ8bv9JpzItCzHShxUF3dT59AJjHSMU4K7DhWZOEtXmKc
	PtVAPezgvF/lLU0ayuHB8Wmdl1+1HKO4OmRDTJ279zs4h2K0IoxgMDQJ/RtwSJLNgRDhx5/cLk/
	8Gme/bc3wSqo9+HABarpkMvEZ1sYzqcLcDz2tTeb5B+AzELOgKmdUGsEo3965ZLHIRh5BPA9XRm
	U5zHn3iG8zoRoxDUqSMKmFcqfVsvYig3MVaHVe/cQ57rqODKT7Zo5nhpnPMjROCROf8Bq2GzSbZ
	WQxrFnUbxsZV+KCBcVXrptFtCXryegcFGxV/m2nDgMAheDF84uQHrSkvAN8AuGYitnQIlioGisf
	9h9iCLFHR
X-Google-Smtp-Source: AGHT+IEgpp59NjoNSFfPPCPKdn9PH7nepoW9vULCdDgObFyn5ZHMxYqUaIM5iFfr41i+dCjijBMgsA==
X-Received: by 2002:a05:600c:5021:b0:43d:1c3:cb2e with SMTP id 5b1f17b1804b1-43d509f6788mr169590225e9.17.1742900001669;
        Tue, 25 Mar 2025 03:53:21 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d6eab2466sm9876525e9.1.2025.03.25.03.53.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 03:53:21 -0700 (PDT)
Message-ID: <8c208e8c-2e1e-430c-916a-dbc6732881b0@linaro.org>
Date: Tue, 25 Mar 2025 11:53:20 +0100
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
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <d60fca36-0beb-2574-cb82-3969bbfb58a9@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_035324_136128_4F67CD63 
X-CRM114-Status: GOOD (  33.14  )
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


Hi Ghennadi,

thanks for the review


On 25/03/2025 08:28, Ghennadi Procopciuc wrote:

[ ... ]

>> +static int __init nxp_stm_clocksource_init(struct device *dev, const char *name,
>> +					   void __iomem *base, struct clk *clk)
>> +{
>> +	struct stm_timer *stm_timer;
>> +	int ret;
>> +
>> +	stm_timer = devm_kzalloc(dev, sizeof(*stm_timer), GFP_KERNEL);
>> +	if (!stm_timer)
>> +		return -ENOMEM;
>> +
>> +	stm_timer->base = base;
>> +	stm_timer->rate = clk_get_rate(clk);
>> +
>> +	stm_timer->scs.cs.name = name;
>> +	stm_timer->scs.cs.rating = 460;
>> +	stm_timer->scs.cs.read = nxp_stm_clocksource_read;
>> +	stm_timer->scs.cs.enable = nxp_stm_clocksource_enable;
>> +	stm_timer->scs.cs.disable = nxp_stm_clocksource_disable;
>> +	stm_timer->scs.cs.suspend = nxp_stm_clocksource_suspend;
>> +	stm_timer->scs.cs.resume = nxp_stm_clocksource_resume;
>> +	stm_timer->scs.cs.mask = CLOCKSOURCE_MASK(32);
>> +	stm_timer->scs.cs.flags = CLOCK_SOURCE_IS_CONTINUOUS;
>> +
>> +	ret = clocksource_register_hz(&stm_timer->scs.cs, stm_timer->rate);
>> +	if (ret)
>> +		return ret;
> 
> clocksource_unregister during remove callback for cleanup?

Sorry I don't get it :/

There is no cleanup after the clocksource_register_hz() is successful

>> +
>> +	stm_sched_clock = stm_timer;
>> +
>> +	sched_clock_register(nxp_stm_read_sched_clock, 32, stm_timer->rate);
>> +
>> +	dev_set_drvdata(dev, stm_timer);
> 
> Is this used?

Nope, I'll remove it.

>> +
>> +	dev_dbg(dev, "Registered clocksource %s\n", name);
>> +
>> +	return 0;
>> +}

[ ... ]

>> +static int nxp_stm_clockevent_set_next_event(unsigned long delta, struct clock_event_device *ced)
>> +{
>> +	struct stm_timer *stm_timer = ced_to_stm(ced);
>> +	u32 val;
>> +
>> +	nxp_stm_clockevent_disable(stm_timer);
> 
> While examining the code base, I came across the
> drivers/clocksource/timer-imx-gpt.c file, specifically the
> mx1_2_set_next_event function, which includes a protection against
> missing events. Using a similar approach would allow us to keep the STM
> module enabled while only altering the channel's register state. This
> risk can also be mitigated by adjusting min_delta_ns based on tick
> frequency.

How would you validate that ?


>> +	stm_timer->sce.delta = delta;
>> +
>> +	val = nxp_stm_clockevent_read_counter(stm_timer) + delta;
>> +
>> +	writel(val, stm_timer->base + STM_CHANNEL(0) + STM_CMP);
>> +
>> +	nxp_stm_clockevent_enable(stm_timer);
>> +
>> +	return 0;
>> +}
>> +
>> +static int nxp_stm_clockevent_set_periodic(struct clock_event_device *ced)
>> +{
>> +	struct stm_timer *stm_timer = ced_to_stm(ced);
>> +
>> +        return nxp_stm_clockevent_set_next_event(stm_timer->rate, ced);
>> +}
>> +
>> +static int __init nxp_stm_clockevent_broadcast_init(struct device *dev, const char *name, void __iomem *base,
>> +						    int irq, struct clk *clk)
>> +{
>> +	struct stm_timer *stm_timer;
>> +	int ret;
>> +
>> +	stm_timer = devm_kzalloc(dev, sizeof(*stm_timer), GFP_KERNEL);
>> +	if (!stm_timer)
>> +		return -ENOMEM;
>> +
>> +	stm_timer->base = base;
>> +	stm_timer->rate = clk_get_rate(clk);
>> +
>> +	stm_timer->sce.ced.name = name;
>> +	stm_timer->sce.ced.features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT;
>> +	stm_timer->sce.ced.set_state_shutdown = nxp_stm_clockevent_shutdown;
>> +	stm_timer->sce.ced.set_state_periodic = nxp_stm_clockevent_set_periodic;
>> +	stm_timer->sce.ced.set_next_event = nxp_stm_clockevent_set_next_event;
>> +	stm_timer->sce.ced.cpumask = cpu_possible_mask;
>> +	stm_timer->sce.ced.rating = 460;
>> +	stm_timer->sce.ced.irq = irq;
>> +
>> +	nxp_stm_clockevent_irq_clr(stm_timer);
>> +
>> +	ret = request_irq(irq, nxp_stm_clockevent_interrupt,
>> +			  IRQF_TIMER | IRQF_NOBALANCING, name, &stm_timer->sce.ced);
>> +	if (ret) {
>> +		dev_err(dev, "Unable to allocate interrupt line: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	clockevents_config_and_register(&stm_timer->sce.ced, stm_timer->rate, 1, 0xffffffff);
>> +
>> +	dev_dbg(dev, "Registered broadcast clockevent %s irq=%d\n", name, irq);
>> +
>> +	return 0;
>> +}
>> +
>> +static int __init nxp_stm_clockevent_per_cpu_init(struct device *dev, const char *name, void __iomem *base,
>> +						  int irq, struct clk *clk, int cpu)
>> +{
> 
> This function duplicates a significant portion of the previous one. To
> avoid code duplication, it would be beneficial to extract the common
> part into a dedicated function.

Sure

>> +	struct stm_timer *stm_timer;
>> +	int ret;
>> +
>> +	stm_timer = devm_kzalloc(dev, sizeof(*stm_timer), GFP_KERNEL);
>> +	if (!stm_timer)
>> +		return -ENOMEM;
>> +
>> +	stm_timer->base = base;
>> +	stm_timer->rate = clk_get_rate(clk);
>> +
>> +	stm_timer->sce.ced.name = name;
>> +	stm_timer->sce.ced.features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT;
>> +	stm_timer->sce.ced.set_state_shutdown = nxp_stm_clockevent_shutdown;
>> +	stm_timer->sce.ced.set_state_periodic = nxp_stm_clockevent_set_periodic;
>> +	stm_timer->sce.ced.set_next_event = nxp_stm_clockevent_set_next_event;
>> +	stm_timer->sce.ced.cpumask = cpumask_of(cpu);
>> +	stm_timer->sce.ced.rating = 460;
>> +	stm_timer->sce.ced.irq = irq;
>> +
>> +	nxp_stm_clockevent_irq_clr(stm_timer);
>> +
>> +	ret = request_irq(irq, nxp_stm_clockevent_interrupt,
>> +			  IRQF_TIMER | IRQF_NOBALANCING, name, &stm_timer->sce.ced);
> 
> devm_request_irq instead ?

Yes

>> +	if (ret) {
>> +		dev_err(dev, "Unable to allocate interrupt line: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	per_cpu(stm_timers, cpu) = stm_timer;
>> +
>> +	dev_dbg(dev, "Initialized per cpu clockevent name=%s, irq=%d, cpu=%d\n", name, irq, cpu);
>> +
>> +	return 0;
>> +}
>> +
>> +static int nxp_stm_clockevent_starting_cpu(unsigned int cpu)
>> +{
>> +	struct stm_timer *stm_timer = per_cpu(stm_timers, cpu);
>> +	int ret;
>> +
>> +	if (WARN_ON(!stm_timer))
>> +		return -EFAULT;
>> +
>> +	ret = irq_force_affinity(stm_timer->sce.ced.irq, cpumask_of(cpu));
>> +	if (ret)
>> +		return ret;
>> +
>> +	clockevents_config_and_register(&stm_timer->sce.ced, stm_timer->rate, 1, 0xffffffff);
>> +
>> +	return 0;
>> +}
>> +
>> +static int __init nxp_stm_timer_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct device_node *np = dev->of_node;
>> +	struct stm_instances *stm_instances;
>> +	const char *name = of_node_full_name(np);
>> +	void __iomem *base;
>> +	int irq, ret;
>> +	struct clk *clk;
>> +
>> +	stm_instances = (typeof(stm_instances))of_device_get_match_data(dev);
>> +	if (!stm_instances) {
>> +		dev_err(dev, "No STM instances associated with a cpu");
>> +		return -EINVAL;
>> +	}
>> +
>> +	base = devm_of_iomap(dev, np, 0, NULL);
>> +	if (IS_ERR(base)) {
>> +		dev_err(dev, "Failed to iomap %pOFn\n", np);
>> +		return PTR_ERR(base);
>> +	}
>> +
>> +	irq = irq_of_parse_and_map(np, 0);
>> +	if (irq <= 0) {
>> +		dev_err(dev, "Failed to parse and map IRQ: %d\n", irq);
>> +		return -EINVAL;
>> +	}
> 
>  From commit description:
> 
>> The first probed STM is used as a clocksource, the second will be the
>> broadcast timer and the rest are used as a clockevent with the
>> affinity set to a CPU.
> 
> Why is the interrupt mandatory when the node is probed as a clocksource?

It relies on the DT description and it does not hurt to have a 
consistent code path for clockevent / clocksource even if the interrupt 
is not requested for the clocksource later.

>> +
>> +	clk = devm_clk_get(dev, NULL);
>> +	if (IS_ERR(clk)) {
>> +		dev_err(dev, "Clock not found\n");
> 
> Missing irq_dispose_mapping ?

Yeah ...

>> +		return PTR_ERR(clk);
>> +	}
>> +
>> +	ret = clk_prepare_enable(clk);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to enable STM timer clock: %d\n", ret);
>> +		return ret;
>> +	}
> 
> devm_clk_get_enabled instead of devm_clk_get + clk_prepare_enable ?

Yes, good point

>> +
>> +	if (!stm_instances->clocksource && (stm_instances->features & STM_CLKSRC)) {
>> +
>> +		/*
>> +		 * First probed STM will be a clocksource
>> +		 */
>> +		ret = nxp_stm_clocksource_init(dev, name, base, clk);
>> +		if (ret)
>> +			return ret;
>> +		stm_instances->clocksource++;
>> +
>> +	} else if (!stm_instances->clockevent_broadcast &&
>> +		   (stm_instances->features & STM_CLKEVT_BROADCAST)) {
>> +
>> +		/*
>> +		 * Second probed STM will be a broadcast clockevent
>> +		 */
>> +		ret = nxp_stm_clockevent_broadcast_init(dev, name, base, irq, clk);
>> +		if (ret)
>> +			return ret;
>> +		stm_instances->clockevent_broadcast++;
>> +
>> +	} else if (stm_instances->clockevent_per_cpu < num_possible_cpus() &&
>> +		   (stm_instances->features & STM_CLKEVT_PER_CPU)) {
>> +
>> +		/*
>> +		 * Next probed STM will be a per CPU clockevent, until
>> +		 * we probe as much as we have CPUs available on the
>> +		 * system, we do a partial initialization
>> +		 */
>> +		ret = nxp_stm_clockevent_per_cpu_init(dev, name, base, irq, clk,
>> +						      stm_instances->clockevent_per_cpu);
>> +		if (ret)
>> +			return ret;
>> +
>> +		stm_instances->clockevent_per_cpu++;
>> +
>> +		/*
>> +		 * The number of probed STM for per CPU clockevent is
>> +		 * equal to the number of available CPUs on the
>> +		 * system. We install the cpu hotplug to finish the
>> +		 * initialization by registering the clockevents
>> +		 */
>> +		if (stm_instances->clockevent_per_cpu == num_possible_cpus()) {
>> +			ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "STM timer:starting",
>> +						nxp_stm_clockevent_starting_cpu, NULL);
>> +			if (ret < 0)
>> +				return ret;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static struct stm_instances s32g_stm_instances = { .features = STM_CLKSRC | STM_CLKEVT_PER_CPU };
>> +
>> +static const struct of_device_id nxp_stm_of_match[] = {
>> +	{ .compatible = "nxp,s32g2-stm", &s32g_stm_instances },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, nxp_stm_of_match);
>> +
>> +static struct platform_driver nxp_stm_probe = {
>> +	.probe	= nxp_stm_timer_probe,
>> +	.driver	= {
>> +		.name = "nxp-stm",
>> +		.of_match_table = of_match_ptr(nxp_stm_of_match),
>> +	},
>> +};
>> +module_platform_driver(nxp_stm_probe);
>> +
>> +MODULE_DESCRIPTION("NXP System Timer Module driver");
>> +MODULE_LICENSE("GPL");
> 


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

