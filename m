Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6A5E77182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 00:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OMqUgu29dr/kC2j1L26UmKv/roqpPimVfYqNx+1TUQA=; b=S7Zv0twQ+OGu5c4JF6qfDnKETE
	1/AmbWu4VuOeZ43lhVg7QTWhy/AyfZlR+xE9CXn7x1PeslpZQJd9m+tFK7HQJ2B/0riM35LeON0+8
	TcyteJty/abLIvni5huq9a4jvhooxwyb0Azfxq/mcWR+RPYUT+5hMab9C476TWwbf+/61WlxJkUY4
	G4FCjc6CzEbWUtgt4hN9x68BTaSwY/11hUNtDdJUTCCL0g4e/bf0xeLalc+NjQDQDpg/zf5SjPqqw
	wGRbZ9EBs9J1Fw8s2mAs7dGfUCCRdj2mciWgdW7GaHtpnBLrzwLxRxL1GPiSYzzG6Q1tkgMM7Un7t
	QIGygCcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLWrU-0000000GaAO-1GYm;
	Thu, 12 Dec 2024 00:15:24 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVkZ-0000000GQYv-403u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 23:04:13 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-53e3778bffdso5653720e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 15:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733958249; x=1734563049; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OMqUgu29dr/kC2j1L26UmKv/roqpPimVfYqNx+1TUQA=;
        b=ctnnsdRLKQEd/HmExV8A2VCwIASkvxO+nf25j40j5NSQDadwyFyEkLlysyjGSM6kCe
         Lqm72xpOu6z147doc07CdCRB59hyJgzSKk/rzPMFHI5LuF6H2gBipAtwIqS7BWIoAy9a
         04MJ3OADKCgWGY+jSTBaC7Zafos1KjGD9BWu8AyMfHseuKYensQ5jhi/JROEc+jLLmz9
         JDk65Wj15J5HoW7Sh16jKnKoTmtBlPueNJAviGD5Uv/wbBYBPhAmnuKPqQBOovYMCe2D
         WhNtjCNdRaM6Lt8B/+5YLHCVBVaEDoXeeyvNAJWSCfROgKE0YxBomLvYNCNcT+n0TP2g
         QWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733958249; x=1734563049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OMqUgu29dr/kC2j1L26UmKv/roqpPimVfYqNx+1TUQA=;
        b=wRKqFNoD09wMtRNzAvyNLLUxT3SDF7oY4qOlnEvqD/kKYW9kPacR6WTFdvZZlQXg6L
         a8QJl2u55C+/vd8w/jGnWbV0up6szIVKG9/CHEj+vb5XFYdyfJK6mMFDVL+w79NoRJpA
         KphRahnbmWR5ezNxcQQjZSs/gCtLCWWcVpZGuSqMy9T032D/SD89WVetXcmPg93Nw/P4
         Zy3M6vkKVvEuGq47TfCIazy7A67lanCKePczIL4soJ1tjkQr5U/wzHsLAbzqVYE/rE0m
         JlAKOogu+AVLVUwEEnlU0vAhpOb3FAWr/UIw29XHaS8CB0Uu3aXQvFFOKbMeWWwcLBN/
         Qx8w==
X-Forwarded-Encrypted: i=1; AJvYcCXQJiud38sLHoiE3WZUonYIFYjKebevGv4K5Gm4maYtQWuYDA/kRuCBzo5uCej11AfO5mOxCLfIANl2osgQmDR5@lists.infradead.org
X-Gm-Message-State: AOJu0YyqGAUle7M2vWAuBUZ3u8NsmMSEVYePQd27tloiDAtTo9Vuvweu
	e+spXpoM6hmgMZWEsVu0Dnt49tCxGiLbDe0OnNLNAVABZ8YoXt55HMlSANH+0/A=
X-Gm-Gg: ASbGncuj+Us3bLxhmPtk0gxtms011A+xex+xhwK4KGES+LOcRNGbZLw/i60DeXbwoKf
	RLYCqpSQ1PZjtN9BghqELYWOA4HOR1varmJQFWLCeAIq/ZMuK9gE7aixCiJ3Mi3DcknJuLJXXOt
	DANjGZ29PzEcWppcKDrKnOIowuEcKOll2m/akVT6kzxWyria4/h/RlAXbdCMBMAVh57pHH9A2eM
	36V3J9aHIfn+Cqsu1D5Ev2GxcV8Fmt0HLYnivw/kH3zd2B8MPB/sJVatGtj882szLPNlsUu26RK
	T5vdeMgILZEK+eg6/oMEfREEQbjARsubdg==
X-Google-Smtp-Source: AGHT+IEhqGDw0cNCr+jN+DdXJHOmo3kKoG/lFAosZWpVVqXUd4oFiJE89F6qLxbtZeNdIPawBJHAgw==
X-Received: by 2002:a05:6512:3c99:b0:53f:8c46:42bd with SMTP id 2adb3069b0e04-5402a5e0a12mr1498950e87.15.1733958249174;
        Wed, 11 Dec 2024 15:04:09 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5401fb5f496sm1102790e87.237.2024.12.11.15.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 15:04:07 -0800 (PST)
Date: Thu, 12 Dec 2024 01:04:05 +0200
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
Message-ID: <rputm4gnjj6nb66ix7dqbxr2janltia6rlb6zunhf7x3mgooxw@o3lblnyp5cci>
References: <20241210091901.83028-1-andrej.picej@norik.com>
 <20241210091901.83028-3-andrej.picej@norik.com>
 <irpmhq7vxjra6vhmdh7p63ajj57n3h2c4br3ija2jmwtoewist@zyxfmx6k5m4e>
 <aa2de99d-21f4-4843-83b7-5d2db78be86f@norik.com>
 <qhmsobin3fsmoc7ic2jtancowfscoauyroruxdpwhmqwlogtkz@6by3s2ruwzwp>
 <519cc025-0782-4f96-a169-1fe87b280173@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <519cc025-0782-4f96-a169-1fe87b280173@norik.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_150412_181860_AB746EC5 
X-CRM114-Status: GOOD (  57.09  )
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

On Wed, Dec 11, 2024 at 08:57:17AM +0100, Andrej Picej wrote:
> 
> 
> On 10. 12. 24 14:59, Dmitry Baryshkov wrote:
> > On Tue, Dec 10, 2024 at 02:41:01PM +0100, Andrej Picej wrote:
> > > 
> > > 
> > > On 10. 12. 24 12:43, Dmitry Baryshkov wrote:
> > > > On Tue, Dec 10, 2024 at 10:19:00AM +0100, Andrej Picej wrote:
> > > > > Add a optional properties to change LVDS output voltage. This should not
> > > > > be static as this depends mainly on the connected display voltage
> > > > > requirement. We have three properties:
> > > > > - "ti,lvds-termination-ohms", which sets near end termination,
> > > > > - "ti,lvds-vod-swing-data-microvolt" and
> > > > > - "ti,lvds-vod-swing-clock-microvolt" which both set LVDS differential
> > > > > output voltage for data and clock lanes. They are defined as an array
> > > > > with min and max values. The appropriate bitfield will be set if
> > > > > selected constraints can be met.
> > > > > 
> > > > > If "ti,lvds-termination-ohms" is not defined the default of 200 Ohm near
> > > > > end termination will be used. Selecting only one:
> > > > > "ti,lvds-vod-swing-data-microvolt" or
> > > > > "ti,lvds-vod-swing-clock-microvolt" can be done, but the output voltage
> > > > > constraint for only data/clock lanes will be met. Setting both is
> > > > > recommended.
> > > > > 
> > > > > Signed-off-by: Andrej Picej <andrej.picej@norik.com>
> > > > > ---
> > > > > Changes in v5:
> > > > > - specify default values in sn65dsi83_parse_lvds_endpoint,
> > > > > - move sn65dsi83_parse_lvds_endpoint for channel B up, outside if,
> > > > > Changes in v4:
> > > > > - fix typo in commit message bitfiled -> bitfield
> > > > > - use arrays (lvds_vod_swing_conf and lvds_term_conf) in private data, instead
> > > > > of separate variables for channel A/B
> > > > > - add more checks on return value of "of_property_read_u32_array"
> > > > > Changes in v3:
> > > > > - use microvolts for default array values 1000 mV -> 1000000 uV.
> > > > > Changes in v2:
> > > > > - use datasheet tables to get the proper configuration
> > > > > - since major change was done change the authorship to myself
> > > > > ---
> > > > >    drivers/gpu/drm/bridge/ti-sn65dsi83.c | 142 +++++++++++++++++++++++++-
> > > > >    1 file changed, 139 insertions(+), 3 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > > > > index 57a7ed13f996..f9578b38da28 100644
> > > > > --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > > > > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > > > > @@ -132,6 +132,16 @@
> > > > >    #define  REG_IRQ_STAT_CHA_SOT_BIT_ERR		BIT(2)
> > > > >    #define  REG_IRQ_STAT_CHA_PLL_UNLOCK		BIT(0)
> > > > > +enum sn65dsi83_channel {
> > > > > +	CHANNEL_A,
> > > > > +	CHANNEL_B
> > > > > +};
> > > > > +
> > > > > +enum sn65dsi83_lvds_term {
> > > > > +	OHM_100,
> > > > > +	OHM_200
> > > > > +};
> > > > > +
> > > > >    enum sn65dsi83_model {
> > > > >    	MODEL_SN65DSI83,
> > > > >    	MODEL_SN65DSI84,
> > > > > @@ -147,6 +157,8 @@ struct sn65dsi83 {
> > > > >    	struct regulator		*vcc;
> > > > >    	bool				lvds_dual_link;
> > > > >    	bool				lvds_dual_link_even_odd_swap;
> > > > > +	int				lvds_vod_swing_conf[2];
> > > > > +	int				lvds_term_conf[2];
> > > > >    };
> > > > >    static const struct regmap_range sn65dsi83_readable_ranges[] = {
> > > > > @@ -237,6 +249,36 @@ static const struct regmap_config sn65dsi83_regmap_config = {
> > > > >    	.max_register = REG_IRQ_STAT,
> > > > >    };
> > > > > +static const int lvds_vod_swing_data_table[2][4][2] = {
> > > > > +	{	/* 100 Ohm */
> > > > > +		{ 180000, 313000 },
> > > > > +		{ 215000, 372000 },
> > > > > +		{ 250000, 430000 },
> > > > > +		{ 290000, 488000 },
> > > > > +	},
> > > > > +	{	/* 200 Ohm */
> > > > > +		{ 150000, 261000 },
> > > > > +		{ 200000, 346000 },
> > > > > +		{ 250000, 428000 },
> > > > > +		{ 300000, 511000 },
> > > > > +	},
> > > > > +};
> > > > > +
> > > > > +static const int lvds_vod_swing_clock_table[2][4][2] = {
> > > > > +	{	/* 100 Ohm */
> > > > > +		{ 140000, 244000 },
> > > > > +		{ 168000, 290000 },
> > > > > +		{ 195000, 335000 },
> > > > > +		{ 226000, 381000 },
> > > > > +	},
> > > > > +	{	/* 200 Ohm */
> > > > > +		{ 117000, 204000 },
> > > > > +		{ 156000, 270000 },
> > > > > +		{ 195000, 334000 },
> > > > > +		{ 234000, 399000 },
> > > > > +	},
> > > > > +};
> > > > > +
> > > > >    static struct sn65dsi83 *bridge_to_sn65dsi83(struct drm_bridge *bridge)
> > > > >    {
> > > > >    	return container_of(bridge, struct sn65dsi83, bridge);
> > > > > @@ -435,12 +477,16 @@ static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
> > > > >    		val |= REG_LVDS_FMT_LVDS_LINK_CFG;
> > > > >    	regmap_write(ctx->regmap, REG_LVDS_FMT, val);
> > > > > -	regmap_write(ctx->regmap, REG_LVDS_VCOM, 0x05);
> > > > > +	regmap_write(ctx->regmap, REG_LVDS_VCOM,
> > > > > +			REG_LVDS_VCOM_CHA_LVDS_VOD_SWING(ctx->lvds_vod_swing_conf[CHANNEL_A]) |
> > > > > +			REG_LVDS_VCOM_CHB_LVDS_VOD_SWING(ctx->lvds_vod_swing_conf[CHANNEL_B]));
> > > > >    	regmap_write(ctx->regmap, REG_LVDS_LANE,
> > > > >    		     (ctx->lvds_dual_link_even_odd_swap ?
> > > > >    		      REG_LVDS_LANE_EVEN_ODD_SWAP : 0) |
> > > > > -		     REG_LVDS_LANE_CHA_LVDS_TERM |
> > > > > -		     REG_LVDS_LANE_CHB_LVDS_TERM);
> > > > > +		     (ctx->lvds_term_conf[CHANNEL_A] ?
> > > > > +			  REG_LVDS_LANE_CHA_LVDS_TERM : 0) |
> > > > > +		     (ctx->lvds_term_conf[CHANNEL_B] ?
> > > > > +			  REG_LVDS_LANE_CHB_LVDS_TERM : 0));
> > > > >    	regmap_write(ctx->regmap, REG_LVDS_CM, 0x00);
> > > > >    	le16val = cpu_to_le16(mode->hdisplay);
> > > > > @@ -576,10 +622,100 @@ static const struct drm_bridge_funcs sn65dsi83_funcs = {
> > > > >    	.atomic_get_input_bus_fmts = sn65dsi83_atomic_get_input_bus_fmts,
> > > > >    };
> > > > > +static int sn65dsi83_select_lvds_vod_swing(struct device *dev,
> > > > > +	u32 lvds_vod_swing_data[2], u32 lvds_vod_swing_clk[2], u8 lvds_term)
> > > > > +{
> > > > > +	int i;
> > > > > +
> > > > > +	for (i = 0; i <= 3; i++) {
> > > > > +		if (lvds_vod_swing_data_table[lvds_term][i][0] >= lvds_vod_swing_data[0] &&
> > > > > +		lvds_vod_swing_data_table[lvds_term][i][1] <= lvds_vod_swing_data[1] &&
> > > > > +		lvds_vod_swing_clock_table[lvds_term][i][0] >= lvds_vod_swing_clk[0] &&
> > > > > +		lvds_vod_swing_clock_table[lvds_term][i][1] <= lvds_vod_swing_clk[1])
> > > > > +			return i;
> > > > > +	}
> > > > > +
> > > > > +	dev_err(dev, "failed to find appropriate LVDS_VOD_SWING configuration\n");
> > > > > +	return -EINVAL;
> > > > > +}
> > > > > +
> > > > > +static int sn65dsi83_parse_lvds_endpoint(struct sn65dsi83 *ctx, int channel)
> > > > > +{
> > > > > +	struct device *dev = ctx->dev;
> > > > > +	struct device_node *endpoint;
> > > > > +	int endpoint_reg;
> > > > > +	/* Set so the property can be freely selected if not defined */
> > > > > +	u32 lvds_vod_swing_data[2] = { 0, 1000000 };
> > > > > +	u32 lvds_vod_swing_clk[2] = { 0, 1000000 };
> > > > > +	u32 lvds_term;
> > > > > +	u8 lvds_term_conf = 0x1;
> > > > > +	int lvds_vod_swing_conf = 0x1;
> > > > 
> > > > Magic values
> > > 
> > > Can you please elaborate.
> > > 
> > > I can use:
> > > u8 lvds_term_conf = OHM_200;
> > > 
> > > What about lvds_vod_swing_conf? Should I create additional define for it?
> > > But this doesn't solve a hidden meaning? Maybe additional comment above?
> > > Would like to avoid using voltages for it, since then we are reverse
> > > engineering the table in datasheet to match the default reg value.
> > 
> > I think the following example solves both problems:
> > 
> > lvds_term = 200;
> > of_property_read_u32(..., &lvds_term);
> > 
> > if (lvds_term == 100)
> > 	ctx->lvds_term_conf[channel] = OHM_100;
> > else if (lvds_term == 200)
> > 	ctx->lvds_term_conf[channel] = OHM_200;
> > else
> > 	return -EINVAL;
> > 
> > The same approach can be applied to lvds_vod_swing_conf, resulting in
> > removal of magic values.
> 
> Sorry, but I think it is not that easy when it comes to the
> lvds_vod_swing_conf. We should assign default value if
> "ti,lvds-vod-swing-data-microvolt" and "ti,lvds-vod-swing-clock-microvolt"
> are not defined. Default value of the lvds_vod_swing_conf is 0x1, but this
> doesn't have any straight forward meaning like OHM_200 for example.
> 
> What we can do in that case is that we copy the values from defined
> datasheet tables to the "lvds_vod_swing_data[2]" and "lvds_vod_swing_clk[2]"
> arrays and then run the
> sn65dsi83_select_lvds_vod_swing with it, which will return the default value
> (0x1).
> 
> /* If both properties are not defined assign default limits */
> if (ret_data && ret_clock) {
> 	memcpy(lvds_vod_swing_data,
> 	     lvds_vod_swing_data_table[ctx->lvds_term_conf[channel]][1],
> 	     sizeof(lvds_vod_swing_data));
> 	memcpy(lvds_vod_swing_clk,
> 	    lvds_vod_swing_clock_table[ctx->lvds_term_conf[channel]][1],
> 	    sizeof(lvds_vod_swing_clk));
> }
> lvds_vod_swing_conf = sn65dsi83_select_lvds_vod_swing(dev,
> 	lvds_vod_swing_data, lvds_vod_swing_clk,
> 	ctx->lvds_term_conf[channel]);
> if (lvds_vod_swing_conf < 0) {
> 	ret = lvds_vod_swing_conf;
> 	goto exit;
> }
> 
> ctx->lvds_vod_swing_conf[channel] = lvds_vod_swing_conf;
> 
> I'm not sure if using this approach gets rid of the problem with magic
> values.
> Or maybe I'm not seeing the obvious solution so please bear with me.

Yes, the defaults (0..1000000) should be fixed to result in the same
value (0x01) as if the property wasn't specified at all.

I think the following should work:

	/* artifical values to select the defaults in both cases */
	u32 lvds_vod_swing_data[2] = { 190000, 330000 };
	u32 lvds_vod_swing_clk[2] = { 150000, 250000 };

Yes, they are artificial, as stated in the comment. Yes, I think it's
better than special-casing in the property handling.

-- 
With best wishes
Dmitry

