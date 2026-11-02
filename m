Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1D6606D83C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 19:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JurTYVtt;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=QiJwjxGK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7OJaoJHgx2GzzDd0wBdvqi7D9JZvRZGfZ3cOJLVNOIg=; b=JurTYVttoF+8umMOhllAwj4szV
	icE+ZNKfUw62FZ8aFzV2Fc5SVT5pU8oChc3uWZ4kHVkpOk6oNEyx2bpdXA8a8l/rOJkZ+m0kSvfTW
	IITAlPblmLqv26AdnRE670s62zZ/s1zwLbR0cNTllyVTbdDW3DrUZIwDD0N6kaTcmMJy+zlO9JP8L
	zUDenY236u89EtU56d9IxCECV77ikxwO2nlxqQH+PibBvsB/QWx7nyTTlFNIgmnwC8qzmpxyOeY3Y
	KyKdFsFEJH7QK4vB2EeKf4lIZ9RsR0kw4BKnhYp2lnFdZ9i9+6otYgorRyemvtYR7vwSFmlCVtZCm
	ZizioK3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxKq-000000003U9-0Omf;
	Mon, 02 Nov 2026 19:04:48 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxKn-000000003Tl-3gYQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 19:04:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793646284;
	bh=C+N3AeR5hg2ytjeyH4W6gOYQhyf8r2d4UKcvMhRy1z4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=QiJwjxGKiuzRahVoyMzU5SyIhQaK8mgHGJu3C1WdCwm9GTmEjx6So+w7wBCRKBN+9
	 lZ5oarghRG3A9D9I/0VZtBk+W6xJTh0ComdhBFcFHOdsNGwJ9vx71mGgeZH5WFTKO1
	 wFqUbjdOxvi9IUt1VBqlYwT5jK1s6oAe+SU9A/cnB1tXr2TxRM+yv7gUOUINaLHMkK
	 vneYBGKrGY0GntHBndGRK4xGcOkW4YeM7yO8s38sSNGrwMVlRdBVVc/57+kBhcSP4m
	 Rj8w9ZbHE0hD6UYGhWS/DsEj1KYDuP2h+0wMHeASXsAMYUHhvZr/J8ZBpW8Nb4Jl5S
	 g6r8muUOb6FbQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 75A9E17E07EF;
	Mon, 02 Nov 2026 20:04:42 +0100 (CET)
Message-ID: <3aea33aba09e7696137df25d621b9f1f61263405.camel@collabora.com>
Subject: Re: [PATCH 07/10] staging: media: cedrus: validate VP8 frame size
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski
 <paulk@sys-base.io>,  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Mon, 02 Nov 2026 14:04:41 -0500
In-Reply-To: <20261102170303.1973892-8-jernej.skrabec@gmail.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
	 <20261102170303.1973892-8-jernej.skrabec@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-kzIlL7zZnNiNzYsIj0Ze"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_110446_067278_DADBE6DD 
X-CRM114-Status: GOOD (  18.78  )
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


--=-kzIlL7zZnNiNzYsIj0Ze
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 02 novembre 2026 =C3=A0 18:03 +0100, Jernej Skrabec a =C3=A9crit=
=C2=A0:
> A VP8 key frame can change the frame size. If userspace doesn't
> reallocate the capture buffers, the hardware writes and reads past the
> buffers, which shows up as IOMMU page faults and decode timeouts.
>=20
> Check the frame size in try_ctrl, like for the H.264 and HEVC SPS.
>=20
> Fixes: 3c39a16d30d8 ("media: cedrus: Add support for VP8 decoding")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.c
> index 45deebddb630..756243795de8 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -77,6 +77,11 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
>  					  (sps->pic_width_in_mbs_minus1 + 1) * 16,
>  					  height))
>  			return -EINVAL;
> +	} else if (ctrl->id =3D=3D V4L2_CID_STATELESS_VP8_FRAME) {
> +		const struct v4l2_ctrl_vp8_frame *frame =3D ctrl->p_new.p_vp8_frame;
> +
> +		if (cedrus_check_pic_size(ctx, frame->width, frame->height))
> +			return -EINVAL;

This is affected by my previous comment, let's discuss over the other repor=
t
first.

Nicolas

>  	} else if (ctrl->id =3D=3D V4L2_CID_STATELESS_HEVC_SPS) {
>  		const struct v4l2_ctrl_hevc_sps *sps =3D ctrl->p_new.p_hevc_sps;
>  		unsigned int bit_depth, max_depth;
> @@ -270,6 +275,7 @@ static const struct cedrus_control cedrus_controls[] =
=3D {
>  	{
>  		.cfg =3D {
>  			.id	=3D V4L2_CID_STATELESS_VP8_FRAME,
> +			.ops	=3D &cedrus_ctrl_ops,
>  		},
>  		.capabilities	=3D CEDRUS_CAPABILITY_VP8_DEC,
>  	},

--=-kzIlL7zZnNiNzYsIj0Ze
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaujeyQAKCRDZQZRRKWBy
9IqGAPoC6fM1L/1ZfNyQBC83a/SNL7rGLwLzEEGJT9Zo48jjkgEA8jwnSm2jXDOH
YkBEh/HriQ/7ez5trmMvNeCBdwMaKwE=
=hacm
-----END PGP SIGNATURE-----

--=-kzIlL7zZnNiNzYsIj0Ze--

