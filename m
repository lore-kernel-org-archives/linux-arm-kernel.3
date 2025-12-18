Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 766E6D6E2AD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 16:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qJpFHTDEzB05X66xrFgKLfHjWEJGjQ85HofDR0VslZY=; b=i/PM4FK8dlTwGnxaaF5YeQ591b
	iVyhiFiqeAJw5dty+DZJB0Vj8OBreCP5BPrgx/TgfUoJ2ZaipcMJdaesy2K2vm1wS2zhJwKiO/M+3
	TnKg5MXW+oCQ6ebq7pj8BVkNVY9h/Wf3iDPw36SsgeR+n/Bi5eNuu7d4dMhh5rYpVPtFkrrO7BH8k
	ELTkwLQSiTSugGQ8mUrkshih/BoQh4HGVOAiiRaUfX8Sr1wjwMk6mT3BLbxnRNc/Gms22GulLa63K
	H2Gr+rFHBFpZovHpxR+PWggOdxHMD4apV67jfsUq8gw50z5dZLuDtUuyAWlIlmAiDf2Sh4V3EVNe8
	GJPB9TCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWGpp-00000008pNk-1atV;
	Thu, 18 Dec 2025 16:26:37 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWGpl-00000008pNO-3NE4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 16:26:35 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b79f98adea4so127166466b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 08:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766075192; x=1766679992; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qJpFHTDEzB05X66xrFgKLfHjWEJGjQ85HofDR0VslZY=;
        b=TcivjscLeJdH70XXg6VlH44BhBIK04U0juLhplkFj8QcH8VSvnLlOunG8pV016KpMC
         56fC2k+2RtvKz0IXNk1mLBIOf1x6BNQith2GZHG0GBUEo+1jJZXOyjhzmjnhT7VyQ6U5
         5EupcCImc0cvn1zVHfuSEuAWa6zGrGzmqDl3YJ3PqX2foLg70slcuepV8kyiND1mNwbK
         nROa6YUS8wAuL4HqYq6oaOok833g1vxWuhRt6JgMcTC4j1Pv3bdY+IKNdtT39B0d27Vi
         tCSETIu4LGY0c+mBnuzhM3iaYUUPmYXmfpvThEJu7746NOKtEvqkKs2DmN81lJWt6cdp
         ArBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766075192; x=1766679992;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qJpFHTDEzB05X66xrFgKLfHjWEJGjQ85HofDR0VslZY=;
        b=veOaNpuHTnpDwK/SunkqdpqEZMWmCwvnV2MA+4p5+xiqbKkj8y+rYr7bO1w2xXxt0I
         26fD6DMVzOvoIGaNo+5EGxVjRKYsQ3R26rQB3xF5BxhmkqmHp6oKHPJuBDnFK9lxjyEv
         P9GjR2wqDIwIClfjAdjtjgBKsULVpO/sJA0IJFxys39QDn00NCb/wzntV1oYsiAdyiUi
         WKV2tEMOeCxkqjzkU8BEiPXEwUDSlEHwMWo/ScjkWJxrPyfuaATNJtvbxpAWoPwYcckj
         W+E9eSePjYiU81nAMHbyZZ1QF9pLe2uWJjsp8TykjP5gzSjvzbnJf7ERWk2+4eEbHFyP
         HMyg==
X-Forwarded-Encrypted: i=1; AJvYcCWdcl3K//Tq7VU+E08qb9/jdVw1C6ccbvmPIfDArrTmkhnnmil5jKUt9MpN/6SJZXwIS86lpV4nQQfqcURvwaIC@lists.infradead.org
X-Gm-Message-State: AOJu0Yzkk+58Kv4YeFTRS6OmxdnRSF+qGUHP/U4zSD9cTkxuoS/5kQgg
	/o6lexwei18iwrC+PQIKYVTbv+YObpd3Tgg8K8pTJC7vG/9y1nLL4p8B
X-Gm-Gg: AY/fxX6hOm3qXRf8TkQqAt/j1fwafKWyx7Ke8TlS9CJosq34yGMqHPcZR+0qmbxojAd
	px0WB8XxA4SLIgI0DAX2kAnNTcsrqqsJWXiUnNBHvZOqPqKG5AIKTzo48zFa/G1bCc+/XH6WmlS
	7HB+bhHvHMxazneYvvAy79dKOl/4y/42CoCJfXEFg1QMupmyiLIH1b1x+PFdxr7+p2W+eTS1Ql4
	fkERfaf6XY3jH6z65ZW0l3ru/GXfgdWsTfK+9SbAzfbdAqMfybKbUdXvWlhFRhaQKOu9Vf8BzRm
	yYluhzMdL9+UwDBEYcGwOwSAN8XDCSSoq84Cq1RbKBu/r30iUx02yfsd5LLzB34pfEkXs2z4dHU
	joGifGnPXUs1MxnbSeZuYv6V+ct4XjFgYdxiw8Mb3AT1mFxQUvpizpK4OSiAJ4JnpeqJXYyWdCm
	hharuHrhbpIYKN2fyQTWBwQ7A/Ky69argS9pOowyOLAQ==
X-Google-Smtp-Source: AGHT+IEiLlrNwayE/OEejVPPibTN9DbqbxeQkY7CK+E1iqQkD32NejUfdbwg4BUX3IiK49c125TzrA==
X-Received: by 2002:a17:907:3fa7:b0:b72:5d08:486c with SMTP id a640c23a62f3a-b7d23a9d458mr2400079666b.27.1766075191457;
        Thu, 18 Dec 2025 08:26:31 -0800 (PST)
Received: from [10.25.219.74] ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b802350dac6sm270774666b.65.2025.12.18.08.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 08:26:31 -0800 (PST)
Message-ID: <3e449b21-5ffb-4a6a-b0c4-e9f381334883@gmail.com>
Date: Thu, 18 Dec 2025 08:26:34 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: freescale: imx95: Add support for
 i.MX95 15x15 FRDM board
To: Lei Xu <lei.xu@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 justin.jiang@nxp.com, qijian.guo@nxp.com
References: <20251217-127-v2-0-67cb12e56242@nxp.com>
 <20251217-127-v2-2-67cb12e56242@nxp.com>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20251217-127-v2-2-67cb12e56242@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_082633_894562_35079403 
X-CRM114-Status: GOOD (  19.41  )
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


On 12/17/2025 9:56 PM, Lei Xu wrote:
> The i.MX95 15x15 FRDM board is a compact and cost-effective development
> platform based on the i.MX95 applications processor.
>
> Add device tree support for this board, including:
>  - LPUART1 and LPUART5
>  - NETC
>  - USB
>  - PCIe
>  - uSDHC1, uSDHC2 and uSDHC3
>  - FlexCAN2 and FlexCAN5
>  - LPI2C2, LPI2C3, LPI2C4 and their child nodes
>  - Watchdog3
>
> Signed-off-by: Lei Xu <lei.xu@nxp.com>
> ---
> Changes in v2:
> - Switched from 'xceiver-supply' to CAN PHY nodes using 'phys'.
> - Added CAN PHY nodes for flexcan2/5 with shared silent-gpio, removed reg_can_stby.
> - Updated MSI/IOMMU mapping comment to match the i.MX95 15x15 FRDM board.
> ---
>  arch/arm64/boot/dts/freescale/Makefile             |   1 +
>  arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts | 963 +++++++++++++++++++++
>  2 files changed, 964 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index f30d3fd724d0..71308d19d35e 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -400,6 +400,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx943-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
> new file mode 100644
> index 000000000000..414ebdacc3cb
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
> @@ -0,0 +1,963 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/phy/phy-imx8-pcie.h>
> +#include <dt-bindings/pwm/pwm.h>
> +#include <dt-bindings/usb/pd.h>
> +#include "imx95.dtsi"
> +
> +#define BRD_SM_CTRL_SD3_WAKE		0x8000	/*!< PCAL6408A-0 */
> +#define BRD_SM_CTRL_PCIE1_WAKE		0x8001	/*!< PCAL6408A-4 */
> +#define BRD_SM_CTRL_BT_WAKE		0x8002	/*!< PCAL6408A-5 */
> +#define BRD_SM_CTRL_PCIE2_WAKE		0x8003	/*!< PCAL6408A-6 */
> +#define BRD_SM_CTRL_BUTTON		0x8004	/*!< PCAL6408A-7 */
> +
> +/ {
> +	compatible = "fsl,imx95-15x15-frdm", "fsl,imx95";
> +	model = "NXP i.MX95 15X15 FRDM board";
> +
> +	aliases {
> +		ethernet0 = &enetc_port0;
> +		ethernet1 = &enetc_port1;
> +		gpio0 = &gpio1;
> +		gpio1 = &gpio2;
> +		gpio2 = &gpio3;
> +		gpio3 = &gpio4;
> +		gpio4 = &gpio5;
> +		i2c0 = &lpi2c1;
> +		i2c1 = &lpi2c2;
> +		i2c2 = &lpi2c3;
> +		i2c3 = &lpi2c4;
> +		i2c4 = &lpi2c5;
> +		i2c5 = &lpi2c6;
> +		i2c6 = &lpi2c7;
> +		i2c7 = &lpi2c8;
> +		mmc0 = &usdhc1;
> +		mmc1 = &usdhc2;
> +		mmc2 = &usdhc3;
> +		serial0 = &lpuart1;
> +		serial4 = &lpuart5;
> +	};
> +
> +	


(snip)


> +
> +	sound-micfil {
> +		compatible = "fsl,imx-audio-card";
> +		model = "micfil-audio";
> +
> +		pri-dai-link {
> +			link-name = "micfil hifi";
> +			format = "i2s";
> +
> +			cpu {
> +				sound-dai = <&micfil>;
> +			};


please add a space in between the definitions of the cpu and codec nodes. With that:


Reviewed-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>


> +			codec {
> +				sound-dai = <&dmic>;
> +			};
> +		};
> +	};
> +
> +	usdhc3_pwrseq: usdhc3-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		reset-gpios = <&pcal6524 8 GPIO_ACTIVE_LOW>;
> +	};

