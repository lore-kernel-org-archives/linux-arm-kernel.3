Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E96D1C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 12:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lQ/iGDifZoJFpYpccOafvVqXyLvyOSbrLk1nfUTcRGE=; b=ay4cgHE8pP+rfyfCTOBSGMbDLP
	rOjCycUFpvSqKP/3e3j0LX0OuMaim91NHACgIiyC6ZJYc/4yc3DNi8C7IKfXxDA22zyFMhgB9drKP
	N7uf75nmG7R/DkKqnVNYWAL2TX2s+I2XY4CDtlwk/gU2JNKWRw//k3Z4kjm4nutyPloXQvie5Y6Gb
	apEdpG/ZUrtilYwJZN/bOYM7tGshaXpxAJKnwIwXkXii6B9ACRdyMevwlVukRH/0ZV2atsp+Ap2oK
	GZxwUrlgLbpyVpdnuIpw/2TjPZnGSbHC+tsVTg9a12g0XDgejh/ALca8Q20KtoNW0YJQAumOUz8Qk
	JNBueAGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHMDB-0000000Cst7-2BmG;
	Tue, 20 May 2025 12:36:49 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHM9D-0000000CsDY-17Sj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 12:32:45 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a375d758a0so1315826f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 05:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747744361; x=1748349161; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lQ/iGDifZoJFpYpccOafvVqXyLvyOSbrLk1nfUTcRGE=;
        b=a2VC+QGFzXAs2mYLTgPQ2/wIY4J03h73g/IEu0daTc0AuJYfJ1S/j0WtWxLBiOTrb3
         ohuuwcgHIvdsuPLDKVWqCdVc5V8s7v9K4eG2segH6R2DsVW3bxo+sYTTvL9pYDendWz7
         ex5kcdMmTWLwUbt81Wx7PI+7VSG6CptUYU0VFpBdbbT7Kf4suskO/4BO/vAC2pMAX6gO
         XR1PTAEZ3ws2eDFOgbd4hnBr+hsq5uTzjYjFxvxqHnRFAYtSrLbxodmH/zyxKkNdLAPU
         r2aI6wIzyvjvNohamXTSASWCSfbkG5dMuab+4Nqp992eSPLaEsFVYHg/1+PWLcgCSNPI
         I4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747744361; x=1748349161;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lQ/iGDifZoJFpYpccOafvVqXyLvyOSbrLk1nfUTcRGE=;
        b=inqLMd09dJw4JhHYpskjpNoGFAl6IFJZv922E5ZiMV1AyhpL4L3Lewmz0qQTGw14D1
         MrCa+6nUFvzTBbCPdOUMgC2KxAxSteGw1O+awe1ZxZODs9dYSGfSyMlpjMF2RZVZN9u3
         akzAbPLqC3kTBOp8Xp+EDpEIo5IP1wqso6nauA5dihcRP8SE+t2E7eSphVkDKs1pAYTf
         jzI1zie57xWiq0PdBjYa6fa2VdiP+5tN/4sXSmt2j5jt34REFjMms6p1Q2IGHk81iu3Q
         /+Z+4us2ARfp6EvByKaNDjCqPNk6gjDgoswmgaYScO1mSi4mLZ/+KTqDv+iyFVpC8dM/
         CFTw==
X-Forwarded-Encrypted: i=1; AJvYcCUszRF6AqqO/P79sDu7IFpbwOmf7O66w47Qs3fCeIRVxrMx7gX3ejX5R/fYro/CXPoNDYl2tUgE4rbEWiw5PnR+@lists.infradead.org
X-Gm-Message-State: AOJu0YyaHbmxQbkitgFxdEsYsPfWSduJH44ux0WaJb8wZdpfN1YiwZW5
	YmNwkHy5HPLet7SCpME2mEY58WT2kSb134iUVw75XSJfBSMkldVr3kf0cUIXQUKUUXU=
X-Gm-Gg: ASbGncvggrqqmnKAneiwqmqhHqoj8QdP9lO0oElGNF/ZqNE7hcLdMT5b046Thp13dec
	SY8iGU70lQrRuCzoMug1lraLKPSfIPr+Qfb8S6HOXxhv9OZap4laWHqmTLp+A9MiV0KvDu2fZ/C
	LrtGb55/1fDA2agGJzeQNTTNg/2JxJxClE7KPTQPCS0CleVI6EUDvrr+TqNnnqSfN8bnRY1SGHB
	b98gDyvB+C2GrC1UELPMmgVwskewHGGSwVxaayJwBsfqew0sUWEyEG+f0LiWs1Bc+/QxIqH2F3s
	DT2lchjDUaPmlnKSta6JxuV83KDYZkAAi/9um6xrU8x2yJZge5UHeAY8TcBjOnIIiD5VRX42LHx
	i68bYaorlyUi4h1aD6e6e1ZfUiAm1
X-Google-Smtp-Source: AGHT+IF9JgnEXOZZrtY+Ie0ZOfbkRyYBtLxvkI5PbUcfuC510953elD1+wY7Qfb0abQ602fLh29f7w==
X-Received: by 2002:a05:6000:2509:b0:3a3:7bbc:d957 with SMTP id ffacd0b85a97d-3a37bbcdaa6mr1647245f8f.33.1747744361519;
        Tue, 20 May 2025 05:32:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68? ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a04csm16065014f8f.23.2025.05.20.05.32.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 05:32:40 -0700 (PDT)
Message-ID: <872b7da3-b771-4df3-9b1a-21ca48c36045@linaro.org>
Date: Tue, 20 May 2025 14:32:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v1] arm64: dts: amlogic: Update USB hub power and reset
 properties
To: Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/Amlogic Meson SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson SoC support"
 <linux-amlogic@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Cc: Wayne Schroeder <raz@chewies.net>
References: <20250520091842.7504-1-linux.amoon@gmail.com>
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
In-Reply-To: <20250520091842.7504-1-linux.amoon@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_053243_316303_60DFCC27 
X-CRM114-Status: GOOD (  16.29  )
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

On 20/05/2025 11:18, Anand Moon wrote:
> Add missing reset-gpios property to the USB 2.0 hub node to
> ensure proper reset handling. Also update the vdd-supply for
> both USB 2.0 and 3.0 hubs to use the shared hub_5v regulator
> for consistent power management.
> 
> Fixes: ccff36934137 ("arm64: dts: amlogic: Used onboard usb hub reset on odroid n2")
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> index 3bca8023638d..ad959f8bc1ac 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> @@ -42,7 +42,8 @@ hub_2_0: hub@1 {
>   			compatible = "usb5e3,610";
>   			reg = <1>;
>   			peer-hub = <&hub_3_0>;
> -			vdd-supply = <&usb_pwr_en>;
> +			reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
> +			vdd-supply = <&hub_5v>;
>   		};
>   
>   		/* 3.0 hub on port 4 */
> @@ -51,7 +52,7 @@ hub_3_0: hub@2 {
>   			reg = <2>;
>   			peer-hub = <&hub_2_0>;
>   			reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
> -			vdd-supply = <&vcc_5v>;
> +			vdd-supply = <&hub_5v>;

In this case, also remove the &usb2_phy1 phy-supply since now it's managed by the hub reset control.

Neil

>   		};
>   	};
>   
> 
> base-commit: a5806cd506af5a7c19bcd596e4708b5c464bfd21


