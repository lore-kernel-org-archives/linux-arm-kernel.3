Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8661C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 17:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AnmKRR26C0Aot9dN/CEjPuuqw6IsSEUnG0n8Vnz6PHk=; b=p/z48HhpSviXYvTNeQwLbwCDy1
	53BwXaC8awawqufLbjJ3j9+AmGOY76gydp2gFnIogKlmrEslGO5vi90tw5RVw5x6WmnHG5N1glwsZ
	lIBIYtLafvm9p458OniENLeh3PGE1YcmUK1IvgxLO3b1SCjIdDePzQmHiGt5XkSu6t/SNqd+ZCwve
	ntImp0MMVtA4yQR5rXd1vMHUz3CINtos1jC80ZAKKxHKa3yai9D6I1psHGBaiB8ZCuWZg2Oqhj/GS
	C8nvNLZOBn0Lm73ZK/fHjCHdGX8Pb1IlF6mtNvG3bMIweqOVKq5hCDFtGwkAnegTblmtLk07Dc8Cu
	BGliBD4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAXLJ-0000000GG7Q-2qz5;
	Thu, 01 May 2025 17:05:01 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAXJO-0000000GFdq-3L8V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 17:03:04 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-7c5a88b34a6so118140285a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 10:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1746118981; x=1746723781; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AnmKRR26C0Aot9dN/CEjPuuqw6IsSEUnG0n8Vnz6PHk=;
        b=RUltjLnOsB+HBU7ylCcMizy1u5W25oIoMJFpdNsDs80XjKWx+m6O5edDWm+82Km5th
         6oOM32iuJHQpO8gqNFJvLLSoIlcDXxyKZ036QbzyvhNvA4zAVpGz8BZ5Hox/925+MdQL
         Od4P1WjSL38/L+FM+JwbKzt4/4iM820VQxhSesvQoC7DI6EvnfRTMsFnTUSTp8mQX4R+
         oU8v8TpJlrj7ahMgRSDDacN2G2qemTBptAUY6Mdp6Qe/FQMkO6hKyPAV7yRuxEy8D4YN
         xaFZ8yeFu8k9HWEhLKctAheXeIin9E4kLrHIkpVT3tAjBcfI5J86H9zg5y6ij+hTX00U
         9UkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746118981; x=1746723781;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AnmKRR26C0Aot9dN/CEjPuuqw6IsSEUnG0n8Vnz6PHk=;
        b=LZi21cXXO7EtnNcX9gMhg63AE+5bGTU65PiBN2NO7AI3/H9NL83N4zNJfl8uAvEoKL
         9PLdCmRAwoY1hWZqH5iKioszkct3hgoAz4msHh+t2hZGLj6WepSzal2dTbNz/bEsgcDD
         XyVWrHvaN4h565+bZNtCnPXKPYZ85aayiQWZFjO1EEZN72wjPzeQYwNlxSZpTEmwqeCl
         x1rQ7G32ZA2cWWw2dTaVZ2TY9C3H7yMDS7ygNK5u7cUG59a0HsFlgkLhTgU6pmmWoIrC
         razliJJKIWPI7HNOXKqulnWjrtL+mhAT3smq6xAPH4VLbL5eMvMSr0g/NpNbfjM3DbiI
         qDRw==
X-Forwarded-Encrypted: i=1; AJvYcCUT5fHVLKPQexG0LfSIBjBEeNBHWYElZ2LaTFJnuaKhzHYJmWo3hteMFlGZrMV/1erR8W2rnQdFNvpOhIsULCQt@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/O4pwLL0tUYL3rgK+XGw6kDywmsudgquT3FxHFdU6ozolG9gT
	zG+iHOsJaIPSX+DTbRjYWnAeiiNQRkIUQ3uG3MGKS/Yt2oOAZakVjw16oxKMVpI=
X-Gm-Gg: ASbGncsNJhnrYTyTwc8hfWaJq3po/E2wmGJUxHegXg0ik3w4IEVJjdQ+1ygdaRvFBtj
	kwekFo8g969BKlWGGrS5F3GVk5+pZUkm97kxXc46lYllegpfINCjFhylrn4a9WPzYut9h0fV807
	EBtGIWwOCu58h0skqATfV/hgtsNTtHDIpDKeqw3MOUBR9WGNVI73YaZjnMlTlFDmpdPTiTF8aMb
	c06mNtR6a7zgLpNA+scSKxzz9SdX1IRJJhv7oprYrGW5Y9DfbDB7mECk7DIi+z6BWLQjRzulcn3
	CyszqXlkG3whKTeT4bOAti7KwmNKhaDjXl6cudeHf1LwwQ==
X-Google-Smtp-Source: AGHT+IEWhy01ShAhWfub+iOOfu/TJN+6Qalpa374amdQx7s9VHC4cwQvXlZq/+brCm8fEf5wo6mH0Q==
X-Received: by 2002:a05:620a:4694:b0:7c5:4788:a14e with SMTP id af79cd13be357-7cac7e97b3cmr976977585a.39.1746118980731;
        Thu, 01 May 2025 10:03:00 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:8242::5ac? ([2606:6d00:17:8242::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cad23d1c99sm68552885a.63.2025.05.01.10.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 10:03:00 -0700 (PDT)
Message-ID: <c9981a1e01281153748a1edd4096f4ce1aaae576.camel@ndufresne.ca>
Subject: Re: [PATCH] media: imx-jpeg: Account for data_offset when getting
 image address
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	mirela.rabulea@oss.nxp.com
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
 linux-imx@nxp.com, 	imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Thu, 01 May 2025 13:02:59 -0400
In-Reply-To: <20250430053928.214-1-ming.qian@oss.nxp.com>
References: <20250430053928.214-1-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_100303_097775_C65455F5 
X-CRM114-Status: GOOD (  23.40  )
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

Le mercredi 30 avril 2025 =C3=A0 13:39 +0800, ming.qian@oss.nxp.com a =C3=
=A9crit=C2=A0:
> From: Ming Qian <ming.qian@nxp.com>
>=20
> Applications may set data_offset when it refers to an output queue. So
> driver need to account for it when getting the start address of input
> image in the plane.
>=20
> Meanwhile data_offset is included in bytesused. So the data_offset
> should be subtracted from the payload of input image.

I think you should revisit this commit message a little in the next version=
.
While the overall patch looks good, I believe you forgot to add code to ver=
ify
that addr + data_offset still falls within the HW needed alignment. I don't
have the HW documentation for that chip, but I have never seen HW capapble =
of
handlign random alignment.

Without the data_offset, the data is always page align, so we don't usually
have to validate that.

regards,
Nicolas

>=20
> Signed-off-by: Ming Qian <ming.qian@nxp.com>
> ---
> =C2=A0.../media/platform/nxp/imx-jpeg/mxc-jpeg.c=C2=A0=C2=A0=C2=A0 | 42 +=
+++++++++++++-----
> =C2=A01 file changed, 31 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/med=
ia/platform/nxp/imx-jpeg/mxc-jpeg.c
> index 1221b309a916..035368d65913 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -587,6 +587,27 @@ static void _bswap16(u16 *a)
> =C2=A0	*a =3D ((*a & 0x00FF) << 8) | ((*a & 0xFF00) >> 8);
> =C2=A0}
> =C2=A0
> +static dma_addr_t mxc_jpeg_get_plane_dma_addr(struct vb2_buffer *buf, un=
signed int plane_no)
> +{
> +	if (plane_no >=3D buf->num_planes)
> +		return 0;
> +	return vb2_dma_contig_plane_dma_addr(buf, plane_no) + buf->planes[plane=
_no].data_offset;
> +}
> +
> +static void *mxc_jpeg_get_plane_vaddr(struct vb2_buffer *buf, unsigned i=
nt plane_no)
> +{
> +	if (plane_no >=3D buf->num_planes)
> +		return NULL;
> +	return vb2_plane_vaddr(buf, plane_no) + buf->planes[plane_no].data_offs=
et;
> +}
> +
> +static unsigned long mxc_jpeg_get_plane_payload(struct vb2_buffer *buf, =
unsigned int plane_no)
> +{
> +	if (plane_no >=3D buf->num_planes)
> +		return 0;
> +	return vb2_get_plane_payload(buf, plane_no) - buf->planes[plane_no].dat=
a_offset;
> +}
> +
> =C2=A0static void print_mxc_buf(struct mxc_jpeg_dev *jpeg, struct vb2_buf=
fer *buf,
> =C2=A0			=C2=A0 unsigned long len)
> =C2=A0{
> @@ -599,11 +620,11 @@ static void print_mxc_buf(struct mxc_jpeg_dev *jpeg=
, struct vb2_buffer *buf,
> =C2=A0		return;
> =C2=A0
> =C2=A0	for (plane_no =3D 0; plane_no < buf->num_planes; plane_no++) {
> -		payload =3D vb2_get_plane_payload(buf, plane_no);
> +		payload =3D mxc_jpeg_get_plane_payload(buf, plane_no);
> =C2=A0		if (len =3D=3D 0)
> =C2=A0			len =3D payload;
> -		dma_addr =3D vb2_dma_contig_plane_dma_addr(buf, plane_no);
> -		vaddr =3D vb2_plane_vaddr(buf, plane_no);
> +		dma_addr =3D mxc_jpeg_get_plane_dma_addr(buf, plane_no);
> +		vaddr =3D mxc_jpeg_get_plane_vaddr(buf, plane_no);
> =C2=A0		v4l2_dbg(3, debug, &jpeg->v4l2_dev,
> =C2=A0			 "plane %d (vaddr=3D%p dma_addr=3D%x payload=3D%ld):",
> =C2=A0			=C2=A0 plane_no, vaddr, dma_addr, payload);
> @@ -701,16 +722,15 @@ static void mxc_jpeg_addrs(struct mxc_jpeg_desc *de=
sc,
> =C2=A0	struct mxc_jpeg_q_data *q_data;
> =C2=A0
> =C2=A0	q_data =3D mxc_jpeg_get_q_data(ctx, raw_buf->type);
> -	desc->buf_base0 =3D vb2_dma_contig_plane_dma_addr(raw_buf, 0);
> +	desc->buf_base0 =3D mxc_jpeg_get_plane_dma_addr(raw_buf, 0);
> =C2=A0	desc->buf_base1 =3D 0;
> =C2=A0	if (img_fmt =3D=3D STM_CTRL_IMAGE_FORMAT(MXC_JPEG_YUV420)) {
> =C2=A0		if (raw_buf->num_planes =3D=3D 2)
> -			desc->buf_base1 =3D vb2_dma_contig_plane_dma_addr(raw_buf, 1);
> +			desc->buf_base1 =3D mxc_jpeg_get_plane_dma_addr(raw_buf, 1);
> =C2=A0		else
> =C2=A0			desc->buf_base1 =3D desc->buf_base0 + q_data->sizeimage[0];
> =C2=A0	}
> -	desc->stm_bufbase =3D vb2_dma_contig_plane_dma_addr(jpeg_buf, 0) +
> -		offset;
> +	desc->stm_bufbase =3D mxc_jpeg_get_plane_dma_addr(jpeg_buf, 0) + offset=
;
> =C2=A0}
> =C2=A0
> =C2=A0static bool mxc_jpeg_is_extended_sequential(const struct mxc_jpeg_f=
mt *fmt)
> @@ -967,8 +987,8 @@ static irqreturn_t mxc_jpeg_dec_irq(int irq, void *pr=
iv)
> =C2=A0			vb2_set_plane_payload(&dst_buf->vb2_buf, 1, payload);
> =C2=A0		}
> =C2=A0		dev_dbg(dev, "Decoding finished, payload size: %ld + %ld\n",
> -			vb2_get_plane_payload(&dst_buf->vb2_buf, 0),
> -			vb2_get_plane_payload(&dst_buf->vb2_buf, 1));
> +			mxc_jpeg_get_plane_payload(&dst_buf->vb2_buf, 0),
> +			mxc_jpeg_get_plane_payload(&dst_buf->vb2_buf, 1));
> =C2=A0	}
> =C2=A0
> =C2=A0	/* short preview of the results */
> @@ -1827,8 +1847,8 @@ static int mxc_jpeg_parse(struct mxc_jpeg_ctx *ctx,=
 struct vb2_buffer *vb)
> =C2=A0	struct mxc_jpeg_sof *psof =3D NULL;
> =C2=A0	struct mxc_jpeg_sos *psos =3D NULL;
> =C2=A0	struct mxc_jpeg_src_buf *jpeg_src_buf =3D vb2_to_mxc_buf(vb);
> -	u8 *src_addr =3D (u8 *)vb2_plane_vaddr(vb, 0);
> -	u32 size =3D vb2_get_plane_payload(vb, 0);
> +	u8 *src_addr =3D (u8 *)mxc_jpeg_get_plane_vaddr(vb, 0);
> +	u32 size =3D mxc_jpeg_get_plane_payload(vb, 0);
> =C2=A0	int ret;
> =C2=A0
> =C2=A0	memset(&header, 0, sizeof(header));
>=20
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> prerequisite-patch-id: 0000000000000000000000000000000000000000

