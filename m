Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D67B9C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 17:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EM5PkmngzWPW5YVaOcE4doFSUi3DdsSPp8p0edYyrwQ=; b=duB2ALREKih142RNcLX2IiDCuE
	Z369kdYFQ+btkfkDR/k4NWDsOtVMhDyfa/ZwEEwDZPDhW9v/RRNA634CmBupdTkEvYwv3+rPM/FZx
	ZjKX8zPIlT06dljOT6OHYSh8d6Hs11ZbRBNs9xy6ljtrFPfL4Jh6OIjU8y6I3Aooy9OM7s+MlSyya
	6o486WG7Q+PnjZwK547UROTPpLp1OHU49l1/cvxPWgCHkV4cfTDflcxssvBDtMtGvumwbZFyEr/GK
	/TH3KS25uk3sDwiaCK2Mf+ROHJ0CE6Y7UBDw1glcwtZtHVXHHli9E8hSDqPuYzuvyQKmTMQb5AUzJ
	4qgvOf9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx6Mb-0000000Bwu8-2Slo;
	Thu, 20 Aug 2026 17:15:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx6MY-0000000Bwtc-2dnR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 17:15:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787246133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EM5PkmngzWPW5YVaOcE4doFSUi3DdsSPp8p0edYyrwQ=;
	b=Mj02zLOhbOZABOq6NVZ00KGwDRJ+eO6RF62/nltLfvTd5U2PGrXXstR0gdDLm2vjZVg5bc
	G2PkwOiIBv0oLgyrxvYg8NDGPO2x9ie+W+axNEpKpOGuF424rNa+twDXzbaDhkjmm3QOSi
	VO6Vt/O5v2eXZ3YduGiWmNHdSklo/R4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-145-KEpyKubxN2-kvV5EXw-hYg-1; Thu, 20 Aug 2026 13:15:31 -0400
X-MC-Unique: KEpyKubxN2-kvV5EXw-hYg-1
X-Mimecast-MFC-AGG-ID: KEpyKubxN2-kvV5EXw-hYg_1787246130
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49571407d1dso447185e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 10:15:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787246130; x=1787850930;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EM5PkmngzWPW5YVaOcE4doFSUi3DdsSPp8p0edYyrwQ=;
        b=TwV12tz404fg9maReG3TUAb6GWZZPcIyYap6+1A+eGTjaExbrVx6C7Pe01RXa+tneO
         OGYzbytWIDuGnopUVatgE2yYhPC/H3U4c/k2AaC1zgfyZO/dFkFE/4aRYQPFaVAkNhif
         0BCVa+4K92jybYc/xdzfZ0IfdUFnqGXc6MuLyX668nEBGVpgWrxEKK9IITkLj7zXTZGE
         WaLBjugPX5r5RvREkGTU21OXi28UGw3o7AVKzhp9oLBFmQhvWrBxyVmcyntNogZMGv19
         xnPlZHLcs6zO0iOqyhw3muNeMuQJ9y6zC9VE9tXEsive5N2s+/954yDia3MRHqOa9tAB
         yZZA==
X-Forwarded-Encrypted: i=1; AHgh+RqBkzgzqIfmgqtCp7A7pI1x8hSl5EBbo9gGCPF590woZYm6DdTyPYgjsFqa/ZT4omm+s7DOmw14EWbuDSoKQP+E@lists.infradead.org
X-Gm-Message-State: AOJu0YyWu27j/8YAXn3p5X29g0+tRgdi2A2JZg88AbHATohLvq1u0iKe
	zHg8jnZniExjjlBlHOHpLi1EN/xbS4+audx/ocxVWlZIx056CES7ScGnZ9i/wpXW+N/b7mAwwDT
	ohprYhTfsupaKHSIl1Q2EG2xO/ISUFNwRVAsK2ikJyK/BzzJ32zJoO0cHtI/md1wW3eryQ4OqrE
	tf
X-Gm-Gg: AR+sD11jds6XgbCVrtWO1WU//uh4tBKfleGRK4UVfps/we5izl0aiRM+G633Hb/9mfN
	/i9MFkAeo+3gVRzapxQ02DgZMkNP5jTvK/GGcJEQTojNxssFGLT0sFI1VS+SdwEvnbu3uqS7bFK
	DlneDDObesYQjbF0D98x8BHuHeocuUEwTDutuugq1DEOnOEYaP71IAaOu4HnVeXzqvnqy5+95uR
	+QpeOwTTv+E2TVmOHFYnodcfMf8eK8BMugb4lUmIgFPDmuYnY18OmI1+tOKv9b5xHIMOpMUZn52
	RSYs4VOl6Lw+a0oDLtlSfAN7s9Iol3aN/+5LnBn2jtgDdfyi4zweBYL7NSLN4tSqGp4RMuPumF5
	oEgQi6MspKSZ83zt98cyrndhDZjaVsv87U5gflhjL6w+I7w==
X-Received: by 2002:a05:600c:c493:b0:499:7aa7:eaa7 with SMTP id 5b1f17b1804b1-499b845c184mr6845275e9.15.1787246130260;
        Thu, 20 Aug 2026 10:15:30 -0700 (PDT)
X-Received: by 2002:a05:600c:c493:b0:499:7aa7:eaa7 with SMTP id 5b1f17b1804b1-499b845c184mr6843265e9.15.1787246129216;
        Thu, 20 Aug 2026 10:15:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:11aa:87f0:935:4f8e:b423:64eb? ([2a01:e0a:11aa:87f0:935:4f8e:b423:64eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14514d5sm14505430f8f.10.2026.08.20.10.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 10:15:28 -0700 (PDT)
Message-ID: <dd1da602-675f-4b63-ace3-a23e55ce549b@redhat.com>
Date: Thu, 20 Aug 2026 19:15:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] drm/panic: Retry in dispatch function if panic
 output fails
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, virtualization@lists.linux.dev,
 sashiko-reviews@lists.linux.dev
References: <20260818125012.468092-1-tzimmermann@suse.de>
 <20260818125012.468092-8-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20260818125012.468092-8-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bA4BZcKnfbrUqEixQrLWMqU2QFcW8fCZ2NHApeveD8s_1787246130
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_101534_737461_070E3B5D 
X-CRM114-Status: GOOD (  20.09  )
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

On 18/08/2026 14:28, Thomas Zimmermann wrote:
> On failed output of QR codes and kmsg buffers, fall back to a user
> message. QR-code output already did this internally, but now formally
> support it in drm_panic_dispatch(). Streamlines the existing logic.
> 
> Also pass module parameter drm_panic_type as a parameter to
> drm_panic_dispatch(). This simpifies the implementation. It will later
> allow for moving the function into a helper library.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_panic.c | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index 12c39217cbcb..0960750bfce2 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -746,9 +746,9 @@ static int drm_panic_get_qr_code(u8 **qr_image, unsigned int qr_version)
>   /*
>    * Draw the panic message at the center of the screen, with a QR Code
>    */
> -static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
> -				      u32 fg_color, u32 bg_color,
> -				      unsigned int qr_version)
> +static int draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
> +				     u32 fg_color, u32 bg_color,
> +				     unsigned int qr_version)
>   {
>   	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
>   	struct drm_rect r_screen, r_logo, r_msg, r_qr, r_qr_canvas;
> @@ -816,15 +816,6 @@ static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
>   	drm_panic_blit(sb, &r_qr, qr_image, qr_pitch, scale, fg_color);
>   	return 0;
>   }
> -
> -static int draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
> -				     u32 fg_color, u32 bg_color,
> -				     unsigned int qr_version)
> -{
> -	if (_draw_panic_screen_qr_code(sb, fg_color, bg_color, qr_version))
> -		draw_panic_screen_user(sb, fg_color, bg_color);
> -	return 0;
> -}
>   #else
>   static void drm_panic_qr_init(void) {};
>   static void drm_panic_qr_exit(void) {};
> @@ -899,13 +890,22 @@ static int draw_panic_dispatch(struct drm_scanout_buffer *sb, enum drm_panic_typ
>   {
>   	int ret;
>   
> +retry:
>   	switch (panic_type) {
>   	case DRM_PANIC_TYPE_KMSG:
>   		ret = draw_panic_screen_kmsg(sb, fg_color, bg_color);
> +		if (ret) {
> +			panic_type = DRM_PANIC_TYPE_USER;
> +			goto retry;
> +		}
>   		break;
>   #if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
>   	case DRM_PANIC_TYPE_QR:
>   		ret = draw_panic_screen_qr_code(sb, fg_color, bg_color, qr_version);
> +		if (ret) {
> +			panic_type = DRM_PANIC_TYPE_USER;
> +			goto retry;
> +		}
>   		break;
>   #endif
>   	case DRM_PANIC_TYPE_USER:


