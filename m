Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B241C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 08:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jiFqr0OPCqHVXSpWzCqecK/S1S4l0jHxVTGQ1xBrzUE=; b=1PBDuPrga+cJdqNlbWX3Y7Ykw6
	79NzyOBeGGZF3MHq1ePtCx3862Isv345udJSVCxDL/meyfV11ioKbRW9jpBQAOgC298VZ53u8BEne
	jMHGk9MO1Ew7g31iUvlmbdaJlsVmYtZI0SEIJgkuFa9zuAERdtU7CCoshIp6JbtNdP1Un/3U71nrD
	JVW4Q4h0wq+n+NP6OsCIu3VXH0WSPvUkJDpGPpejhOus0E/9OxCNTAc8jDwJgsFKz4ir+UZjMAQFL
	xSD0wTYxMJ7ZO4SXRgF1Z/4+0HbQYxLfDbj1aB5XSRK+auuRxB54QVsyt/5ATkqVLec7vX19gJHs4
	vQM/Etyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhlRb-00000005Hrp-0Cmx;
	Fri, 01 Aug 2025 08:48:51 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhlEJ-00000005GRe-3vyU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 08:35:09 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3b79bddd604so988307f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Aug 2025 01:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754037306; x=1754642106; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jiFqr0OPCqHVXSpWzCqecK/S1S4l0jHxVTGQ1xBrzUE=;
        b=JujDWC+dnw8On80GWZFLp2xJgbH6CfcKApHRSSZZTXeWpSrzVdruaCUIlAvgaUKiMx
         i5JeTT4QIzZvUGRzGkVWRbLUBH723Tkj0a0D5YbstXek+VVcDpDQDxYjXIpQN6YAxChN
         7kwjmM7i2fXuzHEZoV+hdZqG/BFkpPGZps1Vj4QHEFN+rpXkbuLg7e+D35HXR1RFeRZS
         W3wWQaXc4yK03EEX6bpoEpNzORAfm2GAQDifKaS2genw3YNGtMWG6yGozks6PC4L//EF
         UUTLJiHP1nPL9Hh5xhNlCLf6Amyg+T3jYNnOrG7xUXNp/Q4Go2bdXbtELnE+wHLV3a6c
         QI4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754037306; x=1754642106;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jiFqr0OPCqHVXSpWzCqecK/S1S4l0jHxVTGQ1xBrzUE=;
        b=dQlI7AmaS7nstMl6WITgtR7gIwb4Ub3hGHMP1JPGuhqdHlVGVeIsaiDtVwbxVOraQI
         OTE5wV0xudVdKsHB3J4TD4I51apNMqlyxTUbB7VA8FuauVhIMoYIs13Ow4CJzD2WymCo
         fBTaEVNkt0+dv8G9YwTaMtQJUSEpaEL4VHbCZt9MOvCvD54iv1nxx7swLHiRJ7H9ubzH
         EQsa2pv0cdXyGr7exM92oGPiIC35y8OiIh0xWn3TKsRvPZeSelj9u0Sv9YjoSD7GLhSv
         AqSX9gIfcIxWKaGVeNDTnZbYzGl1EE5awEvk/KU/XDsOD6NE5Sbcoet+vr2lIOsCgbUY
         Rf0w==
X-Forwarded-Encrypted: i=1; AJvYcCXPpRwf5MvzOlhW0AqzWafpRo97bNWuBOCIQFVo32nGBwkwMIIfqgAN5Yh2n5UWsPNoOjvN3m4n7LcQrIx9AqwF@lists.infradead.org
X-Gm-Message-State: AOJu0YwYX9n3lMS2lkBFcuPDIXt3BQnzTbcLIKM+NrI38H4AOlBcVCsL
	3EnQ2U/QpEhIMW4NH3fpNr2p5DyXh8G3J3EO62W/WQpIWr7/iDC+EvVpT1wcnFbjo5I=
X-Gm-Gg: ASbGncuJwqhN3ulaucbGBRQBWPS8O8plszVcmRR4XQm8S5c3XlJn4ahEPbC1zsQ+RQg
	d9sKhYJ7qXhSACfT6P3VmzzxJTL4VbVJ5X6SG6Ib9haIzllyO5yL1CnoHk9sIXakZhqO+v6/HFG
	+hltuSUsAFSQpzbmhHNlNl45D9zuk/nm5zSuIqGfEjXxtQK9Y9MSQToD4qGaPj7w6KkwuuLZtUp
	BJw1I4kO9tomGxjxL3HWhS9BRVKGHPjy5JYMoMyStQpTcENVrlSdJGCrkrtxaYALNgWh8c7cs9D
	5eJIzu/Gn2cRlaL6AsfRX1WbtbsApjsAG3S7jeu0ChFa8Ri3weTxtuX0yCrrHpvKgoBF1sI95ug
	B8F/oiCO7oTbxqI4PSIzrROkFggPMgPFJEs0kS1hbM268a1gfGIeadTNBOUBCsQ==
X-Google-Smtp-Source: AGHT+IGS+73xkShFl6cO1Qu7hyyuX9oTyEOMrN6GMT2KH3N0L9G6LCMIuM6NsKe0gCwLrUaUqn7Ybg==
X-Received: by 2002:a05:6000:2884:b0:3b7:99cb:16ed with SMTP id ffacd0b85a97d-3b799cb1a28mr6844043f8f.40.1754037306324;
        Fri, 01 Aug 2025 01:35:06 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-458953f8e02sm92820875e9.32.2025.08.01.01.35.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Aug 2025 01:35:05 -0700 (PDT)
Message-ID: <164402ad-2762-4d6b-aa34-38ff1b506600@linaro.org>
Date: Fri, 1 Aug 2025 10:35:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] arm64: dts: s32g2: Add the STM description
To: Frank Li <Frank.li@nxp.com>
Cc: mbrugger@suse.com, chester62515@gmail.com,
 ghennadi.procopciuc@oss.nxp.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, s32@nxp.com, kernel@pengutronix.de,
 festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 Thomas Fossati <thomas.fossati@linaro.org>
References: <20250730195022.449894-1-daniel.lezcano@linaro.org>
 <20250730195022.449894-2-daniel.lezcano@linaro.org>
 <aIp+XTCSpNGee2qx@lizhi-Precision-Tower-5810>
 <5be6d858-01e1-4c2d-bd5c-0e3385251af7@linaro.org>
 <aIv6L30mf5bzUqup@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <aIv6L30mf5bzUqup@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_013507_985266_3C3755EB 
X-CRM114-Status: GOOD (  14.18  )
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

On 01/08/2025 01:20, Frank Li wrote:
> On Wed, Jul 30, 2025 at 11:15:40PM +0200, Daniel Lezcano wrote:

[ ... ]

>>>> +			compatible = "nxp,s32g2-stm";
>>>> +			reg = <0x4011c000 0x3000>;
>>>> +			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
>>>> +			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
>>>> +			clock-names = "counter", "module", "register";
>>>> +			status = "disabled";
>>>
>>> why not default enable.
>>
>> The S32G2 and S32G3 can have different variants with 2, 4, 8 Cortex-A53 and
>> 3 or 4 Cortex-M7. We enable the same number of CPUs present on the system.
>>
>> AFAIU:
>> 	S32G233A : 2 x Cortex-A53
>> 	S32G274A : 4 x Cortex-A53
>>
>> 	S32G399A : 8 x Cortex-A53
>> 	S32G379A : 4 x Cortex-A53
>>
>> Otherwise we would have to do the opposite, that is disable the unused ones
>> in the s32g274a-rdb2.dts, s32g399a-rdb3.dts and other dts which include the
>> s32g2.dtsi and s32g3.dtsi.
>>
> 
> That's fine by default disabled. but what's impact if it is enable but no
> one use it?

At the first glance I would say we call the probe function for nothing, 
so adding an extra overhead. When repeated into multiple drivers that 
increases the boot time significantly. It is certainly a good practice 
as a rule of thumb to enable only the ones we really need.

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

