Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB052CCF2D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 07:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8QPld4PDvxchqNmytlS7taNyVAk0cnj+pHWf4Ud33mo=; b=k0c4sHfSAcA2G8LckMtHbLq3QI
	ha5On5xRQ0g+SSe2qu07wJoakzsqmFJ+W3+hxpqXzg6I5TI80hZs0uk0de/uRFt3k94JsC+me5AGZ
	Ei72fgb68z9ugKE8hJy/zE91/JeU1dUctw2hscCWTlrW/L6QAbYqUCPwlAFerqnOHGxYiZWVfnynn
	9Iren3hnRyLCobxifzB3BjPbHNoWC0lzV0Dt4g3TFnbRzrlGO3Bhpr7vx6UMIcU9E53JxWN3igSzO
	iPH2Lkf/yHdDsVjh2XZNfAfQf3QeodhsvDTVFZUTeKXcdp2F88Ke3eg8O5CIDw79UxsHN4nmAgSSK
	aqru/76Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIhvk-00000006lsc-3noh;
	Mon, 19 Oct 2026 07:37:12 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIhvh-00000006lrL-3T4p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 07:37:11 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so22068485e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 00:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792395428; x=1793000228; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8QPld4PDvxchqNmytlS7taNyVAk0cnj+pHWf4Ud33mo=;
        b=NamHHO9rO+BWuop+Jx865cciIO//xii1bNS4dm6RpEDY3VhydfYSHBsEBI20wGALcg
         /KVe+Lxwc42Z/4ItUFkXU1Ipo08kO+pKaUrXBaCBf3d5+sLZooaIL8bMJoWA0mJSPwZF
         WzHQ+Q0rWGZ+EW06shKE1hCD2+jEBlR2WIxGpMjuP4U8fiOHrDQqaODjMPaqon1l7Pw2
         /mgTRDMWT7OQxBJ2f/4LeoSd/BszxuTXs/O52WMGJ2EatqKSwPQGF6FlSC74jyW3g9Po
         Ft5sp2ozR713AATpvI8fkB0iqbGgIwFJI7V6jhI/9wVzGWPjSuuNxJCADgcKvF3Fq3rk
         Vrfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792395428; x=1793000228;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8QPld4PDvxchqNmytlS7taNyVAk0cnj+pHWf4Ud33mo=;
        b=EmNTZbnNLH1lXT0zuxn2e3vzCAjIREdgaw3dI0H7A0tEgr8phAldaGIlGcAklsDXYe
         ZPn8V7L6WVBq8HS2t7+OdBO/mPMMNFCuh4I3d8aG/XJehH3/Bn5tcRlSXGAw+0pd5TLn
         gy+aE77f19/Pyp86IOabhlLc4tmY85BzDxQSbk0JN1e1N/ZzbV4odOlwZ5LbybDx5a79
         f4EVjImaVyXvGmBqL78LTVPyVL8mRNYE4c5HE5WTsH69q23WZ+zN9I8Qn5pnUV0XaQp8
         Y9L9SuM5Eoi7bf6lsnQ2VKbn4QTq/86Nq3WdQBuDv71NjF4DW4/JG8o3kVsCJoEYoLxc
         19TA==
X-Forwarded-Encrypted: i=1; AKwUvBwP1NmcDRnuCzvkfvlY15kb85c0cuMeVOV1R4mrb43Db51k1C8U7TZ/NaAsBBIiAnllhoV3BNgYBVnC11ZR/Eo1@lists.infradead.org
X-Gm-Message-State: AFq9FYIOyo7AAm9KqFr/22opE117wW2hYebvtDfUDwugcOgXElq/IAtY
	Rq0+k8towNbZi94NANXjqFXsJv7ikVEY00VMhSED5Z/2pLAFDZkJbOTSCI4iydrgWis=
X-Gm-Gg: AYBFou3EQytWzHe/vLRPTCq60DJpmLcrFWzbvZ1AAW9DG16O15cU3nQAPtzqfeJtLha
	s9TKgfnZybIUweJ6ohfKVwvhrngrkfRvgxe3Ao+ySvm+uFtKu4BmIiDKq9Q0a6W4Mv1V9N1fzf6
	WkMhqzKFxoB1R69GAoZ7nRW/bk9GpwmxZp9LGKSzXto9ZPeeKm55GErzWxCYRMwqAU0+af5vNh2
	Gwv3vpT4l4tJ8ZYB8wzNCWroJvHmPjicRO1Lov+iXqgrKvtvzeRErRy5plIIizOWi7eD1T0ask5
	o/Kls8qMRES7QdSjj/dJH+F+H+G3Crg3iQhOiDMxMYn3EEP3NpfjL1uR72mJsGcb809j7Uyq2+Z
	tcHRQZmXoXoEUKwzTjzOLbQvCXyttostLqJJ83OOdFb7h2gDN+wKVkpZYsaleUBT4gzFDiVIg6Z
	GucyYft4aMm+wykN/7n5OG+ap3uxG91z+g6tTDNj+UhAMidp/s3c31m4NQ/mF/dIPD4uikQIrGA
	YYST01V57x0vSvRMc8oe7xPQVUT4MEd1h6i0v/1m4n2FlAh3NS3b6g=
X-Received: by 2002:a05:600c:1da1:b0:4a1:6425:be69 with SMTP id 5b1f17b1804b1-4a1d7614e61mr143555575e9.17.1792395427243;
        Mon, 19 Oct 2026 00:37:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:6674:33bf:38d6:bc10? ([2a01:e0a:106d:1080:6674:33bf:38d6:bc10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471a35sm18346334f8f.7.2026.10.19.00.37.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 00:37:06 -0700 (PDT)
Message-ID: <f5dc8732-9248-44f1-9337-379991cd5762@linaro.org>
Date: Mon, 19 Oct 2026 09:37:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/2] arm64: dts: amlogic-a9-a311y3-khadas-vim-5: add
 initial device tree
To: Nick Xie <nick@khadas.com>, khilman@baylibre.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 christianshewitt@gmail.com, xianwei.zhao@amlogic.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, xieqinick@gmail.com
References: <20261017040038.3702428-1-nick@khadas.com>
 <20261017040038.3702428-3-nick@khadas.com>
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
In-Reply-To: <20261017040038.3702428-3-nick@khadas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_003709_906358_F39047F1 
X-CRM114-Status: GOOD (  18.37  )
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

On 10/17/26 06:00, Nick Xie wrote:
> The Khadas VIM 5 uses the Amlogic A311Y3 SoC, based on the Amlogic A9
> SoC family, on a board with the same form factor as the
> VIM/VIM2/VIM3/VIM4/VIM1S models. The serial debug console works with this
> initial device tree.
> 
> It features:
>   - 8GB LPDDR5
>   - 64GB eMMC 5.1 storage
>   - 32MB SPI flash
>   - 10/100/1000 Base-T Ethernet
>   - AP6275P Wireless (802.11 a/b/g/n/ac/ax, BT5.1)
>   - HDMI 2.1 output
>   - HDMI 2.1 input
>   - 1x USB 2.0 + 1x USB 3.0 ports
>   - 1x USB-C with USB 3.0/DP/PD
>   - 2x LEDs (1x red, 1x white)
>   - 3x buttons (power, function, reset)
>   - M2 socket with PCIe, USB, ADC & I2C
>   - 1x 4 lanes MIPI DSI
>   - 1x 4 lanes MIPI CSI
>   - 40pin GPIO Header
>   - 1x micro SD card slot
> 
> Signed-off-by: Nick Xie <nick@khadas.com>
> ---
>   arch/arm64/boot/dts/amlogic/Makefile          |  1 +
>   .../amlogic-a9-a311y3-khadas-vim-5.dts        | 42 +++++++++++++++++++
>   2 files changed, 43 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-khadas-vim-5.dts
> 
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index 57bc440fa55cc..8b4e3212be131 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -2,6 +2,7 @@
>   dtb-$(CONFIG_ARCH_MESON) += amlogic-a4-a113l2-ba400.dtb
>   dtb-$(CONFIG_ARCH_MESON) += amlogic-a5-a113x2-av400.dtb
>   dtb-$(CONFIG_ARCH_MESON) += amlogic-a9-a311y3-by401.dtb
> +dtb-$(CONFIG_ARCH_MESON) += amlogic-a9-a311y3-khadas-vim-5.dtb
>   dtb-$(CONFIG_ARCH_MESON) += amlogic-c3-c302x-aw409.dtb
>   dtb-$(CONFIG_ARCH_MESON) += amlogic-c3-c308l-aw419.dtb
>   dtb-$(CONFIG_ARCH_MESON) += amlogic-s6-s905x5-bl209.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-khadas-vim-5.dts b/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-khadas-vim-5.dts
> new file mode 100644
> index 0000000000000..3989ce7a8aff9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-khadas-vim-5.dts
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2026 Khadas Technology Co., Ltd.
> + */
> +
> +/dts-v1/;
> +
> +#include "amlogic-a9.dtsi"
> +
> +/ {
> +	model = "Khadas VIM 5";
> +	compatible = "khadas,vim-5", "amlogic,a9";
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	aliases {
> +		serial0 = &uart_b;
> +	};
> +
> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x0 0x0 0x0 0xe0000000>,
> +		      <0x1 0x0 0x1 0x20000000>; /* 8 GiB */
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		/* 35 MiB reserved for ARM Trusted Firmware */
> +		secmon_reserved: secmon@5000000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x0 0x05000000 0x0 0x2300000>;
> +			no-map;
> +		};
> +	};
> +};
> +
> +&uart_b {
> +	status = "okay";
> +};

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

