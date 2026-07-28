Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C26C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 08:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lceCMquYfWGQoKHrpWrtsA8ES4itoEqcbDu5tjp1DxI=; b=NPxf7KD+hF7cuiuSGFzfqvzfnD
	z1HVYkq7UvBAaz/2GrRmVZdO2cH9PAbBdzMI5ak07sqgDjboJJAHBvS1hb8bK9JwVWC8VLvmwgm2l
	aL9lMkRVo7fBIe6D8vHFbE+BciuLrxTAnrHQ9pu9jIPWc+cD4ktoDCTCzvUutq+0hBqjG6n1eC17/
	fSRtYC/Ly8Y4Py6yeyGVa+YGlxwpYwjMBvWiiIPYwL3yV6/KWeXPHjdJKBrAw5zQXPBd/Ep+zQEML
	sD+t5pOxJs0tqbMHZpenykMQ0DSRtnFJphfF4vxXeu6sp33BskcJil+M7ivYj2qrTj35AW/RmeI69
	mSJ1vndg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wodHE-00000004j8I-0fVb;
	Tue, 28 Jul 2026 08:35:04 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wodHA-00000004j5S-2KAx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 08:35:01 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4954aff6088so31025085e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 01:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785227698; x=1785832498; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lceCMquYfWGQoKHrpWrtsA8ES4itoEqcbDu5tjp1DxI=;
        b=vOA8XpORWQKwFF9vFAv8IKKGcSxqMbF81rG0GQzl2CNGsKmeprA/a+ubRU1a2QgrBJ
         ev+Pkdv43tntrOMOLR8bVlsD+sVPRG7Wr9L022IpMZNgVXoiQh0T955wUmo8c2oQ0fQI
         0beoChn99SbXLlsPYCMS1k9eC7I7m0wZCZgvSwHKih46IKmCx74pWe9lk1OMiEf1Vf0J
         JAyG4ooNhmvWwhSAhsd8NkZuY/iYlO2qX+QcaZhSH4kMwMiRR1vQdLN66OmBDm8TJ3Be
         fEihSNHDWf/mujLmHo1Kk1K3tWGwP/Lvc2ma5l98P5CS1cxYaRNm8iPePGm1rol+XsSa
         6BjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785227698; x=1785832498;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lceCMquYfWGQoKHrpWrtsA8ES4itoEqcbDu5tjp1DxI=;
        b=AtPrTXyWtTXpGrPhHEfa/FNUNEgIyVLMzz4V6jNgvr+I3dNCyLO/AOEg11oEpBoUA5
         t0hS7nZ1CTMsb/dsJJ7k6N7+iBYDxLO+9ZimbEVnn99hZmngbhJZ8x1YdWXB4qDD0pAf
         ykuQ9vpUyA8C2YQD7hW7fW7T2JLs0FhmBMrgd+Cpu+mlhjizRUReEsGxij87CvaARvV6
         cSOQkADhhESz4X9mmWMkVNxwX5DF8HwaahDHjbDdJWHou0GmTrT1+2JFqp0CJz9v1Yqw
         uydYEP1qnvF6To8clIwJ4Ms4JIhIRPD4Mod3GCrtX3dwzVANzvoa6/NnHTOcgBTiNqlK
         HOkQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp1xKt5cnAgMK+3wUWxe4IYZ0ZazlatOosBwtSF3MyCH2vA8S/EaQJy4WUIP9V+KJB29oZ9Og5mcdMEC4xoqr+A@lists.infradead.org
X-Gm-Message-State: AOJu0Yy073iNyoI7h074Vk1+TzqUzvAzLIAUfwrSPaWAuCNHtfZmD6am
	O8V86Ry32ZrgFMQCh1px0rkH1+pnPdRtKD2x7howzCyIc2+8jtlklrFiLhsOGaa5EQs=
X-Gm-Gg: AR+sD1021QJ5hb3XA+fwAal/TVWwXKegn1WcGb5t6Szwu3N5IQ6gXpZLVX6t+ma4jwQ
	PICEbUVALjW5R2HGnp+Jm33CT15a5YgdfNkA9NRfgAVCAcaDVVurAwbqrpknX74HXWgDYbExEG8
	TZ1eOz2dpUQZRc9LaxYYJSLPVR5h3KVzGn5vc5d8yXLSaBB4rmG6vf+sZGhTYsZdI4ULTvvttoP
	riTEtdRZpqySopAkidM+EXdnBcADa/6pW8Ahedj4LWfBa2IC+u8298eNy6lpGe1HdehDepWcwUY
	3WTQwJwbKY5nDHi5hqRiVhYv94YVLlSqloDXY5KeOHQcRzwpvK9aNpltrV1jTyFVMYprq21jfmm
	5Y2GZMAVyF/8aeRMaSDntmEwMgl283Odx88Um9Yi8vpVPx3M9QRO80+HAJ4IOQZnAtUFZfMrieN
	lO84St95EjjKI+g16ZQcG8MUTJAmo0v9+Rbzbncnidu4GEf52tU+D/i0rLMKWNclUljzCx
X-Received: by 2002:a05:600c:1384:b0:495:6e68:5df2 with SMTP id 5b1f17b1804b1-496c643be67mr15873355e9.12.1785227698475;
        Tue, 28 Jul 2026 01:34:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5788:c4e1:cf35:7211? ([2a01:e0a:106d:1080:5788:c4e1:cf35:7211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a5c4sm56310759f8f.8.2026.07.28.01.34.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 01:34:58 -0700 (PDT)
Message-ID: <9dffc605-2ab6-42b4-a7f9-565bc16d8c07@linaro.org>
Date: Tue, 28 Jul 2026 10:34:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/3] arm64: dts: amlogic: a9: Add power domain controller
 node
To: xianwei.zhao@amlogic.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Ulf Hansson <ulfh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <20260722-a9-pm-v1-0-1fe20a44bf2d@amlogic.com>
 <20260722-a9-pm-v1-3-1fe20a44bf2d@amlogic.com>
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
In-Reply-To: <20260722-a9-pm-v1-3-1fe20a44bf2d@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_013500_638818_45088FE9 
X-CRM114-Status: GOOD (  12.98  )
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

On 7/22/26 10:39, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Add power domain controller node for Amlogic A9 SoC.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
> index b0e0fadeed82..3652b2034c96 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
> @@ -7,6 +7,7 @@
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/gpio/gpio.h>
>   #include <dt-bindings/pinctrl/amlogic,pinctrl.h>
> +#include <dt-bindings/power/amlogic,a9-pwrc.h>
>   
>   / {
>   	interrupt-parent = <&gic>;
> @@ -72,6 +73,15 @@ cpu7: cpu@700 {
>   		};
>   	};
>   
> +	sm: secure-monitor {
> +		compatible = "amlogic,meson-gxbb-sm";
> +
> +		pwrc: power-controller {
> +			compatible = "amlogic,a9-pwrc";
> +			#power-domain-cells = <1>;
> +		};
> +	};
> +
>   	timer {
>   		compatible = "arm,armv8-timer";
>   		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

