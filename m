Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 045DCE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 07:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q+UcOE3NbQ9slLhfP+gmnwjLdrB9FRRmf5lPYamPvI8=; b=Lh6UM28QKmgCpn
	DOwPu96l834fL36XlRq084eknWHOfe9+NWvSIYRWMQvJ+AztIXA92yJGerWjpFgfO+BMTc3FlQWxf
	fBGY50MiGpDCM+xjXvwaPv1qs8AZQpUPhFsE9aD3JKStClMrw84SwLplNmVu0NBaTlJIlBR0qLhEB
	q1dUV1luasTtnT6Cb147iDFW0rKU97EckvnLJwgRYVoD4Ds5jOpzsiYyS0JyjfUPVqmESR8OpK7hl
	pokWQ7E05bRaj/2GPNiAKnGhA8UI5sMa0edjBf43nYNOZAEnGoqlbu9tYcUfEGqblBwga7j9Hcq+H
	K0bUXlOiiqx+Ry3Ckfqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXax9-00000007e93-32AS;
	Tue, 14 Jan 2025 07:03:07 +0000
Received: from mail-lf1-f41.google.com ([209.85.167.41])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXavs-00000007duO-2DTG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 07:01:51 +0000
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53e3c47434eso4832663e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 23:01:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736838105; x=1737442905;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q+UcOE3NbQ9slLhfP+gmnwjLdrB9FRRmf5lPYamPvI8=;
        b=uQ27hcuysj/X0UTbJRDymRQytFTnQ3Lms3kL8h/xHecCRxQmRPQbDe6wNe9p3/+RbA
         VOBsCTFEZGfB3d9hfKbA8lgYyzTgxrsNDyeAJpfTJ98FMWX+SZLd7c29oZYBDjiuEWns
         +wZZ14BWOJnKrJ42i2tfH7+NZgTuYoADsk4CBueaT1JBzoYOnInnxnAcR1v1YAxZ0wjO
         Aqc5TZIdsSl+K/o7nUjasUuVnwh4g310jiMWwMV5rL86r9z0IrCDLE/HIc0DYYMnzO68
         hzeugo4QBd3B+WQh+JtPPG9RK4ciyWV0LDA1fdluH09zU2Orbc8X77n5OzKXQlkrnFrN
         gI+A==
X-Forwarded-Encrypted: i=1; AJvYcCXe6YOXgQDuXGNxP4a3PaDTrBWl33+zyyY36vQAtyZW+bxf/fUuvqUSFSoG/PrO2aQpufDHQQGIZ1ZuMjm6FJbr@lists.infradead.org
X-Gm-Message-State: AOJu0Ywf05K1XcxA2AlC/vDI+HznFk3tqC85Xtvo1TIzlfdfSr7QrgKh
	mehvR3jryNUiojHL0JHmrp0R8Tx8Pj+3frDuhu98FFl7cuqsNuu/tbP1OGbIU7g=
X-Gm-Gg: ASbGncvs7dWfp2wdPZB8fz/JyY1lAtvAhcXnrh5Ml7ok1ZUCbwpaQRSTd9flJsnk/yj
	rfhdbASCq4BKycVZ6Jd3Ri2W9133Mic/hpjOy0lkRb3frg9/z9fB8U2eRs+/SbpBvcCsRCva35W
	S1DrL/RSYqY0edt2F/m0iEisHOtuTItSAm+p0TM/7MNiWKT3xnxHp/ccVBVIN2L+JXiqtgPQSYL
	SlPBHwPFt0gUmlf/fazABgimjs+27/UtQOdIOqz4wv3El0Av+J3xV/C/uGu8dUbvbCR/M1Q2s6C
	HAY1Iz9a0dnMKg==
X-Google-Smtp-Source: AGHT+IF62JdCLRHQS36CvXjXoz+Rx0JQ/yGW1NeC6LaUxq52vOdCpxhmanVT9OLx4vLDK9mh17X/Qw==
X-Received: by 2002:ac2:51cd:0:b0:542:9987:6e9f with SMTP id 2adb3069b0e04-54299877145mr3283054e87.53.1736838105075;
        Mon, 13 Jan 2025 23:01:45 -0800 (PST)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be540fasm1602552e87.81.2025.01.13.23.01.44
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 23:01:44 -0800 (PST)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30613802a59so27265121fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 23:01:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX1zJl6aysXlJi/4jDPOcacGxgoE7i/5XM1Joqzn9zNAnUhzcrHspiQ0imX0hMKep4sqVLNbxTCpUkaamzlrxd8@lists.infradead.org
X-Received: by 2002:a05:651c:501:b0:2ff:e6fb:b10 with SMTP id
 38308e7fff4ca-305f45db1a9mr82180361fa.26.1736838104539; Mon, 13 Jan 2025
 23:01:44 -0800 (PST)
MIME-Version: 1.0
References: <20241111005750.13071-1-andre.przywara@arm.com>
 <20241111005750.13071-6-andre.przywara@arm.com> <CAGb2v64x_QE8w_4h10waG33xNpkd9QLt_B=xSPMMe0M=6bqsJw@mail.gmail.com>
 <20241120101228.26bbf100@donnerap.manchester.arm.com>
In-Reply-To: <20241120101228.26bbf100@donnerap.manchester.arm.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 14 Jan 2025 15:01:31 +0800
X-Gmail-Original-Message-ID: <CAGb2v663LeDtk1ZGOAztQ+Sx5OtbSx+xkLgypZYRjXkAr6_GRA@mail.gmail.com>
X-Gm-Features: AbW1kvY5ioH0ofguoIZCmg867-6-rz1ALLpjN9guXZRF83auvJZgI7_L4pl8dSY
Message-ID: <CAGb2v663LeDtk1ZGOAztQ+Sx5OtbSx+xkLgypZYRjXkAr6_GRA@mail.gmail.com>
Subject: Re: [PATCH 5/7] dt-bindings: pinctrl: add compatible for Allwinner A523/T527
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_230148_568290_E441439D 
X-CRM114-Status: GOOD (  35.78  )
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

On Wed, Nov 20, 2024 at 6:12=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> On Wed, 13 Nov 2024 16:50:19 +0800
> Chen-Yu Tsai <wens@csie.org> wrote:
>
> Hi Chen-Yu,
>
> sorry for the late reply, I was away for a week.
>
> > On Mon, Nov 11, 2024 at 8:58=E2=80=AFAM Andre Przywara <andre.przywara@=
arm.com> wrote:
> > >
> > > The A523 contains a pin controller similar to previous SoCs, although
> > > using 10 GPIO banks (PortB-PortK), all of them being IRQ capable.
> > > This introduces a new style of binding, where the pinmux values for e=
ach
> > > pin group is stored in the new "allwinner,pinmux" property in the DT
> > > node, instead of requiring every driver to store a mapping between th=
e
> > > function names and the required pinmux.
> > >
> > > Add the new name to the list of compatible strings, and required it t=
o
> > > have 10 interrupts described. Also add the new pinmux property.
> > >
> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > ---
> > >  .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  | 23 +++++++++++++++++=
--
> > >  1 file changed, 21 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4=
i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,su=
n4i-a10-pinctrl.yaml
> > > index 4502405703145..6fc18e92e1e94 100644
> > > --- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-p=
inctrl.yaml
> > > +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-p=
inctrl.yaml
> > > @@ -56,6 +56,8 @@ properties:
> > >        - allwinner,sun50i-h6-r-pinctrl
> > >        - allwinner,sun50i-h616-pinctrl
> > >        - allwinner,sun50i-h616-r-pinctrl
> > > +      - allwinner,sun55i-a523-pinctrl
> > > +      - allwinner,sun55i-a523-r-pinctrl
> > >        - allwinner,suniv-f1c100s-pinctrl
> > >        - nextthing,gr8-pinctrl
> > >
> > > @@ -64,7 +66,7 @@ properties:
> > >
> > >    interrupts:
> > >      minItems: 1
> > > -    maxItems: 8
> > > +    maxItems: 10
> > >      description:
> > >        One interrupt per external interrupt bank supported on the
> > >        controller, sorted by bank number ascending order.
> > > @@ -119,13 +121,17 @@ patternProperties:
> > >          $ref: /schemas/types.yaml#/definitions/uint32
> > >          enum: [10, 20, 30, 40]
> > >
> > > +      allwinner,pinmux:
> > > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > > +        description: pinmux selector for each pin
> > > +
> >
> > Why not just the standard "pinmux" property, as given in
> > Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml
>
> I had it like this in my last post two years ago, but learned from
> LinusW [1] that the generic pinmux property has a slightly different
> meaning, and abusing it for just the pinmux index values would not match
> the generic definition.
> We *could* use the generic definition, but then this would include what's
> in the "pins" property, like I sketched out in the cover letter, as an
> alternative to this approach:
>         pinmux =3D <SUNXI_PIN(PB, 9, 2)>, <SUNXI_PIN(PB, 10, 2)>;
> Where the SUNXI_PIN macro would combine the pin number and the pinmux int=
o
> one 32-bit cell. See the Apple GPIO DT nodes for an example.
> This looks indeed nicer, but requires quite some rewrite of the existing
> pinctrl driver, AFAICS.

Sorry for taking so long to get back to this.

Could we maybe add a generic replacement of the existing "function"
property, which takes a string? Like "function-id" or "function-selector"
that takes u32 (or u8). Then it could be one or the other. Not sure
if the binding maintainers would accept this or not.

I understand that we probably don't want the mux value combined with
the pin number.

ChenYu

> [1] Previous reply from LinusW:
> https://lore.kernel.org/linux-sunxi/CACRpkdbMc-Q6wjgsiddu6-tWC1dt2uFk+4Ly=
erMdgFk2KRGK4w@mail.gmail.com/
>
> >
> > >      required:
> > >        - pins
> > >        - function
> >
> > This section should be made to apply only to the existing
> > compatibles? Maybe we could just split the files and have
> > a clean slate for sun55i?
>
> Yeah, I couldn't find a good example how to make it *required* for one
> compatible and *not allowed* for all the others. But creating a whole new
> file is actually a good idea, as this also avoids adding another case to
> the already quite indented if-else cascade.
>
> Cheers,
> Andre
>
> > ChenYu
> >
> > >      additionalProperties: false
> > >
> > > -  "^vcc-p[a-ilm]-supply$":
> > > +  "^vcc-p[a-klm]-supply$":
> > >      description:
> > >        Power supplies for pin banks.
> > >
> > > @@ -156,6 +162,17 @@ allOf:
> > >          - interrupts
> > >          - interrupt-controller
> > >
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          enum:
> > > +            - allwinner,sun55i-a523-pinctrl
> > > +
> > > +    then:
> > > +      properties:
> > > +        interrupts:
> > > +          minItems: 10
> > > +
> > >    - if:
> > >        properties:
> > >          compatible:
> > > @@ -166,6 +183,7 @@ allOf:
> > >        properties:
> > >          interrupts:
> > >            minItems: 8
> > > +          maxItems: 8
> > >
> > >    - if:
> > >        properties:
> > > @@ -244,6 +262,7 @@ allOf:
> > >              - allwinner,sun8i-v3s-pinctrl
> > >              - allwinner,sun9i-a80-r-pinctrl
> > >              - allwinner,sun50i-h6-r-pinctrl
> > > +            - allwinner,sun55i-a523-r-pinctrl
> > >
> > >      then:
> > >        properties:
> > > --
> > > 2.46.2
> > >
>

