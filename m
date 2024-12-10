Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB5DE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 01:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hwOz/3s+5rB6IRZt+uNZZmxy+vjj4hk+TORJT/mIsZw=; b=384aLyy7hnY3PryTaDp2UP5P35
	YFQdkIQTZHiQQ+Lgw2fXP1CAz9xQS9+8WTphEIOno+JjL1hXFWhitQXE1nvTLZ1WAvrbu67J/+oIy
	svXkJ7BKKzUm3MOwV38jkc07KJpRatrw+yjC5Mu1fFNjb54WuprlEkVIVQL9YloHi4K66wFAy6f9G
	PtWh8zAeHkZgCKotDYUtUuaxBTE96izBpVl4GDy0r+8oTuQicVWww4U0ycj4PIA1lHczjvdiaAy5N
	7v5NL1MZDtt+8382xC5jLjGMeJ1110cPedWDvx+Gh/EvywyHLFOZFqMbrHT0UFLA7LC3lnQbTiEfo
	2hy8oc0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKov1-00000009oGc-2FEc;
	Tue, 10 Dec 2024 01:20:07 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKotx-00000009nxv-3lRr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 01:19:03 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-53df6322ea7so5811738e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 17:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733793540; x=1734398340; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hwOz/3s+5rB6IRZt+uNZZmxy+vjj4hk+TORJT/mIsZw=;
        b=MLBn9jl1htsbOvb/VrppL5Jb/tMkm0anLbMrsVnr4w9OgFhfpDlyOG6O1MeREbcgEX
         4TFcECTK8hEUBglOykpTaY62CRaP5d/5aWMLqz1Ji1jwMXliM7nY3SW9MTxoKwb+CfBP
         bK1j2whLszJiZCmVm2KKaufrCGX0pwt+aEOed4zMEAhX2HXABnN9slklhgmYgm0r/HZh
         Rj9b/SXDxryiK54WSYmXvbIKQxEcxc5ioj5IjjOwDSWuMCHqGtkfXZiaVkvsFfqonX5z
         yM6CZMJ4tqNNLa58mbvcn0KLeS86FjJ2plG7PreBK18an+lofcWRP956KcF/vyngz+tL
         4c/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733793540; x=1734398340;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hwOz/3s+5rB6IRZt+uNZZmxy+vjj4hk+TORJT/mIsZw=;
        b=tA8A9LXnv+kITt+SnpSuxjf8r7HOJ0n9eJXkjo5spAbdmKqkgcpAfrQEv5Zhe+T2Dy
         toskNx/kVQ2Nu7bVl8nO89YM2M4CNEVgyPetAzmwo3slDndrWq+H2O797GIgMwr/Q1Hs
         9Z95eqmuPoLcm4sDWubCd5JS0kndaBydpr/YCPMHQQ42plE2LHvBlg4lg1Nceze+xLaV
         L8ljWTbkx72AmjFTtApABQ9IBHvQKG2oXyCxGyE87L2JFVol5ZBKclpvadi0nCCHx8Eq
         m7T5RYZfywkfw8RhIss/ixxMqJ5gfZLxpWzMCipQasRcozYfn0xVahpooZIRiGc36Oj5
         HnyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWpDc9z1ryoqXJj2lM/Qx/NOP7eOsSdvk4NakXO0aAR6DHnq2kGiLKXYofTUGgmr4p5QaI9oY7aEYsvzeMuNFx@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0GA8Ahs2rbNmlGThPW6TITna5d5xdM/L+ZqaaWfUBWUjcO8nN
	M3FA15cdx1wOvK+dMSEj00NhnHoz8/OLB9UPBEDuZc4/OImZmrwJe+72hMnhntA=
X-Gm-Gg: ASbGncvbt1MpBvhIhxVzZ/aCGq0WEwBNg6Ac89s0nbpZqdc30ptmYabiRJq6E5UFfmA
	VB0D8jlmSsVy/8prczNOTYCEPXx0cXpZtiz6PzIVzI8mYRfUviT/wv9Hi61sve1kppgyqdaWIkA
	3NnxUcgj0nui+RIt1ZtawcMY6Uc4M4RybO0O/eesa+2GAtkVt4ixNxJWfSMonU3hCuzhgYQSkXX
	5MB8GNjzhgqSdcHJbHmUJRKtfpv3/D1e2VEgt8C4T6CVlBQYWJNd9nOJ4n/4eJT1DAjJDU+E42p
	EsSTEbqT82nT9pBg2SfSG/bGKwEZ+Cgqaw==
X-Google-Smtp-Source: AGHT+IFhrbfBVLvwS8JtxYQvsf4ft/BOKHf1cBzqWj4YWhQkk8IVityumdfo4WZxOv1As/yfkbavcA==
X-Received: by 2002:a05:6512:b96:b0:53f:8c46:42b6 with SMTP id 2adb3069b0e04-5402402ea2dmr922627e87.0.1733793540153;
        Mon, 09 Dec 2024 17:19:00 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e3847565csm1090292e87.190.2024.12.09.17.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 17:18:58 -0800 (PST)
Date: Tue, 10 Dec 2024 03:18:56 +0200
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
Subject: Re: [PATCH v4 2/3] drm/bridge: ti-sn65dsi83: Add ti,lvds-vod-swing
 optional properties
Message-ID: <xkrk3vdw7yhj22ornqog7wovqctgrolfcxbl43u7ddgstjqsbl@h22hxlld6zqg>
References: <20241205134021.2592013-1-andrej.picej@norik.com>
 <20241205134021.2592013-3-andrej.picej@norik.com>
 <nbumcptoi5hwehjbrynf6dh2wrz7a4ugqblrjxyswvj7udkf3u@6qikclizqfjr>
 <e420579f-25b2-41ca-9627-130d67c51541@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e420579f-25b2-41ca-9627-130d67c51541@norik.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_171902_034006_AE48CC86 
X-CRM114-Status: GOOD (  46.12  )
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

On Mon, Dec 09, 2024 at 08:56:29AM +0100, Andrej Picej wrote:
> Hi Dmitry,
> 
> On 5. 12. 24 23:48, Dmitry Baryshkov wrote:
> > On Thu, Dec 05, 2024 at 02:40:20PM +0100, Andrej Picej wrote:
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
> > >   drivers/gpu/drm/bridge/ti-sn65dsi83.c | 147 +++++++++++++++++++++++++-
> > >   1 file changed, 144 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > > index 57a7ed13f996..f724d2a6777b 100644
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
> > > @@ -576,10 +622,101 @@ static const struct drm_bridge_funcs sn65dsi83_funcs = {
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
> > > +	/* Set so the property can be freely selected if not defined */
> > > +	u32 lvds_vod_swing_data[2] = { 0, 1000000 };
> > > +	u32 lvds_vod_swing_clk[2] = { 0, 1000000 };
> > > +	u32 lvds_term = 200;
> > > +	u8 lvds_term_conf;
> > > +	int endpoint_reg;
> > > +	int lvds_vod_swing_conf;
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
> > > +	of_property_read_u32(endpoint, "ti,lvds-termination-ohms", &lvds_term);
> > > +
> > > +	if (lvds_term == 200)
> > > +		lvds_term_conf = OHM_200;
> > > +	else
> > > +		lvds_term_conf = OHM_100;
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
> > > +
> > > +		ctx->lvds_vod_swing_conf[channel] = lvds_vod_swing_conf;
> > > +	}
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
> > > +	ctx->lvds_vod_swing_conf[CHANNEL_A] = 0x1;
> > > +	ctx->lvds_vod_swing_conf[CHANNEL_B] = 0x1;
> > > +	ctx->lvds_term_conf[CHANNEL_A] = 0x1;
> > > +	ctx->lvds_term_conf[CHANNEL_B] = 0x1;
> > 
> > These match the defaults in sn65dsi83_parse_lvds_endpoint(). Do we
> > really need those?
> 
> Yes, I think we do. This ensures that defaults are used even when property
> is not defined/LVDS channel is not used. So also LVDS channel B defaults are
> set even for sn65dsi83 (single LVDS output). Keeping the same reg values as
> before these changes.

You can move sn65dsi83_parse_lvds_endpoint() out of the if() and get the
same result. Duplicating data (or code) is a bad idea, because it's easy
to update one point and miss another point. And then usually one has a
nice debugging session, trying to understand why their changes didn't
work out.

> 
> Best regards,
> Andrej
> 
> 
> > 
> > > +
> > > +	ret = sn65dsi83_parse_lvds_endpoint(ctx, CHANNEL_A);
> > > +	if (ret < 0)
> > > +		return ret;
> > >   	ctx->lvds_dual_link = false;
> > >   	ctx->lvds_dual_link_even_odd_swap = false;
> > > @@ -587,6 +724,10 @@ static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
> > >   		struct device_node *port2, *port3;
> > >   		int dual_link;
> > > +		ret = sn65dsi83_parse_lvds_endpoint(ctx, CHANNEL_B);
> > > +		if (ret < 0)
> > > +			return ret;
> > > +
> > >   		port2 = of_graph_get_port_by_id(dev->of_node, 2);
> > >   		port3 = of_graph_get_port_by_id(dev->of_node, 3);
> > >   		dual_link = drm_of_lvds_get_dual_link_pixel_order(port2, port3);
> > > -- 
> > > 2.34.1
> > > 
> > 

-- 
With best wishes
Dmitry

