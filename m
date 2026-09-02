Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24991C61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 09:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DSI+QlvCrJr7rmb2jblg9hayvhYiJV2JO8RzzdtM3Yo=; b=nCOJGplNtjqkecZMmWAHOLBqee
	hhV+nSLvptNwuCKZZa47pSXqR5rcOiMWqW/u8OVRt00wJwmbOJ37tZPMIyCo2EvjrFPa/JjonYko+
	gCRbPeAHHmQ2s7YL3+ot0GzKHHfnWolwXFOFin4wly9zwThIVMvKy6MPXV/3lU8bil/9qP0+cqpVb
	lOk2HExRzufM9C8hn6Wv4TwLMH7oBg5///WeKyqLs5SgAvjJE2CbT9vGYpf34lafxFz3IozoA+vuU
	nKG5nYWo4OLiLbNzeap/RoPLnS7VW+5C8iQffBcvV/4azEUlz2tRnR0Nq03bT4sMj6LmePyX3Ea7p
	8ApkianA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1hD9-0000000ED0c-3wY1;
	Wed, 02 Sep 2026 09:24:51 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1hD6-0000000ECze-39Xz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 09:24:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788341088; x=1819877088;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gq0rm/QcoBJl040W0wWOffDQSCftl1d5JLwbPBMCT38=;
  b=f/i0/4y/s1w+JFx2ErbseDB3uYqhhnGeR5Hr9TVaO4SMyksm7D5+EYko
   w0E/O5xdxfupK3idvQ6QPMafChH47NhCq3AGRSm9rHafpAWfkmHYNX8+M
   YLT0ey6Hxv2mtIM5zqzJLDtNFja8Hg8Cg04H3oNvXGeaehhx7fVBKen47
   0OW5bz1na7+9RT+ZnW9KA93xMJUsscxp1Y/jXSf06gqtVgFJnX8a1wnOS
   dc41pCRBhTcBBjCJvwGdN+4G7X7gqzeCM1GTLAIbjqBAfK8gTcNW58Wnz
   dcsGrGfPaAXwMJ2/Jh0a9cNu0sYWhwjQTYZgR9OxsdCZUQllawZjTuCUc
   A==;
X-CSE-ConnectionGUID: 4XPzW3bWQp68TtGez7G1tA==
X-CSE-MsgGUID: BITJH17jSpKjgAr0V4jXCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="99390840"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="99390840"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 02:24:46 -0700
X-CSE-ConnectionGUID: RFJL2ElhTCSd6Qpp7OfSgA==
X-CSE-MsgGUID: ikmp8GBPTV6A0/H3aM5FEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="265058867"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.129])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 02:24:43 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 85EF1120EB7;
	Wed, 02 Sep 2026 12:24:39 +0300 (EEST)
Date: Wed, 2 Sep 2026 12:24:39 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v6 2/5] media: hi846: Fix link frequency handling
Message-ID: <apfrV9FZ1UN8RW55@kekkonen.localdomain>
References: <20260830160025.211384-1-mitltlatltl@gmail.com>
 <20260830160025.211384-3-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830160025.211384-3-mitltlatltl@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_022448_813851_D47A4245 
X-CRM114-Status: GOOD (  43.95  )
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

Hi Pengyu,

Thanks for the update.

On Mon, Aug 31, 2026 at 12:00:22AM +0800, Pengyu Luo wrote:
> Link frequency is tied to PLL configuration, lane count, and external
> and configurable clock, so use runtime here instead of hardcoding for
> specific configuration. To implement this, we do
> 
> 1. Drop fixed link freqs, we calculate the driver supported values and
> use v4l2_link_freq_to_bitmap() to get the intersection with the DT
> supported values.
> 
> 2. Attach mipi_clk_div_{2,4}lane to current mode, and use the div with
> mclk clock, lane count to calculate link frequency.
> 
> 3. Drop mclk clock rate check.
> 
> Fixes: e8c0882685f9 ("media: i2c: add driver for the SK Hynix Hi-846 8M pixel camera")
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
> v6:
> - Add link freq ctrl back (Sakari)
> - Use v4l2_link_freq_to_bitmap() to get matched link freqs (Sakari)
> - Move clk_get() before than hi846_parse_dt(), since we use clock in hi846_parse_dt()
> v5:
> - Use separated fields instead of raw register values for PLL cfg (Sakari)
> - Use mul_u64_u32_div() to avoid loss of pricision and u64/u32 issues (Sakari)
> - Drop line break (Sakari)
> ---
>  drivers/media/i2c/hi846.c | 151 ++++++++++++++++++++++++--------------
>  1 file changed, 94 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
> index 7f069aca0fce..2f8624f9bdf3 100644
> --- a/drivers/media/i2c/hi846.c
> +++ b/drivers/media/i2c/hi846.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  // Copyright (c) 2021 Purism SPC
>  
> -#include <linux/unaligned.h>
> +#include <linux/bitfield.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
> @@ -11,6 +11,7 @@
>  #include <linux/pm.h>
>  #include <linux/property.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/unaligned.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-fwnode.h>
> @@ -219,8 +220,8 @@ struct hi846_mode {
>  	/* Horizontal timing size */
>  	u32 llp;
>  
> -	/* Link frequency needed for this resolution */
> -	u8 link_freq_index;
> +	u8 mipi_clk_div_2lane;
> +	u8 mipi_clk_div_4lane;
>  
>  	u16 fps;
>  
> @@ -1040,13 +1041,6 @@ static const char * const hi846_test_pattern_menu[] = {
>  	"Resolution Pattern",
>  };
>  
> -#define FREQ_INDEX_640	0
> -#define FREQ_INDEX_1280	1
> -static const s64 hi846_link_freqs[] = {
> -	[FREQ_INDEX_640] = 80000000,
> -	[FREQ_INDEX_1280] = 200000000,
> -};
> -
>  static const struct hi846_reg_list hi846_init_regs_list_2lane = {
>  	.num_of_regs = ARRAY_SIZE(hi846_init_2lane),
>  	.regs = hi846_init_2lane,
> @@ -1061,7 +1055,13 @@ static const struct hi846_mode supported_modes[] = {
>  	{
>  		.width = 640,
>  		.height = 480,
> -		.link_freq_index = FREQ_INDEX_640,
> +		.mipi_clk_div_2lane = 4,
> +		/*
> +		 * Dummy but necessary if we set this mode default, otherwise
> +		 * hi846_calc_pixel_rate() will be broken in
> +		 * hi846_init_controls()
> +		 */
> +		.mipi_clk_div_4lane = 8,

The divider of the 4-lane case appears to be always two times that of the
2-lane case. Could you calculate the value instead?

I think it'd be better to keep the link frequencies and modes at separate
indices; this is the way it used to be, too.

>  		.fps = 120,
>  		.frame_len = 631,
>  		.llp = HI846_LINE_LENGTH,
> @@ -1086,7 +1086,8 @@ static const struct hi846_mode supported_modes[] = {
>  	{
>  		.width = 1280,
>  		.height = 720,
> -		.link_freq_index = FREQ_INDEX_1280,
> +		.mipi_clk_div_2lane = 2,
> +		.mipi_clk_div_4lane = 4,
>  		.fps = 90,
>  		.frame_len = 842,
>  		.llp = HI846_LINE_LENGTH,
> @@ -1112,7 +1113,8 @@ static const struct hi846_mode supported_modes[] = {
>  	{
>  		.width = 1632,
>  		.height = 1224,
> -		.link_freq_index = FREQ_INDEX_1280,
> +		.mipi_clk_div_2lane = 2,
> +		.mipi_clk_div_4lane = 4,
>  		.fps = 30,
>  		.frame_len = 2526,
>  		.llp = HI846_LINE_LENGTH,
> @@ -1167,6 +1169,9 @@ struct hi846 {
>  	struct v4l2_ctrl *hblank;
>  	struct v4l2_ctrl *exposure;
>  
> +	s64 link_freqs[ARRAY_SIZE(supported_modes)];
> +	int num_link_freqs;
> +
>  	struct mutex mutex; /* protect cur_mode, streaming and chip access */
>  	const struct hi846_mode *cur_mode;
>  	bool streaming;
> @@ -1192,21 +1197,41 @@ static const struct hi846_datafmt *hi846_find_datafmt(u32 code)
>  	return NULL;
>  }
>  
> -static inline u8 hi846_get_link_freq_index(struct hi846 *hi846)
> +static u64
> +hi846_get_link_freq(const struct hi846 *hi846, const struct hi846_mode *mode)
>  {
> -	return hi846->cur_mode->link_freq_index;
> +	u64 mclk = clk_get_rate(hi846->clock);
> +	u8 mipi_clk_div;
> +
> +	if (hi846->nr_lanes == 2)
> +		mipi_clk_div = mode->mipi_clk_div_2lane;
> +	else
> +		mipi_clk_div = mode->mipi_clk_div_4lane;
> +
> +	/*
> +	 * HI846_REG_PLL_CFG_MIPI1_H = 0x025a, it is fixed in listed modes
> +	 * [11:8]: 0x02 => pre_div = 3
> +	 * [7:0]: 0x5a => multiplier = 90
> +	 */
> +	return mul_u64_u32_div(mclk, 90, 3 * mipi_clk_div);
>  }
>  
> -static u64 hi846_get_link_freq(struct hi846 *hi846)
> +static int hi846_get_link_freq_index(const struct hi846 *hi846,
> +				     const struct hi846_mode *mode)
>  {
> -	u8 index = hi846_get_link_freq_index(hi846);
> +	u64 link_freq = hi846_get_link_freq(hi846, mode);
> +	int i;
> +
> +	for (i = 0; i < hi846->num_link_freqs; i++)
> +		if (hi846->link_freqs[i] == link_freq)
> +			return i;
>  
> -	return hi846_link_freqs[index];
> +	return -EINVAL;
>  }
>  
>  static u64 hi846_calc_pixel_rate(struct hi846 *hi846)
>  {
> -	u64 link_freq = hi846_get_link_freq(hi846);
> +	u64 link_freq = hi846_get_link_freq(hi846, hi846->cur_mode);
>  	u64 pixel_rate = link_freq * 2 * hi846->nr_lanes;
>  
>  	do_div(pixel_rate, HI846_RGB_DEPTH);
> @@ -1429,8 +1454,8 @@ static int hi846_init_controls(struct hi846 *hi846)
>  	hi846->link_freq =
>  		v4l2_ctrl_new_int_menu(ctrl_hdlr, &hi846_ctrl_ops,
>  				       V4L2_CID_LINK_FREQ,
> -				       ARRAY_SIZE(hi846_link_freqs) - 1,
> -				       0, hi846_link_freqs);
> +				       hi846->num_link_freqs - 1,
> +				       0, hi846->link_freqs);
>  	if (hi846->link_freq)
>  		hi846->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>  
> @@ -1503,10 +1528,9 @@ static int hi846_set_video_mode(struct hi846 *hi846, int fps)
>  	u64 frame_length;
>  	int ret = 0;
>  	int dummy_lines;
> -	u64 link_freq = hi846_get_link_freq(hi846);
> +	u64 link_freq = hi846_get_link_freq(hi846, hi846->cur_mode);
>  
> -	dev_dbg(&client->dev, "%s: link freq: %llu\n", __func__,
> -		hi846_get_link_freq(hi846));
> +	dev_dbg(&client->dev, "%s: link freq: %llu\n", __func__, link_freq);
>  
>  	do_div(link_freq, fps);
>  	frame_length = link_freq;
> @@ -1699,6 +1723,7 @@ static int hi846_set_format(struct v4l2_subdev *sd,
>  	const struct hi846_datafmt *fmt = hi846_find_datafmt(mf->code);
>  	u32 tgt_fps;
>  	s32 vblank_def, h_blank;
> +	int idx;
>  
>  	if (!fmt) {
>  		mf->code = hi846_colour_fmts[0].code;
> @@ -1749,7 +1774,14 @@ static int hi846_set_format(struct v4l2_subdev *sd,
>  	mf->code = HI846_MEDIA_BUS_FORMAT;
>  	mf->field = V4L2_FIELD_NONE;
>  
> -	__v4l2_ctrl_s_ctrl(hi846->link_freq, hi846_get_link_freq_index(hi846));
> +	idx = hi846_get_link_freq_index(hi846, hi846->cur_mode);
> +	if (idx < 0) {
> +		dev_err(&client->dev,
> +			"failed to get link freq index: %d\n", idx);
> +		return -EINVAL;
> +	}
> +
> +	__v4l2_ctrl_s_ctrl(hi846->link_freq, idx);
>  	__v4l2_ctrl_s_ctrl_int64(hi846->pixel_rate,
>  				 hi846_calc_pixel_rate(hi846));
>  
> @@ -1947,20 +1979,33 @@ static int hi846_identify_module(struct hi846 *hi846)
>  	return 0;
>  }
>  
> -static s64 hi846_check_link_freqs(struct hi846 *hi846,
> -				  struct v4l2_fwnode_endpoint *ep)
> +static int hi846_add_link_freqs(struct hi846 *hi846, struct device *dev,
> +				struct v4l2_fwnode_endpoint *ep)
>  {
> -	const s64 *freqs = hi846_link_freqs;
> -	int freqs_count = ARRAY_SIZE(hi846_link_freqs);
> -	int i, j;
> -
> -	for (i = 0; i < freqs_count; i++) {
> -		for (j = 0; j < ep->nr_of_link_frequencies; j++)
> -			if (freqs[i] == ep->link_frequencies[j])
> -				break;
> -		if (j == ep->nr_of_link_frequencies)
> -			return freqs[i];
> -	}
> +	s64 hi846_link_freqs[ARRAY_SIZE(supported_modes)];
> +	unsigned long freq_bitmap;
> +	int ret, i;
> +
> +	/*
> +	 * Since the MCLK freq varies between platforms, calculating driver
> +	 * supported link freqs here.
> +	 */
> +	for (i = 0; i < ARRAY_SIZE(supported_modes); i++)
> +		hi846_link_freqs[i] = hi846_get_link_freq(hi846, &supported_modes[i]);
> +
> +	ret = v4l2_link_freq_to_bitmap(dev, ep->link_frequencies,
> +				       ep->nr_of_link_frequencies,
> +				       hi846_link_freqs,
> +				       ARRAY_SIZE(hi846_link_freqs),
> +				       &freq_bitmap);
> +	if (ret || !freq_bitmap)
> +		return ret;
> +
> +	for (i = 0; i < ARRAY_SIZE(hi846_link_freqs); i++)

Could you use the hi846_link_freqs array as-is for the control?

The selectable modes are expected to depend on the chose link frequency,
which is not affected by setting the format, for instance. I wonder if it'd
be useful to squash the next patch into this one.

> +		if (BIT(i) & freq_bitmap) {
> +			hi846->link_freqs[hi846->num_link_freqs++] = hi846_link_freqs[i];
> +			dev_dbg(dev, "Add supported link frequency %lld\n", hi846_link_freqs[i]);
> +		}
>  
>  	return 0;
>  }
> @@ -1973,7 +2018,6 @@ static int hi846_parse_dt(struct hi846 *hi846, struct device *dev)
>  		.bus_type = V4L2_MBUS_CSI2_DPHY
>  	};
>  	int ret;
> -	s64 fq;
>  
>  	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
>  	if (!ep) {
> @@ -2004,11 +2048,10 @@ static int hi846_parse_dt(struct hi846 *hi846, struct device *dev)
>  		goto check_hwcfg_error;
>  	}
>  
> -	/* Check that link frequences for all the modes are in device tree */
> -	fq = hi846_check_link_freqs(hi846, &bus_cfg);
> -	if (fq) {
> -		dev_err(dev, "Link frequency of %lld is not supported\n", fq);
> -		ret = -EINVAL;
> +	/* Add link frequencies which are supported by both DT and the driver */
> +	ret = hi846_add_link_freqs(hi846, dev, &bus_cfg);
> +	if (ret) {
> +		dev_err(dev, "failed to add link frequency %d\n", ret);
>  		goto check_hwcfg_error;
>  	}
>  
> @@ -2041,30 +2084,24 @@ static int hi846_probe(struct i2c_client *client)
>  	struct hi846 *hi846;
>  	int ret;
>  	int i;
> -	u32 mclk_freq;
>  
>  	hi846 = devm_kzalloc(&client->dev, sizeof(*hi846), GFP_KERNEL);
>  	if (!hi846)
>  		return -ENOMEM;
>  
> -	ret = hi846_parse_dt(hi846, &client->dev);
> -	if (ret) {
> -		dev_err(&client->dev, "failed to check HW configuration: %d",
> -			ret);
> -		return ret;
> -	}
> -
> +	/* Get the MCLK first, since we need it to calculate link freqs */
>  	hi846->clock = devm_v4l2_sensor_clk_get(&client->dev, NULL);
>  	if (IS_ERR(hi846->clock))
>  		return dev_err_probe(&client->dev, PTR_ERR(hi846->clock),
>  				     "failed to get clock: %pe\n",
>  				     hi846->clock);
>  
> -	mclk_freq = clk_get_rate(hi846->clock);
> -	if (mclk_freq != 25000000)
> -		dev_warn(&client->dev,
> -			 "External clock freq should be 25000000, not %u.\n",
> -			 mclk_freq);
> +	ret = hi846_parse_dt(hi846, &client->dev);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to check HW configuration: %d",
> +			ret);
> +		return ret;
> +	}
>  
>  	for (i = 0; i < HI846_NUM_SUPPLIES; i++)
>  		hi846->supplies[i].supply = hi846_supply_names[i];

-- 
Regards,

Sakari Ailus

