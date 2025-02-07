Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF7CBC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 03:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rv/3RFVNWDMcc5HMME46hF6itjMzUu60Z1kcevabBlU=; b=gdXjyPBhHRwCMzW44NBOyBZD+y
	Y0/lHl9HcO/qVj0vf17Y9PR/pej3U8r9pf08tuHzg/o4T1+wO6NmtbAMP1pFiyIOIkLztHg+qvsq/
	i6/uN9dUmlBldAypnHPZagLSQB5XQNOoVxEaxVWv9BGPANAxBB/QWTlHoe7hA/SeuEwNVd4XVjWEM
	8+BLHec0BZ0IOn+JJvFhRBKhglEF7cyCI26mQiYsZzz0fsfclCtJJBhyS1QTeqVUBWFw4t5atsusQ
	cLnrIgmRaLHw92lhToCK5ctnBhyMRIZgNn1QRFdnDENDSUQjnDUOwnjYOOYSEgcw55fX9T5BVDoKq
	WcHiZhTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgEdq-000000089Fu-02kI;
	Fri, 07 Feb 2025 03:02:54 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgEcP-000000088zo-0Oap
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 03:01:26 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-307325f2436so14357691fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 19:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738897283; x=1739502083; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rv/3RFVNWDMcc5HMME46hF6itjMzUu60Z1kcevabBlU=;
        b=FbaatJ4cb9NFtyzO4LgfA3yPBPJ3P28YLVjpxJlpRX3dbEwQ2zrr/RAh0ugDi9dK8o
         mVahCBNQ4U3rYZUGE8EEf7XRt4UVqaE8eIWos+oWttay/Qf4T3iJELlOQwmK/KdAiz64
         DoP0fhI4LwECe5nYWpTeehRXfUzlxClPazC7Wpt1WICplcP9WSrh6zFUqyErhWFQP6FS
         12FNrcVIgDRQp9AbxlcvlBTmswHbNFbkQvSXiQbX+iag1nX3MhWJIAvhelMoGwPnd3R+
         0fQ2dOMwZRZWG3u0kg1rUqJ5kxsIEfoxzUkDStL2+le/zb8GTkHKhiZxGgElj1xR+2Gk
         cYFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738897283; x=1739502083;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rv/3RFVNWDMcc5HMME46hF6itjMzUu60Z1kcevabBlU=;
        b=Phjo4V+eVLUX2k4H+XvX6jdYf6e1HBe4AdMU4IARRf5qYTZzYiw/MeBIbz3xYl7iCM
         c8SIOIbjQ/yw40W5Gh8fL1FoBtuh+Hr70NZUi2d0R2g4QMd9hUMmOJWS2LcC7NWpE5d+
         xFnoDQXhrO3kW0KGt7dKZWhWa06PnGmKlqjhdMSJ4dcqv9EbrKqKoJJYc2Qibl3mHNc2
         QfLYokpmJXpZZXLcVz0mQCYlzRo106JHp1n0/kQbdOsYZO9hlJTCs8m7fng6gv2NTRAW
         QrqP5Divw/9lHfJPUpRKW1ZfO61++IKhs7sfHkvRlNJrZUX0vHTCsXaLOH/JOE6mnjKb
         44zA==
X-Forwarded-Encrypted: i=1; AJvYcCX86SFFXJh24ZJrRD9JuZTndnQsghzvQQdBQWfzlre5YO5W2JGClQsvEt0Q5xM0w5SsrAZJtcxyTxadT+CLxath@lists.infradead.org
X-Gm-Message-State: AOJu0YxVokSqIaM/HLPcfOqkA3QAOLw7IkAC0Nso4qV48Na5eQiCcytx
	N9gcaPX/wiicexZqyfKbWp4kRjNMTPGVVsqC/fh2ir9zOBr50Wt7tMSxPRHq4JY=
X-Gm-Gg: ASbGncvteLf8QzmjUeeZ4IOn0OGlwZiVwuZgAkGoBaCiWPoE5vbTJsaJxmv74k/VGQC
	8czXbmG9wA6IJMhxw5gAUaIC8B5qdhVM57frbq3csEagpMHZiuN3kA+496C8AMy6nDEOw2xUqeQ
	LuOyHsR3coSf+9vvGNdXArKG64q+LyZn24q9ra+asaAZelodEiTfAIZ7D65PsYBUz8fJ1x2/+Oz
	T784rK75SqBVd+UoXQvIBZhQDNCygfW+/J7xY2sAFM/t23GBFWOKaKtpgGfrV1xOh+ohzV7PHoc
	VM8wa34g569CuoZa50/ADwqLpgm/weSp6TrjMDfHhgByHNduv3yRUkX3/PnRDOeimucvIZI=
X-Google-Smtp-Source: AGHT+IGDqEkE6OWYr0NcLlg1JR9sknC45WBuXsh87/ud3ljT7djhN2ztl5wAF/TJfj5OXo6RJ8lw+Q==
X-Received: by 2002:a2e:bc21:0:b0:302:244a:da2c with SMTP id 38308e7fff4ca-307e5a71d1amr2898811fa.31.1738897283014;
        Thu, 06 Feb 2025 19:01:23 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de18e48dsm2871441fa.27.2025.02.06.19.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 19:01:21 -0800 (PST)
Date: Fri, 7 Feb 2025 05:01:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v6 12/26] drm/bridge: allow bridges to be informed about
 added and removed bridges
Message-ID: <5roxoodskw3ieksvzqezs33gcwhppeqikagu5462wljc6zylif@5ls7bmdusmq5>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-12-9d6f2c9c3058@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-12-9d6f2c9c3058@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_190125_147427_24ADB513 
X-CRM114-Status: GOOD (  28.74  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Paul Kocialkowski <contact@paulk.fr>, dri-devel@lists.freedesktop.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Simona Vetter <simona@ffwll.ch>, Robert Foss <rfoss@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Daniel Thompson <danielt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Inki Dae <inki.dae@samsung.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Feb 06, 2025 at 07:14:27PM +0100, Luca Ceresoli wrote:
> In preparation for allowing bridges to be added to and removed from a DRM
> card without destroying the whole card, add a new DRM bridge function
> called on addition and removal of bridges.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Changed in v6:
>  - rebased fixing conflicts
> 
> Changed in v5:
>  - fixed kerneldoc errors
> 
> This patch was added in v4.
> ---
>  drivers/gpu/drm/drm_bridge.c | 12 ++++++++++++
>  include/drm/drm_bridge.h     | 23 +++++++++++++++++++++++
>  2 files changed, 35 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index b0834b8644284e5f7751cec81724af849b4180e7..1955a231378050abf1071d74a145831b425c47c5 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -207,12 +207,18 @@ LIST_HEAD(bridge_list);
>   */
>  void drm_bridge_add(struct drm_bridge *bridge)
>  {
> +	struct drm_bridge *br, *tmp;
> +
>  	mutex_init(&bridge->hpd_mutex);
>  
>  	if (bridge->ops & DRM_BRIDGE_OP_HDMI)
>  		bridge->ycbcr_420_allowed = !!(bridge->supported_formats &
>  					       BIT(HDMI_COLORSPACE_YUV420));
>  
> +	list_for_each_entry_safe(br, tmp, &bridge_list, list)
> +		if (br->funcs->bridge_event_notify)
> +			br->funcs->bridge_event_notify(br, DRM_EVENT_BRIDGE_ADD, bridge);
> +
>  	mutex_lock(&bridge_lock);
>  	list_add_tail(&bridge->list, &bridge_list);
>  	mutex_unlock(&bridge_lock);
> @@ -249,10 +255,16 @@ EXPORT_SYMBOL(devm_drm_bridge_add);
>   */
>  void drm_bridge_remove(struct drm_bridge *bridge)
>  {
> +	struct drm_bridge *br, *tmp;
> +
>  	mutex_lock(&bridge_lock);
>  	list_del_init(&bridge->list);
>  	mutex_unlock(&bridge_lock);
>  
> +	list_for_each_entry_safe(br, tmp, &bridge_list, list)
> +		if (br->funcs->bridge_event_notify)
> +			br->funcs->bridge_event_notify(br, DRM_EVENT_BRIDGE_REMOVE, bridge);
> +

I think the order should be different: notify about the added bridge
after adding to the list, notify about bridge removal before removing it
from the list.

>  	mutex_destroy(&bridge->hpd_mutex);
>  }
>  EXPORT_SYMBOL(drm_bridge_remove);
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 1561347c4991dac6022319774510f9560c9283c3..ad7ba444a13e5ecf16f996de3742e4ac67dc21f1 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -56,6 +56,11 @@ enum drm_bridge_attach_flags {
>  	DRM_BRIDGE_ATTACH_NO_CONNECTOR = BIT(0),
>  };
>  
> +enum drm_bridge_event_type {
> +	DRM_EVENT_BRIDGE_ADD,
> +	DRM_EVENT_BRIDGE_REMOVE,
> +};
> +
>  /**
>   * struct drm_bridge_funcs - drm_bridge control functions
>   */
> @@ -729,6 +734,24 @@ struct drm_bridge_funcs {
>  				      struct drm_bridge *bridge,
>  				      bool enable, int direction);
>  
> +	/**
> +	 * @bridge_event_notify:
> +	 *
> +	 * Notify that another bridge is being added or removed.
> +	 *
> +	 * This callback is optional. Bridges implementing it must always
> +	 * check whether the event refers to a bridge they actually need to
> +	 * interact with.
> +	 *
> +	 * @bridge: bridge being notified
> +	 * @event: event happened (add/remove bridge)
> +	 * @event_bridge: the bridge mentioned by the event (i.e. the
> +	 * bridge being added or removed)
> +	 */
> +	void (*bridge_event_notify)(struct drm_bridge *bridge,
> +				    enum drm_bridge_event_type event,
> +				    struct drm_bridge *event_bridge);
> +

This creates a small issue. It requires drivers to have a bridge, even
if they don't need one - e.g. the drm_encoder doesn't get notifications
about the added bridges.

I'm not sure if that can be solved in an efficient way.

>  	/**
>  	 * @debugfs_init:
>  	 *
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

