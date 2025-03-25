Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D84C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 15:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ijCZlw8abnNdrfWlLDyC8qGCl0jM46CNzFHxUo7UrwI=; b=IM4gQZf+S2xHta9G7ZDTwz8sIA
	2XdUuDhINN2MUWRhNau/44IE27YAJUp9XEZJ84O1bf0669K5yHr4g5QymHjKLHWYZ8Y9ZwjBeuXeU
	Cn5cma1R5Ty9jRPapCihT8ay2s+k+A80pyUCdO/GDdBjgnPcA54Dd/pC+yDf1GOrmycaZa6prNG7L
	HFqvG61zYLeHh/TqnCKn2X0RsOu4DMHHn/3SMKiBfu6L80/oo8XIgff8SEVQZJ4N0cdAL869SUb2m
	W2VAuFPVigSPoS8uipFIyf/IfCobWfCAWFIF04fw8yoc1H81LMKp0FI33tf43DlgYww+GvA1bUiOn
	bi9QqiBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx5tP-00000006HvL-3IG8;
	Tue, 25 Mar 2025 15:08:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4jn-000000067b9-0C4u
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 25 Mar 2025 13:54:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ijCZlw8abnNdrfWlLDyC8qGCl0jM46CNzFHxUo7UrwI=; b=hOiZxXE6PJqTUMjRMmM6iV7XPN
	HHtMafQZ8c/ivMzZ1hxnJo7l8sWsW9elyRlOFjmwjEQKaVoBmiVxBy4iMrdbVivNyCBa3bUAfN0uR
	gdORvGyp1XYFt+rqixfGHRdBKbG/STskOJqNSJIIyfPu6tsDbGtsQFhMWED8c5mel4r112cDv/8M4
	0w06JU+59sLa2WeOsKGtsPSDUqwD/Dr6AaFlaLu0MIdBhFc10RQA1Ea3S22ZVjXgWwSGXWZpZC4Yx
	cVCUcySND95SFRJKzuXJ9naga5SaRuA9qrFUgc2zD+OGyxbu05r5gy0NAyOD9X3bHKhNI9H8SxsSw
	AX45ACTw==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx4ji-00000005UJN-0UQQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 13:54:37 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso59239575e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 06:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742910868; x=1743515668; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ijCZlw8abnNdrfWlLDyC8qGCl0jM46CNzFHxUo7UrwI=;
        b=sBmBunFLE8im/dDH28guI1FDvHYxBtB+6iTTY7gsVnXb1Gprb4Tv7BMWTMHNfBlFKR
         YlYOstNl56vFFxM6V9+aMmyj6BPbUMISwkPgdgDRuYRU69b8bHxfn3ag7bcjOIV6BiaZ
         9XKwtYNJi3jhcQe1CDfLnbegGkm9Kyum50hbbnMyWOChMUmw96EMXDPhIWkKWt0Tm2Ie
         fzAL/yYUNQev9jYadUB0KV7lY81IMBQUO1Dddyv1ZQny5vTqZE59fKsZQfdsSkcmZscS
         d/jbYQHrg/819jxP7uZxsjFwi0p8MMb+jXJXe0oL94n1hnnLhpfvALb86HGGULmcufP5
         oYxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742910868; x=1743515668;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ijCZlw8abnNdrfWlLDyC8qGCl0jM46CNzFHxUo7UrwI=;
        b=njBcJlZQWXO2tU8d00Aq3Wy+9XNpwSisrLCe1ay1i63eK2mVjEjFH8e2/1h4V8jOr5
         iSMmYbjWCd8d91bqCe5WOuaRubJAToIiCTqtuaW8DH32UTw+SnKs9R4wzK0ib/QaWc1p
         RhlrNoUYsuLWRzgY4Ce3YqducGTzi+aq/cWXs6mNtAu6Z/VjyNu74YNQYieLJbitEVdQ
         GNwpreR/3ULwD6x/SmlnVoZL7DuFfHxFt2eEd5U1F75T3wsw48Adv8cOpIOO9vLoMmr1
         HoAC+Fo14pT72JYZQnzzXryn3N3SvkgqVB23nvoqbHbtQSxpHF/FYncOwi6w75p6Nay2
         ADZg==
X-Forwarded-Encrypted: i=1; AJvYcCVvOlDv4xicbWC1w9Vj6lDDO56cqpOVvVZZiTertzMlWR/Oek9XcTt39z6p8MRXXXY4Llvih/P/j8/D3k/2MljB@lists.infradead.org
X-Gm-Message-State: AOJu0YxO5r42JT6rkYzvGWUvdDyFicq1q9sfAvcTeHk2fSuK2nT97PEc
	Ui4T+dy/im/g8TC0dVmOJdgxvHvTLO10sI4QB6HJDTE9bnW7pxi//gnHuTazbkk=
X-Gm-Gg: ASbGncvYTQQn1XDsNiae7FzA5EEIXOpuzYXaeGj76NKaNh25/b9wjSzZYBFEOSjwv7k
	vZmsHfNJL1xpS/JLf+bmgD2nPK1ipRakbCfnljP8bu/iHeZpj4RfSChknGhz3gTqxoWkDf18GwT
	iJKM/95WYZSSiqtZUzdSNNFGNoXpDKazYw+sR2OHxUmsvIkHtSxLZ4Q2irwhVwOrrUHb6sphRL4
	3U7ovknJ7YWKs9k/cEKQK/Hivlu2ezdUs6KpP6S056RDDo+HlSe02FrhpRK27Ydn7WvGxE6VHAK
	rqNuERw0HuUaTLHs4Me4/JrXEmE6PixTiRxwAzQffQQzZgveDpoqnENo3517NAcVgaEQQwr2L75
	52QyQCihPBz/gI6b21wU=
X-Google-Smtp-Source: AGHT+IFxtTjkR1rjlcOGc3o02TWz8/EihwAEdC3O1L0fXu9zmvxKQn66+P0PWx+0RFvFRJ5mc4A03Q==
X-Received: by 2002:a05:6000:1fa4:b0:391:952:c758 with SMTP id ffacd0b85a97d-3997f8f78a9mr13996895f8f.6.1742910868103;
        Tue, 25 Mar 2025 06:54:28 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d4fd18505sm150051955e9.11.2025.03.25.06.54.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 06:54:27 -0700 (PDT)
Message-ID: <e8054f85-2a23-4ceb-8e1c-7cdfe7c87628@linaro.org>
Date: Tue, 25 Mar 2025 14:54:26 +0100
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
 <cc2dd75c-e279-4e55-ab88-75498e93146a@linaro.org>
 <50d2c651-746e-4ddd-4036-f72742a622f8@oss.nxp.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <50d2c651-746e-4ddd-4036-f72742a622f8@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_135434_249648_6A041353 
X-CRM114-Status: GOOD (  22.18  )
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

On 25/03/2025 14:21, Ghennadi Procopciuc wrote:
> On 3/25/2025 2:51 PM, Daniel Lezcano wrote:
> [ ... ]
>>>>>>>> +static int __init nxp_stm_timer_probe(struct platform_device *pdev)
>>>>>>>> +{
>>>>>>>> +    struct device *dev = &pdev->dev;
>>>>>>>> +    struct device_node *np = dev->of_node;
>>>>>>>> +    struct stm_instances *stm_instances;
>>>>>>>> +    const char *name = of_node_full_name(np);
>>>>>>>> +    void __iomem *base;
>>>>>>>> +    int irq, ret;
>>>>>>>> +    struct clk *clk;
>>>>>>>> +
>>>>>>>> +    stm_instances =
>>>>>>>> (typeof(stm_instances))of_device_get_match_data(dev);
>>>>>>>> +    if (!stm_instances) {
>>>>>>>> +        dev_err(dev, "No STM instances associated with a cpu");
>>>>>>>> +        return -EINVAL;
>>>>>>>> +    }
>>>>>>>> +
>>>>>>>> +    base = devm_of_iomap(dev, np, 0, NULL);
>>>>>>>> +    if (IS_ERR(base)) {
>>>>>>>> +        dev_err(dev, "Failed to iomap %pOFn\n", np);
>>>>>>>> +        return PTR_ERR(base);
>>>>>>>> +    }
>>>>>>>> +
>>>>>>>> +    irq = irq_of_parse_and_map(np, 0);
>>>>>>>> +    if (irq <= 0) {
>>>>>>>> +        dev_err(dev, "Failed to parse and map IRQ: %d\n", irq);
>>>>>>>> +        return -EINVAL;
>>>>>>>> +    }
>>>>>>>
>>>>>>>     From commit description:
>>>>>>>
>>>>>>>> The first probed STM is used as a clocksource, the second will be
>>>>>>>> the
>>>>>>>> broadcast timer and the rest are used as a clockevent with the
>>>>>>>> affinity set to a CPU.
>>>>>>>
>>>>>>> Why is the interrupt mandatory when the node is probed as a
>>>>>>> clocksource?
>>>>>>
>>>>>> It relies on the DT description and it does not hurt to have a
>>>>>> consistent code path for clockevent / clocksource even if the
>>>>>> interrupt
>>>>>> is not requested for the clocksource later.
>>>>>>
>>>>>
>>>>> If so, in my opinion, it would make sense to use the same STM instance
>>>>> for both the clocksource and broadcast clockevent, as both functions
>>>>> can
>>>>> be accommodated within a single STM instance, which will help reduce
>>>>> the
>>>>> number of STM instances used.
>>>>
>>>> The broadcast timer is stopped when it is unused which is the case for
>>>> the s32 because there are no idle state powering down the local timers.
>>>> They have to have be separated.
>>>>
>>>
>>> This wouldn't be the case if the STM is kept running/counting during the
>>> clock event setup, with only the clock event interrupt being disabled
>>> (CCR.CEN).
>>
>> Are you asking to use two different channels for the same STM instance,
>> one for the clocksource and one for the clockevent ?
>>
> 
> I suggested using the CNT register to obtain the count for the clock
> source, while using one of the STM channels for the clock event.

Ah, ok.

I think it is preferable to keep them separated to keep the code 
modular. Given the number of STM on the platform, it does not hurt

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

