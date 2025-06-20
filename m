Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2617C71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 08:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gW0nKsTDAJTpTyUWKpBQCVug/IvvnKACNQbxRORYDFw=; b=GMB1WU9W4EVOwik3Q0UHwpEhFp
	cj4RecIkbQpICgVrcZSG8LTAsu2i5L6Ku3gwId0QztJGY2HkcurOMM7HPcJo7tiWtSd9WeK0oc5aW
	25tUN/tl4rqMYwLKyRCHAUI5oiBbmhENFMpmJl11F96PRUZ5Mc5JxhYe3y30y0/+wDSYCVzWLrKFv
	8X2TTI8jd7C88xdLuduViee2F7WpmQAghohZxl2cbW/BDo5l3Biwqu35W5ovrN5bh2Y2+JkPsUNji
	dALvXPiJVxSXX7+9OKvvN4LWIyZkml5V5sO4wCIbpFHHVPxjfjjcXcjUwYqEATySh/wwY3TZSmyp2
	IiRYGyCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSXSj-0000000F7dk-3TMP;
	Fri, 20 Jun 2025 08:51:05 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSX13-0000000F2ka-1mUb;
	Fri, 20 Jun 2025 08:22:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750407750; x=1781943750;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H5xdLvsboeL7dlRK+EBFcm4+UCVw3/qL8XO1zqk3X1c=;
  b=nLMIA21YZ0IKuCxtBiWGD2dAYM7y6pNIDNG5aHd+wWxUNnqk/5YFiYDx
   tSkt0nahicuJhmELn90dR1rBK359MvB39fspG2+77skwmKjme7kYCyLqy
   g55Uy/Pt4gfNVg6K/B7Y4FIJbwqJ2yCxmL6CT9m3qdGyUYfpXLPYZtLu9
   NFxdhEl4iJ10Z7iHuVtPdmET9QZsuHfZRcaRjWeqS/Sw+yLc1wsLsEPlD
   CXomANaVr4RKJNulhxDO/jMB1nJE+WADT8OwZzr0aCQtliP4I+fRg9Wxg
   oGOQIHJS4InNSHY5G9Vz9YsmNK+lZLoMN9roZuVj03ksSpzP5mdRRex4J
   Q==;
X-CSE-ConnectionGUID: 7rTV3B8pQZe3cG1dWTKOHw==
X-CSE-MsgGUID: gV/QmqbxRUK4iUMMIu1pog==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52752115"
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="52752115"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 01:22:28 -0700
X-CSE-ConnectionGUID: lCc1D+E/SoWU5sVJ0FxjrA==
X-CSE-MsgGUID: 0EqHp+/xSrCciscrR+1Vbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="150990090"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.66])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 01:22:22 -0700
Date: Fri, 20 Jun 2025 10:22:14 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Gerald Loacker <gerald.loacker@wolfvision.net>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Markus Elfring <Markus.Elfring@web.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Collabora Kernel Team <kernel@collabora.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Alexander Shiyan <eagle.alexander923@gmail.com>, Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Mehdi Djait <mehdi.djait@bootlin.com>
Subject: Re: [PATCH v8 06/13] media: rockchip: add a driver for the rockchip
 camera interface
Message-ID: <xgycmti27be4ah64o4mflj6i2nzh34tbnlfqghiizqhtkusuif@ia3idwgrjoil>
References: <20240220-rk3568-vicap-v8-0-9d9cbc4b524d@collabora.com>
 <20240220-rk3568-vicap-v8-6-9d9cbc4b524d@collabora.com>
 <656zxutvwytnd5i5l3nknni47r3wofmmwtxycleekjtrkbgfeo@xm7xbzirh3ce>
 <5d3418a3-70f5-46d8-a538-72e6958d5d02@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d3418a3-70f5-46d8-a538-72e6958d5d02@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_012229_548396_AF5D0915 
X-CRM114-Status: GOOD (  33.79  )
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

Hi Michael,

On Wed, Jun 18, 2025 at 02:21:51PM +0200, Michael Riesch wrote:
> Hi Mehdi,
> 
> On 6/13/25 14:33, Mehdi Djait wrote:
> > Hi Michael,
> > 
> > [...]
> 
> Let's cut the long story short, shall we :-)
> 

Yes, sorry for that :)

> >> +static void rkcif_stream_fill_format(struct rkcif_stream *stream,
> >> +				     struct v4l2_pix_format_mplane *pix)
> >> +{
> >> +	const struct rkcif_output_fmt *fmt;
> >> +	u32 height, width;
> >> +
> >> +	fmt = rkcif_stream_find_output_fmt(stream, true, pix->pixelformat);
> >> +	height = clamp_t(u32, pix->height, CIF_MIN_HEIGHT, CIF_MAX_HEIGHT);
> >> +	width = clamp_t(u32, pix->width, CIF_MIN_WIDTH, CIF_MAX_WIDTH);
> >> +	v4l2_fill_pixfmt_mp(pix, fmt->fourcc, width, height);
> > 
> > The rkcif supports the SRGGB10P: the packed version of the SRGGB10.
> > 
> > When you try to capture with SRGGB10P, the following fails in
> > v4l2_fill_pixfmt_mp()
> > 
> > 	info = v4l2_format_info(pixelformat);
> > 	if (!info)
> > 		return -EINVAL;
> > 
> > The return value is not checked in rkcif_stream_fill_format() resulting
> > in a call to queue_setup returning with sizes[0] = 0
> 
> Thanks for pointing that out. I failed to realize that this helper
> function may return an error. What I can do is to implement the error
> propagation correctly. Of course this will only avoid the kernel
> warning, you still won't be able to stream.
> 
> > This will cause a kernel Warning in the vb2_core_reqbufs() because
> > plane_size = 0
> > 
> > Exactly here:
> > 
> > 	for (i = 0; i < num_planes; i++)
> > 		if (WARN_ON(!plane_sizes[i])) {
> > 			ret = -EINVAL;
> > 			goto error;
> > 		}
> > 
> > I still don't have the solution here but wanted to let you know about
> > it.
> 
> I only had a quick look at it, but apparently the compact formats are
> missing in the format list here:
> https://elixir.bootlin.com/linux/v6.16-rc2/source/drivers/media/v4l2-core/v4l2-common.c#L244
> for whatever reason.
> 
> Have you by chance tried adding a line like
> {
> 	.format = V4L2_PIX_FMT_SRGGB10P,
> 	.pixel_enc = V4L2_PIXEL_ENC_BAYER,
> 	.mem_planes = 1,
> 	.comp_planes = 1,
> 	.bpp = { 5, 0, 0, 0 },
> 	.bpp_div = { 4, 1, 1, 1 },
> 	.hdiv = 1,
> 	.vdiv = 1,
> }
> ?
> 
> 
> Maybe we can fix this, but please note that this issue should not block
> merging this patch series.
> 

Of course! The solution from the driver side is to check the return
code.

I will investigate the issue with v4l2_fill_pixfmt_mp() separately.

> Best regards,
> Michael

--
Kind Regards
Mehdi Djait

