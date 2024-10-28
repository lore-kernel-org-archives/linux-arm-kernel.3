Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4614CD13588
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 11:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9WOt/O2aSaelze2ima45p34Z2cNV949LPG7fDV305A4=; b=4R85hTu8+0RCFS
	Ovf15cmJonDM/ZCE7r2WUcBJJ4A1fw0pHG33cbV6eTgksmAuYjAFyil3NZD2KCPtQ4yG6WtuVZG6U
	1s7J7p1mU5+zlHuLHzJIvLjeLfsnyGoURb0Pcu+1jCiXFWVeGPFUdTbUzXke8LIkLc0jdjI4usicN
	2XVVKImUousJ7vKAzveapWsKdN2QptQln0og5RLpBBZyU0bWRpcVR9TuEb2Cetc6odFA42DuOy5bf
	UshtYJ0wIG5uTmuZdZ5m+ajBsI8QUa6bZVG6NPevQxDHyY+/BmVxjSCxLQ20RLdYwWr8CNtLDZZOX
	4bohwpEHj6XIk43mkwbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5NsY-0000000AZnR-3Vy5;
	Mon, 28 Oct 2024 11:25:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5NqM-0000000AZBp-0CIr
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Oct 2024 11:23:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description;
	bh=9WOt/O2aSaelze2ima45p34Z2cNV949LPG7fDV305A4=; b=mY8g0toB/gdoVDCSaA0APyjelz
	ozuTrDXpDqQtShWY9BwOa70haPrboP+25cLMhrISECYqNF0z9AEQLL6SDXRREqhCZ0ct3SaFSl9+v
	HGZl4kLU98+nKh74bfaB+5G8G+yGVI3FjctKQWalq/vOOHQgPS9w5NfbYj0h0wU7TnLQTB9CDibp8
	6M7YCIIPIvG4A0atdkBHDYYV4rXsdEcwqOzy6SgUrLKwHIhHAi/G4bEwmi+2AmhSpfJ618K1Ez47H
	EUa2E+QNntyE9kocLgduuBPKSDySmqg/2LKlMI+Oeb6NyqxxkNB7kPuGLfO0iHRALQLQdkBiX15pm
	kBh4mFkA==;
Received: from phobos.denx.de ([85.214.62.61])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5NqI-00000009fRA-4BJ6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 11:23:29 +0000
Received: from [192.168.1.107] (89-186-114-4.pool.digikabel.hu [89.186.114.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: hs@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 3DCE68907B;
	Mon, 28 Oct 2024 12:23:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1730114605;
	bh=9WOt/O2aSaelze2ima45p34Z2cNV949LPG7fDV305A4=;
	h=Date:Subject:To:Cc:References:From:Reply-To:In-Reply-To:From;
	b=x6lwJa0HNf64WxDoZRE8mWtAZxSY24eLdRYmNHfIr35c8gEmSuqXeQ+2NMy1YMar1
	 wdGZ4WjDvl1PNM9tfNAxR2bvI2u/BOapPb0pDhnjeSUVBjEbN2ev/9bTKrxJv23qQ+
	 1zipO6PpA2HYe5qGCDh6/HLnwrm94h6EPq7pmsaDKmx+B4aHh+JnglnMj6ikWdL0cM
	 y2Vv+AmM9+MUlpc/RxZLCDPU4btLbFWla0bcp7Bh8H+U5rdjfM/Udt8ygVoqgxzGv6
	 p2TKr+sgDMoHsTum0lWYqUBnLhh+XmaXpP7uNu7XyQJ9B0J0VfOFvN7/2E6C4al/8u
	 UdwSldeQRW/hw==
Message-ID: <1c21a636-5778-03c0-85b0-a4b3710b8f3d@denx.de>
Date: Mon, 28 Oct 2024 12:21:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v1 2/2] arm64: dts: imx8mp: add aristainetos3 board
 support
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20241028082332.21672-1-hs@denx.de>
 <20241028082332.21672-3-hs@denx.de>
 <f4150aa3-4c0e-45fa-9c9c-879ac04c4364@kernel.org>
 <bf2c81e1-4e97-cfa2-326f-0a6125b2cff9@denx.de>
 <fd4fffb3-44d3-4efb-8c74-4d94e1f26298@kernel.org>
From: Heiko Schocher <hs@denx.de>
In-Reply-To: <fd4fffb3-44d3-4efb-8c74-4d94e1f26298@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_112327_257072_ACC80C21 
X-CRM114-Status: GOOD (  25.72  )
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
Reply-To: hs@denx.de
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello Krzysztof,

On 28.10.24 11:49, Krzysztof Kozlowski wrote:
> On 28/10/2024 11:41, Heiko Schocher wrote:
>> Hello Krzysztof,
>>
>> On 28.10.24 11:24, Krzysztof Kozlowski wrote:
>>> On 28/10/2024 09:23, Heiko Schocher wrote:
>>>> Add support for the i.MX8MP based aristainetos3 boards from ABB.
>>>>
>>>> The board uses a ABB specific SoM from ADLink, based on NXP
>>>> i.MX8MP SoC. The SoM is used on 3 different carrier boards,
>>>> with small differences, which are all catched up in
>>>> devicetree overlays. The kernel image, the basic dtb
>>>> and all dtbos are collected in a fitimage. As bootloader
>>>> is used U-Boot which detects in his SPL stage the carrier
>>>> board by probing some i2c devices. When the correct
>>>> carrier is probed, the SPL applies all needed dtbos to
>>>> the dtb with which U-Boot gets loaded. Same principle
>>>> later before linux image boot, U-Boot applies the dtbos
>>>> needed for the carrier board before booting Linux.
>>>>
>>>> Signed-off-by: Heiko Schocher <hs@denx.de>
>>>> ---
>>>> checkpatch dropped the following warnings:
>>>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi:248: warning: DT compatible string "ethernet-phy-id2000.a231" appears un-documented -- check ./Documentation/devicetree/bindings/
>>>>
>>>> ignored, as this compatible string is usedin other dts too, for example in
>>>>
>>>> arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
>>>>
>>>>    arch/arm64/boot/dts/freescale/Makefile        |    5 +
>>>>    .../imx8mp-aristainetos3-adpismarc.dtsi       |   64 +
>>>>    .../imx8mp-aristainetos3-adpismarc.dtso       |   14 +
>>>>    .../imx8mp-aristainetos3-helios-lvds.dtsi     |   89 ++
>>>>    .../imx8mp-aristainetos3-helios-lvds.dtso     |   13 +
>>>>    .../imx8mp-aristainetos3-helios.dtsi          |  103 ++
>>>>    .../imx8mp-aristainetos3-helios.dtso          |   13 +
>>>>    .../imx8mp-aristainetos3-proton2s.dtsi        |  176 +++
>>>>    .../imx8mp-aristainetos3-proton2s.dtso        |   13 +
>>>>    .../imx8mp-aristainetos3a-som-v1.dts          |   18 +
>>>>    .../imx8mp-aristainetos3a-som-v1.dtsi         | 1210 +++++++++++++++++
>>>>    11 files changed, 1718 insertions(+)
>>>>    create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtsi
>>>>    create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtso
>>>>    create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtsi
>>>>    create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtso
>>>>    create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtsi
>>>>    create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtso
>>>>    create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtsi
>>>>    create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtso
>>>>    create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dts
>>>>    create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi
>>>>
>>>> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
>>>> index 9d3df8b218a2..7c3586509b8b 100644
>>>> --- a/arch/arm64/boot/dts/freescale/Makefile
>>>> +++ b/arch/arm64/boot/dts/freescale/Makefile
>>>> @@ -163,6 +163,11 @@ imx8mn-tqma8mqnl-mba8mx-usbotg-dtbs += imx8mn-tqma8mqnl-mba8mx.dtb imx8mn-tqma8m
>>>>    dtb-$(CONFIG_ARCH_MXC) += imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtb
>>>>    dtb-$(CONFIG_ARCH_MXC) += imx8mn-tqma8mqnl-mba8mx-usbotg.dtb
>>>>    
>>>> +dtb-$(CONFIG_ARCH_MXC) += imx8mp-aristainetos3a-som-v1.dtb \
>>>> +			  imx8mp-aristainetos3-adpismarc.dtbo \
>>>> +			  imx8mp-aristainetos3-proton2s.dtbo \
>>>> +			  imx8mp-aristainetos3-helios.dtbo \
>>>> +			  imx8mp-aristainetos3-helios-lvds.dtbo
>>>>    dtb-$(CONFIG_ARCH_MXC) += imx8mp-beacon-kit.dtb
>>>>    dtb-$(CONFIG_ARCH_MXC) += imx8mp-data-modul-edm-sbc.dtb
>>>>    dtb-$(CONFIG_ARCH_MXC) += imx8mp-debix-model-a.dtb
>>>> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtsi
>>>> new file mode 100644
>>>> index 000000000000..cc0cddaa33ea
>>>> --- /dev/null
>>>> +++ b/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtsi
>>>> @@ -0,0 +1,64 @@
>>>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>>>> +/*
>>>> + * Copyright (C) 2024 Heiko Schocher <hs@denx.de>
>>>> + */
>>>> +
>>>> +#include <dt-bindings/gpio/gpio.h>
>>>> +#include <dt-bindings/interrupt-controller/irq.h>
>>>> +
>>>> +&ecspi1 {
>>>> +	spidev0: spi@0 {
>>>> +		reg = <0>;
>>>> +		compatible = "rohm,dh2228fv";
>>>
>>> Hm? I have some doubts, what device is here?
>>
>> $ grep -lr dh2228fv drivers/
>> drivers/spi/spidev.c
>>
>> Customer uses an userspace implementation...
> 
> That's not the question. I asked what device is here.

I do not know, as on carrier boards there are only connectors,
to which a spi device can be attached. So may I need to use here
a more generic entry?

>>
>>>
>>>> +		spi-max-frequency = <500000>;
>>>> +	};
>>>> +};
>>>> +
>>>> +&ecspi2 {
>>>> +	spidev1: spi@0 {
>>>> +		reg = <0>;
>>>> +		compatible = "rohm,dh2228fv";
>>>> +		spi-max-frequency = <500000>;
>>>> +	};
>>>> +};
>>>> +
>>>> +&i2c2 {
>>>> +	/* SX1509(2) U1001@IPi SMARC Plus */
>>>> +	gpio8: i2c2_gpioext0@3e {
>>>
>>> Uh, no, please never send us downstream code.
>>>
>>> Please follow DTS coding style in all upstream submissions.
>>
>> driver is in here:
>>
>> $ grep -lr probe-reset drivers/pinctrl/
>> drivers/pinctrl/pinctrl-sx150x.c
> 
> This so not related... Your driver does not matter. You send us poor
> quality downstream code.

The driver is upstream... see:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pinctrl/pinctrl-sx150x.c

or may I misunderstood you here too?

Poor is my dts, checks are running and I fix them.

> ...
> 
>>
>>> And why this is DTSO, I have no clue...
> 
> Why is this a DTSO, not a DTS?

Hmm... the idea is, that the bootloader applies the dtbo on runtime,
when it has detected the carrier board it runs on, I tried to explain
in cover letter.

And again... sorry...

bye,
Heiko
-- 
DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs@denx.de

