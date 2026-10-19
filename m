Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9A2606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 18:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MtOFg/Nt;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=m2TZ2Ye7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JlVIuNAvJb8BGxks+PwmXWerlM3I1JQR3FPq2M7uegA=; b=MtOFg/Nt1XD1OCqmA30BrZzDEr
	mvjNE+UvrTIfbVYExHtILh0ihw+0XwCC1uGNPTesB3BrF+Og5m2+4WHAgWRjXX2aJRZSkkvfif6Vj
	604NU5WweAC6PA5pCIw6crUUDSbwhdN32th+vL3WiZxlqPmgs6Xo+VIrGUTJOYc/MOgjAuvcWBNMq
	CNf2/kyil1D95yTIOoqSQoh3+peewN0ZjfcOvW2p7tXR1R65cwKD3NEjkphIbdsyO8AoJFb9Gj9iP
	ttQh65fmKe1ra/gezArLnN8KUr3OspwRnTUNiCPd8hsVLLbWENoOoRNIOuYgnqivEekTUrovyIhq+
	Gbbz8Hfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIsNq-00000008BZb-3DKp;
	Mon, 19 Oct 2026 18:46:54 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIsNn-00000008BYf-3jLN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 18:46:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792435608;
	bh=CvGsFWoLph0v+hKiQvOUscsSmU0yUXST+5yRJ1mIOi0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=m2TZ2Ye7AiHEN44px2Vuf6F6ZnMo1fQQD5US1cC8KUGTyrqAsLXAPwLbrhwsyIn2c
	 7jHe+rYm8fut1HwLETzeD8fqOD+2Dn+wA9TqAhNV2Htlzq/OLYLZPu98/ykj1mcBJ1
	 3QmKQ+0VzZs0EhiqPL7wZR30qtwbkrV5Jiy2y/0GbXwlgvtohF2hMYEACkf7IQgeop
	 ypcOC5lwrc8+I5Uj6+NTeWHxDYNW27wTXZu2CEFZ4G9DeIlrIwD3Ex4WNCh9+AsD7G
	 wRi1VY1mdYqtzdPgVXOV7MiMAhZkaF7oRJunkxduileB181wC94/OOe/vHstJvbRol
	 av620AHk0u+Hg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 06A5017E006F;
	Mon, 19 Oct 2026 20:46:46 +0200 (CEST)
Message-ID: <6242e4c3ecdc7e55a0e32a6cd73b776a0e86f4bd.camel@collabora.com>
Subject: Re: [PATCH] media: chips-media: wave5: Account for sizeimage 0 case
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Brandon Brnich <b-brnich@ti.com>, nas.chung@chipsnmedia.com, 
	jackson.lee@chipsnmedia.com, mchehab@kernel.org, hverkuil@kernel.org, 
	heiko@sntech.de, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 	linux-arm-kernel@lists.infradead.org
Cc: devarsht@ti.com, stable@vger.kernel.org
Date: Mon, 19 Oct 2026 14:46:45 -0400
In-Reply-To: <20261019160003.2375198-1-b-brnich@ti.com>
References: <20261019160003.2375198-1-b-brnich@ti.com>
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
	protocol="application/pgp-signature"; boundary="=-fR05QOiHm7Ab/PiRZ46L"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_114652_088077_78F294F5 
X-CRM114-Status: GOOD (  24.19  )
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
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--=-fR05QOiHm7Ab/PiRZ46L
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 19 octobre 2026 =C3=A0 11:00 -0500, Brandon Brnich a =C3=A9crit=C2=
=A0:
> V4L2 uAPI states that sizeimage can be set to 0 in struct
> v4l2_pix_format_mplane if client wants the driver to configure a proper
> sizeimage. If client leaves this field unset and configures an encode wit=
h
> high bitrate, low QP, or any other parameters resulting in high quality
> encode, then the driver-calculated bitstream buffer size (MIN_BS_SIZE) wi=
ll
> be too small resulting in undetermined behavior.
>=20
> Cc: stable@vger.kernel.org
> Fixes: 88ff31fd0181 ("media: chips-media: wave5: Use helpers to calculate=
 bytesperline and sizeimage.")
> Signed-off-by: Brandon Brnich <b-brnich@ti.com>
> ---
>=20
> Current DEFAULT_BS_SIZE is just a placeholder value - I can lower if
> required so memory consumption doesn't go up drastically if sizeimage is
> set 0 by user. I saw this was the common equation in rockchip and hantro
> driver.
>=20
> Link to uAPI requirement: https://docs.kernel.org/userspace-api/media/v4l=
/pixfmt-v4l2-mplane.html
>=20
>  .../media/platform/chips-media/wave5/wave5-helper.c  | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.c b/dr=
ivers/media/platform/chips-media/wave5/wave5-helper.c
> index c3d34be833ff0..384a0a9aac3ae 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-helper.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-helper.c
> @@ -7,7 +7,10 @@
> =20
>  #include "wave5-helper.h"
> =20
> -#define DEFAULT_BS_SIZE(width, height) ((width) * (height) / 8 * 3)
> +/* Smallest bitstream buffer accepted when the client provides a sizeima=
ge */
> +#define MIN_BS_SIZE(width, height) ((width) * (height) * 3 / 8)

Does that change put us at risk of integer overflow ? I just don't remember=
 the
max width/height, but please do that math to be sure.

> +/* Worst case: Allocate bitstream buffer size based on resolution and ma=
x depth */
> +#define DEFAULT_BS_SIZE(width, height) ((width) * (height) * 2)

Should be adjust based on the sub-sampling and depth? We could use 12 and 1=
5 bit
for YUV420, and then 16 (what you do now) and 20 for YUV422. Though, as far=
 I
remember, 10bit has not been included as the TI hardware it was tested on d=
idn't
have it.

> =20
>  const char *state_to_str(enum vpu_instance_state state)
>  {
> @@ -261,8 +264,11 @@ void wave5_update_pix_fmt(struct v4l2_pix_format_mpl=
ane *pix_mp,
>  		pix_mp->height =3D height;
>  		pix_mp->num_planes =3D 1;
>  		pix_mp->plane_fmt[0].bytesperline =3D 0;
> -		pix_mp->plane_fmt[0].sizeimage =3D max(DEFAULT_BS_SIZE(width, height),
> -						     pix_mp->plane_fmt[0].sizeimage);
> +		if (!pix_mp->plane_fmt[0].sizeimage)
> +			pix_mp->plane_fmt[0].sizeimage =3D DEFAULT_BS_SIZE(width, height);
> +		else
> +			pix_mp->plane_fmt[0].sizeimage =3D max(MIN_BS_SIZE(width, height),
> +							     pix_mp->plane_fmt[0].sizeimage);
>  	} else {
>  		v4l2_fill_pixfmt_mp(pix_mp, pix_mp->pixelformat, width, height);
>  	}

This is overall an improvement for userspace that is not picking a size, so=
 in
any case:

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

regards,
Nicolas

--=-fR05QOiHm7Ab/PiRZ46L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCatZllQAKCRDZQZRRKWBy
9PuQAP4u43q21p62RL/xpnhjv3g+Yw7nND0OOmWXaxG8okzuYwD/YLIymZqG+bTn
4x0mw6ZS3kdg5E3571Hr+MlXFSvsLQQ=
=r/WP
-----END PGP SIGNATURE-----

--=-fR05QOiHm7Ab/PiRZ46L--

