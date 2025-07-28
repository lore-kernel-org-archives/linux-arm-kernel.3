Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 317FAC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 07:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=316U4DOI1oCGsif5IWGCXTFbVQzmX1KKv1+uFfG3g+Y=; b=cIoTDfApMbPxcC+iiJWHEpNI8D
	8GwBZyDL83sdzPhMKi9JE2g/CZ1rRjCzJ8n0odG8DYg6Hmwzb8JQ2XHV45Vo9Dss8OaCliJHYqRzH
	pZSHYbnv0ekgTnbIGGIzgX4yeFU9AdXzwemtj2ycK5KUmAGXb1q5F3zjut4795rXO676O/hslvjFi
	sW0LeemeD4p8GkI66Re+/czr7ssQwfLAhiwv32J44jYbudXz6hBdZ5puHhrQKTgzjGa+3rQ8uhn7z
	rH4412HyNDUY9+6fNYU7CnZF406xcrZ1ZubIwfV1DxbDvs39ds44mcw/w/BP8SnOM/a+kY59ljKyY
	5RLz3wRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugI4r-0000000Dprx-1DaL;
	Mon, 28 Jul 2025 07:15:17 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugHNC-0000000DlTy-3dBK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 06:30:11 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-55a25635385so4568722e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 23:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753684209; x=1754289009; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=316U4DOI1oCGsif5IWGCXTFbVQzmX1KKv1+uFfG3g+Y=;
        b=Jq6h7uKTn9oOFt/TXo9JqUrLSi4U9QLaXaf68diUn53oqoetL1B5U3C5fd2UwieNQG
         szM7YRkXG5As3+0LELeTfSwCQbFX9cCyKBJmFPGiwr+mLGGeRYagh1nrEAD6NJZccPov
         2jeMVafE0mv/zGQ+bj5DKmNnJehxC5vzrujzOvk+FV8GcRTiTli/wp0wuOjp3YTBBgt0
         LaEPnTYESTvsrirzJo5WEFZI0C68GT5vrHyIeQH4wD7f4k/oBMHjRWaXjk83N4mnLuHK
         XpILM8vXGbrCT9XFVnqemK04XEufabAgcGSMf4MYw5ue4tXl7SUebEOj5a1f1RrmQ8Fq
         Hj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753684209; x=1754289009;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=316U4DOI1oCGsif5IWGCXTFbVQzmX1KKv1+uFfG3g+Y=;
        b=OfMMGUXK9kdr1OSm4CRVr69celOCfKDwzeVllFDt/1hPg1anqxHML5sYtT5EOGAfVO
         1PQjYvCjcetwhSiLhzKQ04dmwQoVxlcL/LhjME/Mn1V2GFH4swa9XZXJEkjLnBpOhWxo
         80E0MeIiONR7wh9SqiRAbxtrrAASDncU9PFbPmb6Iza0vll5wqBzTb9XdGkPea1EmqXO
         RtamtOIT4C+NW8VkNYl7ORUsJ6HtqK6ZHPXG4/Y7UJ6j1dqxRpyq4hC5Z9e3Urn69+dI
         1pdC6+3USlwZnCYEslzQMTIRiFFKROV13TRx9VaGX4+bEv1xKYho5MFLQkh6Uahl73sa
         gcfw==
X-Forwarded-Encrypted: i=1; AJvYcCWauYuUczYlpeu3aPIXmKcSrLG8HUjTAULC2ljZkq5ro0OYe8kxrNMtVOB0ir7oe2ZmPIrY+IvC1rd5/a7xIwhL@lists.infradead.org
X-Gm-Message-State: AOJu0YxALpmqYvZCX3smv4IZbspIohsUSSZDSOQBMdtrfyEVnpcncoqK
	52gXHkMZEWh8tqP+VxzhMVzmFAWm3TWpVY/hmoewFK9zo3YTspFZkO2P
X-Gm-Gg: ASbGncv6sFe/giu6/UQGg0wjMs5jQHjjFmMna5KTaOaA5o3aG9+RxW2nHFzjc0YUhUq
	75Guyp0hpRgQln8yj8jdRU2ly8tknEyTXuCgCv9B6hY8zrX5S9tLgOVaBESqg5J2MonnlCS5MVc
	WSpawSGmvEMEUuJ5KFfG9IuJfCU+9CokMKc73HqzggTsMci0KYDQobzadcm+tDGNxpv+xPgnTYj
	mI9jt++iLgotvhTfzn2Wdch2UrGsQGUC+v5Odd3a5zdSM5EBNKLLzHHB9AU1LOaNbkd0vaGHsTU
	UbYemp/LJ4/sQht6CbHTJnKbFb2geRIu+gSeVJ1Yzb/M5fxKtUmooMKnJPkpjhsr9Z0ZuSFs/AU
	CwoH0MvkHtrM29n0HeI/GPTX5adpjO8yXcgoS9XfdaND2
X-Google-Smtp-Source: AGHT+IEM7K5rZYU4BO59YG8z3ImKAWgJLk3LWr8tkHB+uKAbk+/BZbc8cNCzT1IHuQMGlPVOFj+NoQ==
X-Received: by 2002:a05:6512:1323:b0:553:3770:c912 with SMTP id 2adb3069b0e04-55b5f4b9fbamr2207518e87.47.1753684208304;
        Sun, 27 Jul 2025 23:30:08 -0700 (PDT)
Received: from [172.16.183.77] ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b6316d9a5sm1124184e87.21.2025.07.27.23.30.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Jul 2025 23:30:07 -0700 (PDT)
Message-ID: <3be5c56c-f2cf-4ade-a77c-ace556119f96@gmail.com>
Date: Mon, 28 Jul 2025 09:30:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: iio: adc: Replace hard-coded GPIO/IRQ
 flag with a define
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lucas Stankus <lucas.p.stankus@gmail.com>,
 Puranjay Mohan <puranjay@kernel.org>, Dan Robertson <dan@dlrobertson.com>,
 Marcelo Schmitt <marcelo.schmitt@analog.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Dragos Bogdan <dragos.bogdan@analog.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
 =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>,
 Alexandru Tachici <alexandru.tachici@analog.com>,
 Stefan Popa <stefan.popa@analog.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 Ceclan Dumitru <dumitru.ceclan@analog.com>,
 Alexandru Lazar <alazar@startmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Mike Looijmans <mike.looijmans@topic.nl>, David Heidelberg <david@ixit.cz>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Andreas Klinger <ak@it-klinger.de>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
References: <20250724111345.47889-5-krzysztof.kozlowski@linaro.org>
 <20250724111345.47889-6-krzysztof.kozlowski@linaro.org>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250724111345.47889-6-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_233010_928463_149B5642 
X-CRM114-Status: GOOD (  12.98  )
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

On 24/07/2025 14:13, Krzysztof Kozlowski wrote:
> For readability use known defines instead of hard-coding GPIO or
> interrupt flag.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

FWIW:
Acked-by: Matti Vaittinen <mazziesaccount@gmail.com>

Thanks!

> ---
>   Documentation/devicetree/bindings/iio/adc/maxim,max1241.yaml | 2 +-
>   Documentation/devicetree/bindings/iio/adc/rohm,bd79124.yaml  | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/maxim,max1241.yaml b/Documentation/devicetree/bindings/iio/adc/maxim,max1241.yaml
> index ef8d51e74c08..592854766583 100644
> --- a/Documentation/devicetree/bindings/iio/adc/maxim,max1241.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/maxim,max1241.yaml
> @@ -63,6 +63,6 @@ examples:
>               vdd-supply = <&adc_vdd>;
>               vref-supply = <&adc_vref>;
>               spi-max-frequency = <1000000>;
> -            shutdown-gpios = <&gpio 26 1>;
> +            shutdown-gpios = <&gpio 26 GPIO_ACTIVE_LOW>;
>           };
>       };
> diff --git a/Documentation/devicetree/bindings/iio/adc/rohm,bd79124.yaml b/Documentation/devicetree/bindings/iio/adc/rohm,bd79124.yaml
> index 503285823376..4a8f127de7e3 100644
> --- a/Documentation/devicetree/bindings/iio/adc/rohm,bd79124.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/rohm,bd79124.yaml
> @@ -81,7 +81,7 @@ examples:
>               reg = <0x10>;
>   
>               interrupt-parent = <&gpio1>;
> -            interrupts = <29 8>;
> +            interrupts = <29 IRQ_TYPE_LEVEL_LOW>;
>   
>               vdd-supply = <&dummyreg>;
>               iovdd-supply = <&dummyreg>;


