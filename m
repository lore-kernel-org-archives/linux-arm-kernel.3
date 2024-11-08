Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66BAD5E13A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 06:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xkvxW0TELGak9TGChpUjLN8WW2TtIQcHiwQEYFYHFLY=; b=MGRGhA2dlPIyY7+xY8E8FtAqn3
	cLFz7VWE9B2y7uH72AZYg4rgt/G60iOA/Qs9NZeP0+1dj2jCixUCtDtYH6wSvppgNK1yIesaYJlAT
	bZCXVyjiTZdxazXUKZDFgECHMNIn6z3d0JBzlx5HvTUas0JXdR/ItMBHUURYm7q8TAsILzeS9em3n
	DFD3RVvUsnfMowREW9u6qoxFuLVFLUdM+Ci9R5ScekIoLVlyam0DkesPp71yZtRzMFZuROPbbqHVp
	E4xpPm90n45qdVobisPEHpi5kre5DBipNgRVKJ0GQAPAYRFgTMEJYR8Mf6nK96Un1s2ACZcna+bv+
	1HfA+XtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9I6L-00000009SHB-47pU;
	Fri, 08 Nov 2024 06:04:09 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9I4Z-00000009S0I-3cVM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 06:02:21 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-53c779ef19cso1969921e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 22:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731045738; x=1731650538; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xkvxW0TELGak9TGChpUjLN8WW2TtIQcHiwQEYFYHFLY=;
        b=RQ+Odt1XRXfCb+1RSc/w3XUpsHVIQRTYM3cTQlmyepFwuD0910fjRErb3/V8Tkm1Ot
         HFc6Ef5zWdFZxqJB/xnYEyG4oAOSxpp4LPy6tYAnhSWJMpV/24N2BG7wNQes33Fh8RDH
         sY5khhkSIdcainPSBWhLQH9N+abQ/x3pZOfjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731045738; x=1731650538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xkvxW0TELGak9TGChpUjLN8WW2TtIQcHiwQEYFYHFLY=;
        b=hKKrC5A+CKetsiIkE3uZAGM9dtI8LzeX8Dl5qLY9fLK//QjDJ/FbE6QqbOh0QdIID4
         hpNVt9JkaZLAPfbfzCB4lLFwtYCGnovkgsz9FT1mtZ3G6ox1KFOScD4j1j+0MuwejJv6
         VWDmapwXZzI/Ts7tqfn35IgedinAwwSE/Te5FCQ9mS3TYUfIE+O3EpE+LeFlKhMT6Rkq
         u6AWih5mKAyU+znEFwc1RXdY7F7QWvPqVIZTb5artOSzai1xSB3B2xjoeTstG2Y7YRnY
         PN9s0OyayrssiAfSDziAomJuETDIqZW3eq9I+8gd4nJSAHv9m8tduBpt+P8+/RRlegYZ
         XyEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEbqeAJrhpbi5fKlFRp7ApA2ahWDvgHlcRJtKRN+IYdF0jajQAG5yQFqlDlHFCmJ/kSxDyDMs5pHzg1TcYVuFZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwT0SDVRjhZyHFcclxjU1C9uxOh/FGHaLvAtYemNzkMAnf8FWSP
	5ta7BjRba/AtJ2IOHwPdx27iQVDfrgnQu3wxsDhDEPdhMklpQ88LrkaJP0zP6OlKa51cqrjA5Ue
	AOn2HS0MtLoO6ehW3hUpGqHbJP0ZsI5gWX980
X-Google-Smtp-Source: AGHT+IHrAma7a//3ZnIS1iS1Lm0CwM4nLy0ndtu8X8cJY5OZ/WS7iyuPy8axxsNkbLgivCMUhnj0GhMp35Zvr3+0+ik=
X-Received: by 2002:a05:6512:3b8d:b0:539:e8b5:f296 with SMTP id
 2adb3069b0e04-53d8629d2d5mr722983e87.33.1731045737701; Thu, 07 Nov 2024
 22:02:17 -0800 (PST)
MIME-Version: 1.0
References: <20241108033219.19804-1-yunfei.dong@mediatek.com> <20241108033219.19804-6-yunfei.dong@mediatek.com>
In-Reply-To: <20241108033219.19804-6-yunfei.dong@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 8 Nov 2024 14:02:06 +0800
Message-ID: <CAGXv+5EfZUXEh6r0GaMKwTgWo8gQHsXFSF2bQzFuw=J4Gj0OGw@mail.gmail.com>
Subject: Re: [PATCH v6 5/5] media: mediatek: vcodec: remove media request checking
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
X-CRM114-CacheID: sfid-20241107_220219_953001_025B8BAB 
X-CRM114-Status: GOOD (  21.40  )
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
> Setting the buffer status to error if the media request of
> each source buffer is NULL, then schedule the work to process
> again in case of access NULL pointer.
>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../vcodec/decoder/mtk_vcodec_dec_stateless.c      | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_d=
ec_stateless.c
> index 3f94654ebc73..251111678fd8 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
less.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
less.c
> @@ -363,10 +363,14 @@ static void mtk_vdec_worker(struct work_struct *wor=
k)
>                           ctx->id, bs_src->va, &bs_src->dma_addr, bs_src-=
>size, vb2_src);
>         /* Apply request controls. */
>         src_buf_req =3D vb2_src->req_obj.req;
> -       if (src_buf_req)
> +       if (src_buf_req) {
>                 v4l2_ctrl_request_setup(src_buf_req, &ctx->ctrl_hdl);
> -       else
> +       } else {
>                 mtk_v4l2_vdec_err(ctx, "vb2 buffer media request is NULL"=
);
> +               v4l2_m2m_buf_done(vb2_v4l2_src, VB2_BUF_STATE_ERROR);
> +               v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
> +               return;

Is this something that actually happens? I would assume that having
the `requires_requests` flag set on the queue would block any QBUF
call that doesn't have a request attached.

> +       }
>
>         ret =3D vdec_if_decode(ctx, bs_src, NULL, &res_chg);
>         if (ret && ret !=3D -EAGAIN) {
> @@ -384,8 +388,7 @@ static void mtk_vdec_worker(struct work_struct *work)
>         state =3D ret ? VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE;
>         if (!IS_VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch) ||
>             ctx->current_codec =3D=3D V4L2_PIX_FMT_VP8_FRAME) {
> -               if (src_buf_req)
> -                       v4l2_ctrl_request_complete(src_buf_req, &ctx->ctr=
l_hdl);
> +               v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);

Unrelated change. Please do the cleanup in a separate patch.

v4l2_ctrl_request_setup() and v4l2_ctrl_request_complete() are both
no-ops if either argument is NULL, so you can do one patch going over
the whole driver to clean it up.

>                 vb2_v4l2_dst =3D v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
>                 v4l2_m2m_buf_done(vb2_v4l2_dst, state);
>                 v4l2_m2m_buf_done(vb2_v4l2_src, state);
> @@ -403,8 +406,7 @@ static void mtk_vdec_worker(struct work_struct *work)
>          */
>         ctx->cur_src_buffer =3D (ret !=3D -EAGAIN) ? NULL : vb2_v4l2_src;
>         if (ret && ret !=3D -EAGAIN) {
> -               if (src_buf_req)
> -                       v4l2_ctrl_request_complete(src_buf_req, &ctx->ctr=
l_hdl);
> +               v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);

Unrelated change. Same as above.


ChenYu

>                 v4l2_m2m_buf_done(vb2_v4l2_src, state);
>         }
>
> --
> 2.46.0
>

