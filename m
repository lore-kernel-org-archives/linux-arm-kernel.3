Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C45CC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 10:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5dVK4MEqf6X0TMeYGVfQUWRHq14IdZfNCfWTmHkdE5g=; b=SzlnGSk1BV0efv6csqGr6FgVAJ
	lZeC+No1/Junxc9ull9r8afjxvpzXAyEDlqZbThCLboUQPfqRkSQbJufWbnRHgj8QEN1WZejxpE9H
	njkwLzgvBuQXTh7XtjXjav2VElYZ4MLRgwM66wForinirmpqtKwltCP8h+ulrcelEfsPKYLzsLBFe
	ky2uSDQd/J+ARqKajpXgoguGob9iwQml4onaRRyUmIG4cesRv+aJZjWle5uieG/n0UJOhEhvw19mw
	hzX1pL7QTTDCElzw9f2DJUJiqiKI7ABPfqA2f/3v0tSIPMh4NesSSFiLu2kodQLUJmlnTejAktVup
	nPMjDmtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txkDZ-0000000AfmG-2LXo;
	Thu, 27 Mar 2025 10:12:09 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txkBo-0000000AfV9-3mkv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 10:10:22 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso7853345e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 03:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743070219; x=1743675019; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5dVK4MEqf6X0TMeYGVfQUWRHq14IdZfNCfWTmHkdE5g=;
        b=Z14sqz1JFHCAQKa39ZdWJBbxXu+W3e7YWq3/D4uGv1muGSl9wrdM/26Dn/EcXUtTEw
         au4RrdWSHN+QzG79MWYyoz0diIk8IY4J47rPJkjBMzupT0+8NguNHtmHyIEd09nnj0f0
         OyRRpK74MAMFOHK2iialwqWwoq/aWXemJoUqk740Dgm0p2ckQTR/kfF/+hYsx4nuCjOP
         zeLiiR13c1gVNf2EiMgDdwPxOnsJyf2zAm8lZfSXcsN5IjG9dWjOtSxWbNdbWLAV6d+3
         K2WfpY5oWfme1m0FoN2+Y3689CFCO1PoLwSEtfnW8dXH1NlBBBLS2Xyjcv7aHW6z5Q6u
         TZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743070219; x=1743675019;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5dVK4MEqf6X0TMeYGVfQUWRHq14IdZfNCfWTmHkdE5g=;
        b=oxbw36KKEEheAL+zFmT/Zheu5H4PkkTL+1t0lJtbXcE+c1rVPy8GcPKRNsQ+tZHDAj
         uq+xovplJZuQtfTrb3QK+Qs4y8TfM0tRmGB/B1vcoqZT1rBh9FXcE5gWssop5hyJKRuU
         QS2pTsAqYb61T+65ai0Ka+Hxpad0F282gg5sEj3RAXgbrS1pvllaxhuwXQb1gwDYDqSX
         tnSiG6echPVJp7A4mFBRfGm2PrV3g7qUL7YMD2hd5ZtSibivJWrPa7ozC5Gz31/FiaWd
         oQvZ10ucVhcq63vbo5ZEONndgD6aMyjHTNQ2/vi0GDRFAVFIDGNLK7bkOM42+UR4ws44
         CbtA==
X-Gm-Message-State: AOJu0Yw15Nxx7Cs6IRQl1ay2PXZJlQj3OrOQqPlPMCeL+utdVT1YcGVS
	EqLfC4mGF+AZKeDjEi5k3J9U0b0dP7Q8XypR62jg11iX5kpuxepSR40Fh6uCrM8=
X-Gm-Gg: ASbGncst87W+gsBfAQSDCL10uVU3hMBe/O2R/C9fqBftKnEs6QjIfBl+lW2AGiE3osr
	qHxvSEm/To8BFVSBywEHQxKJF4q8q0IdtiaBiK6LQsi1ay/dinMe91oElRyRxCcm+b/WNg6pdtz
	yxzLFqWrQyiDVp7op75qjbvtn7z30ELGOtDc+XdC3gFIcU+7/QFuwvBfe9TzImJG4iMNkfk1VZS
	JSfb7Pp5QiQDbQZg48VjBCt9F5R8knt5RzTWE/+nePdtMoiyKMk0bAPL3EcGitZ98oYZ675W0id
	maLeK28GixmzedpdB/+t9YIttFKrVciEUT6fULKQKgidMyVet7OqrqHux5BRtdqiTCcwswhqh6w
	oln9XCkeM0PkrYPrihvwKQA==
X-Google-Smtp-Source: AGHT+IFdm/AJweeb4Ls+JsWWO80Odn3wmJFBflJjpJ8ov4hI0GxODhTug3GPSfXEWpEi5SzYYyG8Fw==
X-Received: by 2002:a05:600c:4fd4:b0:43c:fceb:91f with SMTP id 5b1f17b1804b1-43d84f8b8a2mr35592795e9.11.1743070218550;
        Thu, 27 Mar 2025 03:10:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f1b8:272a:1fa5:f554? ([2a01:e0a:3d9:2080:f1b8:272a:1fa5:f554])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9b5939sm19851219f8f.60.2025.03.27.03.10.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 03:10:18 -0700 (PDT)
Message-ID: <d83eede1-2bf9-4ec1-ac8a-a55328324613@linaro.org>
Date: Thu, 27 Mar 2025 11:10:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: a4: add pinctrl node
To: xianwei.zhao@amlogic.com, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250326-pinctrl-node-a4-v1-1-8c30639480f6@amlogic.com>
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
In-Reply-To: <20250326-pinctrl-node-a4-v1-1-8c30639480f6@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_031020_954908_036E0941 
X-CRM114-Status: GOOD (  17.16  )
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

On 26/03/2025 06:17, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Add pinctrl device to support Amlogic A4 and add uart pinconf.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
> This commit is based on the Neil's suggestion, rebase the commit on top of
> https://web.git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/log/?h=for-next
> which merges this commit:
> https://lore.kernel.org/all/20250212-amlogic-pinctrl-v5-4-282bc2516804@amlogic.com/
> with another one:
> https://lore.kernel.org/all/20250321-fix-a4-pinctrl-node-v1-1-5719f9f09932@amlogic.com/
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi | 125 ++++++++++++++++++++++++++++
>   1 file changed, 125 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> index a06838552f21..c02fa5ee9fd2 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> @@ -5,6 +5,7 @@
>   
>   #include "amlogic-a4-common.dtsi"
>   #include <dt-bindings/power/amlogic,a4-pwrc.h>
> +#include <dt-bindings/pinctrl/amlogic,pinctrl.h>
>   / {
>   	cpus {
>   		#address-cells = <2>;
> @@ -50,6 +51,107 @@ pwrc: power-controller {
>   };
>   
>   &apb {
> +	periphs_pinctrl: pinctrl@4000 {
> +		compatible = "amlogic,pinctrl-a4";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges = <0x0 0x0 0x0 0x4000 0x0 0x280>;
> +
> +		gpiox: gpio@100 {
> +			reg = <0 0x100 0 0x40>, <0 0xc 0 0xc>;
> +			reg-names = "gpio", "mux";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_X<<8) 18>;
> +		};
> +
> +		gpiot: gpio@140 {
> +			reg = <0 0x140 0 0x40>, <0 0x2c 0 0xc>;
> +			reg-names = "gpio", "mux";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_T<<8) 23>;
> +		};
> +
> +		gpiod: gpio@180 {
> +			reg = <0 0x180 0 0x40>, <0 0x40 0 0x8>;
> +			reg-names = "gpio", "mux";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_D<<8) 16>;
> +		};
> +
> +		gpioe: gpio@1c0 {
> +			reg = <0 0x1c0 0 0x40>, <0 0x48 0 0x4>;
> +			reg-names = "gpio", "mux";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_E<<8) 2>;
> +		};
> +
> +		gpiob: gpio@240 {
> +			reg = <0 0x240 0 0x40>, <0 0 0 0x8>;
> +			reg-names = "gpio", "mux";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_B<<8) 14>;
> +		};
> +
> +		func-uart-a {
> +			uart_a_default: group-uart-a-pins1 {
> +				pinmux = <AML_PINMUX(AMLOGIC_GPIO_X, 11, 1)>,
> +					 <AML_PINMUX(AMLOGIC_GPIO_X, 12, 1)>,
> +					 <AML_PINMUX(AMLOGIC_GPIO_X, 13, 1)>,
> +					 <AML_PINMUX(AMLOGIC_GPIO_X, 14, 1)>;
> +			};
> +
> +			group-uart-a-pins2 {
> +				pinmux = <AML_PINMUX(AMLOGIC_GPIO_D, 2, 3)>,
> +					 <AML_PINMUX(AMLOGIC_GPIO_D, 3, 3)>;
> +				bias-pull-up;
> +				drive-strength-microamp = <4000>;
> +			};
> +		};
> +
> +		func-uart-b {
> +			uart_b_default: group-uart-b-pins {
> +				pinmux = <AML_PINMUX(AMLOGIC_GPIO_E, 0, 3)>,
> +					 <AML_PINMUX(AMLOGIC_GPIO_E, 1, 3)>;
> +				bias-pull-up;
> +				drive-strength-microamp = <4000>;
> +			};
> +		};
> +
> +		func-uart-d {
> +			uart_d_default: group-uart-d-pins1 {
> +				pinmux = <AML_PINMUX(AMLOGIC_GPIO_T, 18, 4)>,
> +					 <AML_PINMUX(AMLOGIC_GPIO_T, 19, 4)>;
> +				bias-pull-up;
> +				drive-strength-microamp = <4000>;
> +			};
> +
> +			group-uart-d-pins2 {
> +				pinmux = <AML_PINMUX(AMLOGIC_GPIO_T, 7, 2)>,
> +					 <AML_PINMUX(AMLOGIC_GPIO_T, 8, 2)>,
> +					 <AML_PINMUX(AMLOGIC_GPIO_T, 9, 2)>,
> +					 <AML_PINMUX(AMLOGIC_GPIO_T, 10, 2)>;
> +				bias-pull-up;
> +				drive-strength-microamp = <4000>;
> +			};
> +		};
> +
> +		func-uart-e {
> +			uart_e_default: group-uart-e-pins {
> +				pinmux = <AML_PINMUX(AMLOGIC_GPIO_T, 14, 3)>,
> +					 <AML_PINMUX(AMLOGIC_GPIO_T, 15, 3)>,
> +					 <AML_PINMUX(AMLOGIC_GPIO_T, 16, 3)>,
> +					 <AML_PINMUX(AMLOGIC_GPIO_T, 17, 3)>;
> +				bias-pull-up;
> +				drive-strength-microamp = <4000>;
> +			};
> +		};
> +	};
> +
>   	gpio_intc: interrupt-controller@4080 {
>   		compatible = "amlogic,a4-gpio-intc",
>   			     "amlogic,meson-gpio-intc";
> @@ -60,6 +162,29 @@ gpio_intc: interrupt-controller@4080 {
>   			<10 11 12 13 14 15 16 17 18 19 20 21>;
>   	};
>   
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
>   	gpio_ao_intc: interrupt-controller@8e72c {
>   		compatible = "amlogic,a4-gpio-ao-intc",
>   			     "amlogic,meson-gpio-intc";
> 
> ---
> base-commit: 23a708916ec7ab21c8c81d61bdb7cb933f6867d5
> change-id: 20250325-pinctrl-node-a4-a4667d5ec8cb
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

