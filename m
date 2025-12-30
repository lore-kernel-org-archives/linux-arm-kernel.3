Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F943E95A8D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 13:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bg1+ls4Dm0mVYOjkWjZgFsYapx+e4w8tJTjnMs5lrKs=; b=dLcM+TlF0BLQVqGqJupX2FnPrK
	xal4d5P9oPzsnvHfKj9iLMzvVEMTkRTOcObNvfPY2BDVEAdnY4ixMZKgx1Yz0PcYQYUGvtuDI0Hcx
	F/WK+VF0oDjGtR3aNKu3bQDL52i9V6YST5Nfgp/9/X+Bj4pKQjVJhKcBFXh6tvcpL1+H1ul3qdk0H
	n4pU5LW16keLCs3SF2gCU+3zADRrU4YVUmno3MxXp1XmpWKw6+bEXGjwfwI1QQjoeSFw6A4TbqiFV
	CnDOjGRKvdGwz312cYDRg8jNzN7p8rvgSnjIOSlvtYDeqa+rvYQ7mRMEoHDd6Ek+vUIdrhRh9gDUJ
	KwZ68INQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaZx4-00000004sCO-2OiH;
	Tue, 30 Dec 2025 13:39:54 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaZx1-00000004sBX-3Gif
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 13:39:53 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5957ac0efc2so10716911e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 05:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767101989; x=1767706789; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Bg1+ls4Dm0mVYOjkWjZgFsYapx+e4w8tJTjnMs5lrKs=;
        b=GKBZm3FcV9pOc7hEsYJEoeLFuLqcHzKcCdql7HTGz9eIdlZy/B50yfCkRBwMF0hOSK
         ES3HtJ8y2qHd20sOb+bBAH4+9lQqWchHspzNvcDCVAgXmeYMBJF4lrWTYpYZZc36Del4
         ejCs3kua+F3Icjo1KtHF7qlxxCyRZu5L6BT4N8TN6ZpHvYOnr+4DB7838GiXfl299dPi
         koFWlcTj03DOvgQPwyCoOXPnAPmBJ8k7Ybhryw6rivfh22BMv3jKD4vcVD1tVw+777nZ
         +Oc21VnM4R6ngAQrSjrsOudlD/ruS45Quq+jkHwInLpW1nCEvPq3ynfzMPcjRpLRTgQU
         4Qcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767101989; x=1767706789;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bg1+ls4Dm0mVYOjkWjZgFsYapx+e4w8tJTjnMs5lrKs=;
        b=O/fTRM78T25+n/7zpR3/5KCDnB21aIYfg2sW6vrk/yTJv2MkqPC56E9pbWFG4g2Wz+
         8QgrL49aG3BuR0jIBSoumlNVJDNo7Shp/0NCMExl9A0qAXvmJlV2xivBdJLBrtdiyGlX
         KnAVGpB92w1FeTY3Hum0AWqt0edLwlqMz3Ogk4brVNfJprwOev3HlyLdwe9Zn8LPVH8b
         meDMGwyC2jLFlBGhJf5CY5acc4OnhIBgr0MPEbjZP3vGLHi82DcqJ4VyS7StMF1zTksK
         qEYR05O9J75g2+vLuUpHYJ3V5xytKuYA8Sqm37b1kmCLnRoyDKJyc+fxffSEGbiedJem
         Kzig==
X-Forwarded-Encrypted: i=1; AJvYcCVI3b8f20QKeFtfMjkGZdg5JqBPq7UgQUTdOYHanTU9gmOkbgRcNcVFEOAIpw0gs/B3jBYWsM6uRczNBdqa8WpY@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6EOTsGgynAAblmOrH3BGOy0ZfsbbhlefD/9O0IDmXBfQEJfAx
	ZOzv+QH6XpQwbXrFaQDfgh6e+rUD8bBAEN/2KvMxGWcngsBO/Wy+qNP0hbeza5SE5r4c4B/NGJu
	b3j846z1Yt7PNPXL8+xQq/Nhrj0rkHYKBVGWiKGAQbg==
X-Gm-Gg: AY/fxX4mh3fcKzf9aIXxTTnx2nE7KG7KPgygc/IBugEKJcjlKv2ulAikSp2yeTW3M/l
	dMazKocgMdIl/jhiBaYE4zHQU8PoOxC96BexMAHHmr71vnde21wK+x7KmOS6/P/DBbAipirKawh
	9xkqvfqyqibfAvkwpo8/rTdnV4lBkQUSK2ODqKOkBI2E5fmYcFMekdWDsSFdkexUNXz5zUlVLLh
	AsX+mdLjuMWobPRpdn293GGjA5Q2U0bcocgIrE8yWyDgG6PA76Ek+2LOKCMoC5cLQEMxQBd
X-Google-Smtp-Source: AGHT+IFc2q13TthZOLNMt7KlXgzpHYzWQ4Oc1qku0cPr+yLi0Y1e7lT6nY190irxS/Myr4DyEyhRfiOI15TA9SqTEa4=
X-Received: by 2002:a05:6512:b20:b0:594:2870:9774 with SMTP id
 2adb3069b0e04-59a17d670f6mr11077610e87.38.1767101988845; Tue, 30 Dec 2025
 05:39:48 -0800 (PST)
MIME-Version: 1.0
References: <20251205015428.643-1-ming.qian@oss.nxp.com> <20251205015428.643-2-ming.qian@oss.nxp.com>
In-Reply-To: <20251205015428.643-2-ming.qian@oss.nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 30 Dec 2025 14:39:12 +0100
X-Gm-Features: AQt7F2p9Tp60FXm9JL954U-IrjyLLANKEoHVrFFumJZKPA0geVKKGoJbY19yu5A
Message-ID: <CAPDyKFpt-GL-RFcJ5mTWFqaRfy1dQJ7LL8OBCoQK0+zPDFEzsg@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] media: v4l2-mem2mem: Add a kref to the
 v4l2_m2m_dev structure
To: ming.qian@oss.nxp.com
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	nicolas@ndufresne.ca, benjamin.gaignard@collabora.com, p.zabel@pengutronix.de, 
	sebastian.fricke@collabora.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, 
	l.stach@pengutronix.de, Frank.li@nxp.com, peng.fan@nxp.com, 
	eagle.zhou@nxp.com, imx@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_053951_901816_B0437402 
X-CRM114-Status: GOOD (  26.78  )
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

On Fri, 5 Dec 2025 at 02:55, <ming.qian@oss.nxp.com> wrote:
>
> From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>
> Adding a reference count to the v4l2_m2m_dev structure allow safely
> sharing it across multiple hardware nodes. This can be used to prevent
> running jobs concurrently on m2m cores that have some internal resource
> sharing.
>
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>

I certainly don't have the complete picture for how this needs to work.

However, I was thinking that rather than using a kref and having to
share two specific functions to update it (v4l2_m2m_get|put), couldn't
we just use a device-link instead?

Kind regards
Uffe

> ---
> v4
> - Add my Signed-off-by
>
>  drivers/media/v4l2-core/v4l2-mem2mem.c | 23 +++++++++++++++++++++++
>  include/media/v4l2-mem2mem.h           | 21 +++++++++++++++++++++
>  2 files changed, 44 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
> index fec93c1a9231..ae0de54d4c3e 100644
> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> @@ -90,6 +90,7 @@ static const char * const m2m_entity_name[] = {
>   * @job_work:          worker to run queued jobs.
>   * @job_queue_flags:   flags of the queue status, %QUEUE_PAUSED.
>   * @m2m_ops:           driver callbacks
> + * @kref:              device reference count
>   */
>  struct v4l2_m2m_dev {
>         struct v4l2_m2m_ctx     *curr_ctx;
> @@ -109,6 +110,8 @@ struct v4l2_m2m_dev {
>         unsigned long           job_queue_flags;
>
>         const struct v4l2_m2m_ops *m2m_ops;
> +
> +       struct kref kref;
>  };
>
>  static struct v4l2_m2m_queue_ctx *get_queue_ctx(struct v4l2_m2m_ctx *m2m_ctx,
> @@ -1200,6 +1203,7 @@ struct v4l2_m2m_dev *v4l2_m2m_init(const struct v4l2_m2m_ops *m2m_ops)
>         INIT_LIST_HEAD(&m2m_dev->job_queue);
>         spin_lock_init(&m2m_dev->job_spinlock);
>         INIT_WORK(&m2m_dev->job_work, v4l2_m2m_device_run_work);
> +       kref_init(&m2m_dev->kref);
>
>         return m2m_dev;
>  }
> @@ -1211,6 +1215,25 @@ void v4l2_m2m_release(struct v4l2_m2m_dev *m2m_dev)
>  }
>  EXPORT_SYMBOL_GPL(v4l2_m2m_release);
>
> +void v4l2_m2m_get(struct v4l2_m2m_dev *m2m_dev)
> +{
> +       kref_get(&m2m_dev->kref);
> +}
> +EXPORT_SYMBOL_GPL(v4l2_m2m_get);
> +
> +static void v4l2_m2m_release_from_kref(struct kref *kref)
> +{
> +       struct v4l2_m2m_dev *m2m_dev = container_of(kref, struct v4l2_m2m_dev, kref);
> +
> +       v4l2_m2m_release(m2m_dev);
> +}
> +
> +void v4l2_m2m_put(struct v4l2_m2m_dev *m2m_dev)
> +{
> +       kref_put(&m2m_dev->kref, v4l2_m2m_release_from_kref);
> +}
> +EXPORT_SYMBOL_GPL(v4l2_m2m_put);
> +
>  struct v4l2_m2m_ctx *v4l2_m2m_ctx_init(struct v4l2_m2m_dev *m2m_dev,
>                 void *drv_priv,
>                 int (*queue_init)(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq))
> diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
> index bf6a09a04dcf..ca295c660c7f 100644
> --- a/include/media/v4l2-mem2mem.h
> +++ b/include/media/v4l2-mem2mem.h
> @@ -547,6 +547,27 @@ v4l2_m2m_register_media_controller(struct v4l2_m2m_dev *m2m_dev,
>   */
>  void v4l2_m2m_release(struct v4l2_m2m_dev *m2m_dev);
>
> +/**
> + * v4l2_m2m_get() - take a reference to the m2m_dev structure
> + *
> + * @m2m_dev: opaque pointer to the internal data to handle M2M context
> + *
> + * This is used to share the M2M device across multiple devices. This
> + * can be used to avoid scheduling two hardware nodes concurrently.
> + */
> +void v4l2_m2m_get(struct v4l2_m2m_dev *m2m_dev);
> +
> +/**
> + * v4l2_m2m_put() - remove a reference to the m2m_dev structure
> + *
> + * @m2m_dev: opaque pointer to the internal data to handle M2M context
> + *
> + * Once the M2M device have no more references, v4l2_m2m_realse() will be
> + * called automatically. Users of this method should never call
> + * v4l2_m2m_release() directly. See v4l2_m2m_get() for more details.
> + */
> +void v4l2_m2m_put(struct v4l2_m2m_dev *m2m_dev);
> +
>  /**
>   * v4l2_m2m_ctx_init() - allocate and initialize a m2m context
>   *
> --
> 2.52.0
>

