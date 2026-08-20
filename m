Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 894ACC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 17:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EM5PkmngzWPW5YVaOcE4doFSUi3DdsSPp8p0edYyrwQ=; b=nDYAn9ZK1ctZXSjUlb0SEGJJIF
	tOTQQa96ygq/TxXAEuYxEMS7pYcc2DLoH9PIX76RRtBw70X9Dn2cA/U/xg2jrUFf6qm7F7UL2C0/H
	QYAvBqxJIGbX6OSgD38y477aQPGRnwstc0KVGGn4/iqaeC34/0aQVwbitHXe3VDJ2YYvA/WlfUdVE
	sxpy0Fvl5ThBNAsIyGHNjpvcGcR6LCFHW6j9urIW+ZP0aVG6hgcFP0Z4svBiJi02Hk/Yi8aeU4F49
	rtAcnaQj95oDeJF1izWKmP6bg6sAWfipP4+OwonUFUJwB8DQQ92QZXa79Htfprmb7zwQhaKWBHuSd
	hL0Dd7/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx6Jr-0000000Bwff-0aVz;
	Thu, 20 Aug 2026 17:12:47 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx6Jp-0000000Bwf6-0z20
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 17:12:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787245964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EM5PkmngzWPW5YVaOcE4doFSUi3DdsSPp8p0edYyrwQ=;
	b=MB95tA0kSm/DzqgLDbcjacsn/i2D4iPtbg3PFM2VLK9WSAP4Ajxo+Cy8MYgkAsfJwZEJ52
	MX5QK0J/SjdCgQShzWcaO6IbVSuxndH1P2ZV/eEEUVEqHqkTDMq+R8IoZvPsdavpjWpR3y
	kETTKZ4McQrkv+W35O6eGcdga+wZ2rg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-137-g2fjIw3fPmOC9rrqO46waw-1; Thu, 20 Aug 2026 13:12:42 -0400
X-MC-Unique: g2fjIw3fPmOC9rrqO46waw-1
X-Mimecast-MFC-AGG-ID: g2fjIw3fPmOC9rrqO46waw_1787245962
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-482b88653d9so91702f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 10:12:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787245962; x=1787850762;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EM5PkmngzWPW5YVaOcE4doFSUi3DdsSPp8p0edYyrwQ=;
        b=XlY2nNeWvOs/FjI51AZmTgH6ah+J+J/2dHJT8A3nPHooGA+jNXAcaPrghZrcg7PjZ1
         xkNbZLJLVEjI3jpCPa7jBJoG+KbiZSDf7uXoQ8mO1dRd1JyI/oXx0WyMUw7BR1XD8gq9
         AJ6ntnVcYyWudKcwBP97f5Bkus51cnMQE8AXbjgCcBJ3Xfvh6MctFuq2q5jWtNCEEcGx
         NfLxO6E8SHTW6O8uNKNbAkR6F/yKI1oP13pPk8a3/s8qhGTj6oVH4b/0gT4G1+JowQ+u
         //KXdMFp/NJYdtC96vi5KlJfDtm342WVEHzpdujPFnGp4bVWnq5Ws9uSMxBg8PoqfI2E
         7ZqQ==
X-Forwarded-Encrypted: i=1; AHgh+RpsrlHXvuPOYqRds15l8CTS082DeO3RSF6GR7Pj6HNtXuD653S89RjLy1Cou8Utlm4G5KAKSil8yh0Bthrq3wLn@lists.infradead.org
X-Gm-Message-State: AOJu0YzU5KYBYH148fGnQO9NR1QqLZuuTJDOIXMxVUpaB2RMtAkflG71
	TWwGIYoo4+Flxd4sbHAC2p0ATxkWgtwElb4o3/C/EK5EAxwhhkuXBAAemp4tIKGPXs0ZobSUfAq
	WlDdKO8Y9P+9RHOLnDlAz90sF+JjiLB0MXkb+yDedjRM0j/shq/jbzDM+3glO3t6Z1it7H7lZc+
	LOLcQlotn6
X-Gm-Gg: AR+sD11xpAlAiompcpuLn3rCsm37zSwUpFI2r174hDqR0P9cGZ+gOqNwkNCTvd9kRVL
	GKTJQsobHHyTionxTuFtx8nNI3qXVB+oD4OPn8Ja3KFeyxXqk+T8pj8bGjATEcj6S24QCFm+Ucd
	V8aniPojVz7Qng1f9Q/hqRL9iZ47aZ6BWYZ2C51oL5CU2jQqBqxMHqMUaMI8/XgnIgPBs+SphQO
	zYWgIXBvy7l18lvp07bym293vVPe4EX7YuUnUcsK/l5fw6StgRQvKdGNGnF4iCXmR27DwUdxrkH
	ocEC501sa/xc1y2DXSnCIi1V08jYjMi+TmXtm7Zf51fzuLUDwqTUw5IdV3rnWy8t0KP4GwZC8CQ
	3Vp+uPS431iTz0GryHE7xgEjbcAOydzyZzFFRKkS0ZP9vGg==
X-Received: by 2002:a05:600c:8819:b0:499:8aff:59b6 with SMTP id 5b1f17b1804b1-499b8301c54mr7853285e9.14.1787245961741;
        Thu, 20 Aug 2026 10:12:41 -0700 (PDT)
X-Received: by 2002:a05:600c:8819:b0:499:8aff:59b6 with SMTP id 5b1f17b1804b1-499b8301c54mr7852145e9.14.1787245961316;
        Thu, 20 Aug 2026 10:12:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:11aa:87f0:935:4f8e:b423:64eb? ([2a01:e0a:11aa:87f0:935:4f8e:b423:64eb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa17fc80sm168153685e9.14.2026.08.20.10.12.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 10:12:40 -0700 (PDT)
Message-ID: <b332e4f1-30a8-40b1-bdd5-f0c3f816c229@redhat.com>
Date: Thu, 20 Aug 2026 19:12:37 +0200
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
X-Mimecast-MFC-PROC-ID: MIsrOlzsvTUX8NtQyChGspnVTm0oeG179WmDsENmJrM_1787245962
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_101245_356769_59D814AF 
X-CRM114-Status: GOOD (  19.98  )
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


