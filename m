Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED639C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 21:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m+LuuZH7vy3arUdxfVYx5/xzHrxZVFqjwvjNWuwh10A=; b=EPIGbd//f0jeRrRUGqOUwViT5u
	N8h4PD7/Vxoq6/LmCBp4iwhpRvv7QAxIgysn/wfxjmzqF+FuQyY4fkp8ZuGnTuAcEBMdj+xVXb7sH
	THcGAX9a7r4j6fsiRlYEd/GfJaAT/E4aIFxGTefIV24MXkqsSGDOVSBziLBDglgsMhljyTOjDAVj2
	+SOKPY7tvfhPIq9UViFWa+1SRQz1YSIPfailkSRkc3rv9NhbfhAmnicMhEBsL+l+0aK4eWYco8JUj
	6zAaGWlEKeS8i5V222axBc5OTvd5suo3Hpc6bTn0V8IHX8MKjElH5RFUgdBP5PFN4v7GlwILLRg37
	sEm0lvBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3gsB-00000007l8g-1VJC;
	Mon, 07 Sep 2026 21:27:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3gs8-00000007l8G-2cDB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 21:27:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788816443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m+LuuZH7vy3arUdxfVYx5/xzHrxZVFqjwvjNWuwh10A=;
	b=SVntmWBBvj2CCJbBmKWGUAui27pnmpHAQcnebMHKKO5sMuMuRu6Lsp618RkS/Fk10RtSU9
	jGlJRgH8pTQdPMOw0Um38McQGoqx7O8dJvWrC532zyM454x4VmIFDtFG9B6GyVCvrrmsYK
	2pgstPty/siK2UChBWmHHfPG26F2VrY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-315-KShbRbIDMrKtni-SGAUjZA-1; Mon,
 07 Sep 2026 17:27:18 -0400
X-MC-Unique: KShbRbIDMrKtni-SGAUjZA-1
X-Mimecast-MFC-AGG-ID: KShbRbIDMrKtni-SGAUjZA_1788816435
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 20AE3182FA4C;
	Mon,  7 Sep 2026 21:27:15 +0000 (UTC)
Received: from [100.91.157.188] (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E5A341800765;
	Mon,  7 Sep 2026 21:27:09 +0000 (UTC)
Message-ID: <dfe32fca-d02c-4d8b-b112-d430c19be509@redhat.com>
Date: Mon, 7 Sep 2026 23:27:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/14] drm/panic: Internalize panic locking in DRM core
 and helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, geert@linux-m68k.org, rdunlap@infradead.org
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, virtualization@lists.linux.dev,
 sashiko-reviews@lists.linux.dev
References: <20260902121930.597222-1-tzimmermann@suse.de>
 <20260902121930.597222-13-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20260902121930.597222-13-tzimmermann@suse.de>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: vHhXqHWmcshQ3Anzlp9ikFC0Nmv-DjRC1DqKpzlboZE_1788816435
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_142724_808078_22CAD835 
X-CRM114-Status: GOOD (  27.71  )
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

On 9/2/26 14:13, Thomas Zimmermann wrote:
> None of the DRM drivers handles panic locking. Declare the interfaces
> in an internal header file. Move the trylock required during the panic
> into the DRM core's sources.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   Documentation/gpu/drm-kms.rst        |  3 ++
>   MAINTAINERS                          |  3 +-
>   drivers/gpu/drm/drm_atomic_helper.c  |  2 +-
>   drivers/gpu/drm/drm_drv.c            |  2 +-
>   drivers/gpu/drm/drm_panic.c          |  4 ++
>   drivers/gpu/drm/drm_panic_internal.h | 55 +++++++++++++++++++++++
>   include/drm/drm_panic.h              | 65 ----------------------------
>   7 files changed, 66 insertions(+), 68 deletions(-)
>   create mode 100644 drivers/gpu/drm/drm_panic_internal.h
> 
> diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> index 0dd440a14946..8988fd64369b 100644
> --- a/Documentation/gpu/drm-kms.rst
> +++ b/Documentation/gpu/drm-kms.rst
> @@ -421,6 +421,9 @@ Plane Panic Functions Reference
>   .. kernel-doc:: include/drm/drm_panic.h
>      :internal:
>   
> +.. kernel-doc:: drivers/gpu/drm/drm_panic_internal.h
> +   :internal:
> +
>   .. kernel-doc:: drivers/gpu/drm/drm_panic.c
>      :export:
>   
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c66c3fe93f3d..ccc5dc0a01ae 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9111,7 +9111,8 @@ S:	Supported
>   T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>   F:	drivers/gpu/drm/drm_draw.c
>   F:	drivers/gpu/drm/drm_draw_internal.h
> -F:	drivers/gpu/drm/drm_panic*.c
> +F:	drivers/gpu/drm/drm_panic.c
> +F:	drivers/gpu/drm/drm_panic_internal.h
>   F:	drivers/gpu/drm/tests/drm_panic_test.c
>   F:	include/drm/drm_panic.h
>   F:	include/drm/drm_panic_helper.h
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 285aac3554df..af3934df3313 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -41,7 +41,6 @@
>   #include <drm/drm_drv.h>
>   #include <drm/drm_framebuffer.h>
>   #include <drm/drm_gem_atomic_helper.h>
> -#include <drm/drm_panic.h>
>   #include <drm/drm_print.h>
>   #include <drm/drm_self_refresh_helper.h>
>   #include <drm/drm_vblank.h>
> @@ -49,6 +48,7 @@
>   
>   #include "drm_crtc_helper_internal.h"
>   #include "drm_crtc_internal.h"
> +#include "drm_panic_internal.h"
>   
>   /**
>    * DOC: overview
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 8c0879c336e5..64055514acbf 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -51,13 +51,13 @@
>   #include <drm/drm_file.h>
>   #include <drm/drm_managed.h>
>   #include <drm/drm_mode_object.h>
> -#include <drm/drm_panic.h>
>   #include <drm/drm_print.h>
>   #include <drm/drm_privacy_screen_machine.h>
>   #include <drm/drm_ras_genl_family.h>
>   
>   #include "drm_crtc_internal.h"
>   #include "drm_internal.h"
> +#include "drm_panic_internal.h"
>   
>   MODULE_AUTHOR("Gareth Hughes, Leif Delgass, José Fonseca, Jon Smirl");
>   MODULE_DESCRIPTION("DRM shared core routines");
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index 7b9864857577..41ba0c4b050e 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -35,6 +35,7 @@
>   
>   #include "drm_crtc_internal.h"
>   #include "drm_draw_internal.h"
> +#include "drm_panic_internal.h"
>   
>   MODULE_AUTHOR("Jocelyn Falempe");
>   MODULE_DESCRIPTION("DRM panic handler");
> @@ -976,6 +977,9 @@ int drm_plane_helper_display_panic_screen(struct drm_plane *plane, const char *d
>   }
>   EXPORT_SYMBOL(drm_plane_helper_display_panic_screen);
>   
> +#define drm_panic_trylock(dev, flags) \
> +	raw_spin_trylock_irqsave(&(dev)->mode_config.panic_lock, flags)
> +
>   static void drm_panic_display_panic_screen(struct drm_plane *plane, const char *description)
>   {
>   #if defined(CONFIG_DRM_PANIC_FOREGROUND_COLOR)
> diff --git a/drivers/gpu/drm/drm_panic_internal.h b/drivers/gpu/drm/drm_panic_internal.h
> new file mode 100644
> index 000000000000..c68d64c56e15
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_panic_internal.h
> @@ -0,0 +1,55 @@
> +/* SPDX-License-Identifier: GPL-2.0 or MIT */
> +
> +/*
> + * Copyright (c) 2024 Intel
> + * Copyright (c) 2024 Red Hat
> + */
> +
> +#ifndef __DRM_PANIC_INTERNAL_H__
> +#define __DRM_PANIC_INTERNAL_H__
> +
> +#include <linux/spinlock.h>
> +
> +struct drm_device;
> +
> +#ifdef CONFIG_DRM_PANIC
> +
> +/**
> + * drm_panic_lock - protect panic printing relevant state
> + * @dev: struct drm_device
> + * @flags: unsigned long irq flags you need to pass to the unlock() counterpart
> + *
> + * This function must be called to protect software and hardware state that the
> + * panic printing code must be able to rely on. The protected sections must be
> + * as small as possible. It uses the irqsave/irqrestore variant, and can be
> + * called from irq handler. Examples include:
> + *
> + * - Access to peek/poke or other similar registers, if that is the way the
> + *   driver prints the pixels into the scanout buffer at panic time.
> + *
> + * - Updates to pointers like &drm_plane.state, allowing the panic handler to
> + *   safely deference these. This is done in drm_atomic_helper_swap_state().
> + *
> + * - An state that isn't invariant and that the driver must be able to access
> + *   during panic printing.
> + */
> +#define drm_panic_lock(dev, flags) \
> +	raw_spin_lock_irqsave(&(dev)->mode_config.panic_lock, flags)
> +
> +/**
> + * drm_panic_unlock - end of the panic printing critical section
> + * @dev: struct drm_device
> + * @flags: irq flags that were returned when acquiring the lock
> + *
> + * Unlocks the raw spinlock acquired by either drm_panic_lock() or
> + * drm_panic_trylock().
> + */
> +#define drm_panic_unlock(dev, flags) \
> +	raw_spin_unlock_irqrestore(&(dev)->mode_config.panic_lock, flags)
> +
> +#else
> +static inline void drm_panic_lock(struct drm_device *dev, unsigned long flags) {}
> +static inline void drm_panic_unlock(struct drm_device *dev, unsigned long flags) {}
> +#endif
> +
> +#endif /* __DRM_PANIC_INTERNAL_H__ */
> diff --git a/include/drm/drm_panic.h b/include/drm/drm_panic.h
> index 430df536de14..99572b7eeab9 100644
> --- a/include/drm/drm_panic.h
> +++ b/include/drm/drm_panic.h
> @@ -8,11 +8,9 @@
>   #ifndef __DRM_PANIC_H__
>   #define __DRM_PANIC_H__
>   
> -#include <linux/module.h>
>   #include <linux/types.h>
>   #include <linux/iosys-map.h>
>   
> -#include <drm/drm_device.h>
>   #include <drm/drm_fourcc.h>
>   
>   struct page;
> @@ -85,71 +83,8 @@ struct drm_scanout_buffer {
>   	 * set_pixel()
>   	 */
>   	void *private;
> -
>   };
>   
> -#ifdef CONFIG_DRM_PANIC
> -
> -/**
> - * drm_panic_trylock - try to enter the panic printing critical section
> - * @dev: struct drm_device
> - * @flags: unsigned long irq flags you need to pass to the unlock() counterpart
> - *
> - * The panic-printing code calls this function. The panic printing attempt must
> - * be aborted if the trylock fails.
> - *
> - * Return:
> - * %0 when failing to acquire the raw spinlock, nonzero on success.
> - */
> -#define drm_panic_trylock(dev, flags) \
> -	raw_spin_trylock_irqsave(&(dev)->mode_config.panic_lock, flags)
> -
> -/**
> - * drm_panic_lock - protect panic printing relevant state
> - * @dev: struct drm_device
> - * @flags: unsigned long irq flags you need to pass to the unlock() counterpart
> - *
> - * This function must be called to protect software and hardware state that the
> - * panic printing code must be able to rely on. The protected sections must be
> - * as small as possible. It uses the irqsave/irqrestore variant, and can be
> - * called from irq handler. Examples include:
> - *
> - * - Access to peek/poke or other similar registers, if that is the way the
> - *   driver prints the pixels into the scanout buffer at panic time.
> - *
> - * - Updates to pointers like &drm_plane.state, allowing the panic handler to
> - *   safely deference these. This is done in drm_atomic_helper_swap_state().
> - *
> - * - An state that isn't invariant and that the driver must be able to access
> - *   during panic printing.
> - */
> -
> -#define drm_panic_lock(dev, flags) \
> -	raw_spin_lock_irqsave(&(dev)->mode_config.panic_lock, flags)
> -
> -/**
> - * drm_panic_unlock - end of the panic printing critical section
> - * @dev: struct drm_device
> - * @flags: irq flags that were returned when acquiring the lock
> - *
> - * Unlocks the raw spinlock acquired by either drm_panic_lock() or
> - * drm_panic_trylock().
> - */
> -#define drm_panic_unlock(dev, flags) \
> -	raw_spin_unlock_irqrestore(&(dev)->mode_config.panic_lock, flags)
> -
> -#else
> -
> -static inline bool drm_panic_trylock(struct drm_device *dev, unsigned long flags)
> -{
> -	return true;
> -}
> -
> -static inline void drm_panic_lock(struct drm_device *dev, unsigned long flags) {}
> -static inline void drm_panic_unlock(struct drm_device *dev, unsigned long flags) {}
> -
> -#endif
> -
>   #if defined(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
>   size_t drm_panic_qr_max_data_size(u8 version, size_t url_len);
>   


