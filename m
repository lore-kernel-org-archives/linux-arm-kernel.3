Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 564D0CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 12:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sto7ylfghKrxF0yVdAjf8Y/DDquUXT6FEKrppsRxI2o=; b=F/LfYIewWQz0nZYDU5C+2pssHJ
	roQ1MV6y/3BdbZnw4DqDdPhN7EYJXLd8J1gUiuTi+5slVrF1M118JHiNirP0sW1gEWQE3oziTTipc
	m7mSSbuoWwGp2nq0fqY8y09TKQoP7rZ64hoD5zPLqdtlLCfhTgzG7K9cdAj1BDMWZ1/7RtW+vlbfA
	UUY8LgTPvKIlfijTT7HI8zRzqq62U0Vrl3/B7fnVaA5BMssP8zgBLzv5KkjpCtZAz1Vzm6sSjajVC
	RXOHb3KE9WNAUQ5jlRVwh6geLqRz77ZUOPvi2o6vcda76YNszctfXQHcupJuH7j8UEXlbWgNFgQd6
	X4yR4Z2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQpv-00000002S8t-0Ba6;
	Wed, 07 Oct 2026 12:33:31 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQps-00000002S7o-3GFs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 12:33:30 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-48b02a2359aso1659893f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 05:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791376407; x=1791981207; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sto7ylfghKrxF0yVdAjf8Y/DDquUXT6FEKrppsRxI2o=;
        b=Kx9inlzqs80UXUu77gi2aGOjMNdauNcXq4Xg+SWCPAS2SEv3J+76bozaHmTsjSWoIa
         LB8nZLx7vlF/igHP76i+YUZBaxrCl4SzmOHmYF58ffk2O26rogHocpip18nvIHfglAvM
         83xIWcVQEUrubfCh9sAa1FMP56xx9M3ztkROKM/kiv008+ju0aqyesUsQFf1zq8mVD7y
         2VOkA2PriOMneDCo8OEslXG2gUvyciALxwrsLz/zoWbofl51TDY47THWcvPVX/bQlmLu
         asHyep2Nm6Gs9ro91pNxTuJbS9DuvJzyCDyt/4rOO1UPUNXaI6DeOfILNa3t+DI2r8L1
         vofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791376407; x=1791981207;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sto7ylfghKrxF0yVdAjf8Y/DDquUXT6FEKrppsRxI2o=;
        b=qRVnka+D4BiYTqkUNAnnip51zmY441R8DL+Ob2j/ofncMMbflfxzy5hxJUNxF7X+Pu
         NfU0AjemRucfWWL7lc+x88X5AvNyW59cf4/DHkIeVLoXTrep1rWSbxJYps6fTbIi5jfq
         OgE6jlmo8adHcWQfuev594xhr6+FogH3zXPPsPw3vrG1HEcRui3Yt47pkwVucUVamTsI
         dXnsfKt5nQK/9TAq3VA2t8xSU7rSbbQyUgTHSmHn/Ouo9u2vV+Z5nL0SgJwL+2AHb7Rp
         jWHAjULSmJZAuCHi2QZP3bIF+pK9SQEpI0OrPMhtJ70iHpSBmyk+sSaNS0SB/dzrmd5L
         46tA==
X-Forwarded-Encrypted: i=1; AKwUvBzba7gmhtj9SyJsUEXdiJCRURPzTEnC37BonBQATxyAhW4WuYlO8p9JZFVhEu7qvf+pJRFYPhlXjBLbCopx6G97@lists.infradead.org
X-Gm-Message-State: AFq9FYKEGYEBTwoarxFV+dp3aTUmA0HD2nMDxvjc59+0ekMfzG0NSvUf
	oBXigrC+scBdbVtvTi98wh7SlsOFd8nJE2ZJSq0yO92aZopO3uwC1oefsApV6PPCkRo=
X-Gm-Gg: AYBFou3Zt2WJDIt+HVhN93OOA6V80nr8MGBvDAECYdM+VbQKq+7f0AyqD+Xm34vK1Ls
	QhNvh5xp6z/PaOEgWV3vriAWj2CyyXmeWYgxynSFDkLKz6SvW3mqq7n2pnSbrV9iaj2bG4mDtbP
	0hQNR+cN+yuUg0DKFVWBXrxLfxEsgGn3nZoDotR1F/Pg5lXLkYfQ4FJPcBvIhJfDecOGlChlgFb
	yZq/iTAl4+o/hzVCnUjfZCazTb+Lk0/Jq96MQtk0iy9thsc8quaaum646dvOUwqaiUemiooIkTB
	h9Q+/XZSxORs7pJPIew5yIvM0vQ/Zs+trkCGNQ+lI8meOlSaNSn8wriI22CvGm8XVJ97z3ft3RC
	ZILNHXQGQnyYRpzZKV9R5tMMUjQWv//2dPibC5GYXYz/urcJFWNNGP8zQvmdVBh1WEHZ9woYxcy
	YgWw215UxAk4d9hDF2DwRvMLPcwcvCCBBzrnRjzItARdMd/+32FBYJGtqS67uDbV6dG4Q96TNDh
	Noix6c39EYsIHOumc9qym3uDY0lIeUX
X-Received: by 2002:a5d:6184:0:b0:48c:54ec:ea3 with SMTP id ffacd0b85a97d-48c688c031amr8414035f8f.13.1791376405104;
        Wed, 07 Oct 2026 05:33:25 -0700 (PDT)
Received: from [192.168.151.46] (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3d3eesm5973138f8f.53.2026.10.07.05.33.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 05:33:24 -0700 (PDT)
Message-ID: <15a6f5d5-fdf2-43e2-94bc-3e87c4eea122@linaro.org>
Date: Wed, 7 Oct 2026 14:33:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: amlogic: meson-sm1-odroid-hc4: add the fan
 tachometer
To: iav@iav.lv, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Christian Hewitt <christianshewitt@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261006-hc4-fan-tach-v2-1-e27ad96e92a2@iav.lv>
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
In-Reply-To: <20261006-hc4-fan-tach-v2-1-e27ad96e92a2@iav.lv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_053328_840219_3D9F389E 
X-CRM114-Status: GOOD (  17.34  )
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

On 10/6/26 18:36, Igor Velkov via B4 Relay wrote:
> From: Igor Velkov <iav@iav.lv>
> 
> The fan connector routes the fan's tachometer output to GPIOX_7, but
> the fan node does not describe it. pwm-fan therefore registers no
> fan1_input, and the fan speed cannot be read.
> 
> Describe the line as the fan's interrupt, and mux the pin as a GPIO
> input without bias: R109 on the board pulls the line up to VDDAO_3V3
> (schematic rev1.0, sheet 31).
> 
> Tested on ODROID-HC4: fan1_input reads 0 with the fan stopped and
> rises with the duty cycle, to about 4200 rpm at full speed.
> 
> Assisted-by: LLM
> Signed-off-by: Igor Velkov <iav@iav.lv>
> ---
> Changes in v2:
> - Mux GPIOX_7 as a GPIO input without bias (Neil).
> - Link to v1: https://lore.kernel.org/r/20261006-hc4-fan-tach-v1-1-4e7cecf0b45b@iav.lv
> ---
>   arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> index 5f15c2299509..64602aff1d81 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> @@ -21,6 +21,10 @@ fan0: pwm-fan {
>   		#cooling-cells = <2>;
>   		cooling-levels = <0 120 170 220>;
>   		pwms = <&pwm_cd 1 40000 0>;
> +		interrupt-parent = <&gpio_intc>;
> +		interrupts = <IRQID_GPIOX_7 IRQ_TYPE_EDGE_FALLING>;
> +		pinctrl-0 = <&fan_tach_pins>;
> +		pinctrl-names = "default";
>   	};
>   
>   	leds {
> @@ -114,6 +118,17 @@ &pcie {
>   	reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
>   };
>   
> +&periphs_pinctrl {
> +	fan_tach_pins: fan-tach {
> +		mux {
> +			groups = "GPIOX_7";
> +			function = "gpio_periphs";
> +			bias-disable;
> +			output-disable;
> +		};
> +	};
> +};
> +
>   &pwm_cd {
>   	status = "okay";
>   	pinctrl-names = "default";
> 
> ---
> base-commit: b44e2be772f866985cafdf90355285069ea68495
> change-id: 20261006-hc4-fan-tach-440c1b874a04
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

