Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D00E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 23:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QaZTccrFdwBnijOAV+VQJ0MabSTqdmlDkCUExpbfNic=; b=EgpYBtKg7CzpcM3ru/b2J4/uvG
	3FBCJKx5ZGFTE2dkU4UV0pRKPjbHTPdBZqvk3vTtiPBrY/zSp8b1KQZttiSKovktkztys0wSa1MY1
	wJjADW4eyylHpuPCz2InEK2ZputkpbbtNTl6S0HKHoOmQnifPv8MCawWLdcVO/c5mhMAzfNgx0xgV
	uvZ0WjA8iqZoTEEXIVLNGu61yy5G20PzP7nE2XZXZb0A7bAwIhjtnAl8oLnOu+19nMmftc1Tg4E4H
	cF/3Y/S/P90ICtV0h/jXgjcVFpQnLkeb0a3I0KBlxMXnEBlGqe2T5cl8FbrfB7JUoLf67WFSUpkll
	mNzKZZqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLA5v-0000000DDCm-1SmS;
	Tue, 10 Dec 2024 23:56:47 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLA4r-0000000DCyt-2mWl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 23:55:42 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-53f22fd6832so3326442e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 15:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733874939; x=1734479739; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QaZTccrFdwBnijOAV+VQJ0MabSTqdmlDkCUExpbfNic=;
        b=ZAbVpsauENlwEkh8LBeQJmZfY18P2B3+IwdVjObSKuc/kTtrSRQKL+ww+/KfHg+lJM
         WSg5tPlsRfqI8pJPVRO1hSdSik9zOT9hepak8Mukrq4kjolSS40OvzLhmB5mbjj/RF7l
         rz4hOmvQyF0zxDmRWgMxVyyCouQnjtEDgCxs0n4in24vbK4kWddYSA2f1oEBvlBL+f3N
         PKQ6lyHcC4LSKHJhNbDQmMzfrCSUdEWCtPEyJDsPUrs8I4EPkInBTieyAsvqCCcbAAMT
         6//inq5qUGGLAEJsoHaXGEsXAU7WenglbI9tAKOvg5Lm9AyNsXVJ1L8XDWoikkvwydKo
         U7oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733874939; x=1734479739;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QaZTccrFdwBnijOAV+VQJ0MabSTqdmlDkCUExpbfNic=;
        b=wUSqiBsmxo1jyDc3cyh+YT7+MDOn5bR3HTyb8QIB1soUHR8Ipn4gytcMcfWaVWUPgM
         8qtNn1+BrE0YuyMPf3XeGMSLQSZ1ALOrRLCJS8oSyv/RXJ30m1lZp4iT0tdywmo0jHzN
         3weJoZ3KNf67fDsREChsZkwZH1yBIDWDH4kcTDOKJDHxwqJGlAX0XpFFpauL2N2ipmMQ
         jbjQ7laBG7ZD1z+KYMDSnBXPpTCETEwHhLoQUpFf6J/Y/jRaJVsrxAljr8gCeOa32ThT
         azxUfMDCzNrvIxfTnypN6yxwHKbxGoquNBthMfRMTDcSGbpQ+lPiIlcWT5kCwpm1j3vt
         ec3A==
X-Forwarded-Encrypted: i=1; AJvYcCXbjJo+vOI0k4m0yb8SxgBxRT6IGk+Xv8pLU1GnT7E9WnV9Nwt0Kf3CUcGyGzWKKJFXokiyfW8nCT++S8xyPgL1@lists.infradead.org
X-Gm-Message-State: AOJu0YxKYgIff5pZy0Mw+DRl+3bqcQ0LH0LU54JJeh2KFtd1bI5KlcH/
	rACbwxNRBijGEvz8Yue09IHj5B3y3clvfekkZfThoaG6F3qY2FCPf9Q6R+JsGzY=
X-Gm-Gg: ASbGncudjKtg3fsZc89zCOf0Af8zKZZTS1qYquNh+MRhfNpmRm0hWmWr2B+8ThBO72o
	kB5GpXK//dDY+90zL6qGWMLkqy92Gj0De6kERYeo1dBLfO6ljEWumRgwkqsfLV2BhISkPMWXZ+C
	Dcb7Sh11GInmd0fSIWphBSniIqmgwNBnbYCoaHzDXmEGczHeU/8Q+AZD3cfpgEtV1hnCHhLUiOt
	77v+SOpbSvLaj2qWtP3kWosRjLYP7iATcwvicl0Cy92SLF3ZVRbqnFdSI1ux4zL3wr4mQbQpkop
	gRmSvTiVwH1zx7pmph/G52Ipv4LxjqT7GQ==
X-Google-Smtp-Source: AGHT+IEqR0S7rTS9VZY7JOisSWbtpL7N6GcbvhCke9+P/tEVld1+jhG0IU1pO+4oYFJYfFY5K9gtWw==
X-Received: by 2002:a05:6512:ac8:b0:540:1dac:c042 with SMTP id 2adb3069b0e04-5402a5d6c4bmr171539e87.8.1733874939550;
        Tue, 10 Dec 2024 15:55:39 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5401a5360bcsm1065405e87.174.2024.12.10.15.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 15:55:38 -0800 (PST)
Date: Wed, 11 Dec 2024 01:55:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre ARNOUD <aarnoud@me.com>, kernel@collabora.com, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/4] drm/rockchip: dw_hdmi_qp: Add support for RK3588
 HDMI1 output
Message-ID: <vpy4foezirdhci4nvl5j4e7gf5dey3swj7xxzuzazzj6uhqnls@iyyhkpukb7yo>
References: <20241211-rk3588-hdmi1-v2-0-02cdca22ff68@collabora.com>
 <20241211-rk3588-hdmi1-v2-1-02cdca22ff68@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211-rk3588-hdmi1-v2-1-02cdca22ff68@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_155541_694348_6268FAB9 
X-CRM114-Status: GOOD (  11.79  )
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

On Wed, Dec 11, 2024 at 01:06:14AM +0200, Cristian Ciocaltea wrote:
> Provide the basic support required to enable the second HDMI TX port
> found on RK3588 SoC.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 119 ++++++++++++++++++++-----
>  1 file changed, 96 insertions(+), 23 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

