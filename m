Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA5ECCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 08:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ut4oMSTk7b+dbxdcRqPmARJS+jrrJjq3W66XwW6y+Is=; b=xUSM4fGnQgjJeWz6Ujk5riz2xp
	zYkFHvIOGskvB5Hc39oLqNawx/WLLJVWOLCbA9xl+woVlWYxDPoxa8DfweK105D5QpCs9CvmENmHV
	vwDw80FghD4x7yPMrdX29Q0Ik3VyPPgI1c3U9IJxrHMudI2oUvZENo9eQiwfZ224OacH1bvZdcjuI
	+FqSDUkTADyq2LHtlHfgQVxzYkqfjZmT0C4BV3bKQj5k4eq/230EHx9ZRbGpVmI3NlNZXLxgnyHT0
	fIXM3yRMtXw6uf0gSTlPIfJKWqAEiPvx3Xi77mBI1eL3AE5IJyPAipFzuP9wuzPs22UW65ONYVNP0
	0I2EblWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHeZI-00000002tEW-3jyq;
	Sat, 08 Nov 2025 08:45:09 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHeZG-00000002tDX-2TUA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 08:45:08 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 27DBE44397;
	Sat,  8 Nov 2025 08:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1762591503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ut4oMSTk7b+dbxdcRqPmARJS+jrrJjq3W66XwW6y+Is=;
	b=VOyICK/rKVAf+5hSjx4sY+TNKvms0h4bmOjcjtfCx7bz0rSILztPuq5cp7jm9U0FXsSe5h
	q2CTxl4wUnwjEjb1Cjealcy0XWMiXgbo4mg6UAQsMkjMskjdx+m2NszVX9ojDMw4WY2/jI
	KMPiX1Ddv02K8gG+dP2NK/ps+fVpGAK1vsFW79VMdfEcDcxSwMKmZVBNgv/XXLN0CjevMZ
	QAANcltrF82vOEMLag8869sGiDuF8gPSWNKH674ET01WdHoH083+FZtgs0OdnV0Iz0LJb3
	SfNiJ37Q06K8mJ4q9VuOlyRQCZ0RLl+E0N8wpDplo3nVR9qj8e+N5q0NkydHJQ==
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Greg Ungerer <gerg@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] m68k: coldfire: Add RNG support for MCF54418
Date: Sat, 08 Nov 2025 09:44:47 +0100
Message-ID: <6209223.lOV4Wx5bFT@jeanmichel-ms7b89>
In-Reply-To: <aQ4ZLl5ssB/4uq2f@lizhi-Precision-Tower-5810>
References: <20251107-b4-m5441x-add-rng-support-v2-0-f91d685832b9@yoseli.org>
 <20251107-b4-m5441x-add-rng-support-v2-2-f91d685832b9@yoseli.org>
 <aQ4ZLl5ssB/4uq2f@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduledvtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkfgjfhgggfgtsehtqhertddttdejnecuhfhrohhmpeflvggrnhdqofhitghhvghlucfjrghuthgsohhishcuoehjvggrnhhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghlihdrohhrgheqnecuggftrfgrthhtvghrnhepffevhfduvdeludeugfdtleduuedvhfeuvdevgfeiieefieevteektdettdeifeetnecukfhppedvrgdtudemvgdtrgemudeileemjedugedtmedvrgegtdemfhefrggrmeejudejvgemudefsgdvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmeduieelmeejudegtdemvdgrgedtmehffegrrgemjedujegvmedufegsvddphhgvlhhopehjvggrnhhmihgthhgvlhdqmhhsjegskeelrdhlohgtrghlnhgvthdpmhgrihhlfhhrohhmpehjvggrnhhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghlihdrohhrghdpnhgspghrtghpthhtohepudegpdhrtghpthhtohephfhrrghnkhdrlhhisehngihprdgtohhmpdhrtghpthhtohepghgvrhhgsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehgvggvrhhtsehlihhnu
 higqdhmieekkhdrohhrghdprhgtphhtthhopeholhhivhhirgesshgvlhgvnhhitgdrtghomhdprhgtphhtthhopehhvghrsggvrhhtsehgohhnughorhdrrghprghnrgdrohhrghdrrghupdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggv
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_004506_766270_5D3E1526 
X-CRM114-Status: GOOD (  33.56  )
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

Hi Frank,

Le vendredi 7 novembre 2025, 17:07:10 heure normale d=E2=80=99Europe centra=
le Frank Li=20
a =C3=A9crit :
> On Fri, Nov 07, 2025 at 11:29:44AM +0100, Jean-Michel Hautbois wrote:
> > Add platform device support for the MCF54418 RNGB hardware with clock
> > enabled at platform initialization.
> >=20
> > The imx-rngc driver now uses devm_clk_get_optional() to support both
> > Coldfire (always-on clock) and i.MX platforms (managed clock).
> >=20
> > Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> > ---
> >=20
> >  arch/m68k/coldfire/device.c       | 28 ++++++++++++++++++++++++++++
> >  arch/m68k/coldfire/m5441x.c       |  2 +-
> >  arch/m68k/include/asm/m5441xsim.h |  9 +++++++++
> >  drivers/char/hw_random/Kconfig    |  3 ++-
> >  drivers/char/hw_random/imx-rngc.c |  9 ++++++++-
> >  5 files changed, 48 insertions(+), 3 deletions(-)
>=20
> Most likely need two patches, one patch change rngc use
> devm_clk_get_optional(). one patch update arch/m68k/coldfire.
>=20
> so difference mantainer can pick up easily.

Thanks for this suggestion, I will split this into two for v3. I am just=20
waiting a bit to see if other remarks are emerging, in order to not spam wi=
th=20
multiple versions :-).

Thanks,
JM

>=20
> Frank
>=20
> > diff --git a/arch/m68k/coldfire/device.c b/arch/m68k/coldfire/device.c
> > index
> > 20adba27a687029ef53249bad71b342d563d612b..4183929b0b501459da25d1b4cde7d=
77
> > f19c3dc16 100644 --- a/arch/m68k/coldfire/device.c
> > +++ b/arch/m68k/coldfire/device.c
> > @@ -622,6 +622,31 @@ static struct platform_device mcf_flexcan0 =3D {
> >=20
> >  };
> >  #endif /* MCFFLEXCAN_SIZE */
> >=20
> > +#ifdef MCF_RNG_BASE
> > +/*
> > + * Random Number Generator (RNG) - only on MCF54418
> > + */
> > +static const struct resource mcf_rng_resource[] =3D {
> > +	{
> > +		.start =3D MCF_RNG_BASE,
> > +		.end   =3D MCF_RNG_BASE + MCF_RNG_SIZE - 1,
> > +		.flags =3D IORESOURCE_MEM,
> > +	},
> > +	{
> > +		.start =3D MCF_IRQ_RNG,
> > +		.end   =3D MCF_IRQ_RNG,
> > +		.flags =3D IORESOURCE_IRQ,
> > +	},
> > +};
> > +
> > +static struct platform_device mcf_rng =3D {
> > +	.name           =3D "imx-rngc",
> > +	.id             =3D -1,
> > +	.num_resources  =3D ARRAY_SIZE(mcf_rng_resource),
> > +	.resource       =3D mcf_rng_resource,
> > +};
> > +#endif /* MCF_RNG_BASE */
> > +
> >=20
> >  static struct platform_device *mcf_devices[] __initdata =3D {
> > =20
> >  	&mcf_uart,
> > =20
> >  #ifdef MCFFEC_BASE0
> >=20
> > @@ -660,6 +685,9 @@ static struct platform_device *mcf_devices[]
> > __initdata =3D {>=20
> >  #ifdef MCFFLEXCAN_SIZE
> > =20
> >  	&mcf_flexcan0,
> > =20
> >  #endif
> >=20
> > +#ifdef MCF_RNG_BASE
> > +	&mcf_rng,
> > +#endif
> >=20
> >  };
> > =20
> >  /*
> >=20
> > diff --git a/arch/m68k/coldfire/m5441x.c b/arch/m68k/coldfire/m5441x.c
> > index
> > 7a25cfc7ac07570ff15da3c55d080a717cf93a06..ab5b006372379294db3b522820de8=
81
> > 37bfb7e78 100644 --- a/arch/m68k/coldfire/m5441x.c
> > +++ b/arch/m68k/coldfire/m5441x.c
> > @@ -158,6 +158,7 @@ static struct clk * const enable_clks[] __initconst=
 =3D
> > {
> >=20
> >  	&__clk_0_33, /* pit.1 */
> >  	&__clk_0_37, /* eport */
> >  	&__clk_0_48, /* pll */
> >=20
> > +	&__clk_0_49, /* rng */
> >=20
> >  	&__clk_0_51, /* esdhc */
> >  =09
> >  	&__clk_1_36, /* CCM/reset module/Power management */
> >=20
> > @@ -179,7 +180,6 @@ static struct clk * const disable_clks[] __initcons=
t =3D
> > {>=20
> >  	&__clk_0_44, /* usb otg */
> >  	&__clk_0_45, /* usb host */
> >  	&__clk_0_47, /* ssi.0 */
> >=20
> > -	&__clk_0_49, /* rng */
> >=20
> >  	&__clk_0_50, /* ssi.1 */
> >  	&__clk_0_53, /* enet-fec */
> >  	&__clk_0_54, /* enet-fec */
> >=20
> > diff --git a/arch/m68k/include/asm/m5441xsim.h
> > b/arch/m68k/include/asm/m5441xsim.h index
> > f48cf63bd7822fd53c33788128f984585c0c421a..dd64cdfcad3e810254c6854b9de5b=
6b
> > beb67b950 100644 --- a/arch/m68k/include/asm/m5441xsim.h
> > +++ b/arch/m68k/include/asm/m5441xsim.h
> > @@ -198,6 +198,15 @@
> >=20
> >  #define MCFRTC_SIZE		(0xfc0a8840 - 0xfc0a8000)
> >  #define MCF_IRQ_RTC		(MCFINT2_VECBASE + MCFINT2_RTC)
> >=20
> > +/*
> > + *  Random Number Generator (RNG) Module.
> > + *  Note: Only present in MCF54418, not in MCF54410/54415/54417
> > + */
> > +#define MCF_RNG_BASE		0xfc0c4000
> > +#define MCF_RNG_SIZE		0x1c
> > +#define MCFINT2_RNG		28
> > +#define MCF_IRQ_RNG		(MCFINT2_VECBASE + MCFINT2_RNG)
> > +
> >=20
> >  /*
> > =20
> >   *  GPIO Module.
> >   */
> >=20
> > diff --git a/drivers/char/hw_random/Kconfig
> > b/drivers/char/hw_random/Kconfig index
> > 492a2a61a65be8bd9e46b0a70f3e43703973512e..e046eabaac2d9053a5a4a98c6e373=
3b
> > b19258e54 100644 --- a/drivers/char/hw_random/Kconfig
> > +++ b/drivers/char/hw_random/Kconfig
> > @@ -270,12 +270,13 @@ config HW_RANDOM_MXC_RNGA
> >=20
> >  config HW_RANDOM_IMX_RNGC
> > =20
> >  	tristate "Freescale i.MX RNGC Random Number Generator"
> >  	depends on HAS_IOMEM
> >=20
> > -	depends on SOC_IMX25 || SOC_IMX6SL || SOC_IMX6SLL || SOC_IMX6UL ||
> > COMPILE_TEST +	depends on SOC_IMX25 || SOC_IMX6SL || SOC_IMX6SLL ||
> > SOC_IMX6UL || M5441x || COMPILE_TEST>=20
> >  	default HW_RANDOM
> >  	help
> >  =09
> >  	  This driver provides kernel-side support for the Random Number
> >  	  Generator Version C hardware found on some Freescale i.MX
> >  	  processors. Version B is also supported by this driver.
> >=20
> > +	  Also supports RNGB on Freescale MCF54418 (Coldfire V4e).
> >=20
> >  	  To compile this driver as a module, choose M here: the
> >  	  module will be called imx-rngc.
> >=20
> > diff --git a/drivers/char/hw_random/imx-rngc.c
> > b/drivers/char/hw_random/imx-rngc.c index
> > 241664a9b5d9ac7244f15cbe5d5302ca3787ebea..44f20a05de0a425cb6ff7b2a347b1=
11
> > 750ac3702 100644 --- a/drivers/char/hw_random/imx-rngc.c
> > +++ b/drivers/char/hw_random/imx-rngc.c
> > @@ -259,7 +259,7 @@ static int __init imx_rngc_probe(struct
> > platform_device *pdev)>=20
> >  	if (IS_ERR(rngc->base))
> >  =09
> >  		return PTR_ERR(rngc->base);
> >=20
> > -	rngc->clk =3D devm_clk_get(&pdev->dev, NULL);
> > +	rngc->clk =3D devm_clk_get_optional(&pdev->dev, NULL);
> >=20
> >  	if (IS_ERR(rngc->clk))
> >  =09
> >  		return dev_err_probe(&pdev->dev, PTR_ERR(rngc->clk),=20
"Cannot get
> >  		rng_clk\n");>=20
> > @@ -353,12 +353,19 @@ static const struct of_device_id imx_rngc_dt_ids[=
] =3D
> > {>=20
> >  };
> >  MODULE_DEVICE_TABLE(of, imx_rngc_dt_ids);
> >=20
> > +static const struct platform_device_id imx_rngc_devtype[] =3D {
> > +	{ .name =3D "imx-rngc" },
> > +	{ /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(platform, imx_rngc_devtype);
> > +
> >=20
> >  static struct platform_driver imx_rngc_driver =3D {
> > =20
> >  	.driver =3D {
> >  =09
> >  		.name =3D KBUILD_MODNAME,
> >  		.pm =3D pm_ptr(&imx_rngc_pm_ops),
> >  		.of_match_table =3D imx_rngc_dt_ids,
> >  =09
> >  	},
> >=20
> > +	.id_table =3D imx_rngc_devtype,
> >=20
> >  };
> > =20
> >  module_platform_driver_probe(imx_rngc_driver, imx_rngc_probe);
> >=20
> > --
> > 2.39.5





