Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85830C36008
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 07:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qnmDKnt+3x8rZ4oEZN/cwh/A9C0xUNyVpIFqNNgq/qA=; b=PxCjTnbaOW1tlTWo3d6BF3N8oO
	ga/qVlttie3LOEuUIWl4WrXf03Ua/zKsd626kVQkwINZNviVKsfkiucuTzhd1pYqaYVWM7tFC4stq
	VQgXcCfRnNPf8xatEJiHGxYFv5hhNbN7BOHmgy+3RYmBJomExO2ZblGByZ7UE2QLXUhR+9F6IOEQs
	rWFUpScaJ3HWHkxiGKtdqvZgyaS3mIAhjsS4OLXhQUDcOBQ0NwBMWrTOorrFU2dSCBxHF+6i/Zfpp
	s6qWCAgUUrk1o32Dj3lA8Dir8cD7v8emkn0F0GZbNoDbThaMWcU0VO80Q6amhKlNwnJF43XmTPmIt
	iyNnpVyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twbxt-00000002PXe-0LOK;
	Mon, 24 Mar 2025 07:11:17 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twbtS-00000002OmR-2P0b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 07:06:43 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43690d4605dso26579225e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 00:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742800001; x=1743404801; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qnmDKnt+3x8rZ4oEZN/cwh/A9C0xUNyVpIFqNNgq/qA=;
        b=HJRsUUfAL/XcgDexDbo2O9IJw2G4mjGCAVH9BKMD2KupYhTX7acmDTlPnNO2XKJuX2
         5HTT7NJxCIr1hMMfwYwNIBMJtj8um1aP6dNSw2lUWy2Af7LcJvdZQCHnv8qjvdRkoJiH
         U3BgeMSlTKqt50PyM7CTJN8XV4Dtf6mL0woZ7DL1rDrWWZSrzb+COhlBKNqz36qC9biO
         HjeEjQn/dxTjoQilA6YVGscggTjMqLPxRRCY4qLDAZa8AZnZDx9nby7PipjPbyC+xYv2
         gwQV4zLHAk+zOVCy408NIzUCIdyJfecC4q5fi4jcvVC11Yq3/sc23WniawnzgceM0/TI
         Sjiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742800001; x=1743404801;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qnmDKnt+3x8rZ4oEZN/cwh/A9C0xUNyVpIFqNNgq/qA=;
        b=O6HvN9YgC6YTIOwUzxCalJ53QAJ7Eh8qvAoB4r8+FfFyRELqgOfZ6FJ5V/ZqpIXBof
         C4R+3eGHV7us4zL3GgY5Xe+Vwi9g+pQXH/G5wuZ0jUCIyB4knuugpEBgknkvcFJHMJCm
         mFto3KyGKEyTRTsW8GbR/yQoGK86HTIMqugtA08CWDBpc1ZKmB1Iu/kfeaXWxCB68QA4
         emkrzdMnOS9MHO6TAOWf73ScRjv2Wgw6p9GxeZUD/Z8H+gRBmteWQIYlLbHAQ/VPx6ZK
         YtbnRWBSa41ZtwePdKa+7y4h1nLA2X8UVtpPoN1qiSGmaVMhV5uhUieiInt9CazsclCi
         aXaA==
X-Forwarded-Encrypted: i=1; AJvYcCUKyJWgj53X0SvFlDmJxE37v/Q0a536jsKPtgowGXamelCH6nYanCF83t/7FtI+NKGHXaxWY4p+iD3+i/auphv+@lists.infradead.org
X-Gm-Message-State: AOJu0Yzvb8O7KJLorrirvJ4vRuUedL7i5iH+69ojFMC46JCyCsiMTmPW
	5zkNCGDXdMpj+3aCEPcOR9ykiAN/ZHTaubFrJaWYNuhwA5nUvAmMyuXepYTIycg=
X-Gm-Gg: ASbGncvV0/vrf4se3kEnF3Ez6t3scOugtLwSJgWPq4EBqpcxAX3E0STSeQl8P+snctb
	VG0j2K0MGVeb+Q6Z9S1Aqf9aKWiK/WP/NsLzTKFmLvuIPwjmMRMiqbLCO7iogr6sfcUHV8WpD0k
	UpMnihABQ1fRxa9gznbSnvyKHM8POD4g/B3YPx6qYSt5I+nF1IN5QNX0n7f+bvuqiKqFaturAU3
	qGKHpxNtm1wSboAFirfZcAcjdoqWdRJeFENMXbbL8EDu+UrrG9Lejc4gVv1YkbuZAiuv5SAe3+b
	LptPHMvp7pijDEo2obbSLjfhA9UrRl/MpAnKkVZvgn5UWOQ9i9JnpyV0RmEnjYu0yLKnRK/chFh
	4GkK2dVZtPZpWqRl/QgHmavXtHhk=
X-Google-Smtp-Source: AGHT+IEb+RllboZvRFdgVsQATpGzqRiQIUj/XZMAGqa20bkDRnSgciaHkWRmRX6hFu38Os+eZIOsfw==
X-Received: by 2002:a05:600c:34cc:b0:43c:efed:732c with SMTP id 5b1f17b1804b1-43d50a3c1d4mr97177875e9.28.1742800000709;
        Mon, 24 Mar 2025 00:06:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:a356:8d0:d4d:bb5f? ([2a01:e0a:3d9:2080:a356:8d0:d4d:bb5f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9957aasm10173629f8f.10.2025.03.24.00.06.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 00:06:40 -0700 (PDT)
Message-ID: <e01d48c6-287b-476a-b5ca-de670375561d@linaro.org>
Date: Mon, 24 Mar 2025 08:06:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 2/3] arm64: dts: amlogic: Add A4 Reset Controller
To: kelvin.zhang@amlogic.com, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Zelong Dong <zelong.dong@amlogic.com>
References: <20250320-a4-a5-reset-v5-0-296f83bf733d@amlogic.com>
 <20250320-a4-a5-reset-v5-2-296f83bf733d@amlogic.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250320-a4-a5-reset-v5-2-296f83bf733d@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_000642_629058_FF67B356 
X-CRM114-Status: GOOD (  16.49  )
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
Reply-To: neil.armstrong@linaro.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 20/03/2025 10:42, Kelvin Zhang via B4 Relay wrote:
> From: Zelong Dong <zelong.dong@amlogic.com>
> 
> Add the device node and related header file for Amlogic
> A4 reset controller.
> 
> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
> Link: https://lore.kernel.org/r/20240918074211.8067-3-zelong.dong@amlogic.com
> Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-a4-reset.h | 93 ++++++++++++++++++++++++++
>   arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi    |  8 +++
>   2 files changed, 101 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4-reset.h b/arch/arm64/boot/dts/amlogic/amlogic-a4-reset.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..f6a4c90bab3cf7cfaa3c98c522bed5e455b73bd3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a4-reset.h
> @@ -0,0 +1,93 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +/*
> + * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
> + */
> +
> +#ifndef __DTS_AMLOGIC_A4_RESET_H
> +#define __DTS_AMLOGIC_A4_RESET_H
> +
> +/* RESET0 */
> +/*						0-3 */
> +#define RESET_USB				4
> +/*						5-6*/
> +#define RESET_U2PHY22				7
> +#define RESET_USBPHY20				8
> +#define RESET_U2PHY21				9
> +#define RESET_USB2DRD				10
> +#define RESET_U2H				11
> +#define RESET_LED_CTRL				12
> +/*						13-31 */
> +
> +/* RESET1 */
> +#define RESET_AUDIO				32
> +#define RESET_AUDIO_VAD				33
> +/*						34*/
> +#define RESET_DDR_APB				35
> +#define RESET_DDR				36
> +#define RESET_VOUT_VENC				37
> +#define RESET_VOUT				38
> +/*						39-47 */
> +#define RESET_ETHERNET				48
> +/*						49-63 */
> +
> +/* RESET2 */
> +#define RESET_DEVICE_MMC_ARB			64
> +#define RESET_IRCTRL				65
> +/*						66*/
> +#define RESET_TS_PLL				67
> +/*						68-72*/
> +#define RESET_SPICC_0				73
> +#define RESET_SPICC_1				74
> +/*						75-79*/
> +#define RESET_MSR_CLK				80
> +/*						81*/
> +#define RESET_SAR_ADC				82
> +/*						83-87*/
> +#define RESET_ACODEC				88
> +/*						89-90*/
> +#define RESET_WATCHDOG				91
> +/*						92-95*/
> +
> +/* RESET3 */
> +/*						96-127 */
> +
> +/* RESET4 */
> +/*						128-131 */
> +#define RESET_PWM_AB				132
> +#define RESET_PWM_CD				133
> +#define RESET_PWM_EF				134
> +#define RESET_PWM_GH				135
> +/*						136-137*/
> +#define RESET_UART_A				138
> +#define RESET_UART_B				139
> +/*						140*/
> +#define RESET_UART_D				141
> +#define RESET_UART_E				142
> +/*						143-144*/
> +#define RESET_I2C_M_A				145
> +#define RESET_I2C_M_B				146
> +#define RESET_I2C_M_C				147
> +#define RESET_I2C_M_D				148
> +/*						149-151*/
> +#define RESET_SDEMMC_A				152
> +/*						153*/
> +#define RESET_SDEMMC_C				154
> +/*						155-159*/
> +
> +/* RESET5 */
> +/*						160-175*/
> +#define RESET_BRG_AO_NIC_SYS			176
> +/*						177*/
> +#define RESET_BRG_AO_NIC_MAIN			178
> +#define RESET_BRG_AO_NIC_AUDIO			179
> +/*						180-183*/
> +#define RESET_BRG_AO_NIC_ALL			184
> +/*						185*/
> +#define RESET_BRG_NIC_SDIO			186
> +#define RESET_BRG_NIC_EMMC			187
> +#define RESET_BRG_NIC_DSU			188
> +#define RESET_BRG_NIC_CLK81			189
> +#define RESET_BRG_NIC_MAIN			190
> +#define RESET_BRG_NIC_ALL			191
> +
> +#endif
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> index fa80fa365f13c4a93f5577f78bf2b3369cb91cb8..6537153b3026af1bf9d1df0a196619b716553cde 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> @@ -4,6 +4,7 @@
>    */
>   
>   #include "amlogic-a4-common.dtsi"
> +#include "amlogic-a4-reset.h"
>   #include <dt-bindings/power/amlogic,a4-pwrc.h>
>   #include <dt-bindings/pinctrl/amlogic,pinctrl.h>
>   / {
> @@ -51,6 +52,13 @@ pwrc: power-controller {
>   };
>   
>   &apb {
> +	reset: reset-controller@2000 {
> +		compatible = "amlogic,a4-reset",
> +			     "amlogic,meson-s4-reset";
> +		reg = <0x0 0x2000 0x0 0x98>;
> +		#reset-cells = <1>;
> +	};
> +
>   	gpio_intc: interrupt-controller@4080 {
>   		compatible = "amlogic,a4-gpio-intc",
>   			     "amlogic,meson-gpio-intc";
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

