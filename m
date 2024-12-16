Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CCADE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 18:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qwf0Q6wp6H/pRC8arADlqkyBJYwrH22sNYfvDfmEvNU=; b=DfTNxkJi+wgYfDdciAz+WJdm8d
	2vceuyb7lpMl7bhC/PiZQFS3B9F1RGNbZ4oETi3kFaAAZsHHkyiFM+RE4qEm/jVezE1zLZctgliOp
	6D2dqHiZ8sICQQ/CRuYxa8zCoFVavMgEGTXs704l+w/BDLtHoZoNjoEobnokMpHLuPmm277d6D4t7
	VxKgzRf1Lb7djPZuV0aUTgF+SJ8dicUKc2BPiK+7NrRpfKpxigRmZ/Qq3AynHqUV5jyw7l0PoYXAw
	Wt4vaiKe1fS02ASNfSTk0prN9g8034UmZZhrGToFxjr1oaDht/P0NSjR4afz4frpBpgZY7p/ojRQl
	lBp6ZrUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNFkB-0000000AxHN-121d;
	Mon, 16 Dec 2024 18:22:59 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNFK8-0000000AqNT-0Ezx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 17:56:07 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso4580925e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 09:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734371762; x=1734976562; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qwf0Q6wp6H/pRC8arADlqkyBJYwrH22sNYfvDfmEvNU=;
        b=eaVg9askj+JYmXl1qmUwieQSA9DFOyBDBZjHT/qLQEO1c+d9vSpGZgxhuBDiRDmKmB
         4SOj9e2r8ooytJc2LVOL9EJCJUYs+QFdKlmwN1ldTg9TT8Afmiw/iTN2NI8PaenIVhEs
         gPuwB5c/e2zN5D9GJ7gco6AcFCGDZESN4LiE9lmRJ402uJUm8KTaRbcY73B1UXb5P42Z
         4ceiGsYi4fDNqZb8UgxkMJ44YMvC8KyLey5sEruxnGmDnwkFFMLjK6PG5WU4eXvFGhiN
         gLirsfUdnpV3mjabUNxXH97MPKX9RUJCXQEtbKR3SFCGiHZUxtXiTX14hO7eGRFrvhJB
         +PEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734371762; x=1734976562;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qwf0Q6wp6H/pRC8arADlqkyBJYwrH22sNYfvDfmEvNU=;
        b=ItkwD4oWqJvydawiKntHHMxJiUJSlxl27xnHV/vFuLaSJiicBX0hpzmo8iQLrl/EuM
         34lNyeLA3io42l4HdjH89V01x5ord2q7vf398wtYbjTlJj8BFVpSL4IZj2///pnFb0hh
         qdQvzM7MH6vgnN7W30u9srXF+q6uvUrAbhMZ3zt4lfmOuAxhPupkWMpGkM/CBZiBHUuF
         whoZSpCK93xfx8Lw2iXnvEuCuL3rL9BuAvPV3t8if4dlrQg5yzwYCPikIfMn5VQPBDve
         jfu/KQf9GecPXPN8jTPU2kHJPV6ClLrtPgb2Se42aU3KzimayauF3Uo0bcMFo+WkNyXX
         a+Mw==
X-Forwarded-Encrypted: i=1; AJvYcCWYo7ZdGA0XAkrD1H5yDYt5h6z96z8cum8FlDf0/bXPaYqxyHmVTVvp4I+DwMVYQhhMjhMGdSVafSTGvXkGJJPj@lists.infradead.org
X-Gm-Message-State: AOJu0YwpUv7+rYnVzU5ikWAZ9xb+Kk7P09Ks2OxCg5xD/sE4FFCOdcs+
	KdjIrPmXXWUvMWuSh7tivO4e5A98LwOsiB6X0bk9jm4Kl5ghSbcfCBhn5qEfJUM=
X-Gm-Gg: ASbGncu5y+w8Z7exqyA1UNaMCnMW6gAHuSdHxhKlpLgcz/boEuG5CBjRZaBYSAJbbXU
	mDqlrp08u8hiRY3nTKHN3cHYqgUt6UoQX8bNN4BEWV26phXqFkEN9/LctnCm0Whv1i2DcGiQ68l
	hsSTAGHbr1nSZket1RPeKzEqC6Tsrge+BIRipY77BX4ZNSG/1PqJZ3nzP/WPcu1v4uzMMP53lz5
	TX7QzvQXYBYC5+S7WqaOkmHBY2DCM1YDxtDh/IyzsqBkGcDlZ/b79XbayEF1k7EIMuHag0zWL0g
	n/AJ2pbIJINNe34s5/pDqzeTxUlW9RDdIdVY
X-Google-Smtp-Source: AGHT+IG29n5FlljcG2G5r78Pj66GgzI4srZEZjCTKnfT1NsJdZGIbQtNCeGwmhS44dO/GlUjtQdAug==
X-Received: by 2002:a05:6512:280a:b0:540:5b5c:c181 with SMTP id 2adb3069b0e04-5408b800764mr4435678e87.6.1734371761893;
        Mon, 16 Dec 2024 09:56:01 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120b9f4b8sm949454e87.13.2024.12.16.09.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 09:56:00 -0800 (PST)
Date: Mon, 16 Dec 2024 19:55:57 +0200
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
Subject: Re: [PATCH v6 06/10] drm/display/hdmi: implement hotplug functions
Message-ID: <bapkgt2e33bhdmun4efcuaedshyyv7qvjgugu5y53ordw3gigl@n7zbfoga7qo7>
References: <20241206-drm-bridge-hdmi-connector-v6-0-50dc145a9c06@linaro.org>
 <20241206-drm-bridge-hdmi-connector-v6-6-50dc145a9c06@linaro.org>
 <20241216-courageous-mysterious-pelican-5a8d2e@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216-courageous-mysterious-pelican-5a8d2e@houat>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_095604_142503_F60C71B4 
X-CRM114-Status: GOOD (  32.93  )
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

On Mon, Dec 16, 2024 at 06:20:04PM +0100, Maxime Ripard wrote:
> On Fri, Dec 06, 2024 at 12:16:00PM +0200, Dmitry Baryshkov wrote:
> > The HDMI Connectors need to perform a variety of tasks when the HDMI
> > connector state changes. Such tasks include setting or invalidating CEC
> > address, notifying HDMI codec driver, updating scrambler data, etc.
> > 
> > Implementing such tasks in a driver-specific callbacks is error prone.
> > Start implementing the generic helper function (currently handling only
> > the HDMI Codec framework) to be used by drivers utilizing HDMI Connector
> > framework.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 61 +++++++++++++++++++++++++
> >  include/drm/display/drm_hdmi_state_helper.h     |  8 ++++
> >  2 files changed, 69 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > index 80bf2829ba89b5f84fed4fa9eb1d6302e10a4f9e..4cdeb63688b9e48acd8e8ae87a45b6253f7dd12b 100644
> > --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > @@ -769,3 +769,64 @@ drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *con
> >  	return ret;
> >  }
> >  EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_clear_audio_infoframe);
> > +
> > +/**
> > + * drm_atomic_helper_connector_hdmi_hotplug_edid - Handle the hotplug event for the HDMI connector passing custom EDID
> > + * @connector: A pointer to the HDMI connector
> > + * @status: Connection status
> > + * @drm_edid: EDID to process
> > + *
> > + * This function should be called as a part of the .detect() / .detect_ctx()
> > + * and .force() callbacks, updating the HDMI-specific connector's data. Most
> > + * drivers should be able to use @drm_atomic_helper_connector_hdmi_hotplug()
> > + * instead.
> > + *
> > + * Returns:
> > + * Zero on success, error code on failure.
> > + */
> > +int
> > +drm_atomic_helper_connector_hdmi_hotplug_edid(struct drm_connector *connector,
> > +					      enum drm_connector_status status,
> > +					      const struct drm_edid *drm_edid)
> > +{
> > +	if (status == connector_status_disconnected) {
> > +		// TODO: also handle CEC and scramber, HDMI sink disconnected.
> > +		drm_connector_hdmi_codec_plugged_notify(connector, false);
> > +	}
> > +
> > +	drm_edid_connector_update(connector, drm_edid);
> > +
> > +	if (status == connector_status_connected) {
> > +		// TODO: also handle CEC and scramber, HDMI sink is now connected.
> > +		drm_connector_hdmi_codec_plugged_notify(connector, true);
> > +	}
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_hotplug_edid);
> 
> I think we discussed it in a previous version's thread after you sent
> that one, but I'd rather have that helper call an edid retrieval
> function than passing it edids.

Ack, I forgot to add the hook. I'll do that for the next version. I'll
add the .read_edid callback to the HDMI functions.

> 
> Also, EDIDs are mandatory for HDMI, so I'd call the function
> drm_atomic_helper_connector_hdmi_hotplug.

See below.

> 
> > +/**
> > + * drm_atomic_helper_connector_hdmi_hotplug - Handle the hotplug event for the HDMI connector
> > + * @connector: A pointer to the HDMI connector
> > + * @status: Connection status
> > + *
> > + * This function should be called as a part of the .detect() / .detect_ctx()
> > + * and .force() callbacks, updating the HDMI-specific connector's data.
> > + *
> > + * Returns:
> > + * Zero on success, error code on failure.
> > + */
> > +int
> > +drm_atomic_helper_connector_hdmi_hotplug(struct drm_connector *connector,
> > +					 enum drm_connector_status status)
> > +{
> > +	const struct drm_edid *drm_edid;
> > +	int ret;
> > +
> > +	drm_edid = drm_edid_read(connector);
> > +	ret = drm_atomic_helper_connector_hdmi_hotplug_edid(connector, status, drm_edid);
> > +	drm_edid_free(drm_edid);
> 
> Oh. Why do we need the two variants? Or is it to deal with drivers that
> don't set connector->ddc?

Yes. There are enough HDMI bridge drivers that would provide the
callback instead of the DDC bus. Adding callback should solve that.

-- 
With best wishes
Dmitry

