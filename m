Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B56D42B80
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 13:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p+omseve6sEWaNT3PbUtmXKwUOZhyNZ+lRjB/niytBE=; b=Ri6h18IWYkODSdq+hFjPPctLK0
	ysuzqF6kt8NveOH/bZgqtUMXyg0NJOXeVHvZl+oyzg5AtF7g2UqCYYi4m23o6vN+83vBY673hv3tT
	yZdgZeezkyn9eWa+iAtzMZzzKO2XTRsRGDHQH/w5INl5vLkNpsPZE0n7RVk6D6dZ+92cSmKovRGLG
	78IqqYBp1hnSptEWGMy3Bgnc5AbMrldBakOp4Hr359wlbqqroXxpShDdSxezcTpOjYuOgJfLTCYCJ
	ywB/McEL4LH9+4PL/JbIGmbuxprRbJA3qfDW6VoxiCj0lC+xjt8z9E4NGiADO/1hOJVehv97HI37K
	aG26tx4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tArCO-00000003dBo-0LqF;
	Tue, 12 Nov 2024 13:44:52 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAr24-00000003b5e-1Knr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 13:34:13 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4315e9e9642so47497335e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 05:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731418450; x=1732023250; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p+omseve6sEWaNT3PbUtmXKwUOZhyNZ+lRjB/niytBE=;
        b=IQVv2w7IjWql2lvrnlzOEMjZZL+JEvKNQzFxJ2QGi8Do7nE5NSERHWxGyq/LCo8yIn
         45wI7wr0iIEDxlVPFlTn+4Zd1i7xfeY+tbHAmUuxgE/F6PvrXxBUmDPV4GHYrx1wFW9m
         RIIOk2yxOf2i3dWDVcP3zuQ1/03/bjlnjDDbPvNav3vTXwHqkYpWishVN1XZhqDmvyvR
         ZvlpUZTXPf4e0OajIvMdmnQvKdDPi7qYw17EewHiAO6Tenl5mt6rdnsMvYh8as2sRQg2
         BHWIAwWApsNDLiRqZNtRm5YHgIaAQVtSfIcRMpezP0XDeUCn0jrA9m9G/hEDbbdjsNDd
         5F5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731418450; x=1732023250;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=p+omseve6sEWaNT3PbUtmXKwUOZhyNZ+lRjB/niytBE=;
        b=XBzGjxtKoY/hPL7htx/H/+mZ2Oo/tWiZR7Gf4oLv/u4L4ryNnfd4REx/bRCzMlAsrY
         kzeuD+NvgXa7An3JTt+dkrPNs3aeTrhmfAte9epMNpzDcsUWhCr1za5W3PtPlwRf0982
         +ZmAl31KTf2vLe2igQflxfZmC32ty8YtzD/zKokgkOYEmH5YGifClyIbCqdNFI0jDEgt
         H9yhbISq9qhzojJvDZAtqhgZiMr4OLhEW8q3W4Sn07PozSw3VRu11ynM2RtWn+KvZmzv
         SbnCRXq1/GOoEu+QMkUydHVXidQjtf2+/6X9g01KjorgHsrGQZRDnzv6nSj+8NH6wpKO
         d0YQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjjSbn8UxmNlHk6nAA4MK2xTW5OfkBwInYW4AVHqDlxp5KcdWfNSB3VzL+v4QsfvNsUocpqv9crJGO78e+kwGu@lists.infradead.org
X-Gm-Message-State: AOJu0YzBqHeiwz/6x/paBvEfKI9WCBM7zoZMrPA+LHIxp+bkkxfxlGsX
	gB0DPbTLa3urxGGxhv6ujuKI3pKqH6/Z917naxmGRVszoxgkLtEkWIs4qS83szE=
X-Google-Smtp-Source: AGHT+IE3ISTkzyh/KPRmrTOaebvxmXujGnc7RmLYTWKcmrFKgulLlHkQDLI+4AM/xhjc2ZCd/a/i1w==
X-Received: by 2002:a05:600c:510a:b0:431:4e3f:9dee with SMTP id 5b1f17b1804b1-432b74fd7edmr145104225e9.4.1731418450344;
        Tue, 12 Nov 2024 05:34:10 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:860c:aff4:d0e9:9db8? ([2a01:e0a:982:cbb0:860c:aff4:d0e9:9db8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b05c1a13sm210146095e9.29.2024.11.12.05.34.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 05:34:09 -0800 (PST)
Message-ID: <950f4d06-e064-46f3-b8e7-8bfd48b2b16f@linaro.org>
Date: Tue, 12 Nov 2024 14:34:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 5/5] arm64: dts: amlogic: a4: add pinctrl node
To: xianwei.zhao@amlogic.com, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241112-a4_pinctrl-v5-0-3460ce10c480@amlogic.com>
 <20241112-a4_pinctrl-v5-5-3460ce10c480@amlogic.com>
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
In-Reply-To: <20241112-a4_pinctrl-v5-5-3460ce10c480@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_053412_402978_73E0A4B1 
X-CRM114-Status: GOOD (  14.01  )
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

On 12/11/2024 11:26, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Add pinctrl device to support Amlogic A4.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi | 36 +++++++++++++++++++++++++++++
>   1 file changed, 36 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> index de10e7aebf21..a176faf7f1ef 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> @@ -5,6 +5,7 @@
>   
>   #include "amlogic-a4-common.dtsi"
>   #include <dt-bindings/power/amlogic,a4-pwrc.h>
> +#include <dt-bindings/gpio/amlogic-gpio.h>
>   / {
>   	cpus {
>   		#address-cells = <2>;
> @@ -48,3 +49,38 @@ pwrc: power-controller {
>   		};
>   	};
>   };
> +
> +&apb {
> +	periphs_pinctrl: pinctrl@4000 {
> +		compatible = "amlogic,a4-periphs-pinctrl";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges = <0x0 0x0 0x0 0x4000 0x0 0x02e0>;
> +
> +		gpio: bank@0 {
> +			reg = <0x0 0x0 0x0 0x0050>,
> +			      <0x0 0xc0 0x0 0x0220>;
> +			reg-names = "mux", "gpio";
> +			gpio-controller;
> +			#gpio-cells = <3>;
> +			gpio-ranges = <&periphs_pinctrl 0 0 73>;
> +		};
> +	};
> +
> +	aobus_pinctrl: pinctrl@8e700 {
> +		compatible = "amlogic,a4-aobus-pinctrl";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges = <0x0 0x0 0x0 0x8e700 0x0 0x0064>;
> +
> +		ao_gpio: bank@0 {
> +			reg = <0x0 0x00 0x0 0x04>,
> +			      <0x0 0x04 0x0 0x60>;
> +			reg-names = "mux", "gpio";
> +			gpio-controller;
> +			#gpio-cells = <3>;
> +			gpio-ranges = <&aobus_pinctrl 0 0 8>;
> +		};
> +	};
> +
> +};
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

