Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 786CCC3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 07:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W3AwXVgZWJIPFDmEkzHtoSPmnRnszxQ34o1b/XJWM3Q=; b=iJI4QueJd6TVlYJjLiHKmUI2jB
	zW0ot/lcC7TkmbYrEek/ycenqRgsetUcoNSrMPHEIvR9dqRTVOww3+2UMQvqaJbF5+KTVkjhZuLbZ
	hAcCwO8+n/czQwnUiTnfpeepwLY/cxke1kOsWsbiqYOr35DSZacV3IJWGjE6QBFrZKJADAv56YfIE
	FVxko+Sy+2hemRU5Cgt8ZhsHr6eQ9RJ7CT56cxeinbh9qsn770zWd7mLszuUXE9mqoob1yHTL+nLd
	XoQ32GcaRg+ihtzcHc2Y/+7AF5GnfaVKB8tbP83krPrVTEPOuqg7x6Wr0dHbfDYoXZWFONwje2iXW
	quzYhKAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKB3P-0000000CPeh-1qBS;
	Wed, 28 May 2025 07:18:23 +0000
Received: from mail-vs1-f46.google.com ([209.85.217.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKAzd-0000000CPCz-0HRq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 07:14:30 +0000
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4c34dcdaf88so1317376137.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 00:14:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748416465; x=1749021265;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W3AwXVgZWJIPFDmEkzHtoSPmnRnszxQ34o1b/XJWM3Q=;
        b=qrYgwF42u0N8/SJbAEWKr723g89nLLSTcLfuEKRXajVSlR1HyRPXCozQ3FD9AZ6ZU4
         BJVcnWqRhAqamhOS5FSIiTZ73AF0p2gC9A9/oof5pRLnhoKy8e7Uh+BT4fxqFV1PbDon
         7bbpcsdyIOFIy5GJmpx3ycHmnTtdYn7P7LtJiod5irmwkMbeX7ktktYQlB0HiYK/THAd
         QMFmYrEqwllP5qfAwgz6iHKHFXXvlSabQPAOcS9P9zVt88yKzXc1Y1hdWWnaXdhDMTDn
         XM2hCysDWf13RlkyOpoOM/Kcus8yk24J4exS/2GjKEyp+3ye+IG8cF1hHTLUPBxs7O8/
         MOcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsf607yor153bX11//qz1X8CR+z2UkbcRZAL2gYXdT/yLjMEMXpHUTvtdLBQJdTjk83wU+mHKhH0W2+APdCvRi@lists.infradead.org
X-Gm-Message-State: AOJu0Yx680mTyz+RuROnysozfxrO2iHsmVraeLJvFOoQUsxqKiOqqvt0
	qLSgIHyQLlcaPjeh555NlBMI1HWHf/1tjbJN+wFfNqtUJOBjUwCVMI88bC+K6ynm
X-Gm-Gg: ASbGncum4jZoTOWJO0hwuftxa5WyL6JCcFEZEV3uDif+FQM9hmAolY22sCpUSdFLw97
	POqYOQ2llRRXqVgviDmAFx1v+w0xjs4gkp6A+x7062BnRVI8AfV2VJ+a9iHiP2v2fvZIZ5EjRHG
	aLKW6qfl0OsgFCyxF86wO7++6D6dvlBJXtNlqRq6B3YIFKG012pMyz4U8LNkHM2m3OM+KahntZw
	9XE6hQSoaOnm7mAxpIc0k2oUgZjspRiIshhgDmzcDTeow0eURW1ie546x3tifuPXs7/hndMiPwA
	u64cGo3NjWaCRvh0nWZz+BpsyNPNev1Cpu/nmzpXfeuHtNjYIOsCDF3jFx8nVSFL23sEUs0ckiT
	Ps5489YAmoO/NpT0p7Gn82VYs
X-Google-Smtp-Source: AGHT+IFBgj8dw4Fxk1B09vvCdeEPAjknAyUlI/vIJoTVWjSvvnYo/e1rlgzbXN4svz2Yzmi7GKpS4A==
X-Received: by 2002:a05:6102:3f0d:b0:4df:84d5:543e with SMTP id ada2fe7eead31-4e4240942efmr12132479137.7.1748416465150;
        Wed, 28 May 2025 00:14:25 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87e1efd0ed0sm444185241.7.2025.05.28.00.14.24
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 00:14:24 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4dad6cc2be0so1162589137.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 00:14:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVysNCdX23SSU1fxUsOPRo1XKUi8YpI+IVHrZ4DqhbuDIaEHdDkb9JwYmZtLlEWGIsE8tRCyljUIUdXcTZdCqZ7@lists.infradead.org
X-Received: by 2002:a05:6102:5244:b0:4dd:b82d:e0de with SMTP id
 ada2fe7eead31-4e42415fc45mr12232806137.17.1748416463800; Wed, 28 May 2025
 00:14:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250525160513.83029-1-marek.vasut+renesas@mailbox.org>
 <20250525160513.83029-2-marek.vasut+renesas@mailbox.org> <b7vnm66igh3b3ahyjqhegnbteij3bj2ypxcq6ccwi4i77k3af6@g62yhfervtvt>
In-Reply-To: <b7vnm66igh3b3ahyjqhegnbteij3bj2ypxcq6ccwi4i77k3af6@g62yhfervtvt>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 May 2025 09:14:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU==_1o9LNMWxvChNtvrtvJ0nGb3Kp-uLmCX+Kbv_Ajjw@mail.gmail.com>
X-Gm-Features: AX0GCFtOFIkdeyrU5qOoeF12WCRAZB7wo5Pks_9rfthiicfvECxoWJx-OjXflDE
Message-ID: <CAMuHMdU==_1o9LNMWxvChNtvrtvJ0nGb3Kp-uLmCX+Kbv_Ajjw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a779g3: Describe split PCIe
 clock on V4H Sparrow Hawk
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Bjorn Helgaas <bhelgaas@google.com>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_001429_107285_5A03AD4B 
X-CRM114-Status: GOOD (  31.67  )
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

Hi Mani,

On Wed, 28 May 2025 at 05:50, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
> On Sun, May 25, 2025 at 06:04:04PM +0200, Marek Vasut wrote:
> > The V4H Sparrow Hawk board supplies PCIe controller input clock and PCIe
> > bus clock from separate outputs of Renesas 9FGV0441 clock generator chip.
> > Describe this split bus configuration in the board DT. The topology looks
> > as follows:
> >
> >  ____________                    _____________
> > | R-Car PCIe |                  | PCIe device |
> > |            |                  |             |
> > |    PCIe RX<|==================|>PCIe TX     |
> > |    PCIe TX<|==================|>PCIe RX     |
> > |            |                  |             |
> > |   PCIe CLK<|======..  ..======|>PCIe CLK    |
> > '------------'      ||  ||      '-------------'
> >                     ||  ||
> >  ____________       ||  ||
> > |  9FGV0441  |      ||  ||
> > |            |      ||  ||
> > |   CLK DIF0<|======''  ||
> > |   CLK DIF1<|==========''
> > |   CLK DIF2<|
> > |   CLK DIF3<|
> > '------------'
> >
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > ---
> > Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> > Cc: Bjorn Helgaas <bhelgaas@google.com>
> > Cc: Conor Dooley <conor+dt@kernel.org>
> > Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > Cc: Magnus Damm <magnus.damm@gmail.com>
> > Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-pci@vger.kernel.org
> > Cc: linux-renesas-soc@vger.kernel.org
> > ---
> >  .../dts/renesas/r8a779g3-sparrow-hawk.dts     | 45 ++++++++++++++++++-
> >  1 file changed, 43 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
> > index b8698e07add56..7c050a56290fd 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
> > +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
> > @@ -130,6 +130,13 @@ mini_dp_con_in: endpoint {
> >               };
> >       };
> >
> > +     /* Page 26 / PCIe.0/1 CLK */
> > +     pcie_refclk: clk-x8 {
> > +             compatible = "fixed-clock";
> > +             #clock-cells = <0>;
> > +             clock-frequency = <25000000>;
> > +     };
> > +
> >       reg_1p2v: regulator-1p2v {
> >               compatible = "regulator-fixed";
> >               regulator-name = "fixed-1.2V";
> > @@ -404,6 +411,14 @@ i2c0_mux2: i2c@2 {
> >                       reg = <2>;
> >                       #address-cells = <1>;
> >                       #size-cells = <0>;
> > +
> > +                     /* Page 26 / PCIe.0/1 CLK */
> > +                     pcie_clk: clk@68 {
> > +                             compatible = "renesas,9fgv0441";
> > +                             reg = <0x68>;
> > +                             clocks = <&pcie_refclk>;
> > +                             #clock-cells = <1>;
> > +                     };
> >               };
> >
> >               i2c0_mux3: i2c@3 {
> > @@ -487,24 +502,50 @@ msiof1_snd_endpoint: endpoint {
> >
> >  /* Page 26 / 2230 Key M M.2 */
> >  &pcie0_clkref {
> > -     clock-frequency = <100000000>;
> > +     status = "disabled";
> >  };
> >
> >  &pciec0 {
> > +     clocks = <&cpg CPG_MOD 624>, <&pcie_clk 0>;
> >       reset-gpios = <&gpio2 2 GPIO_ACTIVE_LOW>;
> >       status = "okay";
> > +
> > +     /* PCIe bridge, Root Port */
> > +     pci@0,0 {
>
> PCIe bridge mostly is integrated into the SoC itself. So it should be defined
> in the SoC dtsi. Only the vpcie3v3-supply is board specific, so it should live
> in board dts.

... and the clocks property, of course, which is the main subject of this patch.

> > +             #address-cells = <3>;
> > +             #size-cells = <2>;
> > +             reg = <0x0 0x0 0x0 0x0 0x0>;
> > +             compatible = "pciclass,0604";
> > +             device_type = "pci";
> > +             clocks = <&pcie_clk 1>;
> > +             vpcie3v3-supply = <&reg_3p3v>;
> > +             ranges;
> > +     };
> >  };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

