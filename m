Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CAE7C5DF86
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 16:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YnRM0KTrisOCjmklL/YoGuQ5GhJTGvbJYvWODwmflkI=; b=Fx0aisNs5BSET/capcunHrvt/k
	fo4CaRK/y3pWzC//ULX2pBydg4p5NZTXfTpBkOBRZx+IjGOGjAjR+xK8aJ2oUl5VxwTsoO6WHjb5i
	8xwlgKueaCujfBekLK6hZvG7fGfnQeUiurk1xrzxG/YKIxZ+ED420FjhVdvqGnRS0wxBFkn24alxl
	AKn4mhXxp8F6EOZs0QFfVfIZoIv7rmbkMj29byyRcaffiklFRS5JdKCYtkUtCJr1t8rDfOj3ys9X5
	ckYL5pC87lSHRmYvbAh3w3eUH+3R18IfHzrt0RBjS5E6MqGjcDy6U3Lev3FoOWHfjq0vSQTYUcn9+
	HEQo3UUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx5YI-0000000Bszu-1M3K;
	Thu, 20 Aug 2026 16:23:38 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx5YG-0000000BsyK-2Ub4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 16:23:37 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-81ff017d420so18203827b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 09:23:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787243015; cv=none;
        d=google.com; s=arc-20260327;
        b=ieO2T28uUvmJNJS9JDGjB5wG4O0hjtjPXpwoCcD3SnNPcI8Ij91mexqckPr9rIPfd2
         hcSM3VxmMggNjN2kX7WSABUW6lieFBNKua3KUzpvMk33l2Efpj3ytxJ8mIzDkVgmvlcF
         P3Tb9OaFzEg+0OgWICDR/6nQKo8W5V9LOHN6aZWNe+gK8dZCSWbEBINP8HM+ANavYfAg
         z2kaX2qGJ/gHHD+3uJGoYovYAgTP9ivjGawHiSMklzjnZd54pbb65mxhoqM3hgdU5dCQ
         74rdmriIWMWaWCS79WhSo+hZZeWp030WWIgb17cnxyGrpAhvy6v4L/o9WFA0NY33jrJp
         6eug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YnRM0KTrisOCjmklL/YoGuQ5GhJTGvbJYvWODwmflkI=;
        fh=h2dmdD7d8A6+fQE2H7Kh3Rfv9fDjE0wYb5FZQygcfeY=;
        b=SMqpkUgyuWbiwCByeoXCZmJOTd2j+59YItiiG8q1JjAe76h+gTMeplqQJer5b9i1Tx
         CEizMosRA7iumCMPAaZ41Q/P9/r8OmTJ+c/+Vp054M5JkJL0WWhoBXPDcA+zY+vfpg/H
         ZXgSjvhUIjPPw8zGyFVFyB4MmNjQCageHKHEzhPc5APBb0Y43+JDiJuEwDxM0eXg0zQx
         8KsOQZsGBNRCXWKFL4ZscFgJMdfMXQTQ3X7Fm/YQlJYugrtR64zQh5s5LheK3aRMCdMy
         rl04eIHLT+AQ8Nsj3ZoXUZTy/bPYeeET/fqxgDe5cqWXiD6YT15Zz7PoYqNOyvu1/UMG
         sATw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim.co.uk; s=google; t=1787243015; x=1787847815; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YnRM0KTrisOCjmklL/YoGuQ5GhJTGvbJYvWODwmflkI=;
        b=Ak5Ch4HtzIQ2QYjs05/ziXzVOLS2prxXqvARqZZ2J13qFk/quDBFxMlO1uCChnSxop
         xKMmDi+UG0L77tUZMdt6xikWOVQvnziSZK+YxVGizR8ehjhRmtCNiNpi0QW+3CyGQ2pm
         HbJznvveu7kjjqJpp9junjqYJmvay/Sg9cx2Y/GOcRcrJvqdtKAwLyrWZEnrkO3H6hu+
         YkOp4w3aGWbGjkVSabHjj4lwsNHOVvwKmLqwg5yUKhrZS/76ZcZ8/JIVqu2B1A3FMn++
         1P3X5gkgF69RQm5xdigp6gsXriecf5A1nvFXZ7guVeMflJOUAtotfXhHEK+ibBLKGXpu
         eV5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787243015; x=1787847815;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YnRM0KTrisOCjmklL/YoGuQ5GhJTGvbJYvWODwmflkI=;
        b=FByhaVXOaAzQBGLBE7xmfUwjinp6G4bw2y3up/EKwpHGTnU4SZmMR54N2bIHi2K0E/
         g81SPEQx4yKP7H4UXT1X5elTPE+BKXh6PBHN6XjKMvwI3a3EJST0Ey279XJnBqJma5JE
         eCPybUD6qLGXW7UHnNqbkjdmoLKvGivv1Did8pBiGtEGTgv+XVOKL/f5fdWkqYgBxfRi
         zSG2aPPQdfE7PztOhzPcWSQ2gmHAwscf84KZ2jCj4YoHg3buQwc1TheQ7gsHpqBfR21/
         NJLXh2bmhFptYvvWNnlPm4YrTDIA6gIIseVlPXAZHnilvAS7jQZzWVk3kAolHWfybLg4
         U7gA==
X-Forwarded-Encrypted: i=1; AHgh+Rqkt+USxTzQBuci06ce+mAB/grONgWZLDDUnmNh7QRthWcIjqBNdThQWcWP0zvFEVKzIFlwNeDHW9oziVinPVM9@lists.infradead.org
X-Gm-Message-State: AFuF++kdTseuE4in10oQ72xmrP5cDwY+XIH/tVUw3W8fHY/KAyzR1QAc
	uwL61SLJOAECtQxXncExS7fBei0vp313NJur+jl6ue/imjYQFrvKK8x7OI80V8RT6ePE95zGq5E
	oDU948Alqa8phiMs8PXM/yTpEo/exhgxSxNsGj9rvLQ==
X-Gm-Gg: AR+sD12uJ8MSVgsqcMJwHk0Pq2I/Kxx5MI/+9jUtKcbgBuK/2vovOk22PfMQff/VB8F
	BRAgAzF0KIBouGEa2unPnInpHSdlz0P4sGeoCQuDto1RxMHR312AFG9Ly7abCKOgryzBrDdZfe8
	+UPV8PTxakC7El6pskp1BVtb9VGsj3MkRXIbnssmHVa7f8CQnB3kgQVkUXRgaSAcNXGf55iKZOW
	xtBOOs/gbfqAcEk+xyrrenbFNWAiOK5jMgj/LvCQmcdGZP44ePi1oU67LxnogF7b8o4Qh7Wjnt+
	eX2iBYfzynal4dgCQ+6hlVV6ohxU08mEehS7cs+z9mI=
X-Received: by 2002:a05:690c:88f:b0:826:8d02:8e97 with SMTP id
 00721157ae682-8470b3d3551mr31060647b3.11.1787243015459; Thu, 20 Aug 2026
 09:23:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
 <20250724-multicontext-mainline-2025-v2-13-c9b316773486@ideasonboard.com>
In-Reply-To: <20250724-multicontext-mainline-2025-v2-13-c9b316773486@ideasonboard.com>
From: John Cox <jc@kynesim.co.uk>
Date: Thu, 20 Aug 2026 17:23:23 +0100
X-Gm-Features: AcwNN1Umw00-Vm0FaKi02tHzavFmcraLoTJPjWghZ5jBCN0htqJyMwd4j2ttQ1Q
Message-ID: <CAFyCYyPq0P0FfNL=ciiPnOV5Oa9tXZ09TE2gca9ovEiYOUqd3w@mail.gmail.com>
Subject: Re: [PATCH v2 13/27] media: v4l2-subdev: Introduce VIDIOC_SUBDEV_BIND_CONTEXT
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
X-CRM114-CacheID: sfid-20260820_092336_663773_EFE8A86C 
X-CRM114-Status: GOOD (  31.10  )
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

> Introduce a new ioctl in V4L2 subdev to allocate a subdevice context
> and associate it with a media device context.
>
> The ioctl handler calls the entity ops to let the driver allocate a
> new context and initialize the subdev state there contained.
>
> The new subdevice context is bound to the media device context
> associated with the file descriptor provided by userspace as the new
> ioctl argument.
>
> The newly allocated context is stored in the v4l2_subdev_fh handle
> that represent the open file handle on which the ioctl has been called.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 59 +++++++++++++++++++++++++++++++++++
>  include/uapi/linux/v4l2-subdev.h      | 11 +++++++
>  2 files changed, 70 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 7307f57439499c8d5360c89f492944828ac23973..300f84317623dd082a4cd2caec97057f972e82a3 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -607,6 +607,46 @@ subdev_ioctl_get_state(struct v4l2_subdev *sd, struct v4l2_subdev_fh *subdev_fh,
>                              v4l2_subdev_get_unlocked_active_state(sd);
>  }
>
> +static int subdev_do_bind_context(struct v4l2_subdev *sd,
> +                                 struct v4l2_subdev_context **context,
> +                                 struct media_device_context *mdev_context)
> +{
> +       static struct lock_class_key key;
> +       struct v4l2_subdev_state *state;
> +       int ret;
> +
> +       ret = sd->entity.ops->alloc_context(&sd->entity,
> +                                           (struct media_entity_context **)
> +                                           context);
> +       if (ret)
> +               return ret;
> +
> +       state = __v4l2_subdev_state_alloc(sd, "context->state->lock", &key);
> +       if (IS_ERR(state)) {
> +               ret = PTR_ERR(state);
> +               goto err_put_context;
> +       }
> +       (*context)->state = state;
> +
> +       /*
> +        * Bind the newly created video device context to the media device
> +        * context identified by the file descriptor.
> +        */
> +       ret = media_device_bind_context(mdev_context,
> +                                       (struct media_entity_context *)
> +                                       *context);
> +       if (ret)
> +               goto err_free_state;
> +
> +       return 0;
> +
> +err_free_state:
> +       __v4l2_subdev_state_free((*context)->state);
> +err_put_context:
> +       v4l2_subdev_context_put(*context);
> +       return ret;
> +}
> +
>  static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>                             struct v4l2_subdev_state *state)
>  {
> @@ -1089,6 +1129,25 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>                 return 0;
>         }
>
> +       case VIDIOC_SUBDEV_BIND_CONTEXT: {
> +               struct v4l2_subdev_bind_context *c = arg;
> +               struct media_device_context *mdev_context;
> +               int ret;
> +
> +               if (!sd->entity.ops || !sd->entity.ops->alloc_context ||
> +                   !sd->entity.ops->destroy_context)
> +                       return -ENOTTY;
> +
> +               mdev_context = media_device_context_get_from_fd(c->context_fd);
> +               if (!mdev_context)
> +                       return -EINVAL;
> +
> +               ret = subdev_do_bind_context(sd, &subdev_fh->context,
> +                                            mdev_context);
> +               media_device_context_put(mdev_context);
> +               return ret;
> +       }
> +
I think you also need a v4l2_subdev_context_put in subdev_close to
free up the bound
context.

Regards

John Cox

>         case VIDIOC_SUBDEV_G_CLIENT_CAP: {
>                 struct v4l2_subdev_client_capability *client_cap = arg;
>
> diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> index 2347e266cf7516b4073c1edd43b97a3ddddb183b..6184cc0153a9dd9fbfa6729e1b6127ba4a961395 100644
> --- a/include/uapi/linux/v4l2-subdev.h
> +++ b/include/uapi/linux/v4l2-subdev.h
> @@ -243,6 +243,16 @@ struct v4l2_subdev_routing {
>         __u32 reserved[11];
>  };
>
> +/**
> + * struct v4l2_subdev_bind_context - Subdev context information
> + *
> + * @context_fd: The file descriptor of the media_device instance the subdevice
> + *             has to be bound to
> + */
> +struct v4l2_subdev_bind_context {
> +       __u32 context_fd;
> +};
> +
>  /*
>   * The client is aware of streams. Setting this flag enables the use of 'stream'
>   * fields (referring to the stream number) with various ioctls. If this is not
> @@ -285,6 +295,7 @@ struct v4l2_subdev_client_capability {
>  #define VIDIOC_SUBDEV_S_SELECTION              _IOWR('V', 62, struct v4l2_subdev_selection)
>  #define VIDIOC_SUBDEV_G_ROUTING                        _IOWR('V', 38, struct v4l2_subdev_routing)
>  #define VIDIOC_SUBDEV_S_ROUTING                        _IOWR('V', 39, struct v4l2_subdev_routing)
> +#define VIDIOC_SUBDEV_BIND_CONTEXT             _IOWR('V', 50, struct v4l2_subdev_bind_context)
>  #define VIDIOC_SUBDEV_G_CLIENT_CAP             _IOR('V',  101, struct v4l2_subdev_client_capability)
>  #define VIDIOC_SUBDEV_S_CLIENT_CAP             _IOWR('V',  102, struct v4l2_subdev_client_capability)
>
>
> --
> 2.49.0
>
>

