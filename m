Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE3FD7830C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 11:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6X4f5B7p/4ISxO7icMRqa8h5IT36sTqoFNtM1b1oYjE=; b=YRcGENPK5F/K1x8KAZKqIox9ZO
	SzjSVulCKtu6rjU53FKhruFKDj+/WlBom/gsosHtt160Y92GPn/TsJtetfUjNK2kzuatz3uMU0beH
	aPyGVp3lhp1Gr1e8PvPozF490/RI/O37lvrQd4dst84nZwIrPGavjKTQO9rSHy112I/26SbacZAtN
	04d5AOcVlYWZpzkNnyMyafXjsszo/Blm+90aca9KGqQiGkgonw6NAVDFOk6A0LTtw+R8GVe7prvGp
	ne4ck6D+SG2VDxoUNaFywOPB4uPAuXEBgmtnnr7PL5RS1p1gInu167Rgu5tM9b/WPELDTEwd6aPnm
	EDzaBCRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI4Ha-00000005oU7-17Vl;
	Mon, 02 Dec 2024 11:08:02 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI4Cw-00000005nbI-2eXe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 11:03:15 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-53dd0cb9ce3so3597289e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 03:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733137392; x=1733742192; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6X4f5B7p/4ISxO7icMRqa8h5IT36sTqoFNtM1b1oYjE=;
        b=tdUy7iclUjHwn9HDqjdZpQniKfDo22g4XDTP2fJqZqoDvU6ehT/EQnb+FROd00SIc8
         uGF7mqoYY/qUug3yRNfDBiufiNujYbAGHm1u8bwaCMBDUIs7F2VKEalAKK7eWKy8E6EV
         roti7Y29G96tZg/dogn5UP0du8W/Z6hRJxjb7HzcgpOJnBATuQ/2GHKUGsFiUJDqXsok
         TiYJnPn2lACsXA7yH2gOfvjmgZrJ3PwduFSK9EsrVYcBk85WDZoNq+y2bmfLj3okg8qC
         fUJn7MYAJZPz+5adij8te57o4fi5HsmhLi9TlKmcIkS0xsVU5Rvwk4OdoWNHmWbjJQIV
         JmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733137392; x=1733742192;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6X4f5B7p/4ISxO7icMRqa8h5IT36sTqoFNtM1b1oYjE=;
        b=lhIaZZOf9LvBVw+5jCew9aH4aiVGAXlq6pLrP6QUWS5jEYCVMvkDwkOc58jNNBrsQp
         JsDq2sx2Dzj/IaXMiG1WeeS5eenMXyzDBYOdePR5crwgtmEJImPksdhS9byHdZbVVhkC
         vvgnE+Rp/vd2EhHZK13BzswoYsT/98w1bjW8BnzkFUIv8xBS+Xfe2zulqTdeeGBr9zH3
         DtE+r+iIN9Jz7YajlnbzN0KiJNkAOMC4KJDOw1sDVy0ZULwhXRvGGifBDZWvy5WsiIrs
         iLFQ/ZOOBQbAEV/cKnlxN2eFE9FYsy3XxyevDp8+aNqjDk96XJHySRpJyV9IS9ByXixh
         8UAg==
X-Forwarded-Encrypted: i=1; AJvYcCUSiCT29eGbnA2BymEeJ56IEUcjnyVynsjOETH4tdJD/XRs8ofKwGLJ8NbGbn4nDtvOd3H5WrYrHhUWVezHEaYK@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw+0//LKZTEZp4Mo1kZONL5LTQF7b3oVgf8RYBnx3i9jXpL30r
	KfvCm1TCAaJ8OasrOExGFMVLBboz6Ss3P/fTODJyUcUjXhZ5cOxN3TMR4Uw/9C4=
X-Gm-Gg: ASbGncuiSbzOEkdRhxN7cQLsWHblgu0ktHSfmkvRw9NxNKDFw0FWsRpPRX7E3Att5xz
	88h6U8SShCcAidVFN/P+WbBgwbPCaJ25CZQTazmQD+PXkSkox21Dk45efXIbGMeQnfoWTDb/OJY
	bRxJwAUbCXaDEpxbRAVAZwajWWhBv3XBSlc5ki9GTSxDTzvaOMuxBFQ+A9TKOqqcGes6pIY18vJ
	VxLsgo5jeCR1asazkgRbA2Kxz4qCb+C6NbDWW+K8RK3GA4sPFDd9OrBNk6Hz/w+drhcjnHkPI4z
	GHHS8k0tXVl7kmiVK4uxaJVzvw9Suw==
X-Google-Smtp-Source: AGHT+IFGDFefBhtw1PCqTOI5KhQIlj3rWjRnFP/b36RPBBTJEaQRx6orQjZk5ZBCQurK/QAedMSg2Q==
X-Received: by 2002:a05:6512:2385:b0:53d:ed25:fb75 with SMTP id 2adb3069b0e04-53df00d3e65mr7699888e87.15.1733137392309;
        Mon, 02 Dec 2024 03:03:12 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df646efd9sm1443877e87.143.2024.12.02.03.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 03:03:10 -0800 (PST)
Date: Mon, 2 Dec 2024 13:03:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Alex Deucher <alexander.deucher@amd.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	David Airlie <airlied@gmail.com>, Harry Wentland <harry.wentland@amd.com>, 
	Inki Dae <inki.dae@samsung.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Leo Li <sunpeng.li@amd.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Phong LE <ple@baylibre.com>, 
	Raphael Gallais-Pou <rgallaispou@gmail.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Rob Clark <robdclark@gmail.com>, Robert Foss <rfoss@kernel.org>, 
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Sean Paul <sean@poorly.run>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Xinhui Pan <Xinhui.Pan@amd.com>
Subject: Re: [PATCH 00/10] drm/connector: add eld_mutex to protect
 connector->eld
Message-ID: <ohbtatnn33jj6y3q4milf4txi4n7yirnny2eefdjddlkn2dnhp@eqjedetct4q3>
References: <20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org>
 <77545786331df8bfaf5fdcb309437358@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77545786331df8bfaf5fdcb309437358@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_030314_698450_40323BAB 
X-CRM114-Status: GOOD (  16.14  )
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

On Mon, Dec 02, 2024 at 10:19:41AM +0000, Maxime Ripard wrote:
> On Sun, 1 Dec 2024 01:55:17 +0200, Dmitry Baryshkov wrote:
> > The connector->eld is accessed by the .get_eld() callback. This access
> > can collide with the drm_edid_to_eld() updating the data at the same
> > time. Add drm_connector.eld_mutex to protect the data from concurrenct
> > access.
> > 
> > 
> > [ ... ]
> 
> Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!

I'm going to post v2 to fix Jani's comment, but what should be the merge
strategy? Merge patches 1-3, 5, 9-10 through drm-misc and the rest (AMD,
i915, MSM, radeon) through the driver trees?

-- 
With best wishes
Dmitry

