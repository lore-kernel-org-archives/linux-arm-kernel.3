Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E13CCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 08:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3we07e3UJvP1GOZyxsthN2v1+i0U7aVlrq0WJfskyK8=; b=4me4A48EJMVtzvoWi1QpaVzF0e
	/p1r2druui3FXlkZhHftF0eTRujH+u21J9GLdLdOT6sPyPisEvLM4McLa7mZjo/z6AZjgvMi02Hp7
	jYDmSSmXYkwytJtvqEm/W26PUFouAobYZ1k++MfhiLX4XMgfdX0H1JmL15VzZjRcTFzlkeM5Gj9q7
	1HWK2LHWyppcZk4oDgZNyaocLryIL/cU2RENQNCiW20w1QjMgYpAVbPJQRxsSqfTljkrrX4Ae7QLR
	iK2Jksq4SkqFshMS9MoTJW5wnyYCnVOzf/w+veh4rGk9k2EZEP01LaAEePhvNprMxp7IKMJvXUffD
	cEMGjIZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE1l9-00000000LnP-3h7r;
	Wed, 29 Oct 2025 08:42:23 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE1l7-00000000LmW-3VNv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 08:42:23 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-59303607a3aso5196634e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 01:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761727340; x=1762332140; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3we07e3UJvP1GOZyxsthN2v1+i0U7aVlrq0WJfskyK8=;
        b=BlCYY2WNtlGfn6MnK4TMYsnXChna0BvN8umnnERbhKITTnABcqkPfnB1ESbH0glN1F
         s8HyN/tyP3E3BR8m3mGntXX5B0Zl0pT8RLsnCyjyo6DahqEnHId/xk6nhokAbx3OdBKg
         fDsSflYsmrE2my6zDMewE0vfKtd8n0YRq/n/7zRBWKb1Qw4J4gqZ+vAz8qsTu+R6k0z4
         nEhI8MfHBKP9GeJRlpoFU+DKSDqwD2Wm/o74Gi6ZU8N2ZjHBEK3qYedE4xxWr8uQ0kcr
         KIO0s0XGnKWc0mTA8CkAHIbmWAeZivmEP0qDHO4PZR0g3G3MgpocpuluGC+6OnrvDbJC
         usRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761727340; x=1762332140;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3we07e3UJvP1GOZyxsthN2v1+i0U7aVlrq0WJfskyK8=;
        b=Ocrfembmp7iADDRIYZ8gng0vVbKQ4RduFEnA/YrksoimGvddSv2YwLDcYnL/ATil5+
         0HBj00Gu1YJ+qzIPjrUu/3bE6weC/OBMAicdwqkejDqYaHW5oRWjll609oJqHbzKYWaq
         gg131Zyy3RHDyc87aSBsDypGliw/qH6Rn2gpNWjO+8UKAYv0EPlAHijMd9CikLb3C5gb
         UXu+hsjgkwc0ZrxE4TJtq7wFLG0VImnWa6hHpK6Hx8b9BcPaYfIlcOsEM9RJCPNPh6Qn
         UmRxAXSRDwd/wld3ok2p3wEW2g7hsxE9nNB98sYVmPENP2xkwZY+VJ4lpQL6mNbLTdvi
         ebaQ==
X-Forwarded-Encrypted: i=1; AJvYcCV15NzENmaFVkNR7SYIUI6RqKKDC3otbCEQQ+m4fXjq4MauyXNZHBWy2ettPcXYQr/n+sJ3lpeOHNDSSIE8JH46@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2zFzjnvLiUj8a0o7Yn0RiugcLn7DN/+5CglmAuG9/TDvKPcKN
	JOVcrWt8FjncAs9ifTDn43UufkGF7lXaKYDWCQbVOmwiKAnwUcLC3jnP
X-Gm-Gg: ASbGncsmXFqoQZ3UrgH4SxUQqPlGoKQMt+e77wZ6805CNg6cMF9J7OaMmEjm22fbsS+
	SSt+aGFQw+9HLkKT9Af2cTZb7VCReZvOtT+tWVWmNLMkgTPMrgv21a7lJDZXy4S7ysflroIVtgM
	YuyXoHBLo/AAnMI1jyvv6QcKW4YSZl9q6bjL8dm3enIieUTGTRtXopVa5y0dMIs6QtJk+C5OUWc
	xADYRMQgNe/X696gXing8vr5QLItBCD7phHTbJnAkE2zAbmzLqxJCzSVpb7Kvh/VJSkd/Q3Ndbv
	O9cLd/DwLsVN0u3BWsxyv7PzIfFj1Ss6xu3wJ9xL8sNa4kJEXlNbRr8cFKGmQMjQ83epSTZ2wJU
	5l0/aUhywyEbMJkFyAoc3f+H464W8ciwJOx281npU3cghxM+MaeKwK7sEkhFpeOID8qdiPyy0bZ
	U1A4yhSXzphQ==
X-Google-Smtp-Source: AGHT+IEBJiRFPVFsvgo9dN9DCTuU4N9+tKqy36VEQJMKBJXWx4r2ceVpk4tbpOZEBYRZLo1hsmybxg==
X-Received: by 2002:a05:6512:4025:b0:593:3d5:f0e6 with SMTP id 2adb3069b0e04-594128b1140mr700531e87.35.1761727339236;
        Wed, 29 Oct 2025 01:42:19 -0700 (PDT)
Received: from [10.38.18.54] ([213.255.186.37])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f83c96sm3667085e87.101.2025.10.29.01.42.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 01:42:18 -0700 (PDT)
Message-ID: <4a47b9b5-f482-41b6-a441-7728572c5a0c@gmail.com>
Date: Wed, 29 Oct 2025 10:42:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: dts: freescale: add Ka-Ro Electronics
 tx8m-1610 COM
To: =?UTF-8?Q?Lothar_Wa=C3=9Fmann?= <LW@KARO-electronics.de>,
 Maud Spierings <maudspierings@gocontroll.com>
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
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20251029081138.2161a92a@karo-electronics.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_014221_907755_F473059E 
X-CRM114-Status: GOOD (  30.41  )
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

On 29/10/2025 09:11, Lothar Waßmann wrote:
> Hi,
> 
> On Tue, 28 Oct 2025 14:10:04 +0100 Maud Spierings wrote:
>> On 10/28/25 13:42, Maud Spierings wrote:
>>> On 10/28/25 13:15, Matti Vaittinen wrote:
> [...]
>>>> Could/Should this be described using the:
>>>> 'rohm,feedback-pull-up-r1-ohms' and
>>>> 'rohm,feedback-pull-up-r2-ohms'? If I understand the comment
>>>> correctly, that might allow the driver to be able to use correctly
>>>> scaled voltages.
>>>>
>>>> https://elixir.bootlin.com/linux/v6.18-rc1/source/Documentation/
>>>> devicetree/bindings/regulator/rohm,bd71837-regulator.yaml#L108
>>>>   
>>>
>>> Ah I didn't know those existed, should've checked the bindings in more
>>> detail, thanks for the hint!
>>>
>>> I will have to investigate this carefully, since I don't have access to
>>> the actual design of the COM, so I don't know exactly what is there.
>>>    
>>
>> So I am not yet entirely sure if this works out, I used the calculation
>> in the driver:
>>
>> /*
>>    * Setups where regulator (especially the buck8) output voltage is scaled
>>    * by adding external connection where some other regulator output is
>> connected
>>    * to feedback-pin (over suitable resistors) is getting popular amongst
>> users
>>    * of BD71837. (This allows for example scaling down the buck8 voltages
>> to suit
>>    * lover GPU voltages for projects where buck8 is (ab)used to supply power
>>    * for GPU. Additionally some setups do allow DVS for buck8 but as this do
>>    * produce voltage spikes the HW must be evaluated to be able to
>> survive this
>>    * - hence I keep the DVS disabled for non DVS bucks by default. I
>> don't want
>>    * to help you burn your proto board)
>>    *
>>    * So we allow describing this external connection from DT and scale the
>>    * voltages accordingly. This is what the connection should look like:
>>    *
>>    * |------------|
>>    * |	buck 8  |-------+----->Vout
>>    * |		|	|
>>    * |------------|	|
>>    *	| FB pin	|
>>    *	|		|
>>    *	+-------+--R2---+
>>    *		|
>>    *		R1
>>    *		|
>>    *	V FB-pull-up
>>    *
>>    *	Here the buck output is sifted according to formula:
>>    *
>>    * Vout_o = Vo - (Vpu - Vo)*R2/R1
>>    * Linear_step = step_orig*(R1+R2)/R1
>>    *
>>    * where:
>>    * Vout_o is adjusted voltage output at vsel reg value 0
>>    * Vo is original voltage output at vsel reg value 0
>>    * Vpu is the pull-up voltage V FB-pull-up in the picture
>>    * R1 and R2 are resistor values.
>>    *
>>    * As a real world example for buck8 and a specific GPU:
>>    * VLDO = 1.6V (used as FB-pull-up)
>>    * R1 = 1000ohms
>>    * R2 = 150ohms
>>    * VSEL 0x0 => 0.8V – (VLDO – 0.8) * R2 / R1 = 0.68V
>>    * Linear Step = 10mV * (R1 + R2) / R1 = 11.5mV
>>    */
>>
>> Because I do not know the pull up voltage, and I am not sure if it is a
>> pull up.
>>
>> So:
>> Vout_o = 1.35V
>> Vo = 1.1V
>> Vpu = unknown
>> R2 = 499 Ohm
>> R1 = 2200 Ohm
>> Gives:
>> Vpu = ~0V
>>
>> And:
>> Vout_o = 1.35V
>> Vo = 1.1V
>> Vpu = unknown
>> R2 = 2200 Ohm
>> R1 = 499 Ohm
>> Gives:
>> Vpu = ~1.04V
>>
>> I am not quite sure which resistor is R1 and which is R2 but having
>> there be a pull down to 0V seems the most logical answer?
>>
>> I am adding Lothar from Ka-Ro to the CC maybe he can shed some light on
>> this setup.
>>
> R2 is connected to GND, so Vpu = 0.
> With:
> 	regulator-min-microvolt = <1350000>;
> 	regulator-max-microvolt = <1350000>;
> 	rohm,fb-pull-up-microvolt = <0>;
> 	rohm,feedback-pull-up-r1-ohms = <2200>;
> 	rohm,feedback-pull-up-r2-ohms = <499>;
> the correct voltage should be produced on the BUCK8 output, but a quick
> test with these parameters led to:
> |failed to get the current voltage: -EINVAL
> |bd718xx-pmic bd71847-pmic.3.auto: error -EINVAL: failed to register buck6 regulator
> |bd718xx-pmic: probe of bd71847-pmic.3.auto failed with error -22
> 
> Apparently noone has ever tested this feature in real life.

Thanks for trying it out Lothar. I am positive this was tested - but 
probably the use-case has been using a pull-up. I assume having the zero 
pull-up voltage causes the driver to calculate some bogus values. I 
think fixing the computation in the driver might not be that big of a 
task(?) The benefit of doing it would be that the correct voltages would 
be calculated by the driver.

If real voltages aren't matching what is calculated by the driver, then 
the voltages requested by regulator consumers will cause wrong voltages 
to be applied. Debug interfaces will also show wrong voltages, and the 
safety limits set in the device-tree will not be really respected.

I think this would be well worth fixing.

Yours,
	-- Matti

> 
> 
> Lothar Waßmann


