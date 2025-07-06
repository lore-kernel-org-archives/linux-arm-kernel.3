Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF17CC83F07
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 23:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OkhH9IbTR9ruQ0dR5dB94E4BV7dQSG/wEWPibMZafbA=; b=oboU+lGpqn1eO5ynsLDDSjdg1Y
	1Mg5Mxp/gbsiR8OUv/OxCvon5L3iX8LBs2b53CnHBn6kcpKrPD4z71CV+NJKcRLVobIqNJtANH43X
	/Pge+/a2I03Li7rrfCxL4Q7UkoRG9kS9r51pY0AVwouEsJNlE7iXpPBQZB4Xiezwopc+XLYtgeik8
	wgnoxB0eCq3vZ9Nw6VrXqRVeyiPk5yHIA2K1rOPPI1XQh1p0I4Wl0mhby+FVWTaA2o9o3eED8CO/z
	oBjPvhPIr1Z1rjrBKacLF2CNFnPoN2+uj22OuXTcm9tuqqtlFq+8CXecaIhyXDbXvh1h4JTCh7Pqm
	rs/EYEPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYZ5H-00000000yZl-3Nh0;
	Sun, 06 Jul 2025 23:47:47 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYYyD-00000000y3B-1XIW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 23:40:30 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1751845223; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fe4Wq1KSc3C9rtv0WoUmiWpsTCwvWig8dHjgLavQ2lB58K3Jk/pGTpd3b4x1Wdg2MGB2tYGQD9lHgvYLNcQKHPEkdiaBz7IqrBvbeyCMJOJnz3TlQJX+M4uh6DhjxR3mHQ583IjWMEqX68Ii9TRpxDfMOJBGiJpwy39LCnafvXA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751845223; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=OkhH9IbTR9ruQ0dR5dB94E4BV7dQSG/wEWPibMZafbA=; 
	b=U4TOnkhCu3os+mMAxmmjAEeK6lJQC7+ZvnvuihSKwPB71oFzLcLdeQuZ2wdNvgJdY9hVTPBPnseRZjVfE24h0Zi7daoRFmoNvLAFoPBwIo3GJEdPdkxQ67on+lwpfikYBUhk3COGtZaR9+VU6gOx53kNMBcdHlVFdJ8Fvo3vp0c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751845223;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=OkhH9IbTR9ruQ0dR5dB94E4BV7dQSG/wEWPibMZafbA=;
	b=PHP6uUKU7p+zdqQcQCUB7B3GzsHJfLj3AA0qA9RAG76Jtn0j7m8wN5uSEMumn+KM
	TaLnYdeNZRJlKnRcqKdg+3L/1z6U3Qb425zKwq1wX8EnHSuFP+YJaAXScr3Q9nValRm
	KKe191Xbi5imrkWtAZMjMv3/QyFTOJis7OM5pFUs=
Received: by mx.zohomail.com with SMTPS id 175184522081850.59797125193427;
	Sun, 6 Jul 2025 16:40:20 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 00041180F14; Mon, 07 Jul 2025 01:40:15 +0200 (CEST)
Date: Mon, 7 Jul 2025 01:40:15 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Pavel Machek <pavel@ucw.cz>
Cc: t.antoine@uclouvain.be, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dimitri Fedrau <dima.fedrau@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v4 2/5] power: supply: add support for max77759 fuel gauge
Message-ID: <zc7kbscxpwjkqypichbroxpthnrajjn55gttapmugscloccqdz@y336iasbb3w5>
References: <20250523-b4-gs101_max77759_fg-v4-0-b49904e35a34@uclouvain.be>
 <20250523-b4-gs101_max77759_fg-v4-2-b49904e35a34@uclouvain.be>
 <4cahu6dog7ly4ww6xyjmjigjfxs4m55mrnym2bjmzskscfvk34@guazy6wxbzfh>
 <aGbkLIFkMlihbJUt@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c4dm6iyzznajhm27"
Content-Disposition: inline
In-Reply-To: <aGbkLIFkMlihbJUt@duo.ucw.cz>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.3/251.827.75
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_164029_472432_1BE14F46 
X-CRM114-Status: GOOD (  30.17  )
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


--c4dm6iyzznajhm27
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/5] power: supply: add support for max77759 fuel gauge
MIME-Version: 1.0

Hi,

On Thu, Jul 03, 2025 at 10:12:28PM +0200, Pavel Machek wrote:
> > > Other differences include the lack of V_BATT register to read the bat=
tery
> > > level. The voltage must instead be read from V_CELL, the lowest volta=
ge of
> > > all cells. The mask to identify the chip is different. The computatio=
n of
> > > the charge must also be changed to take into account TASKPERIOD, which
> > > can add a factor 2 to the result.
> > >=20
> > > Add support for the MAX77759 by taking into account all of those
> > > differences based on chip type.
> > >=20
> > > Do not advertise temp probes using the non-volatile memory as those a=
re
> > > not available.
> > >=20
> > > The regmap was proposed by Andr=E9 Draszik in
> > >=20
> > > Link: https://lore.kernel.org/all/d1bade77b5281c1de6b2ddcb4dbbd033e45=
5a116.camel@linaro.org/
> > >=20
> > > Signed-off-by: Thomas Antoine <t.antoine@uclouvain.be>
> > > ---
> > >  drivers/power/supply/max1720x_battery.c | 265 ++++++++++++++++++++++=
++++++----
> > >  1 file changed, 238 insertions(+), 27 deletions(-)
> > >=20
> > > diff --git a/drivers/power/supply/max1720x_battery.c b/drivers/power/=
supply/max1720x_battery.c
> > > index 68b5314ecf3a234f906ec8fe400e586855b69cd9..c9ad452ada9d0a2a51f37=
d04fd8c3260be522405 100644
> > > --- a/drivers/power/supply/max1720x_battery.c
> > > +++ b/drivers/power/supply/max1720x_battery.c
> > > @@ -37,6 +37,7 @@
> > >  #define MAX172XX_REPCAP			0x05	/* Average capacity */
> > >  #define MAX172XX_REPSOC			0x06	/* Percentage of charge */
> > >  #define MAX172XX_TEMP			0x08	/* Temperature */
> > > +#define MAX172XX_VCELL			0x09	/* Lowest cell voltage */
> > [...]
> > >  	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
> > [...]
> > > +			ret =3D regmap_read(info->regmap, MAX172XX_VCELL, &reg_val);
> > > +			val->intval =3D max172xx_cell_voltage_to_ps(reg_val);
> >=20
> > I haven't reviewed this fully due to all the feedback you already
> > got from Peter Griffin and the DT binding being broken, but something
> > that catched my eye:
> >=20
> > POWER_SUPPLY_PROP_VOLTAGE_NOW provides the voltage of the whole
> > battery and not of a single cell. E.g. a typical Li-Ion battery
> > with two serial cells has a nominal voltage of roughly 7.4V while
> > each cell has just 3.7V.
>=20
> Phones normally only have one cell...

=2E.. and chips often support more and are used in all kind of devices.

(Btw. some new high-end phones start to have 1S2P configuration)

Greetings,

-- Sebastian

--c4dm6iyzznajhm27
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmhrCV8ACgkQ2O7X88g7
+ppJvRAAg7PAPwbCzrNitsQskPCm2wR7E5zX11wF6cw97Vs4cjsW1RVbWRpf+Chy
QCEESLFfi2EVnFxE9I+Zrk0xhJ1MWiK84gHCpDMjXgiAM3xh49fzBS/l3GQd86G+
Ss0kwxK3li/15hwltW2fqwMLtB43HEz+nfxy2E5QzxRodKm2PZFzWAI97/0h0Ygc
ldoEPNJ2N2CKjPTF6Wx9Qt2CWHpF0QynX3uHiT4woBEH3a08jh3KX6JDFMeJ8jsN
YX8dAT/IvoQ787Lwp6NBKgin+miTEk1eaxNI/0XLcTL/mjuuYY3mBWiv/9rW/NrN
mFzQABShn0ZPV55EwwOyhwWkpqowoyzhEFe8vvBUAcYjPDAKWd4d0bFEBNJnyQWh
gAukMdZkH3rCgoonf5q6qpsq50dXirTF1Pn5dxaleW6tnW0WHveH/sTlcsO9jNg7
zqD3+hS8XrjTR1inZZeNk/Zpfdb8coDbUupU2UGlaAuoXPG8qV/f4+z5QgZUrGr9
A7OjyPCvqvyRuQrRaQ++pIaHfoiMv0qInRkUO/4la7ypqG2fzROzTFmkwcqLPdLJ
rM5AgkEY7hUsX52BhIUlxJYoCksa/Wm19Jy+K+vJg75kLvzyC74ANEZXfKz0/Oqi
r7LhPJC+v8SsKRfgapLbq9Q/XrS9tsJa3JM1PqobO86gfgXbDIo=
=e+oy
-----END PGP SIGNATURE-----

--c4dm6iyzznajhm27--

