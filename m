Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE80106F303
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 08:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=smOP6x0To5MeFMWDp/WtjMB68J+cu7J59H9CXktE27U=; b=mZXjnEVQm8y7rGn4eR0JD1OK6M
	Ov3hboS05MCSmjxU2jrJ3PQuduNSscq4lzjfm8ycmnkcaAwAL145UMhi6WXZs2iUWlokEZTDBdWt+
	HtvSNHkDrA1f0u6+uiy4YImfoBTwBVfiCBIZH+9qdNvgkbNsNtLoDDZQUiGpYhlyqeMiDnNHVNgU9
	7ZOck7QwsGIknwfEaijsTTQCQc7t/MArtjPMAlwtvOGGOzlGPoRUiiwuinW7sceMlsA9dsi6VZlHD
	lb5iWPnMMZaEqhRn+NIoCk3/jklwf5G1Bk5+wvVmVB8RBx5q3mlqyrXZjaBgq/VGwkBIBS3OWMqgG
	2mAQEfqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gRl-000000053n4-0ZYk;
	Thu, 26 Mar 2026 08:52:09 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gRi-000000053mF-30Oj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 08:52:07 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-43b4f48c47cso502580f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 01:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774515125; x=1775119925; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=smOP6x0To5MeFMWDp/WtjMB68J+cu7J59H9CXktE27U=;
        b=Rx36/ZmO4blaKYWPUNPDP2qYLHRWjt/BJtZb4T3rMwe94PzctCBMfbdTEwhPoBlI4c
         ktdP8ddi7KvZZTkT85jsFWPZuCqJMGXvedVYSBC0ouxlY3ASl8AZLvgRlcSZJuA3L7Y3
         pOcvFohX4CP8asyPJIeSQ25ER1JCIq78EZvqgoXkdEnujbnKnEQxeP0X+kSDuyWGmY7e
         w2f6vP/RGxoGsNIbSETUEy0GEXuEkenR3EWuz9tM5+tOf+th23agf032OlIWtvh10YMM
         QY/hZjmTxRTTufWsr8fHsQ73PSG/LEIiu9dA7lD6FsnKOORgt23LXX73oPch6Mi8qV4q
         4uEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515125; x=1775119925;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=smOP6x0To5MeFMWDp/WtjMB68J+cu7J59H9CXktE27U=;
        b=NOL4Nzk0FxS44SBOkC8tt2gpTrlY03Bnz1ORDKE0/HlAY0VDMWS3YMdFVUWgwIdkcp
         Z5nneWlI2iFnZsIgUxoY3sBDq7VtC+HTSqv3sGyhY0kHMU7cj/mCbipArklIe0ii6C9t
         CtJeZG3zY17TxXTH2P4hxaPWR7tAcp0pvtlYAleG0NcDa7UNM1e9jtxF+HzrTJ1X3dpW
         32GbW0vHtN3uq2x9UC6QDcwuawsq6fvOwWUAAnf3dIWgb99y6R7tfHxvefaLI6Ez554L
         WCCTpiQv+Mj/zCwHNV1CCFmMh9PU6jcLjnBMde7liaUd1BxpWmcJaa5wLeQgOwxgRbde
         0Vng==
X-Gm-Message-State: AOJu0YxU/qEIYt7t9bhURPMFjSg1scXDMxyANV4AI4S5SxEUrUzXWLJY
	c6iAwmMLWxQ/zeJQ/UGl5Zfc2DwR4QYX+Wb8fYocRoxpRoL4cvTOnagUx2sN1eteTfA=
X-Gm-Gg: ATEYQzwz6VBWR59eI9duEILg3NULRAblnlUrRo22xVWJiEc8k2V9A4XenP4oBJhvpM2
	Ow1VrG5ucIS6PWBt+rv8Tg+e01iazsIixp+nLKAFAyUVeO5ybhIJnnpa5KykRpH1/T7eQiRj0lo
	17F2Smp/++2ZqIOftOz99poZqsGL/xqx1JlzUKArnlovS3sG+k9lty1Y/JCCrRIfnXf6h3rsI5T
	ujFQcJxLqG0rgxO2niYXUPIv3CDqbKNGQgIOHuyXU19Tu7WQN1OQQbJ2zTdDbiF8MwolQXjMRqE
	kw1pbtglTfbZZKUF8MgfXOUvPo2ZwICqrN9SOh/VU16Kxc7bkss3w6sFfaFNwgwXqy9lzwdUNc0
	2+gSvtsUmqTjamyVhj4q9r4IVSa7znZfY5S6jIzi/1RRjZ+0wNWOn9SsdhNYJ9CsexwNWjm/Pob
	yK/qi1ayC91RiJymMicH5G4wPnmiA0I5xtMFWSzHPuVWs84kUj49u22v4nFgU9c4WzGlJFOCNvR
	aTR1qc=
X-Received: by 2002:a05:6000:400b:b0:43b:4ef0:e13 with SMTP id ffacd0b85a97d-43b889a49eemr10222108f8f.12.1774515124429;
        Thu, 26 Mar 2026 01:52:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:8431:f88b:714d:f78d? ([2a01:e0a:106d:1080:8431:f88b:714d:f78d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf2c8sm6326074f8f.20.2026.03.26.01.52.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 01:52:03 -0700 (PDT)
Message-ID: <5298e691-99ba-48fc-874b-c9af308664ee@linaro.org>
Date: Thu, 26 Mar 2026 09:52:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 1/9] arm64: dts: amlogic: t7: Add eMMC, SD card and
 SDIO pinctrl nodes
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
 <20260325-add-emmc-t7-vim4-v4-1-44c7b4a5e459@aliel.fr>
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
In-Reply-To: <20260325-add-emmc-t7-vim4-v4-1-44c7b4a5e459@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_015206_795452_D826FE09 
X-CRM114-Status: GOOD (  13.63  )
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
> These pinctrl nodes are required by the eMMC, SD card and SDIO drivers
> to configure pin muxing at runtime.
> 
> - eMMC: control, 4-bit/8-bit data, data strobe and clock gate pins
> - SD card: data, clock, command and clock gate pins
> - SDIO: data, clock, command and clock gate pins
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 98 +++++++++++++++++++++++++++++
>   1 file changed, 98 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index 6510068bcff92..016b5429c8d1b 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -250,6 +250,104 @@ gpio: bank@4000 {
>   					#gpio-cells = <2>;
>   					gpio-ranges = <&periphs_pinctrl 0 0 157>;
>   				};
> +
> +				emmc_ctrl_pins: emmc-ctrl {
> +					mux-0 {
> +						groups = "emmc_cmd";
> +						function = "emmc";
> +						bias-pull-up;
> +					};
> +
> +					mux-1 {
> +						groups = "emmc_clk";
> +						function = "emmc";
> +						bias-disable;
> +					};
> +				};
> +
> +				emmc_data_4b_pins: emmc-data-4b {
> +					mux-0 {

No need for "-0"

> +						groups = "emmc_nand_d0",
> +							 "emmc_nand_d1",
> +							 "emmc_nand_d2",
> +							 "emmc_nand_d3";
> +						function = "emmc";
> +						bias-pull-up;
> +					};
> +				};
> +
> +				emmc_data_8b_pins: emmc-data-8b {
> +					mux-0 {

No need for "-0"

> +						groups = "emmc_nand_d0",
> +							 "emmc_nand_d1",
> +							 "emmc_nand_d2",
> +							 "emmc_nand_d3",
> +							 "emmc_nand_d4",
> +							 "emmc_nand_d5",
> +							 "emmc_nand_d6",
> +							 "emmc_nand_d7";
> +						function = "emmc";
> +						bias-pull-up;
> +					};
> +				};
> +
> +				emmc_ds_pins: emmc-ds {
> +					mux {
> +						groups = "emmc_nand_ds";
> +						function = "emmc";
> +						bias-pull-down;
> +					};
> +				};
> +
> +				emmc_clk_gate_pins: emmc-clk-gate {
> +					mux {
> +						groups = "GPIOB_8";
> +						function = "gpio_periphs";
> +						bias-pull-down;
> +					};
> +				};
> +
> +				sdcard_pins: sdcard {
> +					mux {
> +						groups = "sdcard_d0",
> +							 "sdcard_d1",
> +							 "sdcard_d2",
> +							 "sdcard_d3",
> +							 "sdcard_clk",
> +							 "sdcard_cmd";
> +						function = "sdcard";
> +						bias-pull-up;
> +					};
> +				};
> +
> +				sdcard_clk_gate_pins: sdcard-clk-gate {
> +					mux {
> +						groups = "GPIOC_4";
> +						function = "gpio_periphs";
> +						bias-pull-down;
> +					};
> +				};
> +
> +				sdio_pins: sdio {
> +					mux-0 {

No need for "-0"

> +						groups = "sdio_d0",
> +							 "sdio_d1",
> +							 "sdio_d2",
> +							 "sdio_d3",
> +							 "sdio_clk",
> +							 "sdio_cmd";
> +						function = "sdio";
> +						bias-pull-up;
> +					};
> +				};
> +
> +				sdio_clk_gate_pins: sdio-clk-gate {
> +					mux {
> +						groups = "GPIOX_4";
> +						function = "gpio_periphs";
> +						bias-pull-up;
> +					};
> +				};
>   			};
>   
>   			gpio_intc: interrupt-controller@4080 {
> 


