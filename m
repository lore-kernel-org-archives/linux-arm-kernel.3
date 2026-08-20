Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33873C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 16:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=akmJEAxXxvOvCDET//elsxAbX/pgqZ+J1NNSEmRTcEk=; b=jbgP1mOwIN2CB2Eni7mnCIMDSP
	LDTTdszRBlHruoU812oOeKQ5vV6zal/4d8R64huy4Xr8zVSJKMtrmjG3CzPMQyKeiZ3qfCpwyn23B
	75Hcmo/Pt9GwhJak2Hjt3b4yKaoJ2SX0JtUzC4SDdBFU/hJmMnLQIZhhd0NEY3P0Z04Z7VJa6BCVc
	WtI6s85LjYRBjHqx+sHK8JkU+fpXDTKfekcaWhhX1AbrgcJkR4kIY9m+xvbseap03rAdcvn2UDN2X
	tB8cWnTKuUuseC5Zf9+cPqvT9beZ4oC2MYGygjNUhjBW1QOrjI4uOrdq7RMXHNWT83StwAlqglnU8
	lej23ZZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx5zm-0000000BuuZ-3Wqg;
	Thu, 20 Aug 2026 16:52:02 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx5zj-0000000Butp-0UdT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 16:52:01 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-836c8bdac50so1786297b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 09:51:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787244718; cv=none;
        d=google.com; s=arc-20260327;
        b=CjoyvqFMj5LVFioRQuF1rW5LEi9n6mhX7r8raNvcqtZtCclBrtoS0schKO0squW0+O
         TEaAKsOOkhs363EquJuY013EsCutD/v5N0OWt4Xt5uYhpEfMJyy63u+5vv5uEaEN2J9J
         8yxRjlJ1lg/lN7QoM0L+444xKUfbcpITfTbTLXGbR4DenjHbQg11+kZKVjDqfLRMeTVH
         L0OcTdiZSpjkrZTOG9o1r0yHYQ6Qorb4T19l41eW7jAy9llK9mvb4Rqex1orRxgHj9xa
         o4Un72HRSxwJyqsINlAgFLbtOGd1i8vBXs87qtZ8yMZVyNCz7uW7Cg2qGfvwYN9Q1f2o
         2Y6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:dkim-signature;
        bh=akmJEAxXxvOvCDET//elsxAbX/pgqZ+J1NNSEmRTcEk=;
        fh=Rb7/JppKpofv+tJ3+evvtbAqladJIIHMZ1e959zo1rU=;
        b=p3BebOf1tn3eQLZhaK7f2glYRyU3MdqNVhjQGEPPFjkHaiDP5EgMmnAHXkVNFJOPpf
         lxzh3AhsrKsoZd1pciFz5anfiXXsP4xz/6ek/r550z+8QlHn+V+VSrZ/4ydKz3WJAToa
         ehcjA4QAEdjrO8rwt72CF256hBrqH6iZ3qsC7vHbwkVR7ITrIB6pqZRi+d188/Q+r1gq
         GSPFIFM5ex1PeIMIXEPF1Am+loM0pY8OU8mQALJ5FPRai8EpXYVlBDWkQhEhQ5/VTEg7
         dOoUISUeLtLEAY59dG6KAUEQ5JDK9n9akh2K3sXTpwAU8q2Mw4Vkju015lI/g+dCqjBA
         J4jQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim.co.uk; s=google; t=1787244718; x=1787849518; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=akmJEAxXxvOvCDET//elsxAbX/pgqZ+J1NNSEmRTcEk=;
        b=afy8DvxKLw0jVHxFiBVnRI88yvEtHjQ9I2yPUCQasspR5Hi1Tz14itz3+iLPV2hJON
         BQlyaJni7NuvYYjEibFsMWRdrhC1yayaYNbW48j3CusFtk5z82awxSVFQjCW1RhKcB3B
         KPxeylDIMINijnBnQpD387TRz1GCsJK4mA2q9qOSioriBgcp/iiKbthKwKBnSCJZ9BMy
         9FB94Bw5XjJHqPRHJHtWRtaCl8F0/fVmUQrFwMHj7o+jwdStViShimz5l3p0x1Jqk70I
         YZbtxbIJbZF1Mb2fqhNriAYKyMi20pG6GnjtvBVvLI0YYLhetsoQNzGyriWa32vZpK0M
         O9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787244718; x=1787849518;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=akmJEAxXxvOvCDET//elsxAbX/pgqZ+J1NNSEmRTcEk=;
        b=p2bTlN0odKcUlBsIR7i8Nxj6wkSK85ZH7XUnvcSaFuk334HrOjO+EoyGB9iy12MeiW
         SfXW0CZRiyoskQpFXJYTOIRrSe27Rt2FBKe9ycBWK4n0Rk5fRl4Z48eIhzAGSNaNtjqy
         EZznMLBeC3RaF4rAeIKCItBm5k6cyh4naw0jKxVcwO2MOoLgyknEdxWSptIU/Ao+NG+f
         0/++K6GwQwveozsr+jdghCKceVzoD0W9ihoYX/uzrGwYRJex8OxqKGEZSqKbVovW2nmY
         /qOJ3gFxMLT1JQoon4xjWadKLQY3EoEep2p1PLUBHXXN3BxtXvyAWWXZYKi+zq9Z1K5l
         tIoA==
X-Forwarded-Encrypted: i=1; AHgh+RoMLmAKiYplSJw9kKE8xmeJU8nni9tCdAbpM/YnIrfPCnd2Woi7elbgUeBs+e5N8rrH2OAcmsoBfOB8zyDcLkRD@lists.infradead.org
X-Gm-Message-State: AFuF++nINfm9KA8ujjpmIftyMO4tMAmSF3ELjEpj2tmv/ZcjwEolHS1F
	hd82SNg4JGy5wLBps6sNyG35jZnOW2GxxH2dfCrZVx4r7HEoU9hDJ56hVv+Jjw1btBArUFlMV7k
	zi15III1Bd1q2O9OerUwgGMwA4N+UJFFQh0JqeFAZIA==
X-Gm-Gg: AR+sD10ee/nDW9IR95R2zaZMf9jpnWUCzYYnvA2Cn9bq8KeVaN2dFr/JAE+Bg22iQ6h
	nu2ABSyLoot9gmHX5zUvn6RlGsHLcmD5okqXH4qOL3W1fEgC1ou5Yw7uj3eXOm8mLUe91wDlnJ6
	rAIV5WZh7J57gX5x10DDNZGcWtzICbPshcHcg7sfDC82jIxZfwOXsA9ER2JRR9b2Bn9vlIEMPpJ
	qsSRELLVZ3bPaccA55pS6mQxOXmaHlJRMRKistm0TefvdKdIb7Z0dzWTcfshvhFl/nkXIisouGn
	woTHUbMGzYMLqHLAt8PMZK05jg6vOJYpjUKsAYgMqbZq1AJY1RYnCg==
X-Received: by 2002:a05:690c:60c3:b0:820:a7c:7495 with SMTP id
 00721157ae682-844dd143d1cmr56304437b3.3.1787244717686; Thu, 20 Aug 2026
 09:51:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
 <20250724-multicontext-mainline-2025-v2-5-c9b316773486@ideasonboard.com>
In-Reply-To: <20250724-multicontext-mainline-2025-v2-5-c9b316773486@ideasonboard.com>
From: John Cox <jc@kynesim.co.uk>
Date: Thu, 20 Aug 2026 17:51:43 +0100
X-Gm-Features: AcwNN1WwQTxs0WjtTh8s7fQQFsbKA65xSEl5vJQyrVwbh2jI5dFisjCf1lLZEIo
Message-ID: <CAFyCYyM=WaDwVZY5yCYkpbF1psckzRLs_arJfWBu28sS8uy3GQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/27] media: v4l2-dev: Introduce video device context
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Tomasz Figa <tfiga@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Hans Verkuil <hverkuil@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_095159_190970_A6893F38 
X-CRM114-Status: GOOD (  42.64  )
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
Reply-To: jc@kynesim.co.uk
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

> Introduce a new type in video-device that represents a video device
> context. It extends 'struct media_entity_context' to include
> video-device specific data and configuration. The new type is intended
> to be extended by drivers that can store driver-specific information
> in their video device derived types.
>
> The next patch will introduce the VIDIOC_BIND_CONTEXT ioctl that allows
> to create a video device context and uniquely associate it with a media
> context.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-dev.c |  43 +++++++++++++
>  include/media/v4l2-dev.h           | 126 +++++++++++++++++++++++++++++++++++++
>  include/media/v4l2-fh.h            |   3 +
>  3 files changed, 172 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index c369235113d98ae26c30a1aa386e7d60d541a66e..c83c37843c9e7beb899a4b2bd176273c3dec381b 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -1200,6 +1200,49 @@ struct media_pipeline *video_device_pipeline(struct video_device *vdev)
>  }
>  EXPORT_SYMBOL_GPL(video_device_pipeline);
>
> +struct video_device_context *
> +video_device_context_get(struct media_device_context *mdev_context,
> +                        struct video_device *vdev)
> +{
> +       struct media_entity *entity = &vdev->entity;
> +       struct media_entity_context *ctx =
> +               media_device_get_entity_context(mdev_context, entity);
> +
> +       if (!ctx)
Needs to be IS_ERR_OR_NULL(ctx)

Regards

John Cox

> +               return NULL;
> +
> +       return container_of(ctx, struct video_device_context, base);
> +}
> +EXPORT_SYMBOL_GPL(video_device_context_get);
> +
> +void video_device_context_put(struct video_device_context *ctx)
> +{
> +       if (!ctx)
> +               return;
> +
> +       media_entity_context_put(&ctx->base);
> +}
> +EXPORT_SYMBOL_GPL(video_device_context_put);
> +
> +int video_device_init_context(struct video_device *vdev,
> +                             struct video_device_context *ctx)
> +{
> +       media_entity_init_context(&vdev->entity, &ctx->base);
> +
> +       ctx->vdev = vdev;
> +       mutex_init(&ctx->queue_lock);
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(video_device_init_context);
> +
> +void video_device_cleanup_context(struct video_device_context *ctx)
> +{
> +       mutex_destroy(&ctx->queue_lock);
> +       media_entity_cleanup_context(&ctx->base);
> +}
> +EXPORT_SYMBOL_GPL(video_device_cleanup_context);
> +
>  #endif /* CONFIG_MEDIA_CONTROLLER */
>
>  /*
> diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
> index a69801274800f4f9add723b51fe0a31331e88f97..9276e095fb17414a9eb7845db0aa81572c42ca45 100644
> --- a/include/media/v4l2-dev.h
> +++ b/include/media/v4l2-dev.h
> @@ -18,6 +18,7 @@
>  #include <linux/videodev2.h>
>
>  #include <media/media-entity.h>
> +#include <media/videobuf2-core.h>
>
>  #define VIDEO_MAJOR    81
>
> @@ -660,6 +661,131 @@ __must_check int video_device_pipeline_alloc_start(struct video_device *vdev);
>   */
>  struct media_pipeline *video_device_pipeline(struct video_device *vdev);
>
> +/**
> + * struct video_device_context - The video device context
> + * @base: The media entity context base class member
> + * @vdev: The video device this context belongs to
> + * @queue_lock: Protects the vb2 queue
> + * @queue: The vb2 queue
> + *
> + * This structure represents an isolated execution context of a video device.
> + * This type 'derives' the base 'struct media_entity_context' type which
> + * implements refcounting on our behalf and allows instances of this type to be
> + * linked in the media_device_context contexts list.
> + *
> + * By storing the data and the configuration of a video device in a per-file
> + * handle context, userspace is allowed to multiplex the usage of a single video
> + * device devnode by opening it multiple times and by associating it with a
> + * media device context. This operation is called 'bounding' and is performed
> + * using the VIDIOC_BIND_CONTEXT ioctl.
> + *
> + * A video device context is created and stored in the v4l2-fh file handle
> + * associated with an open file descriptor when a video device is 'bound' to a
> + * media device context. The 'bounding' operation realizes a permanent
> + * association valid until the video device context is released.
> + *
> + * A video device can be bound to the same media device context once only.
> + * Trying to bind the same video device to the same media device context a
> + * second time, without releasing the already established context by closing the
> + * bound file descriptor first, will result in an error.
> + *
> + * To create a video device context userspace shall use the VIDIOC_BIND_CONTEXT
> + * ioctl that creates the video device context and uniquely associates it with a
> + * media device file descriptor.
> + *
> + * Once a video device file descriptor has been bound to a media device context,
> + * all the operations performed on the video device file descriptor will be
> + * directed on the just created video device context. This means, in example,
> + * that the video device format and the buffer queue are isolated from the ones
> + * associated with a different file descriptor obtained by opening again the
> + * same video device devnode but bound to a different media device context.
> + *
> + * Drivers that implement multiplexing support have to provide a valid
> + * implementation of the context-related operations in the
> + * media entity operations.
> + *
> + * Drivers are allowed to sub-class the video_device_context structure by
> + * defining a driver-specific type which embeds a struct video_device_context
> + * instance as first member, and allocate the driver-specific structure size in
> + * their implementation of the `alloc_context` operation.
> + *
> + * Video device contexts are ref-counted by embedding an instance of 'struct
> + * media_entity_context' and are freed once all the references to it are
> + * released.
> + *
> + * A video device context ref-count is increased when:
> + * - The context is created by bounding a video device to a media device context
> + * - The media pipeline starts streaming
> + * A video device context ref-count is decreased when:
> + * - The associated file handle is closed
> + * - The media pipeline stops streaming
> + *
> + * The ref-count is increased by a call to video_device_context_get() and is
> + * reponsibility of the caller to decrease the reference count with a call to
> + * video_device_context_put().
> + */
> +struct video_device_context {
> +       struct media_entity_context base;
> +
> +       struct video_device *vdev;
> +       /* Protects the vb2 queue. */
> +       struct mutex queue_lock;
> +       struct vb2_queue queue;
> +};
> +
> +/**
> + * video_device_context_get - Helper to get a video device context from a
> + *                           media device context
> + *
> + * @mdev_context: The media device context
> + * @vdev: The video device the context refers to
> + *
> + * Helper function that wraps media_device_get_entity_context() and returns
> + * the video device context associated with a video device in a media device
> + * context.
> + *
> + * The reference count of the returned video device context is increased.
> + * Callers of this function are required to decrease the reference count of
> + * the context reference with a call to video_device_context_put().
> + */
> +struct video_device_context *
> +video_device_context_get(struct media_device_context *mdev_context,
> +                        struct video_device *vdev);
> +
> +/**
> + * video_device_context_put - Helper to decrease a video context reference
> + *                           count
> + *
> + * @ctx: The video context to release
> + */
> +void video_device_context_put(struct video_device_context *ctx);
> +
> +/**
> + * video_device_init_context - Initialize the video device context
> + *
> + * @vdev: The video device this context belongs to
> + * @ctx: The context to initialize
> + *
> + * Initialize the video device context. The intended callers of this function
> + * are driver-specific implementations of the media_entity_ops.alloc_context()
> + * function that allocates their driver specific types that derive from
> + * struct video_device_context.
> + */
> +int video_device_init_context(struct video_device *vdev,
> +                             struct video_device_context *ctx);
> +
> +/**
> + * video_device_cleanup_context - Cleanup the video device context
> + *
> + * @ctx: The context to cleanup.
> + *
> + * Cleanup the video device context. The intended callers of this function are
> + * driver specific implementation of the media_entity_ops.destroy_context()
> + * function before releasing the memory previously allocated by
> + * media_entity_ops.alloc_context().
> + */
> +void video_device_cleanup_context(struct video_device_context *ctx);
> +
>  #endif /* CONFIG_MEDIA_CONTROLLER */
>
>  #endif /* _V4L2_DEV_H */
> diff --git a/include/media/v4l2-fh.h b/include/media/v4l2-fh.h
> index b5b3e00c8e6a0b082d9cd8a0c972a5094adcb6f2..a8de8613a026589ede94dc3e70c8a49ae08f4582 100644
> --- a/include/media/v4l2-fh.h
> +++ b/include/media/v4l2-fh.h
> @@ -20,6 +20,7 @@
>
>  struct video_device;
>  struct v4l2_ctrl_handler;
> +struct video_device_context;
>
>  /**
>   * struct v4l2_fh - Describes a V4L2 file handler
> @@ -38,6 +39,7 @@ struct v4l2_ctrl_handler;
>   * @sequence: event sequence number
>   *
>   * @m2m_ctx: pointer to &struct v4l2_m2m_ctx
> + * @context: The video device context
>   */
>  struct v4l2_fh {
>         struct list_head        list;
> @@ -54,6 +56,7 @@ struct v4l2_fh {
>         u32                     sequence;
>
>         struct v4l2_m2m_ctx     *m2m_ctx;
> +       struct video_device_context *context;
>  };
>
>  /**
>
> --
> 2.49.0
>
>

