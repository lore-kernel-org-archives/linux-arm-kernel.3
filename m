Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF27C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 10:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S1y2kMAHTS24gTACYcRUTYCl+HO5S40W6bTqtE2PJx8=; b=LDRrnzmuuQr9nFzKaFLxj/8SG2
	UpqIHBk8oWdRE8whYmaf9Yq9L9q4cC9gR499hKwjFIfKJY0vdaRR32EvV9DB6JdhvsiUIlsrmFOwI
	w7+U44VCLGp95nrLTCReLI9OiE9XApoFduBiwOkR2ZdA+gRqB/HHitqhAD7AUQWRH193uEtz3IggO
	009eX5Si1gCVe5eUfU2QSkvwPczKIx67ezMt4rIQ9qxU/jAZc4KmUOOa+ZVM5QtONj3PPO2kudH0F
	anAYmxozg45v8sg/uC19LNp2fWjcHQNMNmDy5Gw3McNwFJOxm7MNf0Tzemep9ukJam9a5Ca6akzte
	fnJk5A8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbHND-0000000EW1m-1ubU;
	Fri, 24 Jan 2025 10:57:15 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbHLp-0000000EVeb-2yvf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 10:55:52 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5401e6efffcso2174987e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jan 2025 02:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737716148; x=1738320948; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S1y2kMAHTS24gTACYcRUTYCl+HO5S40W6bTqtE2PJx8=;
        b=Yl2CVXNIbydn5jRxN2cNl+p6pGAMfz7Uz7TFaEij/LYXmJDHChkvX41htxkQI42tWT
         FbFreAtSo2aZY5p16DycdScopta46DviN6jzEG7bLCqWn0qTMzOhPHHkmxUWwBqv0LYo
         AYOZzsjZ8sg/gMkFMS7rzBZZIaITytV8HUfG1JLjdnlOyy0/uaHs97AltASG2huKZbic
         Ve3T38ATbMjrzzH+UOycR1v3+JacauTmiPpg9B9lpj1iBNEAQm0dW0ClFv8cZ/2ijgiR
         RqBG16Kcy/bUpIO2fpvZoksaYl20dTXdaJx0OugxlLKtLQtlTOJuzo0dP8+PC84EzJ5F
         p1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737716148; x=1738320948;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1y2kMAHTS24gTACYcRUTYCl+HO5S40W6bTqtE2PJx8=;
        b=ow0Y0g4INbtOtu4jscq+S3z5OlpMl54wn/mH7dtAHO7EbfRoJsq/FmB5QZaKbgNkuD
         /7YEqIRM0+hAT6BQ46oVsAGca7Xz0QDMDjVw6bjKxKkWwWrktyGiMCJx0l0fuo9WRX1+
         8FnNAznFZ+8huQsP990nnImmwv6OPN0s94lRJXCcFCl6ZCCBTneRnDvO6qzAn+YI7pYT
         mStNw+Vb3ggfHcU+KmCXrkrjjVgnSZ53NwDluCc/QztAhD4Uk6PSNN2qO7KNfD4VkQtc
         UQCxcKXC/fu0zXPLjIM/V+tlNFi/CxMw3/i1edYE4AAFYDoT6a9z7oqXi7nmIfEY4Hw+
         Rzgg==
X-Forwarded-Encrypted: i=1; AJvYcCU9Bf2A98e7kri9tk2VFGI7tIqiXMPxGwOK2D0xsudHWpPGlHC8sPSJPHPazDZlYDvnhcFFYG+pizd3fWGEK2ni@lists.infradead.org
X-Gm-Message-State: AOJu0YxM5aJHyePevlAKEfjaAaOA+50wszCEqlUaOh5oFA+DSIFT9+S6
	Op9GCezLPL2WBz4I2L2KxLM4EUIy8zQ69TyguDJMrejFccKsOOgWMjurBNEegbI=
X-Gm-Gg: ASbGncs//m1BPQLAoElgopkrqvot7jPmEek61cp5NRuikD/e1++jQ49k/w0aB/3JmW2
	BZ2/2eALL8aKr48Z2SECU7sGpgt4xLUlxZIhRudQ+19wc1LLlb4kTtjZdc6FDqCw2h9G4LNT7fh
	NYJ/UCc9/GGhDk8NgVtnDSk+uu8hBZ455Fkcij87RUyzh3ba5Qt4lQvMMlhXepJlljkJpV16mBm
	Seqn+Ao9lkjo0l55yPinNYEQkJ8NcOWm02CQ0ILO9DTutVhIz0TyHkCJClP/GA4IXFtR3bDf8dd
	vc2kRP4Pm+9TSjF2fCxTCytbGsZzBQRogpJ8ojuyFMWI2mrkIW5TxpN2f8d4
X-Google-Smtp-Source: AGHT+IG1so1EJbtoaZLNEkBkwyrMeUwJf4GSPqV5pFUaUQ8TSEQNKfZY2ntLuIIOfXfOLnxy5gbRGw==
X-Received: by 2002:ac2:5e9d:0:b0:542:2166:44cb with SMTP id 2adb3069b0e04-5439c282b25mr9456214e87.35.1737716147649;
        Fri, 24 Jan 2025 02:55:47 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c8228997sm256890e87.43.2025.01.24.02.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 02:55:46 -0800 (PST)
Date: Fri, 24 Jan 2025 12:55:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Yan <andyshrk@163.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
	Damon Ding <damon.ding@rock-chips.com>, heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
	sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com, l.stach@pengutronix.de, 
	andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
	kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v5 05/20] drm/rockchip: analogix_dp: Replace DRM_...()
 functions with drm_...() or dev_...()
Message-ID: <rf6bdpi4wa2lbz23rvy7i5dl5nlidkky36gjjbagiqge3h7oi7@y5vp4u6o7hqd>
References: <20250109032725.1102465-1-damon.ding@rock-chips.com>
 <20250109032725.1102465-6-damon.ding@rock-chips.com>
 <40b09942.533e.19449c023a1.Coremail.andyshrk@163.com>
 <a8bee693-cbde-469d-abcf-363311cfd904@rock-chips.com>
 <87ed0tn29l.fsf@intel.com>
 <6007b76a.6021.19497b090d4.Coremail.andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6007b76a.6021.19497b090d4.Coremail.andyshrk@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_025549_780256_CB860F8E 
X-CRM114-Status: GOOD (  26.07  )
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

On Fri, Jan 24, 2025 at 05:41:58PM +0800, Andy Yan wrote:
> Hi,
> 
> At 2025-01-23 20:27:50, "Jani Nikula" <jani.nikula@linux.intel.com> wrote:
> >On Wed, 22 Jan 2025, Damon Ding <damon.ding@rock-chips.com> wrote:
> >> Hi Andy,
> >>
> >> On 2025/1/9 14:28, Andy Yan wrote:
> >>> 
> >>> Hi Damon,
> >>> 
> >>> At 2025-01-09 11:27:10, "Damon Ding" <damon.ding@rock-chips.com> wrote:
> >>>> According to the comments in include/drm/drm_print.h, the DRM_...()
> >>>> functions are deprecated in favor of drm_...() or dev_...() functions.
> >>>>
> >>>> Use drm_err()/drm_dbg_core()/drm_dbg_kms() instead of
> >>>> DRM_DEV_ERROR()/DRM_ERROR()/DRM_DEV_DEBUG()/DRM_DEBUG_KMS() after
> >>>> rockchip_dp_bind() is called, and replace DRM_DEV_ERROR() with dev_err()
> >>>> before calling it.
> >>>>
> >>>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> >>>> ---
> >>>> .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 29 ++++++++++---------
> >>>> 1 file changed, 15 insertions(+), 14 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> >>>> index 546d13f19f9b..8114c3238609 100644
> >>>> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> >>>> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> >>>> @@ -100,13 +100,13 @@ static int rockchip_dp_poweron(struct analogix_dp_plat_data *plat_data)
> >>>>
> >>>> 	ret = clk_prepare_enable(dp->pclk);
> >>>> 	if (ret < 0) {
> >>>> -		DRM_DEV_ERROR(dp->dev, "failed to enable pclk %d\n", ret);
> >>>> +		drm_err(dp->drm_dev, "failed to enable pclk %d\n", ret);
> >>> 
> >>>                 You just need to pass dp here:
> >>>                  drm_err(dp, "failed to enable pclk %d\n", ret);
> >>> 
> >>
> >> I see. It is really better to pass dp instead of dp->drm_dev. I will 
> >> update all relevant logs in the next version.
> >
> >No, this was bad review feedback. You're absolutely expected to pass
> >struct drm_device to drm_err() and friends.
> 
> No, I didn't see how the drm_err macro and friends restrict/expect the passing of only the drm_device pointer.
> As for the platform device driver itself,  we hope that when an error occurs, the log clearly indicates
> the specific device that the log corresponds to, rather than a generic drm_device.
> The original code of this driver used the macro related to DRM_DEV_ERROR to do just that.
> And similar patches have been merged before
> 
> Please also refer to the discussion here.[0]
> [0]https://lore.kernel.org/linux-rockchip/20250109032725.1102465-1-damon.ding@rock-chips.com/T/#m54bd842be660031773834cedea6c73a5033ca973

Reviewer's mistake (mine). I assumed that you wanted to pass drm device.

> 
> 

-- 
With best wishes
Dmitry

