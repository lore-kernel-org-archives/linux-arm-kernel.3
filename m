Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02055C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 22:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eeufVGWlSSt6tLNoQyTzfZEktIwLNaQSU1LrCVYbd2M=; b=Eq0+8mnWnj7MofLCRKk6qk/BEZ
	Fa+ZXctwF2yQL1jMPh8WfdAIAlU1T7ujtfn8UoR1zROwaXxPh5pirWqVAXdt8IsmRczWl0DdL3u4z
	Q/QO6VBhMLthFebeUlDdF6bIEJfPGgKTyYUAOhIfPtqyR7owVekQ4EsoQxPap6WcgcagP5xAE4QrR
	xj84rUoPukdBi6Tso3uXA5t2ULmwz26u/cAtZdru19Syt95mQJ82whSh2ECoaZoP+9rkbXG7oOjRu
	iUbyi3whHkLWe1XpzPoX4ZokVUHlXA3cGe79Zz9lSRmDoXnCQgDamTJdJYXtkA7vk9xnK0pAbEQYm
	HBePoeNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk82Y-0000000G1Rq-41Wt;
	Wed, 15 Jul 2026 22:25:19 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk82V-0000000G1R2-3LXj;
	Wed, 15 Jul 2026 22:25:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784154309;
	bh=0KoUoh9NEy9NsPiK7s1BVgTjkAxQ16jz3k4PiORO6Oo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=XfgJAIF6AG64UFq9/qxt08Z7qWpwrJzNQAdyZmWQ7GPCX0tVsyXj9T852XAJ0uN4z
	 RvrUCyh/1RQnrSD8CjkIMXWvSH+N2v5G/73DgGsaoxV8g3Q3d73dsuI6W6yuqI/oHD
	 12ux10hUvANrTx99dX120tvZOJOgNPvajc+nXxyHFQXrbJqPyhskWWjFiI4D+UChFM
	 Utf66gX1fSWUXHIZaNQKjyEGuvhuG27t3pSY94tYFTXQb0R/PfwtfcENM6pyzyGTBF
	 OIXFZqRqya0nrrMvJcuZrvZp59F2BpTEUvHXFgMZdK2vQ2PAifKJwJQZvr6iU3s3Ue
	 jLQ3iDNlvHNTA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7456917E010F;
	Thu, 16 Jul 2026 00:25:08 +0200 (CEST)
Message-ID: <b6c3dde02a0304e77545b7a5777750e8bbe4ff7f.camel@collabora.com>
Subject: Re: [PATCH v2 1/3] media: rkvdec: hevc: tighten EXT SPS RPS control
 dimensions
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Michael Bommarito <michael.bommarito@gmail.com>, Detlev Casanova	
 <detlev.casanova@collabora.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>,  Mauro Carvalho Chehab	
 <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Date: Wed, 15 Jul 2026 18:25:06 -0400
In-Reply-To: <20260527194737.1999409-2-michael.bommarito@gmail.com>
References: <20260513181922.2075438-1-michael.bommarito@gmail.com>
	 <20260527194737.1999409-1-michael.bommarito@gmail.com>
	 <20260527194737.1999409-2-michael.bommarito@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-ny5mJslQQjxRcG9W1xHo"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_152516_224295_C5429B8F 
X-CRM114-Status: GOOD (  15.80  )
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


--=-ny5mJslQQjxRcG9W1xHo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 27 mai 2026 =C3=A0 15:47 -0400, Michael Bommarito a =C3=A9crit=
=C2=A0:
> The VDPU381 HEVC driver registers V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS
> and V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS with .cfg.dims =3D { 65 }, but
> the HEVC spec caps num_short_term_ref_pic_sets at 64 (ITU-T H.265 7.4.8)
> and num_long_term_ref_pics_sps at 32 (7.4.3.2.1). The hardware descriptor
> table (struct rkvdec_rps) sizes match those spec limits: refs[32] and
> short_term_ref_sets[64].
>=20
> Reduce the dims to { 64 } and { 32 } respectively so the V4L2 control
> framework rejects oversized payloads before any driver code runs.
>=20
> Fixes: c9a59dc2acc7 ("media: rkvdec: Add HEVC support for the VDPU381
> variant")
> Cc: stable@vger.kernel.org
> Suggested-by: Detlev Casanova <detlev.casanova@collabora.com>
> Assisted-by: Claude:claude-opus-4-7
> Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> index 1d1e9bfef8e96..4fd06f4c04db0 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -278,12 +278,12 @@ static const struct rkvdec_ctrl_desc
> vdpu38x_hevc_ctrl_descs[] =3D {
> =C2=A0	{
> =C2=A0		.cfg.id =3D V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS,
> =C2=A0		.cfg.ops =3D &rkvdec_ctrl_ops,
> -		.cfg.dims =3D { 65 },
> +		.cfg.dims =3D { 64 },
> =C2=A0	},
> =C2=A0	{
> =C2=A0		.cfg.id =3D V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS,
> =C2=A0		.cfg.ops =3D &rkvdec_ctrl_ops,
> -		.cfg.dims =3D { 65 },
> +		.cfg.dims =3D { 32 },
> =C2=A0	},
> =C2=A0};
> =C2=A0

--=-ny5mJslQQjxRcG9W1xHo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalgIwgAKCRDZQZRRKWBy
9HxEAP9wfCCEd20ut44QQMcy3HEL1pcFySIAWFzjiQm3lQ+xMwEAzhK3KvVUgYEe
VxlKnrmbdIelPZZb9AqPGybtVc6h3wI=
=rJ5m
-----END PGP SIGNATURE-----

--=-ny5mJslQQjxRcG9W1xHo--

