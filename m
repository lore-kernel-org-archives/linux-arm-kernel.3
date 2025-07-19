Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA9CCC83F34
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 10:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xu0eHIAbZ8YoFp9mG6OmxRR19wlP9Vw9CC33jTH/cSM=; b=3nIvJkGJmOIj8m+np22lQUtbIS
	SlkpXFENCh7T8d7hwIK3tlnXYncuBqz5i8rR0RNFX2UQlN8IQLXgevz7Jrc9n0HI+g7HJ2MLcU2Xh
	mLBuc9xFztE9fjkAnWDPPe7h1vLl+dijIn3LSFV+MeKcKvRLBzmp+OYRamrXbgRcM4pWEJH0k7kkc
	FhGJtdA/r5NOQt4viVxjNDH2ElLync/Nax/D9OO0KAKf1GvQ8fMIdgfhJB7CCRdNTwV9ezSigWRSU
	VJjinlKCNSjLZd2UPGEaHetPUKPDmWAi4lRbAkQh93l4qw2WZYaBJAjh9B81hEgbV67TW0nQe46xq
	sHESRRyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud4NR-0000000E7P1-3n6Z;
	Sat, 19 Jul 2025 10:01:09 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud4Ky-0000000E7Eh-3M29;
	Sat, 19 Jul 2025 09:58:38 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ae0d758c3a2so448728566b.2;
        Sat, 19 Jul 2025 02:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752919115; x=1753523915; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xu0eHIAbZ8YoFp9mG6OmxRR19wlP9Vw9CC33jTH/cSM=;
        b=H+P/f2gJ3sLMatzkZvCvgXz/1+cbO/xXDo4yVjNkmjiQKqJNAnSeJI4Pum2oP3z/q0
         RFxxMz7dQXBfFpf7x04Yyi7Y+UOv5n4bMhFD3Rpp8n4CBpVGx2C+aKY1L3RzTihtf1v1
         Gl3vMR4+VDZN9YHPXR/vxN81tC3ae2Puhez+RjtVB2udr8p9an4+PH1GCnaVtmhv6EdT
         2tS16jsRTYagIa6fqANWDC1E4VTyUtxhYkaHscIG+ZE9gOnPyDlF958aK1GpR1q9kQQa
         p2MyaLLCjPzwKP8HBiGQrZWdxxXtzT45ufURy08wLn7dc6Q94vNW6xgd1WvbvDWfepI7
         ddzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752919115; x=1753523915;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xu0eHIAbZ8YoFp9mG6OmxRR19wlP9Vw9CC33jTH/cSM=;
        b=aR6y+8kH2Sy3Ev7Vvs7TNNw77Avk6XRz19b+L8WplbGQN8Qw0eOgocSwXufeCIPdgw
         X+MRDnQ6CQYs2bisoM9RXYM0/9Mu+mXiJo8ngzr8JjpWAOgZ4su6FGPTY4jUXYRhspp9
         6uCBwmnk7pu6F5AOsFn5gGoaKxia32IxIgXAaECPZoaEo/WyqnuQwPKq2Ch8SpN0rwqN
         gAPmTNaZfC5c0xCl12yXFUqrQkIksM+eRYuO5YUzY3AqJc4DZJmHAN/J0LeYTTyO65KF
         61SK56NgAZr/LsMdVs0GPVh+tn9FzlxdCRtXYQ2Xe/pJo3R0FOxcWcRaVGX91yGWIu/5
         GLSA==
X-Forwarded-Encrypted: i=1; AJvYcCUpgx4JBmWqTiXJT8MVB94saJHJigxFUBwyCsbZAIKi4ytA72Umz2LI7xEksPKHKJF4XDm4L2Mw+vJMXoNEVTU=@lists.infradead.org, AJvYcCVJKQMt0i8792mL5NmepxuMJO4e7X/u+1RJtr3lY/NqIw+oHjaet4HgqEgIVrMUWZa2MZZnnSkqK4oPY6xUW21t@lists.infradead.org
X-Gm-Message-State: AOJu0YwDVNH/1v/bkuKQXyZ9rE/9e9ahy9zh9JoxXUwE4DJ+iVdeIX1X
	q+RJZZj2WlQtvSLSvTiKLO8cu4Wqx5rmO1i3pmgLVGckVzQ1cYRGpCc=
X-Gm-Gg: ASbGncuLRXF/a7I4vJ/zz/OIF60fMmjqqpvlxs40I25ICFtICaA2HKToe4hNF4WN3kV
	68gJ0EcHmEufC/sVCi3IFymnSAuFoOsto2qbOgrVyI1ucwVh07q3IxwWI8sq0jBDiyEDQdEuZOU
	bExeKKISGoIvCrO1Zybk5LjqlRTX4zWAqxTGP2klGfnrXPLDTwOKZ4/sDt1Q6wr4YR4hT2Byn+7
	zleWnaXIQLlVyWAmIbxc06hT265lE9W+9fxP0zyDZazcnBFAxn7Q87lg58agcTyxu4I0CQVTQ+u
	xuk86YzLCdROvF+0EgZ6WfDzY4UeAndM4y2xma3y65y9YPoqCNiILaG35px2Yud+8QHznAG2aDu
	xSQ4DlF2Kdm3aL7z0weYzquA3NcuIZDPBpdt567OCsG/oo3149aZIW5nAFy2ZkfVSkv7Q
X-Google-Smtp-Source: AGHT+IF5sBy8y7SSwQAQOjt1/u4yI/eL6f3AIZ67usdJy63oiXow7Kbazieb7CW57vQ705lEiDq+7A==
X-Received: by 2002:a17:907:3f95:b0:ae3:5da3:1a23 with SMTP id a640c23a62f3a-ae9c99c0d2bmr1216983766b.21.1752919114187;
        Sat, 19 Jul 2025 02:58:34 -0700 (PDT)
Received: from ?IPV6:2a02:810b:f13:8500:e8ef:8c02:6b1e:381c? ([2a02:810b:f13:8500:e8ef:8c02:6b1e:381c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca30d2esm276702766b.86.2025.07.19.02.58.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Jul 2025 02:58:33 -0700 (PDT)
Message-ID: <104a501d-b9b2-494e-b073-932ddadd7129@gmail.com>
Date: Sat, 19 Jul 2025 11:58:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] arm64: dts: rockchip: Add ROCK 2A/2F, Sige1 and
 NanoPi Zero2
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Jonas Karlman <jonas@kwiboo.se>, Yao Zi <ziyao@disroot.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chukun Pan <amadeus@jmu.edu.cn>,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250712173805.584586-1-jonas@kwiboo.se>
 <16d99271-ba04-4ce1-a335-fab1917637c7@kwiboo.se>
 <063ec197-bbd7-4ad2-add9-40f028e800b7@gmail.com> <11576357.nUPlyArG6x@diego>
Content-Language: en-US
From: Alex Bee <knaerzche@gmail.com>
In-Reply-To: <11576357.nUPlyArG6x@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_025836_844873_FE01558E 
X-CRM114-Status: GOOD (  40.92  )
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


Am 15.07.25 um 20:56 schrieb Heiko Stübner:
> Am Montag, 14. Juli 2025, 07:53:09 Mitteleuropäische Sommerzeit schrieb Alex Bee:
>> Hi Jonas, Hi Yao,
>>
>>> Hi Alex,
>>>
>>> On 7/13/2025 10:56 PM, Alex Bee wrote:
>>>> Hi Jonas,
>>>>
>>>>> Hi Alex,
>>>>>
>>>>> On 7/13/2025 9:13 PM, Alex Bee wrote:
>>>>>> Hi list, Hi Jonas,
>>>>>>
>>>>>>> This series adds dt-bindings and initial device tree for the following
>>>>>>> Rockchip RK3528A boards:
>>>>>>> - Radxa ROCK 2A/2F
>>>>>>> - ArmSoM Sige1
>>>>>>> - FriendlyElec NanoPi Zero2
>>>>>> this only sub-related to this series: Is there any particular reason, why
>>>>>> we call the compatible "rockchip,rk3528" and not "rockchip,rk3528a"? From
>>>>>> what I can see all boards currently supported (and those in this series)
>>>>>> are having the RK3528A version of the SoC. I didn't follow the development
>>>>>> here, but there are differences - I did a quick compare of the datasheets
>>>>>> of those two SoC versions - it looks like RK3528 version has USB3-DRD
>>>>>> controller, while RK3528A has USB3 host-only controller. Also it seems to
>>>>>> have different video codec IPs and the DRAM controller additionally
>>>>>> supports LPDDR4X.
>>>>> What datasheet versions did you check? I can only find:
>>>>> - RK3528 Rev 1.0 (2023-05-22)
>>>>> - RK3528A Rev 1.2 (2024-04-10)
>>>> I used
>>>>
>>>> 2023-07-12 Revision V1.0
>>>>
>>>> which didn't include these features - which is interesting: Why would a
>>>> SoC vendor not try to sell all features in the first place :)
>>>>
>>>> But I now double checked in
>>>>
>>>> 2025-05-12 Revision 1.4
>>>>
>>>> and you are right: It appears there also for RK3528A.
>>>>
>>>> The only difference I could now make out by comparing v1.4 of both versions
>>>> is the cipher engine: RK3528 additionally supports "SM2/SM3/SM4 cipher" -
>>>> but still it exists and additionally the different video codec (if mpp
>>>> userspace library is correct about that).
>>>>
>>>> Anyway: My question was more about: Why didn't we choose the correct
>>>> compatible from the beginning? And of course the dts files would have to be
>>>> renamed if the compatible is changed, as they are named according to their
>>>> SoC-compatible.
>>> Not sure, possible due to lack of technical documentation for this SoC,
>>> to my knowledge all upstream development has been done without any
>>> access to a TRM for the SoC.
>> Hhm, OK: Without any documentation, I'm seeing "RK3528A" silkscreened
>> directly on the SoC package :)
> So ... the TRM I meanwhile got, calls itself
> 	"Rockchip RK3528A Technical Reference Manual"
> in the title and
> 	"RK3528A TRM (Part 1)"
> on each page.
>
> The one thing with an "A" I remember was the rk3066a. There even was
> a rk3066b variant ... which was quite different, but I've never seen any
> products using that variant.
>
> So for the things to do:
>
> - renaming devicetree _files_ later is no problem ... the given "guarantee"
>    is that the kernel is supposed to boot with an old devicetree blob, you
>    found in the attic ;-) . (if it follows established bindings)
> - renaming compatibles is more difficult - and a lot of stuff already
>    calls itself rk3528 - without-a in a bunch of bindings.
>
> So part of me just sees continuing without-a as the way to go, that
> rk3518 mentioned below even has a different number ;-)
>
> And wait until an actual rk3528 b-c-whatever variant needing different
> stuff comes along.
The issue I was seeing is that there actually *is* a variant called
'RK3528' which at least according to the latest datasheets slightly differs
from 'RK3528A'. We are doing development based on 'RK3528A' and calling it
'rockchip,rk3528' which might make it hard to add the non-A-variant in
future (unless we call it 'rockchip,the-actual-rk3528').
>
> Heiko
>
>
>>> Based on vendor code (u-boot and linux) there does not seem to be
>>> anything special about the A-variant, so my thinking has always been
>>> that the A-variant may have just been an updated/fixed hw revision and
>>> is the version that went into newer production devices.
>>>
>>> The recently released U-Boot 2025.07 is referencing the filename
>>> rk3528-radxa-e20c.dtb from the synced devicetree-rebasing tree. So a
>>> possible rename will affect a future release of U-Boot, and possible
>>> devices in the field depending on when a rename would land in linux.
>>>
>>> For this series I tried to just follow what is currently used for the
>>> Radxa E20C.
>>>
>>> If I am correct there is now also a RK3518 tvbox variant of this SoC,
>>> do not know how that would fit into all this :-S
>> Yeah, that's why I started comparing the features - and according to
>> RK3518's datasheet it only has the features I mentioned in my first mail
>> for RK3528A minus PCIe and the ability to connect an external ethernet phy
>> to the gmac controller (it probably has only one). Well, it's version 1.0 of
>> the datasheet ...
>>
>> Regards,
>> Alex
>>
>>> Regards,
>>> Jonas
>>>
>>>> Regards,
>>>> Alex
>>>>> And both list LPDDR4X support and the A-variant seem to list USB3-DRD
>>>>> support, did you mix them up above?
>>>>>
>>>>> I think these SoCs are similar to rk3228/rk3229, rk3228h/rk3328 and now
>>>>> rk3528/rk3528a, in that only the second variant support VP9 decoding.
>>>>>
>>>>> Use of rockchip,rk3528a compatible could be something to change,
>>>>> could also be something that bootloader set at runtime, similar to
>>>>> what it does for rk3288w.
>>>>>
>>>>>> I guess it would be good to discuss this before this series is merged,
>>>>>> because re-naming *.dts files after they have been in a release is somewhat
>>>>>> impossible.
>>>>> I think renaming the device tree files is unnecessary, as there seem to
>>>>> be very little difference. All boards I have come across are currently
>>>>> RK3528A variants. How would we treat the Radxa E20C?, it is not named
>>>>> rk3528-radxa-e20c.dtb, yet uses the A-variant.
>>>>>
>>>>> For mainline U-Boot I have included printing out the SoC-variant,
>>>>> however the compatible is not adjusted:
>>>>>
>>>>>      Model: Radxa E20C
>>>>>      SoC:   RK3528A
>>>>>      DRAM:  2 GiB
>>>>>
>>>>> Regards,
>>>>> Jonas
>>>>>
>>>>>> Regards,
>>>>>> Alex
>>>>>>> The bt/wifi_reg_on pins are described in the device tree using
>>>>>>> rfkill-gpio nodes.
>>>>>>>
>>>>>>> Changes in v3:
>>>>>>> - Rename led nodes to led-0/led-1
>>>>>>> - Remove pinctrl* props from sdio0
>>>>>>> - Collect a-b tags
>>>>>>>
>>>>>>> Changes in v2:
>>>>>>> - Limit sdmmc max-frequency to 100 MHz on ROCK 2A/2F
>>>>>>> - Drop clock-output-names prop from rtc node on Sige1 and NanoPi Zero2
>>>>>>> - Drop regulator-boot-on from usb 2.0 host regulators on Sige1
>>>>>>> - Add bluetooth and wifi nodes on Sige1
>>>>>>> - Collect t-b tag for NanoPi Zero2
>>>>>>>
>>>>>>> These boards can be booted from emmc or sd-card using the U-Boot 2025.07
>>>>>>> generic-rk3528 target or work-in-progress patches for these boards [1].
>>>>>>>
>>>>>>> For working bluetooth on ArmSoM Sige1 the patch "arm64: dts: rockchip:
>>>>>>> Fix UART DMA support for RK3528" [2] is required.
>>>>>>>
>>>>>>> [1] https://source.denx.de/u-boot/contributors/kwiboo/u-boot/-/commits/rk3528
>>>>>>> [2] https://lore.kernel.org/r/20250709210831.3170458-1-jonas@kwiboo.se
>>>>>>>
>>>>>>> Jonas Karlman (6):
>>>>>>>       dt-bindings: arm: rockchip: Add Radxa ROCK 2A/2F
>>>>>>>       arm64: dts: rockchip: Add Radxa ROCK 2A/2F
>>>>>>>       dt-bindings: arm: rockchip: Add ArmSoM Sige1
>>>>>>>       arm64: dts: rockchip: Add ArmSoM Sige1
>>>>>>>       dt-bindings: arm: rockchip: Add FriendlyElec NanoPi Zero2
>>>>>>>       arm64: dts: rockchip: Add FriendlyElec NanoPi Zero2
>>>>>>>
>>>>>>>      .../devicetree/bindings/arm/rockchip.yaml     |  17 +
>>>>>>>      arch/arm64/boot/dts/rockchip/Makefile         |   4 +
>>>>>>>      .../boot/dts/rockchip/rk3528-armsom-sige1.dts | 465 ++++++++++++++++++
>>>>>>>      .../boot/dts/rockchip/rk3528-nanopi-zero2.dts | 340 +++++++++++++
>>>>>>>      .../boot/dts/rockchip/rk3528-rock-2.dtsi      | 293 +++++++++++
>>>>>>>      .../boot/dts/rockchip/rk3528-rock-2a.dts      |  82 +++
>>>>>>>      .../boot/dts/rockchip/rk3528-rock-2f.dts      |  10 +
>>>>>>>      7 files changed, 1211 insertions(+)
>>>>>>>      create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dts
>>>>>>>      create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts
>>>>>>>      create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2.dtsi
>>>>>>>      create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dts
>>>>>>>      create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dts
>>>>>>>
>
>
>

