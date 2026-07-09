Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED25C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 10:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s6cZ9HNvj5euq2IsKqnGtW9n38TCf44UpefkQ/0EfN8=; b=zwhhd0j1QAqsJ5wRXPJU9/zSA/
	D+4NidmvH/hiHoO1O10mupzcZN4d4uFKHKsMitlf59uEVhkCCVucKVcUATQQKujijSnqZ72+yv3Cn
	c/bvNBMeHJ4eqGYpj/SVy8Yeg8xDcIy6w89X1o7WYDM6POz7DofrVpFXHguEtEK1eq6BLhY75QUlk
	fhdJsIw3A6Q2jISfqMTR3E8M1AI2K3cmCBu+tvzotnLQqRc2hOcWcU+Dn3T/9qEuIae7Qf4jUnXaC
	yzQDgPWp1x5aKK1OnBI7UUygaMnCSRkfJF5bLXt4kvWZUYrbMFMt2FLrvjevZUsSH7VYFcu1B/gCE
	aqt13O6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlvo-00000001vzC-3NTg;
	Thu, 09 Jul 2026 10:24:36 +0000
Received: from mail-vs1-f45.google.com ([209.85.217.45])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlvm-00000001vya-1pSY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 10:24:35 +0000
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7396940aebcso1225749137.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 03:24:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783592673; x=1784197473;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s6cZ9HNvj5euq2IsKqnGtW9n38TCf44UpefkQ/0EfN8=;
        b=n2SrTNCJv0ClzkB5mL6koJ/UTH1Fzi/1Ir1mXGsskD75FfQH75SGjD26whxI3eWQ0Q
         PaCrSjO51WtC6EoH9/DMaH1Y0uMSPh/z8V2udbCb3iN8Qsyc08nkn+9y/D2JydG2z9x4
         sxDa8Fpn6hNEp+eaaoWy41kWx8Ga2Pnx5tzRTNMotqaF/sdrsezT0SEOe3WyNczwX2TY
         R8I4qBt3HO1798STJm4MTjzhgridpZSgq8xiUvGQFgQnBRmi1Ng8fjksP/inYHE0xzOB
         SzuHeK63e/TqWgm8v+WA6zt27fdHvCTKMLn2gl4B2gRt/zpzdxVWknkhJuXfxv0M8HsA
         062g==
X-Forwarded-Encrypted: i=1; AHgh+Rr9tqlFEIqBEatfuOQmDWnHHj0YN5vDx1/gaZN8XevahKgV/qtRLk0ZFefcCpRlOqq8Zj8TpcXA2jnYXcaorvbI@lists.infradead.org
X-Gm-Message-State: AOJu0YwtoK4M2Rq+AVsPYmY1330YoACCwBU/xMmpLWPIheRgJhfKlDar
	Yd5jsYvUUr9dQlJihJRt7DD7zFFCtNpJ8iV1DqZkXPjGEJtUHjiiM85TW4rl/riLXhQ=
X-Gm-Gg: AfdE7ck54kfVTtI6nvbcr0TgSWj6d5eYRYPVvzfaRftBWko5ZwxZxwirNB25Z39hwbr
	ICZyCcEqYwpEWnocGRVyO5PBimIA5kCOyF8uRZFuhw0yOwlWccDsPQ58DXWtkQU5pHN1rthw8DC
	xDwEjnhhNaeDBk4C6O0FBB+9pn0nbMTrlK1XXui1QS+W8L2QEQWzXJVyA8YLr9cvVH8vxyDrHVW
	IY4/XFu2GJhv1OiuCWKPhF0KTix0RjNdEfBYhe0L/K5I0eROX7xwtucmfP5YddV8T/DGJ/ejR+r
	E5fW3yBYGsVABHUx95KaLhZ4xLpslwl7pZaEUNkowk/gQXvgULZRqu9CcDAPzXa8sZWkWYkOKFV
	WzYpjfP9W0Cov69oAzKnTuRrDahNGfN5NqXK6QcGv/IfAh4j6jTE7wvQetataM8zaUYMNL+hcKi
	UxUa4X4r8I7YJukW9tqGEg0ryXyAyohhb9IjVVb6PRrqcwOf19RQ==
X-Received: by 2002:a05:6102:8011:b0:730:db02:1d08 with SMTP id ada2fe7eead31-744e0089e4fmr4262882137.10.1783592672913;
        Thu, 09 Jul 2026 03:24:32 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96ed6545095sm2902954241.11.2026.07.09.03.24.30
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 03:24:31 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-9691ba8bc8aso857717241.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 03:24:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqYrQtAEniwKHKceUUZxDamPmbEfumuJ4iJ8bhI8G2BoAarwIdUJmri4pRFGS/KInDgiQDAwW8DuBrAUMiCUNCv@lists.infradead.org
X-Received: by 2002:a05:6102:94f:b0:738:531e:a43e with SMTP id
 ada2fe7eead31-744e00634cbmr4111626137.7.1783592670751; Thu, 09 Jul 2026
 03:24:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1783505142.git.geert+renesas@glider.be> <dca2c4940ba38b897f04b6fb67591de9835900e1.1783505142.git.geert+renesas@glider.be>
 <59725f93-5269-4b0e-8633-48821219877f@mailbox.org>
In-Reply-To: <59725f93-5269-4b0e-8633-48821219877f@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Jul 2026 12:24:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXCooODm3YuE1JjZJAc2BeQuD==kWbA+ZzpXRA3fqa0Vg@mail.gmail.com>
X-Gm-Features: AUfX_mzHlNNTYZ42llQz3ksPLOjU-3fWPe_bQZCByAo9mLJpSl17fS0OhOffgPc
Message-ID: <CAMuHMdXCooODm3YuE1JjZJAc2BeQuD==kWbA+ZzpXRA3fqa0Vg@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] arm64: dts: renesas: r8a78000: Add MDLC nodes
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_032434_482010_972768C3 
X-CRM114-Status: GOOD (  22.71  )
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

Hi Marek,

On Wed, 8 Jul 2026 at 23:56, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 7/8/26 12:15 PM, Geert Uytterhoeven wrote:
> > Add device nodes for the Module Control (MDLC) blocks on the R-Car X5H
> > (R8A78000) SoC.
> >
> > Complete hardware desciption of all (H)SCIF serial ports, by linking
> > them to an MDLC for power domains and resets.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> [...]
>
> > +             mdlc_ddr7: system-controller@e8380000 {
> > +                     compatible = "renesas,r8a78000-mdlc";
> > +                     reg = <0 0xe8380000 0 0x1000>;
> > +                     #power-domain-cells = <2>;
> > +                     #reset-cells = <1>;
> > +                     bootph-all;
> > +             };
> > +
> > +             mdlc_hscn: system-controller@c9c90000 {
> > +                     compatible = "renesas,r8a78000-mdlc";
> > +                     reg = <0 0xc9c90000 0 0x1000>;
> > +                     #power-domain-cells = <2>;
> > +                     #reset-cells = <1>;
> > +                     bootph-all;
> > +             };
> > +
> > +             mdlc_rt: system-controller@19440000 {
>
> Please keep the list sorted (0x19440000 should be before 0xc9c90000).

These are sorted by instance (Module Number), as per Table 18.1
("Target Module hierarchy of Module Power Gating and Module Standby")
in the documentation.  This order is indeed a bit odd, as it differs
from both alphabetical label order (unlike e.g. hscifN), and numerical
unit address order...

Any guidance?

> > +                     compatible = "renesas,r8a78000-mdlc";
> > +                     reg = <0 0x19440000 0 0x1000>;
> > +                     #power-domain-cells = <2>;
> > +                     #reset-cells = <1>;
> > +                     bootph-all;
> > +             };
> With that fixed:
>
> Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks! ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

