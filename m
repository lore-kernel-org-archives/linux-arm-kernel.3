Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75717C35FFF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 10:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9N77P41IwOEtQjyzNQ+1k/cERPt5eLRxJQTUEpJGHQA=; b=4RsCPNT+FWNkyN9o+ZUPfuH2HY
	HCACKA0kR51TRXiyiRmc2jgKKFW7hFuFtY4TDkVuQarb10S3dFou/OwwyJIygtbr/9zUsVpFbQavY
	fiB8vUQv42FK43F3g0KSU3I0Fgy81EwHqmHXkJx6A7zfjL3vJBWqfaEJbWlOa7LIPgs4t4MNO82L/
	Jj8qkbVJMofHl/48uKMEKzsbVlIGXjd5ORWLJIAJirRoTFi0LfzdAlEyLVksFJtZJeErw+2e23pYW
	PKQDHctM1xPQcFN7JTnk2rIaiY79lCdepoI0h7booOBuTchXBj8+E0JgBVXLX6MFuBw5IGR5FTNns
	l7ROOLZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvZSx-0000000EVHH-2yqL;
	Fri, 21 Mar 2025 10:19:03 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvYpF-0000000EOMN-14wD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 09:38:03 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso17225755e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 02:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742549879; x=1743154679; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9N77P41IwOEtQjyzNQ+1k/cERPt5eLRxJQTUEpJGHQA=;
        b=mChTIuvw8CmOmodTchVX+ShuVyOBDGfhvqDN7N6E8wXT6QueK07RDaPLeVubRFKKgJ
         dNmxQisE1QsMq95P1hFEtfEYhLZXTXFKlsGKbVKrfao+BTpbkxPrEx9LbdAuMio/WdwN
         X+Z6I6K256/hJdZfsuZFu4PHoLLJ0MYKucBxHKooCD+/uQk6So5VGgVsiDbazNETlsmY
         wKiFQEjL3ZNszMHjuB+x9tCXJ4m/z5bKMLImjT4L3szhJp50w/6cET/X1I7MVXO2sZBu
         a9q47kqacsw6M8x/168S7weUH7nlCJNgUw5dx5eZXrscamEu8C7mrZj4zhirfs7BWKrg
         DP8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742549879; x=1743154679;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9N77P41IwOEtQjyzNQ+1k/cERPt5eLRxJQTUEpJGHQA=;
        b=GROlTEp/f9GSwqtIXUKvHqxZYXcnuwivGD+oQEtmKU76wz6Zbni5xDRCY2C/IrlSmn
         X86fvCqhFcQ0ieOsBmFXxy9C69vMaqv0XRWkxlVA4Q+cDjiJiOitvfoL0nZHu/G2qGQ3
         TQRlBTGmpxq7+AlRVb9HUMJSckPcIaXi9dND1Z8pgjpityg2mPgPupHHnLGOgL3kFpzB
         SVfVu3q5jDgG/iEAFl7rSmXxegtQdHszAdw+cl+Bp0xiM3p2iVhAeBKUa0+VBKCgAvnE
         rvz0NPAduKt4NebArp3wtTQ4sKrpJGcXLVVgFpGPl5rf4oubm5IhCBh/mzOuDKU4nqLM
         p0Qw==
X-Gm-Message-State: AOJu0Yw2I8skcV4oixcoQ+W49CJFj06RKTZ23JBX/x8F6NWcWf7gFBt6
	215OSI28aTIoR2JHzOwBsHS4k4BicaFSfPVd/bYnibsWfcsHxF8wypcMgc9qNzw=
X-Gm-Gg: ASbGncs6lcdtrtH2X3Mi8mTR5UAqPMnV3TN0DBtjQytfo2s9u93M/eV32Il3bIPsa3p
	OvsMACdYYv2ifvO1eGinHb7ukq0c6f+P4i1sBG5WG2n8OuaYS4SiFLpBKhw5XlS4ZsWxSct2CTV
	oARTwAzTBKw1hpGp9VeQHmoHkiyA8z+jPaRaWt3HLs+Jo5fwvn1rJze64mIwaDOgkLH9vtofAHs
	7Fah99S8ArPh5RShtxAG8Wk7OsoslR/HRbnXw+tGvfmttMjI/CnJVOkRVShPveUq/LCtYGSJSM5
	uFHRcUY6pR1YOu+BsWOONUiu7cJurA8pytONyJHtGhrhJB/DtPrcA23qBcIG+8A8i1gusJSP64a
	Al94uUV9rP6kx4SgTIekh6+iGVNAr6UZd
X-Google-Smtp-Source: AGHT+IE4AxMnbwGIVq74R+nsPXDkLIHd1kWqc+z8aTF3wWVCvx+LwG9D0+avsooNskmWWMoFCV5riw==
X-Received: by 2002:a05:600c:3109:b0:43c:e70d:450c with SMTP id 5b1f17b1804b1-43d50a201bemr22157905e9.22.1742549878764;
        Fri, 21 Mar 2025 02:37:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:5080:77b0:43f2:5276? ([2a01:e0a:3d9:2080:5080:77b0:43f2:5276])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fd187fasm21568345e9.14.2025.03.21.02.37.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 02:37:58 -0700 (PDT)
Message-ID: <5caa550a-ffdf-477d-92f4-a3222b7fba29@linaro.org>
Date: Fri, 21 Mar 2025 10:37:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: a4: fix dtb compilation warning
 issues
To: xianwei.zhao@amlogic.com, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250321-fix-a4-pinctrl-node-v1-1-5719f9f09932@amlogic.com>
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
In-Reply-To: <20250321-fix-a4-pinctrl-node-v1-1-5719f9f09932@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_023801_328851_BB0B30ED 
X-CRM114-Status: GOOD (  16.85  )
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

Hi,

On 21/03/2025 03:23, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> When use command 'make ARCH=arm64 dtbs_check W=1' to compile dtb,
> a warning message appears.
> "Warning (simple_bus_reg): /soc/bus@fe000000/pinctrl:
> missing or empty reg/ranges property"
> 
> Add the unit address to the pinctrl node to fix it.

I've delayed the pinctrl to next release so plase rebase
the commit on top of https://web.git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/log/?h=for-next
and fix the warnings here, and make sure DTBS_CHECK still passes.

Neil

> 
> Fixes: ce78f679e08c ("arm64: dts: amlogic: a4: add pinctrl node")
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi | 102 +++++++++++++++-------------
>   1 file changed, 55 insertions(+), 47 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> index fa80fa365f13..582e0043024b 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> @@ -51,87 +51,52 @@ pwrc: power-controller {
>   };
>   
>   &apb {
> -	gpio_intc: interrupt-controller@4080 {
> -		compatible = "amlogic,a4-gpio-intc",
> -			     "amlogic,meson-gpio-intc";
> -		reg = <0x0 0x4080 0x0 0x20>;
> -		interrupt-controller;
> -		#interrupt-cells = <2>;
> -		amlogic,channel-interrupts =
> -			<10 11 12 13 14 15 16 17 18 19 20 21>;
> -	};
> -
> -	gpio_ao_intc: interrupt-controller@8e72c {
> -		compatible = "amlogic,a4-gpio-ao-intc",
> -			     "amlogic,meson-gpio-intc";
> -		reg = <0x0 0x8e72c 0x0 0x0c>;
> -		interrupt-controller;
> -		#interrupt-cells = <2>;
> -		amlogic,channel-interrupts = <140 141>;
> -	};
> -
> -	periphs_pinctrl: pinctrl {
> +	periphs_pinctrl: pinctrl@4000 {
>   		compatible = "amlogic,pinctrl-a4";
>   		#address-cells = <2>;
>   		#size-cells = <2>;
> -		ranges;
> +		ranges = <0x0 0x0 0x0 0x4000 0x0 0x280>;
>   
> -		gpiox: gpio@4100 {
> -			reg = <0 0x4100 0 0x40>, <0 0x400c 0 0xc>;
> +		gpiox: gpio@100 {
> +			reg = <0 0x100 0 0x40>, <0 0xc 0 0xc>;
>   			reg-names = "gpio", "mux";
>   			gpio-controller;
>   			#gpio-cells = <2>;
>   			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_X<<8) 18>;
>   		};
>   
> -		gpiot: gpio@4140 {
> -			reg = <0 0x4140 0 0x40>, <0 0x402c 0 0xc>;
> +		gpiot: gpio@140 {
> +			reg = <0 0x140 0 0x40>, <0 0x2c 0 0xc>;
>   			reg-names = "gpio", "mux";
>   			gpio-controller;
>   			#gpio-cells = <2>;
>   			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_T<<8) 23>;
>   		};
>   
> -		gpiod: gpio@4180 {
> -			reg = <0 0x4180 0 0x40>, <0 0x4040 0 0x8>;
> +		gpiod: gpio@180 {
> +			reg = <0 0x180 0 0x40>, <0 0x40 0 0x8>;
>   			reg-names = "gpio", "mux";
>   			gpio-controller;
>   			#gpio-cells = <2>;
>   			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_D<<8) 16>;
>   		};
>   
> -		gpioe: gpio@41c0 {
> -			reg = <0 0x41c0 0 0x40>, <0 0x4048 0 0x4>;
> +		gpioe: gpio@1c0 {
> +			reg = <0 0x1c0 0 0x40>, <0 0x48 0 0x4>;
>   			reg-names = "gpio", "mux";
>   			gpio-controller;
>   			#gpio-cells = <2>;
>   			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_E<<8) 2>;
>   		};
>   
> -		gpiob: gpio@4240 {
> -			reg = <0 0x4240 0 0x40>, <0 0x4000 0 0x8>;
> +		gpiob: gpio@240 {
> +			reg = <0 0x240 0 0x40>, <0 0 0 0x8>;
>   			reg-names = "gpio", "mux";
>   			gpio-controller;
>   			#gpio-cells = <2>;
>   			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_B<<8) 14>;
>   		};
>   
> -		gpioao: gpio@8e704 {
> -			reg = <0 0x8e704 0 0x16>, <0 0x8e700 0 0x4>;
> -			reg-names = "gpio", "mux";
> -			gpio-controller;
> -			#gpio-cells = <2>;
> -			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_AO<<8) 7>;
> -		};
> -
> -		test_n: gpio@8e744 {
> -			reg = <0 0x8e744 0 0x20>;
> -			reg-names = "gpio";
> -			gpio-controller;
> -			#gpio-cells = <2>;
> -			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_TEST_N<<8) 1>;
> -		};
> -
>   		func-uart-a {
>   			uart_a_default: group-uart-a-pins1 {
>   				pinmux = <AML_PINMUX(AMLOGIC_GPIO_X, 11, 1)>,
> @@ -186,4 +151,47 @@ uart_e_default: group-uart-e-pins {
>   			};
>   		};
>   	};
> +
> +	gpio_intc: interrupt-controller@4080 {
> +		compatible = "amlogic,a4-gpio-intc",
> +			     "amlogic,meson-gpio-intc";
> +		reg = <0x0 0x4080 0x0 0x20>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		amlogic,channel-interrupts =
> +			<10 11 12 13 14 15 16 17 18 19 20 21>;
> +	};
> +
> +	ao_pinctrl: pinctrl@8e700 {
> +		compatible = "amlogic,pinctrl-a4";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges = <0x0 0x0 0x0 0x8e700 0x0 0x80>;
> +
> +		gpioao: gpio@4 {
> +			reg = <0 0x4 0 0x16>, <0 0 0 0x4>;
> +			reg-names = "gpio", "mux";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_AO<<8) 7>;
> +		};
> +
> +		test_n: gpio@44 {
> +			reg = <0 0x44 0 0x20>;
> +			reg-names = "gpio";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_TEST_N<<8) 1>;
> +		};
> +	};
> +
> +	gpio_ao_intc: interrupt-controller@8e72c {
> +		compatible = "amlogic,a4-gpio-ao-intc",
> +			     "amlogic,meson-gpio-intc";
> +		reg = <0x0 0x8e72c 0x0 0x0c>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		amlogic,channel-interrupts = <140 141>;
> +	};
> +
>   };
> 
> ---
> base-commit: 73a143e436311183186ab4b365a84c662f2c9651
> change-id: 20250317-fix-a4-pinctrl-node-9babfd44e085
> 
> Best regards,


