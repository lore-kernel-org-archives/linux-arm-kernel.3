Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59802E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 11:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YThwe23mDMw58S0YzeDlQzDzb/FEzhlX3ugmbXf8RUY=; b=JlqqoOluMF1yGees9hb/z0wO8V
	dNTY5mXTlDzC3ODbkYYxnYGejd6197VLGR63ZbZ+GDK9yQPYGdg7pciWrzqLbDSG+uSVVPg5R054J
	LIBBongti3PNlXkWakspKxYiAQgy/a5IPp8n9liJVImfWhJLzxMm7Z3bdePvjLmshBluGe2IIg/82
	GpBnTuCR5IsfLal7F/krU5H8iv0DEaMU7ixiwTtgwTDJhTFfZCtNI36zhNJBRpiiz0lvPMMzwEMgA
	eCUX0CGTd9RQ2ktbZjBUS4uiRasg9fFoVQCbg4msbwkHWMz9f0iU9D9KPkudWlyMS8oL1n3t4O/Pv
	a9Dm+IAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN9GJ-00000009oyD-3bpu;
	Mon, 16 Dec 2024 11:27:43 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN9FC-00000009okW-2uYc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 11:26:36 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso4149244e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 03:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734348393; x=1734953193; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YThwe23mDMw58S0YzeDlQzDzb/FEzhlX3ugmbXf8RUY=;
        b=fZo4SQOwo0xWJhD7JssscCw5uiAjfsNRwZHTJF9Jc7QQNHkcSmYZSR0BxDD3u8FvWq
         HxZwq+QSStwsQS35T3bXbJUClyuR8ae9RSCQQAQiGDDzSP3TEPpZJp40VmwmKcHdS02c
         O6LPSnvRew1Uuf/wDa4vZcIwvSN5FhB9wzdPpcpPg9C5Fqkz+chgLSJCPB7rdyf6VUui
         9XcmUe7R/CDOqBIhY5d9simCjNU5TrvzOb5gXmFCr55mv0DiLZYJ858ND+QkEJhnXD6A
         sHFuyfxavXDAxWN2tWzJ0h9b/pNimmyqfd4D6J/n57+Qcsv2Wgw5J/usCGRpBJjjUvOy
         90nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734348393; x=1734953193;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YThwe23mDMw58S0YzeDlQzDzb/FEzhlX3ugmbXf8RUY=;
        b=XoEjiX46vjFmGRFShwIww44x0YyH0byrM4d8DXuv+osj0uQhLEZ2N5JISDid65l+kw
         7SRoTu7Kx/n7EluXW2ilKtt/Gz9iJwjajHkKL0GRvcVM+jVYFEh2Ish8CBP2wOJR4bbw
         r273CH31+kUPCUfIRPym1b4Qh9B75xTGISVuT1kXP7/79dmuFRjbJMDjrVa0Dsdu9PWb
         kGLS9g5Nv0Ob4mcjr4dRn3cE9EGDEmMvOVULbM3zIflNltRPhC5O21cMWxGhN0Ctsjb2
         Fjin93fGRSZ7Vkef74Wk8WhC56JQFqWSIhA217cvQSIh3LmxenNsA/W08AQhG0T1EFUG
         Zp1w==
X-Forwarded-Encrypted: i=1; AJvYcCWucli2X1Sp7x/oMa+Qz/C+PUmLf9eJLUuqGLrDqY9cvPuEucDJO1JZaw3pCCbdWAOLxVkLj4di/I4rJE3jLZvy@lists.infradead.org
X-Gm-Message-State: AOJu0Ywa1J24vxciiildn0uabBEa29hQkLUzsh7og86auS6an+8zjz4Q
	C/WsfnZcQ/1874wZ9kPZ04rZYuVp2oFJPQCGmbmGJtZ98gpDfyM6s0JUGFlad14=
X-Gm-Gg: ASbGncsakhQnivdZVKvnDZTaNAsJ/FmNpEeNXQ7E1FiaB2g1v9DjY3F3Pv/DRxCx9Xt
	M5CJQBn5PtL2CvdoQUNbxfAxjIKSZkqJKJO+gRosn4jQkWjl4TvnXcuP/1pTNRlqKDjIp/ca3gc
	6uotq2SbOjcYcGn3u0wXReFzK5Q9RRnMtes/dZyFc6Hsk8IbpABkesqFkCQ+iy6kCuaZ1zlTA0O
	xCdqWgL5uM6obCwX81bpiwW11faPV51Ym/sU+tf2i5C3Q0/jKN1M4s+9TMeBMRWtkbdFg9lLtfz
	nW9aVsTlOL1/eT6/SMG8E4pSjHxNYtjTWn+w
X-Google-Smtp-Source: AGHT+IEC5KXhrrXGsT1eFAB/sps15bbUKYwoGeuTdcyybvAtpoczQRZn+Xw2w8c/HQ9Uc8g8NeiFrQ==
X-Received: by 2002:a05:6512:318b:b0:540:2a6e:3731 with SMTP id 2adb3069b0e04-5408b8f4a05mr4156948e87.5.1734348392766;
        Mon, 16 Dec 2024 03:26:32 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120ba9e02sm811914e87.100.2024.12.16.03.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 03:26:32 -0800 (PST)
Date: Mon, 16 Dec 2024 13:26:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Phong LE <ple@baylibre.com>, 
	Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 09/10] drm/vc4: hdmi: stop rereading EDID in
 get_modes()
Message-ID: <smaa7geowgyuvqvn6sph63ls5ublpt46zqdvt4yvqcg64scz3q@te52ty7x2soz>
References: <20241206-drm-bridge-hdmi-connector-v6-0-50dc145a9c06@linaro.org>
 <20241206-drm-bridge-hdmi-connector-v6-9-50dc145a9c06@linaro.org>
 <20241206-caped-proficient-rattlesnake-c882f3@houat>
 <73xdxb575n4ncmadffkwqzczoewbadq3forpvqt4vp7zfln2nq@o2wmbbbepwgg>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73xdxb575n4ncmadffkwqzczoewbadq3forpvqt4vp7zfln2nq@o2wmbbbepwgg>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_032634_736111_01AC86DE 
X-CRM114-Status: GOOD (  37.25  )
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

On Sun, Dec 08, 2024 at 01:06:46PM +0200, Dmitry Baryshkov wrote:
> On Fri, Dec 06, 2024 at 03:34:52PM +0100, Maxime Ripard wrote:
> > Hi,
> > 
> > On Fri, Dec 06, 2024 at 12:16:03PM +0200, Dmitry Baryshkov wrote:
> > > The vc4_hdmi_connector_detect_ctx() via vc4_hdmi_handle_hotplug()
> > > already reads EDID and propagates it to the drm_connector. Stop
> > > rereading EDID as a part of the .get_modes() callback and just update
> > > the list of modes. This matches the behaviour of the i915 driver.
> > > 
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  drivers/gpu/drm/vc4/vc4_hdmi.c | 21 ---------------------
> > >  1 file changed, 21 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > index e5ab42f72f618b90f956482db6c9c8074c1e3bf1..3364ef90968dad3074800f02926300ffceb75c69 100644
> > > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > @@ -470,31 +470,10 @@ static int vc4_hdmi_connector_detect_ctx(struct drm_connector *connector,
> > >  
> > >  static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
> > >  {
> > > -	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
> > >  	struct vc4_dev *vc4 = to_vc4_dev(connector->dev);
> > > -	const struct drm_edid *drm_edid;
> > >  	int ret = 0;
> > >  
> > > -	/*
> > > -	 * NOTE: This function should really take vc4_hdmi->mutex, but doing so
> > > -	 * results in reentrancy issues since cec_s_phys_addr() might call
> > > -	 * .adap_enable, which leads to that funtion being called with our mutex
> > > -	 * held.
> > > -	 *
> > > -	 * Concurrency isn't an issue at the moment since we don't share
> > > -	 * any state with any of the other frameworks so we can ignore
> > > -	 * the lock for now.
> > > -	 */
> > > -
> > > -	drm_edid = drm_edid_read_ddc(connector, vc4_hdmi->ddc);
> > > -	drm_edid_connector_update(connector, drm_edid);
> > > -	cec_s_phys_addr(vc4_hdmi->cec_adap,
> > > -			connector->display_info.source_physical_address, false);
> > > -	if (!drm_edid)
> > > -		return 0;
> > > -
> > >  	ret = drm_edid_connector_add_modes(connector);
> > > -	drm_edid_free(drm_edid);
> > 
> > I don't think that works though, for mostly two reasons:
> > 
> >  1) We're not sure we'll even have an hotplug interrupt if the system
> >     boots with the connector plugged in for example.
> > 
> >  2) afaik, the get_modes ioctl directly calls get_modes too.
> 
> I think both paths use .fill_modes, not get_modes. And fill_modes
> explicitly calls .detect / .detect_ctx. It would be nice if somebody can
> verify the change on the acual hw. But as I wrote, i915 driver does
> exactly the same: the EDID is read / updated in .detect_ctx(), while
> .get_modes() only performs drm_edid_connector_add_modes().
> Okay, there is one significant difference which we should probably patch
> out: the .force() is also implemented to update EDID in the forced case.
> I should probably do the same for the drivers being handled in this
> patchset.

Maxime, will .force() cover your concerns? I probably fail to see a path
when .get_mode() is called without calling .detect() / .force() first.

-- 
With best wishes
Dmitry

