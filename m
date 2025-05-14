Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AEAFC3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 13:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ORW6eIowOY/CKOKK59kW1VnZw09WfBXRIX1Sk9nHmU8=; b=Hhzz+laWDk/1m9pHS8z/ShMEZg
	UsdM9FJUT6aBfSW6Lcqf0JO235Kd1XgSPsH83MG+VmStj9p6kSlWZMtSQ9qZ/jZx15EjiSfEKoHYj
	GUHdJfZanvRA/HVO7D9sD2MtjU0Qqtwl/DuqHDSuIcO7hq5gTk+AiZq8lA+j3fz77JdDaxm8yOZPH
	mtPQapTbXR7sT/Rsiyv/0dt835jMXL0ytzj5gCnXmb56m+EUH0dBCiCTpQJtwW6yaj7A5ZpQepMN6
	qawk4+a0iK2Hto6jmSdfEd5qZj1Sf/uzW7PZWT3JJZYtV5Gdlt2Xbn8jOGmEKI6CPwAF7qemRvIbS
	B7+AAXpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFC7d-0000000FC7d-048K;
	Wed, 14 May 2025 13:26:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFB1h-0000000Ezl8-0ul9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 12:15:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 51B0B44E6C
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 12:15:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC40AC4CEF4
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 12:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747224955;
	bh=9n/gNZw600QYUrMnwKTPNOK3/L5E5TG7yt1bw6N/svI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=M1+cQeMWeqFSPExhk2kOfMFngdVAt2HwSd0ZJmBOWDHDUThPSte3saMbGGulfctDJ
	 i/XCbsgPEM4LsgCVmUC9QzhzQykraXRWS/gHvf1/uVlcbZwGzB6oDBhN/92wtzZyDd
	 /IzEFqyUKVDUCcxb/r4PCSBzemRYF614GYWprujtb8M75/CUlHuIg2foxNfqmuCBhb
	 Pqc/HQABYG2NHFKteOho680MSX6ZxrytZJ8l3/9hwFTCbiPKUAN2mtO4OdzcHiTyJs
	 mXsF4vvWGLZZwocs3tqbiwD+xdHdRq93qA9uZctVGww5Zil5HdlvhPb3mzoWavJMoC
	 vLLS3+y0k6rHg==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5fd32c133ccso5245240a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 05:15:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVa0UchA5AbSVK5eLKOBosd85BoepZdoHkkLWrEviM6ECh7whRGhNPRr3RZ+Xyw/D0BeWDKLJ7BZ/2AttlCacsS@lists.infradead.org
X-Gm-Message-State: AOJu0YxqYgwvW0b8PXneSCgjHPwm871liE0ZBI6w5+ISr64A7zAY3yB/
	WJwcv2YwFyKXHFYLaNErtZBQXiLDYmXAy3VjxYCYguppuqWl5c6F+WkUwZEdWOEc48KMOw0vrvc
	vNARnUM7wdKPm+T+yPlBtv4Ng6A==
X-Google-Smtp-Source: AGHT+IFNbUCzY9o57wMu/2S9u0Ncn14dOvkR5s246HZBkwluWFPiNZ8XXqpaD0331VMZ5nRZZ+nBtsn19B0XOLtHKws=
X-Received: by 2002:a17:907:9488:b0:ad2:4fa0:88d1 with SMTP id
 a640c23a62f3a-ad4f70d3335mr289668866b.9.1747224954458; Wed, 14 May 2025
 05:15:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250505144613.1287360-1-robh@kernel.org> <34dcdbd4fb15a988f15e812faa566b32506a2f2f.camel@codeconstruct.com.au>
In-Reply-To: <34dcdbd4fb15a988f15e812faa566b32506a2f2f.camel@codeconstruct.com.au>
From: Rob Herring <robh@kernel.org>
Date: Wed, 14 May 2025 07:15:42 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+8k=7+zV6v4KEws0VNRt5pJYyuSNkNDU=d8neriCcKLQ@mail.gmail.com>
X-Gm-Features: AX0GCFshp9fzygWtFgg9ShuDUbXUnQtrRdwSG1FTt2nCPz1p1tunvy0s6IbfukQ
Message-ID: <CAL_Jsq+8k=7+zV6v4KEws0VNRt5pJYyuSNkNDU=d8neriCcKLQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: interrupt-controller: Convert
 aspeed,ast2xxx-scu-ic to DT schema
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Eddie James <eajames@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Lee Jones <lee@kernel.org>, Andrew Jeffery <andrew@aj.id.au>, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_051557_295328_DA1106CF 
X-CRM114-Status: GOOD (  24.99  )
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

On Tue, May 6, 2025 at 10:26=E2=80=AFPM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> Hi Rob,
>
> Thanks for the conversion. One comment below:
>
> On Mon, 2025-05-05 at 09:46 -0500, Rob Herring (Arm) wrote:
> > Convert the Aspeed SCU interrupt controller binding to schema format.
> > It's a straight-forward conversion of the typical interrupt
> > controller.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> >  .../aspeed,ast2500-scu-ic.yaml                | 48
> > +++++++++++++++++++
> >  .../aspeed,ast2xxx-scu-ic.txt                 | 23 ---------
> >  .../bindings/mfd/aspeed,ast2x00-scu.yaml      |  9 +++-
> >  MAINTAINERS                                   |  2 +-
> >  4 files changed, 57 insertions(+), 25 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/interrupt-
> > controller/aspeed,ast2500-scu-ic.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/interrupt-
> > controller/aspeed,ast2xxx-scu-ic.txt
> >
> > diff --git a/Documentation/devicetree/bindings/interrupt-
> > controller/aspeed,ast2500-scu-ic.yaml
> > b/Documentation/devicetree/bindings/interrupt-
> > controller/aspeed,ast2500-scu-ic.yaml
> > new file mode 100644
> > index 000000000000..d5287a2bf866
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/interrupt-
> > controller/aspeed,ast2500-scu-ic.yaml
> > @@ -0,0 +1,48 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +# Copyright 2025 Eddie James
> > +%YAML 1.2
> > +---
> > +$id:
> > http://devicetree.org/schemas/interrupt-controller/aspeed,ast2500-scu-i=
c.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Aspeed AST25XX and AST26XX SCU Interrupt Controller
> > +
> > +maintainers:
> > +  - Eddie James <eajames@linux.ibm.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - aspeed,ast2500-scu-ic
> > +      - aspeed,ast2600-scu-ic0
> > +      - aspeed,ast2600-scu-ic1
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  '#interrupt-cells':
> > +    const: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  interrupt-controller: true
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - '#interrupt-cells'
> > +  - interrupts
> > +  - interrupt-controller
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    interrupt-controller@18 {
> > +        compatible =3D "aspeed,ast2500-scu-ic";
> > +        reg =3D <0x18 0x4>;
> > +        #interrupt-cells =3D <1>;
> > +        interrupts =3D <21>;
> > +        interrupt-controller;
> > +    };
> > diff --git a/Documentation/devicetree/bindings/interrupt-
> > controller/aspeed,ast2xxx-scu-ic.txt
> > b/Documentation/devicetree/bindings/interrupt-
> > controller/aspeed,ast2xxx-scu-ic.txt
> > deleted file mode 100644
> > index 251ed44171db..000000000000
> > --- a/Documentation/devicetree/bindings/interrupt-
> > controller/aspeed,ast2xxx-scu-ic.txt
> > +++ /dev/null
> > @@ -1,23 +0,0 @@
> > -Aspeed AST25XX and AST26XX SCU Interrupt Controller
> > -
> > -Required Properties:
> > - - #interrupt-cells            : must be 1
> > - - compatible                  : must be "aspeed,ast2500-scu-ic",
> > -                                 "aspeed,ast2600-scu-ic0" or
> > -                                 "aspeed,ast2600-scu-ic1"
> > - - interrupts                  : interrupt from the parent
> > controller
> > - - interrupt-controller                : indicates that the
> > controller receives and
> > -                                 fires new interrupts for child
> > busses
> > -
> > -Example:
> > -
> > -    syscon@1e6e2000 {
> > -        ranges =3D <0 0x1e6e2000 0x1a8>;
> > -
> > -        scu_ic: interrupt-controller@18 {
> > -            #interrupt-cells =3D <1>;
> > -            compatible =3D "aspeed,ast2500-scu-ic";
> > -            interrupts =3D <21>;
> > -            interrupt-controller;
> > -        };
> > -    };
> > diff --git a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-
> > scu.yaml b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-
> > scu.yaml
> > index c800d5e53b65..12986ebe7ec7 100644
> > --- a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
> > @@ -48,8 +48,15 @@ properties:
> >
> >  patternProperties:
> >    '^p2a-control@[0-9a-f]+$':
> > -    description: See Documentation/devicetree/bindings/misc/aspeed-
> > p2a-ctrl.txt
> >      type: object
> > +    additionalProperties: true
> > +    properties:
> > +      compatible:
> > +        contains:
> > +          enum:
> > +            - aspeed,ast2500-scu-ic
> > +            - aspeed,ast2600-scu-ic0
> > +            - aspeed,ast2600-scu-ic1
>
> This change should be done on the interrupt-controller pattern property
> node rather than the p2a-controller node.

Indeed, I fixed it up when applying.


Rob

