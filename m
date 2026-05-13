Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7990CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 16:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lsoMVLB3UeEPzEKI5+NUJas6CpiAj4Yur7BuNdvVjpA=; b=GDNOvQN0D7BMuLEMIBYkCrdU7T
	OsBVY+t0eN8J8aa0n6nUOjr5d5JoZTqz6a1KDgCVQp13Yt/37UU9Kl5g5kXXvI94ke1Cti5jxlUQn
	7kyHmqaPTvOMRblPIYxi8drvvjUm3byAD0a1Iu5QfBLm0DeHNwj+vciZZa+vE6j4iGVuyGNaKD2RB
	ehaDfRZvw/dxW1TsuM/hNCv1WjR/LtEKgq/OjjyR6gQA88lgGZ6nfk3G1FV5W9gcWHNaLPZgJ8YPN
	suPEa6L7j34zPe/5TpiGnBHgdMIZB2MEeycESXsFp+Bv5z1qlW6/7vtub9IgSCccAYW5/tah2O1U/
	cKLRVMAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNCGR-00000003BRQ-3Tbi;
	Wed, 13 May 2026 16:16:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNCGQ-00000003BRF-360p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 16:16:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E28BC600AE;
	Wed, 13 May 2026 16:16:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99B83C19425;
	Wed, 13 May 2026 16:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778689009;
	bh=f9/+E/R+ZsrcOhqa7I2GlG4cd6p5UxzOvSrd5ynQGt0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cVhdmWOqiQYoyW8bUF+ngNWqknk7z4gf+QmUKAr3BBZm6uaeuJ0cYtl2NeeT4FDyS
	 DgMTu5oDqIM73e7fv+r1Upc9vUx4R/YjwQwXzvRoS/bU4eyBtbvUVgSvTFpIn3vhrn
	 R5QMj5QD8qvVtuFi3dFxGkc+Vj1QDpiTLf80hp4V9U5zaw6bximvuKbpg4N+kWyYee
	 vm0cr4cYs1aiaW426q5TtrbM0bCaEwmojWjCcCwXu6GUW0mRYKHgAOLQ0UwaERxrPj
	 H9sW0nYDn7Uj0G/dYpIE5jbjHB3wp5VbHZVryf7t5wOTTnpg+umJlgZ3UTip5f7Ezp
	 3VH7ND4j2ykkQ==
Date: Wed, 13 May 2026 17:16:38 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Sanjay Chitroda <sanjayembeddedse@gmail.com>, Michal Piekos
 <michal.piekos@mmpsystems.pl>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Maksim Kiselev <bigunclemax@gmail.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] iio: adc: sun20i-gpadc: add A523 gpadc support
Message-ID: <20260513171638.77af3b24@jic23-huawei>
In-Reply-To: <4248ac7e-3cce-4db8-a2c1-710f2c903490@arm.com>
References: <20260513-sunxi-a523-gpadc-v2-0-d5efde151dac@mmpsystems.pl>
	<20260513-sunxi-a523-gpadc-v2-2-d5efde151dac@mmpsystems.pl>
	<A7772824-E704-4BFD-A796-BCD81197E5A2@gmail.com>
	<4248ac7e-3cce-4db8-a2c1-710f2c903490@arm.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On Wed, 13 May 2026 13:53:49 +0200
Andre Przywara <andre.przywara@arm.com> wrote:

> Hi Sanjay,
>=20
> thanks for having a look!
>=20
> On 5/13/26 13:44, Sanjay Chitroda wrote:
> >=20
> >=20
> > On 13 May 2026 10:29:43=E2=80=AFam IST, Michal Piekos <michal.piekos@mm=
psystems.pl> wrote: =20
> >> A523 differs from existing sun20i-gpadc-iio by having two clocks; bus
> >> clock and module clock.
> >>
> >> Change driver to enable all clocks.
> >>
> >> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> >> ---
> >> drivers/iio/adc/sun20i-gpadc-iio.c | 11 +++++++----
> >> 1 file changed, 7 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/iio/adc/sun20i-gpadc-iio.c b/drivers/iio/adc/sun2=
0i-gpadc-iio.c
> >> index 861c14da75ad..3f1f07b3a385 100644
> >> --- a/drivers/iio/adc/sun20i-gpadc-iio.c
> >> +++ b/drivers/iio/adc/sun20i-gpadc-iio.c
> >> @@ -180,7 +180,7 @@ static int sun20i_gpadc_probe(struct platform_devi=
ce *pdev)
> >> 	struct iio_dev *indio_dev;
> >> 	struct sun20i_gpadc_iio *info;
> >> 	struct reset_control *rst;
> >> -	struct clk *clk;
> >> +	struct clk_bulk_data *clks;
> >> 	int irq;
> >> 	int ret;
> >>
> >> @@ -205,9 +205,11 @@ static int sun20i_gpadc_probe(struct platform_dev=
ice *pdev)
> >> 	if (IS_ERR(info->regs))
> >> 		return PTR_ERR(info->regs);
> >>
> >> -	clk =3D devm_clk_get_enabled(dev, NULL);
> >> -	if (IS_ERR(clk))
> >> -		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable bus clock=
\n");
> >> +	ret =3D devm_clk_bulk_get_all_enabled(dev, &clks);
> >> +	if (ret <=3D 0) =20
> >=20
> > Thank you Michal for the change.
> >=20
> > Have you validated the changes ?
> > It looks while success ret would be 0 and it would give return error. =
=20
>=20
> But devm_clk_bulk_get_all_enabled() returns the number of clocks found=20
> and enabled. And since we need at least one, I think this is correct,=20
> and the error message below reflects that.

True but passing 0 to dev_err_probe() isn't going to do the right thing.

Though from this function, 0 is an error you need to return an error code
not 0 which to the caller looks like a success.



>=20
> To me that change looks good:
>=20
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
>=20
> Cheers,
> Andre
>=20
>=20
> >=20
> > Thanks, Sanjay
> >=20
> >  =20
> >> +		return dev_err_probe(
> >> +			dev, ret,
> >> +			"failed to enable clocks or no clocks defined\n");
> >>
> >> 	rst =3D devm_reset_control_get_exclusive(dev, NULL);
> >> 	if (IS_ERR(rst))
> >> @@ -243,6 +245,7 @@ static int sun20i_gpadc_probe(struct platform_devi=
ce *pdev)
> >>
> >> static const struct of_device_id sun20i_gpadc_of_id[] =3D {
> >> 	{ .compatible =3D "allwinner,sun20i-d1-gpadc" },
> >> +	{ .compatible =3D "allwinner,sun55i-a523-gpadc" },
> >> 	{ }
> >> };
> >> MODULE_DEVICE_TABLE(of, sun20i_gpadc_of_id);
> >> =20
> >  =20
>=20


