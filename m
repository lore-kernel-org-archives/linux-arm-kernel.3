Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F14DFF557E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 08:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BMnG5zsFm8/YD9yDwCE2pChjm9vp3DUFGTfm9muAL/Q=; b=Yn3wH04Q893DSILrj+2M0MAdrQ
	02IU6E/7l5b8H/ccCbOYUmWbGZ9YICoaiPIrMt5mW6YhhDIZw2OL5RPGlqP5GJLc/+WHipzY3U26T
	3bBUxXerUy2XGeHcjVKmrdxs3kmqx0HBMzDc4eX7IgdBH66UAxmfgfmzxNjs6ffp3LKz7C9JTuW0/
	i+u+K4g5mbjpXmDLy6HjsWOvzHp1WfVpqkUoR3mKdwBKpLL2n7YFCeoTl+M2qyp7wOwzHb2IV1w46
	MlmffZ53EFgYa3+eMRFi+E8sdICy4mXcF7KUxYkUTTsDGJKJ4alThPeD0a3pC8rhhbsTtaMt3CxHa
	YQv4bB/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkHv-00000006cbv-0LvT;
	Mon, 20 Apr 2026 08:47:27 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkHr-00000006cZZ-3y4r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 08:47:25 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so4512245e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 01:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776674842; x=1777279642; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BMnG5zsFm8/YD9yDwCE2pChjm9vp3DUFGTfm9muAL/Q=;
        b=wXE1gWbqhRVGSDWuy9nak4bnQDXfoa3Y7QHKBY4QdBfS/Ec/6J7YBlqnjTiTaINoxA
         XTlCW7QF7CME4ZswXltVL95LDd6+YF6I/ztotRsJbHVR5L8mbvLa/zXded2EkJ9zpOI+
         FQs5urOft+6EOCpbbpCpPUtE+zPvGRp8AaysatDX/Q0051JPTP00XSpkfPxn4s85+odS
         65f0xOajnsg5h+0rB/GvZcFiRF51YY7jtKSrz+nDDHhw4fs9hobW85joCp284CDsVFhC
         lYGdqcFU3rSE+FGqob0QIlMGkim9VIm6+GeIQp5eXsEWMlkLp1GaHxWl0Ko28SoLv0HD
         qSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776674842; x=1777279642;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BMnG5zsFm8/YD9yDwCE2pChjm9vp3DUFGTfm9muAL/Q=;
        b=YTMCQ1fJy3qoNNU6TGEGTiEiyR8cNta9DaSkUCYay8ToPpKnZachjMczEzZCQ0PsEz
         WGgN4wP7UV3XCYfojR8cpfXRax4pogpKk0hG3x4gQdahoW/4sM6G+hwGidBfhwHs0c/Z
         0OzXeYhFUfpmJcp7V5LtILhKTfkwiz6COk9Jmh/VwNDye4QA+jhunV+MKOhDF0sAmh9g
         JyuTvryOjLCmmWDbh20o3Kgnpqi8okNnxaAnYKI1xcAvUJ7BgLvkmg8qxibHDNoAqI+X
         aiajTBh2eqILVmwgfi2GTDW2v+ktBeQXUzX+wnoNzMv8YPaUqqj3stQ7g1EN5QywEc0J
         YStw==
X-Gm-Message-State: AOJu0Yz4li5R/0UqZ01WzZmmHfBvE1o9BREdlBIcoh/749lnhSQsO81z
	+PWxO1sE69V33vPSMcnZU2UncPC05Cxmo3VxKpzPOsjiHNkTnQq2vgyu8JQ5EZ1KBgs=
X-Gm-Gg: AeBDies3Njyju0XqJYGJJQV2xRlpTJMGC/QLcX1A17A7tNJsxWemmq0SFH4ytxLVzFG
	xpTlELSkfil0+tfQphsUnOZVM1btCebsmdTmh7EGIgAAbP9Zb+oePvit1ba0Q9Q7gmcAz4+Fopk
	L4nVj+xAmJAFwyhQMri1B/EHJoRo5MQ8Udcm2tLP6EJNSceoMG57ljqUkD8wcJGO1Tg3/jqF+CF
	no4OrsBqUGADjgzupjPICfKJHQXLlpQyXPqk7UYN+aUNOHI+bN055w9MrGmpAQ4Sb21u4JoZTgz
	i5HyClfdK6we03Y23XGVou1rw/7eqeedeu62pAU8vsAheNJV1zPxWH3/CZh/bnednwu612LlVYz
	2jxZ7XkbDAPq3pAOLOb6rgFmqXhzxt9CJepjH2gG8Hippqn0E1/zaKU86+bIQuQ5E0EFOKvWIJT
	t0sbO8xi635uvB92UzDyxN+oK/xF1wdDTcms9EnwF8TfVaO5eWlFO7MtIJgb7XI/UOLpDvZwe0E
	YISTwKyY6IDO8/gOA==
X-Received: by 2002:a05:600c:c4a5:b0:489:96e8:1ef0 with SMTP id 5b1f17b1804b1-48996e8200amr15753395e9.30.1776674841495;
        Mon, 20 Apr 2026 01:47:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:8290:9fd8:8af0:67dc? ([2a01:e0a:106d:1080:8290:9fd8:8af0:67dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb75ab25sm85827105e9.11.2026.04.20.01.47.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 01:47:21 -0700 (PDT)
Message-ID: <c9c3227f-2a46-47b5-963f-e784184f7f31@linaro.org>
Date: Mon, 20 Apr 2026 10:47:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: amlogic: t7: khadas-vim4: Enable
 Bluetooth
To: Ronald Claveau <linux-kernel-dev@aliel.fr>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260416-add-bluetooth-t7-vim4-v2-0-9a57098fd055@aliel.fr>
 <20260416-add-bluetooth-t7-vim4-v2-3-9a57098fd055@aliel.fr>
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
In-Reply-To: <20260416-add-bluetooth-t7-vim4-v2-3-9a57098fd055@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_014724_002708_496B9949 
X-CRM114-Status: GOOD (  15.49  )
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
> Enable UART C on the Khadas VIM4 board and attach the BCM43438
>   compatible Bluetooth controller to it. The node configures the RTS/CTS
> hardware flow control, the associated pinmux, the power supplies (vddao_3v3
> and vddao_1v8), the 32 kHz LPO clock shared with the wifi32k fixed
> clock, and the GPIO lines used for host wakeup, device wakeup and
> shutdown.
> 
> Remove clocks and clock-names for UART A, as they are defined in DTSI.

This should be a separate patch.

Neil

> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts   | 21 +++++++++++++++++++--
>   1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> index 69d6118ba57e7..8ea7ae609fbd5 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> @@ -250,6 +250,23 @@ &sd_emmc_c {
>   
>   &uart_a {
>   	status = "okay";
> -	clocks = <&xtal>, <&xtal>, <&xtal>;
> -	clock-names = "xtal", "pclk", "baud";
> +};
> +
> +&uart_c {
> +	status = "okay";
> +	pinctrl-0 = <&uart_c_pins>;
> +	pinctrl-names = "default";
> +	uart-has-rtscts;
> +
> +	bluetooth {
> +		compatible = "brcm,bcm43438-bt";
> +		shutdown-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
> +		host-wakeup-gpios = <&gpio GPIOX_18 GPIO_ACTIVE_HIGH>;
> +		device-wakeup-gpios = <&gpio GPIOX_19 GPIO_ACTIVE_HIGH>;
> +		max-speed = <3000000>;
> +		clocks = <&wifi32k>;
> +		clock-names = "lpo";
> +		vbat-supply = <&vddao_3v3>;
> +		vddio-supply = <&vddao_1v8>;
> +	};
>   };
> 


