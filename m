Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 448DFD4335D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 13:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lTaMwPBJtQ/LdLyLH+A1iubTYFAHCFT/bM+1zUoljkk=; b=y8OPMO1Xy5FBwMFraEVNKfVVPA
	tz0ShGUTVAE+ufspFMC6PEymCLhI/FOkrSLn2ob8Z08mJ6NfRLa1bheJT6iLFvyRn1V7zxOf6/oQU
	/u1yiVBrt6l2IZnv4KDLwscQ68sMfv2145/EwGpyqE67ls8UVtBm+6vYNmQAdlgQgr3OC7jMAfCkV
	MU9qL85KwgW2G45vvF3RFuETWbjO4uEp8q5hX9ioHYCLPyq/k/dPS9HUwiHz5pLWzPSZi1Ec6v2M4
	DN+x+duOtCvZ1zRNuOKVu4MrgF+51NLAgdg9XuqiOFZTUIiAhR8uTx2MeXqZZ+E6qjzoLPUKT4d3O
	lQwhprOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t92p3-000000079tr-2fGU;
	Thu, 07 Nov 2024 13:45:17 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t92nF-000000079JX-3MDW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 13:43:27 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2fb6110c8faso10103051fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 05:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730987004; x=1731591804; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lTaMwPBJtQ/LdLyLH+A1iubTYFAHCFT/bM+1zUoljkk=;
        b=Dvwhwa7LQ2wyG7YpB626szmE1RY2RiFwjQ25FSzHN5OxT71kOppw0OAfidXdghiOvE
         +2CvteRdwHT3t/8ILuEEkOpI57+w7mNgo+eLfMcB856NzAnpsd/LYnTWCeSRzwZIw5xc
         hmefk2nstV9rx81Gw8ML/ap/U1EBo0zOqD+g9ZEbAXWAFbQe/yE+i4/8ETO0AEmVxpNN
         bosGJFjc/xkm929DRnnk5FktgFVZExJtconoTxMVGfIsv7Uy/r9b7DNsrcT31XlhcJZB
         7OVUX/NEIujwHfcVGWTdQkBylB8DK677LSUPUkRtptkK45/Hxu+u64KaNCbL2g/pO/XH
         NI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730987004; x=1731591804;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lTaMwPBJtQ/LdLyLH+A1iubTYFAHCFT/bM+1zUoljkk=;
        b=XIUmNVlkFuY6Kw1YfMGSbgT5sfGStxw/KYc4e/oeSAptNHJ4Kw7ry+t6oylNJg7tm0
         KDccLfqnQ0cqtKCXQ5wUBSq6bGGujcUrgbn51qKnq/zG4ltAw9lKivq9nmKS7iHoEXQT
         2OBBUo2wX0W454Czy/wkuC0PcelGfemiINJG+HTP3CYwIruRhuBEuzr9J9ao91RKtWjY
         LY2MnbfIXfUd2sm5CH8zLTousCe/VrC2/pnpPUnRq0mFK5zCEYaWfgE3nA5HOdQPh9ri
         JlhPt8TZ0Yfxb0cfUsJnL8dPahgB/wkFyzrbAWLHV3Uw8BfzEnupZucwoUEOp6cRaMkj
         EPCg==
X-Forwarded-Encrypted: i=1; AJvYcCV4zAqzhszSht5iFkJRuoG7Als2OhiRWgudbW68+2e6Rv52d6wik1jKIV7CJ0hnAWa3t46PhacsahkBgvQVNTLt@lists.infradead.org
X-Gm-Message-State: AOJu0YwrJzCh+6Yumgb1LxWxOGALbFBzcINEX/4XYyd2Tl3q27qcuUUs
	szmAUGDThvNN0PB+EjnzPA7XbSYEo8DgQO48F9w84urWPjGT2YzWPMDjqTLRaTo=
X-Google-Smtp-Source: AGHT+IEEXrpAS4axbz2EtICI+fGeaZacL297HQJJZ5R8O8wDOSGkjXWDf4lfkDOD+6Bag7+pFG1qiQ==
X-Received: by 2002:a05:651c:2209:b0:2fb:4c08:be08 with SMTP id 38308e7fff4ca-2fcbdf6ff42mr222407471fa.11.1730987003678;
        Thu, 07 Nov 2024 05:43:23 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff178dfe0asm2220701fa.23.2024.11.07.05.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 05:43:22 -0800 (PST)
Date: Thu, 7 Nov 2024 15:43:20 +0200
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
Subject: Re: [PATCH v18 6/8] phy: freescale: Add DisplayPort/HDMI Combo-PHY
 driver for i.MX8MQ
Message-ID: <z6p6bewmykmufsghdojr4lvziurmmfpnrr5m4w3pfjlqzobpwr@zq2d2ukjvtac>
References: <cover.1730172244.git.Sandor.yu@nxp.com>
 <411e42c70e71dce33a80059f663fb6c58fb2ac8c.1730172244.git.Sandor.yu@nxp.com>
 <efciuvoptv7qxwauswfseb6zlt5w4fmjdbm3huxfsn63a6bm7u@kfgkkvqoz5x4>
 <PAXPR04MB9448F638D47B5495CF78007AF4522@PAXPR04MB9448.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB9448F638D47B5495CF78007AF4522@PAXPR04MB9448.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_054325_893659_DD2FB87C 
X-CRM114-Status: GOOD (  31.67  )
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

On Tue, Nov 05, 2024 at 02:05:51PM +0000, Sandor Yu wrote:
> > 
> > On Tue, Oct 29, 2024 at 02:02:14PM +0800, Sandor Yu wrote:
> > > Add Cadence HDP-TX DisplayPort and HDMI PHY driver for i.MX8MQ.
> > >
> > > Cadence HDP-TX PHY could be put in either DP mode or
> > > HDMI mode base on the configuration chosen.
> > > DisplayPort or HDMI PHY mode is configured in the driver.
> > >
> > > Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > ---
> > > v17->v18:
> > > - fix build error as code rebase to latest kernel version.
> > >
> > >  drivers/phy/freescale/Kconfig                |   10 +
> > >  drivers/phy/freescale/Makefile               |    1 +
> > >  drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c | 1337
> > ++++++++++++++++++
> > >  3 files changed, 1348 insertions(+)
> > >  create mode 100644 drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c
> > >
> > > diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
> > > index dcd9acff6d01a..2b1210367b31c 100644
> > > --- a/drivers/phy/freescale/Kconfig
> > > +++ b/drivers/phy/freescale/Kconfig

[...]

I'm sorry, my email client cut the email.

> > > +static int cdns_hdptx_dp_configure(struct phy *phy,
> > > +                                union phy_configure_opts *opts)
> > > +{
> > > +     struct cdns_hdptx_phy *cdns_phy = phy_get_drvdata(phy);
> > > +
> > > +     cdns_phy->dp.link_rate = opts->dp.link_rate;
> > > +     cdns_phy->dp.lanes = opts->dp.lanes;
> > 
> > Shouldn't this be conditional on set_rate / set_lanes ?
> 
> PHY do not support reconfigure link rate and lane count.

So, you don't support reconfiguring the rate / count, but you still copy
the new rate and lanes into your driver data. That sounds strange.

[...]

> 
> > 
> > > +
> > > +static int cdns_hdptx_phy_set_mode(struct phy *phy, enum phy_mode
> > mode, int submode)
> > > +{
> > > +     struct cdns_hdptx_phy *cdns_phy = phy_get_drvdata(phy);
> > > +     int ret = 0;
> > > +
> > > +     if (mode == PHY_MODE_DP) {
> > > +             hdptx_dp_phy_ref_clock_type(cdns_phy);
> > > +
> > > +             /* PHY power up */
> > > +             ret = hdptx_dp_phy_power_up(cdns_phy);
> > > +             if (ret < 0)
> > > +                     return ret;
> > > +
> > > +             hdptx_dp_aux_cfg(cdns_phy);
> > 
> > Why? Don't power up the PHY if you haven't been told to.
> 
> Power on the PHY to enable DP AUX, which is necessary for reading EDID and training the link.

Call phy_power_on() from the DP driver.

> 
> > 
> > > +     } else if (mode != PHY_MODE_HDMI) {
> > > +             dev_err(&phy->dev, "Invalid PHY mode: %u\n", mode);
> > > +             return -EINVAL;
> > > +     }
> > > +
> > > +     return ret;
> > > +}
> > > +
> > > +static int cdns_hdptx_hdmi_configure(struct phy *phy,
> > > +                                  union phy_configure_opts
> > *opts)
> > > +{
> > > +     struct cdns_hdptx_phy *cdns_phy = phy_get_drvdata(phy);
> > > +     int ret;
> > > +
> > > +     cdns_phy->hdmi.tmds_char_rate = opts->hdmi.tmds_char_rate;
> > > +
> > > +     /* Check HDMI FW alive before HDMI PHY init */
> > > +     ret = hdptx_phy_check_alive(cdns_phy);
> > > +     if (!ret) {
> > > +             dev_err(cdns_phy->dev, "NO HDMI FW running\n");
> > > +             return -ENXIO;
> > > +     }
> > > +
> > > +     /* Configure PHY */
> > > +     if (hdptx_hdmi_phy_cfg(cdns_phy, cdns_phy->hdmi.tmds_char_rate)
> > < 0) {
> > > +             dev_err(cdns_phy->dev, "failed to set phy pclock\n");
> > > +             return -EINVAL;
> > > +     }
> > > +
> > > +     ret = hdptx_hdmi_phy_power_up(cdns_phy);
> > 
> > it seems to be all over the place :-(
> 
> The PHY has different power-up rules depending on whether it's in DP or HDMI mode. 
> In DP mode, it needs to power up first to enable DP AUX. 
> In HDMI mode, it can power up last.

The main question is why are you powering the PHY from the configure
path at all? There is a phy_power_on() API which should be used by your
HDMI / DP driver instead of handling that in an automagic way.

> 

-- 
With best wishes
Dmitry

