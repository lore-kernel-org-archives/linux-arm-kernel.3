Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F457CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 13:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b6C2QkLyR0u0X9GCK//jckwKzoabhVEHfCSic1LNgaA=; b=VvA9TgrFzNSBRt3l8D13Ih9XIG
	fzb71opUrROrxuilOIl2ajmwldX1xIZxV6w/kvE46HUHsg4YLHODD7eoui+lZZhFtkI+3XitoPqHE
	ZaKaEtsOilo1zQwoRMTfO+OVeBENq33Sy1xD5XIJUVjfGTZczA7bZPnQD++mqTUo174yz8CZ92fpP
	wXpecvpB6dcbJCeNIBQYdgcrIbip84wezf26Qiv91pl6rTASl3fGvIcys/zomwmzwLdfuS1MDGsxs
	QKMEx+DzLCbp/9yibllmxIEa/tTl62VCeH3S2WvpNq48tm/gi8MiQhcYEwBuWu1liWBwtpB9xsx/y
	iEirtozw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNA7q-00000002rEW-1pwQ;
	Wed, 13 May 2026 13:59:50 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNA7n-00000002qYj-3aWn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 13:59:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778680788; x=1810216788;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xCGSmUNmAHPDgb/YXdd0V9GbihR6QzirJZG+PlgQxoc=;
  b=bcQftgc8ZKCva8PQ9J3zQq6C/FG2tS61gEilW8/GT1VLsk+fVft/l+MD
   kyvd0OJdj2nbhzyojJr5s/rC0o7e2ZZhJHJoiM6MTTACX1iq80g5ox+eI
   7BUs/UiKMPwxYvdbqdDwRFyk+0m0gm7scVP+3hggrsSAyyHozZK66IJPq
   nOa0oY1XeOf7acnEUAxx5k5ADNu8GxG5PATEAbstg6glgF2LK4RGSlQrk
   lKrnvbyQcqZYTPVA7bpkmFNAR2yEUqqwmOvkQG/yfwohlORt7Fzy2iJdb
   o2JslkXCJKTDxW2GGogpfoMieRSg9CN29b9HRSnbv1CNceG/eTQFUjVfJ
   A==;
X-CSE-ConnectionGUID: qtoitiKfRL2itUOKYrKg1Q==
X-CSE-MsgGUID: EdaECst4Ss6hJCwumR/agw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="97034629"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="97034629"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 06:57:47 -0700
X-CSE-ConnectionGUID: KmLy6cpsRD6biS0Axw4NwA==
X-CSE-MsgGUID: 029kK+GUTgW9bdGj+3ao3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="231700498"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.111])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 06:57:42 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 68CE0121C9E;
	Wed, 13 May 2026 16:57:40 +0300 (EEST)
Date: Wed, 13 May 2026 16:57:40 +0300
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
	Hans Verkuil <hverkuil@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v4 2/5] media: hi846: fix link frequency handling
Message-ID: <agSDVJX0QKNgDMuw@kekkonen.localdomain>
References: <20260511103927.279550-1-mitltlatltl@gmail.com>
 <20260511103927.279550-3-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511103927.279550-3-mitltlatltl@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_065947_947479_C129C56D 
X-CRM114-Status: GOOD (  34.79  )
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

Hi Penguy,

On Mon, May 11, 2026 at 06:39:24PM +0800, Pengyu Luo wrote:
> link frequency is tied to PLL configuration, lane count, and external

A sentence begins with a capital letter, also the subject does.

> clock rate, so use runtime here instead of hardcoding for specific
> configuration. To implement this, this commit did
> 
> 1. dropped exposed link freqs as a v4l2_ctrl, since we are runtime
> now, it is inconvenient and unnecessary to expose it, and
> hi846_set_ctrl has nothing to do with it.

Please describe the changes the patch does in imperative form.

> 
> 2. attached pll_cfg_4lane to current mode, and use it with clock, lane
> count to calculate link frequency, we use 4-lane config as default,
> but we can double it easily for 2-lane case.
> 
> 3. dropped mclk clock rate check.
> 
> Fixes: e8c0882685f9 ("media: i2c: add driver for the SK Hynix Hi-846 8M pixel camera")
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  drivers/media/i2c/hi846.c | 75 ++++++++++++++++++++-------------------
>  1 file changed, 38 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
> index 7f069aca0fce..61297ef66a0e 100644
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
> +	/* PLL configuration for 4-lane link at this resolution */
> +	u16 pll_cfg_4lane;

Please use separate fields for different PLL configuration parameters, i.e.
not register values.

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
> @@ -1061,7 +1055,7 @@ static const struct hi846_mode supported_modes[] = {
>  	{
>  		.width = 640,
>  		.height = 480,
> -		.link_freq_index = FREQ_INDEX_640,
> +		.pll_cfg_4lane = 0x4924, /* HI846_REG_PLL_CFG_MIPI2_H */
>  		.fps = 120,
>  		.frame_len = 631,
>  		.llp = HI846_LINE_LENGTH,
> @@ -1086,7 +1080,7 @@ static const struct hi846_mode supported_modes[] = {
>  	{
>  		.width = 1280,
>  		.height = 720,
> -		.link_freq_index = FREQ_INDEX_1280,
> +		.pll_cfg_4lane = 0x4924, /* HI846_REG_PLL_CFG_MIPI2_H */
>  		.fps = 90,
>  		.frame_len = 842,
>  		.llp = HI846_LINE_LENGTH,
> @@ -1112,7 +1106,7 @@ static const struct hi846_mode supported_modes[] = {
>  	{
>  		.width = 1632,
>  		.height = 1224,
> -		.link_freq_index = FREQ_INDEX_1280,
> +		.pll_cfg_4lane = 0x4924, /* HI846_REG_PLL_CFG_MIPI2_H */
>  		.fps = 30,
>  		.frame_len = 2526,
>  		.llp = HI846_LINE_LENGTH,
> @@ -1161,7 +1155,6 @@ struct hi846 {
>  	struct v4l2_ctrl_handler ctrl_handler;
>  	u8 nr_lanes;
>  
> -	struct v4l2_ctrl *link_freq;
>  	struct v4l2_ctrl *pixel_rate;
>  	struct v4l2_ctrl *vblank;
>  	struct v4l2_ctrl *hblank;
> @@ -1192,21 +1185,37 @@ static const struct hi846_datafmt *hi846_find_datafmt(u32 code)
>  	return NULL;
>  }
>  
> -static inline u8 hi846_get_link_freq_index(struct hi846 *hi846)
> +static u64
> +hi846_get_link_freq(struct hi846 *hi846, const struct hi846_mode *cur_mode)
>  {
> -	return hi846->cur_mode->link_freq_index;
> -}
> +	u16 cfg = cur_mode->pll_cfg_4lane;
> +	u64 mclk = clk_get_rate(hi846->clock);
>  
> -static u64 hi846_get_link_freq(struct hi846 *hi846)
> -{
> -	u8 index = hi846_get_link_freq_index(hi846);
> +	/* NOTE: 6, 7 actually map to 8, 10, but this won't be that big */
> +	u8 post_div1 = 1 + FIELD_GET(GENMASK(10, 8), cfg);
> +	u8 post_div2 = 1 << FIELD_GET(GENMASK(12, 11), cfg);

s/1U/1/

>  
> -	return hi846_link_freqs[index];
> +	/*
> +	 * HI846_REG_PLL_CFG_MIPI1_H = 0x025a, it is fixed in listed modes
> +	 * [11:8]: 0x02 => pre_div = 3
> +	 * [7:0]: 0x5a => multiplier = 90
> +	 */
> +	u64 link_freq = mclk / 3 * 90 / post_div1 / post_div2;

This needs div_u64().

Don't divide by 3 upfront, you'll lose information.

> +	/*
> +	 * for shared modes, since lane count is halved for 2-lane, then getting
> +	 * link_freq doubled to match the same data rate. Since 720x480 is
> +	 * 2-lane only(reg_list_4lane.num_of_regs == 0), no pll cfg for 4-lane,
> +	 * the pll cfg is for 2-lane, so use the cfg as is.
> +	 */
> +	if (hi846->nr_lanes == 2 && cur_mode->reg_list_4lane.num_of_regs)
> +		link_freq *= 2;
> +
> +	return link_freq;
>  }
>  
>  static u64 hi846_calc_pixel_rate(struct hi846 *hi846)
>  {
> -	u64 link_freq = hi846_get_link_freq(hi846);
> +	u64 link_freq = hi846_get_link_freq(hi846, hi846->cur_mode);
>  	u64 pixel_rate = link_freq * 2 * hi846->nr_lanes;
>  
>  	do_div(pixel_rate, HI846_RGB_DEPTH);
> @@ -1426,14 +1435,6 @@ static int hi846_init_controls(struct hi846 *hi846)
>  
>  	ctrl_hdlr->lock = &hi846->mutex;
>  
> -	hi846->link_freq =
> -		v4l2_ctrl_new_int_menu(ctrl_hdlr, &hi846_ctrl_ops,
> -				       V4L2_CID_LINK_FREQ,
> -				       ARRAY_SIZE(hi846_link_freqs) - 1,
> -				       0, hi846_link_freqs);
> -	if (hi846->link_freq)
> -		hi846->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> -
>  	hi846->pixel_rate =
>  		v4l2_ctrl_new_std(ctrl_hdlr, &hi846_ctrl_ops,
>  				  V4L2_CID_PIXEL_RATE, 0,
> @@ -1503,10 +1504,10 @@ static int hi846_set_video_mode(struct hi846 *hi846, int fps)
>  	u64 frame_length;
>  	int ret = 0;
>  	int dummy_lines;
> -	u64 link_freq = hi846_get_link_freq(hi846);
> +	u64 link_freq = hi846_get_link_freq(hi846, hi846->cur_mode);
>  
>  	dev_dbg(&client->dev, "%s: link freq: %llu\n", __func__,
> -		hi846_get_link_freq(hi846));
> +		link_freq);

Fits on the same line.

>  
>  	do_div(link_freq, fps);
>  	frame_length = link_freq;
> @@ -1749,7 +1750,6 @@ static int hi846_set_format(struct v4l2_subdev *sd,
>  	mf->code = HI846_MEDIA_BUS_FORMAT;
>  	mf->field = V4L2_FIELD_NONE;
>  
> -	__v4l2_ctrl_s_ctrl(hi846->link_freq, hi846_get_link_freq_index(hi846));
>  	__v4l2_ctrl_s_ctrl_int64(hi846->pixel_rate,
>  				 hi846_calc_pixel_rate(hi846));
>  
> @@ -1950,16 +1950,17 @@ static int hi846_identify_module(struct hi846 *hi846)
>  static s64 hi846_check_link_freqs(struct hi846 *hi846,
>  				  struct v4l2_fwnode_endpoint *ep)
>  {
> -	const s64 *freqs = hi846_link_freqs;
> -	int freqs_count = ARRAY_SIZE(hi846_link_freqs);
> +	int freqs_count = ARRAY_SIZE(supported_modes);
> +	u64 link_freq;
>  	int i, j;
>  
>  	for (i = 0; i < freqs_count; i++) {
> +		link_freq = hi846_get_link_freq(hi846, &supported_modes[i]);
>  		for (j = 0; j < ep->nr_of_link_frequencies; j++)
> -			if (freqs[i] == ep->link_frequencies[j])
> +			if (link_freq == ep->link_frequencies[j])
>  				break;
>  		if (j == ep->nr_of_link_frequencies)
> -			return freqs[i];
> +			return link_freq;

I think v4l2_link_freq_to_bitmap() would be useful here.

>  	}
>  
>  	return 0;

-- 
Regards,

Sakari Ailus

