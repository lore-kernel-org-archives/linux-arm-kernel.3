Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B6BC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 01:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xIEX4i18qoVXbjqoK0UngJpGYgpYOqx2AEwOVZpDdYM=; b=0i6ct7WCxMRZCxH88lVwDOJN2E
	Ht3hNnJ20912Wwyz8hl+ndvDuvqFZtxRYjDVNGLgSsSur8fQEK85R5XyUNG8Gz2ZYDR2Q4wxmDIIN
	0XKwzEV1PSlvC1T1XC5vV5WOPPXXo8nicT2X4BX4vC20WVrTFXTN79jCA2e0Bf9iSCyUw9odqCpSJ
	q9QJ8+NZ7UuAwKG6PYZBsCEYqkcQA4uHaw1HTxCK2JuGT9iBpMh/QVD4MDizSfD8BxzjA5KQV2Rjs
	sv0kgAA8Xzst4q/BvUBNKmEp0wGtPwkUljDwN5Elh6W6et4sZchCO+Alc0pA6wbXvDjEeOYb/ro61
	DrcenuUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkAnV-0000000GBbD-13D8;
	Thu, 16 Jul 2026 01:21:57 +0000
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkAnP-0000000GBaK-27eC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 01:21:56 +0000
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-5bf5370d38fso2499178e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 18:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1784164910; x=1784769710; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xIEX4i18qoVXbjqoK0UngJpGYgpYOqx2AEwOVZpDdYM=;
        b=G1ab0OWIzKCDSB6xl4E+s4pjNOwtv8lYqwXMZyIewESibmyHBV7NcNvh8HFNKYxivl
         nfV1qplRDUWBthhSmb/kst2NRRkJxzDbpnLZ9yJy9nto7V/wuWm3+idzQaW7Ss0Aqx0n
         YfNQsGjVy28n05CWkJMzrB9zlPtuF62wmUF92SsVemBtoNuvdJ5QAL66CfN0HZqUuhzj
         SfiLCredKGiRfY/Oli6OqNMw1A8CXUxtacoIslgAqM30OR31VjvwZ5te50/atIH7orjt
         rMTP9mp/jRvnyYkKSvhtIrcgT3u3Vq3Bq1ap7tAZX768z4Wv3TJ4ONNeeC8HPIqb5E2j
         LhGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784164910; x=1784769710;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xIEX4i18qoVXbjqoK0UngJpGYgpYOqx2AEwOVZpDdYM=;
        b=J6VXB/VAb/OwudbvMSjPbzNph43qhN5/GFXLQWO+fGENMOaBKf1NdXYSzKn2XRNCbP
         XYar6zGGrb5Hgon2qXNlgjj35D4TtUF4qrsV3fRe91Jmg3G+T86Pr5VpqQsbnYKc0fVj
         zOEUEsAKo76hIU8tidTKABItLGb36RI34RXnnge1o6XikNO/wPOGZF3Xsu2tjowwAiEl
         Ge4ZM5TT3uqz1KTc/d9w/G3PiCVpz3TasH7W6r8TZHZRXsQsKVrdM9AARAVp1uwDMGn+
         9SbMWAlhpDZqI9q9nlew+pj8cKIxNHAEyFMFWdIJWtTPyLi3IvI4CbkpXabFngAHbhWu
         hlkg==
X-Forwarded-Encrypted: i=1; AHgh+RoS+vyy2JwBZNU4xxW5iO7VvDOUt0CM1drcOpXOzhjNPH/QTtVlSWK9uWDl2Swawp7weNO8VjKIjLO1gOpV0ndr@lists.infradead.org
X-Gm-Message-State: AOJu0YyrTx7z8A62utyoNn/npaRDaHdJ73k97i0lEfDpRCu/6FgPLdQe
	VcYDghQG9LSzPqNI6WIFO8wYRtWNxoo14avz2yU0TY9ApDKXzRpc1kkotqPI8OVENHyhHtHP9pq
	Gd96EzqQZ3Q==
X-Gm-Gg: AfdE7clpqNilMXmH9dIvqUBgHu7fEpSjvcXPyPAaEb5P1Y1NJ8b3l2SMr8tzqkJI0zu
	GALiNPji1ZwZ0T11k+p0m5sgnNmKlu1SwoEvnxxsTcs7pJ4ldlTkh3suo7bL7rQ345qzKcfe8ds
	tFRWXtfJ2NXoaxQ3L9j5VevuHLV0qLxHcDwqyN8z5U05/lyzkdzsFA8NgOgyZZvHBBdRWlyiXNP
	x5dR3oCIBQmRgoX2I8VsXclV2YI3Ecic6RAecRzuZrAIqRcpmU7PXdrHPQlOv5H3l5SHiyNlBbz
	x93qaJ07DVx5BUG2R0G6tihnm1J7XZOuc1T6txD1uqYb2EM/1QmHMN7THWbjcYYlfIRzhxsHtzQ
	ya3QmLu+6LkZzTB+pITK6I3LqNbQ6/n1qWOQ6IkYMh8DXoqUjrBlKIXwgAKeyLWc9zso3R7wxpc
	0jcivDeVU=
X-Received: by 2002:a05:6122:6d09:b0:5c1:2150:9de7 with SMTP id 71dfb90a1353d-5c121509e19mr2977113e0c.12.1784164909903;
        Wed, 15 Jul 2026 18:21:49 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::5ac? ([2606:6d00:15:e06b::5ac])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96ed663ded3sm12075936241.12.2026.07.15.18.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 18:21:49 -0700 (PDT)
Message-ID: <cf1251490bf5c07649ce5ef3a14ec3d8c4314639.camel@ndufresne.ca>
Subject: Re: [PATCH] media: meson: vdec: fix NULL pointer deref in
 vdec_try_fmt_common
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Christian Hewitt <christianshewitt@gmail.com>, Neil Armstrong	
 <neil.armstrong@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl	
 <martin.blumenstingl@googlemail.com>, linux-media@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 15 Jul 2026 21:21:47 -0400
In-Reply-To: <20260624065809.2460720-1-christianshewitt@gmail.com>
References: <20260624065809.2460720-1-christianshewitt@gmail.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
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
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-KCwQdVf4kwVZHhK4QLVf"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_182151_564482_0FE0C0B1 
X-CRM114-Status: GOOD (  19.85  )
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


--=-KCwQdVf4kwVZHhK4QLVf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 24 juin 2026 =C3=A0 06:58 +0000, Christian Hewitt a =C3=A9crit=
=C2=A0:
> When VIDIOC_TRY_FMT is called with an unsupported pixel format on the
> OUTPUT queue, vdec_try_fmt_common() falls back to V4L2_PIX_FMT_MPEG2.
> However, if a distro has locally patched MPEG2 support out (as it has
> been broken for some time) the platform format table does not contain
> MPEG2 so find_format() returns NULL and the subsequent dereference of
> fmt_out->max_width triggers a NULL pointer dereference.
>=20
> Fix this by falling back to the first format in the platform's format
> array instead of hardcoding V4L2_PIX_FMT_MPEG2. This is always valid
> since every platform defines at least one format.
>=20
> Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

>=20
> ---
> This fixes use of v4l2-ctl and v4l2-compliance tools when MPEG2 support
> has been disabled via vdec_platform.c - NB: although this is a fix it's
> also a rather niche scenario so there's no need to backport it to older
> stable kernels.
>=20
> =C2=A0drivers/staging/media/meson/vdec/vdec.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/staging/media/meson/vdec/vdec.c
> b/drivers/staging/media/meson/vdec/vdec.c
> index 4b77ec1af5a7..f3e7072f221a 100644
> --- a/drivers/staging/media/meson/vdec/vdec.c
> +++ b/drivers/staging/media/meson/vdec/vdec.c
> @@ -504,8 +504,8 @@ vdec_try_fmt_common(struct amvdec_session *sess, u32 =
size,
> =C2=A0	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> =C2=A0		fmt_out =3D find_format(fmts, size, pixmp->pixelformat);
> =C2=A0		if (!fmt_out) {
> -			pixmp->pixelformat =3D V4L2_PIX_FMT_MPEG2;
> -			fmt_out =3D find_format(fmts, size, pixmp-
> >pixelformat);
> +			pixmp->pixelformat =3D fmts[0].pixfmt;
> +			fmt_out =3D &fmts[0];
> =C2=A0		}
> =C2=A0		break;
> =C2=A0	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:

--=-KCwQdVf4kwVZHhK4QLVf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalgyKwAKCRDZQZRRKWBy
9OvqAQDPEXcCfysbjMcLVok8WR5NVGdePin12f6DHmQ4YTlBWQEAsFlwChimwCuO
DdCcPjAuGpLhXWPu0UTxtMyQfsa74Q0=
=Wvj1
-----END PGP SIGNATURE-----

--=-KCwQdVf4kwVZHhK4QLVf--

