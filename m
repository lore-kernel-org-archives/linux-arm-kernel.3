Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDE43CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 21:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gjQPzp3OKlw/zzV2Y8hLeLQ+4i7hSjApzF/xf3zvApg=; b=zxx5ctnXsDov1/reMFe4hgTH3+
	H1wz10v5EIHxCDHaEVi6bluApCRefksOrEBrjA4Y3grIpylQXft2ehzhiJkm/BJpkz8hlNW+ZHDjK
	/UJ+J68xo5Rlh4qPJBChM6V7y+vS/ejGGiajw+6TL6yO6bRJkYO4mVjJvs7bjiN4DT04JLCgmO49U
	uAuWywP3xGkjaNJI4a+bHX9GHw2pYPaYEyKGhE18R0hmay5bywzEFkQVD/b4YkWnnJbYhbVB4ztFv
	GJlUiw9D2HvsN+gQ9Gt57iTGDhVMHfQ2UU4r4cvGrWcUPaSZ6mXstnog1mgL/gQGCRhhWwZ177h8T
	7IrSZ+GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYo1-00000002D8H-2IPq;
	Tue, 02 Sep 2025 21:44:45 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utUO2-000000015a1-3Ho7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 17:01:40 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7f8ea864d81so597426685a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 10:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1756832497; x=1757437297; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gjQPzp3OKlw/zzV2Y8hLeLQ+4i7hSjApzF/xf3zvApg=;
        b=pldarCDlXG+UWp046+zkqpYC80JO+X9rqONwAHgJNrNEagGAi00LJPjzWfnPa3ERRr
         tHpJ4Xuy5kiTWnEufmjWePB80bUKRgfMnjNWDFtShikGjpvyQEDasju/cVMkM2xDx4JU
         2iCm+Q3gcHJPCRMGqy5JT1/GH+Xe8jQ9rjtZ6LBFfUD9iFxQdzzKrkK2kt3PvJ99o/0t
         Y6l8NDZCl+/K3xieoHNgWsvJRztrQUCZ8NvvPsVz3vU+q+M9ZMt/wrHVhOK8gKS3kp4b
         3bZ8BfNfMT6oX0BTtzbeSCXWWawEZ9KpoBPbNz6VNLD9FKVYq+b46HderTjCEKKk3V2T
         VGdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756832497; x=1757437297;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gjQPzp3OKlw/zzV2Y8hLeLQ+4i7hSjApzF/xf3zvApg=;
        b=LH0toD3X47GPpdkwPqyrBz2IJLRaa+yte36aFI+pDUoIOn7o09Dm6yAxbHa54tzthH
         cI2QVa3aagMIRNRtKlpZjDwHp61NweKImmBD7+FBSGgN9RUHamH0OOZBp2o4kbePqZtw
         Z4E206PYObimyjk5ty5ugIwDJDWL9TnWDpHNPSkLD+x26XligWuoW43ynpLt/K7y0xcW
         P40h4UghVyQsDzVR5bk+bfbTHYbrecLGRyLqpzEs1um6XqmK8s07Vvgsb8aoxeX/UGYx
         qVP/5O0KR1i9Dn/774NVTW86WNzpHLlaMtVhF/Rfj7aX1Sr6Qy6LWWjevfClk5FQWzY5
         O3ig==
X-Forwarded-Encrypted: i=1; AJvYcCWHPKkJPOywMZAxCqybTQ3OwDlHMCJ1FfqsNfK1rsKGRBwzpBb8Ok5WNyGH13CBnFaHxj9IDyTqdNHGHVNPVhY+@lists.infradead.org
X-Gm-Message-State: AOJu0YwqpNirPRsTGgHI4UwoSUGa4eTYLJ8uYriY1EBihA4yyfk12Mlc
	rbgi6NurjPZyOQRiiR2ZH/u2J1waOH76FG46RM1kl9QRefZIDG80pANzYc4FojIRQfk=
X-Gm-Gg: ASbGncswxhYGKGOfFEfbnaSzfOLLJH9Pfqfgu5o92l5iiA4olLIEGHVb7yckTjii2hH
	6f3kfVCEDiZNmW9tDSgD4mqjWbE3jA1FL35LU0OY21YGtfmvSA2QM0UD9E+YKZfbfebxG+FfFyb
	6QW0jna298NP4416F0oVc/nsTWzAsd1GGJb02l0tyLrrKN/MXtUxigpO/bpgI3tXr4U4axogolO
	ThT/HyFo63BWI2x4WtTFZtCi+lV+L3Xme9PMEx41hlCjlnicZ+Y65Ff2Q0WaAfkkNx8zTUpeaq6
	XizAdVGzEEotGXLXBwPMiBOyw4SrLOwTLSxmoFVvjhVnJYQPoSPeEhsONR6vknyLDUCfmtedkSt
	e8+gLcCTDn8Kjk8jRM8xE7aYJw6N6sgox9j7Vmcd+E60IT4XU
X-Google-Smtp-Source: AGHT+IGkFaL10RYKipHUpI0kj9FEjJXmVz6qoux7i4ASKOHv4yzHf32aHVHY76E+7bItd5+j6zSurg==
X-Received: by 2002:a05:620a:1a01:b0:7e8:579d:11c6 with SMTP id af79cd13be357-7ff26eab218mr1387636485a.3.1756832496958;
        Tue, 02 Sep 2025 10:01:36 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:5a76::5ac? ([2606:6d00:11:5a76::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8069d5b9614sm163429785a.60.2025.09.02.10.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 10:01:36 -0700 (PDT)
Message-ID: <d0102df15412fc827dca3b330b10904f97a1a240.camel@ndufresne.ca>
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
Date: Tue, 02 Sep 2025 13:01:32 -0400
In-Reply-To: <dbd7ec6c-9837-4bf3-a363-e287d075b677@oss.nxp.com>
References: <20250725080712.1705-1-ming.qian@oss.nxp.com>
	 <ede4226a80e27c8b047b0eb25fe8f5ba90214d12.camel@ndufresne.ca>
	 <dbd7ec6c-9837-4bf3-a363-e287d075b677@oss.nxp.com>
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
	protocol="application/pgp-signature"; boundary="=-bV38p/TGIUCsdGFxL5ya"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_100138_968522_CFDF3FC9 
X-CRM114-Status: GOOD (  50.34  )
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


--=-bV38p/TGIUCsdGFxL5ya
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 01 septembre 2025 =C3=A0 17:41 +0800, Ming Qian(OSS) a =C3=A9crit=
=C2=A0:
>=20
> Hi Nicolas,
>=20
> > Hi,
> >=20
> > Le vendredi 25 juillet 2025 =C3=A0 16:07 +0800, ming.qian@oss.nxp.com=
=C2=A0a =C3=A9crit :
> > > From: Ming Qian <ming.qian@oss.nxp.com>
> > >=20
> > > For Simple and Main Profiles of VC-1 format stream, the amphion vpu
> > > requires driver to discard the sequence header, but insert a custom
> > > sequence start code at the beginning.
> > > The first buffer after a seek always contains only the sequence heade=
r.
> > > But vpu_vb_is_codecconfig() always return false as there is currently=
 no
> > > flag indicating that the buffer contains only sequence header data an=
d
> > > not frame data.
> > > So driver needs to drop the first buffer after seek, otherwise the dr=
iver
> > > will treat the sequence header as a frame, which will cause the image=
 to
> > > be corrupted after the vpu decodes.
> > >=20
> > > Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> > > ---
> > > =C2=A0 drivers/media/platform/amphion/vpu_malone.c | 4 +---
> > > =C2=A0 1 file changed, 1 insertion(+), 3 deletions(-)
> > >=20
> > > diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/me=
dia/platform/amphion/vpu_malone.c
> > > index ba688566dffd..a4c423600d70 100644
> > > --- a/drivers/media/platform/amphion/vpu_malone.c
> > > +++ b/drivers/media/platform/amphion/vpu_malone.c
> > > @@ -1373,11 +1373,9 @@ static int vpu_malone_insert_scode_vc1_l_seq(s=
truct malone_scode_t *scode)
> > > =C2=A0=C2=A0	int size =3D 0;
> > > =C2=A0=C2=A0	u8 rcv_seqhdr[MALONE_VC1_RCV_SEQ_HEADER_LEN];
> > > =C2=A0=20
> > > -	if (vpu_vb_is_codecconfig(to_vb2_v4l2_buffer(scode->vb)))
> >=20
> > Please remove vpu_vb_is_codecconfig() entirely, it always returns false=
, so its
> > miss-leading.
> >=20
>=20
> We have tried to define V4L2_BUF_FLAG_HEADERS_ONLY to to distinguish
> whether it only contains codec data.
>=20
> https://lore.kernel.org/lkml/20221125020741.28239-1-ming.qian@nxp.com/
>=20
> Although it was not accepted, we applied this flag in our Android
> project. Then in the Android platform, vpu_vb_is_codecconfig() doesn't
> always return false.
>=20
> I know that's not enough reason to keep it. I just want to say that this
> vpu need to know if the buffer only contains codec header in some cases.
> And if we remove this, I need to add some comments to remind users that
> they need to pay attention here.

In all cases, this dead code have to go away, if we had noticed earlier it =
would
have been rejected.

Either the format document strictly requires codec data as first buffer (al=
one),
or you create a new format for you IP. As said, legacy codecs are ill-defin=
ed
and we need to gather information from other maintainers of IP that support=
s it
to fill in the doc. Perhaps this is the behavior that should have been
documented, and if this is the case, the fix is simply to put that in the
documentation.

>=20
> So I tend to keep it.
>=20
>=20
> > > -		scode->need_data =3D 0;
> > > +	scode->need_data =3D 0;
> > > =C2=A0=C2=A0	if (scode->inst->total_input_count)
> > > =C2=A0=C2=A0		return 0;
> > > -	scode->need_data =3D 0;
> >=20
> > I only remember testing this once quickly on Exynos 4 and I had no clue=
 what
> > Annex G vs J was and most likley the MFC firmware was detecting it. Che=
cking
> > quickly, I'm not sure GStreamer actually support both, despite the v4l2=
 wrapper
> > pretending. I would expect one to be used in ASF/ISOMP4/AVI, and the ot=
her used
> > in MPEG Transport Stream. GStreamer does not support VC1 in MPEG TS.
> >=20
> > Have you tested this with FFMPEG ? It only maps annex G.
> >=20
> > In general, I don't mind the the change if this is correct userspace be=
havior.
> > If ffmpeg and gstreamer don't agree though, we'll have to rethink. GStr=
eamer
> > code back in the days was design in a way that it should not matter if =
the
> > header is split or not. This limitation came with lower latency decoder=
 later,
> > but none had VC1.
> >=20
> > Please test both userspace, and lets see if this solution is acceptable=
. ffmpeg
> > have ffplay and you can seek with your keyboard arrows.
> >=20
> > Nicolas
>=20
> I tested this with gstreaer, not FFMPEG,
> And I checked the gstreamer code in our repository, Then I found the
> following related code:
>=20
> =C2=A0=C2=A0 } else if (g_str_equal (mimetype, "video/x-wmv")) {
> =C2=A0=C2=A0=C2=A0=C2=A0 const gchar *format =3D gst_structure_get_string=
 (structure, "format");
> =C2=A0=C2=A0=C2=A0=C2=A0 if (format) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!g_ascii_strcasecmp (format, "WV=
C1"))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fourcc =3D V4L2_PIX_FMT_=
VC1_ANNEX_G;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else if (!g_ascii_strcasecmp (format=
, "WMV3"))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fourcc =3D V4L2_PIX_FMT_=
VC1_ANNEX_L;
> =C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
> Basically it processes WMV3 into VC1_ANNEX_L, and WVC1 to VC1_ANNEX_G.
> I didn't found them in the upstream gstreamer repository.
> Now I'm not sure if it is correct userspace behavior.

Its a little concerning, since we are in the largely untested territory. Wi=
thout
proper documentation and with all the downstream changes done to userspace,=
 we
can easily endup with NXP considering this is the right mapping and let's s=
ay
Qualcomm or Samsung thinking differently. Since this is for upstream, we ne=
ed to
ensure this is concistant. Have you reached to other driver maintainers alr=
eady
to discuss and resolve the subject in a way it works for everyone ?

>=20
> And the reason of this issue is the below code in gstreamer, that the
> v4l2decoder may only send codec data after seek.
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0 codec_data =3D self->input_state->codec_data;
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0 /* We are running in byte-stream mode, so we don=
't know the=20
> headers, but
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * we need to send something, otherwise the=
 decoder will refuse to
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * initialize.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> =C2=A0=C2=A0=C2=A0=C2=A0 if (codec_data) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gst_buffer_ref (codec_data);
> =C2=A0=C2=A0=C2=A0=C2=A0 } else {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 codec_data =3D gst_buffer_ref (frame=
->input_buffer);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 processed =3D TRUE;
> =C2=A0=C2=A0=C2=A0=C2=A0 }

That is truncating a bit too much of the context. The "processed" boolean i=
s set
when the codec data and frame is combined. In the case the codec data is on=
ly to
be found in caps, it will queue the codec data and immediately queue the fr=
ame
data. This is perfectly valid with the way the stateful decoder specificati=
on is
written.

In practice, GStreamer stateful decoder is multi-threaded, so it will fill =
the
OUTPUT queue with following frames too. What you can do to make your driver=
 more
flexible is whenever you didn't find a frame in a buffer, merge this buffer=
 with
the next one, and do that until there is no more space in one buffer. This =
way
you don't copy all the time like ring buffers do, but you can survive abitr=
ary
splits of byte-stream.

Nicolas

>=20
> Regards,
> Ming
>=20
>=20
> >=20
> > > =C2=A0=20
> > > =C2=A0=C2=A0	ret =3D vpu_malone_insert_scode_seq(scode, MALONE_CODEC_=
ID_VC1_SIMPLE, sizeof(rcv_seqhdr));
> > > =C2=A0=C2=A0	if (ret < 0)

--=-bV38p/TGIUCsdGFxL5ya
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaLci7QAKCRDZQZRRKWBy
9EucAQCDpDQ23PEiLbvrPVu582nT4syH1ECoqvI5lbtG2IxCpQD/Wi1AX61MNSaV
RP5P644O8Od9w+f8beizyYC77y9jewY=
=SB3Z
-----END PGP SIGNATURE-----

--=-bV38p/TGIUCsdGFxL5ya--

