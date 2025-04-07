Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD0CC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 16:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ePiwJtWqlANqnCk2rR6tEp8SjDwgJ0HyiP7oZXjHj8o=; b=e6s/P3YNZWs8fShP7gti6r2wxJ
	YEUbK/u57JxmgUO8NElFbj68Ie0+G7cDaRZe7vzbcZlVFUVokjJFgnPSOM0JHNL/2Uk8VFKxVqNaL
	fumf3M7CygCpnHKmi8dN8N/DMsx/yhqIvsiwViTvkkwude9k3WHNTkY48ocKc1wxTr6fFFiVB5F1k
	WGfvOY9BQnoQwPeERCb8JhgR9F4byE5KlaDyiiu5pavAcAOc0HF/uYFTaoaxEsoTWeZR37Lx6Beev
	tRkKp37bwoW88csqBFJuskMduEhIw7CSi6AnkkdG7HyBEOu0rMuQ7cRgN/WmO3jaFnhllUeru0NhX
	/sPk4thA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1p1Z-000000015xr-1l2C;
	Mon, 07 Apr 2025 16:08:37 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1oE4-00000000vWW-3pv6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 15:17:30 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-7c5c815f8efso430272085a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 08:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1744039047; x=1744643847; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ePiwJtWqlANqnCk2rR6tEp8SjDwgJ0HyiP7oZXjHj8o=;
        b=OqLSoKxbI8ePLOUASGm7Y0/SY88yFCccRw5JK+YTtVvUp5Q1D9vCRnEBFE52Le2xun
         3rQX39nwt+OgGjCA2gMP+tEU6smfXLEq12lbPnyIEXjCx2cuxEL1ssRHQd/7azjOBmTf
         TQ4GUccfj0bI0A9WIHjz8d/AR4b4X91e0uWdIUmwmh3cAT0gtHcUyeTEyFVJ+O25ZFBH
         kGPHSoHce5QifbSUNgC1RMCIwmMPtjplVDrN2xnSRyP9rOKOUu9CC3Dhch1CyYBkiNg/
         pA4ZKoZSYsNq7TazrfQs7+XDtFqLawfDAn+DW0HMDYnf0DHHRLRN7HFfOjdl2RTpFqPM
         FVgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744039047; x=1744643847;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ePiwJtWqlANqnCk2rR6tEp8SjDwgJ0HyiP7oZXjHj8o=;
        b=S/r3QpupHvAp/IfqU9KDtqDYUpJy9+uoRDKoLi+mCs/vwF+AIkz5H/hbuTZja8ot0Z
         obPDY3C8NVoi+MxwGRqbrFZpXPewNY7sne/EDHBBU1vy7s0DzsnjpczGzCYclCF6Ggce
         7bDDLaZ66woqJ63V7LDcm8byvrkDNCFYHjNcr4PvEvt25dppd+jmnSieyxKoPIwZgOts
         lCe1gDc5SZiehWK/qq+XzSC1YUuG1zTp/EvC91V/Xw3BqwCN1yl60QJdGPWkIfwA7qUx
         aqbyvFVVU9Fccixbzmm0QZU/mXHgQsDJ3GLSp4IvkhvidIYiVm70aiwORT2Td3hi3mKJ
         elxA==
X-Forwarded-Encrypted: i=1; AJvYcCXYSNM9SU8f10lgLS06diHS4vmm4erluedQFku3VlST8BGj5riREx3NDlI/W6fdtO4TV4amJapEBoSHRm7JBRuj@lists.infradead.org
X-Gm-Message-State: AOJu0YzF9WvpSR3mf1f4ODGaOHiYUZtMTkqEc6nDJ9T8EukzfH+YxIqw
	L6HWhFLinglOxXN5koqE664qW4bo/opAl1xcpn3zLeW9U1Ed+e319Fa5PZh3JwY=
X-Gm-Gg: ASbGncuo5NJRrJTnfUdASLb29L6v5u48p4mncoIXEq//MCyTg/F7iKueUgPn2trkBQd
	CjFrJu3uaafuOKCM+9gCCjGlZtI869ioFiI6+PowvT0MFNvuTlmtOrw9K1worKDSRLqik2Gd5bg
	NAIlQLHX/y2A291dzXdh+k0wDehNBJ2cNdXfDOA7TZ9nSJ8fa81SF6C5jSD4MkpbCD60PWzm2yE
	Ow/gTma2UzwKB71+/OD3KNtmLNEZ0oYy4vg7nwlSJdSJmxyGfU6uou4mIHnVoseRoq4mcVLiRlA
	Qi0tWnwX2fLnDosOg5G031RO0tqQBeyeD2Nni/yvOdPQo/BJUg==
X-Google-Smtp-Source: AGHT+IFMZnMbTyTQh098Zt7F9FsPuh2cDoKqbCbOEQoYMRNbuRJjmQBNxdpIsF9J7BtIACIamCOHKg==
X-Received: by 2002:a05:620a:40c5:b0:7c5:9ac7:2ccc with SMTP id af79cd13be357-7c775b15514mr1550295185a.55.1744039046981;
        Mon, 07 Apr 2025 08:17:26 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:e976::c41? ([2606:6d00:11:e976::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76ea58d63sm610314885a.87.2025.04.07.08.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 08:17:26 -0700 (PDT)
Message-ID: <f4eec2aa4856edbbb2f1e9248dffd9aff62c1a80.camel@ndufresne.ca>
Subject: Re: [PATCH 4/5] media: vcodec: Implement manual request completion
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sebastian Fricke <sebastian.fricke@collabora.com>, Sakari Ailus	
 <sakari.ailus@linux.intel.com>, Laurent Pinchart	
 <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Hans Verkuil <hverkuil@xs4all.nl>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen	 <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,  Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com
Date: Mon, 07 Apr 2025 11:17:25 -0400
In-Reply-To: <20250314-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v1-4-5e277a3d695b@collabora.com>
References: <20250314-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v1-0-5e277a3d695b@collabora.com>
	 <20250314-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v1-4-5e277a3d695b@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_081729_147323_254B9FDE 
X-CRM114-Status: GOOD (  25.86  )
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

Le vendredi 14 mars 2025 =C3=A0 14:26 +0100, Sebastian Fricke a =C3=A9crit=
=C2=A0:
> Rework how requests are completed in the MediaTek VCodec driver, by
> implementing the new manual request completion feature, which allows to
> keep a request open while allowing to add new bitstream data.
> This is useful in this case, because the hardware has a LAT and a core
> decode work, after the LAT decode the bitstream isn't required anymore
> so the source buffer can be set done and the request stays open until
> the core decode work finishes.
>=20
> Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
> ---
> =C2=A0.../mediatek/vcodec/common/mtk_vcodec_cmn_drv.h=C2=A0=C2=A0=C2=A0 |=
 13 ++++++
> =C2=A0.../mediatek/vcodec/decoder/mtk_vcodec_dec.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 4 +-
> =C2=A0.../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c=C2=A0=C2=A0 | 52 +=
+++++++++++++++++++++
> =C2=A0.../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h=C2=A0=C2=A0 |=C2=
=A0 4 ++
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_stateless.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 46 +++++++++----------
> =C2=A05 files changed, 94 insertions(+), 25 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_cmn=
_drv.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_cmn_drv.h
> index 6087e27bd604d24e5d37b48de5bb37eab86fc1ab..81ec5beecfaed239ed70bee34=
60aae27e476231c 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_cmn_drv.h
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_cmn_drv.h
> @@ -105,6 +105,19 @@ enum mtk_instance_state {
> =C2=A0	MTK_STATE_ABORT =3D 4,
> =C2=A0};
> =C2=A0
> +/**
> + * enum mtk_request_state - Stages of processing a request
> + * MTK_REQUEST_RECEIVED: Hardware prepared for the LAT decode
> + * MTK_REQUEST_DONE_WITH_BITSTREAM: LAT decode finished, the bitstream i=
s not
> + *				=C2=A0=C2=A0=C2=A0 needed anymore
> + * MTK_REQUEST_COMPLETE: CORE decode finished
> + */
> +enum mtk_request_state {
> +	MTK_REQUEST_RECEIVED =3D 0,
> +	MTK_REQUEST_LAT_DONE =3D 1,
> +	MTK_REQUEST_CORE_DONE =3D 2,
> +};
> +
> =C2=A0enum mtk_fmt_type {
> =C2=A0	MTK_FMT_DEC =3D 0,
> =C2=A0	MTK_FMT_ENC =3D 1,
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
> index 98838217b97d45ed2b5431fdf87c94e0ff79fc57..036ad191a9c3e644fe99b4ce2=
5d6a089292f1e57 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
> @@ -889,8 +889,10 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
> =C2=A0					src_buf->vb2_buf.req_obj.req;
> =C2=A0				v4l2_m2m_buf_done(src_buf,
> =C2=A0						VB2_BUF_STATE_ERROR);
> -				if (req)
> +				if (req) {
> =C2=A0					v4l2_ctrl_request_complete(req, &ctx->ctrl_hdl);
> +					media_request_manual_complete(req);
> +				}
> =C2=A0			}
> =C2=A0		}
> =C2=A0		return;
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv=
.c
> index 9247d92d431d8570609423156b989878f7901f1c..d9c7aaec0c4515cb73b80c913=
b1ad5b08392dd18 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> @@ -26,6 +26,58 @@
> =C2=A0#include "mtk_vcodec_dec_pm.h"
> =C2=A0#include "../common/mtk_vcodec_intr.h"
> =C2=A0
> +const char *state_to_str(enum mtk_request_state state)
> +{
> +	switch (state) {
> +	case MTK_REQUEST_RECEIVED:
> +		return "RECEIVED";
> +	case MTK_REQUEST_LAT_DONE:
> +		return "LAT_DONE";
> +	case MTK_REQUEST_CORE_DONE:
> +		return "CORE_DONE";
> +	default:
> +		return "UNKNOWN";
> +	}
> +}
> +
> +int mtk_vcodec_complete(struct mtk_vcodec_dec_ctx *ctx, enum mtk_request=
_state state,
> +			enum vb2_buffer_state buffer_state, struct media_request *src_buf_req=
)
> +{
> +	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> +
> +	mutex_lock(&ctx->lock);
> +
> +	if (ctx->req_state >=3D state) {
> +		mutex_unlock(&ctx->lock);
> +		return -EINVAL;
> +	}
> +
> +	switch (ctx->req_state) {
> +	case MTK_REQUEST_RECEIVED:
> +		v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
> +		src_buf =3D v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
> +		v4l2_m2m_buf_done(src_buf, buffer_state);
> +		ctx->req_state =3D MTK_REQUEST_LAT_DONE;
> +		if (state =3D=3D MTK_REQUEST_LAT_DONE)
> +			break;
> +		fallthrough;
> +	case MTK_REQUEST_LAT_DONE:
> +		dst_buf =3D v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
> +		v4l2_m2m_buf_done(dst_buf, buffer_state);
> +		media_request_manual_complete(src_buf_req);
> +		ctx->req_state =3D MTK_REQUEST_CORE_DONE;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	mtk_v4l2_vdec_dbg(3, ctx, "Switch state from %s to %s.\n",
> +			=C2=A0 state_to_str(ctx->req_state), state_to_str(state));
> +	ctx->req_state =3D state;
> +	mutex_unlock(&ctx->lock);
> +	return 0;
> +}
> +
> =C2=A0static int mtk_vcodec_get_hw_count(struct mtk_vcodec_dec_ctx *ctx, =
struct mtk_vcodec_dec_dev *dev)
> =C2=A0{
> =C2=A0	switch (dev->vdec_pdata->hw_arch) {
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv=
.h
> index ac568ed14fa257d25b533b6fd6b3cd341227ecc2..21c2301363d0151ba3cf384a2=
a32fff9f5d46034 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> @@ -185,6 +185,7 @@ struct mtk_vcodec_dec_ctx {
> =C2=A0	struct mtk_q_data q_data[2];
> =C2=A0	int id;
> =C2=A0	enum mtk_instance_state state;
> +	enum mtk_request_state req_state;

As you discovered before I came to do that final review, this is the
wrong version of the patchset. The request state must be per-request.
Looking forward your v2.

Nicolas

> =C2=A0
> =C2=A0	const struct vdec_common_if *dec_if;
> =C2=A0	void *drv_handle;
> @@ -326,6 +327,9 @@ wake_up_dec_ctx(struct mtk_vcodec_dec_ctx *ctx, unsig=
ned int reason, unsigned in
> =C2=A0	wake_up_interruptible(&ctx->queue[hw_id]);
> =C2=A0}
> =C2=A0
> +int mtk_vcodec_complete(struct mtk_vcodec_dec_ctx *ctx, enum mtk_request=
_state state,
> +			enum vb2_buffer_state buffer_state, struct media_request *src_buf_req=
);
> +
> =C2=A0#define mtk_vdec_err(ctx, fmt, args...)=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 \
> =C2=A0	mtk_vcodec_err((ctx)->id, (ctx)->dev->plat_dev, fmt, ##args)
> =C2=A0
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_d=
ec_stateless.c
> index afa224da0f4165cf5701d6861f1f787c6317bfe4..9187d7bcfc8aea17f3fc98d94=
419777d8026db51 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
less.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
less.c
> @@ -247,7 +247,6 @@ static const struct v4l2_frmsize_stepwise stepwise_fh=
d =3D {
> =C2=A0static void mtk_vdec_stateless_cap_to_disp(struct mtk_vcodec_dec_ct=
x *ctx, int error,
> =C2=A0					=C2=A0=C2=A0 struct media_request *src_buf_req)
> =C2=A0{
> -	struct vb2_v4l2_buffer *vb2_dst;
> =C2=A0	enum vb2_buffer_state state;
> =C2=A0
> =C2=A0	if (error)
> @@ -255,17 +254,7 @@ static void mtk_vdec_stateless_cap_to_disp(struct mt=
k_vcodec_dec_ctx *ctx, int e
> =C2=A0	else
> =C2=A0		state =3D VB2_BUF_STATE_DONE;
> =C2=A0
> -	vb2_dst =3D v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
> -	if (vb2_dst) {
> -		v4l2_m2m_buf_done(vb2_dst, state);
> -		mtk_v4l2_vdec_dbg(2, ctx, "free frame buffer id:%d to done list",
> -				=C2=A0 vb2_dst->vb2_buf.index);
> -	} else {
> -		mtk_v4l2_vdec_err(ctx, "dst buffer is NULL");
> -	}
> -
> -	if (src_buf_req)
> -		v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
> +	mtk_vcodec_complete(ctx, MTK_REQUEST_CORE_DONE, state, src_buf_req);
> =C2=A0}
> =C2=A0
> =C2=A0static struct vdec_fb *vdec_get_cap_buffer(struct mtk_vcodec_dec_ct=
x *ctx)
> @@ -308,6 +297,7 @@ static void vb2ops_vdec_buf_request_complete(struct v=
b2_buffer *vb)
> =C2=A0	struct mtk_vcodec_dec_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_queue)=
;
> =C2=A0
> =C2=A0	v4l2_ctrl_request_complete(vb->req_obj.req, &ctx->ctrl_hdl);
> +	media_request_manual_complete(vb->req_obj.req);
> =C2=A0}
> =C2=A0
> =C2=A0static void mtk_vdec_worker(struct work_struct *work)
> @@ -358,12 +348,17 @@ static void mtk_vdec_worker(struct work_struct *wor=
k)
> =C2=A0	else
> =C2=A0		mtk_v4l2_vdec_err(ctx, "vb2 buffer media request is NULL");
> =C2=A0
> +	mutex_lock(&ctx->lock);
> +	ctx->req_state =3D MTK_REQUEST_RECEIVED;
> +	mutex_unlock(&ctx->lock);
> +
> =C2=A0	ret =3D vdec_if_decode(ctx, bs_src, NULL, &res_chg);
> +
> =C2=A0	if (ret && ret !=3D -EAGAIN) {
> =C2=A0		mtk_v4l2_vdec_err(ctx,
> -				=C2=A0 "[%d] decode src_buf[%d] sz=3D0x%zx pts=3D%llu ret=3D%d res_c=
hg=3D%d",
> +				=C2=A0 "[%d] decode src_buf[%d] sz=3D0x%zx pts=3D%llu res_chg=3D%d r=
et=3D%d",
> =C2=A0				=C2=A0 ctx->id, vb2_src->index, bs_src->size,
> -				=C2=A0 vb2_src->timestamp, ret, res_chg);
> +				=C2=A0 vb2_src->timestamp, res_chg, ret);
> =C2=A0		if (ret =3D=3D -EIO) {
> =C2=A0			mutex_lock(&ctx->lock);
> =C2=A0			dec_buf_src->error =3D true;
> @@ -372,18 +367,15 @@ static void mtk_vdec_worker(struct work_struct *wor=
k)
> =C2=A0	}
> =C2=A0
> =C2=A0	state =3D ret ? VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE;
> +	if (ret !=3D -EAGAIN)
> +		mtk_vcodec_complete(ctx, MTK_REQUEST_LAT_DONE, state, src_buf_req);
> +
> =C2=A0	if (!IS_VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch) ||
> =C2=A0	=C2=A0=C2=A0=C2=A0 ctx->current_codec =3D=3D V4L2_PIX_FMT_VP8_FRAM=
E) {
> -		v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx, state=
);
> -		if (src_buf_req)
> -			v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
> -	} else {
> -		if (ret !=3D -EAGAIN) {
> -			v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
> -			v4l2_m2m_buf_done(vb2_v4l2_src, state);
> -		}
> -		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
> +		mtk_vcodec_complete(ctx, MTK_REQUEST_CORE_DONE, state, src_buf_req);
> =C2=A0	}
> +
> +	v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
> =C2=A0}
> =C2=A0
> =C2=A0static void vb2ops_vdec_stateless_buf_queue(struct vb2_buffer *vb)
> @@ -731,9 +723,15 @@ static int fops_media_request_validate(struct media_=
request *mreq)
> =C2=A0	return vb2_request_validate(mreq);
> =C2=A0}
> =C2=A0
> +static void fops_media_request_queue(struct media_request *mreq)
> +{
> +	media_request_mark_manual_completion(mreq);
> +	v4l2_m2m_request_queue(mreq);
> +}
> +
> =C2=A0const struct media_device_ops mtk_vcodec_media_ops =3D {
> =C2=A0	.req_validate	=3D fops_media_request_validate,
> -	.req_queue	=3D v4l2_m2m_request_queue,
> +	.req_queue	=3D fops_media_request_queue,
> =C2=A0};
> =C2=A0
> =C2=A0static void mtk_vcodec_add_formats(unsigned int fourcc,

