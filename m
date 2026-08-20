Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0172FC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 16:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N8/7EJgXScxMsb8yLNOXdKHQST7x7f+prdDpaOJKJXg=; b=E3jXfqlqTwws1xOIquiM80uNoL
	rD1ba8XLgA+sVsiZFckgLhuT6PZumvOZwRFLndtQkX+RzUQkyFBawB0E01aO9COIRZ2TZczC7lt7f
	p+nloqXi0gEOwjD0L9y/FprbXtvAJNg39MjIle9gKGXMgNjqYMpdyPOXnHuwX25nWi/lpRwWZYPa+
	weyJzBJJop/9mNz7wfIscSaEcqFEc7RcN3w/iRhsl3WK9SEuL+wzk9xJ0NS7REit8uoFb89iNl7Nz
	Tt8QihUFn3U2m3Uv3vqjZJsTN/jmvrfcqJzqVgkRLikT4J2UhgDSN1Cw2ekUafhZvp2x7SrYA01UN
	r7VSvb8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx5vc-0000000Bue8-1eoU;
	Thu, 20 Aug 2026 16:47:44 +0000
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx5vZ-0000000BudG-47Mw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 16:47:43 +0000
Received: by mail-yx1-xb12d.google.com with SMTP id 956f58d0204a3-66c82b32121so5793d50.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 09:47:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787244460; cv=none;
        d=google.com; s=arc-20260327;
        b=fl6j1+Pv4jnrYb7Dw4SlxSPGHE3F15qxydQ6igphrcitw/y88QaNu9F1GigVNw0Byf
         o/4fVgd9HDo3w2cBNgss+wQRvA+QZvsC4l/KICuN6pRpE+ac8C9/zxE3dsc0LLjX/VKZ
         REmH4MZEHYR/VMO9uB/RR+1INZbsW/vEV+mWSfEraaFvGC2oF2QrC6hogqs4OfzYjd4p
         aRLnn1gekp3xhbNwfq25BdWO3zLhjfju+0yDG34dlrXnR5OxYFJ4JyytQSbDWbLXnbET
         mwhKZvn1sPYNTZBDII3ZVpY5ypqwDveb8OI9dQZPPcsnYzALAPHcCNvDSKh2NUKZLQjB
         JOnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:dkim-signature;
        bh=N8/7EJgXScxMsb8yLNOXdKHQST7x7f+prdDpaOJKJXg=;
        fh=ff3M7878oKBLA4NOFFoSQxzbRFqkOcFOVgevh5N4AHg=;
        b=K8+NNtMWIjoT+jFuJNa3UZaH8+bmmDVDqPOhgXEamBxZcqctwo11NPIcGNEQgLPv/q
         MBbwIKLhnc3TLAYzxC6pgddMMiQ6sj3WJoVpq4Hz/ZAYpBFBllHQtT/qv2mOduVvTJpJ
         jRO9JroIF4rx7bnx8MoiHS59ZNsOf2kLb0A5iqjF4Bea1K1Gdc/hjn9ln+dwD1Ytqnd3
         OTdmTj9hVVGxRaeGZov7mXCERQYtLe/h9UlQMEp5h/AsKlBD8cqsJmR9dVltVU0L8mRw
         ZK5olHLWb3qECL6FvMUqtyd7ODDMLae3b2IuqDgjXFcE15gD/jX55tqObXGFp3VJQRiD
         nblg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim.co.uk; s=google; t=1787244460; x=1787849260; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N8/7EJgXScxMsb8yLNOXdKHQST7x7f+prdDpaOJKJXg=;
        b=Wa16zyj+JZKt/FQYLd9s095OKt5KVhsXuy2tn88R/kJiGUp+h8aPvFCxlfArTdIXQR
         ix/BteWxQjXqLPWXYv9cGZfErLofPlx9KMxnLQ15nBJjXPNNexOXA9r1Xbb8hlxtozaq
         +zG8mQSqAIweufpKG/O4wovlUD+TvrpieO0+ahgGursYktRzSbOz7vTLAlvVIxuzpmA6
         gECXRUhkQwF028wueZ2IXprZJ8Gj8Vj+WcS9ZrRuqZe9dnumk/P8cBhX1kkJcYIiZP0f
         u74Czz6KCLTLsTQZuHW++CA8EpAPmp03yKeKY2R6WzFPAaoJR06xX2kUiJodxkFTUEo1
         ADAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787244460; x=1787849260;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N8/7EJgXScxMsb8yLNOXdKHQST7x7f+prdDpaOJKJXg=;
        b=nHs2EICsQe8HVqIyCRaw6ZQY8klj5v+eGm3k8+X5z9W8A37huPGlsk8bt2b3XepTfP
         VE2e00Ko228V9OCh3XadI/sjYn+/UThadUm0Icg+ZC29xDnN/n5P6Laud87WnWCa3GtC
         DJwPLf4QajxXdvEN+cJEk5TUnuuYrLaiTmG5qRccCZi+CNW8ZvmuWCTGmZfqCeEu7Pzn
         VpQsJa8h5o0pRrUQravpB8bjirElIes+H9mlNAd6wwVr8HJjwAfaqiW1DCLgv/FeH3Lf
         MQQfA04rheNO8nweln3h1eOJNhvRdcHje/KSBfWSKgY0CEcwxk5IgV+ldM9JUQPCcBrt
         KlIQ==
X-Forwarded-Encrypted: i=1; AHgh+RrZEJicG2TBywFWbE7Pdfe8xWL+cX7ilngSZARgs5RDFHgDzrZnOwdwI1zGcMIEfXgEZJq+sFmRKJk+8f+ZfzEP@lists.infradead.org
X-Gm-Message-State: AFuF++lq83DTaKgltUiKNd47Gp/rIfFjh8NXWhKDUPjzEwgtM/MVpY2k
	6Xtf9gI3JPCn6ELlIwacMlW3lp570hc1tktvVwBLwd2IDRf4ZMRwKyDzyWdzDbMW/+WjqIPlMrJ
	z+tCrgc88LaT+xDtaZcFZpikuLqD9zwYMSobpisczLg==
X-Gm-Gg: AR+sD13x6QdkZDBLsqQxyxCk7FJcWXAicYR4RWjYkH4fIBx0wGGkCIpHbbl259dPziw
	lYahb8iSvft+61p5z82EPMDAQsZBBXbg7ophzNxmx1wQZR9ITjAJI7eOs3FSpvoP/P5ST6QkWb2
	6XhzsrDjPGEizWiJTI6q1avy0hz/IB/x6w2jVfufmucLaEJ+KeynJjnFE4OfZ/QH3acQujbxO6C
	ArgbJGfgPCMf0wmGIJKBf6Vl0UVDj6NR5s4/sqMAQYcShDbwY0UDd2xOaKY2GPdUthENi6fweUh
	jxDNP+g0auXXL6ajFPLPkEmaVMIr5VGaQBoIaQRZCNU=
X-Received: by 2002:a05:690e:dcf:b0:669:3e3e:d64a with SMTP id
 956f58d0204a3-66ce49ed2c5mr65947d50.15.1787244460433; Thu, 20 Aug 2026
 09:47:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
 <20250724-multicontext-mainline-2025-v2-12-c9b316773486@ideasonboard.com>
In-Reply-To: <20250724-multicontext-mainline-2025-v2-12-c9b316773486@ideasonboard.com>
From: John Cox <jc@kynesim.co.uk>
Date: Thu, 20 Aug 2026 17:47:27 +0100
X-Gm-Features: AcwNN1Xnu7zppNIGQ2MdBufll4blyAkR6vOITHjuMugVUus8gLxrHEWDDpf2rnc
Message-ID: <CAFyCYyOPESG6TJaUBdWE28BRxwems_EQsvhMP08LbN8D=sYAWw@mail.gmail.com>
Subject: Re: [PATCH v2 12/27] media: v4l2-subdev: Introduce v4l2 subdev context
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
X-CRM114-CacheID: sfid-20260820_094742_056576_1001F5DF 
X-CRM114-Status: GOOD (  37.84  )
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

> Introduce a new type in v4l2 subdev that represents a v4l2 subdevice
> contex. It extends 'struct media_entity_context' and is intended to be
> extended by drivers that can store driver-specific information
> in their derived types.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c |  39 +++++++++++
>  include/media/v4l2-subdev.h           | 126 ++++++++++++++++++++++++++++++++++
>  2 files changed, 165 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 4fd25fea3b58477056729665706ddbacc436379c..7307f57439499c8d5360c89f492944828ac23973 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1577,6 +1577,45 @@ bool v4l2_subdev_has_pad_interdep(struct media_entity *entity,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_has_pad_interdep);
>
> +struct v4l2_subdev_context *
> +v4l2_subdev_context_get(struct media_device_context *mdev_context,
> +                       struct v4l2_subdev *sd)
> +{
> +       struct media_entity *entity = &sd->entity;
> +       struct media_entity_context *ctx =
> +                media_device_get_entity_context(mdev_context, entity);
> +
> +       if (!ctx)
This needs to be "if (IS_ERR_OR_NULL(ctx))" as media_device_get_entity_context()
can return an error pointer.

Regards

John Cox

> +               return NULL;
> +
> +       return container_of(ctx, struct v4l2_subdev_context, base);
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_context_get);
> +
> +void v4l2_subdev_context_put(struct v4l2_subdev_context *ctx)
> +{
> +       if (!ctx)
> +               return;
> +
> +       media_entity_context_put(&ctx->base);
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_context_put);
> +
> +int v4l2_subdev_init_context(struct v4l2_subdev *sd,
> +                            struct v4l2_subdev_context *context)
> +{
> +       media_entity_init_context(&sd->entity, &context->base);
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_init_context);
> +
> +void v4l2_subdev_cleanup_context(struct v4l2_subdev_context *context)
> +{
> +       media_entity_cleanup_context(&context->base);
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_cleanup_context);
> +
>  struct v4l2_subdev_state *
>  __v4l2_subdev_state_alloc(struct v4l2_subdev *sd, const char *lock_name,
>                           struct lock_class_key *lock_key)
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 5dcf4065708f32e7d3b5da003771810d5f7973b8..9d257b859acafb11cfe6976e906e7baabd0206f6 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -757,6 +757,78 @@ struct v4l2_subdev_state {
>         struct v4l2_subdev_stream_configs stream_configs;
>  };
>
> +/**
> + * struct v4l2_subdev_context - The v4l2 subdevice context
> + * @base: The media entity context base class member
> + * @state: The subdevice state associated with this context
> + *
> + * This structure represents an isolated execution context of a subdevice.
> + * This type 'derives' the base 'struct media_entity_context' type which
> + * implements refcounting on our behalf and allows instances of this type to be
> + * linked in the media_device_context contexts list.
> + *
> + * The subdevice context stores the subdev state in a per-file handle context,
> + * userspace is allowed to multiplex the usage of a subdevice devnode by opening
> + * it multiple times and by associating it with a media device context. This
> + * operation is called 'bounding' and is performed using the
> + * VIDIOC_SUBDEV_BIND_CONTEXT ioctl.
> + *
> + * A subdevice context is created and stored in the v4l2_fh file handle
> + * associated with an open file descriptor when a subdevice is 'bound' to a
> + * media device context. The 'bounding' operation realizes a permanent
> + * association valid until the subdevice context is released.
> + *
> + * A subdevice can be bound to the same media device context once only.
> + * Trying to bind the same subdevice to the same media device context a
> + * second time, without releasing the already established context by closing the
> + * bound file descriptor first, will result in an error.
> + *
> + * To create a subdevice context userspace shall use the
> + * VIDIOC_SUBDEV_BIND_CONTEXT ioctl that creates the subdevice context and
> + * uniquely associates it with a media device file descriptor.
> + *
> + * Once a subdevice file descriptor has been bound to a media device context,
> + * all the operations performed on the subdevice file descriptor will be
> + * directed on the just created subdevice context. This means, in example, that
> + * the subdevice state and configuration is isolated from the ones associated
> + * with a different file descriptor obtained by opening again the same subdevice
> + * devnode but bound to a different media device context.
> + *
> + * Drivers that implement multiplexing support have to provide a valid
> + * implementation of the context-related operations in the media entity
> + * operations.
> + *
> + * Drivers are allowed to sub-class the v4l2_subdevice_context structure by
> + * defining a driver-specific type which embeds a struct v4l2_subdevice_context
> + * instance as first member, and allocate the driver-specific structure size in
> + * their implementation of the `alloc_context` operation.
> + *
> + * Subdevice contexts are ref-counted by embedding an instance of 'struct
> + * media_entity_context' and are freed once all the references to it are
> + * released.
> + *
> + * A subdevice context ref-count is increased when:
> + * - The context is created by bounding a video device to a media device context
> + * - The media pipeline it is part of starts streaming
> + * A subdevice context ref-count is decreased when:
> + * - The associated file handle is closed
> + * - The media pipeline it is part of stops streaming
> + *
> + * The ref-count is increased by a call to v4l2_subdev_context_get() and is
> + * reponsibility of the caller to decrease the reference count with a call to
> + * v4l2_subdev_context_put().
> + */
> +struct v4l2_subdev_context {
> +       struct media_entity_context base;
> +       /*
> +        * TODO: active_state should most likely be changed from a pointer to an
> +        * embedded field. For the time being it's kept as a pointer to more
> +        * easily catch uses of active_state in the cases where the driver
> +        * doesn't support it.
> +        */
> +       struct v4l2_subdev_state *state;
> +};
> +
>  /**
>   * struct v4l2_subdev_pad_ops - v4l2-subdev pad level operations
>   *
> @@ -1152,6 +1224,7 @@ struct v4l2_subdev_fh {
>         struct module *owner;
>  #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
>         struct v4l2_subdev_state *state;
> +       struct v4l2_subdev_context *context;
>         u64 client_caps;
>  #endif
>  };
> @@ -1285,6 +1358,59 @@ int v4l2_subdev_link_validate(struct media_link *link);
>  bool v4l2_subdev_has_pad_interdep(struct media_entity *entity,
>                                   unsigned int pad0, unsigned int pad1);
>
> +/**
> + * v4l2_subdev_context_get - Helper to get a v4l2 subdev context from a
> + *                          media device context
> + *
> + * @mdev_context: The media device context
> + * @sd: The V4L2 subdevice the context refers to
> + *
> + * Helper function that wraps media_device_get_entity_context() and returns
> + * the v4l2 subdevice context associated with a subdevice in a media device
> + * context.
> + *
> + * The reference count of the returned v4l2 subdevice context is increased.
> + * Callers of this function are required to decrease the reference count of
> + * the context reference with a call to v4l2_subdev_context_put().
> + */
> +struct v4l2_subdev_context *
> +v4l2_subdev_context_get(struct media_device_context *mdev_context,
> +                       struct v4l2_subdev *sd);
> +
> +/**
> + * v4l2_subdev_context_put - Helper to decrease a v4l2 subdevice context
> + *                          reference count
> + *
> + * @ctx: The v4l2 subdevice context to put
> + */
> +void v4l2_subdev_context_put(struct v4l2_subdev_context *ctx);
> +
> +/**
> + * v4l2_subdev_init_context - Initialize the v4l2 subdevice context
> + *
> + * @sd: The subdevice the context belongs to
> + * @ctx: The context to initialize
> + *
> + * Initialize the v4l2 subdevice context. The intended callers of this function
> + * are driver-specific implementations of the media_entity_ops.alloc_context()
> + * function that allocates their driver specific types that derive from
> + * struct v4l2_subdev_context.
> + */
> +int v4l2_subdev_init_context(struct v4l2_subdev *sd,
> +                            struct v4l2_subdev_context *ctx);
> +
> +/**
> + * v4l2_subdev_cleanup_context - Cleanup the v4l2 subdevice context
> + *
> + * @ctx: The context to cleanup.
> + *
> + * Cleanup the v4l2 subdevice context. The intended callers of this function are
> + * driver specific implementation of the media_entity_ops.destroy_context()
> + * function before releasing the memory previously allocated by
> + * media_entity_ops.alloc_context().
> + */
> +void v4l2_subdev_cleanup_context(struct v4l2_subdev_context *ctx);
> +
>  /**
>   * __v4l2_subdev_state_alloc - allocate v4l2_subdev_state
>   *
>
> --
> 2.49.0
>
>

