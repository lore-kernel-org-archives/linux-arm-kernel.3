Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F1CCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 08:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H9Oyh3R17SazgZSVRstGp1eP0rajxnRJzO9DzoLCeLA=; b=owlVhdy1tPLKiXPNEHs7BX/bTq
	chN0WoQPP4F0bjhewZaOieK8m2KHt1ckq0r17dFFV94mVDs5fGOE4obklwnDLvvY4kGCZZKywX66E
	CZb8ftIcNiWnY6kBsu9f8znDNE76ovDN0itjuEaQ8ORLaypqQRtRhgDvB6wNvrux8X/uAEnBKG2wF
	yth0sTQyOoXJq9ahsu60+czhjgCywybeiUdVzXetsdJRALpPWFmUYQ1LfGjsvdsJHdOB5bKPqb6ej
	eP2/2qVITmmlDfw+kaQflNLw3IiIFFYqQZJnvw1sPVLU7315ovRWFMaBQr8c2vcD5S/BwQRCuXkga
	mSFgI43A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4ay-00000001gNC-309g;
	Wed, 13 May 2026 08:05:32 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4aw-00000001gMC-09Kh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 08:05:31 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-43fe3e22e33so3856494f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 01:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778659528; x=1779264328; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H9Oyh3R17SazgZSVRstGp1eP0rajxnRJzO9DzoLCeLA=;
        b=j0/XBdYOGIDnIPjpktGhWpX/BkyEvVYm3ILTizIjyb0hREhvinvM4xsk81m4WDmJwb
         1zE3X0KDWHwSj15CS/CforzQw8uepEEAaFrUIjp1b7cGGNoEMF0e5Met1E6SmCHvtdjn
         v+EFO5QhEfP3MdHbfO32/irbD8uNjA5eVxVWe88kZChhAytRhPTH2u+/lyIrS4G8VYxw
         Pny+EEsknUfHyZ2XPGCavY1jw6egMX1pEz8D+BKayzF01s+MN5epSArBDxawlGYNrQ1M
         8gny6lJGOw6ppSYwiLOOIZnYS+Y/cE9rOZpoHwDlL1+hzzyVS/1bDcRMOLTpdz8yrBle
         B5WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778659528; x=1779264328;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H9Oyh3R17SazgZSVRstGp1eP0rajxnRJzO9DzoLCeLA=;
        b=n+MQ8yiMc987HFSaV/AKira6QZyiZsnCHS6IFZySiGx9TgjkZo/NFmMpSf8185ICxV
         RAY0vT6doxkn+V9p6KW6D/E9z0DF8hSolouEaOIVh8hU9BxjwidVU6s5uAmR2tGE48CL
         BEn+KrA2uLLuMxOpavQy8+y2LmQ+ZU/ALKiU+JBZhPywLWp59gHyKwXwnJkDy8jR/1u3
         U8LsT7W2igoSD2avOjVGYiZKsTE0FYZO1NmySvvAHQCxtlZRtdcbur6r2VMK2ejKOhAk
         sAWzKIZLYe6vQQLLlsnMI7NdL2zenzNWrQNWrqw0sOmZecC1W5EqUZuDIcytz8219uy9
         Uf1A==
X-Gm-Message-State: AOJu0YxnHl0J45JJVvBD/vb+6uVGvev5s2tXjNiRukscqHd4VGJtM5g2
	oIvLKaw3O/BJyBrXtVnP9aAxq6dfDdYeLS149zFhDSPmgzyS0U3h7qT3pbk6aDoyMw8=
X-Gm-Gg: Acq92OHSBQJ9aUSyJKtruAm/MwdC7vCkUhFJTr50yIrGGL+rKrrNwq6LuuatdbHzzxP
	a8KmqLjDDvm1zO96ZyC5Hkg8vZvm6SS5h/5QgSi9b3mlGeF/Gb6mluVh0wBVeHM26rLk4+p1Y9r
	pNxJYda3kKCJkhXfkco9I3KWfqyxdp2hKDOqHwIAMhWfQ+8JusKmLOx/mq6zJPTWbaplCvqEMwk
	fyN4jv+KgNCZX3r7OtPADUHaPHu/z881zmz/+L4VR+ooiuDebq8KDvzJyrxqfBt2O4L0kNehQ04
	mfgNEOQVjLKZjTeew/numERAoa8HKgVCWmApXDev2klmvFdBvyv8rN02fCY0+Xa+hCKgYyEb+Dx
	EXRxtHWmXXOjkeqr5uelV4mDAyI0df87YR/qWhsOaewpLDC5i8UEiOjkj/tAFZ8b9KSu7/lLM4J
	I3RSQELxkjVaZlBI3I1y9O/0IYk68gd4ZcqFbQpbLYyY0cpUgfWqyIjQFdvbMETM5C95GLOIHkL
	HYO
X-Received: by 2002:a05:6000:288c:b0:43c:fe66:43ec with SMTP id ffacd0b85a97d-45c584a793bmr3189360f8f.14.1778659528110;
        Wed, 13 May 2026 01:05:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:6ee4:8e37:145:d60b? ([2a01:e0a:106d:1080:6ee4:8e37:145:d60b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a6470sm32980706f8f.7.2026.05.13.01.05.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 01:05:27 -0700 (PDT)
Message-ID: <7ad282ae-fffa-4d0a-9cec-65d8f6b40544@linaro.org>
Date: Wed, 13 May 2026 10:05:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: t7: khadas-vim4: add PWM-driven
 status LED
To: linux-kernel-dev@aliel.fr, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260512-add-kvim4-sysled-v1-0-7178719a43e7@aliel.fr>
 <20260512-add-kvim4-sysled-v1-2-7178719a43e7@aliel.fr>
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
In-Reply-To: <20260512-add-kvim4-sysled-v1-2-7178719a43e7@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_010530_105248_03902694 
X-CRM114-Status: GOOD (  16.41  )
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

On 5/12/26 19:47, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> The VIM4 board exposes a status LED wired to the PWM_AO_C_D output.
> Enable the pwm_ao_cd controller with its pinmux, and declare a
> pwm-leds node with a heartbeat trigger.
> 
> Also, move the xtal-clk node to restore alphabetical ordering.

Please send a separate patch for that

> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 30 +++++++++++++++++-----
>   1 file changed, 23 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> index 69d6118ba57e7..c41525a34b721 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> @@ -45,13 +45,6 @@ secmon_reserved_bl32: secmon@5300000 {
>   		};
>   	};
>   
> -	xtal: xtal-clk {
> -		compatible = "fixed-clock";
> -		clock-frequency = <24000000>;
> -		clock-output-names = "xtal";
> -		#clock-cells = <0>;
> -	};
> -
>   	dc_in: regulator-dc-in {
>   		compatible = "regulator-fixed";
>   		regulator-name = "DC_IN";
> @@ -60,6 +53,16 @@ dc_in: regulator-dc-in {
>   		regulator-always-on;
>   	};
>   
> +	pwm-leds {
> +		compatible = "pwm-leds";
> +
> +		status {
> +			linux,default-trigger="heartbeat";
> +			max-brightness = <255>;
> +			pwms = <&pwm_ao_cd 0 30040 0>;
> +		};
> +	};
> +
>   	sd_3v3: regulator-sdcard-3v3 {
>   		compatible = "regulator-fixed";
>   		regulator-name = "SD_3V3";
> @@ -155,6 +158,13 @@ wifi32k: wifi32k {
>   		clock-frequency = <32768>;
>   			pwms = <&pwm_ab 0 30518 0>;
>   	};
> +
> +	xtal: xtal-clk {
> +		compatible = "fixed-clock";
> +		clock-frequency = <24000000>;
> +		clock-output-names = "xtal";
> +		#clock-cells = <0>;
> +	};
>   };
>   
>   &pwm_ab {
> @@ -163,6 +173,12 @@ &pwm_ab {
>   	pinctrl-names = "default";
>   };
>   
> +&pwm_ao_cd {
> +	status = "okay";
> +	pinctrl-0 = <&pwm_ao_c_d_pins>;
> +	pinctrl-names = "default";
> +};
> +
>   /* SDIO */
>   &sd_emmc_a {
>   	status = "okay";
> 


