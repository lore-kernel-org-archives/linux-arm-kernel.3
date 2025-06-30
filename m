Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E08C8302B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 15:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PRM6kWFxZsGarNpGT4ZkkK4o3m2kWMFGVNGDskEwGRc=; b=EC3gmUffPhc1vjnGtWhKrBDUJi
	juRf/KGMIZW9xYTkZXbm1ZCP11jJnpICd/1cVowPMH5PXMWfrq7kisysMt1Kp6G00L0g18Cm3D+mH
	X3NC9zWkbp95O5E35pSbkCbYcf440kBGXV9wgdk5iloWlaqfidNO/uMqhYAuoqgSuiPGDebMMViQl
	HZN8AvfNJFl278znaEtZKGkamZR/yd1KoVi6tOmZH9V5zuySzYGuHBasCpPgWV7d+SkV5cwAcXD1r
	lO2w7XtIub+ZPu51KhMlAXYhEr1a5/y4qVdcTSJro/j1FvE5x3LljzUUFGGFugLglCbk0wk0zH8Ml
	AOOGt2yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWGJR-00000002jE4-3PB9;
	Mon, 30 Jun 2025 15:20:53 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWFsR-00000002eUX-0yXr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 14:53:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751295179; x=1782831179;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GfcQ1h5xe67+iOKtTI1u9okHTCuFwUSKZpV/NpPYlzA=;
  b=FrVC81euBHRfx6Ho/cRm6j5iFHs8wPHh2JkfotXulgpmADaAC1f+p9SR
   vd7CLvj63q4S4yJHL5RNNA3rGMaFft7v5rW7Dd784BYjmcBa8qPcPTvVf
   U7WJ8qzxChfzHRgbO1QAGdi9S8uubjVuW5Y1dktCAz3NJPGT520CkxZ9h
   lKznRT0AMOQzq7Udq/V9bBKCdiycTREpSwVBRgBQd5IyFBLTU9N6567Jl
   c7wEy/yTuD9ALgaC+X+cZHHmbtej9qUiRo44SKRnWrg4sajX4OUic3DVT
   8zJbCs1lixMAReHSQsAj6+ZhwyOE8LvioyBstKzp7LKxabESRcUNMhj3v
   g==;
X-CSE-ConnectionGUID: z6libN8AQUK6mXHoJwoaLA==
X-CSE-MsgGUID: +0OX9isbTci8QHAY9r0GGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="57204707"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="57204707"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 07:52:58 -0700
X-CSE-ConnectionGUID: JT2C5obwRyeffzhGksAX0g==
X-CSE-MsgGUID: MGEMhyFcQAekjScF5+D3Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="157510211"
Received: from agladkov-desk.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.57])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 07:52:54 -0700
Received: from svinhufvud (syyslaukka.retiisi.eu [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTPS id 7619840142;
	Mon, 30 Jun 2025 17:52:51 +0300 (EEST)
Date: Mon, 30 Jun 2025 17:52:49 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Anthony.McGivern@arm.com,
	nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
	laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v10 16/17] media: platform: Add mali-c55 parameters video
 node
Message-ID: <aGKkwXjQH0H1ghG1@svinhufvud>
References: <20250624-c55-v10-0-54f3d4196990@ideasonboard.com>
 <20250624-c55-v10-16-54f3d4196990@ideasonboard.com>
 <cd60eec7-cb91-4c88-9a63-298ed6582379@linux.intel.com>
 <5zbhnrplppbnrapyvcz2pviavbwsmqy5reofmkas7ouil5o6mr@62xlfol4ld7d>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5zbhnrplppbnrapyvcz2pviavbwsmqy5reofmkas7ouil5o6mr@62xlfol4ld7d>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_075259_337235_73B32555 
X-CRM114-Status: GOOD (  36.45  )
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

Hi Jacopo,

On Mon, Jun 30, 2025 at 03:59:42PM +0200, Jacopo Mondi wrote:
> Hi Sakari, Dan
> >
> > On 6/24/25 13:21, Daniel Scally wrote:
> > > +static void mali_c55_params_buf_queue(struct vb2_buffer *vb)
> > > +{
> > > +	struct mali_c55_params *params = vb2_get_drv_priv(vb->vb2_queue);
> > > +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> > > +	struct mali_c55_params_buf *buf = to_mali_c55_params_buf(vbuf);
> > > +	struct mali_c55 *mali_c55 = params->mali_c55;
> > > +	struct mali_c55_params_buffer *config;
> > > +	struct list_head *queue;
> > > +	size_t block_offset = 0;
> > > +	size_t max_offset;
> > > +
> > > +	/*
> > > +	 * Before accepting the buffer we should check that the data within it
> > > +	 * is valid.
> > > +	 */
> > > +	config = vb2_plane_vaddr(vb, 0);
> > > +
> > > +	if (config->total_size > MALI_C55_PARAMS_MAX_SIZE) {
> > > +		dev_dbg(mali_c55->dev, "Invalid parameters buffer size %u\n",
> > > +			config->total_size);
> > > +		goto err_buffer_done;
> > > +	}
> > > +
> > > +	/* Currently only v1 is supported */
> > > +	if (config->version != MALI_C55_PARAM_BUFFER_V1) {
> > > +		dev_dbg(mali_c55->dev, "Invalid parameters version\n");
> > > +		goto err_buffer_done;
> > > +	}
> > > +
> > > +	max_offset = config->total_size - sizeof(struct mali_c55_params_block_header);
> > > +	while (block_offset < max_offset) {
> > > +		const struct mali_c55_block_handler *block_handler;
> > > +		union mali_c55_params_block block;
> > > +
> > > +		block = (union mali_c55_params_block)
> > > +			 &config->data[block_offset];
> > > +
> > > +		if (block.header->type >= ARRAY_SIZE(mali_c55_block_handlers)) {
> > > +			dev_dbg(mali_c55->dev, "Invalid parameters block type\n");
> > > +			goto err_buffer_done;
> > > +		}
> > > +
> > > +		if (block_offset + block.header->size > config->total_size) {
> > > +			dev_dbg(mali_c55->dev, "Parameters block too large\n");
> > > +			goto err_buffer_done;
> > > +		}
> > > +
> > > +		block_handler = &mali_c55_block_handlers[block.header->type];
> > > +
> > > +		/*
> > > +		 * Userspace can optionally omit all but the header of a block
> > > +		 * if it only intends to disable the block.
> > > +		 */
> > > +		if (block.header->size != block_handler->size &&
> > > +		    block.header->size != sizeof(*block.header)) {
> > > +			dev_dbg(mali_c55->dev, "Invalid parameters block size\n");
> > > +			goto err_buffer_done;
> > > +		}
> > > +
> > > +		block_offset += block.header->size;
> >
> > I recall discussing with Jacopo in the context of another ISP driver
> > (Rockchip?) that this piece of non-trivial code should make it into the
> 
> I think it was in the context of the recent Amlogic C3 ISP review
> 
> and yes, c3_isp_params_vb2_buf_prepare() and
> rkisp1_params_prepare_ext_params() are identical.
> 
> The here introduced mali_c55_params_buf_queue() is indeed very
> similar (*). I guess it has been developed before the RkISP1
> implementation (from which the Amlogic one was copied) was refined.
> 
> *) The Mali C55 implementation happens at .buf_queue time and not at
> .buf_prepare time, not sure if it's intentional (and doesn't probably
> make much difference anyway). It also copies the parameters buffer
> -after- having validated the content, creating a tiny window between
> validation and copy where userspace can modify the buffer, Very
> unlikely but possible.
> 
> Understanding if the rkisp1/c3 routines can be copied in the mali c55
> implementation would make sure that yes, we should defintely move the
> validation to the core.
> 
> 
> > framework side before a next driver using it has been added. What's the
> > status of that? Same for other related bits.
> >
> 
> Yes, three users (if confirmed that mali can use the same validation
> code as the other two) are enough as indication we should move this to
> the framework. Problem is how to better design this.
> 
> My first thought would be to provide a .buf_prepare helper specific
> for extensible parameters that drivers can use. It would however need
> to receive some configuration parameters the validation code would
> need to know about: the version flags, the enable/disable flags, the
> expected sizes etc
> 
> Looking at other parts of the code that could be facotrized out,
> indeed the rkisp1_ext_params_config() and c3_isp_params_cfg_blocks()
> functions are very similar. The RkISP1 is a bit more complex
> (supports 'group' and 'features') and the handlers function
> signatures are slightly different. With some type punning and macro
> magic I'm sure we could factorize t out as well, but I would indeed
> start with validation...
> 
> Time for a drivers/media/v4l2-core/v4l2_extensible_params.c ?

I'd call this v4l2-params.c or something alike. Feel free to post an RFC.
:-)

If there are details that require different handling, it's possible to
have callbacks as well.

-- 
Kind regards,

Sakari Ailus

