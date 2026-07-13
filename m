Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D81C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 19:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zVr5u6e7y9H/vD3P6/LUuDFZJZwZSkv3vOu9uj8QLtY=; b=P1iHatWrV4gL4cXBkqPuKvXB6i
	cgFrNEXGcBJl7bZrYSuCiXNNXO9tEM0R/0wcIJA1JQRvYG4h4bfRuCeO1/dKWQzj5elJ/LW2+A9Q+
	7V2QaNA2wVceaFItceXrk9LFuRWmmv6eDW8J/tXigQJyVu+24vvHImL0dj0777k0WofQIVCnhIETG
	KUR0zqWG1OaHzBDVf3HEKU5Xib5azBhUKF8ALstb5AnfaBrgxs7RoWjYKyRh/4VoRkwakA+ppRkf8
	qs9dHI4tes8MX2zVDZM6U36IhQJLG5R3I6/HY/30pQa0j46YlhnNpFsEjplJNPPJjzGXWfiS1ThmD
	7/Y6KEuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjMM0-0000000AIHp-127w;
	Mon, 13 Jul 2026 19:30:12 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjMLx-0000000AIH6-2eXn;
	Mon, 13 Jul 2026 19:30:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783971006;
	bh=YaEH+sl/++U2KbZvN4eiZqs9bHWOU336+JmOrpgozYQ=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=LFT6WccO0ftRGWJ9jGraUGIKoDH4M7Rdo+hbethvPXdu9vANpNXZQQTyBUVWrmeiq
	 8aEYb/WNDwQMr0XUwzfipZLO4B7y+Cuq2l8fD4nKpgUM0zLiJpPl6A7oAVbXVo2rT4
	 QBwiddJ44BUvrFLnDdv9ARuw2WB02dskycB2h6cnxtlKj5GHm6gfVcQsrVioOHnmUD
	 zlMyDFPGDJ4kRNPfjc3HK2H10VNxvAhHdni9EEyq0Gf8kCegAZgmAYpJT/gXO1tY2+
	 cFqgsRfJggeW1P3Jb79RluJZFjrqmNnH2wcZH3Fip/J6tqmSDqTriEwymekVzWBY8o
	 pf4XnYlLAcvTA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1A77A17E07A2;
	Mon, 13 Jul 2026 21:30:04 +0200 (CEST)
Message-ID: <6ddf0799abbd5f61cca887d8474357cd9ec6b904.camel@collabora.com>
Subject: Re: [PATCH v15 04/12] media: mediatek: jpeg: Fix buffer completion
 on multi-core streaming stop
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Mon, 13 Jul 2026 15:30:03 -0400
In-Reply-To: <20260702072614.10373-5-kyrie.wu@mediatek.com>
References: <20260702072614.10373-1-kyrie.wu@mediatek.com>
	 <20260702072614.10373-5-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-sAK8CIaYG2enlEegvh5c"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_123009_826136_D813D966 
X-CRM114-Status: GOOD (  16.26  )
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


--=-sAK8CIaYG2enlEegvh5c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 02 juillet 2026 =C3=A0 15:26 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
> Enhances the Mediatek JPEG driver's stability and reliability by ensuring
> that all queued buffers are processed before stopping the streaming in
> multi-core environments. It introduces a call to
> `vb2_wait_for_all_buffers()` in the `mtk_jpeg_enc_stop_streaming()` and
> `mtk_jpeg_dec_stop_streaming()` functions when the `multi_core` variant
> is enabled. This change ensures that no buffers are left unprocessed,
> preventing potential data loss or corruption during multi-core flow.
>=20
> Fixes: 0fa49df4222f ("media: mtk-jpegdec: support jpegdec multi-hardware"=
)
> Fixes: dedc21500334 ("media: mtk-jpegdec: add jpeg decode worker interfac=
e")
> Fixes: 934e8bccac95 ("mtk-jpegenc: support jpegenc multi-hardware")
> Fixes: 5fb1c2361e56 ("mtk-jpegenc: add jpeg encode worker interface")
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collaboraa.com>

> ---
> =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 8 ++++++++
> =C2=A01 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 6d6a999a22fc..76a5b49b7f43 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -850,8 +850,12 @@ static struct vb2_v4l2_buffer *mtk_jpeg_buf_remove(s=
truct
> mtk_jpeg_ctx *ctx,
> =C2=A0static void mtk_jpeg_enc_stop_streaming(struct vb2_queue *q)
> =C2=A0{
> =C2=A0	struct mtk_jpeg_ctx *ctx =3D vb2_get_drv_priv(q);
> +	struct mtk_jpeg_dev *jpeg =3D ctx->jpeg;
> =C2=A0	struct vb2_v4l2_buffer *vb;
> =C2=A0
> +	if (jpeg->variant->multi_core)
> +		vb2_wait_for_all_buffers(q);
> +
> =C2=A0	while ((vb =3D mtk_jpeg_buf_remove(ctx, q->type)))
> =C2=A0		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);
> =C2=A0}
> @@ -859,6 +863,7 @@ static void mtk_jpeg_enc_stop_streaming(struct vb2_qu=
eue
> *q)
> =C2=A0static void mtk_jpeg_dec_stop_streaming(struct vb2_queue *q)
> =C2=A0{
> =C2=A0	struct mtk_jpeg_ctx *ctx =3D vb2_get_drv_priv(q);
> +	struct mtk_jpeg_dev *jpeg =3D ctx->jpeg;
> =C2=A0	struct vb2_v4l2_buffer *vb;
> =C2=A0
> =C2=A0	/*
> @@ -866,6 +871,9 @@ static void mtk_jpeg_dec_stop_streaming(struct vb2_qu=
eue
> *q)
> =C2=A0	 * Before STREAMOFF, we still have to return the old resolution an=
d
> =C2=A0	 * subsampling. Update capture queue when the stream is off.
> =C2=A0	 */
> +	if (jpeg->variant->multi_core)
> +		vb2_wait_for_all_buffers(q);
> +
> =C2=A0	if (ctx->state =3D=3D MTK_JPEG_SOURCE_CHANGE &&
> =C2=A0	=C2=A0=C2=A0=C2=A0 V4L2_TYPE_IS_CAPTURE(q->type)) {
> =C2=A0		struct mtk_jpeg_src_buf *src_buf;

--=-sAK8CIaYG2enlEegvh5c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalU8vAAKCRDZQZRRKWBy
9Cy5AP9n42DuX4zEUCFgIslkPa3bEp3mdcOqxJM4I+Y0Pg/aoQEAyxC9bVWM44W5
n2FCQ95QPy/I0qU84CiPfIsGgikv8Q8=
=TU2N
-----END PGP SIGNATURE-----

--=-sAK8CIaYG2enlEegvh5c--

