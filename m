Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9176D3E77A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 20:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=khgCxD8OyrNcPDohWVBNpCB3dXa5ylU3tgo7nHtpZ2o=; b=VTlQ+8izTM74skCRDdQMZR4+0Q
	u3BmguwfHXzjQySpU+O2O9PJQ9u2YCt74T+riKMuwKB1z0ey8yrZIPEPE7YCrHoo5Nl6zv4h+brCK
	ANAcJQO7lwLdYQEhZ41WE0c0LhPoNq7mewkcAqxL9j5AGEPmZIQ5cxtxJEmexBZ26zORLcfCqjqBC
	h266lnuc/yGL+gVohdXOa/z1/u6c3bj8iLdgv1TZp3LAAtRCqCxsvxY8CrxsJ9Tsdow9PM3my7LlW
	YGIezhUZ2WxTeAignn3kjwpIYaVZ46nrl5JzfcC4OEzv3Lkovu5+SI8DD/jp6JdbGfPLMJRUwyQkX
	9JMHIHMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTQuF-0000000FqlN-2EJY;
	Wed, 10 Dec 2025 20:35:27 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTQuC-0000000Fqkt-2R2f;
	Wed, 10 Dec 2025 20:35:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765398922;
	bh=5+vrNwl93Id1PXIw96xyGGMRLHpDWV+CK4wM+7xVGX4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=EjPicjF3iCUtuciZMpSN5Mxya31F0ctqetMe+YrPhdQ43DmJi+ivkJS+SnzrCRyY9
	 mnRCP/8y6mBsq5XQVgK1dGokXlDL5tu0lUehc59i4qblXZqaiw/a5U/Y4B5zs+FriQ
	 8NU78Bgbwq/Rr0pFM18ewTt8UyR+jIwAWbAW9q80gYtOV/zILSFfkZJ4bATtzxYLLT
	 QZvru2wnV/ujppTQgtcfOY1nFMbl/EvIRTwI0KAmCq3JvOW1/yFofFSW65ru+GrwAa
	 kySRFmW7Rn1OyEqDCIHIEtMCasRlomhFVPh8luUXQ70xJd+UU/5VyOfcFg0nLqm7qC
	 vs9Qo6g3/J4uw==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2C53917E12FE;
	Wed, 10 Dec 2025 21:35:20 +0100 (CET)
Message-ID: <4c66b55f96577cd615d114cb1b7482f5fc6a991a.camel@collabora.com>
Subject: Re: [PATCH v4 10/15] media: rkvdec: Support per-variant interrupt
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
 kernel@collabora.com, Diederik de Haas	 <didi.debian@cknow.org>
Date: Wed, 10 Dec 2025 15:35:19 -0500
In-Reply-To: <20251022174508.284929-11-detlev.casanova@collabora.com>
References: <20251022174508.284929-1-detlev.casanova@collabora.com>
	 <20251022174508.284929-11-detlev.casanova@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-Ny7raT137ieRFwbGvR1e"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_123524_782193_4C5B63FD 
X-CRM114-Status: GOOD (  16.74  )
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


--=-Ny7raT137ieRFwbGvR1e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 22 octobre 2025 =C3=A0 13:45 -0400, Detlev Casanova a =C3=A9cri=
t=C2=A0:
> Preparation commit for supporting different variants with different
> interrupt management.
>=20
> Tested-by: Diederik de Haas <didi.debian@cknow.org>=C2=A0 # Rock 5B
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
> =C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec.c | 15 ++++++++++++--=
-
> =C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec.h |=C2=A0 1 +
> =C2=A02 files changed, 13 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.c
> index 5dd486edd64d..b0e90c9b826e 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -1218,10 +1218,9 @@ static void rkvdec_iommu_restore(struct rkvdec_dev=
 *rkvdec)
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
> @@ -1242,6 +1241,15 @@ static irqreturn_t rkvdec_irq_handler(int irq, voi=
d *priv)
> =C2=A0	return IRQ_HANDLED;
> =C2=A0}
> =C2=A0
> +static irqreturn_t rkvdec_irq_handler(int irq, void *priv)
> +{
> +	struct rkvdec_dev *rkvdec =3D priv;
> +	struct rkvdec_ctx *ctx =3D v4l2_m2m_get_curr_priv(rkvdec->m2m_dev);
> +	const struct rkvdec_config *cfg =3D rkvdec->variant->config;
> +
> +	return cfg->irq_handler(ctx);
> +}
> +
> =C2=A0static void rkvdec_watchdog_func(struct work_struct *work)
> =C2=A0{
> =C2=A0	struct rkvdec_dev *rkvdec;
> @@ -1260,6 +1268,7 @@ static void rkvdec_watchdog_func(struct work_struct=
 *work)
> =C2=A0static const struct rkvdec_config config_rkvdec =3D {
> =C2=A0	.coded_fmts =3D rkvdec_coded_fmts,
> =C2=A0	.coded_fmts_num =3D ARRAY_SIZE(rkvdec_coded_fmts),
> +	.irq_handler =3D rk3399_irq_handler,
> =C2=A0};
> =C2=A0
> =C2=A0static const struct rkvdec_variant rk3288_rkvdec_variant =3D {
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.h
> index 74f71542e031..dfafb2c2cbc1 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> @@ -121,6 +121,7 @@ struct rkvdec_config {
> =C2=A0	size_t coded_fmts_num;
> =C2=A0	const struct rcb_size_info *rcb_size_info;
> =C2=A0	size_t rcb_num;
> +	irqreturn_t (*irq_handler)(struct rkvdec_ctx *ctx);

Its a tiny little odd to mix function pointers and configuration. I don't h=
ave a
great proposal, is that going to be the only function pointer ? perhaps cg-=
>ops
? I'm not sure. Its just a small annoyance, I'll leave to you.

Nicolas

> =C2=A0};
> =C2=A0
> =C2=A0struct rkvdec_dev {

--=-Ny7raT137ieRFwbGvR1e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTnZhwAKCRDZQZRRKWBy
9E+TAP9vPu64XdAbrUUglQBq9Zdsz4UdT7SgeSBvND6Al4EaJAEA7SiFSCEoKzPk
W5MLqn8zueRe9lhG/LQ6sGolfYirQwY=
=1uI4
-----END PGP SIGNATURE-----

--=-Ny7raT137ieRFwbGvR1e--

