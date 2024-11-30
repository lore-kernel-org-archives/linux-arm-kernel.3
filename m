Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42AA0D735F9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Nov 2024 08:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YwEfcn5Pby1DuMjHVg1b1o/lcfJvv/jFNZtuiy5rgCw=; b=DSa2q0ATUoximh7fYXj3coxSLE
	Xb/H0blQYV27wOqsGdhw3+onkszu7AVdwwEsqykLYHk00sSi0CgWykhUrugUK7OyHQsYOangjNGB8
	TXmuKRvulKNOaBD2YoUzJM3patgDfOdpjPDyH63AnPNS9FfzD475lIORA8pevZz2mhC+MITh5CihH
	Qm3PHlyxC0wIZwrBTX40yRjm3LfDBacNQAJyH2Ycaf61Vnb1n1hvvZFhRKl6eo91gmGIlY+m1eqJD
	/IG/64zIHwM3qmhAYq33r/M89EQMOmFxenphqs9V+tTAdgqP3qrNI/SSZUvHZ6T3TVn+FcxXXT/2p
	ILHxvD7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHIsM-00000001d7k-1dHx;
	Sat, 30 Nov 2024 08:30:50 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHIrM-00000001cz8-3rdM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Nov 2024 08:29:50 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-53de101525eso3469653e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Nov 2024 00:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732955387; x=1733560187; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YwEfcn5Pby1DuMjHVg1b1o/lcfJvv/jFNZtuiy5rgCw=;
        b=MOiz832q7g7BF210yDVgJLuzGhahM3EaCYzHVny0YM/y1bax7vyulOc3vDO3WkD5d1
         wcGHtEGSRTE4dZVaL6KHmYGcPkJe//xzcj3ODRtw9AhNBxrV2oBABUlxMaxxP/EvmTfD
         XrPxbBYqqh5HMfFjqAmZTpE/cbTljctxYYpnHflB9Am67aNwAlC94/TZKhg74o7oSDD7
         yC+C+eLMGQUoWO5f/Brn+ZpAVLMy07SjiGrbNhIE/bTfOrNxcn+ZRdzKiD8HREpsWFN9
         ji5KmTCqWJ3hlsNDSpKsiSwQ8d+5WJ4Y1DFiNSvD05gTrYhsu9GEcIri2x6Z+Syq9P2t
         Niwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732955387; x=1733560187;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YwEfcn5Pby1DuMjHVg1b1o/lcfJvv/jFNZtuiy5rgCw=;
        b=ULVv3oY+tBkefBg7bi7OhRoCTirJrGl3deL9V19PrIUxPFDzCdKa1gDQ0r7mVxaJVL
         k2LJeyncwi/ViUe680jFb7RWXG8cbGpdQxl4p31+4/D4X33R8NjyuM8gcF2uWUDEit/t
         mPPJYVMc1NT6+OmNOa6/RNStYRr5QYkgh5DQUuDjTOXxDGfsQwZSEa09ai8RWdcTIEHJ
         4CVp2RwV/H26zOa2js0Ix4TDphpoVL6wNjSOcQuqlvZ5Gzw32y7TyvFawV9p7sGVluKl
         lJcIs6wVshkfMnk6F9k1sggCPCzD03or0fFs7/sKtrrUDgLOjC8TAGx2pFCLib5ZQGjk
         F6nw==
X-Forwarded-Encrypted: i=1; AJvYcCUAhisrp1ZTLB+GMfg9hiqx0DxEtHr1j2jkfYCQSlu7R58qxIQSuEmq6ntn2z8KnMmPlwM78I1ZMp2BJvSiKgZ3@lists.infradead.org
X-Gm-Message-State: AOJu0YwaEG3+y5Vk6V3/pyHzQJug7QxtAgsLrBS4vC1qFojQFuRGyGss
	tNpVBo67qZgutvGBCqOUhJGX7I1UAy/Huq8CCNqXh9hQZRIbdpEakJV4AIdBZ4s=
X-Gm-Gg: ASbGncsD9mpWBSaNrGtbBFZMyMgTSiqksX1BoXNzuM/ldC3e7yUxQdFlImtyJNnu9cL
	Owx4/1iir4SYre1pDNlevkcuFXp/xExXrAJCScT4qlHkRwq4mUIjUJBouUsXW97NaCJczVHzLDt
	So+WwB+nXqwf2z09avFFnPvTMLlKBknOtCHsES7a1rpyKbhapYBwRHfdcLSEw9YKoDbuX0UBnME
	jrg3QpqO4seK86zpdJPoB8stKpShd//nCERMtLQTkgXyJt6SuY4lJSIiwIqSOrH7bjUG2/pGFHk
	GtsJBE0YH26DIi2z6olcK1kTBFQjxA==
X-Google-Smtp-Source: AGHT+IG7msEs9hgIu3ta16vL9mWEiaIEtxRrnODIuHdyaMtVbZhaiQTdxZhi9NhcUgHBW26OK3t30w==
X-Received: by 2002:a05:6512:3f7:b0:53d:f583:81df with SMTP id 2adb3069b0e04-53df5838209mr2781109e87.28.1732955387112;
        Sat, 30 Nov 2024 00:29:47 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df64a05ebsm703544e87.255.2024.11.30.00.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 00:29:45 -0800 (PST)
Date: Sat, 30 Nov 2024 10:29:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sandor Yu <sandor.yu@nxp.com>
Cc: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>, 
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	"jonas@kwiboo.se" <jonas@kwiboo.se>, "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, 
	"airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
	"robh+dt@kernel.org" <robh+dt@kernel.org>, 
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"vkoul@kernel.org" <vkoul@kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>, "mripard@kernel.org" <mripard@kernel.org>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, 
	Oliver Brown <oliver.brown@nxp.com>, 
	"alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>, "sam@ravnborg.org" <sam@ravnborg.org>
Subject: Re: [EXT] Re: [PATCH v18 6/8] phy: freescale: Add DisplayPort/HDMI
 Combo-PHY driver for i.MX8MQ
Message-ID: <foi2sizfkppmunq4yqt4pex47alsvsjyqi3rk32fwyz4f5xepn@zdsx74bzzda4>
References: <cover.1730172244.git.Sandor.yu@nxp.com>
 <411e42c70e71dce33a80059f663fb6c58fb2ac8c.1730172244.git.Sandor.yu@nxp.com>
 <efciuvoptv7qxwauswfseb6zlt5w4fmjdbm3huxfsn63a6bm7u@kfgkkvqoz5x4>
 <PAXPR04MB9448F638D47B5495CF78007AF4522@PAXPR04MB9448.eurprd04.prod.outlook.com>
 <z6p6bewmykmufsghdojr4lvziurmmfpnrr5m4w3pfjlqzobpwr@zq2d2ukjvtac>
 <PAXPR04MB9448D68A5CA9755036E9B23DF42F2@PAXPR04MB9448.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB9448D68A5CA9755036E9B23DF42F2@PAXPR04MB9448.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241130_002948_959293_67185041 
X-CRM114-Status: GOOD (  27.10  )
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

On Tue, Nov 26, 2024 at 02:12:19PM +0000, Sandor Yu wrote:
>  
> > 
> > On Tue, Nov 05, 2024 at 02:05:51PM +0000, Sandor Yu wrote:
> > > >
> > > > On Tue, Oct 29, 2024 at 02:02:14PM +0800, Sandor Yu wrote:
> > > > > Add Cadence HDP-TX DisplayPort and HDMI PHY driver for i.MX8MQ.
> > > > >
> > > > > Cadence HDP-TX PHY could be put in either DP mode or HDMI mode
> > > > > base on the configuration chosen.
> > > > > DisplayPort or HDMI PHY mode is configured in the driver.
> > > > >
> > > > > Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > > > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > > > ---
> > > > > v17->v18:
> > > > > - fix build error as code rebase to latest kernel version.
> > > > >
> > > > >  drivers/phy/freescale/Kconfig                |   10 +
> > > > >  drivers/phy/freescale/Makefile               |    1 +
> > > > >  drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c | 1337
> > > > ++++++++++++++++++
> > > > >  3 files changed, 1348 insertions(+)  create mode 100644
> > > > > drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c
> > > > >
> > > > > diff --git a/drivers/phy/freescale/Kconfig
> > > > > b/drivers/phy/freescale/Kconfig index dcd9acff6d01a..2b1210367b31c
> > > > > 100644
> > > > > --- a/drivers/phy/freescale/Kconfig
> > > > > +++ b/drivers/phy/freescale/Kconfig
> > 
> > [...]
> > 
> > I'm sorry, my email client cut the email.
> > 
> > > > > +static int cdns_hdptx_dp_configure(struct phy *phy,
> > > > > +                                union phy_configure_opts
> > *opts) {
> > > > > +     struct cdns_hdptx_phy *cdns_phy = phy_get_drvdata(phy);
> > > > > +
> > > > > +     cdns_phy->dp.link_rate = opts->dp.link_rate;
> > > > > +     cdns_phy->dp.lanes = opts->dp.lanes;
> > > >
> > > > Shouldn't this be conditional on set_rate / set_lanes ?
> > >
> > > PHY do not support reconfigure link rate and lane count.
> > 
> > So, you don't support reconfiguring the rate / count, but you still copy the new
> > rate and lanes into your driver data. That sounds strange.
> 
> The PHY will use link rate and lane count to configure its registers

I'm not sure if I follow it. Do you mean that rate / count configuration
is static?

-- 
With best wishes
Dmitry

