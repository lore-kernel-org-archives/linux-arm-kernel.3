Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B951E6F06D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 16:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/dRef/Eq643Mt4Yvanc3VTX63ZiR7PnMCS/Ly4jPW14=; b=YsGnjjVwxwSW5DL1/AbYIw8zpR
	d0VxTfXneloIMtmbOHUsfvmAD40+zoM3mNmzxvE2lhGpwnyzAvmgzsemmaoH7emffoair8vZfuSGD
	voZ07J8ItiClZWHPyL6aZM+dEKF43YLBATUlyL2bmWEA3Dp49SlHsOQTNMo2mKXz2SOJuQz6RT662
	qFnGYuE7RIN9knq94kEkLZNr8Z9zGEM/gcCHJ7oUANuW+g0AMgCrw1wi32GTKN7Bppgj+2F69eAQW
	rff9sl6RO5t5Dt9zGno2r4IBkA15vq6N0DbE6Z4ciVLe5joYLThMYEEjqODu4ciJ3rwrtzP5FAb38
	Ipw3mXMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6u6L-00000007arP-1wTG;
	Fri, 01 Nov 2024 16:02:17 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6tpi-00000007YIn-27xY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 15:45:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5E3B2A44454;
	Fri,  1 Nov 2024 15:43:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BA75C4CECD;
	Fri,  1 Nov 2024 15:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730475904;
	bh=t1pJkvv5ArO95EBUpDZbdsLDepiY0M1etPEVdzcYgMM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SVs0UfvSjddoObL1YP4TcTpN6+JMKTAlMOtHqoNu/N5W++S8ZoFPFicaoCsigBZWY
	 tzsC/HX9IzAFBDK7yJ0jUUgykge+QshPJphUaXyfeUUF+JuEpS/o/COytqjHhw6bfk
	 Puqx0C4Dn8D1jyyOrR697msu4an59gWO287LimKF2sfZWd8QG8Johu2Ruz2CxZ96Mr
	 96oWxW1+Q0h3FQJIq3Euy8DNRcTjyRLRpuV3HXN/mRruETfNZ8TVV/wuABpuviyGn+
	 5gMXDGfb2eU9CbNsoC5MxD6+lYem2NKv3+WKaecfvPJz1LBb1ZEvgNrUSeIb6LtuMV
	 +upizTDVi/RKg==
Date: Fri, 1 Nov 2024 15:44:51 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: Julien Stephan <jstephan@baylibre.com>, Mudit Sharma
 <muditsharma.info@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, Anshul
 Dalal <anshulusr@gmail.com>, Javier Carrasco
 <javier.carrasco.cruz@gmail.com>, Jean-Baptiste Maneyrol
 <jean-baptiste.maneyrol@tdk.com>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Cosmin Tanislav
 <cosmin.tanislav@analog.com>, Ramona Gradinariu
 <ramona.gradinariu@analog.com>, Antoniu Miclaus
 <antoniu.miclaus@analog.com>, Dan Robertson <dan@dlrobertson.com>, Marcelo
 Schmitt <marcelo.schmitt@analog.com>, Matteo Martelli
 <matteomartelli3@gmail.com>, Anand Ashok Dumbre
 <anand.ashok.dumbre@xilinx.com>, Michal Simek <michal.simek@amd.com>,
 Mariel Tinaco <Mariel.Tinaco@analog.com>, Jagath Jog J
 <jagathjog1996@gmail.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Subhajit
 Ghosh <subhajit.ghosh@tweaklogic.com>, Kevin Tsai <ktsai@capellamicro.com>,
 Linus Walleij <linus.walleij@linaro.org>, Benson Leung
 <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev
Subject: Re: [PATCH v2 06/15] iio: light: adux1020: write_event_config: use
 local variable for interrupt value
Message-ID: <20241101154451.227defba@jic23-huawei>
In-Reply-To: <ef4fe230-b7fb-4f7e-9173-ae85d305e9ae@baylibre.com>
References: <20241031-iio-fix-write-event-config-signature-v2-0-2bcacbb517a2@baylibre.com>
	<20241031-iio-fix-write-event-config-signature-v2-6-2bcacbb517a2@baylibre.com>
	<ef4fe230-b7fb-4f7e-9173-ae85d305e9ae@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_084506_701346_798B5D3A 
X-CRM114-Status: GOOD (  26.96  )
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

On Thu, 31 Oct 2024 11:27:45 -0500
David Lechner <dlechner@baylibre.com> wrote:

> On 10/31/24 10:27 AM, Julien Stephan wrote:
> > state parameter is currently an int, but it is actually a boolean.
> > iio_ev_state_store is actually using kstrtobool to check user input,
> > then gives the converted boolean value to write_event_config.  The code
> > in adux1020_write_event_config re-uses state parameter to store an
> > integer value. To prepare for updating the write_event_config signature
> > to use a boolean for state, introduce a new local int variable.
> >=20
> > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > ---
> >  drivers/iio/light/adux1020.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/iio/light/adux1020.c b/drivers/iio/light/adux1020.c
> > index 2e0170be077aef9aa194fab51afbb33aec02e513..db57d84da616b91add8c5d1=
aba08a73ce18c367e 100644
> > --- a/drivers/iio/light/adux1020.c
> > +++ b/drivers/iio/light/adux1020.c
> > @@ -505,7 +505,7 @@ static int adux1020_write_event_config(struct iio_d=
ev *indio_dev,
> >  				       enum iio_event_direction dir, int state)
> >  {
> >  	struct adux1020_data *data =3D iio_priv(indio_dev);
> > -	int ret, mask;
> > +	int ret, mask, val;
> > =20
> >  	mutex_lock(&data->lock);
> > =20
> > @@ -526,12 +526,12 @@ static int adux1020_write_event_config(struct iio=
_dev *indio_dev,
> >  			mask =3D ADUX1020_PROX_OFF1_INT;
> > =20
> >  		if (state)
> > -			state =3D 0;
> > +			val =3D 0;
> >  		else
> > -			state =3D mask;
> > +			val =3D mask;
> > =20
> >  		ret =3D regmap_update_bits(data->regmap, ADUX1020_REG_INT_MASK,
> > -					 mask, state);
> > +					 mask, val);
> >  		if (ret < 0)
> >  			goto fail;
> > =20
> >  =20
>=20
> Instead of introducing `val`, I would rewrite this as:
>=20
> 	if (state)
> 		ret =3D regmap_clear_bits(...);
> 	else
> 		ret =3D regmap_set_bits(...);
>=20
Good idea.  Rather than go around again and potentially stall the end of th=
is series.
I made that change whilst applying.  Shout if either of you doesn't
like the result. Diff doesn't do a perfect job on readability (it does
if I add a line break but then the code looks worse in the end!)

=46rom 06a1ca816450d1b5524f6010581a83ab9935d51b Mon Sep 17 00:00:00 2001
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 31 Oct 2024 16:27:01 +0100
Subject: [PATCH] iio: light: adux1020: write_event_config: use local variab=
le
 for interrupt value

state parameter is currently an int, but it is actually a boolean.
iio_ev_state_store is actually using kstrtobool to check user input,
then gives the converted boolean value to write_event_config.  The code
in adux1020_write_event_config re-uses state parameter to store an
integer value. To prepare for updating the write_event_config signature
to use a boolean for state, introduce a new local int variable.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
Link: https://patch.msgid.link/20241031-iio-fix-write-event-config-signatur=
e-v2-6-2bcacbb517a2@baylibre.com
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 drivers/iio/light/adux1020.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/light/adux1020.c b/drivers/iio/light/adux1020.c
index 2e0170be077a..06d5bc1d246c 100644
--- a/drivers/iio/light/adux1020.c
+++ b/drivers/iio/light/adux1020.c
@@ -526,12 +526,11 @@ static int adux1020_write_event_config(struct iio_dev=
 *indio_dev,
 			mask =3D ADUX1020_PROX_OFF1_INT;
=20
 		if (state)
-			state =3D 0;
+			ret =3D regmap_clear_bits(data->regmap,
+						ADUX1020_REG_INT_MASK, mask);
 		else
-			state =3D mask;
-
-		ret =3D regmap_update_bits(data->regmap, ADUX1020_REG_INT_MASK,
-					 mask, state);
+			ret =3D regmap_set_bits(data->regmap,
+					      ADUX1020_REG_INT_MASK, mask);
 		if (ret < 0)
 			goto fail;
=20
--=20
2.46.2



>=20
>=20


