Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89CE01098782
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 13:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wk5S/NjC4u0xUL6oomLxP9g3uOp7kISttmV1Dk/7kAk=; b=JMUiUu/pWH8uYR8tnpP1H6YxKo
	oSawRvtrgkLBoraIWJfC6rFfYLI9xnr65SS3tBYQiYQOoS6NyHYk5P0DPn+K2pNwRjLwSx8zv+EPQ
	cF6g1wCPsYs6zDOcmTAprPmImTN8E9RGMGRDk0Lijw34nrFJXxTOyc2FAmBew7Un/q109HmMOfA0P
	LT1h4f19RXU6L8ATmd4BE6diJw+APnRwqIRn39OZRO/E02KwreRw39Yiyxt0Us8I+E3byZzTcNSfs
	FuEe1DVBav5ONNpeB0ipGkrsycObGtEs8bvm5jhCpBhy3GUThXawmg6K6qhR1HMjc9ilAWZimrCem
	voYSummg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3a1D-0000000CrWk-3TOG;
	Fri, 20 Mar 2026 13:36:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3a1C-0000000CrWA-0KZS
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Mar 2026 13:36:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wk5S/NjC4u0xUL6oomLxP9g3uOp7kISttmV1Dk/7kAk=; b=G4ONngOLTkJx/M7rIlMOd7S5EL
	ZNDtLweiHnGo0ZigItDGnRNe6ADr1SWiIPcLzF0AN2UxVdgNlnK09CZp5MWKNIAZxnFTQNMl1qGvG
	GYL5qqPyRTrkw3XaG0XYpcP2IZsFg2RMLpVZs5wadH2LYUTar7CIm8JP38hjuGqg/5HemrZkcq/2r
	RU6Jqqe1hOHvg388LxRhkpXeVzppYwZxMJPVT6Aw4fDnKbFI/t/Be+A1j01+WEWU6+rMfOrsJSYaN
	VUjNw5Yxt4bTtzOLI5JRN0SFZoKKWNzXtJf8lIP/1/AqeoVIAfjpFb6vAJReN2UGBU1w6mCida2zY
	ckNeO6PQ==;
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3a18-0000000FdTA-16vB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 13:36:00 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-40efc77933fso360535fac.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 06:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1774013756; x=1774618556; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wk5S/NjC4u0xUL6oomLxP9g3uOp7kISttmV1Dk/7kAk=;
        b=qAcC7XsKkFlz2ClXlvAo7agpXXN3WzghrjzZHFpA0ePE8TQY56spXh5naORaFe5Vx9
         8ligVVbeYYn6/lPrIfohpQ9NnF5293igzWL6g3pa0OhQRhS+d+vC1xiL0153piShME03
         OuZh0FHHdnXTOHal2GYzxYhdpPVcMh6Eqhx0+upscDtGgeHikuabKDeS83L4tDOM6OCl
         OscQfSBE98z0LsCrrpd+Q3FK74HTDoKxPYrU0CJAOi+Zw/iEYHE1TAdNE8AYonrSEeQ8
         LpgBCRzLnaAN/1hzTNdpqz68x60txpEes1egRx5CN0gEab3xs+/qydonUeNuolrAsJ4n
         ZdLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774013756; x=1774618556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wk5S/NjC4u0xUL6oomLxP9g3uOp7kISttmV1Dk/7kAk=;
        b=OSHhk+4LdCkTdN95YC0dIwuU3QmMOas//BfDyLsz+KDIhAz/i6STi8PGTe5dlKDRyC
         yJUIbKfwq+uY6si1zxOLNm/mJ+JKLrANNmn/pbA9TLJyBgKT2LNFwVgHWsX4MSQvohl8
         qHNEkxP6CZpqmxFlikh5SjOFrZ1kY6/Ji4LUcUJg/Ml6NdJ3xH4Mg4U7ZwZSduxU9Z7m
         d0MziTkZw8BlFBu08f3FVl/B3LLtEvfLPqpXpUX6Ta6HvDQY0uFdF6EuhBD491Z7sqVu
         6VDLvxfBJZL10dbi3KHWsXI8P6ww5ibvcpoDK5P1TpdqhOm2aZigbwjU6JtVL7DockUM
         L/Ww==
X-Forwarded-Encrypted: i=1; AJvYcCXxEBKGYdkNYPGgHGK5kgt3nL5izWheigCHbX5akibwd15qhwvuuDJjEhQR4gqnecblyIgpnQUND4KN6lpW6ILl@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8Eu2kg/eoRaZBXYgzAqjoOUO38LvGkj6Dc6+RSeeYBtVjteUt
	P2JZCm94GbgHd7qsKqO9R8C/D2yqyL+usyYJTgMmNKHgGN7lrj/6Cp67Ab+YowSVOPo=
X-Gm-Gg: ATEYQzy8AQYtdUxyumg/3a40YXghQaSEp0ldS6XJfHdwBegF5wRnMTB/QpBpHCTOG9U
	ec9GpO01cP0i/G+a8yroAn7nNhpMMjYl14muiUpNgWghyOlw6Pw5nDajDB/0AFwm2/fTyu8oJ0R
	ZFQodfH3g6TViwSm75HvziH41Ol2tZ2eG9S44cMEXaOOkgIAEf/MikuT+cazzSwQkzpcEkAiMqc
	Db6fVuc2e1g6QOmMqsVwu9oZNZsDhtDq8j/GmNzxXg3S+SjtcgKJIOL1oRvC8Gip++nAMMd39Da
	4Vmf432bG17OcGH5AvysK3QTC+LVnFSCnR9ELuS6yoiWX18VVY1bJD0/4jElfTUCPkiz0tsrQXF
	bPU6fKJ1aL3mufq4fib33f6zZZvz7vjgu9vYwHZc4WuXWnTgQnKotxuuuOJYPla15wu/4wIiucO
	iQmd32An74eMPLV5sVt3mbFpgLdg2wMKrF+3sEFtTeVUT29ZOPe7nwQKOOC5G1rQ6VDSH2LE4=
X-Received: by 2002:a05:6870:e9aa:b0:417:23f2:6d77 with SMTP id 586e51a60fabf-41c10fd1b74mr1962084fac.16.1774013755741;
        Fri, 20 Mar 2026 06:35:55 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:6a3c:6fc:3be2:208d? ([2600:8803:e7e4:500:6a3c:6fc:3be2:208d])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41c1497485esm2142629fac.8.2026.03.20.06.35.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 06:35:55 -0700 (PDT)
Message-ID: <9124e760-6e9e-4621-b684-071dbb271635@baylibre.com>
Date: Fri, 20 Mar 2026 08:35:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: mediatek: add device-tree for Genio
 720-EVK board
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20251203-add-mediatek-genio-520-720-evk-v1-0-df794b2a30ae@collabora.com>
 <20251203-add-mediatek-genio-520-720-evk-v1-3-df794b2a30ae@collabora.com>
 <c2618423-2466-47bb-a8cf-7c849e7e231e@baylibre.com>
 <7d1e52c0b9c3a6d30e9db617b9bcfa23ed9046b5.camel@collabora.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <7d1e52c0b9c3a6d30e9db617b9bcfa23ed9046b5.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_133558_444357_6E77F38C 
X-CRM114-Status: GOOD (  32.31  )
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

On 3/20/26 7:37 AM, Louis-Alexis Eyraud wrote:
> Hi David,
> 
> On Thu, 2026-03-12 at 19:26 -0500, David Lechner wrote:
>> On 12/3/25 7:59 AM, Louis-Alexis Eyraud wrote:
>>> Add support for MediaTek MT8189 SoC and its variants, and a device-
>>> tree
>>> for the basic hardware enablement of the Genio 720-EVK board, based
>>> on
>>> MT8391 SoC.
>>>
>>
>> ...
>>
>>> +	mmc0_default_pins: mmc0-default-pins {
>>> +		pins-clk {
>>> +			pinmux = <PINMUX_GPIO162__FUNC_MSDC0_CLK>;
>>> +			drive-strength = <6>;
>>> +			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
>>> +		};
>>> +
>>> +		pins-cmd-dat {
>>> +			pinmux =
>>> <PINMUX_GPIO166__FUNC_MSDC0_DAT0>,
>>> +				
>>> <PINMUX_GPIO165__FUNC_MSDC0_DAT1>,
>>> +				
>>> <PINMUX_GPIO164__FUNC_MSDC0_DAT2>,
>>> +				
>>> <PINMUX_GPIO163__FUNC_MSDC0_DAT3>,
>>> +				
>>> <PINMUX_GPIO159__FUNC_MSDC0_DAT4>,
>>> +				
>>> <PINMUX_GPIO158__FUNC_MSDC0_DAT5>,
>>> +				
>>> <PINMUX_GPIO157__FUNC_MSDC0_DAT6>,
>>> +				
>>> <PINMUX_GPIO156__FUNC_MSDC0_DAT7>,
>>> +				 <PINMUX_GPIO161__FUNC_MSDC0_CMD>;
>>> +			input-enable;
>>> +			drive-strength = <6>;
>>> +			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
>>> +		};
>>
>> Should we also have pins-ds here to match mmc0-uhs-pins?
>>
> The data strobe pin is only used for the HS modes, that is why it is
> only declared for uhs state.
> No other mediatek board devicetrees have it for default state too, so I
> don't think it is needed here.
> 
>>> +
>>> +		pins-rst {
>>> +			pinmux =
>>> <PINMUX_GPIO160__FUNC_MSDC0_RSTB>;
>>> +			drive-strength = <6>;
>>> +			bias-pull-up = <MTK_PUPD_SET_R1R0_00>;
>>> +		};
>>> +	};
>>> +
>>> +	mmc0_uhs_pins: mmc0-uhs-pins {
>>> +		pins-clk {
>>> +			pinmux = <PINMUX_GPIO162__FUNC_MSDC0_CLK>;
>>> +			drive-strength = <8>;
>>> +			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
>>> +		};
>>> +
>>> +		pins-cmd-dat {
>>> +			pinmux =
>>> <PINMUX_GPIO166__FUNC_MSDC0_DAT0>,
>>> +				
>>> <PINMUX_GPIO165__FUNC_MSDC0_DAT1>,
>>> +				
>>> <PINMUX_GPIO164__FUNC_MSDC0_DAT2>,
>>> +				
>>> <PINMUX_GPIO163__FUNC_MSDC0_DAT3>,
>>> +				
>>> <PINMUX_GPIO159__FUNC_MSDC0_DAT4>,
>>> +				
>>> <PINMUX_GPIO158__FUNC_MSDC0_DAT5>,
>>> +				
>>> <PINMUX_GPIO157__FUNC_MSDC0_DAT6>,
>>> +				
>>> <PINMUX_GPIO156__FUNC_MSDC0_DAT7>,
>>> +				 <PINMUX_GPIO161__FUNC_MSDC0_CMD>;
>>> +			input-enable;
>>> +			drive-strength = <8>;
>>> +			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
>>> +		};
>>> +
>>> +		pins-ds {
>>> +			pinmux = <PINMUX_GPIO167__FUNC_MSDC0_DSL>;
>>> +			drive-strength = <8>;
>>> +			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
>>> +		};
>>> +
>>> +		pins-rst {
>>> +			pinmux =
>>> <PINMUX_GPIO160__FUNC_MSDC0_RSTB>;
>>> +			bias-pull-up = <MTK_PUPD_SET_R1R0_00>;
>>> +		};
>>> +	};
>>> +
>>> +	mmc1_default_pins: mmc1-default-pins {
>>> +		pins-clk {
>>> +			pinmux = <PINMUX_GPIO169__FUNC_MSDC1_CLK>;
>>> +			drive-strength = <6>;
>>> +			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
>>> +		};
>>> +
>>> +		pins-cmd-dat {
>>> +			pinmux =
>>> <PINMUX_GPIO170__FUNC_MSDC1_DAT0>,
>>> +				
>>> <PINMUX_GPIO171__FUNC_MSDC1_DAT1>,
>>> +				
>>> <PINMUX_GPIO172__FUNC_MSDC1_DAT2>,
>>> +				
>>> <PINMUX_GPIO173__FUNC_MSDC1_DAT3>,
>>> +				 <PINMUX_GPIO168__FUNC_MSDC1_CMD>;
>>> +			input-enable;
>>> +			drive-strength = <6>;
>>> +			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
>>> +		};
>>> +
>>> +		pins-insert {
>>> +			pinmux = <PINMUX_GPIO2__FUNC_GPIO2>;
>>> +			bias-pull-up;
>>> +		};
>>> +	};
>>> +
>>> +	mmc1_uhs_pins: mmc1-uhs-pins {
>>> +		pins-clk {
>>> +			pinmux = <PINMUX_GPIO169__FUNC_MSDC1_CLK>;
>>> +			drive-strength = <8>;
>>> +			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
>>> +		};
>>> +
>>> +		pins-cmd-dat {
>>> +			pinmux =
>>> <PINMUX_GPIO170__FUNC_MSDC1_DAT0>,
>>> +				
>>> <PINMUX_GPIO171__FUNC_MSDC1_DAT1>,
>>> +				
>>> <PINMUX_GPIO172__FUNC_MSDC1_DAT2>,
>>> +				
>>> <PINMUX_GPIO173__FUNC_MSDC1_DAT3>,
>>> +				 <PINMUX_GPIO168__FUNC_MSDC1_CMD>;
>>> +			input-enable;
>>> +			drive-strength = <8>;
>>> +			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
>>> +		};
>>
>> Don't we also need pins-insert here? (to match mmc1-default-pins)
>>
> From what I've found, it was done this way for other board devicetrees
> to avoid possible reconfiguration happen for the card detection pin
> while switching to UHS and causing a switch failure.
> Also, what you declare in pinmux nodes is how the pin configuration
> should change in a specific mode and you declare only what changes, and
> not what stay the same.
> 
>> I was having trouble with the CD input pin not working in U-Boot
>> until I added it.
> I checked and debugged this on my board and did not get that kind of
> issue, whether this pin config is not present for uhs state or if I add
> it. 
> When inserting my sd card or when I boot with it already inserted, the
> mtk-sd driver first sets the pinctrl state to default before switching
> to ufs. The GPIO02 pin config is also OK in both states.
> The mt8189 pinctrl driver seems to apply a default config for this pin
> that is the same as the one that is set here.
> 
> There might be u-boot particularities that could explain it fixes your
> issue.
> 
> Regards,
> Louis-Alexis
>>
>>> +	};
>>> +

Thanks for having a look at this and taking the time to explain. I will
see what I can do to fix it in U-Boot.


