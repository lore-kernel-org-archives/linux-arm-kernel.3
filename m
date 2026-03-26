Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E0510A62C0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 12:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yx9U8ru1kAXiSx+zB+95J2U/zt+/QpX2ZNGpavJgFb0=; b=PPB/bY0wwbq6+Dds4Su8PCgJyZ
	Elgg0caT+r4zsMiPrg56NYizbo9r/l+c/hIfuM5B8l3c3imBaBWcZ9q/d3OSUo65FkeWKHxUvhDX7
	cnWM6h+29lFUdMnD7aVwXKXKDuvHN5o9XLD7sqbJJgEWnvN7MR3kLwpZdjL4tQODhxRRqqRCkoZpB
	4ai6506q3O/W02giai/AILW/ZI66P3r32uTUbaCPBezyFCgLAXDkd0hH07XIcSOxI8N52wkdiNq07
	qAEUiQMlj48G6/S+KBiar9qFa6MqK4i2e7bKqomzAAWvwAO0kYoRXntR1x5L3lbCh60eWjvrD5ulg
	CRn4BZxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5kFw-00000005V8C-0le9;
	Thu, 26 Mar 2026 12:56:12 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5kFr-00000005V71-3TDC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 12:56:10 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so7876355e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 05:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774529766; x=1775134566; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yx9U8ru1kAXiSx+zB+95J2U/zt+/QpX2ZNGpavJgFb0=;
        b=cgoY1I0v8XVPSwRPL3AFK3SXv2qJYqETsdcCZFqidx8KnY/X6d3ODqDEXAlewjP/F2
         5xc/GF5NEKBA6cFKPuG0HlmFT/Th2IDk3cV0412FEEXVbjZBGhbhkxlS8PXNnwNypVYQ
         724HFr/7SuHfsmp/fGtWyG1781UdkBjCIkF3ULeaVJntvoE0Dd/DSEPwyE+0LkQZLbL0
         3yEPSCrIpsyc7p6xJDS5rU0bwuzCKjL08RpdZPY/UEOihQ9YyVcSozfMDSt0VUJAK31e
         oMebIZrDoiOeaEc3dRyWXTtxm7E/he7A/mxdR0+r6on4rPjq7LnF7OepnD/J2nIoQfrE
         kvAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774529766; x=1775134566;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yx9U8ru1kAXiSx+zB+95J2U/zt+/QpX2ZNGpavJgFb0=;
        b=BGLaRcdUctNRnXuz3hMRpIytnIB0O5rXO+IL2lgc4ZsiVOeBhdaNIBVVNo9jVQQZUZ
         o0jYriP7fqs1UmJ1xnrW/WWtS4xcC2bQ5iX6ybDG0Kgjs/VwDshsSUMqwgl3Ke6AmvSJ
         1BCI4abcd6B8GIziQRz5T6YPmnmm2JoYyakugcgMzMYgEkB+4aeUyA16+2LFCrs1HqwF
         h8195i/uY0rOGBbzZmIzhIfCg1F7oYUVs99fppeEtWh4zIjwR+sH3DUDt1511hn/c2H7
         rD71Kr/Sd4CAStv9y97mjGI0BsyvkprJgslKe1AtI54M6KP6pXiOpZlsc0OxI4QaoPSx
         OBLg==
X-Gm-Message-State: AOJu0Yx115k4rX34ZjA1xRg56aGZu1jtN9BiDsKSR0P2tIQZdjpUX2di
	wEeWlBDkLFyY5rEyAChWzI0be2sBofbASkf6oaML00xyCWBbhtsNw1IO5np7H4U4mx0=
X-Gm-Gg: ATEYQzzGg3x11cxQsbx2sjZUWZTFfwcrZQDjdNXd431EW/JkC1J9vpQ1EUJ3lPwUCvF
	sKI9Z4e834u6KCoyaNNnRWRzK5t8WmBr/7W2mQECqKuS0v5/UTb6dooXqfbtCKIkoqOlqs+Xb7f
	3BKRdGsoq/BovMLd1dzdtEoNB03yZ+0rn5/vVwa+AhmH8V5naHdwtalP6lL7POtvN16Y5ffYVC1
	UuG7fdrfoTPQT9eigrG7500g7pwpFwjA5aA/IAxKNhz2A5xVI6Pbva/GZ2ryyCj56HBC3x53VYL
	6IbmAXgJo/wM258IsAQs4iLDZksqixkwUp1yweBab1rar4YmvkHbPA+jA6lS+Z5E1sKEwEF2QOj
	TKjVgf47d4OkVTL1hQztrd15QGj9O5uRKnPRIxS+gBARqZA7x11GfLuNA5lVdVtxHfZVcEPElmh
	KLEFl2KMwaUhb0LxDeys68sJDQOVgwUbHeGFCGDMriekWT8cmxyP6oK1bu2L3eQBWvo0i2Y0kmF
	XjF/5M=
X-Received: by 2002:a05:600c:45d4:b0:485:2c61:9457 with SMTP id 5b1f17b1804b1-48715fd5277mr105962645e9.10.1774529765762;
        Thu, 26 Mar 2026 05:56:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:8431:f88b:714d:f78d? ([2a01:e0a:106d:1080:8431:f88b:714d:f78d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919dfb54sm8088573f8f.31.2026.03.26.05.56.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 05:56:05 -0700 (PDT)
Message-ID: <9dcb5e67-6a30-4ca3-b324-a57faee7d767@linaro.org>
Date: Thu, 26 Mar 2026 13:56:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 3/9] arm64: dts: amlogic: t7: Add MMC controller nodes
To: Ronald Claveau <linux-kernel-dev@aliel.fr>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-wireless@vger.kernel.org
References: <20260326-add-emmc-t7-vim4-v5-0-d3f182b48e9d@aliel.fr>
 <20260326-add-emmc-t7-vim4-v5-3-d3f182b48e9d@aliel.fr>
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
In-Reply-To: <20260326-add-emmc-t7-vim4-v5-3-d3f182b48e9d@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_055609_374764_71DC2EF7 
X-CRM114-Status: GOOD (  14.12  )
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

On 3/26/26 10:59, Ronald Claveau wrote:
> Add device tree nodes for the three MMC controllers available
> on the Amlogic T7 SoC, using amlogic,meson-axg-mmc as fallback compatible.
> All nodes are disabled by default and should be
> enabled in the board-specific DTS file.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 39 +++++++++++++++++++++++++++++
>   1 file changed, 39 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index 36d13371f56ba..fe1ced0a58967 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -374,6 +374,45 @@ sec_ao: ao-secure@10220 {
>   				reg = <0x0 0x10220 0x0 0x140>;
>   				amlogic,has-chip-id;
>   			};
> +
> +			sd_emmc_a: mmc@88000 {
> +				compatible = "amlogic,t7-mmc", "amlogic,meson-axg-mmc";
> +				reg = <0x0 0x88000 0x0 0x800>;
> +				interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clkc_periphs CLKID_SYS_SD_EMMC_A>,
> +					 <&clkc_periphs CLKID_SD_EMMC_A>,
> +					 <&scmi_clk CLKID_FCLK_DIV2>;
> +				clock-names = "core", "clkin0", "clkin1";
> +				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_A_SEL>;
> +				assigned-clock-parents = <&xtal>;
> +				status = "disabled";
> +			};
> +
> +			sd_emmc_b: mmc@8a000 {
> +				compatible = "amlogic,t7-mmc", "amlogic,meson-axg-mmc";
> +				reg = <0x0 0x8a000 0x0 0x800>;
> +				interrupts = <GIC_SPI 177 IRQ_TYPE_EDGE_RISING>;
> +				clocks = <&clkc_periphs CLKID_SYS_SD_EMMC_B>,
> +					 <&clkc_periphs CLKID_SD_EMMC_B>,
> +					 <&scmi_clk CLKID_FCLK_DIV2>;
> +				clock-names = "core", "clkin0", "clkin1";
> +				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_B_SEL>;
> +				assigned-clock-parents = <&xtal>;
> +				status = "disabled";
> +			};
> +
> +			sd_emmc_c: mmc@8c000 {
> +				compatible = "amlogic,t7-mmc", "amlogic,meson-axg-mmc";
> +				reg = <0x0 0x8c000 0x0 0x800>;
> +				interrupts = <GIC_SPI 178 IRQ_TYPE_EDGE_RISING>;
> +				clocks = <&clkc_periphs CLKID_SYS_SD_EMMC_C>,
> +					 <&clkc_periphs CLKID_SD_EMMC_C>,
> +					 <&scmi_clk CLKID_FCLK_DIV2>;
> +				clock-names = "core", "clkin0", "clkin1";
> +				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_C_SEL>;
> +				assigned-clock-parents = <&xtal>;
> +				status = "disabled";
> +			};
>   		};
>   
>   	};
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

