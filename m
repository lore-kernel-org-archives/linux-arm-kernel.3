Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED6ECCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 07:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n9ObVqClbbnCEqz8bXzqabp6JeM6PWWAaw5dtxMVdvI=; b=smho3WDWCX1HShFYxDDR88ebbW
	xeLlF1PgLwVFRuRL9sBkinPTvyMrKNBOvKSDYh3wqBPBoE+bgOZ6WLeehNTpIaVRGasB7ZPO9mIfP
	mARm8J3+MKQur3UgwQNckkC95mg33Ki+O2IWW6j37ysv/okmpZCPiA4dG1HDG3EiEa2wsfrl24g7u
	5Cc2ntOE8Mtftr4nfJNYHAjYYhXtkw+fsOmBqayfuOzkNpswe+rNrrb2PDjisf6JDnLvtoBzTn4UD
	jUZjsvnvGNijCsZiOva2mSBSUO6VDIDEmqaAPbw9s8cjKyro2KPr8j+BxsEaFR6bmWyKamqtsXo57
	LseGReOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLGc5-000000000qv-0San;
	Tue, 18 Nov 2025 07:58:58 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLGbx-000000000lb-25Xc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 07:58:55 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so21590945e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 23:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763452728; x=1764057528; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n9ObVqClbbnCEqz8bXzqabp6JeM6PWWAaw5dtxMVdvI=;
        b=P3DJgR2wY2KjqVQp2NQlZsk03kkDcQQzUZ50tM6GXwGC6X1uAAWiUJRB//ywroEqgq
         IIKnkslNP2UD0o782JhOQoaVOv505ut1Gg2PiKhceGiX82cSe3pJ2wN6MaYv13wUMlPv
         XOZLVEj3AUZv2jbrVc9Z4yYVQGX7FkXSeWdH5RZID+BMHYZ+xgyNnbSk5bhpNbBzUARx
         ty21tXtSONHw6Tpn93CtxQWabpqQrR9ZjD4WFbUbItR4zBgdNGmllHoQTY13jF9zDlOT
         jchuM3EucKgjAxhTH2GtNriKXcfp6+dKQ0rfRNmdcElGl5GwBRliUFVRlSyDVkLG/h2U
         +FQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763452728; x=1764057528;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n9ObVqClbbnCEqz8bXzqabp6JeM6PWWAaw5dtxMVdvI=;
        b=iPbwAz9L/zGoPwxzufrO2IgproeNqdH++UE+SRu6WeJtY4UvSa+P4CFVGmjanp60/G
         ooSNi/Ue1VMg+Gi3k1uzSjwg6IdLQ9qWdNcV/sbUuQ0B8S9tAsszGw+xXlZsJb818fje
         exkMqxDb0Ep4z9YHSWrfJweLrTUhmOXg+CvtKHsEUiWgXp2yFeRx/ZpTVK7cAXZrPIau
         2fT2f4VS4Fq5oPajUWZ0QrKxKBo3ALyEQEa7KlUrBgg/HmiareenLB7QERwhhG6f21Jm
         U2C/BLhc8zLXH1clBlds+w7qAEhxbicbtsD8jI8JHhvfQP4O473NEIFehVRmG8hM5o87
         Y1Og==
X-Forwarded-Encrypted: i=1; AJvYcCVhXiwzpTKaAabaTVdv5aryvEaxbDjPEkAjIgAA+DBXGjpTNPg4zsRvChcVxjEkacaT2RyUAw8c1bndYR47ClAB@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4F6I/la/JSnj2eyd7DmniryOw85LTVJKxlKH2Cv4tccS32Nse
	y/BGr3AHand+HbcdXJvQ1+lWXAdkk2KKZ3Yx2Wc9blr+bNYkhhQ3x5VdrQgSiIFMK2w=
X-Gm-Gg: ASbGnct00MqqjI3KnmajisNjUdizM+3TWnbgbl17cYGIMcbTImC8em7hgPH21LqNjd3
	yHj6uyGEdgwog3FpfDHXPZnXqFah2Xc73w7GxL5Gneew3SsHchHgtmQUAmlB1SAsQ1aN1+vO/+Z
	anUSQrAR3rYJ152EIwN1haKcFhdtJ6eUdpH3N2AIxkJwa1GRV33diQkg6yQmY/wO2s6HIXwQ1pu
	RtWLwH4r8DrVyI5nK1slc6Qos4NNt5Kf8SQTgJlKZ81l44Mnm8VqCqysQYosvD6lqm38auNqFLP
	6qezr3ajvws/+7bykS4V+lT7xrKenJZ9/PYPtdj4wLff1T/eaJ/JA+CiPN1DfobpnY2QJXlfq00
	HpWzABF6HEcCniNjJvEG46oKUhIrx9AHnBV4jJDqxGRWdEsdz3tkWCDc9iwJ/3xgWby5FSxB7tM
	6cqSh1L3iesYG6uHJ2ppwPc5gNgfHHiYfRl2nFD3J62WNpxQpRr1JnjGTixW9GYBhDdEgjOh8rL
	A==
X-Google-Smtp-Source: AGHT+IFAoNF3BK7VDc+szlg2LKY/XNpdmDDVaz3nmDf3hZz+gWKkGx6bQOoyTh5ZVxqOTyI2e1zvXg==
X-Received: by 2002:a05:600c:1d19:b0:46e:5100:326e with SMTP id 5b1f17b1804b1-4778fea835dmr132265535e9.23.1763452727698;
        Mon, 17 Nov 2025 23:58:47 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:366e:5264:fffe:1c49? ([2a01:e0a:3d9:2080:366e:5264:fffe:1c49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787daab3fsm377307365e9.0.2025.11.17.23.58.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 23:58:47 -0800 (PST)
Message-ID: <04efc6dd-f3e0-44b5-a043-dab423dec232@linaro.org>
Date: Tue, 18 Nov 2025 08:58:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 5/5] arm64: dts: amlogic: s7d: add ao secure node
To: xianwei.zhao@amlogic.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251118-soc-info-s6-s7-s7d-v2-0-38e2b31a88d1@amlogic.com>
 <20251118-soc-info-s6-s7-s7d-v2-5-38e2b31a88d1@amlogic.com>
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
In-Reply-To: <20251118-soc-info-s6-s7-s7d-v2-5-38e2b31a88d1@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_235852_212749_FEB25333 
X-CRM114-Status: GOOD (  13.58  )
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

On 11/18/25 06:59, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Add node for board info registers, which allows getting SoC family and
> board revision.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
> index f1c2e91ec6c5..e60167af0390 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
> @@ -194,6 +194,14 @@ gpiocc: gpio@300 {
>   					gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_CC<<8) 2>;
>   				};
>   			};
> +
> +			ao-secure@10220 {
> +				compatible = "amlogic,s7d-ao-secure",
> +					     "amlogic,meson-gx-ao-secure",
> +					     "syscon";
> +				reg = <0x0 0x10220 0x0 0x140>;
> +				amlogic,has-chip-id;
> +			};
>   		};
>   	};
>   };
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

