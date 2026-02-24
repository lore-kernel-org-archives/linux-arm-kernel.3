Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C834F4BB8C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 21:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yDayGCTx715bDzSgsBZo6/sacRFjwz6HQIrmD08ogXA=; b=BoBzCWS3htcUhmHZ4irZZpus35
	NaSu0loOS087Si1axTojf74MN/T6UzUomWcxVueklf/4vKP04tTvLae8x4sRhGe2DnOolaIkzCbgS
	lcuUkzPA1UZ2PKLS+wlmEssrfAcgz8hLek4TZA4Ssgp0Iz4d4X9/m/fxKNfdl//kzWQqr/vyuVPJY
	T9NLvkvxIrdoarTSpSpBKNbJR+HZwjA8qVC3xDzzwi3EhxJeR+SSqXKsw308Vq4Vfohhr4PoBtvYD
	JBMr6DJJMTi4bXchOzq6yK0IqFSpm6Owu5gPbgB2noAN322SppXZwzdS/+e2XQz8axgozJNXOGvlq
	qSEgW6VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuzxd-00000002oQ9-1Rk5;
	Tue, 24 Feb 2026 21:28:53 +0000
Received: from mail-dl1-x1242.google.com ([2607:f8b0:4864:20::1242])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuzxa-00000002oPn-0tET
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 21:28:51 +0000
Received: by mail-dl1-x1242.google.com with SMTP id a92af1059eb24-1271195d2a7so3508139c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 13:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771968528; x=1772573328; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yDayGCTx715bDzSgsBZo6/sacRFjwz6HQIrmD08ogXA=;
        b=KCjn3hGwF8h/qdhs/JhjA8A2zromo9f1FqPabQm8oMtRElxt9muIB/Z96k36aq0Seg
         m1gvPcfgvspg9mCSFa+CbwwMaVipfMf67lR3fhSP7SBnN9gFu3m1dTA7+c9DOtXLlSC6
         OmCkdlRxnRyC4/MYz7lPoUzfxlEvvGql3mfqLBL0fQkPm/7xhlZogBoT6A6No8m5v3KR
         VQIHVJjxVr8+qAIYebO284/GIQf1Ji31t6Tsf8ilKhyReTIcUl0WnbnNUNYgijJZkJIU
         8AMxJLApu2Ygc7mlP44M4CCgDdkHx3VO2WnRXVs9gBqcMn3XMbVG02/88HfYMtRI6hws
         g8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771968528; x=1772573328;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yDayGCTx715bDzSgsBZo6/sacRFjwz6HQIrmD08ogXA=;
        b=f5mX++wLZPkW0G2Bf8Yhx636HbBEu7XX3NUOvNR2PL23t/wmop5dYtZUPWzXjR4Aua
         RqNWmux897rTZVzgAMJo2+stbb4TtMGz1QF5LbODqWTbLxrDDtT5AXeixolRqhmnNB+K
         TXekij+h9iSb/KdKtj/wR190EiNTvUO1JMTUPcoSlLLV7zKqop5pJbKC+oaj+3E7bJFW
         tEQ0b+sF9NwBLzt212xwDy2NwclSTjbQcICbEr4iJ2hUH808Q5Ul3pushwxA6kfqy4cG
         LjZUKJgP6fT2KehRzagp0iOVw2G4ktM92jWkVyMfQY41ztP5xx+gei9N6zT1DRXhWKyH
         6b2g==
X-Gm-Message-State: AOJu0Yyc4FI6Tp70lkX8JFONpuQ6E+eXREoDrdQKHIhZp8aqnWPlpX6Z
	hqhDEvfXMr4ss7RePsfMSS0J2Jcg1iIfFvp1/JC0XwpxuR4sHe0T/xyc0FkxVCCwIA==
X-Gm-Gg: AZuq6aKbJO+CWrH4okR5TPY5RsivtXGcP52uR6goSLyJ/bWaicbXH/KVGIkrgZoFduP
	z/P9VLCZGIIW3cobYx/1oMPZ1Ww2LLnWFUbpS3N87TtOAC7H6LWdOzdiAUxX3sqbnZtS2enqvfL
	JNJvV1PrVyVnV3xPWmo/MzCNhO6TK17wdLkJeEdLfu7Z+ydC351wzZJANuOfR1phpwKstv+G/Q1
	N8/4JFzhlNl9O1B8Rsb4+3RHiuWHseihQEEcomCStdyqG/0Lbl+ZxirK8eSjstYLv5K6xHlwLEL
	9GH12Iafy6nX0u5eiysrjjWRQWvd8fyiw2vlcQWVLd8gFhVUnWnb8DKccv1fK8b/yhV+uhlIocy
	udzAPuPx7LDQUp0V5M8tBTV5jdQ/QuzdkM1FQHknM64iHJBs1CYDCUIINnCUhX0ymdGNLe+JfJR
	LBUL+iaFrDriHsZNgSAPBlcPCgTSn1PGECDhOQrE31wuHEeReCHr8RU7KrudBZb1Q9WGiFIZqpv
	CSJxX7dJPZFLupItyJv2IN4Jg==
X-Received: by 2002:a05:7022:1285:b0:127:33c5:5390 with SMTP id a92af1059eb24-12781e0aac0mr52023c88.11.1771968527891;
        Tue, 24 Feb 2026 13:28:47 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:665e:550c:2a20:8866? ([2a00:79e0:2e7c:8:665e:550c:2a20:8866])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af207d6sm12385902c88.5.2026.02.24.13.28.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 13:28:47 -0800 (PST)
Message-ID: <fa253e2f-bdb5-4ad0-9308-ba2f9bb97596@google.com>
Date: Tue, 24 Feb 2026 13:28:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: exynos: gs101-pixel-common: add supply and
 regulator properties
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Badhri Jagan Sridharan <badhri@google.com>
References: <20260224-max77759-charger-dts-v1-1-b443545c04aa@google.com>
 <48d5eb8e-834f-4e87-a59c-d05add0dfda7@kernel.org>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <48d5eb8e-834f-4e87-a59c-d05add0dfda7@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_132850_309758_126670C3 
X-CRM114-Status: GOOD (  16.33  )
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


On 2/23/26 11:01 PM, Krzysztof Kozlowski wrote:
> On 24/02/2026 06:03, Amit Sunil Dhamne via B4 Relay wrote:
>> From: Amit Sunil Dhamne <amitsd@google.com>
>>
>> Add power supply and regulator properties to the MAX77759 pmic. The
>> usb-typec device will reference the regulator provided by the pmic as
>> it supplies vbus to the typec device when operating in power source mode.
>>
>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>> ---
>> This patch depends on the patchset [1].
>> [1] https://lore.kernel.org/all/20260224-max77759-charger-v8-0-eb86bd570e9c@google.com/
>> ---
>>   arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
>> index 93892adaa679..2cc00d34dda8 100644
>> --- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
>> @@ -142,12 +142,13 @@ &hsi2c_12 {
>>   	status = "okay";
>>   	/* TODO: add the devices once drivers exist */
>>   
>> -	usb-typec@25 {
>> +	maxtcpci: usb-typec@25 {
>>   		compatible = "maxim,max77759-tcpci", "maxim,max33359";
>>   		reg = <0x25>;
>>   		interrupts-extended = <&gpa8 2 IRQ_TYPE_LEVEL_LOW>;
>>   		pinctrl-0 = <&typec_int>;
>>   		pinctrl-names = "default";
>> +		vbus-supply = <&chgin_otg_reg>;
>>   
>>   		connector {
>>   			compatible = "usb-c-connector";
>> @@ -236,6 +237,11 @@ pmic@66 {
>>   		interrupt-controller;
>>   		#interrupt-cells = <2>;
>>   
>> +		power-supplies = <&maxtcpci>;
> Missing blank line. Please follow DTS coding style.

Sorry, will fix.


BR,

Amit

>
>> +		chgin_otg_reg: chgin-otg-regulator {
>> +			regulator-name = "chgin-otg";
>> +		};
>> +
>>   		gpio {
>>   			compatible = "maxim,max77759-gpio";
>>   
>>
>> ---
>> base-commit: 8bf22c33e7a172fbc72464f4cc484d23a6b412ba
>> change-id: 20260224-max77759-charger-dts-23493398e77c
>>
>> Best regards,
>
> Best regards,
> Krzysztof

