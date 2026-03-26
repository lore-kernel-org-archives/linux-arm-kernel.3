Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA9D106F304
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 08:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E0QdGIGJmrLd5pDRPLgO89nIX7dVoELnsj1kn655mmo=; b=O7c5kMzXFBGVnJaNNCWKTN81ch
	6HNG+40MA00MBweSI2AU+8SiXWSdysznG8Rr5AGd4BBPMck8YfT4jMofTW57bhlDsS4uMoRyG+lMc
	AoTX0D+VkFqiccgKYb+iu99ixUCbMRXNfdJRoRuFPQDDh/y91izr/zci1G+UTR1vpUXnSa7pS3s1m
	zAF03f32BJoSj7BF7uR8+RHuIKutgd/6gnP1ZmVhWosORqI7CYCIEZNEzKGSZSBw29qnBEEr8eUfZ
	batlhxqDvRL8AOA/yK0+weL2UFE4nGk2/XZ5v/Bf80e1Dub1nBj8OgTm8SWG8VcaE1EHMdQaNmeS7
	OlmdNOng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gT9-000000054Hj-0kFS;
	Thu, 26 Mar 2026 08:53:35 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gT4-000000054E8-0zVt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 08:53:32 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-486fb112c09so6919385e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 01:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774515208; x=1775120008; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E0QdGIGJmrLd5pDRPLgO89nIX7dVoELnsj1kn655mmo=;
        b=G+RLE02J420KZsE55pLLFd/DeKpR3C0ksHe157rZvzgLY/6lM9BVjfauDsbMFf5bQ/
         evwh0g/PdERNpxLAImY2ig9aIHbrFPlFZGzBBE0gK0F/8Xfs9oM50ALdbNkkjXASz7E1
         sLygtvBr6jw3codSquU41k8eUQgFnKPDtCNtPf+TlegzkJcJOalM2hoGfFaad2+8hZT7
         Fe6rD8Bx6sZkzDsIGksGNrvcwUwYLVsiCHicraMMIyFedLS+nE5FVaV53QA6BoQWbcKv
         P23mV+ac6jIfOxCpeVswbM8zCqLasBLyza14ySB9Q/FAYlnfCjp9jlPKqld8L7ZZ6lWk
         tsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515208; x=1775120008;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E0QdGIGJmrLd5pDRPLgO89nIX7dVoELnsj1kn655mmo=;
        b=YurI9V03Cnaoai87n32UIYv7NEjUPYTRBxvHvXVytpcNMjm3AeXSf9vFLMstmy82c9
         tKLG6izGfI7c9xbKTlmbkUuCm3K1GuIgly4hPOpwfePL1FlAOazqIFkbpNPNnsgB09N5
         IaS8klePHrB3zax478HEE+9xp0SwSRq6b3phB5i2RN2I8Ymz6VvWbQq/EgoRSJIQzGZb
         yGGWuaTrblEkYEsxLpjSbRrnBUQ8WDzWGe9BsnkTRhQyI7Cvv0DY70BHWLn1ldJu6Xi9
         0WvIcAQLW7HaiWD914cdeNPffqEEoU7KIOc/AKnEOAKipdzdAB/8dSVLSDevaF8yjj3i
         BMrw==
X-Gm-Message-State: AOJu0YyWlG81NwHY3/NMsH2AaDuukQge6Pzo3tY16w14WmHhSPE5Umzp
	dZCmX4vfrTb9YF124IguOk89uyf5wQSyU7DJZwjd6ltZDax7sZqRpnpwgRVAML+UgOw=
X-Gm-Gg: ATEYQzzTdxay4VFNaWit8WZIiayk5KG8wbWTXOskrjOXqUiei01quckLDRpfaEc1fLT
	dCm9P3Hw+vzco68mrKHIR52+k9+CnuAXPWgcVoEFmhgbMcHFf7KSUp1LaErckhb6eaNZiWWUv0b
	UfbO5WKWRE/QokpXnL5WvaxaictM5RlL2mJ0EH/ToolDzIq7h9gXINcLYp1Xf7zyyKEQU0B8WMG
	lvTtfyV/Lc7J7xnISs7sLAzFDe0kT8MKpKI5QXk2wBtdEGo1snP0ZvijtNn+wL5cjZgh8eP+ADG
	0OwoO2NK4ucowB+TE3HYJXvSmYiQOYmGDwy8YhrYMMmAOtXEXLYZBUffCAyLzM1vKKVUUH+p14i
	MOQgJtlw0jjysY0Mer97xGKUppviA72rXFlkzsSx66AlkwlXkfCC1fG7iJ1CZEbA1F1GtdlSdz7
	BzwAS3iSstWWL/93mEDPSdLhnH0DXJ9i/NbQk7js0/Td02N9nTsAvXCaDSN+aHJoC27O+Q0YkkP
	GxtzwE=
X-Received: by 2002:a05:600c:4705:b0:486:fc4a:2951 with SMTP id 5b1f17b1804b1-48716083231mr103005895e9.28.1774515208194;
        Thu, 26 Mar 2026 01:53:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:8431:f88b:714d:f78d? ([2a01:e0a:106d:1080:8431:f88b:714d:f78d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c65989sm29792335e9.2.2026.03.26.01.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 01:53:27 -0700 (PDT)
Message-ID: <3780aa8e-5082-4494-aa9e-ca84544bbdb2@linaro.org>
Date: Thu, 26 Mar 2026 09:53:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 6/9] arm64: dts: amlogic: t7: khadas-vim4: Add power
 regulators
To: Ronald Claveau <linux-kernel-dev@aliel.fr>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-wireless@vger.kernel.org
References: <20260325-add-emmc-t7-vim4-v4-0-44c7b4a5e459@aliel.fr>
 <20260325-add-emmc-t7-vim4-v4-6-44c7b4a5e459@aliel.fr>
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
In-Reply-To: <20260325-add-emmc-t7-vim4-v4-6-44c7b4a5e459@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_015330_322225_5BC9F9E6 
X-CRM114-Status: GOOD (  13.85  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 3/25/26 10:15, Ronald Claveau wrote:
> Add voltage regulator nodes describing the VIM4 power tree,
> required by peripheral nodes such as the SD card controller.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 90 ++++++++++++++++++++++
>   1 file changed, 90 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> index fffdab96b12eb..2450084d37642 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> @@ -6,6 +6,8 @@
>   /dts-v1/;
>   
>   #include "amlogic-t7.dtsi"
> +#include <dt-bindings/gpio/amlogic,t7-periphs-pinctrl.h>
> +#include <dt-bindings/gpio/gpio.h>
>   
>   / {
>   	model = "Khadas vim4";
> @@ -45,6 +47,94 @@ xtal: xtal-clk {
>   		#clock-cells = <0>;
>   	};
>   
> +	dc_in: regulator-dc-in {
> +		compatible = "regulator-fixed";
> +		regulator-name = "DC_IN";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +	};
> +
> +	sd_3v3: regulator-sdcard-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "SD_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vddao_3v3>;
> +		gpio = <&gpio GPIOD_11 GPIO_ACTIVE_LOW>;
> +		regulator-boot-on;
> +		enable-active-low;
> +		regulator-always-on;
> +	};
> +
> +	vcc5v: regulator-vcc-5v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VCC5V";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		vin-supply = <&dc_in>;
> +
> +		gpio = <&gpio GPIOH_4 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	vcc5v0_usb: regulator-vcc-usb {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VCC5V0_USB";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		vin-supply = <&vcc5v>;
> +
> +		gpio = <&gpio GPIOY_5 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	vddao_1v8: regulator-vddao-1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDDAO_1V8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		vin-supply = <&vddao_3v3>;
> +		regulator-always-on;
> +	};
> +
> +	vddao_3v3: regulator-vddao-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDDAO_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&dc_in>;
> +		regulator-always-on;
> +	};
> +
> +	vddio_1v8: regulator-vddio-1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDDIO_1V8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		vin-supply = <&vddio_3v3>;
> +		regulator-always-on;
> +	};
> +
> +	vddio_3v3: regulator-vddio-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDDIO_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vddao_3v3>;
> +		regulator-always-on;
> +	};
> +
> +	vddio_c: regulator-gpio-c {
> +		compatible = "regulator-gpio";
> +		regulator-name = "VDDIO_C";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vddio_3v3>;
> +		gpios = <&gpio GPIOD_9 GPIO_ACTIVE_HIGH>;
> +		states = <1800000 1
> +			  3300000 0>;
> +	};
>   };
>   
>   &uart_a {
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

