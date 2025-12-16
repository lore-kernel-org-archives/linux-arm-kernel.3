Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12FB3D637B3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 21:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qpPwc/ojJwSf06+KkwiepAKE0uK8ZW+OfwBUCLSRmzU=; b=ziTa3ujIR/bJ0ZVkfNHMwLDqVj
	gBSzIwzaWNb3FY60yR4qOJ77iPlZ797M35EMxPxsvIK6sLKPIB+LNeSASkIn+0WFsi+XD7Xsg3qvs
	/zDU/Bz4VnJq8X5MNVmtxVvu4FhZBFNmRsCXuv4/OlT7E5CkzN/gRlnelBQ34G9IV0MvZfGNXWNPl
	/wztJtzAGbvyG3at1UHqtN8BLLpmRxmT2wW8fOWyMi0I7LldXDS14PVOQwD2Eft/8gsHaYFdU7qEj
	+raQoiUFsrvvP4PEMWwE/efikNNpIpTBXgRiVuku5hfWt9mMRIVUZuAO7MaY7t3DvrfrTXoLvrpiK
	EASsID6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVcZb-00000005qC5-3WFl;
	Tue, 16 Dec 2025 21:27:11 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVcZY-00000005qB6-299v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 21:27:09 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-8b2f0f9e4cbso404716785a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 13:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1765920427; x=1766525227; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qpPwc/ojJwSf06+KkwiepAKE0uK8ZW+OfwBUCLSRmzU=;
        b=cF7+51NlmaXQ4AlcVH290zQHlh9MTlbOCmRSc4sR+GyULTYDXdr+9SxUbpaXiHtcYm
         5KOmMHVD+3sqKHja+SPbjAj/DabmMZXu6TSwf4FWEEdniIptcTA54glyYyOGjKXq22Qg
         PFCAnBd3iCvLaXEptWd3c6iPrA6/k61IFPsjgJOAAIq7CWYlVgDf/hSN8S4jUsWTDTXj
         Eb59m1Wq6dW1UIHNbpAq90DkF/yJzTdFnk+S8/5tV+oXIh8TCQde9z4xX26WPdIVsHOb
         RkXjCJKpfF3Ve0yMT7GmNNBt0YTCfOa5pq430YrRWvnUTbc9NGBaWqwZZNo3xiP6Ni4w
         pp0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765920427; x=1766525227;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qpPwc/ojJwSf06+KkwiepAKE0uK8ZW+OfwBUCLSRmzU=;
        b=SMLRv5QRKo/eXYLLFJdSscvnKxtQgAF55K2ykB20oKOoq6mi+z4Cw/iFAlF5zYcaeh
         TxIqpAZCHjKzjSxhNFwly1KZWsU8TiSEeTljEca8jrMxENrywKVdVZmDyIex0G507VF8
         fQChSqMz2j2m5UVbFaqGus/Kr2lqaqh7I5645VmgN5nW81moM8/S/IeBo49NQHWjNqFb
         U93J5iMF8+XrTfbxnyTluAF9cA9p+X/n7oFQKlaP0mTCYjhz5gvteJvQByWk3YdaSLM0
         3kqOBxfmxohlkNa4wUFO616zL7LsOzAEqG6VEpfN4RI1JsgvJBMDrG83hcAEonA/OH2/
         oyYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxCFeYD2PrmX9mM/Fdv3H2aGkYz/6LYSQcFlKLbjnHVUHdObyXhN5aaNO71+yS7WMzj0kNbqagixesK2jZ75jQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwR8TFZ9/4d/9WMv6z5tAiaZdYi4djzVGWpDuOoscQvu9vun5iD
	QiRP6HE4y2D5kXvyMm9NKdAh+U1xLZjeAODmXSKR1qgN/m6sK4zuZyvudbss2ZK3T48=
X-Gm-Gg: AY/fxX4UUFEg/UtKvp3TE7tV4ywW6XEhdMxJtecQDzLfTJWeIdaPAbalmA8FmJkuOqG
	XBQl9lI53hIeQVt/N3h0S5qcoT/jCRTpjmOzkRuuRrq/mFoi1Rgwiy8ZJuV/yIhcTUJGqMpdok4
	Zj1T3Pjq1Codp5deJJFuXZ++qS6F86fBhViuWDZuxQBYuLmjOsSOfmPojGj0BwLHr3v76TEbkBS
	91ux6X3NnHWE0NdrNR1+bF5xyP/JN5F7dyZ9KjaWDPBPTE9WLr0My0gFEKohK7nsrjqfGvlhWAp
	FXXG00x9FbP4ef3g44L20hUzJ5WWEc391c8+Q6E+E81WbeZOhIIZK46z+OTJDi0X9akwsOzHlgb
	K1I1MXk837vvdjSNT1tmR6RLKXfDA6F9O93b+GLmJyiDVvLXNC4NlYvQ1rfrNOu13hsRr1onFGq
	6BKI/QSgq4/RuQunJe
X-Google-Smtp-Source: AGHT+IFtjPlaAXNAStcB6qE9OAu4UAvfU1mAV30voPQRRG7UOeEXE3kEWcnteyKszbCeZlPTCE1H5A==
X-Received: by 2002:a05:620a:3186:b0:89f:cc73:386 with SMTP id af79cd13be357-8bb397de8d9mr1984233485a.13.1765920427047;
        Tue, 16 Dec 2025 13:27:07 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8be30d86a2dsm263024485a.15.2025.12.16.13.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 13:27:06 -0800 (PST)
Message-ID: <bf9d84ad6973d55f40bafdb9a70dc49178d4af10.camel@ndufresne.ca>
Subject: Re: [PATCH v11 04/12] media: mediatek: jpeg: fix stop streaming
 flow for multi-core
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Tue, 16 Dec 2025 16:27:05 -0500
In-Reply-To: <20251202094800.6140-5-kyrie.wu@mediatek.com>
References: <20251202094800.6140-1-kyrie.wu@mediatek.com>
	 <20251202094800.6140-5-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-hrmOcurXokVRwIdeYyvP"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_132708_611080_5EA16E33 
X-CRM114-Status: GOOD (  26.02  )
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


--=-hrmOcurXokVRwIdeYyvP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 02 d=C3=A9cembre 2025 =C3=A0 17:47 +0800, Kyrie Wu a =C3=A9crit=C2=
=A0:
> For jpeg multi-core architecture, if all hardware run at the
> same time, some input and output buffers are occupied.
> If one hardware is completed firstly, while other hardwares are

is compelted -> completes
harwares -> core, matches mtk_jpeg_core.c file name

> still running. The decoding completion signal calls

decoding -> decode.

> mtk_jpeg_dec_stop_streaming, and the function of v4l2_m2m_buf_done
> is called in mtk_jpeg_dec_stop_streaming to complete all
> input/output buffers. However, some buffers are occupied by other
> hardwares, resulting in errors. It needs to add a counter to
> calculate the used decoding buffer counts, it will increase 1 when
> the buffer set to hardware and decrease to 0 until the all buffers
> decoded and the function could continue to be executed.

More things to fix, also same for other of your commits, please reflow betw=
een
70 and 75 as suggested in the guide. It should look even.

>=20
> Fixes: 0fa49df4222f ("media: mtk-jpegdec: support jpegdec multi-hardware"=
)
> Fixes: dedc21500334 ("media: mtk-jpegdec: add jpeg decode worker interfac=
e")
> Fixes: 934e8bccac95 ("mtk-jpegenc: support jpegenc multi-hardware")
> Fixes: 5fb1c2361e56 ("mtk-jpegenc: add jpeg encode worker interface")
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
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index bd0afc93d491..59fd79c89f88 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -857,8 +857,12 @@ static struct vb2_v4l2_buffer *mtk_jpeg_buf_remove(s=
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

Can't it simply be solved with vb2_wait_for_all_buffers() ?

Nicolas

> =C2=A0	while ((vb =3D mtk_jpeg_buf_remove(ctx, q->type)))
> =C2=A0		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);
> =C2=A0}
> @@ -866,6 +870,7 @@ static void mtk_jpeg_enc_stop_streaming(struct vb2_qu=
eue *q)
> =C2=A0static void mtk_jpeg_dec_stop_streaming(struct vb2_queue *q)
> =C2=A0{
> =C2=A0	struct mtk_jpeg_ctx *ctx =3D vb2_get_drv_priv(q);
> +	struct mtk_jpeg_dev *jpeg =3D ctx->jpeg;
> =C2=A0	struct vb2_v4l2_buffer *vb;
> =C2=A0
> =C2=A0	/*
> @@ -873,6 +878,9 @@ static void mtk_jpeg_dec_stop_streaming(struct vb2_qu=
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
> @@ -1181,6 +1189,7 @@ static int mtk_jpeg_open(struct file *file)
> =C2=A0	spin_lock_init(&ctx->done_queue_lock);
> =C2=A0	v4l2_fh_init(&ctx->fh, vfd);
> =C2=A0	v4l2_fh_add(&ctx->fh, file);
> +	atomic_set(&ctx->buf_list_cnt, 0);
> =C2=A0
> =C2=A0	ctx->jpeg =3D jpeg;
> =C2=A0	ctx->fh.m2m_ctx =3D v4l2_m2m_ctx_init(jpeg->m2m_dev, ctx,
> @@ -1563,6 +1572,11 @@ static int mtk_jpegdec_set_hw_param(struct mtk_jpe=
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
> @@ -1671,6 +1685,7 @@ static void mtk_jpegenc_worker(struct work_struct *=
work)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 &src_buf->vb2_buf);
> =C2=A0	mtk_jpeg_set_enc_params(ctx, comp_jpeg[hw_id]->reg_base);
> =C2=A0	mtk_jpeg_enc_start(comp_jpeg[hw_id]->reg_base);
> +	jpeg_buf_queue_inc(ctx);
> =C2=A0	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
> =C2=A0	spin_unlock_irqrestore(&comp_jpeg[hw_id]->hw_lock, flags);
> =C2=A0
> @@ -1786,6 +1801,7 @@ static void mtk_jpegdec_worker(struct work_struct *=
work)
> =C2=A0				&bs,
> =C2=A0				&fb);
> =C2=A0	mtk_jpeg_dec_start(comp_jpeg[hw_id]->reg_base);
> +	jpeg_buf_queue_inc(ctx);
> =C2=A0	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
> =C2=A0	spin_unlock_irqrestore(&comp_jpeg[hw_id]->hw_lock, flags);
> =C2=A0
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> index 148fd41759b7..33f7fbc4ca5e 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> @@ -288,6 +288,7 @@ struct mtk_jpeg_q_data {
> =C2=A0 * @dst_done_queue:		encoded frame buffer queue
> =C2=A0 * @done_queue_lock:		encoded frame operation spinlock
> =C2=A0 * @last_done_frame_num:	the last encoded frame number
> + * @buf_list_cnt:		the frame buffer count own by jpeg driver
> =C2=A0 */
> =C2=A0struct mtk_jpeg_ctx {
> =C2=A0	struct mtk_jpeg_dev		*jpeg;
> @@ -306,6 +307,7 @@ struct mtk_jpeg_ctx {
> =C2=A0	/* spinlock protecting the encode done buffer */
> =C2=A0	spinlock_t done_queue_lock;
> =C2=A0	u32 last_done_frame_num;
> +	atomic_t buf_list_cnt;
> =C2=A0};
> =C2=A0
> =C2=A0#endif /* _MTK_JPEG_CORE_H */
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> index a1e54715cb7e..84d12eea35f7 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> @@ -519,6 +519,11 @@ static void mtk_jpegdec_put_buf(struct mtk_jpegdec_c=
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
> @@ -527,9 +532,11 @@ static void mtk_jpegdec_timeout_work(struct work_str=
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
> @@ -540,6 +547,7 @@ static void mtk_jpegdec_timeout_work(struct work_stru=
ct *work)
> =C2=A0	wake_up(&master_jpeg->hw_wq);
> =C2=A0	v4l2_m2m_buf_done(src_buf, buf_state);
> =C2=A0	mtk_jpegdec_put_buf(cjpeg);
> +	jpeg_buf_queue_dec(ctx);
> =C2=A0}
> =C2=A0
> =C2=A0static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
> @@ -580,6 +588,7 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq=
, void *priv)
> =C2=A0	buf_state =3D VB2_BUF_STATE_DONE;
> =C2=A0	v4l2_m2m_buf_done(src_buf, buf_state);
> =C2=A0	mtk_jpegdec_put_buf(jpeg);
> +	jpeg_buf_queue_dec(ctx);
> =C2=A0	pm_runtime_put(ctx->jpeg->dev);
> =C2=A0	clk_disable_unprepare(jpeg->jdec_clk.clks->clk);
> =C2=A0
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> index 28d05909c96f..1862444f35f5 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> @@ -248,6 +248,11 @@ static void mtk_jpegenc_put_buf(struct mtk_jpegenc_c=
omp_dev *jpeg)
> =C2=A0	spin_unlock_irqrestore(&ctx->done_queue_lock, flags);
> =C2=A0}
> =C2=A0
> +static void jpeg_buf_queue_enc(struct mtk_jpeg_ctx *ctx)
> +{
> +	atomic_dec(&ctx->buf_list_cnt);
> +}
> +
> =C2=A0static void mtk_jpegenc_timeout_work(struct work_struct *work)
> =C2=A0{
> =C2=A0	struct delayed_work *dly_work =3D to_delayed_work(work);
> @@ -258,9 +263,11 @@ static void mtk_jpegenc_timeout_work(struct work_str=
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
> @@ -271,6 +278,7 @@ static void mtk_jpegenc_timeout_work(struct work_stru=
ct *work)
> =C2=A0	wake_up(&master_jpeg->hw_wq);
> =C2=A0	v4l2_m2m_buf_done(src_buf, buf_state);
> =C2=A0	mtk_jpegenc_put_buf(cjpeg);
> +	jpeg_buf_queue_enc(ctx);
> =C2=A0}
> =C2=A0
> =C2=A0static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
> @@ -304,6 +312,7 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq=
, void *priv)
> =C2=A0	buf_state =3D VB2_BUF_STATE_DONE;
> =C2=A0	v4l2_m2m_buf_done(src_buf, buf_state);
> =C2=A0	mtk_jpegenc_put_buf(jpeg);
> +	jpeg_buf_queue_enc(ctx);
> =C2=A0	pm_runtime_put(ctx->jpeg->dev);
> =C2=A0	clk_disable_unprepare(jpeg->venc_clk.clks->clk);
> =C2=A0

--=-hrmOcurXokVRwIdeYyvP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUHOqQAKCRDZQZRRKWBy
9LnXAP9/A/m0O050auffdCmga5tYXeI/6re+ffgCRjPOcyPQUwD/fMHBNoO7F3CB
kkLfUe1Cz72voTA7nOv8EGNDVGbolQc=
=iUHr
-----END PGP SIGNATURE-----

--=-hrmOcurXokVRwIdeYyvP--

