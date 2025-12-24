Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD6DE7848C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 19:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p1qTgXY+W/fZ0r5RS4/HhWMI5vRxBUQ/sZWjseFxAcY=; b=hE9nFAhpoDi2rkl7qGrJDNEihN
	0B9IGHgXCcNWZVX3ne73dR4cMqxFtWvz235MkfI7dnoDSkifLWZsyg0SjO93LP3kStMpe+qAOEVtA
	ULMnVb24ewmF5zPQSFyj8GqmM6YcLN4I02F4GX6X3cDUVHTM3v68wc2CVap2eQZ6C89o/Ho7ZWBrF
	T9ZCXUpjJ7yKvN8iPCV42KwM1SXc6wqXDY9u8lsBUL9QNJL9B/i8OuXu7qZm7plUG1u8QBp6i35jn
	Cnm7W0v7fEcm/gB6ZRFA//UknSWOEPEu8CLCif0v3vcVbpAHFyY9+gEyho/ePgpRtt4IIbxbsBEKg
	slP55M8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYUnW-0000000HMwN-0290;
	Wed, 24 Dec 2025 19:45:26 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYUnM-0000000HMvu-15WD;
	Wed, 24 Dec 2025 19:45:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766605511;
	bh=b+G+0yiBIxd9dM8ozJEr/KvT0qpvPfrm8yvO7rpogQo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=AiQSZUOB52Pc+L8pvvNs23jDfyZWkTuZI0qG51MMnrOTOXmQyCg0Zq9GH4jTTp2ve
	 EtqFmBPN8i2PjLpdyWsiZObrlVr3LZZrvzIj7j3odQHOIimIjdY+dJs2DvjzXqUUHX
	 ckdFSzZowQY5r5OYC8W4HUjVJsh9rX05iSCilij7aAx+QEHRWDQ3/0SpjJNsxjElf0
	 hcwDtdqsoEeSfWCkkZzbDLbVaYcXpVuctkOuBzu6/A4pnfBULn+jVBeBaPjGbQfT2k
	 5fQ9c/w6JyHoyFf9uUeBtvBqaYK8Ng66rBBqITriUQblIbQzo4W0aF00W+BOW6kifM
	 fsz0wVXXSGF/Q==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 28CAC17E0451;
	Wed, 24 Dec 2025 20:45:09 +0100 (CET)
Message-ID: <75e51a60acd161884c623c991ba87827259f7731.camel@collabora.com>
Subject: Re: [PATCH v7 14/17] media: rkvdec: Add H264 support for the
 VDPU381 variant
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jianfeng Liu <liujianfeng1994@gmail.com>, detlev.casanova@collabora.com
Cc: corbet@lwn.net, daniel.almeida@collabora.com, didi.debian@cknow.org, 
	ezequiel@vanguardiasur.com.ar, hansg@kernel.org, heiko@sntech.de, 
	hverkuil@kernel.org, james.cowgill@blaize.com, jonas@kwiboo.se, 
	kernel@collabora.com, laurent.pinchart@ideasonboard.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	mchehab@kernel.org, opensource206@gmail.com, ribalda@chromium.org, 
	sakari.ailus@linux.intel.com, yunkec@google.com
Date: Wed, 24 Dec 2025 14:45:06 -0500
In-Reply-To: <bf4a8049f49b8d6d8a39faecee025dce51d59db3.camel@collabora.com>
References: <20251218232829.337811-15-detlev.casanova@collabora.com>
		 <20251220164604.10052-1-liujianfeng1994@gmail.com>
	 <bf4a8049f49b8d6d8a39faecee025dce51d59db3.camel@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-gur3ft8B/U8bNC0tn3BS"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_114516_488534_932C70DC 
X-CRM114-Status: GOOD (  24.72  )
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


--=-gur3ft8B/U8bNC0tn3BS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Detlev,

Le lundi 22 d=C3=A9cembre 2025 =C3=A0 08:19 -0500, Nicolas Dufresne a =C3=
=A9crit=C2=A0:
> Hi,
>=20
> Le dimanche 21 d=C3=A9cembre 2025 =C3=A0 00:46 +0800, Jianfeng Liu a =C3=
=A9crit=C2=A0:
> > Hi,
> >=20
> > On Thu, 18 Dec 2025 18:28:24 -0500, Detlev Casanova wrote:
> > > +static int rkvdec_h264_start(struct rkvdec_ctx *ctx)
> > > +{
> > > +	struct rkvdec_dev *rkvdec =3D ctx->dev;
> > > +	struct rkvdec_h264_priv_tbl *priv_tbl;
> > > +	struct rkvdec_h264_ctx *h264_ctx;
> > > +	struct v4l2_ctrl *ctrl;
> > > +	int ret;
> > > +
> > > +	ctrl =3D v4l2_ctrl_find(&ctx->ctrl_hdl,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_STATELESS_H264_SPS);
> > > +	if (!ctrl)
> > > +		return -EINVAL;
> > > +
> > > +	h264_ctx =3D kzalloc(sizeof(*h264_ctx), GFP_KERNEL);
> > > +	if (!h264_ctx)
> > > +		return -ENOMEM;
> >=20
> > I can see the sps validation is removed:
> >=20
> > 	ret =3D rkvdec_h264_validate_sps(ctx, ctrl->p_new.p_h264_sps);
> > 	if (ret)
> > 		return ret;
> >=20
> > This should fix decoding issue with chromium when minimum size of h264
> > decoder is lower than 32. While I find this issue is caused by chromium
> > not following v4l2 stateless spec, and I think checking sps at start
> > should be still necessary.
>=20
> One of the missing part of rkvdec is that once you set the OUTPUT format =
we only
> reset the capture format, but we should also reset the SPS control to a m=
atching
> default, matching the resolution and resetting the depth. In fact, I don'=
t even
> see code that verify the bit depth against already allocated memory, and =
the is
> not capable of converting.
>=20
> I tend to agree with Jianfeng, that we should leave that un-modified unti=
l we
> have time to fully address and test this situation.

I digged more, and by removing this check, userspace would endup doing:

- S_FMT(OUT, 800x600)
- S_CTRL(SPS, 800x600)
- S_FMT(OUT, 640x480)

And still succeed streamon with that SPS. Since the SPS rarely changes, and
there is no requirement to send it again, a frame decode can be requested, =
and
this miss-match can trigger the hardware to possibly overrun.

For this reason, I cannot take v7.

Nicolas

>=20
> Nicolas
>=20
> >=20
> > I have sent a fix to chromium[1] and it should get merged later.
> >=20
> > [1] https://chromium-review.googlesource.com/c/chromium/src/+/7274555
> >=20
> > Best regards,
> > Jianfeng

--=-gur3ft8B/U8bNC0tn3BS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUxCwwAKCRDZQZRRKWBy
9G6FAQCcudgu0v4em8zmhWRxJNMcDV+NXLp0e8u+fid1pFGqoAD9FbimiTkezVcu
ieRvLC19cECxdlHVj8K245sDJeldSQw=
=xKB6
-----END PGP SIGNATURE-----

--=-gur3ft8B/U8bNC0tn3BS--

