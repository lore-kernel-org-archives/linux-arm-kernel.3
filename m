Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 239B5D4335B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 22:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oc1kTCaPU/Up3VBWwNqeucLbtfTNSR3ZKTbW8ftdd+s=; b=HebEJHEF1LsKWrAnuPiSkYSpPm
	5cQbw7od+bkZohSx2XIk3MrOcH+pAWh4BS2KOpLX6lOEQIWZB/ELDIxs5Bra1F9A/Umh7Sos/Sov3
	BYEw8gJcJJWCtiSselUQVLseQALjQauihSHeMURsSos1BPxmcdA69coqVSdI00jY98DRpLihhuLlV
	oT3GvNQ/pNrC7dIVG5EiwLjBSLy2xWPEklivk7cxOzTDVb45FDyAxkAIZJksf1Vb9347Kw0iSJzzK
	TgbloVCxX7zm3MSraNXQGNmXJeNzTze0SdMByP5Yi+G7P88QrGMOFU/VysgGhIxmqBIeqSXcPEs9B
	irSRNQWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTpLQ-0000000HMog-0Ybh;
	Thu, 11 Dec 2025 22:41:08 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTpLO-0000000HMnx-0dSR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 22:41:07 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-477770019e4so6172865e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 14:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765492864; x=1766097664; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oc1kTCaPU/Up3VBWwNqeucLbtfTNSR3ZKTbW8ftdd+s=;
        b=llDzTTbJfbFGXQJyaoMg+erd7FDqwiFxo2R+cwikDpE7EcboTRnGdgP+ppigk0KXEO
         IrO6C9jWtBcgD7uYeLdXKaRMU/UV+c01BWjPgZDXRZ65s3o6RPuJUEZHedVLaH+pWQZR
         7N69O7ifIMD6cOdiA3FOtaLOZQ5HLQvftULvdAxMPS3A4WBKcmDxgGl8uhM9OELd9GT4
         dCWhwIdWA9VaOk4UpAFx2dPVGffvJSHp8B3nhpKcPZ6BYHst2PZmtT+/lejT5/8FoypN
         h/di/TFb8xYYUKRe/CP/dsxLMFpecX0tyOTeJcgvep76pRE6LszBiHpmNY4h1ba2nj25
         8L2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765492864; x=1766097664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oc1kTCaPU/Up3VBWwNqeucLbtfTNSR3ZKTbW8ftdd+s=;
        b=LlFOO1fchfIUgWYd1tHlIvLG6ei4mSqzoh4c4AmujIyLpGDHgfXLD7rbnWjkDWwEvz
         sfwx/raDl/kKBXfUnI3f576dfOCcYv5DL0MSsQ6CExODaSwSCz7Cimwb9N3m4CFGLyXk
         z0UVWYZiMPFN7229eZQY2q3SIEovvJ449w4EtvpwGxyrIPAB8Y5GSyQXRPiHjyiN4dFa
         nyuiCQ+wntYL4isrgFmW3EhQaBb8lGJt7mOOvymefNuNvfSvLTSMziuScZSoWgo8OQ2W
         PnLpOsZ4vo7I9ExDD5UPH729+VVEKR6gd8PsjXU+9UQE4N7G2W1DDHO7ftQ9ahpJKBnA
         b5WA==
X-Forwarded-Encrypted: i=1; AJvYcCUHVU+IlqqTK9ku8K41L6rYUb+go/KKF2lApPHdBdlwZU/3GL5tBRjGN3QcJ/bIeME5RzKOORs6IMiwGWN2yYiW@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1Xz975T1Fbhq2TRkaA6ylciJfu94d51z4wTOqoRMIhKQ1dI6q
	Uyd2t+yRKfSJld+V0ae9V8pvC/zKgD6RhdWB/IJHTmq5j6J4dlZdS2G6
X-Gm-Gg: AY/fxX66FZaLM8rPoOcFgXYAST5E3Bb1l81jehDgnSA4gj2yx6U0Q+4EoBa79qZe/Ed
	poyaKRW1KHcwvuKTg7H5V9LVnxI1JeulTY6Ep0lIv+dEuXUv0n/R2njyEV3rui8Ayl0RFvDDsv5
	OhLB7xgqEQyY0WhlpdfeIYIRytSDbiWiIv/BqJvj4H07dfyk+VXT/uXOFHHFHwZ4KCvsPRndu8c
	rJYunAGvgBVD+/ZDlNip4UBiBSAv1NprQ9ieQwlpz/kED/h/hT9cTISXoqW9WyM+Ci1wZmiuxXA
	l5xkm9EH0F4tiUF20LUPfSyTGkWqEWdqOkIW6lWx/IUpo3s6e1StqSFsLlOz87m4dBIykWSOUt/
	cXZJROGU4cIM+mo20O6XGXjonYXTzSUJwR2YStqSYbMqnowO7y4Bspw7KzNEu5qFIR1VjLIPx0M
	vM4gKQH1x61W8XHpFiPwH6JDWcdEz4qXOoRXUnM7A5n9aJaSQVEaNi
X-Google-Smtp-Source: AGHT+IG1bTT2BZs5zspIv+MpSidSuvbOeyRhbmBxmTJnjzWF8kBNNUW7JY1Buz+51tBubecYulXc/w==
X-Received: by 2002:a05:600c:1991:b0:47a:80f8:82ab with SMTP id 5b1f17b1804b1-47a83843776mr80137805e9.24.1765492864263;
        Thu, 11 Dec 2025 14:41:04 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f4c624esm326205e9.15.2025.12.11.14.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 14:41:04 -0800 (PST)
Date: Thu, 11 Dec 2025 22:41:02 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, Heiko =?UTF-8?B?U3TDvGJuZXI=?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Daniel
 Stone <daniels@collabora.com>, kernel@collabora.com
Subject: Re: [PATCH v4 2/8] drm/rockchip: vop2: Switch impossible pos
 conditional to WARN_ON
Message-ID: <20251211224102.5e079d70@pumpkin>
In-Reply-To: <20251211-vop2-atomic-fixups-v4-2-5d50eda26bf8@collabora.com>
References: <20251211-vop2-atomic-fixups-v4-0-5d50eda26bf8@collabora.com>
	<20251211-vop2-atomic-fixups-v4-2-5d50eda26bf8@collabora.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_144106_235663_5584DFB6 
X-CRM114-Status: GOOD (  20.83  )
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

On Thu, 11 Dec 2025 21:40:32 +0100
Nicolas Frattaroli <nicolas.frattaroli@collabora.com> wrote:

> From: Daniel Stone <daniels@collabora.com>
> 
> We already clip the plane to the display bounds in atomic_check, and
> ensure that it is sufficiently sized. Instead of trying to catch this
> and adjust for it in atomic_update, just assert that atomic_check has
> done its job.
> 
> Signed-off-by: Daniel Stone <daniels@collabora.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 29 +++++++++-------------------
>  1 file changed, 9 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index 20b49209ddcd..81b3eba07095 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -1214,28 +1214,17 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
>  	src_w = drm_rect_width(src) >> 16;
>  	src_h = drm_rect_height(src) >> 16;
>  	dsp_w = drm_rect_width(dest);
> -
> -	if (dest->x1 + dsp_w > adjusted_mode->hdisplay) {
> -		drm_dbg_kms(vop2->drm,
> -			    "vp%d %s dest->x1[%d] + dsp_w[%d] exceed mode hdisplay[%d]\n",
> -			    vp->id, win->data->name, dest->x1, dsp_w, adjusted_mode->hdisplay);
> -		dsp_w = adjusted_mode->hdisplay - dest->x1;
> -		if (dsp_w < 4)
> -			dsp_w = 4;
> -		src_w = dsp_w * src_w / drm_rect_width(dest);
> -	}
> -
>  	dsp_h = drm_rect_height(dest);
>  
> -	if (dest->y1 + dsp_h > adjusted_mode->vdisplay) {
> -		drm_dbg_kms(vop2->drm,
> -			    "vp%d %s dest->y1[%d] + dsp_h[%d] exceed mode vdisplay[%d]\n",
> -			    vp->id, win->data->name, dest->y1, dsp_h, adjusted_mode->vdisplay);
> -		dsp_h = adjusted_mode->vdisplay - dest->y1;
> -		if (dsp_h < 4)
> -			dsp_h = 4;
> -		src_h = dsp_h * src_h / drm_rect_height(dest);
> -	}
> +	/* drm_atomic_helper_check_plane_state calls drm_rect_clip_scaled for
> +	 * us, which keeps our planes bounded within the CRTC active area
> +	 */
> +	WARN_ON(dest->x1 + dsp_w > adjusted_mode->hdisplay);
> +	WARN_ON(dest->y1 + dsp_h > adjusted_mode->vdisplay);
> +	WARN_ON(dsp_w < 4);
> +	WARN_ON(dsp_h < 4);
> +	WARN_ON(src_w < 4);
> +	WARN_ON(src_h < 4);

You need to do something when the tests fail.
Carrying on regardless is never right.

	David



>  
>  	/*
>  	 * This is workaround solution for IC design:
> 


