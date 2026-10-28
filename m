Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AA6606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 19:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oUes1tcN;
	dkim=pass (2048-bit key, unprotected) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=YmEBP9WI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=U4Z20M5yrzVdkZ8pUfnazTFG6IRUwC17SyWpCdk396M=; b=oUes1tcNgjfjr547dk/HOSPFIN
	flCKfomQMYOrIskwJ/HxzSVT7xBuZMeKnOjsZT1jjPw428E3QOuux6dTfKDwJrz7S4l0VzlREmBw7
	KInYnwtOeC2zSPQjmN+zoxbPc6zef66yToqYcySqndCeIDQXIP94GRSA9XWBrADZQchPrxgia6EAf
	fkNsJ5OWEl7u2FlbAJcN//hYwOVOzX/Pjnr/mvN93MIiLWhDmXqGzFp/+nBxJEe67cnXFhQHydngX
	qj7fpJsS6f5hiElOAyHEqLLV9Ch45/aX2MP/Pdbncm8+4SWWRKDgL8AkljUplBRpDtkQASBKIBnyS
	RPqhs8pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM9il-00000007tAv-0l6I;
	Wed, 28 Oct 2026 19:54:03 +0000
Received: from mail-qk2-x01.google.com ([2607:f8b0:4864:34::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM9ii-00000007t9b-0ROi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 19:54:02 +0000
Received: by mail-qk2-x01.google.com with SMTP id d75a77b69052e-5332a0f6dbbso17566701cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 12:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1793217238; x=1793822038; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U4Z20M5yrzVdkZ8pUfnazTFG6IRUwC17SyWpCdk396M=;
        b=YmEBP9WINha8yOXFCNYEsIPA4RIUzzIdBVxxVQtNattsso3qkUqPXdFYsB87g1J9qO
         kCRHV7WM3WCE0AVpKI28A5Gk/8sjeuFSirE3bM/zMP6PNTPusfXEZvIBmy90h5QGHTN7
         fernIXu4apF5t2Jow6O3+goMkSzwsrPLO//EgjF7f0mizVob/TI/16Cu29PqjcqQpaAp
         xr0S48Mma7b3tbpOrahQpc/2R4ykpkmI9lDk6jfR3ozSu7PoZj9MQkHbb0dh3tuLs21i
         wuDgig7PLqvy4q1+Td3ujdE6+9HqC6icUuSjQ6a4DJlO4jQ+jYxG1OBEGkiRMIvdwf4u
         59rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793217238; x=1793822038;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U4Z20M5yrzVdkZ8pUfnazTFG6IRUwC17SyWpCdk396M=;
        b=HhCG874m+FoI+Faaed0EexGDKSUnyDLbR4pJHaf5OprHu7Rv07w1pHq7MlChJTYu9c
         R2b3QbkiX9rE2cmJ3LZgpXyoJYGvWVSHGKv6mF4bqhar16DdV/TCeflZE1+vyEo+emCW
         1+pbFKsdyl+/GSTSh7+DdKWAGetvtR/dJiGzKbXP7tt/4I8xaMWMUJW+oNJM9hGKi4vt
         0Aeko3CprG2LQm8msnE/8RiTn/F+gR7234fDM3WBKSp34aaYw36Dfdv1os6q4+lgTQvc
         LMvFDaWGlV6OBC9hw6lpe/bxTX3stQdq3xwqGA33fmK6oNHKLMsI3Vl1pQHo2jCqqN8k
         4Ypw==
X-Forwarded-Encrypted: i=1; AKwUvBynSZTau4SImRModEcEFQnUa18xbV0+yl6eQXg4xg0jMEnXklV33Mlj1c7nPecmBpJ2Fg2BnD999htZVJ2SupWq@lists.infradead.org
X-Gm-Message-State: AFq9FYJjjCgH3Er938JXJ+w/UsR22SdshFod5dy8Jp5WZuL/LvvM9BQu
	dedmkiAj+h7SUBraPp4Qv/L0+xYWkHFzPO7dbAyTKWKXE3seRO4ZPa554FdHZP6A1vE=
X-Gm-Gg: AYBFou28iX0lhpVjFyYxlfn0REzc4YH5fbaDsURC9zXDuCfswBpqU+HICtDLQ5epjEf
	3Zqci2EgXb2xcJidtF0WTVQfRQzBVXYFPl2f787hpGHNwCh2sThEJGqK6RIx8ojGMKP5eBNgpDi
	fzWfv8U9aNTRJtDWk1spdF3WTPHJLqF2Xi/w+gdnb0MM5eWWCg4rGEVEbzkqGUITW6p0G/yCl6B
	SicRI5fyEouK/i/wOWU63CKfqDrmBcS/DP4beXpZEir1We9f7hBC1fbmWG1/BIUPkWgUGcsUvPe
	+x7CMdPlW7vv0Yhlq9FbRj3hhD2cJOTnQaQNgKPfZLZV3lQWZSbQ2E1ahi1LDWM8NRXyk+mHZvD
	uoxEnWRZY0y+kkJQLJSwJWKI8x1xQmOfd4C95RoR/9qnHez8x/FW7QCQUqPEzd2Qxhn4qMCimqd
	bJj693X1NeuhIHVXfmBnsjryySfAcS/drj2lPVdXLk1ko6VsMpD9ruHzAuYK+DdcSxB6tK7NUWk
	iPasJJS7qSu2SeJ48vD0mZctp3b2XYhL53cUFu74ebs7doqtmvwD8JHEq4Ss19WJHapINlStfO7
	PiNu+kAZaqpUTIRcjFCTzzifam5PTuRObEMTI5nhdrPMZX34EepEohfFzg4jBN6qzU3scJVH4Tq
	b
X-Received: by 2002:ac8:5a50:0:b0:536:6abc:54b1 with SMTP id d75a77b69052e-53fcb509e99mr60729391cf.28.1793217237708;
        Wed, 28 Oct 2026 12:53:57 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53838cf49c9sm113417671cf.3.2026.10.28.12.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 12:53:56 -0700 (PDT)
Message-ID: <bfc4481a817e761ed9ccc265484dfbdfc1e59490.camel@ndufresne.ca>
Subject: Re: [PATCH v7 2/4] media: rockchip: Add JPEG decoder driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Torsten Duwe <duwe@lst.de>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: Lucas Sinn <lucas.sinn@wolfvision.net>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner
	 <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 28 Oct 2026 15:53:53 -0400
In-Reply-To: <20261022190026.6cb0a534@rocky.lan>
References: <20261022-rockchip-jpegdec-v7-0-3fd7dd55f408@pengutronix.de>
		<20261022-rockchip-jpegdec-v7-2-3fd7dd55f408@pengutronix.de>
	 <20261022190026.6cb0a534@rocky.lan>
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
	protocol="application/pgp-signature"; boundary="=-vP+iZzvr5GpVmxFar41J"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_125400_338670_8B49D915 
X-CRM114-Status: GOOD (  25.57  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--=-vP+iZzvr5GpVmxFar41J
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Torsten,

Le jeudi 22 octobre 2026 =C3=A0 19:00 +0200, Torsten Duwe a =C3=A9crit=C2=
=A0:
> Hi Sascha,
>=20
> first: thank you for driving this :)
>=20
> On Thu, 22 Oct 2026 13:06:40 +0200
> Sascha Hauer <s.hauer@pengutronix.de> wrote:
>=20
> > Add a driver for the JPEG hardware decoder Rockchip integrates into a
> > number of its SoCs.=20
>=20
> [...]
>=20
> > +static int rkjpegd_enum_fmt_vid_out(struct file *file, void *priv,
> > +				    struct v4l2_fmtdesc *f)
> > +{
> > +	if (f->index)
> > +		return -EINVAL;
> > +
> > +	f->pixelformat =3D V4L2_PIX_FMT_JPEG;
> > +	f->flags |=3D V4L2_FMT_FLAG_DYN_RESOLUTION;
> > +
> > +	return 0;
> > +}
> > +
> > +static int rkjpegd_enum_framesizes(struct file *file, void *priv,
> > +				   struct v4l2_frmsizeenum *fsize)
> > +{
> > +	/* The decoded format follows the bitstream, nothing to enumerate. */
> > +	if (fsize->pixel_format =3D=3D V4L2_PIX_FMT_NV12 ||
> > +	    fsize->pixel_format =3D=3D V4L2_PIX_FMT_GREY)
> > +		return -ENOTTY;
> > +
> > +	if (fsize->pixel_format !=3D V4L2_PIX_FMT_JPEG)
> > +		return -EINVAL;
> > +
> > +	if (fsize->index)
> > +		return -EINVAL;
> > +
> > +	fsize->type =3D V4L2_FRMSIZE_TYPE_STEPWISE;
> > +	fsize->stepwise.min_width =3D RKJPEGD_MIN_WIDTH;
> > +	fsize->stepwise.max_width =3D RKJPEGD_MAX_SIZE;
> > +	fsize->stepwise.step_width =3D RKJPEGD_CODED_STEP;
> > +	fsize->stepwise.min_height =3D RKJPEGD_MIN_HEIGHT;
> > +	fsize->stepwise.max_height =3D RKJPEGD_MAX_SIZE;
> > +	fsize->stepwise.step_height =3D RKJPEGD_CODED_STEP;
> > +
> > +	return 0;
> > +}
>=20
> Can it do JPEG, MJPEG or maybe both? AFAICT the difference is minimal,
> so maybe try to be more permissive?
>=20
> [...]
>=20
> > +static const struct v4l2_ioctl_ops rkjpegd_ioctl_ops =3D {
> > +	.vidioc_querycap =3D rkjpegd_querycap,
> > +	.vidioc_enum_framesizes =3D rkjpegd_enum_framesizes,
> > +
> > +	.vidioc_enum_fmt_vid_cap =3D rkjpegd_enum_fmt_vid_cap,
> > +	.vidioc_g_fmt_vid_cap_mplane =3D rkjpegd_g_fmt_vid_cap,
> > +	.vidioc_try_fmt_vid_cap_mplane =3D rkjpegd_try_fmt_vid_cap,
> > +	.vidioc_s_fmt_vid_cap_mplane =3D rkjpegd_s_fmt_vid_cap,
> > +
> > +	.vidioc_enum_fmt_vid_out =3D rkjpegd_enum_fmt_vid_out,
> > +	.vidioc_g_fmt_vid_out_mplane =3D rkjpegd_g_fmt_vid_out,
> > +	.vidioc_try_fmt_vid_out_mplane =3D rkjpegd_try_fmt_vid_out,
> > +	.vidioc_s_fmt_vid_out_mplane =3D rkjpegd_s_fmt_vid_out,
> >=20
>=20
> You are populating only the *_out_mplane members and not the single
> plane ones? So a greyscale JPEG needs to go _mplane with 1 plane?

Drivers only implement one queue type, MPLANE is the recommended one. There=
 is
pixel formats for single allocation and multi-allocation that userspace can=
 pick
from. So a driver can do MPLANE and support both NV12 and NV12M formats as =
an
example.

>=20
> And for color, the colorspace on the decoded side should be
> V4L2_COLORSPACE_JPEG, not sRGB, I think.

Should actually match what the JPEG header says, RGB jpeg exist.

>=20
> Would you mind to give a hint about your test setup?

I believe Sascha has been testing with GStreamer, the element is called
v4l2jpegdec.

Nicolas

>=20
> Thanks,
> 	Torsten
>=20
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

--=-vP+iZzvr5GpVmxFar41J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCauJS0QAKCRDZQZRRKWBy
9FbtAQDQq1LHLIEYGFdpJt3hiBBdUv17DM2qsOM4AzolcnZ4QQD/ber/FxSYvItX
/Z3gWh4nz808VmJqoajvRuATRpq4NQo=
=niJB
-----END PGP SIGNATURE-----

--=-vP+iZzvr5GpVmxFar41J--

