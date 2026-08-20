Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3CF3C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 16:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NYyiZU75J+4VHDQmrZ9Udm24uk72U3pWtfogoXgw+Us=; b=L8j6oRffmqWn122kxcbSyyzI0k
	F4unfkAvee+3ZwIuTyTbyyptFws31ugpgxQIvwexJOmEqFDCmXvx19WAWnT3+tlcn4fgcCsfaYPXy
	O3c96bTQSaaJDqyjwaad9M0feEa5lxqI2uZHM9+0FWV/nVwMoUbQ2DsNdA2MYPm8ZUXpb61wmiX63
	L+wWRy7SYPafpLqrk0yIbha4amUSkI7pu2NT23j8XWp0JG6QEoEBE2yGBuVaW0ZwnWVtRXz4q4hQV
	pxXJ4tD6GL47235qQZhU1yXRpkeOl/k7HUAEONfrJhPODXKC+F/INuPKhLs5vYqUunS5D3UBWoJzL
	kJa6FkEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx5kJ-0000000Btrc-3LV3;
	Thu, 20 Aug 2026 16:36:03 +0000
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx5kE-0000000Btql-2NUU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 16:36:00 +0000
Received: by mail-yx1-xb12f.google.com with SMTP id 956f58d0204a3-66cdf0df0acso963992d50.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 09:35:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787243757; cv=none;
        d=google.com; s=arc-20260327;
        b=Mvk2lpvVDloNAWPJiubtQrUHCkGEIDxkaIfy5W/HohDLfz9XZjVfTYJQlQGLk+Ry2z
         y9PFX42Gax8AJxYea45LjoHcns8FTmDg306N6eo1BJWG3RYRb+rbwshAsMr16cwNO8QU
         HgpavJl+xSABcnr5BFtWspiiRZ1zX7Bp5KERcWVfVdxvAnapJ3AeiK8+BtszGMKi786S
         RE/LBx9jWcbM9nn07eo1S8UmXGyexDK1hVu6U5AeQwwPORqEVBClCEzAIz1ejLFMUNhz
         8cOk7Fwl0kL/0Tae9Yc9N3EH/K3m8Xhsu0muW8pj4AfvG+3h2YfixzKzFzeohB7NaJFd
         /UdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NYyiZU75J+4VHDQmrZ9Udm24uk72U3pWtfogoXgw+Us=;
        fh=cNl0HOofcMYX23f4QN8w9XYa4P2XEwb69q7YTPRiFQ8=;
        b=nCnIHxgYJVG0nO0L2Mft5huz8wnYobKaYeABzjYl6Ii9zPAJro0L79gRgliKjM6j7D
         fUg0aIYdcIF9ZnSqyXwe82d3cR+XfLEM+Kj5JX8WTgkIyvLch89OjgEIO/cHFTxwui0Z
         RuMiL5uiM+tm9X8h4mVMOtKKsPan89wbTMuQLebd0hQh7kZLoQXhDLRAL8uccP1Hw8B/
         pqq1ELWomMPNnbHUlYXhdEFE7KJMv4sg7v18VjCVlpvcredhAPCpbVxnrzr1LRCwXg70
         RDsU9vpDAeVYYpOzsM3IIeELZHCqEIiMtzyEJ0IZJxtbED37emJILAW1wgI25rO8pmro
         VrIw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim.co.uk; s=google; t=1787243757; x=1787848557; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NYyiZU75J+4VHDQmrZ9Udm24uk72U3pWtfogoXgw+Us=;
        b=w/TverneTaE4lYLjjc8X3V0drWkwUqXw77pyBJFg9lFILXuTsgm5bDHsSWI5HCM5nr
         FUE3rnX4JBacNlMPVOSBexuyXv3LYmf+Xj9rNzB4xuXWqCkXufMmC8KA6voQmQljVSUI
         /9LHMrX61SH1HGRZUEdiBeAUwE6CYjh8lT9+JFekwOMtUI+q7uTyIIO7msbgmXCsXlt7
         K4dLSGl39knmCoq8W8GVx/4YsUSRG+11zRf591DykAkFRPMU20Arniv3HWMzZXM2MhpU
         PPlereahvVOmiUlhIGkAurX6Y8XIugimYraAlFXaD6vhkPaIHSWg+5ZjioESfDoi1bNh
         MaMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787243757; x=1787848557;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NYyiZU75J+4VHDQmrZ9Udm24uk72U3pWtfogoXgw+Us=;
        b=GeFum2g6h4a2KpkOGningS0NuDaYOF+tyvDHz1+texxfl4zaDMIPGplI5ffTTg7yNR
         n8W7am1VY7V0+evuqBFsWVhBhwM67KmnF0Vc0s1Lp1MwMRwDoCzdEiXQksacxIS2AGSC
         lAI/xjkhx0ogBA80JiPYaAWbzSJGU7hqLaj1jrjypgrVVflPaooDosvdIY+zWYjyHk4P
         BcQLOVsIVfzF01YbQtEYy9+2hOYLcd43ImuCHYOnFcZRtzGTj9ES/69G0HN5zcRvYuF8
         U35iy5CTrA5Xh/bDog1VwP0LO6JZ+XRfqn4Lb5jqIxHKjcV6WcWgZNwQfb74o0OLsjvX
         k3rA==
X-Forwarded-Encrypted: i=1; AHgh+RojGyShDFfyvdspaEjb4ZzkGdYP7fZMNFdHehPIuuWBfpGk/Dto4irC9Myb+AYmzCXIGWiuALtmsx+elix9RfgV@lists.infradead.org
X-Gm-Message-State: AFuF++n1t1dmh8c5q4MwpYyQrTAQQ1/wY/V90nj0r/HwzN0gFFXI0PYP
	Wr7L+ushmyIDPOPYrdfEyJaeOp25HvGdNbYOzyVGPtUv/J3wQyhHDzhDWCn+9Ja35RIYXy9r4D2
	fckThfF1pNv/Bcj+zyx2BR4Md4oG6Xmwc5s7EOVsarg==
X-Gm-Gg: AR+sD11ndk+gVrKtIvI8Stf0IWXpXKWzLDjXgzLro77pLfrZtQlLE8f+rDvecDoJvZg
	2edcDT82R5bott6bBmhJAvybtmkJgoCBdZT/7He6uoaQqYAHqfXEL8h3ZIKR95f41jKf2Mho+2h
	VDRCY9LMjfML6ehMppVW2MUvLw75N9yvDP1//8qCwd6iWax98P/DG3o+hyZwz3o5Wfv3SMV/Gvx
	9mx104lWAB75nKcRJhKEfkYE6eVsb8QcHd5eGATIaGcvFXFSTAADLV1Z5slGyn/a3uzKOV6s6/R
	wGQbV17bmD8vYQfN615D4q3UdBsS5pp/kYZXq5QW/cA=
X-Received: by 2002:a05:690c:6c8e:b0:7ff:1a93:be35 with SMTP id
 00721157ae682-844df158a81mr55435577b3.16.1787243757334; Thu, 20 Aug 2026
 09:35:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
 <20250724-multicontext-mainline-2025-v2-16-c9b316773486@ideasonboard.com>
In-Reply-To: <20250724-multicontext-mainline-2025-v2-16-c9b316773486@ideasonboard.com>
From: John Cox <jc@kynesim.co.uk>
Date: Thu, 20 Aug 2026 17:35:44 +0100
X-Gm-Features: AcwNN1XvSxfmyHAua9fqxn606YkjVXnPvYXRH1omWRpiWwQiPt5bLdsOlWDBu1A
Message-ID: <CAFyCYyNsKa4CvpYNsRc_UabDg5emev6qdCtqUkqMHbJ0BNiOnw@mail.gmail.com>
Subject: Re: [PATCH v2 16/27] media: v4l2-subdev: Add subdev state accessor helpers
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
X-CRM114-CacheID: sfid-20260820_093558_671703_F17AE4E8 
X-CRM114-Status: GOOD (  32.78  )
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

> The v4l2-subdev.c file offers three helpers to access the subdevice
> active state from a v4l2_subdev pointer:
>
> - v4l2_subdev_get_unlocked_active_state(sd)
> - v4l2_subdev_get_locked_active_state(sd)
> - v4l2_subdev_lock_and_get_active_state(sd)
>
> With the introduction of struct v4l2_subdev_context which contains a
> subdev_state as well, the actual "active" state is stored in three
> possible places:
> - A context associated with a v4l2_subdev_fh for context aware drivers
>   operated by context aware userspace
> - The default subdevice context for context aware drivers operated by
>   non-context aware userspace
> - The subdevice active state for non-context aware drivers
>
> Provide helpers similar in spirit the existing ones but accept as
> argument either a subdevice the context itself and retrieve the active
> state from the correct place.
>
> Helpers will be used in following patches for link validation.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 101 +++++++++++++++++++++++++++++++++
>  include/media/v4l2-subdev.h           | 104 +++++++++++++++++++---------------
>  2 files changed, 159 insertions(+), 46 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 438f51980e5ac0f092ba6b0a979a376133968ddf..7372f61127c871cec44a3d1900e2b8bef34632b9 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -20,6 +20,7 @@
>  #include <linux/version.h>
>  #include <linux/videodev2.h>
>
> +#include <media/media-device.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-event.h>
> @@ -189,6 +190,106 @@ static inline int check_pad(struct v4l2_subdev *sd, u32 pad)
>         return 0;
>  }
>
> +/* subdev state accessor helpers */
> +
> +/*
> + * Access the state from the subdevice.
> + *
> + * If the driver is context-aware use the state stored in the default context
> + * otherwise use the active state stored in the subdevice.
> + */
> +
> +struct v4l2_subdev_state *
> +v4l2_subdev_get_unlocked_active_state_from_sd(struct v4l2_subdev *sd)
> +{
> +       if (!sd)
> +               return NULL;
> +
> +       if (sd->default_context) {
> +               lockdep_assert_not_held(sd->default_context->state->lock);
> +
> +               return sd->default_context->state;
> +       }
> +
> +       if (sd->active_state)
> +               lockdep_assert_not_held(sd->active_state->lock);
> +       return sd->active_state;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_get_unlocked_active_state_from_sd);
> +
> +struct v4l2_subdev_state *
> +v4l2_subdev_get_locked_active_state_from_sd(struct v4l2_subdev *sd)
> +{
> +       if (!sd)
> +               return NULL;
> +
> +       if (sd->default_context) {
> +               lockdep_assert_held(sd->default_context->state->lock);
> +
> +               return sd->default_context->state;
> +       }
> +
> +       if (sd->active_state)
> +               lockdep_assert_held(sd->active_state->lock);
> +       return sd->active_state;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_get_locked_active_state_from_sd);
> +
> +struct v4l2_subdev_state *
> +v4l2_subdev_lock_and_get_active_state_from_sd(struct v4l2_subdev *sd)
> +{
> +       if (!sd)
> +               return NULL;
> +
> +       if (sd->default_context) {
> +               v4l2_subdev_lock_state(sd->default_context->state);
> +
> +               return sd->default_context->state;
> +       }
> +
> +       if (sd->active_state)
> +               v4l2_subdev_lock_state(sd->active_state);
> +       return sd->active_state;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_lock_and_get_active_state_from_sd);
> +
> +/* Access the subdevice state from a subdvice context. */
> +struct v4l2_subdev_state *
> +v4l2_subdev_get_unlocked_active_state_from_ctx(struct v4l2_subdev_context *ctx)
> +{
> +       if (!ctx)
> +               return NULL;
> +
> +       if (ctx->state)
> +               lockdep_assert_not_held(ctx->state->lock);
> +       return ctx->state;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_get_unlocked_active_state_from_ctx);
> +
> +struct v4l2_subdev_state *
> +v4l2_subdev_get_locked_active_state_from_ctx(struct v4l2_subdev_context *ctx)
> +{
> +       if (!ctx)
> +               return NULL;
> +
> +       if (ctx->state)
> +               lockdep_assert_held(ctx->state->lock);
> +       return ctx->state;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_get_locked_active_state_from_ctx);
> +
> +struct v4l2_subdev_state *
> +v4l2_subdev_lock_and_get_active_state_from_ctx(struct v4l2_subdev_context *ctx)
> +{
> +       if (!ctx)
> +               return NULL;
> +
> +       if (ctx->state)
> +               v4l2_subdev_lock_state(ctx->state);
> +       return ctx->state;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_lock_and_get_active_state_from_ctx);
> +
>  static int check_state(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
>                        u32 which, u32 pad, u32 stream)
>  {
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 1fa42a9f322be0be44fc9308744f4f4ae0cf1606..8087c0ae3bc0a0a95512b4b0ff5257522a104ca0 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -29,16 +29,17 @@
>
>  #define        V4L2_DEVICE_NOTIFY_EVENT                _IOW('v', 2, struct v4l2_event)
>
> -struct v4l2_device;
> +struct led_classdev;
> +struct media_device_context;
> +struct tuner_setup;
>  struct v4l2_ctrl_handler;
> +struct v4l2_device;
>  struct v4l2_event;
>  struct v4l2_event_subscription;
>  struct v4l2_fh;
> +struct v4l2_mbus_frame_desc;
>  struct v4l2_subdev;
>  struct v4l2_subdev_fh;
> -struct tuner_setup;
> -struct v4l2_mbus_frame_desc;
> -struct led_classdev;
>
>  /**
>   * struct v4l2_decode_vbi_line - used to decode_vbi_line
> @@ -1968,64 +1969,75 @@ static inline void v4l2_subdev_unlock_states(struct v4l2_subdev_state *state1,
>                 mutex_unlock(state2->lock);
>  }
>
> +struct v4l2_subdev_state *
> +v4l2_subdev_get_unlocked_active_state_from_sd(struct v4l2_subdev *sd);
> +struct v4l2_subdev_state *
> +v4l2_subdev_get_locked_active_state_from_sd(struct v4l2_subdev *sd);
> +struct v4l2_subdev_state *
> +v4l2_subdev_lock_and_get_active_state_from_sd(struct v4l2_subdev *sd);
> +
> +struct v4l2_subdev_state *
> +v4l2_subdev_get_unlocked_active_state_from_ctx(struct v4l2_subdev_context *ctx);
> +struct v4l2_subdev_state *
> +v4l2_subdev_get_locked_active_state_from_ctx(struct v4l2_subdev_context *ctx);
> +struct v4l2_subdev_state *
> +v4l2_subdev_lock_and_get_active_state_from_ctx(struct v4l2_subdev_context *ctx);
> +
>  /**
> - * v4l2_subdev_get_unlocked_active_state() - Checks that the active subdev state
> - *                                          is unlocked and returns it
> - * @sd: The subdevice
> + * v4l2_subdev_get_unlocked_active_state() - Checks that the subdev state is
> + *                                          unlocked and returns it
> + * @sdctx: The subdevice, or the subdevice context
>   *
> - * Returns the active state for the subdevice, or NULL if the subdev does not
> - * support active state. If the state is not NULL, calls
> - * lockdep_assert_not_held() to issue a warning if the state is locked.
> + * Returns the subdevice state, or NULL if it is not valid. If the state is
> + * not NULL, calls lockdep_assert_not_held() to issue a warning if the state
> + * is locked.
>   *
> - * This function is to be used e.g. when getting the active state for the sole
> - * purpose of passing it forward, without accessing the state fields.
> + * This function is to be used e.g. when getting the state for the sole purpose
> + * of passing it forward, without accessing the state fields.
>   */
> -static inline struct v4l2_subdev_state *
> -v4l2_subdev_get_unlocked_active_state(struct v4l2_subdev *sd)
> -{
> -       if (sd->active_state)
> -               lockdep_assert_not_held(sd->active_state->lock);
> -       return sd->active_state;
> -}
> +#define v4l2_subdev_get_unlocked_active_state(sdctx)                           \
> +       _Generic((sdctx),                                                       \
> +               struct v4l2_subdev *:                                           \
> +                       v4l2_subdev_get_unlocked_active_state_from_sd,          \
> +               struct v4l2_subdev_context *:                                   \
> +                       v4l2_subdev_get_unlocked_active_state_from_ctx)         \
> +       (sdctx)
>
>  /**
> - * v4l2_subdev_get_locked_active_state() - Checks that the active subdev state
> - *                                        is locked and returns it
> - *
> - * @sd: The subdevice
> + * v4l2_subdev_get_locked_active_state() - Checks that the subdev state is
> + *                                        locked and returns it
> + * @sdctx: The subdevice, or the subdevice context
>   *
> - * Returns the active state for the subdevice, or NULL if the subdev does not
> - * support active state. If the state is not NULL, calls lockdep_assert_held()
> - * to issue a warning if the state is not locked.
> + * Returns the subdevice state, or NULL is not valid. If the state is not NULL,
> + * calls lockdep_assert_held() to issue a warning if the state is not locked.
>   *
> - * This function is to be used when the caller knows that the active state is
> + * This function is to be used when the caller knows that the context state is
>   * already locked.
>   */
> -static inline struct v4l2_subdev_state *
> -v4l2_subdev_get_locked_active_state(struct v4l2_subdev *sd)
> -{
> -       if (sd->active_state)
> -               lockdep_assert_held(sd->active_state->lock);
> -       return sd->active_state;
> -}
> +#define v4l2_subdev_get_locked_active_state(sdctx)                             \
> +       _Generic((sdctx),                                                       \
> +               struct v4l2_subdev *:                                           \
> +                       v4l2_subdev_get_locked_active_state_from_sd,            \
> +               struct v4l2_subdev_context *:                                   \
> +                       v4l2_subdev_get_locked_active_state_from_ctx)           \
> +       (sdctx)
>
>  /**
> - * v4l2_subdev_lock_and_get_active_state() - Locks and returns the active subdev
> - *                                          state for the subdevice
> - * @sd: The subdevice
> + * v4l2_subdev_lock_and_get_active_state_from_ctx() - Locks and returns the
> + *                                                   subdevice state
> + * @sdctx: The subdevice, or the subdevice context
>   *
> - * Returns the locked active state for the subdevice, or NULL if the subdev
> - * does not support active state.
> + * Returns the locked subdevice state, or NULL if it is not valid.
>   *
>   * The state must be unlocked with v4l2_subdev_unlock_state() after use.
>   */
> -static inline struct v4l2_subdev_state *
> -v4l2_subdev_lock_and_get_active_state(struct v4l2_subdev *sd)
> -{
> -       if (sd->active_state)
> -               v4l2_subdev_lock_state(sd->active_state);
> -       return sd->active_state;
> -}
> +#define v4l2_subdev_lock_and_get_active_state(sdctx)                           \
> +       _Generic((sdctx),                                                       \
> +               struct v4l2_subdev *:                                           \v4l2_subdev_lock_and_get_active_state_from_
> +                       v4l2_subdev_lock_and_get_active_state_from_sd,          \
> +               struct v4l2_subdev_context *:                                   \
> +                       v4l2_subdev_get_locked_active_state_from_ctx)           \
Cut and paste error?
This should be v4l2_subdev_lock_and_get_active_state_from_ctx?

Regards

John Cox

> +       (sdctx)
>
>  /**
>   * v4l2_subdev_init - initializes the sub-device struct
>
> --
> 2.49.0
>
>

