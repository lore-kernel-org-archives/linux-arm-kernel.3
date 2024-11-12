Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0AADD41D7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 13:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dRmLbf/bz31mm/eeVY/iGKbUEcxPetAbKwSG1URLvJ0=; b=QxuYDM6kJyPqwYhCnLYHdWG320
	br7O8BrsXFna2JQkyDQlsx2Uo2EILF9O6SZ4iWuw/z7FjIMm+tSz5CnccGBuDrczzXXdAo0CJDncB
	SgHvphHJAvj6fMaK2X4TWsGi4lc/9lzB+AV5KC6zJUarcJrQp/8YqIWvZeVLQS2msTTZZpAaimz1z
	AZj63ZYvmQvIXwfqzIhM0V/dbHehqWMguCaCBxvOL1SfdMPz8yz9091bpHF1ARy2M3YWwbGlOuCez
	c0PktDnyZy1R+05n5EbJOQp26i5nlXpWovhoddAwjOTjrDQ6a+PCTGKsAthKNR19PkmE77ZIJ1a33
	MqK2PXWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAr8n-00000003cRw-3fcF;
	Tue, 12 Nov 2024 13:41:09 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAquw-00000003YaM-3Rj8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 13:26:53 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-431695fa98bso44729055e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 05:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731418009; x=1732022809; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dRmLbf/bz31mm/eeVY/iGKbUEcxPetAbKwSG1URLvJ0=;
        b=Xw/0xv3yUptElTePLJCpIPeqJ+cRn6zQ8l9LilwzpoEoHg8hnviLfouQ1I5T9pVH1p
         a7zcr30a6w/NrKpPb7AgXRd2jyq0VkiZTZHH28f8xjxL4VBSjgDZrfvLXqdjqIS+Axc1
         gt+9SXbDecSo8hq0mevUB02EidP7DusVX159ieFLHOKIUVgI023LKnIHIJywOki5Iqie
         x/aLiGVRhvURcXILZz66+BCIYum+5tvuBsEIf4km5vQWzAjZf56LnX8WW9HQ6ZL27jr2
         MoRNmKqMgkB7EkbIoXcytm3GvgWHf3P8V2GeE/wDh7nyONjFNHT4qlEds/ITJDWInZuj
         BCnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731418009; x=1732022809;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dRmLbf/bz31mm/eeVY/iGKbUEcxPetAbKwSG1URLvJ0=;
        b=VAo2iVqN5d7Cr+UupovmIfbHfY1AFm9SxzbwvMp48sS4veaP5a2M2bQxvy1u6p+lr6
         2UamowDX2QeHuGZ0DPnTlxcwwLap6Q4j2aIx2fVNHsfzMwienWPfSRRRpSr5bD67bd+R
         nnMK3k7jr7DBvN7vp1pR46fpdbWwxlE8uI5Ni3TGEBLy6kLeC5IxtFye3nEBGnaTNwPO
         /xNHSeSDDMXkciP92yAD9IuJcsXXu5YEHKSdX8SUiwkUu7T2PTNsNLpdCNNhn7AY9JJq
         eFdO3eIeNYkSRTFFefUl1tPVWyjYVHmj44RS+6H7tVThBZMegA+q98Am7LjrkV5PmFNL
         WoKg==
X-Forwarded-Encrypted: i=1; AJvYcCVh3eIjLDUXTk7ycAsx+a28jLfD98bnXWjwwgzn0BwsUf7BeuLsWEQZU0jzKtzu2ShrgNQMJVxW6woVx1ZUYBJU@lists.infradead.org
X-Gm-Message-State: AOJu0Ywf+Y+l7ZKQQ/P2/oWu9qsNSqPEx1TwAb7U1nj+0btjiMh+O+YH
	YToCAuGeEi0QUXdOjWX1kZnDYy6O4hl2jqBubwq6EBB5Hq04s94Ni37+iA4K6ok=
X-Google-Smtp-Source: AGHT+IFTQlXSukq+djtZ02mrwHjUmWSAl2HtnKbbzOayDUOl3KycAHIOi0rl6/yfP9eUPu5iRkh9QA==
X-Received: by 2002:a05:600c:3514:b0:42f:4f6:f8f3 with SMTP id 5b1f17b1804b1-432b74fde60mr137847665e9.7.1731418009251;
        Tue, 12 Nov 2024 05:26:49 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:860c:aff4:d0e9:9db8? ([2a01:e0a:982:cbb0:860c:aff4:d0e9:9db8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b0566544sm205123355e9.24.2024.11.12.05.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 05:26:48 -0800 (PST)
Message-ID: <e1b810f6-b5b3-43aa-9cc1-e9601589ddf5@linaro.org>
Date: Tue, 12 Nov 2024 14:26:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 1/5] dt-bindings: pinctrl: modify gpio-cells property
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
 <20241112-a4_pinctrl-v5-1-3460ce10c480@amlogic.com>
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
In-Reply-To: <20241112-a4_pinctrl-v5-1-3460ce10c480@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_052651_034116_FCF6F689 
X-CRM114-Status: GOOD (  14.90  )
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

On 12/11/2024 11:26, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Extend the value range of #gpio-cells property, including [2, 3],
> to compatible with Amlogic A4 SoC and later chips's pinctrl module.
> The early GPIO parameter number is 2, and the later GPIO parameter
> number is 3.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   .../devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml       | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
> index e707c222a07f..6b53577dea59 100644
> --- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
> @@ -36,7 +36,7 @@ $defs:
>         gpio-controller: true
>   
>         "#gpio-cells":
> -        const: 2
> +        enum: [2, 3]
>   
>         gpio-ranges:
>           maxItems: 1
> 

This is not what I expected, this allows 3 cells for all Amlogic pinctrl,
which is wrong.

Instead, remove "#gpio-cells" definition from amlogic,meson-pinctrl-common.yaml
and add them in all amlogic,meson-pinctrl-XXX.yaml with const: 2, and then when you
introduce A4/A5, add a new amlogic,meson-pinctrl-a5.yaml with const: 3.

Neil

