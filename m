Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3478CCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 09:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EZsofUoQy4xDbUxi1JncXn4brcSZHYShastMGK+62Io=; b=rTMFmk35+u5NW00iDY4XxEpW7m
	iwlKmFmCtbG5SYWdtLhgl0QU9gj+JrgWnTd6p8iAbKn0lgP6nUTIP2LyVjuoHpNlZOFJ+z47wG53n
	D0FTAUQONIAMZmhQvxIUDugJb3HcEjzO6xRLwYpqjWtNREHgY0GS735/AVe6Ub6BS0WB5yRTGz+5E
	Ws7VO37yOKKLm/t4aGxaKEyM0G4H6XAUtyXwVO62ehdAivCak/7M1CBevTPuT22oxNLpftrOjvyks
	C2ukbqDWERz5xkY5//l0/m29+BVeCBysWVnI23Dmg1ppMWUNbM7uVV1660WSgl+rCuLKvj54sK8xE
	uFGiGuJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE2Yh-00000000ViX-2lht;
	Wed, 29 Oct 2025 09:33:35 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE2Ye-00000000Vg7-2rR3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 09:33:34 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-378e622e9e3so10672411fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 02:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761730410; x=1762335210; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EZsofUoQy4xDbUxi1JncXn4brcSZHYShastMGK+62Io=;
        b=a5adZpbjYaR4CE1e2CpPcTKMKNWKwVfjndxwLnE3pJ5o5hDCAZACcR0e29+YEqZOlc
         Zkg5K2hPmZPVVBQ6yQNUwQpkUSQORJlBiTnvOADV4Lb0U+ZKejns/9nBMVMwCuTo9p1M
         sFbbdT4tLN//Fw18ait+7n4xA3flw9CVLtkkpYgjOfaKEUfIKHz9niiuYRo3v3cvjaZn
         pOjh2ObcWndIuqB5VlNrCa4hhxM6zlh4BBGjaOCdusvg4lYYZGjyjmzqYB4Mc/DEpRln
         uxfl9twC9WCWSeCCzOtAkZFIs2BSxz+yYJDjrE8QzAUk13Usjq/5lVLp4QFLZ3xMAy3g
         VU7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761730410; x=1762335210;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EZsofUoQy4xDbUxi1JncXn4brcSZHYShastMGK+62Io=;
        b=qnyQmXMqYu/BDFpnOug4JaG4d3QJZYTCbjVFHNE1eAV9x/OS7lnNI0S62OrngpBzeh
         th0eMZMiKqw48/4EvJpqoXhKadKd2NoIDMEB82vk1pOtD4802LXJO+NdON3dWdqnu/mF
         XA1av4cHe4TOXZsxFYZP0KQJR9Hl6Ii8GcjZ0CSsbUPihMosYVlln6XYCd048ARWOUaw
         UXP72ecX7OCena6wxsPxbaztFXGkhZgtQI6IDmZfRokBhvy44cptZCGU2893+KxwKDz9
         daCOG6sVUKWlLgpIWgWBKYwdTCvNN+yR4FcSXlu9ehiT5etIrsF0uFANNqeeirgOEYIi
         XIjQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1yGs/JtAPPKruUacdeYECDJskB97c7xR//aG2Ex2047iFO4V0VwtZsgV9YF+Ck+tW8IowViumPFMK+Jf0nTef@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3ocFL0/KO1uBmpSkxPzVpW5iC3KEawRLAsGL7aeM69scrRMH6
	BbpbucLG0zINNR1PHjPklpRTiIzsy1roe77+L4WzFZvMaefx453eotvm
X-Gm-Gg: ASbGncuk6fdhw80goHuK0A0d5JTer8Yv1nB2FZrfIcXePMoe5A403S7/FSlmg8npGM7
	oWV4Ya7cUXtcJ8y5BrJsGVKrs5YHebcJiL+eC+jS0QWeAoLoWV8CD2GupCxC4PJ0cE8msadMarm
	7IT9tda4+Qu5bRNyaA62E8KXTUH5DIpWvt2u6ymfpPajBW1Qe6gmGumGaUHlc0uK6hdR8v5/v4t
	v3TWP/yKtD1AZL7eMWZTsdCz+sqLz5CGOqgtWpvLUikzVL3PWMbGR7H3RFuNMn3X80UxcSuUhO9
	iBfIbT10Y3kOsu7QyIk0pERbe8g5Kkb5lVN4Q3HVd6GsTQT7ejEoqeXJq2nDwhmyNagXEVX1ICg
	Oj6ZeOZA9c2kSXYbJ9NOZCMsIsynuCemMjvzDHlz2XQSqp+2x5H+NnROzcMOAcK93TPl0beVuGe
	2PV+ZVznIWNBQfzr/uS+OD
X-Google-Smtp-Source: AGHT+IGzr4p5MyvY1ejjzx35Qq65bjiAfmxFhDvnxLZNuTYbHxWS6cLUXfrqNYmxCV8A0Im+UkyGJQ==
X-Received: by 2002:a2e:bc22:0:b0:336:b891:18db with SMTP id 38308e7fff4ca-37a05bd1dc8mr9065371fa.2.1761730410092;
        Wed, 29 Oct 2025 02:33:30 -0700 (PDT)
Received: from [10.38.18.54] ([213.255.186.37])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee09c957sm32130781fa.14.2025.10.29.02.33.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 02:33:29 -0700 (PDT)
Message-ID: <160bf6cf-5385-4304-9afa-e1d2af589397@gmail.com>
Date: Wed, 29 Oct 2025 11:33:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: dts: freescale: add Ka-Ro Electronics
 tx8m-1610 COM
To: Maud Spierings <maudspierings@gocontroll.com>,
 =?UTF-8?Q?Lothar_Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20251022-mini_iv-v2-0-20af8f9aac14@gocontroll.com>
 <20251022-mini_iv-v2-3-20af8f9aac14@gocontroll.com>
 <a7012995-c2a8-48a3-abe1-5c227272f21c@gmail.com>
 <65202d1f-6c4f-4d4e-9fef-85cfb74ec768@gocontroll.com>
 <938f85b0-4c9b-463a-960a-f5f4e4092480@gocontroll.com>
 <20251029081138.2161a92a@karo-electronics.de>
 <4a47b9b5-f482-41b6-a441-7728572c5a0c@gmail.com>
 <4733e8cd-3a2d-4d75-adbd-a3101760d13a@gocontroll.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <4733e8cd-3a2d-4d75-adbd-a3101760d13a@gocontroll.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_023332_763277_F4025358 
X-CRM114-Status: GOOD (  28.61  )
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

On 29/10/2025 11:00, Maud Spierings wrote:
> 
> 
> On 10/29/25 09:42, Matti Vaittinen wrote:
>> On 29/10/2025 09:11, Lothar Waßmann wrote:
>>> Hi,
>>>
>>> On Tue, 28 Oct 2025 14:10:04 +0100 Maud Spierings wrote:
>>>> On 10/28/25 13:42, Maud Spierings wrote:
>>>>> On 10/28/25 13:15, Matti Vaittinen wrote:
>>> [...]
>>>>>> Could/Should this be described using the:
>>>>>> 'rohm,feedback-pull-up-r1-ohms' and
>>>>>> 'rohm,feedback-pull-up-r2-ohms'? If I understand the comment
>>>>>> correctly, that might allow the driver to be able to use correctly
>>>>>> scaled voltages.
>>>>>>
>>>>>> https://elixir.bootlin.com/linux/v6.18-rc1/source/Documentation/
>>>>>> devicetree/bindings/regulator/rohm,bd71837-regulator.yaml#L108
>>>>>
>>>>> Ah I didn't know those existed, should've checked the bindings in more
>>>>> detail, thanks for the hint!
>>>>>
>>>>> I will have to investigate this carefully, since I don't have 
>>>>> access to
>>>>> the actual design of the COM, so I don't know exactly what is there.
>>>>
>>>> So I am not yet entirely sure if this works out, I used the calculation
>>>> in the driver:
>>>>
>>>> /*
>>>>    * Setups where regulator (especially the buck8) output voltage is 
>>>> scaled
>>>>    * by adding external connection where some other regulator output is
>>>> connected
>>>>    * to feedback-pin (over suitable resistors) is getting popular 
>>>> amongst
>>>> users
>>>>    * of BD71837. (This allows for example scaling down the buck8 
>>>> voltages
>>>> to suit
>>>>    * lover GPU voltages for projects where buck8 is (ab)used to 
>>>> supply power
>>>>    * for GPU. Additionally some setups do allow DVS for buck8 but as 
>>>> this do
>>>>    * produce voltage spikes the HW must be evaluated to be able to
>>>> survive this
>>>>    * - hence I keep the DVS disabled for non DVS bucks by default. I
>>>> don't want
>>>>    * to help you burn your proto board)
>>>>    *
>>>>    * So we allow describing this external connection from DT and 
>>>> scale the
>>>>    * voltages accordingly. This is what the connection should look 
>>>> like:
>>>>    *
>>>>    * |------------|
>>>>    * |    buck 8  |-------+----->Vout
>>>>    * |        |    |
>>>>    * |------------|    |
>>>>    *    | FB pin    |
>>>>    *    |        |
>>>>    *    +-------+--R2---+
>>>>    *        |
>>>>    *        R1
>>>>    *        |
>>>>    *    V FB-pull-up
>>>>    *
>>>>    *    Here the buck output is sifted according to formula:
>>>>    *
>>>>    * Vout_o = Vo - (Vpu - Vo)*R2/R1
>>>>    * Linear_step = step_orig*(R1+R2)/R1
>>>>    *
>>>>    * where:
>>>>    * Vout_o is adjusted voltage output at vsel reg value 0
>>>>    * Vo is original voltage output at vsel reg value 0
>>>>    * Vpu is the pull-up voltage V FB-pull-up in the picture
>>>>    * R1 and R2 are resistor values.
>>>>    *
>>>>    * As a real world example for buck8 and a specific GPU:
>>>>    * VLDO = 1.6V (used as FB-pull-up)
>>>>    * R1 = 1000ohms
>>>>    * R2 = 150ohms
>>>>    * VSEL 0x0 => 0.8V – (VLDO – 0.8) * R2 / R1 = 0.68V
>>>>    * Linear Step = 10mV * (R1 + R2) / R1 = 11.5mV
>>>>    */
>>>>
>>>> Because I do not know the pull up voltage, and I am not sure if it is a
>>>> pull up.
>>>>
>>>> So:
>>>> Vout_o = 1.35V
>>>> Vo = 1.1V
>>>> Vpu = unknown
>>>> R2 = 499 Ohm
>>>> R1 = 2200 Ohm
>>>> Gives:
>>>> Vpu = ~0V
>>>>
>>>> And:
>>>> Vout_o = 1.35V
>>>> Vo = 1.1V
>>>> Vpu = unknown
>>>> R2 = 2200 Ohm
>>>> R1 = 499 Ohm
>>>> Gives:
>>>> Vpu = ~1.04V
>>>>
>>>> I am not quite sure which resistor is R1 and which is R2 but having
>>>> there be a pull down to 0V seems the most logical answer?
>>>>
>>>> I am adding Lothar from Ka-Ro to the CC maybe he can shed some light on
>>>> this setup.
>>>>
>>> R2 is connected to GND, so Vpu = 0.
>>> With:
>>>     regulator-min-microvolt = <1350000>;
>>>     regulator-max-microvolt = <1350000>;
>>>     rohm,fb-pull-up-microvolt = <0>;
>>>     rohm,feedback-pull-up-r1-ohms = <2200>;
>>>     rohm,feedback-pull-up-r2-ohms = <499>;
>>> the correct voltage should be produced on the BUCK8 output, but a quick
>>> test with these parameters led to:
>>> |failed to get the current voltage: -EINVAL
>>> |bd718xx-pmic bd71847-pmic.3.auto: error -EINVAL: failed to register 
>>> buck6 regulator
>>> |bd718xx-pmic: probe of bd71847-pmic.3.auto failed with error -22
>>>
>>> Apparently noone has ever tested this feature in real life.
>>
>> Thanks for trying it out Lothar. I am positive this was tested - but 
>> probably the use-case has been using a pull-up. I assume having the 
>> zero pull-up voltage causes the driver to calculate some bogus values. 
>> I think fixing the computation in the driver might not be that big of 
>> a task(?) The benefit of doing it would be that the correct voltages 
>> would be calculated by the driver.
>>
>> If real voltages aren't matching what is calculated by the driver, 
>> then the voltages requested by regulator consumers will cause wrong 
>> voltages to be applied. Debug interfaces will also show wrong 
>> voltages, and the safety limits set in the device-tree will not be 
>> really respected.
>>
>> I think this would be well worth fixing.
>>
> 
> Do you intend to do this Matti?
> 
> Otherwise I will give it a try.

It would be great if you had the time and enthusiasm to take a look at it!

Yours,
	-- Matti


