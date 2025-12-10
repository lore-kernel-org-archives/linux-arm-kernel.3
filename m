Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 593D9D3B9AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 20:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NXpFAuQvtrHkgdFBws0MVJ/lIGJw13mUnRpG4veBXJk=; b=PNT9oVczGimqOWhwHd8KVnl8Ak
	PO9GzZ0WEZTAV28hVn0iLPwddIHkI2Mo/3LZO1MOJNfTRPsxOhCV0VL/ymyqAy9iyhBBDQMInBozn
	PyQxLCf75iFfy/M5vu79w6SxidRaE4NWvc+neF+qlodq6653YcUaKlhlgiQJKLxlWFM3B5HKYiSac
	jsqWDPQLUn0Hl0bt+Q0k2ZRMjWEkeWB0N6ZGsOy3OABJCEr4sWLiH7gEU+d4dZUtw9qOZ5Jf7dOzA
	kLmucL0wxrv04CkjxkQt0rMcJrUF7DaO/Jeg7BNGOsmZRkHxsVwSiPSy39fz4J8ZpYiZ6EvFx7DC5
	d244JJGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTQkG-0000000FqD2-1MSw;
	Wed, 10 Dec 2025 20:25:08 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTQkD-0000000FqCY-0GTh;
	Wed, 10 Dec 2025 20:25:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765398302;
	bh=R95Xvco65EKPytjxWCzBxf40m1SmGjBMSkCJw5E1DaM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ZxNkW/6QZI4GlNUS+qN1zfhIF6fFiS4+reopasHLeBAqqrAbVJJ5d5enVfonBmP+T
	 AhhmyXzOjbtdiMTymT+ZBVlmcVv6n+v8j144Vc38zO4XG8HGWwdsJQaS1Tdcbwnrcb
	 tyFhkXlIJLw1ldg1GC3VWFXUIUlR+Qg3nvfH3u9qSj0xrJMJWnxPaOcKOkcP6wmZWQ
	 N0AQzqozETQyR7cmywI0hJn0OTdctVf1YDUul3HpQFvHBSlGg4oWFggvpLSfnD0/pt
	 G9MYYkbfE0PaBCRSVJvbvZIgKwP+1gDQFC7txrer2iI9dC2dCd8CCMPSvdHaPgZ3kC
	 g44Y+UGUeCePA==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CD8B217E12FB;
	Wed, 10 Dec 2025 21:25:00 +0100 (CET)
Message-ID: <a6e8003768f9daa9303e1ee82bedd8c48d59afd2.camel@collabora.com>
Subject: Re: [PATCH v4 08/15] media: rkvdec: Add generic configuration for
 variants
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
Date: Wed, 10 Dec 2025 15:24:59 -0500
In-Reply-To: <20251022174508.284929-9-detlev.casanova@collabora.com>
References: <20251022174508.284929-1-detlev.casanova@collabora.com>
	 <20251022174508.284929-9-detlev.casanova@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-eO2lpkzOxBjYInpmHwNq"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_122505_286847_5F20CFC7 
X-CRM114-Status: GOOD (  20.14  )
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


--=-eO2lpkzOxBjYInpmHwNq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 22 octobre 2025 =C3=A0 13:45 -0400, Detlev Casanova a =C3=A9cri=
t=C2=A0:
> This is to prepare for adding new versions of the decoder and
> support specific formats and ops per version.
>=20
> Different rkvdec_variant instances will be able to share generic
> decoder configs.
>=20
> Tested-by: Diederik de Haas <didi.debian@cknow.org>=C2=A0 # Rock 5B
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
> =C2=A0.../media/platform/rockchip/rkvdec/rkvdec.c=C2=A0=C2=A0 | 37 ++++++=
++++++-------
> =C2=A0.../media/platform/rockchip/rkvdec/rkvdec.h=C2=A0=C2=A0 |=C2=A0 6 +=
++
> =C2=A02 files changed, 30 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.c
> index 776149f871b0..a7af1e3fdebd 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -373,15 +373,16 @@ static bool rkvdec_is_capable(struct rkvdec_ctx *ct=
x, unsigned int capability)
> =C2=A0static const struct rkvdec_coded_fmt_desc *
> =C2=A0rkvdec_enum_coded_fmt_desc(struct rkvdec_ctx *ctx, int index)
> =C2=A0{
> +	const struct rkvdec_config *cfg =3D ctx->dev->variant->config;
> =C2=A0	int fmt_idx =3D -1;
> =C2=A0	unsigned int i;
> =C2=A0
> -	for (i =3D 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
> -		if (!rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability))
> +	for (i =3D 0; i < cfg->coded_fmts_num; i++) {
> +		if (!rkvdec_is_capable(ctx, cfg->coded_fmts[i].capability))
> =C2=A0			continue;
> =C2=A0		fmt_idx++;
> =C2=A0		if (index =3D=3D fmt_idx)
> -			return &rkvdec_coded_fmts[i];
> +			return &cfg->coded_fmts[i];
> =C2=A0	}
> =C2=A0
> =C2=A0	return NULL;
> @@ -390,12 +391,13 @@ rkvdec_enum_coded_fmt_desc(struct rkvdec_ctx *ctx, =
int index)
> =C2=A0static const struct rkvdec_coded_fmt_desc *
> =C2=A0rkvdec_find_coded_fmt_desc(struct rkvdec_ctx *ctx, u32 fourcc)
> =C2=A0{
> +	const struct rkvdec_config *cfg =3D ctx->dev->variant->config;
> =C2=A0	unsigned int i;
> =C2=A0
> -	for (i =3D 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
> -		if (rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability) &&
> -		=C2=A0=C2=A0=C2=A0 rkvdec_coded_fmts[i].fourcc =3D=3D fourcc)
> -			return &rkvdec_coded_fmts[i];
> +	for (i =3D 0; i < cfg->coded_fmts_num; i++) {
> +		if (rkvdec_is_capable(ctx, cfg->coded_fmts[i].capability) &&
> +		=C2=A0=C2=A0=C2=A0 cfg->coded_fmts[i].fourcc =3D=3D fourcc)
> +			return &cfg->coded_fmts[i];
> =C2=A0	}
> =C2=A0
> =C2=A0	return NULL;
> @@ -1014,18 +1016,19 @@ static int rkvdec_add_ctrls(struct rkvdec_ctx *ct=
x,
> =C2=A0
> =C2=A0static int rkvdec_init_ctrls(struct rkvdec_ctx *ctx)
> =C2=A0{
> +	const struct rkvdec_config *cfg =3D ctx->dev->variant->config;
> =C2=A0	unsigned int i, nctrls =3D 0;
> =C2=A0	int ret;
> =C2=A0
> -	for (i =3D 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++)
> -		if (rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability))
> -			nctrls +=3D rkvdec_coded_fmts[i].ctrls->num_ctrls;
> +	for (i =3D 0; i < cfg->coded_fmts_num; i++)
> +		if (rkvdec_is_capable(ctx, cfg->coded_fmts[i].capability))
> +			nctrls +=3D cfg->coded_fmts[i].ctrls->num_ctrls;
> =C2=A0
> =C2=A0	v4l2_ctrl_handler_init(&ctx->ctrl_hdl, nctrls);
> =C2=A0
> -	for (i =3D 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
> -		if (rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability)) {
> -			ret =3D rkvdec_add_ctrls(ctx, rkvdec_coded_fmts[i].ctrls);
> +	for (i =3D 0; i < cfg->coded_fmts_num; i++) {
> +		if (rkvdec_is_capable(ctx, cfg->coded_fmts[i].capability)) {
> +			ret =3D rkvdec_add_ctrls(ctx, cfg->coded_fmts[i].ctrls);
> =C2=A0			if (ret)
> =C2=A0				goto err_free_handler;
> =C2=A0		}
> @@ -1240,13 +1243,20 @@ static void rkvdec_watchdog_func(struct work_stru=
ct *work)
> =C2=A0	}
> =C2=A0}
> =C2=A0
> +static const struct rkvdec_config config_rkvdec =3D {
> +	.coded_fmts =3D rkvdec_coded_fmts,
> +	.coded_fmts_num =3D ARRAY_SIZE(rkvdec_coded_fmts),

No true preference, I would intuitively used a sentinel. In any case:

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> +};
> +
> =C2=A0static const struct rkvdec_variant rk3288_rkvdec_variant =3D {
> =C2=A0	.num_regs =3D 68,
> +	.config =3D &config_rkvdec,
> =C2=A0	.capabilities =3D RKVDEC_CAPABILITY_HEVC,
> =C2=A0};
> =C2=A0
> =C2=A0static const struct rkvdec_variant rk3328_rkvdec_variant =3D {
> =C2=A0	.num_regs =3D 109,
> +	.config =3D &config_rkvdec,
> =C2=A0	.capabilities =3D RKVDEC_CAPABILITY_HEVC |
> =C2=A0			RKVDEC_CAPABILITY_H264 |
> =C2=A0			RKVDEC_CAPABILITY_VP9,
> @@ -1255,6 +1265,7 @@ static const struct rkvdec_variant rk3328_rkvdec_va=
riant =3D {
> =C2=A0
> =C2=A0static const struct rkvdec_variant rk3399_rkvdec_variant =3D {
> =C2=A0	.num_regs =3D 78,
> +	.config =3D &config_rkvdec,
> =C2=A0	.capabilities =3D RKVDEC_CAPABILITY_HEVC |
> =C2=A0			RKVDEC_CAPABILITY_H264 |
> =C2=A0			RKVDEC_CAPABILITY_VP9,
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.h
> index f35f6e80ea2e..3b1cc511412e 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> @@ -71,6 +71,7 @@ vb2_to_rkvdec_decoded_buf(struct vb2_buffer *buf)
> =C2=A0
> =C2=A0struct rkvdec_variant {
> =C2=A0	unsigned int num_regs;
> +	const struct rkvdec_config *config;
> =C2=A0	unsigned int capabilities;
> =C2=A0	unsigned int quirks;
> =C2=A0};
> @@ -113,6 +114,11 @@ struct rkvdec_coded_fmt_desc {
> =C2=A0	unsigned int capability;
> =C2=A0};
> =C2=A0
> +struct rkvdec_config {
> +	const struct rkvdec_coded_fmt_desc *coded_fmts;
> +	size_t coded_fmts_num;
> +};
> +
> =C2=A0struct rkvdec_dev {
> =C2=A0	struct v4l2_device v4l2_dev;
> =C2=A0	struct media_device mdev;

--=-eO2lpkzOxBjYInpmHwNq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTnXHAAKCRDZQZRRKWBy
9I55AP97ihjqKsQ4Um0+osxeBqzXH9J+ghH3LP+924VyP2YxCgD/Y1A6SBeKX+R2
Dwdk9Cy7W/KuC0xtMf3xC7+Gz0rDhgs=
=hUsY
-----END PGP SIGNATURE-----

--=-eO2lpkzOxBjYInpmHwNq--

