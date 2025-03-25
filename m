Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B3CC36005
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 13:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gnl5RH7POTVxhZTqrexGViAgN1F/XxGfRRowwJehUVo=; b=B/paNtRYHUycfFSTF9Fz7D+Jw2
	W50//TeJoS2KilD4ndm/0YYeQOjxoBBXuKTNEjePMLGh66p9Kl9SQG03D/YRyb+Gzi6IhEwRKoTXq
	S6ZaJZyXx4JM9bqRuCvJwwCz8ZeXQPQXHysXyWwGve07n4eevpLpGrew5eJ4IYdD1ay2O109vT5Bf
	n9VQ8vAq4rZdT0YwyZHCaDUluw6bYOW8MRLWAOXxiKVkxybmJ6r78YuzB5Bk7EX/+QHSNxuWM11z6
	KNO72s0SJtb/ixba7nuvZ9zCNGG2nMQHWeWVkXPDkFtIGTpo6wWvISqzt01FgxoGYemmARAr3D3xB
	b02JwJ+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3w1-00000005xa4-0h6j;
	Tue, 25 Mar 2025 13:03:13 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3JW-00000005nmb-0lsn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 12:23:27 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43cf680d351so38705245e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 05:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742905404; x=1743510204; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gnl5RH7POTVxhZTqrexGViAgN1F/XxGfRRowwJehUVo=;
        b=PVqkIc/nW66H9F3KcQMDp6vWuGJ4yFBaG8IskEt73Mm6ttNTQBLRokV+vXbrFNc0T/
         VaRFySn617KJNV5TirILKeHwAOJEvk3lIuXo1H233T/DU8ZD1JZdoHofpH6dDBvO6VtZ
         z6207R+FTGUlpW2lf0o8l8midI8pBJyocrgfUxTCc+woLcqW2rp991PdH4NICWew9g00
         MAiqRzAn3UDE/0d05Q5+uLmhe67kT69iaBxSsqusPxsJx6lT2TYOvqxzKDxLDsohC7zq
         9TabqbrzPaMXe07zLNWaDxmykn14oY/QMb8Rop3ARkxvbyU9hM0+jl99e4NKTSWWJXzb
         ytyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742905404; x=1743510204;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gnl5RH7POTVxhZTqrexGViAgN1F/XxGfRRowwJehUVo=;
        b=wnhc6Gxz9/43vPxVOMNyk0QvB3dIX+6DmBCUNSCtAHQXPIlNhWp7uKz3+pisnaAGP5
         +SaCSEg3r3dhg4LrQxwAOlbL4wcn5oqHojyIwaVEQW2K6Ol/SzECUyD3WNl9rqwlGUBB
         8Y0HRz7yj7kHMDf9nq7MARPIR7Q5WABOkPusxKpkH3CP/LYhpE994KWkQEfHBLeo7HD1
         k5xED+VCGftVBnh4nh0J37VZZiQBpOd+hE+1LjV4+YbSbzEt6MkJdY3MaeVtzH3zRRkd
         huSknCn7JI+drCsZjogWAP4FFdjaDT5VlD2VNAG/w83D+z/BWxH2vRaSuakuQoqrkWH+
         jRbA==
X-Forwarded-Encrypted: i=1; AJvYcCWiEr8YLc10zwuDdUoy8M2brgJnPFSrABB2yh8jtrZ4hmWT/qZvJp9+A/jhyebDBdfR/BxkWJ1VuNvzMm/71N7k@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9ZgfAOHvCzIxAc7+CH6fz9d2QE0k8mN3K3gjA8dXduPPNhHbj
	tOtEwmpyF3zAH1LLvADGoHS/bQJFceG22t1B5C27dthW7H63Eg/WeVv6wUYu0v4=
X-Gm-Gg: ASbGncuwG5sNPg3aMRw7I7g6nD8m9M46zLuLFIXNdaazIAONLClFz1mZM+EmbCanrsi
	uwHn8qqcoU6AeICchdfo01y//Kn8E2SRpcPvm3HjNtbk0f+TdR97wp/erpHRDVxNzOQkv7cm49A
	L1nxU/DwMJID0K5rT4hEV3RBrRPEsRoSVNtLTfyj5KqjBKzYAQTetX+dQZqJYdVORWpJITwqWbG
	+y6bxzJHxgbAG04kkEOcmtlgFT17YfYYe2/bMJ2oZtcwq5QaL2RWjO/f0bKG7gXENatZI2qFHYS
	7f8GGJIzedQf1pZ2JDGaLsS3qbQOzVOsKVSgmLnRQ4+/uQuxtnzWLG/2jmSbpy5A2C/kvsDIKEu
	jF9bECOeP
X-Google-Smtp-Source: AGHT+IE6bRcBJovGsSP7syxDYUzmQ6H73XOh9NrMfUBBqcvJmW/fILYdlvhCAYwBYc/zAFfQY02Mbg==
X-Received: by 2002:a05:600c:a00b:b0:439:9434:4f3b with SMTP id 5b1f17b1804b1-43d503056cemr148450025e9.8.1742905404410;
        Tue, 25 Mar 2025 05:23:24 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d43f43e2asm204517715e9.11.2025.03.25.05.23.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 05:23:24 -0700 (PDT)
Message-ID: <1bf2d9ad-325e-4b1d-8440-ddbc90eabc67@linaro.org>
Date: Tue, 25 Mar 2025 13:23:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clocksource/drivers/nxp-timer: Add the System Timer
 Module for the s32g platform
To: Krzysztof Kozlowski <krzk@kernel.org>, tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, Thomas Fossati <thomas.fossati@linaro.org>,
 Larisa Grigore <Larisa.Grigore@nxp.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, dl-S32 <S32@nxp.com>
References: <20250324100008.346009-1-daniel.lezcano@linaro.org>
 <20250324100008.346009-2-daniel.lezcano@linaro.org>
 <bb7e4740-9608-4534-9c19-3ac066e2aa8f@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <bb7e4740-9608-4534-9c19-3ac066e2aa8f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_052326_238448_8BEF9C8C 
X-CRM114-Status: GOOD (  24.50  )
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


[Added s32@ list which I miss from the initial series]

On 25/03/2025 08:30, Krzysztof Kozlowski wrote:
> On 24/03/2025 11:00, Daniel Lezcano wrote:
>> +
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
> 
> You are aware that all node names will have exactly the same name? All
> of them will be called "timer"?

 From the caller const char *name = of_node_full_name(np);

The names are:

"clocksource: Switched to clocksource stm@4011c000"

Or:

  17:      24150          0          0          0    GICv3  57 Level 
stm@40120000
  18:          0      22680          0          0    GICv3  58 Level 
stm@40124000
  19:          0          0      24110          0    GICv3  59 Level 
stm@40128000
  20:          0          0          0      21164    GICv3  60 Level 
stm@4021c000

And:

cat /sys/devices/system/clocksource/clocksource0/current_clocksource
stm@4011c000

cat /sys/devices/system/clockevents/clockevent*/current_device
stm@40120000
stm@40124000
stm@40128000
stm@4021c000

[ ... ]

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
> 
> No, you *cannot* drop the const. It's there on purpose. Match data
> should be const because it defines per variant differences. That's why
> the prototype of of_device_get_match_data() has such return type.
> You just want some global singleton, not match data.
> 
>> +	if (!stm_instances) {
>> +		dev_err(dev, "No STM instances associated with a cpu");
>> +		return -EINVAL;
>> +	}
>> +
>> +	base = devm_of_iomap(dev, np, 0, NULL);
>> +	if (IS_ERR(base)) {
>> +		dev_err(dev, "Failed to iomap %pOFn\n", np);
> 
> You need to clean up the downstream code to match upstream. All of these
> should be return dev_err_probe().

Oh right, thanks for the reminder

>> +		return PTR_ERR(base);
>> +	}
>> +
>> +	irq = irq_of_parse_and_map(np, 0);
>> +	if (irq <= 0) {
>> +		dev_err(dev, "Failed to parse and map IRQ: %d\n", irq);
>> +		return -EINVAL;
>> +	}
>> +
>> +	clk = devm_clk_get(dev, NULL);
>> +	if (IS_ERR(clk)) {
>> +		dev_err(dev, "Clock not found\n");
> 
> And this is clearly incorrect - spamming logs. Syntax is:
> return dev_err_probe
> 
>> +		return PTR_ERR(clk);
>> +	}
>> +
>> +	ret = clk_prepare_enable(clk);
> 
> Drop, devm_clk_get_enabled.
> 
>> +	if (ret) {
>> +		dev_err(dev, "Failed to enable STM timer clock: %d\n", ret);
>> +		return ret;
>> +	}
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
> 
> That's racy. Devices can be brought async, ideally. This should be
> rather idr or probably entire structure protected with a mutex.

Mmh, interesting. I never had to think about this problem before

Do you know at what moment the probing is parallelized ?

>> +static struct stm_instances s32g_stm_instances = { .features = STM_CLKSRC | STM_CLKEVT_PER_CPU };
> 
> Missing const. Or misplaced - all file-scope static variables are
> declared at the top.
> 
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
> 
> Drop of_match_ptr, you have here warnings.
> 
>> +	},
>> +};
>> +module_platform_driver(nxp_stm_probe);
>> +
>> +MODULE_DESCRIPTION("NXP System Timer Module driver");
>> +MODULE_LICENSE("GPL");

Thanks for the review

   -- Daniel


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

