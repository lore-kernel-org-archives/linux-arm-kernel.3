Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0CD0CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sknQ4v04zMJRg7aMri76BP+yjjkuvx43VxPX8joYE3g=; b=gwvZyimCus/pS9XlwyUbLEBiNs
	pir5VLR5aWQRW8vv7oYWMs+oY54ptzOfsyShtWE5/ot6Jwgblh4sgzMpKUKQ2P8rerVNMKBv9wXIJ
	yqiwADBMBPE8yK2M7ZkgTo8z8NgW7CLYKWFB41ROAd/0Ju8lsYR7SDmiDeSrxpRIuFqglZ/xZL2U4
	N4k0trS4hwHtMxEwadN4Gs4cKdD3qUroKY4MLo+S72IYN6+CFT4QgHD5x/cD5U7AYf90JlTkHoACW
	uKFH+nsRJEtz1iqYgu/3nzlk/I7fz4zJIYF5R92/4N3zXWr5UQfxfmpF0LiSOZxzX6NNg60oIP+gH
	8jQHkvPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1yK-00000008rWW-020q;
	Tue, 09 Sep 2025 17:17:36 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvxlI-00000007Arz-34JZ;
	Tue, 09 Sep 2025 12:47:53 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45dcff2f313so34280515e9.0;
        Tue, 09 Sep 2025 05:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757422071; x=1758026871; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sknQ4v04zMJRg7aMri76BP+yjjkuvx43VxPX8joYE3g=;
        b=SxrBToaRGPQs24kVzYTRm7Qm/GLuruMeIWYJgnAkPXqEDYFnt+BSZ9NWQWyaI9KCu3
         TJocOyxIRCLsKWRceltnEVFAUJxseWdurFDEQw6Y6Y+pIqWxEt6sIVsRiNn3gtbdI69/
         VqZkWtYv6o9Ef7QURiSMdJHfB8CPqtTUVAj5raaYmUJuBaqqsxL/ss2Y/UwCi7O7sd7D
         R8WV2RpVynAsHfK3d4l0EGzgYDSud25xfp/7hej/g7xPuzzqaiUzMUQP0Z1R37VlMuT9
         zPZy4CuL0Ga3M6kBFOcF8o5kxUYgsNhwXJizVc4Fr2x1jnw7Zd6s31OqMqPbZRqZVNEF
         8Kwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757422071; x=1758026871;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sknQ4v04zMJRg7aMri76BP+yjjkuvx43VxPX8joYE3g=;
        b=NjYWre+7q6c61pFfeEJCYweETHYjUz49ps/+/27jqw46Ml58BS60QrdxIu1te6vbC/
         PhW+XNjlZos9oCP22CkXLAU/aqpfxF3zFdhinTpfonjGA9Jh56xGOqTn3KYONFhP8iOe
         f8d+KN3MzGRY0LXL+7ATFBLxjqeCKyUprVayxk15LNsI+cyceNg7GTc8zM9meLWzT0Zy
         ih5/ld/P9dAmKE46SSiOTI03a9pjLmcPWMIfAT/n0dib7szYzo0M+lT6git4F7lupbMY
         mvQ5rIZUwsajZuvjJ2PE63B2Yc0u6OQPAE6nm888eHnwxrugf9ZuVh0IZ+XImPLsvT6y
         OxEw==
X-Forwarded-Encrypted: i=1; AJvYcCV3JRISi9zFuHes0sFmn3dC4EzMquyX6wj3WYoqJG756Vj3NcHW4mmSRkQYpUM2GX96hxuODt9oMQG0PHQxL38=@lists.infradead.org, AJvYcCV5B/vZU78pYGXtPDJ8jUizBH5j1MHvMi8mucX+LUbmS5nHXB6aJHL+aZDUuPCIykUSUQFQduMc+wTin4sEgwg2@lists.infradead.org
X-Gm-Message-State: AOJu0YzW7Fh1/l1wIOnzlHo5ge/5jmO2alAVCitPmd2jFltJ02HI25P9
	2d8RiGO2NxnHQEQjVklRBFU+baKwAU9G+Zd6w4iUqVTgEV1X5IHLpZmm
X-Gm-Gg: ASbGnctPBY6W6x3OCc2VLX4YBtROr0Ku1cCFmKXHIYFZraJdP+zjOBXqoPFHA/IOKVv
	+AdB/Jfqw6Du48aJUWcKvPYW08FgkJPsWrIb/1kCuEdsh9kxWfYPZ2D5R8OfxvnprwKWDDh463E
	HKtl0ZlvFVGsFa2UJGpqUuIIIzKk+Le0vas1UBowMCE7OqUycDH0GaySnecoRERYhbIM1rJAbJx
	PiF+aV/HaNhyrQ01PDWcFlnApdsqKmQ3c4vHhohtf1etKTHrCLaQ1sylhbmfkGazbsJvBlEJjGC
	Ds3TrvAaRIvNDjBnXH5q7KCTbSdSg6khjzB8A2lYMsNiZ5OMCWGU/BfY/ckirA2+BAsGRVz92OB
	ZJ/ZhFYSwK0qry9DZNFTxHCp10KW6N+Yqhz7NKdXsgQ==
X-Google-Smtp-Source: AGHT+IF7VDa3q9SU8Hb8VKgsof+wzfraByxvrUN6D+R4v5hiuxuAYZeQmJI3MV7ScaIIyzTNCd0n7w==
X-Received: by 2002:a05:600c:4f83:b0:45c:b56c:4183 with SMTP id 5b1f17b1804b1-45dddee9c59mr112287245e9.18.1757422071006;
        Tue, 09 Sep 2025 05:47:51 -0700 (PDT)
Received: from [192.168.2.177] ([91.116.220.47])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45de18f4824sm136453475e9.10.2025.09.09.05.47.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 05:47:49 -0700 (PDT)
Message-ID: <c09e6239-dc70-469d-b9bb-02398f2b621b@gmail.com>
Date: Tue, 9 Sep 2025 14:47:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] arm64: dts: mediatek: mt8395-nio-12l: add PMIC and
 GPIO keys support
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20250905-radxa-nio-12-l-gpio-v3-0-40f11377fb55@collabora.com>
 <20250905-radxa-nio-12-l-gpio-v3-2-40f11377fb55@collabora.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20250905-radxa-nio-12-l-gpio-v3-2-40f11377fb55@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_054752_788648_177F612D 
X-CRM114-Status: GOOD (  15.55  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 05/09/2025 13:51, Julien Massot wrote:
> Add support for PMIC and GPIO keys on the Radxa NIO 12L board:
> Declare a gpio-keys node for the Volume Up button using GPIO106.
> Add the corresponding pin configuration in the pinctrl node.
> Add a mediatek,mt6359-keys subnode under the PMIC to handle the
> power and home buttons exposed by the MT6359.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Queued, thanks.
Matthias

> ---
>   .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     | 36 ++++++++++++++++++++++
>   1 file changed, 36 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> index 329c60cc6a6be0b4be8c0b8bb033b32d35302804..fd596e2298285361ad7c2fb828feec598d75a73e 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> @@ -8,6 +8,7 @@
>   #include "mt8195.dtsi"
>   #include "mt6359.dtsi"
>   #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
>   #include <dt-bindings/interrupt-controller/irq.h>
>   #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
>   #include <dt-bindings/regulator/mediatek,mt6360-regulator.h>
> @@ -60,6 +61,18 @@ backlight: backlight {
>   		status = "disabled";
>   	};
>   
> +	keys: gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		button-volume-up {
> +			wakeup-source;
> +			debounce-interval = <100>;
> +			gpios = <&pio 106 GPIO_ACTIVE_LOW>;
> +			label = "volume_up";
> +			linux,code = <KEY_VOLUMEUP>;
> +		};
> +	};
> +
>   	wifi_vreg: regulator-wifi-3v3-en {
>   		compatible = "regulator-fixed";
>   		regulator-name = "wifi_3v3_en";
> @@ -626,6 +639,14 @@ pins-txd {
>   		};
>   	};
>   
> +	gpio_key_pins: gpio-keys-pins {
> +		pins {
> +			pinmux = <PINMUX_GPIO106__FUNC_GPIO106>;
> +			bias-pull-up;
> +			input-enable;
> +		};
> +	};
> +
>   	i2c2_pins: i2c2-pins {
>   		pins-bus {
>   			pinmux = <PINMUX_GPIO12__FUNC_SDA2>,
> @@ -880,6 +901,21 @@ &pciephy {
>   
>   &pmic {
>   	interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
> +
> +	mt6359keys: keys {
> +		compatible = "mediatek,mt6359-keys";
> +		mediatek,long-press-mode = <1>;
> +		power-off-time-sec = <0>;
> +
> +		power-key {
> +			linux,keycodes = <KEY_POWER>;
> +			wakeup-source;
> +		};
> +
> +		home {
> +			linux,keycodes = <KEY_HOME>;
> +		};
> +	};
>   };
>   
>   &scp {
> 


