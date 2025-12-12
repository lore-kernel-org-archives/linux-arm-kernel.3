Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2BED59D77
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 17:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pcbiXQ8Ctw/Z6jD0bVlJC1sTnTmQfiCSEdIKL7g/AfQ=; b=c3etXhqSFhGmpcrLpaSDrAPi2p
	St/u3VMUY7bcrDkd/rGT9CNPmEHitdxWcOYTkHipiyqJuKRE7bzQSP/R8nfpJ/Qg3Sig4CR97/0+D
	UZkLWsc2OMLVJGk5JoWiaqbt8gYmjPaFk2oJpsky/qHE+3tNHnKR3TZadNOe1J8/r6Qx+lzbYYzqr
	EGjr4zw9vfhcfUROMgLa5E2oLT72HqBAy8HS4S7iodpf+pdPcukqc11BiK0SsRutv/uD9uRUgFxEM
	aUyV7DguQRpKdkMmyRv+zcW24c+Hy6h30puk+cegDQlDFSJX3sPtlMsPhtwK+xXr2cneimWQQAsfr
	8IAIJg7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU7L8-00000000uiv-05fP;
	Fri, 12 Dec 2025 17:54:02 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU7L5-00000000uiO-3JVK;
	Fri, 12 Dec 2025 17:54:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765562037;
	bh=gtkyj6GVsnbIOX5ifyV1wXuJ94FHbpTY0m8F56kuYVE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=pwg7RUlXd6jlDI3QCZAwaCZFvUfjhLVxRXyz7uodRpiNmbgZc7meqjmjra/RetixY
	 j9sO8NEsFXlZcMLZV6QVMSZzgAfu/6ZkupsmOz8dwomQl7msb7x0P9X3ENiKsRC0cb
	 7iXbqe4h3yYtqu0FcHWAO1FL57yumqE2k8A4Q0V3jrjRl+IC+6H8qA9Eqv3WHt4oCd
	 qrBlk6U7oBJd1FpQETRNIWilRymtHspUmEDW8qWxIN8c2bQ1rswI6f6Nmh35OK26vj
	 yy9GMT6gbBb0tZTUGKuRKcMDj2znEe2B6vuFpNOK46xVNj7yW9OMirtIQgQyDMbth1
	 aMoVJ8Fr84HpA==
Received: from [IPv6:2606:6d00:17:7b4b::5ac] (unknown [IPv6:2606:6d00:17:7b4b::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E2F3C17E110C;
	Fri, 12 Dec 2025 18:53:55 +0100 (CET)
Message-ID: <8f24c8204984a46bad7d0bb24b78c8115906f748.camel@collabora.com>
Subject: Re: [PATCH] media: rkvdec: set ctx->image_fmt in
 rkvdec_s_capture_fmt
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jianfeng Liu <liujianfeng1994@gmail.com>, 
	linux-rockchip@lists.infradead.org
Cc: Jonas Karlman <jonas@kwiboo.se>, Detlev Casanova	
 <detlev.casanova@collabora.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>,  Hans Verkuil <hverkuil@kernel.org>, Heiko
 Stuebner <heiko@sntech.de>, Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, 	linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Date: Fri, 12 Dec 2025 12:53:53 -0500
In-Reply-To: <20251212154138.3042300-1-liujianfeng1994@gmail.com>
References: <20251212154138.3042300-1-liujianfeng1994@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-KGnTfVc2/BqU11O39I7Y"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_095400_006422_2FD20199 
X-CRM114-Status: GOOD (  19.84  )
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


--=-KGnTfVc2/BqU11O39I7Y
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 12 d=C3=A9cembre 2025 =C3=A0 23:41 +0800, Jianfeng Liu a =C3=A9=
crit=C2=A0:
> ctx->image_fmt is initialized as RKVDEC_IMG_FMT_ANY at
> rkvdec_s_output_fmt, and get set at rkvdec_s_ctrl when userspace sends
> SPS info via VIDIOC_S_EXT_CTRLS. This works fine with gstreamer because
> it sends SPS info to kernel driver before requesting capture queue bufs.
>=20
> But chromium requests capture queue bufs first and then sends SPS info
> to kernel, then rkvdec_s_ctrl will return -EBUSY, and the video is
> displayed green.
>=20
> Chromium calls VIDIOC_S_FMT to capture queue instead before requesting
> capture queue bufs, so setting ctx->image_fmt in rkvdec_s_capture_fmt
> will make rkvdec_s_ctrl return 0 when the first SPS info sent to driver.

I'm reading you here, and reading the spec again [0], and you are saying th=
e
Chromium isn't following the initialization process. That means, it should =
be
impossible to allocate 10bit capture buffer, since the SPS in place specify=
 the
color depth. Other parameters in other codec can influence the reference bu=
ffer
size, so you could endup with the wrong allocation.


[0] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-stat=
eless-decoder.html#initialization


>=20
> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> Fixes: d35c64eccf3b1 ("media: rkvdec: Add get_image_fmt ops")
> ---
>=20
> =C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec.c | 12 ++++++++++++
> =C2=A01 file changed, 12 insertions(+)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> index 5af9aa5ab353..e7939d604f64 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -537,6 +537,18 @@ static int rkvdec_s_capture_fmt(struct file *file, v=
oid
> *priv,
> =C2=A0		return ret;
> =C2=A0
> =C2=A0	ctx->decoded_fmt =3D *f;
> +
> +	u32 fourcc =3D f->fmt.pix_mp.pixelformat;
> +
> +	if (fourcc =3D=3D V4L2_PIX_FMT_NV12)
> +		ctx->image_fmt =3D RKVDEC_IMG_FMT_420_8BIT;
> +	else if (fourcc =3D=3D V4L2_PIX_FMT_NV15)
> +		ctx->image_fmt =3D RKVDEC_IMG_FMT_420_10BIT;
> +	else if (fourcc =3D=3D V4L2_PIX_FMT_NV16)
> +		ctx->image_fmt =3D RKVDEC_IMG_FMT_422_8BIT;
> +	else if (fourcc =3D=3D V4L2_PIX_FMT_NV20)
> +		ctx->image_fmt =3D RKVDEC_IMG_FMT_422_10BIT;

You cannot accept a format that falls against the color depth in the SPS
control, and rkvdec does not do color conversion implicitly. This can other=
wise
lead to letting the HW overrun the buffer (forcing 8bit with 10bit content)=
. Can
you check with Chromium dev if they can perhaps adhere to the spec instead =
?
This is all news to me, but I probably never had to test 10bit playback in
Chromium outside of MTK (which might not be less strict, hopefully done the
right way).

regards,
Nicolas

> +
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0

--=-KGnTfVc2/BqU11O39I7Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTxWsQAKCRDZQZRRKWBy
9MH3AQDUhY3sqERSYtPJTOv2OrLvOyQdReWs2GtPrwGsJMqh2QD+PVv2MeM6/3Va
0A0tGbG6GO39dojfMxGwmdL9Ady4ggs=
=sO55
-----END PGP SIGNATURE-----

--=-KGnTfVc2/BqU11O39I7Y--

