Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207DCE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 04:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8on0ZbRPpfYPOhsA0CTtKSQk3XChh59DoR/C8XX6ZpQ=; b=A/wmQcRVRkyjLV4PixZptQ87cb
	OHcH+llJJkUsgocMm1mHDXsjF93ZACtHpK/Bpgl8ZB+2fMwDwdcs4Qepydtxqq2vczUUzKAvu//Nc
	4ZbQOkQJZ4MAAmZPCxFRNW9cbSP9ibL6KvgWEi1ZYi0q7E8/VM0sqnxd42UaszADyUpqXKdpXeOR2
	qHxjuW99La0uwPt+qt/i4p+MswfJTcpclx2Wt8g8zP+j5+gua1gjY+4+mVoN7mkRrZXO68Kbalb/F
	QyVtwnKn47W1t+we/fV6ysp2X7dXqwEpTZFtsy4ohm5iPiWHebG/Em0PfIVXl938k0L8bHO/lCWwi
	U4e9weOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPwFx-0000000BDuu-06Yj;
	Tue, 24 Dec 2024 04:10:53 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPwEj-0000000BDrP-3SfK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 04:09:39 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-54025432becso5020334e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 20:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735013375; x=1735618175; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8on0ZbRPpfYPOhsA0CTtKSQk3XChh59DoR/C8XX6ZpQ=;
        b=k2aU2tqUSsZ77YbDYyXMOgK/xMdqsSzByjg3YbFe5EFA2Nx/oJXtPaCqCTWfvrIGBZ
         ouAeU4fu4B4WNvgXyLmXAi4ODkByBigJtZBpDP5OZ6eBda+C+T5nltRInYg0DSYHBSlO
         /edTBHKm/cS15sNbAz7mQYPQ/g5/W5pMgpxtp39iF4rTPxnEfpB1RhM3ucyZqCKofcj7
         SzLTzsGQaaEvSb2P55qlbh+6DhsS/RauaEtDSps9C9+8W9pTQIdwd8A4nDX9ywAhIOnP
         TxK/UcMdvVSzxRS5nzAitX9sRFKiOqXfSVHX37i7Pt7A41N2hxp8Ju3Bq4sbApzNGNWv
         P4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735013375; x=1735618175;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8on0ZbRPpfYPOhsA0CTtKSQk3XChh59DoR/C8XX6ZpQ=;
        b=AaukJsB1DBwJIfC4ahqXMyK0I1KTK6KyuvXbvA2DpIA0LGsr+EP7/ruwDafXde4ZOW
         pjRDY0SLf5IvYtZXKwS/7yaV0OIXNy6RtWf2O+JnJkohxAqh2qxhisFa1S7KMnegy9X1
         lOyINY8wz3WkaoEEASORp3EFChGX1mQDAgCHgMVly2vJj7UPyfYXrOKyIAZxeuikdKq3
         zLcI/GXzBilRNL/vEIzHq2oVJvxGbGMX6QCOScxS7T5yw9+FqTLLC2ea+scoUAEW3hom
         IOZLGK4Sor18lRkPBofp5ggDioK54NLYTSM+zqLmo/w0g9QQGkY/nRfvtYRKFFWvCMM8
         OwDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWt9UwJu4rknM5PEJ5Em2Ujqwzjzi1oNNQqcqnz0491Bdbp3iDsQcNUttrc9uE5t/j5Rd1537NEHh6OqujaR+uV@lists.infradead.org
X-Gm-Message-State: AOJu0YygDSuFXpdWNC8J4mZMkR4Fb3kDG6SO48qHiEDDevcisVFAp/LK
	OdjYsnlY6CP51A1EjlOFcVZZ9mF3YloynFAOeKwphqAqjRNP7cGLTKeLJEcnUsc=
X-Gm-Gg: ASbGncvJfGpVhFdX6ufhfx8jNhFYvXsvxCNPpZUQHooYg8Dm6v2KKbNK7sUbuwP2OIh
	PySAFvtmJ/YtDK260VuVWCIelQo+6O7BeX9y2KwH0h02Jp+Ic4pJdKPExc+eAuorEZ7QZTXqlT7
	JREmyc++QLDD+66w23ZQSGB//3XOcaYdtT6glxUdf/+P+OAwqi6VN58Eyhxx0LGuKtg5pHqRtz7
	457b22xa1WiVz/bK8YpAxvJOdayrBq/6nto5cPXmXbYKBvH88w2TQ1cg2zqr2hoBadR2t2bUSqU
	NbrkGIhQOacvy80o6zZpZswVj33PUwRgsom4
X-Google-Smtp-Source: AGHT+IFywzjt+YUMxB9ndT32dpSascSP1hmk767MuEP9vd7WzaJ7hUJym7qgGXttXA0sSFsZgZdAmw==
X-Received: by 2002:a05:6512:318e:b0:540:1fb5:3f9f with SMTP id 2adb3069b0e04-54229597f4dmr4305510e87.47.1735013375119;
        Mon, 23 Dec 2024 20:09:35 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5422382faa1sm1450458e87.238.2024.12.23.20.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 20:09:33 -0800 (PST)
Date: Tue, 24 Dec 2024 06:09:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, 
	Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Liu Ying <victor.liu@nxp.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Robert Foss <rfoss@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] drm/mxsfb: add DRM_BRIDGE_ATTACH_NO_CONNECTOR
 flag to drm_bridge_attach
Message-ID: <qqd3xztq2drkdbjrybzwa5an37lpb236ur4iqjaaydncwewltx@o3zjqaat22tw>
References: <20241224014701.253490-1-marex@denx.de>
 <20241224014701.253490-3-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241224014701.253490-3-marex@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_200937_881213_47A690E5 
X-CRM114-Status: GOOD (  18.23  )
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

On Tue, Dec 24, 2024 at 02:46:16AM +0100, Marek Vasut wrote:
> Commit a25b988ff83f ("drm/bridge: Extend bridge API to disable connector creation")
> added DRM_BRIDGE_ATTACH_NO_CONNECTOR bridge flag and all bridges handle
> this flag in some way since then.
> Newly added bridge drivers must no longer contain the connector creation and
> will fail probing if this flag isn't set.
> 
> In order to be able to connect to those newly added bridges as well,
> make use of drm_bridge_connector API and have the connector initialized
> by the display controller.
> 
> Based on 2e87bf389e13 ("drm/rockchip: add DRM_BRIDGE_ATTACH_NO_CONNECTOR flag to drm_bridge_attach")
> 
> This makes LT9611 work with i.MX8M Mini.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
> V2: Cache connector from drm_bridge_connector_init()
> ---
>  drivers/gpu/drm/mxsfb/Kconfig     |  1 +
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c | 37 ++++++++++++++++++++++---------
>  2 files changed, 27 insertions(+), 11 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

