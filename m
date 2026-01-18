Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C682DC9830C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 22:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+5t8PMIYwLCDA9XcN67bOmWUQXdjUIZIWUAqCbV4t2E=; b=CF78PP24/ZB4afknOZXyQyE6tL
	kmh5ki9nvzwS2ER/MeJxmzEm3nidoIaCSklEcEZptX6iNiPF+nFwkNO+BT0+S9smh8He9dklOJKNH
	ReoYWOhmpIFczj5WnfuOz+2cDGyW2qKElz5U7G9cUzRb83gTpHUQkfHprK6QlAXs3jSlmB0uzEvZ/
	sB0cAXZGBOEyZcWsm2rO2M5/KgU7sNljRGSxzrVBPbeqPo9qpPj+qtCSC24HXZ8zekZffJ2cZjLAa
	r7T4Hq/yhW57fGSIR6gqgVSHFtn46R1qgmfa+qGWwlsCWIdLijvDLdTubqm57vwF++/+sJAUzZb2x
	8Z2iNCqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhb1s-000000014yz-1H5Z;
	Sun, 18 Jan 2026 22:13:52 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhb1q-000000014yQ-20Tw;
	Sun, 18 Jan 2026 22:13:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768774427;
	bh=5I164RptfsNrn8iE4rwhVQkx/B5wOvEz/vwE+fkPtlA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Z16ombqlUQoiFDa1C0Vx9AmJ4mMn3BaW3lZdZEMf7mxsO5dV+I9v1db/GB2pBinbh
	 HZY2ulIttYx1iIfUAnP/fBoC8LaNBGAPmrqnj0uUn9eRU2uebdPrOThH2875xlY2s3
	 0Jq0be5oPSYY0/lIt18j+xkqJ6E6sumeVcbtTkQwQQDSwhxLP29AIhBeEIdd8/ba8E
	 Yv4N4RhdgoiiD7X4ucrZD+j1EXnPQH7U9v9Mh/XbDF2kx9vLfCqEwnNkWFOh1ZYJDe
	 qNiPLJjVzl1wGmzYpxC6MmYh9UQX/469r4dofjpb7032EBNu6zNvifqwAezvjGKKMW
	 lKIMfF7kYnlQg==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6B17B17E0222;
	Sun, 18 Jan 2026 23:13:45 +0100 (CET)
Message-ID: <dff8d7889655ccc0f1808847879fb5afb654f10c.camel@collabora.com>
Subject: Re: [PATCH v8 13/17] media: rkvdec: Disable multicore support
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, 
	linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Ezequiel Garcia	
 <ezequiel@vanguardiasur.com.ar>, Heiko Stuebner <heiko@sntech.de>, Ricardo
 Ribalda <ribalda@chromium.org>, Hans Verkuil <hverkuil@kernel.org>, Hans de
 Goede <hansg@kernel.org>,  Yunke Cao <yunkec@google.com>, Jonathan Corbet
 <corbet@lwn.net>, Laurent Pinchart	 <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,  James Cowgill
 <james.cowgill@blaize.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 	linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, Jonas Karlman	 <jonas@kwiboo.se>, Diederik de Haas
 <didi.debian@cknow.org>
Date: Sun, 18 Jan 2026 17:13:44 -0500
In-Reply-To: <20260109161538.1294449-14-detlev.casanova@collabora.com>
References: <20260109161538.1294449-1-detlev.casanova@collabora.com>
	 <20260109161538.1294449-14-detlev.casanova@collabora.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-wZs5Sq+8oDW2RzUACSNs"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_141350_674022_0C697C10 
X-CRM114-Status: GOOD (  25.97  )
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


--=-wZs5Sq+8oDW2RzUACSNs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 09 janvier 2026 =C3=A0 11:15 -0500, Detlev Casanova a =C3=A9cri=
t=C2=A0:
> Similarly to what is done in Hantro, avoid exposing equal video codecs to
> userspace. Equal video codecs allow scheduling work between the cores.
> For that kernel support is required, which does not yet exist.
> Until that is implemented, avoid exposing each core separately to
> userspace so that multicore can be added in the future without breaking
> userspace ABI.
>=20
> This currently applies only to RK3588 which has 2 equal VDPU381 decoders,
> but will be applied for all SoC supported by rkvdec that has multiple DTS
> nodes with the same compatible.
>=20
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0.../media/platform/rockchip/rkvdec/rkvdec.c=C2=A0=C2=A0 | 47 ++++++=
+++++++++++++
> =C2=A01 file changed, 47 insertions(+)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.c
> index ce96a0470d4d..af2eced90026 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -1269,6 +1269,49 @@ static void rkvdec_watchdog_func(struct work_struc=
t *work)
> =C2=A0	}
> =C2=A0}
> =C2=A0
> +/*
> + * Some SoCs, like RK3588 have multiple identical VDPU cores, but the
> + * kernel is currently missing support for multi-core handling. Exposing
> + * separate devices for each core to userspace is bad, since that does
> + * not allow scheduling tasks properly (and creates ABI). With this work=
around
> + * the driver will only probe for the first core and early exit for the =
other
> + * cores. Once the driver gains multi-core support, the same technique
> + * for detecting the first core can be used to cluster all cores togethe=
r.
> + */
> +static int rkvdec_disable_multicore(struct rkvdec_dev *rkvdec)
> +{
> +	struct device_node *node =3D NULL;
> +	const char *compatible;
> +	bool is_first_core;
> +	int ret;
> +
> +	/* Intentionally ignores the fallback strings */
> +	ret =3D of_property_read_string(rkvdec->dev->of_node, "compatible", &co=
mpatible);
> +	if (ret)
> +		return ret;
> +
> +	/* The first compatible and available node found is considered the main=
 core */
> +	do {
> +		node =3D of_find_compatible_node(node, NULL, compatible);
> +		if (of_device_is_available(node))
> +			break;
> +	} while (node);
> +
> +	if (!node)
> +		return -EINVAL;
> +
> +	is_first_core =3D (rkvdec->dev->of_node =3D=3D node);
> +
> +	of_node_put(node);
> +
> +	if (!is_first_core) {
> +		dev_info(rkvdec->dev, "missing multi-core support, ignoring this insta=
nce\n");
> +		return -ENODEV;
> +	}
> +
> +	return 0;
> +}
> +
> =C2=A0static const struct rkvdec_variant_ops rk3399_variant_ops =3D {
> =C2=A0	.irq_handler =3D rk3399_irq_handler,
> =C2=A0};
> @@ -1332,6 +1375,10 @@ static int rkvdec_probe(struct platform_device *pd=
ev)
> =C2=A0	mutex_init(&rkvdec->vdev_lock);
> =C2=A0	INIT_DELAYED_WORK(&rkvdec->watchdog_work, rkvdec_watchdog_func);
> =C2=A0
> +	ret =3D rkvdec_disable_multicore(rkvdec);
> +	if (ret)
> +		return ret;
> +
> =C2=A0	ret =3D devm_clk_bulk_get_all_enabled(&pdev->dev, &rkvdec->clocks)=
;
> =C2=A0	if (ret < 0)
> =C2=A0		return ret;

--=-wZs5Sq+8oDW2RzUACSNs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaW1bGAAKCRDZQZRRKWBy
9Jx/AQDZZESaQCukgChCX88Sto8M4iKTJH9BQTixoLRLnmWEpgEAgb99SWgBcaxk
S2ZWL+u3wTJBCCgEbAsgmLxwXy+5bgw=
=ei+H
-----END PGP SIGNATURE-----

--=-wZs5Sq+8oDW2RzUACSNs--

