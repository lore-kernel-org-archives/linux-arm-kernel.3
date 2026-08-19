Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 169E6C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 22:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Ni0WKTRve59PhC0qUiAxPMcwTPxD/jTYtX/EjsbPbI=; b=GCzk2sP/6RAZx3SqeFWv/s/RCy
	QK0gQfocSp8cjwkuhtMNQ7vnqr1tqqKXvr54E9GgTHCzKg2/sx22msQALHlXAStMG72qDybU5tSnV
	90f3k/+JEDlytu2nGsx8s0zOS86siPwSn1fQlxMibC5c5BFg9kWPQ41HrzsNk+JtCn4iygevh4KtT
	ibvxQ3IOE104NBxaz1m2WfJ9egdyhJsrTyxkSoMAXlFnZ2ZFJIsV520Y3JwLQFUiwBT4wWW2YMfBj
	tAjfoqNf4HnJtFE4DvPgEfbBIyKRAtuDhac1J1BhqI6rSSL/VGKxiyQSfHDiaGBMbZPjk4GVurTB6
	SMW6HNEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwomf-0000000Ac9q-1YI1;
	Wed, 19 Aug 2026 22:29:21 +0000
Received: from mout01.posteo.de ([185.67.36.65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwomc-0000000Ac9U-3Sie
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 22:29:20 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 4481B240027
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 00:29:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de;
	s=1984.8680eb; t=1787178556;
	bh=8Ni0WKTRve59PhC0qUiAxPMcwTPxD/jTYtX/EjsbPbI=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=n0CAOt6NkSwKgwBYIBiS3GnCnfOTe7IOyIpFNBeX0JP0eeZpJM3bWTGmRVieaabhM
	 yI7GzoJgMwIP/mWbCWoyYm9FViZWJzy5IPBE8LXNYjlkhfUTJ5A/dS99+RbWi+AGZh
	 Pp1d9R9xHtoADBf9Zo+kLGmS4Cq7qo0six0WMUvFrV1yXOuHRA/Tx4FwDvggl/koPm
	 o1WNpFisPFuUgJhF7gA4YO1ytDlpBcWhuDkCBrGG/nY8I/FRdPQ+nAuFeAShysIPWg
	 8tFOw38lw4u4dBSaiDmxvdH8NYf1/zExJ2Qhjfkacsw9aISxOumV3nhbKLoEEm+vaU
	 JZR1hseKsw1mg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hQLpL5GyDz9rxF;
	Thu, 20 Aug 2026 00:29:14 +0200 (CEST)
Message-ID: <63144348d306ae5c5723df553477f90f6f1030b7.camel@posteo.de>
Subject: Re: [PATCH v5 3/6] rtc: s35390a: Fix alarm not disabling
From: Markus Probst <markus.probst@posteo.de>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 <uwe@kleine-koenig.org>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement
 <gregory.clement@bootlin.com>, Sebastian Hesselbarth	
 <sebastian.hesselbarth@gmail.com>, Michael Langer	
 <michael.brainbug.langer@googlemail.com>, Andrew Morton	
 <akpm@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 19 Aug 2026 22:29:15 +0000
In-Reply-To: <2026081922254172956b52@mail.local>
References: <20260820-rtc_s35390a_int1-v5-0-5eb4ef85c6a9@posteo.de>
	 <20260820-rtc_s35390a_int1-v5-3-5eb4ef85c6a9@posteo.de>
	 <2026081922254172956b52@mail.local>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-1/4lpCggRhx0JyaVAfDd"
MIME-Version: 1.0
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_152919_187509_D13233D0 
X-CRM114-Status: GOOD (  23.70  )
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


--=-1/4lpCggRhx0JyaVAfDd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-08-20 at 00:25 +0200, Alexandre Belloni wrote:
> On 19/08/2026 22:05:55+0000, Markus Probst wrote:
> > Implement alarm_irq_enable callback.
> >=20
> > Fixes: 542dd33a4925 ("drivers/rtc/rtc-s35390a.c: add wakealarm support =
for rtc-s35390A rtc chip")
> > Signed-off-by: Markus Probst <markus.probst@posteo.de>
> > ---
> >  drivers/rtc/rtc-s35390a.c | 29 ++++++++++++++++++++++++-----
> >  1 file changed, 24 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/drivers/rtc/rtc-s35390a.c b/drivers/rtc/rtc-s35390a.c
> > index 4cfe7034c516..575bb256eb25 100644
> > --- a/drivers/rtc/rtc-s35390a.c
> > +++ b/drivers/rtc/rtc-s35390a.c
> > @@ -270,6 +270,24 @@ static int s35390a_rtc_read_time(struct device *de=
v, struct rtc_time *tm)
> >  	return 0;
> >  }
> > =20
> > +static int s35390a_rtc_alarm_irq_enable(struct device *dev, unsigned i=
nt enabled)
> > +{
> > +	struct s35390a *s35390a =3D dev_get_drvdata(dev);
> > +	u8 sts;
> > +	int err;
> > +
> > +	if (enabled)
> > +		sts =3D S35390A_INT2_MODE_ALARM;
> > +	else
> > +		sts =3D S35390A_INT2_MODE_NOINTR;
> > +
> > +	err =3D s35390a_set_reg(s35390a, S35390A_CMD_STATUS2, &sts, sizeof(st=
s));
> > +	if (err < 0)
> > +		return err;
> > +
> > +	return 0;
> > +}
>=20
>=20
> You can definitively call this from s35390a_rtc_set_alarm instead of
> duplicating code.
At this stage yes.

With the pinctrl patch, it needs to be considered that the other pin
might be used as well, so the state needs to be preserved.

This will be done by reading the S35390A_CMD_STATUS2 register first.

This function will not be called in set_alarm, because this would
introduce additional read operations, as the current
S35390A_CMD_STATUS2 reg is already read inside set_alarm.

Thanks
- Markus Probst

>=20
> > +
> >  static int s35390a_rtc_set_alarm(struct device *dev, struct rtc_wkalrm=
 *alm)
> >  {
> >  	struct i2c_client *client =3D to_i2c_client(dev);
> > @@ -410,11 +428,12 @@ static int s35390a_rtc_ioctl(struct device *dev, =
unsigned int cmd,
> >  }
> > =20
> >  static const struct rtc_class_ops s35390a_rtc_ops =3D {
> > -	.read_time	=3D s35390a_rtc_read_time,
> > -	.set_time	=3D s35390a_rtc_set_time,
> > -	.set_alarm	=3D s35390a_rtc_set_alarm,
> > -	.read_alarm	=3D s35390a_rtc_read_alarm,
> > -	.ioctl          =3D s35390a_rtc_ioctl,
> > +	.read_time		=3D s35390a_rtc_read_time,
> > +	.set_time		=3D s35390a_rtc_set_time,
> > +	.set_alarm		=3D s35390a_rtc_set_alarm,
> > +	.read_alarm		=3D s35390a_rtc_read_alarm,
> > +	.alarm_irq_enable	=3D s35390a_rtc_alarm_irq_enable,
> > +	.ioctl			=3D s35390a_rtc_ioctl,
> >  };
> > =20
> >  static int s35390a_nvmem_read(void *priv, unsigned int offset, void *v=
al,
> >=20
> > --=20
> > 2.54.0
> >=20

--=-1/4lpCggRhx0JyaVAfDd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmqGLjUbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJEDR2H/jnrUPShlUQALffJ/72tdeDsOjzYA1p
48AIGvY9/qJxcV+JpHYIVl1+QHRUzB8t/J66OmKwspy2q/LszXvaRyYD2d+Loq9E
eBHh9fO+xJgRhOw0btUhAtn5cXBGt9hx3h5eVutDCiRYJZaW+gACYHkNjHNUTsft
7HOtWxd1x/h8cR8jOsazVNPpPxbdk+PdhwIAw0SxCxoCFtjUMJFsWWERHX5HwZsg
rWwCNW6b9cfFDTaNqxM3LjistbAvM/+AV4r8qnBoKHlzB1JkX/J/v+kGRyvnlYEw
JR2Q97W2MXLrcae/Fucw0cixmax/vJppyGHZSdP4eUwhs3CWUoqKEWYH2ej0ujBM
SWAr5A6HZ0upczQ2gRUDIcwX7dt+JEU+0nD2Q82Xpm36A9YruukX2QtBlivU8cB+
GQfbD4OxO+eQlBr5hegPxObs0Mbeb/5GD9MYcnHeb1DkJ/1GbqXTeAQNvsXmIaMg
bHZHMfsHb5X9Qqn7bqlglPMVMPx6HMnETd1k5Gf9wF4dcGaHqU2RO0jC38GAYGzm
lUmO/83Q3q5ZnP601B9zaDOMOHnIx6UhK/gxy8n3AHO83V2xmu6DA5YS1i0DDjWu
UnasGV0WdbGrAwHjPr50FNIgoTg8lJWYegUrrAf5GoDAVcoCnCZsuwV8mjZRcLWD
EjLKxioAGZ+OiENl6SktwAm1
=fwjU
-----END PGP SIGNATURE-----

--=-1/4lpCggRhx0JyaVAfDd--

