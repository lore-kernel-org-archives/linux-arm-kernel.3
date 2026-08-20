Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4CBC5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 17:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TF+roY3oCVB3u96D2m+Kn+7JYFil1XkjxfPcXPVAxaA=; b=psSEC0CLyXukA+EWnnWnMxB8kT
	S4nnc6er4YFCQ6YRVQDPK0K+MTg0y0iOUME8FGKT1Sf2q7rBT8/pNSGWKR4cI0w1pyY2eM6ImdI1v
	tEZMZKlfWQDl3e11WFIfFokkoPidRs18O50mKOgtsD++TKgyiVj5qDZDuipsSYz2wQs7LYyhZQbNw
	/M5V/OA23ifs+3sWrW0wy//Ld1ao4OPQ1RQqJEvCKR4ZqrAfCXjQm5XZOUqsrqv081uzwCNzogE0V
	Ef+RBmMbikLFFeYhDT+2vfExwhRu2BO6g/cyj5ZDe2tKeh1MNAY/56ONY9ku2M8rDRQTLEpu+AHUF
	n6bZI1tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx6Dz-0000000BwCy-1InE;
	Thu, 20 Aug 2026 17:06:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx6Dw-0000000BwCS-1nV5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 17:06:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787245599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TF+roY3oCVB3u96D2m+Kn+7JYFil1XkjxfPcXPVAxaA=;
	b=VdGFzHOlL4mVP8a8bfTG0fGy3cgjafHQ+VG7x0KjRwh5V5BCARA0zeeiCDOFQxEpseTEI1
	1eB53v1CLZPnynO+TSVJ5pVLSJPjTmg0LpexOVR6WnvPjCj7x3HTPYVBV+SW741pxcDg4n
	7+eix6Msy1P6eDuP93jiLWxXq6Swzt0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-MmqWHQqTOOmhnqQDKx-v1w-1; Thu, 20 Aug 2026 13:05:00 -0400
X-MC-Unique: MmqWHQqTOOmhnqQDKx-v1w-1
X-Mimecast-MFC-AGG-ID: MmqWHQqTOOmhnqQDKx-v1w_1787245499
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-496bbcf7d1eso393735e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 10:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787245499; x=1787850299;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TF+roY3oCVB3u96D2m+Kn+7JYFil1XkjxfPcXPVAxaA=;
        b=VL6Fa/uTnckKA2H7otRMAEnMw/BbHaOmbdVuJC9YgV6AnE09SVdQlvp2kw2BukD57J
         P+Q7zF9NN0lUH8GeH8yvc8i2CDT6J1Ro10y3RS2sG36YcirPJHs+Y2cJVAzC6LFsMHTC
         BJxeOANyFnfeY5rsv92m61ae6kUm4/yqn3HDx5zBGtvL5C7gUu4RkLkmWBnP+4rNSMzo
         o1b7PWVLIJUj9PBSgwuOyuVoaD/RsrESEJ47VXGaZii8MjDDAu+7LlmURCHbtQjzP6wW
         a9LtmZYGKv/W5hiO/cVUyeB8fmTMa37QQVuSMSg5DBknO+vr2lFhZ7La6fv68SJQmP1Y
         sxYA==
X-Forwarded-Encrypted: i=1; AHgh+Rp/Yh7ZWT6gbivj/hb1IKPxGUjXMxI/v1mXgMaGDtQppmKzIu/Rw46Gm2aAl0G0c2RiXvXLTEJ0GwmbVu/63TpF@lists.infradead.org
X-Gm-Message-State: AOJu0Yxh84I5lECFi1Ofvxv7L953CSydWvjvzyzMz9XC4/fPi883wT4p
	67z4c8HQ/IzQATWJn9oqu0hErgs8AfNcx4aGQOPvYco2hk4cP8LLDHAw5HIRRjRThyL0ZJUwAtl
	GRyDcOQZ5v1xS2C8W/p011oRlckuGle1s1Nko7/ju9eAZJksS7aApRUXCEupX2D7qxOpmFjihZR
	YE
X-Gm-Gg: AR+sD12gI/ghIwc7qwzUh+FwGUAaWMbCOdUKoO1SU4lSnLf9Ge4y0gu0sk6CyKbhLpn
	nCf99BCcraBHxTNwU3AUX7qvSTcv1xzg7wTdWS8lG2tt7YUpPqaaHP40FdFE7ChGkPKkGsQOIZ4
	O+vSQXEunMVbWvQmWhIYRpqkTWsloFmwB75IlLHkWGhHrR9Fgzp76YaVU2wS+hVKc0TiEEyH/T8
	e1fiuDKXyEfl1MbKyuBoww4o2/BOdgHH6XC5hJ+HJWXgYSWTXMyTlJVUJ+zQzxJlxgPqUPE5iNA
	FyHrVt9nNfaP+iXOPtIZ9fd86fpeURWei9aKBS77If7fzigFb4+pYn6vL3UN6WPKY7aa1W1cMX2
	kLy6dhIGWOrBwZupm0bX8j4ju6toCmxBaRXU5C0drFhbelw==
X-Received: by 2002:a05:600c:6211:b0:495:4d88:e630 with SMTP id 5b1f17b1804b1-499b8465f7dmr5017055e9.10.1787245499102;
        Thu, 20 Aug 2026 10:04:59 -0700 (PDT)
X-Received: by 2002:a05:600c:6211:b0:495:4d88:e630 with SMTP id 5b1f17b1804b1-499b8465f7dmr5015695e9.10.1787245498659;
        Thu, 20 Aug 2026 10:04:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:11aa:87f0:935:4f8e:b423:64eb? ([2a01:e0a:11aa:87f0:935:4f8e:b423:64eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c33b3sm13157002f8f.27.2026.08.20.10.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 10:04:58 -0700 (PDT)
Message-ID: <cb784cf6-f3d8-41aa-9f71-c197a5eba7f2@redhat.com>
Date: Thu, 20 Aug 2026 19:04:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] drm/panic: Return -EINVAL if font is not available
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
 <20260818125012.468092-4-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20260818125012.468092-4-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SEJY7fuyno2GLVIro3ATd3YPyzoGRrF-SbFWewy0uFA_1787245499
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_100640_543184_55C4A07C 
X-CRM114-Status: GOOD (  14.78  )
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
> Font lookup does not allocate memory. Hence reporting ENOMEM on
> failed lookups is misleading. Report EINVAL instead.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_panic.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index 705b72bf0d83..96d238bfceee 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -757,8 +757,10 @@ static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb)
>   	int qr_width, qr_canvas_width, qr_pitch, v_margin;
>   	u8 *qr_image;
>   
> -	if (!font || !stream.workspace)
> +	if (!stream.workspace)
>   		return -ENOMEM;
> +	if (!font)
> +		return -EINVAL;
>   
>   	r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
>   


