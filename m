Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B216C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 10:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u+DNp9QMgdrRGLxMsL46W/r+9G/+hiEbxecdzU4iISI=; b=SQqHVb4G+guwoXq1rYbGbmp5+T
	n09jkYsLulKzIWxQTRReYxE/t1fRIR1nTPRLLtdTW4kus994sWMICNMuafDyv83xOZTkV+1FkZJ8a
	Y7rRY7GxeDU28FCa3911tR1g+UpaDnXpkXwgOfKqMzZwgOlxv2XRWCHthsd8mIDkzuUa3NcE/o47c
	P6P7CwfdZr6TU7t9CMUsqRhsLRlxqXNiYKHbfoAWHopZ6jqdx3+lZdEr3niCxan5rbTSfZE2+GR9S
	yGmSRWPDOE9LlcS03zdgdYX0MJcmBdkLCyCsdQn+wgh7EKAyxxObSGLYW1ZMBEUJe190kcpXRYtMW
	mVi3+Bcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txNoF-000000089M9-1wMD;
	Wed, 26 Mar 2025 10:16:31 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txNmU-00000008938-0gLY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 10:14:45 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso68778125e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 03:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742984080; x=1743588880; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u+DNp9QMgdrRGLxMsL46W/r+9G/+hiEbxecdzU4iISI=;
        b=KSjoM3BPmFBMXuRy0Pu6eGyCVVwfPNU7Z+K6ihMVD8xKp1zwkPERCG6G7owy6GTj/r
         2drfsOU1z8p1P9Ca3nYwUOP3J69RLjeYwEdXKOt3anKLn9N2retM+/EcEATQEeXoac0N
         PL3dDEJyjNENHAYjaClQHyRLcV46dwyuP8ORibiaRTn12shyBjlPBbnSVJtxVutYCblg
         wnBNh7OsvJe1DeBe02Y6G2mCGses/dJ/qiB2jwHjYbZme9YrRqDzAox+MOlZmQFuwbct
         axTmGMWFHCdJJ+vfu1OX1QMbCd+YkiJJMqmVMcfQNf2pGUAQSMquzgPpclofsFp+EE52
         dk5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742984080; x=1743588880;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u+DNp9QMgdrRGLxMsL46W/r+9G/+hiEbxecdzU4iISI=;
        b=cgdjBDt0l0JGJoNRR7nxWj9WJ8f1OQL4rBPANE1cisXwBr/RM4+R+LbOAvF+bxpk7L
         8YjV1SydvDf0qKlNaCzVqvJ1XYK1Ud3U/8LRFzH2VRx+g9DqNnPvPy7EHSQnDiGFqEUV
         jA7Iv0MQivLrfogvkfmz0TdS0EVqMgg6vaUjwpDN1pfuGKUJwYz6MGZiAq6HQeB82h46
         sG/vx2sYins0Pe/yrLxxyoIwDt+yZ3+xEtAFVP/cD2GcY2eiV1DvNoA2XuHSWUvYeuey
         oWOJDxPngJFPjYb+1DgRXbM1ynq69iGU289OekK5Fy8sH3+4+TgA2gNcXoRwXihzM7Xa
         SzNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWM6+rectfOr7QNo3IrhVAVw8pNftYMjh0tb6/IFI4elYFnCYxNjxQBmKipsV9DZxyFa/0XKXPGV7vsftwj4gR3@lists.infradead.org
X-Gm-Message-State: AOJu0Yy57ak5K9ZLI455LlB2B4scsp1hcIhjU3fH4fg3ZAkToM8KEioY
	n0nkN2uwkvxHUqqv+f9hCk3/QNZtmOQBgPkzBEOfgVzCJBLmjvnftLWE6wPTazW7k5gHlz8P80M
	eq7A=
X-Gm-Gg: ASbGncvkib/kXFlVrR3oSr6M1+n0VaAyaXPvHMXxLVtXghIDMfo0ezqgp+RTtiLQbGi
	5fUyWCCw7EauERjfn8rwAQoweJ65/0JIejDbbanl027P0BKbkOOzAsoHDacyN2knJ/wM8xtgEup
	fTWGJ5f1tXchiiRzE9hGHYf5Vmw6yJwJCTGxdNMRearZGNQbFDiIOxTJqFqFBl2xFuY3pw1WtGI
	fJitTzYuntoqSiB5FIZr8pAWb6AkBSEr0wbNNgAwiu2zWW81hXi22/w2b+jRaTryjgb1YJnUiwT
	KVxje08m7Vm0GV4PPyovp/g2EK4BCEzFQ+6gV+QDy+bO6juNb7RM2kHjOq3HqtXJfxzpxsSYZZN
	DxPimuA/0MtxmtbA+
X-Google-Smtp-Source: AGHT+IHwhUQzzlTOSTisycIZUmQB3vcpLzOCNhJ8f/5tktjjSbuVrOP11IMJCJMu5JzNW6Sn0rBjNw==
X-Received: by 2002:a05:600c:1e07:b0:43c:fdbe:439b with SMTP id 5b1f17b1804b1-43d509e374bmr207124305e9.4.1742984079808;
        Wed, 26 Mar 2025 03:14:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:5ee:79d0:9b00:d804:1c3a:7697? ([2a01:e0a:5ee:79d0:9b00:d804:1c3a:7697])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fdbcfaasm176097065e9.35.2025.03.26.03.14.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 03:14:39 -0700 (PDT)
Message-ID: <8fde6af6-baaa-4f26-b9c0-a17ebcb67073@baylibre.com>
Date: Wed, 26 Mar 2025 11:14:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2] arm64: dts: mediatek: add mmc2 support for
 mt8365-evk
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, macpaul.Lin@mediatek.com
Cc: vsatoes@baylibre.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250109-mmc2-support-v2-1-5f660c809610@baylibre.com>
 <ecd8a46e-0f87-498e-8a12-fdeae6f5791d@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <ecd8a46e-0f87-498e-8a12-fdeae6f5791d@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_031442_341019_43F50A20 
X-CRM114-Status: GOOD (  21.03  )
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

Hello Angelo,

Thanks for the review :D

I've some comment below:

On 24/03/2025 15:09, AngeloGioacchino Del Regno wrote:
> Il 24/03/25 14:54, Alexandre Mergnat ha scritto:
>> Adds support for the MMC2 interface on the MT8365 EVK board.
>> It introduces a fixed regulator for the MMC2 VDD33 supply and configures
>> the MMC2 node with a 4-bit bus width, high-speed capabilities, UHS
>> modes, and appropriate power supplies. Enabled SDIO IRQ, wakeup source,
>> and kept power during suspend (to save firmware module) for wireless
>> chip functionality.
>>
>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>> ---
>> Changes in v2:
>> - Apply alphabetical order to pinctrl property items.
>> - Improve commit message
>> - Link to v1: https://lore.kernel.org/r/20250109-mmc2-support-v1-1-9b9d1b1ae35d@baylibre.com
>> ---
>>   arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 103 +++++++++++++++++++++++++---
>>   1 file changed, 94 insertions(+), 9 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts 
>> b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
>> index 7d90112a7e274..a87f1b3ed6500 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
>> +++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
>> @@ -53,6 +53,15 @@ memory@40000000 {
>>           reg = <0 0x40000000 0 0xc0000000>;
>>       };
>> +    mmc2_vdd33: mmc2_vdd33-regulator {
>> +        compatible = "regulator-fixed";
>> +        regulator-name = "mmc2_vdd33";
> 
> mmc2-vdd33 please

Ok

> 
>> +        regulator-min-microvolt = <3300000>;
>> +        regulator-max-microvolt = <3300000>;
>> +        gpio = <&pio 121 0>;
>> +        enable-active-high;
>> +    };
>> +
>>       usb_otg_vbus: regulator-0 {
>>           compatible = "regulator-fixed";
>>           regulator-name = "otg_vbus";

Then, I will change this too.

>> @@ -197,6 +206,28 @@ &mmc1 {
>>       status = "okay";
>>   };
>> +&mmc2 {
>> +    assigned-clock-parents = <&topckgen CLK_TOP_MSDCPLL>;
>> +    assigned-clocks = <&topckgen CLK_TOP_MSDC50_2_SEL>;
>> +    bus-width = <4>;
>> +    cap-sd-highspeed;
>> +    cap-sdio-irq;
>> +    hs400-ds-delay = <0x12012>;
>> +    keep-power-in-suspend;
>> +    max-frequency = <200000000>;
>> +    non-removable;
>> +    pinctrl-0 = <&mmc2_default_pins>;
>> +    pinctrl-1 = <&mmc2_uhs_pins>;
>> +    pinctrl-names = "default", "state_uhs";
>> +    sd-uhs-sdr104;
>> +    sd-uhs-sdr25;
>> +    sd-uhs-sdr50;
>> +    vmmc-supply = <&mmc2_vdd33>;
>> +    vqmmc-supply = <&mt6357_vcn18_reg>;
>> +    wakeup-source;
>> +    status = "okay";
>> +};
>> +
>>   &mt6357_pmic {
>>       interrupts-extended = <&pio 145 IRQ_TYPE_LEVEL_HIGH>;
>>       interrupt-controller;
>> @@ -324,8 +355,8 @@ cmd-dat-pins {
>>                    <MT8365_PIN_94_MSDC0_DAT6__FUNC_MSDC0_DAT6>,
>>                    <MT8365_PIN_93_MSDC0_DAT7__FUNC_MSDC0_DAT7>,
>>                    <MT8365_PIN_98_MSDC0_CMD__FUNC_MSDC0_CMD>;
>> -            input-enable;
>>               bias-pull-up;
>> +            input-enable;
> 
> This is a cleanup and goes to a different commit

Agree

> 
>>           };
>>           rst-pins {
>> @@ -337,8 +368,8 @@ rst-pins {
>>       mmc0_uhs_pins: mmc0-uhs-pins {
>>           clk-pins {
>>               pinmux = <MT8365_PIN_99_MSDC0_CLK__FUNC_MSDC0_CLK>;
>> -            drive-strength = <MTK_DRIVE_10mA>;
>>               bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
>> +            drive-strength = <MTK_DRIVE_10mA>;
> 
> While at it, in a cleanup commit, if you could also remove those MTK_DRIVE_xxx and
> use just the number that'd be great.

Sure

> 
>>           };
>>           cmd-dat-pins {
>> @@ -351,21 +382,21 @@ cmd-dat-pins {
>>                    <MT8365_PIN_94_MSDC0_DAT6__FUNC_MSDC0_DAT6>,
>>                    <MT8365_PIN_93_MSDC0_DAT7__FUNC_MSDC0_DAT7>,
>>                    <MT8365_PIN_98_MSDC0_CMD__FUNC_MSDC0_CMD>;
>> -            input-enable;
>> -            drive-strength = <MTK_DRIVE_10mA>;
>>               bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
>> +            drive-strength = <MTK_DRIVE_10mA>;
>> +            input-enable;
>>           };
>>           ds-pins {
>>               pinmux = <MT8365_PIN_104_MSDC0_DSL__FUNC_MSDC0_DSL>;
>> -            drive-strength = <MTK_DRIVE_10mA>;
>>               bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
>> +            drive-strength = <MTK_DRIVE_10mA>;
>>           };
>>           rst-pins {
>>               pinmux = <MT8365_PIN_97_MSDC0_RSTB__FUNC_MSDC0_RSTB>;
>> -            drive-strength = <MTK_DRIVE_10mA>;
>>               bias-pull-up;
>> +            drive-strength = <MTK_DRIVE_10mA>;
>>           };
>>       };
>> @@ -386,16 +417,16 @@ cmd-dat-pins {
>>                    <MT8365_PIN_91_MSDC1_DAT2__FUNC_MSDC1_DAT2>,
>>                    <MT8365_PIN_92_MSDC1_DAT3__FUNC_MSDC1_DAT3>,
>>                    <MT8365_PIN_87_MSDC1_CMD__FUNC_MSDC1_CMD>;
>> -            input-enable;
>>               bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
>> +            input-enable;
>>           };
>>       };
>>       mmc1_uhs_pins: mmc1-uhs-pins {
>>           clk-pins {
>>               pinmux = <MT8365_PIN_88_MSDC1_CLK__FUNC_MSDC1_CLK>;
>> -            drive-strength = <8>;
>>               bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
>> +            drive-strength = <8>;
>>           };
>>           cmd-dat-pins {
>> @@ -404,9 +435,63 @@ cmd-dat-pins {
>>                    <MT8365_PIN_91_MSDC1_DAT2__FUNC_MSDC1_DAT2>,
>>                    <MT8365_PIN_92_MSDC1_DAT3__FUNC_MSDC1_DAT3>,
>>                    <MT8365_PIN_87_MSDC1_CMD__FUNC_MSDC1_CMD>;
>> -            input-enable;
>> +            bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
>>               drive-strength = <6>;
>> +            input-enable;
>> +        };
>> +    };
>> +
>> +    mmc2_default_pins: mmc2-default-pins {
>> +        clk-pins {
>> +            pinmux = <MT8365_PIN_81_MSDC2_CLK__FUNC_MSDC2_CLK>;
>> +            bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
>> +            drive-strength = <4>;
>> +        };
>> +
>> +        cmd-dat-pins {
>> +            pinmux = <MT8365_PIN_82_MSDC2_DAT0__FUNC_MSDC2_DAT0>,
>> +                 <MT8365_PIN_83_MSDC2_DAT1__FUNC_MSDC2_DAT1>,
>> +                 <MT8365_PIN_84_MSDC2_DAT2__FUNC_MSDC2_DAT2>,
>> +                 <MT8365_PIN_85_MSDC2_DAT3__FUNC_MSDC2_DAT3>,
>> +                 <MT8365_PIN_80_MSDC2_CMD__FUNC_MSDC2_CMD>;
>>               bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
>> +            drive-strength = <4>;
>> +            input-enable;
>> +        };
>> +
>> +        sys-en-pins {
>> +            pinmux = <MT8365_PIN_120_DMIC1_CLK__FUNC_GPIO120>;
> 
> My schematics say that the DMIC1_CLK pin is PERST_N, DMIC_DAT0 is PWR_EN: what's
> the intention here?!
> 
> In any case, this is not a mmc2 pin, but something else :-)

First of all, name in schematic are wrong, I noticed that when I've port these feature from kernel 
5.15 to 6.6. After digging and talking to MTK, they confirm me that PERST_N is actually an enable 
pin (or power_on).

Secondly, MT7663_PERST_N (MT8365_PIN_120_DMIC1_CLK__FUNC_GPIO120) is part of mmc2 pin since is it 
connected to the MMC2 connector pin number 52.

> 
> Cheers,
> Angelo
> 

-- 
Regards,
Alexandre

