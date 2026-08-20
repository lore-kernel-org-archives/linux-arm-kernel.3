Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72FF6C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 16:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qEfeanj2B21UQ4s13w9n0/O/Ii0JASvFsbQaoVe9iHE=; b=Jpx/O5Jp2UmlzEKMqCVwfQDAXA
	ZHjAjiEywiflvQ1BTZAQ8UKYkTr7uxFNX6tQ8cqjBIzdGTzam8EDP7sXqAqC2BAa+OIJVx5o8uWcy
	3inS3XC4mXfXw03EXyhT7PpovrY1QNthK6z4x4KObSWS7j1fpckTCjWAMMbCT8CoXLOk6FY3PkCI9
	I2gLe1iY2l85bRm/x6Ke5dh8W0Dv40Z/70IAaWvetX5tqhAM9WzLCUp2afFLw0zrHctv0B6EnPccB
	g/N2TH7YnznqbjiOM6LXh/Us56vYCXLUXU7M4/VOn6Bpf/G4/fgM6wV+k/YOWtVh/0Err6PMpvn8P
	7kTg4Dzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx5gB-0000000BteO-0wH8;
	Thu, 20 Aug 2026 16:31:47 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx5g8-0000000Btdf-2rjs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 16:31:45 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-81dfdbd86d1so1172417b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 09:31:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787243503; cv=none;
        d=google.com; s=arc-20260327;
        b=cWw+HtpUteUSc7FqGYERdplExGquClXNtqUZxR3B7k/a4t4M8FIKJ5GyjSK/wzWsFy
         A6yRGmBw8kprkhTKGAK1GNukDRkVQ318d6G/iZqaU2wlOsaUdzZH1FEcwBmQRhQAEOSU
         oIqF9Gbtxh3enc1qlSM2A4rfUmbr4AV9M5Tw1vjvMvatsaKTlBOrLntoY3qDTKP+HJGN
         +NhQer6x88XKTv58G2A1Q9BrlCasrt2H8AmrX8kOtlasc1eR2qqte9mKkquUwueKEFhL
         AkAph3e1g+sBeadPgROc7m9lOybnSNNiqeq7yjepRa++LCqbcNR6rFPQOwS8sfGU4pcW
         xLiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qEfeanj2B21UQ4s13w9n0/O/Ii0JASvFsbQaoVe9iHE=;
        fh=CwLHP5dJwkpaoYhPXlyXeFkNDt3F76kT6RTIyCydEM8=;
        b=opxCAFYTT6m5H5VQxLZyxTsY3RInUtKDM0zxkufWLYR2N1bkg5gaaWXRicf1mXkgep
         Z9+R2/Q1+/fqQ908b6MYHAkR/0hljRYn7pIFjOrp14qYGB0u+dbn83VvARfI5mjkVgkW
         ko30BdUwDwhakeGOAN8KTs+tEL/4/jwF7sLLs8kk+Y7CNtJjrJ3eY+e7FSYWliH8ywAo
         Lq34qgP+GhZ9jAb6uWwE6j0ib57cazo2BAMWL3ZGKGdS9af6oB5YTf9a+DKKZiDlBCxk
         BykuIkl4GpDbz1ciwyyS2UCkwU6gt3vquwkobmWgi3eO2hu8m3yBMdte/31EobSGTbpx
         D3nQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim.co.uk; s=google; t=1787243503; x=1787848303; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qEfeanj2B21UQ4s13w9n0/O/Ii0JASvFsbQaoVe9iHE=;
        b=zJJ8L8jxSh6gCTINbi/sYx43OEpx0wJqAfjsqQpWzKR99h5SDac/kFlZhLm3r9Y17z
         gmtVUeKtXJ63EK+YLex5MEOYa8t8EtmbErPj86Taml/+aQeixVnI07p50PNzSMdgLzao
         zXOLxFYrfbssSe5gP2eEFBNLlxrHHAfbE9fbHAiX+GPZevVt1hr72P7uQ0CgV1762z+K
         IPPj2/TDmu7qH2CCLGdGQRk7QBM1WVACzlvppozJRQV0t9v0EQdYBspUTjFmJrWWKQ7k
         Q21fXaQEcrMzF+elm/rDBBsMk76MKxYAHhcvCfkW4BaFJ7sSZ6dwn7ZT9k09Q6a/aYo+
         Qyxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787243503; x=1787848303;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qEfeanj2B21UQ4s13w9n0/O/Ii0JASvFsbQaoVe9iHE=;
        b=Gn4EwZ/hgCQQipDKL02GtU6R51+0W8y8IIWToD7qJFvG8KbwXb92wE3GEXeEHhi2GT
         CrBH5lwsDHnqSUxoAldJ9slC/q281C4GLR+MNMLvt0Y0xJNxqZIol0od0gJ15rQGhgJ5
         DSS/pe4L9L5aMzSzz3rdFOqDACwdqrPx1bWtqIAw3Lw6Jv9ERSoIYzQYOYgPdmUEy1G5
         5eBQezHK1PSBTUKd1/C7NjGBehoAkICPBmJtbzMqSpLgr1JdOScD/KCS/kbfT5wHJipR
         K0Mci19Iedh244rz1nQzuv/pt1HsHZL+3wGUMAt1gf28HZUNEPHHrxVzCsraF9fo0ToH
         UQaw==
X-Forwarded-Encrypted: i=1; AHgh+RpL8wwsNZtLr6yEq7DfNEYKUfA3HQgkftkQ/XyJlGeRnEgjZEe2rU6rxFsIrPW1rzhfNkSJu9DYfruc6xZBQV3P@lists.infradead.org
X-Gm-Message-State: AFuF++k4Y3s5R5NbR22HQ8i+yBJqnP2lHQogLwy5jFW3I8F/F7ncNS25
	TqZOgpN/BKOZ7Gm0L+GlDS6UEgMiYXYnLHVd8Owy78ox0K2XJr6ac/jWbzQ8mKZJSCHa9RYqEGQ
	ToEZjzqzZjAOTaFYCu8tfoaY+m07Ctmj4iWrAF/tDIA==
X-Gm-Gg: AR+sD11AwPwkjb+kktZ9HR8Ll61642gXFEUJCK3u+eg1KvWPF0OzUAfkU/N9/rCBJMT
	n1qxrrqCwZtv40I08x4M8DG5nFsC3K28L3Bb6TzV9ky7Zj7iB4PkORAMTkmdHAWQ+yt/3ZmsnvT
	xRDNPbd9AoorJlpxZ+tbEMUXdBI5zzfhvvwbm66ON9YerRWv/Jq1qfNmbmh+mQ9B6vyysZX5lt/
	q6hqwPIv0Mm7CArusUbxSYAVLiqtGBJxzK7fz5fj0EN98h7e2OfTVf4vnFzH0nq8ILIeMw7+/9I
	n7wDf2ST+tH9ltu6mYkCbF8Lftn29YHPVZhoaRHOB/I=
X-Received: by 2002:a05:690c:4b82:b0:820:1251:d2c2 with SMTP id
 00721157ae682-844e250fe23mr51872287b3.28.1787243503265; Thu, 20 Aug 2026
 09:31:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
 <20250724-multicontext-mainline-2025-v2-11-c9b316773486@ideasonboard.com>
In-Reply-To: <20250724-multicontext-mainline-2025-v2-11-c9b316773486@ideasonboard.com>
From: John Cox <jc@kynesim.co.uk>
Date: Thu, 20 Aug 2026 17:31:31 +0100
X-Gm-Features: AcwNN1WjC9dLxoZ7a36oz6GWGckQua1_XePXPkJUpae3tu3WKspB2mZQpv2Wx2Q
Message-ID: <CAFyCYyMaKT9zDxZCruS84S0DvSWrAR_==jjokTPXwBcJAp01pA@mail.gmail.com>
Subject: Re: [PATCH v2 11/27] media: videobuf2-v4l2: Support vb2_queue
 embedded in a context
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
X-CRM114-CacheID: sfid-20260820_093144_801151_D56121D4 
X-CRM114-Status: GOOD (  30.66  )
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

> Support device drivers that implement multi-context operations in the
> videobuf2 core by providing an helper to retrieve the vb2_queue from
> the context associated with an open file handle. If no context is
> associated with a file handle, retrieve it from the video device
> default context, created by the core for multi-context aware drivers.
>
> Fall-back to use the vb2_queue from the video_device to support existing
> drivers which are not context aware.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/common/videobuf2/videobuf2-v4l2.c | 139 +++++++++++++++---------
>  1 file changed, 88 insertions(+), 51 deletions(-)
>
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index 1cd26faee50338aefeb670c6865da7c2d43f44d3..ad7892551f54c5abc7db7641bb8fb89d77b1337f 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -998,23 +998,46 @@ EXPORT_SYMBOL_GPL(vb2_poll);
>   * and so they simplify the driver code.
>   */
>
> +/*
> + * Helper to get the vb2 queue either from:
> + * 1) The video context bound to the open file handle
> + * 2) The default context for context-aware drivers if userspace has not bound
> + *    a context to the file handle
> + * 3) From the video device for non-context aware drivers
> + */
> +static struct vb2_queue *get_vb2_queue(struct file *file,
> +                                      struct video_device *vdev)
> +{
> +#if defined(CONFIG_MEDIA_CONTROLLER)
> +       struct video_device_context *ctx =
> +                               video_device_context_from_file(file, vdev);
> +
> +       return ctx ? &ctx->queue
> +                  : vdev->default_context ? &vdev->default_context->queue
> +                  : vdev->queue;
> +#else
> +       return vdev->queue;
> +#endif /* CONFIG_MEDIA_CONTROLLER */
> +}
> +
>  /* vb2 ioctl helpers */
>
>  int vb2_ioctl_remove_bufs(struct file *file, void *priv,
>                           struct v4l2_remove_buffers *d)
>  {
>         struct video_device *vdev = video_devdata(file);
> +       struct vb2_queue *q = get_vb2_queue(file, vdev);
>
> -       if (vdev->queue->type != d->type)
> +       if (q->type != d->type)
>                 return -EINVAL;
>
>         if (d->count == 0)
>                 return 0;
>
> -       if (vb2_queue_is_busy(vdev->queue, file))
> +       if (vb2_queue_is_busy(q, file))
>                 return -EBUSY;
>
> -       return vb2_core_remove_bufs(vdev->queue, d->index, d->count);
> +       return vb2_core_remove_bufs(q, d->index, d->count);
>  }
>  EXPORT_SYMBOL_GPL(vb2_ioctl_remove_bufs);
>
> @@ -1022,21 +1045,21 @@ int vb2_ioctl_reqbufs(struct file *file, void *priv,
>                           struct v4l2_requestbuffers *p)
>  {
>         struct video_device *vdev = video_devdata(file);
> -       int res = vb2_verify_memory_type(vdev->queue, p->memory, p->type);
> +       struct vb2_queue *q = get_vb2_queue(file, vdev);
> +       int res = vb2_verify_memory_type(q, p->memory, p->type);
>         u32 flags = p->flags;
>
> -       vb2_set_flags_and_caps(vdev->queue, p->memory, &flags,
> -                              &p->capabilities, NULL);
> +       vb2_set_flags_and_caps(q, p->memory, &flags, &p->capabilities, NULL);
>         p->flags = flags;
>         if (res)
>                 return res;
> -       if (vb2_queue_is_busy(vdev->queue, file))
> +       if (vb2_queue_is_busy(q, file))
>                 return -EBUSY;
> -       res = vb2_core_reqbufs(vdev->queue, p->memory, p->flags, &p->count);
> +       res = vb2_core_reqbufs(q, p->memory, p->flags, &p->count);
>         /* If count == 0, then the owner has released all buffers and he
>            is no longer owner of the queue. Otherwise we have a new owner. */
>         if (res == 0)
> -               vdev->queue->owner = p->count ? file->private_data : NULL;
> +               q->owner = p->count ? file->private_data : NULL;
>         return res;
>  }
>  EXPORT_SYMBOL_GPL(vb2_ioctl_reqbufs);
> @@ -1045,11 +1068,12 @@ int vb2_ioctl_create_bufs(struct file *file, void *priv,
>                           struct v4l2_create_buffers *p)
>  {
>         struct video_device *vdev = video_devdata(file);
> -       int res = vb2_verify_memory_type(vdev->queue, p->memory, p->format.type);
> +       struct vb2_queue *q = get_vb2_queue(file, vdev);
> +       int res = vb2_verify_memory_type(q, p->memory, p->format.type);
>
> -       p->index = vb2_get_num_buffers(vdev->queue);
> -       vb2_set_flags_and_caps(vdev->queue, p->memory, &p->flags,
> -                              &p->capabilities, &p->max_num_buffers);
> +       p->index = vb2_get_num_buffers(q);
> +       vb2_set_flags_and_caps(q, p->memory, &p->flags, &p->capabilities,
> +                              &p->max_num_buffers);
>         /*
>          * If count == 0, then just check if memory and type are valid.
>          * Any -EBUSY result from vb2_verify_memory_type can be mapped to 0.
> @@ -1058,12 +1082,12 @@ int vb2_ioctl_create_bufs(struct file *file, void *priv,
>                 return res != -EBUSY ? res : 0;
>         if (res)
>                 return res;
> -       if (vb2_queue_is_busy(vdev->queue, file))
> +       if (vb2_queue_is_busy(q, file))
>                 return -EBUSY;
>
> -       res = vb2_create_bufs(vdev->queue, p);
> +       res = vb2_create_bufs(q, p);
>         if (res == 0)
> -               vdev->queue->owner = file->private_data;
> +               q->owner = file->private_data;
>         return res;
>  }
>  EXPORT_SYMBOL_GPL(vb2_ioctl_create_bufs);
> @@ -1072,69 +1096,76 @@ int vb2_ioctl_prepare_buf(struct file *file, void *priv,
>                           struct v4l2_buffer *p)
>  {
>         struct video_device *vdev = video_devdata(file);
> +       struct vb2_queue *q = get_vb2_queue(file, vdev);
>
> -       if (vb2_queue_is_busy(vdev->queue, file))
> +       if (vb2_queue_is_busy(q, file))
>                 return -EBUSY;
> -       return vb2_prepare_buf(vdev->queue, vdev->v4l2_dev->mdev, p);
> +       return vb2_prepare_buf(q, vdev->v4l2_dev->mdev, p);
>  }
>  EXPORT_SYMBOL_GPL(vb2_ioctl_prepare_buf);
>
>  int vb2_ioctl_querybuf(struct file *file, void *priv, struct v4l2_buffer *p)
>  {
>         struct video_device *vdev = video_devdata(file);
> +       struct vb2_queue *q = get_vb2_queue(file, vdev);
>
>         /* No need to call vb2_queue_is_busy(), anyone can query buffers. */
> -       return vb2_querybuf(vdev->queue, p);
> +       return vb2_querybuf(q, p);
>  }
>  EXPORT_SYMBOL_GPL(vb2_ioctl_querybuf);
>
>  int vb2_ioctl_qbuf(struct file *file, void *priv, struct v4l2_buffer *p)
>  {
>         struct video_device *vdev = video_devdata(file);
> +       struct vb2_queue *q = get_vb2_queue(file, vdev);
>
> -       if (vb2_queue_is_busy(vdev->queue, file))
> +       if (vb2_queue_is_busy(q, file))
>                 return -EBUSY;
> -       return vb2_qbuf(vdev->queue, vdev->v4l2_dev->mdev, p);
> +       return vb2_qbuf(q, vdev->v4l2_dev->mdev, p);
>  }
>  EXPORT_SYMBOL_GPL(vb2_ioctl_qbuf);
>
>  int vb2_ioctl_dqbuf(struct file *file, void *priv, struct v4l2_buffer *p)
>  {
>         struct video_device *vdev = video_devdata(file);
> +       struct vb2_queue *q = get_vb2_queue(file, vdev);
>
> -       if (vb2_queue_is_busy(vdev->queue, file))
> +       if (vb2_queue_is_busy(q, file))
>                 return -EBUSY;
> -       return vb2_dqbuf(vdev->queue, p, file->f_flags & O_NONBLOCK);
> +       return vb2_dqbuf(q, p, file->f_flags & O_NONBLOCK);
>  }
>  EXPORT_SYMBOL_GPL(vb2_ioctl_dqbuf);
>
>  int vb2_ioctl_streamon(struct file *file, void *priv, enum v4l2_buf_type i)
>  {
>         struct video_device *vdev = video_devdata(file);
> +       struct vb2_queue *q = get_vb2_queue(file, vdev);
>
> -       if (vb2_queue_is_busy(vdev->queue, file))
> +       if (vb2_queue_is_busy(q, file))
>                 return -EBUSY;
> -       return vb2_streamon(vdev->queue, i);
> +       return vb2_streamon(q, i);
>  }
>  EXPORT_SYMBOL_GPL(vb2_ioctl_streamon);
>
>  int vb2_ioctl_streamoff(struct file *file, void *priv, enum v4l2_buf_type i)
>  {
>         struct video_device *vdev = video_devdata(file);
> +       struct vb2_queue *q = get_vb2_queue(file, vdev);
>
> -       if (vb2_queue_is_busy(vdev->queue, file))
> +       if (vb2_queue_is_busy(q, file))
>                 return -EBUSY;
> -       return vb2_streamoff(vdev->queue, i);
> +       return vb2_streamoff(q, i);
>  }
>  EXPORT_SYMBOL_GPL(vb2_ioctl_streamoff);
>
>  int vb2_ioctl_expbuf(struct file *file, void *priv, struct v4l2_exportbuffer *p)
>  {
>         struct video_device *vdev = video_devdata(file);
> +       struct vb2_queue *q = get_vb2_queue(file, vdev);
>
> -       if (vb2_queue_is_busy(vdev->queue, file))
> +       if (vb2_queue_is_busy(q, file))
>                 return -EBUSY;
> -       return vb2_expbuf(vdev->queue, p);
> +       return vb2_expbuf(q, p);
>  }
>  EXPORT_SYMBOL_GPL(vb2_ioctl_expbuf);
>
> @@ -1143,20 +1174,22 @@ EXPORT_SYMBOL_GPL(vb2_ioctl_expbuf);
>  int vb2_fop_mmap(struct file *file, struct vm_area_struct *vma)
>  {
>         struct video_device *vdev = video_devdata(file);
> +       struct vb2_queue *q = get_vb2_queue(file, vdev);
>
> -       return vb2_mmap(vdev->queue, vma);
> +       return vb2_mmap(q, vma);
>  }
>  EXPORT_SYMBOL_GPL(vb2_fop_mmap);
>
>  int _vb2_fop_release(struct file *file, struct mutex *lock)
>  {
>         struct video_device *vdev = video_devdata(file);
> +       struct vb2_queue *q = get_vb2_queue(file, vdev);
>
>         if (lock)
>                 mutex_lock(lock);
> -       if (!vdev->queue->owner || file->private_data == vdev->queue->owner) {
> -               vb2_queue_release(vdev->queue);
> -               vdev->queue->owner = NULL;
> +       if (!q->owner || file->private_data == q->owner) {
> +               vb2_queue_release(q);
> +               q->owner = NULL;
>         }
>         if (lock)
>                 mutex_unlock(lock);
> @@ -1167,7 +1200,8 @@ EXPORT_SYMBOL_GPL(_vb2_fop_release);
>  int vb2_fop_release(struct file *file)
>  {
>         struct video_device *vdev = video_devdata(file);
> -       struct mutex *lock = vdev->queue->lock ? vdev->queue->lock : vdev->lock;
> +       struct vb2_queue *q = get_vb2_queue(file, vdev);
> +       struct mutex *lock = q->lock ? q->lock : vdev->lock;
>
>         return _vb2_fop_release(file, lock);
>  }
> @@ -1177,19 +1211,20 @@ ssize_t vb2_fop_write(struct file *file, const char __user *buf,
>                 size_t count, loff_t *ppos)
>  {
>         struct video_device *vdev = video_devdata(file);
> -       struct mutex *lock = vdev->queue->lock ? vdev->queue->lock : vdev->lock;
> +       struct vb2_queue *q = get_vb2_queue(file, vdev);
> +       struct mutex *lock = q->lock ? q->lock : vdev->lock;
>         int err = -EBUSY;
>
> -       if (!(vdev->queue->io_modes & VB2_WRITE))
> +       if (!(q->io_modes & VB2_WRITE))
>                 return -EINVAL;
>         if (lock && mutex_lock_interruptible(lock))
>                 return -ERESTARTSYS;
> -       if (vb2_queue_is_busy(vdev->queue, file))
> +       if (vb2_queue_is_busy(q, file))
>                 goto exit;
> -       err = vb2_write(vdev->queue, buf, count, ppos,
> -                      file->f_flags & O_NONBLOCK);
> -       if (vdev->queue->fileio)
> -               vdev->queue->owner = file->private_data;
> +       err = vb2_write(q, buf, count, ppos,
> +                       file->f_flags & O_NONBLOCK);
> +       if (q->fileio)
> +               q->owner = file->private_data;
>  exit:
>         if (lock)
>                 mutex_unlock(lock);
> @@ -1201,20 +1236,21 @@ ssize_t vb2_fop_read(struct file *file, char __user *buf,
>                 size_t count, loff_t *ppos)
>  {
>         struct video_device *vdev = video_devdata(file);
> -       struct mutex *lock = vdev->queue->lock ? vdev->queue->lock : vdev->lock;
> +       struct vb2_queue *q = get_vb2_queue(file, vdev);
> +       struct mutex *lock = q->lock ? q->lock : vdev->lock;
>         int err = -EBUSY;
>
> -       if (!(vdev->queue->io_modes & VB2_READ))
> +       if (!(q->io_modes & VB2_READ))
>                 return -EINVAL;
>         if (lock && mutex_lock_interruptible(lock))
>                 return -ERESTARTSYS;
> -       if (vb2_queue_is_busy(vdev->queue, file))
> +       if (vb2_queue_is_busy(q, file))
>                 goto exit;
> -       vdev->queue->owner = file->private_data;
> -       err = vb2_read(vdev->queue, buf, count, ppos,
> +       q->owner = file->private_data;
> +       err = vb2_read(q, buf, count, ppos,
>                        file->f_flags & O_NONBLOCK);
> -       if (!vdev->queue->fileio)
> -               vdev->queue->owner = NULL;
> +       if (!q->fileio)
> +               q->owner = NULL;
>  exit:
>         if (lock)
>                 mutex_unlock(lock);
> @@ -1225,7 +1261,7 @@ EXPORT_SYMBOL_GPL(vb2_fop_read);
>  __poll_t vb2_fop_poll(struct file *file, poll_table *wait)
>  {
>         struct video_device *vdev = video_devdata(file);
> -       struct vb2_queue *q = vdev->queue;
> +       struct vb2_queue *q = get_vb2_queue(file, vdev);
>         struct mutex *lock = q->lock ? q->lock : vdev->lock;
>         __poll_t res;
>         void *fileio;
> @@ -1241,7 +1277,7 @@ __poll_t vb2_fop_poll(struct file *file, poll_table *wait)
>
>         fileio = q->fileio;
>
> -       res = vb2_poll(vdev->queue, file, wait);
> +       res = vb2_poll(q, file, wait);
>
>         /* If fileio was started, then we have a new queue owner. */
>         if (!fileio && q->fileio)
> @@ -1257,8 +1293,9 @@ unsigned long vb2_fop_get_unmapped_area(struct file *file, unsigned long addr,
>                 unsigned long len, unsigned long pgoff, unsigned long flags)
>  {
>         struct video_device *vdev = video_devdata(file);
> +       struct vb2_queue *q = get_vb2_queue(file, vdev);
>
> -       return vb2_get_unmapped_area(vdev->queue, addr, len, pgoff, flags);
> +       return vb2_get_unmapped_area(q, addr, len, pgoff, flags);
>  }
>  EXPORT_SYMBOL_GPL(vb2_fop_get_unmapped_area);
>  #endif

You need similar logic in v4l2-ioctl.c to retrieve the correct queue from
a video_device and v4l2_fh so v4l2_ioctl_get_lock retrieves the correct
lock.

Regards

John Cox

