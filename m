Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCAFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 19:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CJJJUb+0KXyvnArO5JZGKcENFf9sIlMFz2vTfW+st+A=; b=d9aKN93Ud5wTWgZZHvvCYlTcSw
	TnwG8VZkj3+LqgVIus0GQV+HfZ8gUHpoBiYSzvAIhVRohmQ1uzAmIs99PvV3h2WIRdz1e1CFAIFa1
	VwsdV1LjJwlkesTXTnnTbN82i+4rKTqpsKoEJBcrEBSEPBPWSC5VleKntuDK23fzn6eLgCdaxfKrs
	qxSPtBvAZ0IXbaowhdirsb6DGxjso4thXCmqFmAGjZB0vE6OiY1mFDxaQtM/xRwAIv7T591uBa45J
	tRAncyQPC9RgrK2orbaoyPGFL2fCERh3wGo4OG4396yo/acS0BntRVTO4tkyW4kUIBbqtwBRAToJ0
	aga73HaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjMnC-0000000AKiv-1xab;
	Mon, 13 Jul 2026 19:58:18 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjMn9-0000000AKi6-01jV;
	Mon, 13 Jul 2026 19:58:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783972692;
	bh=YWJDCyT186dHX81KVVE+O5xBOZa9fYqrWM9YYEL3dk0=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=O6etSBjVtAmdzcSxXi/mkCykAKcecNb3kPZtUgRfa628X6uT+6uvaZgXFuH8uu6PG
	 954tufeuMi5vJz9jl9JO/gFQoVA2TzGIC5AgLbP76FqcMcrRlOCQ+0s1PcqczhnoSs
	 bzRbAq4l79Ok8eVXa3MeOwm4+zN9SEV8BfciT3r/SnBPsBe5e5ikoirtEqjM4RKcfS
	 5M2kInrA5nur0gRlcipsacU2af7FZcjzVZ3JBkNntiE16ZSencGlgn8JZfVbZl3Z1t
	 kmaR6xjeJcIBgzwLXL0Y4V/RjV8apS0rzchDnws3KIVrUdP09MJ1EdyvSY/0m3zvMP
	 rGPQ7RT3uDoTw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 94AB017E02BA;
	Mon, 13 Jul 2026 21:58:10 +0200 (CEST)
Message-ID: <cf949589ca13c1206724c5dbaaa441bed4e163e9.camel@collabora.com>
Subject: Re: [PATCH v15 06/12] media: mediatek: jpeg: fix decoding buffer
 number setting timing issue
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Mon, 13 Jul 2026 15:58:08 -0400
In-Reply-To: <20260702072614.10373-7-kyrie.wu@mediatek.com>
References: <20260702072614.10373-1-kyrie.wu@mediatek.com>
	 <20260702072614.10373-7-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-+eCo3b9gsBb1UHx9JQhS"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_125815_205586_4AB794A5 
X-CRM114-Status: GOOD (  17.59  )
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


--=-+eCo3b9gsBb1UHx9JQhS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 02 juillet 2026 =C3=A0 15:26 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
> The src buffer doesn't need set information and dst buf parameters
> only need to set when the power set succussed and protect the

Can you rework this, I'm not sure I understand what you are trying to say.

> setting by spinlock ensuring that any later operations acting
> on this buffer reflect accurate state and frame data.
>=20
> Fixes: dedc21500334 ("media: mtk-jpegdec: add jpeg decode worker interfac=
e")
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---
> =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c=C2=A0=C2=A0 | =
9 +++------
> =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c | 1 +
> =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c | 1 +
> =C2=A03 files changed, 5 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 89048aba8dca..4dc574e03bd5 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1734,7 +1734,6 @@ static void mtk_jpegdec_worker(struct work_struct *=
work)
> =C2=A0
> =C2=A0	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
> =C2=A0	jpeg_src_buf =3D mtk_jpeg_vb2_to_srcbuf(&src_buf->vb2_buf);
> -	jpeg_dst_buf =3D mtk_jpeg_vb2_to_srcbuf(&dst_buf->vb2_buf);
> =C2=A0
> =C2=A0	if (mtk_jpeg_check_resolution_change(ctx,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 &jpeg_src_buf->dec_param)) {
> @@ -1743,11 +1742,6 @@ static void mtk_jpegdec_worker(struct work_struct =
*work)
> =C2=A0		goto getbuf_fail;
> =C2=A0	}
> =C2=A0
> -	jpeg_src_buf->curr_ctx =3D ctx;
> -	jpeg_src_buf->frame_num =3D ctx->total_frame_num;
> -	jpeg_dst_buf->curr_ctx =3D ctx;
> -	jpeg_dst_buf->frame_num =3D ctx->total_frame_num;
> -
> =C2=A0	mtk_jpegdec_set_hw_param(ctx, hw_id, src_buf, dst_buf);
> =C2=A0	ret =3D pm_runtime_resume_and_get(comp_jpeg[hw_id]->dev);
> =C2=A0	if (ret < 0) {
> @@ -1772,6 +1766,9 @@ static void mtk_jpegdec_worker(struct work_struct *=
work)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(MTK_JPEG_HW_TIME=
OUT_MSEC));
> =C2=A0
> =C2=A0	spin_lock_irqsave(&comp_jpeg[hw_id]->hw_lock, flags);

I didn't dig very deep, but in extreme case, the timeout worker (hidden abo=
ve)
could be called concurrently to the remaining of this code, which gives me =
the
impression everything would be left in a unstable state since that spinlock=
 is
not being held by the timeout worker. Perhaps something to improve further =
?

This is a step in the right direction for sure, so for this patch:

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> +	jpeg_dst_buf =3D mtk_jpeg_vb2_to_srcbuf(&dst_buf->vb2_buf);
> +	jpeg_dst_buf->curr_ctx =3D ctx;
> +	jpeg_dst_buf->frame_num =3D ctx->total_frame_num;
> =C2=A0	ctx->total_frame_num++;
> =C2=A0	mtk_jpeg_dec_reset(comp_jpeg[hw_id]->reg_base);
> =C2=A0	mtk_jpeg_dec_set_config(comp_jpeg[hw_id]->reg_base,
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> index 9a8dbca6af00..e4d2c5d4ec73 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> @@ -513,6 +513,7 @@ static void mtk_jpegdec_put_buf(struct mtk_jpegdec_co=
mp_dev *jpeg)
> =C2=A0				v4l2_m2m_buf_done(&tmp_dst_done_buf->b,
> =C2=A0						=C2=A0 VB2_BUF_STATE_DONE);
> =C2=A0				ctx->last_done_frame_num++;
> +				break;
> =C2=A0			}
> =C2=A0		}
> =C2=A0	}
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> index 5d1c217fea0f..2adea3aca50b 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> @@ -242,6 +242,7 @@ static void mtk_jpegenc_put_buf(struct mtk_jpegenc_co=
mp_dev *jpeg)
> =C2=A0				v4l2_m2m_buf_done(&tmp_dst_done_buf->b,
> =C2=A0						=C2=A0 VB2_BUF_STATE_DONE);
> =C2=A0				ctx->last_done_frame_num++;
> +				break;
> =C2=A0			}
> =C2=A0		}
> =C2=A0	}

--=-+eCo3b9gsBb1UHx9JQhS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalVDUAAKCRDZQZRRKWBy
9ErRAQCeOKVNMHSoVQWdtAOdSHr7nFSY8kQ3qswexzAWQS4Y+gD9GGe9PN7D0YKg
lSbELCzmu3axHR6kr7PSTY6wQqhezAg=
=PL/X
-----END PGP SIGNATURE-----

--=-+eCo3b9gsBb1UHx9JQhS--

