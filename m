Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A968D59D99
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Dec 2025 14:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xAYIybz6RXAuMfc63mvTtUvJpNs4ZOFCF/rqWwLHNBk=; b=Cdb1g1aWsJBKx4d2ZeawwSJiE8
	CXPvvkCmwk8ej4ZnFq5zzgUSSSSpb3n5b3Se+JqSLIYIyiW43hnZCmBL4wDIIk7SSeAMOGZM5jvJu
	5kUuh6ncRyn0A9E/E6HebfZTyz91PXGXqlsRWtWc4ZGZ6zIcf6Vomfnf+NxIVulkFEiE+9+8VzPJG
	/x0S/Gmy9YEsLNqTSp00JijI6WIeXzWyh3m2ZhJmKoyOtGdTC3J5FCJ7jbLPyZ8VdKLjudAu6IeE3
	xbbPERzMLjQCyJkCHbQvUAnt/+iVO1o4UwctcN1/yDd2Zv+ypPYLkTSRjVM4XnQ+AazHfs10nBFi2
	f4D/7H3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUnIc-00000002WcI-071Q;
	Sun, 14 Dec 2025 14:42:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUnIZ-00000002Wbg-1SDs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Dec 2025 14:42:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6694043FFD
	for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Dec 2025 14:42:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46079C19424
	for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Dec 2025 14:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765723329;
	bh=oD/KggYabkmpbLwMi9JfkWOU4h7CawiUNWnQZdptfFE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=A2NEGrJ8Ca/wyaS8iRk2pzHKLF/U3QmLusVXaZzxtH9hznjnkyrH6Q/SO6I737Qxx
	 1fnX7nPsD0UrqCV3BjIUBod3S7jfToHWUitD6rzVImFvrO0lFbm/NjP6mXRiqEI8Kg
	 5RayiPIrLIuvSKmWEqIm/eyoTPZJzFE3Tdrcwb9QtM0xtgOQNsKcp9KV0Fv7/xm7nA
	 hoADE0vZQgXHuxAv4KjtwdWC5e9aXv5ESFuJNjcCF23fKz1TOw51W4sNiz8JvB+kKK
	 4m+lkZRUyp3K39p/uLOzqFgk47oFMmO68FQdxZpYgAlkCgcEpj0gVf2XDyK1bEC0dR
	 Mp/ViGbY8qe1w==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b7697e8b01aso506570366b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Dec 2025 06:42:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWJq174pFsgNVG6bk16vn7ad8Abxg30Ig+kP9pxJJr2Ea4rM1S0lEVxQb/ZDAY3+T6Y/WtLScmL6HigeuwxLfaN@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3lYcD6m/c6tOy85H61+Mir3Eb6P0CcgcvJGaRBT+9vIlEOZ2U
	BsRiQxcGJhEgAn8XBlvZ7bG7YixCQgh2ddtj+2T9NcNI4sUDxZ77ggk/3VMQ802Sa8HQfc8gZyA
	xkOyu8w7UnXGOf7bwFO7tFjmed0gUYw==
X-Google-Smtp-Source: AGHT+IH/UNXJVVIzYMzF70T0zT2ePS4CZo3kLeaqHyUCNx7LNUsqU6Z3vZR8gWlhInbPYIFxkyNcgz3+uHF1VkK6TAw=
X-Received: by 2002:a17:907:3f28:b0:b73:8903:f4b9 with SMTP id
 a640c23a62f3a-b7d23a813bdmr836277766b.24.1765723327827; Sun, 14 Dec 2025
 06:42:07 -0800 (PST)
MIME-Version: 1.0
References: <20251212203226.458694-5-robh@kernel.org> <20251213181324.u32ztfblkknfpz44@pengutronix.de>
In-Reply-To: <20251213181324.u32ztfblkknfpz44@pengutronix.de>
From: Rob Herring <robh@kernel.org>
Date: Sun, 14 Dec 2025 08:41:56 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK9OREenZjBHrDh7AqsyUXYOzTOhY4e0qHGzYkX8tacWQ@mail.gmail.com>
X-Gm-Features: AQt7F2o1cvCAKghlM7oUFNsydZljaReVAverYw-RqgPCazmU6RqIU2uWyYXg6mg
Message-ID: <CAL_JsqK9OREenZjBHrDh7AqsyUXYOzTOhY4e0qHGzYkX8tacWQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: nxp/imx6: Drop unused .dtsi
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, barebox@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_064211_446243_5E665595 
X-CRM114-Status: GOOD (  19.07  )
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

On Sat, Dec 13, 2025 at 12:13=E2=80=AFPM Marco Felsch <m.felsch@pengutronix=
.de> wrote:
>
> Hi Rob,
>
> On 25-12-12, Rob Herring (Arm) wrote:
> > These .dtsi files are not included anywhere in the tree and can't be
> > tested.
>
> not in the tree but by other projects, please see below.
>
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> >  .../dts/nxp/imx/imx6dl-kontron-samx6i.dtsi    | 12 -----
> >  .../dts/nxp/imx/imx6q-kontron-samx6i.dtsi     | 12 -----
> >  .../boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi  | 45 ----------------
> >  .../boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi  | 54 -------------------
> >  4 files changed, 123 deletions(-)
> >  delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dts=
i
> >  delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi
> >  delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi
> >  delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi
> >
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi b/arc=
h/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi
> > deleted file mode 100644
> > index 5a9b819d7ee8..000000000000
> > --- a/arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi
> > +++ /dev/null
> > @@ -1,12 +0,0 @@
> > -// SPDX-License-Identifier: GPL-2.0 OR X11
> > -/*
> > - * Copyright 2019 (C) Pengutronix, Marco Felsch <kernel@pengutronix.de=
>
> > - */
> > -
> > -#include "imx6dl.dtsi"
> > -#include "imx6qdl-kontron-samx6i.dtsi"
> > -
> > -/ {
> > -     model =3D "Kontron SMARC-sAMX6i Dual-Lite/Solo";
> > -     compatible =3D "kontron,imx6dl-samx6i", "fsl,imx6dl";
> > -};
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi b/arch=
/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi
> > deleted file mode 100644
> > index e76963436079..000000000000
> > --- a/arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi
> > +++ /dev/null
> > @@ -1,12 +0,0 @@
> > -// SPDX-License-Identifier: GPL-2.0 OR X11
> > -/*
> > - * Copyright 2019 (C) Pengutronix, Marco Felsch <kernel@pengutronix.de=
>
> > - */
> > -
> > -#include "imx6q.dtsi"
> > -#include "imx6qdl-kontron-samx6i.dtsi"
> > -
> > -/ {
> > -     model =3D "Kontron SMARC-sAMX6i Quad/Dual";
> > -     compatible =3D "kontron,imx6q-samx6i", "fsl,imx6q";
> > -};
>
> I can't speak for the other two .dtsi files but both kontron .dtsi files
> are used by barebox:
>
>  - https://elixir.bootlin.com/barebox/v2025.11.0/source/arch/arm/dts/imx6=
dl-samx6i.dts#L8
>  - https://elixir.bootlin.com/barebox/v2025.11.0/source/arch/arm/dts/imx6=
q-samx6i.dts#L8
>
> Removing them here will cause a regression for barebox.

Please upstream something that uses the .dtsi. Other than the
undocumented barebox property, no reason these can't be.

Rob

