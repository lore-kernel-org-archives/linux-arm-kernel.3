Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52394E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 10:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xcNqGkwIauu/8vGqbL9sA5oDKvOeKbiw9sBlkhBTUJc=; b=qv9+5OHZ0nsJ2oqO4n+dlYuaxF
	wHZsAKIJ+/kGHDAPyIpXKckkr9WFtVlcjJUHFiHlhNtwy+bYpjsW+rPZKEOMqkxyqRowgI1iNZ4Cw
	8cMohOrqLvM3Qlb7OgR848M1NB/LESUDoPruhJalii2+hi31GwVOFm2JjSyFzNEAb3K3WRPnVkTvt
	Zla3bxOfNBupR8zg3YtG4m+TaFzTDKUDZ7wTWt+EASjKnp5UXOTVz0t6WQ1sjLT6jlcMcSoYPKuC0
	o3wDCXZaDx+9lYZGOsjGrKk+LNFpOOqELEVpexclKggJ99tUFTEpZAzxcQbQ7/n+kslRZYb55H2zE
	0bQruFKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLg51-0000000HaoQ-1gWZ;
	Thu, 12 Dec 2024 10:05:59 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLg3w-0000000HaaT-2mRD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 10:04:53 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5d3ea065b79so608557a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 02:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733997891; x=1734602691; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xcNqGkwIauu/8vGqbL9sA5oDKvOeKbiw9sBlkhBTUJc=;
        b=dVXUgijqswpWun1soaGJpUOVesd/hEdYhy3Y65qGA4hr1iuYpSarnDJgx1c/wMRbx1
         TqAebovb+zgZp3mc4/ZWESFlIT6vMREqPTVwD/6bO2R+tUDzBI/W1ONafnxCHezpkLdy
         5qgPwr02bD/8tWpUZfyWRqSuwhYlUYbQJz4KGC8OzdFHhNfL3EiJ/z0S0YkmkkXZ+WCB
         HI0OoRKEYjIsV7FsAz/U7sSrNUUCuYi1msl4fcrDyNyDECKpmqQjUAI5rxeT3cuDpPug
         c0yN9wd6KgkjwFChg/T1gUOuQ6R1RZ3jNMnZxrxl+0dosaSEOTrUHPrrjYp7cBgNSFpq
         9foQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733997891; x=1734602691;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xcNqGkwIauu/8vGqbL9sA5oDKvOeKbiw9sBlkhBTUJc=;
        b=Bouk/Iw92EeqrzHr22PbLnXOMC7T2FIR8h8EH2h64dA2BpOAfb89Lj42e0iFNHTzZK
         R1ZBK3EcI5MPusloS4oS5OagskXr9F7fT59Qyz/dLx79XPJ1nPwXioRFzA4Uhot6Wx6Z
         /M5ioSSdKd+Fr+L/KrBv9YUDmjZ0KlMIn36Pl1qiz9Kij4R3GsGitK2FgVjK1uQdQabc
         1v5B+KttvTzBJVvoKNn2JRL7mkl/gbCsLwFJw74TUre1iHwLdcvCgkszyECS8r1S1kHC
         5RhMjz45Lq+anotQ3Tg5SKfpQorTNvGlEKXRdJDKVmGqmVrvtIn3jyh+AXbEJbv3kQiX
         klag==
X-Forwarded-Encrypted: i=1; AJvYcCUqXJwU3atwXhIqB6Bupqsh3U8WiuO6hIzeYI3v8lR85fj5rsrYBrBFgRL0Y8uxKy969UQozaajD0oOVHYJfQbi@lists.infradead.org
X-Gm-Message-State: AOJu0YxYKWHdzQ3Ts/0wc/DbH0FjMOR++vccqE9tdx+RD6rerKmYy3XI
	pX2eJVkI9tpcX254Vi9agX0MsrZGmhGxr5A4905imhvoAHcE9/Wz
X-Gm-Gg: ASbGncuiGwJhF5M3XBArh/Pl4u/lA67/n0R/6PohCiKoatFAOWNRQxDajnG4a7uPyx1
	tjryLBA5ZV+1wvF2/TlQ/GQ7axfhkgY3mlDJU42F25ZBA0XqZlEFDeStAEi8QoY4pHOL79FP1W3
	HYBnjTjsVrPt+etSrJqbIAV7sCq7BdS/4LiGou5PbmE+GUCH4f3S1/cx4CQ3IkX4QFcDgbQqY0b
	vufvYh43/Op79Zc//EPupqU6qChvi426vDoFlPjS7uahedh6hRRkPFe4ZbKC1vdqcihLWqTNy8x
	ty0wdw==
X-Google-Smtp-Source: AGHT+IFQT5iUBDmZUMai1sO2ZlzqvJN+RIKe3rhjwPSdU4AZtZ7Q43WieJ/g7Z/ZNDQAZtHYn7R+CQ==
X-Received: by 2002:a17:907:8284:b0:aa6:6696:4072 with SMTP id a640c23a62f3a-aa6b13f4f48mr539712866b.49.1733997890532;
        Thu, 12 Dec 2024 02:04:50 -0800 (PST)
Received: from [192.168.7.105] ([92.120.5.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa67d63f867sm641007166b.133.2024.12.12.02.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 02:04:50 -0800 (PST)
Message-ID: <392884c8-0f4e-43a5-b81c-bf2e80cbddfd@gmail.com>
Date: Thu, 12 Dec 2024 12:04:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: imx: add imx95 dts for sof
Content-Language: en-US
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20241113195240.3699-1-laurentiumihalcea111@gmail.com>
 <20241113195240.3699-6-laurentiumihalcea111@gmail.com>
 <ZzUKPehw2G9XcRsb@lizhi-Precision-Tower-5810>
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <ZzUKPehw2G9XcRsb@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_020452_705415_A71C7491 
X-CRM114-Status: GOOD (  18.27  )
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



On 11/13/2024 10:21 PM, Frank Li wrote:
> On Wed, Nov 13, 2024 at 02:52:40PM -0500, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Add imx95 DTS for SOF usage.
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  arch/arm64/boot/dts/freescale/Makefile        |  1 +
>>  .../dts/freescale/imx95-19x19-evk-sof.dts     | 74 +++++++++++++++++++
> look like it should be dt overlay.
ah, interesting idea, but I don't really see its usage here? As far as I was able to understand the overlays are used to dynamically change the DTB (via u-boot), which we don't really need at the moment.

>
>>  2 files changed, 75 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
>>
>> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
>> index 42e6482a31cb..0a313133d013 100644
>> --- a/arch/arm64/boot/dts/freescale/Makefile
>> +++ b/arch/arm64/boot/dts/freescale/Makefile
>> @@ -269,6 +269,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxca.dtb
>>  dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla.dtb
>>  dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
>>  dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
>> +dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
>>
>>  imx8mm-kontron-dl-dtbs			:= imx8mm-kontron-bl.dtb imx8mm-kontron-dl.dtbo
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
>> new file mode 100644
>> index 000000000000..3fa4c252e355
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
>> @@ -0,0 +1,74 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +/*
>> + * Copyright 2024 NXP
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "imx95-19x19-evk.dts"
>> +
>> +/ {
>> +	reserved-memory {
>> +		adma_res: memory@86100000 {
>> +			compatible = "shared-dma-pool";
>> +			reg = <0x0 0x86100000 0x0 0x100000>;
>> +			no-map;
>> +		};
>> +	};
>> +
>> +	sound-wm8962 {
>> +		status = "disabled";
>> +	};
>> +
>> +	sof-sound-wm8962 {
>> +		compatible = "audio-graph-card2";
>> +		links = <&cpu>;
>> +		label = "wm8962-audio";
>> +		hp-det-gpios = <&gpio2 11 GPIO_ACTIVE_HIGH>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&pinctrl_hp>;
>> +		widgets =
>> +			"Headphone", "Headphones",
>> +			"Microphone", "Headset Mic";
>> +		routing =
>> +			"Headphones", "HPOUTL",
>> +			"Headphones", "HPOUTR",
>> +			"Headset Mic", "MICBIAS",
>> +			"IN3R", "Headset Mic",
>> +			"IN1R", "Headset Mic";
>> +	};
>> +
>> +	sof_cpu: cm7-cpu@80000000 {
>> +		compatible = "fsl,imx95-cm7-sof";
>> +		reg = <0x0 0x80000000 0x0 0x6100000>;
>> +		memory-region = <&adma_res>;
>> +		mboxes = <&mu7 2 0>, <&mu7 2 1>, <&mu7 3 0>, <&mu7 3 1>;
>> +		mbox-names = "txdb0", "txdb1", "rxdb0", "rxdb1";
>> +		cpu: port {
>> +			cpu_ep: endpoint { remote-endpoint = <&codec_ep>; };
>> +		};
>> +	};
> please sort by node name.
Fix in v3

>
>> +};
>> +
>> +&edma2 {
>> +	dma-channel-mask = <0xc0000000>, <0x0>;
>> +};
> Why need change dma mask here ?
Channels 30 and 31 are reserved for firmware usage

>
>> +
>> +&sai3 {
>> +	status = "disabled";
>> +};
>> +
>> +&wm8962 {
>> +	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
>> +			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
>> +			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
>> +			  <&scmi_clk IMX95_CLK_AUDIOPLL2>,
>> +			  <&scmi_clk IMX95_CLK_SAI3>;
>> +	assigned-clock-parents = <0>, <0>, <0>, <0>, <&scmi_clk IMX95_CLK_AUDIOPLL1>;
>> +	assigned-clock-rates = <3932160000>, <3612672000>,
>> +			       <393216000>, <361267200>,
>> +			       <12288000>;
>> +	port {
>> +		codec_ep: endpoint { remote-endpoint = <&cpu_ep>; };
>> +	};
>> +};
>> --
>> 2.34.1
>>


