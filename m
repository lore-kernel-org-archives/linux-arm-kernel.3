Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1D7EA3C4E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 14:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/dOCoXR/BIaPPH1w7O2kETxsTWNWN7qd8IojQgTyJhQ=; b=znY/7AbWtO4mxSQEbiXbvKe6aP
	Sednb/YdS2A2lOXnlnlISwRHr32+IImxVdbWXkgAyJoJ0+Kvs+aOGZrx74JwE22MQ6m8wURr5C0nm
	CNRUiA4sQhajNyr5VtZgOkFmvNdS0guQVR9p71knqzwdHMmtPa835CXFx1yomUySjU6j2u7IwcYHm
	aQD5FG9Pbhb1s89Jh60y/yl22WdalWEvU7ObxZDm2ojRVUVoAyRwYB7R6z+Ul0I4EWIGE5o5DhUgX
	D37r/ZwmSzC+loMlWX+7mdAmTd2NcF/9g4sLVu05reJ6esgiYSR4U900UxQ9cxyb+3o/yWZne6LvH
	xEd5lioA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wApva-0000000Ad41-1H5a;
	Thu, 09 Apr 2026 14:00:14 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wApvX-0000000Ad3Y-3qJi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 14:00:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1775743210;
	bh=B8fwvgNnvRGjqGk8YAfZIublWhDSuuUrXR7/fOnm9l4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=oZFZtNZjETCG6c56IANDbmYwYum3U/7yg2oVTddnj6JzGPQuUIpm/vYg9GVyV18RC
	 z+7hnRgNWjpvKRQjN3QJS25oBKc8dR4+lwhg8nX8pXovt9q4dWY2P15yWIMd6U+J9e
	 +3cJgrgAVEOM8C8E+l/XZ5B4JdY70Djp/7ejeCxfziGqK7iPWuF08kOVTBewfRAr38
	 ZjFzGKMtsOezRXgL9UFanszBVnBpUnm44HBMDb/miY3LCSYIgqZ6DkH+S6Welskm3P
	 FB1phC7hI1vQWvrUfmMqcIhaPh/r0Y/T1WEv58491HeMGScCDEF4OCPbroTKUBMvxb
	 +sk4U7DjjG7kw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 57F7217E0C83;
	Thu,  9 Apr 2026 16:00:08 +0200 (CEST)
Message-ID: <4bd5d70a6144f3e8d4356c182f314cf735f1921c.camel@collabora.com>
Subject: Re: [PATCH] media: cedrus: skip invalid H.264 reference list entries
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Paul Kocialkowski <paulk@sys-base.io>, Pengpeng Hou
 <pengpeng@iscas.ac.cn>
Cc: mripard@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Thu, 09 Apr 2026 10:00:06 -0400
In-Reply-To: <adeqkmA9VhaPkSAk@shepard>
References: <20260324080856.56787-1-pengpeng@iscas.ac.cn>
	 <adeqkmA9VhaPkSAk@shepard>
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
	protocol="application/pgp-signature"; boundary="=-3FDE3LWulaPD+K6yFrZS"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_070012_104013_64441C91 
X-CRM114-Status: GOOD (  30.15  )
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


--=-3FDE3LWulaPD+K6yFrZS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 09 avril 2026 =C3=A0 15:33 +0200, Paul Kocialkowski a =C3=A9crit=
=C2=A0:
> Hi,
>=20
> On Tue 24 Mar 26, 16:08, Pengpeng Hou wrote:
> > Cedrus consumes H.264 ref_pic_list0/ref_pic_list1 entries from the
> > stateless slice control and later uses their indices to look up
> > decode->dpb[] in _cedrus_write_ref_list().
> >=20
> > Rejecting such controls in cedrus_try_ctrl() would break existing
> > userspace, since stateless H.264 reference lists may legitimately carry
> > out-of-range indices for missing references. Instead, guard the actual
> > DPB lookup in Cedrus and skip entries whose indices do not fit the fixe=
d
> > V4L2_H264_NUM_DPB_ENTRIES array.
>=20
> Could you explain why it is legitimate that userspace would pass indices =
that
> are not in the dpb list? As far as I remember from the H.264 spec, the L0=
/L1
> lists are constructed from active references only and the number of items
> there
> should be given by num_ref_idx_l0_active_minus1/num_ref_idx_l1_active_min=
us1.
> We can tolerate invalid data beyond these indices, but certainly not as p=
art
> of the indices that should be valid.
>=20
> However I agree that cedrus_try_ctrl is maybe not the right place to chec=
k it
> since I'm not sure we are guaranteed that the slice params control will b=
e
> checked before the new DPB (from the same request) is applied, so we migh=
t end
> up checking against the dpb from the previous decode request.
>=20
> But I think we should error out and not just skip the invalid reference.

Its been a long time I haven't looked into this. But what happens here is t=
hat
once you lost a reference, the userspace DPB will hold a gap picture, which=
 as
no backing storage. Since it has no backing storage, there is no cookie
(timestamp) associated with it. This gap picture will still make it to the
reference lists, since the position of the reference in the list is importa=
nt
(you cannot just remove an item). It is an established practice in userspac=
e to
simply fill the void with an invalid index, typically 0xff, which is always
invalid. Because that's what some userspace do, it became part of our ABI.

Decoders are expected be fault tolerant, though the tolerance level is hard=
ware
specific, and so failing in the common code would be inappropriate (failing=
 in
Cedrus could be acceptable, assuming it can't work with missing references,
which the implementation seems to be fine with).

Hantro G1 notably have a flag to report missing reference to the HW, and it=
 will
manage concealement internally. G2/RKVDEC don't, and we try and pick the mo=
st
recent frame as a replacement backing storage, which most of the time minim=
ises
the damages.

As future refinement, we need drivers in the long term to properly report t=
he
damages (perhaps through additional RO request controls). As discussed few =
years
ago in the error handling wip for rkvdec, the V4L2 doc specify that any sor=
t of
damages known to exist in a frame shall results in the ERROR flag being set=
. We
can deduce that the error flag with a payload of 0 indicates to userspace t=
o not
use the frame (which typically happen on hard errors, or errror at entropy
decode staged) and ERROR flag with a correct payload signal some level of
corruption, and its left to the application to decide what to do.

Nicolas

>=20
> All the best,
>=20
> Paul
>=20
> >=20
> > This keeps the fix local to the driver use site and avoids out-of-bound=
s
> > reads from malformed or unsupported reference list entries.
> >=20
> > Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> > ---
> > =C2=A0drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 3 +++
> > =C2=A01 file changed, 3 insertions(+)
> >=20
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > @@ -210,6 +210,9 @@ static void _cedrus_write_ref_list(struct cedrus_ct=
x
> > *ctx,
> > =C2=A0		u8 dpb_idx;
> > =C2=A0
> > =C2=A0		dpb_idx =3D ref_list[i].index;
> > +		if (dpb_idx >=3D V4L2_H264_NUM_DPB_ENTRIES)
> > +			continue;
> > +
> > =C2=A0		dpb =3D &decode->dpb[dpb_idx];
> > =C2=A0
> > =C2=A0		if (!(dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
> > --=20
> > 2.50.1
> >=20

--=-3FDE3LWulaPD+K6yFrZS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCadew5gAKCRDZQZRRKWBy
9DA3AQDP1OoslDZaw1oda/B3Z7rrqJ2oR+m7355nEPvJvI6hcAEAuiRlAxylgLTg
Q5RUipO5luAc4w0vPPAg//gxQ4B44gg=
=1SVv
-----END PGP SIGNATURE-----

--=-3FDE3LWulaPD+K6yFrZS--

