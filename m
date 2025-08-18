Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE76CA0EF4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 21:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xC2SZWmQUCFzhfCg6h8ZaFPverPVOOlqxq7qVG6Ian4=; b=zUlkEzPi5M4SjoTKcww0eqw0LF
	yy74/1hJxYJt0VJPKGxNUZRToAF7TZoVFR4Z74gdrljgI5frYn8DjvIU9PqFGMIwC75+Q+ptpzdVd
	8ZqLBrrjbiG8G0VVxDJyhu2zmscaaAOlGKY0p2oVCSNcc8an0YKwoHDNHpfHdTBsGjr9ZPAvITDNq
	1yiOyww+V6AJtrR3je6ZNZ3r02y2ItXfDThslGWfKCE/s7tJAs/C5fyeyCyaoEgbikQJOKxSNF+O2
	m42GAu8OHcn7xgaSo79yM86St2UrPmBwgaRhYFKQd+YOUXr45C7ll2GO+k2ZApDl7T3kYwpnyazW4
	xP1TOr0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo7Nt-00000008i47-1ED5;
	Mon, 18 Aug 2025 21:27:17 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo5Sp-00000008VUt-2aFT;
	Mon, 18 Aug 2025 19:24:16 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755545041; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MEAayUve1cgZnYqzQLt8UHmUL3E8p83LLhLWCvXx82ImBIdHGQqkFKMtjOU+ZJYBemFMRz3Ksdg/UWAy0VFWpM4Fg5jb6By2hc99d/h5xoyeyFjMl1gHyQlw2Wg2CvCyO7qhJqWIGl9nvvSTh9FH+Yw13fRVo3ECe28vU9yV2OQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755545041; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xC2SZWmQUCFzhfCg6h8ZaFPverPVOOlqxq7qVG6Ian4=; 
	b=LnVlMrezdOZWJ9f0HFc2wMYyOzjD54HreCbX3mSQBLJCxkTFyY5fCN+Y/dD5muK2JUh1XbIXAvA5itUHDk0SHI3rrWBqn5Yy/s+j1oO4R8/7zS4apOohLIq96I0uVNOLSclxX5+e4A2eyot4g3PqPxy2R0L+kVt4NcJXzl8zryk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755545041;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=xC2SZWmQUCFzhfCg6h8ZaFPverPVOOlqxq7qVG6Ian4=;
	b=PPPIeaBE3dimZbDdsXZ/pcg+QbbzyzRZG2/cqWXYMQnQp9A0M9faPhJrPHJNcs7u
	eC9wfK5/nWZwbw4Z8bpNb8ZAcuVhYdOcxCSPZ7OXR/NuM/ucpQxfaBr86IJpqayqRYJ
	3LplgZzafaOdnbMpgRRkKnps2v2+9lBCPi1jOlBk=
Received: by mx.zohomail.com with SMTPS id 1755545038605539.0994146527904;
	Mon, 18 Aug 2025 12:23:58 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 73C741807BB; Mon, 18 Aug 2025 21:23:54 +0200 (CEST)
Date: Mon, 18 Aug 2025 21:23:54 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH] thermal: rockchip: shut up GRF warning
Message-ID: <b6cqwtj73twqxstslbhuulkgsmpds2hdyfsn7yewllkbtj7jz3@2kk74kgtefvp>
References: <20250818-thermal-rockchip-grf-warning-v1-1-134152c97097@kernel.org>
 <8402789.eFmWaWnqpD@diego>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f4syvxjpnjq5ccn7"
Content-Disposition: inline
In-Reply-To: <8402789.eFmWaWnqpD@diego>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.3/255.491.27
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_122415_723736_36A0C5B1 
X-CRM114-Status: GOOD (  29.78  )
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


--f4syvxjpnjq5ccn7
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] thermal: rockchip: shut up GRF warning
MIME-Version: 1.0

Hi,

On Mon, Aug 18, 2025 at 08:44:15PM +0200, Heiko St=FCbner wrote:
> Hi Sebastian,
>=20
> Am Montag, 18. August 2025, 19:26:15 Mitteleurop=E4ische Sommerzeit schri=
eb Sebastian Reichel:
> > Most of the recent Rockchip devices do not have a GRF associated
> > with the tsadc IP. Let's avoid printing a warning on those devices.
> >=20
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
>=20
> thanks a lot for tracking down the GRF usage for all the soc variants :-)
>=20
> > ---
> >  drivers/thermal/rockchip_thermal.c | 53 ++++++++++++++++++++++++++++++=
+++-----
> >  1 file changed, 46 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/thermal/rockchip_thermal.c b/drivers/thermal/rockc=
hip_thermal.c
> > index 3beff9b6fac3abe8948b56132b618ff1bed57217..1e8091cebd6673ab39fa0c4=
dee835c68aeb7e8b5 100644
> > --- a/drivers/thermal/rockchip_thermal.c
> > +++ b/drivers/thermal/rockchip_thermal.c
> > @@ -1099,6 +1114,8 @@ static const struct rockchip_tsadc_chip px30_tsad=
c_data =3D {
> >  	.chn_offset =3D 0,
> >  	.chn_num =3D 2, /* 2 channels for tsadc */
> > =20
> > +	.grf_mode =3D GRF_MANDATORY,
> > +
> >  	.tshut_mode =3D TSHUT_MODE_CRU, /* default TSHUT via CRU */
> >  	.tshut_temp =3D 95000,
> > =20
> > @@ -1123,6 +1140,8 @@ static const struct rockchip_tsadc_chip rv1108_ts=
adc_data =3D {
> >  	.chn_offset =3D 0,
> >  	.chn_num =3D 1, /* one channel for tsadc */
> > =20
> > +	.grf_mode =3D GRF_NONE,
> > +
>=20
> nit: I guess instead of adding an empty line, you could also just drop
> the empty line above, to bring the "older" variants into the form
> rk3576 and rk3588 use.

Ack.

>=20
> >  	.tshut_mode =3D TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC =
*/
> >  	.tshut_polarity =3D TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
> >  	.tshut_temp =3D 95000,
>=20
> [...]
>=20
> > @@ -1321,6 +1354,7 @@ static const struct rockchip_tsadc_chip rk3576_ts=
adc_data =3D {
> >  	/* top, big_core, little_core, ddr, npu, gpu */
> >  	.chn_offset =3D 0,
> >  	.chn_num =3D 6, /* six channels for tsadc */
> > +	.grf_mode =3D GRF_NONE,
> >  	.tshut_mode =3D TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC =
*/
> >  	.tshut_polarity =3D TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
> >  	.tshut_temp =3D 95000,
> > @@ -1345,6 +1379,7 @@ static const struct rockchip_tsadc_chip rk3588_ts=
adc_data =3D {
> >  	/* top, big_core0, big_core1, little_core, center, gpu, npu */
> >  	.chn_offset =3D 0,
> >  	.chn_num =3D 7, /* seven channels for tsadc */
> > +	.grf_mode =3D GRF_NONE,
> >  	.tshut_mode =3D TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC =
*/
> >  	.tshut_polarity =3D TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
> >  	.tshut_temp =3D 95000,
>=20
> [...]
>=20
> > @@ -1621,12 +1656,16 @@ static int rockchip_configure_from_dt(struct de=
vice *dev,
> >  		return -EINVAL;
> >  	}
> > =20
> > -	/* The tsadc wont to handle the error in here since some SoCs didn't
> > -	 * need this property.
> > -	 */
> > -	thermal->grf =3D syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
> > -	if (IS_ERR(thermal->grf))
> > -		dev_warn(dev, "Missing rockchip,grf property\n");
> > +	if (thermal->chip->grf_mode !=3D GRF_NONE) {
> > +		thermal->grf =3D syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
> > +		if (IS_ERR(thermal->grf)) {
> > +			ret =3D PTR_ERR(thermal->grf);
> > +			if (thermal->chip->grf_mode =3D=3D GRF_OPTIONAL)
> > +				dev_warn(dev, "Missing rockchip,grf property\n");
>=20
> I guess it might make it easier for people seeing the log, if we could
> insert an "optional" into that message for the optional tier.

Sure, I can add an "optional". I'm not sure how "optional" they
really are, though. Code like this looks quite fishy to me:

if (grf)
    regmap_write(grf, ..., RK3568_GRF_TSADC_TSEN);

I marked these as optional, as the driver should probe without the
GRF. But to me it looks like most platforms with optional GRF
support should have been made mandatory in the first place.

Greetings,

-- Sebastian

>=20
> > +			else
> > +				return dev_err_probe(dev, ret, "Missing rockchip,grf property\n");
> > +		}
> > +	}
> > =20
> >  	rockchip_get_trim_configuration(dev, np, thermal);
>=20
> Overall, though
>=20
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Thanks.

-- Sebastian

--f4syvxjpnjq5ccn7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmijfcMACgkQ2O7X88g7
+poPHg//efs+J4Hui5D8axB82QAJeycTnErfOPejEi8dt7J8adP3bMfG3yrfZNqS
kA0YECDcfa3pE5i1suwJOhnleQvIbaEL9AOac3CClnso6slCUIc/DxAqZ1k+G+wy
wa9F3J+wJUat3vhvXhL+5R/w9K0ZJMHbZtS/w66tREeYHiw259Ne1emPN6qk7KpG
+GAyZhMlPwUg0AlgoouiqlaqUmE3HuoMSO813D7Fu08hz7qFsQ0CbUz3yP3TojqX
cnBflUtoFhAkEnzP0+GWhgJeDRRpJpugCmTi0m08cEdyTLWUmJlVZ8fbrsCoFsci
hY9nxTLGlzB45ywZtm7Z679fo4ooEtUI2CGQvEtaC60/Hb1/mLiiaF44Z5d4i/np
IAPeVT/z9IhQ463SaG6+jkIeIk7SrNLlT92PYW1yOW9ho8Rn+sFLXaub1WQCeBuh
Qf9gzCgMMRIXwaDs3p3LgpPpvJlvMmpjU0O/eu+8BiH4Oj54bjFg0rxXeAmyDHNm
VZReINtfcIUDNqm3o8VhZ9yYcAFo1hKZVu3v4UCp0XpHzHrmbpZCVZMMleADCoCM
/b7dJ+NqRuDNHglYeHcxX7ETOd31D2rdszqC94QfKTBa2unNXzG7eikxjn+z14sQ
KgyaSVb0WPwMTm7mNVbu8A5kU0GZ1ndyM+/Q2OSOCfbBGMFZC0c=
=Xhd5
-----END PGP SIGNATURE-----

--f4syvxjpnjq5ccn7--

