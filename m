Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD5DC4453D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 13:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FDhI8tIlTzFkDL9hKs3tIMe24M9SzYYyQ7hRvEJ46wo=; b=r8p95v9xI0SlTjcdEXXSh/zCNl
	VMZkYCCnQK4Pyd2RgpndpKRF/oZ0eS1ijsZlB0HvJMw5NUuUuxdO5sqirCBVvuHw2EfAi79fxogpt
	3SwyMJcQbvAIXyynUGJD9xlHFTPbi8q6Ia2bIGpnCpxR7JO5cDgIebgPULi2FCK/9nmki8oJEGRUF
	1v4lom+ytVao8Om9Vk7sa9+aBCqJgYF7hWzhe0+uAdQyZOW9qSVEaor30iuu4QkXe8uPGCfo1CW7D
	8FV6c/6OtgvhEBWSksaq2xzj4+hQzP/rOKfcO39+EOQ9TcfnJVD9leQ3e/pc4hseAKhPpCWlXl59t
	r1kUI6oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viYZI-00000005WdL-1V64;
	Wed, 21 Jan 2026 13:48:22 +0000
Received: from mail-vk1-f176.google.com ([209.85.221.176])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viYZE-00000005WY8-3kCa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 13:48:18 +0000
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56624fea96fso184226e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 05:48:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769003295; x=1769608095;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDhI8tIlTzFkDL9hKs3tIMe24M9SzYYyQ7hRvEJ46wo=;
        b=YpidzSR3UElfJfxiI7tQDhHS/hqrgh84de+OWEyGQrfK2BN74CnJYCMunKhaayU+Xd
         mef7E2sXYkmXpa27UlCfBSSLS1tFjS/Dha9QQNA7yLKjpoxuzRLZKU7qeQwd+SLX6Ff5
         c3ZQ/VrjB5rIgfQmhtPty/IyH8H+Ag4/MNtueZD3rpHHcxv8KSfx8+F1clrTu/HBn9Ft
         vM6wmiTLcMvYZPsXeXqShIyH8+OuQct3vCdPRFMkIYfuDQedOtVneahyksRsQ7czFzAy
         ogb6LXuXr4iuyUG6HkeOdhfZouznyeXwxrh/GOIQKvKYYGopfTd8+xRa99F+pOgpZiwO
         m0xQ==
X-Gm-Message-State: AOJu0YzcXf+gME75JmncW9QkRaSIZRwkXtToZNzG/UTrKPWB+RPPpIqg
	dKKvRkSdpBYauSYOI2xXw/sk3Z4VBuQtDRS+SB9xaFz7tVszmARjVt3XWn7mkpk3
X-Gm-Gg: AZuq6aK3pFIPuSbQQS/RI72BrD4haFDj2Ccj/rVJXG4VZSopPxwUNsVEt3xdldpY780
	a1qE0qoCwK4kYAQg9IyReGnRIcoY/QMk2KTnp4uJcHiCwdAgMXSfZFTLsRpZqAcAsT+xrP8A5/b
	OJTEtRhXQkLnzKRfs+tDCQ6sqLHQXPMkjPm+DKU7IYvCvF1kvk/pxOoE8duxO8iucuhPacTNXOZ
	Jd4+v0DZw6ugreKEMyQlEpT/PFJeWhIk5WpNC4OQm2rEDdbESDVTR1lxnIWtWIUUPVJmn/8zjga
	aW5cDyi3MdS9k5MwxNlVU5YPZnkT52BFLvZs28gwHUq8kzvYXVccSr3k9+t0WEj3kDscFMGa6um
	uHKQj0eRrI6EOCkiJYd/UClXksMDgqSDErdQiYgdptW/+Xgxj/EyyXEJaYXIzmF50T9pYMjsqYg
	HaYP1EYiYtN/JzAR2KdYIm/iOaEUST3c2eF2Cuos/zUi9DYxAP
X-Received: by 2002:a05:6122:2676:b0:563:ba2e:91a0 with SMTP id 71dfb90a1353d-563ba2e91d6mr3780558e0c.10.1769003294599;
        Wed, 21 Jan 2026 05:48:14 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-947d03d5aebsm4971140241.5.2026.01.21.05.48.13
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 05:48:13 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-9480078b2fbso583393241.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 05:48:13 -0800 (PST)
X-Received: by 2002:a05:6102:d92:b0:5ed:ab0:e5d1 with SMTP id
 ada2fe7eead31-5f192539f6amr7680722137.15.1769003293334; Wed, 21 Jan 2026
 05:48:13 -0800 (PST)
MIME-Version: 1.0
References: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org> <20260118135038.8033-10-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260118135038.8033-10-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 Jan 2026 14:48:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWfkHMQFvUzaHpso-fMFAS5u8ABHpEA9ZXq1fxcR-oN6Q@mail.gmail.com>
X-Gm-Features: AZwV_Qi-WLBK0O_q5kA0yh25XZR3hcQUNirELFZFoxr2VQqkUKi0-PPk2Bs3v1s
Message-ID: <CAMuHMdWfkHMQFvUzaHpso-fMFAS5u8ABHpEA9ZXq1fxcR-oN6Q@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] arm64: dts: renesas: ebisu: Describe PCIe/USB3.0
 clock generator
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_054817_003128_A75207BA 
X-CRM114-Status: GOOD (  26.11  )
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

Hi Marek,

On Sun, 18 Jan 2026 at 14:51, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Describe the 9FGV0841 PCIe and USB3.0 clock generator present on Ebisu
> board. The clock generator supplies 100 MHz differential clock for both
> PCIe slot and BT/WLAN expansion port, as well as for the USB 3.0 PHY.
>
> This configuration is valid for SW49 in OFF position, which means the
> PCIe signals are routed to the PCIe slot and U11 9FGV0841 PCIe clock
> generator output 3 supplies clock to the PCIe slot.
>
> In case the SW49 is set to ON position, which means the PCIe signals
> are routed to the EX BT/WLAN expansion port, and U11 9FGV0841 PCIe
> clock generator output 4 supplies clock to the port and &pciec0_rp
> clocks should be changed to "clocks = <&pcie_usb_clk 4>;". Once the
> BT/WLAN port is tested, this can be implemented using a DTO. Until
> then, assume SW49 is set to OFF position.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/ebisu.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ebisu.dtsi
> @@ -53,6 +53,12 @@ backlight: backlight {
>                 power-supply = <&reg_12p0v>;
>         };
>
> +       pcie_usb_refclk: clk-x7 {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <25000000>;
> +       };
> +
>         cvbs-in {
>                 compatible = "composite-video-connector";
>                 label = "CVBS IN";
> @@ -439,6 +445,13 @@ adv7511_out: endpoint {
>                 };
>         };
>
> +       pcie_usb_clk: clk@68 {
> +               compatible = "renesas,9fgv0841";
> +               reg = <0x68>;
> +               clocks = <&pcie_usb_refclk>;
> +               #clock-cells = <1>;
> +       };

During boot, the rs9 prints a warning:

    clk-renesas-pcie-9series 0-0068: No cache defaults, reading back from HW

which probably shouldn't be printed at the warning level?

> +
>         video-receiver@70 {
>                 compatible = "adi,adv7482";
>                 reg = <0x70>;

> @@ -871,7 +902,19 @@ &usb2_phy0 {
>         status = "okay";
>  };
>
> +&usb3_phy0 {
> +       clocks = <&pcie_usb_clk 6>;
> +       status = "okay";
> +};

This does not work, probing fails with:

    usb_phy_generic usb-phy: dummy supplies not allowed for exclusive
requests (id=vbus)

Adding a fixed regulator that serves as vbus-supply like in commit
fec2d8fcdedaeeb0 ("arm64: dts: freescale: imx93-phyboard-nash: Add USB
vbus regulators") fixes that issue (and my USB3.0 FLASH driver is
detected, yeah!), but a more accurate description would be better.

> +
> +&usb3s0_clk {
> +       clock-frequency = <100000000>;
> +       status = "disabled";
> +};
> +
>  &usb3_peri0 {
> +       phys = <&usb3_phy0>;
> +       phy-names = "usb";
>         companion = <&xhci0>;
>         status = "okay";
>  };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

