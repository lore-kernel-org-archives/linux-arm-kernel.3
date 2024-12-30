Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 688FDE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 22:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ndkBccbxfCNVnrXt+e8YJo/WVVAihoLFIXSgmyxaWx4=; b=x3spUorNnPHYPD1Xmcxn7pB8Ss
	zOUL/TTG24sYhwEvlos9XdB9wTrt/vFL8dwGEsvW24kZW6Py2XNy7+o+SVK+aWkVJ08skAJt5tGew
	EK8Y3Hk4lAzeQKOzcUsdDctaH+7GspG/Oe9VN/ndhml8pqqSWvvEZtS8mbZ6xrAZ6zO1bft9l3C9d
	ZV0SEIgpZz+1Vo1z/jUncjxcZtcIu9tTJ8sokDm/b7rhSKi7AL4dvVJ1SsB4UPxkfUs/4WMfiL+/U
	6kkYQcX+X5YfVh4oDqEAQY+aLUSma1KuOCUla4plEEwIqn/ziIpjWlEl7tdoHEBZgACMALBd8tLls
	n8C0/9nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSOUA-000000060aG-16es;
	Mon, 30 Dec 2024 22:43:42 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSOSy-000000060QN-2wB9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 22:42:29 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5401b7f7141so8563818e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Dec 2024 14:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735598546; x=1736203346; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ndkBccbxfCNVnrXt+e8YJo/WVVAihoLFIXSgmyxaWx4=;
        b=tW9zpZBX2C04Uarhh7YpVsJxHWMR8+JiKvpzTqs4rfj8t4MZti3jgQgP9zLDo7eSYU
         rzrS7OYH7wZbCpLNM1D+BZM2/ujiugdICFiNaeq92WS/p6idqWw7zHBLQH9TpW3LZBrP
         2mMtA9hRsfJ6zrayL41lZlcYOjIbO+d/9H6uj4EP48CB208LG6ykOT1Mbj0uA23Uw6va
         wXCAEVHCbP1iTYbnGyiBWlg4UqRneUQVXpS6SHKHRnu8Bl+6R5N1hw+e3Sx0VNobTa+s
         FRU5vBxs2scuO1YsGj04z7/1GoBfG13onKow39uWkyySurFYGSLYb6QbSf7ydrQknXA6
         VN2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735598546; x=1736203346;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ndkBccbxfCNVnrXt+e8YJo/WVVAihoLFIXSgmyxaWx4=;
        b=rYtFpXu3okNZKUGlAL4vGySqBJdNopfv8ibgxKSfae6dmOR/H2UNpu1HTNQs31ojXs
         +0fk95qL6GvH2dWCWRFRUGR6x9+sy1h+UFJNFwvbt96jMtlDUsB7fED7g7XftTKxm++t
         9pINpFBd/NplIvVzZ3UMSxJ7gjol2VKFc4kXgaqS/S8uf2EBj7FDMw168BZ3K5LQSzJs
         leWGq9GDUt3t9H0WwVSEP/xLi0K/eq5/e7Dkl4abfz3HgNlrbvlptWbgzCdmLqY3ltpg
         CY3MP56JnDwCmPULQvpRTgj2Iy2qR4Q1wd+2tJ6BUcT2rcHCifSqsaoXE7tEDhtnQ8U1
         KtQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdfbRwXjSrMKasgShDSVXeIjsxUl+ctyuHvLEcyo5app/XZZC3vsndPET7QwEZeyUQCSLGPacJKwmBmpmOtkSx@lists.infradead.org
X-Gm-Message-State: AOJu0YztTLhhf9ooEHsFjyHk/io5K/+7GczyhLOklUb1yKCx6gigspoj
	BXj8+NdfZTX9taWiGpM0Kys959u9u+kfqVQ97DeOHK5OwAiiZapOVSSatBArvOs=
X-Gm-Gg: ASbGnctwSRqgqMkW/jgFoKbYSLTKzSC0eL4h02huNh3InDtESc/aRzdbfcjQnkXGIis
	WfwEnTvBKLUAVpV1tXWPgnLQ+6RmUMMMllYop2hbxEFVBhgqC+8q+0QEibhd4tcFqWp8Ll7MhCh
	RizSGi+tb+J7l9kL4Up3irwjPcwZolcUieZsEe9m/TU7Tp4wdER2f5AOgrrx5CPPSxpx7d45Mag
	Dpg5J+SwQmdxQ+a51JmwLAvcWKDfOSEjhTwu+9jK7SMHgCwKGktzi8OgqYQvLYHrbJ2OH2EbYXD
	LrI3Ia0NIRAruUeY3fB4UWXZQg2UJbMYkCOH
X-Google-Smtp-Source: AGHT+IFfViIHM8+f9Mn3fgEtTV0SNNWn/wuOCgLzxbbOuJXZwu8+rTphIETfjjYE6yKOOZA8LgpsvQ==
X-Received: by 2002:a05:6512:2399:b0:53e:395c:688e with SMTP id 2adb3069b0e04-54229524737mr12156974e87.10.1735598546613;
        Mon, 30 Dec 2024 14:42:26 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238301adsm3257694e87.246.2024.12.30.14.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 14:42:25 -0800 (PST)
Date: Tue, 31 Dec 2024 00:42:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marek Vasut <marex@denx.de>
Cc: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org, 
	Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>, Stefan Agner <stefan@agner.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] drm/lcdif: add DRM_BRIDGE_ATTACH_NO_CONNECTOR
 flag to drm_bridge_attach
Message-ID: <lsfwik47xzx2qjp26x2klx5bgjdrogu6lt3kafchfgppbnwtnt@c56ljycxkiin>
References: <20241224014701.253490-1-marex@denx.de>
 <20241224014701.253490-2-marex@denx.de>
 <a543e24a-1333-42ef-b940-fec01353db5b@nxp.com>
 <59523b40-dfdd-4293-9b02-e16be632d1d2@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59523b40-dfdd-4293-9b02-e16be632d1d2@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_144228_739872_7F3B660F 
X-CRM114-Status: GOOD (  11.85  )
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

On Mon, Dec 30, 2024 at 11:11:35PM +0100, Marek Vasut wrote:
> On 12/30/24 8:18 AM, Liu Ying wrote:
> 
> [...]
> 
> > > diff --git a/drivers/gpu/drm/mxsfb/Kconfig b/drivers/gpu/drm/mxsfb/Kconfig
> > > index 264e74f455547..07fb6901996ae 100644
> > > --- a/drivers/gpu/drm/mxsfb/Kconfig
> > > +++ b/drivers/gpu/drm/mxsfb/Kconfig
> > > @@ -30,6 +30,7 @@ config DRM_IMX_LCDIF
> > >   	select DRM_CLIENT_SELECTION
> > >   	select DRM_MXS
> > >   	select DRM_KMS_HELPER
> > > +	select DRM_BRIDGE_CONNECTOR
> > 
> > Select DRM_DISPLAY_HELPER.
> Without select DRM_BRIDGE_CONNECTOR, the drm_bridge_connector_init() is not
> defined .

You need both.


-- 
With best wishes
Dmitry

