Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9689AC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 05:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VCZ2zgHNivfrlQy83HcGVg6gs2AAz7FnGq4tvjzUvag=; b=AYxl7YKMkImsOUdCBSCw3UtzgT
	Kr3TyZa7Ow4x/p9rhgITfWxq7TWQcLzwGj0GgVh2nAya40503AYUyIuC7L+LqoMDLaJsMQFacTjjk
	KxuxCOp+hxQvYV5NpOuMmFd86XipQmpJE+p6asXmCRRnQbESKjC97+/j4FDHY4gNg7kaGC9xoYfaF
	ehEy7V+0+w1adY60lb3io6/T9jMdiTxF3ayeFi/511q7NRzQ2LSVrbA9sXL5Q3OoDamrxIs4j6eKQ
	0yUbh7FOgs5dD1gbYZ6Bz8rXc5Qm3FwD7AnbU6g9IEk3Usm14d9dq1zsxNV2K0JfRncWGZ7apjGDR
	NLZUGvWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubCAB-00000001FwE-48OC;
	Mon, 14 Jul 2025 05:55:43 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubC7k-00000001Fe2-1xTx;
	Mon, 14 Jul 2025 05:53:14 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3a6e8b1fa37so3234247f8f.2;
        Sun, 13 Jul 2025 22:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752472391; x=1753077191; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VCZ2zgHNivfrlQy83HcGVg6gs2AAz7FnGq4tvjzUvag=;
        b=j1n2eQ+Ct7b1AwZEpfbyaO90YKFC0Dc571u53pMiY6c6f7B8Ym/Z9SbfWeTxALBWIv
         xBL3/4tB+uRqp70JC2girmlqNC8egMCzePpM0++oH5zsln+KdN5PibeXxAT4zfBo2JOj
         ZTsKad9HCXZ8Dr1EU4W8e0GLbuDoSdf6LFltTLmvQBpLn8iJOs7eHl0UqeQ19tJeYkqZ
         TTALTRYRapc0/c+zK0bC4Qa190/tU5XVrfuJrR/aNbh1d2F2MtLUDSRwJefCJX6xii18
         4S8//KVRIw0GmFXRcb2wPzbABLN0jdXaILhTAzdk0lrs4GoyfIQydbsZROuHUn4quhYG
         lZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752472391; x=1753077191;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VCZ2zgHNivfrlQy83HcGVg6gs2AAz7FnGq4tvjzUvag=;
        b=YBMcGGkbJtuxPvOkO+8GHEy+MQrBXt9+tF22nO/rc3rUNZ8oMmJuzpLVyYQzTYngY6
         rrP+RvEiS+NytPsQ/Y4QRZDLnoj5leMz99YC5mHzi56c9XHa52jEfk1kclT6ugphLrsp
         N03FlMvm4XAxddDoZPY4kc7JE0OHmZcqGOozrVefvoeDuc15UccVDoZQNMXl4mpEf2JL
         /kv5KyFfHPVLlnEODG6Lahnrm/CpCX5zbDRJ3Kgp7hlYNeniI5EEuBFxIBxrISbiDvKB
         4SGgd4OR+/8VELt6DZUenRl6f1GdLoVUP/Ju3hnD4CArji/Uy1rMuJbiVqeilSk7B686
         C+SA==
X-Forwarded-Encrypted: i=1; AJvYcCX19lkwWHaJ9ktlAuhvzGvZtelcZEYhM83FKfFtNJMc7x0uGrtPN++PT8VTs/HXscJPQM/YxdDno4zbGzirmA4=@lists.infradead.org, AJvYcCXlkujnvojRKcgeA8XfX/p4cHu0HM3L4SSwadompK7chEubEiVC4IMSMdGRhq3H58SZw1Ksa9A3Tbvody2SjxyY@lists.infradead.org
X-Gm-Message-State: AOJu0YyH/TVj1I801elyiYuXsIbJQorJ3UOmHoc1TZGXql2VM8vkdPzE
	9nkTnZRUGXQsS5Dg+54Nv0i/0W0oIaS7+XdfYxOcXKxl/efpq5KmZ14=
X-Gm-Gg: ASbGnctw4TeNtobvqFHCs3ToHee6HML1zCqDr5G75ynNiTt3TO7yHcsdVgSX4VxuhH0
	412ZLb81Vo3567aJjKAIygQ4YlhLd2YnfyBRRK5Oep+G+uie55f/76Fc3sCsriQrWJrdqy8oeNc
	sMQx0XhET60ZiusoQ+M97a4YQjoPQ1IcwzAr7esimY8uY9RYIcXoNPwk7hUA4P4vYmw6Ky/aEHo
	hEhCbI34HQVWvWeX5URilv5Nzr+QswbKQOkqnI7qW9PxiS6STjKp3uKJw9zYuCURUYUOitHA/Ju
	IAcR4Mz5gXM1y0065Vy1LUTAZVTcC2c6FCbVscKislIaHk5oqkmlqI/6bSjGoQyBJlPaCgqA+kE
	t2n2XxlI4oXgEqCMNVIuP7sVUeWVqIOfhyaSNnXAfSLjyY0amVpvARA6wGEqFzo4pUA==
X-Google-Smtp-Source: AGHT+IF4uJU7s6fXi+Y9jOTJvVuXL0uE2v7zzu2YywbAlMlS+6hlXGxr7DpZydpCkb2LPrj9QmWEsg==
X-Received: by 2002:a05:6000:25f6:b0:3b5:e714:9770 with SMTP id ffacd0b85a97d-3b5f188d771mr10238050f8f.14.1752472390481;
        Sun, 13 Jul 2025 22:53:10 -0700 (PDT)
Received: from ?IPV6:2a02:810b:f13:8500:dd8c:af5b:c87:6021? ([2a02:810b:f13:8500:dd8c:af5b:c87:6021])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4560d019f1esm57650915e9.10.2025.07.13.22.53.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Jul 2025 22:53:09 -0700 (PDT)
Message-ID: <063ec197-bbd7-4ad2-add9-40f028e800b7@gmail.com>
Date: Mon, 14 Jul 2025 07:53:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] arm64: dts: rockchip: Add ROCK 2A/2F, Sige1 and
 NanoPi Zero2
To: Jonas Karlman <jonas@kwiboo.se>, Yao Zi <ziyao@disroot.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chukun Pan <amadeus@jmu.edu.cn>,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250712173805.584586-1-jonas@kwiboo.se>
 <702dc4bb-7b3c-4647-b84f-8516989b0836@gmail.com>
 <9aae8b30-23ae-4866-9ce8-02bbc8b44a82@kwiboo.se>
 <88c7b90d-4c29-453b-9a5c-9679b371a3a9@gmail.com>
 <16d99271-ba04-4ce1-a335-fab1917637c7@kwiboo.se>
Content-Language: en-US
From: Alex Bee <knaerzche@gmail.com>
In-Reply-To: <16d99271-ba04-4ce1-a335-fab1917637c7@kwiboo.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_225312_514041_A0768279 
X-CRM114-Status: GOOD (  39.07  )
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

Hi Jonas, Hi Yao,

> Hi Alex,
>
> On 7/13/2025 10:56 PM, Alex Bee wrote:
>> Hi Jonas,
>>
>>> Hi Alex,
>>>
>>> On 7/13/2025 9:13 PM, Alex Bee wrote:
>>>> Hi list, Hi Jonas,
>>>>
>>>>> This series adds dt-bindings and initial device tree for the following
>>>>> Rockchip RK3528A boards:
>>>>> - Radxa ROCK 2A/2F
>>>>> - ArmSoM Sige1
>>>>> - FriendlyElec NanoPi Zero2
>>>> this only sub-related to this series: Is there any particular reason, why
>>>> we call the compatible "rockchip,rk3528" and not "rockchip,rk3528a"? From
>>>> what I can see all boards currently supported (and those in this series)
>>>> are having the RK3528A version of the SoC. I didn't follow the development
>>>> here, but there are differences - I did a quick compare of the datasheets
>>>> of those two SoC versions - it looks like RK3528 version has USB3-DRD
>>>> controller, while RK3528A has USB3 host-only controller. Also it seems to
>>>> have different video codec IPs and the DRAM controller additionally
>>>> supports LPDDR4X.
>>> What datasheet versions did you check? I can only find:
>>> - RK3528 Rev 1.0 (2023-05-22)
>>> - RK3528A Rev 1.2 (2024-04-10)
>> I used
>>
>> 2023-07-12 Revision V1.0
>>
>> which didn't include these features - which is interesting: Why would a
>> SoC vendor not try to sell all features in the first place :)
>>
>> But I now double checked in
>>
>> 2025-05-12 Revision 1.4
>>
>> and you are right: It appears there also for RK3528A.
>>
>> The only difference I could now make out by comparing v1.4 of both versions
>> is the cipher engine: RK3528 additionally supports "SM2/SM3/SM4 cipher" -
>> but still it exists and additionally the different video codec (if mpp
>> userspace library is correct about that).
>>
>> Anyway: My question was more about: Why didn't we choose the correct
>> compatible from the beginning? And of course the dts files would have to be
>> renamed if the compatible is changed, as they are named according to their
>> SoC-compatible.
> Not sure, possible due to lack of technical documentation for this SoC,
> to my knowledge all upstream development has been done without any
> access to a TRM for the SoC.
Hhm, OK: Without any documentation, I'm seeing "RK3528A" silkscreened
directly on the SoC package :)

> Based on vendor code (u-boot and linux) there does not seem to be
> anything special about the A-variant, so my thinking has always been
> that the A-variant may have just been an updated/fixed hw revision and
> is the version that went into newer production devices.
>
> The recently released U-Boot 2025.07 is referencing the filename
> rk3528-radxa-e20c.dtb from the synced devicetree-rebasing tree. So a
> possible rename will affect a future release of U-Boot, and possible
> devices in the field depending on when a rename would land in linux.
>
> For this series I tried to just follow what is currently used for the
> Radxa E20C.
>
> If I am correct there is now also a RK3518 tvbox variant of this SoC,
> do not know how that would fit into all this :-S
Yeah, that's why I started comparing the features - and according to
RK3518's datasheet it only has the features I mentioned in my first mail
for RK3528A minus PCIe and the ability to connect an external ethernet phy
to the gmac controller (it probably has only one). Well, it's version 1.0 of
the datasheet ...

Regards,
Alex

> Regards,
> Jonas
>
>> Regards,
>> Alex
>>> And both list LPDDR4X support and the A-variant seem to list USB3-DRD
>>> support, did you mix them up above?
>>>
>>> I think these SoCs are similar to rk3228/rk3229, rk3228h/rk3328 and now
>>> rk3528/rk3528a, in that only the second variant support VP9 decoding.
>>>
>>> Use of rockchip,rk3528a compatible could be something to change,
>>> could also be something that bootloader set at runtime, similar to
>>> what it does for rk3288w.
>>>
>>>> I guess it would be good to discuss this before this series is merged,
>>>> because re-naming *.dts files after they have been in a release is somewhat
>>>> impossible.
>>> I think renaming the device tree files is unnecessary, as there seem to
>>> be very little difference. All boards I have come across are currently
>>> RK3528A variants. How would we treat the Radxa E20C?, it is not named
>>> rk3528-radxa-e20c.dtb, yet uses the A-variant.
>>>
>>> For mainline U-Boot I have included printing out the SoC-variant,
>>> however the compatible is not adjusted:
>>>
>>>     Model: Radxa E20C
>>>     SoC:   RK3528A
>>>     DRAM:  2 GiB
>>>
>>> Regards,
>>> Jonas
>>>
>>>> Regards,
>>>> Alex
>>>>> The bt/wifi_reg_on pins are described in the device tree using
>>>>> rfkill-gpio nodes.
>>>>>
>>>>> Changes in v3:
>>>>> - Rename led nodes to led-0/led-1
>>>>> - Remove pinctrl* props from sdio0
>>>>> - Collect a-b tags
>>>>>
>>>>> Changes in v2:
>>>>> - Limit sdmmc max-frequency to 100 MHz on ROCK 2A/2F
>>>>> - Drop clock-output-names prop from rtc node on Sige1 and NanoPi Zero2
>>>>> - Drop regulator-boot-on from usb 2.0 host regulators on Sige1
>>>>> - Add bluetooth and wifi nodes on Sige1
>>>>> - Collect t-b tag for NanoPi Zero2
>>>>>
>>>>> These boards can be booted from emmc or sd-card using the U-Boot 2025.07
>>>>> generic-rk3528 target or work-in-progress patches for these boards [1].
>>>>>
>>>>> For working bluetooth on ArmSoM Sige1 the patch "arm64: dts: rockchip:
>>>>> Fix UART DMA support for RK3528" [2] is required.
>>>>>
>>>>> [1] https://source.denx.de/u-boot/contributors/kwiboo/u-boot/-/commits/rk3528
>>>>> [2] https://lore.kernel.org/r/20250709210831.3170458-1-jonas@kwiboo.se
>>>>>
>>>>> Jonas Karlman (6):
>>>>>      dt-bindings: arm: rockchip: Add Radxa ROCK 2A/2F
>>>>>      arm64: dts: rockchip: Add Radxa ROCK 2A/2F
>>>>>      dt-bindings: arm: rockchip: Add ArmSoM Sige1
>>>>>      arm64: dts: rockchip: Add ArmSoM Sige1
>>>>>      dt-bindings: arm: rockchip: Add FriendlyElec NanoPi Zero2
>>>>>      arm64: dts: rockchip: Add FriendlyElec NanoPi Zero2
>>>>>
>>>>>     .../devicetree/bindings/arm/rockchip.yaml     |  17 +
>>>>>     arch/arm64/boot/dts/rockchip/Makefile         |   4 +
>>>>>     .../boot/dts/rockchip/rk3528-armsom-sige1.dts | 465 ++++++++++++++++++
>>>>>     .../boot/dts/rockchip/rk3528-nanopi-zero2.dts | 340 +++++++++++++
>>>>>     .../boot/dts/rockchip/rk3528-rock-2.dtsi      | 293 +++++++++++
>>>>>     .../boot/dts/rockchip/rk3528-rock-2a.dts      |  82 +++
>>>>>     .../boot/dts/rockchip/rk3528-rock-2f.dts      |  10 +
>>>>>     7 files changed, 1211 insertions(+)
>>>>>     create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dts
>>>>>     create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts
>>>>>     create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2.dtsi
>>>>>     create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dts
>>>>>     create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dts
>>>>>

