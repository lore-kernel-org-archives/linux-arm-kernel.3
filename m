Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB75C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 20:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=to7crXpmc3tk8K8ESb5T/YynsyRL1Ajh9nnIinlJZZM=; b=P6YDYkicZNGKJWsfjwZRB/brSl
	ReYKeIky2RSCmpnmsjxlp55IhTl9zOuCTpanB1HqoCK816seZzkhquRrbWd6GYZIAIBqFEOHkKwA2
	i+HgFZrJyBp3h7f5+zS0swKUJYU+x8w6X+D4JIu6UZPe4/hZWl6pmMidwR6cWzNGl6I3M9C7vqSY4
	vzVuSRpN78iJVC9VEbweu/mca5QQbMXDV0QWkqMozkeTp8v3yMOBwgWEoc8p4gSDcSSyoHpMBdUDW
	IJc67qrWYIzjHG1PFOJ0zChC5x6FRmBL0bU+riIT4QurojvN+rtPTPs9NU1wrNAHnzjCisXHQRNna
	27uJ3Vrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub3nJ-00000000chP-0dtS;
	Sun, 13 Jul 2025 20:59:33 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub3kt-00000000cWq-3aak;
	Sun, 13 Jul 2025 20:57:05 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-455fdfb5d04so7929095e9.2;
        Sun, 13 Jul 2025 13:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752440222; x=1753045022; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=to7crXpmc3tk8K8ESb5T/YynsyRL1Ajh9nnIinlJZZM=;
        b=lx3lYIXrECE7mawEZaRi52qydm90QXAd2cnRyK015lXqBRYC47mLqYUNb1bdfMD5kQ
         Fgz7R63TCeDbqR9zxAaLgQ5fu2r66kECjihg049XAAq/DQZAhD7DFMa3wl7RfNNYofCb
         ohh/rYLdUJPiol/IKMtqNZmPm6SEtLwu8ieBdQ/oB3gEu1g8FHHMGmZcAv1R3q/fED3g
         vXusXfvSTAxItIFUXz0UNB2yu61Pm2UIA182WlqEPXldBnyC3+u6+rt8x3Hk1SN7fsb8
         LhRznqw/WwBNllxoeVOL+VmyWTp1Ol0mgSyu1vOn8UGrP1tm3zIZyOpu5RKplwWwn7Qm
         jyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752440222; x=1753045022;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=to7crXpmc3tk8K8ESb5T/YynsyRL1Ajh9nnIinlJZZM=;
        b=c6xaiLuEVD9RfcYBBrdiMqCWH8JMtsJcQEXyd2G3BAm/5VJ0wPWHK16FrPe48e6Ag2
         ulP0jeeacrIsNEjaA66Zn3oBpmLJOuCJ9PK/Wqccm4d7MIRfeb4zebGgc4Jkan78HddB
         42AbYWpjnkDAbrWR49AkaMPbO857OvkFxe8GGAnyQGCpuHK7iPI9hWXUYEUvLgaPF0ll
         ifgMAz9Dj4G3CuipktESH8FD1Ty9qdRaJ/EvAUtD0XBLFnwdGYA3zb10Y99T95ftAI7c
         1uNyheLPKx/KTkJVGAhlktp564IG3Q9yRVg1ctXs69WEwSEVGYAJWL2bJXEzWhoVLxkJ
         UDUA==
X-Forwarded-Encrypted: i=1; AJvYcCWbLxV+pz86NsdqWZ6wloJ9Sn7DHP1vk5u5Drf5B9lOBbCfKEtLFnoFyTl/2JVKPjFh+tWP6ImTj+ivC/dW+z2k@lists.infradead.org, AJvYcCXcG9BqbSNpxZQnN0u7+znyNa7UqMRE6P5noLqAF5qUm6uc57enyYR71yLcLsaN6qQxi0IA67ZcNniybLCzZWc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzQX4sLGaRTmC4DKtykDbgYKxBTuL/bc3dqPMuaGJwTYmHi9IFa
	H5DNSXCuyXcY4SBwaclH0hrVSFLN7ZiL8wZeszTrLsElBdL/GHnBzxg=
X-Gm-Gg: ASbGncsojCk4WdexAnZD2Aam5aypDa2kwe4xwZ7Qaig9hPwj4jQflzbir0MJw4ln9B0
	yHsMFJys7YTmD4lqu6YdPVWAXo8Id3dpINe6sbRPpEmN4U1+0gjnBrbWwtRjBK6VsP5+3WxBfpU
	e/OScR82PHAXAiL1KmjA41NjxseCVwN1u4OF7hVs4gkNQrhwXUPAQyhCEyYUQ3ywCfQE93+QtNc
	/X6qTCp25tLAFFldjDKZW6RTKBuqUrTi1ACaJ3cPl/kOrJ36fxiC0LNiCOjklsp6Je3JlV2rSIQ
	/L25MfYym43RkYMesbLpFYwE/4YNX/NPwRhp8nKpI2+vDu5wCnKQJNxyJyarogsIUqJe5Hzkv/r
	cYu/mdZ6QWlNePcUPi/Gv5/KmYlYw48r9C6LWU2mwdUoLKOz8jHP9ID7VHG9tqHC62Pw/
X-Google-Smtp-Source: AGHT+IF5La+hY8Yrg7YwlzCxMrCYulsyoeM7g42TWSERJAPSWP3FmuZJ9Rfhs1Cyvy8o8wqIAENgjw==
X-Received: by 2002:a05:600c:4591:b0:451:edc8:7806 with SMTP id 5b1f17b1804b1-454fe10f716mr93836375e9.32.1752440221829;
        Sun, 13 Jul 2025 13:57:01 -0700 (PDT)
Received: from ?IPV6:2a02:810b:f13:8500:303c:fa0e:1d48:e93b? ([2a02:810b:f13:8500:303c:fa0e:1d48:e93b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc91e3sm10476269f8f.43.2025.07.13.13.56.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Jul 2025 13:57:00 -0700 (PDT)
Message-ID: <88c7b90d-4c29-453b-9a5c-9679b371a3a9@gmail.com>
Date: Sun, 13 Jul 2025 22:56:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] arm64: dts: rockchip: Add ROCK 2A/2F, Sige1 and
 NanoPi Zero2
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yao Zi <ziyao@disroot.org>,
 Chukun Pan <amadeus@jmu.edu.cn>, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250712173805.584586-1-jonas@kwiboo.se>
 <702dc4bb-7b3c-4647-b84f-8516989b0836@gmail.com>
 <9aae8b30-23ae-4866-9ce8-02bbc8b44a82@kwiboo.se>
Content-Language: en-US
From: Alex Bee <knaerzche@gmail.com>
In-Reply-To: <9aae8b30-23ae-4866-9ce8-02bbc8b44a82@kwiboo.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_135703_906173_28D39C9F 
X-CRM114-Status: GOOD (  32.26  )
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

Hi Jonas,

> Hi Alex,
>
> On 7/13/2025 9:13 PM, Alex Bee wrote:
>> Hi list, Hi Jonas,
>>
>>> This series adds dt-bindings and initial device tree for the following
>>> Rockchip RK3528A boards:
>>> - Radxa ROCK 2A/2F
>>> - ArmSoM Sige1
>>> - FriendlyElec NanoPi Zero2
>>
>> this only sub-related to this series: Is there any particular reason, why
>> we call the compatible "rockchip,rk3528" and not "rockchip,rk3528a"? From
>> what I can see all boards currently supported (and those in this series)
>> are having the RK3528A version of the SoC. I didn't follow the development
>> here, but there are differences - I did a quick compare of the datasheets
>> of those two SoC versions - it looks like RK3528 version has USB3-DRD
>> controller, while RK3528A has USB3 host-only controller. Also it seems to
>> have different video codec IPs and the DRAM controller additionally
>> supports LPDDR4X.
> What datasheet versions did you check? I can only find:
> - RK3528 Rev 1.0 (2023-05-22)
> - RK3528A Rev 1.2 (2024-04-10)
I used

2023-07-12 Revision V1.0

which didn't include these features - which is interesting: Why would a
SoC vendor not try to sell all features in the first place :)

But I now double checked in

2025-05-12 Revision 1.4

and you are right: It appears there also for RK3528A.

The only difference I could now make out by comparing v1.4 of both versions
is the cipher engine: RK3528 additionally supports "SM2/SM3/SM4 cipher" -
but still it exists and additionally the different video codec (if mpp
userspace library is correct about that).

Anyway: My question was more about: Why didn't we choose the correct
compatible from the beginning? And of course the dts files would have to be
renamed if the compatible is changed, as they are named according to their
SoC-compatible.

Regards,
Alex
>
> And both list LPDDR4X support and the A-variant seem to list USB3-DRD
> support, did you mix them up above?
>
> I think these SoCs are similar to rk3228/rk3229, rk3228h/rk3328 and now
> rk3528/rk3528a, in that only the second variant support VP9 decoding.
>
> Use of rockchip,rk3528a compatible could be something to change,
> could also be something that bootloader set at runtime, similar to
> what it does for rk3288w.
>
>> I guess it would be good to discuss this before this series is merged,
>> because re-naming *.dts files after they have been in a release is somewhat
>> impossible.
> I think renaming the device tree files is unnecessary, as there seem to
> be very little difference. All boards I have come across are currently
> RK3528A variants. How would we treat the Radxa E20C?, it is not named
> rk3528-radxa-e20c.dtb, yet uses the A-variant.
>
> For mainline U-Boot I have included printing out the SoC-variant,
> however the compatible is not adjusted:
>
>    Model: Radxa E20C
>    SoC:   RK3528A
>    DRAM:  2 GiB
>
> Regards,
> Jonas
>
>> Regards,
>> Alex
>>> The bt/wifi_reg_on pins are described in the device tree using
>>> rfkill-gpio nodes.
>>>
>>> Changes in v3:
>>> - Rename led nodes to led-0/led-1
>>> - Remove pinctrl* props from sdio0
>>> - Collect a-b tags
>>>
>>> Changes in v2:
>>> - Limit sdmmc max-frequency to 100 MHz on ROCK 2A/2F
>>> - Drop clock-output-names prop from rtc node on Sige1 and NanoPi Zero2
>>> - Drop regulator-boot-on from usb 2.0 host regulators on Sige1
>>> - Add bluetooth and wifi nodes on Sige1
>>> - Collect t-b tag for NanoPi Zero2
>>>
>>> These boards can be booted from emmc or sd-card using the U-Boot 2025.07
>>> generic-rk3528 target or work-in-progress patches for these boards [1].
>>>
>>> For working bluetooth on ArmSoM Sige1 the patch "arm64: dts: rockchip:
>>> Fix UART DMA support for RK3528" [2] is required.
>>>
>>> [1] https://source.denx.de/u-boot/contributors/kwiboo/u-boot/-/commits/rk3528
>>> [2] https://lore.kernel.org/r/20250709210831.3170458-1-jonas@kwiboo.se
>>>
>>> Jonas Karlman (6):
>>>     dt-bindings: arm: rockchip: Add Radxa ROCK 2A/2F
>>>     arm64: dts: rockchip: Add Radxa ROCK 2A/2F
>>>     dt-bindings: arm: rockchip: Add ArmSoM Sige1
>>>     arm64: dts: rockchip: Add ArmSoM Sige1
>>>     dt-bindings: arm: rockchip: Add FriendlyElec NanoPi Zero2
>>>     arm64: dts: rockchip: Add FriendlyElec NanoPi Zero2
>>>
>>>    .../devicetree/bindings/arm/rockchip.yaml     |  17 +
>>>    arch/arm64/boot/dts/rockchip/Makefile         |   4 +
>>>    .../boot/dts/rockchip/rk3528-armsom-sige1.dts | 465 ++++++++++++++++++
>>>    .../boot/dts/rockchip/rk3528-nanopi-zero2.dts | 340 +++++++++++++
>>>    .../boot/dts/rockchip/rk3528-rock-2.dtsi      | 293 +++++++++++
>>>    .../boot/dts/rockchip/rk3528-rock-2a.dts      |  82 +++
>>>    .../boot/dts/rockchip/rk3528-rock-2f.dts      |  10 +
>>>    7 files changed, 1211 insertions(+)
>>>    create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dts
>>>    create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts
>>>    create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2.dtsi
>>>    create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dts
>>>    create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dts
>>>

