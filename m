Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EFCE6895E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 08:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HfNhJxDYW/zYKMETRxr7Ku4lALqPP65///kXhuaXtfc=; b=HphRQj/8CTelwkgRV0ry/uA120
	vSsGm1B/KcCRdEcPW9mpuIyQVLKbqEqiZ1kZXUJvnU7qhePelppg0HMN/Jx54/rt0i8WRxI8UOcdO
	+bGqEYTMNbnZFIEevsHGsWie/lprrEe+huPCDCw1w28WT+mD/f1FK0k61BmABq6t1PJ984sEXR7ZJ
	1YBRd0nzsTz+pj05kiH62vtznLKHs7o9rY7s5lOSD0VcFcSfjdUGDGAvpox9J1fZ8JFkydp7OoLyY
	sxDyuXXe/gBsWl5VM+GCuf1GCvqUGix5FdGmfM2VSPIDj7/+KrDfbKPYRHMR5aO9/AcQBGi9hlzxX
	UxCDaruQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Qs9-00000002zVL-1BUz;
	Thu, 31 Oct 2024 08:49:41 +0000
Received: from mail-yw1-f181.google.com ([209.85.128.181])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Qmp-00000002ycR-0cAJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 08:44:12 +0000
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6ea4add8a5fso6367107b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 01:44:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730364248; x=1730969048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HfNhJxDYW/zYKMETRxr7Ku4lALqPP65///kXhuaXtfc=;
        b=Clg5zXvPDy8yMpSfHnF+Yb1lHOOkE04K2OaSRxOuak8O3/zt9+x4f5KCgJxjngStc9
         z7rFRbNrUNrVjEWgrPPH+XNvV58YGOpir2S+eZO8i0DZwHpEVjqNFd7ETb2WrK3eruN3
         wubus2e/c6FGLbR1MX31Zgg9G+VTY29pncl67WjcEDuesoC7HQmYDAkrvG+1ctw5iGq/
         pl2im8u99Jk20CkUTKQCbsR4+Y+eIfx+UnnPAolcm6m9wwSpIsl+vfUciSzl/pdbgHN6
         oLJqYO3gCseovCEpH4bLRvm85U12baUyEZOWtK5tBaDZ+uT2bn3J2Le/DAXdrXOUUCzE
         Wjpg==
X-Forwarded-Encrypted: i=1; AJvYcCWzsh/hF7X6Oog+v/SbMSF/+SjHW7jrTUerwgnoUWqfYgXP2qCfLqv/ElcODoO6AT2hhqoRSJL8uQ1ckPpQ9Xsh@lists.infradead.org
X-Gm-Message-State: AOJu0Yyld+CaMNOVE8tKwTy4PMFtKWC2KtWOqbMxT1ndWwNCu7Fs+MM2
	EWri1qtKY/NI9axcNFhutQl2z0bd08Xn//KMvJVAxc+7jWm5n5mRwt3o4w4S
X-Google-Smtp-Source: AGHT+IGAI40IAv1VjXBwm8SpqLTImVkWb2n3G6BesLl6/ec1ELpw9CjgEInjZ50XJsc0E3h9HFKung==
X-Received: by 2002:a05:690c:f83:b0:6e3:34b9:960a with SMTP id 00721157ae682-6ea52360ed8mr25985757b3.17.1730364247771;
        Thu, 31 Oct 2024 01:44:07 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c45c41sm1678557b3.94.2024.10.31.01.44.07
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Oct 2024 01:44:07 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6ea339a41f1so5693007b3.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 01:44:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV0fsLyfCurJMeLnrRpBOSxaxJr0Y0HwETFh2hefD+LGhPv/er5P+TRohcaHOJeB4+M4+9AglqVuG3o3oe6DguS@lists.infradead.org
X-Received: by 2002:a05:690c:6910:b0:6e2:1090:af31 with SMTP id
 00721157ae682-6ea52323524mr27475337b3.3.1730364247060; Thu, 31 Oct 2024
 01:44:07 -0700 (PDT)
MIME-Version: 1.0
References: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
 <20241030110120.332802-4-claudiu.beznea.uj@bp.renesas.com> <mg2ugyg65ke3tngzqyyixfkawf4iop4o373dc6fosy7bfydbe5@pm43dhkd7asu>
In-Reply-To: <mg2ugyg65ke3tngzqyyixfkawf4iop4o373dc6fosy7bfydbe5@pm43dhkd7asu>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 31 Oct 2024 09:43:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUcw_UHAZRVGt=Tr0jv3NOPDibtPy1E-46Pq74YKFZxWg@mail.gmail.com>
Message-ID: <CAMuHMdUcw_UHAZRVGt=Tr0jv3NOPDibtPy1E-46Pq74YKFZxWg@mail.gmail.com>
Subject: Re: [PATCH v5 03/10] clk: renesas: clk-vbattb: Add VBATTB clock driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Claudiu <claudiu.beznea@tuxon.dev>, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	alexandre.belloni@bootlin.com, magnus.damm@gmail.com, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_014411_208124_769BB14C 
X-CRM114-Status: GOOD (  29.73  )
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

Hi Krzysztof,

On Thu, Oct 31, 2024 at 8:48=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
> On Wed, Oct 30, 2024 at 01:01:13PM +0200, Claudiu wrote:
> > From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >
> > The VBATTB IP of the Renesas RZ/G3S SoC controls the clock that is used
> > by the RTC. The input to the VBATTB could be a 32KHz crystal
> > or an external clock device.
> >
> > The HW block diagram for the clock generator is as follows:
> >
> >            +----------+ XC   `\
> > RTXIN  --->|          |----->| \       +----+  VBATTCLK
> >            | 32K clock|      |  |----->|gate|----------->
> >            | osc      | XBYP |  |      +----+
> > RTXOUT --->|          |----->| /
> >            +----------+      ,
> >
> > After discussions w/ Stephen Boyd the clock tree associated with this
> > hardware block was exported in Linux as:
> >
> > vbattb-xtal
> >    xbyp
> >    xc
> >       mux
> >          vbattbclk
> >
> > where:
> > - input-xtal is the input clock (connected to RTXIN, RTXOUT pins)
> > - xc, xbyp are mux inputs
> > - mux is the internal mux
> > - vbattclk is the gate clock that feeds in the end the RTC
> >
> > to allow selecting the input of the MUX though assigned-clock DT
> > properties, using the already existing clock drivers and avoid adding
> > other DT properties. If the crystal is connected on RTXIN,
> > RTXOUT pins the XC will be selected as mux input. If an external clock
> > device is connected on RTXIN, RTXOUT pins the XBYP will be selected as
> > mux input.
> >
> > The load capacitance of the internal crystal can be configured
> > with renesas,vbattb-load-nanofarads DT property.
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

> > --- a/drivers/clk/renesas/Kconfig
> > +++ b/drivers/clk/renesas/Kconfig
> > @@ -237,6 +237,10 @@ config CLK_RZV2H
> >       bool "RZ/V2H(P) family clock support" if COMPILE_TEST
> >       select RESET_CONTROLLER
> >
> > +config CLK_RENESAS_VBATTB
> > +     bool "Renesas VBATTB clock controller"
>
> tristate

Good point.
However, does it work as a module, or would that break the RTC?

And this is missing

        depends on ARCH_RENESAS || COMPILE_TEST

which I can add while applying.

>
> > +     select RESET_CONTROLLER
> > +

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

