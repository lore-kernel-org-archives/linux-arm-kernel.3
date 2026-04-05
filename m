Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C157E9D800
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Apr 2026 15:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NLhNzGMOgKlXfHjypiVdn/OKo3D9FPy3aHDyUjhbrTA=; b=EcUT8jkxQbsq4wJ61S8EyzA8dP
	mcpL8EcdRwfJNSEAEwgrE4k7bHwPBgH11+44r9BnHbbjRM4kpk/efRZ93ZvmnwNO5MKQy5IXozvdD
	LQgN0xyCmvnFS6URPDAdX7KCiKFuVJVWlzCLxvnjUCXlSyKtHGIs6oAzVVgwcGv1NJ/sv/B4GMJC9
	hdhi69kG1qpF3jviJDJ1+HUQqjzEgdJS8rz4ot11uVnXycWHHbyKgJ63qBROY6eOCh2ccMSmn6m1y
	GrX5h9ZL2sWSihyMrAZlFcAS3IIcTYFBbPMXb5WGzh/hDHa61kSJgBUsGKmdIEtdf/uyZxXDaN8DJ
	XG1f37yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9POJ-00000004Jk6-2hM9;
	Sun, 05 Apr 2026 15:27:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9POH-00000004Jjg-49G9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Apr 2026 15:27:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 048E81BC0;
	Sun,  5 Apr 2026 08:27:49 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E34383F62B;
	Sun,  5 Apr 2026 08:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775402874; bh=NDnBsbXnNGGHQG0turWSfj4CBg3TO2qRC78L3hPeXs4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KvQWd+GlyQ26qJRkqKLtd0rZhhvYeTZuhURhP2De+TrJdzHLaXomuaxGKCg7V+Nmu
	 Cq76diR6Q/0tGfEMAOK8ZxI5sR+DH/t5TeJTkhUA5i4JJEJ6ngsn8s9++hzFvakxNn
	 hubn+aHBCVzSVgfa8MK94n19vR39SYApBGMpstuA=
Date: Sun, 5 Apr 2026 17:27:38 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] pinctrl: sunxi: a523: Remove unneeded IRQ
 remuxing flag
Message-ID: <20260405172738.02530c80@ryzen.lan>
In-Reply-To: <CAGb2v64A0rgiMkTCdvq-pVfzCTqWKqc=nx69B9tD7A8_E7vHUg@mail.gmail.com>
References: <20260327113006.3135663-1-andre.przywara@arm.com>
	<20260327113006.3135663-2-andre.przywara@arm.com>
	<CAGb2v64A0rgiMkTCdvq-pVfzCTqWKqc=nx69B9tD7A8_E7vHUg@mail.gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_082758_156500_276B1977 
X-CRM114-Status: GOOD (  27.46  )
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

On Fri, 27 Mar 2026 19:38:57 +0800
Chen-Yu Tsai <wens@kernel.org> wrote:

Hi Linus,

> On Fri, Mar 27, 2026 at 7:30=E2=80=AFPM Andre Przywara <andre.przywara@ar=
m.com> wrote:
> >
> > The Allwinner A10 and H3 SoCs cannot read the state of a GPIO line when
> > that line is muxed for IRQ triggering (muxval 6), but only if it's
> > explicitly muxed for GPIO input (muxval 0). Other SoCs do not show this
> > behaviour, so we added a optional workaround, triggered by a quirk bit,
> > which triggers remuxing the pin when it's configured for IRQ, while we
> > need to read its value.
> >
> > For some reasons this quirk flag was copied over to newer SoCs, even
> > though they don't show this behaviour, and the GPIO data register
> > reflects the true GPIO state even with a pin muxed to IRQ trigger.
> >
> > Remove the unneeded quirk from the A523 family, where it's definitely
> > not needed (confirmed by experiments), and where it actually breaks,
> > because the workaround is not compatible with the newer generation
> > pinctrl IP used in that chip.
> >
> > Together with a DT change this fixes GPIO IRQ operation on the A523
> > family of SoCs, as for instance used for the SD card detection.
> >
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > Fixes: b8a51e95b376 ("pinctrl: sunxi: Add support for the secondary A52=
3 GPIO ports") =20
>=20
> Acked-by: Chen-Yu Tsai <wens@kernel.org>

Can you possibly take this patch and maybe the binding (PATCH v2 2/3)?
Ideally still for v7.0? IIUC Chen-Yu would take the DT patch, but
relies on those two here.

Thanks,
Andre


>=20
> > ---
> >  drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c | 1 -
> >  drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c   | 1 -
> >  2 files changed, 2 deletions(-)
> >
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c b/drivers/pi=
nctrl/sunxi/pinctrl-sun55i-a523-r.c
> > index 69cd2b4ebd7d..462aa1c4a5fa 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
> > @@ -26,7 +26,6 @@ static const u8 a523_r_irq_bank_muxes[SUNXI_PINCTRL_M=
AX_BANKS] =3D
> >  static struct sunxi_pinctrl_desc a523_r_pinctrl_data =3D {
> >         .irq_banks =3D ARRAY_SIZE(a523_r_irq_bank_map),
> >         .irq_bank_map =3D a523_r_irq_bank_map,
> > -       .irq_read_needs_mux =3D true,
> >         .io_bias_cfg_variant =3D BIAS_VOLTAGE_PIO_POW_MODE_SEL,
> >         .pin_base =3D PL_BASE,
> >  };
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c b/drivers/pinc=
trl/sunxi/pinctrl-sun55i-a523.c
> > index 7d2308c37d29..b6f78f1f30ac 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
> > @@ -26,7 +26,6 @@ static const u8 a523_irq_bank_muxes[SUNXI_PINCTRL_MAX=
_BANKS] =3D
> >  static struct sunxi_pinctrl_desc a523_pinctrl_data =3D {
> >         .irq_banks =3D ARRAY_SIZE(a523_irq_bank_map),
> >         .irq_bank_map =3D a523_irq_bank_map,
> > -       .irq_read_needs_mux =3D true,
> >         .io_bias_cfg_variant =3D BIAS_VOLTAGE_PIO_POW_MODE_SEL,
> >  };
> >
> > --
> > 2.43.0
> > =20
>=20


