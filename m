Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D5CE77179
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 16:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fXaGALZRpVF00Ah97wy9KL1a0sGXBk3kjKaNXmrcIjI=; b=aP2j4WwzQTpyydc3DGPhpQK4EA
	jzlMgLDJcq1XTUYzmWBbin3u/EfTwgCtPuyQj+OhsuhL5rTMmZxE00krBQ9GzzPRzMW8Ov0djW3SG
	sRcCpPgVHXQM+sNDFiq3abaPivDDFBxj10IjiqGHMSb63Qm/52pd4urEw8FfB8Wrds56x76jx2EIU
	023ebToeFQ7zcWX7CFxN5kEEhfaSBJMyQKqUh27CWwLNu7LVDdKs3BYJ9MnPAOfZaXytrCJrCKMFH
	gnclUzMGd99iY8g/zcVRNeAe2oNfqyh+uOOzSpKK0lGUxJ7ttADJaQD5Vf9oTbC7EwBknth501VYc
	BK0CdtMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJb2x-000000028LC-3vPR;
	Fri, 06 Dec 2024 16:19:15 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJayD-0000000270Q-2E5J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 16:14:22 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a9a68480164so277540266b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 08:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733501659; x=1734106459; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fXaGALZRpVF00Ah97wy9KL1a0sGXBk3kjKaNXmrcIjI=;
        b=Tj2+g6BqopfQk5P6yzEC56VG4q3UzAvDKJOdwvLPnl7p1kAe56EdltBUG6BNcFGIi3
         G2SALnzt611Xu0TieC6cEo8fxNEp6o1v23RHjFgc+usqdUg17WmydRhTAnCe9QkfOdXr
         M6Rc6JoSHXi1wamzr7DJpXAhSBTsPs0erLdIEhE6VvGUo0+RrDKKd3cz92fItCo+rrdY
         5pfDAP97idHPDZMidyWxL58I6LWMVnRVbFVBK9HojSnO2IRuPG0KkktRZGwRDWkPO60G
         gnYah7IszXXvvsrzr3/yq0L+N/kMgXpLZfqBEvArNgTCPnnMl1N0FOW1pkPZwDpO67wx
         LW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733501659; x=1734106459;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fXaGALZRpVF00Ah97wy9KL1a0sGXBk3kjKaNXmrcIjI=;
        b=jJlgz6RCk+fOtsSc7UMx2QVtg5SGGq6Wq0C+jj7lDcJpgOMib92sSLdWWNs7gx+MTS
         WTngpeK4XaEfQW1dLAkwljYPi5DvBcHbqCMhTkyF71zpf6Yas3MiTBxeAetPKRDFHe7M
         r9te7+8DGqg+FPDYYlLVCaYfGqLhY7Wt6yF5LaIX+XUm4fxNFmhLGjKq8Qfhm786Io3F
         TRSM0LR5eFVN82TJLCDnX2bE7hf8EppB6rd3TpoMSzTwlkrrLpcublMUbr1sU818HYta
         FFCQdOyFcpcsxyPRAhxq32OXTNcx0LxpYUx04yiKUAl9J0JsDv3xefoESzmLITAvmT3o
         ICgQ==
X-Gm-Message-State: AOJu0YyvfZTlsjCW9AHcR0r5gCBz6r4LzPFhTpwH38Idzzfj+bRpANr+
	j7FsmlrD+kurHp9s8PUGAI3FDxJ9+8k81R0ywvO6i4qQGaMra0hT
X-Gm-Gg: ASbGncueW61W8hFNl2OB42CkvQUz7t32LIpythibsiawCMIcl5Ht/eVgR5ZOapHMyFB
	rr9rKp8SOyC3uG+Ky1STQDt6GddtvmNZnuhcmJ6wZsr+z1cuOU/2qvY38P+qL/DzCb+mCZ38G2y
	JZmxWFIHQ0gZkRKMHy7A/eMNK5tGXJi748pSnnQzks6vUd3pLBBRl9LdeTYMsetFaUi/jRszMHI
	DlCnDzJsTWcoRa8K5Rksc4fGbfYjq3Vk1oXmeaI6fTJwX76ZGrc2QmSDrYkl5nnZUb3W59NlSNf
	ZHYT6UeynR9LUhHSFH7oNaZ/KQy0
X-Google-Smtp-Source: AGHT+IEBIRjHmYo28RiHnCZp8Gi2PiofN48HDLnGskCNXYlPsQ0Oej4qKEh8fJUXynlKVp/0AGxXGw==
X-Received: by 2002:a17:907:9508:b0:aa5:f39a:bc99 with SMTP id a640c23a62f3a-aa63a127f80mr256126966b.36.1733501658659;
        Fri, 06 Dec 2024 08:14:18 -0800 (PST)
Received: from [192.168.1.107] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa62608d2fbsm258270666b.149.2024.12.06.08.14.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 08:14:18 -0800 (PST)
Message-ID: <51a87200-e562-409c-af21-2216288beb67@gmail.com>
Date: Fri, 6 Dec 2024 18:14:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] arm64: dts: exynos: Add initial support for
 Samsung Galaxy S20 Series boards (hubble)
Content-Language: en-US
To: Umer Uddin <umer.uddin@mentallysanemainliners.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 igor.belwon@mentallysanemainliners.org
References: <20241206154149.4271-1-umer.uddin@mentallysanemainliners.org>
 <20241206154149.4271-3-umer.uddin@mentallysanemainliners.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20241206154149.4271-3-umer.uddin@mentallysanemainliners.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_081421_574495_3F3E5D2F 
X-CRM114-Status: GOOD (  20.11  )
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

On 12/6/24 17:41, Umer Uddin wrote:
> Add initial support for the Samsung Galaxy S20 Series (hubble) phones.
> They were launched in 2020, and are based on the Exynos 990 SoC.
> The devices have multiple RAM configurations,

A very small nit that I've noticed repeatedly in the other 990
commits as well:

In the future, try to wrap commit message according to Linux coding
style / submission process - neither too early nor over the limit, so
that commit messages can look as good as they can:

https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

For example, in this particular case, you could move "starting from
8GB" to the previous line, like so:

...
They were launched in 2020, and are based on the Exynos 990 SoC.
The devices have multiple RAM configurations, starting from 8GB
going all the way up to 16GB For the S20 Ultra devices.

Otherwise, it looks good to me.

Best regards, Ivo.

> starting from 8GB going all the way up to 16GB for the S20 Ultra devices.
>
> This device tree adds support for the following:
>
> - SimpleFB
> - 8GB RAM (Any more will be mapped in device trees)
> - Buttons
>
> Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
> ---
>  .../boot/dts/exynos/exynos990-x1s-common.dtsi | 98 +++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos990-x1s-common.dtsi
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos990-x1s-common.dtsi b/arch/arm64/boot/dts/exynos/exynos990-x1s-common.dtsi
> new file mode 100644
> index 000000000..55fa8e9e0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos990-x1s-common.dtsi
> @@ -0,0 +1,98 @@
> +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
> +/*
> + * Samsung Galaxy S20 Series device tree source
> + *
> + * Copyright (c) 2024, Umer Uddin <umer.uddin@mentallysanemainliners.org>
> + */
> +
> +/dts-v1/;
> +#include "exynos990.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		framebuffer0: framebuffer@f1000000 {
> +			compatible = "simple-framebuffer";
> +			reg = <0 0xf1000000 0 (1440 * 3200 * 4)>;
> +			width = <1440>;
> +			height = <3200>;
> +			stride = <(1440 * 4)>;
> +			format = "a8r8g8b8";
> +		};
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		cont_splash_mem: framebuffer@f1000000 {
> +			reg = <0 0xf1000000 0 0x1194000>;
> +			no-map;
> +		};
> +
> +		abox_reserved: audio@f7fb0000 {
> +			reg = <0 0xf7fb0000 0 0x2a50000>;
> +			no-map;
> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-0 = <&key_power &key_voldown &key_volup>;
> +		pinctrl-names = "default";
> +
> +		power-key {
> +			label = "Power";
> +			linux,code = <KEY_POWER>;
> +			gpios = <&gpa2 4 GPIO_ACTIVE_LOW>;
> +			wakeup-source;
> +		};
> +
> +		voldown-key {
> +			label = "Volume Down";
> +			linux,code = <KEY_VOLUMEDOWN>;
> +			gpios = <&gpa0 4 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		volup-key {
> +			label = "Volume Up";
> +			linux,code = <KEY_VOLUMEUP>;
> +			gpios = <&gpa0 3 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +};
> +
> +&oscclk {
> +	clock-frequency = <26000000>;
> +};
> +
> +&pinctrl_alive {
> +	key_power: key-power-pins {
> +		samsung,pins = "gpa2-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	key_voldown: key-voldown-pins {
> +		samsung,pins = "gpa0-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	key_volup: key-volup-pins {
> +		samsung,pins = "gpa0-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +};


