Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDADECA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 21:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YUveWLfJxG1xB/SfZGtWgCATWX/xICcJ1voX4XvPV7c=; b=ZlX2jLuB0lHLBSJR2wNMlzztEi
	dtOxheTBgCyO8rxnGxoK8J+qCVo9frt64VOXCGJXsl/XiUVH4h4mlIeA7kH/oZ1wy509WeddBmPwt
	QEgP0imHHzwl6c69G9tIvKOOtObsfY0q6Rf/MrKLxnEIRcWLofO83m6E56GrbzLTvIMGXbOtFV50b
	B8t1hOBuu1TP+opG8mdryU7tFTNBzNdoKHBZTZ9isFuHR0rkdHrHDLSlGHzGqf5GvolEJzGzXddmk
	/zxC7qkSJc//4EdT/9hcrqQER+r9ihKmInzQO+Nec/IY1VRAU2/3YUbCZvFa8VdinPTgkmb8WUPRk
	VsSYhPqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYok-00000002E4l-1iXp;
	Tue, 02 Sep 2025 21:45:30 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utUwC-00000001DqA-3CLM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 17:36:57 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-4b34a3a6f64so8074481cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 10:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1756834615; x=1757439415; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YUveWLfJxG1xB/SfZGtWgCATWX/xICcJ1voX4XvPV7c=;
        b=wtGBOBQ7g5Vq0zjAycaiF6jZE7ww6cVDrl+bokmugOutEtwz7+VsA1WP+ux/DCqp4X
         enNK6LIZYM/nPkXgfwkp08dqX8t2Makh5Ug3gXbJcvaQZXWl5x7gsy5jWyS06w+AicI+
         uToy8EbOkO5ueMwRVi7i/3LQb9q0XoD0K8TSnmhDGL6T1ZgVryBYxAFQnYNIdp02xLXb
         yB23xlCwArhXuPnTflYa3HJ1z5XDIAVpxyg2+5nijmYJs9kfRrO6On4/W3n5QvMB1/e7
         9TgZazjQ9imI90SGnc4VR5YYSYB+w8ey9G/JOSM4YH1qfZf+1Uhl4sO/5mKHG9zx45E5
         B8Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756834615; x=1757439415;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUveWLfJxG1xB/SfZGtWgCATWX/xICcJ1voX4XvPV7c=;
        b=NPwrDAaBcdKTZwZWzWhqJ8iTR5xM9EJuqqxqXGclNm9NmZ/m4ptktR/QWfHGtmEuV1
         VOoVMiKPlw2pDeK86PqT2B8xn1wFs/kpmJGHyIxUmWqIcRv1hOvHcf5csRjxF3GQJ1Jx
         IaZpKmUbtHeIjCOLAnE3oNmUpP+y02hdZu9GttonuaBCGVkRqlPLj3KhiNOgKExYyAa/
         lIoTEvizsUMDmSGqC6dpQJV04h8P76g3e4ycjttsTlbtAV8smWyHF7dXadCB90A4pbvU
         BgRpKd3QYOJOQmZOXpUpZaO5oZ71h5ynXym1vrPTK9jGHykJXC3bHrJAS3p9dNYHvKBD
         bXiQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2acjWN8NgBDAUuvXYGcY5Ohit+0PoR9p6L8Qxn1k5xx7DaugXhM2b4OkG/ArakhBW3ovG3DCSOzreUg67XB/N@lists.infradead.org
X-Gm-Message-State: AOJu0YzVKiiC0q40VB9AGOoFiKY+BQsN9b9U+Kd+mQ6bNmEIbqq2/Mst
	/DkObL2PhRm71C4uTfEIuTWyriAIHCC7PanLH1BDCzWQFHDzj1Vz71dVv99L5Gvbbc0=
X-Gm-Gg: ASbGnct7cmeZUu/vchVRrfLNMHQwE42L3ktHV21d+xiClJyQ63YfYKK9wn4wZb9pqHG
	d/Z4RuJ5Tu0z3/oyf4mAydPbH5stnAVvQsuVx+4v0o/y2nNgubKhyg+3zTjvylpOoRnHV2lUwTf
	/TRzGsJoHdu3vAXqNgVEPPs/D+GxpizSgWik+bHa82nSUrzy+I5J3hS20nBlxtBg72VKPzcKtTW
	ucOOVT7PjMyN+u86S3TF9zdSnvovroCdA1W0GQvo5BcxkscFtIG4H2Lh2HCCICJv1hT2645Cx5K
	T7qPI2r7Ng3yG9oC0RuYTdEHTwgy0h0tCdEiaWvk+Qtz1IhsbEXufjrgjRaQ4YzEgN6qbhQuJD2
	bMEw0tN0CKJgao6gbk43QUdLAHHk=
X-Google-Smtp-Source: AGHT+IETKmiz7vITB+wEL/qJVUdGFwJs0WdOeM5m84xzUG31rg4EEVrbihuQfEUXw5+mzM+hj49V9A==
X-Received: by 2002:ac8:5e0b:0:b0:4b2:fe63:ade4 with SMTP id d75a77b69052e-4b31dcbfc82mr144159171cf.78.1756834615376;
        Tue, 02 Sep 2025 10:36:55 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:5a76::5ac? ([2606:6d00:11:5a76::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b3474f2d08sm14082101cf.49.2025.09.02.10.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 10:36:54 -0700 (PDT)
Message-ID: <10a2f9865e96655c99ee377d542b5a06bb0146b3.camel@ndufresne.ca>
Subject: Re: [PATCH] media: amphion: Drop the sequence header after seek for
 VC1L
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl
Cc: sebastian.fricke@collabora.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, 	kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, xiahong.bao@nxp.com, 	eagle.zhou@nxp.com,
 imx@lists.linux.dev, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Tue, 02 Sep 2025 13:36:52 -0400
In-Reply-To: <d0102df15412fc827dca3b330b10904f97a1a240.camel@ndufresne.ca>
References: <20250725080712.1705-1-ming.qian@oss.nxp.com>
		 <ede4226a80e27c8b047b0eb25fe8f5ba90214d12.camel@ndufresne.ca>
		 <dbd7ec6c-9837-4bf3-a363-e287d075b677@oss.nxp.com>
	 <d0102df15412fc827dca3b330b10904f97a1a240.camel@ndufresne.ca>
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
	protocol="application/pgp-signature"; boundary="=-rCEhWbp6M9Za3ScTvuSE"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_103656_803831_15E60DDB 
X-CRM114-Status: GOOD (  33.13  )
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


--=-rCEhWbp6M9Za3ScTvuSE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

just adding to my anwer,

Le mardi 02 septembre 2025 =C3=A0 13:01 -0400, Nicolas Dufresne a =C3=A9cri=
t=C2=A0:
> Le lundi 01 septembre 2025 =C3=A0 17:41 +0800, Ming Qian(OSS) a =C3=A9cri=
t=C2=A0:
> >=20
> >=20

[...}

> > >=20
> > > Nicolas
> >=20
> > I tested this with gstreaer, not FFMPEG,
> > And I checked the gstreamer code in our repository, Then I found the
> > following related code:
> >=20
> > =C2=A0=C2=A0 } else if (g_str_equal (mimetype, "video/x-wmv")) {
> > =C2=A0=C2=A0=C2=A0=C2=A0 const gchar *format =3D gst_structure_get_stri=
ng (structure, "format");
> > =C2=A0=C2=A0=C2=A0=C2=A0 if (format) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!g_ascii_strcasecmp (format, "=
WVC1"))
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fourcc =3D V4L2_PIX_FM=
T_VC1_ANNEX_G;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else if (!g_ascii_strcasecmp (form=
at, "WMV3"))
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fourcc =3D V4L2_PIX_FM=
T_VC1_ANNEX_L;
> > =C2=A0=C2=A0=C2=A0=C2=A0 }
> >=20
> > Basically it processes WMV3 into VC1_ANNEX_L, and WVC1 to VC1_ANNEX_G.
> > I didn't found them in the upstream gstreamer repository.
> > Now I'm not sure if it is correct userspace behavior.
>=20
> Its a little concerning, since we are in the largely untested territory.
> Without
> proper documentation and with all the downstream changes done to userspac=
e, we
> can easily endup with NXP considering this is the right mapping and let's=
 say
> Qualcomm or Samsung thinking differently. Since this is for upstream, we =
need
> to
> ensure this is concistant. Have you reached to other driver maintainers
> already
> to discuss and resolve the subject in a way it works for everyone ?

So I checked Samsung implementation and your interpretation seems to be the
same. They MAP VC1_ANNEX_G to VC1 Advanced Profile Decoding in their
driver.=C2=A0Venus drivers does not care and just map both to VC1.

If I quote here Wikipedia's Window Media Video page:
   The Simple and Main profile levels in WMV 9 are compliant with the same
   profile levels in the VC-1 specification.[13] The Advanced Profile in VC=
-1 is
   implemented in a new WMV format called Windows Media Video 9 Advanced
   Profile. It improves compression efficiency for interlaced content and i=
s
   made transport-independent, making it able to be encapsulated in an MPEG
   transport stream or RTP packet format. The format is not compatible with
   previous WMV 9 formats, however.[14]


It matches well with the fact Annex G introduce start codes and inline sequ=
ence
headers, since you absolutely need that to stream over MPEG TS. GStreamer u=
ses
video/x-wmv as a family, and format=3DWVC1 for the advanced profiles, and W=
MV3 for
everything else it supports.

I think you should go ahead and upstream this mapping fix into GStreamer. V=
4L2
documentation should perhaps mention "Advanced Profile" to help devs.

Though, this gives me the impression that codec_data can be inline for ANNE=
X G.

Nicolas

>=20
> >=20
> > And the reason of this issue is the below code in gstreamer, that the
> > v4l2decoder may only send codec data after seek.
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0 codec_data =3D self->input_state->codec_data;
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0 /* We are running in byte-stream mode, so we d=
on't know the=20
> > headers, but
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * we need to send something, otherwise t=
he decoder will refuse to
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * initialize.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > =C2=A0=C2=A0=C2=A0=C2=A0 if (codec_data) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gst_buffer_ref (codec_data);
> > =C2=A0=C2=A0=C2=A0=C2=A0 } else {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 codec_data =3D gst_buffer_ref (fra=
me->input_buffer);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 processed =3D TRUE;
> > =C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
> That is truncating a bit too much of the context. The "processed" boolean=
 is
> set
> when the codec data and frame is combined. In the case the codec data is =
only
> to
> be found in caps, it will queue the codec data and immediately queue the =
frame
> data. This is perfectly valid with the way the stateful decoder specifica=
tion
> is
> written.
>=20
> In practice, GStreamer stateful decoder is multi-threaded, so it will fil=
l the
> OUTPUT queue with following frames too. What you can do to make your driv=
er
> more
> flexible is whenever you didn't find a frame in a buffer, merge this buff=
er
> with
> the next one, and do that until there is no more space in one buffer. Thi=
s way
> you don't copy all the time like ring buffers do, but you can survive abi=
trary
> splits of byte-stream.
>=20
> Nicolas
>=20
> >=20
> > Regards,
> > Ming
> >=20
> >=20
> > >=20
> > > > =C2=A0=20
> > > > =C2=A0=C2=A0	ret =3D vpu_malone_insert_scode_seq(scode,
> > > > MALONE_CODEC_ID_VC1_SIMPLE, sizeof(rcv_seqhdr));
> > > > =C2=A0=C2=A0	if (ret < 0)

--=-rCEhWbp6M9Za3ScTvuSE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaLcrNAAKCRDZQZRRKWBy
9G63AQCyMGpnvM2t/iah6p5bRMNoVq3AhBhx82SGjhQ+Gb4EPAEA0NCbo/kMptfm
2D47AslCwI/TCwDxugSj+57rWW71AAk=
=x5cZ
-----END PGP SIGNATURE-----

--=-rCEhWbp6M9Za3ScTvuSE--

