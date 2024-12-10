Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A301E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 12:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xFyd1PgF3D2/xwv+F2WOR3tO3r6sjTbGoWT6Q3TM8dg=; b=Bb1FNmJPAtxWrbTAZTVvp5+RIh
	vwM8oLgoiZun/JRl/Fjd4iqIOF0rboslmTClrQeLJh6V75v+8iLN/O6KcB3imh86gMP+mYL7c92YU
	BWButGF+MDNp8KiT1hNxpOato1qnDc0+6AOeuuaR6tjwQye2sAQvzh2mClenAxLpWO1OXxL/rqflk
	rHBJ2hNChjsnDXjtrV6HZhzBYH1TotgTJ9+ZmTgv0CKubstB3qxV8r+YozGSfTj9rreBbNPrFqDFn
	Ihdc+ePqyLNIx/yJEfg2/6TUepx51Tx2FVTA9ZLXE614icnCVxZujmU9vm2ilCtygJIpoPU13tbXg
	BcTlpogw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKzQS-0000000BRS9-1oAS;
	Tue, 10 Dec 2024 12:33:17 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKzPN-0000000BRDf-2XGW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 12:32:11 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-3022c6155edso11964121fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 04:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733833927; x=1734438727; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xFyd1PgF3D2/xwv+F2WOR3tO3r6sjTbGoWT6Q3TM8dg=;
        b=uZzlRtaR3RiOylC+xT3J3sBW4qOAR4MR5Vsu5gAL+ck96jpj9O9GxYDZmhg7mQ8nFR
         k51oH6xUQK/GNaRzfFV1VSAGuqCgsoYQpi39wSk0IzAYLqbP3+q/5rlO6eVcIKkZNlmm
         sreXuhc0l3gzGsp3EFIKOQtcDP/nUmEwHEmUGGiMIg9saN2Y7GhTMBLJCsHPvF1a1G7G
         5cvPsdu0hTmgbdjXdpmyk4KsR5U4aeaUvxGl6lJ4qIbZ3A2FVTqGU0coC61ldGH/6aoJ
         T3B3lJ9dk/6Hd40ACm+pqRv45pjI6gEz7VA8/naaUcGx3v+TJRODAK6tJx5on9X7gZC5
         k28Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733833927; x=1734438727;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xFyd1PgF3D2/xwv+F2WOR3tO3r6sjTbGoWT6Q3TM8dg=;
        b=F4XQnrxATRtU/qPhPvHq8Yd/KaQnBub2Tcu7jvBS0CnrFMZHnj4O4ImIyRV2gotK/o
         ak0O9+/GAGQNQ0P60+BoWXuU7vYkdTNDbT7NDR/BJRUku7giaWc7eg8SV9MhizqFi20o
         lHMKkh73MbMycEMHizr2XpqA5Krh4P1otOXo3f5gmz/5dTrHI4qQSsFGDuCKVvrrPjT4
         BT1I6MsaJ534tpJcOTbQfMedodYW3zp8CgFOPT5bYSCfGr2MciAISa4kmtmutbEKrXdV
         tmamjcTs+fo+dKn0/f9barDq71XqPbBKOog/zNb8FB0LoRGjscooq3RZ5gXE6TBYkp7D
         yVzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbcFhEpVNz4lzm1uaTG6mBzfbttBAXF0Z49pI1hio1B0xtZ80bZ/lW2pb00hbr/Y/kVNMfFJPE9YbjJQiqJd0J@lists.infradead.org
X-Gm-Message-State: AOJu0YyU3ZLte7+4vAmULWM6EYQkrrbPglk/iTYGeP0fldGNbn0zanvT
	JgxyQv9tlk1iF12+CQlWYet/dECR5Tzj6ETKrpVyq5Ma+TWB0iLVgKwBjOxdjKg=
X-Gm-Gg: ASbGncvk3df3UO1QU/CxlW/2qd6RTcZXan5YMC7xzr2NkzktMRb9UByNgAqztK/30uH
	tcrPS0sJeW0C09STEgnlNuXzwJB2Wj/9jQ3FeLfz3MRhduEKnYG8zzheU6uYqPLb+YKo1bQaQ3P
	u/AqOFQq/MWcHRDOzPdYxcYSbtcnlaYtO+fU9vNQtfozYBpX069YqJfwvwG1fKT5ah8XS5cDtPt
	d4bF+/LOqZroV2KWnVukdDz+ZIPC68GGu9KeX5rsbliDIpbmhkqyziG4xqr51Vk0LCIN0Uyylfd
	m7hl7/J22wPR90P12vQrGMvWFXksQYnSGQ==
X-Google-Smtp-Source: AGHT+IFJ8BqRGzKbdRKo9sdokdyA13iJnEch3RCwabno4BEnD/wpduTivdAcQ64Maqs8TOr83ohZIw==
X-Received: by 2002:a05:651c:1582:b0:302:2620:ecc7 with SMTP id 38308e7fff4ca-3022fd82956mr14279341fa.35.1733833927539;
        Tue, 10 Dec 2024 04:32:07 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30216eb1013sm9110231fa.34.2024.12.10.04.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 04:32:06 -0800 (PST)
Date: Tue, 10 Dec 2024 14:32:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
	Daniel Semkowicz <dse@thaumatec.com>, Diederik de Haas <didi.debian@cknow.org>, 
	andy.yan@rock-chips.com, Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	jernej.skrabec@gmail.com, jonas@kwiboo.se, krzk+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, neil.armstrong@linaro.org, 
	quentin.schulz@cherry.de, rfoss@kernel.org, robh@kernel.org, tzimmermann@suse.de
Subject: Re: [PATCH v3 0/3] drm/rockchip: Add driver for the new DSI2
 controller
Message-ID: <jl5obi7rd4h6ywozeqruxq2vx62sx5yf4wwpksrq3prdleps2k@d3zbr5ttquvn>
References: <20241203165450.1501219-1-heiko@sntech.de>
 <20241209150619.33998-1-dse@thaumatec.com>
 <D67AV178CEBD.3QA9VD4ZPRNQ1@cknow.org>
 <2203458.KiezcSG77Q@diego>
 <4e015ea9.960.193ae0c236a.Coremail.andyshrk@163.com>
 <ay5hbnqqjhopaqof6z7j2rzm2bc6xa2vbzan2ak3if6wzmyip2@kqh7gtrajnm2>
 <33e2c5db.1300.193ae284b6d.Coremail.andyshrk@163.com>
 <CAA8EJprLA09NP0KAztc5eoAMkGcrom84jg_pcbNcwN0FAaSLrw@mail.gmail.com>
 <2d68155e.1e5b.193ae4616b9.Coremail.andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2d68155e.1e5b.193ae4616b9.Coremail.andyshrk@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_043209_650113_444CD06D 
X-CRM114-Status: GOOD (  27.69  )
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

On Tue, Dec 10, 2024 at 09:54:09AM +0800, Andy Yan wrote:
> 
> Hi Dmitry,
> 
> 在 2024-12-10 09:45:11，"Dmitry Baryshkov" <dmitry.baryshkov@linaro.org> 写道：
> >On Tue, 10 Dec 2024 at 03:22, Andy Yan <andyshrk@163.com> wrote:
> >>
> >>
> >> Hi Dmitry,
> >>
> >> 在 2024-12-10 09:01:38，"Dmitry Baryshkov" <dmitry.baryshkov@linaro.org> 写道：
> >> >On Tue, Dec 10, 2024 at 08:50:51AM +0800, Andy Yan wrote:
> >> >>
> >> >>
> >> >> Hi,
> >> >>
> >> >> At 2024-12-10 07:12:26, "Heiko Stübner" <heiko@sntech.de> wrote:
> >> >> >Am Montag, 9. Dezember 2024, 17:11:03 CET schrieb Diederik de Haas:
> >> >> >> Hi,
> >> >> >>
> >> >> >> On Mon Dec 9, 2024 at 4:06 PM CET, Daniel Semkowicz wrote:
> >> >> >> > On 03.12.24 21:54, Heiko Stuebner wrote:
> >> >> >> > > This series adds a bridge and glue driver for the DSI2 controller found
> >> >> >> > > in the rk3588 soc from Rockchip, that is based on a Synopsis IP block.
> >> >> >> > >
> >> >> >> >
> >> >> >> > I did more tests with different LVDS displays. I tested following
> >> >> >> > configurations with DSI/LVDS bridge:
> >> >> >> > - 1024x600@60.01
> >> >> >> > - 1024x768@60.02
> >> >> >> > - 1280x800@60.07
> >> >> >> > - 1366x768@60.06
> >> >> >> >
> >> >> >> > All of them worked without issues, except 1366x768.
> >> >> >> > With this resolution, video is blurry, and offset incorrectly
> >> >> >> > to the left. There are also repeating errors on the console:
> >> >> >> >
> >> >> >> >   rockchip-drm display-subsystem: [drm] *ERROR* POST_BUF_EMPTY irq err at vp3
> >> >> >> >
> >> >> >> > In correct operation with other resolutions, there is no error.
> >> >> >> > I am not sure if this is a problem in your series or rather in VOP2
> >> >> >> > driver.
> >> >> >
> >> >> >This really sounds like something is wrong on the vop side.
> >> >> >The interrupt is part of the vop, the divisable by 4 things likely too.
> >> >>
> >> >> This is a hardware limitation on vop side:
> >> >> The horizontal resolution must be 4 pixel aligned.
> >> >
> >> >Then mode_valid() and atomic_check() must reject modes that don't fit.
> >>
> >> We round down to 4 pixel aligned in mode_fixup in our bsp kernel,
> >
> >What is meant by the "bsp kernel" here? I don't see it being present
> 
> bsp kernel means downstream vendor kernel.
> 
> >in the mainline kernel. So, if the mode is unsupported, it should be
> 
> Will it be acceptable to add this round down in the mainline mode_fixup?

I think so.

> 
> >rejected.
> >
> >> because sometimes, some boards do indeed choose a screen that is not 4 pixel aligned

-- 
With best wishes
Dmitry

