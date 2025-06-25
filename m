Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 981ADC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 19:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O4nu8mefJbyYB9Pt62QRGWGhat2XpUcP+oPL1CGj9B4=; b=XwD1U5hfo80KJVnMgdVLx6W80z
	xLYKA69uALnQ/5XSmnueOOA4uq2m7kOMJteZZA5XITR5Mz6DfW2F+eLfwnfAJLXCrY5G+qxQiDwga
	NaZS2xdrt16X2eH3a6VY/A7ffvEr0JPKCfUuzyIm1F7s8Bp20RPelsMuBMKq/mqtKgmobfUVRsguN
	bw5CJOVYJ34O8T6MDhGJj4QmlImvF4e1T/OwENy9erjVeSwwyjgJR3GqWLZMn0g9ncO3TuJw+bVyY
	S5xuxq/pFBb/XG+eLI22e+0rtsiwvEMfEQWNSoez6MVQuEdccs5D2dBn2KzYjvLchJXzJwRXTLA2e
	nUdyYHag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUW0D-00000009lkv-1gXg;
	Wed, 25 Jun 2025 19:41:50 +0000
Received: from mailrelay-egress4.pub.mailoutpod2-cph3.one.com ([2a02:2350:5:403::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uURvV-000000095zn-4Aaa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 15:20:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1750864835; x=1751469635;
	d=ravnborg.org; s=rsa1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=O4nu8mefJbyYB9Pt62QRGWGhat2XpUcP+oPL1CGj9B4=;
	b=a1X3H2yL8v7P4SnvtjpcYSzYCDLMsRmv/8xxRbhh0VWKm1M+OM2Q2RBGLsZgXmCEzDEi7vEiLriV6
	 sGSExYqKFH5YT+1nyGFYLTrXMVBODPYk6WBFPvjtYJ09djFErOtpncj+qw+7nEaIBeDUBmqE1jMzDd
	 dx1v7v1JCv1MwqJibYHvCzGJyyvQkVfbgUzxwfVOa+uuuxczKKx/uuUxTr3dm1m7vjVTq9d7cCqxKm
	 72qfB6lKxOL4vW+ChH3J4WsitteUF52qUWyMOEY0VB9m7t8xQsq6mjG6mwVDLbv+F82wBUXqnEOMS8
	 L1GAn6TJt9eqNJoEp6Nguj0TnDPmNTQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1750864835; x=1751469635;
	d=ravnborg.org; s=ed1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=O4nu8mefJbyYB9Pt62QRGWGhat2XpUcP+oPL1CGj9B4=;
	b=an/A7ULkJGe/vIKIMyryjrdRMnV19OwHwIWB1Fkwk2Rz76GeXX5uaPCxZUoLqCMtdTqgHtUnW2uIc
	 81Zh8GgDQ==
X-HalOne-ID: ef3a532b-51d7-11f0-8665-f78b1f841584
Received: from ravnborg.org (2-105-16-150-cable.dk.customer.tdc.net [2.105.16.150])
	by mailrelay1.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id ef3a532b-51d7-11f0-8665-f78b1f841584;
	Wed, 25 Jun 2025 15:20:34 +0000 (UTC)
Date: Wed, 25 Jun 2025 17:20:33 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>,
	Arnd Bergmann <arnd@arndb.de>, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] fbdev: remove fb_notify support
Message-ID: <20250625152033.GA183878@ravnborg.org>
References: <20250625131511.3366522-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625131511.3366522-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_082043_221584_AB12503E 
X-CRM114-Status: GOOD (  38.57  )
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

Hi Arnd.

I remember I stared at this code before, good to see it gone.
There is a bit more tidiying up you can do.

Also, I suggest to split it in two patches, it itches me to see the
driver specific part mixed up with the fb_notify removal.

	Sam


On Wed, Jun 25, 2025 at 03:12:22PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Commit dc2139c0aa32 ("leds: backlight trigger: Replace fb events with a
> dedicated function call") removed the FB_EVENT_BLANK notifier, and now
> the only remaining user of the FB notifier is the metronomefb driver on
> the PXA/AM200EPD board.
> 
> This was introduced in commit 922613436ae5 ("[ARM] 5200/1: am200epd: use
> fb notifiers and gpio api"), which converted it from an earlier version,
> but as far as I can tell this can never have worked because the notifier
> is called after the data it passes down is accessed.
> 
> Commit 867187821e5e ("fbdev/metronomefb: Use struct fb_info.screen_buffer")
> broke this further, and there are likely other parts of the driver that
> no longer work.
> 
> The am200epd board support itself should have also been removed long ago,
> as there are no users and it was never converted to devicetree format.
> 
> Mark the board as broken to prevent build failures and remove the now
> unused notifiers.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/mach-pxa/Kconfig            |  1 +
This is mixing things up a bit. I suggest
splitting the "depends on BROKEN" out in a dedicated patch.

>  drivers/video/fbdev/core/Makefile    |  1 -
>  drivers/video/fbdev/core/fb_notify.c | 54 ----------------------------
>  drivers/video/fbdev/core/fbmem.c     | 15 --------
>  include/linux/fb.h                   | 21 -----------
>  5 files changed, 1 insertion(+), 91 deletions(-)
>  delete mode 100644 drivers/video/fbdev/core/fb_notify.c
> 
> diff --git a/arch/arm/mach-pxa/Kconfig b/arch/arm/mach-pxa/Kconfig
> index 10e472f4fa43..edefc953e4f9 100644
> --- a/arch/arm/mach-pxa/Kconfig
> +++ b/arch/arm/mach-pxa/Kconfig
> @@ -69,6 +69,7 @@ choice
>  
>  config GUMSTIX_AM200EPD
>  	bool "Enable AM200EPD board support"
> +	depends on BROKEN
>  
>  config GUMSTIX_AM300EPD
>  	bool "Enable AM300EPD board support"
> diff --git a/drivers/video/fbdev/core/Makefile b/drivers/video/fbdev/core/Makefile
> index d15974759086..ac8036209501 100644
> --- a/drivers/video/fbdev/core/Makefile
> +++ b/drivers/video/fbdev/core/Makefile
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
> -obj-$(CONFIG_FB_NOTIFY)           += fb_notify.o
>  obj-$(CONFIG_FB_CORE)             += fb.o
>  fb-y                              := fb_info.o \
>                                       fbmem.o fbcmap.o \
> diff --git a/drivers/video/fbdev/core/fb_notify.c b/drivers/video/fbdev/core/fb_notify.c
> deleted file mode 100644
> index 10e3b9a74adc..000000000000
> --- a/drivers/video/fbdev/core/fb_notify.c
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -/*
> - *  linux/drivers/video/fb_notify.c
> - *
> - *  Copyright (C) 2006 Antonino Daplas <adaplas@pol.net>
> - *
> - *	2001 - Documented with DocBook
> - *	- Brad Douglas <brad@neruo.com>
> - *
> - * This file is subject to the terms and conditions of the GNU General Public
> - * License.  See the file COPYING in the main directory of this archive
> - * for more details.
> - */
> -#include <linux/fb.h>
> -#include <linux/notifier.h>
> -#include <linux/export.h>
> -
> -static BLOCKING_NOTIFIER_HEAD(fb_notifier_list);
> -
> -/**
> - *	fb_register_client - register a client notifier
> - *	@nb: notifier block to callback on events
> - *
> - *	Return: 0 on success, negative error code on failure.
> - */
> -int fb_register_client(struct notifier_block *nb)
> -{
> -	return blocking_notifier_chain_register(&fb_notifier_list, nb);
> -}
> -EXPORT_SYMBOL(fb_register_client);
> -
> -/**
> - *	fb_unregister_client - unregister a client notifier
> - *	@nb: notifier block to callback on events
> - *
> - *	Return: 0 on success, negative error code on failure.
> - */
> -int fb_unregister_client(struct notifier_block *nb)
> -{
> -	return blocking_notifier_chain_unregister(&fb_notifier_list, nb);
> -}
> -EXPORT_SYMBOL(fb_unregister_client);
> -
> -/**
> - * fb_notifier_call_chain - notify clients of fb_events
> - * @val: value passed to callback
> - * @v: pointer passed to callback
> - *
> - * Return: The return value of the last notifier function
> - */
> -int fb_notifier_call_chain(unsigned long val, void *v)
> -{
> -	return blocking_notifier_call_chain(&fb_notifier_list, val, v);
> -}
> -EXPORT_SYMBOL_GPL(fb_notifier_call_chain);
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index dfcf5e4d1d4c..82ec7351e7da 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -498,14 +498,6 @@ static int do_register_framebuffer(struct fb_info *fb_info)
>  	num_registered_fb++;
>  	registered_fb[i] = fb_info;
>  
> -#ifdef CONFIG_GUMSTIX_AM200EPD
> -	{
> -		struct fb_event event;
Drop the fb_event definition, it is no longer used.

> -		event.info = fb_info;
> -		fb_notifier_call_chain(FB_EVENT_FB_REGISTERED, &event);
Drop the define for FB_EVENT_FB_REGISTERED

> -	}
> -#endif
> -
>  	return fbcon_fb_registered(fb_info);
>  }
>  
> @@ -544,13 +536,6 @@ static void do_unregister_framebuffer(struct fb_info *fb_info)
>  	fb_destroy_modelist(&fb_info->modelist);
>  	registered_fb[fb_info->node] = NULL;
>  	num_registered_fb--;
> -#ifdef CONFIG_GUMSTIX_AM200EPD
> -	{
> -		struct fb_event event;
> -		event.info = fb_info;
> -		fb_notifier_call_chain(FB_EVENT_FB_UNREGISTERED, &event);
Drop the define for FB_EVENT_FB_UNREGISTERED

> -	}
> -#endif
>  	fbcon_fb_unregistered(fb_info);
>  
>  	/* this may free fb info */
> diff --git a/include/linux/fb.h b/include/linux/fb.h
> index 05cc251035da..520ad870b8b2 100644
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -151,27 +151,6 @@ struct fb_blit_caps {
>  	u32 flags;
>  };
>  
> -#ifdef CONFIG_FB_NOTIFY

The Kconfig symbol FB_NOTIFY should be dropped as well.


> -extern int fb_register_client(struct notifier_block *nb);
Drop forward for notifier_block, last user in the file is gone.

> -extern int fb_unregister_client(struct notifier_block *nb);
> -extern int fb_notifier_call_chain(unsigned long val, void *v);
> -#else
> -static inline int fb_register_client(struct notifier_block *nb)
> -{
> -	return 0;
> -};
> -
> -static inline int fb_unregister_client(struct notifier_block *nb)
> -{
> -	return 0;
> -};
> -
> -static inline int fb_notifier_call_chain(unsigned long val, void *v)
> -{
> -	return 0;
> -};
> -#endif
> -
>  /*
>   * Pixmap structure definition
>   *
> -- 
> 2.39.5

