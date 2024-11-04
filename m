Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E26ED1BDC2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 16:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r32SkwEDEGyM8KRubZcTgZf56txRY/08O0Oc/h8gpfM=; b=BCuzhb1GY7wgZyqV72fL9cORbm
	lUoftL0quH4IsWHpdzPXTXXKpjXDoiBl7seY+ZMTNRBE6zeNZW+VJfA0324Yl9k6xI+e3z0TyMo3V
	ZcwGsIE6DM4nWirqocWoTc9udJhbs5oYmhXeG27J6B1m9qKXHco4AzCoQznBrznPmSyeZd/M0kH9v
	4iOLaZXEbk5hCQui5q4yTlI0dH2vv1kfE8kJMeezTqoU8N+ilw3NrOWxHR1D3WVTBaKCLjmkQt3a0
	Ln0Futs0jLrLMz09lvrbOMNIS4Vi96POdbNMhX+sazkb8o+qWrVlr9lL5OAUAO4o8QMpeoWWGqA8z
	A7Fn6cDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7zZb-0000000EJv3-0bMu;
	Mon, 04 Nov 2024 16:04:59 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7zVt-0000000EJAT-3fqL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 16:01:12 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-e30d517c82fso4062695276.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 08:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1730736068; x=1731340868; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r32SkwEDEGyM8KRubZcTgZf56txRY/08O0Oc/h8gpfM=;
        b=idqXTAy2at0PIWLMva2Tu9RNhG+MAryN11b1LIyo87HnFnMnFx2mhNJEFwWjTPwJBk
         aCIYsTzjcZQSrS01xlgn1qI2qrEkc0ZZ+JKZMOaPZEJ5U5piSCOEWK3c4mjrzj0aMJZW
         mrYT/Zhx2HvAW+0nvk9SnIM4+qjxeJNej7DBxUpE1qxGzyGk995vLnHHHpMeoACfZE77
         AnV8buL8NA+KMV8V/L2LVtMp6mh+4i4WcZMArAf2m3OHbeWA/CjqL2hpYfKv42Olxrfv
         tZUHds2z2q3aqgQH37Gq9+84jnj3RytUoNU5A2PYtTsKBYfXhselfV15KfGUQwOYHzEV
         oYHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730736068; x=1731340868;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r32SkwEDEGyM8KRubZcTgZf56txRY/08O0Oc/h8gpfM=;
        b=lx+/Hf6NvECFhY0OAkDoAHahkEg/QrjL4cTUNAB2tPPxvvlzMdsomV5q5gkN8ZU+io
         CGnFmIcZ0Bhyxt5hqPcZk2ZPd/2MmCO2wEZPIo66OweGaIIs0E9DrXsq9GdJ2BlaH1rw
         Qm64zED+AvPfr++Ass1BuqAJm9LG4ypqX0GuifnmJugVgRjSepb1f3exY7GxSS+x3KCb
         ct9QNF4mLdVnDAn0Zhqo2mZbR3syfQLa4+Qbg2zMMg/7Xnqqsf00JMvbx0pNVS7cDdso
         ZxpPac3cdepPUnpI6pmDP27ibNkrBAgBJCvjX0ZLbhxRHf35CNI5AQ4078HK18fQI/4f
         4R2w==
X-Forwarded-Encrypted: i=1; AJvYcCWDKVpRDH0dQzJmeZ3kyw6ygYIrcAmF82yIIDy7NTXLRd2CXDrc9aI7ly5pHHPOM7u9fPVQwgOxfqbYv4zYeEZH@lists.infradead.org
X-Gm-Message-State: AOJu0YxIsethq9kRUlmsdAEya1sMVK6io0zCQGhCTqRuTc+pi78aN/5F
	wE/M5r5j3GulJdX8PXId9eL3EOaVBPmNSNqc91dHnccNCw6fb7V89d8G6rDOdo1GAOx2up7YIwn
	nAb1kCWHx3aNU6h97pBbkOMHW48y4JUuuUE/0WgC04Mpd//qW
X-Google-Smtp-Source: AGHT+IFujurUNdBIc2jhl5l4ausb7S50k/V0Wx+SJ0D+7ItaEAYASme79PTW2iU/NqOUarwZskVPOJUg2kPhSceaIIM=
X-Received: by 2002:a05:690c:9c10:b0:6ea:4e1f:2b40 with SMTP id
 00721157ae682-6ea4e1f3d77mr171184117b3.9.1730736067813; Mon, 04 Nov 2024
 08:01:07 -0800 (PST)
MIME-Version: 1.0
References: <20241101-hdmi-mode-valid-v2-0-a6478fd20fa6@linaro.org> <20241101-hdmi-mode-valid-v2-3-a6478fd20fa6@linaro.org>
In-Reply-To: <20241101-hdmi-mode-valid-v2-3-a6478fd20fa6@linaro.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 4 Nov 2024 16:00:51 +0000
Message-ID: <CAPY8ntCyg7P2gZ9QpLFUQxZY52e4-MSA=6PM1ZfVBKWwgoxXjw@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] drm/vc4: use drm_hdmi_connector_mode_valid()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_080110_026832_3865BA51 
X-CRM114-Status: GOOD (  16.28  )
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

On Fri, 1 Nov 2024 at 00:25, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Use new drm_hdmi_connector_mode_valid() helper instead of a
> module-specific copy.
>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 62b82b1eeb3694d1685969c49b2760cbbddc840e..486e513b898d7f761e8615f2afc193ca44b23200 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -1752,7 +1752,6 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
>                             const struct drm_display_mode *mode)
>  {
>         struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
> -       unsigned long long rate;
>
>         if (vc4_hdmi->variant->unsupported_odd_h_timings &&
>             !(mode->flags & DRM_MODE_FLAG_DBLCLK) &&
> @@ -1760,8 +1759,7 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
>              (mode->hsync_end % 2) || (mode->htotal % 2)))
>                 return MODE_H_ILLEGAL;
>
> -       rate = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
> -       return vc4_hdmi_connector_clock_valid(&vc4_hdmi->connector, mode, rate);
> +       return drm_hdmi_connector_mode_valid(&vc4_hdmi->connector, mode);
>  }
>
>  static const struct drm_encoder_helper_funcs vc4_hdmi_encoder_helper_funcs = {
>
> --
> 2.39.5
>

