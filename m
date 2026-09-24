Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7069C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 20:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=By8lDe0zRbSRH2Tjyq4lUk7b9NEK0MxBWTfngSfdLV0=; b=k87ovIce0wwxXaaYn57dKoa3ul
	1DxtzDwK0xfCAE/1cJSs9/nVo7rv/vB1UBG630iYceuGBLx6C9V941XlHNDRde0KdcXfpSfl1C5zn
	Ey330XS1WhFXPhUVe/1XrZWJrfHfsayTBzPZCsaeddG5usM2r0GfQqNA1vdWYD226Vml6rohfcl0h
	nXMBRqqZ+qlac0LneO+QQXO7Q9MHMhlD7/rUvNjLUlemBOkA5Yji/Jg1D+tlRXMDpAPWOJ8Ins/iD
	pFiFMZCzynNxFeAXrUZaiWkwW2qOQw71oUrtTtGStIsTc01sOLzlr9TeUkSYpacNftT4buTgKcbom
	aGSULQTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9psG-0000000C7h8-1pia;
	Thu, 24 Sep 2026 20:16:56 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9psD-0000000C7gY-2rYH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 20:16:55 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2d747f0135fso993835ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 13:16:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790281012; cv=none;
        d=google.com; s=arc-20260327;
        b=etX868qw4BOfA27jsoAUofRqveyV7OxJArFbHIEdzstCaGBs1q0iBuKvqdFQHkUHWb
         6AbGy28eKOFyViYoXs9duRymH9Dku7meq5nWf6NsilIcoddc4mXOpXTiiTckthN7UqKj
         Yy3l8uPaox7T/qAYDq6uxvLS348VSoNYPQBk3tqYmodPhDaVOwVvfjqzt2bqpD1xPSCz
         E/KjjhHHvfgJ3dCar2ZbIWQ4LWd7BlDNRSEhBx9PVX95B+pPC/YwXf0wL+eMAB9LzsCh
         x96Hal/Reym4IXobhKSUvORK9nYkvF+WkcktjbdMtG8v8J+M9UCRkGfwqVbyRVA8A5oC
         25zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=By8lDe0zRbSRH2Tjyq4lUk7b9NEK0MxBWTfngSfdLV0=;
        fh=jrjjlXXKhqt+gXquOfT1oxLDs3A800mEo3ZOGKIH9ho=;
        b=T62ISzi3txtvurkuwQQ552cqii19JdHmJ+jjEEC3En4SV/sq3yHFu3gqEJHp+gVcde
         Fh4P1KgvI+ylL/o2i1CeuQrCw/P2ae6G7H6qvfKtTItC1ohL9LxGXXeTe+ZrXAJsf14z
         B/ItIbBHaugH6ewmlPAlR/dd/oko4IX1UpDQoTWy0El89GUjYBRCb3aXBVdrGNSeZgVz
         BgqtBDl0J8KF66TTLdChHXuvlvB9qMQfswcbXFqAYEJ652xzBFyPGgDyLlsVhS1oxFVn
         aEvD7M1A/PDProF/xP6gtq1ACwrfHSQhaLQMxnrwQ49a4XyAV92ACnLT3EHIK/u5NpdX
         egzw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790281012; x=1790885812; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=By8lDe0zRbSRH2Tjyq4lUk7b9NEK0MxBWTfngSfdLV0=;
        b=Frz7ohzw8D+m0EqXC4XlsxOuuJTE4nUmR6afRCyBGwbsXlBRD9/98xE7BLTUSAIvLF
         Cay30UuHgXOT6KG1DkdFj3WbqeftQC3D68FueHt4I3mM8PMWwWK1Q03nbZuOGCXEqibU
         Balo8wiOiJxoXL9NpDrGka4Bt8FjNAsYUcOHc6Vi5Gy2S7aH9J2zGCI+Q7iPueYhAF7j
         PU2s0cV8hw+nTibt8fpA0MEx0tMkatJIxDwI51w7Hm3ItjfygzEr6wYgaQd5NdbCDGN0
         MNXPf8AHnnAb0GLLvwCS5uF7lbwSyk16M5NxmaplavDJk+JmloGR6hRRRvDJfPTurStx
         2w/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790281012; x=1790885812;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=By8lDe0zRbSRH2Tjyq4lUk7b9NEK0MxBWTfngSfdLV0=;
        b=XfCRz6KlUcBmqmBpSIjauP58CUyRKfgugurzgK76Lg9JSxohO5uAAReCxEbqbAfjPT
         VuxQTF9WwqlO09kn8mAcUEVw1QZJPNmIhvpcoGifZDBTuzyPpePLy1GnCydympVsFr5q
         V4it8LYgBiBpTH544vFfsJ3U491A1TyFGoi9DkSfNThurctEwz5nKRE3D6vmItX38e65
         iIl631ywo2/glabgGqjY9vWAaOEob1mxQ5Zf2eQRKKZEwvqiv8ENMdcs+xkEZJu5B0vJ
         0AdliwJLXJUjnhRHjlNoiVghQjq+KDODCNAW62nlrHfh34H+2pZWMHnUboKPZoi2Usfu
         p91w==
X-Forwarded-Encrypted: i=1; AKwUvBzJNTyfHjrNCMHshyxK8W+lWKAiRqmBmR6PyWe9CD5GxflmhsCRCCnWqniP9/y/LhReuKj1neZdtWMf9j4uRdyV@lists.infradead.org
X-Gm-Message-State: AFuF++mbTG7DmXbWaCsleHXtqSPBeyCbwYYYHFbgSS3DfivIUqBIgbUb
	XYkI8Py1LdolF0bNzn5AfOpiWBR6ErFXGQ+kFoJqDQ9tkh/qKVpvr8KDZnt10UuQwfLQEKF/vW+
	J6July69nldRWPHPCsdk9NhuChacq+l8=
X-Gm-Gg: AYBFou01OIWqffSfyKi74ZbbxSDDSGOC/5NJI1FmujRW28ZVa14IpB/zoJsMRFzaqUb
	YfUAefe589ItidxTP+NNJCp1Sj9Qs14ANNkK/yr91Y0dli8AssR8g65hhzwWlq8MSpZ0cUFVxSy
	xHq5Q20u4jS4pC/lAoSVRxT2TRqq/2EnFWCQM+sfxRjcCpnaDb+fg3cmiCDbhrnR0wKcD/sjink
	3zI3YXXx+KKZrabjW6gEDJQ5D6cFnTICbPcVq3v0EEAqMlIBNAWL/hYA+WyBnl9V4pJC2BzKYT3
	CaER17Ks495/EKA0hkNtbtBW6p5En++MnNNdKXuWZOPPqiCc6d5YjuxJzTiCFfLQ/WZ8h38=
X-Received: by 2002:a17:903:22cb:b0:2dd:c100:943d with SMTP id
 d9443c01a7336-2df7e6632cemr33132005ad.59.1790281012320; Thu, 24 Sep 2026
 13:16:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260923201701.43391-1-pmazzini@gmail.com> <20260923201701.43391-3-pmazzini@gmail.com>
 <30c42b73-204d-4531-bd1a-1ee160a4b000@arm.com>
In-Reply-To: <30c42b73-204d-4531-bd1a-1ee160a4b000@arm.com>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Thu, 24 Sep 2026 21:16:17 +0100
X-Gm-Features: AclHuK9Ix7omORkFeC8AEjcG9VWZQpvYqS7tGdczHTc-lHozfzxFcTWbaDF7Pzg
Message-ID: <CAAxh=ju7+vQ=_opueqK-3Fe-qj9_OJiVunBWDmdmxk86dRqWxw@mail.gmail.com>
Subject: Re: [PATCH v1 03/11] dt-bindings: pinctrl: add Allwinner B288 pin controller
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_131653_762882_F6C26088 
X-CRM114-Status: GOOD (  22.78  )
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

Hi Andre,

> Can't you just add the new compatible string to the existing
> allwinner,sun4i-a10-pinctrl.yaml binding?

Done for v2.

Thanks,
Pablo


On Thu, Sep 24, 2026 at 10:07=E2=80=AFAM Andre Przywara <andre.przywara@arm=
.com> wrote:
>
> Hi Pablo,
>
> On 9/23/26 22:16, Pablo Mazzini wrote:
> > One controller at 0x01c20800 with four external interrupt banks.
> >
> > Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> > ---
> >   .../pinctrl/allwinner,sun8i-b288-pinctrl.yaml | 108 +++++++++++++++++=
+
>
> Why is this a new file? Can't you just add the new compatible string to
> the existing allwinner,sun4i-a10-pinctrl.yaml binding?
>
> Cheers,
> Andre
>
> P.S. Since we have seen this a lot lately: please wait with a new
> version of your series for a few days, to allow other people to comment,
> and to allow discussions to settle down. Not everyone can respond quickly=
.
>
> >   1 file changed, 108 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/pinctrl/allwinne=
r,sun8i-b288-pinctrl.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun8i-=
b288-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun=
8i-b288-pinctrl.yaml
> > new file mode 100644
> > index 000000000000..806da97ab708
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun8i-b288-pi=
nctrl.yaml
> > @@ -0,0 +1,108 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/allwinner,sun8i-b288-pinctr=
l.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Allwinner B288 Pin Controller
> > +
> > +maintainers:
> > +  - Chen-Yu Tsai <wens@csie.org>
> > +  - Jernej Skrabec <jernej.skrabec@gmail.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: allwinner,sun8i-b288-pinctrl
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    description:
> > +      One interrupt per bank of external interrupt capable pins.
> > +    maxItems: 4
> > +
> > +  clocks:
> > +    items:
> > +      - description: Bus Clock
> > +      - description: High Frequency Oscillator
> > +      - description: Low Frequency Oscillator
> > +
> > +  clock-names:
> > +    items:
> > +      - const: apb
> > +      - const: hosc
> > +      - const: losc
> > +
> > +  gpio-controller: true
> > +  interrupt-controller: true
> > +  gpio-line-names: true
> > +
> > +  "#gpio-cells":
> > +    const: 3
> > +
> > +  "#interrupt-cells":
> > +    const: 3
> > +
> > +patternProperties:
> > +  "-pins$":
> > +    type: object
> > +    $ref: /schemas/pinctrl/pincfg-node.yaml#
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      pins: true
> > +      function: true
> > +      bias-pull-up: true
> > +      bias-pull-down: true
> > +      bias-disable: true
> > +      drive-strength:
> > +        enum: [10, 20, 30, 40]
> > +
> > +    required:
> > +      - pins
> > +      - function
> > +
> > +  "^vcc-p[bcdfg]-supply$":
> > +    description:
> > +      Power supplies for pin banks.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - gpio-controller
> > +  - "#gpio-cells"
> > +  - interrupt-controller
> > +  - "#interrupt-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/clock/sun8i-b288-ccu.h>
> > +
> > +    pio: pinctrl@1c20800 {
> > +        compatible =3D "allwinner,sun8i-b288-pinctrl";
> > +        reg =3D <0x01c20800 0x400>;
> > +        interrupts =3D <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
> > +        clocks =3D <&ccu CLK_BUS_PIO>, <&osc24M>, <&osc32k>;
> > +        clock-names =3D "apb", "hosc", "losc";
> > +        gpio-controller;
> > +        #gpio-cells =3D <3>;
> > +        interrupt-controller;
> > +        #interrupt-cells =3D <3>;
> > +
> > +        mmc0_pins: mmc0-pins {
> > +            pins =3D "PF0", "PF1", "PF2", "PF3", "PF4", "PF5";
> > +            function =3D "sdc0";
> > +            drive-strength =3D <30>;
> > +            bias-pull-up;
> > +        };
> > +    };
>

