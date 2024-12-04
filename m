Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21757E7716F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 23:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R+qyWMAaxSXjS/GuoQtdsJ9zo8e90abOj5J8SrRL65M=; b=GjESNpMz/ry89WQOoLi+lMZzY0
	HmBTIQR1tgklQtFixlcVHabWK5S+i7kiW5Spmfp73skWRLvwYR84kfooV7QIO3qdBPQTH2brw+RS8
	8JHNufSRElj0oMY6Yu85ITkj5l7rc8+FbriKktTOZcjtzSbAoIy7Cm0DnaZj8beMmJnRyQIAQQlJM
	mbA+R48cBkxWqQX9PxlY2UCjST5xnj0rPVdscXz1AfVQO3s3FzQKb7GB0YhkivrIYpaxfBvXIr1P9
	hoZvXJUqFBcR8gmYEL9m3s8frzgMl/7ahMx1qsrCxwGK6KENk0BW4kl0TG/Q4hm+pTS29TE0WIZ52
	+4UpXp0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIydu-0000000E7Qn-1OzY;
	Wed, 04 Dec 2024 23:18:50 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIycr-0000000E7HZ-2BHx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 23:17:46 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-53de8ecafeeso378032e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 15:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733354264; x=1733959064; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R+qyWMAaxSXjS/GuoQtdsJ9zo8e90abOj5J8SrRL65M=;
        b=xDzEuxtplgzfeXArIEdj+zqE2bvEjcglxjUhwJNmGOlLGVh4xsA4mfMH04hO0pp83+
         suQsp21xwOrHYn+ayCG3c3M/jw7d78Sc3GQvbL0XjTcgunhfqtqgz58lwHqtnOBFr/DC
         7xMPry0GcNmzw6zz3Xg5t6u1mvDMKK6NPBQkhvF/2jJDEPJtIZ7U3++SjzQEKCbXMs0U
         z5244R9NY0ZJWlNg+n0HkwoX+v3Y5zIbKCr8bKOmx5cYfGbhDoN707KapsDcWcgL/XGG
         Om4E/Twr4leDu1z8p0gF/KCpGjhtVsBs2HnR88pLoCH+UDxzqv506HYd3NSRu1IQb+az
         2HSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733354264; x=1733959064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+qyWMAaxSXjS/GuoQtdsJ9zo8e90abOj5J8SrRL65M=;
        b=bbXxwpFDFx0UeXnhrb6ULZ5kND6WvNoSmbnPN7N6xafUbfLbSvjxEaxcPvn6oS9+hf
         I8v2CqJbNfyH5xJ4qmGMy2F7wGoVt86a4hkisK9urDLj6FYwFnLbqQlsQOkRu5aECrrG
         +GkdkXPZTSF/bNwhkTNJQuuwkHLYgi0cnLpKbwTo1xElvp64Pn1cW/2AEe66pVK1rxYH
         9kABDdm8ZnUvNG25PW8pRC/dNgoMTF6/Mal2betd98A5/yyf9C4T/VfyxtSwhTXVUIRy
         EQorG9Oqv72YbiwgEOawlH7ipMeB2cRX9hjdpch/jhLDBxyZO/9y4T6xGve4EzxU6TRx
         qAxw==
X-Forwarded-Encrypted: i=1; AJvYcCUHXt3pulYc3xlS1g6wT7eWC4EOF4xw3y+90D+eb3ZCDUJ0UwJo2GdGO52slJUk0lyl34ESyNvzC8KWu3udWOCI@lists.infradead.org
X-Gm-Message-State: AOJu0YxWJJdIySkrJuni1/SklBwdUea5RGi4xsipTiV1OUTjxp0q88y2
	fTQ4YXSVViKAwDfR7czQv0noqLFTrY1oP2be/MrnWU3gn76lFbuY+bQktqS3a08=
X-Gm-Gg: ASbGnctmtdxYEiiWzuzbHgYmo+wMtkxF+rcHtHr9VPYK29FHG+TP/OAMddF3JQ+yoCj
	u64b+PLLcQF0ILuzIz2/lDwHz7Jl05gPgaU01wBVsoG2QTgGWF5/PQsoG/xLSnEJdNZf6aQest/
	b/GXSwRml9gkxES7sq6BJrrcDil6S8TcgdIbDnTQlFoT6nRrhTv45rTVZHajqxpuJZvAmf3r51O
	zn5JCHVL4fXJFb7CRJvwSKN+yzyB86//u4P4PdfkSTSsIx/kJks2f+jlUnGY7cnvE0BZTwuvBT6
	LzV5H/jgdf2iCTFTbRBCrYMD6jUEUA==
X-Google-Smtp-Source: AGHT+IG2aNoUrJvkerXSq3eWJ+qwjRlvZ17m+biwTB/m1eLy8NPmwfbxly/t8CsrnbMCJEk1wfQi/Q==
X-Received: by 2002:a05:6512:3f16:b0:53d:dd09:124a with SMTP id 2adb3069b0e04-53e129ed245mr3412222e87.8.1733354263629;
        Wed, 04 Dec 2024 15:17:43 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e229ca4c2sm31823e87.269.2024.12.04.15.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 15:17:42 -0800 (PST)
Date: Thu, 5 Dec 2024 01:17:39 +0200
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
Message-ID: <3oz2k3ywwdkxhi4t4setfqjl54yzxg3nxe7upxwl4syyyygf42@3ynkabu2bmvs>
References: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
 <20241201-drm-bridge-hdmi-connector-v5-7-b5316e82f61a@linaro.org>
 <87a5dc4zd5.fsf@intel.com>
 <txzri7x4pdeakx4juandk3hfhsbx3dhlulxfuehqlmrr7b3wpw@jaunqktsro6x>
 <87v7vz3ne4.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v7vz3ne4.fsf@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_151745_569487_FA3AD3FF 
X-CRM114-Status: GOOD (  25.48  )
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

On Wed, Dec 04, 2024 at 09:42:11AM +0200, Jani Nikula wrote:
> On Wed, 04 Dec 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > On Tue, Dec 03, 2024 at 04:25:58PM +0200, Jani Nikula wrote:
> >> On Sun, 01 Dec 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> >> > +	drm_edid = drm_bridge_edid_read(bridge, connector);
> >> > +	if (!drm_edid_valid(drm_edid)) {
> >> 
> >> What's the case this check is for?
> >> 
> >> My preference would be that bridge->funcs->edid_read() uses
> >> drm_edid_read*() family of functions that do the checks and return the
> >> EDID.
> >> 
> >> There are some cases that just allocate a blob and return it. Would be
> >> nice if they could be converted, but in the mean time could use
> >> drm_edid_valid() right there. Additional validity checks are redundant.
> >
> > This was c&p from drm_bridge_connector_get_modes_edid(). If you think
> > that the check is redundant, could you please send a patch dropping the
> > check?
> 
> Mmmh. It's just scary to *remove* them, and that's the reason I didn't
> want you to add one in the first place! :)

Ack

-- 
With best wishes
Dmitry

