Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F980C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 21:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SQ3CB5Di8XupjMhTVhqFBTkn93P4HElyS0DfwyXNeNs=; b=Ye3yP05QRQOuCH4NZYddhb5+dK
	zk9ROHQrV8J1VsiLG+cMfEZz3skZ+fAm80NAF9KOHNV5QpdSGZwSuHTi0OTW1exYePTGlWaSh8eWi
	Psy5fkOH8H3iTlMTJq7n87LK3Pz235/4yWp73QhaZa6zx6D1a98dZjDU8RH1y4prALUBp7IV2MhAZ
	klQUFVZ0N9J4QP9VYSfcteGJvXUDtl1Hkuntsc3Hm4LsghjcQ87/YSA7oeYJjRkJKwnpjatpYALtF
	vwPESguw/93DnPAah/nxzleu+J3T8wF5qEU2Ro6J04xHUqXZK8fvSuQ0y1FOmKdyx7RakNjESs5YP
	4G6F3M4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhEVz-00000002UuH-1QNm;
	Wed, 30 Jul 2025 21:39:11 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhE9I-00000002Svw-1N0N
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 21:15:45 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3b78d13bf10so299535f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 14:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753910143; x=1754514943; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SQ3CB5Di8XupjMhTVhqFBTkn93P4HElyS0DfwyXNeNs=;
        b=GVdE/OFHRCAgEccFkc0FdVBLf2856yz2WmWuJZpO8dEeOD0Y4uTXXXxsYgeJSeMBdf
         epJGreDWVjff7a47ZmkTBFm8SeIW/kJOdx/qnCmAlxHgjXpokQlxvqyXWuONatTXoUXE
         JiC65k+Io97UFXLmZNjyr1pfN3C1sisb7/4VhcAQc9kdCycMMqUMjvF7B56Cpfqak/A7
         QOsvsGUDy65x77uAaSt0+0eym2sbRkCU0SMFPO7QzlSqqeAR7gQbKO3NsjZvt8/YGhTl
         83uFLMhEbjSuhQajBcW59KlIIuCuGC3oPI+/0Q5KjcC577VTiwj3uMDrlDTj4Nuc7I4a
         54Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753910143; x=1754514943;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SQ3CB5Di8XupjMhTVhqFBTkn93P4HElyS0DfwyXNeNs=;
        b=Uo4q2TsCTJlCpwUKg0xWVf9yqELsINWNe/pWNhGJah6jIXFFv6Jq7kWLmSCukSLC+e
         zbCg0DcI81v8P4bg0SL+KZPeeK0by21nhFoW8DUt708vDJV9VTZ6NbTMDeEGniF4bmHK
         SLG3jJ13sQObQu8Ak8JL4GijGY1VHX8AUxcM+hY6DmxIwuCzC0/UQK5qmrIUNTBxrlNr
         Jzl0lrD1nT1a1Vcy3d0IeOJOCGxkwB476Sx1U/CqNsauWDe6Y9/u476HW6ESv0fE03IV
         cBa3+Ns+p6NVGnURVVTD1MFlKnXM0QzQj/LAEzrFy6vtyIlHSpOB6eXtNVmb+vt0qZgC
         Vgwg==
X-Forwarded-Encrypted: i=1; AJvYcCUR1T9xhVZsiFFYGEv+5Q8YAJvtcETGAZxJsH3x27kDwVOKbZBIEDiWI8EzQncns6/DYz9+W1jwn1btLoCkRn36@lists.infradead.org
X-Gm-Message-State: AOJu0YxC06qGBovz3LbURHwmzdg/nNFkqb/5tfOM15J+HkMO2ixUaR7X
	LEgfs88j7SugYJOEEeCy+M4e4Ocu6vESZeydxWY/B4u2NRMullRfUGHH640SuqUhMtA=
X-Gm-Gg: ASbGncswDqKTYwW6XkOoCus0dBagHP6jU5WlHVovAqyvqsOZq1C5qZFpZmGrkbGz3hg
	46qAqYuGeuIqxUG3GousWDwx8PuUUFWP2cdGiOzonjdmmpgGkbNkmE6LzwFr5oWYQyHm1WGpoDE
	4dwOX0juR9QZBXsoGoHNsgGfl5r0Qex0MPkYeW3AmcRHiLifjnjmm+8m26d4DR6xQJ7bdn8bipS
	Nz1J7aORvveW7EIjWIvg4AXiAhHyMGVXaSZZKQ2sUG2KjQwgb1ZZS4KVJY6qfnT5lbZ95rZXUjP
	ush/y3J6dhL127wREg8AG5BAdsF3j8MjMMPz3wjXY1NpN2NITQMJ5AS8V7rNDclwBPMKx3OyGb3
	tugC3KdqlefJn4W6BTQVdXfPUhnOlgUr2oy2MIE+uzAgyBKBfmYtGXmUilobOOA==
X-Google-Smtp-Source: AGHT+IGiGhxu3QjHLE0SDvEDQUGCIkL2WCDhj7kxvNBJ2aCm+04aHd/hjhoJsotzbvOt/yI5531MXw==
X-Received: by 2002:adf:fa41:0:b0:3b5:e6bf:8379 with SMTP id ffacd0b85a97d-3b79502977bmr3012564f8f.28.1753910142356;
        Wed, 30 Jul 2025 14:15:42 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b79c4533f1sm122572f8f.42.2025.07.30.14.15.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 14:15:41 -0700 (PDT)
Message-ID: <5be6d858-01e1-4c2d-bd5c-0e3385251af7@linaro.org>
Date: Wed, 30 Jul 2025 23:15:40 +0200
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
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <aIp+XTCSpNGee2qx@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_141544_367898_A478F7AD 
X-CRM114-Status: GOOD (  19.56  )
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


Hi Frank,

thanks for the reviews,

On 30/07/2025 22:19, Frank Li wrote:
> On Wed, Jul 30, 2025 at 09:50:14PM +0200, Daniel Lezcano wrote:
> 
> I think replace all 'description' with 'node' is easy to read.

Sure

>> The s32g2 has a STM module containing 8 timers. Each timer has a
>> dedicated interrupt and share the same clock.
>>
>> Add the timers STM0->STM6 description for the s32g2 SoC. The STM7 is
>> not added because it is slightly different and needs an extra property
>> which will be added later when supported by the driver.
>>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>> Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>> Cc: Thomas Fossati <thomas.fossati@linaro.org>
>> ---
>>   arch/arm64/boot/dts/freescale/s32g2.dtsi | 63 ++++++++++++++++++++++++
>>   1 file changed, 63 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
>> index ea1456d361a3..3e775d030e37 100644
>> --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
>> @@ -503,5 +503,68 @@ gic: interrupt-controller@50800000 {
>>   			interrupt-controller;
>>   			#interrupt-cells = <3>;
>>   		};
>> +
>> +		stm0: timer@4011c000 {
> 
> keep order according to address.
> 
> 4011c000 should less than 50800000.

Ah, sure. I'll fix that.

>> +			compatible = "nxp,s32g2-stm";
>> +			reg = <0x4011c000 0x3000>;
>> +			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
>> +			clock-names = "counter", "module", "register";
>> +			status = "disabled";
> 
> why not default enable.

The S32G2 and S32G3 can have different variants with 2, 4, 8 Cortex-A53 
and 3 or 4 Cortex-M7. We enable the same number of CPUs present on the 
system.

AFAIU:
	S32G233A : 2 x Cortex-A53
	S32G274A : 4 x Cortex-A53

	S32G399A : 8 x Cortex-A53
	S32G379A : 4 x Cortex-A53

Otherwise we would have to do the opposite, that is disable the unused 
ones in the s32g274a-rdb2.dts, s32g399a-rdb3.dts and other dts which 
include the s32g2.dtsi and s32g3.dtsi.


>> +		};
>> +
>> +		stm1: timer@40120000 {
>> +			compatible = "nxp,s32g2-stm";
>> +			reg = <0x40120000 0x3000>;
>> +			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
>> +			clock-names = "counter", "module", "register";
>> +			status = "disabled";
>> +		};
>> +
>> +		stm2: timer@40124000 {
>> +			compatible = "nxp,s32g2-stm";
>> +			reg = <0x40124000 0x3000>;
>> +			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
>> +			clock-names = "counter", "module", "register";
>> +			status = "disabled";
>> +		};
>> +
>> +		stm3: timer@40128000 {
>> +			compatible = "nxp,s32g2-stm";
>> +			reg = <0x40128000 0x3000>;
>> +			interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
>> +			clock-names = "counter", "module", "register";
>> +			status = "disabled";
>> +		};
>> +
>> +		stm4: timer@4021c000 {
>> +			compatible = "nxp,s32g2-stm";
>> +			reg = <0x4021c000 0x3000>;
>> +			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
>> +			clock-names = "counter", "module", "register";
>> +			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
>> +			status = "disabled";
>> +		};
>> +
>> +		stm5: timer@40220000 {
>> +			compatible = "nxp,s32g2-stm";
>> +			reg = <0x40220000 0x3000>;
>> +			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
>> +			clock-names = "counter", "module", "register";
>> +			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
>> +			status = "disabled";
>> +		};
>> +
>> +		stm6: timer@40224000 {
>> +			compatible = "nxp,s32g2-stm";
>> +			reg = <0x40224000 0x3000>;
>> +			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
>> +			clock-names = "counter", "module", "register";
>> +			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
>> +			status = "disabled";
>> +		};
>>   	};
>>   };
>> --
>> 2.43.0
>>


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

