Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94711CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 21:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZbI0jVEKP4rS4s+J5RoosuFYtKofOrtiC7bLWb2PusA=; b=XtGZWZD8myHR/U1XUnqAtSkQw8
	N7xzp036Nbmbyn7WkSfndluwaQOCv7MCvehtN9s6dXVWvwn0nneZY8iH6EjuRMIw/IhEUJPQrI8hW
	Q5otjX4SQkYBDVPmhYQUbt1gI2ANe4RH/y15wLUmLxaBcLqOXaI/EBoHBNnr8g944RdTqffRG0F6X
	OHCkLVwjc9PtnNK9yHZwG4WaKP9WRypGv8Z0hh+fCviUiPdkRIs6WpBuD7cPMDgdZuHhCx9Idm8uI
	bQyWhb93DUkQT3dboui2rgsyuZ/qWU1hqf+MchcBsqdVkPC272MloLA7/EZ8rQqqpFQz3UE93u469
	5kQeVKPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNHEp-00000003qEX-2SYS;
	Wed, 13 May 2026 21:35:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNHEm-00000003qCw-2mDZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 21:35:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 864ED1595;
	Wed, 13 May 2026 14:35:20 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D45333F836;
	Wed, 13 May 2026 14:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778708125; bh=V4Z9P+e2GyvMrVAC0rqhZI/HKDK4a0CYJ4lhRPYRqmU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Kdc5qFLSoy7UP4qMQ1TYe6wOFSpqTGrPIVjQ0dmIODVJGPJO8opMmhOg3QJUZYVwE
	 YcuooyzWUOc+8Fh+i9StCkCB+DjYgIrQQeBbDZfFvzJ3xjtinPcapSwlhygdP749c4
	 jalwVuE4X0IDBxDUHBcNP3UmAAC6Mi1HeQAUMLPw=
Date: Wed, 13 May 2026 23:34:38 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Jonathan Cameron <jic23@kernel.org>
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
Message-ID: <20260513233438.2715cfb5@ryzen.lan>
In-Reply-To: <20260513171638.77af3b24@jic23-huawei>
References: <20260513-sunxi-a523-gpadc-v2-0-d5efde151dac@mmpsystems.pl>
	<20260513-sunxi-a523-gpadc-v2-2-d5efde151dac@mmpsystems.pl>
	<A7772824-E704-4BFD-A796-BCD81197E5A2@gmail.com>
	<4248ac7e-3cce-4db8-a2c1-710f2c903490@arm.com>
	<20260513171638.77af3b24@jic23-huawei>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_143529_701038_5F6CF7FE 
X-CRM114-Status: GOOD (  30.13  )
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

On Wed, 13 May 2026 17:16:38 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

Hi,

> On Wed, 13 May 2026 13:53:49 +0200
> Andre Przywara <andre.przywara@arm.com> wrote:
>=20
> > Hi Sanjay,
> >=20
> > thanks for having a look!
> >=20
> > On 5/13/26 13:44, Sanjay Chitroda wrote: =20
> > >=20
> > >=20
> > > On 13 May 2026 10:29:43=E2=80=AFam IST, Michal Piekos <michal.piekos@=
mmpsystems.pl> wrote:   =20
> > >> A523 differs from existing sun20i-gpadc-iio by having two clocks; bus
> > >> clock and module clock.
> > >>
> > >> Change driver to enable all clocks.
> > >>
> > >> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> > >> ---
> > >> drivers/iio/adc/sun20i-gpadc-iio.c | 11 +++++++----
> > >> 1 file changed, 7 insertions(+), 4 deletions(-)
> > >>
> > >> diff --git a/drivers/iio/adc/sun20i-gpadc-iio.c b/drivers/iio/adc/su=
n20i-gpadc-iio.c
> > >> index 861c14da75ad..3f1f07b3a385 100644
> > >> --- a/drivers/iio/adc/sun20i-gpadc-iio.c
> > >> +++ b/drivers/iio/adc/sun20i-gpadc-iio.c
> > >> @@ -180,7 +180,7 @@ static int sun20i_gpadc_probe(struct platform_de=
vice *pdev)
> > >> 	struct iio_dev *indio_dev;
> > >> 	struct sun20i_gpadc_iio *info;
> > >> 	struct reset_control *rst;
> > >> -	struct clk *clk;
> > >> +	struct clk_bulk_data *clks;
> > >> 	int irq;
> > >> 	int ret;
> > >>
> > >> @@ -205,9 +205,11 @@ static int sun20i_gpadc_probe(struct platform_d=
evice *pdev)
> > >> 	if (IS_ERR(info->regs))
> > >> 		return PTR_ERR(info->regs);
> > >>
> > >> -	clk =3D devm_clk_get_enabled(dev, NULL);
> > >> -	if (IS_ERR(clk))
> > >> -		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable bus clo=
ck\n");
> > >> +	ret =3D devm_clk_bulk_get_all_enabled(dev, &clks);
> > >> +	if (ret <=3D 0)   =20
> > >=20
> > > Thank you Michal for the change.
> > >=20
> > > Have you validated the changes ?
> > > It looks while success ret would be 0 and it would give return error.=
   =20
> >=20
> > But devm_clk_bulk_get_all_enabled() returns the number of clocks found=
=20
> > and enabled. And since we need at least one, I think this is correct,=20
> > and the error message below reflects that. =20
>=20
> True but passing 0 to dev_err_probe() isn't going to do the right thing.
>=20
> Though from this function, 0 is an error you need to return an error code
> not 0 which to the caller looks like a success.

Ah, that's true - should have read your email first before answering to
Andy ;-)

So yeah, that needs a split handling, for =3D=3D 0, and for < 0.

Cheers,
Andre

>=20
>=20
>=20
> >=20
> > To me that change looks good:
> >=20
> > Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> >=20
> > Cheers,
> > Andre
> >=20
> >  =20
> > >=20
> > > Thanks, Sanjay
> > >=20
> > >    =20
> > >> +		return dev_err_probe(
> > >> +			dev, ret,
> > >> +			"failed to enable clocks or no clocks defined\n");
> > >>
> > >> 	rst =3D devm_reset_control_get_exclusive(dev, NULL);
> > >> 	if (IS_ERR(rst))
> > >> @@ -243,6 +245,7 @@ static int sun20i_gpadc_probe(struct platform_de=
vice *pdev)
> > >>
> > >> static const struct of_device_id sun20i_gpadc_of_id[] =3D {
> > >> 	{ .compatible =3D "allwinner,sun20i-d1-gpadc" },
> > >> +	{ .compatible =3D "allwinner,sun55i-a523-gpadc" },
> > >> 	{ }
> > >> };
> > >> MODULE_DEVICE_TABLE(of, sun20i_gpadc_of_id);
> > >>   =20
> > >    =20
> >  =20
>=20
>=20


