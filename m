Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 076EEC44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 09:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/3jptShbGvvubXF+8O/bdbRKyZuq6dKEohNKihfAkSY=; b=GhzyzVsPnVYY+B8giD+d8G1Pwd
	PK1SqSdn0huNI3Rbvi4aA76L76bgPM+ouyhhyKdw5SS/KzwOGuZLfPH1uj7vr6x3lgwXhA3FQ455A
	MOiHwKmCYSU4rFQW8hRlZc6Daf6pxmFNISgItpsqB+yY5FI8K4bPGaHoDAg9zUBdRHQLJOOr1KneU
	iQJSFVz/PunHCCgAYIIYKux6hgWbSNxxQWBd5gAvlN3CYBAUS3WDv7iiQ/U11ZIFITNDlylPIPlZC
	htn0/FkuSf5r/DU+rzJqM2N6D8rQXajb5gDM7MAiQjhysBkv+sM9nnJbn9U1m8EGx8pHzLQerJfiI
	0fwzlWRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6aA-00000008x7Q-2DSE;
	Tue, 21 Jul 2026 09:16:10 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6a8-00000008x68-1AVk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 09:16:09 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-80bb41f7f3cso74099087b3.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 02:16:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784625367; cv=none;
        d=google.com; s=arc-20260327;
        b=ETNbLW1YwmnOhajFpCatOvo7ejlNj0AwYD3mcD6LrvERdzKq5OfJe/TqLaoNk6E3/k
         l3G8QAyQDCnDoNovWatObpPW6pMx1XbedWOx0Ivu/C0EQbpg8OFZ/K5I5k7agaOXUdgs
         0DSxsbZEJcu0oDpJJPfYARYjG85lRZQK9r9Y0v8Rts3NNGqaKBK9bgvzqiwrvA+qGP3F
         uMJvfoQM2noCOyhixNZkMpN+YBKNyFrMUbicOfskrsSsm9xkqNFp1aSXq89p8gQ/xfEo
         MRv9i+1JG75YU0m+wQb7GtoLH6tg/ChOIWg29ORMdlFKCcreeD3d8NCzebJNcGoc099W
         BhAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/3jptShbGvvubXF+8O/bdbRKyZuq6dKEohNKihfAkSY=;
        fh=Rt9aPfozYhBQKkNggEPqiqB1SnP87mgrRxO5uksxrh0=;
        b=lyLIqAp/gTX00LBZe6gK3HrFIAlZ4MSfNWsCKNcDxP5AFzkRNEvJ+w9TVT0vvls+gm
         HkyUF3DSz3GW2bzmlgyKa/s32GyKgrUVH5129ZOU8VgvLIJlSw/eisKTjwYZmK/4+BBO
         j/hNAcGvtEH0dm77GrXVqaKqRpjoePWG20A+zZw7vfek55rHinlGLM8FiJBpKRZiuUcx
         T3+Bl4z6RU3ce/asCc7XJfuNbVRMrC+IdSGNWcbsOxUKy77+/PpQb1jR0pTdJrZ7dvaG
         92BUbg6PdVIYFSAET0wylRMtUat5L0s4wSEq6xxxA3fPvBaom/mRaAknqDU6FgeXnKAV
         FRLQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784625367; x=1785230167; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/3jptShbGvvubXF+8O/bdbRKyZuq6dKEohNKihfAkSY=;
        b=PbGIj3jr86a9cHTiGspa4omYp9SI5U09+cxcpFelIU+B+H6mD3+bTjPB+RLaBIuzLU
         BerEOhYGOTgqEl80X5nkTBYROF+aucwskuc36iy29FgTBSaP9Rq5vABgisfGCmKCQaTf
         88CqCX7oaOlgV8FcAzfMZTcCpHp6epnjXKwPbvNsPpjnMUn91Uypq1Rji2yxasFM9WbX
         GYrvgamQIcZbkXfJ1Tw/U+S1MfGsQnzEePdVEBpNIuaW4ifR5JocHe0ERPOYOmc7hKaq
         XYjhXu2VOpNd35QMoEHW+sOhfoJ7eMVoQIuA2xrBaY3iKHnJVFnG4qUW1jSNaIntnWXq
         sEAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784625367; x=1785230167;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/3jptShbGvvubXF+8O/bdbRKyZuq6dKEohNKihfAkSY=;
        b=iyoqquDbuS/XiOYW9pdQv+zx2PStkVokLPWobR5BkaRTBBrnKPl0R5D4vhs2Wfcx4b
         jMDvlT5oNZSxwzgJ42JLPDDJlxhfLWdd1Ao3dpDUrnj99/lCy7S+XtCDZRrfoWLzrXzI
         ZK0dGYM0h5APhN0LMRs2Ejli9IJJJG677OwSocOS/RO3IxmZEDY/cyq5Ga7gj2hM4Q6O
         TxyE2oL9XFHR4I3x8jSf73Sgl9jvcdwxS4tiyEp0AOvmLhTAAElJySKT2qkB77/WlboR
         KEnbeZPMZv6FI5VPzfj3S+x4xcAxMShWVgxABBkQWhBR0GlCfyx3/xeGbMbrxXZUhQsf
         vr3Q==
X-Forwarded-Encrypted: i=1; AHgh+RpUMjHMQmMZ2aWCZX+MT3GVyLU4r4oWmi+NVBWR8IjfEo1m+qBjmmPb3vQrrkedDIcMmMGGj8+m8UPX06yOnC95@lists.infradead.org
X-Gm-Message-State: AOJu0YwwGLinCdZcv4fwe4ORtOg9S2rLOxcbK3iUW/nD8dzo2SEhiVCc
	p6QBKRudHNJqUuJbPJ0D+opLaYEIlIg6VKasEYZhqmCOOlaDh6L1v9F7+Nu1tSKyiP6kWCmLZi8
	pVDwI8jiqud3r09T5ouGeaj4eE5aFC+8=
X-Gm-Gg: AR+sD13NT6jNAUu7BtoRQWNR05XjOHx4dNXahqHsECqkEKt++5Val8yaKzpXUcfmm4R
	dEGfLYdIbDXpC0uhtVo0nYThK50j5l7xcec4FnbODaMGL5U29zNWZ3M/O8Y+IqccG79DbqAbnt5
	aGjIDqrjG6BCcwqEFNdO/nSTmOmSVw2Tqx0XwzgYPOuGh44fmfLykiais4A/LNFqgi84naHqUQc
	XJqFEkKxcLeaUVMerFkb0lm4GH/lIZrNctoq2Gz8321DZhTDianzTNQba1iNniY
X-Received: by 2002:a05:690c:16:b0:81e:68d6:22ab with SMTP id
 00721157ae682-81ef262f4cfmr54289977b3.68.1784625366773; Tue, 21 Jul 2026
 02:16:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260718112448.3289122-1-lgs201920130244@gmail.com> <f60f255b81db1db310276a1acdca412f6070a28b.camel@collabora.com>
In-Reply-To: <f60f255b81db1db310276a1acdca412f6070a28b.camel@collabora.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 21 Jul 2026 17:15:56 +0800
X-Gm-Features: AUfX_my04FUr-X1r_TKcdnYxuTyggU38FunHk98baU-KGlQdSh6A9LRiqDyfCX4
Message-ID: <CANUHTR-0-_zOegBf74bmAFqLgUUgjzqz5B7ydO9+Zyj=XSJ2CA@mail.gmail.com>
Subject: Re: [PATCH v2] media: mtk-jpeg: drain hardware completion before
 freeing context
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Bin Liu <bin.liu@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Fan Wu <fanwu01@zju.edu.cn>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_021608_368875_355899A5 
X-CRM114-Status: GOOD (  34.62  )
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

Hi Nicolas,

On Sat, 18 Jul 2026 at 22:56, Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Le samedi 18 juillet 2026 =C3=A0 19:24 +0800, Guangshuo Li a =C3=A9crit :
> > The change referenced by the Fixes tag cancels ctx->jpeg_work before
> > freeing the JPEG context.
> >
> > That prevents the worker itself from accessing the context after it has
> > been freed. However, the multi-core workers return after programming a
> > hardware instance. The IRQ handler or the per-hardware timeout work can
> > then continue to access the context through hw_param.curr_ctx after the
> > worker has completed.
> >
> > If userspace closes the file while a hardware job is still pending,
> > cancel_work_sync() can return and mtk_jpeg_release() can free the
> > context before the IRQ or timeout path has finished using it.
> >
> > Track the number of in-flight hardware jobs for each context and wait
> > for them to complete in mtk_jpeg_release().
> >
> > Use a per-hardware active flag to ensure that only the IRQ handler or
> > the timeout work completes each job. Clear hw_param.curr_ctx and drop
> > the in-flight count only after the completion path has finished all
> > accesses to the context.
> >
> > Fixes: 34c519feef3e ("media: mtk-jpeg: fix use-after-free in release pa=
th due to uncancelled work")
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> > v2:
> >   - Replace the undefined mtk_jpeg_release_hw() call with per-context
> >     in-flight hardware job tracking.
> >   - Ensure that only the IRQ or timeout path completes each hardware jo=
b.
> >   - Clear hw_param.curr_ctx after the completion path stops using the
> >     context.
> >   - Keep hardware instances busy until the timeout path has finished
> >     accessing their saved context and buffers.
> >
> >  .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 12 ++++++++-
> >  .../platform/mediatek/jpeg/mtk_jpeg_core.h    | 14 +++++++++++
> >  .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  | 25 +++++++++++++------
> >  .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  | 25 +++++++++++++------
> >  4 files changed, 61 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > index d147ec483081..d41c0e0516b9 100644
> > --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > @@ -1161,6 +1161,8 @@ static int mtk_jpeg_open(struct file *file)
> >       }
> >
> >       INIT_WORK(&ctx->jpeg_work, jpeg->variant->jpeg_worker);
> > +     atomic_set(&ctx->hw_jobs, 0);
> > +     init_waitqueue_head(&ctx->hw_jobs_wq);
> >       INIT_LIST_HEAD(&ctx->dst_done_queue);
> >       spin_lock_init(&ctx->done_queue_lock);
> >       v4l2_fh_init(&ctx->fh, vfd);
> > @@ -1202,8 +1204,12 @@ static int mtk_jpeg_release(struct file *file)
> >       struct mtk_jpeg_dev *jpeg =3D video_drvdata(file);
> >       struct mtk_jpeg_ctx *ctx =3D mtk_jpeg_file_to_ctx(file);
> >
> > -     if (jpeg->variant->jpeg_worker)
> > +     if (jpeg->variant->jpeg_worker) {
> >               cancel_work_sync(&ctx->jpeg_work);
> > +             wait_event(ctx->hw_jobs_wq,
> > +                        atomic_read(&ctx->hw_jobs) =3D=3D 0);
> > +     }
> > +
> >       mutex_lock(&jpeg->lock);
> >       v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
>
> The things is that we already paid the price of this complexity in the m2=
m
> framework by synchronously waiting for the last v4l2_m2m_job_finish() to =
be
> called from the driver. I think we should not add a mechanism on top, but=
 rather
> figure-out why this is not working for your usage of this driver.
>
> Nicolas
>
> >       v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
> > @@ -1640,6 +1646,8 @@ static void mtk_jpegenc_worker(struct work_struct=
 *work)
> >       v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> >       v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> >
> > +     atomic_inc(&ctx->hw_jobs);
> > +     atomic_set_release(&comp_jpeg[hw_id]->hw_param.job_active, 1);
> >       schedule_delayed_work(&comp_jpeg[hw_id]->job_timeout_work,
> >                             msecs_to_jiffies(MTK_JPEG_HW_TIMEOUT_MSEC))=
;
> >
> > @@ -1759,6 +1767,8 @@ static void mtk_jpegdec_worker(struct work_struct=
 *work)
> >               goto setdst_end;
> >       }
> >
> > +     atomic_inc(&ctx->hw_jobs);
> > +     atomic_set_release(&comp_jpeg[hw_id]->hw_param.job_active, 1);
> >       schedule_delayed_work(&comp_jpeg[hw_id]->job_timeout_work,
> >                             msecs_to_jiffies(MTK_JPEG_HW_TIMEOUT_MSEC))=
;
> >
> > diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> > index 02ed0ed5b736..be8ada60782a 100644
> > --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> > +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> > @@ -103,6 +103,7 @@ struct mtk_jpeg_hw_param {
> >       struct vb2_v4l2_buffer *src_buffer;
> >       struct vb2_v4l2_buffer *dst_buffer;
> >       struct mtk_jpeg_ctx *curr_ctx;
> > +     atomic_t job_active;
> >  };
> >
> >  enum mtk_jpegenc_hw_id {
> > @@ -282,6 +283,8 @@ struct mtk_jpeg_q_data {
> >   * @restart_interval:                jpeg encoder restart interval
> >   * @ctrl_hdl:                        controls handler
> >   * @jpeg_work:                       jpeg encoder workqueue
> > + * @hw_jobs:                 number of hardware jobs still referencing=
 this context
> > + * @hw_jobs_wq:                      wait queue for hardware job compl=
etion
> >   * @total_frame_num:         encoded frame number
> >   * @dst_done_queue:          encoded frame buffer queue
> >   * @done_queue_lock:         encoded frame operation spinlock
> > @@ -299,6 +302,8 @@ struct mtk_jpeg_ctx {
> >       struct v4l2_ctrl_handler ctrl_hdl;
> >
> >       struct work_struct jpeg_work;
> > +     atomic_t hw_jobs;
> > +     wait_queue_head_t hw_jobs_wq;
> >       u32 total_frame_num;
> >       struct list_head dst_done_queue;
> >       /* spinlock protecting the encode done buffer */
> > @@ -306,4 +311,13 @@ struct mtk_jpeg_ctx {
> >       u32 last_done_frame_num;
> >  };
> >
> > +static inline void
> > +mtk_jpeg_hw_job_done(struct mtk_jpeg_hw_param *hw_param,
> > +                  struct mtk_jpeg_ctx *ctx)
> > +{
> > +     WRITE_ONCE(hw_param->curr_ctx, NULL);
> > +     if (atomic_dec_and_test(&ctx->hw_jobs))
> > +             wake_up(&ctx->hw_jobs_wq);
> > +}
> > +
> >  #endif /* _MTK_JPEG_CORE_H */
> > diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/d=
rivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> > index 32372781daf5..c2d40653891a 100644
> > --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> > +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> > @@ -527,7 +527,12 @@ static void mtk_jpegdec_timeout_work(struct work_s=
truct *work)
> >                            job_timeout_work.work);
> >       struct mtk_jpeg_dev *master_jpeg =3D cjpeg->master_dev;
> >       struct vb2_v4l2_buffer *src_buf, *dst_buf;
> > +     struct mtk_jpeg_ctx *ctx;
> > +
> > +     if (atomic_cmpxchg(&cjpeg->hw_param.job_active, 1, 0) !=3D 1)
> > +             return;
> >
> > +     ctx =3D cjpeg->hw_param.curr_ctx;
> >       src_buf =3D cjpeg->hw_param.src_buffer;
> >       dst_buf =3D cjpeg->hw_param.dst_buffer;
> >       v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
> > @@ -535,11 +540,13 @@ static void mtk_jpegdec_timeout_work(struct work_=
struct *work)
> >       mtk_jpeg_dec_reset(cjpeg->reg_base);
> >       clk_disable_unprepare(cjpeg->jdec_clk.clks->clk);
> >       pm_runtime_put(cjpeg->dev);
> > +     v4l2_m2m_buf_done(src_buf, buf_state);
> > +     mtk_jpegdec_put_buf(cjpeg);
> > +     mtk_jpeg_hw_job_done(&cjpeg->hw_param, ctx);
> > +
> >       cjpeg->hw_state =3D MTK_JPEG_HW_IDLE;
> >       atomic_inc(&master_jpeg->hw_rdy);
> >       wake_up(&master_jpeg->hw_wq);
> > -     v4l2_m2m_buf_done(src_buf, buf_state);
> > -     mtk_jpegdec_put_buf(cjpeg);
> >  }
> >
> >  static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
> > @@ -555,12 +562,10 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int=
 irq, void *priv)
> >       struct mtk_jpegdec_comp_dev *jpeg =3D priv;
> >       struct mtk_jpeg_dev *master_jpeg =3D jpeg->master_dev;
> >
> > -     cancel_delayed_work(&jpeg->job_timeout_work);
> > +     if (atomic_cmpxchg(&jpeg->hw_param.job_active, 1, 0) !=3D 1)
> > +             return IRQ_HANDLED;
> >
> > -     ctx =3D jpeg->hw_param.curr_ctx;
> > -     src_buf =3D jpeg->hw_param.src_buffer;
> > -     dst_buf =3D jpeg->hw_param.dst_buffer;
> > -     v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
> > +     cancel_delayed_work(&jpeg->job_timeout_work);
> >
> >       irq_status =3D mtk_jpeg_dec_get_int_status(jpeg->reg_base);
> >       dec_irq_ret =3D mtk_jpeg_dec_enum_result(irq_status);
> > @@ -570,6 +575,11 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int =
irq, void *priv)
> >       if (dec_irq_ret !=3D MTK_JPEG_DEC_RESULT_EOF_DONE)
> >               dev_warn(jpeg->dev, "Jpg Dec occurs unknown Err.");
> >
> > +     ctx =3D jpeg->hw_param.curr_ctx;
> > +     src_buf =3D jpeg->hw_param.src_buffer;
> > +     dst_buf =3D jpeg->hw_param.dst_buffer;
> > +     v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
> > +
> >       jpeg_src_buf =3D
> >               container_of(src_buf, struct mtk_jpeg_src_buf, b);
> >
> > @@ -582,6 +592,7 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int i=
rq, void *priv)
> >       mtk_jpegdec_put_buf(jpeg);
> >       pm_runtime_put(ctx->jpeg->dev);
> >       clk_disable_unprepare(jpeg->jdec_clk.clks->clk);
> > +     mtk_jpeg_hw_job_done(&jpeg->hw_param, ctx);
> >
> >       jpeg->hw_state =3D MTK_JPEG_HW_IDLE;
> >       wake_up(&master_jpeg->hw_wq);
> > diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/d=
rivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> > index b312a15d707b..b08f94845613 100644
> > --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> > +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> > @@ -257,7 +257,12 @@ static void mtk_jpegenc_timeout_work(struct work_s=
truct *work)
> >       struct mtk_jpeg_dev *master_jpeg =3D cjpeg->master_dev;
> >       enum vb2_buffer_state buf_state =3D VB2_BUF_STATE_ERROR;
> >       struct vb2_v4l2_buffer *src_buf, *dst_buf;
> > +     struct mtk_jpeg_ctx *ctx;
> > +
> > +     if (atomic_cmpxchg(&cjpeg->hw_param.job_active, 1, 0) !=3D 1)
> > +             return;
> >
> > +     ctx =3D cjpeg->hw_param.curr_ctx;
> >       src_buf =3D cjpeg->hw_param.src_buffer;
> >       dst_buf =3D cjpeg->hw_param.dst_buffer;
> >       v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
> > @@ -265,11 +270,13 @@ static void mtk_jpegenc_timeout_work(struct work_=
struct *work)
> >       mtk_jpeg_enc_reset(cjpeg->reg_base);
> >       clk_disable_unprepare(cjpeg->venc_clk.clks->clk);
> >       pm_runtime_put(cjpeg->dev);
> > +     v4l2_m2m_buf_done(src_buf, buf_state);
> > +     mtk_jpegenc_put_buf(cjpeg);
> > +     mtk_jpeg_hw_job_done(&cjpeg->hw_param, ctx);
> > +
> >       cjpeg->hw_state =3D MTK_JPEG_HW_IDLE;
> >       atomic_inc(&master_jpeg->hw_rdy);
> >       wake_up(&master_jpeg->hw_wq);
> > -     v4l2_m2m_buf_done(src_buf, buf_state);
> > -     mtk_jpegenc_put_buf(cjpeg);
> >  }
> >
> >  static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
> > @@ -283,12 +290,10 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int=
 irq, void *priv)
> >       struct mtk_jpegenc_comp_dev *jpeg =3D priv;
> >       struct mtk_jpeg_dev *master_jpeg =3D jpeg->master_dev;
> >
> > -     cancel_delayed_work(&jpeg->job_timeout_work);
> > +     if (atomic_cmpxchg(&jpeg->hw_param.job_active, 1, 0) !=3D 1)
> > +             return IRQ_HANDLED;
> >
> > -     ctx =3D jpeg->hw_param.curr_ctx;
> > -     src_buf =3D jpeg->hw_param.src_buffer;
> > -     dst_buf =3D jpeg->hw_param.dst_buffer;
> > -     v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
> > +     cancel_delayed_work(&jpeg->job_timeout_work);
> >
> >       irq_status =3D readl(jpeg->reg_base + JPEG_ENC_INT_STS) &
> >               JPEG_ENC_INT_STATUS_MASK_ALLIRQ;
> > @@ -297,6 +302,11 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int =
irq, void *priv)
> >       if (!(irq_status & JPEG_ENC_INT_STATUS_DONE))
> >               dev_warn(jpeg->dev, "Jpg Enc occurs unknown Err.");
> >
> > +     ctx =3D jpeg->hw_param.curr_ctx;
> > +     src_buf =3D jpeg->hw_param.src_buffer;
> > +     dst_buf =3D jpeg->hw_param.dst_buffer;
> > +     v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
> > +
> >       result_size =3D mtk_jpeg_enc_get_file_size(jpeg->reg_base,
> >                                                ctx->jpeg->variant->supp=
ort_34bit);
> >       vb2_set_plane_payload(&dst_buf->vb2_buf, 0, result_size);
> > @@ -305,6 +315,7 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int i=
rq, void *priv)
> >       mtk_jpegenc_put_buf(jpeg);
> >       pm_runtime_put(ctx->jpeg->dev);
> >       clk_disable_unprepare(jpeg->venc_clk.clks->clk);
> > +     mtk_jpeg_hw_job_done(&jpeg->hw_param, ctx);
> >
> >       jpeg->hw_state =3D MTK_JPEG_HW_IDLE;
> >       wake_up(&master_jpeg->hw_wq);

Thanks. I agree that the v4l2-m2m framework should normally provide
the required lifetime synchronization.

The reason it does not appear to work for the multi-core path is that
mtk_jpegenc_worker() and mtk_jpegdec_worker() call
v4l2_m2m_job_finish() immediately after programming the hardware, before
the IRQ or timeout completion path has finished using the context.

That clears TRANS_RUNNING, so a later v4l2_m2m_ctx_release() has no
running m2m job to wait for, while hw_param.curr_ctx can still point to
the context and the IRQ or timeout path can still dereference it.

I added the private in-flight tracking because the early job_finish()
also appears to be what allows the m2m scheduler to dispatch additional
jobs to the other hardware instances. Deferring job_finish() until the
IRQ or timeout path would restore the normal framework lifetime
contract, but since v4l2-m2m tracks a single current transaction per
m2m_dev, it also appears to serialize the multi-core variant.

Would you prefer a correctness-first change that moves job_finish() to
the hardware completion paths, accepting that serialization, or is
there an existing v4l2-m2m mechanism for representing several
concurrent hardware jobs that I have missed?

Thanks,
Guangshuo

