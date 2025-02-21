Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47967C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 16:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vy7+b8anrb61DJ2IX45beRhJGFrDXc6FG14eu38MqW0=; b=MSUkk7Sfe2s7cGwVcRVzYYXhJy
	+6KpGbqIHrXjB5oJ9fSlhPhdxEuZJvjbzRoi3KOmjKZqgovC6NbkIrCzThbpzSIOxokVc40z8/kFO
	6DftHv6XXk9vMfoXsw7V2mBibvbx23Bi3q0V2/Llbfe7i74VSetjdVG12lkO91qyX4jVLYvTdJLuM
	IwpTMdfHvIyh9uPJifMSFYXx8i1vdL0FSSfaW0czUidsH1WXPPfZk53oZyY/WmbxLdLKizoN9nUZG
	2AebsWXlbkbnpszSjUSPFLlVte0vAGjMImRqfF1q0h4/DK4f59aWOi5CNPn/zG9zZTFI/9sV+jp9B
	4fSKQ+dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlW6z-00000006DzI-0jVB;
	Fri, 21 Feb 2025 16:42:49 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlW5U-00000006DeU-2jnk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 16:41:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740156076; x=1771692076;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WscDxsnPeboOXwOU6QK25fEzgybvqretWJ8oeCzqNCQ=;
  b=hgJYRkArHGCB8/uqCkINKZTYrTBSNsPngzNsKtOkDGhhrekOL7wASB49
   gcwsUW8vaFqSWu0VNpdJoqTkFNJz/MPQDbUfLfaj1AWxlQ6x4oNEFH1CL
   1Q9hGjTcx2H1kBU57CeHLtAiLCFzb/Aei+z/SttL1tBUq0URZ7pS7isUu
   +OlAOlZ8LYvR7Fh9WfWAY//GLBWs3RdcrO9DmF8276IKlLlL+WJOSyf8n
   b3zBWP6XDDUJOEplg+TEbC6nhSpIwFy6G1LPGoMP4Enu9YexgeVzXJke3
   goUWvQO47fGqYQInxVIE+wxsG6ygtJwmnvHCxtqInsK3JFdWuIzYKTBnf
   g==;
X-CSE-ConnectionGUID: VW6TogNzSpmDpRL2binxtw==
X-CSE-MsgGUID: 50ZmMGJzRaSUmqBqBWdlJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="58390949"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="58390949"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 08:41:12 -0800
X-CSE-ConnectionGUID: UimGude1RQaPxjrN7gVF9g==
X-CSE-MsgGUID: 7mnoeVakSyWE0PfzvQEy5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="120039765"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 08:41:08 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tlW5J-0000000Dh2u-1chT;
	Fri, 21 Feb 2025 18:41:05 +0200
Date: Fri, 21 Feb 2025 18:41:05 +0200
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
Message-ID: <Z7isoU9hKXlgsu33@smile.fi.intel.com>
References: <cover.1739967040.git.mazziesaccount@gmail.com>
 <6c5b678526e227488592d004c315a967b9809701.1739967040.git.mazziesaccount@gmail.com>
 <Z7ZB7RQhyI5Dohrq@smile.fi.intel.com>
 <b1c1ed68-2f4d-447c-9957-5a1bbc63ef6e@gmail.com>
 <Z7ci7tUlRQqZEZSN@smile.fi.intel.com>
 <ec76334b-bb13-4076-811d-9174170dd677@gmail.com>
 <Z7c2cBQpjoc9-Vyu@smile.fi.intel.com>
 <9018e23c-da28-41b0-b774-1598b946a2a1@gmail.com>
 <Z7dCnRzuQTaJXzmb@smile.fi.intel.com>
 <cb27d8b1-c978-4443-9ad2-96e930701976@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb27d8b1-c978-4443-9ad2-96e930701976@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_084116_733687_0FC09DD9 
X-CRM114-Status: GOOD (  57.55  )
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

On Fri, Feb 21, 2025 at 12:10:23PM +0200, Matti Vaittinen wrote:
> On 20/02/2025 16:56, Andy Shevchenko wrote:
> > On Thu, Feb 20, 2025 at 04:21:37PM +0200, Matti Vaittinen wrote:
> > > On 20/02/2025 16:04, Andy Shevchenko wrote:
> > > > On Thu, Feb 20, 2025 at 03:40:30PM +0200, Matti Vaittinen wrote:
> > > > > On 20/02/2025 14:41, Andy Shevchenko wrote:
> > > > > > On Thu, Feb 20, 2025 at 09:13:00AM +0200, Matti Vaittinen wrote:
> > > > > > > On 19/02/2025 22:41, Andy Shevchenko wrote:
> > > > > > > > On Wed, Feb 19, 2025 at 02:30:27PM +0200, Matti Vaittinen wrote:

...

> > > > > > > > > +EXPORT_SYMBOL_GPL(iio_adc_device_num_channels);
> > > > > > > > 
> > > > > > > > No namespace?
> > > > > > > 
> > > > > > > I was considering also this. The IIO core functions don't belong into a
> > > > > > > namespace - so I followed the convention to keep these similar to other IIO
> > > > > > > core stuff.
> > > > > > 
> > > > > > But it's historically. We have already started using namespaces
> > > > > > in the parts of IIO, haven't we?
> > > > > 
> > > > > Yes. But as I wrote, I don't think adding new namespaces for every helper
> > > > > file with a function or two exported will scale. We either need something
> > > > > common for IIO (or IIO "subsystems" like "adc", "accel", "light", ... ), or
> > > > > then we just keep these small helpers same as most of the IIO core.
> > > > 
> > > > It can be still pushed to IIO_CORE namespace. Do you see an issue with that?
> > > 
> > > No. I've missed the fact we have IIO_CORE O_o. Thanks for pointing it out!
> > > 
> > > > Or a new opaque namespace for the mentioned cases, something like IIO_HELPERS.
> > > 
> > > I am unsure if it really benefits to split this out of the IIO_CORE. I've a
> > > feeling it falls into the category of making things harder for user with no
> > > apparent reason. But yes, the IIO_CORE makes sense.
> > 
> > Probably I was not clear, I mean to put this under a given namespace. There is
> > no a such, we have currently:
> > 
> > IIO_BACKEND
> > IIO_DMA_BUFFER
> > IIO_DMAENGINE_BUFFER
> > IIO_GTS_HELPER
> > IIO_RESCALE
> 
> Ah. So, the IIO core stuff is still not in a namespace. Those listed above
> are all too specific (I believe, in general, and definitely to carry ADC
> helpers).
> 
> Adding 'ADC_HELPERS' would just add yet another way too specific one. So,
> currently there is no suitable namespace for these helpers, and I still
> believe they fit best to where the rest of the IIO-core stuff is.
> 
> If we want really play the namespace game, then the existing IIO stuff
> should be put in a IIO_CORE-namespace instead of creating more new small
> ones. I am afraid that adding all existing IIO core to a IIO_CORE namespace
> and converting all existing users to use the IIO_CORE is not a reasonable
> request for a person trying to:
> 
> 1. Write a driver
> 2. Add a small helper to aid others (instead of just melding it all in the
> given new driver - which does not benefit anyone else and just leads to code
> duplication in the long run...)

That's why more specific, but also a bit general might work, like IIO_HELPERS,
considering that they may be used by many drivers.

While it may be not your call, somebody should do the job. Jonathan? :-)

> > > > > > > (Sometimes I have a feeling that the trend today is to try make things
> > > > > > > intentionally difficult in the name of the safety. Like, "more difficult I
> > > > > > > make this, more experience points I gain in the name of the safety".)
> > > > > > > 
> > > > > > > Well, I suppose I could add a namespace for these functions - if this
> > > > > > > approach stays - but I'd really prefer having all IIO core stuff in some
> > > > > > > global IIO namespace and not to have dozens of fine-grained namespaces for
> > > > > > > an IIO driver to use...

...

> > > > > foo &= (~bar);
> > > > > 
> > > > > is _much_ faster than seeing:
> > > > 
> > > > Strongly disagree. One need to parse an additional pair of parentheses,
> > > > and especially when it's a big statement inside with nested ones along
> > > > with understanding what the heck is going on that you need them in the
> > > > first place.
> > > > 
> > > > On top of that, we have a common practices in the LK project and
> > > > with our history of communication it seems you are trying to do differently
> > > > from time to time. Sounds like a rebellion to me :-)
> > > 
> > > I only rebel when I (in my opinion) have a solid reason :)
> > > 
> > > > > foo &= ~bar;
> > > > > 
> > > > > and having to google the priorities.
> > > > 
> > > > Again, this is something a (regular) kernel developer keeps refreshed.
> > > > Or even wider, C-language developer.
> > > 
> > > Ha. As I mentioned, I've been writing C on a daily bases for almost 25
> > > years. I wonder if you intent to say I am not a kernel/C-language developer?
> > > Bold claim.
> > 
> > I'm just surprised by seeing that style from a 25y experienced C developer,
> > that's all.
> 
> I am not. If something, these 25 years have taught me to understand that
> even if something is simple and obvious to me, it may not be simple and
> obvious to someone else. Similarly, something obvious to someone else, is
> not obvious to me. Hence, I am very careful when telling people that:
> 
> >>> Again, this is something a (regular) kernel developer keeps refreshed.
> >>> Or even wider, C-language developer.
> 
> I may however say that "this is something _I_ keep refreshed (as a
> kernel/C-developer)".

True.

> As an example,
> 
> >>>> foo &= (~bar);
> 
> This is something _I_ find very clear and exact, with zero doubt if negation
> is applied before &=. For _me_ the parenthesis there _help_, and for _me_
> the parenthesis cause no confusion when reading the code.
> 
> I won't go and tell that I'd expect any C or kernel developer to be able to
> fluently parse "foo &= (~bar)". (Whether I think they should is another
> matter).

> Oh well, let's wait and see what Jonathan thinks of these helpers in
> general. We can continue the parenthesis discussion when we know whether the
> code is going to stay.

Sure, but it's not only about these helpers, it's about the style in general.
Spreading unneeded characters in the code seems to me as an attempt to put
_your_ rules over the subsytem's ones. Whatever, let's Jonathan to judge, we
will never agree on a keep growing list of things anyway...

-- 
With Best Regards,
Andy Shevchenko



