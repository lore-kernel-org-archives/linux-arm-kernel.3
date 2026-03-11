Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2401062896
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 13:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UFWF40VMOoBN1A7fpnEO3neCvBWtprIlXZRnUtgyDmI=; b=BdGhIBmcojr/25B+EAiGdfbvxD
	auYPRKhaaK39G2XAbBMcOqCh65HOf6S8LtrfVYzDwTMeNsAU/wlgDhPAGSlkbRm+pVuBTpThfCxCT
	qZHKBvA/YSgR42vMPy7iD+TkabBWDt2FwfEBOc/UpkYRqQdEmf4owuwzJas8d+FI74fAgImtWuwWr
	2BP1o6tEfARS7ny7wzYbMpnjnNHX80LjflDItyFCAaNuxMIaiGHQnxcR935JiZK+Zh8jepweq1uPN
	a4N40EUdoYZ/hLjmKhL80bRg6v4EvoRHxqyLC5RLRbnyJlEFOQ/wh2j2WF4GNmE6FoTaZytLFaGU7
	2y8hKkQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0JFT-0000000Bc9D-2LrB;
	Wed, 11 Mar 2026 13:05:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0JFS-0000000Bc97-0B6F
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 13:05:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 328586012A
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 13:05:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8B5DC4AF0C
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 13:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773234312;
	bh=wMgWWPXAjl+83UwF3RnJ8R6sr1pfCH3T5MLpa+G/nZI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YYtnzA/G+o39KiYFBBaOWuKbndd3yDC/N6mINHtl5yymI7QZLVwNc6rH+HTQQAvR5
	 y6tdmtdD4TAEdg7c84tLGP9Ea4xABXF+Tj9pWD6v2TMwIkQUm+D/PfkTJ6DfQtkmy3
	 CU0ZrjmaHOIhNdYHq9kFX36hZ537162xOReANlu6gkPM6vsNvaeIRd0+Xk8Rc016b5
	 My+n4qiqigGhSli/jFUkdz/IxPekPKlaYoNSNiEIw3qEFVNuZ8IYABT8XFnsaojT0G
	 z0MV4KDqtXelyGPhMevzer1/uKmH1WHnx/TX8C7q6wojBTrk5hOYA/WSsxrI/Jj2tP
	 DT5mkW5/Qy/3Q==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-79906e5c7f1so30476187b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 06:05:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXsRYQzTbgkuvjEUMdghHsezPRaN7VK/vUZz1y0jnPbwJ9hLKlDZF2YIKXaAyuXqzvkeVgjeT9de+3tSEXoOfpk@lists.infradead.org
X-Gm-Message-State: AOJu0YxRLIbKaKO9UjSCbByNM1qybMzkYpENRY6uCaYUlFV2t+EIx3md
	sysAnDPoApjJ2rnFrsMBGxQhzn/4HtqcxKI49ZZrvzCjYVzmuOJHB2tBO41f9+HYwk3lk3IbxFp
	AagLLR4YXrV0ZVCh/s8PIc2KB0vs0EF8=
X-Received: by 2002:a05:690c:e687:20b0:798:65eb:aff5 with SMTP id
 00721157ae682-79917ead3c6mr16029807b3.8.1773234312142; Wed, 11 Mar 2026
 06:05:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260306093238.2715269-1-zichar.zhang@cixtech.com>
 <CAD++jLkueX=qU3OY3z=ANA9pd_irWjdf_Czc6RSctzr0MBftQQ@mail.gmail.com> <abFbRA33DtDdZ2j+@ZicharPC>
In-Reply-To: <abFbRA33DtDdZ2j+@ZicharPC>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 11 Mar 2026 14:05:01 +0100
X-Gmail-Original-Message-ID: <CAD++jL=Lo89mnTiqXeTqtcV7q3D-mg5BXBC7XYzbzJzTW3sgRA@mail.gmail.com>
X-Gm-Features: AaiRm52mfcznREEEuIoy4g3EGhtzEf3sfA6OhmlaeDTqvF_9XJry94hJfFQ0tQA
Message-ID: <CAD++jL=Lo89mnTiqXeTqtcV7q3D-mg5BXBC7XYzbzJzTW3sgRA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: cdns: add clock-names property
To: Zichar Zhang <zichar.zhang@cixtech.com>
Cc: brgl@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	peter.chen@cixtech.com, fugang.duan@cixtech.com, jank@cadence.com, 
	cix-kernel-upstream@cixtech.com, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Mar 11, 2026 at 1:08=E2=80=AFPM Zichar Zhang <zichar.zhang@cixtech.=
com> wrote:
> On Fri, Mar 06, 2026 at 11:10:35AM +0100, Linus Walleij wrote:
> > [You don't often get email from linusw@kernel.org. Learn why this is im=
portant at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > EXTERNAL EMAIL
> >
> > Hi Zichar,
> >
> > On Fri, Mar 6, 2026 at 10:32=E2=80=AFAM Zichar Zhang <zichar.zhang@cixt=
ech.com> wrote:
> >
> > > +  clock-names:
> > > +    description:
> > > +      Optional name for the GPIO controller input clock.
> > > +    minItems: 1
> > > +    maxItems: 1
> >
> > I think clock-names: true should suffice, but the binding maintainers
> > can say how
> > they want it.
> >
> > I would suggest to also add:
> >
> >   gpio-ranges:
> >     minItems: 1
> >     maxItems: 32
> >
> > At this point even if you're not using it FTM. This will make it
> > possible to later
> > map the GPIOs to the pin controller and control pin configuration from =
the
> > GPIO subsystem.
>
> Thanks. Given that cdns,gpio.yaml already defines "ngpios", would it make
> sense to use it for the "gpio-ranges" definition?

You mean like

maxItems: (ngpios) ? ngpios : 32

or something like that?

I don't think YAML can do variables that way, but Rob might know better.

We sure know 32 is a cap.

Yours,
Linus Walleij

