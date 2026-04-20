Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A983FF36C5C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 12:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U8fwzwhILo+1C84/3tm8ThN3xB60ifomb9gC9Rp9WVc=; b=CLCw+3jw/8XjLn14/qqUObZ4n4
	p0wgfIZRuGQgU6kiMgjisv0lfVrnEBCrexA1ZPiC9Gql2T99Pkn1QmJEpyX+q9RUCm4HDhN5OLCS2
	yj0lu7dfSXaQFYRazTc6OODEGymFJySpoX7Rd4+GX7kX0ZHRu9hFWlIKb1pVq0klXTLtOi92xvyov
	L7YtvM1ztaqsblKkH3cTHFmP9kKqy0+agkx075yKecWmR+V5i2R/XdJkrajnwK/0ucDu/kFkZ534i
	CViNCJC468KI6ge6cSDgUWQ7T6j2Jvxwj6th8h2kJPkSgNGWJ0E0OsejwnaLdS5NmcPv3+1KkzMrK
	tUkreSig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEnLO-00000006quR-00lP;
	Mon, 20 Apr 2026 12:03:14 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEnLL-00000006qsl-0WJ5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 12:03:12 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso40022265e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 05:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776686589; x=1777291389; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U8fwzwhILo+1C84/3tm8ThN3xB60ifomb9gC9Rp9WVc=;
        b=aa9CJR3Itif7loV/79n1gSmwGZm7MSwwgkLojJI1xPMtGxwWeNA25koL7NxiaWm4CU
         MX6d9zvV8lC/QU7ARTxpUsbsVM0L3ogYgvB4rhQXJmmYiHg+wJez84lx3+S7AiLq9VK2
         AbxnSyv5NBv82HxfCZziy3QyoYnZNq+8mWCdnUjGOQUZrFM+nIkFoWLy3hzFJkQdUKtx
         O9+4ESbUZfLoyOZ5roUlAJAZI+FUYyIUMbdKOS3monAtpl9HkbE6h2izEi/nQLrZJJjG
         y+Z3JdADUx8CvaGbIjXCMB/+HI4YbfPWNKthuWd5a7OjmL43RjlGORGNHdxtCswDf/yb
         KGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776686589; x=1777291389;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U8fwzwhILo+1C84/3tm8ThN3xB60ifomb9gC9Rp9WVc=;
        b=hJ7KDbJWskch7ZyHJH1IgOWHbhGJWqJcq8Q2nIhMwNpL/cgdp7dOBTLai0OJxB7U1J
         I4Hb7rlxMYpy9Qd4wNfZKWA8VyAcE3TH+NNenXrUBVsccQzpY4mwd+ikAICrQcdytIIj
         SxQr9wzkcoMXnKQSi1z7hhG01J1HriNvvPW7Zf+UXmpKvxHCvk5iyhAF/QFQ2DZNtnUL
         TMJ0uUpYqRlbtaVHPNv7aI5Rm6Uz4kmzlQFuDEJNwiCKlRrBBVKpM2dRJwycdtYzocv4
         lBpSy7ZjZSxJdyhHwm0kYesevTK42Z0EPVMcH2opeLRbZsXUqac3fMqdUmdSe6MK/4fJ
         QOoQ==
X-Gm-Message-State: AOJu0YwR8jbpTmU5lKsjtu3sVF75aXZ6RXjQrpnGo9XYjiykW0PfTj39
	UQmScvlL/ZQkDnmpWNrG7IsXoQrSCWYzMT4ZXvOTTVtuFnTOzL+1gqDMOLYh71NQ/EQ=
X-Gm-Gg: AeBDieul9JEJGV5uIV/jVSYv8NnvzqqvsCCeQvsTRK0lyYrr3d7Vb/IzASDccLH32uE
	858gO8x9uHOgtiSpx1WCVpd8nEwYs3n3SD6UuOVCJyQypGOwZzzu+3QilfNTh0e6wtMpdAyiONM
	o+7PFbQL2PcsPS57uUH+6dbPqCKSYLKGb9KoPQjRkUY0SH8rhdJuQw0nYDqHD48o3ArcYTXyVXJ
	TqdazSAYAqfM95YIxbN9o1bvL1a5AXWKB/vIEyHcKF40jdsnkHltialUN27ja51YSCczLKP21r0
	IhX9S3IhVAR6zBiw3rU8Qm0UOJ1NypabeYQjS3gSZ2vGWIrRXnk6k2vqWSjbsfr4We62/jjAiPC
	CO1qQPybLYPpKisnd46n1zpE7tFPi1KpoKTCWoW1euwF2H0NhyFlgV7/Algfi0W2UcqCP2fNBjF
	Vk3226S8hS1oOmHdoQ63uurcm/YEEI4MSrDsKbNwqQMIApB9NFxQUvt7Gv9vdFAvp7RvRPtGXcI
	1VolNuKMB7WYrPnZg==
X-Received: by 2002:a05:600c:620c:b0:488:ae6c:42c6 with SMTP id 5b1f17b1804b1-488fb7786c2mr199792815e9.14.1776686588896;
        Mon, 20 Apr 2026 05:03:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:851d:cf13:ef26:f254? ([2a01:e0a:106d:1080:851d:cf13:ef26:f254])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7aa593sm89632355e9.24.2026.04.20.05.03.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 05:03:08 -0700 (PDT)
Message-ID: <11812932-d985-4e4e-ad6f-28e1badee216@linaro.org>
Date: Mon, 20 Apr 2026 14:03:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 2/4] arm64: dts: amlogic: t7: Add UART controllers
 nodes
To: Ronald Claveau <linux-kernel-dev@aliel.fr>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260420-add-bluetooth-t7-vim4-v3-0-669cd2530ae5@aliel.fr>
 <20260420-add-bluetooth-t7-vim4-v3-2-669cd2530ae5@aliel.fr>
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
In-Reply-To: <20260420-add-bluetooth-t7-vim4-v3-2-669cd2530ae5@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_050311_329614_A9831C4A 
X-CRM114-Status: GOOD (  14.86  )
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

On 4/20/26 13:58, Ronald Claveau wrote:
> Add device tree nodes for UART B through F (serial@7a000 to
> serial@82000), completing the UART controller description for the T7
> SoC. Each node includes the peripheral clock.
> 
> While at it, move the uart_a node to its correct position in the
> bus address order (0x78000) to comply with the DT requirement that
> nodes be sorted by their reg address. Complete the
> uart_a node with its peripheral clock (CLKID_SYS_UART_A) and the
> associated clock-names, matching the vendor default clock assignment,
> consistent with the other UART nodes.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 61 +++++++++++++++++++++++++----
>   1 file changed, 54 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index 4a55d9641bc9b..81c26b1e3e7a4 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -577,13 +577,6 @@ gpio_intc: interrupt-controller@4080 {
>   					<10 11 12 13 14 15 16 17 18 19 20 21>;
>   			};
>   
> -			uart_a: serial@78000 {
> -				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
> -				reg = <0x0 0x78000 0x0 0x18>;
> -				interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
> -				status = "disabled";
> -			};
> -
>   			gp0: clock-controller@8080 {
>   				compatible = "amlogic,t7-gp0-pll";
>   				reg = <0x0 0x8080 0x0 0x20>;
> @@ -713,6 +706,60 @@ pwm_ao_cd: pwm@60000 {
>   				status = "disabled";
>   			};
>   
> +			uart_a: serial@78000 {
> +				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
> +				reg = <0x0 0x78000 0x0 0x18>;
> +				interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
> +				clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_A>, <&xtal>;
> +				clock-names = "xtal", "pclk", "baud";
> +				status = "disabled";
> +			};
> +
> +			uart_b: serial@7a000 {
> +				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
> +				reg = <0x0 0x7a000 0x0 0x18>;
> +				interrupts = <GIC_SPI 169 IRQ_TYPE_EDGE_RISING>;
> +				clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_B>, <&xtal>;
> +				clock-names = "xtal", "pclk", "baud";
> +				status = "disabled";
> +			};
> +
> +			uart_c: serial@7c000 {
> +				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
> +				reg = <0x0 0x7c000 0x0 0x18>;
> +				interrupts = <GIC_SPI 170 IRQ_TYPE_EDGE_RISING>;
> +				clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_C>, <&xtal>;
> +				clock-names = "xtal", "pclk", "baud";
> +				status = "disabled";
> +			};
> +
> +			uart_d: serial@7e000 {
> +				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
> +				reg = <0x0 0x7e000 0x0 0x18>;
> +				interrupts = <GIC_SPI 171 IRQ_TYPE_EDGE_RISING>;
> +				clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_D>, <&xtal>;
> +				clock-names = "xtal", "pclk", "baud";
> +				status = "disabled";
> +			};
> +
> +			uart_e: serial@80000 {
> +				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
> +				reg = <0x0 0x80000 0x0 0x18>;
> +				interrupts = <GIC_SPI 172 IRQ_TYPE_EDGE_RISING>;
> +				clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_E>, <&xtal>;
> +				clock-names = "xtal", "pclk", "baud";
> +				status = "disabled";
> +			};
> +
> +			uart_f: serial@82000 {
> +				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
> +				reg = <0x0 0x82000 0x0 0x18>;
> +				interrupts = <GIC_SPI 173 IRQ_TYPE_EDGE_RISING>;
> +				clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_F>, <&xtal>;
> +				clock-names = "xtal", "pclk", "baud";
> +				status = "disabled";
> +			};
> +
>   			sd_emmc_a: mmc@88000 {
>   				compatible = "amlogic,t7-mmc", "amlogic,meson-axg-mmc";
>   				reg = <0x0 0x88000 0x0 0x800>;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

