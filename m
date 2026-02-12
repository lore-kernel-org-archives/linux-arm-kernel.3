Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE1CEEA845
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 20:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CqaUNs6Mj5QhZLrT316tnr1HzN3Okc05JKOp8OPkPTc=; b=snWsZXZv3TSKSIT3qd3bCeIcLg
	g/RW74XvOt3HSTuLW7erCCSihTPDaSIPmK7V+7o9dNMfGUEAzLZL6YCqjC1RgG/fczXygK1wEJwkD
	vDMqCtD34Q8dpDNKARpmKZMA+EkjGSNVzTNsnA2iM3Xkys53IH1C7yObINNuOvEgivkXXgITktwcg
	osP4xhB5LdCgSMT2/Z1KelJV6SrnmjoKNQ4pykWsBOXdu4Aen11TocK5PIGI+7U6Oj2FNvbDKTa6y
	be+eZWxS1avX2BRpO0fEegGzA0kfwtuetYOukvaxlSsxZcAad1P72U6r1bWPn8zU2C+2D5dnTDatJ
	sW92RLqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqcxB-00000002bT8-373j;
	Thu, 12 Feb 2026 20:06:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqcx9-00000002bSm-06GY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 20:06:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C18ED44408
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Feb 2026 20:06:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 889E7C4AF09
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Feb 2026 20:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770926777;
	bh=ydx6gVx6CLI/8rjjMaH4en1WRJjXMu1aXKvOuM+3YzA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=stXI6JBKTlCmUZ4mpHAXtp0CSpKirmFhDzLj8C0xwMKCNrG2f84jx0N4r5cbtg6CD
	 NDP0UJ6hIu6XDv9g7RK9dWZ92fiDhG92DTDgv+EoSVFoxD2FcuUqHa62vsL1qJZBQL
	 RAG+JdJUOfjjLJFbVjXp/zCpcj6WGyT8SXFzKvyQz+6SnABj5XcpHCTmDxU1MrzVNc
	 3wBfhjylWR1XyUzyJKQEpGxFgvU0DWu/R/xXhnB+C00OUeF/JzeTHh8ieOGQjOxIsr
	 l8BlBsbVLx33AxpTNCelo0eHqxiiwdKAl0+M16K/5VpEr6W/vSrkCravbgMilc9PL/
	 6E8g4z3AcjF6g==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b8f7a30515aso21651166b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Feb 2026 12:06:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW4T1+vhEOZ1H/9NU4PO9C00DgWo1Bt8JZW204Qctitu7MPatNfOTYF9HCUYyoF7v8BMr6AEEHEVuCEQr53hN11@lists.infradead.org
X-Gm-Message-State: AOJu0YygJs//DThyrn5IR4rB+AuNBD1eI3ABWtMdEls7Ol5NvprTxMEI
	/OeUfR2TQlfWKfVdDdezMsMGGBV8MA1qd/ByCEX0Er5h1L4FoUJKCrGINfXe7y60nBvNGSBQDbG
	NuILFOFvEilDQxMV/Ys8VzZ8k1RzPMg==
X-Received: by 2002:a17:907:78b:b0:b87:7938:7b77 with SMTP id
 a640c23a62f3a-b8facde13demr12825666b.30.1770926775798; Thu, 12 Feb 2026
 12:06:15 -0800 (PST)
MIME-Version: 1.0
References: <20260205-gs101-pd-v5-0-ede49cdb57a6@linaro.org>
 <20260205-gs101-pd-v5-4-ede49cdb57a6@linaro.org> <20260211211229.GA3882182-robh@kernel.org>
 <b5078af810a681333043f64d71b7d6ea55ff44bb.camel@linaro.org>
In-Reply-To: <b5078af810a681333043f64d71b7d6ea55ff44bb.camel@linaro.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 12 Feb 2026 14:06:04 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKKig8ePmmMZH=QagSyw0d=FKrORTxKzj7HOZqd0jLZFg@mail.gmail.com>
X-Gm-Features: AZwV_QgH12zvtmgpHtYhs-H6vgHDqmWIaZbmOcDQ86b9Aj9PuKrMvtIh1vd2c0s
Message-ID: <CAL_JsqKKig8ePmmMZH=QagSyw0d=FKrORTxKzj7HOZqd0jLZFg@mail.gmail.com>
Subject: Re: [PATCH v5 04/10] dt-bindings: soc: google: gs101-pmu: allow power
 domains as children
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_120619_125528_5BFCF8BC 
X-CRM114-Status: GOOD (  35.14  )
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

On Thu, Feb 12, 2026 at 6:03=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik@l=
inaro.org> wrote:
>
> Hi Rob,
>
> On Wed, 2026-02-11 at 15:12 -0600, Rob Herring wrote:
> > On Thu, Feb 05, 2026 at 09:42:32PM +0000, Andr=C3=A9 Draszik wrote:
> > > The power domains are a property of / implemented in the PMU. As such=
,
> > > they should be modelled as child nodes of the PMU.
> > >
> > > Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > > ---
> > > v4:
> > > - consistent quoting using " (Krzysztof)
> > > - add samsung,dtzpc to example
> > >
> > > Note: Ideally, the newly added properties (ranges, etc.) should only =
be
> > > 'required' if "^power-domain@[0-9a-f]+$" exists as a patternProperty,
> > > as they're needed only in that case. As-is, this patch now causes
> > > warnings for existing DTs as they don't specify the new properties (a=
nd
> > > they shouldn't need to).
> >
> > We can't have warnings added if they aren't valid.
> >
> > > Only if DTs are updated to include
> > > power-domains, such an update should also add the new properties.
> > >
> > > I've not been able to come up with the correct schema syntax to achie=
ve
> > > that. dependencies, dependentRequired, and dependentSchemas don't see=
m
> > > to support patterns. Similarly,
> > >   - if:
> > >       required:
> > >         - ...
> > >     then:
> > >       required:
> > >         - ...
> > >
> > > doesn't allow patterns in the 'if' block (or I didn't get the syntax
> > > right).
> > >
> > > Rob said in
> > > https://lore.kernel.org/all/20251010141357.GA219719-robh@kernel.org/
> > > that this is a known limitation in json-schema.
> >
> > For a given compatible, you should either have child nodes or you don't=
.
> > The h/w is not variable. So something like this should work:
> >
> > if:
> >   properties:
> >     compatible:
> >       contains:
> >         const: foo,bar
> >
> > then:
> >   required:
> >     - ranges
> >     - '#address-cells'
> >     - '#size-cells'
> >
>
> Thanks Rob, yes, that works in general, but unfortunately in this case ex=
isting
> DTs don't specify ranges etc for the google,gs101-pmu compatible. (This b=
inding
> is specifically for google,gs101-pmu only anyway).
>
> The above suggestion will cause the same validation warnings for existing=
 DTs
> which is no different to just adding those properties to the top-level re=
quired:
> as my patch is doing. Unless I misunderstood your suggestion.

"google,gs101-pmu" represents some specific h/w. That h/w either has
power domains or it doesn't. So which is it?


> The compatible doesn't change with these patches. So I'm not sure how to =
make
> your suggestion work without causing warnings for existing DTs. We can ei=
ther
> have an old incomplete DT+binding:

If this is considered incomplete, then you are going to complete it
and add the child nodes? If so, then the warnings are appropriate.

If you were going to maintain both bindings forever, then you would
probably want a new compatible. Or just drop the properties from
required. Note that if you have child nodes with 'reg' and parent
missing #address-cells or #size-cells, then dtc will warn about that.
So it's not too important if the schema doesn't.

>
>         pmu_system_controller: system-controller@17460000 {
>                 compatible =3D "google,gs101-pmu";
>                 reg =3D <0x17460000 0x10000>;
>         };

