Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B8FE7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 03:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ov4oIDApdgx4WHS7bE5m2BIEReCDIeuVyAq9ezmep2w=; b=abty3GvdgyJNNxQH5eqt7NokCj
	Yc4VnaL2UJLsY2JJl1L/pFYi/clJ9vVq2mlVGLL8htHWRwFjsaLyAZ5nC88ZP8Swr2UovpKfvldW0
	xecsq5bp2YbOhVce0Cy2HcEwa911E4m7mldRcOJWUckN0obNBLjnZ8UQJtIT9CwjoMV7Q4lqfJc3o
	Q1+DteilDYwu31ppgFlVHBf33/owX6JR1QpboAgevjlCjrDjBbC2p5SZMWAaccj4cdXXBPD6Hc/Hk
	8yxb3og8Z0T1lCdDrxv/JCh0+3pYZ4soctNGQerHrGx81jVq3fvNnzK5ThHgxZ/dlHtZxP13QA4Uk
	EgW0IUHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIfv5-0000000BN2M-42qA;
	Wed, 04 Dec 2024 03:19:19 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIfu5-0000000BMrm-0sGO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 03:18:19 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-53df80eeeedso6441549e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 19:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733282295; x=1733887095; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ov4oIDApdgx4WHS7bE5m2BIEReCDIeuVyAq9ezmep2w=;
        b=FUblq3kaVGpQ/7JifRvJ2B6QzfMSKwRvDsAk8gJmWis5VaRQXS8Za/5e+ZyBy9eJt/
         EtkC3ljOpT0lQN5X0nvnFtWhwAhwDuDHbZs1ZTzS4xvZBGZH0oKg/aSbKvANx2tEx5Pd
         UNMAFlSc1Qh/tijRgNoLinT+SsiWYTN7+hvrBROHu/VmqyGl70layNWDzJ73SxeWSRTP
         I23e9EQJ36TSXwTYGCR9Qx/Bw34FWCQQopt4w6Y4JFdt/YZCTfbEkj5yW22+MNgSUpzn
         6+ppAOue5xdOjPE2VAKNZHLeo5CxyRDrcP5QAil0Kek7nJZ6QtwzdOPlQyCLH7LDjWtj
         cF3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733282295; x=1733887095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ov4oIDApdgx4WHS7bE5m2BIEReCDIeuVyAq9ezmep2w=;
        b=KreEV51P0s56GcZen2Id28xOhAdoqhOYvRmw5bY28Oe7moFuRiq1sUTcJSY2UrTL0P
         bKUPJS7jEJHiR1Pdi/Cf3ZUvDSq+NFb9mzK5w/TMfjHY94KdoAlmkdUlYu2DPfOz8uDh
         nWZ1mJ0khpwEgS6hXb6F74sR1P6mPqsg6wE+2TVSFr9B2Qxdd1b3xlyW62fkpiXAsZGm
         JnYJUL2Z1EIdlAY2bVcGSSbT1YVaqiT2qGgFWzy9Tnd/M/8+wbLdxc22CYB82g5nuLo9
         L2TV8kJdFYDuvTUVWqVZoXVP/YZULqSHNlml39imNlBhfGtkyd/H+GHYcpOvCDkb5s/W
         NsMg==
X-Forwarded-Encrypted: i=1; AJvYcCU7D0eeQcV30c6KhrRZTFpOX+wdxNa/k8ljr5T5YTUvSqcMR6no3tEwKk+8nul2HT9aXfMutBHy8kigf5jVI5ws@lists.infradead.org
X-Gm-Message-State: AOJu0YzLWorSYwdhrAOkpa+ly5F2Z3g/LubLlJrGdpiVQeVZigY3Rs+Y
	0Q7ld/vVuVuG0XGPVEwuBot6V/zs/EC4xgT6pfMxC7OILPV6a+olEq4slrdUUiY=
X-Gm-Gg: ASbGncskibh1tvTApCN0ffxj1nBYLyGFnh8ELJ/8nMBw8wuMTKFBfoFRZKVuMHO/G9H
	WcX4farlJ7/Sq7NaxdONb8TVzdIiaHU+bRbWRjOX6HVNU5KpO2jhv2ve6+yd15KAikzVPodG69P
	/XW9Nf/O03BARgwZHsuMaiKv2+56MpG2ikpxyOuuRWuzmrNxpFqrAzcRS7rPXwr53yASPeRs/KY
	CRYdTUKxkg02eQFxYJT+mWaKLolZku7/8TSoS/oAzVWTro2MqH8SPiocXChOfkoh/1E5v0FTGk2
	14snWR1kVuCmfbQHXJE49Rmite8o8Q==
X-Google-Smtp-Source: AGHT+IFJX8QZfHrEBC9Xxxj95DpGajpX3DiwA7TRxy/4ydOL7I3C5fwKfR6CJxAdfz87Jxn9zNInqQ==
X-Received: by 2002:a05:6512:3a8e:b0:53d:a550:2885 with SMTP id 2adb3069b0e04-53e12a34282mr2179215e87.47.1733282295266;
        Tue, 03 Dec 2024 19:18:15 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df649f13csm2058532e87.230.2024.12.03.19.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 19:18:14 -0800 (PST)
Date: Wed, 4 Dec 2024 05:18:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
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
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 7/9] drm/bridge_connector: hook
 drm_atomic_helper_connector_hdmi_update_edid()
Message-ID: <txzri7x4pdeakx4juandk3hfhsbx3dhlulxfuehqlmrr7b3wpw@jaunqktsro6x>
References: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
 <20241201-drm-bridge-hdmi-connector-v5-7-b5316e82f61a@linaro.org>
 <87a5dc4zd5.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a5dc4zd5.fsf@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_191817_260547_6B9BE145 
X-CRM114-Status: GOOD (  36.04  )
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

On Tue, Dec 03, 2024 at 04:25:58PM +0200, Jani Nikula wrote:
> On Sun, 01 Dec 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > Extend drm_bridge_connector code to read the EDID and use it to update
> > connector status if the bridge chain implements HDMI bridge. Performing
> > it from the generic location minimizes individual bridge's code and
> > enforces standard behaviour from all corresponding drivers.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/display/drm_bridge_connector.c | 67 ++++++++++++++++++++------
> >  1 file changed, 53 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> > index 12ab9f14cc8a8672478ae2804c9a68d766d88ea5..71ae3b2c9049016d1cc0d39a787f6461633efd53 100644
> > --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> > +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> > @@ -17,6 +17,7 @@
> >  #include <drm/drm_edid.h>
> >  #include <drm/drm_managed.h>
> >  #include <drm/drm_modeset_helper_vtables.h>
> > +#include <drm/drm_print.h>
> >  #include <drm/drm_probe_helper.h>
> >  #include <drm/display/drm_hdmi_state_helper.h>
> >  
> > @@ -175,17 +176,55 @@ static void drm_bridge_connector_disable_hpd(struct drm_connector *connector)
> >   * Bridge Connector Functions
> >   */
> >  
> > +static const struct drm_edid *
> > +drm_bridge_connector_read_edid(struct drm_connector *connector,
> > +			       enum drm_connector_status status)
> > +{
> > +	struct drm_bridge_connector *bridge_connector =
> > +		to_drm_bridge_connector(connector);
> > +	const struct drm_edid *drm_edid;
> > +	struct drm_bridge *bridge;
> > +
> > +	bridge = bridge_connector->bridge_edid;
> > +	if (!bridge)
> > +		return NULL;
> > +
> > +	if (status != connector_status_connected)
> > +		return NULL;
> > +
> > +	drm_edid = drm_bridge_edid_read(bridge, connector);
> > +	if (!drm_edid_valid(drm_edid)) {
> 
> What's the case this check is for?
> 
> My preference would be that bridge->funcs->edid_read() uses
> drm_edid_read*() family of functions that do the checks and return the
> EDID.
> 
> There are some cases that just allocate a blob and return it. Would be
> nice if they could be converted, but in the mean time could use
> drm_edid_valid() right there. Additional validity checks are redundant.

This was c&p from drm_bridge_connector_get_modes_edid(). If you think
that the check is redundant, could you please send a patch dropping the
check?

> 
> BR,
> Jani.
> 
> 
> > +		drm_edid_free(drm_edid);
> > +		return NULL;
> > +	}
> > +
> > +	return drm_edid;
> > +}
> > +
> >  static enum drm_connector_status
> >  drm_bridge_connector_detect(struct drm_connector *connector, bool force)
> >  {
> >  	struct drm_bridge_connector *bridge_connector =
> >  		to_drm_bridge_connector(connector);
> >  	struct drm_bridge *detect = bridge_connector->bridge_detect;
> > +	struct drm_bridge *hdmi = bridge_connector->bridge_hdmi;
> >  	enum drm_connector_status status;
> >  
> >  	if (detect) {
> >  		status = detect->funcs->detect(detect);
> >  
> > +		if (hdmi) {
> > +			const struct drm_edid *drm_edid;
> > +			int ret;
> > +
> > +			drm_edid = drm_bridge_connector_read_edid(connector, status);
> > +			ret = drm_atomic_helper_connector_hdmi_update_edid(connector, drm_edid);
> > +			if (ret)
> > +				drm_warn(connector->dev, "updating EDID failed with %d\n", ret);
> > +
> > +			drm_edid_free(drm_edid);
> > +		}
> > +
> >  		drm_bridge_connector_hpd_notify(connector, status);
> >  	} else {
> >  		switch (connector->connector_type) {
> > @@ -246,29 +285,29 @@ static const struct drm_connector_funcs drm_bridge_connector_funcs = {
> >  static int drm_bridge_connector_get_modes_edid(struct drm_connector *connector,
> >  					       struct drm_bridge *bridge)
> >  {
> > +	struct drm_bridge_connector *bridge_connector =
> > +		to_drm_bridge_connector(connector);
> > +	struct drm_bridge *hdmi = bridge_connector->bridge_hdmi;
> >  	enum drm_connector_status status;
> >  	const struct drm_edid *drm_edid;
> > -	int n;
> >  
> >  	status = drm_bridge_connector_detect(connector, false);
> >  	if (status != connector_status_connected)
> > -		goto no_edid;
> > +		return 0;
> >  
> > -	drm_edid = drm_bridge_edid_read(bridge, connector);
> > -	if (!drm_edid_valid(drm_edid)) {
> > +	/* In HDMI setup the EDID has been read and handled as a part of .detect() */
> > +	if (!hdmi) {
> > +		drm_edid = drm_bridge_connector_read_edid(connector, status);
> > +		if (!drm_edid) {
> > +			drm_edid_connector_update(connector, NULL);
> > +			return 0;
> > +		}
> > +
> > +		drm_edid_connector_update(connector, drm_edid);
> >  		drm_edid_free(drm_edid);
> > -		goto no_edid;
> >  	}
> >  
> > -	drm_edid_connector_update(connector, drm_edid);
> > -	n = drm_edid_connector_add_modes(connector);
> > -
> > -	drm_edid_free(drm_edid);
> > -	return n;
> > -
> > -no_edid:
> > -	drm_edid_connector_update(connector, NULL);
> > -	return 0;
> > +	return drm_edid_connector_add_modes(connector);
> >  }
> >  
> >  static int drm_bridge_connector_get_modes(struct drm_connector *connector)
> 
> -- 
> Jani Nikula, Intel

-- 
With best wishes
Dmitry

