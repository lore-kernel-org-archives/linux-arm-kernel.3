Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87ADDC83F25
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 06:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kGZYO2e54F3r+OK1iTp4D/RkgP/MYmQ/jepAEaRz8qU=; b=zxDb6DA6xnAUCbIZ8D5ZD+PpUr
	3C+2gYFGYU3dhQfTynQpP7wIcF4IcXsdmN9LmQL3tG8T8NxYVUIGBDa3Uwam/OdHjIY30oGLc8LEp
	6GwunVUPvIsUG0Lhn+TolHzzm4hhjYh3c5jzzl1ycKZ7rbRdd8XngcdAk11Y40wjH9J7gjO5VpMWj
	ckat5B0u+aMNY+mKZeNFxQaBxj7bAKLs8rLu5swy/4yXcN32xerZQXb7AZD1It86S2VfosfJ0cgfx
	sEVUHIcKkmsiVgOPrEmEPCiAIw+0dnhMQKzQR/jw0H3vsIwBTdnvb9gp66KLQ1RacCTwkYkVHzhql
	6kAuO6KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueSxp-000000048Wt-2Cpu;
	Wed, 23 Jul 2025 06:28:29 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueSvL-000000048G0-11Qv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 06:25:56 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-7183fd8c4c7so68956967b3.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 23:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1753251954; x=1753856754; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGZYO2e54F3r+OK1iTp4D/RkgP/MYmQ/jepAEaRz8qU=;
        b=W0eHE1g1q11MA84aYoyA8mXCTEmB00FVldjJcAdm4msubDDlntQ+mhuDmakB7UKW/9
         c6+FZOphzQUIbG6fNPVL7CoaTWerRIL9AAqIOFrn1w1xlxRkDMXRTe+ItPz7Tb1BsFtM
         lowvG92FVz/R1CA/CXgxs77uyIgU894eBmO7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753251954; x=1753856754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kGZYO2e54F3r+OK1iTp4D/RkgP/MYmQ/jepAEaRz8qU=;
        b=YGq+PHi4vbyW+UcChoetAicNa+gaditSAo7nkHuuogLLu1O50dGEdPicgNJV1vwh6A
         P07SPT3QZvPk/PjN7BIX9eQD+kN36eWSNeOT0Rdz0Ho0jU6VQQk2xxmX076L1z1ndltl
         nS3KiMSwhNJfHiN83uSPSocoCYeCtQfDIa1Zo43+TKwYOwqkBQcpLcNnsf7JnsvEOx5H
         /e7YADwqCpY4U01EZSvJ75MvsO/Jyj9uQjBl/TsTQzxflG86eM4NYxXj3i6P1qHlwjaH
         wGVa0zQNpUBTPLq9aI1Fhbnr647d1/SPPByzXS7oaaL8Fk4s6r+gu7d2VOsFKin/ENVk
         BzSg==
X-Forwarded-Encrypted: i=1; AJvYcCUGeO/rRe6ZUwFSKDzOusYj+yz0BmlZohoYMZt/zPRofaZASuV5A8OJkZUs2fsJLk3Brbv+L5Ur+XqG5uP92Cx9@lists.infradead.org
X-Gm-Message-State: AOJu0YzGBE6ti58Ra92xwBSTwDG0OAGCqkVxc1VvyF2ZgESDFOBqZ/ya
	iiYXHsbbREJ7M1yfC0J2m0mHyda9tLL3eoj4OL7PNo00DQNUAVDdWYEpwuH0flpxniM4yQqcZOC
	RUp6Ij/aax03P6DU8nIWmI3QXF5KpSuvP+P6bc94SPw==
X-Gm-Gg: ASbGncs+0t5uaGP7gXwVxanak3JajL2dypNyMz4pY8n4Ysh0L2pyAs1XW4MYq3XZBAD
	lLKPt2UzlMojOfpJuVo2LNCIdxBd6AqQ6TuXmIWpfxNq3xWx9Ci7N5dj/AiQmtLEtf3x9gFh2Yc
	+VRJ3TDytOmNo4bQyugldPn8FEpJOe7xaEItkuaks0Bj2UDrQEQeQRGyAVQZf7BzmDLNOHcXhhQ
	vxmEQ==
X-Google-Smtp-Source: AGHT+IHv5nL6qViIs6gJAMz6sbFRUndksqf/qf03+nefju0bAxUOnsbQF6PtkZC5WvhFVsjvSryN5UHwWNkVm2efPGw=
X-Received: by 2002:a05:690c:3347:b0:70e:1874:b914 with SMTP id
 00721157ae682-719b4133d40mr24952697b3.9.1753251954012; Tue, 22 Jul 2025
 23:25:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250722103706.3440777-1-dario.binacchi@amarulasolutions.com>
 <20250722103706.3440777-3-dario.binacchi@amarulasolutions.com> <20250723050319.GA1239529-robh@kernel.org>
In-Reply-To: <20250723050319.GA1239529-robh@kernel.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 23 Jul 2025 08:25:43 +0200
X-Gm-Features: Ac12FXyzezWWf_pUFGOcPk-V-mRbQEUXptOJkigIidJmFt9VjBBdYB7tr8ictgw
Message-ID: <CABGWkvpWPXz8bFPC3OgqY+C6cgu6hHGh6muCQkoCOEVK048fSA@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: input: touchscreen: fsl,imx6ul-tsc: add fsl,glitch-threshold
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_232555_284890_EF96380A 
X-CRM114-Status: GOOD (  22.18  )
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

On Wed, Jul 23, 2025 at 7:03=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Tue, Jul 22, 2025 at 12:36:16PM +0200, Dario Binacchi wrote:
> > Add support for glitch threshold configuration. A detected signal is va=
lid
> > only if it lasts longer than the set threshold; otherwise, it is regard=
ed
> > as a glitch.
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > ---
> >
> >  .../input/touchscreen/fsl,imx6ul-tsc.yaml      | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/input/touchscreen/fsl,im=
x6ul-tsc.yaml b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx=
6ul-tsc.yaml
> > index 678756ad0f92..2fee2940213f 100644
> > --- a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-ts=
c.yaml
> > +++ b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-ts=
c.yaml
> > @@ -62,6 +62,23 @@ properties:
> >      description: Number of data samples which are averaged for each re=
ad.
> >      enum: [ 1, 4, 8, 16, 32 ]
> >
> > +  fsl,glitch-threshold:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    default: 0
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
>
> Don't we have common properties for this expressed in time? Debounce
> time IIRC.

I tried checking in
Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml,
but I didn't find anything about it.

It exists in some specific touchscreen bindings:
- azoteq,iqs7211.yaml
- brcm,iproc-touchscreen.txt
- fsl-mx25-tcq.txt,
- ti,ads7843.yaml.

Only fsl-mx25-tcq.txt expresses it in terms of time (ns).

Thanks and regards,
Dario

>
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
> >



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

