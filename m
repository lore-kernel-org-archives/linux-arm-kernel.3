Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B94C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 14:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=td+o7bx22dtd1Em7PhFhrUTHDWnYnkNSG54NJMx6qEk=; b=OJ0rS18zcACelkQwggUB4cnI9P
	kEkFx46E78eGnioDfqyI1NCYOkj7XETLLi7Ee5jL1J+gQ0LELNPrxX7DSQ4p3O6UohE8b67JTm4xw
	1W9GZbWBsvxBp2CWzF14QeXDV/GAyRIf5j9Y+JnhbaXsV96neZMI7mzXKU9xyoxO1FTClJV9w/RE6
	RxMjFRiIIY6SJF0H5nqebz6aoR4eZXLDQVu68NZNB1gzdxvI2MAUa/MCkVOfvxbxCWGx223xIYgWj
	/T84rG15Dcm0sw5WuVI8zDNJDHHEbxycIqppHbrPVigzwLwu3z/iiZEVXE/DM6Jx1s6k/4GM/bUGn
	tBNgrq/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTi4r-0000000329O-2RcU;
	Mon, 23 Jun 2025 14:23:17 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfe1-00000002YS1-0i3c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 11:47:26 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B07C2198D;
	Mon, 23 Jun 2025 13:47:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750679221;
	bh=oHIQGmhVZk1bws7ooyBVG45/Q0gIQsMf18p3cWsR55Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bnO4gPuNBRCiyLmakXSRcFDiwdhL4FGmCD3/CF2YxwUjHyDOFd/uaOn5dYBqvaFTk
	 bzzZyvDeqxO0ftEUIKTgViC3lylvEzfyf+XTjhROhYB+inUyHKlSjJaZaIWRtIYTZy
	 OdjH/PzrwzCKQ3lHlwC11awVPI0dYDESYbEHllww=
Date: Mon, 23 Jun 2025 14:46:58 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda Delgado <ribalda@kernel.org>
Cc: =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH RESEND v4 3/5] media: i2c: imx214: Make use of CCS PLL
 calculator
Message-ID: <20250623114658.GB32376@pendragon.ideasonboard.com>
References: <20250621-imx214_ccs_pll-v4-0-12178e5eb989@apitzsch.eu>
 <20250621-imx214_ccs_pll-v4-3-12178e5eb989@apitzsch.eu>
 <20250621181751.GA9125@pendragon.ideasonboard.com>
 <ed0b8fe3a20111477cafb1de7b399afb99caaa0c.camel@apitzsch.eu>
 <20250622171320.GA826@pendragon.ideasonboard.com>
 <CAPybu_2WF=t4jnwsrTSCiSZ4T7Sck4-fCoub33=P_6KvdZ5ePg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPybu_2WF=t4jnwsrTSCiSZ4T7Sck4-fCoub33=P_6KvdZ5ePg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_044725_352025_2EF4C831 
X-CRM114-Status: GOOD (  57.05  )
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

Hi Ricardo,

On Mon, Jun 23, 2025 at 11:31:17AM +0200, Ricardo Ribalda Delgado wrote:
> On Sun, Jun 22, 2025 at 7:13 PM Laurent Pinchart wrote:
> > On Sun, Jun 22, 2025 at 05:34:56PM +0200, André Apitzsch wrote:
> > > Am Samstag, dem 21.06.2025 um 21:17 +0300 schrieb Laurent Pinchart:
> > > > On Sat, Jun 21, 2025 at 11:37:27AM +0200, André Apitzsch via B4 Relay wrote:
> > > > > From: André Apitzsch <git@apitzsch.eu>
> > > > >
> > > > > Calculate PLL parameters based on clock frequency and link
> > > > > frequency.
> > > > >
> > > > > Acked-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > > Signed-off-by: André Apitzsch <git@apitzsch.eu>
> > > > > ---
> > > > >  drivers/media/i2c/Kconfig  |   1 +
> > > > >  drivers/media/i2c/imx214.c | 213 ++++++++++++++++++++++++++++++++++++---------
> > > > >  2 files changed, 175 insertions(+), 39 deletions(-)
> > > > >
> > > > > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > > > > index
> > > > > e68202954a8fd4711d108cf295d5771246fbc406..08db8abeea218080b0bf5bfe6
> > > > > cf82f1c0b100c4a 100644
> > > > > --- a/drivers/media/i2c/Kconfig
> > > > > +++ b/drivers/media/i2c/Kconfig
> > > > > [..]
> > > > > @@ -1224,42 +1336,52 @@ static int imx214_parse_fwnode(struct
> > > > > device *dev)
> > > > >   if (!endpoint)
> > > > >   return dev_err_probe(dev, -EINVAL, "endpoint node not found\n");
> > > > >
> > > > > - ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &bus_cfg);
> > > > > + bus_cfg->bus_type = V4L2_MBUS_CSI2_DPHY;
> > > > > + ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, bus_cfg);
> > > > > + fwnode_handle_put(endpoint);
> > > >
> > > > ... drop this. Up to you.
> > > >
> > > > >   if (ret) {
> > > > >   dev_err_probe(dev, ret, "parsing endpoint node failed\n");
> > > > > - goto done;
> > > > > + goto error;
> > > >
> > > > You can return ret here.
> > > >
> > > > >   }
> > > > >
> > > > >   /* Check the number of MIPI CSI2 data lanes */
> > > > > - if (bus_cfg.bus.mipi_csi2.num_data_lanes != 4) {
> > > > > + if (bus_cfg->bus.mipi_csi2.num_data_lanes != 4) {
> > > > >   ret = dev_err_probe(dev, -EINVAL,
> > > > >       "only 4 data lanes are currently supported\n");
> > > > > - goto done;
> > > > > + goto error;
> > > > >   }
> > > > >
> > > > > - if (bus_cfg.nr_of_link_frequencies != 1)
> > > > > + if (bus_cfg->nr_of_link_frequencies != 1)
> > > > >   dev_warn(dev, "Only one link-frequency supported, please review
> > > > > your DT. Continuing anyway\n");
> > > >
> > > > Now that the driver can calculate PLL parameters dynamically, it
> > > > would be nice to lift this restriction and make the link frequency
> > > > control writable, in a separate patch on top of this series.
> > >
> > > Maybe this could be postponed, as I don't have any use for it at the
> > > moment and I don't want to further delay this series.
> >
> > When I said "on top", I didn't mean in a new version of this series. We
> > can merge this first, and then lift this restriction. I don't have an
> > imx214-based device so I can't do it myself and test it :-/
> >
> > > > > - for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++) {
> > > > > - if (bus_cfg.link_frequencies[i] == IMX214_DEFAULT_LINK_FREQ)
> > > > > + for (i = 0; i < bus_cfg->nr_of_link_frequencies; i++) {
> > > > > + u64 freq = bus_cfg->link_frequencies[i];
> > > > > + struct ccs_pll pll;
> > > > > +
> > > > > + if (!imx214_pll_calculate(imx214, &pll, freq))
> > > > >   break;
> > > > > - if (bus_cfg.link_frequencies[i] ==
> > > > > -     IMX214_DEFAULT_LINK_FREQ_LEGACY) {
> > > > > + if (freq == IMX214_DEFAULT_LINK_FREQ_LEGACY) {
> > > > >   dev_warn(dev,
> > > > >   "link-frequencies %d not supported, please review your DT.
> > > > > Continuing anyway\n",
> > > > >   IMX214_DEFAULT_LINK_FREQ);
> > > > > + freq = IMX214_DEFAULT_LINK_FREQ;
> > > > > + if (imx214_pll_calculate(imx214, &pll, freq))
> > > > > + continue;
> > > > > + bus_cfg->link_frequencies[i] = freq;
> > > > >   break;
> > > > >   }
> > > >
> > > > How about separating the IMX214_DEFAULT_LINK_FREQ_LEGACY check from
> > > > the PLL calculation ? Something like
> > > >
> > > >  u64 freq = bus_cfg->link_frequencies[i];
> > > >  struct ccs_pll pll;
> > > >
> > > >  if (freq == IMX214_DEFAULT_LINK_FREQ_LEGACY) {
> > > >  dev_warn(dev,
> > > >  "link-frequencies %d not supported, please review your DT.
> > > > Continuing anyway\n",
> > > >  IMX214_DEFAULT_LINK_FREQ);
> > > >  freq = IMX214_DEFAULT_LINK_FREQ;
> > > >  bus_cfg->link_frequencies[i] = freq;
> > > >  }
> > >
> > > With PLL calculation, 480000000 (=IMX214_DEFAULT_LINK_FREQ_LEGACY)
> > > might be a valid link frequency explicitly set by the user. I'm not
> > > sure whether it is a good idea to overwrite the link frequency, before
> > > trying the PLL calculation. That's why I would keep the code the way it
> > > is.
> >
> > The current code accepts both IMX214_DEFAULT_LINK_FREQ (600 MHz) and
> > IMX214_DEFAULT_LINK_FREQ_LEGACY (400 MHz), and programs the PLL with (as
> > far as I understand) a 600 MHz clock frequency in either case. To avoid
> > a change in behaviour, I think overriding the 400 MHz frequency with 600
> > MHz in this patch would be best. We could then drop that in a later
> > patch, possibly by patching the clock frequency in a platform-specific
> > driver instead of the imx214 driver.
> >
> > > >  if (!imx214_pll_calculate(imx214, &pll, freq))
> > > >  break;
> > > >
> > > > It will then become easier to drop this legacy support from the
> > > > driver. What platform(s) are know to specify an incorrect link
> > > > frequency ?
> > >
> > > I don't know.
> >
> > Ricardo, do you have any information about this ?
> 
> This was for a development platform for Qualcomm, think of a pizero
> like, but with a Snapdragon device.
> 
> There was a Qtechnology product based on that platform. I asked them
> if they could provide me a device for testing, but it has been
> discontinued and  replaced with something better.
> 
> We can start to deprecate the clock quirk if you want.

That would be great. Thanks for the confirmation.

By deprecate, do you mean first printing a message for a few kernel
releases, or can we just drop it in the next version of this patch ?

> > > > >   }
> > > > >
> > > > > - if (i == bus_cfg.nr_of_link_frequencies)
> > > > > + if (i == bus_cfg->nr_of_link_frequencies)
> > > > >   ret = dev_err_probe(dev, -EINVAL,
> > > > > -     "link-frequencies %d not supported, please review your DT\n",
> > > > > -     IMX214_DEFAULT_LINK_FREQ);
> > > > > +     "link-frequencies %lld not supported, please review your
> > > > > DT\n",
> > > > > +     bus_cfg->nr_of_link_frequencies ?
> > > > > +     bus_cfg->link_frequencies[0] : 0);
> > > > >
> > > > > -done:
> > > > > - v4l2_fwnode_endpoint_free(&bus_cfg);
> > > > > - fwnode_handle_put(endpoint);
> > > > > + return 0;
> > > > > +
> > > > > +error:
> > > > > + v4l2_fwnode_endpoint_free(&imx214->bus_cfg);
> > > > >   return ret;
> > > > >  }
> > > > >
> > > > > @@ -1299,7 +1421,7 @@ static int imx214_probe(struct i2c_client
> > > > > *client)
> > > > >   return dev_err_probe(dev, PTR_ERR(imx214->regmap),
> > > > >        "failed to initialize CCI\n");
> > > > >
> > > > > - ret = imx214_parse_fwnode(dev);
> > > > > + ret = imx214_parse_fwnode(dev, imx214);
> > > > >   if (ret)
> > > > >   return ret;
> > > > >
> > > > > @@ -1310,7 +1432,9 @@ static int imx214_probe(struct i2c_client
> > > > > *client)
> > > > >   * Enable power initially, to avoid warnings
> > > > >   * from clk_disable on power_off
> > > > >   */
> > > > > - imx214_power_on(imx214->dev);
> > > > > + ret = imx214_power_on(imx214->dev);
> > > > > + if (ret < 0)
> > > > > + goto error_fwnode;
> > > >
> > > > This change seems to belong to a separate patch.
> > > >
> > > > >
> > > > >   ret = imx214_identify_module(imx214);
> > > > >   if (ret)
> > > > > @@ -1341,6 +1465,12 @@ static int imx214_probe(struct i2c_client
> > > > > *client)
> > > > >   pm_runtime_set_active(imx214->dev);
> > > > >   pm_runtime_enable(imx214->dev);
> > > > >
> > > > > + ret = imx214_pll_update(imx214);
> > > > > + if (ret < 0) {
> > > > > + dev_err_probe(dev, ret, "failed to update PLL\n");
> > > > > + goto error_subdev_cleanup;
> > > > > + }
> > > >
> > > > I would move this to imx214_ctrls_init().
> > > >
> > > > > +
> > > > >   ret = v4l2_async_register_subdev_sensor(&imx214->sd);
> > > > >   if (ret < 0) {
> > > > >   dev_err_probe(dev, ret,
> > > > > @@ -1366,6 +1496,9 @@ static int imx214_probe(struct i2c_client
> > > > > *client)
> > > > >  error_power_off:
> > > > >   imx214_power_off(imx214->dev);
> > > > >
> > > > > +error_fwnode:
> > > > > + v4l2_fwnode_endpoint_free(&imx214->bus_cfg);
> > > > > +
> > > > >   return ret;
> > > > >  }
> > > > >
> > > > > @@ -1378,6 +1511,8 @@ static void imx214_remove(struct i2c_client
> > > > > *client)
> > > > >   v4l2_subdev_cleanup(sd);
> > > > >   media_entity_cleanup(&imx214->sd.entity);
> > > > >   v4l2_ctrl_handler_free(&imx214->ctrls);
> > > > > + v4l2_fwnode_endpoint_free(&imx214->bus_cfg);
> > > > > +
> > > > >   pm_runtime_disable(&client->dev);
> > > > >   if (!pm_runtime_status_suspended(&client->dev)) {
> > > > >   imx214_power_off(imx214->dev);

-- 
Regards,

Laurent Pinchart

