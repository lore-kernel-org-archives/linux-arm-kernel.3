Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD8CCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 00:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=coXW5Vkb6CmpealAt1z5pb6dHocrXcBIL+HK5DdIDhI=; b=O/U7oWKLpJNf3U0dn9IbsjQML4
	aFet/xDwuaKQb1MsL5eW8e60ZhHVDMJAyCc3AaltuvNzAkmM6RGcBMy+618h9ivZOUtLaWvsw+6Tu
	8LrxpdPcTW56pEEvvKqAXTRL1iI3mn4ySRNh0o6TpChZJMp6pa2NV8EeYHJM5M372YMRoaScpziUN
	ce7Gn90dqqRUSRqDI/RRgVczdth/zs0JrNWGpkDjKpb3Wp2+9Tb4nBeSruj8yVeOQ7/m5EREvCvn5
	+P6ZM6au+9xeH0dmS+ExKVEufbus6XAtUDCc1tQa4vuTCg//XbwxkaNKN+9nGez10CRaFpieMQuT0
	RAhtggGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4TFS-0000000BQYc-1Wqi;
	Fri, 03 Oct 2025 00:02:10 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4TFP-0000000BQXx-1y2G
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 00:02:08 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3ece0e4c5faso1193405f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 17:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759449725; x=1760054525; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=coXW5Vkb6CmpealAt1z5pb6dHocrXcBIL+HK5DdIDhI=;
        b=UJTC8gHGfFWmohWd8tmo+5jW/HPxYhux+rkT0SptGfBR2YiRbPTp/OKF5rSHYwkzk9
         R9n5zRXNq2jsSAEJn+n/8n5E9XgvHOgOCBwfynz9KqUUrHDqJLKCK4bVIaDkzaampIoi
         ZwaLJsN6RtADkuQx8viTxz6G9UcCpRCN0RxSSMNE4RfgBxkjQFD+82kxt1ylqqlcaXlk
         C4jPxe76b0fvxj3oaZIzHEP0XymiTOqoLqlQmwvQSHJayx5Yvl+m2yApzIzuzAA9O9i0
         Rmaz0kUdybsq6bFUqs5ClazAevS/Tz5dRiwzAxdr9O4ub1MIIpYJHFCxTwhrBPqOkbXt
         1TXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759449725; x=1760054525;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=coXW5Vkb6CmpealAt1z5pb6dHocrXcBIL+HK5DdIDhI=;
        b=Y7uUTLLOqxza+OUHpWqAHJ2KbcYWJO/jPv9xSYJfbt3ZjjLBjSHX7xK+q6iLhYWcUO
         pmJEIegCd5+S8p3JQA2zZZx7zM6rMbzOl+DQRNk3eznFOe5eVQ218La1tCA6f/A7KFCB
         GlcxEPb1bsa7ViX/ns1CqpYnyHFxLzI/cSu6Tw0l8jMQZhTlyMuYginG59uFpHoRzhIs
         7zZFeUc9Bwh0lspyttXpN/kCZK+wzmqxxvqf37c9X62KwnEngR30vChfw/FSNq0tcLb5
         u+eobjyAvM+lZ5tJ2raCnX5XzCqN6pGDPOJVXm7WKezXUWtXHBd2yWNCJKMGk5p206lu
         YF5A==
X-Forwarded-Encrypted: i=1; AJvYcCXo3XUZgJr1TtOdrDmk+VDKXOwbrHW/Z4qpNF/1KASwg04qqT8AcB3pZuuUxdD218QTsdR3j+dP6cfxdwLBa0Wh@lists.infradead.org
X-Gm-Message-State: AOJu0YxM1mfiJPgMb90slpUn7Y5Z7tHBYWpEJJmeSVfbGzCEACRRgaYB
	4Tc4AXlyMQyVTGc/2vZpC6FufhUNVmrP3Xx0OCLJ50QwteZ1YV3MJTUK05FjMmhuzVjFoqCz6aw
	A07HUQwWBUVK6lsrjZIZzsR5bMKHYfrc=
X-Gm-Gg: ASbGncte8/cooKG9hldzoF1Uuo1ApLXzLD4iIPtgfj6PeO0YSamHufc7fMivYnVIRui
	y8o6a+u/oqlKIcBHZcZn6OPkoYWH9T+703Eqb1CGwyd//9FzFr5vc367+9R3ksc/ZFRrhr2Is72
	Ot1Nptp0wENYBxaBzv//sqcvYT8rvOSzO2uOi2wvD8aMdvFEOiZzMZpSGjowGm8Ald/uweJ/9J1
	iPM2h4FSUYfj0HIXHg2s8X7cD0lIeQbCbqV9Zxw+xvYQ+3arvRf60wdq7mi11k=
X-Google-Smtp-Source: AGHT+IH8H5F4Rz+w2GRajaiqGwkVljBWP+xyTsDvXZ4pEnPtSor4uaMKN91VsYpn2mPiM9ga89tuX8JFeLCJpJ65RTI=
X-Received: by 2002:a5d:584c:0:b0:3ec:e152:e31c with SMTP id
 ffacd0b85a97d-4256713ad7fmr600729f8f.1.1759449724680; Thu, 02 Oct 2025
 17:02:04 -0700 (PDT)
MIME-Version: 1.0
References: <20251002034708.19248-1-laurent.pinchart@ideasonboard.com> <20251002034708.19248-4-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20251002034708.19248-4-laurent.pinchart@ideasonboard.com>
From: Jimmy Hon <honyuenkwun@gmail.com>
Date: Thu, 2 Oct 2025 19:01:53 -0500
X-Gm-Features: AS18NWDlylDf3oN5sbP_UNB28JThANAGdlYlt-3ts0m7FoUFxTbSDWexI2F-454
Message-ID: <CALWfF7Lhz2brif4xepWZ71mRqMmXKzxqd=0_hO_b6aF6_GkffQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add rk3588s-orangepi-cm5-base
 device tree
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, Algea Cao <algea.cao@rock-chips.com>, 
	Andy Yan <andy.yan@rock-chips.com>, Cenk Uluisik <cenk.uluisik@googlemail.com>, 
	Conor Dooley <conor+dt@kernel.org>, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Heiko Stuebner <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	Muhammed Efe Cetin <efectn@6tel.net>, Ondrej Jirman <megi@xff.cz>, Rob Herring <robh@kernel.org>, 
	Sandy Huang <hjc@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_170207_524314_C0182342 
X-CRM114-Status: GOOD (  12.95  )
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

A few nitpicks below

[ snip ]
> +
> +#include "rk3588s-orangepi-cm5.dtsi"
> +
> +/ {
> +       model = "Xunlong Orange Pi CM5 Base";
> +       compatible = "xunlong,orangepi-cm5-base", "xunlong,orangepi-cm5", "rockchip,rk3588s";
> +
> +       aliases {
> +               ethernet0 = &gmac1;
> +               mmc0 = &sdhci;
Since sdhci is enabled in the SoM.dtsi, this alias should probably go
there instead.

> +               mmc1 = &sdmmc;
> +       };
> +

[ snip ]

> +
> +       vbus_5v0: vbus-5v0 {
> +               compatible = "regulator-fixed";
> +               regulator-name = "vbus_5v0";
> +               regulator-min-microvolt = <5000000>;
> +               regulator-max-microvolt = <5000000>;
> +               enable-active-high;
> +               gpio = <&gpio0 RK_PD3 GPIO_ACTIVE_HIGH>;
> +               vin-supply = <&vcc5v0_sys>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&vbus_5v0_en_pin>;
The property names in these regulators are not as organized as the
regulators for the CPU/NPU.

> +       };
> +
> +       vcc_3v3: regulator-vcc-3v3 {
> +               compatible = "regulator-fixed";
> +               regulator-name = "vcc_3v3";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +               startup-delay-us = <50000>;
> +               enable-active-high;
> +               gpio = <&gpio4 RK_PA3 GPIO_ACTIVE_HIGH>;
> +               vin-supply = <&vcc5v0_sys>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&vcc_3v3_en_pin>;
> +       };
> +
> +       vcc5v0_sys: regulator-vcc-5v0 {
> +               compatible = "regulator-fixed";
> +               regulator-name = "vcc5v0_sys";
> +               regulator-always-on;
> +               regulator-boot-on;
> +               regulator-min-microvolt = <5000000>;
> +               regulator-max-microvolt = <5000000>;
> +       };
> +};

[ snip ]

> +
> +&gmac1 {
> +       clock_in_out = "output";
> +       phy-handle = <&rgmii_phy>;
> +       phy-mode = "rgmii-id";
> +       phy-supply = <&vcc_3v3>;
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&gmac1_miim
> +                    &gmac1_rx_bus2
> +                    &gmac1_tx_bus2
> +                    &gmac1_rgmii_clk
> +                    &gmac1_rgmii_bus>;
> +       tx_delay = <0x42>;
When using "rgmii-id", tx_delay will be ignored. Does the ethernet
work without this property?

See the comment by Jonas in another review.
https://lore.kernel.org/linux-rockchip/da752790-da17-4d26-b9b2-8240b38b3276@kwiboo.se/

> +       status = "okay";
> +};
> +
> +&gpu {
> +       mali-supply = <&vdd_gpu_s0>;
> +       status = "okay";
> +};
This is a feature in the SoC itself, so it's not board specific and
can be put into the SoM.dtsi.

[ snip ]

> +
> +&pd_gpu {
> +       domain-supply = <&vdd_gpu_s0>;
> +};
Same comment regarding moving to the SoM.dtsi

> --
> Regards,
>
> Laurent Pinchart
>
Jimmy Hon

