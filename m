Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C19BFD4336D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 14:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aiuuQGCaJR6L9rbp4LJqZfhMxwW+RQ/d7RNS/+rBXDw=; b=1hw7kd4LvQKnAXYpJGW5rt+6R5
	TDpG500vaWmi2WEv2G8v4b/UoxnETAQZr9sEkvSWTtjiona5iDB+5qcoM7FHJSY6ScCOk19Z/G3ww
	omzQ3p9TKgRl0VOhEIGX9uiZZseiW9rOEeUmJoTDmjwJksPjomVkHSaIFK2QR9Un/ipgkYhZLYVr+
	yDS2j5SDTFyAe6D8WQsnG610TrnVSKznjZSqVEXb2Hh943b50bg7ED0PgEKYULZX6Z9zmV3iGaXeO
	owtphJd8z8TigRycXFFdiVYOtUW3r0rT72QOB4ITISjdWud9gedDIFS0K2GZZwmAffXkO7JKTn0rh
	v6YOSGVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t93yp-00000007MbP-3Xxr;
	Thu, 07 Nov 2024 14:59:27 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t93wz-00000007M9i-37zU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 14:57:35 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-6ea5f68e17aso11139037b3.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 06:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1730991452; x=1731596252; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aiuuQGCaJR6L9rbp4LJqZfhMxwW+RQ/d7RNS/+rBXDw=;
        b=WM+FrresJcBPx6faqr3O8WnTHjG9sCClbt53AdCOTAeobbx0ED3LjJ51Qsq+sZOABa
         wpgDzda0cLm5ovu1tV22coEWlSDZF26E7jZf3JVxGIJh3k7meilZzUO/OoplRA1JNMsc
         gm8GhIT3Rd9ByVCbnJINm3isYF9wGbpJqutrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730991452; x=1731596252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aiuuQGCaJR6L9rbp4LJqZfhMxwW+RQ/d7RNS/+rBXDw=;
        b=mmrC2O8onpxT4tpBlbyeZptvFqt/S7APZyjgRGMEMOlLAlcOmkK1tC5i2S1JD7wJZN
         ji7nsFMLwAMPHawze5oYKqyxI4SjxZRJJDBBHJVn81hTSc0CD5FDLAMsY2h6hLOFp8pJ
         4FJnLWK8f7qzNMPj+y6sciq3GqL+qqdttlVVz96D3t8pW+EMwTnM2n1soZa0nquqpMHH
         IQ+drQxpcqU8L7372WsVNshmxqBtgjORiQWlD7e2Kpqrf/Ps3tSKHY/+ByyXvYai/vFS
         e/tSDTldyQwGQ8EFYYmuNi/POxzcYATn4b3MOZhx45CMIaIKrLwnn4FEwgK9m8hC7Or7
         nfng==
X-Forwarded-Encrypted: i=1; AJvYcCVqKEa+mSXl+zpCjMKqIrKtq5IgeXyrEBoVbVK7d+HRuJLBs/M0hj59zG3nJWz9v8PVPrY6rGgVc9CvaGqaaG6V@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/z6RKKhkuClqw3vN1n/dy8OBSP4D5B1zMPtxcwVRkSF3y/zRN
	n3RZUhroChXmr6dri6GKIcjP9Z77fp8kUgEU636qgrzwcyY5jIbPqLgyXXGtVXOUbyFuIbm74fC
	upgHfPF6xKrJf7Z3XIZ0hdqFWadS9XDejROH9zQ==
X-Google-Smtp-Source: AGHT+IF8agBg7laXxANgHAvwKG8a08ww2rsq+nqLU8LlqFlymOUM9EIrlz0DftKlezAxcI5XDK1DcyZtsOZ0bmNH4oE=
X-Received: by 2002:a05:690c:4b09:b0:6e3:b6c:d114 with SMTP id
 00721157ae682-6e9d8ad309bmr466023927b3.38.1730991452024; Thu, 07 Nov 2024
 06:57:32 -0800 (PST)
MIME-Version: 1.0
References: <20241106090549.3684963-1-dario.binacchi@amarulasolutions.com>
 <20241106090549.3684963-2-dario.binacchi@amarulasolutions.com>
 <4bix7me5vaoyhcuffyp4btajmhy7no6ltczoesopaz2fqupyaw@fensx4nn472u> <b7c1499b-8337-421c-9734-6e518d678ff8@kernel.org>
In-Reply-To: <b7c1499b-8337-421c-9734-6e518d678ff8@kernel.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 7 Nov 2024 15:57:21 +0100
Message-ID: <CABGWkvrYJL9=zrPSFuEAgKO+9gDHD6RmCJM6Br6Le_eh578ETQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: clock: imx8m-clock: support spread
 spectrum clocking
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_065733_872981_F8390E10 
X-CRM114-Status: GOOD (  36.89  )
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

Hello Krzysztof,

On Wed, Nov 6, 2024 at 3:13=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 06/11/2024 15:10, Krzysztof Kozlowski wrote:
> > On Wed, Nov 06, 2024 at 09:57:57AM +0100, Dario Binacchi wrote:
> >> The patch adds the DT bindings for enabling and tuning spread spectrum
> >> clocking generation.
> >
> > We had long talks about this but nothing of it got reflected in commit
> > msg. Sorry, I don't remember what I was talking in some particular patc=
h
> > month ago, so you will get the same questions over and over...
> >
> >>
> >> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >>
> >> ---
> >>
> >> Changes in v3:
> >> - Added in v3
> >> - The dt-bindings have been moved from fsl,imx8m-anatop.yaml to
> >>   imx8m-clock.yaml. The anatop device (fsl,imx8m-anatop.yaml) is
> >>   indeed more or less a syscon, so it represents a memory area
> >>   accessible by ccm (imx8m-clock.yaml) to setup the PLLs.
> >>
> >>  .../bindings/clock/imx8m-clock.yaml           | 46 ++++++++++++++++++=
+
> >>  1 file changed, 46 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml =
b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> >> index c643d4a81478..7920393e518e 100644
> >> --- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> >> +++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> >> @@ -43,6 +43,40 @@ properties:
> >>        ID in its "clocks" phandle cell. See include/dt-bindings/clock/=
imx8m-clock.h
> >>        for the full list of i.MX8M clock IDs.
> >>
> >> +  fsl,ssc-clocks:
> >> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> >> +    description:
> >> +      Phandles of the PLL with spread spectrum generation hardware ca=
pability.
> >> +    minItems: 1
> >> +    maxItems: 4
> >
> > 1. How is it possible that you change spread spectrum of some clocks fr=
om
> > main Clock Controller, while this device is not a consumer of them?
> > Basically this means that this device does not have these clocks but ye=
t
> > you claim that it needs to configure spread for them! It's contradictor=
y
> > to me and nohing got explained in commit msg about it. I am pretty sure
> > I asked about this alrady.
>
> I digged my previous answer and it was pretty clear here:
>
> 18:44 <krzk> You can, but I still have the same concerns. How this
> device - which does not take any clock input, has no clocks at all - can
> depend on spread spectrum of some PLLs? Thsi device does not have clocks.
> 18:50 <krzk> device has no clocks, I checked now third time
> 18:50 <krzk> If device has clocks, it must have clocks property
>

The device where the spread spectrum properties are to be set already
contains "clocks" properties:

clk: clock-controller@30380000 {
    compatible =3D "fsl,imx8mn-ccm";
    reg =3D <0x30380000 0x10000>;
    interrupts =3D <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
                       <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
    #clock-cells =3D <1>;
    clocks =3D <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
                  <&clk_ext3>, <&clk_ext4>;
    clock-names =3D "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
                             "clk_ext3", "clk_ext4";
    assigned-clocks =3D <&clk IMX8MN_CLK_A53_SRC>,
                                  <&clk IMX8MN_CLK_A53_CORE>,
                                  <&clk IMX8MN_CLK_NOC>,
                                  <&clk IMX8MN_CLK_AUDIO_AHB>,
                                  <&clk IMX8MN_CLK_IPG_AUDIO_ROOT>,
                                  <&clk IMX8MN_SYS_PLL3>,
                                  <&clk IMX8MN_AUDIO_PLL1>,
                                  <&clk IMX8MN_AUDIO_PLL2>;
    assigned-clock-parents =3D <&clk IMX8MN_SYS_PLL1_800M>,
                                             <&clk IMX8MN_ARM_PLL_OUT>,
                                             <&clk IMX8MN_SYS_PLL3_OUT>,
                                             <&clk IMX8MN_SYS_PLL1_800M>;
    assigned-clock-rates =3D <0>, <0>, <0>,
                                         <400000000>,
                                         <400000000>,
                                         <600000000>,
                                         <393216000>,
                                         <361267200>;
};

The spread spectrum is not configurable on these clocks or, more
generally, may not be
configurable (only 4 PLLs have this capability). Therefore, I need the
"fsl,ssc-clocks"
property to list the PLLs on which I want to enable and configure
spread spectrum.

Furthermore, spread spectrum cannot be considered a new device but
rather a property
available only for some of the clocks managed by the clock controller
manager (CCM).

Thanks and regards,
Dario

> So again, you do not need this property at all. I repeated it multiple
> times - you are supposed to use clocks property.
>
> >
> > 2. Why is this array flexible in size?
> >
> > Best regards,
> > Krzysztof
> >
>
> Best regards,
> Krzysztof
>


--

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com

