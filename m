Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11AEBD637B3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 21:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5NXLEIY/HJo5YPCQOLY5gXfYsdslZjjo+0R5gru3yJ8=; b=LCE+8Qx7MpeutPzV1H1SOnA8Hq
	WipnFdns4FcY3T0vba82Ayn291enpf8VK07lj1M7K2XxTzTiaJCLswe7S0ReAjCbABh6rpAlShtxS
	tIkUv79G2mFUd2DMyZpXj1fdJ8ZmaCbhMCiZrUOnCHOVtDWvVnNZV/82goTKvmc9SYyUDw0mdJqAJ
	xpQxIrb99BxLld/hFv0oyevVt12XC5nHFbOrP/dNxz6StMlplAdrQNGVowxxkipIb8lbZ5Nc/+9+n
	tubWsZdRnJu6UylE5JiXDl2Iq4zarCLXB5WXqtjAVVIVrQ1zHr5hlNzTzNVb2vlM6Jtuo1PPiNpLN
	a+WbgykQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVcVP-00000005pvn-3MJi;
	Tue, 16 Dec 2025 21:22:51 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVcVN-00000005pv5-2n9D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 21:22:51 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-8bb6a27d3edso359968785a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 13:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1765920168; x=1766524968; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5NXLEIY/HJo5YPCQOLY5gXfYsdslZjjo+0R5gru3yJ8=;
        b=Y1KUElYuWBLXp6z/aPk1P40HQBQDqZbpIJzSOAhK6DGULgMLrWzUzlmEs+dLOc67Gt
         bAcgL7QRKdzHDiRiZLa6HWdAMR9zc41aP++nJKciCAboXwN666ArUbENXBak+JW2cyUz
         RySrB/NI+J7vzVvEXX3kCLP8Acx3+s4kXMCMJznpQagiJ0GjM675sn9NDDIOE+dW2dcq
         Hh09PJ+DYKJGewb41YZldV+I/CWX8X1abgu3t9vtYICdf9zdII0cR6R77sZEhbbn6Epc
         J3hANUZaxDO2C4xy6ELyDJuaneJwXbWCCBDM8e8hwJmydaJDCdZHhxVQ28QCwW6niGej
         3x/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765920168; x=1766524968;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5NXLEIY/HJo5YPCQOLY5gXfYsdslZjjo+0R5gru3yJ8=;
        b=IxJ72+PMDJHPpfx9bDGIQIyrFvpNzCJ8Hp9iRMqyprF5AQK8Id0LmSQBPBBSXPpOCH
         thkg0lCaJHy7FjVpqiTMb7ZAjwkgn7yn1PcLwWfVi9NnNYYz/KV5yBWclVSETMC/RAlq
         1Sl9PmncDWeQXs0FltUkNUb0HhmqNY+Rky0gv9gxyEAjDCZaDHWxC+/9eWQxINCDdBZx
         qWzorZPN2hR+E4FvhFSGPKeBlHD7YTvvBbRksfeiL7uZhiDYc0B/skdZHRdWyEqB5uH3
         11NO+LGwsImB2m5BDQi810fpVSRhRjHGh9OwyypAT7SvLUtRW2qzQfzwTuXwiAMAGfZg
         EESA==
X-Forwarded-Encrypted: i=1; AJvYcCVZ/YLUvSSbjHEPkSBOz96qiIoyYV5IHbZ5r2sH26l6fokpsb2b8HW537SHmRO2Zu07nyJSsD7i2mxkDT/vXA+0@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3RY+R2+Y5QD9RmHoKFatLVHRneakSlN/D8Rb03MFA2C6twGlD
	9uV3t7dr8KziNC2RgZDrG578oyLO6AMOGWkbOhQMUbzngQwdWn/0GFfE71+X0JWWwTo=
X-Gm-Gg: AY/fxX4CM9cWrcdGpAphiL8r/EcC8QG33C8LKxLw04bqhYk9HyE2e69+mGWRLUxIBzl
	DxFqkC5ZG6OegvtfSkoY0yaoOlSE7V9JXXAwzgcLD4rNqJ+4xRQTUiPg5JK01W5SeQeSTn+TI1g
	8UBdVxA+HvdNbWyQdIGG9Ws+phqt0WEZLtUhLZ+e1UPnR3T6IzGkmPvFdBLarMLzIiGxEEMSWFl
	EG1pzM4yN9L+ys4prtl9v8eAt72xxaeDsT/mgC1SdIUh8vaUDEYeYqcBavQmmGzW+FJwxHL44Py
	kDKUAayXZVP72fQJsPid14czK2LwwwdmGRFpiMu6ZwTKGgji5FIztTxzwkI4ha9gH0OmmuwRvFY
	rDjJkf05WJSVdVoR6A5XzH0ae82NoWoOeqns1q5fMFZY8U/75eumAlWIsCnbi3sNAmjVa3y57t/
	nlfRkD02NCy1C2pi/a
X-Google-Smtp-Source: AGHT+IGnNvmGoO8yPWVpsFsbYZAaj2DCffDyxI9Yos1OcWwvsPhTC8Cpvvm5ho/CQeeMUg7IeOVbhA==
X-Received: by 2002:a05:620a:1aa1:b0:8b2:63ed:dd10 with SMTP id af79cd13be357-8bb3a39de7emr2290802885a.78.1765920168123;
        Tue, 16 Dec 2025 13:22:48 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8be31b66937sm266561085a.41.2025.12.16.13.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 13:22:47 -0800 (PST)
Message-ID: <89f845b45405bbf985a5e92c195078074bcce0e2.camel@ndufresne.ca>
Subject: Re: [PATCH v11 03/12] media: mediatek: jpeg: fix jpeg buffer layout
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Tue, 16 Dec 2025 16:22:46 -0500
In-Reply-To: <20251202094800.6140-4-kyrie.wu@mediatek.com>
References: <20251202094800.6140-1-kyrie.wu@mediatek.com>
	 <20251202094800.6140-4-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-mJv6RkBPu7sPfVj/Eoxm"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_132249_772444_4EABD5DF 
X-CRM114-Status: GOOD (  23.23  )
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


--=-mJv6RkBPu7sPfVj/Eoxm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 02 d=C3=A9cembre 2025 =C3=A0 17:47 +0800, Kyrie Wu a =C3=A9crit=C2=
=A0:
> For memory alloc operation of jpeg dst buffer: the mallocing
> memory function interface use vb2_buffer as the base addr.
> If structure mtk_jpeg_src_buf wants to be allocated to memory,
> it needs to be placed vb2_v4l2_buffer at the starting position,
> because structure vb2_buffer is at the starting position of
> vb2_v4l2_buffer, and the allocated size is set to the size of
> structure mtk_jpeg_src_buf, so as to ensure that structures
> mtk_jpeg_src_buf, vb2_v4l2_buffer and vb2_buffer can all be
> allocated memory.

Please correct the wording, "mallocing" is not a word, addr -> address. I t=
end
to do the same, but refrain from giving the code a personality, the vb2_buf=
fer
have no will. This is overall complicated way to simply say:

	Fix the size of the allocated mtk_jpeg_src_buf structure.

>=20
> Fixes: 5fb1c2361e56 ("mtk-jpegenc: add jpeg encode worker interface")
>=20

Drop the blank line.

> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---
> =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 2 +-
> =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h | 2 +-
> =C2=A02 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 0cf3dc5407e4..bd0afc93d491 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1099,7 +1099,7 @@ static int mtk_jpeg_queue_init(void *priv, struct v=
b2_queue *src_vq,
> =C2=A0	dst_vq->type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> =C2=A0	dst_vq->io_modes =3D VB2_DMABUF | VB2_MMAP;
> =C2=A0	dst_vq->drv_priv =3D ctx;
> -	dst_vq->buf_struct_size =3D sizeof(struct v4l2_m2m_buffer);
> +	dst_vq->buf_struct_size =3D sizeof(struct mtk_jpeg_src_buf);
> =C2=A0	dst_vq->ops =3D jpeg->variant->qops;
> =C2=A0	dst_vq->mem_ops =3D &vb2_dma_contig_memops;
> =C2=A0	dst_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> index 6be5cf30dea1..148fd41759b7 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> @@ -85,10 +85,10 @@ struct mtk_jpeg_variant {
> =C2=A0};
> =C2=A0
> =C2=A0struct mtk_jpeg_src_buf {
> -	u32 frame_num;
> =C2=A0	struct vb2_v4l2_buffer b;
> =C2=A0	struct list_head list;
> =C2=A0	u32 bs_size;
> +	u32 frame_num;

I like the change, but this shouldn't be an issue if you use container_of, =
which
is safer then a plain cast. Please review the code and make sure to use it.=
 It
may be confusing to include a cosmetic change in a fixes.

Nicolas

> =C2=A0	struct mtk_jpeg_dec_param dec_param;
> =C2=A0
> =C2=A0	struct mtk_jpeg_ctx *curr_ctx;

--=-mJv6RkBPu7sPfVj/Eoxm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUHNpgAKCRDZQZRRKWBy
9GauAQDSjSJy57f4INnhNyoTxgXltOjS3AO/O50mgH9AbrdfXQD+IMCZiJL8oDJg
iZKHJQfhVDMZqx9S6kHFrKdYog6F1gw=
=T/eA
-----END PGP SIGNATURE-----

--=-mJv6RkBPu7sPfVj/Eoxm--

