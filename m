Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E92CC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 21:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RXVQhrGkg3lXBqNlBJkrZ/ldyJ2zR16o0mRFm8tzu8Q=; b=dy2VTC9qrJerV9KjqkNWDsQlui
	ohqZTtduMfCU2hoEzYdILnjRa7s7GUPfCiJ/Rixq29ZGPDEXPLHWKfEcu1ZzTfpd5Bo2lIGHf5CTi
	sj4rXFiK2V9tAgGZsW3oU23vW90/vX2eOo1rL1eliSuzQDzUwCc/4oZwgC8xi9sEcQQv3wYkBeRtA
	gFVmG7rponmPflgu3XY6MiDve7A0pKzMfw9cVwpJ6dQHCvTxGGRs6FhzCPff8T0C0Wp6PfSoyVKbU
	3ZZg0tr+O2WDSIji5vPs5LucHFek5FqrBu2IhyYZVn1XMzt9VE3iySjwmxYKLAVdvXztDkUimuP2n
	tKTNrsqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3gci-00000007kTT-018f;
	Mon, 07 Sep 2026 21:11:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3gcf-00000007kSu-0e6A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 21:11:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788815484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RXVQhrGkg3lXBqNlBJkrZ/ldyJ2zR16o0mRFm8tzu8Q=;
	b=RxC1nr7of0QbbsgyOf70eKGyoGMgvkWFI5iDAQxSAfxl/7AbA95N7kdGHGY0qCHJA1+UGV
	ESSK1EVBW9mEKFwUFaXwIZgVzUtLsBVt5HKmzlVRMm/f3OVKknaoacHLGJeHeVSHpJYVKo
	w+ogJV0FrmGCc4AkpYfQCCeij19Q4Js=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-470-7Wm3Qa-DPQqcit3Nac4qSg-1; Mon,
 07 Sep 2026 17:11:20 -0400
X-MC-Unique: 7Wm3Qa-DPQqcit3Nac4qSg-1
X-Mimecast-MFC-AGG-ID: 7Wm3Qa-DPQqcit3Nac4qSg_1788815477
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8C2351964CFC;
	Mon,  7 Sep 2026 21:11:16 +0000 (UTC)
Received: from [100.91.157.188] (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5075A362;
	Mon,  7 Sep 2026 21:11:11 +0000 (UTC)
Message-ID: <30966123-4b2d-470f-9344-7719bcc9ab3f@redhat.com>
Date: Mon, 7 Sep 2026 23:11:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/14] drm/panic: Split draw_panic_plane()
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
 <20260902121930.597222-10-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20260902121930.597222-10-tzimmermann@suse.de>
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: PWoPnc89ozxEHAgukvS5F41frQ_JqUF7a5fwSK-KEO8_1788815477
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_141125_545436_6452BD11 
X-CRM114-Status: GOOD (  25.17  )
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
> Move locking and parameters from draw_panic_plane() into the new
> helper drm_panic_display_panic_screen(). Call draw_panic_plane() from
> there.
> 
> The new helper drm_panic_display_panic_screen() is now the DRM core's
> interface for displaying a panic screen. The code remaining in
> draw_panic_plane() still does all the heavy lifting. It will become a
> plane helper for DRM drivers.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> v2:
> - use panic_type argument in draw_panic_plane() (Sashiko)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_panic.c | 62 ++++++++++++++++++++-----------------
>   1 file changed, 34 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index 690e96e8f1f9..624042c42a7f 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -936,42 +936,25 @@ static void drm_panic_clear_description(void)
>   	desc_line->txt = NULL;
>   }
>   
> -static void draw_panic_plane(struct drm_plane *plane, const char *description)
> +static void draw_panic_plane(struct drm_plane *plane, const char *description,
> +			     enum drm_panic_type panic_type, u32 fg_color, u32 bg_color,
> +			     unsigned int qr_version)
>   {
>   	struct drm_scanout_buffer sb = { };
>   	int ret;
> -	unsigned long flags;
> -#if defined(CONFIG_DRM_PANIC_FOREGROUND_COLOR)
> -	u32 fg_color = CONFIG_DRM_PANIC_FOREGROUND_COLOR;
> -#else
> -	u32 fg_color = 0x00ffffff;
> -#endif
> -#if defined(CONFIG_DRM_PANIC_BACKGROUND_COLOR)
> -	u32 bg_color = CONFIG_DRM_PANIC_BACKGROUND_COLOR;
> -#else
> -	u32 bg_color = 0x00000000;
> -#endif
> -#if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
> -	unsigned int qr_version = panic_qr_version;
> -#else
> -	unsigned int qr_version = 0;
> -#endif
> -
> -	if (!drm_panic_trylock(plane->dev, flags))
> -		return;
>   
>   	ret = plane->helper_private->get_scanout_buffer(plane, &sb);
>   
>   	if (ret || !drm_panic_is_format_supported(sb.format))
> -		goto unlock;
> +		return;
>   
>   	/* One of these should be set, or it can't draw pixels */
>   	if (!sb.set_pixel && !sb.pages && iosys_map_is_null(&sb.map[0]))
> -		goto unlock;
> +		return;
>   
>   	drm_panic_set_description(description);
>   
> -	ret = draw_panic_dispatch(&sb, drm_panic_type, fg_color, bg_color, qr_version);
> +	ret = draw_panic_dispatch(&sb, panic_type, fg_color, bg_color, qr_version);
>   	if (!ret) {
>   		/*
>   		 * Only flush if we have a panic screen to display. Otherwise
> @@ -982,9 +965,33 @@ static void draw_panic_plane(struct drm_plane *plane, const char *description)
>   	}
>   
>   	drm_panic_clear_description();
> +}
>   
> -unlock:
> -	drm_panic_unlock(plane->dev, flags);
> +static void drm_panic_display_panic_screen(struct drm_plane *plane, const char *description)
> +{
> +#if defined(CONFIG_DRM_PANIC_FOREGROUND_COLOR)
> +	u32 fg_color = CONFIG_DRM_PANIC_FOREGROUND_COLOR;
> +#else
> +	u32 fg_color = 0x00ffffff;
> +#endif
> +#if defined(CONFIG_DRM_PANIC_BACKGROUND_COLOR)
> +	u32 bg_color = CONFIG_DRM_PANIC_BACKGROUND_COLOR;
> +#else
> +	u32 bg_color = 0x00000000;
> +#endif
> +#if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
> +	unsigned int qr_version = panic_qr_version;
> +#else
> +	unsigned int qr_version = 0;
> +#endif
> +	struct drm_device *dev = plane->dev;
> +	unsigned long flags;
> +
> +	if (drm_panic_trylock(dev, flags)) {
> +		draw_panic_plane(plane, description, drm_panic_type,
> +				 fg_color, bg_color, qr_version);
> +		drm_panic_unlock(dev, flags);
> +	}
>   }
>   
>   static struct drm_plane *to_drm_plane(struct kmsg_dumper *kd)
> @@ -997,10 +1004,9 @@ static void drm_panic(struct kmsg_dumper *dumper, struct kmsg_dump_detail *detai
>   	struct drm_plane *plane = to_drm_plane(dumper);
>   
>   	if (detail->reason == KMSG_DUMP_PANIC)
> -		draw_panic_plane(plane, detail->description);
> +		drm_panic_display_panic_screen(plane, detail->description);
>   }
>   
> -
>   /*
>    * DEBUG FS, This is currently unsafe.
>    * Create one file per plane, so it's possible to debug one plane at a time.
> @@ -1017,7 +1023,7 @@ static ssize_t debugfs_trigger_write(struct file *file, const char __user *user_
>   	if (kstrtobool_from_user(user_buf, count, &run) == 0 && run) {
>   		struct drm_plane *plane = file->private_data;
>   
> -		draw_panic_plane(plane, "Test from debugfs");
> +		drm_panic_display_panic_screen(plane, "Test from debugfs");
>   	}
>   	return count;
>   }


