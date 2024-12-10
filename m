Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95039E77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 14:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1b2CN5KijSQW1PyEx+uqHMLZ82Jfnx81Mjxlq0yFxLw=; b=xW9tqX6OGh4fVaP16QObI99LmR
	tD947AwXTIvg/JOhgnVmmtgvOhGLrFRYBZdgQucLbvXFDA0dctwnjgcllg1Xxx0nCGYhsE105+bB/
	TiSxm5V+mQU1AYCLF3ZUx/QSceDRkkPQlIXSZ1W0HpZARzT7DcqEfBt5vL8QjSBGwPp/Tx7fSII78
	PZoOM2vxeARDPbvU9W6cQGJP53/wymrfwdTqH0RbVdvNXUGmaEd/Zi2ghqDhqlEZqtOei+47PgvWF
	tul/VPRHmz5NXoJ1lNM8wvBmyEJ/beSig2QrUooFO20Xo6jvfotlYl+uE0mivL5g6dkxLE9xdx4Kl
	vtYEZxkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL0oq-0000000BfPU-1dNT;
	Tue, 10 Dec 2024 14:02:32 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL0lu-0000000Bei7-2Wil
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 13:59:31 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-30229d5b22fso16780481fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 05:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733839168; x=1734443968; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1b2CN5KijSQW1PyEx+uqHMLZ82Jfnx81Mjxlq0yFxLw=;
        b=B2Ktb+C09GeW/U/AhzYZnXp33sV4PS0ncIufRbc0Rl3OuXyx91udcij3S5Fi+2nspN
         RVN0LKGYtAjPrdqTSTtF6mwtDPXQ1XnHfRTbT+pILTFFbpytodcNoWrMLEQ6kMnMspoH
         bRWJESRb04ZDX7mr2ILgYUgeWStA8fhkpUSBRQSslgpAhDbrCcQMVfaqQRYliMWU3NOr
         3mZLNlp8aMKTJqtak0W+cY1uR5T29MnjmUhP+Z3nuj7XQ9fxFZpDim1670YH7lR28gq5
         KBhAh4lAiDhSPQRvi4qSHAtiqeKwNfWOGXRX5X3/XPsGeDInWoTW7eMI03E4cgm5YabT
         I41Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733839168; x=1734443968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1b2CN5KijSQW1PyEx+uqHMLZ82Jfnx81Mjxlq0yFxLw=;
        b=e6NVXKZ3RHvVqePDyHfysGFRHTXfrkDP7Y1gfmgkcEdWZDBrwhMpWcEHIlTmZz3N9g
         yZ3jAUVNhkKF13JsgRBQiVE7SMg+92tNLwEPqXDb6Hn63cWPVsorOAPfYb4dVt77FlGD
         lYHtLK+dSaxsTR4sq7tO8k0UzpJDr98hULY8apI85h0h9SB519riD6F7f3g97TtWIQPX
         T4A5+u28pEVe/oY6e6JAVxdmADj+S2OnrbBVVQ6qgLqCQNtJr1jD51sIrP4qTPM6xpzu
         /XDHyAW06LGmEK/bWT2I7opBbYr0HZYc8+w3K+JNtReClkXVQ/Uxf9GpgPeH2gUtyy+o
         7tZw==
X-Forwarded-Encrypted: i=1; AJvYcCXRYiO3RShUI/81B+gjIlTY8N5wEFkSft3LnYTOwEQg/h+nF9GKb4EM7gta6zy+cORViNimYYNlqgDYU+5/WK+s@lists.infradead.org
X-Gm-Message-State: AOJu0YxJOH+/VielH6RTLqrTR4TVJ6+00HfMNFeLt+99kLTEG/NNFzPJ
	2Cn03oQdVxDlKQV2hJH/Ii+9INsEHcbdy5OOAdxUk0X0vKYv+SAs8934wG86r3I=
X-Gm-Gg: ASbGncvmLY/2n1ZtJNghgHO84FpEayMrQl2dwLrtS3rF0L10cZPARLa+9deYB3o3QI0
	1DTO0gr1H0TgwznRyhT9xtRakH/pAbxX6uCDS7YR38MKwcxia7+zdTIvAnOmD3p+Kf3e5ZSDWF9
	IDULYt2f89/vtT7YuNUzO68/5ySi0c70l1u/gFasK2OziZTAcF/zx6AHNvoSNFVnohAWqXi/MOa
	bRm/1/SXkA34GFk0aozxaRiROvHDJKZ8xHSpv3HZKY1/G0HNA/XxCTgL94UScxlEh6MoZ/XYz69
	PuofWjwffs6s3RN7xIlE6IACKQfpIC7P/A==
X-Google-Smtp-Source: AGHT+IGdkjQtYlZTfLzIp6AvgDXHgPosZz1omSRVn2htXRtkRgglyTI/N9ZYTrDiJZmOIRaiPOr3Yg==
X-Received: by 2002:a05:6512:3da3:b0:53f:f074:801c with SMTP id 2adb3069b0e04-54024104977mr1653910e87.41.1733839168101;
        Tue, 10 Dec 2024 05:59:28 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e301cffd8sm1342870e87.204.2024.12.10.05.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 05:59:26 -0800 (PST)
Date: Tue, 10 Dec 2024 15:59:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrej Picej <andrej.picej@norik.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, marex@denx.de, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, upstream@lists.phytec.de
Subject: Re: [PATCH v5 2/3] drm/bridge: ti-sn65dsi83: Add ti,lvds-vod-swing
 optional properties
Message-ID: <qhmsobin3fsmoc7ic2jtancowfscoauyroruxdpwhmqwlogtkz@6by3s2ruwzwp>
References: <20241210091901.83028-1-andrej.picej@norik.com>
 <20241210091901.83028-3-andrej.picej@norik.com>
 <irpmhq7vxjra6vhmdh7p63ajj57n3h2c4br3ija2jmwtoewist@zyxfmx6k5m4e>
 <aa2de99d-21f4-4843-83b7-5d2db78be86f@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa2de99d-21f4-4843-83b7-5d2db78be86f@norik.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_055930_643436_A011F5D9 
X-CRM114-Status: GOOD (  48.18  )
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

On Tue, Dec 10, 2024 at 02:41:01PM +0100, Andrej Picej wrote:
> 
> 
> On 10. 12. 24 12:43, Dmitry Baryshkov wrote:
> > On Tue, Dec 10, 2024 at 10:19:00AM +0100, Andrej Picej wrote:
> > > Add a optional properties to change LVDS output voltage. This should not
> > > be static as this depends mainly on the connected display voltage
> > > requirement. We have three properties:
> > > - "ti,lvds-termination-ohms", which sets near end termination,
> > > - "ti,lvds-vod-swing-data-microvolt" and
> > > - "ti,lvds-vod-swing-clock-microvolt" which both set LVDS differential
> > > output voltage for data and clock lanes. They are defined as an array
> > > with min and max values. The appropriate bitfield will be set if
> > > selected constraints can be met.
> > > 
> > > If "ti,lvds-termination-ohms" is not defined the default of 200 Ohm near
> > > end termination will be used. Selecting only one:
> > > "ti,lvds-vod-swing-data-microvolt" or
> > > "ti,lvds-vod-swing-clock-microvolt" can be done, but the output voltage
> > > constraint for only data/clock lanes will be met. Setting both is
> > > recommended.
> > > 
> > > Signed-off-by: Andrej Picej <andrej.picej@norik.com>
> > > ---
> > > Changes in v5:
> > > - specify default values in sn65dsi83_parse_lvds_endpoint,
> > > - move sn65dsi83_parse_lvds_endpoint for channel B up, outside if,
> > > Changes in v4:
> > > - fix typo in commit message bitfiled -> bitfield
> > > - use arrays (lvds_vod_swing_conf and lvds_term_conf) in private data, instead
> > > of separate variables for channel A/B
> > > - add more checks on return value of "of_property_read_u32_array"
> > > Changes in v3:
> > > - use microvolts for default array values 1000 mV -> 1000000 uV.
> > > Changes in v2:
> > > - use datasheet tables to get the proper configuration
> > > - since major change was done change the authorship to myself
> > > ---
> > >   drivers/gpu/drm/bridge/ti-sn65dsi83.c | 142 +++++++++++++++++++++++++-
> > >   1 file changed, 139 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > > index 57a7ed13f996..f9578b38da28 100644
> > > --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > > @@ -132,6 +132,16 @@
> > >   #define  REG_IRQ_STAT_CHA_SOT_BIT_ERR		BIT(2)
> > >   #define  REG_IRQ_STAT_CHA_PLL_UNLOCK		BIT(0)
> > > +enum sn65dsi83_channel {
> > > +	CHANNEL_A,
> > > +	CHANNEL_B
> > > +};
> > > +
> > > +enum sn65dsi83_lvds_term {
> > > +	OHM_100,
> > > +	OHM_200
> > > +};
> > > +
> > >   enum sn65dsi83_model {
> > >   	MODEL_SN65DSI83,
> > >   	MODEL_SN65DSI84,
> > > @@ -147,6 +157,8 @@ struct sn65dsi83 {
> > >   	struct regulator		*vcc;
> > >   	bool				lvds_dual_link;
> > >   	bool				lvds_dual_link_even_odd_swap;
> > > +	int				lvds_vod_swing_conf[2];
> > > +	int				lvds_term_conf[2];
> > >   };
> > >   static const struct regmap_range sn65dsi83_readable_ranges[] = {
> > > @@ -237,6 +249,36 @@ static const struct regmap_config sn65dsi83_regmap_config = {
> > >   	.max_register = REG_IRQ_STAT,
> > >   };
> > > +static const int lvds_vod_swing_data_table[2][4][2] = {
> > > +	{	/* 100 Ohm */
> > > +		{ 180000, 313000 },
> > > +		{ 215000, 372000 },
> > > +		{ 250000, 430000 },
> > > +		{ 290000, 488000 },
> > > +	},
> > > +	{	/* 200 Ohm */
> > > +		{ 150000, 261000 },
> > > +		{ 200000, 346000 },
> > > +		{ 250000, 428000 },
> > > +		{ 300000, 511000 },
> > > +	},
> > > +};
> > > +
> > > +static const int lvds_vod_swing_clock_table[2][4][2] = {
> > > +	{	/* 100 Ohm */
> > > +		{ 140000, 244000 },
> > > +		{ 168000, 290000 },
> > > +		{ 195000, 335000 },
> > > +		{ 226000, 381000 },
> > > +	},
> > > +	{	/* 200 Ohm */
> > > +		{ 117000, 204000 },
> > > +		{ 156000, 270000 },
> > > +		{ 195000, 334000 },
> > > +		{ 234000, 399000 },
> > > +	},
> > > +};
> > > +
> > >   static struct sn65dsi83 *bridge_to_sn65dsi83(struct drm_bridge *bridge)
> > >   {
> > >   	return container_of(bridge, struct sn65dsi83, bridge);
> > > @@ -435,12 +477,16 @@ static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
> > >   		val |= REG_LVDS_FMT_LVDS_LINK_CFG;
> > >   	regmap_write(ctx->regmap, REG_LVDS_FMT, val);
> > > -	regmap_write(ctx->regmap, REG_LVDS_VCOM, 0x05);
> > > +	regmap_write(ctx->regmap, REG_LVDS_VCOM,
> > > +			REG_LVDS_VCOM_CHA_LVDS_VOD_SWING(ctx->lvds_vod_swing_conf[CHANNEL_A]) |
> > > +			REG_LVDS_VCOM_CHB_LVDS_VOD_SWING(ctx->lvds_vod_swing_conf[CHANNEL_B]));
> > >   	regmap_write(ctx->regmap, REG_LVDS_LANE,
> > >   		     (ctx->lvds_dual_link_even_odd_swap ?
> > >   		      REG_LVDS_LANE_EVEN_ODD_SWAP : 0) |
> > > -		     REG_LVDS_LANE_CHA_LVDS_TERM |
> > > -		     REG_LVDS_LANE_CHB_LVDS_TERM);
> > > +		     (ctx->lvds_term_conf[CHANNEL_A] ?
> > > +			  REG_LVDS_LANE_CHA_LVDS_TERM : 0) |
> > > +		     (ctx->lvds_term_conf[CHANNEL_B] ?
> > > +			  REG_LVDS_LANE_CHB_LVDS_TERM : 0));
> > >   	regmap_write(ctx->regmap, REG_LVDS_CM, 0x00);
> > >   	le16val = cpu_to_le16(mode->hdisplay);
> > > @@ -576,10 +622,100 @@ static const struct drm_bridge_funcs sn65dsi83_funcs = {
> > >   	.atomic_get_input_bus_fmts = sn65dsi83_atomic_get_input_bus_fmts,
> > >   };
> > > +static int sn65dsi83_select_lvds_vod_swing(struct device *dev,
> > > +	u32 lvds_vod_swing_data[2], u32 lvds_vod_swing_clk[2], u8 lvds_term)
> > > +{
> > > +	int i;
> > > +
> > > +	for (i = 0; i <= 3; i++) {
> > > +		if (lvds_vod_swing_data_table[lvds_term][i][0] >= lvds_vod_swing_data[0] &&
> > > +		lvds_vod_swing_data_table[lvds_term][i][1] <= lvds_vod_swing_data[1] &&
> > > +		lvds_vod_swing_clock_table[lvds_term][i][0] >= lvds_vod_swing_clk[0] &&
> > > +		lvds_vod_swing_clock_table[lvds_term][i][1] <= lvds_vod_swing_clk[1])
> > > +			return i;
> > > +	}
> > > +
> > > +	dev_err(dev, "failed to find appropriate LVDS_VOD_SWING configuration\n");
> > > +	return -EINVAL;
> > > +}
> > > +
> > > +static int sn65dsi83_parse_lvds_endpoint(struct sn65dsi83 *ctx, int channel)
> > > +{
> > > +	struct device *dev = ctx->dev;
> > > +	struct device_node *endpoint;
> > > +	int endpoint_reg;
> > > +	/* Set so the property can be freely selected if not defined */
> > > +	u32 lvds_vod_swing_data[2] = { 0, 1000000 };
> > > +	u32 lvds_vod_swing_clk[2] = { 0, 1000000 };
> > > +	u32 lvds_term;
> > > +	u8 lvds_term_conf = 0x1;
> > > +	int lvds_vod_swing_conf = 0x1;
> > 
> > Magic values
> 
> Can you please elaborate.
> 
> I can use:
> u8 lvds_term_conf = OHM_200;
> 
> What about lvds_vod_swing_conf? Should I create additional define for it?
> But this doesn't solve a hidden meaning? Maybe additional comment above?
> Would like to avoid using voltages for it, since then we are reverse
> engineering the table in datasheet to match the default reg value.

I think the following example solves both problems:

lvds_term = 200;
of_property_read_u32(..., &lvds_term);

if (lvds_term == 100)
	ctx->lvds_term_conf[channel] = OHM_100;
else if (lvds_term == 200)
	ctx->lvds_term_conf[channel] = OHM_200;
else
	return -EINVAL;

The same approach can be applied to lvds_vod_swing_conf, resulting in
removal of magic values.

> 
> > 
> > > +	int ret = 0;
> > > +	int ret_data;
> > > +	int ret_clock;
> > > +
> > > +	if (channel == CHANNEL_A)
> > > +		endpoint_reg = 2;
> > > +	else
> > > +		endpoint_reg = 3;
> > > +
> > > +	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, endpoint_reg, -1);
> > > +	if (!of_property_read_u32(endpoint, "ti,lvds-termination-ohms", &lvds_term)) {
> > 
> > The code has been better before:
> > provide default for lvds_term, read the property (keeping the default in
> > case of an error), then use the lvds_term to set up lvds_term_conf, as
> > expected.
> 
> Ok, will revert back.
> 
> > 
> > > +		if (lvds_term == 100)
> > > +			lvds_term_conf = OHM_100;
> > > +		else
> > > +			lvds_term_conf = OHM_200;
> > > +	}
> > > +
> > > +	ctx->lvds_term_conf[channel] = lvds_term_conf;
> > > +
> > > +	ret_data = of_property_read_u32_array(endpoint,
> > > +			"ti,lvds-vod-swing-data-microvolt", lvds_vod_swing_data,
> > > +			ARRAY_SIZE(lvds_vod_swing_data));
> > > +	if (ret_data != 0 && ret_data != -EINVAL) {
> > > +		ret = ret_data;
> > > +		goto exit;
> > > +	}
> > > +
> > > +	ret_clock = of_property_read_u32_array(endpoint,
> > > +			"ti,lvds-vod-swing-clock-microvolt", lvds_vod_swing_clk,
> > > +			ARRAY_SIZE(lvds_vod_swing_clk));
> > > +	if (ret_clock != 0 && ret_clock != -EINVAL) {
> > > +		ret = ret_clock;
> > > +		goto exit;
> > > +	}
> > > +
> > > +	/* If any of the two properties is defined. */
> > > +	if (!ret_data || !ret_clock) {
> > > +		lvds_vod_swing_conf = sn65dsi83_select_lvds_vod_swing(dev,
> > > +			lvds_vod_swing_data, lvds_vod_swing_clk,
> > > +			lvds_term_conf);
> > > +		if (lvds_vod_swing_conf < 0) {
> > > +			ret = lvds_vod_swing_conf;
> > > +			goto exit;
> > > +		}
> > > +	}
> > > +
> > > +	ctx->lvds_vod_swing_conf[channel] = lvds_vod_swing_conf;
> > > +	ret = 0;
> > > +exit:
> > > +	of_node_put(endpoint);
> > > +	return ret;
> > > +}
> > > +
> > >   static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
> > >   {
> > >   	struct drm_bridge *panel_bridge;
> > >   	struct device *dev = ctx->dev;
> > > +	int ret;
> > > +
> > > +	ret = sn65dsi83_parse_lvds_endpoint(ctx, CHANNEL_A);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	ret = sn65dsi83_parse_lvds_endpoint(ctx, CHANNEL_B);
> > > +	if (ret < 0)
> > > +		return ret;
> > >   	ctx->lvds_dual_link = false;
> > >   	ctx->lvds_dual_link_even_odd_swap = false;
> > > -- 
> > > 2.34.1
> > > 
> > 

-- 
With best wishes
Dmitry

