Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF0CC98315
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 23:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9hgay9miSAD3buJLi8be3me5hA30C56BsMqqu95AEtU=; b=IW9svHXCYqdsGLIApcG+zd6l1N
	CXZxxKhLvIGRu3OIMb8V0lBcfwko/8jwX6D/ZBIiMPuQmwayQdjxVCRpK32vM99uBP7sonOy6jssH
	dvwF2TKj40D0Y7Xwfg+2OyIjK6MihIhrW5Hi/yWIkCMhTxrXS9yY2eQOxo18LUOE78tPlbaSePQVk
	rW3JFpsEKSvtsjpfe6KkXHPMc84ECAzRBSGL4G33SE5rGq9PYUEYQaw9PU8NzetMFvoS40wy722Qp
	0I4ExYm50aTt0G5ZuLfex9b7cLtHpyFOLP4Rer2Ra2QlzZXnw6zsAIE0Dsp9p2Wo+bAshGQ63qy8r
	kUp1SnGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhcR4-00000001AFR-0s4q;
	Sun, 18 Jan 2026 23:43:58 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhcR1-00000001AEx-1cj8;
	Sun, 18 Jan 2026 23:43:56 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1768779821; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=O3Qce/pmA9Qu3z3GWWTmXfTfAcYOIAeX36hXYZ+AiPsXHAqWW7uA9ssXjYOIIycKi7sU0w+Lo7zmlmsXyvUQydE9gxh32ILsdkNBJ1/Q9FN7UGJP5xTWWhPafIBKMFbO3I/7Ih/9Zlv/oNztdoDQvgo/P1IlOZKUzkG1onc84Js=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768779821; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9hgay9miSAD3buJLi8be3me5hA30C56BsMqqu95AEtU=; 
	b=D+5ZTtKXUN7bzEeOjtr3zd/iUSSGWqAQ+NNYkmN/v2Ddu700/ZDNKvvrwQmx4PBjwNTiS5PXWcraClWwUpwGzOG2nq/sx7OssS+Iz5plIM+Lw1YF5fY77z+IZphu49PNzRfuHO633jqE756IKwYSkMt9E/DGMqySHVqPjpZF//Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768779821;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=9hgay9miSAD3buJLi8be3me5hA30C56BsMqqu95AEtU=;
	b=UI/+htiy/+v1rB1d/kDxDgitBxGJ5Nd4xTugSrhuzLz1x+3OfT1cZ7FLvhtAXC9T
	KZXI/w2AlzUzaFljj2MXMQ4qeTqAcKpTg0V7ppaJM8Z/F7ET0IXcOWhmDHXXBm6jrD0
	WxEZANakgSNKls+AEi5wTqP61q9YPdXOw7CDZ4IE=
Received: by mx.zohomail.com with SMTPS id 1768779819376685.1898936418468;
	Sun, 18 Jan 2026 15:43:39 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 89EF9180B3F; Mon, 19 Jan 2026 00:43:35 +0100 (CET)
Date: Mon, 19 Jan 2026 00:43:35 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, mripard@kernel.org, 
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v2] drm/rockchip: vop2: Add mode valid callback for crtc
Message-ID: <aW1uWZD6u4e2o6jF@venus>
References: <20260117020738.294825-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gqujfsgpqcw3t2hl"
Content-Disposition: inline
In-Reply-To: <20260117020738.294825-1-andyshrk@163.com>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.5.1/268.777.50
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_154355_508486_894106D3 
X-CRM114-Status: GOOD (  22.93  )
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


--gqujfsgpqcw3t2hl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] drm/rockchip: vop2: Add mode valid callback for crtc
MIME-Version: 1.0

Hi,

On Sat, Jan 17, 2026 at 10:07:30AM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
>=20
> The different Video Ports support different maximum resolutions.
> Reject resolutions that are not supported by a specific VP.
>=20
> Only the output width is checked because the hardware itself does
> not have a hard output height limit.
>=20
> Filter the mode that can't output by the VP/crtc.
>=20
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
>=20
> ---

A common RK3576 setup is VP0 mapped to HDMI and VP1 mapped to USB-C
DP AltMode. Since RK3576 VP1 only supports 2.5K, this can easily
become relevant when connecting a 4K screen via USB-C DP AltMode.
I've tested that this patch properly drops all unsupported modes
based on the resolution.

Further checks will be needed to ensure the bandwidth requirements
are also met (e.g. RK3576 VP1 only supports 2.5K@60Hz, so 2.5K@120Hz
should be marked as BAD). I think the bandwidth check should be a
separate patch, but thought it might be worth mentioning here in
case somebody stumbles over it.

Anyways:

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Tested-by: Sebastian Reichel <sebastian.reichel@collabora.com> # Sige5

Greetings,

-- Sebastian

>=20
> Changes in v2:
> - Add more detailed commit message
>=20
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/d=
rm/rockchip/rockchip_drm_vop2.c
> index 498df0ce4680..74fba29bfff3 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -1439,6 +1439,17 @@ static void vop2_crtc_disable_vblank(struct drm_cr=
tc *crtc)
>  	vop2_crtc_disable_irq(vp, VP_INT_FS_FIELD);
>  }
> =20
> +static enum drm_mode_status vop2_crtc_mode_valid(struct drm_crtc *crtc,
> +						 const struct drm_display_mode *mode)
> +{
> +	struct vop2_video_port *vp =3D to_vop2_video_port(crtc);
> +
> +	if (mode->hdisplay > vp->data->max_output.width)
> +		return MODE_BAD_HVALUE;
> +
> +	return MODE_OK;
> +}
> +
>  static bool vop2_crtc_mode_fixup(struct drm_crtc *crtc,
>  				 const struct drm_display_mode *mode,
>  				 struct drm_display_mode *adj_mode)
> @@ -1884,6 +1895,7 @@ static void vop2_crtc_atomic_flush(struct drm_crtc =
*crtc,
> =20
>  static const struct drm_crtc_helper_funcs vop2_crtc_helper_funcs =3D {
>  	.mode_fixup =3D vop2_crtc_mode_fixup,
> +	.mode_valid =3D vop2_crtc_mode_valid,
>  	.atomic_check =3D vop2_crtc_atomic_check,
>  	.atomic_begin =3D vop2_crtc_atomic_begin,
>  	.atomic_flush =3D vop2_crtc_atomic_flush,
> --=20
> 2.43.0
>=20
> base-commit: 1613a67b5360d6ff78f62143a1cf123414a1b4d9
> branch: rk3576-dp-upstream
>=20

--gqujfsgpqcw3t2hl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmltcCMACgkQ2O7X88g7
+ppLzg/+Nze7XGwl1X1xPP6i9XlcJI5K/+wDKX9sW548Lb49+6Rn5tzDvwLi1KCm
mcpuzdyQJRYPUiNLW5RdkeStpP2N0y3zeot0OR6Nl7muZuNVB+m4qt6IsOFXNqt9
/703p103lEg2EAl8H7C9w+EKCJXLgQpvBAvMhJA5fHLJLCMxFLeBR0iK9bGUJHx3
uJ4xZrNlcSw0YXKPzUQd9EfmaQP1e3OriEp37tZ3grXRgwqrceO9ukvCy0VOuk8v
EfpTHi1Umt0+wJH3Fjq9L73g8YbZkBu/siUKhoSJSCNY5FAOUBa+TKXdHmGjYEEi
evVjntnrCKGZFlJbwqv8sViplGUOBKSUONqBI/gfoAmxQu5paRoY5812qYGnuKB3
Y26nvcpNO8IjazYCAAum68YA5kzYwrCAl1339Eo79N337ihnas0HPyrl5ppv/8gz
oMUr3ulgRFvvZI41qcVOOZmXbcoLz5rXPSQWHXp6s2BUcTlIE2DkZYKjIdafJcwz
oHUJhR26avzPNizuDWM/J2R1E2lcoyuiTT16kmZ+B+YUrPkInEXXCh4JefB/wkEM
c3WJBe81FtTJBs4Da4JqmQ59OaE+rro3dSOz2sH2WachZKQd4WRTkEMWS/LnXQ8P
ILDjiNFgSh91z7DpQr5c3o2yPBJ5DM4BMt/peypMlIdwSQH0Efo=
=kFms
-----END PGP SIGNATURE-----

--gqujfsgpqcw3t2hl--

