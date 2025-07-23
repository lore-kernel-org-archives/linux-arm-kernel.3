Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41154C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 06:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/L2T2WbrDBkOj5NgHEVZycr71r0FjGHDnI1AHP29ZlA=; b=VBYsdXAdzso7OEfHcsn38TIjrs
	BrNeQ5J8XW0nwcW4tWJSsTx/d0RyuMPBMHgaksClWIgenVfD5etKPnfPs4abylZRksEVt3AC3iPzS
	AXHFYG38hUyxHN0vYTNyVyxAHpvlzcgzUjMhAw2Kp4zeNeMAXyuaoR9uZKt7LuZ1xMM+KOlSQPs9O
	01TFF7s86y6jzKpSGevNa1YHHo5d79hgfb9qgEMSIDwWXNVNNPI0dRy6U2DLOLNXWu2xaAjtNwxZi
	IYEdHjDYjIGp42Q+i1p32aOhNqOlJP8SfKtO+eeor/u4BjuPRkK56RhLYDn8jMXXK08PAOd2fVDbG
	9baEzUdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueSp5-000000047Yg-0CYL;
	Wed, 23 Jul 2025 06:19:27 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueSkF-0000000470l-3mIQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 06:14:29 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-e8d707b9bc2so4847289276.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 23:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1753251267; x=1753856067; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/L2T2WbrDBkOj5NgHEVZycr71r0FjGHDnI1AHP29ZlA=;
        b=qMCz+tW/1ZNORppKGMwVNnLW8ATuiE4qMQet5OEgIE10TB699Ar2mqrobT0gk5521b
         /4z75PhHRX7RtjEjinnmJp0r+wt24GwF49Rm/A/0WAtjIS/06ZPiF00Ax40sBbw/P5tw
         BUkxxyCPQbbG2i+V5wA7lXTH1DhRSDua9OO3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753251267; x=1753856067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/L2T2WbrDBkOj5NgHEVZycr71r0FjGHDnI1AHP29ZlA=;
        b=XQaQeOwQS7BVmRW3jECdyRj9tV8Y2gQ2hkuB/BbkSJY9AvePnoqgPd4OXkFhY2lJ0g
         YbJbrZ8lS5dspVAxw3uaSzi0TNEI54HogQJK0TZD3cive+oaaao0Tn6c5ihs65uggagj
         o6mjzTNMT7pkXPAK2L3ZG7GsocEnTWAhINRbJzw/MMWavo1JgPQjdn8IIfpCcR8mZ4Yx
         gjyQdXaihe6x3jYH80+ya/ewG00LC5jrz4kTSY9bDJSOWa2sqefKnAIazDCS4jhQomaX
         nTGL9VTggxmPIMvAuGKdok+5qsN2UFGgwEqCO4LOPchWabvo1WGJRLsHk6eVED+Ci1lQ
         vZ5A==
X-Forwarded-Encrypted: i=1; AJvYcCVBjoshhKXip1QnlpgY9u+8Gm2NAft5zpnV42W+LQxhtAYmb3qgVUNDG+IPfl8Fr32Pj0zXdSZpSFMoYw/qOYov@lists.infradead.org
X-Gm-Message-State: AOJu0YyN6XS2SwIVZOEq5I+bEP/xrUKjYfVLDH8RomYE00N77TrvD4vI
	9IqYWtrBvTVpn2dwb87/Wn/G431yaLXQVudmibr7w7LkdgSk+Qq8EFyVNRrwpbrMOPIuiNy1oiS
	7CvU1JaTPo0u62AVhQJYoiRF6+WD5ZBatT4Vih1n13g==
X-Gm-Gg: ASbGnctXOBP8+YFQZY9gC8PPOj3TOeQccA+IY301+tBAMu+7cX8iotOH0vgi96ULRvH
	4h9wwy7oR12phsrBnSx0wpwQ98E7ChG6Lsh3Q/RvGgInsraf3PfxVFvzxKt6sQPaEEP1GzOpz0K
	AiaSglaQ0uREIIAp6nRC+BexCXX1lC8IVlOF7Ig3j0MueD7qXZfIkW0F18hJR9q/VzJVBqKAoFT
	Vjrog==
X-Google-Smtp-Source: AGHT+IGU0x3OvvND31qkZ6iwUV66X3FjLoR9rEUgX0VQD3a1aWSZZ/aNnjUtca65XDKxhVdatJlHhz31Mn+Kuu8/LA0=
X-Received: by 2002:a05:6902:460a:b0:e8d:718f:cffa with SMTP id
 3f1490d57ef6-e8dc57ce7c6mr2095334276.6.1753251266610; Tue, 22 Jul 2025
 23:14:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250722103706.3440777-1-dario.binacchi@amarulasolutions.com>
 <20250722103706.3440777-3-dario.binacchi@amarulasolutions.com> <DU0PR04MB94966B1D445966C0E7C1BDF2905FA@DU0PR04MB9496.eurprd04.prod.outlook.com>
In-Reply-To: <DU0PR04MB94966B1D445966C0E7C1BDF2905FA@DU0PR04MB9496.eurprd04.prod.outlook.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 23 Jul 2025 08:14:15 +0200
X-Gm-Features: Ac12FXz0WI4bR7Hq_kkcybVAzkogiCFRyLtm4ogxkiM3lU26r-r_CiasJXOihmg
Message-ID: <CABGWkvpDY99-0FKi2VO+Pa4hSoEfFCAt7ZAgaVfeqqCqcOYWrA@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: input: touchscreen: fsl,imx6ul-tsc: add fsl,glitch-threshold
To: Bough Chen <haibo.chen@nxp.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-amarula@amarulasolutions.com" <linux-amarula@amarulasolutions.com>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_231427_951575_9120700B 
X-CRM114-Status: GOOD (  25.59  )
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

Hi Bough,

On Wed, Jul 23, 2025 at 4:45=E2=80=AFAM Bough Chen <haibo.chen@nxp.com> wro=
te:
>
> > -----Original Message-----
> > From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > Sent: 2025=E5=B9=B47=E6=9C=8822=E6=97=A5 18:36
> > To: linux-kernel@vger.kernel.org
> > Cc: linux-amarula@amarulasolutions.com; Dario Binacchi
> > <dario.binacchi@amarulasolutions.com>; Conor Dooley
> > <conor+dt@kernel.org>; Dmitry Torokhov <dmitry.torokhov@gmail.com>;
> > Fabio Estevam <festevam@gmail.com>; Bough Chen <haibo.chen@nxp.com>;
> > Krzysztof Kozlowski <krzk+dt@kernel.org>; Pengutronix Kernel Team
> > <kernel@pengutronix.de>; Rob Herring <robh@kernel.org>; Sascha Hauer
> > <s.hauer@pengutronix.de>; Shawn Guo <shawnguo@kernel.org>;
> > devicetree@vger.kernel.org; imx@lists.linux.dev;
> > linux-arm-kernel@lists.infradead.org; linux-input@vger.kernel.org
> > Subject: [PATCH 2/4] dt-bindings: input: touchscreen: fsl,imx6ul-tsc: a=
dd
> > fsl,glitch-threshold
> >
> > Add support for glitch threshold configuration. A detected signal is va=
lid only if it
> > lasts longer than the set threshold; otherwise, it is regarded as a gli=
tch.
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > ---
> >
> >  .../input/touchscreen/fsl,imx6ul-tsc.yaml      | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.ya=
ml
> > b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.ya=
ml
> > index 678756ad0f92..2fee2940213f 100644
> > --- a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-ts=
c.yaml
> > +++ b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-ts=
c
> > +++ .yaml
> > @@ -62,6 +62,23 @@ properties:
> >      description: Number of data samples which are averaged for each re=
ad.
> >      enum: [ 1, 4, 8, 16, 32 ]
> >
> > +  fsl,glitch-threshold:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    default: 0
>
> Here the default should be 2 according to your third patch.

I considered the default value of the register, not the driver's.
If I'm not mistaken, the dt-bindings should be a description of the
hardware, not of the associated driver implementation.

>
> I'm okay for this patch set, let's waiting for comments about this yaml c=
hange.
>
> By the way, any real case which need to use other glitch threshod?

We recently submitted
https://lore.kernel.org/all/aGUDza5XRGDqfz5n@dragon/#t, and in this
initial contribution we removed all the custom parts that are not
supported upstream. This is
one such case. For our board, we need a de_glitch value of 1.

Thanks and regards,
Dario

>
> Regards
> Haibo Chen
>
> > +    enum: [ 0, 1, 2, 3 ]
> > +    description: |
> > +      Indicates the glitch threshold. The threshold is defined by numb=
er
> > +      of clock cycles. A detect signal is only valid if it is exist lo=
nger
> > +      than threshold; otherwise, it is regarded as a glitch.
> > +      0: Normal function: 8191 clock cycles
> > +         Low power mode: 9 clock cycles
> > +      1: Normal function: 4095 clock cycles
> > +         Low power mode: 7 clock cycles
> > +      2: Normal function: 2047 clock cycles
> > +         Low power mode: 5 clock cycles
> > +      3: Normal function: 1023 clock cycles
> > +         Low power mode: 3 clock cycles
> > +
> >  required:
> >    - compatible
> >    - reg
> > @@ -94,4 +111,5 @@ examples:
> >          measure-delay-time =3D <0xfff>;
> >          pre-charge-time =3D <0xffff>;
> >          touchscreen-average-samples =3D <32>;
> > +        fsl,glitch-threshold =3D <2>;
> >      };
> > --
> > 2.43.0
>


--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com

