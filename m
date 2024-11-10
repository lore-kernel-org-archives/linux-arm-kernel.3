Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD1C9D5E123
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Nov 2024 12:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rvXYUadJ0YY+CbymfbcOM/wzKxval+r+XKbtSthLR0Q=; b=xSd1SWF1LKzUPuqdPUcplxYwek
	HhwHdi/3e0Aqg75xeiNFjgHU88NRSDfjWvY4gckvWUqjuniZK4YttiUbuC6cVQuT3WEp1Q2HojDDF
	J4jjFRlB16rEEdJibIkHsYcZzeSCaJNVN3fKY6d8L46Tcvtgvtnm8gmMR1w5fzH8MWRxIkAlsfEkz
	xoS388Y9nW5MmUlT42pOqHja3e4cXbTNwm/z+bTKMR+bwEuKf75j7IsAwrgFB7JbndwkZC3iGCkji
	OpmUG5qAJInJuZeVDUnuC9lmhc03X1XhuiDXo1WMLqBDzqfHZogiyt5KyADonuVt54KW7rt6Zugu0
	iqAelgtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tA71u-0000000EqN4-2o4r;
	Sun, 10 Nov 2024 12:26:58 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tA6zM-0000000Epux-2CkI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Nov 2024 12:24:22 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-431616c23b5so20652425e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 Nov 2024 04:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731241458; x=1731846258; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rvXYUadJ0YY+CbymfbcOM/wzKxval+r+XKbtSthLR0Q=;
        b=Pqw2nR686iJfmPVhriVLyDwE4GDyIH2ukolbsmoGlqrQcyV+XPPpsy9KeXPJEt5vdd
         LCA5Ri9GratIW9MkqAahtonmXk0ZX45qiM72BGd6etuEDybtxkmUDGYDcEVWwJ/GMi8s
         JRGO3bjxsWH1JP0f55Jyuf1jOJwpOtPYkr7jlEHUo53BoKHZ/y567DfkO8bp6m7uh0L3
         EfAAjsqYR5JqZbxnyrlZWheel4Atp8fjSw9iaUyrbY8hPLtGN2I+C0fnqbj9PI2AGvLP
         2a0yNcH8kZEPXUh5OFklDjXBvsyVc6GHS+tj5wZ5MK+tzJfugrLJvQg0VwejmcHqMFwV
         crZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731241458; x=1731846258;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rvXYUadJ0YY+CbymfbcOM/wzKxval+r+XKbtSthLR0Q=;
        b=EsBPtspnSFZ7PHqMVclqb1+h6NODBw/C44DZOckbBBr1eYLdxsBsmx262ivq+KMduh
         OLUFqk2W5XAXkykVrGlh3AzyiD1Yu/QUqGtEn+k8dd3uQOws3jbXVGz+b+INN8eku1qH
         2/Z7TXoqqozm2kMHP7PUBvbG2wp9ZzYTjfzdQoB6S8EUFcryWwlPnHvrpdP/1lYROM0h
         I1Ork6zYvJP73UbBO5+k+UYS8n8FI+QHf5WBLrCxKMr7YEGqrty5pVkf4LVdCSy7z9Ux
         qRrbkbn4zKY+JgkEMSynHMK1uzo0EF6hs6XcWVHk53Z6CCnem6VgOUT9UhmVP5NeABCo
         uGnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcZxmiVLhYRlU1DuvLr+R4MjHxc7xAXfewcJB+5Oxi4/Z+cHkBtUjvax7G0iiBbFQJ4IXtJqJfkkFKGfxdnO6H@lists.infradead.org
X-Gm-Message-State: AOJu0YxnARvcMZc8y9WseqIbhcC6UtLzqhRj4HcvqTMIsnl8P3Fbr3xa
	iVyS6ePkCdoT2nSgEyky0EjCJe1hcRos6YtYKiLinVkJxwcPOkyUx+cELiWmi7E=
X-Google-Smtp-Source: AGHT+IGhj9FWXxXNMyiRS3rVPR92d2i9obKrk1HDWxw33l4TLDIFDIzAxuSd6E/CWeUFU724XoVgXA==
X-Received: by 2002:a05:600c:4f4e:b0:431:4a82:97f2 with SMTP id 5b1f17b1804b1-432b6858db8mr83883675e9.6.1731241458324;
        Sun, 10 Nov 2024 04:24:18 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:e984:9f27:9cbb:71ca? ([2a01:e0a:982:cbb0:e984:9f27:9cbb:71ca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa70a1d8sm180707145e9.27.2024.11.10.04.24.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Nov 2024 04:24:17 -0800 (PST)
Message-ID: <27aa3716-1d28-4da8-80e6-212d7f94d193@linaro.org>
Date: Sun, 10 Nov 2024 13:24:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 0/4] Pinctrl: A4: Add pinctrl driver
To: xianwei.zhao@amlogic.com, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241101-a4_pinctrl-v4-0-efd98edc3ad4@amlogic.com>
Content-Language: en-GB
From: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20241101-a4_pinctrl-v4-0-efd98edc3ad4@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_042420_621940_308C533C 
X-CRM114-Status: GOOD (  20.42  )
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

Hi,

Le 01/11/2024 à 09:27, Xianwei Zhao via B4 Relay a écrit :
> Add pinctrl driver support for Amloigc A4 SoC
> 
> I want to find out what kind of solution is feasible to
> meet the needs of all parties. This RFC verion is one of them.
> 
> All of Amogic SoCs GPIO device requirement is met here by
> adding GPIO bank definition instead of the pin definition.
> Binding header files will no longer be added to future
> SoCs's pin devices.
> 
> The pinctrl software only adds insterface of of_xlate to support
> for transformation without affecting the overall framework and
> is compatible with previous drivers.
> 
> The code in DTS file is also readable when using GPIO, as below:
> 
> reset-gpios = <&gpio AMLOGIC_GPIO(AMLOGIC_GPIO_X, 6) GPIO_ACTIVE_LOW>;

Fine, but why not use 3 cells instead of this macro ? Since you introduced the
custom xlate, parsing the 3 cells would be easier that using a macro:

reset-gpios = <&gpio AMLOGIC_GPIO_X 6 GPIO_ACTIVE_LOW>;

Neil

> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
> Changes in v4:
> - Add interface of of_xlate support.
> - Add const for some variable.
> - Link to v3: https://lore.kernel.org/r/20241018-a4_pinctrl-v3-0-e76fd1cf01d7@amlogic.com
> 
> Changes in v3:
> - Remove head file from binding.
> - Move GPIO define to file *.c.
> - Link to v2: https://lore.kernel.org/r/20241014-a4_pinctrl-v2-0-3e74a65c285e@amlogic.com
> 
> Changes in v2:
> - Use one marco instead of all pin define.
> - Add unit name for dts node.
> - Link to v1: https://lore.kernel.org/all/20240611-a4_pinctrl-v1-0-dc487b1977b3@amlogic.com/
> 
> ---
> Xianwei Zhao (4):
>        dt-bindings: pinctrl: Add support for Amlogic A4 SoCs
>        pinctrl: meson: add interface of of_xlate
>        pinctrl: meson: Add driver support for Amlogic A4 SoCs
>        arm64: dts: amlogic: a4: add pinctrl node
> 
>   .../bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml |    2 +
>   arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |   36 +
>   drivers/pinctrl/meson/Kconfig                      |    6 +
>   drivers/pinctrl/meson/Makefile                     |    1 +
>   drivers/pinctrl/meson/pinctrl-amlogic-a4.c         | 1321 ++++++++++++++++++++
>   drivers/pinctrl/meson/pinctrl-meson.c              |    4 +
>   drivers/pinctrl/meson/pinctrl-meson.h              |    4 +
>   include/dt-bindings/gpio/amlogic-gpio.h            |   50 +
>   8 files changed, 1424 insertions(+)
> ---
> base-commit: 58e2d28ed28e5bc8836f8c14df1f94c27c1f9e2f
> change-id: 20241012-a4_pinctrl-09d1b2a17e47
> 
> Best regards,


