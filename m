Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12723E77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 21:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=id1sh3FCg/7RMCobM0hb+35jgQaJrBVPFNS3Z4VpXrU=; b=nrfvxFRAJ7V61uJQn5ylIofo5x
	UTR20mKHp3ZD2DeVSR2EeIxM+lFf31G2oR5W/k24TKNdRQ5kCEOVbxLdNxirsprOe/SZFVD/OjlIT
	UZV76O1QIsXB8e9Zs53L0McPHo72r6uLDOQqfp3rFy7uUmucsMGXI4BKXoqupIQUuay7UVIxCih2l
	cGB+z9SvHlmYptCAhkefgaaHdHAPb6M7nST0NwCxZ9w06RkcGbUVLURmyH4LC9qyAWahvJawyUUXg
	YTGpOk8tiFvtjZ5CEDVoe71RXGGJvDYxJJ0dyWK2vjrmOUpptIOky1QQU3OV/SLhU7cqpsT/hd0aj
	a1bzIsUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVzwD-0000000DLVG-3zSG;
	Thu, 09 Jan 2025 21:19:33 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVzuz-0000000DLG2-0xBr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 21:18:18 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-e3983f8ff40so2063120276.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 13:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1736457496; x=1737062296; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=id1sh3FCg/7RMCobM0hb+35jgQaJrBVPFNS3Z4VpXrU=;
        b=UlOiJCZR6bRBQtn7M58qfABVUB0bbGAgE59znHg4FklZrffhMgrwe9j/QOMuQ26IsQ
         UaPhcOwBeCDV9oVFRBtTw2BpQo0Z8ZTO1EarvLreiWA9Jc8NXdp7uZmCczMgQ7Ugc4oq
         4A0Z/J7kATut/+9PrPJFoo4Z2FmrEgQcHKqA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736457496; x=1737062296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=id1sh3FCg/7RMCobM0hb+35jgQaJrBVPFNS3Z4VpXrU=;
        b=e2aHshpPrLKKvms8mNERQq0R//bsvUw7Jv10f+854CRVOli7UGEgDECCBIJK1Hmjxm
         VTyBoxlil1a1k4fNesdnuxkmm2FKCxwoiv123c7I84wxrw/Zhtmyl2l3stzkrKm+xgvX
         sYc9gGu2vV9cmmWpqjCWOJ3LFll9Jzc7P0KmCUv6gIfN+CH3iW87OjxyEO6zY7l2KDTh
         smCM5zvKfuYQ+bZfsgirSPMgm/4qcX3N7+kwgay8lY7rlB2xQ4l4QHFCHKJKjcHR2PWY
         7vYmH7vT37CWhw4eHpYqaso+CNzsedHYVTRvQlB8eJaWORz3hso45kCdVGfNmztrIazs
         E/6w==
X-Forwarded-Encrypted: i=1; AJvYcCVx6QQKruqeAm4mJhYLLiR0zTTHLMA6e01zdLHgj+unqWb168zw+W+Pls47Mo7oIe1++RRu3cDRDQB8jqiELQaU@lists.infradead.org
X-Gm-Message-State: AOJu0YwT6fnn9/8ntcqg7lFViHaVjJ9kxSziatfsXyg9RYM437Y700eC
	9dxiEsfVRTZM82YQcd3OJVg7pSPMcSpvaCOxX6jcfku78vRxlctgeqJ16XA4FzMlSJCSu/q/4sX
	iotm73AEnO0ALll/Y2qztK+NkaqRoiIzz3hLGaw==
X-Gm-Gg: ASbGncusV1K3tt0EqvFZT/8VkVmPZfMkDSq4UTQL8hUkjSGzegJd8as4pQF1j3DuNSx
	QqWVXWfHp7XPGGhS4bXOOmikZc5w3k7kqnA==
X-Google-Smtp-Source: AGHT+IEitao6xkL4KuruOiZLl8pzkE0Tr8U9XGdZMOjjPpiCZSWKdvOna0N9OTnQBhhi7O+5g4P8CEDUT7rp7zQGK3E=
X-Received: by 2002:a05:6902:10ce:b0:e4a:9ef8:804b with SMTP id
 3f1490d57ef6-e54ee138dfcmr7114871276.19.1736457495749; Thu, 09 Jan 2025
 13:18:15 -0800 (PST)
MIME-Version: 1.0
References: <20250105181525.1370822-1-dario.binacchi@amarulasolutions.com>
 <20250105181525.1370822-5-dario.binacchi@amarulasolutions.com> <20250108234807.GA1247672-robh@kernel.org>
In-Reply-To: <20250108234807.GA1247672-robh@kernel.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 9 Jan 2025 22:18:05 +0100
X-Gm-Features: AbW1kvaz0srWd9-CXkLWbJC4L5aCPg18CSB1xlYjDSOC4DOcE56GKg2Kqa2-Of4
Message-ID: <CABGWkvpgGNitRfe+qxT9faZ=Oa5+OzbE06dr-0O+w31JOmOQfw@mail.gmail.com>
Subject: Re: [PATCH 4/6] dt-bindings: clock: st,stm32-rcc: support spread
 spectrum clocking
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_131817_327769_B57F8DDC 
X-CRM114-Status: GOOD (  23.60  )
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

Hello Rob,

On Thu, Jan 9, 2025 at 12:48=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Sun, Jan 05, 2025 at 07:14:16PM +0100, Dario Binacchi wrote:
> > The addition of DT bindings for enabling and tuning spread spectrum
> > clocking generation is available only for the main PLL.
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > ---
> >
> >  .../bindings/clock/st,stm32-rcc.yaml          | 27 +++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml =
b/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
> > index ae9e5b26d876..c345d3ff3fc4 100644
> > --- a/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
> > +++ b/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
> > @@ -77,6 +77,26 @@ properties:
> >        Phandle to system configuration controller. It can be used to co=
ntrol the
> >        power domain circuitry.
> >
> > +  st,ssc-modfreq-hz:
> > +    description:
> > +      The modulation frequency for main PLL (in Hz)
>
> No constraints?

They vary depending on the HSE clock frequency used.

>
> > +
> > +  st,ssc-moddepth-permyriad:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      The modulation rate for main PLL (in permyriad, i.e. 0.01%)
> > +    minimum: 25
> > +    maximum: 200
> > +
> > +  st,ssc-modmethod:
> > +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> > +    description:
> > +      The modulation techniques for main PLL.
> > +    items:
> > +      enum:
> > +        - center-spread
> > +        - down-spread
>
> What's the default? If there's only 2 possibilities, then you can use a
> boolean instead. Though I assume you want to support spread-spectrum
> disabled.

Generally, there can also be more than two options. For example, in
the case of the imx8m platform, there are three possibilities:
- down-spread
- center-spread
- up-spread
In our case, using a boolean would hide one of the two pieces of informatio=
n,
meaning that if I'm not using center-spread, what am I using?

IMHO, I would keep the string type, changing it from
on-unique-string-array to string.

>
> Are there dependencies between these properties?

The values moddepth and modfreq are used to calculate, according to specifi=
c
relationships, two values MODPER and INCSTEP, which are bit fields of
a suitable
register for managing the SSCG. There is a constraint between these two val=
ues,
namely that MODPER * INCSTEP < 32768. This constraint will be managed
at the driver level.

Thanks and regards,
Dario
>
> > +
> >  required:
> >    - compatible
> >    - reg
> > @@ -97,6 +117,10 @@ allOf:
> >            const: 1
> >            description: |
> >              The clock index for the specified type.
> > +        st,ssc-modfreq-hz: false
> > +        st,ssc-moddepth-permyriad: false
> > +        st,ssc-modmethod: false
> > +
> >      else:
> >        properties:
> >          '#clock-cells':
> > @@ -118,6 +142,9 @@ examples:
> >          reg =3D <0x40023800 0x400>;
> >          clocks =3D <&clk_hse>, <&clk_i2s_ckin>;
> >          st,syscfg =3D <&pwrcfg>;
> > +        st,ssc-modfreq-hz =3D <10000>;
> > +        st,ssc-moddepth-permyriad =3D <200>;
> > +        st,ssc-modmethod =3D "center-spread";
> >      };
> >
> >    - |
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

