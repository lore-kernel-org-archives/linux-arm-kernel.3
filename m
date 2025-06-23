Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE97C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 07:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AeW6Uuzf1Bl2HUqpMLFHqgIH+Q2PYHxgIXjI/kFeO3s=; b=r+7+BOPrdk2jOXDz6Hk+lYfAS+
	wGYHeJwMtcAWjMxitxS0bM0P6XX7twE/XEdpl5qFkxx6HGhAdGFA776bAW8WylL6zUzTR/SC52Stc
	AAspB/0dIiNA2HpNAP370ixmcaez5KklLrnUiDe1DG0FXqKF6nka2u7YNZ4YnZ+xPFkQTbHxSowIL
	/AybVx3/5JiYhXmjub6qY0crc99JX9EcnM501opDoPRHsLvYPPNHdrAGgv2Ac/Tz8N4i3r8H0FMpW
	5jyIBEECdjTkMuxcKSK3neoZI734kz9f1FCkXZK1Uo66tZiVm+rdkq9/3nTC8uCiFg3NE2r/r8644
	BvqCwkmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTc51-00000001wLv-2lwj;
	Mon, 23 Jun 2025 07:59:03 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTbne-00000001tcB-0t07
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 07:41:10 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-450d668c2a1so29306685e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 00:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750664464; x=1751269264; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AeW6Uuzf1Bl2HUqpMLFHqgIH+Q2PYHxgIXjI/kFeO3s=;
        b=EtJUTm7ch9tOotGMSMddKcLBZceXNYQex/d91/yqbwJhHip2Sh6B1JMPRQPxhAaVWq
         ZZeI66UVZ9c+nwNTkMQ3aUVIKNpfvJt9OZoaOyT1SxVMT0WoHJFg59NV4gNPy88y0gJl
         iVAu4D51O2UdajroJh/RZdvWQKBdhbKvidjka0U1MG52UxMLuxNxdp2sidFum78b+Ua+
         /ROBj1GRcPkKXc/oA8+17kbY59hnoEVWjEAhlc72QXsegXNo0UZtJn6jlf8SZOCRzTE4
         NCo8Y94ccbhvd4ar13ogXfflb1iKokEjHGgnPh0JsPZDmVPzwTBKYY2xYqaK6jipryHu
         INUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750664464; x=1751269264;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AeW6Uuzf1Bl2HUqpMLFHqgIH+Q2PYHxgIXjI/kFeO3s=;
        b=CnYs4VyO5zuR5tTj0jx+oFrQDkT3JTxm+BWdSuvF2K5BCt7dk7lDQTsVzpHuwCD9Ou
         6yVopUg9tcu+ZCdv8j6Y9QAQwKa1bVOIb1D/5pP9E8MbE2CospDfMluwE1LCvRdJgkoM
         /Ptexap7Z+C3cWPyYCOmXOwoNMhI5Y1+7nzzO8CVYu/roYEkHwOD6GexONGBoHRKxs6L
         xudF4F+Fu23pbHOfj/j9Y+W55u4dgZfAlfEuO+Y9+EK30vDW1qS2psdNWAAiZveMyJad
         NZAUcqrd06m7siCxuY2kGdwKCTmoYiSaZ+KbzxSrM34VLEKmv8G4+VLBpCBxZ9VmxsuA
         b+jA==
X-Forwarded-Encrypted: i=1; AJvYcCXNnXU+QfmDdjpsiHxltjZjy8qDHlbww3608pyNglQgWnCbsxRhQNEMNOU8N6Rk529vddDyijyPe8MK3bOVLJ9Y@lists.infradead.org
X-Gm-Message-State: AOJu0YxJyy1vDX4GjNYAGCElZcOV/c99XEmOF/TH0t/HGJIGIlv51QQr
	N5m9n3AbXkkKe/88RlWBS5dISN4miF7Gc5kHTJjpH4p7jJdb6DoG1zB1TzSkrBD0RXbNI4GYdCS
	0uVL7W44=
X-Gm-Gg: ASbGncvcyEi8ePaoEsSqNCGvZySFiOInAQB4tFlQx1ZCs/38X9Bz+8RjUuJAxS2cLgJ
	rZBnVodeyk3T2e9lPXpHXW5CuUP/74kerDHyIwpR7HqWs60xIufY99aU/TM3csQGb2ADKeFKa9C
	PBHIZTtG7PUXCaGsht/0p3U59VwmzHsFVOzWjb0/wGL+RKe25NfNXjVhsisIq+asXUieKstbRiJ
	uOdbdYUiKo5g4Hw9GIAK40YcqDaJHR9wJfTwXIrl0LBpAyhRsEFzEPphsgxNKwSw9BvLsurKPoJ
	Ro7EQdUuy+zSKHfMfM6d5lxkaHbkkyUXXyh5Ct9jic5Y0os/Ky7G0T31SmGRCr/H1PQAtubTGnT
	PQeQCJMSfcVYX+wYDJDw1xBpO2vmsbuqIhdFUzgA=
X-Google-Smtp-Source: AGHT+IHD+/fz1sWecInD3T1Za6Q8jYc1LEFBXvsskAFiJv2dUlnZNh4T9pnHkuNli8KWbY6bfCumQg==
X-Received: by 2002:a05:600c:5403:b0:453:aca:4d08 with SMTP id 5b1f17b1804b1-45365e2f118mr93390785e9.1.1750664464218;
        Mon, 23 Jun 2025 00:41:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:8c08:7c51:bbb1:5a2d? ([2a01:e0a:3d9:2080:8c08:7c51:bbb1:5a2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d117c6a7sm8879897f8f.51.2025.06.23.00.41.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 00:41:03 -0700 (PDT)
Message-ID: <3f335e16-8528-422a-a73e-efa06e68851c@linaro.org>
Date: Mon, 23 Jun 2025 09:41:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] pinctrl: meson-g12a: add g12b pwm groups
To: Da Xue <da@libre.computer>, Linus Walleij <linus.walleij@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250619022337.43900-1-da@libre.computer>
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
In-Reply-To: <20250619022337.43900-1-da@libre.computer>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_004106_259390_1E397069 
X-CRM114-Status: GOOD (  13.22  )
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

On 19/06/2025 04:23, Da Xue wrote:
> g12b and sm1 have additional pwm pinmuxes for b, c, and d
> 
> Signed-off-by: Da Xue <da@libre.computer>
> ---
>   drivers/pinctrl/meson/pinctrl-meson-g12a.c | 22 +++++++++++++++++++---
>   1 file changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-g12a.c b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
> index e2788bfc5874..8b9130c6e170 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-g12a.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
> @@ -270,15 +270,21 @@ static const unsigned int pwm_a_pins[]			= { GPIOX_6 };
>   /* pwm_b */
>   static const unsigned int pwm_b_x7_pins[]		= { GPIOX_7 };
>   static const unsigned int pwm_b_x19_pins[]		= { GPIOX_19 };
> +static const unsigned int pwm_b_z0_pins[]		= { GPIOZ_0 };
> +static const unsigned int pwm_b_z13_pins[]		= { GPIOZ_13 };
> +static const unsigned int pwm_b_h_pins[]		= { GPIOH_7 };
>   
>   /* pwm_c */
>   static const unsigned int pwm_c_c_pins[]		= { GPIOC_4 };
>   static const unsigned int pwm_c_x5_pins[]		= { GPIOX_5 };
>   static const unsigned int pwm_c_x8_pins[]		= { GPIOX_8 };
> +static const unsigned int pwm_c_z_pins[]		= { GPIOZ_1 };
>   
>   /* pwm_d */
>   static const unsigned int pwm_d_x3_pins[]		= { GPIOX_3 };
>   static const unsigned int pwm_d_x6_pins[]		= { GPIOX_6 };
> +static const unsigned int pwm_d_z_pins[]		= { GPIOZ_2 };
> +static const unsigned int pwm_d_a_pins[]		= { GPIOA_4 };
>   
>   /* pwm_e */
>   static const unsigned int pwm_e_pins[]			= { GPIOX_16 };
> @@ -649,12 +655,22 @@ static const struct meson_pmx_group meson_g12a_periphs_groups[] = {
>   	GROUP(pwm_a,			1),
>   	GROUP(pwm_b_x7,			4),
>   	GROUP(pwm_b_x19,		1),
> +	GROUP(pwm_b_z0,			5),
> +	GROUP(pwm_b_z13,		5),
> +	GROUP(pwm_b_h,			5),
>   	GROUP(pwm_c_x5,			4),
>   	GROUP(pwm_c_x8,			5),
> +	GROUP(pwm_c_c,			5),
> +	GROUP(pwm_c_z,			5),
> +	GROUP(pwm_d_z,			4),
> +	GROUP(pwm_d_a,			3),
>   	GROUP(pwm_d_x3,			4),
>   	GROUP(pwm_d_x6,			4),
>   	GROUP(pwm_e,			1),
> +	GROUP(pwm_f_a,			3),
> +	GROUP(pwm_f_h,			4),
>   	GROUP(pwm_f_x,			1),
> +	GROUP(pwm_f_z,			5),
>   	GROUP(tsin_a_valid,		3),
>   	GROUP(tsin_a_sop,		3),
>   	GROUP(tsin_a_din0,		3),
> @@ -1058,15 +1074,15 @@ static const char * const pwm_a_groups[] = {
>   };
>   
>   static const char * const pwm_b_groups[] = {
> -	"pwm_b_x7", "pwm_b_x19",
> +	"pwm_b_h", "pwm_b_x7", "pwm_b_x19", "pwm_b_z0", "pwm_b_z13"
>   };
>   
>   static const char * const pwm_c_groups[] = {
> -	"pwm_c_c", "pwm_c_x5", "pwm_c_x8",
> +	"pwm_c_c", "pwm_c_x5", "pwm_c_x8", "pwm_c_z",
>   };
>   
>   static const char * const pwm_d_groups[] = {
> -	"pwm_d_x3", "pwm_d_x6",
> +	"pwm_d_a", "pwm_d_x3", "pwm_d_x6", "pwm_d_z",
>   };
>   
>   static const char * const pwm_e_groups[] = {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

