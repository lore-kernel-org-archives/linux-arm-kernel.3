Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CEDBC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 14:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YEheO4chsxqYwB7JFpZt886lvSpgriJu9fWMC+N/yz0=; b=NxIYykAhm/6nZHm60/gkhZvYCc
	3HK8ts5WhdNvjzROnis4TmkN000G86hRdRdZQrxftBc5YMjsc6GOeWSTSCHHcKyhEU1rU5Pdip/45
	w0N731BiHPVCUecjPI5qIzM+uN/I/JzXcx0dqLj7IAeUZQxeNXYAb7cXKwXgQrWIJS2UbR6tQf7Nw
	0TlfeOHCB5JTPVQocCn/VMGOCPfyNS1gyKN9OtgksQIUBNaXo3Nmr0QWt9mOS8VT1EVkIi2k2c92I
	Lm6acMZ6V4gD5bu/FEvHpiWTCzX07JOqqZLloPZsl92gKc9F0H+moJuWWnmIZ1cattuu26iPQUGzC
	CFViFfrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl81R-00000001Rjw-0SnL;
	Thu, 20 Feb 2025 14:59:29 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7yl-00000001Qys-0jUB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 14:56:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740063403; x=1771599403;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YbwDdBsjti3If6R1AwRXFGvljRGPfJvCwZ3grv5CLiE=;
  b=L8q55MNyVKvhz6/+2dJcZRcKmuBMTiYZ0CEnZwQ29lqb06jXUFI1EOwq
   fbXSuIAH4MBqz/2ozbYLlZY82Dl2doTdvvsE2JCStx1X0kQBQuqVnOXfb
   z4K0XU7i+SWtNnEUVcrR4jexiKmh2+uAnt746Zlsp8T+3DIa5Tv+qZQLX
   RsA7x44r1ICZEaMgXG7X/5GJorzEiwohM/YNPG0l0R0Jj+J9LKvgZYCXT
   uEgZ0OsZbww5wTiZ1vkCH7R7nRSqwc+dX11r6EHLD2vPPgdPjWNSa2y9p
   jthgRGUUtG6bPw81wGoZt63h9jNxgBlsXQbSSZunegoZ4G2BAaCRNMwIe
   g==;
X-CSE-ConnectionGUID: o6yCt60tTdOqtDiMVUDaNQ==
X-CSE-MsgGUID: mpHCwoayS2qEELgLZJmEpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="63318715"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="63318715"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 06:56:38 -0800
X-CSE-ConnectionGUID: kEVuldFkQf6vlSbyMU3vxA==
X-CSE-MsgGUID: DEsCk3iDTmePuyZP91z/Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="145916713"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 06:56:34 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tl7yY-0000000DMq3-05wg;
	Thu, 20 Feb 2025 16:56:30 +0200
Date: Thu, 20 Feb 2025 16:56:29 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Nuno Sa <nuno.sa@analog.com>, David Lechner <dlechner@baylibre.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3 2/9] iio: adc: add helpers for parsing ADC nodes
Message-ID: <Z7dCnRzuQTaJXzmb@smile.fi.intel.com>
References: <cover.1739967040.git.mazziesaccount@gmail.com>
 <6c5b678526e227488592d004c315a967b9809701.1739967040.git.mazziesaccount@gmail.com>
 <Z7ZB7RQhyI5Dohrq@smile.fi.intel.com>
 <b1c1ed68-2f4d-447c-9957-5a1bbc63ef6e@gmail.com>
 <Z7ci7tUlRQqZEZSN@smile.fi.intel.com>
 <ec76334b-bb13-4076-811d-9174170dd677@gmail.com>
 <Z7c2cBQpjoc9-Vyu@smile.fi.intel.com>
 <9018e23c-da28-41b0-b774-1598b946a2a1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9018e23c-da28-41b0-b774-1598b946a2a1@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_065643_288316_877B9827 
X-CRM114-Status: GOOD (  38.42  )
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

On Thu, Feb 20, 2025 at 04:21:37PM +0200, Matti Vaittinen wrote:
> On 20/02/2025 16:04, Andy Shevchenko wrote:
> > On Thu, Feb 20, 2025 at 03:40:30PM +0200, Matti Vaittinen wrote:
> > > On 20/02/2025 14:41, Andy Shevchenko wrote:
> > > > On Thu, Feb 20, 2025 at 09:13:00AM +0200, Matti Vaittinen wrote:
> > > > > On 19/02/2025 22:41, Andy Shevchenko wrote:
> > > > > > On Wed, Feb 19, 2025 at 02:30:27PM +0200, Matti Vaittinen wrote:

...

> > > > > > > +EXPORT_SYMBOL_GPL(iio_adc_device_num_channels);
> > > > > > 
> > > > > > No namespace?
> > > > > 
> > > > > I was considering also this. The IIO core functions don't belong into a
> > > > > namespace - so I followed the convention to keep these similar to other IIO
> > > > > core stuff.
> > > > 
> > > > But it's historically. We have already started using namespaces
> > > > in the parts of IIO, haven't we?
> > > 
> > > Yes. But as I wrote, I don't think adding new namespaces for every helper
> > > file with a function or two exported will scale. We either need something
> > > common for IIO (or IIO "subsystems" like "adc", "accel", "light", ... ), or
> > > then we just keep these small helpers same as most of the IIO core.
> > 
> > It can be still pushed to IIO_CORE namespace. Do you see an issue with that?
> 
> No. I've missed the fact we have IIO_CORE O_o. Thanks for pointing it out!
> 
> > Or a new opaque namespace for the mentioned cases, something like IIO_HELPERS.
> 
> I am unsure if it really benefits to split this out of the IIO_CORE. I've a
> feeling it falls into the category of making things harder for user with no
> apparent reason. But yes, the IIO_CORE makes sense.

Probably I was not clear, I mean to put this under a given namespace. There is
no a such, we have currently:

IIO_BACKEND
IIO_DMA_BUFFER
IIO_DMAENGINE_BUFFER
IIO_GTS_HELPER
IIO_RESCALE

> > > > > (Sometimes I have a feeling that the trend today is to try make things
> > > > > intentionally difficult in the name of the safety. Like, "more difficult I
> > > > > make this, more experience points I gain in the name of the safety".)
> > > > > 
> > > > > Well, I suppose I could add a namespace for these functions - if this
> > > > > approach stays - but I'd really prefer having all IIO core stuff in some
> > > > > global IIO namespace and not to have dozens of fine-grained namespaces for
> > > > > an IIO driver to use...

...

> > > foo &= (~bar);
> > > 
> > > is _much_ faster than seeing:
> > 
> > Strongly disagree. One need to parse an additional pair of parentheses,
> > and especially when it's a big statement inside with nested ones along
> > with understanding what the heck is going on that you need them in the
> > first place.
> > 
> > On top of that, we have a common practices in the LK project and
> > with our history of communication it seems you are trying to do differently
> > from time to time. Sounds like a rebellion to me :-)
> 
> I only rebel when I (in my opinion) have a solid reason :)
> 
> > > foo &= ~bar;
> > > 
> > > and having to google the priorities.
> > 
> > Again, this is something a (regular) kernel developer keeps refreshed.
> > Or even wider, C-language developer.
> 
> Ha. As I mentioned, I've been writing C on a daily bases for almost 25
> years. I wonder if you intent to say I am not a kernel/C-language developer?
> Bold claim.

I'm just surprised by seeing that style from a 25y experienced C developer,
that's all.

-- 
With Best Regards,
Andy Shevchenko



