Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481D710F2843
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 15:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1BtdFcTynAN33HZsmTUqdTq2Imp2W6r28pnCsYrsANI=; b=MavrDtot8pWkVGV76eb/eVzV2u
	tMkykWAUZ6b8+DJnVtx8E+elJt6S+UbxGL8f7PuLYNTDLA2sU9chekAyrxkYsZHIK2b1bCNaB1ZP/
	FzIzRdgR03L1fJGh347Ki7ZrxVX3Rjar8C1OOkeiBy64pkf4ybkBEaNt9pR29vJWM0uXeR2lA3VZE
	fFuibDfDulf3WXXPK+t9uWx9jtdBDIZu59jbrWhuIEot4p2XCmTx9w729PG64l9WOjvN81pYdKiTg
	d2OJLdUX+DP/uJGxG89lhO1PtTrQaxwEUbXJyRXt9lt1Cknb/Tjls720azHYhHqujGNWvphkigF1P
	ErCktEhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w69Cm-00000007hJ7-0JLr;
	Fri, 27 Mar 2026 15:34:36 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w69Ck-00000007hHq-0BQs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 15:34:35 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-486fd5360d4so28344315e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 08:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774625672; x=1775230472; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1BtdFcTynAN33HZsmTUqdTq2Imp2W6r28pnCsYrsANI=;
        b=ElbC+ORF4k5ltzV8ht5dZlLpFshhY7is+qMy/7U0R4tW27IEIPOSWCugnfEJ8p1Ype
         PPz2BvHmB9rwGgJp4eppDAfumTsptkH3EYyMKL27c23S8N4Ugx5rlkebXkHXXt8FG3Xn
         fVuLfNCVBvSrhCXrGxzfqCaVHkemqp63OZb26vnxw9/pKM8menxkQRMi1cgiRsZByEF0
         cO8zl3IQIxFvk9tK0B3fPfATUIdDyr6XmwRcil6VkINAJ3EsZ4vytYZFl9BdB0xToPzj
         KKg7gzs7ZTU1tNPzI6YNueMtyOmKe1/orKM8/axPp+sJarPV+UkSxjMEZUAiqLJ0vqMr
         uIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774625672; x=1775230472;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1BtdFcTynAN33HZsmTUqdTq2Imp2W6r28pnCsYrsANI=;
        b=EJ2ZVa7I+xkKWLGHxrZV/5JIxlOj6XaoshWM0KaG+KlvbZcWyyliHV9eowmB15QsVU
         Buz3Q0Sis/SQPMAqEjx0SxqVhMgE53Yko9HfUxc6lzKwJhijJSVMLzZ5123ykHMbXq+N
         d5c8ltGX5epK8hdqJOykw9nocui050X+Z+atGV5MliJQHm70gGpiPQ0Uv/RAPPvg26gz
         /TKFoW7WYTx6OKrqIhieLNkZizdPIYIvkNCaipMWgm2LUHJKz2HVRdSqZIWfBzWF/7Xl
         XpIY5eE2MWl5rPo25oREY3wNhZzEn0QrikAIuJ7AcuoMF7N/fhTNyNZE3rSerNkHhF6Q
         VZWA==
X-Forwarded-Encrypted: i=1; AJvYcCV662j0tVM2pGTZ1ttGkZC8bYB3BD4LZFkDqMis42kYKLqwXJFw/j6YI+K8Xl4wj4DpEIMmFC2UYsosJlEhaPGm@lists.infradead.org
X-Gm-Message-State: AOJu0YyJjUL2KtwvgtweZWoFmRWoG11EjMluCBEI9Q4+PKdPQnxOkbW7
	as7zkAvkmXFjRSD+3nHZlzbmaRtQTIv6fhJgC3kQzG+deezaD7n7ruT/dpOcZz8JDX4=
X-Gm-Gg: ATEYQzz6YsWigSpYZO9u5nia+ZqZc0nMmWO09enXIjKPl6EopKhIveUGjHM1KxUaDGv
	nsnyg3W9XLgNXcbUswG32zT/DkJY/z4flDFbdYCAncBY/X+vzrtTj1Y0Lbv15oPnYO8HoeiwuVT
	0sQu7VtWLFp6Y0sA2W4btikAoBTvnPwwmqSL5gxr6DOnrvPka5pHZK/oRmHQ8mscD7G/bLv75G8
	vNjK2n3xdTEOF8BUru3aquh8bRbTK9T+EDfDqmf1XaXGge/7W5sV2EUzjHnfWAdxt/PgCHRgwNu
	Fm4OUOX6yFE8YHSw/4QFh4j5ZNsnJXslgcfo+k++HbbdXuXzN1BsAxMqtbk9lJMK4zK9U1ZiwAB
	yorlxQm669ktYxiHtlWkmG+zAwnSKIQ+j345BvYGD8pEHXTemqleGro6A5Ud0ktMnQec2KM2MOv
	u6PGAkMXGljf5nh6Rwywm9l8SggoklNf/qiSzl3IcZEAZAg+40EeF9lk+WsF1MCuxsljljilWLW
	RSZyZ0=
X-Received: by 2002:a05:600c:c109:b0:486:f9d0:aac8 with SMTP id 5b1f17b1804b1-48727ec776bmr37759315e9.18.1774625671956;
        Fri, 27 Mar 2026 08:34:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:39df:9101:d239:f5dc? ([2a01:e0a:106d:1080:39df:9101:d239:f5dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872712acb7sm17860855e9.18.2026.03.27.08.34.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 08:34:31 -0700 (PDT)
Message-ID: <9d56c5e0-7434-4a5d-8429-f19cc5faf00d@linaro.org>
Date: Fri, 27 Mar 2026 16:34:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 2/3] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s:
 enable HYM8563 RTC
To: Nick Xie <nick@khadas.com>, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, jbrunet@baylibre.com
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260327093016.722095-1-nick@khadas.com>
 <20260327093016.722095-3-nick@khadas.com>
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
In-Reply-To: <20260327093016.722095-3-nick@khadas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_083434_114438_8BAC470C 
X-CRM114-Status: GOOD (  13.77  )
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

On 3/27/26 10:30, Nick Xie wrote:
> The Khadas VIM1S board has an on-board Haoyu Micro HYM8563 Real Time
> Clock (RTC) connected to the I2C1 bus.
> 
> Enable the I2C1 controller and add the RTC child node to support
> hardware clock persistence.
> 
> Signed-off-by: Nick Xie <nick@khadas.com>
> ---
>   .../dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts  | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
> index 792ab45c4c944..7314e0ab81da3 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
> @@ -20,6 +20,8 @@ aliases {
>   		mmc0 = &emmc; /* eMMC */
>   		mmc1 = &sd; /* SD card */
>   		mmc2 = &sdio; /* SDIO */
> +		rtc0 = &rtc;
> +		rtc1 = &vrtc;
>   		serial0 = &uart_b;
>   	};
>   
> @@ -223,6 +225,19 @@ &ethmac {
>   	phy-mode = "rmii";
>   };
>   
> +&i2c1 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c1_pins2>;
> +	clock-frequency = <100000>;
> +
> +	rtc: rtc@51 {
> +		compatible = "haoyu,hym8563";
> +		reg = <0x51>;
> +		#clock-cells = <0>;
> +	};
> +};
> +
>   &ir {
>   	status = "okay";
>   	pinctrl-0 = <&remote_pins>;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

