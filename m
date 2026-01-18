Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD32FCA5FE1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 22:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z4ocFs8Sj6LcUc4uCzM3FYL8P+UcDYmUXr0lHrg8M14=; b=WeLneTk3P/Powkt4EPrJ2XCEpM
	k7hLt1iu8P+fDS5p+RGnEZTbQb4nRon5C41cwF3q5pX+SFbesLwx3z2n4TXOL8+sxVWmIMDkTKYd4
	g4dy+thfrCo8PMyDUumZwiPDkwfDBO2+pgw1PVQ2kJEYrj/HQcDt/yltC5r7QVizAv2ifymSnPSkI
	iQoWHozhZSoP+xNeMyVNcomTvDmQeF8A5eOchv1WJhDLCtJFKOzzPq0yYIlXCDHsHDIxt2r6cBei6
	uWECRB/fq1AVRaV+nVhYsvnUAho/cDGyfKcEyiE2uEbZEy7Oz6EpCwulc9mDVJOuRb+Onkrh84nnR
	3Fqibq1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhayN-000000014eR-36VX;
	Sun, 18 Jan 2026 22:10:15 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhayK-000000014di-23gY;
	Sun, 18 Jan 2026 22:10:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768774208;
	bh=aNTnALIqn9gylktszv6Nhaa3ozx4VeFWCAfnVBwwD7w=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ggzl6WAMLCoE7jp9/FcpGdGp9grrDkPtUgrk00OcuH+2Wnif0wbeyssjfVLio+ZNy
	 4RLDbyz918ustQJu3C6AaSdk9Tmd4Ep0ovUbJXXkSBWQ+gcXRnBHuoeuwLO4XcPQtq
	 lbaWsFAeHvB79ik8gy3YeqY6HouwbQRoxvM+8a7K0yFl7hPBU5fgDmhW259NBEHpuV
	 HFEL45+XVnHwwav7C/KL1Gp6l6UPUX+mFhGjBP0LlnE9c0zcXP/FlY+5H8emZ9VtQ/
	 r9z1ZZqFCHNSKE04fIZxW0VixkQY5K3ehNJEFszLyuG3M8pLD8uZx8DqssrQ2JcmBd
	 HeEzy3RtFy04w==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4D12B17E10E0;
	Sun, 18 Jan 2026 23:10:06 +0100 (CET)
Message-ID: <a6b50b9799bcb63a692e1ac6f3f1df3611e50f11.camel@collabora.com>
Subject: Re: [PATCH v8 11/17] media: rkvdec: Support per-variant interrupt
 handler
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
Date: Sun, 18 Jan 2026 17:10:05 -0500
In-Reply-To: <20260109161538.1294449-12-detlev.casanova@collabora.com>
References: <20260109161538.1294449-1-detlev.casanova@collabora.com>
	 <20260109161538.1294449-12-detlev.casanova@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-D6Niumx4QoSluEWIbZt1"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_141012_706510_5B4DFACF 
X-CRM114-Status: GOOD (  15.85  )
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


--=-D6Niumx4QoSluEWIbZt1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 09 janvier 2026 =C3=A0 11:15 -0500, Detlev Casanova a =C3=A9cri=
t=C2=A0:
> Prepare for supporting different variants with different interrupt
> managers.
>=20
> To support other variants specific function type later, introduce the
> rkvdec_variant_ops struct.
>=20
> Tested-by: Diederik de Haas <didi.debian@cknow.org>=C2=A0 # Rock 5B
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0.../media/platform/rockchip/rkvdec/rkvdec.c=C2=A0=C2=A0 | 21 ++++++=
++++++++++---
> =C2=A0.../media/platform/rockchip/rkvdec/rkvdec.h=C2=A0=C2=A0 |=C2=A0 5 +=
++++
> =C2=A02 files changed, 23 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> index ff6a09e45462..174536ebdcc7 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -1222,10 +1222,9 @@ static void rkvdec_iommu_restore(struct rkvdec_dev
> *rkvdec)
> =C2=A0	}
> =C2=A0}
> =C2=A0
> -static irqreturn_t rkvdec_irq_handler(int irq, void *priv)
> +static irqreturn_t rk3399_irq_handler(struct rkvdec_ctx *ctx)
> =C2=A0{
> -	struct rkvdec_dev *rkvdec =3D priv;
> -	struct rkvdec_ctx *ctx =3D v4l2_m2m_get_curr_priv(rkvdec->m2m_dev);
> +	struct rkvdec_dev *rkvdec =3D ctx->dev;
> =C2=A0	enum vb2_buffer_state state;
> =C2=A0	u32 status;
> =C2=A0
> @@ -1246,6 +1245,15 @@ static irqreturn_t rkvdec_irq_handler(int irq, voi=
d
> *priv)
> =C2=A0	return IRQ_HANDLED;
> =C2=A0}
> =C2=A0
> +static irqreturn_t rkvdec_irq_handler(int irq, void *priv)
> +{
> +	struct rkvdec_dev *rkvdec =3D priv;
> +	struct rkvdec_ctx *ctx =3D v4l2_m2m_get_curr_priv(rkvdec->m2m_dev);
> +	const struct rkvdec_variant *variant =3D rkvdec->variant;
> +
> +	return variant->ops->irq_handler(ctx);
> +}
> +
> =C2=A0static void rkvdec_watchdog_func(struct work_struct *work)
> =C2=A0{
> =C2=A0	struct rkvdec_dev *rkvdec;
> @@ -1261,16 +1269,22 @@ static void rkvdec_watchdog_func(struct work_stru=
ct
> *work)
> =C2=A0	}
> =C2=A0}
> =C2=A0
> +static const struct rkvdec_variant_ops rk3399_variant_ops =3D {
> +	.irq_handler =3D rk3399_irq_handler,
> +};
> +
> =C2=A0static const struct rkvdec_variant rk3288_rkvdec_variant =3D {
> =C2=A0	.num_regs =3D 68,
> =C2=A0	.coded_fmts =3D rk3288_coded_fmts,
> =C2=A0	.num_coded_fmts =3D ARRAY_SIZE(rk3288_coded_fmts),
> +	.ops =3D &rk3399_variant_ops,
> =C2=A0};
> =C2=A0
> =C2=A0static const struct rkvdec_variant rk3328_rkvdec_variant =3D {
> =C2=A0	.num_regs =3D 109,
> =C2=A0	.coded_fmts =3D rkvdec_coded_fmts,
> =C2=A0	.num_coded_fmts =3D ARRAY_SIZE(rkvdec_coded_fmts),
> +	.ops =3D &rk3399_variant_ops,
> =C2=A0	.quirks =3D RKVDEC_QUIRK_DISABLE_QOS,
> =C2=A0};
> =C2=A0
> @@ -1278,6 +1292,7 @@ static const struct rkvdec_variant rk3399_rkvdec_va=
riant
> =3D {
> =C2=A0	.num_regs =3D 78,
> =C2=A0	.coded_fmts =3D rkvdec_coded_fmts,
> =C2=A0	.num_coded_fmts =3D ARRAY_SIZE(rkvdec_coded_fmts),
> +	.ops =3D &rk3399_variant_ops,
> =C2=A0};
> =C2=A0
> =C2=A0static const struct of_device_id of_rkvdec_match[] =3D {
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> index 751f39afe7e2..faabedd2b9d8 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> @@ -67,12 +67,17 @@ vb2_to_rkvdec_decoded_buf(struct vb2_buffer *buf)
> =C2=A0			=C2=A0=C2=A0=C2=A0 base.vb.vb2_buf);
> =C2=A0}
> =C2=A0
> +struct rkvdec_variant_ops {
> +	irqreturn_t (*irq_handler)(struct rkvdec_ctx *ctx);
> +};
> +
> =C2=A0struct rkvdec_variant {
> =C2=A0	unsigned int num_regs;
> =C2=A0	const struct rkvdec_coded_fmt_desc *coded_fmts;
> =C2=A0	size_t num_coded_fmts;
> =C2=A0	const struct rcb_size_info *rcb_sizes;
> =C2=A0	size_t num_rcb_sizes;
> +	const struct rkvdec_variant_ops *ops;
> =C2=A0	unsigned int quirks;
> =C2=A0};
> =C2=A0

--=-D6Niumx4QoSluEWIbZt1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaW1aPQAKCRDZQZRRKWBy
9D0GAPkBVhTizNxdmAGR1kM/MYiJ1yQBZh2PYoA/zlR6Nu2JywEA9QX8UD8rv0eT
zt1tQouvBaO0eWjcn2CBMIU2MOavegk=
=Cic7
-----END PGP SIGNATURE-----

--=-D6Niumx4QoSluEWIbZt1--

