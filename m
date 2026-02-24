Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2ACE9B269
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 14:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nNyfIbJseRCYZJkvG9rAEjndfQhStMyQJmY1f4lOVaQ=; b=NTYUHR/s6+uuBdV6N4I9UYua1F
	ClXyRmOMumNZV9RGy7x12hLXUMBHKVPWAlvboIgNx/hPs7s1Vl33dmfRE8HWLrkmnuIOzb3uZiFGM
	YfgsxT0poqdDO8pWYf2woOYHjcPrjI343S6nNd9mMj1+277NsySS6FPRlmsR7LMHBQGgcu2OpxUSR
	eP5J3xYsmIGTzZhkLP0x7V1FPHv5DmvTWrJdoNfpR4K4tMIfXrKXOsZAxsECpeFGkQ0Z/Pfr49d+V
	BxlOtJvonhVDzAt5VZV2Zh148/HSwwXq9DZiZy6CGq3h/kncQlTTzFfkmXVWUJckY6l+kLdcSdq3n
	1lMfwJHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vut8F-00000002BQM-2BSp;
	Tue, 24 Feb 2026 14:11:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vut8C-00000002BPx-33aO;
	Tue, 24 Feb 2026 14:11:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E8DDA442C5;
	Tue, 24 Feb 2026 14:11:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71646C116D0;
	Tue, 24 Feb 2026 14:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771942279;
	bh=/2JKDLuQmJT/18kwnROeCtwnFb0uQ79jz4jv7dCbOiE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S04o0HfkyaGX3s7YD+vFy+QibtQstZMFCM7CKDKDXro6kJ9oY3qWp3X6ZhrB9+uX9
	 E5yQdlQA5Ww3Uri5AKXyg6f/ZDnt8/WdrBEJ4BMsSf6RtMMqHlVv0r8UWRCSbqi4Z6
	 Htl6SeH2WevZlXGo66vsdLXm2o9VDFWXFkf8gYY9l1RdgcislLTQrGybhxCCXAjBAf
	 gF/IYdCImbCX/TkII4LGh2g5f+kUM3Q5k2j0ZCvxP2/N7G/3/d7fly46xLS7TuK2CV
	 370SvjP4WRQvSGHT3HxiESKzZEStcZppsUmqjuL7BK5Bx25WMWdjMg5pWg37fioJ8f
	 TRqG8GgfTOUeg==
Date: Tue, 24 Feb 2026 15:11:16 +0100
From: Maxime Ripard <mripard@kernel.org>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>, Melissa Wen <mwen@igalia.com>, 
	Iago Toral Quiroga <itoral@igalia.com>, Chema Casanova <jmcasanova@igalia.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
Subject: Re: [PATCH v6 1/6] clk: bcm: rpi: Manage clock rate in
 prepare/unprepare callbacks
Message-ID: <20260224-curvy-shiny-dodo-e50cef@houat>
References: <20260218-v3d-power-management-v6-0-40683fd39865@igalia.com>
 <20260218-v3d-power-management-v6-1-40683fd39865@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ocscotebgpj7h4ea"
Content-Disposition: inline
In-Reply-To: <20260218-v3d-power-management-v6-1-40683fd39865@igalia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_061120_845066_EB1800E0 
X-CRM114-Status: GOOD (  30.31  )
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


--ocscotebgpj7h4ea
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 1/6] clk: bcm: rpi: Manage clock rate in
 prepare/unprepare callbacks
MIME-Version: 1.0

Hi Maira,

On Wed, Feb 18, 2026 at 05:44:59PM -0300, Ma=EDra Canal wrote:
> On current firmware versions, RPI_FIRMWARE_SET_CLOCK_STATE doesn't
> actually power off the clock. To achieve meaningful power savings, the
> clock rate must be set to the minimum before disabling. This might be
> fixed in future firmware releases.
>=20
> Rather than pushing rate management to clock consumers, handle it
> directly in the clock framework's prepare/unprepare callbacks. In
> unprepare, set the rate to the firmware-reported minimum before
> disabling the clock. In prepare, for clocks marked with `maximize`
> (currently v3d), restore the rate to the maximum after enabling.
>=20
> Signed-off-by: Ma=EDra Canal <mcanal@igalia.com>
> ---
>  drivers/clk/bcm/clk-raspberrypi.c | 61 ++++++++++++++++++++++-----------=
------
>  1 file changed, 35 insertions(+), 26 deletions(-)
>=20
> diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-rasp=
berrypi.c
> index 1a9162f0ae31e330c46f6eafdd00350599b0eede..0d6e4f43c3bac0e7b38934c5c=
6e4db51211233de 100644
> --- a/drivers/clk/bcm/clk-raspberrypi.c
> +++ b/drivers/clk/bcm/clk-raspberrypi.c
> @@ -66,7 +66,8 @@ const struct raspberrypi_clk_data *clk_hw_to_data(const=
 struct clk_hw *hw)
>  struct raspberrypi_clk_variant {
>  	bool		export;
>  	char		*clkdev;
> -	unsigned long	min_rate;
> +	u32		min_rate;
> +	u32		max_rate;
>  	bool		minimize;
>  	bool		maximize;
>  	u32		flags;
> @@ -289,16 +290,22 @@ static int raspberrypi_fw_dumb_determine_rate(struc=
t clk_hw *hw,
>  static int raspberrypi_fw_prepare(struct clk_hw *hw)
>  {
>  	const struct raspberrypi_clk_data *data =3D clk_hw_to_data(hw);
> +	struct raspberrypi_clk_variant *variant =3D data->variant;
>  	struct raspberrypi_clk *rpi =3D data->rpi;
>  	u32 state =3D RPI_FIRMWARE_STATE_ENABLE_BIT;
>  	int ret;
> =20
>  	ret =3D raspberrypi_clock_property(rpi->firmware, data,
>  					 RPI_FIRMWARE_SET_CLOCK_STATE, &state);
> -	if (ret)
> +	if (ret) {
>  		dev_err_ratelimited(rpi->dev,
>  				    "Failed to set clock %s state to on: %d\n",
>  				    clk_hw_get_name(hw), ret);
> +		return ret;
> +	}
> +
> +	if (variant->maximize)
> +		ret =3D raspberrypi_fw_set_rate(hw, variant->max_rate, 0);


It's not clear to me why you would want to force it to the max there,
and especially the max of the clock. It would make more sense to me to
set it to whatever maximum rate clk_hw_get_rate_range would return
(which should be the minimum of variant->max_rate + all clk->max_rate),
but even then it would erase every call to clk_set_rate before calling
clk_prepare().

I'd understand lowering the clock rate in unprepare to avoid wasting too
much power, but why do we need to raise it here?

>  	return ret;
>  }
> @@ -306,10 +313,19 @@ static int raspberrypi_fw_prepare(struct clk_hw *hw)
>  static void raspberrypi_fw_unprepare(struct clk_hw *hw)
>  {
>  	const struct raspberrypi_clk_data *data =3D clk_hw_to_data(hw);
> +	struct raspberrypi_clk_variant *variant =3D data->variant;
>  	struct raspberrypi_clk *rpi =3D data->rpi;
>  	u32 state =3D 0;
>  	int ret;
> =20
> +	/*
> +	 * On current firmware versions, RPI_FIRMWARE_SET_CLOCK_STATE doesn't
> +	 * actually power off the clock. To achieve meaningful power consumption
> +	 * reduction, the driver needs to set the clock rate to minimum before
> +	 * disabling it.
> +	 */
> +	raspberrypi_fw_set_rate(hw, variant->min_rate, 0);

I'm not sure setting it to variant->min_rate would work directly either,
since it would break consumers expectations. Also, can we guard it with
a version check if we know that there's some good and bad firmwares?

>  	ret =3D raspberrypi_clock_property(rpi->firmware, data,
>  					 RPI_FIRMWARE_SET_CLOCK_STATE, &state);
>  	if (ret)
> @@ -334,7 +350,7 @@ static struct clk_hw *raspberrypi_clk_register(struct=
 raspberrypi_clk *rpi,
>  {
>  	struct raspberrypi_clk_data *data;
>  	struct clk_init_data init =3D {};
> -	u32 min_rate, max_rate;
> +	unsigned long rate;
>  	int ret;
> =20
>  	data =3D devm_kzalloc(rpi->dev, sizeof(*data), GFP_KERNEL);
> @@ -354,18 +370,20 @@ static struct clk_hw *raspberrypi_clk_register(stru=
ct raspberrypi_clk *rpi,
> =20
>  	data->hw.init =3D &init;
> =20
> -	ret =3D raspberrypi_clock_property(rpi->firmware, data,
> -					 RPI_FIRMWARE_GET_MIN_CLOCK_RATE,
> -					 &min_rate);
> -	if (ret) {
> -		dev_err(rpi->dev, "Failed to get clock %d min freq: %d\n",
> -			id, ret);
> -		return ERR_PTR(ret);
> +	if (!variant->min_rate) {
> +		ret =3D raspberrypi_clock_property(rpi->firmware, data,
> +						 RPI_FIRMWARE_GET_MIN_CLOCK_RATE,
> +						 &variant->min_rate);
> +		if (ret) {
> +			dev_err(rpi->dev, "Failed to get clock %d min freq: %d\n",
> +				id, ret);
> +			return ERR_PTR(ret);
> +		}
>  	}

It feels to me like it would need to be a separate patch. Why do you
need to override the minimum clock rate reported by the firmware?

Maxime

--ocscotebgpj7h4ea
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaZ2xhAAKCRAnX84Zoj2+
dj0uAYDYA2mhl71c/wqrDKPAvTLlIAXMJIOSicez1ItK96GamLM8F93PvhqraCfK
fFASXvQBfjYI2nDCisxBUCZeDRhehkuv1iDeaTi0B5qRtiIAcpHPx1JdqS+f2W0b
aFXRe67jFQ==
=xbDx
-----END PGP SIGNATURE-----

--ocscotebgpj7h4ea--

