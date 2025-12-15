Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0684D5B86B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 19:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=abUQvRA+jHEqh1JKEQZz+wrimh08nBQhMEsoNkfIU24=; b=xWX0hsVpt0JMoDipPbClstHf+z
	SzgvaR6T7HrHJjx9gor4q9LjL5XH39mH7jfidxXpRtowj/atkM3R6YR7qWHqPwFs6dCrg+7pze/nD
	7Rn8VuuccayPUGoe0+xW/pGR/NY12Flp3tt3m/mUwbqXgY3MlwlyMhR2tMtGIP9g0ThrlDAIC9QCn
	5Y2xmtw2cH+VcrimQP4rA/Tcx+NkNp+TUK+7LciDFr988wRjTYwqKUbjYGL23U1I4XmfACxRoGuGG
	7EOD+nbxq2K3RjQf9jYibAOQBsmZq7oioM78BHY5ii867Fct4Suy8CbkQ7czOwbnS0c1M6ftrArO2
	SJBFxmIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVETu-00000004Bp0-0VsP;
	Mon, 15 Dec 2025 19:43:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVETr-00000004BoI-2Up9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 19:43:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 024A14171C
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 19:43:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6FBBC19421
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 19:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765827818;
	bh=QAMKKq+/07OKE2edah45Zywl8LeTi9tuqwkGpLjZYEw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Lr1QKPfqEyJs2mElL49XB3Xk2OXVxH/EgZmIn1wn6i+z/CS3iNmUvNogoPRxnHhTG
	 4tpin1V4wdgX80vIXVTFA5+a7wLW0de1EEDOIiiA18gH/G+5dhV2wlxJX2i+2nG/RE
	 e1fRLGrpqBiqkjHnImlqqYrSJXwstSmrkNhEUYVShg82aj7F+268NIAAlEAxJezjwa
	 lJ7gqnGhkg0L+8jCBtZGP54hZ1v/R+7FDUFQ8eGUOPVJnBQe9akPPWaRxc/O1X4FYe
	 IdxSGdR9BqaZ1+tPEUIHxQTSNoQtOMKk0Ek7CExDjo5ZdJQQGL18DSq6ger/wTPxoS
	 q19CpWhhFgK9w==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b79e7112398so783393466b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 11:43:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUKYhc538JcaqSNUlAErr4SGACmC92d/weFT9odIcFvhIfWGfx/fBuFKENZyOJCm9nMiu7yT8cAdDX9bhnDTi/0@lists.infradead.org
X-Gm-Message-State: AOJu0YwIpU5L5NYVS3UEGdJlyuWDQQ3IX6BMmIP7nbaVQ/MwOBY031oW
	wT9OjTAporruKPAcqsXCRRiWJ7VdcL4sRFDsymJE0YMJhpj8sF55UjKdrEbNJZH1miuUYr97Cc9
	7J5rkDYte39Pf4cM50nV4Rfz8M2nrMQ==
X-Google-Smtp-Source: AGHT+IHPOvW2BGVu2D4Ir+xTf+ZrZ0oTHwKdRBT3jQdNMTbk0Ko9WuWTep47Nqx4mbBndw2hB+2iEYVbKpnnkmMFsi4=
X-Received: by 2002:a17:907:7e97:b0:b74:983b:4056 with SMTP id
 a640c23a62f3a-b7d235c8495mr1177908366b.8.1765827817406; Mon, 15 Dec 2025
 11:43:37 -0800 (PST)
MIME-Version: 1.0
References: <20251212203226.458694-5-robh@kernel.org> <20251213181324.u32ztfblkknfpz44@pengutronix.de>
 <CAL_JsqK9OREenZjBHrDh7AqsyUXYOzTOhY4e0qHGzYkX8tacWQ@mail.gmail.com> <20251214185750.tzt6jf4zg5gtex63@pengutronix.de>
In-Reply-To: <20251214185750.tzt6jf4zg5gtex63@pengutronix.de>
From: Rob Herring <robh@kernel.org>
Date: Mon, 15 Dec 2025 13:43:25 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLfVemq9k3x5J1pTz--Z+VYLeEQrFdbtdS7Pc-HkRui=w@mail.gmail.com>
X-Gm-Features: AQt7F2oiZD_a6RbSn-VyOWgON7AhmUCDA0yS1ZH9l8th1WHWsPTGvW7f6u1q7WA
Message-ID: <CAL_JsqLfVemq9k3x5J1pTz--Z+VYLeEQrFdbtdS7Pc-HkRui=w@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: nxp/imx6: Drop unused .dtsi
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, barebox@lists.infradead.org, frieder.schrempf@kontron.de, 
	annette.kobou@kontron.de, oualid.derouiche@kontron.de, 
	eberhard.stoll@kontron.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_114339_683316_1691B773 
X-CRM114-Status: GOOD (  29.00  )
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

On Sun, Dec 14, 2025 at 12:58=E2=80=AFPM Marco Felsch <m.felsch@pengutronix=
.de> wrote:
>
> On 25-12-14, Rob Herring wrote:
> > On Sat, Dec 13, 2025 at 12:13=E2=80=AFPM Marco Felsch <m.felsch@pengutr=
onix.de> wrote:
> > >
> > > Hi Rob,
> > >
> > > On 25-12-12, Rob Herring (Arm) wrote:
> > > > These .dtsi files are not included anywhere in the tree and can't b=
e
> > > > tested.
> > >
> > > not in the tree but by other projects, please see below.
> > >
> > > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > > ---
> > > >  .../dts/nxp/imx/imx6dl-kontron-samx6i.dtsi    | 12 -----
> > > >  .../dts/nxp/imx/imx6q-kontron-samx6i.dtsi     | 12 -----
> > > >  .../boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi  | 45 ---------------=
-
> > > >  .../boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi  | 54 ---------------=
----
> > > >  4 files changed, 123 deletions(-)
> > > >  delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i=
.dtsi
> > > >  delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.=
dtsi
> > > >  delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-pico-dwarf.dt=
si
> > > >  delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-pico-nymph.dt=
si
> > > >
> > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi b=
/arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi
> > > > deleted file mode 100644
> > > > index 5a9b819d7ee8..000000000000
> > > > --- a/arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi
> > > > +++ /dev/null
> > > > @@ -1,12 +0,0 @@
> > > > -// SPDX-License-Identifier: GPL-2.0 OR X11
> > > > -/*
> > > > - * Copyright 2019 (C) Pengutronix, Marco Felsch <kernel@pengutroni=
x.de>
> > > > - */
> > > > -
> > > > -#include "imx6dl.dtsi"
> > > > -#include "imx6qdl-kontron-samx6i.dtsi"
> > > > -
> > > > -/ {
> > > > -     model =3D "Kontron SMARC-sAMX6i Dual-Lite/Solo";
> > > > -     compatible =3D "kontron,imx6dl-samx6i", "fsl,imx6dl";
> > > > -};
> > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi b/=
arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi
> > > > deleted file mode 100644
> > > > index e76963436079..000000000000
> > > > --- a/arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi
> > > > +++ /dev/null
> > > > @@ -1,12 +0,0 @@
> > > > -// SPDX-License-Identifier: GPL-2.0 OR X11
> > > > -/*
> > > > - * Copyright 2019 (C) Pengutronix, Marco Felsch <kernel@pengutroni=
x.de>
> > > > - */
> > > > -
> > > > -#include "imx6q.dtsi"
> > > > -#include "imx6qdl-kontron-samx6i.dtsi"
> > > > -
> > > > -/ {
> > > > -     model =3D "Kontron SMARC-sAMX6i Quad/Dual";
> > > > -     compatible =3D "kontron,imx6q-samx6i", "fsl,imx6q";
> > > > -};
> > >
> > > I can't speak for the other two .dtsi files but both kontron .dtsi fi=
les
> > > are used by barebox:
> > >
> > >  - https://elixir.bootlin.com/barebox/v2025.11.0/source/arch/arm/dts/=
imx6dl-samx6i.dts#L8
> > >  - https://elixir.bootlin.com/barebox/v2025.11.0/source/arch/arm/dts/=
imx6q-samx6i.dts#L8
> > >
> > > Removing them here will cause a regression for barebox.
> >
> > Please upstream something that uses the .dtsi. Other than the
> > undocumented barebox property, no reason these can't be.
>
> My intention wasn't to point to the barebox-only
> "barebox,disable-deep-probe" property. I was refering to the include
> line.
>
> The two .dtsi files we're talking about are SoM .dtsi files. We don't
> have access to the Kontron EVK baseboard which uses this SoM.
>
> I've added a few Kontron devs which may can add the missing baseboard
> support.
>
> +Cc: frieder.schrempf@kontron.de
> +Cc: annette.kobou@kontron.de
> +Cc: oualid.derouiche@kontron.de
> +Cc: eberhard.stoll@kontron.de
>
> I could also add the imx6dl-samx6i.dts and imx6q-samx6i.dts like we do
> in barebox. But as said, this would be a devicetree for a SoM which
> makes sense for the bootloader but not for the kernel.

Why not? People use the kernel as a bootloader. There's also some
discussions about splitting SoMs and baseboards into overlays for
baseboards (and also even into SoC base DT plus overlay for boards).

Rob

