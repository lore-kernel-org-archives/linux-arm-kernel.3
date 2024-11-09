Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 047C4D5E122
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 07:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EHUaeS9e58wupBTZi+unSe1iCTz6zWdP/n4haz6XM6g=; b=sjOhU8ycYOOsDX3sKS5NwY2bX0
	9pXpYwV+Ynbw5fn84BULH31sMb5/aEgg73DeSA5FIai1hYkgai0fRzTQ0ozm7SKyw8LAly9GeBqV9
	OEIhpxeKiSJqD2sZ1eg+k7OX9u/uPlB/ROXrDoKg1Y6clldUwrcVSoAS5ytk6BEoP6GwSK9wUPMbp
	nSvLI4O6H6OO/Von7s0qyCngU79aNXDzXvEtJkCWBjpM4yO/ScbqPzmbtQ265sPje47E+EmHHgMBI
	ptPSNhr/zCa5xk/9lvzaal8GdGh5ATyg6LICFSl27AcQX/E00osSWhOd2I941HWyDbudM9ro0T2ue
	QeAz3uhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9fkf-0000000CrFN-0nE3;
	Sat, 09 Nov 2024 07:19:21 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9fiu-0000000Cr70-0pjG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 07:17:33 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-53a007743e7so3663693e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 23:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731136650; x=1731741450; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EHUaeS9e58wupBTZi+unSe1iCTz6zWdP/n4haz6XM6g=;
        b=eA8/vrBQwl8TKRhR1jDORSMnPdDhyZAsc7qO/4rqSC46Zou1Ow85HrN2tP0JcJmyHl
         TbZ6is3bLiCLb8JBQjwzp61U7h3le1M8xvl5kdzSLvjWtF8ktDW1OuDg0QoITiFv7suq
         BYc/SMs/7G+A5n+hIQNH8iNBU/nrArlcYlXlEVgcW/KidXxmQJRSPa1XotPZ/yth8I9y
         G+Uzk2+lWLZBPFqJ30zs7tALTSRtjp2soFFq7TMVKGtSHg8hDKBBRzPjTDBq31Cb5BEi
         o75uRqLqALEW14qiaIH81tobZkyygFejPMEf2u+6Cu0kuSN9L0cKmjrUZncaI02pwh91
         +YtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731136650; x=1731741450;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EHUaeS9e58wupBTZi+unSe1iCTz6zWdP/n4haz6XM6g=;
        b=jUklneITqDZLGD33PiQhNDQVk6q2Z04xG3BBnl2HeL0W7oK/EDdTONgIs9rOmT12mv
         iUE+XRptogtCUgv9O2QEHkoNFfbuRB2mRcLC8DqmjtcGuA4lMaeL/SJEoTQOwrEgoftU
         3VnA+XarxB561bTjcP5BgAWczNeIdGLKqx61FBCfQtGm0YkcZQfHpYDALxIAZpPrrjht
         CmB0KFXkpHq9ul8q3vsAiapL/7iBzxZsGFTYc0/IoaJhmqGPLz8kapgo0kF+f+L74ka3
         sxyhatN+AeiCjjpXCrA4N8qJhapqv0QQFPTZDgz1Hx/aS0eDwBBXU4lEphoVkpU6fB20
         Rm6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWCJnkw79SCb8Chv6Txuz1PP9vhOU+Ea44mLPpvAK2hwCIaNWwCn73++MJfDa+XCkvfn96qDVG6jrcb+ylUplWI@lists.infradead.org
X-Gm-Message-State: AOJu0YyYONKtuHMCQxwGq8unaGhFkfwiWK9A/iTecvd8mkMutOIsw4b5
	i3RRB3mgvnYSJk3GvXBCx4X7v/IuFgeJm3v6w/XVWcI0x7pPEzQHgaXeU6Xr2So=
X-Google-Smtp-Source: AGHT+IF6pPVyHIuCfkrHbrnoRwNG36vLEw644YibuKEFHAGwh0LXfQaZBO+/vLKGW0b7AToo6GiOmw==
X-Received: by 2002:a05:6512:3f11:b0:539:ec87:bc7f with SMTP id 2adb3069b0e04-53d86231c05mr2939389e87.19.1731136649659;
        Fri, 08 Nov 2024 23:17:29 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d8268654dsm858927e87.72.2024.11.08.23.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 23:17:28 -0800 (PST)
Date: Sat, 9 Nov 2024 09:17:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 2/6] drm/sun4i: use drm_hdmi_connector_mode_valid()
Message-ID: <gbn7qal7pbeizuse3ge4ecvxuwcnhuauxyb5xist27uwi7ydyw@zeqvg4j26sxn>
References: <20241101-hdmi-mode-valid-v2-0-a6478fd20fa6@linaro.org>
 <20241101-hdmi-mode-valid-v2-2-a6478fd20fa6@linaro.org>
 <20241108-gainful-lionfish-of-progress-758dcb@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108-gainful-lionfish-of-progress-758dcb@houat>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_231732_262934_4A4A1D54 
X-CRM114-Status: GOOD (  21.98  )
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

On Fri, Nov 08, 2024 at 03:20:48PM +0100, Maxime Ripard wrote:
> On Fri, Nov 01, 2024 at 02:25:05AM +0200, Dmitry Baryshkov wrote:
> > Use new drm_hdmi_connector_mode_valid() helper instead of a
> > module-specific copy.
> > 
> > Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 12 +-----------
> >  1 file changed, 1 insertion(+), 11 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> > index b3649449de3026784ae2f3466906403a0b6e3b47..54b72fe220afacc208b3fd48d5160031127ea14a 100644
> > --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> > +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> > @@ -205,16 +205,6 @@ static int sun4i_hdmi_connector_atomic_check(struct drm_connector *connector,
> >  	return 0;
> >  }
> >  
> > -static enum drm_mode_status
> > -sun4i_hdmi_connector_mode_valid(struct drm_connector *connector,
> > -				struct drm_display_mode *mode)
> > -{
> > -	unsigned long long rate = drm_hdmi_compute_mode_clock(mode, 8,
> > -							      HDMI_COLORSPACE_RGB);
> > -
> > -	return sun4i_hdmi_connector_clock_valid(connector, mode, rate);
> > -}
> > -
> >  static int sun4i_hdmi_get_modes(struct drm_connector *connector)
> >  {
> >  	struct sun4i_hdmi *hdmi = drm_connector_to_sun4i_hdmi(connector);
> > @@ -269,7 +259,7 @@ static const struct drm_connector_hdmi_funcs sun4i_hdmi_hdmi_connector_funcs = {
> >  
> >  static const struct drm_connector_helper_funcs sun4i_hdmi_connector_helper_funcs = {
> >  	.atomic_check	= sun4i_hdmi_connector_atomic_check,
> > -	.mode_valid	= sun4i_hdmi_connector_mode_valid,
> > +	.mode_valid	= drm_hdmi_connector_mode_valid,
> >  	.get_modes	= sun4i_hdmi_get_modes,
> >  };
> 
> It's only slightly related, but the atomic_check implementation that
> will be the last (direct) user of sun4i_hdmi_clock_valid is wrong and
> doesn't call drm_atomic_helper_connector_hdmi_check

I can send a patch fixing this, but I can't test it.

-- 
With best wishes
Dmitry

