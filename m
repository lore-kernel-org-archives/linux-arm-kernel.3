Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D499E64A85
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 12:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5n+OPgKd4OeVfRcOdyszAmWQAYwYUA33KJvbyrKBpj8=; b=oyw2946koEJSrb/zVPWV8rnE99
	mGp/Ppz+P+BoWE0UQCjkSoDwMcP9hh8lDaqobj7BsbNMApfmnO860WdNKIsSNaaufxcuNQZ1KXGU0
	xZ0OIqVYX/1+Mt9cQjAgpvxGyV3o9JREZxWrqc11otyhneOJu11PZ0jM9iStjcZLYvsZEo9euVf7M
	L6UCi8EO6PJX9ZJJtY/k/ElB8w/TfGdUfQaBB26Q4rVQrBl7l97KG9RQvqsFPo4thoMA0sJtXDHAM
	5P4s0thocM0Ztat92SrCWvB3kImzhbn9FF05+49jnVk9BKaZAcRhI1xW5CiBrPaX5rnl62GPl/FQM
	qCTrq93Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIRzZ-00000009QSQ-0JbZ;
	Tue, 03 Dec 2024 12:27:01 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIRsZ-00000009P5U-01Gq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 12:19:48 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-53df63230d0so6775546e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 04:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733228384; x=1733833184; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5n+OPgKd4OeVfRcOdyszAmWQAYwYUA33KJvbyrKBpj8=;
        b=EXLx2AXi3whwggmUakHP46miquVqVCqW3l0P7hVRrtwhRofytu1DqtNRncZdTye72X
         ry5UdoKH6fDC1WH5dT7pm/eyckBYS76tVWD6pT2QCuizLjqQLPRKWC2Lxn8VSgpBHOGb
         WOhmGynXhiQg+WP/NSx+3QEoCFb3Y8GmabCxjhdnw1x5Rg42LGRKOT+6a8X13YjD18uC
         wJTiEfhAgz56ckpZKd7YS+lamdugOLr01yNBuO5QZ6aAh1f9BcoRUO9daycwkR4tcEe4
         A0lkQXZM5YsYYNjDa/2HFu+bM02ec4ZjYaQBVkUS4GVdp2iyYbA6kDMH61mW8X/zii7d
         6MfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733228384; x=1733833184;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5n+OPgKd4OeVfRcOdyszAmWQAYwYUA33KJvbyrKBpj8=;
        b=K3bu6M7HBWIBkzRVZYoxlkSJRqZjZPzHK5k332xrRq1JSEfQxuHcwkyZXZfWI1yz27
         I4OxyWfrlPe12Fyd+8cYfko/fxSqmyrXOjqJtuyxxdQz9b0u3aFhEfT1DEWqkSk0TCk2
         JcfgtU8ExfyL/BAwmELu/t7ZNRksJlRtEPqqX2j+nJDFY/A1n2EkxY6lRdMBH+UC1+jN
         BH6T/v4PMmx9BqzppwB9AGkM/9nFnUzaGbDTBZjEJFWZqkzeJpF0NU7HQ8iZz5JHfcZ4
         l+9on5UF/BfR5Pf12KCWmo4ixFxmeB3rf1qgi8bY0tsjWCJT89uyAiOEyq3KqAObmjqW
         gWKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUwbTUas5pwv1cxuWOrmlw4oXE6evU5v+fOP6Iz5ihOmEhy8FnxbWr2nltz7NcxcIrLJ9p1dFyFl0dwoAOVZH9@lists.infradead.org
X-Gm-Message-State: AOJu0Yyu4g0WCXAwtxorr+ilNfVxUDGFDNlrYjZQUUFcxpZQ4MVFs0gq
	+aULGxPjCXo70q7vFKEaUrzfZwU7VfCHaSo7649u1DIZRIs0GI6f32npMZ1mD/w=
X-Gm-Gg: ASbGncsa/OmEpkpQdtEReGyYmDEm7vQGTx6QSukUHJ+4c3rXEg1x6cd2hqlOz4XNhG1
	q4UbWZjymrKGnKODuBqKQxPPG6xMhbxSqq6GjdQCeMnoR3OMrynUBiwoHLF30svanXEsNIHkG48
	9J3uVd69W43whe9a7w1C9boWTVvyNT6fhozdAtJqe6toq3yw5XoMaLR2oziZwEy/jnLk3xBwdrF
	DHUO0Aos1DshmKBiCdBXiz6Z7cHuhl03V996ZrHV72JMnKcDfm+AvYf5b6p/3nnqdlrSoyPGYvZ
	1UYpAYB8JjWMq1L95nNLWvB5h/nkEw==
X-Google-Smtp-Source: AGHT+IGqrNK3/JV3p7HUHgNYWUEc9ZkYpw0A4baw1aq7D6bW6M82dv1dR6gPJHjyZhTW0XLXbh3VUg==
X-Received: by 2002:a05:6512:32c9:b0:53d:e43c:9c5d with SMTP id 2adb3069b0e04-53e12a06a29mr1124957e87.27.1733228384467;
        Tue, 03 Dec 2024 04:19:44 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df643149asm1854312e87.37.2024.12.03.04.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 04:19:43 -0800 (PST)
Date: Tue, 3 Dec 2024 14:19:41 +0200
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
Subject: Re: [PATCH v5 8/9] drm/vc4: hdmi: switch to using generic HDMI Codec
 infrastructure
Message-ID: <e7jngrc4nljdsksekinbkir2h76ztsth2xj4yqcyapfv43uryh@356yrxv3j4x6>
References: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
 <20241201-drm-bridge-hdmi-connector-v5-8-b5316e82f61a@linaro.org>
 <20241202-industrious-unnatural-beagle-7da5d4@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-industrious-unnatural-beagle-7da5d4@houat>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_041947_045533_CF12E8D7 
X-CRM114-Status: GOOD (  29.16  )
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

On Mon, Dec 02, 2024 at 02:20:04PM +0100, Maxime Ripard wrote:
> Hi,
> 
> Sorry, I've been drowning under work and couldn't review that series before.

No worries, at this point I'm more concerned about my IGT series rather
than this one.

> 
> I'll review the driver API for now, and we can focus on the exact
> implementation later on.
> 
> On Sun, Dec 01, 2024 at 02:44:12AM +0200, Dmitry Baryshkov wrote:
> > Drop driver-specific implementation and use the generic HDMI Codec
> > framework in order to implement the HDMI audio support.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/vc4/vc4_hdmi.c | 68 ++++++++++--------------------------------
> >  drivers/gpu/drm/vc4/vc4_hdmi.h |  2 --
> >  2 files changed, 15 insertions(+), 55 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > index 7295834e75fb1ab0cd241ed274e675567e66870b..d0a9aff7ad43016647493263c00d593296a1e3ad 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > @@ -595,6 +595,9 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
> >  	if (vc4_hdmi->variant->supports_hdr)
> >  		max_bpc = 12;
> >  
> > +	connector->hdmi_codec.max_i2s_channels = 8;
> > +	connector->hdmi_codec.i2s = 1;
> > +
> 
> I guess it's a similar discussion than we had with HDMI2.0+ earlier
> today, but I don't really like initializing by structs. Struct fields
> are easy to miss, and can be easily uninitialized by mistake.
> 
> I think I'd prefer to have them as argument to the init function. And if
> they are optional, we can explicitly mark them as unused.

Do you mean drm_connector_hdmi_init()? I think it's overloaded already,
but I defintely can think about:

drmm_connector_hdmi_init(..., max_bpc, HDMI_CODEC_I2S_PLAYBACK(8) |
HDMI_CODEC_NO_CAPTURE | HDMI_CODEC_DAI_ID(4));

or

... | HDMI_CODEC_NO_DAI_ID)

The default (0) being equivalent to:

HDMI_CODEC_NO_I2S | HDMI_CODEC_NO_SPDIF | HDMI_CODEC_NO_CAPTURE | HDMI_CODEC_NO_DAI_ID

WDYT?

> 
> Like, it looks like the get_dai_id implementation relies on it being set
> to < 0 for it to be ignored, but it's not here, so I'd assume it's used
> with an ID of 0, even though the driver didn't support get_dai_id so
> far?


-- 
With best wishes
Dmitry

