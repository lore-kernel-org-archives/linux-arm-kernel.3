Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B95C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 10:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bB8LvUt/gLOBzJVAWx0XW5i+JKbkehvPw1Hnii/hCeY=; b=idybwAbOjCJlcE/kHz2NndhEV3
	nhTU2cNkH5GbIDm0TgOOhQ0btFxVsD/SUSI6g1TRlMfpypfORC5XrBmY6PeK0ZGKwyE+M/r8zZPYI
	2AjkUdQEpViMZlQOihelrfqdBKWUBxXLnSGTz/OHpPE5UuB4plQRgdBmISgHvtYJs+VTHwgEXzlRy
	1PudN1LST3JK1/jU1xrnAmgVONAh2KylRoznbjb6whPto1e1WdmmgWhztMQCVsfkiianR0MAdas76
	eQOerW0lFyEAlysMNqWkSeRzGpsK/4OPlDwtFR4IJithgzIbjAczYUbW4KYAnaD8Akmxj5ffLZwkL
	+5T/Q7gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txO7L-00000008EYz-30pO;
	Wed, 26 Mar 2025 10:36:15 +0000
Received: from mail-wm1-f42.google.com ([209.85.128.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txO2c-00000008Cli-0aKs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 10:31:23 +0000
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf257158fso44553185e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 03:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742985080; x=1743589880; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bB8LvUt/gLOBzJVAWx0XW5i+JKbkehvPw1Hnii/hCeY=;
        b=WenhONFWcWigrlzAtydtJBvMLCUAiOl1rr+ryBHFWuCduCkErl5kZr4Bo1A6y5Tgv7
         FkbAFdO2V6yA2kcWRoPWcIyehX+jaHYGqvCI7FHV8jhBxSUEjG8xACxnv7k7rhWSMpbY
         MHFSn1k1fhNMJ3hZkso/P6IRa76san8BWz7QC5fknEcvWZ2U1S92lCW1v1yiqQjnAfSd
         dYeon2dStYd5P17ffFT1UvwRgF9Tuvu24KzLSTRH2egpNehOywuhODAbg+5RjdPmm+8D
         cbqL3UynvheodwU9ii9d9z7ukwQEIrEm7OiZ9PPIwELE8NEczNcNyi84e1kQLs8Wv2sy
         rYkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742985080; x=1743589880;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bB8LvUt/gLOBzJVAWx0XW5i+JKbkehvPw1Hnii/hCeY=;
        b=moRnaKi2bZdt2M+aemEMpTZxaS7WEXkef6xM0JQAlfcouy0bdHTRxklDlOWgNcwfz9
         lNZ0slNXwfPMoICcFWJkw4cy8W6UlH19xTviIGRx4wN5KBy/USP16cjQnc6GNDc1t2p3
         UfRY6bD0BPAxe9oTSthR2wKc3EWIIV5LgB72iY6cDDpiJYJThoarzdTa0vHJJ1dCPiy+
         cl7M0XMZXZW2kP69u7g5gnTaB2R8c81RYb4JuvWWmyS5wzmbVD/UX69Gu5gLoN0Hp37h
         4dqCW0f95hE4wet/6Tldn/A8te9oCVk0xp04bh1v44HvBO9fy5Lb1XLRIW+grCo/w1nf
         YBxg==
X-Forwarded-Encrypted: i=1; AJvYcCUHErT3MYX19BsEuZXkeRufJ9FlJEGERFDddG0PiFU6G2tjsaOT6516+b9/3J4wYCecaDA9HNT9K+jlp6NAZH8k@lists.infradead.org
X-Gm-Message-State: AOJu0YwLW3Iy3qroXzsHqxJW9O9qnbVSGDEKn60rXV7gV4//JdC2t2uH
	rX+IeNJpancLcra/7YTGgV3800DNgLMfDzGcRfvmOwgrOUf6ANvIYcKcBQC54Hg=
X-Gm-Gg: ASbGnctbQtn0x+AeYLiDph5YdH8ZBjjAzJvg1o4Rne2f43wQogZebXb78TjfUnhy0Lf
	io3jIXoja+BxZdP7n0KsAHR5MuyBa3wU6wrhQVPM4IVUgCFPTtJYjvdp9AxWiKBI+lZbGO+B1TU
	80AuhdqR5Rv+87ARccbqx6G1QfVzCjOdtdON2S1eJcZ3bF/0WfJkZTf6lbvoAIfO16QHuRfkZFy
	ZEjaPLPOABm7biOaONFKapRYBn+Zwom0bavjsl+O0c/AVPrfJbhRiH94YOppVYgBL8q0xJZpbxA
	pquSL09TZqkvdTXX0XXSsjNkk2Kp7Lh1dszZ9samuWCKk2eETzQkm8yd38o2xRLrMMrck9/PO7q
	uSs/xx0GRzYlr4F4ftz0=
X-Google-Smtp-Source: AGHT+IFq7//HttPkhTtZsH26VLcgAbxZlTkYoXH35OF69Wj6ocNrllY3UQlBtg1F0RbqvI+UjYJiWg==
X-Received: by 2002:a05:600c:500f:b0:43c:f6c6:578c with SMTP id 5b1f17b1804b1-43d509f809bmr217231095e9.15.1742985079945;
        Wed, 26 Mar 2025 03:31:19 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3997f995778sm16523955f8f.11.2025.03.26.03.31.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 03:31:19 -0700 (PDT)
Message-ID: <16d02edf-181e-42a1-8b0f-cdef61109fbf@linaro.org>
Date: Wed, 26 Mar 2025 11:31:18 +0100
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
 <e8054f85-2a23-4ceb-8e1c-7cdfe7c87628@linaro.org>
 <a31a575b-8f6d-6317-f172-b4f8b1a5cda7@oss.nxp.com>
 <f1268261-c900-4adc-aefe-795f23faba59@linaro.org>
 <2d7b18bf-31ed-abfc-20db-7f5b54c812af@oss.nxp.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <2d7b18bf-31ed-abfc-20db-7f5b54c812af@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_033122_188089_0A259DCB 
X-CRM114-Status: GOOD (  33.88  )
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

On 26/03/2025 10:57, Ghennadi Procopciuc wrote:
> On 3/26/2025 11:19 AM, Daniel Lezcano wrote:
>> On 26/03/2025 08:44, Ghennadi Procopciuc wrote:
>>> On 3/25/2025 3:54 PM, Daniel Lezcano wrote:
>>>> On 25/03/2025 14:21, Ghennadi Procopciuc wrote:
>>>>> On 3/25/2025 2:51 PM, Daniel Lezcano wrote:
>>>>> [ ... ]
>>>>>>>>>>>> +static int __init nxp_stm_timer_probe(struct platform_device
>>>>>>>>>>>> *pdev)
>>>>>>>>>>>> +{
>>>>>>>>>>>> +    struct device *dev = &pdev->dev;
>>>>>>>>>>>> +    struct device_node *np = dev->of_node;
>>>>>>>>>>>> +    struct stm_instances *stm_instances;
>>>>>>>>>>>> +    const char *name = of_node_full_name(np);
>>>>>>>>>>>> +    void __iomem *base;
>>>>>>>>>>>> +    int irq, ret;
>>>>>>>>>>>> +    struct clk *clk;
>>>>>>>>>>>> +
>>>>>>>>>>>> +    stm_instances =
>>>>>>>>>>>> (typeof(stm_instances))of_device_get_match_data(dev);
>>>>>>>>>>>> +    if (!stm_instances) {
>>>>>>>>>>>> +        dev_err(dev, "No STM instances associated with a cpu");
>>>>>>>>>>>> +        return -EINVAL;
>>>>>>>>>>>> +    }
>>>>>>>>>>>> +
>>>>>>>>>>>> +    base = devm_of_iomap(dev, np, 0, NULL);
>>>>>>>>>>>> +    if (IS_ERR(base)) {
>>>>>>>>>>>> +        dev_err(dev, "Failed to iomap %pOFn\n", np);
>>>>>>>>>>>> +        return PTR_ERR(base);
>>>>>>>>>>>> +    }
>>>>>>>>>>>> +
>>>>>>>>>>>> +    irq = irq_of_parse_and_map(np, 0);
>>>>>>>>>>>> +    if (irq <= 0) {
>>>>>>>>>>>> +        dev_err(dev, "Failed to parse and map IRQ: %d\n", irq);
>>>>>>>>>>>> +        return -EINVAL;
>>>>>>>>>>>> +    }
>>>>>>>>>>>
>>>>>>>>>>>       From commit description:
>>>>>>>>>>>
>>>>>>>>>>>> The first probed STM is used as a clocksource, the second
>>>>>>>>>>>> will be
>>>>>>>>>>>> the
>>>>>>>>>>>> broadcast timer and the rest are used as a clockevent with the
>>>>>>>>>>>> affinity set to a CPU.
>>>>>>>>>>>
>>>>>>>>>>> Why is the interrupt mandatory when the node is probed as a
>>>>>>>>>>> clocksource?
>>>>>>>>>>
>>>>>>>>>> It relies on the DT description and it does not hurt to have a
>>>>>>>>>> consistent code path for clockevent / clocksource even if the
>>>>>>>>>> interrupt
>>>>>>>>>> is not requested for the clocksource later.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> If so, in my opinion, it would make sense to use the same STM
>>>>>>>>> instance
>>>>>>>>> for both the clocksource and broadcast clockevent, as both
>>>>>>>>> functions
>>>>>>>>> can
>>>>>>>>> be accommodated within a single STM instance, which will help
>>>>>>>>> reduce
>>>>>>>>> the
>>>>>>>>> number of STM instances used.
>>>>>>>>
>>>>>>>> The broadcast timer is stopped when it is unused which is the
>>>>>>>> case for
>>>>>>>> the s32 because there are no idle state powering down the local
>>>>>>>> timers.
>>>>>>>> They have to have be separated.
>>>>>>>>
>>>>>>>
>>>>>>> This wouldn't be the case if the STM is kept running/counting during
>>>>>>> the
>>>>>>> clock event setup, with only the clock event interrupt being disabled
>>>>>>> (CCR.CEN).
>>>>>>
>>>>>> Are you asking to use two different channels for the same STM
>>>>>> instance,
>>>>>> one for the clocksource and one for the clockevent ?
>>>>>>
>>>>>
>>>>> I suggested using the CNT register to obtain the count for the clock
>>>>> source, while using one of the STM channels for the clock event.
>>>>
>>>> Ah, ok.
>>>>
>>>> I think it is preferable to keep them separated to keep the code
>>>> modular. Given the number of STM on the platform, it does not hurt
>>>>
>>>
>>> The S32G2 and S32G3 are SoCs featuring a diverse set of cores. Linux is
>>> expected to run on Cortex-A53 cores, while other software stacks will
>>> operate on Cortex-M cores. The number of STM instances has been sized to
>>> include at most one instance per core. Allocating six instances (1 clock
>>> source, 1 broadcast clock event, and 4 clock events for all A53 cores)
>>> to Linux on the S32G2 leaves the M7 software stacks without adequate STM
>>> coverage.
>>
>> Given this description I'm wondering why one STM has to be used as a
>> clocksource if the STM_07 is already a TS one. And also, we can get rid
>> of the broadcast timer as there is no idle state forcing a switch to an
>> always-on timer.
> 
> Indeed, STM_07 can be used as a system clock source, but Linux should
> not assume ownership of it.
> 
>>
>> IIUC, on the S32g2 there are 4 x Cortex-A53 and 3 x Cortex-M3, that
>> means we need 7 timers.
>>
>> The system has 7 timers + a special one for timestamp.
>>
>> So if I follow the reasoning, the broadcast timer should not be used
>> otherwise one cortex-M3 will end up without a timer.
>>
> 
> On the S32G2, there are eight STM timers and STM_TS. Therefore, there
> should be enough instances to accommodate 4xA53 and 3xM7 cores.
> 
>> That leads us to one clocksource for the first per CPU timer initialized
>> or alternatively one STM instance == 1 clocksource and 1 clockevent
>> which makes things simpler
>>
> I'm not sure I understood the entire description. As I see it, two STM
> instances should be used to accommodate one clock source, a broadcast
> clock event, and four clock events—one per core.

What I meant is to do something simpler:

-----------------

cat /proc/interrupts

  16:       7891          0          0          0    GICv3  56 Level 
stm@4011c000
  17:          0       5326          0          0    GICv3  57 Level 
stm@40120000
  18:          3          0      16668          0    GICv3  58 Level 
stm@40124000
  19:          0          0          0       5152    GICv3  59 Level 
stm@40128000

------------------

cat /sys/devices/system/clockevents/clockevent*/current_device

stm@4011c000
stm@40120000
stm@40124000
stm@40128000

------------------

cat /sys/devices/system/clocksource/clocksource0/available_clocksource

stm@4011c000 stm@40120000 stm@40124000 stm@40128000 arch_sys_counter



On the S32G2: 4 STM instances used for one clocksource and one clockevent

On the S32G3: 8 STM instances used for one clocksource and one clockevent


Specific broadcast timer is not needed as the s32g system.


The resulting timer driver code is much simpler.


> E.g.
> STM_0
> 	- clocksource (based on CNT)
> 	- broadcast clock event (channel 0)
> 
> STM_1
> 	- Cortex-A53 0 (channel 0)
> 	- Cortex-A53 1 (channel 1)
> 	- Cortex-A53 2 (channel 2)
> 	- Cortex-A53 3 (channel 3)
> 


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

