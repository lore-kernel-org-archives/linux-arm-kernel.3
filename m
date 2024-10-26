Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8208BD149F8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Oct 2024 01:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=00KlULZXQFFyz7svzxYaJpGGf2+6ICGFX0E8y5C8Vlc=; b=Jj6USOpkksPhM9
	9TiKeLqWJ88WoBlv9jDrPE74UIQS/V6nqtbF7OwG5Dbtl7bzI40z/+nKXEc14k4iRQilw7OMeHbAw
	dzkyu8SaYVF4w4/+5NSYW5ZXIpz9AVpqHViovW6vABZrCsDXouuKOvOlf+Bq4Q4d545JMeHWVyoWJ
	jRUX7258L4L4Dh/FThn/o0vw8OFlxWpqD8seMi6oBD7p3XyMmx6ilB55ShGgbRqD5ppC+WTOTv1GH
	ewEqqBsdDPeYOwntAtLlx80su8jgp3LMqXdv3h++tQ2WerMpCH0eDFgOYU/FdtzTdjUejC+K10ovh
	d2kEaNkxOzOm0adflabQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4VeI-00000005iBB-06UI;
	Sat, 26 Oct 2024 01:31:26 +0000
Received: from mail-lf1-f52.google.com ([209.85.167.52])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Vci-00000005i41-0zGl;
	Sat, 26 Oct 2024 01:29:49 +0000
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53a0c160b94so3088692e87.2;
        Fri, 25 Oct 2024 18:29:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729906181; x=1730510981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=00KlULZXQFFyz7svzxYaJpGGf2+6ICGFX0E8y5C8Vlc=;
        b=q2Q9S3iwCWSBxwEs2/uCHGwjRduGoTn6i6ad/OxHRimKUAc8SbcRgD4lU7wxjeKPXu
         wrIOFZJXOh8rAxZA2JTn3C7Cr//Gq0MW15rnb+g2VgLiigyS7LJO0xtoiPZGFZMg9boa
         zsa56tQAYK584RBbNtyah8vAcQUSVyFL+9aCULqIm8Ozz2Pe4qwzn5TalDwcM/AX1+O+
         MDGin3R2NownOLu/ebzt2/0sQ732cVYArqTlYN7IuGyhIAYMdSYUcMcA6FoWUtGwS3J4
         ICPA//937EG6hIHV6ZEKwQjm8r3wJLMsGPbnmsDtvSsoJIZPv0in77GNs6x85Pm49aBF
         AfoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWMTh+IS5bCSqMCy8xGfTdk6ZUJmSU1kFSvih0IiqFQQu6DJiHqEiMmVKdAjD8hr20XJxefUAlT6+C@lists.infradead.org, AJvYcCXdjnUZml5L7Vmbb93omug6mejNq7dDjDzseBKs4aspEyy5o5k0J+PfA6XmEdGL5J+eTE1/q6iVrnUJ8yFVH5lp@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8YGzfYhfNclfe2tYKXthEocuMj7fx8ZXiOzgD/xdxHuomB+za
	hV2mSe8NDpJ4Z7Y5B3CyAGU5z04md+os/ANEZqv9Pg8VF144jnnr3z8qN5MD9Zs=
X-Google-Smtp-Source: AGHT+IHxKXSpmRfREwqPD0+ekDkpsnYvJYs+q107coHp8DyiNHqGmYq1b8dXYYjxMULa/xxiqArZew==
X-Received: by 2002:ac2:4c54:0:b0:539:93e8:7eca with SMTP id 2adb3069b0e04-53b348ebf9emr418009e87.35.1729906180949;
        Fri, 25 Oct 2024 18:29:40 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e128339sm366110e87.96.2024.10.25.18.29.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 18:29:39 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb559b0b00so23160041fa.0;
        Fri, 25 Oct 2024 18:29:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX8ZnXp0h4pLrFqQeG1v+gDhuR3mF64DCaOA9TpYANhRBCOxS5PsUz1TkD39pbdFm6bunP6Y7zsTZh1Ek1kbwTD@lists.infradead.org, AJvYcCXg01c3WfN0KwBVuLCFAiTJ2W2HuOMDszkmq6Y4RaoU8yEIUp/B+9xvR7sMPbTK1YTZTvvmlVWmSWMT@lists.infradead.org
X-Received: by 2002:a05:651c:19a1:b0:2fb:5138:a615 with SMTP id
 38308e7fff4ca-2fcbddfcba6mr5324521fa.0.1729906179135; Fri, 25 Oct 2024
 18:29:39 -0700 (PDT)
MIME-Version: 1.0
References: <20241024170540.2721307-1-masterr3c0rd@epochal.quest> <20241024170540.2721307-8-masterr3c0rd@epochal.quest>
In-Reply-To: <20241024170540.2721307-8-masterr3c0rd@epochal.quest>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 26 Oct 2024 09:29:27 +0800
X-Gmail-Original-Message-ID: <CAGb2v64tQ_9C3mwJqt-tm-6SV=SHAk75sO5Ho7gT=p=iyRfLcw@mail.gmail.com>
Message-ID: <CAGb2v64tQ_9C3mwJqt-tm-6SV=SHAk75sO5Ho7gT=p=iyRfLcw@mail.gmail.com>
Subject: Re: [PATCH 07/13] arm64: dts: allwinner: a100: add usb related nodes
To: Cody Eksal <masterr3c0rd@epochal.quest>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-usb@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Andre Przywara <andre.przywara@arm.com>, Parthiban <parthiban@linumiz.com>, 
	Yangtao Li <frank@allwinnertech.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Vinod Koul <vkoul@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Maxime Ripard <mripard@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Yangtao Li <tiny.windzz@gmail.com>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_182948_303102_81775793 
X-CRM114-Status: GOOD (  14.88  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Oct 25, 2024 at 1:09=E2=80=AFAM Cody Eksal <masterr3c0rd@epochal.qu=
est> wrote:
>
> From: Yangtao Li <frank@allwinnertech.com>
>
> Allwinner A64 have two HCI USB controllers, a OTG controller and a USB

            ^^^ Please update this.

> PHY device, let's add nodes on dts.
>
> Signed-off-by: Yangtao Li <frank@allwinnertech.com>
> [masterr3c0rd@epochal.quest: fallback to a33-musb instead of h3-musb]
> Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
> ---
>  .../arm64/boot/dts/allwinner/sun50i-a100.dtsi | 91 +++++++++++++++++++
>  1 file changed, 91 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/=
boot/dts/allwinner/sun50i-a100.dtsi
> index adb11b26045f..0aee1b578661 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> @@ -302,6 +302,97 @@ ths: thermal-sensor@5070400 {
>                         #thermal-sensor-cells =3D <1>;
>                 };
>
> +               usbphy: phy@5100400 {
> +                       #phy-cells =3D <1>;
> +                       compatible =3D "allwinner,sun50i-a100-usb-phy";
> +                       reg =3D <0x05100400 0x14>,
> +                             <0x05101800 0x4>,
> +                             <0x05200800 0x4>;
> +                       reg-names =3D "phy_ctrl",
> +                                   "pmu0",
> +                                   "pmu1";
> +                       clocks =3D <&ccu CLK_USB_PHY0>,
> +                                <&ccu CLK_USB_PHY1>;
> +                       clock-names =3D "usb0_phy",
> +                                     "usb1_phy";
> +                       resets =3D <&ccu RST_USB_PHY0>,
> +                                <&ccu RST_USB_PHY1>;
> +                       reset-names =3D "usb0_reset",
> +                                     "usb1_reset";
> +                       status =3D "disabled";
> +               };
> +
> +               ehci0: usb@5101000 {
> +                       compatible =3D "allwinner,sun50i-a100-ehci",
> +                                    "generic-ehci";
> +                       reg =3D <0x05101000 0x100>;
> +                       interrupts =3D <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&ccu CLK_BUS_OHCI0>,
> +                                <&ccu CLK_BUS_EHCI0>,
> +                                <&ccu CLK_USB_OHCI0>;
> +                       resets =3D <&ccu RST_BUS_OHCI0>,
> +                                <&ccu RST_BUS_EHCI0>;
> +                       phys =3D <&usbphy 0>;
> +                       phy-names =3D "usb";
> +                       status =3D "disabled";
> +               };
> +
> +               ohci0: usb@5101400 {
> +                       compatible =3D "allwinner,sun50i-a100-ohci",
> +                                    "generic-ohci";
> +                       reg =3D <0x05101400 0x100>;
> +                       interrupts =3D <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&ccu CLK_BUS_OHCI0>,
> +                                <&ccu CLK_USB_OHCI0>;
> +                       resets =3D <&ccu RST_BUS_OHCI0>;
> +                       phys =3D <&usbphy 0>;
> +                       phy-names =3D "usb";
> +                       status =3D "disabled";
> +               };
> +
> +               usb_otg: usb@5100000 {
> +                       compatible =3D "allwinner,sun50i-a100-musb",
> +                                    "allwinner,sun8i-a33-musb";
> +                       reg =3D <0x05100000 0x0400>;
> +                       clocks =3D <&ccu CLK_BUS_OTG>;
> +                       resets =3D <&ccu RST_BUS_OTG>;
> +                       interrupts =3D <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names =3D "mc";
> +                       phys =3D <&usbphy 0>;
> +                       phy-names =3D "usb";
> +                       extcon =3D <&usbphy 0>;
> +                       dr_mode =3D "otg";
> +                       status =3D "disabled";
> +               };
> +
> +               ehci1: usb@5200000 {
> +                       compatible =3D "allwinner,sun50i-a100-ehci",
> +                                    "generic-ehci";
> +                       reg =3D <0x05200000 0x100>;
> +                       interrupts =3D <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&ccu CLK_BUS_OHCI1>,
> +                                <&ccu CLK_BUS_EHCI1>,
> +                                <&ccu CLK_USB_OHCI1>;
> +                       resets =3D <&ccu RST_BUS_OHCI1>,
> +                                <&ccu RST_BUS_EHCI1>;
> +                       phys =3D <&usbphy 1>;
> +                       phy-names =3D "usb";
> +                       status =3D "disabled";
> +               };
> +
> +               ohci1: usb@5200400 {
> +                       compatible =3D "allwinner,sun50i-a100-ohci",
> +                                    "generic-ohci";
> +                       reg =3D <0x05200400 0x100>;
> +                       interrupts =3D <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&ccu CLK_BUS_OHCI1>,
> +                                <&ccu CLK_USB_OHCI1>;
> +                       resets =3D <&ccu RST_BUS_OHCI1>;
> +                       phys =3D <&usbphy 1>;
> +                       phy-names =3D "usb";
> +                       status =3D "disabled";
> +               };
> +
>                 r_ccu: clock@7010000 {
>                         compatible =3D "allwinner,sun50i-a100-r-ccu";
>                         reg =3D <0x07010000 0x300>;
> --
> 2.47.0
>
>

