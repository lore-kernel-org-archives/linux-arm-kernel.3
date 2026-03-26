Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F59D106F303
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 08:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hGIQJBrR4L4A7hNhZYj5yBcsB/y/dygFw0rKvJs4Xdw=; b=kCT+I9XcEwamZqwlJ34mC0e0Ur
	0xaW2XOTMRQ8Y9aWDl8/S8tbqjjFzEA5VFSxaxdU6wyMlUfc6e8ILy2YL2Ag9uKq0fEaEc7S30Qop
	nvnJ2D2sT232uNSSReBsb3YZS92AEnEYkHdJlcIHwVWk4uuj6U5UPDUOmnpAVHucXRt+j08DtuwvD
	+F2oVE7lRV+0363KT+ONStxP177WKn9y3tZtcWuTOH+/5DVGKAVSMIy0cc2ZuFvBaAwmeq1GscNPO
	SJVy6djx2x2R220iS2B3kggNH2guVlVStOy0KborM1CnrC/zVoQIsvQazwsFm/B2+hvkXrfXFZGbc
	VujiHn+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gTM-000000054OF-2v4q;
	Thu, 26 Mar 2026 08:53:48 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gTK-000000054MW-2Y1C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 08:53:47 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-439b6d9c981so388809f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 01:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774515225; x=1775120025; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hGIQJBrR4L4A7hNhZYj5yBcsB/y/dygFw0rKvJs4Xdw=;
        b=tsYZzEYXgZgi61ST206CpJjN9aqc1Vm8hWCe7+fLk2KS3nmC6wTN6cE8O86uMYCYqf
         mngcJ2BeRRDAEWEdXBP9miKa/U0urUmJkSc5F/HM0C3EsYeFnXqIr1+YuXF23vORMClR
         p61Gwh0kBR1kLl6cyf5zYJ3m9HjelCShNgfzDqQRi4UYsaTcPL2Hm0sqQWCf5IUMhLXo
         Ptv7dUz8ptTE5nyPnu9IB6BE/6dP/VRQ2th7j6Vk0NZ75STipLJF89r1wJphBt5EZ3XX
         3sh7QOU5PiNnfVr3lZWHXziBHgMN6dx5fqujVVW7UhKxoOokdII6XPDSlNENLYmvKHYk
         94jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515225; x=1775120025;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hGIQJBrR4L4A7hNhZYj5yBcsB/y/dygFw0rKvJs4Xdw=;
        b=p2x3Rt46XjUpkOHnPwT8LEq/lH2spXEWXMzDVKng4i5tqHyUJKggzZmG7jkS0Iy5rk
         RLVtyPAo0gdwpusdBUjoo8mpgssQX7o7kloIOGfKdao7dmNzh4SDTZPoYdKYOMD0zlue
         7+QoHPxgQxRSYsHkwODuPHKDxIB3+zLnL1E+srQBlvguEkxfEfXp5aWiBHNmL4NQ3zv9
         ZpcFW6AHi1UxnDTnZmMuc707Neeu5nyJ9TmWzk7TaWsZZOnxLOjdRfAcy63EeLI5jK7O
         PYnwVvzkRt2q2VKkZmpYUv6Lj6Bqhqpl7Nr/BKEpv9sG4ACGL5HQGe+Q19kUFZZOujBY
         b/EA==
X-Gm-Message-State: AOJu0YwiN4AjlvQsgvoiwVEHhzK1h4vAk0l16H5IhcxY6Nk7XuN2/VlE
	a/rjHHQHr3MD2R/EQD0I/fP7vetJe7Awqrn/U0E/WJnjMG92rkB2DVrnyr21pnfUUOk=
X-Gm-Gg: ATEYQzwGSmYDNcwgeKerqxAh3PH1EsCuP4NJZHvIZxebkrJ+aCFbr8fshzeKOlVCFqr
	5SNy28ZLy9ymdVAw6db96IoJmRyfUSeYcsxo86b0oHMkAwb1zlFXbtdX5hwQYWJD/xTtfX7bB0c
	aMDosFgw9bl2UjEc5MKqOVZYuFr/ob/aOg/HrOWePJftycde+knIS37Vm3R1NE89nrY19OB7kTq
	OyBYenVMYpL3KzobMBXsml51+nW93PFIeJd7IaSsqxeUAXWD0qkLffe0FQz+kd9kAhi7Tra1JvX
	w0BxYZbdXX3zIzaqeT9W72qfIHQjoZrW3kjd7Cq/VSbZjKDtveVPSEMAp588JxjvvFFEwsEKVNd
	GOvwNiFeDWZYYJD8wgGUvzwK3bpoTttH7oapLDUkWtk6OuGeKPqdSTkCc2RtTYlRz+/trIsnBwI
	BpJqA2pfgVFsChkfm5AUn2t+9LZxN7zfMyrxlSP6yq6FZEamU73isPjy8OjuTpGXuwEWBLl/11x
	i9OQfQ=
X-Received: by 2002:a05:6000:208a:b0:439:c153:ae3d with SMTP id ffacd0b85a97d-43b979fbc99mr1451530f8f.6.1774515224588;
        Thu, 26 Mar 2026 01:53:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:8431:f88b:714d:f78d? ([2a01:e0a:106d:1080:8431:f88b:714d:f78d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e35esm6035382f8f.6.2026.03.26.01.53.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 01:53:44 -0700 (PDT)
Message-ID: <f3bcc782-2bb7-44e6-ba40-92a36648d3f7@linaro.org>
Date: Thu, 26 Mar 2026 09:53:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 7/9] arm64: dts: amlogic: t7: khadas-vim4: Add SDIO
 power sequence and WiFi clock
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
 <20260325-add-emmc-t7-vim4-v4-7-44c7b4a5e459@aliel.fr>
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
In-Reply-To: <20260325-add-emmc-t7-vim4-v4-7-44c7b4a5e459@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_015346_674313_08CD6F62 
X-CRM114-Status: GOOD (  13.19  )
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
> Add the SDIO power sequence node using mmc-pwrseq-simple and a
> 32.768kHz PWM-based clock required by the Wi-Fi module.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> index 2450084d37642..770f06b0b16c7 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> @@ -67,6 +67,15 @@ sd_3v3: regulator-sdcard-3v3 {
>   		regulator-always-on;
>   	};
>   
> +	sdio_pwrseq: sdio-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		reset-gpios = <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
> +		post-power-on-delay-ms = <500>;
> +		power-off-delay-us = <200000>;
> +		clocks = <&wifi32k>;
> +		clock-names = "ext_clock";
> +	};
> +
>   	vcc5v: regulator-vcc-5v {
>   		compatible = "regulator-fixed";
>   		regulator-name = "VCC5V";
> @@ -135,6 +144,19 @@ vddio_c: regulator-gpio-c {
>   		states = <1800000 1
>   			  3300000 0>;
>   	};
> +
> +	wifi32k: wifi32k {
> +		compatible = "pwm-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <32768>;
> +			pwms = <&pwm_ab 0 30518 0>;
> +	};
> +};
> +
> +&pwm_ab {
> +	status = "okay";
> +	pinctrl-0 = <&pwm_a_pins>;
> +	pinctrl-names = "default";
>   };
>   
>   &uart_a {
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

