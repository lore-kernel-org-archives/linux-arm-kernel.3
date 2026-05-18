Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D23CD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 14:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ap6+yPzKT0WeFxFH9OI4zXlnbIBpH1fA8AyGWnx8G38=; b=0QVF+VCLhAWWKuZzuZyx8E9U1x
	by7FUvxs5qZkqPA/UzVVVbdUqlz1Bsy1OHXt7tO/gp0njRwIjr/IzDSIRRHpYbfs+4nMlPewXukZs
	Kt+l/iJ1JB+9MXgbSoSQ1bZ/w286AurA0WM2S1MVu4WQuWn0x62TQR2yumklhmfTNpKN+RBNy+RYR
	/t0P0GE6mil/ajW72qzeq7F0QQVMtH9BCbjRJugreJnYBfYc55CeaRujhs9cu96CRb7yd8So9IP+J
	YG53gyTJoEFvXatV6pdyPVGByKN+uk3bZ9vzP2EtH0Pgq+EyvZ/s3FmcDheOvbb4+zc9MIsxSai3z
	I/p3iOgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOyn4-0000000Fx2U-46NI;
	Mon, 18 May 2026 14:17:55 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOyn1-0000000Fx1D-1cjc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 14:17:53 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-44c350a5b87so1352698f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 07:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779113869; x=1779718669; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ap6+yPzKT0WeFxFH9OI4zXlnbIBpH1fA8AyGWnx8G38=;
        b=JJRtOvb4pbscoR9ZFDamQHaRMP2c1aIWqbWnGm8ULs4f7Fw1t7tQDyFFNitH9Y3ohT
         ojLRAsgZmiHIlTBzgE2vlirWR6POWiqlCf1O9U/TdL7+RmVg479EX8dl1lzojOD9zZj6
         aioojyQy0qF3aEwRPrMulq24/z4V/sPhhG7FS4dMqKQiEFiwqrzx6tL8URa0Ws4Jgva5
         tcIVLaYeTiswgJk2x2PiZWAv8fD6RJClsKMSPcTypdtsVg1Zyif/y/W1dVuhHP7ICYND
         3eJG036hnVGNnUJUSYz2MPRm4BVfx3pZiW8lCOU9n5CxjvxxnJMu3Ubz9Iyhsk/4IkNd
         cPsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779113869; x=1779718669;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ap6+yPzKT0WeFxFH9OI4zXlnbIBpH1fA8AyGWnx8G38=;
        b=Fip4QYIfbkAP+B2yLZ7KErWjfzy/4DD8cXd9ZhedLUUoMxLn2aIv7Yew93Slb6M+as
         ihtmByEAB8eWDKALbFFbmKcW6HDzOMCS4K/4oDRQsBuVkSAS809KChsGm3ABqaLXmJ+k
         b3Z17hZfSXxhYyhe9DTjiblr+kFiyxmoSPGG6Dn9Bty1MworbJTZ3KY1pmaW3jEfh1yo
         9/t7LwT5Od9Hw795lfwsJnH4h4JFJe6uPPIWG8eMQXEupzuofrzEQjxN+ofhlI4rTrRy
         2aigFKKH5rNRIFqklsu29AjkbVVAVEj7YuEQgDZAcmv90BkUyOi4+f2Bpat9TFdiBEaj
         vXWg==
X-Forwarded-Encrypted: i=1; AFNElJ+YTyLw+GpZBUHviLnXNNyMigb7XZy8ScLS/gt106jIWUM+rcQh8J5dzQ8rZ/SNZXPaiRMSzN4hKUxEU+ubM6vB@lists.infradead.org
X-Gm-Message-State: AOJu0YyvX1wv/d/m5dJurGEq9S3nMLCh+OVpn32A6nZYx7RLxpX0wI8s
	ZvrY7iWfjWzW/mEB1fdN3Zg7ddRmMxErunghy43agTruXeut9HPwfZIq/ypD5Q0t3MI=
X-Gm-Gg: Acq92OHnqWQYK0CCGqxML+HXRpUqMnh7UwEqJhupHuDssTIUW20CSwBjZcapJVKwzV5
	d5cLqFUo7Z6jpyqCjPWJJ5t9WU6F1jV/+bSPqzJ8v/1I/s5jRZjRD+gYKmh1akj26rTzBcx4scs
	dqSKgGa4OL0PgfWgQmaz24NAGvujOrz7rkOMbuMLLK/lEnTHv1hTf0hmgpTESzbQ2ygD1QIHuBX
	A4InzJJA6jy+m+OZ5RV4QhNfSkasX3KY3RS1QKgZUP6X0qjeR7FF+tgslKRCsjlKS2njkMBa1tG
	ySVhdw/qJK+P0MI85nyQ9swI8oC57oqMcC+voQ61MqtRpTH0v5fbj8L1uwCeBm4OrAh8x/8d+Mq
	uGEhrb+dP7qlUyvqUpeatnMC+U/dQYPxVEooMzLnb9Dw2UkMygtHk5EePwU3hv3IrdAjWewJF6c
	CwWeNYBNgvkc45RxvPbx1SxWn5HuAeVo1Hvu3utUCIXERl44Pgnv4tJdF0apRq8TjX1d/wvLOOM
	h4NVLQ=
X-Received: by 2002:a05:600c:4e46:b0:48f:e230:8cab with SMTP id 5b1f17b1804b1-48fe6626cfbmr237786615e9.31.1779113869320;
        Mon, 18 May 2026 07:17:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:1029:e3c5:362e:1250? ([2a01:e0a:106d:1080:1029:e3c5:362e:1250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4900c16c62dsm66435415e9.11.2026.05.18.07.17.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 07:17:48 -0700 (PDT)
Message-ID: <4df49ad2-797b-4971-a8a9-13fd438e7c6f@linaro.org>
Date: Mon, 18 May 2026 16:17:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v6 0/8] Add VIM4 MCU/FAN support
To: linux-kernel-dev@aliel.fr, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <20260516-add-mcu-fan-khadas-vim4-v6-0-cccc9b61f465@aliel.fr>
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
In-Reply-To: <20260516-add-mcu-fan-khadas-vim4-v6-0-cccc9b61f465@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_071751_528981_C7CAA1EA 
X-CRM114-Status: GOOD (  21.58  )
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

Hi,

On 5/16/26 19:17, Ronald Claveau via B4 Relay wrote:
> The Khadas VIM4 board features a different MCU variant compared to
> previous VIM boards.
> While it shares the same I2C-based communication model,
> it differs in some ways:
> 
>    - A distinct register map with its own volatile/writeable register set
>    - A fan control with 0–100 levels instead of the 0–3 levels previously
>    - A fan power supply gated through a regulator
> 
> This series adds support for this new variant by:
> 
>    1. Refactoring the khadas-mcu MFD driver to use per-variant data
>       structures (regmap config, cells, fan platform data),
>       and adding the khadas,vim4-mcu compatible string.
> 
>    2. Extending the fan thermal driver to retrieve the fan register
>       and maximum level from platform_data,
>       and to optionally manage a power regulator for the fan supply.
> 
>    3. Adding the corresponding DTS node for the VIM4, wiring the MCU to
>       the I2C AO_A bus and exposing it as a thermal cooling device.

I will directly pick patch 6 now, and patch 7 & 8 later when patches 1,2,3,4 are picked
by the i2c & mfd maintainers.

Patch 5 should not be applied without path 4.

Neil

> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
> Changes in v6:
> - PATCH 4: Address Lee's review comments:
>    - Use an enum to discriminate between MCU types instead of passing
>      MFD data through the DT match table
>    - Fix error code from -EINVAL to -ENODEV when no MCU type is matched
>    - Make khadas_mcu_fan_cells and khadas_mcu_cells const
>    - Use dev_err_probe() for regmap initialization error
>    - Document fan speed levels for max_level
> - Link to v5: https://lore.kernel.org/r/20260424-add-mcu-fan-khadas-vim4-v5-0-afcfa7157b23@aliel.fr
> 
> Changes in v5:
> - PATCH 5: Replace devm_regulator_get_optional() with devm_regulator_get()
>             to simplify error handling and remove NULL checks, also
>             ordering as reverse christmas according to Neil's feedback.
> - Link to v4: https://lore.kernel.org/r/20260421-add-mcu-fan-khadas-vim4-v4-0-447114a28f2d@aliel.fr
> 
> Changes in v4:
> - PATCH 1: limit fan-supply property by compatible according to Conor's feedback.
> - Link to v3: https://lore.kernel.org/r/20260417-add-mcu-fan-khadas-vim4-v3-0-a6a7f570b11b@aliel.fr
> 
> Changes in v3:
> - PATCH 1: adding comment on vim4 compatible saying it is not discoverable,
>             thanks to Rob's and Neil's feedback.
> - Link to v2: https://lore.kernel.org/r/20260403-add-mcu-fan-khadas-vim4-v2-0-70536b22439a@aliel.fr
> 
> Changes in v2:
> - PATCH 5: Add regulator_disable on suspend thanks to Neil's feedback.
> - Link to v1: https://lore.kernel.org/r/20260402-add-mcu-fan-khadas-vim4-v1-0-2b12eb4ac7b0@aliel.fr
> 
> ---
> Ronald Claveau (8):
>        dt-bindings: mfd: khadas: Add new compatible for Khadas VIM4 MCU
>        dt-bindings: i2c: amlogic: Add compatible for T7 SOC
>        mfd: khadas-mcu: Add per-variant configuration infrastructure and VIM4 support
>        mfd: khadas-mcu: Add support for VIM4 MCU variant
>        thermal: khadas-mcu-fan: Add fan config from platform data Add regulator support
>        arm64: dts: amlogic: t7: Add i2c pinctrl node
>        arm64: dts: amlogic: t7: Add i2c controller node
>        arm64: dts: amlogic: t7: khadas-vim4: Add i2c MCU fan node
> 
>   .../bindings/i2c/amlogic,meson6-i2c.yaml           |  13 ++-
>   .../devicetree/bindings/mfd/khadas,mcu.yaml        |  18 ++++
>   .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  |  13 +++
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        |  20 ++++
>   drivers/mfd/khadas-mcu.c                           | 119 ++++++++++++++++++---
>   drivers/thermal/khadas_mcu_fan.c                   |  37 +++++--
>   include/linux/mfd/khadas-mcu.h                     |  44 +++++++-
>   7 files changed, 236 insertions(+), 28 deletions(-)
> ---
> base-commit: f7b64ed948718290209074a50bb0df17e5944873
> change-id: 20260402-add-mcu-fan-khadas-vim4-ac1cbe553c9b
> prerequisite-message-id: <20260326092645.1053261-1-jian.hu@amlogic.com>
> prerequisite-patch-id: f03a086b4137158412b2d47b3de793b858de8dde
> prerequisite-patch-id: 123970c9b29c2090440f2fd71c85d3c6fd8e36de
> prerequisite-patch-id: 3e2e56b0926ba327b520f935df4ced5089bbe503
> prerequisite-patch-id: 65a5d76ffdbc9b3aab3385bb65cb027004c30e7e
> prerequisite-patch-id: 237269801826dd3ad7fb16eb4d7d6d4eab504278
> prerequisite-patch-id: 57e9b08a968aedf543d3d0d56cf1ca4db20b2a16
> prerequisite-change-id: 20260326-add-bcm43752-compatible-e264a4f7973a:v2
> prerequisite-patch-id: cd98b74fa56af72af2553f391c400981d83cd4f4
> prerequisite-patch-id: b730f5e42be1d89d193e63a0265495cdbf2c7d7b
> prerequisite-change-id: 20260330-fix-invalid-property-bbe54d933f71:v2
> prerequisite-patch-id: 8d675e7a239985c762843515b241f0a2f45f9c92
> prerequisite-change-id: 20260331-fix-aml-t7-null-reset-2b608ebf9da4:v1
> prerequisite-patch-id: 5b5de77af11747ce964404fb827d2ee2bff47ea5
> prerequisite-patch-id: 1e37fc75fed1e533adee0f3e7e6ead1f8ff3c55c
> prerequisite-patch-id: 65a5d76ffdbc9b3aab3385bb65cb027004c30e7e
> prerequisite-patch-id: 2daf583fb5e7449a02bd217d8aca330171b598aa
> prerequisite-patch-id: 237269801826dd3ad7fb16eb4d7d6d4eab504278
> prerequisite-patch-id: d1ddf9b7710e91f8062de83bd7ba55afb2c4c112
> prerequisite-patch-id: 57e9b08a968aedf543d3d0d56cf1ca4db20b2a16
> prerequisite-patch-id: cd98b74fa56af72af2553f391c400981d83cd4f4
> prerequisite-patch-id: b730f5e42be1d89d193e63a0265495cdbf2c7d7b
> prerequisite-patch-id: 9debd88fa60febed9cd7208f86603b4c2d270520
> prerequisite-patch-id: 314ef9ff0c4d1d15dab1dea9d92aa065f1eac3e9
> 
> Best regards,


