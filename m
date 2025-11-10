Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3630CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 08:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z6wRniPCN18DmCkPRn+D/brzx7dyupMuJ1WbzWmkjT4=; b=V3a+JKkMLkPDTXgJyvbKBgETJQ
	t0NYwGfOV1+VRNq8ecFMlpzwLZ6Avjb+t9y9KR2w8kXPT4tPp+22ybWV8CZ62+1SI19iqvfKntmt6
	WNZWJzt/iJYeoA9Yi2if/dX8mFyciH2LL3PSUbW2eJL6EwWaW3nA6uSk4C6pTD3I8xwTQ99iYWJXz
	bFqrpy7F0rTyEZ1eavRe33gTysJHgpdR9WbSRVbZedzXX+knQCLOr53SznbHbJWFbDOyy1vE8ez43
	dUeEWMD5BQNWwlSVHHtjX+W2cWfQ1MVfZlaZZ8AgOTzszqNI2VrQHdLqy+WE7DCDUBp/CvTxNeRfN
	AxPGlkYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vINMh-00000004zuj-0k5R;
	Mon, 10 Nov 2025 08:35:07 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vINMd-00000004ztp-0eVu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 08:35:06 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B2E6843A97;
	Mon, 10 Nov 2025 08:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1762763697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z6wRniPCN18DmCkPRn+D/brzx7dyupMuJ1WbzWmkjT4=;
	b=A121KGloifIUhJ77Bap/KOBzqy308FGX0YX9ci0cAfs5CYooKQhgPPLMF1FQtVjbVTJ6lv
	2lkQ0FW1JGeCS0eKxh0frvsNIaLNqpPNws2awkS2/MJyc4KARgpqDsE4jl12Q2Qt1rrX+W
	jbp/RnR1Ocsz1u0G0OWIrPDKObMSirSACifE1/RV3AEJIe38uDeYmvSc3qfOXS/kKzmvd4
	Ffv/q8r/dhI+l0dkUO4pftTJslWKs5/tWVbNxZx9hquw9PWMEuhWxtXtbiEXBXJFHZb8W0
	OR30Ia18TDhJPUsRXlm/wFCKiJGuqAt4xrkO+eynqfGwvm0qYuBr0i4a0y2ZkA==
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>, Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] m68k: coldfire: Add RNG support for MCF54418
Date: Mon, 10 Nov 2025 09:34:42 +0100
Message-ID: <12779401.O9o76ZdvQC@jeanmichel-ms7b89>
In-Reply-To: <CAMuHMdWL76hY-Pv30ooSM1J6XkVWbRXSLTDCjfpPOvhFN4tKyA@mail.gmail.com>
References: <20251107-b4-m5441x-add-rng-support-v2-0-f91d685832b9@yoseli.org>
 <20251107-b4-m5441x-add-rng-support-v2-2-f91d685832b9@yoseli.org>
 <CAMuHMdWL76hY-Pv30ooSM1J6XkVWbRXSLTDCjfpPOvhFN4tKyA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduleejkeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkfgjfhgggfgtsehtqhertddttdejnecuhfhrohhmpeflvggrnhdqofhitghhvghlucfjrghuthgsohhishcuoehjvggrnhhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghlihdrohhrgheqnecuggftrfgrthhtvghrnhepffevhfduvdeludeugfdtleduuedvhfeuvdevgfeiieefieevteektdettdeifeetnecukfhppedvrgdtudemvgdtrgemudeileemjedugedtmedvrgegtdemfhefrggrmeejudejvgemudefsgdvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmeduieelmeejudegtdemvdgrgedtmehffegrrgemjedujegvmedufegsvddphhgvlhhopehjvggrnhhmihgthhgvlhdqmhhsjegskeelrdhlohgtrghlnhgvthdpmhgrihhlfhhrohhmpehjvggrnhhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghlihdrohhrghdpnhgspghrtghpthhtohepudefpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtohepghgvrhhgsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopeholhhivhhir
 gesshgvlhgvnhhitgdrtghomhdprhgtphhtthhopehhvghrsggvrhhtsehgohhnughorhdrrghprghnrgdrohhrghdrrghupdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhm
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_003503_903363_1A3E9DC8 
X-CRM114-Status: GOOD (  28.05  )
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

Hi Geert,

Le lundi 10 novembre 2025, 09:15:11 heure normale d=E2=80=99Europe centrale=
 Geert=20
Uytterhoeven a =C3=A9crit :
> Hi Jean-Michel,
>=20
> On Fri, 7 Nov 2025 at 11:29, Jean-Michel Hautbois
>=20
> <jeanmichel.hautbois@yoseli.org> wrote:
> > Add platform device support for the MCF54418 RNGB hardware with clock
> > enabled at platform initialization.
> >=20
> > The imx-rngc driver now uses devm_clk_get_optional() to support both
> > Coldfire (always-on clock) and i.MX platforms (managed clock).
> >=20
> > Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
>=20
> Thanks for your patch!
>=20
> > --- a/drivers/char/hw_random/Kconfig
> > +++ b/drivers/char/hw_random/Kconfig
> > @@ -270,12 +270,13 @@ config HW_RANDOM_MXC_RNGA
> >=20
> >  config HW_RANDOM_IMX_RNGC
> > =20
> >         tristate "Freescale i.MX RNGC Random Number Generator"
> >         depends on HAS_IOMEM
> >=20
> > -       depends on SOC_IMX25 || SOC_IMX6SL || SOC_IMX6SLL || SOC_IMX6UL=
 ||
> > COMPILE_TEST +       depends on SOC_IMX25 || SOC_IMX6SL || SOC_IMX6SLL =
||
> > SOC_IMX6UL || M5441x || COMPILE_TEST
> Is the same RNG present in other Coldfire SoCs?

According to the RM, it is only present in MCF54416 and MCF54418.

>=20
> >         default HW_RANDOM
> >         help
> >        =20
> >           This driver provides kernel-side support for the Random Number
> >           Generator Version C hardware found on some Freescale i.MX
> >           processors. Version B is also supported by this driver.
> >=20
> > +         Also supports RNGB on Freescale MCF54418 (Coldfire V4e).
> >=20
> >           To compile this driver as a module, choose M here: the
> >           module will be called imx-rngc.
> >=20
> > diff --git a/drivers/char/hw_random/imx-rngc.c
> > b/drivers/char/hw_random/imx-rngc.c index
> > 241664a9b5d9ac7244f15cbe5d5302ca3787ebea..44f20a05de0a425cb6ff7b2a347b1=
11
> > 750ac3702 100644 --- a/drivers/char/hw_random/imx-rngc.c
> > +++ b/drivers/char/hw_random/imx-rngc.c
> > @@ -353,12 +353,19 @@ static const struct of_device_id imx_rngc_dt_ids[=
] =3D
> > {>=20
> >  };
> >  MODULE_DEVICE_TABLE(of, imx_rngc_dt_ids);
> >=20
> > +static const struct platform_device_id imx_rngc_devtype[] =3D {
> > +       { .name =3D "imx-rngc" },
>=20
> I believe this is identical to KBUILD_MODNAME, so the .name below
> should be sufficient for binding?
>=20
> > +       { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(platform, imx_rngc_devtype);
>=20
> Or do you need this mainly for the addition of MODULE_DEVICE_TABLE(),
> i.e. the module is not auto-loaded based on just KBUILD_MODNAME?

Yes, exactly. If you have a better way, I will happily apply it :-).

Thanks !
JM

>=20
> > +
> >=20
> >  static struct platform_driver imx_rngc_driver =3D {
> > =20
> >         .driver =3D {
> >        =20
> >                 .name =3D KBUILD_MODNAME,
>=20
>                   ^^^^^^^^^^^^^^^^^^^^^^^
>=20
> >                 .pm =3D pm_ptr(&imx_rngc_pm_ops),
> >                 .of_match_table =3D imx_rngc_dt_ids,
> >        =20
> >         },
> >=20
> > +       .id_table =3D imx_rngc_devtype,
> >=20
> >  };
> > =20
> >  module_platform_driver_probe(imx_rngc_driver, imx_rngc_probe);
>=20
> Gr{oetje,eeting}s,
>=20
>                         Geert





