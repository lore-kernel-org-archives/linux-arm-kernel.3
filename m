Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A2BCCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 10:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uijkDtADuxF9K7YO0wHfT0dqUWSv/gYtiCeLIm0pwtg=; b=Ao1wOQWkyiM1iaTAn0EldNFSM5
	jKp68hLRQc7x1BsnKZBzoLFzyU3TvGzcpEVG+H/TJp6R+3+jZ9J3550zI9ExPZDEeMpKT9u6N4AaI
	T/sYjgq92xUwoUzTh4h5kF15bcZxySEzWTPqhBAdlFKE2FgpNzCxVjhdynnHzpUsVUBDvtnu3MnHJ
	yoEDEPkPc4hzMTkoUxAwmEunu6XOhOEM0X5mftZV0Qa5P8gB0qLEEeq6ewKHIUbxAIWWFnw4jaDuU
	UAzT9GOnwTzidjwIs5Q1ehUJ1nGdmfXJ/VQS+QZav0mn4MGuWK/CnKlv7PAgQiMeZiqvnT+ETpwuz
	B8cUvNtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE33t-00000000cxr-0L6U;
	Wed, 29 Oct 2025 10:05:49 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE33q-00000000cwR-2NDi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 10:05:47 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-37775ed97daso8399901fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 03:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761732344; x=1762337144; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uijkDtADuxF9K7YO0wHfT0dqUWSv/gYtiCeLIm0pwtg=;
        b=Pc4p9K1G3rV3ygVhWEMdnnyjXdbmv4t98FSAWs+838aUGh6lX+C3lxrJh45R3VugSv
         d2C3X9r2rdIaY4Ns6QmbA0PQnTNp/AyuqSPcXA1ofcFbrqlJIM382Tfg4oDE7xNhYVDQ
         Kp9sarC1Y2QZZWQoZvjW3LGlox9owUnu+q/cMwzO1VIDyatlQFN3eA+eAe97gxedCYi0
         E5mxZnUX6QUm2Dg5dnltBc39hGxYKS66W0cgSC6ixZJcNcn4GvMVqvKRT3QYjGcV/dX1
         y6vPdSrNf8XWynXWgUl223Xxxd7w+Joayf2lvq+tXHhJRSY9XRnzP80Mx81ghP7SJjfI
         eWSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761732344; x=1762337144;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uijkDtADuxF9K7YO0wHfT0dqUWSv/gYtiCeLIm0pwtg=;
        b=HxGOqp7SZm2klfsx/zvzMadK3JZpuNvJfBBQl+lTqxr5MANcn78CfOxQxh7la8WHFn
         GgIdY8C7RMlT58i3ewFy1frsLX/QwFZwsuqfmrjnanX7Ie6yRaXdB5p0cw98hT24Lsoj
         nJ17rBS9Srsjp6pnxLPWWdPiBeejm+4z8QlL0rGaMyEeO2U8jB0hcWaILJwp/QLnXOca
         cCMEJdmajYUycH3rdtqjfyoN69n+eUvFaPZb7rjQcMBco81FSxaAVagEmIxLpnbFhXVj
         EscodPrRz1eK/gFaJPJNAph62iaycCDw9jjm8fK5sUwhdOOdAlKP3AGOh12ARmPtKkLc
         hAZA==
X-Forwarded-Encrypted: i=1; AJvYcCUkKn9rD1u6K2KJttQhA+7IAxwKsc6U4MF6hRR1qdT6yYXsxQvG1/HfVT1HR05oMmf0wm3P4wW9mmsK/aWhLg1a@lists.infradead.org
X-Gm-Message-State: AOJu0YzhqkvBy+RhChXiP/JBUtH2oZZ/vg1sROo/qXa0+Sl1AOBPNxn5
	IolvYH1pvJnpUNPyuBndYlCxgIi/goJIKVJsin9b22uJKgaYcQB76b0/
X-Gm-Gg: ASbGncv2YG1aFXf3hglUzzyBejsTt5X1N/2yhC15qmwDOzW1z4H/LilwYkq++XG8UAT
	N0roec4Q51sv8d48PUofLI8/tRcH5cmnk9ZtMvLdD4OnaE6yuoOqtfx/RkIsz/PLCIJf8uBZTNv
	OHCdDPeYkWqspqPSgT9WLW7MsCmcJEGl9Eh5gyUJC5kRIULaDQRxaY9IVHa/rGYKf0ZdQa3uEhy
	MtwdkF3sQ6R9GufideBo2D7WlPe4GH1T0TLAryx95JS/XRf76kEiD7ETcaHThs/s0oPgN6nsAQQ
	16wZzPbfgKXAzRDVsoRTBoTeZZ1SPKu7TekdHGfGAkAkpfRV8d5GSCMeoCc7XCld8x0BKPUBVXL
	5ZZ8Xr7YoBobR0MpteVeR17QCzI31hok0yWWOYRV+VI6WzXDVdkwqI4bqYQyrl63dCYlIs+8Hbb
	9cDS2sPwLCYg==
X-Google-Smtp-Source: AGHT+IGPxek9rb53Ximkpkaumucrgng5VeDuIhUsDvmIZ+V2MTxI6ONwkIEmWMDo7OzJnyOZGmVRjw==
X-Received: by 2002:a05:651c:1614:b0:373:a93d:5b4d with SMTP id 38308e7fff4ca-37a05e4e256mr6276451fa.14.1761732344095;
        Wed, 29 Oct 2025 03:05:44 -0700 (PDT)
Received: from [10.38.18.54] ([213.255.186.37])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee09213fsm32546531fa.1.2025.10.29.03.05.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 03:05:43 -0700 (PDT)
Message-ID: <d05c62c9-7ed7-46e4-aa4d-27172741b5ee@gmail.com>
Date: Wed, 29 Oct 2025 12:05:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: dts: freescale: add Ka-Ro Electronics
 tx8m-1610 COM
To: =?UTF-8?Q?Lothar_Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Cc: Maud Spierings <maudspierings@gocontroll.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
 <20251029104838.44c5adcf@karo-electronics.de>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20251029104838.44c5adcf@karo-electronics.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_030546_649072_DBA26C49 
X-CRM114-Status: GOOD (  33.37  )
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

On 29/10/2025 11:48, Lothar Waßmann wrote:
> Hi,
> 
> On Wed, 29 Oct 2025 10:42:17 +0200 Matti Vaittinen wrote:
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
>>>>>>      
>>>>>
>>>>> Ah I didn't know those existed, should've checked the bindings in more
>>>>> detail, thanks for the hint!
>>>>>
>>>>> I will have to investigate this carefully, since I don't have access to
>>>>> the actual design of the COM, so I don't know exactly what is there.
>>>>>       
>>>>
>>>> So I am not yet entirely sure if this works out, I used the calculation
>>>> in the driver:
>>>>
>>>> /*
>>>>     * Setups where regulator (especially the buck8) output voltage is scaled
>>>>     * by adding external connection where some other regulator output is
>>>> connected
>>>>     * to feedback-pin (over suitable resistors) is getting popular amongst
>>>> users
>>>>     * of BD71837. (This allows for example scaling down the buck8 voltages
>>>> to suit
>>>>     * lover GPU voltages for projects where buck8 is (ab)used to supply power
>>>>     * for GPU. Additionally some setups do allow DVS for buck8 but as this do
>>>>     * produce voltage spikes the HW must be evaluated to be able to
>>>> survive this
>>>>     * - hence I keep the DVS disabled for non DVS bucks by default. I
>>>> don't want
>>>>     * to help you burn your proto board)
>>>>     *
>>>>     * So we allow describing this external connection from DT and scale the
>>>>     * voltages accordingly. This is what the connection should look like:
>>>>     *
>>>>     * |------------|
>>>>     * |	buck 8  |-------+----->Vout
>>>>     * |		|	|
>>>>     * |------------|	|
>>>>     *	| FB pin	|
>>>>     *	|		|
>>>>     *	+-------+--R2---+
>>>>     *		|
>>>>     *		R1
>>>>     *		|
>>>>     *	V FB-pull-up
>>>>     *
>>>>     *	Here the buck output is sifted according to formula:
>>>>     *
>>>>     * Vout_o = Vo - (Vpu - Vo)*R2/R1
>>>>     * Linear_step = step_orig*(R1+R2)/R1
>>>>     *
>>>>     * where:
>>>>     * Vout_o is adjusted voltage output at vsel reg value 0
>>>>     * Vo is original voltage output at vsel reg value 0
>>>>     * Vpu is the pull-up voltage V FB-pull-up in the picture
>>>>     * R1 and R2 are resistor values.
>>>>     *
>>>>     * As a real world example for buck8 and a specific GPU:
>>>>     * VLDO = 1.6V (used as FB-pull-up)
>>>>     * R1 = 1000ohms
>>>>     * R2 = 150ohms
>>>>     * VSEL 0x0 => 0.8V – (VLDO – 0.8) * R2 / R1 = 0.68V
>>>>     * Linear Step = 10mV * (R1 + R2) / R1 = 11.5mV
>>>>     */
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
>>> 	regulator-min-microvolt = <1350000>;
>>> 	regulator-max-microvolt = <1350000>;
>>> 	rohm,fb-pull-up-microvolt = <0>;
>>> 	rohm,feedback-pull-up-r1-ohms = <2200>;
>>> 	rohm,feedback-pull-up-r2-ohms = <499>;
>>> the correct voltage should be produced on the BUCK8 output, but a quick
>>> test with these parameters led to:
>>> |failed to get the current voltage: -EINVAL
>>> |bd718xx-pmic bd71847-pmic.3.auto: error -EINVAL: failed to register buck6 regulator
>>> |bd718xx-pmic: probe of bd71847-pmic.3.auto failed with error -22
>>>
>>> Apparently noone has ever tested this feature in real life.
>>
>> Thanks for trying it out Lothar. I am positive this was tested - but
>> probably the use-case has been using a pull-up. I assume having the zero
>> pull-up voltage causes the driver to calculate some bogus values. I
>> think fixing the computation in the driver might not be that big of a
>> task(?) The benefit of doing it would be that the correct voltages would
>> be calculated by the driver.
>>
>> If real voltages aren't matching what is calculated by the driver, then
>> the voltages requested by regulator consumers will cause wrong voltages
>> to be applied. Debug interfaces will also show wrong voltages, and the
>> safety limits set in the device-tree will not be really respected.
>>
>> I think this would be well worth fixing.
>>
> Before doing the real-life test I did the same calculation that's done
> in the driver to be sure that it will generate the correct values:
> bc 1.07.1
> Copyright 1991-1994, 1997, 1998, 2000, 2004, 2006, 2008, 2012-2017 Free Software Foundation, Inc.
> This is free software with ABSOLUTELY NO WARRANTY.
> For details type `warranty'.
> fb_uv=0
> r1=2200
> r2=499
> min=800000
> step=10000
> # default voltage without divider
> min+30*step
> 1100000
> min=min-(fb_uv-min)*r2/r1
> step=step*(r1+r2)/r1
> min
> 981454
> step
> 12268
> # default voltage with divider
> min+30*step
> 1349494
> 
> Probably we need to use this value rather than the nominal 135000 as
> the target voltage in the DTB.

Yes. When the driver calculates the voltages which match the actual 
voltages, then you should also use the actual voltages in the device-tree.

Yours,
	-- Matti

> 
> 
> Lothar Waßmann


