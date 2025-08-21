Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A4C9CA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 00:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GdEsdo3iE77nKNeGnZ2MflkAZ5tcIErszAbSPhrP5A4=; b=c0sCEsRpdtBjQUD0FE+Pbz/zPN
	3t23EXxb5RBY8yOXeNvgyoPxSXVWFRTYMqF9OAzm+XbiwHiE7bGBg9bROyoG5sjgcxpZHV+FjuwZQ
	ATUnYeQSHqSB75DPHCYKcmpPoVZP9S52J0aa4ABu0FNZA7Y6bSSX/BSJL5juxrMuxz/Dpk7lmktyy
	eI6iNqrSm0Dv7dUJybDa8wWm49wsE1Uo5NgKVz4GeKC1onxBlc2gwRsGnKqjIhDR385LMgq3AyCWr
	8iPRBbBFUYqSjX6nDAV6zj1Vsja9aLimI55ZzeACkURGUV/AxKslRmPBqV/k+GVw/dOYyMoMD0N5/
	rfzmM61A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFcU-000000011WN-15E8;
	Fri, 22 Aug 2025 00:27:02 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up8Be-0000000HY41-2rwl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 16:30:51 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D37FE250;
	Thu, 21 Aug 2025 18:29:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755793790;
	bh=DybIH97wxyFrWaVoyca351mEX4CtxWYW6vGgJXt/2jE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=taL2TKZMwaPfZvu4Fwbe5D3AaohYPihTfYr+STon/G6hCmtrK9TXM6SIQJ2i7db2Q
	 4GLIFcfIw5yzEazmidXD7CtJPQxxdAuanRRdeF6sDZBWDRKtC8rUQdYYJFZHEnl57w
	 m/dEhKys8DKcxqYZkIe32yyPSn+18yzbwjWkJ9VE=
Date: Thu, 21 Aug 2025 19:30:25 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-media@vger.kernel.org, Isaac Scott <isaac.scott@ideasonboard.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 11/12] media: imx-mipi-csis: Initial support for
 multiple output channels
Message-ID: <20250821163025.GB29629@pendragon.ideasonboard.com>
References: <20250821000944.27849-1-laurent.pinchart@ideasonboard.com>
 <20250821000944.27849-12-laurent.pinchart@ideasonboard.com>
 <aKdBu9AQfwxl8b4I@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aKdBu9AQfwxl8b4I@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_093050_867157_981CD4D6 
X-CRM114-Status: GOOD (  38.96  )
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

On Thu, Aug 21, 2025 at 11:56:43AM -0400, Frank Li wrote:
> On Thu, Aug 21, 2025 at 03:09:43AM +0300, Laurent Pinchart wrote:
> > Some CSIS instances feature more than one output channel. Update
> > register macros accordingly, parse the number of channels from the
> > device tree, and update register dumps and event counters to log
> > per-channel data.
> >
> > Support for routing virtual channels and data types to output channels
> > through the subdev internal routing API will come later.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > Changes since v1:
> >
> > - Update more per-channel registers
> > - Update commit message
> > ---
> >  drivers/media/platform/nxp/imx-mipi-csis.c | 239 +++++++++++++--------
> >  1 file changed, 152 insertions(+), 87 deletions(-)
> >
> > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> > index 83ba68a20bd1..b1136336a57f 100644
> > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > @@ -54,7 +54,7 @@
> >
> ...
> >
> > +	{ false, 0, MIPI_CSIS_INT_SRC_FRAME_START(0),		"Frame Start 0" },
> > +	{ false, 1, MIPI_CSIS_INT_SRC_FRAME_START(1),		"Frame Start 1" },
> > +	{ false, 2, MIPI_CSIS_INT_SRC_FRAME_START(2),		"Frame Start 2" },
> > +	{ false, 3, MIPI_CSIS_INT_SRC_FRAME_START(3),		"Frame Start 3" },
> > +	{ false, 0, MIPI_CSIS_INT_SRC_FRAME_END(0),		"Frame End 0" },
> > +	{ false, 1, MIPI_CSIS_INT_SRC_FRAME_END(1),		"Frame End 1" },
> > +	{ false, 2, MIPI_CSIS_INT_SRC_FRAME_END(2),		"Frame End 2" },
> > +	{ false, 3, MIPI_CSIS_INT_SRC_FRAME_END(3),		"Frame End 3" },
> > +	{ true, 0, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL(0),	"VSYNC Falling Edge 0" },
> > +	{ true, 1, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL(1),	"VSYNC Falling Edge 1" },
> > +	{ true, 2, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL(2),	"VSYNC Falling Edge 2" },
> > +	{ true, 3, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL(3),	"VSYNC Falling Edge 3" },
> > +	{ true, 0, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE(0),	"VSYNC Rising Edge 0" },
> > +	{ true, 1, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE(1),	"VSYNC Rising Edge 1" },
> > +	{ true, 2, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE(2),	"VSYNC Rising Edge 2" },
> > +	{ true, 3, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE(3),	"VSYNC Rising Edge 3" },
> >  };
> >
> > -#define MIPI_CSIS_NUM_EVENTS ARRAY_SIZE(mipi_csis_events)
> > +#define MIPI_CSIS_NUM_EVENTS		ARRAY_SIZE(mipi_csis_events)
> 
> unneccesary change for this patch

It's meant to have the same alignment as the next line.

> > +#define MIPI_CSIS_NUM_ERROR_EVENTS	(MIPI_CSIS_NUM_EVENTS - 20)
> >
> >  enum mipi_csis_clk {
> >  	MIPI_CSIS_CLK_PCLK,
> > @@ -300,7 +334,9 @@ struct mipi_csis_device {
> >  	struct clk_bulk_data *clks;
> >  	struct reset_control *mrst;
> >  	struct regulator *mipi_phy_regulator;
> > +
> >  	const struct mipi_csis_info *info;
> > +	unsigned int num_channels;
> >
> >  	struct v4l2_subdev sd;
> >  	struct media_pad pads[CSIS_PADS_NUM];
> > @@ -655,8 +691,8 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
> >  			MIPI_CSIS_ISP_SYNC_VSYNC_EINTV(0));
> >
> >  	val = mipi_csis_read(csis, MIPI_CSIS_CLK_CTRL);
> > -	val |= MIPI_CSIS_CLK_CTRL_WCLK_SRC;
> > -	val |= MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL_CH0(15);
> > +	val |= MIPI_CSIS_CLK_CTRL_WCLK_SRC(0);
> > +	val |= MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL(0, 15);
> >  	val &= ~MIPI_CSIS_CLK_CTRL_CLKGATE_EN_MSK;
> >  	mipi_csis_write(csis, MIPI_CSIS_CLK_CTRL, val);
> >
> > @@ -673,7 +709,7 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
> >  	/* Update the shadow register. */
> >  	val = mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
> >  	mipi_csis_write(csis, MIPI_CSIS_CMN_CTRL,
> > -			val | MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW |
> > +			val | MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW(0) |
> >  			MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW_CTRL);
> >  }
> >
> > @@ -764,16 +800,19 @@ static irqreturn_t mipi_csis_irq_handler(int irq, void *dev_id)
> >
> >  	/* Update the event/error counters */
> >  	if ((status & MIPI_CSIS_INT_SRC_ERRORS) || csis->debug.enable) {
> > -		for (i = 0; i < MIPI_CSIS_NUM_EVENTS; i++) {
> > +		for (i = 0; i < ARRAY_SIZE(csis->events); i++) {
> 
> This is nice change, but I think it is not related with this patch. May
> need sperate patch.

I think a separate patch just for this one-line change would be
overkill. Given that this patch touches event reporting, I'd rather keep
this here.

> >  			struct mipi_csis_event *event = &csis->events[i];
> >
> > +			if (event->channel >= csis->num_channels)
> > +				continue;
> > +
> >  			if ((!event->debug && (status & event->mask)) ||
> >  			    (event->debug && (dbg_status & event->mask)))
> >  				event->counter++;
> >  		}
> >  	}
> >
> > -	if (status & MIPI_CSIS_INT_SRC_FRAME_START)
> > +	if (status & MIPI_CSIS_INT_SRC_FRAME_START(0))
> >  		mipi_csis_queue_event_sof(csis);
> >
> >  	spin_unlock_irqrestore(&csis->slock, flags);
> > @@ -850,7 +889,7 @@ static void mipi_csis_clear_counters(struct mipi_csis_device *csis)
> >  static void mipi_csis_log_counters(struct mipi_csis_device *csis, bool non_errors)
> >  {
> >  	unsigned int num_events = non_errors ? MIPI_CSIS_NUM_EVENTS
> > -				: MIPI_CSIS_NUM_EVENTS - 8;
> > +				: MIPI_CSIS_NUM_ERROR_EVENTS;
> 
> I think old code logic is strange. err events is not last trail of events
> array. when non_errors false, only last 8 events have not logs.

The error events are at the beginning of the array, and before this
change there was 8 non-error events at the end. The code would log
either all events, or just the error events (all minus the last 8).

> 
> And I found all place call mipi_csis_log_counters(, true) in whole driver.

Indeed. I wonder why. Looking at the code, I think we should only log
non-error counters when csis->debug.enable is set. That's a candidate
for a separate patch.

> >  	unsigned int counters[MIPI_CSIS_NUM_EVENTS];
> >  	unsigned long flags;
> >  	unsigned int i;
> > @@ -861,45 +900,67 @@ static void mipi_csis_log_counters(struct mipi_csis_device *csis, bool non_error
> >  	spin_unlock_irqrestore(&csis->slock, flags);
> >
> >  	for (i = 0; i < num_events; ++i) {
> > +		const struct mipi_csis_event *event = &csis->events[i];
> > +
> > +		if (event->channel >= csis->num_channels)
> > +			continue;
> > +
> >  		if (counters[i] > 0 || csis->debug.enable)
> >  			dev_info(csis->dev, "%s events: %d\n",
> > -				 csis->events[i].name,
> > -				 counters[i]);
> > +				 event->name, counters[i]);
> >  	}
> >  }
> >
> > +struct mipi_csis_reg_info {
> > +	u32 addr;
> > +	unsigned int offset;
> > +	const char * const name;
> > +};
> > +
> > +static void mipi_csis_dump_channel_reg(struct mipi_csis_device *csis,
> > +				       const struct mipi_csis_reg_info *reg,
> > +				       unsigned int channel)
> > +{
> > +	dev_info(csis->dev, "%16s%u: 0x%08x\n", reg->name, channel,
> > +		 mipi_csis_read(csis, reg->addr + channel * reg->offset));
> > +}
> > +
> >  static int mipi_csis_dump_regs(struct mipi_csis_device *csis)
> >  {
> > -	static const struct {
> > -		u32 offset;
> > -		const char * const name;
> > -	} registers[] = {
> > -		{ MIPI_CSIS_CMN_CTRL, "CMN_CTRL" },
> > -		{ MIPI_CSIS_CLK_CTRL, "CLK_CTRL" },
> > -		{ MIPI_CSIS_INT_MSK, "INT_MSK" },
> > -		{ MIPI_CSIS_DPHY_STATUS, "DPHY_STATUS" },
> > -		{ MIPI_CSIS_DPHY_CMN_CTRL, "DPHY_CMN_CTRL" },
> > -		{ MIPI_CSIS_DPHY_SCTRL_L, "DPHY_SCTRL_L" },
> > -		{ MIPI_CSIS_DPHY_SCTRL_H, "DPHY_SCTRL_H" },
> > -		{ MIPI_CSIS_ISP_CONFIG_CH(0), "ISP_CONFIG_CH0" },
> > -		{ MIPI_CSIS_ISP_RESOL_CH(0), "ISP_RESOL_CH0" },
> > -		{ MIPI_CSIS_SDW_CONFIG_CH(0), "SDW_CONFIG_CH0" },
> > -		{ MIPI_CSIS_SDW_RESOL_CH(0), "SDW_RESOL_CH0" },
> > -		{ MIPI_CSIS_DBG_CTRL, "DBG_CTRL" },
> > -		{ MIPI_CSIS_FRAME_COUNTER_CH(0), "FRAME_COUNTER_CH0" },
> > +	static const struct mipi_csis_reg_info common_registers[] = {
> > +		{ MIPI_CSIS_CMN_CTRL, 0, "CMN_CTRL" },
> > +		{ MIPI_CSIS_CLK_CTRL, 0, "CLK_CTRL" },
> > +		{ MIPI_CSIS_INT_MSK, 0, "INT_MSK" },
> > +		{ MIPI_CSIS_DPHY_STATUS, 0, "DPHY_STATUS" },
> > +		{ MIPI_CSIS_DPHY_CMN_CTRL, 0, "DPHY_CMN_CTRL" },
> > +		{ MIPI_CSIS_DPHY_SCTRL_L, 0, "DPHY_SCTRL_L" },
> > +		{ MIPI_CSIS_DPHY_SCTRL_H, 0, "DPHY_SCTRL_H" },
> > +		{ MIPI_CSIS_DBG_CTRL, 0, "DBG_CTRL" },
> > +	};
> > +	static const struct mipi_csis_reg_info channel_registers[] = {
> > +		{ MIPI_CSIS_ISP_CONFIG_CH(0), 0x10, "ISP_CONFIG_CH" },
> > +		{ MIPI_CSIS_ISP_RESOL_CH(0), 0x10, "ISP_RESOL_CH" },
> > +		{ MIPI_CSIS_SDW_CONFIG_CH(0), 0x10, "SDW_CONFIG_CH" },
> > +		{ MIPI_CSIS_SDW_RESOL_CH(0), 0x10, "SDW_RESOL_CH" },
> > +		{ MIPI_CSIS_FRAME_COUNTER_CH(0), 4, "FRAME_COUNTER_CH" },
> >  	};
> > -
> > -	unsigned int i;
> > -	u32 cfg;
> >
> >  	if (!pm_runtime_get_if_in_use(csis->dev))
> >  		return 0;
> >
> >  	dev_info(csis->dev, "--- REGISTERS ---\n");
> >
> > -	for (i = 0; i < ARRAY_SIZE(registers); i++) {
> > -		cfg = mipi_csis_read(csis, registers[i].offset);
> > -		dev_info(csis->dev, "%17s: 0x%08x\n", registers[i].name, cfg);
> > +	for (unsigned int i = 0; i < ARRAY_SIZE(common_registers); i++) {
> > +		const struct mipi_csis_reg_info *reg = &common_registers[i];
> > +
> > +		dev_info(csis->dev, "%17s: 0x%08x\n", reg->name,
> > +			 mipi_csis_read(csis, reg->addr));
> > +	}
> > +
> > +	for (unsigned int chan = 0; chan < csis->num_channels; chan++) {
> > +		for (unsigned int i = 0; i < ARRAY_SIZE(channel_registers); ++i)
> > +			mipi_csis_dump_channel_reg(csis, &channel_registers[i],
> > +						   chan);
> >  	}
> >
> >  	pm_runtime_put(csis->dev);
> > @@ -1422,6 +1483,12 @@ static int mipi_csis_parse_dt(struct mipi_csis_device *csis)
> >
> >  	of_property_read_u32(node, "clock-frequency", &csis->clk_frequency);
> >
> > +	csis->num_channels = 1;
> > +	of_property_read_u32(node, "fsl,num-channels", &csis->num_channels);
> > +	if (csis->num_channels < 1 || csis->num_channels > MIPI_CSIS_MAX_CHANNELS)
> > +		return dev_err_probe(csis->dev, -EINVAL,
> > +				     "Invalid fsl,num-channels value\n");
> > +
> >  	return 0;
> >  }
> >
> > @@ -1445,10 +1512,8 @@ static int mipi_csis_probe(struct platform_device *pdev)
> >
> >  	/* Parse DT properties. */
> >  	ret = mipi_csis_parse_dt(csis);
> > -	if (ret < 0) {
> > -		dev_err(dev, "Failed to parse device tree: %d\n", ret);
> > +	if (ret < 0)
> >  		return ret;
> > -	}
> >
> >  	/* Acquire resources. */
> >  	csis->regs = devm_platform_ioremap_resource(pdev, 0);

-- 
Regards,

Laurent Pinchart

