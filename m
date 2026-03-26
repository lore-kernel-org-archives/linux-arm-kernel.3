Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E072106F304
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 08:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NPOq+t0BPIjTXIy85z0pLZNyx1Sqnvxn5kHxjGZM2Uw=; b=ASQaegfaLFN+HYu5iF4LSNsVuj
	G0a7Z0EAnQE3IYEG+46HM056xnY12VgzOfdEI0mSVN5IJYCKyhChHSMMxemk+FYiERCy61WChsZFh
	VJDBbJ+rBVDRZr6vEEVYodUu2U8Mj39zs6tBNldpcJRvbzaObfxRmcBGNUDPDFXNyfKMmwvvE3xg0
	EADDWXWSDvJl+rMT9BzoV0LpQYCHpWyZtp7hFHiF5HyiDqbvRRp06X8tobZRU2kHq4hjcbNBsTAEg
	o7JcEBymLo2rK61McehIUid5dnlvivt8CjbPP+CKIB3IU47X+T7hVvR7qFAn0Yv7TvNrGos+Is0jO
	TspC1Aiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gUV-000000054fg-1geM;
	Thu, 26 Mar 2026 08:54:59 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gUT-000000054f5-14GQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 08:54:58 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-487035181a7so4237435e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 01:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774515295; x=1775120095; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NPOq+t0BPIjTXIy85z0pLZNyx1Sqnvxn5kHxjGZM2Uw=;
        b=rIZ1sjzpyf5VI9VoGMSYPI4ofxxgn/+hnOze0HOr7arzriateeiNxIQKgLIKzJZver
         /yqRm5eRSNoN4+KW9Fs/lKrQxMH5onBJaONDEZxpdP+ImPYDrPrTOJTY3UPHzSyc62s1
         ZSMZuhLTsKp3iy5hScXK5t335/vBJh45BG4myb66uzuTeDnAlDwDJ9Q8y5M0Kzm66TAD
         VvHZgCk0xSGx8PsIbnBxBYIbGWpJ4HI813iTCb7UkzaT/ZhFiehjsM/PxJhSLE33frCT
         R/rXtwkYtd0TSgpYJ0SFHUEt4rtHP/zJNj4Pp6evWp8Gl+rz3oXdBMpe1UHXMsPBJzY6
         JlhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515295; x=1775120095;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NPOq+t0BPIjTXIy85z0pLZNyx1Sqnvxn5kHxjGZM2Uw=;
        b=ZMa/fmmxwA4WaZkpYwCjdeG53Ph1PuFeldBsnzvYkXEgBe9Q7iCRlPRHyQynMAi7Di
         imj9NmiLKdNCYze1DIH/BoFoI2DiJesYBNXyVm/BLVH42sQQgd0/vDwFmI7Nn4tBtnNz
         nLJiqXZz7pnPR49SYbdesiDb9eJVskd+jyQlUxkZFDN6wcBqLnFESadTv5P4J6fY0Glj
         LYTU8MaX2UD10l27DjRms7dAdJkWZbiIbqLBnX6glWx+sIqCCYs//M7t9XTko+gR4Zxc
         rhQAVplB2HUvH92N/cVbvr/kh3gtuGfQYqW2NApGFJAY/5I5EtIVfx9QEXzsStQ8Fld8
         Mx+Q==
X-Gm-Message-State: AOJu0Yzf9QODthUcG48HdeAAKDhDNRIC0q6w9Anbm5/gh9hGQeHCwEpY
	NfGCvN51SWUw1KKroe07IeyI/YUXG4Fqzia+d55PoqHY5omtav0SaPGy1IwXnFAY/5s=
X-Gm-Gg: ATEYQzzLQ5eyMSlIsGM98j641eKDL1tdIj17zOk4WQJekpxp6Nx/NFhpWA185GpAQmx
	m2BlMxlf8UNJnZrKDwr3Smr/NiJBs3o8+ClWl6OVTKUemFZBGk6DdTwAPAYFDqATS7VVfcJGAUJ
	a4M3BSkA675qlnWpoPaGf6PP6AVAkz5cKDgGI48auXZWN7/B+j+rgN8X8s7WP/ANbFwQ+YciO2b
	QWvqMy9sQqRif/D9CcH/3M0RlTnI3vn4S6/FjUUZ+UtEI9KmVpL57tkGA1G9NwghsxtX5U1lN71
	8cuWO1PRCzgF2YZrLLToL6LqOi+dDtvRZ+I3mdKenJzU+EOipVa1jL5DTLDL645UTq+Ll5K7+YH
	NIrLS4m2uGjJyyNQQ2WBlMzzVR6+vcIwB0zgsdo18wwqgWQFRZfYBLYF9+TMA7MP1OFue3k30GO
	zzpY5LQBkPlPP9p906pq4pFnN1FXhBPxG2IqGlR4go7cHzwUaCIE5RKpQ4WmiyHL6wk7ac8Hf+b
	ep9dwY=
X-Received: by 2002:a05:600c:3e1a:b0:486:af22:4a2a with SMTP id 5b1f17b1804b1-48715fbabedmr88067005e9.7.1774515295443;
        Thu, 26 Mar 2026 01:54:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:8431:f88b:714d:f78d? ([2a01:e0a:106d:1080:8431:f88b:714d:f78d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48720901b90sm10376515e9.17.2026.03.26.01.54.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 01:54:55 -0700 (PDT)
Message-ID: <512d95b5-5348-4c7c-961c-b6ca1431cee4@linaro.org>
Date: Thu, 26 Mar 2026 09:54:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 9/9] arm64: dts: amlogic: t7: khadas-vim4: Add MMC
 nodes
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
 <20260325-add-emmc-t7-vim4-v4-9-44c7b4a5e459@aliel.fr>
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
In-Reply-To: <20260325-add-emmc-t7-vim4-v4-9-44c7b4a5e459@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_015457_323894_C6E5A307 
X-CRM114-Status: GOOD (  15.19  )
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
> Enable and configure the three MMC controllers for the Khadas VIM4 board:
> - sd_emmc_a: SDIO interface for the BCM43752 Wi-Fi module
> - sd_emmc_b: SD card slot
> - sd_emmc_c: eMMC storage
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 90 +++++++++++++++++++++-
>   1 file changed, 89 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> index 770f06b0b16c7..5a73ae081036c 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> @@ -14,7 +14,10 @@ / {
>   	compatible = "khadas,vim4", "amlogic,a311d2", "amlogic,t7";
>   
>   	aliases {
> -		serial0 = &uart_a;
> +		serial0	= &uart_a;

Spurious change

> +		mmc0	= &sd_emmc_c;
> +		mmc1	= &sd_emmc_b;
> +		mmc2	= &sd_emmc_a;
>   	};
>   
>   	memory@0 {
> @@ -159,6 +162,91 @@ &pwm_ab {
>   	pinctrl-names = "default";
>   };
>   
> +/* SDIO */
> +&sd_emmc_a {
> +	status = "okay";
> +	pinctrl-0 = <&sdio_pins>;
> +	pinctrl-1 = <&sdio_clk_gate_pins>;
> +	pinctrl-names = "default", "clk-gate";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	bus-width = <4>;
> +	cap-sd-highspeed;
> +	sd-uhs-sdr12;
> +	sd-uhs-sdr25;
> +	sd-uhs-sdr50;
> +	sd-uhs-sdr104;
> +	cap-sdio-irq;
> +	max-frequency = <200000000>;
> +	non-removable;
> +	disable-wp;
> +	no-mmc;
> +	no-sd;
> +
> +	power-domains = <&pwrc PWRC_T7_SDIO_A_ID>;
> +
> +	keep-power-in-suspend;
> +
> +	mmc-pwrseq = <&sdio_pwrseq>;
> +
> +	vmmc-supply = <&vddao_3v3>;
> +	vqmmc-supply = <&vddao_1v8>;
> +
> +	brcmf: wifi@1 {
> +		reg = <1>;
> +		compatible = "brcm,bcm43752-fmac", "brcm,bcm4329-fmac";
> +	};
> +};
> +
> +/* SD card */
> +&sd_emmc_b {
> +	status = "okay";
> +	pinctrl-0 = <&sdcard_pins>;
> +	pinctrl-1 = <&sdcard_clk_gate_pins>;
> +	pinctrl-names = "default", "clk-gate";
> +
> +	bus-width = <4>;
> +	cap-sd-highspeed;
> +	sd-uhs-sdr12;
> +	sd-uhs-sdr25;
> +	sd-uhs-sdr50;
> +	sd-uhs-sdr104;
> +	max-frequency = <200000000>;
> +	disable-wp;
> +	no-sdio;
> +	no-mmc;
> +
> +	power-domains = <&pwrc PWRC_T7_SDIO_B_ID>;
> +
> +	cd-gpios = <&gpio GPIOC_6 GPIO_ACTIVE_LOW>;
> +	vmmc-supply = <&sd_3v3>;
> +	vqmmc-supply = <&vddio_c>;
> +};
> +
> +/* eMMC */
> +&sd_emmc_c {
> +	status = "okay";
> +	pinctrl-0 = <&emmc_ctrl_pins>, <&emmc_data_8b_pins>, <&emmc_ds_pins>;
> +	pinctrl-1 = <&emmc_clk_gate_pins>;
> +	pinctrl-names = "default", "clk-gate";
> +
> +	bus-width = <8>;
> +	cap-mmc-highspeed;
> +	mmc-ddr-1_8v;
> +	mmc-hs200-1_8v;
> +	max-frequency = <200000000>;
> +	disable-wp;
> +	non-removable;
> +	no-sdio;
> +	no-sd;
> +
> +	power-domains = <&pwrc PWRC_T7_EMMC_ID>;
> +
> +	vmmc-supply = <&vddio_3v3>;
> +	vqmmc-supply = <&vddio_1v8>;
> +};
> +
>   &uart_a {
>   	status = "okay";
>   	clocks = <&xtal>, <&xtal>, <&xtal>;
> 

With that:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

