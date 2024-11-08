Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70195D5E12A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 04:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zEWziAM5vGxUZErinOfDkgBc9AdFxegHOYFNZYJiUGk=; b=cPaY4ufi7aFxvRzi/HmUvyWlHP
	TKbFZMoLSZV3ZSKeHq4T6ENtJjhX1n0dgKQhB4lyKSzMulbvxCEM5ctp4+te0KQDkHf1ASwOt6lhF
	bdkWACVlvyVDGdwNHiGks5FI6im6uzx4HjQbKnT2jRdWVNkXB8DdlbTVy9wh7Y0P9Z/aYN863pINJ
	nbhixHtR/N2dlhVxc8qFwsQvX0UTMRDUJGgNY33EMbFAKLTnrHxgSDMMmOb7X/rsSNX9v61nmgvWg
	iWMVUgya/IAYWs5XI19lc/cRKy1km5QhhlAncT5yiokXp61aSqP467txvqajFQBrGK1ay2ldNY1Jm
	4ktMSJrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9GqZ-00000009Itm-1uLt;
	Fri, 08 Nov 2024 04:43:47 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9GUD-00000009Ffg-0nOY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 04:20:42 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-539f72c913aso2780595e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 20:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731039639; x=1731644439; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zEWziAM5vGxUZErinOfDkgBc9AdFxegHOYFNZYJiUGk=;
        b=DAiMP25ek+NQcUxxO3+dQu+D2dtn/7dGQjS+zCRNexyWVWMlFwv7eaQy6NqpP1du6s
         YJM/qqLbG1NtCuxFsQNDBDTOVcxJMkwV3BixHRb24R90dNc6MNJQjBcDyAR7QNaCZ38K
         1cfZ9llRXChSPvmxlrEd/Llj59l+t1DhIV2EI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731039639; x=1731644439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zEWziAM5vGxUZErinOfDkgBc9AdFxegHOYFNZYJiUGk=;
        b=otDx7/Rxx1XPa07g9N0G1HMGvydcXmvTAsnXzTTnH24Xx7XmZyXT4hOpwNup59btNQ
         4TjuHvjGJxM3qpXxgIGvvBuKp4viO50UzP6efskawtu8UDdN+DulUW205VuKLV8vPCN8
         SzmSCgmjM1zhcKfuiDSlE0Wb8UXMa+S80UjC/o6kdgvIqFGNsNbK9Xa1atfa0PXvZwvq
         5yuWzwiUV6ekOK+sLmDbrfw4hyYcegmyJqVaX0Hhf6VxUBy2f85VGC/vbTdCkt0FNEMC
         h2MB2GdPSOaUj6+F3RZJwllkX67A4sR3Fg7buOzsqIZspgFu8P69ggt3jFtFwTOlvbx4
         lg9w==
X-Forwarded-Encrypted: i=1; AJvYcCWSpgRBa9UTIe918Z4cTqxKRbzbBOmzXgX1mYUI7ObcdnqdfRQ5QajjHvb8THCGJ6eZ6yGq/8i4Fy3SmbOdhx2T@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3IvUARcL4GliSW8fvfwN3FdUwoaT8BYCHugR4/73DTIo5ZFyy
	0O0h3jW34KX+/QXt7PNjMVKl0LcgpQOUceLqjNALOvJDHkVHsFQ24lIth+rJ6JReLjfsidn5yWr
	gHXBP0Na5yfDrQkICavKtCKLJdrRE3uQZh0tZ
X-Google-Smtp-Source: AGHT+IE4XZ04YFjPUEEL0D8wcmr49KGT/Fc8Oa+piPRCpeewhZIE7Cc2kejtZ9Oe/D6WW+a2IwuOeZhBz5+WWTsy8s0=
X-Received: by 2002:ac2:4e13:0:b0:539:ea0f:cc43 with SMTP id
 2adb3069b0e04-53d862c6f1amr560775e87.19.1731039639002; Thu, 07 Nov 2024
 20:20:39 -0800 (PST)
MIME-Version: 1.0
References: <20241108033219.19804-1-yunfei.dong@mediatek.com> <20241108033219.19804-4-yunfei.dong@mediatek.com>
In-Reply-To: <20241108033219.19804-4-yunfei.dong@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 8 Nov 2024 12:20:28 +0800
Message-ID: <CAGXv+5GgoSxGM9whwaL3jEUCEoxhTr6UsUdRH8BpBG3UUqDP1A@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] media: mediatek: vcodec: Get SRC buffer from
 bitstream instead of M2M
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_202041_280669_7D724DE1 
X-CRM114-Status: GOOD (  17.07  )
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

On Fri, Nov 8, 2024 at 11:32=E2=80=AFAM Yunfei Dong <yunfei.dong@mediatek.c=
om> wrote:
>
> Getting the SRC buffer from M2M will pick a different than the one
> used for current decode operation when the SRC buffer is removed
> from ready list.
>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c | 25 +++++++------------
>  .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 24 ++++++------------
>  2 files changed, 17 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av=
1_req_lat_if.c
> index 90217cc8e242..0e1469effeb5 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_la=
t_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_la=
t_if.c
> @@ -1060,24 +1060,20 @@ static inline void vdec_av1_slice_vsi_to_remote(s=
truct vdec_av1_slice_vsi *vsi,
>         memcpy(remote_vsi, vsi, sizeof(*vsi));
>  }
>
> -static int vdec_av1_slice_setup_lat_from_src_buf(struct vdec_av1_slice_i=
nstance *instance,
> -                                                struct vdec_av1_slice_vs=
i *vsi,
> -                                                struct vdec_lat_buf *lat=
_buf)
> +static void vdec_av1_slice_setup_lat_from_src_buf(struct vdec_av1_slice_=
instance *instance,
> +                                                 struct vdec_av1_slice_v=
si *vsi,
> +                                                 struct mtk_vcodec_mem *=
bs,
> +                                                 struct vdec_lat_buf *la=
t_buf)
>  {
> -       struct vb2_v4l2_buffer *src;
> +       struct mtk_video_dec_buf *src_buf_info;
>         struct vb2_v4l2_buffer *dst;
>
> -       src =3D v4l2_m2m_next_src_buf(instance->ctx->m2m_ctx);
> -       if (!src)
> -               return -EINVAL;
> -
> -       lat_buf->vb2_v4l2_src =3D src;
> +       src_buf_info =3D container_of(bs, struct mtk_video_dec_buf, bs_bu=
ffer);
> +       lat_buf->vb2_v4l2_src =3D &src_buf_info->m2m_buf.vb;
>
>         dst =3D &lat_buf->ts_info;
> -       v4l2_m2m_buf_copy_metadata(src, dst, true);
> +       v4l2_m2m_buf_copy_metadata(lat_buf->vb2_v4l2_src, dst, true);
>         vsi->frame.cur_ts =3D dst->vb2_buf.timestamp;
> -
> -       return 0;
>  }
>
>  static short vdec_av1_slice_resolve_divisor_32(u32 D, short *shift)
> @@ -1724,10 +1720,7 @@ static int vdec_av1_slice_setup_lat(struct vdec_av=
1_slice_instance *instance,
>         struct vdec_av1_slice_vsi *vsi =3D &pfc->vsi;
>         int ret;
>
> -       ret =3D vdec_av1_slice_setup_lat_from_src_buf(instance, vsi, lat_=
buf);
> -       if (ret)
> -               return ret;
> -
> +       vdec_av1_slice_setup_lat_from_src_buf(instance, vsi, bs, lat_buf)=
;
>         ret =3D vdec_av1_slice_setup_pfc(instance, pfc);
>         if (ret)
>                 return ret;
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp=
9_req_lat_if.c
> index 3dceb668ba1c..a56f6bb879a6 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> @@ -711,21 +711,16 @@ int vdec_vp9_slice_setup_single_from_src_to_dst(str=
uct vdec_vp9_slice_instance *
>         return 0;
>  }
>
> -static int vdec_vp9_slice_setup_lat_from_src_buf(struct vdec_vp9_slice_i=
nstance *instance,
> -                                                struct vdec_lat_buf *lat=
_buf)
> +static void vdec_vp9_slice_setup_lat_from_src_buf(struct vdec_vp9_slice_=
instance *instance,
> +                                                 struct mtk_vcodec_mem *=
bs,
> +                                                 struct vdec_lat_buf *la=
t_buf)
>  {
> -       struct vb2_v4l2_buffer *src;
> -       struct vb2_v4l2_buffer *dst;
> -
> -       src =3D v4l2_m2m_next_src_buf(instance->ctx->m2m_ctx);
> -       if (!src)
> -               return -EINVAL;
> +       struct mtk_video_dec_buf *src_buf_info;
>
> -       lat_buf->vb2_v4l2_src =3D src;
> +       src_buf_info =3D container_of(bs, struct mtk_video_dec_buf, bs_bu=
ffer);
> +       lat_buf->vb2_v4l2_src =3D &src_buf_info->m2m_buf.vb;
>
> -       dst =3D &lat_buf->ts_info;
> -       v4l2_m2m_buf_copy_metadata(src, dst, true);
> -       return 0;
> +       v4l2_m2m_buf_copy_metadata(lat_buf->vb2_v4l2_src, &lat_buf->ts_in=
fo, true);
>  }
>
>  static void vdec_vp9_slice_setup_hdr(struct vdec_vp9_slice_instance *ins=
tance,
> @@ -1154,10 +1149,7 @@ static int vdec_vp9_slice_setup_lat(struct vdec_vp=
9_slice_instance *instance,
>         struct vdec_vp9_slice_vsi *vsi =3D &pfc->vsi;
>         int ret;
>
> -       ret =3D vdec_vp9_slice_setup_lat_from_src_buf(instance, lat_buf);
> -       if (ret)
> -               goto err;
> -
> +       vdec_vp9_slice_setup_lat_from_src_buf(instance, bs, lat_buf);
>         ret =3D vdec_vp9_slice_setup_pfc(instance, pfc);
>         if (ret)
>                 goto err;
> --
> 2.46.0
>

