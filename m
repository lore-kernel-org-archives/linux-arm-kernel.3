Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3793CD3E77A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 20:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sCHzSZykXO93eeEJEBWf+F9V18BZ3FNP9z5LSj5KvSU=; b=BjjX7aokQMhJD+zeYY/2YwoSU3
	19ASpZkUyuyQ4eC1u6s4n14QdbhNNusr9t94AtVtLV/6oDhRcMJMIOzkA4962BFFlZaRX9IFdWd/p
	n9dvUzaTEtKw6Tj9s7s00xKYtJi6MxjA2h1oJx9oblufuZqJx4+SGGZgGKL1ov7Hpge5QCrXem03/
	hBtWM3J6ZskMD1Ri0RN/DCBH+oxlqFcpOB09ixSNawZM0NtOqFh6fKCBfEoNvqulSTGI6f1FwMQlV
	rRjUUcnqtS0SbFYjGBJletwMRPr7xxQejQELChWNBHU7oFnB0BR41ZoNX2wHM6+zcBzGkpi7wZJIb
	sfzTWTXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTQv3-0000000Fqrh-0aEJ;
	Wed, 10 Dec 2025 20:36:17 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTQv1-0000000Fqr9-0RPj;
	Wed, 10 Dec 2025 20:36:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765398972;
	bh=iu9EENtffABAM+nQix4N6mAUaqqYO+v7S6GOZmMWLFg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=cLgudJDmlC8ds4/zhPeAe43sonWlyKa8Af4g/IrvpPGW7ITltpE7FvBfZHUQFhtvn
	 uA2Y9BRY2tuzqbKUaL7Ti0xtXLzDdIjdkwkUBy9niiVWDFUCT1KCGtynqmcAqlM6vi
	 KKFUnJ2O3LWud3aGAGTNi83y2Svzj+yF/uxVVaM2p7c7HRI6XWC3Yzu65oCq57O7+c
	 fmXHIsDLgTcUNya9QjpJiAptEx2kDJz46FJD/ZfGKDTo5VQMBM5s+IywOTvdmnvYP4
	 6uOGYQTU9NdZQAv68LbeCL39FqC1+QvNvpwT/LTqDRk5RTpC0PJjHZXiktSOElRVmZ
	 XBtt3FwCHHusA==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3666617E12FE;
	Wed, 10 Dec 2025 21:36:10 +0100 (CET)
Message-ID: <1ba983fd1b805bd18406e8d614bc9c72a109a0f9.camel@collabora.com>
Subject: Re: [PATCH v4 11/15] media: rkvdec: Enable all clocks without
 naming them
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
 kernel@collabora.com, Diederik de Haas	 <didi.debian@cknow.org>
Date: Wed, 10 Dec 2025 15:36:09 -0500
In-Reply-To: <20251022174508.284929-12-detlev.casanova@collabora.com>
References: <20251022174508.284929-1-detlev.casanova@collabora.com>
	 <20251022174508.284929-12-detlev.casanova@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-BOSFWzxNrTjctTINGeR2"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_123615_318353_2471C12F 
X-CRM114-Status: GOOD (  20.31  )
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


--=-BOSFWzxNrTjctTINGeR2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 22 octobre 2025 =C3=A0 13:45 -0400, Detlev Casanova a =C3=A9cri=
t=C2=A0:
> For other variants, the clock names and number will differ.
>=20
> There is no need to keep track of the clock names in the driver so drop
> them to avoid having a list for each variant.
>=20
> Tested-by: Diederik de Haas <didi.debian@cknow.org>=C2=A0 # Rock 5B
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0.../media/platform/rockchip/rkvdec/rkvdec.c=C2=A0=C2=A0 | 24 +++++-=
-------------
> =C2=A0.../media/platform/rockchip/rkvdec/rkvdec.h=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A02 files changed, 7 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.c
> index b0e90c9b826e..aa92b586429e 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -1311,15 +1311,10 @@ static const struct of_device_id of_rkvdec_match[=
] =3D {
> =C2=A0};
> =C2=A0MODULE_DEVICE_TABLE(of, of_rkvdec_match);
> =C2=A0
> -static const char * const rkvdec_clk_names[] =3D {
> -	"axi", "ahb", "cabac", "core"
> -};
> -
> =C2=A0static int rkvdec_probe(struct platform_device *pdev)
> =C2=A0{
> =C2=A0	const struct rkvdec_variant *variant;
> =C2=A0	struct rkvdec_dev *rkvdec;
> -	unsigned int i;
> =C2=A0	int ret, irq;
> =C2=A0
> =C2=A0	variant =3D of_device_get_match_data(&pdev->dev);
> @@ -1336,19 +1331,12 @@ static int rkvdec_probe(struct platform_device *p=
dev)
> =C2=A0	mutex_init(&rkvdec->vdev_lock);
> =C2=A0	INIT_DELAYED_WORK(&rkvdec->watchdog_work, rkvdec_watchdog_func);
> =C2=A0
> -	rkvdec->clocks =3D devm_kcalloc(&pdev->dev, ARRAY_SIZE(rkvdec_clk_names=
),
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(*rkvdec->clocks), GFP_KERNEL);
> -	if (!rkvdec->clocks)
> -		return -ENOMEM;
> -
> -	for (i =3D 0; i < ARRAY_SIZE(rkvdec_clk_names); i++)
> -		rkvdec->clocks[i].id =3D rkvdec_clk_names[i];
> -
> -	ret =3D devm_clk_bulk_get(&pdev->dev, ARRAY_SIZE(rkvdec_clk_names),
> -				rkvdec->clocks);
> -	if (ret)
> +	ret =3D devm_clk_bulk_get_all_enabled(&pdev->dev, &rkvdec->clocks);
> +	if (ret < 0)
> =C2=A0		return ret;
> =C2=A0
> +	rkvdec->clk_count =3D ret;
> +
> =C2=A0	rkvdec->regs =3D devm_platform_ioremap_resource(pdev, 0);
> =C2=A0	if (IS_ERR(rkvdec->regs))
> =C2=A0		return PTR_ERR(rkvdec->regs);
> @@ -1426,7 +1414,7 @@ static int rkvdec_runtime_resume(struct device *dev=
)
> =C2=A0{
> =C2=A0	struct rkvdec_dev *rkvdec =3D dev_get_drvdata(dev);
> =C2=A0
> -	return clk_bulk_prepare_enable(ARRAY_SIZE(rkvdec_clk_names),
> +	return clk_bulk_prepare_enable(rkvdec->clk_count,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rkvdec->clocks);
> =C2=A0}
> =C2=A0
> @@ -1434,7 +1422,7 @@ static int rkvdec_runtime_suspend(struct device *de=
v)
> =C2=A0{
> =C2=A0	struct rkvdec_dev *rkvdec =3D dev_get_drvdata(dev);
> =C2=A0
> -	clk_bulk_disable_unprepare(ARRAY_SIZE(rkvdec_clk_names),
> +	clk_bulk_disable_unprepare(rkvdec->clk_count,
> =C2=A0				=C2=A0=C2=A0 rkvdec->clocks);
> =C2=A0	return 0;
> =C2=A0}
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.h
> index dfafb2c2cbc1..4094f92f8a44 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> @@ -131,6 +131,7 @@ struct rkvdec_dev {
> =C2=A0	struct v4l2_m2m_dev *m2m_dev;
> =C2=A0	struct device *dev;
> =C2=A0	struct clk_bulk_data *clocks;
> +	unsigned int clk_count;
> =C2=A0	void __iomem *regs;
> =C2=A0	struct mutex vdev_lock; /* serializes ioctls */
> =C2=A0	struct delayed_work watchdog_work;

--=-BOSFWzxNrTjctTINGeR2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTnZuQAKCRDZQZRRKWBy
9F6KAQDX1FEF60r8WQBClfvUjzbKSFzJivRiwGSduzc79HUnwwD+Ou+JClfBX7PQ
q3xdbXwqLdQDLySMfUZPJVv1WiJeIgg=
=+GsG
-----END PGP SIGNATURE-----

--=-BOSFWzxNrTjctTINGeR2--

