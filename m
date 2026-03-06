Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852CBF0181D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 10:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tv4dJ/4VMXcAmevXlUG/734DLVWUrC6bvT8eqbpexP4=; b=omAaivZJrMEiP1L7eBM/KP5Zh8
	TW/5anTH/nvbTNLj/6RdaqHIJuc6UyzbMNoH2LBKglI0CPUBGRnboVmJQFt6pH7u761qlReyj8Nr3
	Hvk97qgVZhNIxXPk0XCdOhEGDB1EYM5e/tl46Sk1NAl633amAqcjEul5bYIKoSXIuoewHvvg5swnE
	YyCkLgHjOfgHpVM6ETuGwOGcv6mcaKTmq+5YWToSL4ewjgjKTq2yndj3Tueit0ZvpuV2L1YhTgo6n
	08TFlybpLf9yY2vD4zGG2bZo1SGhrK1i4XU77rrivxfeCP5pYpQCxvNO7J4WfcmxNCmT3pLRscXF5
	RtRj7w5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySAS-00000003QMD-2HFX;
	Fri, 06 Mar 2026 10:12:24 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySAP-00000003QLL-3DhP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 10:12:23 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-439b73f4ab4so5873155f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 02:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772791940; x=1773396740; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tv4dJ/4VMXcAmevXlUG/734DLVWUrC6bvT8eqbpexP4=;
        b=uLAT0JzVZwZK8P8HbyYFdPQ27CLJbRKsXBzPOu32iEPvuN08GO4OdjCoEOpkLy2EMr
         w7WuXBuKTEBOnLlIuFMy5XphwHW3544MnVMatHMsrYOdrtWECsG517kRx11DKO8BrP3C
         DCi8ZtzSayALz5ytVX6xGZQ49HV3J/XWn93G5MQG4nk2HJD//wDCFZoaGO6IBd2OTHSh
         RIgGIyIxmARIcYwJJ91Qd2vfhPL4hQXWjKZ29c44k+FHgX6Mhn7i+/DuIVWhhU231sm9
         RizHsEx3+51AXWiZ+hCNV1aEmdhknIdskAQ48UgvIFLQKNwN5AXwrXm+YMv3dF+88B0+
         shqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772791940; x=1773396740;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tv4dJ/4VMXcAmevXlUG/734DLVWUrC6bvT8eqbpexP4=;
        b=ao1CF3AFE3e8DBTMWQIfY4H2nX73YzT+Z8vwgBM7Jq9nXk6RxfmM5LezQQwt1YN7sZ
         yMncOMoM58IF6AAyO3lEiWVRjHNRUdKHUNOjLbZd/EHx/SrO/sZ7yFTAjkAQxYTjDpAk
         RCWUy8CaQmTVysNyBp0EPbuSzzugM95IU9lVwCf4Z1XLi4CZHrE8X7SN8J3mmOs+szh/
         kFES4sngaAS166X3FY5EkE5MQxka38a+qAw9+XuSre9VvcWh36anu9dVhhsDVv2Pj4rx
         tESXUkddUmIgy0ndypugbBGSquphlKd1oWN64bdAkkTFO+tk1FhJJyW2pCiO36O3hIlw
         eo9w==
X-Gm-Message-State: AOJu0YwEhPpn9DEGhpmeYYLlljFoqLX/dLAE6MeHu4AkGrKeQ4rUyPJO
	CWvFVqUwVNHQb5Sk402sWae3Uzwl43xARxusRWeXvEKFlW6pbKdEguSYP7+mLk1Vzvk=
X-Gm-Gg: ATEYQzyirNc7r6CfjhR6CNg8lgeqYFW2lAbnqzIyK8fpU/gXqwwL9BqdrVYhiZ5ot2f
	ae4hDgNdmOSRZ+KH6fPny6l0bNnQUWIqhlDxEJtxfViVobCj2jNeLxLOA1Z2gF5yQQT/QnXcyQO
	/6DGIGP3HWZNS1FZAVDNk+nn1vDqvZwtQZqh+c2uCVBe56Sgt6z1RE6g8eLJnC+JTARL5vQLgjL
	W8ESyPdmCHwcfo1jUUDy5ZO2ie9wJdP+ww1ZUyxjGG2b7kvWLE8fEOJoFlqZDaqUjc9IiWVycxy
	lTX/qFwOa8B5DyHokvLbVDJC5G0bMQT6YKhvtGxWy9mKZeGTl1j8eFEYyQGcOj02EiRhQYBWj+j
	+JPx08Zp/+h6UmIniIYu9cwaNNVPQokPSsIagYQMmRfdZMbLawryNeNTk8VztORLQahgpdQM6Y9
	wZxKRB+8nJS89kmZtR5B5Bfz8wh13oqa9HOQwEC+qSO7HA5Yxa1bHbtjDmXAWkSl5I5/vKSDn+r
	5tQ
X-Received: by 2002:a05:6000:1acf:b0:439:d752:8bf9 with SMTP id ffacd0b85a97d-439da8a0219mr2636932f8f.58.1772791939641;
        Fri, 06 Mar 2026 02:12:19 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:cbfe:649:7f17:8b95? ([2a01:e0a:106d:1080:cbfe:649:7f17:8b95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d968sm2529820f8f.6.2026.03.06.02.12.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 02:12:19 -0800 (PST)
Message-ID: <6b4ea910-1a73-421e-8a38-8827a506b937@linaro.org>
Date: Fri, 6 Mar 2026 11:12:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/7] arm64: dts: amlogic: s6: Drop CPU masks from GICv3
 PPI interrupts
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Marc Zyngier <marc.zyngier@arm.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <treding@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1772643434.git.geert+renesas@glider.be>
 <f9c6eddebebcd2e128edd2dbc51706e23589f9e8.1772643434.git.geert+renesas@glider.be>
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
In-Reply-To: <f9c6eddebebcd2e128edd2dbc51706e23589f9e8.1772643434.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_021221_853024_7927EB08 
X-CRM114-Status: GOOD (  12.75  )
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

On 3/4/26 18:10, Geert Uytterhoeven wrote:
> Unlike older GIC variants, the GICv3 DT bindings do not support
> specifying a CPU mask in PPI interrupt specifiers.  Drop the masks.
> While at it, replace the magic number for IRQ_TYPE_LEVEL_HIGH by its
> symbolic definition.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
> index 8ef6319390331fcf..ab3acef2b147e62c 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
> @@ -53,10 +53,10 @@ pwrc: power-controller {
>   
>   	timer {
>   		compatible = "arm,armv8-timer";
> -		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> -			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> -			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> -			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
> +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
>   	};
>   
>   	psci {
> @@ -84,7 +84,7 @@ gic: interrupt-controller@ff200000 {
>   			interrupt-controller;
>   			reg = <0x0 0xff200000 0 0x10000>,
>   			      <0x0 0xff240000 0 0x80000>;
> -			interrupts = <GIC_PPI 9 0xf04>;
> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
>   		};
>   
>   		apb: bus@fe000000 {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

