Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB3EFC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 11:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xlhZttfBaeee1ITegy9W8205Wv9l18ztKPwiT+T9UZg=; b=o04Mf5vpdT4YnIo1HpxCdSGEnz
	Ufi0IZ2nlDiHr2/GGd6hQLjU8RFdnhHxgljhuZGB2p8si6fGGhKMb930FnbGWAD6REJuKwDXi0/rj
	q5t0XF+JDYaMYMM4jCOe+K2NpWRTQ4gQFJw/7Mf2KvOMHv21ZpzRh5kxxPsooG+HRG3hE1+iQf/3I
	Ajpqb4uuvpaQKkqqlriKUdxhEz+lFQ/KQWHF+0kZGOX1I0Jy6+GL7cbxmGA3kpVE1MHWMsUR8tTUd
	XzQqBQrjI5+POzbEeQuqzKy8iyTg7ueWbD1ObW9KN2UzX1Y7CLrnmuialy8rxwzW6WrrvqZhf9aCh
	/G/UOBHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmsvf-0000000H008-0Ksu;
	Tue, 25 Feb 2025 11:16:47 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmsLz-0000000Gra2-1SGL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 10:39:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740479995; x=1772015995;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WyqYTE7rMoOZSS+5Gkk3EOQ86ZSaUphQT2/6XSSeDUA=;
  b=HSqEcUkrjRDeJrD+QwNnf7Hdm52L1zZuRk6AG/kCcfKd86McfZrhJI5U
   BrckvqWy8zK3ZK8Vqxl3EBGf4Ayka/CeFyiUBifh7Owa6CUs59dzfP6XJ
   eT6gY3aUSUdXQn0rQAJYVB3KdanO65un5Q/eCYAdKeePYA9imr1otEHGg
   SBHC4W6nOOozmvjZLwhKBhtdc9Rkrx+yDOJr4H3IKyl3lZ/QqBmvRR66X
   H4GK7JSGNZ3Dqr6BAB5x3Y0cy3wNgf6Q7u6u5Cv0HNJNGXCqG5L0en09L
   Dm0un32KoScMKVqgphaXUVhsULk/Y6iA6d0kxMcKhwxBKZnIcFMlG0NN5
   Q==;
X-CSE-ConnectionGUID: eDSDT4/NTCKvrZUr0bOpyg==
X-CSE-MsgGUID: she+bqzrTe+QHOto7m3UOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="58701582"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="58701582"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 02:39:53 -0800
X-CSE-ConnectionGUID: YEFntbX8TteoUjNIRJ5PNw==
X-CSE-MsgGUID: fVi37cX7QIWfmgGUTO0geA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="139595621"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 02:39:45 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tmsLl-0000000ExcQ-3fHY;
	Tue, 25 Feb 2025 12:39:41 +0200
Date: Tue, 25 Feb 2025 12:39:41 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Nuno Sa <nuno.sa@analog.com>, David Lechner <dlechner@baylibre.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Guillaume Stols <gstols@baylibre.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Dumitru Ceclan <mitrutzceclan@gmail.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Matteo Martelli <matteomartelli3@gmail.com>,
	Alisa-Dariana Roman <alisadariana@gmail.com>,
	Ramona Alexandra Nechita <ramona.nechita@analog.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v4 02/10] property: Add
 device_get_child_node_count_named()
Message-ID: <Z72d7TzZ21WITW3f@smile.fi.intel.com>
References: <cover.1740421248.git.mazziesaccount@gmail.com>
 <29ec24f1498392cafbecc0e0c0e23e1ce3289565.1740421248.git.mazziesaccount@gmail.com>
 <Z72QAOA9xXbP16K-@kuha.fi.intel.com>
 <Z72Zp8tpnvlFGdQ_@smile.fi.intel.com>
 <ad39b453-7e5b-49bd-a4fd-6a4988636130@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad39b453-7e5b-49bd-a4fd-6a4988636130@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_023955_440230_77BA8786 
X-CRM114-Status: GOOD (  31.33  )
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

On Tue, Feb 25, 2025 at 12:29:31PM +0200, Matti Vaittinen wrote:
> On 25/02/2025 12:21, Andy Shevchenko wrote:
> > On Tue, Feb 25, 2025 at 11:40:16AM +0200, Heikki Krogerus wrote:
> > > > +/**
> > > > + * device_get_child_node_count_named - number of child nodes with given name
> > > > + *
> > > > + * Scan device's child nodes and find all the nodes with a specific name and
> > > > + * return the number of found nodes. Potential '@number' -ending for scanned
> > > > + * names is ignored. Eg,
> > > > + * device_get_child_node_count(dev, "channel");
> > > > + * would match all the nodes:
> > > > + * channel { }, channel@0 {}, channel@0xabba {}...
> > > > + *
> > > > + * @dev: Device to count the child nodes for
> > 
> > This has an inconsistent kernel doc structure in comparison to the rest in this
> > file.
> > 
> > > > + * Return: the number of child nodes with a matching name for a given device.
> > > > + */
> > > > +unsigned int device_get_child_node_count_named(const struct device *dev,
> > > > +					       const char *name)
> > > > +{
> > > > +	struct fwnode_handle *child;
> > > > +	unsigned int count = 0;
> > > > +
> > > > +	device_for_each_child_node(dev, child)
> > > > +		if (fwnode_name_eq(child, "channel"))
> > > 
> > > s/"channel"/name/ ?
> > > 
> > > > +			count++;
> > > > +
> > > > +	return count;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(device_get_child_node_count_named);
> > > 
> > > I did not check how many users are you proposing for this, but if
> > > there's only one, then IMO this should not be a global function yet.
> > > It just feels to special case to me. But let's see what the others
> > > think.
> > 
> > The problem is that if somebody hides it, we might potentially see
> > a duplication in the future. So I _slightly_ prefer to publish and
> > then drop that after a few cycles if no users appear.
> 
> After taking a very quick grep I spotted one other existing place where we
> might be able to do direct conversion to use this function.
> 
> drivers/net/ethernet/freescale/gianfar.c
> 
> That'd be 2 users.

I haven't checked myself, I believe your judgement, but can you add a (rfc?)
patch at the end of this series to show that? With the luckily event of acking
by the network people we may have it already done.

> While I looked at it, it seems that a 'device_for_each_named_child_node()'
> -construct would have a few users.

-- 
With Best Regards,
Andy Shevchenko



