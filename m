Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDB0108B8EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 10:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yA/ZUMIOO9B2dYwhWxGB0bwnGaA3YTXVMCz1BzpIZuA=; b=j72AqT2bMf1E2yw2PHkRh4T33y
	ob35Z8AtxEsp/sazWyogzFPEVnRGfavAcCQxRZxq2jH3N5F7URuZugJaKNdOV5dPqgM3KsjxVCk4E
	gLIoiuYHDOV8aCBBG6pv7rqhkABmWJFUZzZqJi3JUjquSlYIJ/26yBfEEQPr6tmFvu8ne+vuL9y9q
	jLWebnfjQuCLCECyoFQ7QO23/miECnRVPM/JdSHlmEuvWi6GYD+S1UpuLGwl0WzKqwCBkikad2syu
	otVdO+EtrZZkfJkZp4Xxoz+rLost32eszVUM6wfwPv1likzXs3jPWGogky8gvvtzqDup8LqQ3yTci
	ghya9aIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Wtw-0000000CZN4-3sMo;
	Fri, 20 Mar 2026 10:16:20 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Wtu-0000000CZM0-3ArI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 10:16:20 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id CAD2B8D4;
	Fri, 20 Mar 2026 11:15:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774001702;
	bh=4tf3lo69WL/dl89+RrtD2T1YsCauaHjQmmzMHQKmpw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bjcH4c2h8SnvGzAtxtqtIVEAj4ouyVJmWt6aTY+bb3ZSey/hvCi1q8kBTqUvV5PjZ
	 SvzqMTOdRzAwinRWOXs5qf0+FmATjElfFRLzjx8o/RDbZf6hkeUyQzHI5AvnMdZGly
	 iPC9uT3cnsFeykIERcT3GZvunj4xTkNCBNyIAo28=
Date: Fri, 20 Mar 2026 12:16:14 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-media@vger.kernel.org, linux-hardening@vger.kernel.org,
	gustavoars@kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: nxp: imx8-isi: remove kzalloc_objs
Message-ID: <20260320101614.GA950194@killaraus.ideasonboard.com>
References: <20260306044536.149204-1-rosenp@gmail.com>
 <20260319220901.GD950375@killaraus.ideasonboard.com>
 <CAKxU2N856yYXURRf3td-_RCpe9hyX=zAy3qtD3ki23RjgO+a4Q@mail.gmail.com>
 <20260320005737.GE950244@killaraus.ideasonboard.com>
 <CAKxU2N81WEMkAPOVRHUORWodc21oW7wqvUJYVhd3uBJdLxRW4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKxU2N81WEMkAPOVRHUORWodc21oW7wqvUJYVhd3uBJdLxRW4w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_031619_081872_0BDDF5C2 
X-CRM114-Status: GOOD (  35.59  )
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

On Thu, Mar 19, 2026 at 06:06:07PM -0700, Rosen Penev wrote:
> On Thu, Mar 19, 2026 at 5:57 PM Laurent Pinchart wrote:
> > On Thu, Mar 19, 2026 at 05:11:22PM -0700, Rosen Penev wrote:
> > > On Thu, Mar 19, 2026 at 3:09 PM Laurent Pinchart wrote:
> > > > On Thu, Mar 05, 2026 at 08:45:36PM -0800, Rosen Penev wrote:
> > > > > Use a flexible arraay member to combine allocations.
> > > > >
> > > > > It looks like pipes never gets freed anywhere. Meaning this effectively
> > > > > fixes a memory leak.
> > > > >
> > > > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > > > ---
> > > > >  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 11 ++++-------
> > > > >  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h |  3 ++-
> > > > >  2 files changed, 6 insertions(+), 8 deletions(-)
> > > > >
> > > > > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > > > > index 16392420903a..657ffecc4d7e 100644
> > > > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > > > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > > > > @@ -459,25 +459,21 @@ static const struct dev_pm_ops mxc_isi_pm_ops = {
> > > > >
> > > > >  static int mxc_isi_probe(struct platform_device *pdev)
> > > > >  {
> > > > > +     const struct mxc_isi_plat_data *pdata;
> > > > >       struct device *dev = &pdev->dev;
> > > > >       struct mxc_isi_dev *isi;
> > > > >       unsigned int dma_size;
> > > > >       unsigned int i;
> > > > >       int ret = 0;
> > > > >
> > > > > -     isi = devm_kzalloc(dev, sizeof(*isi), GFP_KERNEL);
> > > > > +     pdata = of_device_get_match_data(dev);
> > > > > +     isi = devm_kzalloc(dev, struct_size(isi, pipes, pdata->num_channels), GFP_KERNEL);
> > > > >       if (!isi)
> > > > >               return -ENOMEM;
> > > > >
> > > > >       isi->dev = dev;
> > > > >       platform_set_drvdata(pdev, isi);
> > > > >
> > > > > -     isi->pdata = of_device_get_match_data(dev);
> > > >
> > > > I'd keep
> > > >
> > > >         isi->pdata = pdata;
> > > >
> > > > here and not below.
> > >
> > > Sure
> > >
> > > > > -
> > > > > -     isi->pipes = kzalloc_objs(isi->pipes[0], isi->pdata->num_channels);
> > > >
> > > > Wouldn't it be simpler to just replace this with devm_kcalloc() ?
> > >
> > > That would only make sense if pipes remained a pointer. A flex array
> > > member allows combining allocations since it doesn't take up extra
> > > space.
> >
> > Yes, I understand that. My point was that with devm_kzalloc() here you
> > won't need to change the mxc_isi_dev structure. The leak fix will be a
> > one-liner patch.
> 
> Leak fix is not the point of the patch to be fair.

If I understand correctly, your main point is to combine two
allocations.

I don't liek this much in this specific case. mxc_isi_dev is the
top-level driver structure. As part of all the data it stores, there
is a pointer to a dynamically-allocated array, and the current
implementation happens to not have any other dynamically allocated
member. That is however not an intrinsic property of the mxc_isi_dev
structure. Treating pipes as a flex arrat within mxc_isi_dev won't scale
to a second similar member, and there's no reason to treat pipes in a
special way. I prefer fixing the leak and avoiding the flex array.

> > > Technically kzalloc_flex is simpler but I assume a devm version of
> > > that will be handled in another treewide commit.
> > > >
> > > >         isi->pipes = devm_kcalloc(dev, isi->pdata->num_channels,
> > > >                                   sizeof(isi->pipes[0]), GFP_KERNEL);
> > > >
> > > > No other change would be needed.
> > >
> > > With a flex array member, that's a compile time error, which I use as
> > > a hint to complete the conversion.
> > >
> > > > > -     if (!isi->pipes)
> > > > > -             return -ENOMEM;
> > > > > -
> > > > >       isi->num_clks = devm_clk_bulk_get_all(dev, &isi->clks);
> > > > >       if (isi->num_clks < 0)
> > > > >               return dev_err_probe(dev, isi->num_clks, "Failed to get clocks\n");
> > > > > @@ -487,6 +483,7 @@ static int mxc_isi_probe(struct platform_device *pdev)
> > > > >               return dev_err_probe(dev, PTR_ERR(isi->regs),
> > > > >                                    "Failed to get ISI register map\n");
> > > > >
> > > > > +     isi->pdata = pdata;
> > > > >       if (isi->pdata->gasket_ops) {
> > > > >               isi->gasket = syscon_regmap_lookup_by_phandle(dev->of_node,
> > > > >                                                             "fsl,blk-ctrl");
> > > > > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > > > > index 3cbd35305af0..99532efa4e41 100644
> > > > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > > > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > > > > @@ -286,7 +286,6 @@ struct mxc_isi_dev {
> > > > >       struct regmap                   *gasket;
> > > > >
> > > > >       struct mxc_isi_crossbar         crossbar;
> > > > > -     struct mxc_isi_pipe             *pipes;
> > > > >       struct mxc_isi_m2m              m2m;
> > > > >
> > > > >       struct media_device             media_dev;
> > > > > @@ -294,6 +293,8 @@ struct mxc_isi_dev {
> > > > >       struct v4l2_async_notifier      notifier;
> > > > >
> > > > >       struct dentry                   *debugfs_root;
> > > > > +
> > > > > +     struct mxc_isi_pipe             pipes[];
> > > > >  };
> > > > >
> > > > >  extern const struct mxc_gasket_ops mxc_imx8_gasket_ops;

-- 
Regards,

Laurent Pinchart

