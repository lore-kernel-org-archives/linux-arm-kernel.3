Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D82CEBF91
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 13:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/we2bgKwu4M3hgXNftrcLVJwfMxEZ3bC4SAiShLUbg=; b=jNc0Eab9P/zBuSVTo36ipdSXjV
	LX9UxV34Yh/iEXKk/unlaJoNkEeGe/bmh+HshzUbjsJY4pRz9XzsooBwlJkto9cebubBezl8UoL02
	w55i8P/WehvrZaNgY0uK7iCRuzFUlCK821cVq+JNhzub0RumLGMzPkNVeg6pSHZ0WtAKuwreZmQ0h
	2nrQNdqlsAQF/8NsAaXV8q4D/aL+6g9B+Z6ml1/WdJxQtGadbmBcS03zhriEfK0P9fKvViY7kt+Q2
	kJWJspdJPvmx+q6+4pNvdCKTiU1IE3X1xgWvT0kOg818YirdAT++XCxXxJNHrHEZEgrX2Fq3lB6vB
	6c4pPhNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKzd4-0000000GDHh-2no9;
	Mon, 17 Nov 2025 13:50:50 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKzd1-0000000GDHB-1uTF;
	Mon, 17 Nov 2025 13:50:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763387443;
	bh=kZPqi0k0MGFfxWKAZ65XVPpcfPk/d6isOabL0EwpwQ4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=SbwR21QjXr8ute5gjB2cDaqhN10GkLocN2bq79QQB4J+4F7t5MZBMsla1cGbpoyFn
	 mBm1CgzzNt9q31pO6dBSPVFqapt0WE+RORWAdXQ9jWTu/9175UIgFvjoSN6eWFCmUT
	 yU1Iqj7YXdp7ZRbJ01NNfNHBw1wj+ReVwu70rYDqU2lcHz5ZAydXio+zZvuRQ8L5Wz
	 zRtQyadV1BcOwEplo2DdO3ipILoGztiOtBle1sV7oGOU6Tcg2yNP0jSbZCYPdNHNMT
	 oEGHmJCWHSGgXNUxroxZqB1UEfaugSnOM/MPE4hDzSR34YHk/oHbzZj5X+xogvengs
	 NtwFtq5zehe4w==
Received: from [IPv6:2606:6d00:17:7b4b::5ac] (unknown [IPv6:2606:6d00:17:7b4b::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CDE9C17E0B85;
	Mon, 17 Nov 2025 14:50:40 +0100 (CET)
Message-ID: <511f43bd76f48730900207403b90566d7e6c4f07.camel@collabora.com>
Subject: Re: [PATCH v5 5/8] media: mediatek: vcodec: fix vp9 4096x2176 fail
 for profile2
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Kyrie Wu =?UTF-8?Q?=28=E5=90=B4=E6=99=97=29?= <Kyrie.Wu@mediatek.com>, 
 "linux-kernel@vger.kernel.org"	 <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org"	 <linux-mediatek@lists.infradead.org>,
 George Sun =?UTF-8?Q?=28=E5=AD=99=E6=9E=97=29?=	 <George.Sun@mediatek.com>,
 Tiffany Lin =?UTF-8?Q?=28=E6=9E=97=E6=85=A7=E7=8F=8A=29?=	
 <tiffany.lin@mediatek.com>, "nhebert@chromium.org" <nhebert@chromium.org>, 
 "linux-media@vger.kernel.org"	 <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org"	 <devicetree@vger.kernel.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>,  "hverkuil@xs4all.nl"	
 <hverkuil@xs4all.nl>, Yunfei Dong
 =?UTF-8?Q?=28=E8=91=A3=E4=BA=91=E9=A3=9E=29?=	 <Yunfei.Dong@mediatek.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,  Irui Wang
 =?UTF-8?Q?=28=E7=8E=8B=E7=91=9E=29?=	 <Irui.Wang@mediatek.com>,
 "robh@kernel.org" <robh@kernel.org>, 
 "linux-arm-kernel@lists.infradead.org"	
 <linux-arm-kernel@lists.infradead.org>, Yilong Zhou
 =?UTF-8?Q?=28=E5=91=A8=E6=98=93=E9=BE=99=29?=	 <Yilong.Zhou@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,  "krzk+dt@kernel.org"	
 <krzk+dt@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>, Andrew-CT Chen
 =?UTF-8?Q?=28=E9=99=B3=E6=99=BA=E8=BF=AA=29?=	
 <Andrew-CT.Chen@mediatek.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>
Cc: "andrzejtp2010@gmail.com" <andrzejtp2010@gmail.com>, 
 "neil.armstrong@linaro.org"
	 <neil.armstrong@linaro.org>
Date: Mon, 17 Nov 2025 08:50:39 -0500
In-Reply-To: <dea9519e6b72c12ea15760fc3bd7c7746dbfd5de.camel@mediatek.com>
References: <20251106061323.2193-1-kyrie.wu@mediatek.com>
		 <20251106061323.2193-6-kyrie.wu@mediatek.com>
		 <bd2f63265df829ec9bb3498c83126827415c2ebf.camel@collabora.com>
	 <dea9519e6b72c12ea15760fc3bd7c7746dbfd5de.camel@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-6tSADsOpIKtvYSE7Vx5O"
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_055047_677727_D88CFCF4 
X-CRM114-Status: GOOD (  27.49  )
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


--=-6tSADsOpIKtvYSE7Vx5O
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


Hi Kyrie,

make sure to reply in plain text, I know the mailing list may drop messaged=
 in HTML form.

Le lundi 17 novembre 2025 =C3=A0 07:36 +0000, Kyrie Wu (=E5=90=B4=E6=99=97)=
 a =C3=A9crit=C2=A0:
>=20
> On Thu, 2025-11-06 at 10:17 -0500, Nicolas Dufresne wrote:
> > Hi,
> >=20
> > Le jeudi 06 novembre 2025 =C3=A0 14:13 +0800, Kyrie Wu a =C3=A9crit :
> > > The dram addr of vp9 decoder tile number, which use dram mode
> > > to set tile information, may reach to 36bits for 4096x2176.
> > > It needs to get the highest 4bit of tile buffer address to
> > > set tile buffer address.
> >=20
> > An after thought, I don't see any call to
> > vb2_dma_contig_set_max_seg_size() or
> > dma_set_coherent_mask() with DMA_BIT_MASK(32)/DMA_BIT_MASK(36) in
> > this driver.
> > How do you control this ?
> >=20
> > Nicolas
>=20
> Dear Nicolas,
>=20
> The tile buffer is handled in VCP, not in kernel driver. We only
> get the full correct address in kernel.

Thank you, I could not figure-out otherwise.

Nicolas

>=20
> Thanks.
>=20
> Regards,
> Kyrie
> >=20
> > >=20
> > > Fixes: 5d418351ca8f1 ("media: mediatek: vcodec: support stateless
> > > VP9
> > > decoding")
> > >=20
> > > Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> > > Reviewed-by: AngeloGioacchino Del Regno
> > > <angelogioacchino.delregno@collabora.com>
> > > ---
> > > =C2=A0.../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c       | =
5
> > > ++++-
> > > =C2=A01 file changed, 4 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git
> > > a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_
> > > lat_if.c
> > > b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_
> > > lat_if.c
> > > index d966914db4b9..91c563c049bd 100644
> > > ---
> > > a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_
> > > lat_if.c
> > > +++
> > > b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_
> > > lat_if.c
> > > @@ -1156,7 +1156,10 @@ static int
> > > vdec_vp9_slice_setup_tile_buffer(struct
> > > vdec_vp9_slice_instance *inst
> > > =C2=A0tiles->size[i][j] =3D size;
> > > =C2=A0if (tiles->mi_rows[i]) {
> > > =C2=A0*tb++ =3D (size << 3) + ((offset << 3) &
> > > 0x7f);
> > > -*tb++ =3D pa & ~0xf;
> > > +*tb =3D pa & ~0xf;
> > > +if
> > > (IS_ENABLED(CONFIG_ARCH_DMA_ADDR_T_64BIT))
> > > +*tb |=3D (pa >> 32) & 0xf;
> > > +tb++;
> > > =C2=A0*tb++ =3D (pa << 3) & 0x7f;
> > > =C2=A0mi_row =3D (tiles->mi_rows[i] - 1) &
> > > 0x1ff;
> > > =C2=A0mi_col =3D (tiles->mi_cols[j] - 1) &
> > > 0x3f;
>=20
> ************* MEDIATEK Confidentiality Notice
> =C2=A0********************
> The information contained in this e-mail message (including any=20
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be=20
> conveyed only to the designated recipient(s). Any use, dissemination,=20
> distribution, printing, retaining or copying of this e-mail (including it=
s=20
> attachments) by unintended recipient(s) is strictly prohibited and may=
=20
> be unlawful. If you are not an intended recipient of this e-mail, or beli=
eve
> =C2=A0
> that you have received this e-mail in error, please notify the sender=20
> immediately (by replying to this e-mail), delete any and all copies of=
=20
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!

--=-6tSADsOpIKtvYSE7Vx5O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaRsoLwAKCRDZQZRRKWBy
9FEEAP0QmN9fJMwFd/HLagqwIalTR2GPmwLUWA8dX94WrKm9ewEAypyL1RO/CPwW
/H199X9i5A2iH2yPuMNCmEkyJtON5AQ=
=1SZz
-----END PGP SIGNATURE-----

--=-6tSADsOpIKtvYSE7Vx5O--

