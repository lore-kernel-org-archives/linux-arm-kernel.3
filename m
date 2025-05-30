Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77AF8C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 17:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OGIt7fGfLkqkmefeoi/6+HBzHwhg6ItEe9YbKim/Fn4=; b=VBHC/UI7ykmeojA2Zp4Tn1hJTG
	5rmVnkvarsoUpxNd4QVWaM4wHT8rrLDmL4eOThBhRz8Zw7gVWZIqN0Eikp5nrFjIc+43xeCN1ktPz
	GQ67TwXzrqgMLWtiiltgl+bgytT36NRPvsb3R2fOaFNjv6tTtyDOw/U399nqu4JZchMEsTYclDvT1
	Fc6F+3brVg7j49X1DiqdQVrINCl/oyXLcmC+fo4jYPRyk3Z9iOz9OfL2DD+enrGWqo8tIt9dkT01o
	d8eEfIcgsX1AS66XLsTwiiDfwYYhPKdn7AmQt0koZpd24qL1BA91ia5seETm6qIP/PcTdCqP0gs3R
	0om+QNuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL3o4-00000001R6M-4479;
	Fri, 30 May 2025 17:46:12 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL3ig-00000001QQg-22Mf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 17:40:39 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-6f8d8fb211eso21723056d6.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 10:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1748626837; x=1749231637; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OGIt7fGfLkqkmefeoi/6+HBzHwhg6ItEe9YbKim/Fn4=;
        b=Gv8XcGRVhyFYnF7ILb6nc8zPFpSXF8/OWANlDYs/3jn3GyPamu0xFn7UGaNNC/0dSc
         haa3+E+gCSezX04/EwDQuWfJR6wg0uOedsDxjDKU7TNHEo5lHobGr6gy58e1sgz49qWc
         llhN6n4KTO6DTehiZSLmZcAgVEubBmPW6j5tyUFwhS3jtv7wEKbMmmUwKleWBW5Yke9X
         +SjoGbdTcSEdVvWHC5o2DC/fsSk23qwYBipnaBOxoteBAQmsZEjLnU88gvLrCmpfVibb
         pQ2DRBnccGHAAOXa8nuLiwO1OEwzx22lvqcHjsmuTPmrguJ+vu4C6OLnJs7C142dNYXG
         qQrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748626837; x=1749231637;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OGIt7fGfLkqkmefeoi/6+HBzHwhg6ItEe9YbKim/Fn4=;
        b=AFoHn4uQF3vZ8jaAwiSwBl0PDRwBz2Eg5VpPjnhz4kdETOeTEhgkjQXne3HHMvpxPp
         4BcHD1bEZAw09eklkSVqpCaeqsLGh5Wg0QGdKxcDw3zv3zh8O36lzDYAVLNv4KIdy5y3
         aSH+xYi1EY2hpXBd4vx71LNraBZE5hm2z84xfQCSXBb26oR56LziX8dCzlwjSPeMTyDF
         2rVyTD3hRyQnvDt/ozMGv+DOvKXxBJ5wf3/mOWYvbMt3M8KmsfOLAHlAc3TDjdjsS432
         YNUVKTtY4qFhJGFAdKCn2AGZ2WWtzB+abp4HdxyuxCQrXav8si7/2s77nJh5GVHU26/B
         NEfg==
X-Forwarded-Encrypted: i=1; AJvYcCXceLTpI+AbMn+Z1V7ySgicuuoy7cYUhC4w38AL0gi+NK/mvUGzaZkhmLbbABqXVQipgOZHQZf80ui6AQ75HUNS@lists.infradead.org
X-Gm-Message-State: AOJu0YxuqMc3+kQwtq5Zq7+JamrsWUe65IxIovyX9NQHCg5iCe6EH4AV
	MfgyM1bmf3Ii+mTBw3SEgvsAbMBrRSFY3/ePMR/ZLmUcKNGmMMUO6fXbe/TVwF5hjRg=
X-Gm-Gg: ASbGnctx7hJcmBzoarK5Umb4Eaf+A3cxSg65JuXzA2wa8/VhYL/IrQUFjmcFuoRHmgD
	rHCU+mFbYO6IStDogxJG8bWlwHANUcAeARufvesNRs3y9URPpG4BeU6WR0BN3JMEUke1tenqBpT
	ZKrAteC8x+ePUOlziuab5wNR1xZyovyX3jwF6pi7WQ2yVSO+db1RxIaIyh3g1WGlbxKlU03QPZ/
	EJ79R4Wp+6ZPHnYSeVya4JJEscivUFYKACDUGWHi79vHaP2xT/hY4t/dREie+2RP+EhXBZhQ7NC
	tYdG6wxNYDuJoLgVOAwSP/emDoTa/7U7udT+HuX2XGMBN9uOb/mJc/HT
X-Google-Smtp-Source: AGHT+IFFphelem2lT7rPHImGcfd36APqsIVAJRjaAQXe+AmpHPVBtHn4sk8+HSeIEdlDtXFWhnj1Hg==
X-Received: by 2002:ad4:5d49:0:b0:6eb:2fd4:30a7 with SMTP id 6a1803df08f44-6facec00e29mr76555746d6.33.1748626837277;
        Fri, 30 May 2025 10:40:37 -0700 (PDT)
Received: from ?IPv6:2606:6d00:10:5285::5ac? ([2606:6d00:10:5285::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a0e35e4sm269580285a.15.2025.05.30.10.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 10:40:36 -0700 (PDT)
Message-ID: <8ff9cf88b2498e4bfd4c12b9c01cfaf046b92fd6.camel@ndufresne.ca>
Subject: Re: [PATCH v5 08/12] media: mediatek: jpeg: fix stop streaming flow
 for multi-core
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: srv_heupstream@mediatek.com
Date: Fri, 30 May 2025 13:40:35 -0400
In-Reply-To: <20250530074537.26338-9-kyrie.wu@mediatek.com>
References: <20250530074537.26338-1-kyrie.wu@mediatek.com>
	 <20250530074537.26338-9-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_104038_528375_FA02BCE7 
X-CRM114-Status: GOOD (  23.22  )
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

Hi,

Le vendredi 30 mai 2025 =C3=A0 15:45 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
> 1. For multi-core jpegdec, the all hws may run at the same time,
> if one hw decoded firstly, the function of mtk_jpeg_dec_stop_streaming
> would be called, but others input buffers are decoding, this will
> cause some running buffers to be buffer done, causing errors;
> 2. add a parameter to calculate the decoding buffer counts, it
> wil decrease to 0 until the all buffers decoded and the
> mtk_jpeg_dec_stop_streaming could continue to be executed.

This one is equally unclear to me. If you run different queues per core,
why does this matter ?

Nicolas

>=20
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---
> =C2=A0.../media/platform/mediatek/jpeg/mtk_jpeg_core.c | 16 +++++++++++++=
+++
> =C2=A0.../media/platform/mediatek/jpeg/mtk_jpeg_core.h |=C2=A0 2 ++
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 9 +++++++++
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 9 +++++++++
> =C2=A04 files changed, 36 insertions(+)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 7e3509be6f69..1d3df1230191 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -861,8 +861,12 @@ static struct vb2_v4l2_buffer *mtk_jpeg_buf_remove(s=
truct mtk_jpeg_ctx *ctx,
> =C2=A0static void mtk_jpeg_enc_stop_streaming(struct vb2_queue *q)
> =C2=A0{
> =C2=A0	struct mtk_jpeg_ctx *ctx =3D vb2_get_drv_priv(q);
> +	struct mtk_jpeg_dev *jpeg =3D ctx->jpeg;
> =C2=A0	struct vb2_v4l2_buffer *vb;
> =C2=A0
> +	if (jpeg->variant->multi_core)
> +		wait_event(jpeg->hw_wq, (atomic_read(&ctx->buf_list_cnt) =3D=3D 0));
> +
> =C2=A0	while ((vb =3D mtk_jpeg_buf_remove(ctx, q->type)))
> =C2=A0		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);
> =C2=A0}
> @@ -870,6 +874,7 @@ static void mtk_jpeg_enc_stop_streaming(struct vb2_qu=
eue *q)
> =C2=A0static void mtk_jpeg_dec_stop_streaming(struct vb2_queue *q)
> =C2=A0{
> =C2=A0	struct mtk_jpeg_ctx *ctx =3D vb2_get_drv_priv(q);
> +	struct mtk_jpeg_dev *jpeg =3D ctx->jpeg;
> =C2=A0	struct vb2_v4l2_buffer *vb;
> =C2=A0
> =C2=A0	/*
> @@ -877,6 +882,9 @@ static void mtk_jpeg_dec_stop_streaming(struct vb2_qu=
eue *q)
> =C2=A0	 * Before STREAMOFF, we still have to return the old resolution an=
d
> =C2=A0	 * subsampling. Update capture queue when the stream is off.
> =C2=A0	 */
> +	if (jpeg->variant->multi_core)
> +		wait_event(jpeg->hw_wq, (atomic_read(&ctx->buf_list_cnt) =3D=3D 0));
> +
> =C2=A0	if (ctx->state =3D=3D MTK_JPEG_SOURCE_CHANGE &&
> =C2=A0	=C2=A0=C2=A0=C2=A0 V4L2_TYPE_IS_CAPTURE(q->type)) {
> =C2=A0		struct mtk_jpeg_src_buf *src_buf;
> @@ -1186,6 +1194,7 @@ static int mtk_jpeg_open(struct file *file)
> =C2=A0	v4l2_fh_init(&ctx->fh, vfd);
> =C2=A0	file->private_data =3D &ctx->fh;
> =C2=A0	v4l2_fh_add(&ctx->fh);
> +	atomic_set(&ctx->buf_list_cnt, 0);
> =C2=A0
> =C2=A0	ctx->jpeg =3D jpeg;
> =C2=A0	ctx->fh.m2m_ctx =3D v4l2_m2m_ctx_init(jpeg->m2m_dev, ctx,
> @@ -1568,6 +1577,11 @@ static int mtk_jpegdec_set_hw_param(struct mtk_jpe=
g_ctx *ctx,
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static void jpeg_buf_queue_inc(struct mtk_jpeg_ctx *ctx)
> +{
> +	atomic_inc(&ctx->buf_list_cnt);
> +}
> +
> =C2=A0static irqreturn_t mtk_jpeg_enc_done(struct mtk_jpeg_dev *jpeg)
> =C2=A0{
> =C2=A0	struct mtk_jpeg_ctx *ctx;
> @@ -1693,6 +1707,7 @@ static void mtk_jpegenc_worker(struct work_struct *=
work)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 &src_buf->vb2_buf);
> =C2=A0	mtk_jpeg_set_enc_params(ctx, comp_jpeg[hw_id]->reg_base);
> =C2=A0	mtk_jpeg_enc_start(comp_jpeg[hw_id]->reg_base);
> +	jpeg_buf_queue_inc(ctx);
> =C2=A0	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
> =C2=A0	spin_unlock_irqrestore(&comp_jpeg[hw_id]->hw_lock, flags);
> =C2=A0
> @@ -1825,6 +1840,7 @@ static void mtk_jpegdec_worker(struct work_struct *=
work)
> =C2=A0				&bs,
> =C2=A0				&fb);
> =C2=A0	mtk_jpeg_dec_start(comp_jpeg[hw_id]->reg_base);
> +	jpeg_buf_queue_inc(ctx);
> =C2=A0	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
> =C2=A0	spin_unlock_irqrestore(&comp_jpeg[hw_id]->hw_lock, flags);
> =C2=A0
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> index 186cd1862028..6e8304680393 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> @@ -303,6 +303,7 @@ struct mtk_jpeg_q_data {
> =C2=A0 * @dst_done_queue:		encoded frame buffer queue
> =C2=A0 * @done_queue_lock:		encoded frame operation spinlock
> =C2=A0 * @last_done_frame_num:	the last encoded frame number
> + * @buf_list_cnt:		the frame buffer count own by jpeg driver
> =C2=A0 */
> =C2=A0struct mtk_jpeg_ctx {
> =C2=A0	struct mtk_jpeg_dev		*jpeg;
> @@ -321,6 +322,7 @@ struct mtk_jpeg_ctx {
> =C2=A0	/* spinlock protecting the encode done buffer */
> =C2=A0	spinlock_t done_queue_lock;
> =C2=A0	u32 last_done_frame_num;
> +	atomic_t buf_list_cnt;
> =C2=A0};
> =C2=A0
> =C2=A0#endif /* _MTK_JPEG_CORE_H */
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> index 2200f3b628dc..2e6da8617484 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> @@ -522,6 +522,11 @@ static void mtk_jpegdec_put_buf(struct mtk_jpegdec_c=
omp_dev *jpeg)
> =C2=A0	spin_unlock_irqrestore(&ctx->done_queue_lock, flags);
> =C2=A0}
> =C2=A0
> +static void jpeg_buf_queue_dec(struct mtk_jpeg_ctx *ctx)
> +{
> +	atomic_dec(&ctx->buf_list_cnt);
> +}
> +
> =C2=A0static void mtk_jpegdec_timeout_work(struct work_struct *work)
> =C2=A0{
> =C2=A0	enum vb2_buffer_state buf_state =3D VB2_BUF_STATE_ERROR;
> @@ -530,9 +535,11 @@ static void mtk_jpegdec_timeout_work(struct work_str=
uct *work)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 job_timeout_work.work);
> =C2=A0	struct mtk_jpeg_dev *master_jpeg =3D cjpeg->master_dev;
> =C2=A0	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> +	struct mtk_jpeg_ctx *ctx;
> =C2=A0
> =C2=A0	src_buf =3D cjpeg->hw_param.src_buffer;
> =C2=A0	dst_buf =3D cjpeg->hw_param.dst_buffer;
> +	ctx =3D cjpeg->hw_param.curr_ctx;
> =C2=A0	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
> =C2=A0
> =C2=A0	mtk_jpeg_dec_reset(cjpeg->reg_base);
> @@ -543,6 +550,7 @@ static void mtk_jpegdec_timeout_work(struct work_stru=
ct *work)
> =C2=A0	wake_up(&master_jpeg->hw_wq);
> =C2=A0	v4l2_m2m_buf_done(src_buf, buf_state);
> =C2=A0	mtk_jpegdec_put_buf(cjpeg);
> +	jpeg_buf_queue_dec(ctx);
> =C2=A0}
> =C2=A0
> =C2=A0static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
> @@ -583,6 +591,7 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq=
, void *priv)
> =C2=A0	buf_state =3D VB2_BUF_STATE_DONE;
> =C2=A0	v4l2_m2m_buf_done(src_buf, buf_state);
> =C2=A0	mtk_jpegdec_put_buf(jpeg);
> +	jpeg_buf_queue_dec(ctx);
> =C2=A0	pm_runtime_put(ctx->jpeg->dev);
> =C2=A0	clk_disable_unprepare(jpeg->jdec_clk.clks->clk);
> =C2=A0
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> index 4c264c14ad83..ff73393a2417 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> @@ -251,6 +251,11 @@ static void mtk_jpegenc_put_buf(struct mtk_jpegenc_c=
omp_dev *jpeg)
> =C2=A0	spin_unlock_irqrestore(&ctx->done_queue_lock, flags);
> =C2=A0}
> =C2=A0
> +static void jpeg_buf_queue_dec(struct mtk_jpeg_ctx *ctx)
> +{
> +	atomic_dec(&ctx->buf_list_cnt);
> +}
> +
> =C2=A0static void mtk_jpegenc_timeout_work(struct work_struct *work)
> =C2=A0{
> =C2=A0	struct delayed_work *dly_work =3D to_delayed_work(work);
> @@ -261,9 +266,11 @@ static void mtk_jpegenc_timeout_work(struct work_str=
uct *work)
> =C2=A0	struct mtk_jpeg_dev *master_jpeg =3D cjpeg->master_dev;
> =C2=A0	enum vb2_buffer_state buf_state =3D VB2_BUF_STATE_ERROR;
> =C2=A0	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> +	struct mtk_jpeg_ctx *ctx;
> =C2=A0
> =C2=A0	src_buf =3D cjpeg->hw_param.src_buffer;
> =C2=A0	dst_buf =3D cjpeg->hw_param.dst_buffer;
> +	ctx =3D cjpeg->hw_param.curr_ctx;
> =C2=A0	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
> =C2=A0
> =C2=A0	mtk_jpeg_enc_reset(cjpeg->reg_base);
> @@ -274,6 +281,7 @@ static void mtk_jpegenc_timeout_work(struct work_stru=
ct *work)
> =C2=A0	wake_up(&master_jpeg->hw_wq);
> =C2=A0	v4l2_m2m_buf_done(src_buf, buf_state);
> =C2=A0	mtk_jpegenc_put_buf(cjpeg);
> +	jpeg_buf_queue_dec(ctx);
> =C2=A0}
> =C2=A0
> =C2=A0static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
> @@ -307,6 +315,7 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq=
, void *priv)
> =C2=A0	buf_state =3D VB2_BUF_STATE_DONE;
> =C2=A0	v4l2_m2m_buf_done(src_buf, buf_state);
> =C2=A0	mtk_jpegenc_put_buf(jpeg);
> +	jpeg_buf_queue_dec(ctx);
> =C2=A0	pm_runtime_put(ctx->jpeg->dev);
> =C2=A0	clk_disable_unprepare(jpeg->venc_clk.clks->clk);
> =C2=A0

