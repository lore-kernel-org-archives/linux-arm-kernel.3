Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65CBD5E147
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 08:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wm2Y4gXXAMdR5I9os8tjH0wvEMOcdz9ivS4XBoJPLS8=; b=2Kqqg+7CYAuVrWWZoNS+/XKFTb
	p4PLYt/W+z1nRpqyzugjbECIWttkqz0mi6ncUcHTmYJezHzm9Jp3opKgWU/HGD76fp8Sobw11RK8d
	hiuw3Ifsf7KDprbIizCzND6QvBBCfHGH9SElsqrUHHB2heKADZRoCJSYG2rTUgDBHANsyU0UQGeRO
	BUtIfnbRn9a1s4Qf9+5ZyiTiCpOXKSK8iSRpqr81LIoxg12ujx3JjeK/05GQJbgKVRFNtdzSWk4cc
	EDLVurWn0pqp3utfgnpo9t6IOuq1NF92TNVoL5BSP7xNO+QDcdMb71HQZlySomf0PjgP6k+S82mm6
	9G+TcYLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9KCM-00000009jxt-2J0w;
	Fri, 08 Nov 2024 08:18:30 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9KAa-00000009jiC-3Vts
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 08:16:42 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-539f72c8fc1so2934276e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 00:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731053799; x=1731658599; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wm2Y4gXXAMdR5I9os8tjH0wvEMOcdz9ivS4XBoJPLS8=;
        b=Z6HpeeOidD005X66pBYpSeOxgMOfA3QX1yzZxSbwfqK62zPlrpFzwa9kLyBhEOA0eR
         a1M0Lx2armLPzEPCvGKGXkN8wHskLDmoH06Uq2iaIWpknjI7g7O0gQqVJoxMye88p29m
         PLXX2x+lI8D2Thop+yUu2kaKCAW58W6YKLUjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731053799; x=1731658599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wm2Y4gXXAMdR5I9os8tjH0wvEMOcdz9ivS4XBoJPLS8=;
        b=GN3xcSlTJKbmbauQjAGk+JrYefeio34GGRLxt3zAyyhpppioQNKLKnqDg9woprWQYP
         CqC+oZXc8dPDW6aVdjFJOaW602bIVaupq3/jyacFpuofzkIHOUpbUqzDrpS1ttr05H+/
         sgqnWbpdURpni3ihU0ljMgqH1SQLoB/Ie+P+mVsDqmDI7H9OAjUDLvaPc0ICJEcQnUOw
         hlMQlWC7xgXjMAxJmYlPjJuz6rWAs6mMV+OLbrtooxLEYj0iZoD/bGHpcWyJ5QuXroLs
         ebGKADeae3TLCRpJSKMX7zKq6T+AcC4qiSOF9YjJOXtGwrZ8W/lTwXsRc/d9dPtApGRC
         yJUA==
X-Forwarded-Encrypted: i=1; AJvYcCVy2lqC6z8iptsvN4aaFU086TkioUozE1ead2LcM950lmRIHfa+NjcnbXRoAPbD0o1tLe1/vb9ZiCJrgYbrRC7x@lists.infradead.org
X-Gm-Message-State: AOJu0YxsLv6ngk5wyn9x86u7Nu39xiBsNDC4kGWpfZI3CGuj/ExEdZvw
	yZlxp3FkFcBqSza1AwG3QCGXxgTlHYYFQAuXt6ibJO2rcVyTWGBIDIqqL0e1TXbEOoFbdHt2VIW
	BmUdhwsFRaOiJyHVIwPfmKCANKGnJ28Qjptnn
X-Google-Smtp-Source: AGHT+IGrL9T+phlyofKTQtc+wVgicHGgJaCgMma9xu0xBRBGkrlCxE85vZhIThB8wyxuucQ+eBNzdzsPuB0UjfvBHz8=
X-Received: by 2002:a05:6512:ac8:b0:539:eb82:d453 with SMTP id
 2adb3069b0e04-53d8626c3a8mr904495e87.39.1731053798804; Fri, 08 Nov 2024
 00:16:38 -0800 (PST)
MIME-Version: 1.0
References: <20241108033219.19804-1-yunfei.dong@mediatek.com> <20241108033219.19804-5-yunfei.dong@mediatek.com>
In-Reply-To: <20241108033219.19804-5-yunfei.dong@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 8 Nov 2024 16:16:27 +0800
Message-ID: <CAGXv+5H_=A_of7LZSeiB8xWMLwOz59L7rOw4Hibh6Vp5MZswGw@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] media: mediatek: vcodec: store current vb2 buffer
 to decode again
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
X-CRM114-CacheID: sfid-20241108_001640_928976_7D7EBCF8 
X-CRM114-Status: GOOD (  26.79  )
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
> All the src vb2 buffer are removed from ready list when STREAMOFF
> capture queue, may remove a non exist vb2 buffer if lat is working

Can you explain how that happens? STREAMOFF supposedly waits for the
current job to finish [1] before touching the queue.

[1] https://elixir.bootlin.com/linux/v6.11.6/source/drivers/media/v4l2-core=
/v4l2-mem2mem.c#L881

> currently. The driver also need to use current vb2 buffer to decode
> again to wait for enough resource when lat decode error.

This also won't work, since if you remove the only source buffer on
the queue, the core will think that there are no more jobs to do [2],
and won't reschedule anything.

You can work around this by setting the `buffered` flag on the source
queue when you do the retry, and clear it when it succeeds. Set the
flag with v4l2_m2m_set_src_buffered().

[2] https://elixir.bootlin.com/linux/v6.11.6/source/drivers/media/v4l2-core=
/v4l2-mem2mem.c#L328

> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../vcodec/decoder/mtk_vcodec_dec_drv.h       |  2 ++
>  .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 30 +++++++++++++++----
>  2 files changed, 26 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv=
.h
> index 1fabe8c5b7a4..886fa385e2e6 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> @@ -155,6 +155,7 @@ struct mtk_vcodec_dec_pdata {
>   * @last_decoded_picinfo: pic information get from latest decode
>   * @empty_flush_buf: a fake size-0 capture buffer that indicates flush. =
Used
>   *                  for stateful decoder.
> + * @cur_src_buffer: current vb2 buffer for the latest decode.
>   * @is_flushing: set to true if flushing is in progress.
>   *
>   * @current_codec: current set input codec, in V4L2 pixel format
> @@ -201,6 +202,7 @@ struct mtk_vcodec_dec_ctx {
>         struct work_struct decode_work;
>         struct vdec_pic_info last_decoded_picinfo;
>         struct v4l2_m2m_buffer empty_flush_buf;
> +       struct vb2_v4l2_buffer *cur_src_buffer;
>         bool is_flushing;
>
>         u32 current_codec;
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_d=
ec_stateless.c
> index 750f98c1226d..3f94654ebc73 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
less.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
less.c
> @@ -324,7 +324,8 @@ static void mtk_vdec_worker(struct work_struct *work)
>         struct mtk_vcodec_dec_ctx *ctx =3D
>                 container_of(work, struct mtk_vcodec_dec_ctx, decode_work=
);
>         struct mtk_vcodec_dec_dev *dev =3D ctx->dev;
> -       struct vb2_v4l2_buffer *vb2_v4l2_src;
> +       struct vb2_v4l2_buffer *vb2_v4l2_src =3D ctx->cur_src_buffer;
> +       struct vb2_v4l2_buffer *vb2_v4l2_dst;
>         struct vb2_buffer *vb2_src;
>         struct mtk_vcodec_mem *bs_src;
>         struct mtk_video_dec_buf *dec_buf_src;
> @@ -333,7 +334,7 @@ static void mtk_vdec_worker(struct work_struct *work)
>         bool res_chg =3D false;
>         int ret;
>
> -       vb2_v4l2_src =3D v4l2_m2m_next_src_buf(ctx->m2m_ctx);
> +       vb2_v4l2_src =3D vb2_v4l2_src ? vb2_v4l2_src : v4l2_m2m_src_buf_r=
emove(ctx->m2m_ctx);
>         if (!vb2_v4l2_src) {
>                 v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
>                 mtk_v4l2_vdec_dbg(1, ctx, "[%d] no available source buffe=
r", ctx->id);
> @@ -385,12 +386,29 @@ static void mtk_vdec_worker(struct work_struct *wor=
k)
>             ctx->current_codec =3D=3D V4L2_PIX_FMT_VP8_FRAME) {
>                 if (src_buf_req)
>                         v4l2_ctrl_request_complete(src_buf_req, &ctx->ctr=
l_hdl);
> -               v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m=
2m_ctx, state);
> -       } else {
> -               if (ret !=3D -EAGAIN)
> -                       v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
> +               vb2_v4l2_dst =3D v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
> +               v4l2_m2m_buf_done(vb2_v4l2_dst, state);
> +               v4l2_m2m_buf_done(vb2_v4l2_src, state);
> +
>                 v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
> +               return;
>         }
> +
> +       /*
> +        * If each codec return -EAGAIN to decode again, need to backup c=
urrent source
> +        * buffer, then the driver will get this buffer next time.
> +        *
> +        * If each codec decode error, must to set buffer done with error=
 status for
> +        * this buffer have been removed from ready list.
> +        */
> +       ctx->cur_src_buffer =3D (ret !=3D -EAGAIN) ? NULL : vb2_v4l2_src;
> +       if (ret && ret !=3D -EAGAIN) {
> +               if (src_buf_req)
> +                       v4l2_ctrl_request_complete(src_buf_req, &ctx->ctr=
l_hdl);
> +               v4l2_m2m_buf_done(vb2_v4l2_src, state);
> +       }
> +
> +       v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
>  }
>
>  static void vb2ops_vdec_stateless_buf_queue(struct vb2_buffer *vb)
> --
> 2.46.0
>

