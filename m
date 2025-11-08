Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC61CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 08:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1BcSff+w7XN9iYMNztCvj5o73XF0ex3886lxRpX6opI=; b=aE9UIvJTQ/zuIFNCDA8x930nfE
	mLEnv843RQRYfmdcABpJre1lY0j6T//0/qCV3+M+8Ux7xLq0q3nV5TqS64chmrcH3NnDfo6SLdM3C
	EvVOkhieiiuuVTwZ9uYf8934nM3ytxdvbenrGMr2PQKMriymCGjjxRJxvn1FHdE2x9fUnV/rvp3ip
	lwmO1vzKH2EhWjQvGmgtoqHxLaYpGxU40ZRt3boE5HUFQRGvafVvASf9SyRUfooemXjsOfrjv9BMI
	aSPO5eO2cMPTpazXKnvj8bG2kX7ppRsAecZL/CoZkwQ94ZdELV0kzyxABvybPO3yL6L8rFSb0T74M
	L76Bf1sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHeY2-00000002t1j-21ZN;
	Sat, 08 Nov 2025 08:43:50 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHeXx-00000002t1I-0kKz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 08:43:47 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7685F43DB2;
	Sat,  8 Nov 2025 08:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1762591421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1BcSff+w7XN9iYMNztCvj5o73XF0ex3886lxRpX6opI=;
	b=jdvq+Ua5v3P0+4sjeVU2QwvTQcdchBd48JjlGqw12TMjMJs/FNc+iWt3lAsKvW5LKRwfg2
	fDE07lD46EAayqriwKSAxbVBS5aVYShSOyga8wwCFLYdIf/gADx+xwZo057hwWSSypBBLV
	iuYi3aWbCm7ErYz5bNVNqDuhJy4MVm7xoKU0jQoAGM3tC+d11xReLI4JTLnXVBwo2oteBt
	ND4N0OK70MUHg88zHzGw3sL9eRYS9wU+TRzH4K4dvt8Yh+qjVVdd6IfxiRL9GLhEnJoFYv
	WhgOhjwTAm7YJA7+ZW/Ei9vUPb4K5TvesitIPnRfyeilXL8PMsGHXMqccbVEww==
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
Subject: Re: [PATCH v2 1/2] m68k: coldfire: Mark platform device resource arrays as
 const
Date: Sat, 08 Nov 2025 09:43:25 +0100
Message-ID: <12775316.O9o76ZdvQC@jeanmichel-ms7b89>
In-Reply-To: <aQ4YELHOH/38d2aL@lizhi-Precision-Tower-5810>
References: <20251107-b4-m5441x-add-rng-support-v2-0-f91d685832b9@yoseli.org>
 <20251107-b4-m5441x-add-rng-support-v2-1-f91d685832b9@yoseli.org>
 <aQ4YELHOH/38d2aL@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduledvtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkfgjfhgggfgtsehtqhertddttdejnecuhfhrohhmpeflvggrnhdqofhitghhvghlucfjrghuthgsohhishcuoehjvggrnhhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghlihdrohhrgheqnecuggftrfgrthhtvghrnhepffevhfduvdeludeugfdtleduuedvhfeuvdevgfeiieefieevteektdettdeifeetnecukfhppedvrgdtudemvgdtrgemudeileemjedugedtmedvrgegtdemfhefrggrmeejudejvgemudefsgdvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmeduieelmeejudegtdemvdgrgedtmehffegrrgemjedujegvmedufegsvddphhgvlhhopehjvggrnhhmihgthhgvlhdqmhhsjegskeelrdhlohgtrghlnhgvthdpmhgrihhlfhhrohhmpehjvggrnhhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghlihdrohhrghdpnhgspghrtghpthhtohepudegpdhrtghpthhtohephfhrrghnkhdrlhhisehngihprdgtohhmpdhrtghpthhtohepghgvrhhgsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehgvggvrhhtsehlihhnu
 higqdhmieekkhdrohhrghdprhgtphhtthhopeholhhivhhirgesshgvlhgvnhhitgdrtghomhdprhgtphhtthhopehhvghrsggvrhhtsehgohhnughorhdrrghprghnrgdrohhrghdrrghupdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggv
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_004346_043689_E52CA482 
X-CRM114-Status: GOOD (  19.90  )
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

Le vendredi 7 novembre 2025, 17:02:24 heure normale d=E2=80=99Europe centra=
le Frank Li=20
a =C3=A9crit :
> On Fri, Nov 07, 2025 at 11:29:43AM +0100, Jean-Michel Hautbois wrote:
> > Add 'const' qualifier to all static resource arrays in device.c.
> > These arrays are never modified at runtime, they are only read by
> > platform device registration functions.
> >=20
> > Suggested-by: Frank Li <Frank.Li@nxp.com>
> > Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
>=20
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Thanks. It must be noted though that it generates warnings when building:

  CC      arch/m68k/coldfire/device.o
arch/m68k/coldfire/device.c:141:35: warning: initialization discards =E2=80=
=98const=E2=80=99=20
qualifier from pointer target type [-Wdiscarded-qualifiers]
  141 |         .resource               =3D mcf_fec0_resources,
      |                                   ^~~~~~~~~~~~~~~~~~
arch/m68k/coldfire/device.c:178:35: warning: initialization discards =E2=80=
=98const=E2=80=99=20
qualifier from pointer target type [-Wdiscarded-qualifiers]
  178 |         .resource               =3D mcf_fec1_resources,
      |                                   ^~~~~~~~~~~~~~~~~~
arch/m68k/coldfire/device.c:360:35: warning: initialization discards =E2=80=
=98const=E2=80=99=20
qualifier from pointer target type [-Wdiscarded-qualifiers]
  360 |         .resource               =3D mcf_i2c0_resources,
      |                                   ^~~~~~~~~~~~~~~~~~
arch/m68k/coldfire/device.c:381:35: warning: initialization discards =E2=80=
=98const=E2=80=99=20
qualifier from pointer target type [-Wdiscarded-qualifiers]
  381 |         .resource               =3D mcf_i2c1_resources,
      |                                   ^~~~~~~~~~~~~~~~~~
arch/m68k/coldfire/device.c:405:35: warning: initialization discards =E2=80=
=98const=E2=80=99=20
qualifier from pointer target type [-Wdiscarded-qualifiers]
  405 |         .resource               =3D mcf_i2c2_resources,
      |                                   ^~~~~~~~~~~~~~~~~~
arch/m68k/coldfire/device.c:429:35: warning: initialization discards =E2=80=
=98const=E2=80=99=20
qualifier from pointer target type [-Wdiscarded-qualifiers]
  429 |         .resource               =3D mcf_i2c3_resources,
      |                                   ^~~~~~~~~~~~~~~~~~
arch/m68k/coldfire/device.c:453:35: warning: initialization discards =E2=80=
=98const=E2=80=99=20
qualifier from pointer target type [-Wdiscarded-qualifiers]
  453 |         .resource               =3D mcf_i2c4_resources,
      |                                   ^~~~~~~~~~~~~~~~~~
arch/m68k/coldfire/device.c:477:35: warning: initialization discards =E2=80=
=98const=E2=80=99=20
qualifier from pointer target type [-Wdiscarded-qualifiers]
  477 |         .resource               =3D mcf_i2c5_resources,
      |                                   ^~~~~~~~~~~~~~~~~~
arch/m68k/coldfire/device.c:548:35: warning: initialization discards =E2=80=
=98const=E2=80=99=20
qualifier from pointer target type [-Wdiscarded-qualifiers]
  548 |         .resource               =3D mcf_edma_resources,
      |                                   ^~~~~~~~~~~~~~~~~~
arch/m68k/coldfire/device.c:579:35: warning: initialization discards =E2=80=
=98const=E2=80=99=20
qualifier from pointer target type [-Wdiscarded-qualifiers]
  579 |         .resource               =3D mcf_esdhc_resources,
      |                                   ^~~~~~~~~~~~~~~~~~~
arch/m68k/coldfire/device.c:620:21: warning: initialization discards =E2=80=
=98const=E2=80=99=20
qualifier from pointer target type [-Wdiscarded-qualifiers]
  620 |         .resource =3D mcf5441x_flexcan0_resource,
      |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~

JM

>=20
> > ---
> >=20
> >  arch/m68k/coldfire/device.c | 24 ++++++++++++------------
> >  1 file changed, 12 insertions(+), 12 deletions(-)
> >=20
> > diff --git a/arch/m68k/coldfire/device.c b/arch/m68k/coldfire/device.c
> > index
> > b6958ec2a220cf91a78a14fc7fa18749451412f7..20adba27a687029ef53249bad71b3=
42
> > d563d612b 100644 --- a/arch/m68k/coldfire/device.c
> > +++ b/arch/m68k/coldfire/device.c
> > @@ -111,7 +111,7 @@ static struct fec_platform_data fec_pdata =3D {
> >=20
> >   *	block. It is Freescale's own hardware block. Some ColdFires
> >   *	have 2 of these.
> >   */
> >=20
> > -static struct resource mcf_fec0_resources[] =3D {
> > +static const struct resource mcf_fec0_resources[] =3D {
> >=20
> >  	{
> >  =09
> >  		.start		=3D MCFFEC_BASE0,
> >  		.end		=3D MCFFEC_BASE0 + MCFFEC_SIZE0 -=20
1,
> >=20
> > @@ -148,7 +148,7 @@ static struct platform_device mcf_fec0 =3D {
> >=20
> >  #endif /* MCFFEC_BASE0 */
> > =20
> >  #ifdef MCFFEC_BASE1
> >=20
> > -static struct resource mcf_fec1_resources[] =3D {
> > +static const struct resource mcf_fec1_resources[] =3D {
> >=20
> >  	{
> >  =09
> >  		.start		=3D MCFFEC_BASE1,
> >  		.end		=3D MCFFEC_BASE1 + MCFFEC_SIZE1 -=20
1,
> >=20
> > @@ -189,7 +189,7 @@ static struct platform_device mcf_fec1 =3D {
> >=20
> >   *	The ColdFire QSPI module is an SPI protocol hardware block used
> >   *	on a number of different ColdFire CPUs.
> >   */
> >=20
> > -static struct resource mcf_qspi_resources[] =3D {
> > +static const struct resource mcf_qspi_resources[] =3D {
> >=20
> >  	{
> >  =09
> >  		.start		=3D MCFQSPI_BASE,
> >  		.end		=3D MCFQSPI_BASE + MCFQSPI_SIZE -=20
1,
> >=20
> > @@ -340,7 +340,7 @@ static struct platform_device mcf_qspi =3D {
> >=20
> >  #endif /* IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI) */
> > =20
> >  #if IS_ENABLED(CONFIG_I2C_IMX)
> >=20
> > -static struct resource mcf_i2c0_resources[] =3D {
> > +static const struct resource mcf_i2c0_resources[] =3D {
> >=20
> >  	{
> >  =09
> >  		.start          =3D MCFI2C_BASE0,
> >  		.end            =3D MCFI2C_BASE0 + MCFI2C_SIZE0 - 1,
> >=20
> > @@ -361,7 +361,7 @@ static struct platform_device mcf_i2c0 =3D {
> >=20
> >  };
> >  #ifdef MCFI2C_BASE1
> >=20
> > -static struct resource mcf_i2c1_resources[] =3D {
> > +static const struct resource mcf_i2c1_resources[] =3D {
> >=20
> >  	{
> >  =09
> >  		.start          =3D MCFI2C_BASE1,
> >  		.end            =3D MCFI2C_BASE1 + MCFI2C_SIZE1 - 1,
> >=20
> > @@ -385,7 +385,7 @@ static struct platform_device mcf_i2c1 =3D {
> >=20
> >  #ifdef MCFI2C_BASE2
> >=20
> > -static struct resource mcf_i2c2_resources[] =3D {
> > +static const struct resource mcf_i2c2_resources[] =3D {
> >=20
> >  	{
> >  =09
> >  		.start          =3D MCFI2C_BASE2,
> >  		.end            =3D MCFI2C_BASE2 + MCFI2C_SIZE2 - 1,
> >=20
> > @@ -409,7 +409,7 @@ static struct platform_device mcf_i2c2 =3D {
> >=20
> >  #ifdef MCFI2C_BASE3
> >=20
> > -static struct resource mcf_i2c3_resources[] =3D {
> > +static const struct resource mcf_i2c3_resources[] =3D {
> >=20
> >  	{
> >  =09
> >  		.start          =3D MCFI2C_BASE3,
> >  		.end            =3D MCFI2C_BASE3 + MCFI2C_SIZE3 - 1,
> >=20
> > @@ -433,7 +433,7 @@ static struct platform_device mcf_i2c3 =3D {
> >=20
> >  #ifdef MCFI2C_BASE4
> >=20
> > -static struct resource mcf_i2c4_resources[] =3D {
> > +static const struct resource mcf_i2c4_resources[] =3D {
> >=20
> >  	{
> >  =09
> >  		.start          =3D MCFI2C_BASE4,
> >  		.end            =3D MCFI2C_BASE4 + MCFI2C_SIZE4 - 1,
> >=20
> > @@ -457,7 +457,7 @@ static struct platform_device mcf_i2c4 =3D {
> >=20
> >  #ifdef MCFI2C_BASE5
> >=20
> > -static struct resource mcf_i2c5_resources[] =3D {
> > +static const struct resource mcf_i2c5_resources[] =3D {
> >=20
> >  	{
> >  =09
> >  		.start          =3D MCFI2C_BASE5,
> >  		.end            =3D MCFI2C_BASE5 + MCFI2C_SIZE5 - 1,
> >=20
> > @@ -507,7 +507,7 @@ static struct mcf_edma_platform_data mcf_edma_data =
=3D {
> >=20
> >  	.slavecnt		=3D ARRAY_SIZE(mcf_edma_map),
> > =20
> >  };
> >=20
> > -static struct resource mcf_edma_resources[] =3D {
> > +static const struct resource mcf_edma_resources[] =3D {
> >=20
> >  	{
> >  =09
> >  		.start		=3D MCFEDMA_BASE,
> >  		.end		=3D MCFEDMA_BASE + MCFEDMA_SIZE -=20
1,
> >=20
> > @@ -560,7 +560,7 @@ static struct mcf_esdhc_platform_data mcf_esdhc_dat=
a =3D
> > {>=20
> >  	.cd_type =3D ESDHC_CD_NONE,
> > =20
> >  };
> >=20
> > -static struct resource mcf_esdhc_resources[] =3D {
> > +static const struct resource mcf_esdhc_resources[] =3D {
> >=20
> >  	{
> >  =09
> >  		.start =3D MCFSDHC_BASE,
> >  		.end =3D MCFSDHC_BASE + MCFSDHC_SIZE - 1,
> >=20
> > @@ -590,7 +590,7 @@ static struct flexcan_platform_data
> > mcf5441x_flexcan_info =3D {>=20
> >  	.clock_frequency =3D 120000000,
> > =20
> >  };
> >=20
> > -static struct resource mcf5441x_flexcan0_resource[] =3D {
> > +static const struct resource mcf5441x_flexcan0_resource[] =3D {
> >=20
> >  	{
> >  =09
> >  		.start =3D MCFFLEXCAN_BASE0,
> >  		.end =3D MCFFLEXCAN_BASE0 + MCFFLEXCAN_SIZE,
> >=20
> > --
> > 2.39.5





