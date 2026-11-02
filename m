Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F93606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 18:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zk+qKIbc;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=BQyDa+Qt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Em7LgszDC3yV2ax9pGbeyhWHik0oIvE0LFFvVjdiovc=; b=zk+qKIbcuBxlgmv4Wbk0Ztyr/w
	M6hIdZR/AVfDFa9Gc4rg5B00khoT4Kh5RZAHLFyid6dnHFtESVH7xDLuHJKicdaZmn+n2XsbUA7bq
	UwrEM8bDdlSP1VekrPhkLWaTuqMNMwUZR3GlF2wI0wEfMByrH6EXGuHsuuVtDBW1vO+SMgk9YCiun
	IiXj1iPeVlyF0vfCl0rf0hbDvn1Fzxq4dRaNweX5CeOYb+3/G2yCjP5vbtOAQE8RBMzOeteNf0FUV
	rFc9rxuEcp2sOD+sSC6DDuvYjqB9blovvlDcqJ780UdH/cdo6ZM19FYurSfDCp3wAlRdm0q3yUjHy
	IDIishuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxDH-000000002Pt-1wFQ;
	Mon, 02 Nov 2026 18:56:59 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxDF-000000002OY-0AU6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 18:56:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793645815;
	bh=fOLpOB2LsNGYFnbSGDntDvT7olJ/DoIyk1p1zTIGGg4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=BQyDa+QtEF/80OwP/TH+CIWiZ+c9fDqQ4cNvyl03AhCjS4ptcy81Q0y/fQiCY8QiB
	 plyP4LTlwcILzEXf+9jijXl1qYlprb6cPDDX6WY/mDaASVNkVxdTlofccdqA1aMC91
	 KAjiiJ6CRyfPDKRssS/i/c4wf341SFNsBryfEti9CUuXwIsqBzIgEyKzg29/DGVl3F
	 LcLpxYWK1Nl2FS+nhQPIIK+L8UZxumV0kZvnudDqKTXVAYl7D+1bCZ/LIfzJlFEPxM
	 YLBZtoQNBIfbDbRGCrd1jgCpRq47kSZrDIKJbSveNLz6xzDLwOslbxTxhsSTPnucex
	 ySWR8mk8GhWTg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3F78E17E07F6;
	Mon, 02 Nov 2026 19:56:53 +0100 (CET)
Message-ID: <cd5780876274ab5aa73739f890a32ceacf2e793b.camel@collabora.com>
Subject: Re: [PATCH 04/10] staging: media: cedrus: mpeg2: use the field
 height for field pictures
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski
 <paulk@sys-base.io>,  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Mon, 02 Nov 2026 13:56:52 -0500
In-Reply-To: <20261102170303.1973892-5-jernej.skrabec@gmail.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
	 <20261102170303.1973892-5-jernej.skrabec@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-P2HLuzwLLDfm1tPGi+tN"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_105657_240489_DF6E02B8 
X-CRM114-Status: GOOD (  21.28  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--=-P2HLuzwLLDfm1tPGi+tN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 02 novembre 2026 =C3=A0 18:02 +0100, Jernej Skrabec a =C3=A9crit=
=C2=A0:
> A field picture covers only half of the macroblock rows of a frame, but
> the driver programs the coded and the boundary size of the whole frame
> for it, as for a frame picture.
>=20
> Program the height of a field for field pictures, like the vendor
> library does.
>=20
> Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/=
staging/media/sunxi/cedrus/cedrus_mpeg2.c
> index 10e98f08aafc..ca66a3c6b830 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
> @@ -58,6 +58,7 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, s=
truct cedrus_run *run)
>  	struct vb2_queue *vq;
>  	const u8 *matrix;
>  	unsigned int i;
> +	bool field;
>  	u32 reg;
> =20
>  	seq =3D run->mpeg2.sequence;
> @@ -108,13 +109,21 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ct=
x, struct cedrus_run *run)
> =20
>  	/* Set frame dimensions. */
> =20
> +	/*
> +	 * Field pictures cover half of the frame's macroblock rows; the
> +	 * vendor library halves both the coded and the boundary height.
> +	 */
> +	field =3D pic->picture_structure !=3D V4L2_MPEG2_PIC_FRAME;
> +
>  	reg =3D VE_DEC_MPEG_PICCODEDSIZE_WIDTH(seq->horizontal_size);
> -	reg |=3D VE_DEC_MPEG_PICCODEDSIZE_HEIGHT(seq->vertical_size);
> +	reg |=3D VE_DEC_MPEG_PICCODEDSIZE_HEIGHT(field ?
> +			ALIGN(seq->vertical_size, 32) / 2 : seq->vertical_size);
> =20
>  	cedrus_write(dev, VE_DEC_MPEG_PICCODEDSIZE, reg);
> =20
>  	reg =3D VE_DEC_MPEG_PICBOUNDSIZE_WIDTH(ctx->src_fmt.width);
> -	reg |=3D VE_DEC_MPEG_PICBOUNDSIZE_HEIGHT(ctx->src_fmt.height);
> +	reg |=3D VE_DEC_MPEG_PICBOUNDSIZE_HEIGHT(field ? ctx->src_fmt.height / =
2 :
> +						   ctx->src_fmt.height);

I'm not entirely sure, but I see:

	fsize->stepwise.step_height =3D 1;

But I don't think interlaced video can have odd height in the first place. =
But
it also have an implication here as you are not rounding up to a multiple o=
f 2.
Not sure what is the proper fix, but I have this impression something is
missing.

Nicolas

> =20
>  	cedrus_write(dev, VE_DEC_MPEG_PICBOUNDSIZE, reg);
> =20

--=-P2HLuzwLLDfm1tPGi+tN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaujc9AAKCRDZQZRRKWBy
9FCtAP9jsMoceNEcZBP9smOFURh22hfFhq9F7bGhoIiXygecnwD/TZd0tE9tcnxF
yNRD1b/TdxpJUTqjYdMx/wp68lb2mAs=
=X4Qg
-----END PGP SIGNATURE-----

--=-P2HLuzwLLDfm1tPGi+tN--

