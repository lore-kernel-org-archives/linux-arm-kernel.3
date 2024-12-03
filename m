Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8052CE74AC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 17:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xz/rrNS+hlEL9lqbe3mK8LVGBrP6tU57imWfKl+L6qk=; b=bzM0Tw+H94i0TW25urQyzdTdVZ
	PrLVN0cyQv+ySJV2gj5eXYopyeSs3052fvOKMwity3GDM8ZVkyjfZPCjO81kgmSjQNETV38NWaRWS
	eD0O1+qwTKkLFvh3c/9oZfC9/9WOk3861URO1XBtoYazorpLp3EyhXiODAz0KFDzhOaboqlI3+RV7
	zHH+iNrRw1RloMFaXZG8bfX2C+SikSrvzQQzei1ecXygtRf7LZITG0XyRx4/XCqEcRmgNwk0RwEgx
	tZPcj7lwJTPVsDgbNgNhgJG0iPnRZcDZ6vkg2AzNsaMw88U1rTPrKSS8DLcXgQea8Fe7mxVo71O7I
	794GLqMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIWge-0000000AFSX-1Wkr;
	Tue, 03 Dec 2024 17:27:48 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIWfW-0000000AF8r-1Obw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 17:26:39 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2ffb3cbcbe4so63087601fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 09:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733246796; x=1733851596; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xz/rrNS+hlEL9lqbe3mK8LVGBrP6tU57imWfKl+L6qk=;
        b=GqnuqJNouu92bJTQlRdtZDN+QnxTEgPz81aMfEFbF7dU7Fsqd9dkyQ5XHf5kZdMS96
         I+A7EoG5C2/Fup8oQOjK5WQ0ojcKLPkQUhwxMJ+W6J6FdTt6z4VZZn6Jq1ZYlsCdQKGd
         F3amw8msiZk61chkS/SfAouUvHJB/p9jUFc0f7hEPTqveDqO1rtA3x73yehMytOZnxkZ
         1ZV1cvzrSKVm3QL0iK2iHySPoxP2gfufEp6MahgducxApIyKCNoJDFsB/Tj+nCFiWT1m
         INZYx8zc8Py90nelbjPHg06P0lGVKq8K30O4l4KJGve3ha+bFaI477yRPK7niHymTInJ
         mGmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733246796; x=1733851596;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xz/rrNS+hlEL9lqbe3mK8LVGBrP6tU57imWfKl+L6qk=;
        b=Iv/Jf+9ZlSXETnogFliW/j7FYcuKTe9zK3OdkPj7lrm8Kuz/Qu3x5nZiE9Df6vN+J7
         T0FBqEZOXldm/JNWk8Us0aCZQGcnIu9KbSr/iekcwZFfSmJ86d3cQDkDakAJzryeyL+R
         EBEi8yptVQujzrORDogkyUS4sRPPmGe0/COyLcHYZkMLluoavsVZC0y2QpvLbDKYoWcE
         sH5706p724e4NLUf8HQBBJP0b5SMovUfkDJAhfj6/hOQWwzvS8KaTiYLAAZwhMgiARER
         ksca37zwFNeiPyOVfMudnzB8B33+FDfHRR04k14vzpVuh4d4JPs18NcRpx8XGYNMHfId
         seZw==
X-Forwarded-Encrypted: i=1; AJvYcCU6Cu/YwPMrcePC4ZPDtLZeGKxgmNP/g6HedM7lks7AGjxfT7FL9H5Mbhd4iOO4BXV5cOD9Kqv7/WSc3RfXmnM1@lists.infradead.org
X-Gm-Message-State: AOJu0YwIoDtzMdAabl+xJSC5fpgUCNZiaV1RrD6w9GwGiP58aMsxpof4
	0STRUqkLbdPQcFqodxNkX5IDrkTYlfr1u5/Nd1lFqoOh+W+2RP+9MSdECLL5dsw=
X-Gm-Gg: ASbGncuxRn6/3QVNb0jVWI8QFLTU/JKBxSN9CKZU0NWrZ4u5M0LSEwK5w7nmaYZRlAa
	IU3Je+scG5xpP8PSmhU8+j/bYFOT2jjiApqENvox/Z5H83P0XRHI0wjGUltgMKSYs+hAtQO+U99
	oYz2p0Aii2DsdqqmEGCI7J670u643Qb8kWJTKvrD9/+xSwD+HuiJdwNVAjG6n4Nkao9TIv62Pff
	8DjSX2dYzaFS93Hl4+nlfwu/+OXl1kG+zJ3ld+P11lfGtFrATs7arg85UaxwiS2GSdo47DqTyf5
	yyhd/j6W8be2R0o8C5ufCEpNdW6PGA==
X-Google-Smtp-Source: AGHT+IHDzL+kViFvLr4LvMnl3L0hi2JMmKApYJ/jwTbetTdwojNyOBaCgkw29eR2Ie0p1Bi0zs9POQ==
X-Received: by 2002:a2e:a911:0:b0:2ff:d2c8:84fb with SMTP id 38308e7fff4ca-30009c61a31mr24281101fa.24.1733246795808;
        Tue, 03 Dec 2024 09:26:35 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffdfbeb8cbsm17312061fa.33.2024.12.03.09.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 09:26:34 -0800 (PST)
Date: Tue, 3 Dec 2024 19:26:31 +0200
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
Subject: Re: [PATCH v3 2/3] drm/bridge: ti-sn65dsi83: Add ti, lvds-vod-swing
 optional properties
Message-ID: <sjcspny5lmynm4q2dnkhktvwte5e3gigtujynaiqp5gr5rkqfn@j2h5f6xiwz34>
References: <20241203110054.2506123-1-andrej.picej@norik.com>
 <20241203110054.2506123-3-andrej.picej@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203110054.2506123-3-andrej.picej@norik.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_092638_417941_91ADE7D7 
X-CRM114-Status: GOOD (  38.59  )
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

On Tue, Dec 03, 2024 at 12:00:53PM +0100, Andrej Picej wrote:
> Add a optional properties to change LVDS output voltage. This should not
> be static as this depends mainly on the connected display voltage
> requirement. We have three properties:
> - "ti,lvds-termination-ohms", which sets near end termination,
> - "ti,lvds-vod-swing-data-microvolt" and
> - "ti,lvds-vod-swing-clock-microvolt" which both set LVDS differential
> output voltage for data and clock lanes. They are defined as an array
> with min and max values. The appropriate bitfiled will be set if
> selected constraints can be met.
> 
> If "ti,lvds-termination-ohms" is not defined the default of 200 Ohm near
> end termination will be used. Selecting only one:
> "ti,lvds-vod-swing-data-microvolt" or
> "ti,lvds-vod-swing-clock-microvolt" can be done, but the output voltage
> constraint for only data/clock lanes will be met. Setting both is
> recommended.
> 
> Signed-off-by: Andrej Picej <andrej.picej@norik.com>
> ---
> Changes in v3:
> - use microvolts for default array values 1000 mV -> 1000000 uV.
> Changes in v2:
> - use datasheet tables to get the proper configuration
> - since major change was done change the authorship to myself
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 144 +++++++++++++++++++++++++-
>  1 file changed, 141 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> index 57a7ed13f996..1a070df5ea12 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> @@ -132,6 +132,16 @@
>  #define  REG_IRQ_STAT_CHA_SOT_BIT_ERR		BIT(2)
>  #define  REG_IRQ_STAT_CHA_PLL_UNLOCK		BIT(0)
>  
> +enum sn65dsi83_channel {
> +	CHANNEL_A,
> +	CHANNEL_B
> +};
> +
> +enum sn65dsi83_lvds_term {
> +	OHM_100,
> +	OHM_200
> +};
> +
>  enum sn65dsi83_model {
>  	MODEL_SN65DSI83,
>  	MODEL_SN65DSI84,
> @@ -147,6 +157,10 @@ struct sn65dsi83 {
>  	struct regulator		*vcc;
>  	bool				lvds_dual_link;
>  	bool				lvds_dual_link_even_odd_swap;
> +	int				lvdsA_vod_swing_conf;
> +	int				lvdsB_vod_swing_conf;
> +	int				lvdsA_term_conf;
> +	int				lvdsB_term_conf;
>  };
>  
>  static const struct regmap_range sn65dsi83_readable_ranges[] = {
> @@ -237,6 +251,36 @@ static const struct regmap_config sn65dsi83_regmap_config = {
>  	.max_register = REG_IRQ_STAT,
>  };
>  
> +static const int lvds_vod_swing_data_table[2][4][2] = {
> +	{	/* 100 Ohm */
> +		{ 180000, 313000 },
> +		{ 215000, 372000 },
> +		{ 250000, 430000 },
> +		{ 290000, 488000 },
> +	},
> +	{	/* 200 Ohm */
> +		{ 150000, 261000 },
> +		{ 200000, 346000 },
> +		{ 250000, 428000 },
> +		{ 300000, 511000 },
> +	},
> +};
> +
> +static const int lvds_vod_swing_clock_table[2][4][2] = {
> +	{	/* 100 Ohm */
> +		{ 140000, 244000 },
> +		{ 168000, 290000 },
> +		{ 195000, 335000 },
> +		{ 226000, 381000 },
> +	},
> +	{	/* 200 Ohm */
> +		{ 117000, 204000 },
> +		{ 156000, 270000 },
> +		{ 195000, 334000 },
> +		{ 234000, 399000 },
> +	},
> +};
> +
>  static struct sn65dsi83 *bridge_to_sn65dsi83(struct drm_bridge *bridge)
>  {
>  	return container_of(bridge, struct sn65dsi83, bridge);
> @@ -435,12 +479,16 @@ static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
>  		val |= REG_LVDS_FMT_LVDS_LINK_CFG;
>  
>  	regmap_write(ctx->regmap, REG_LVDS_FMT, val);
> -	regmap_write(ctx->regmap, REG_LVDS_VCOM, 0x05);
> +	regmap_write(ctx->regmap, REG_LVDS_VCOM,
> +			REG_LVDS_VCOM_CHA_LVDS_VOD_SWING(ctx->lvdsA_vod_swing_conf) |
> +			REG_LVDS_VCOM_CHB_LVDS_VOD_SWING(ctx->lvdsB_vod_swing_conf));
>  	regmap_write(ctx->regmap, REG_LVDS_LANE,
>  		     (ctx->lvds_dual_link_even_odd_swap ?
>  		      REG_LVDS_LANE_EVEN_ODD_SWAP : 0) |
> -		     REG_LVDS_LANE_CHA_LVDS_TERM |
> -		     REG_LVDS_LANE_CHB_LVDS_TERM);
> +		     (ctx->lvdsA_term_conf ?
> +			  REG_LVDS_LANE_CHA_LVDS_TERM : 0) |
> +		     (ctx->lvdsB_term_conf ?
> +			  REG_LVDS_LANE_CHB_LVDS_TERM : 0));
>  	regmap_write(ctx->regmap, REG_LVDS_CM, 0x00);
>  
>  	le16val = cpu_to_le16(mode->hdisplay);
> @@ -576,10 +624,96 @@ static const struct drm_bridge_funcs sn65dsi83_funcs = {
>  	.atomic_get_input_bus_fmts = sn65dsi83_atomic_get_input_bus_fmts,
>  };
>  
> +static int sn65dsi83_select_lvds_vod_swing(struct device *dev,
> +	u32 lvds_vod_swing_data[2], u32 lvds_vod_swing_clk[2], u8 lvds_term)
> +{
> +	int i;
> +
> +	for (i = 0; i <= 3; i++) {
> +		if (lvds_vod_swing_data_table[lvds_term][i][0] >= lvds_vod_swing_data[0] &&
> +		lvds_vod_swing_data_table[lvds_term][i][1] <= lvds_vod_swing_data[1] &&
> +		lvds_vod_swing_clock_table[lvds_term][i][0] >= lvds_vod_swing_clk[0] &&
> +		lvds_vod_swing_clock_table[lvds_term][i][1] <= lvds_vod_swing_clk[1])
> +			return i;
> +	}
> +
> +	dev_err(dev, "failed to find appropriate LVDS_VOD_SWING configuration\n");
> +	return -EINVAL;
> +}
> +
> +static int sn65dsi83_parse_lvds_endpoint(struct sn65dsi83 *ctx, int channel)
> +{
> +	struct device *dev = ctx->dev;
> +	struct device_node *endpoint;
> +	/* Set so the property can be freely selected if not defined */
> +	u32 lvds_vod_swing_data[2] = { 0, 1000000 };
> +	u32 lvds_vod_swing_clk[2] = { 0, 1000000 };
> +	u32 lvds_term = 200;
> +	u8 lvds_term_conf;
> +	int endpoint_reg;
> +	int lvds_vod_swing_conf;
> +	int ret = 0;
> +	int ret_data;
> +	int ret_clock;
> +
> +	if (channel == CHANNEL_A)
> +		endpoint_reg = 2;
> +	else
> +		endpoint_reg = 3;
> +
> +	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, endpoint_reg, -1);
> +	of_property_read_u32(endpoint, "ti,lvds-termination-ohms", &lvds_term);
> +
> +	if (lvds_term == 200)
> +		lvds_term_conf = OHM_200;
> +	else
> +		lvds_term_conf = OHM_100;
> +
> +	if (channel == CHANNEL_A)
> +		ctx->lvdsA_term_conf = lvds_term_conf;
> +	else
> +		ctx->lvdsB_term_conf = lvds_term_conf;

This sounds like ctx->lvds_term_conf[channel] = ...;

And so on for other properties.

> +
> +	ret_data = of_property_read_u32_array(endpoint,
> +			"ti,lvds-vod-swing-data-microvolt", lvds_vod_swing_data,
> +			ARRAY_SIZE(lvds_vod_swing_data));
> +	ret_clock = of_property_read_u32_array(endpoint,
> +			"ti,lvds-vod-swing-clock-microvolt", lvds_vod_swing_clk,
> +			ARRAY_SIZE(lvds_vod_swing_clk));
> +	/* If any of the two properties is defined. */
> +	if (!ret_data || !ret_clock) {

I think it's not that easy. We were usually ignoring errors for a
single-value properties, but for the arrays I think we should make a
diffence between the property being not present in DT and the property
being erroneous or not being parsed correctly.

> +		lvds_vod_swing_conf = sn65dsi83_select_lvds_vod_swing(dev,
> +			lvds_vod_swing_data, lvds_vod_swing_clk,
> +			lvds_term_conf);
> +		if (lvds_vod_swing_conf < 0) {
> +			ret = lvds_vod_swing_conf;
> +			goto exit;
> +		}
> +		if (channel == CHANNEL_A)
> +			ctx->lvdsA_vod_swing_conf = lvds_vod_swing_conf;
> +		else
> +			ctx->lvdsB_vod_swing_conf = lvds_vod_swing_conf;
> +	}
> +	ret = 0;
> +exit:
> +	of_node_put(endpoint);
> +	return ret;
> +}
> +
>  static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
>  {
>  	struct drm_bridge *panel_bridge;
>  	struct device *dev = ctx->dev;
> +	int ret;
> +
> +	ctx->lvdsA_vod_swing_conf = 0x1;
> +	ctx->lvdsB_vod_swing_conf = 0x1;
> +	ctx->lvdsA_term_conf = 0x1;
> +	ctx->lvdsB_term_conf = 0x1;
> +
> +	ret = sn65dsi83_parse_lvds_endpoint(ctx, CHANNEL_A);
> +	if (ret < 0)
> +		return ret;
>  
>  	ctx->lvds_dual_link = false;
>  	ctx->lvds_dual_link_even_odd_swap = false;
> @@ -587,6 +721,10 @@ static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
>  		struct device_node *port2, *port3;
>  		int dual_link;
>  
> +		ret = sn65dsi83_parse_lvds_endpoint(ctx, CHANNEL_B);
> +		if (ret < 0)
> +			return ret;
> +
>  		port2 = of_graph_get_port_by_id(dev->of_node, 2);
>  		port3 = of_graph_get_port_by_id(dev->of_node, 3);
>  		dual_link = drm_of_lvds_get_dual_link_pixel_order(port2, port3);
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

