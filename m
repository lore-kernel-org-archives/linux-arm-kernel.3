Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C444F557EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 08:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NaJMjyFqsRA9dHCRFFX9QB7tuTN0E26/VMHzuIS3hEg=; b=IveDb7cwPjC+MeOdGB36j2nw62
	JaM3rPavoLG6BH+R3Ab7W8Al3Z1FdyZI3DPDd0TFor+aZ35obEstuoW1PlEYeb8ApzZVOtyqdy7mI
	Qn2jgbMzWUP4EFBBC4w10HZr1ePsFgr5lR3QjTQ+ccpQ9xIC17zzqxL6M251uUQlXsXrIsbxK769O
	d6b47Wx6b4WtsrAiSAqXdOx7h4MgZ8YVWr9n0xbQqgpGzEPUlLBUO4YdCCdLdTfuM1BQ6ivzNd4py
	oJogz5Ki9QsryUmwfYfzi5qH1Dfmu3Ah18USTvUDErcpn17HGP+TUUdDWJXsd7wVr19SrtjRfBVCL
	1YX0kjIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkIP-00000006coI-27JM;
	Mon, 20 Apr 2026 08:47:57 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkIM-00000006cln-1zKk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 08:47:56 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4891b0786beso7000915e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 01:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776674872; x=1777279672; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NaJMjyFqsRA9dHCRFFX9QB7tuTN0E26/VMHzuIS3hEg=;
        b=xuXwn2i+gNeJG2+2EGoktDPZfnTIOTFtFvYX/7wlo6cfPFw/TyPRFvDGWRYHnvHQLK
         gCu6prpiKANKtYwPmh3ZzqdMJcaP15PF3Nq0w9z0ao+nErycwHte3vWGRq4z7l74c+QF
         JVveEu3HzciU7SXHV89NdHvKKqsyPSrskFXXkv/Yo+0ZsjGU6S9JjaEBo9SK8/bbJA2X
         s72ISDCODtZwuuQh0lxPSjcG0diDbuhBZuxc5wyvUkJ1qRCM5eqhVanhajrYeU7Vqj6x
         6lP+ywsPTZrXyLDYYhLOiKvG4tFboWSMDs2zr7rvFHBa6AcN28SyfytdS810uaFXrX/+
         1myA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776674872; x=1777279672;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NaJMjyFqsRA9dHCRFFX9QB7tuTN0E26/VMHzuIS3hEg=;
        b=bjJeBmRbY8Z3GcMwDMJGSlkfrA4ATtv0dgmjvTbO26MR0bmthYnmKkyfI8/vJp2R8a
         OugGCzkYcdZ9kI7gQk3alriIZDL6dUlNqgpGQy97bSc1hK/VRVMPjCwyB4rbqc/Cg64M
         NeMkPotM9FK4Njnben9AmwsOwnbIV3g/726M+WMrkXZCiMUyppU1SEbk7LiVhS6HkaoJ
         7RfShrELNX4Fs8fju+RMs2HSWqPDUX8M17RkF+0YE1K7YcmQ6110gtsb81AilfAjDvY7
         zjfAUSkKvzAGCOtRqA3hKrCroWPfRh5be2eKyZldaBiDCAdCA1nj8kcE7y3uD9kM8x0t
         QidA==
X-Gm-Message-State: AOJu0YzzFLp8h0TNoh1nJlgHWZFlmp0nO30Tnpb34IlSpBflEmyDSchY
	GDxMMpjHIPUI7zEQ1hxgmMYb8szOaQIrBMP5DVaV2m4iJ0vPElLRzoQa3NpcVah1v+M=
X-Gm-Gg: AeBDievrie17nQoqPlsPX66m/qNyziVW/Lya1fdmlDPrP8Vq3nL/5XBz/JgbN1qkTtt
	zucLR96rDkdDUyxkMUL5UmIKV9g2+nWGdlVmgQL/tN40FFZbljrG6ZfvygKxRwWfal0UtOU68de
	z6fqqk/qexOfZx0egKtQma3D//U1jnLKlHIkiHQ/2D5RO41sPdgl/ErIUc1VVFymQa7JPRp6xac
	suoI+X16yhUMpEnELlqLZ8hngTvsI55Du7jHcI9uY/Cob1xXOjayTFxFSK0JFCv8YuvcyNv4Jw8
	EH5OzeJn50WGP5OGvtwGnX0vhpWRgK0XyWEzDwSuKs9avQjw5XE/ePHbJKtYbjTtHX1g6Kd2BWz
	x8mBf7NZmTfv0h5TLGB0j0XCegx2gkneInS3mUhNnnA3lmytNCbmXbFvLjzQz9OVTAK5Y0dnqck
	N2l4AYE2HYH8XjNfdVruQyLX6X5vmaHLIJIm8yPhtIafqYM6zUQ9d46jG/tO8XZnXxdqDuKQxCl
	ZpD1/mZQt67k/jT1g==
X-Received: by 2002:a05:600c:c05a:b0:488:80b6:873a with SMTP id 5b1f17b1804b1-488fb771be4mr138962075e9.21.1776674872448;
        Mon, 20 Apr 2026 01:47:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:8290:9fd8:8af0:67dc? ([2a01:e0a:106d:1080:8290:9fd8:8af0:67dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc17f642sm246815005e9.5.2026.04.20.01.47.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 01:47:52 -0700 (PDT)
Message-ID: <b6c2615f-74c7-4a08-88e7-0cf0842687df@linaro.org>
Date: Mon, 20 Apr 2026 10:47:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/3] arm64: dts: amlogic: t7: Add uart_c pinctrl pins
 group
To: Ronald Claveau <linux-kernel-dev@aliel.fr>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260416-add-bluetooth-t7-vim4-v2-0-9a57098fd055@aliel.fr>
 <20260416-add-bluetooth-t7-vim4-v2-1-9a57098fd055@aliel.fr>
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
In-Reply-To: <20260416-add-bluetooth-t7-vim4-v2-1-9a57098fd055@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_014754_598654_4B292AF9 
X-CRM114-Status: GOOD (  12.85  )
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

On 4/16/26 10:54, Ronald Claveau wrote:
> Add the pin multiplexing configuration for UART C (TX, RX, CTS, RTS)
> in the T7 SoC pinctrl node, required to route the UART C signals
> through the correct pads before enabling the controller.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index 7fe72c94ed623..4a55d9641bc9b 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -553,6 +553,18 @@ mux {
>   						bias-pull-up;
>   					};
>   				};
> +
> +				uart_c_pins: uart-c {
> +					mux {
> +						groups = "uart_c_tx",
> +							 "uart_c_rx",
> +							 "uart_c_cts",
> +							 "uart_c_rts";
> +						bias-pull-up;
> +						output-high;
> +						function = "uart_c";
> +					};
> +				};
>   			};
>   
>   			gpio_intc: interrupt-controller@4080 {
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

