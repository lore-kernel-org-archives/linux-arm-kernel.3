Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF63C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 07:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8fPkSfnj1MOG8lzPGC1XL1xwAf319HZ3gPUnzhtCTcc=; b=K+6liEXUn4d8c4e12cbQGm9DUc
	avWhpu0ATWc1Fkho7/dRiTp340KQxL7VK3l1DjLpQF35N0Lj9ZAOfTgNcbIdoeag8mZZYaxNga9cx
	CqZ8ZQOSDVB+suYPuBeU76U/5rpKHdLV8D+hJWgRKXLTBJGE9qJqdCQniJ7CeXfMws9n8F+bm/p1c
	mbcEWMPXXLiGb4TwHQv4cDArkV71gDmxSoLyVwc/PbC1zEg2XXwx9K4z+FvyzAFBB1IzYw+yGTOW9
	uoDxo+WzbtKWhQOOHFGJ3cjEvreoIHkB7zXBn77Vs15PW/Vmu9Xfu1llJnRmYF9UsZG82pdnj1AQ0
	pp+lyVlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twyo7-000000056H2-3OPg;
	Tue, 25 Mar 2025 07:34:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twyjn-000000055XR-16A2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 07:30:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A6D1361587;
	Tue, 25 Mar 2025 07:30:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E30FCC4CEED;
	Tue, 25 Mar 2025 07:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742887814;
	bh=NUU1tKtyrxbh9CycUXEnU1sTP9HW1U1NnObVJRtZG2w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BwkKoGHEW9V+JQcsH/bEvyCDpG+0TBXS0TPr1qtq706PzmG+P3Z5QMVAWgBmf1dtU
	 NZsuJN9NkeYlWLDaYHniaX2fRGRUE+wnZ178h/YfmMoMcDgK6TnwEsjJDbRVvfSkQ3
	 XlwHJQUP/2OXQ+v+UsjfTLkriIoPUyaES8DMCvmztDX5JvxIVtxA/1s3TfzRfhyigD
	 N5t6Zi9NVw/V6yR4aDpe7KlTtaz1JMGfv+qKmJa9+2JYo/sv1XMNSE1sGyIDafa+Xc
	 u/InFkKuFool34dv31mYqVHpBUq+2fhozZPk7fHU2RprMRgwDWPHi3g80VFizesotc
	 76zwboL0N2/0w==
Message-ID: <bb7e4740-9608-4534-9c19-3ac066e2aa8f@kernel.org>
Date: Tue, 25 Mar 2025 08:30:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clocksource/drivers/nxp-timer: Add the System Timer
 Module for the s32g platform
To: Daniel Lezcano <daniel.lezcano@linaro.org>, tglx@linutronix.de
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
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250324100008.346009-2-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 24/03/2025 11:00, Daniel Lezcano wrote:
> +
> +static int __init nxp_stm_clocksource_init(struct device *dev, const char *name,
> +					   void __iomem *base, struct clk *clk)
> +{
> +	struct stm_timer *stm_timer;
> +	int ret;
> +
> +	stm_timer = devm_kzalloc(dev, sizeof(*stm_timer), GFP_KERNEL);
> +	if (!stm_timer)
> +		return -ENOMEM;
> +
> +	stm_timer->base = base;
> +	stm_timer->rate = clk_get_rate(clk);
> +
> +	stm_timer->scs.cs.name = name;

You are aware that all node names will have exactly the same name? All
of them will be called "timer"?


> +	stm_timer->scs.cs.rating = 460;
> +	stm_timer->scs.cs.read = nxp_stm_clocksource_read;
> +	stm_timer->scs.cs.enable = nxp_stm_clocksource_enable;
> +	stm_timer->scs.cs.disable = nxp_stm_clocksource_disable;
> +	stm_timer->scs.cs.suspend = nxp_stm_clocksource_suspend;
> +	stm_timer->scs.cs.resume = nxp_stm_clocksource_resume;
> +	stm_timer->scs.cs.mask = CLOCKSOURCE_MASK(32);
> +	stm_timer->scs.cs.flags = CLOCK_SOURCE_IS_CONTINUOUS;
> +
> +	ret = clocksource_register_hz(&stm_timer->scs.cs, stm_timer->rate);
> +	if (ret)
> +		return ret;
> +
> +	stm_sched_clock = stm_timer;
> +
> +	sched_clock_register(nxp_stm_read_sched_clock, 32, stm_timer->rate);
> +
> +	dev_set_drvdata(dev, stm_timer);
> +
> +	dev_dbg(dev, "Registered clocksource %s\n", name);

Since all names will be the same, this makes little sense in debugging.
I guess you wanted one of the OF printk-formats for full node name.


> +
> +	return 0;
> +}
> +
> +static int nxp_stm_clockevent_read_counter(struct stm_timer *stm_timer)
> +{
> +	return readl(stm_timer->base + STM_CNT);
> +}
> +

...

> +
> +static int __init nxp_stm_timer_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	struct stm_instances *stm_instances;
> +	const char *name = of_node_full_name(np);
> +	void __iomem *base;
> +	int irq, ret;
> +	struct clk *clk;
> +
> +	stm_instances = (typeof(stm_instances))of_device_get_match_data(dev);

No, you *cannot* drop the const. It's there on purpose. Match data
should be const because it defines per variant differences. That's why
the prototype of of_device_get_match_data() has such return type.
You just want some global singleton, not match data.

> +	if (!stm_instances) {
> +		dev_err(dev, "No STM instances associated with a cpu");
> +		return -EINVAL;
> +	}
> +
> +	base = devm_of_iomap(dev, np, 0, NULL);
> +	if (IS_ERR(base)) {
> +		dev_err(dev, "Failed to iomap %pOFn\n", np);

You need to clean up the downstream code to match upstream. All of these
should be return dev_err_probe().

> +		return PTR_ERR(base);
> +	}
> +
> +	irq = irq_of_parse_and_map(np, 0);
> +	if (irq <= 0) {
> +		dev_err(dev, "Failed to parse and map IRQ: %d\n", irq);
> +		return -EINVAL;
> +	}
> +
> +	clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(clk)) {
> +		dev_err(dev, "Clock not found\n");

And this is clearly incorrect - spamming logs. Syntax is:
return dev_err_probe

> +		return PTR_ERR(clk);
> +	}
> +
> +	ret = clk_prepare_enable(clk);

Drop, devm_clk_get_enabled.

> +	if (ret) {
> +		dev_err(dev, "Failed to enable STM timer clock: %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (!stm_instances->clocksource && (stm_instances->features & STM_CLKSRC)) {
> +
> +		/*
> +		 * First probed STM will be a clocksource
> +		 */
> +		ret = nxp_stm_clocksource_init(dev, name, base, clk);
> +		if (ret)
> +			return ret;
> +		stm_instances->clocksource++;

That's racy. Devices can be brought async, ideally. This should be
rather idr or probably entire structure protected with a mutex.

> +
> +	} else if (!stm_instances->clockevent_broadcast &&
> +		   (stm_instances->features & STM_CLKEVT_BROADCAST)) {
> +
> +		/*
> +		 * Second probed STM will be a broadcast clockevent
> +		 */
> +		ret = nxp_stm_clockevent_broadcast_init(dev, name, base, irq, clk);
> +		if (ret)
> +			return ret;
> +		stm_instances->clockevent_broadcast++;
> +
> +	} else if (stm_instances->clockevent_per_cpu < num_possible_cpus() &&
> +		   (stm_instances->features & STM_CLKEVT_PER_CPU)) {
> +
> +		/*
> +		 * Next probed STM will be a per CPU clockevent, until
> +		 * we probe as much as we have CPUs available on the
> +		 * system, we do a partial initialization
> +		 */
> +		ret = nxp_stm_clockevent_per_cpu_init(dev, name, base, irq, clk,
> +						      stm_instances->clockevent_per_cpu);
> +		if (ret)
> +			return ret;
> +
> +		stm_instances->clockevent_per_cpu++;
> +
> +		/*
> +		 * The number of probed STM for per CPU clockevent is
> +		 * equal to the number of available CPUs on the
> +		 * system. We install the cpu hotplug to finish the
> +		 * initialization by registering the clockevents
> +		 */
> +		if (stm_instances->clockevent_per_cpu == num_possible_cpus()) {
> +			ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "STM timer:starting",
> +						nxp_stm_clockevent_starting_cpu, NULL);
> +			if (ret < 0)
> +				return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static struct stm_instances s32g_stm_instances = { .features = STM_CLKSRC | STM_CLKEVT_PER_CPU };

Missing const. Or misplaced - all file-scope static variables are
declared at the top.

> +
> +static const struct of_device_id nxp_stm_of_match[] = {
> +	{ .compatible = "nxp,s32g2-stm", &s32g_stm_instances },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, nxp_stm_of_match);
> +
> +static struct platform_driver nxp_stm_probe = {
> +	.probe	= nxp_stm_timer_probe,
> +	.driver	= {
> +		.name = "nxp-stm",
> +		.of_match_table = of_match_ptr(nxp_stm_of_match),

Drop of_match_ptr, you have here warnings.

> +	},
> +};
> +module_platform_driver(nxp_stm_probe);
> +
> +MODULE_DESCRIPTION("NXP System Timer Module driver");
> +MODULE_LICENSE("GPL");


Best regards,
Krzysztof

