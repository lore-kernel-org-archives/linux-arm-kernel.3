Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8637ACA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 19:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dBbW/Af9JyOq7fC+BYgb7Nc2xudAl0q/Zwi8i5ytUFk=; b=FrK5+7xlnaRyDDMHQDPLyKodOm
	gVqCah33J+UG00Dg+GJ4Tvaydbq0d/jpCFUYuMMSgEw2MRzZQ+7Pm91ScqoWrnDTO8aqN60nQQ2WV
	qVgr4DHWr+GI1HoGZuo8NenV9hFb81BnWdZJ3JzqShwTJziV0eaIPDG9gMaf9Yh2RUzxtLw8yFWpC
	9PtcQGXiU9sYZVL/u6f5VftBs01+MvOqWr1KybqRX9LmNxCV4xpv8K0VXoA7ovCH5BzijmP1fXD5W
	5VgxovrIvJjcZlle29LnX7y7WX77LqZv9cL+4d2/gXeWgNy75i1UJircJikvEcin/ISYPyF1qCl7N
	oqy3slOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWNV-00000001Z2Y-3SiT;
	Tue, 02 Sep 2025 19:09:13 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQaF-0000000HTNS-0bb0;
	Tue, 02 Sep 2025 12:58:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756817877;
	bh=PU4Bzgg+nJ15hff/4hvbjW8eUcg1SWaXB9umh0D23so=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=PGgDN+h1bZerGMRc1RYUUG48WwEewrEM9Bnz6867eTgQr1oT1hufzWJIFxM62vz1k
	 NS1yLgW3taeEsty5lRDeNwoZUkvRIu/OZ+QDR6140UfEtJt/ZAMeLc2pUMwKI/tjPt
	 HtTaftwpdmdscoCCzsUkxbt6Ul7sWC3OKUOjGSP0KZXjnFnhQtQ0h26Z/lLU+YAM6x
	 KeDvVq0QZi02QGo9BEMGysevY/yp9wTmowGi8fzw6ahby/ieIiytl74tztvQxw8H1I
	 Bp3csuNvWGzO35xfuqB/xkGBwab1jHeYq+vmZnQs/phoGb9sbk3hnIDMuAL2g+Yf5k
	 L+XrYDbfx87KA==
Received: from [IPv6:2606:6d00:11:5a76::5ac] (unknown [IPv6:2606:6d00:11:5a76::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9FBD317E129F;
	Tue,  2 Sep 2025 14:57:55 +0200 (CEST)
Message-ID: <005438a1d81a1d02d6c8659bd951ff65d3f39d85.camel@collabora.com>
Subject: Re: [PATCH v2] media: mediatek: encoder: Fix uninitialized scalar
 variable issue
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Irui Wang =?UTF-8?Q?=28=E7=8E=8B=E7=91=9E=29?= <Irui.Wang@mediatek.com>,
  "rongqianfeng@vivo.com"	 <rongqianfeng@vivo.com>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>,  "mchehab@kernel.org"	 <mchehab@kernel.org>,
 AngeloGioacchino Del Regno	 <angelogioacchino.delregno@collabora.com>,
 "hverkuil-cisco@xs4all.nl"	 <hverkuil-cisco@xs4all.nl>
Cc: "linux-arm-kernel@lists.infradead.org"
	 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org"
	 <linux-media@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	 <linux-mediatek@lists.infradead.org>, Longfei Wang
 =?UTF-8?Q?=28=E7=8E=8B=E9=BE=99=E9=A3=9E=29?=
	 <Longfei.Wang@mediatek.com>, Project_Global_Chrome_Upstream_Group
	 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Yunfei Dong
 =?UTF-8?Q?=28=E8=91=A3=E4=BA=91=E9=A3=9E=29?=
	 <Yunfei.Dong@mediatek.com>
Date: Tue, 02 Sep 2025 08:57:54 -0400
In-Reply-To: <dbfac6888a2c77c302265df2f90bf4aec8bed686.camel@mediatek.com>
References: <20250716071450.8214-1-irui.wang@mediatek.com>
		 <c751e015c0a9fb2ab6514a45952e01424cfbb0cb.camel@collabora.com>
	 <dbfac6888a2c77c302265df2f90bf4aec8bed686.camel@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-F1/z1Y8k8JEbWKEC/4LA"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_055759_330363_7AC9BA73 
X-CRM114-Status: GOOD (  29.68  )
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


--=-F1/z1Y8k8JEbWKEC/4LA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 01 septembre 2025 =C3=A0 02:37 +0000, Irui Wang (=E7=8E=8B=E7=91=
=9E) a =C3=A9crit=C2=A0:
> Dear Nicolas,
>=20
> Thanks for your comments.
>=20
> On Fri, 2025-08-29 at 15:10 -0400, Nicolas Dufresne wrote:
> > Le mercredi 16 juillet 2025 =C3=A0 15:14 +0800, Irui Wang a =C3=A9crit =
:
> > > UNINIT checker finds some instances of variables that are used
> > > without being initialized, for example using the uninitialized
> > > value enc_result.is_key_frm can result in unpredictable behavior,
> > > so initialize these variables after declaring.
> > >=20
> > > Fixes: 4e855a6efa54 ("[media] vcodec: mediatek: Add Mediatek V4L2
> > > Video
> > > Encoder Driver")
> > >=20
> > > Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> > > ---
> > > v2:
> > > =C2=A0- Add Fixes tag, update commit message
> > > =C2=A0- Remove unnecessary memset
> > > =C2=A0- Move memset to before the first usage
> > > ---
> > > =C2=A0.../media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c=C2=
=A0=C2=A0 | 4
> > > +++-
> > > =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git
> > > a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
> > > b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
> > > index a01dc25a7699..3065f3e66336 100644
> > > ---
> > > a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
> > > +++
> > > b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
> > > @@ -865,7 +865,7 @@ static void vb2ops_venc_buf_queue(struct
> > > vb2_buffer *vb)
> > > =C2=A0static int vb2ops_venc_start_streaming(struct vb2_queue *q,
> > > unsigned int
> > > count)
> > > =C2=A0{
> > > =C2=A0	struct mtk_vcodec_enc_ctx *ctx =3D vb2_get_drv_priv(q);
> > > -	struct venc_enc_param param;
> > > +	struct venc_enc_param param =3D { 0 };
> > > =C2=A0	int ret;
> > > =C2=A0	int i;
> > > =C2=A0
> > > @@ -1036,6 +1036,7 @@ static int mtk_venc_encode_header(void *priv)
> > > =C2=A0			=C2=A0 ctx->id, dst_buf->vb2_buf.index, bs_buf.va,
> > > =C2=A0			=C2=A0 (u64)bs_buf.dma_addr, bs_buf.size);
> > > =C2=A0
> > > +	memset(&enc_result, 0, sizeof(enc_result));
> >=20
> > Please, apply review comment to all occurrence, so same here.
> >=20
> > > =C2=A0	ret =3D venc_if_encode(ctx,
> > > =C2=A0			VENC_START_OPT_ENCODE_SEQUENCE_HEADER,
> > > =C2=A0			NULL, &bs_buf, &enc_result);
> > > @@ -1185,6 +1186,7 @@ static void mtk_venc_worker(struct
> > > work_struct *work)
> > > =C2=A0			=C2=A0 (u64)frm_buf.fb_addr[1].dma_addr,
> > > frm_buf.fb_addr[1].size,
> > > =C2=A0			=C2=A0 (u64)frm_buf.fb_addr[2].dma_addr,
> > > frm_buf.fb_addr[2].size);
> > > =C2=A0
> > > +	memset(&enc_result, 0, sizeof(enc_result));
> >=20
> > Same here.
> >=20
> > > =C2=A0	ret =3D venc_if_encode(ctx, VENC_START_OPT_ENCODE_FRAME,
> > > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 &frm_buf, &bs_buf, &enc_result);
> > > =C2=A0
> > >=20
> >=20
> >=20
> > Would be nice to coordinate with Qianfeng Rong <rongqianfeng@vivo.com
> > > [0], he
> > ported the entire driver to this initialization method, which is
> > clearly the way
> > to go.
> >=20
> > - Patch 1 will port the driver to {} stack init
> > - Patch 2 will add missing initializes
> >=20
> > Consistency is key for this type of things since developer usually
> > follow the
> > surrounding style.
>=20
> I have learned Qianfeng's patch and comments. I understand what you
> mean is change my patch coding style to Qianfeng's, modify 'memset' to
> '{}' for initialization, and amend Qianfeng's patch as patch-2, then
> send this two patches together.

Correct, and I don't mind who do that work, I'd like to see the code kept
consistant. And I do agree memset() are error prone.

cheers,
Nicolas

>=20
> If I misunderstood your opinion, please correct me, thank you very
> much.
>=20
> Best Regards
> >=20
> > regards
> > Nicolas
> >=20
> > [0]=20
> > https://patchwork.linuxtv.org/project/linux-media/patch/20250803135514.=
118892-1-rongqianfeng@vivo.com/

--=-F1/z1Y8k8JEbWKEC/4LA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaLbp0gAKCRDZQZRRKWBy
9AMIAP4l3zEJdQyeftn4RgftFIHQz0eEqpSztnAbK553WME3KgEAzYyheCs4BblM
WmNV6SRGwHH6Q1/P7PRqOpIuIa1QNwc=
=V/iG
-----END PGP SIGNATURE-----

--=-F1/z1Y8k8JEbWKEC/4LA--

