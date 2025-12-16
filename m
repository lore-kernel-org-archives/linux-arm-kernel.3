Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D2FD637BD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 21:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GtO3mBnlJngwwd/+oPp34lwyxlbeQ/BrynEuE59imH0=; b=s5GnRotVywa4c2VnqmeX7B95vI
	L53UOnRmzkGMG57kxbx3QcWiTxS8nxcb3hagQczwb1MK/TNTbz6ma268X1e4bdyb403RHrvhinr2z
	CU0mhwjq5hHYh03uNgEZHEl30Zz/0dIIlmSYRVa+M13LJwe6gxpYA6aqQMkYiwZocog7h6oite5ct
	u0LUaeTgOj8N+lWbwxLp6NM25tG2pP9HyU435wwTB1USi5OPT15tte/4Pfin8gFvYHBYru4oQGA4U
	iFD4bgBmeEYxe2gX0EL6pc3vaiPrKlfYNKOjfT8bqm2Hxdm0sdyV6Ht3PwMC7Erp0Cm9noYt/BWD9
	0acTZ7iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVcjH-00000005qkL-0CC8;
	Tue, 16 Dec 2025 21:37:11 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVcjE-00000005qjY-39KL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 21:37:09 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-8b2d32b9777so747539985a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 13:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1765921027; x=1766525827; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GtO3mBnlJngwwd/+oPp34lwyxlbeQ/BrynEuE59imH0=;
        b=CNz/IzldSmRKvTMfKsZ+ytIK9B0tF7EU/gnxnVIikxRx4m55H9rxcRAy4ZJTYmLjFg
         mQKGiWgqry3TX3x0VDdFy5SvMDWWcSc0mcZV5zlFEYGzxhln3BOH2enszfNmxQJWbJG7
         W7Xel5y9/07kh4i0sCz/UDTjD6bek4owkyTC2G0NW2b9EAnVoQdtHFtnCifufmTpDgiv
         ckmijGG8DP8rqBe6tHSY9/X9M7mZcWGYnv+A1U3Ym7KAT9nQEtbAK3+YFPirkIcnhKCg
         0cKUygt0QhBpQ3Xcc/Gc+X37aFmq1PKnMbY/HegmfA6dtGcyjz43cKKHl2yPWVagU0sr
         DpGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765921027; x=1766525827;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GtO3mBnlJngwwd/+oPp34lwyxlbeQ/BrynEuE59imH0=;
        b=ZU/CAF+SFNGOptoOBzOS6E7K1Ic1i3A1os6d1+TFYqY7Dw5hlW1S/jhuAmyYbNC4ZF
         BjVmFZvgwi3qwGkMp2cd2VHvWFB5Vavkmeh8lbAMVyp8VaFgEM/gEtYlcabBI9qiQNAO
         WPy625LsHZkeq+6mwqdoypdJqZEUw/+DFF+ww3f3YOHkNG2NjfEeMiYMDC2NGGKEZnWt
         eXrdXqFebDzIAcF5Hwe83giWIDZDSFjsayVxClsCUvd3nFBCOQ+aZie77kwJDDK3uk7r
         AeHA3x57mj6iW+S1jt6sZBwln/a5NlLsPhgv6FQfFg9ZMMliDjthELmeGU1c05hHa3yp
         lq7A==
X-Forwarded-Encrypted: i=1; AJvYcCWH0H0WE5lk1F025wwZYTgKY2HDsRgNcm56uqA9lWQrpOkVBjdVXEAOIYb7pCL1NaOPUG6LL1dmdIbII8X3xNri@lists.infradead.org
X-Gm-Message-State: AOJu0YxrmFWWUZx+30wT+nOaG4YIv5hQ48sS3++8wgM5aQ5/r4Il8Ei9
	9bXMhHWpPScDmwY+FKOb8DLlaRwTX6wMD6WdWBB/7y1nNM5elqILVF1y6pU/TeW/ss4E3cBZT0b
	n79LJ+dA=
X-Gm-Gg: AY/fxX5kHjxpL29lorM2wxJSuTzSA162DglS+Rzgs/y93MV/gqes8gQuiEHimVXvPGF
	Q9BWNyXLy0/tGf2WiZeyDVsHf+9ldYikcRn1/O86VOBfgXkTWHWTz9IN5v2EZJ20Qodae6fAGii
	6bcsYk7WrrPg2Qb3v3LZmj0KobbGmpZ4s8WvGEnRzzkXv0yPgBFtH03DfLSJCIVs87BwXc4t1wH
	crfW9Ktk1zA0QnvH2BsFL4XSTauDb3BPUeW6WiA9h/00foJHwqcAxJHEM3p6IzP6JNBD1lqH6zJ
	98JZI3o8sXmY3y6co/wApWUWg4O03ndPbM2wfBhcI4Q3rVmkE0+gFcPR0XH8y5p9TRSsS5wl2Ut
	5FmCNyMSak1W+TNZ2wd+UlWMRX5Oz6WxzPtjDGoQ4l3FMNO0TDWMnaqdRB/iyCtmVKMsBFo9Tz+
	P/dX3Dl51KUljKa1Ux
X-Google-Smtp-Source: AGHT+IFZ5TNFfy7xbJTH9G96PLJ3apFSZllZ5dKBvddlWXLy4lM0DJZEKU1hmri8DCWd/YG4FoqsFw==
X-Received: by 2002:a05:620a:4002:b0:84a:5f9d:a30c with SMTP id af79cd13be357-8bb3a37660emr2397868585a.63.1765921027539;
        Tue, 16 Dec 2025 13:37:07 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8be30c91bfasm265781385a.12.2025.12.16.13.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 13:37:06 -0800 (PST)
Message-ID: <043630a657ff5403b74202f6a856ff4bcfc6a192.camel@ndufresne.ca>
Subject: Re: [PATCH v11 06/12] media: mediatek: jpeg: fix decoding buffer
 number setting timing issue
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Tue, 16 Dec 2025 16:37:05 -0500
In-Reply-To: <20251202094800.6140-7-kyrie.wu@mediatek.com>
References: <20251202094800.6140-1-kyrie.wu@mediatek.com>
	 <20251202094800.6140-7-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-LOhQi3igSxhC90HVoS+h"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_133708_792595_67DF68DE 
X-CRM114-Status: GOOD (  16.11  )
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


--=-LOhQi3igSxhC90HVoS+h
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 02 d=C3=A9cembre 2025 =C3=A0 17:47 +0800, Kyrie Wu a =C3=A9crit=C2=
=A0:
> move decoding buffer increase code into spinlock
> protecting aera for multi-core

I don't understand this text, please rework.

>=20
> Fixes: dedc21500334 ("media: mtk-jpegdec: add jpeg decode worker interfac=
e")
>=20

Drop that blank line.

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
> index e45d7e82b8a0..5ffaee4dcd19 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1746,7 +1746,6 @@ static void mtk_jpegdec_worker(struct work_struct *=
work)
> =C2=A0
> =C2=A0	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
> =C2=A0	jpeg_src_buf =3D mtk_jpeg_vb2_to_srcbuf(&src_buf->vb2_buf);
> -	jpeg_dst_buf =3D mtk_jpeg_vb2_to_srcbuf(&dst_buf->vb2_buf);
> =C2=A0
> =C2=A0	if (mtk_jpeg_check_resolution_change(ctx,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 &jpeg_src_buf->dec_param)) {
> @@ -1755,11 +1754,6 @@ static void mtk_jpegdec_worker(struct work_struct =
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
> @@ -1784,6 +1778,9 @@ static void mtk_jpegdec_worker(struct work_struct *=
work)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(MTK_JPEG_HW_TIME=
OUT_MSEC));
> =C2=A0
> =C2=A0	spin_lock_irqsave(&comp_jpeg[hw_id]->hw_lock, flags);
> +	jpeg_dst_buf =3D mtk_jpeg_vb2_to_srcbuf(&dst_buf->vb2_buf);
> +	jpeg_dst_buf->curr_ctx =3D ctx;
> +	jpeg_dst_buf->frame_num =3D ctx->total_frame_num;
> =C2=A0	ctx->total_frame_num++;
> =C2=A0	mtk_jpeg_dec_reset(comp_jpeg[hw_id]->reg_base);
> =C2=A0	mtk_jpeg_dec_set_config(comp_jpeg[hw_id]->reg_base,
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> index 5f1557dafad6..b3142dc9be85 100644
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
> index 785db5ba4770..82c971936c4d 100644
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

Normally I'd seek for the context in the code. But I think I'll wait for a
proper commit message, and do a proper review then.

Nicolas

--=-LOhQi3igSxhC90HVoS+h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUHRAQAKCRDZQZRRKWBy
9CkJAQDFF2fMiQe1Z/KUSsnqSHOjrR++9jQ8kibQtTJ7ib9yMQEAoTpMq+Kmn3Lu
aOyRrlUky49dw8xZ9yef7ZluPkVGWg4=
=7UUl
-----END PGP SIGNATURE-----

--=-LOhQi3igSxhC90HVoS+h--

