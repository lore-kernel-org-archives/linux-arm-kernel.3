Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3CDCE7B13
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 14:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=605KA+j3WIIvcfzgxWg8ZYVUvIOsOaWV0PzJBY7zgrk=; b=G/8k9vxGRRO5nAabKAklM1YsNG
	ZlXjErLJRPNU5NAymt6BuB93Cy2z5tbcHi8hdHQAAgx8t3tCViXaD7TFLp0raEm80zruB1Mf0q9tU
	g07umxgAFPQJR1WSZD/PqrxApYKtIRWb0I8GyCB5mzPad4lr5JZZeVG+r+BvV+q2eTSQ9GhYfPwI7
	AhpvWdVtUcH9QHYQe28RjGTtQTNdS6xum4TfM4xruj7TrA5M+P/EHpaAWIb1QrNf4F3TkubP+MfQV
	75yU0ca4Eb0NMChjqS14SSNx3T6e4wfwLWyQHYYvajPz4KHiPwh5ENd/h+h5rYZhvLaBjTml3+t1p
	xOqT+jjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJuao-0000000CKoH-487x;
	Fri, 14 Nov 2025 14:16:02 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJuam-0000000CKn8-1fJi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 14:16:01 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-3e2d1477b9cso1216402fac.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 06:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763129759; x=1763734559; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=605KA+j3WIIvcfzgxWg8ZYVUvIOsOaWV0PzJBY7zgrk=;
        b=IG28Ib7j/1k1avrpIP/gJcAw8UHHJMYVgWl6iNJUhPY2ngh0Qx4cunIWwqsF/XO9OC
         Ea/xksk+HnlukwPal8jB3iJnKmYGB+30wy7qxJnMWWqyY6V0jntZumdLTdD/ywciSb4A
         N3iNQSsu0QB2/LXuZtjeOccNpAxp5mcZMEU0bARon4gKnyqc7g5zUylD9FlRbvItJ7mm
         9wbhpn77UBp/1oiNqkSKipa64y6EIsL3umKeIgRuPm2eXaz6GHRHoGWJoRkZJ2dtJMoG
         F4zfbjr3d0uLdnRYkleMR6GMVfYy64U60uQtAr72povK75kypRR4f932mvzLP2SQexhB
         3/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763129759; x=1763734559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=605KA+j3WIIvcfzgxWg8ZYVUvIOsOaWV0PzJBY7zgrk=;
        b=nBmFHpJa9YAWjh9D80oap4AtS5YzpPelPsgcnqOzIRfyiHM47WooRPPZH8u1Tyi+yy
         WlimG8hy6i4KnU/Wut3eCSHBMJ57/ZkXoYrh5gdCSWyTZdy6XVAlIeZ58/eqwCqoL82J
         Z0tJGLPJLwR5pr+SUJ2GqrknfPvpIP2uRigyOeZVPX7GrySSMU8leSZRU7OXN9oulFxZ
         WoeW0mYIG4LbxDc0dcVhbgUXaL44VefPE0/B9uPe/XmHH3mrNF9edEMcJWC4XS0IuEPK
         lbU2Jc+czVnDgX7jU4DZ2QngQLANySZGKlsy4A214lafZ6seoVIdthwXJDZ8ZcK7NS0W
         1eBg==
X-Forwarded-Encrypted: i=1; AJvYcCVFF+/bfVGmtDW08TD7Jp2Cg6vuRlVk6PkPEO+K8l8rfy+u1hBD3gantqKxUz/Z0tonNbj3CPIZwa8EQF5nA9u1@lists.infradead.org
X-Gm-Message-State: AOJu0YyJkrO285JwjBCnsyFpcCaq8pB85/5erVGuj3DJ4jtgPMkK5sK9
	ZjmCTq9n3hpnBWAD/1MPBao8MOB8z4QBBSIFyKJ/J0t9EN4cejJ7M0lcgVVragT5VtWjQWBEOj9
	yxK4fOIcQaipv7E3xjAfCAky31+f6IY3CEoRJYZOMZg==
X-Gm-Gg: ASbGncu5g6DY4vAf7FF5I2Clyx3zuDmaHKLr5AtDebVFNIOWFMKUpnZjNW816P9TCv1
	7kpnsznE9vk3+tadEEhhwyeFvDOA8k3HLwfWsGcFp9TvcgpjUWTzQD0B3Yh6VIpJwmoYLf2Xhn/
	x+vJx3aXvCP3oleQvKlPkRDrwuAb5dMKMWx/Nqfjt30LgrxMJPes4l7LFl9/59uW0MHgG8s6IXQ
	M9LrOOWDBRMKZ5VmsOkq8hXg1XwHRuNfcp6tO7gog0hm74d20qAfwZRmRVP
X-Google-Smtp-Source: AGHT+IHFAOcopcMRDmLLjpXIMGkDicnHz6DOQWd9hkogRhyGcqfzsm1tRjKsU007mKGUgCn3eB5pyfIzXQ5lLIUbgl0=
X-Received: by 2002:a05:6870:7182:b0:3d4:cea7:62b5 with SMTP id
 586e51a60fabf-3e86920a732mr1731868fac.48.1763129759003; Fri, 14 Nov 2025
 06:15:59 -0800 (PST)
MIME-Version: 1.0
References: <20251110-automatic-clocks-v4-0-8f46929f50b7@linaro.org>
 <20251110-automatic-clocks-v4-1-8f46929f50b7@linaro.org> <3bb47929b08370d9114ff1dd6b0d0f16d354d63b.camel@linaro.org>
 <9c344c5f43e71f30ccbd07b201eb470ed8e5fe35.camel@linaro.org>
In-Reply-To: <9c344c5f43e71f30ccbd07b201eb470ed8e5fe35.camel@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 14 Nov 2025 14:15:48 +0000
X-Gm-Features: AWmQ_bnLz1hABBDAKCHnQD782gXnmLLLuHhSJOeNXuWZEnGWp9H0xn505uSki68
Message-ID: <CADrjBPr1ny7u7jFHdB5dbAytx2C_MsR7gPL9m-=0BiZZzPEhiA@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: clock: google,gs101-clock: add
 samsung,sysreg property as required
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Will McVicker <willmcvicker@google.com>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_061600_474237_9A8BA68A 
X-CRM114-Status: GOOD (  17.41  )
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

Hi Andr=C3=A9,

Thanks for the review feedback!

On Tue, 11 Nov 2025 at 09:57, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> On Tue, 2025-11-11 at 09:54 +0000, Andr=C3=A9 Draszik wrote:
> > Hi Peter,
> >
> > On Mon, 2025-11-10 at 14:21 +0000, Peter Griffin wrote:
> > > [...]
> > >
> > > diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clo=
ck.yaml
> > > b/Documentation/devicetree/bindings/clock/google,gs101-
> > > clock.yaml
> > > index 31e106ef913dead9a038b3b6d8b43b950587f6aa..5ce5ba523110af3a2a774=
0b8ba28e2271c76bddb 100644
> > > --- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> > > +++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> > > @@ -52,6 +52,11 @@ properties:
> > >    reg:
> > >      maxItems: 1
> > >
> > > +  samsung,sysreg:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > +    description:
> > > +      Phandle to system registers interface.
> > > +
> > >  required:
> > >    - compatible
> > >    - "#clock-cells"
> > > @@ -166,6 +171,22 @@ allOf:
> > >              - const: bus
> > >              - const: ip
> > >
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - google,gs101-cmu-apm
> > > +              - google,gs101-cmu-misc
> > > +              - google,gs101-hsi0
> >
> > Shouldn't this be google,gs101-cmu-hsi0?
> >
> > > +              - google,gs101-cmu-hsi2
> > > +              - google,gs101-cmu-peric0
> > > +              - google,gs101-cmu-peric1
> > > +
> > > +    then:
> > > +      required:
> > > +        - samsung,sysreg
> >
> > The above still allows (but doesn't enforce) samsung,sysreg on cmu-top.
> >
> > Maybe it'd be better to invert the test, as cmu-top is the only
> > outlier, and then the binding doesn't need to be updated when more
> > CMUs are added (untested):
> >
> >   - if:
> >       properties:
> >         compatible:
> >           contains:
> >             const: google,gs101-cmu-top
> >
> >     then:
> >       required:
> >         - samsung,sysreg
> >
> >     else:
> >       properties:
> >         samsung,sysreg: false
>
> obviously then: and else: cases should be swapped.

I'll send an updated version with these suggestions integrated in a moment.

Thanks,

Peter

