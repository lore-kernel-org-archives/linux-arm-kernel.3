Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A2FC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 15:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7VmbHQVcNcaj5mLcCWKKe9/7FkTkD0wC6QgqYfvVeMM=; b=Yok292drC7TtZ2EFxyYrpfrObO
	w8e2lSEr5BitkoWDvEHR6WAvvC5IuSGaA7+MqVKfBM/ejKMKL1BVpmyKN6x5+g29Kdc/yWWBzbHvF
	eJOi6lsPjLUstJ2nvUQtQ5lCr/emGe/zCoKalvJ593v5o9+fQnq9VEr2GP+bP72f0+refRV3dwGGC
	po242P0KOTkaMwTOqfqOST37Dv4SL7Ec5HVAjOrHkQzqKBNh6fbFQxCnDpzpOoIw5QN8K2seNZApl
	tfOYjMT9xH+CewCiMZsM2HwrJ+GoAXDk1tZG/reo5S6wLEAwTA+5y0uV4KRAJjM2i+YvvhUeRfDJ9
	qVS6GpLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0Yc-00000007EFm-0YiF;
	Tue, 10 Jun 2025 15:06:34 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyNx-00000006pJB-36vx;
	Tue, 10 Jun 2025 12:47:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749559646; x=1781095646;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q9YIQ730GHAcOU4O1jEnaS7atkULzfK70EqJ4k2AIrQ=;
  b=mbv0K9yh6wc5r9l8OjSk/rNCR7b+1guJ9tnq40h6PMkyeu94WnvSZ2mJ
   pD07DZPLnzXZVXB/4KLQCdGa7NgfJum6b3VD4XtuGmcEXFj2YGctsPu78
   yN4pTpJrQO3kRLeGw2dGfDlRFs8eEs0OmV6CUC071L4upAa/0Tmp3APlj
   CBVdelXOmOogrjDdbxE4A7YHMhLwBq5HJrWumCLCptmRhH4CDDDyJMxo9
   12P/x/9vOL/3n+IjIBA1KmD4B5tEbzzXy26JLAQsrRqopnkuBmu0gfIWR
   4BWFJqXfIVxhEHo/RxHIsi3dDzC/QEqvtGqQQmsj7/g8agcgdqfZcUmcf
   A==;
X-CSE-ConnectionGUID: 0apR7dJtQXGLBtgDJ1M/9g==
X-CSE-MsgGUID: 4cNXuT2SQTiF3skfNj1zEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="55458313"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="55458313"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 05:47:22 -0700
X-CSE-ConnectionGUID: 4Cziqe11QyubbBtGWExN/A==
X-CSE-MsgGUID: 5JQpjcB0Qjym4IDP1f45tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="151700327"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.55])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 05:47:18 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8F7F011FB81;
	Tue, 10 Jun 2025 15:47:15 +0300 (EEST)
Date: Tue, 10 Jun 2025 12:47:15 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Maxime Ripard <mripard@kernel.org>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	Naushir Patuck <naush@raspberrypi.com>, linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: bcm2835-unicam: Remove RGB24 support
Message-ID: <aEgpU9VUGZuSHpC0@kekkonen.localdomain>
References: <20250606-rpi-unicam-rgb-bgr-fix-v1-1-9930b963f3eb@kernel.org>
 <20250609003751.GD14545@pendragon.ideasonboard.com>
 <CAPY8ntCnz6nkJSredd-sgMr87=0vuZ0OtfiMoPOfCZisKkzTHg@mail.gmail.com>
 <20250610095238.GA28428@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610095238.GA28428@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_054725_791832_C85CAAF4 
X-CRM114-Status: GOOD (  44.45  )
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

Hi Laurent, others,

On Tue, Jun 10, 2025 at 12:52:38PM +0300, Laurent Pinchart wrote:
> On Mon, Jun 09, 2025 at 03:33:29PM +0100, Dave Stevenson wrote:
> > On Mon, 9 Jun 2025 at 01:38, Laurent Pinchart wrote:
> > > On Fri, Jun 06, 2025 at 04:53:03PM +0200, Maxime Ripard wrote:
> > > > The RGB24 V4L2 format is defined as a pixel format with 8 bits per
> > > > components, with the components being in the red, green, and blue order
> > > > from left to right.
> > > >
> > > > The RGB MIPI-CSI2 is defined in the specification (Section 11.3.1,
> > > > RGB888) with blue coming first, then green, then red. So the opposite of
> > > > what V4L2 means by RGB.
> > > >
> > > > Since the hardware cannot reorder the components, this means that when
> > > > selecting the RGB24 format, you get inverted red and blue components
> > > > compared to what you'd expect.
> > > >
> > > > The driver already supports BGR24, so we can simply remove the RGB24
> > > > format from the driver.
> > >
> > > The only reason I could think of to explain why the driver exposes
> > > V4L2_PIX_FMT_RGB24 is to support CSI-2 sources that transfer RGB888 data
> > > with a non-standard order. I don't know what hardware would do that.
> > > Dave, Naush, do you recall why this pixel format is supported by the
> > > unicam driver ?
> > 
> > I've lost track of exactly what gets validated along the pipeline.
> > unicam_video_link_validate [1] looks to ensure that the V4L2 pixel
> > format and media bus codes match as listed in the table.
> > 
> > tc358743, adv7604, adv7511, and adv748x are all saying they produce
> > MEDIA_BUS_FMT_RGB888_1X24
> > ov5640 says it produces MEDIA_BUS_FMT_BGR888_1X24.
> > 
> > Is that an error in the ov5640 driver? If not, then both entries have
> > to be in the table to support all those drivers.
> 
> We haven't standardized which media bus code to use for 24-bit RGB on
> CSI-2, so I'm not surprised drivers didn't get it right :-( The adv7604
> and adv7511 shouldn't be relevant here though, as they're not CSI-2
> devices. tc358743 and adv748x are relevant.

My understanding is the order indeed is BGR. But let's say that if there's
a device that generates RGB (as in pixel order) pixel data, then it should
be reflected in V4L2 pixelformat as well.

> 
> Sakari, which media bus code would you expect ?

MEDIA_BUS_FMT_BGR888_1X24. That's actually used in the example as well:
<URL:https://hverkuil.home.xs4all.nl/spec/userspace-api/v4l/subdev-formats.html#v4l2-mbus-pixelcode>.

> 
> > Looking at alvium-csi2.c and st-mipid02.c, both mappings are included
> > there (and RBG888 in the case of alvium).
> > Unicam's hardware doesn't care about the ordering as it just writes
> > the incoming data to memory, so having all the sensible mappings
> > between MEDIA_BUS_FMT_* and V4L2_PIX_FMT_* values makes sense.
> > 
> > My initial reaction though is that simply removing the entry won't
> > solve the problem anyway. You won't get a match between the
> > MEDIA_BUS_FMT_RGB888_1X24 requested by tc358743 and a supported V4L2
> > pixel format, so the link_validate will fail.
> > Swapping either fourcc or code between the two entries would be the
> > fix I was expecting.
> > 
> > [1] https://github.com/torvalds/linux/blob/master/drivers/media/platform/broadcom/bcm2835-unicam.c#L2151-L2169
> > 
> > > > Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
> > > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > > ---
> > > >  drivers/media/platform/broadcom/bcm2835-unicam.c | 5 -----
> > > >  1 file changed, 5 deletions(-)
> > > >
> > > > diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > > index f10064107d543caf867249d0566a0f42d6d8c4c6..1f549019efd53c9aae83193e74f1a3601ebf274d 100644
> > > > --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > > +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > > @@ -338,15 +338,10 @@ static const struct unicam_format_info unicam_image_formats[] = {
> > > >       /* RGB Formats */
> > > >               .fourcc         = V4L2_PIX_FMT_RGB565, /* gggbbbbb rrrrrggg */
> > > >               .code           = MEDIA_BUS_FMT_RGB565_1X16,
> > > >               .depth          = 16,
> > > >               .csi_dt         = MIPI_CSI2_DT_RGB565,
> > > > -     }, {
> > > > -             .fourcc         = V4L2_PIX_FMT_RGB24, /* rgb */
> > > > -             .code           = MEDIA_BUS_FMT_RGB888_1X24,
> > > > -             .depth          = 24,
> > > > -             .csi_dt         = MIPI_CSI2_DT_RGB888,
> > > >       }, {
> > > >               .fourcc         = V4L2_PIX_FMT_BGR24, /* bgr */
> > > >               .code           = MEDIA_BUS_FMT_BGR888_1X24,
> > > >               .depth          = 24,
> > > >               .csi_dt         = MIPI_CSI2_DT_RGB888,
> > > >
> > > > ---
> > > > base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
> > > > change-id: 20250606-rpi-unicam-rgb-bgr-fix-d1b6f46a75ad
> 

-- 
Regards,

Sakari Ailus

