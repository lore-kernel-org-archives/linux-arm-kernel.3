Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9D9C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f93xjg0uLBDBgDN3Feaes9fqpPxtUviVuziWYGC/2Dc=; b=ts2xKtV7qK14yVhMqfwttgEtPj
	RNWq7YcBJuYKq2I3RUFJOOYcNLraSbvvFbwda5d+ZQ+F6oU1v0XD77pqSTTEqKA5lcOduHrZBEr7H
	IKL8jduj9Ax2+JiWmMqD01BhzRHiZsuLR/rKrw76a6zHUI2QUn4f20yADI/DxW0I7YH0STRbXl4GR
	OJcEBmv6vV7hwWYlevNCwzicoi9X1DIWpcojrqfZYoaisRN8ikxLKVkSEcwbW4/7ZawLw4g5XYMGM
	21FCd/8c01rxKxeuAsBO4SpZSX+dprSkchot3jb8BK7MJ95gVql1b8mCUWI3MMRPOmyR3VSOv7ddR
	SgWrI36w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxxn-00000000Gy4-3jYv;
	Tue, 25 Feb 2025 16:39:19 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmvTq-0000000HSC4-3wHI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 14:00:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740492015; x=1772028015;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z0NM4k/FSSDfqS2mjYdariSVt/ETmZ+fP+JtXH7aT5c=;
  b=OtiI1LmFCgXO3gPFMF9rhMaEYgJj/Hdb3VT8e8iUzg7ON2ogD8KBSqEu
   gkFz/iAZ+NhiqPAVcRY6F91QqCnIe+IDwN/rWt5m9/bgDNu+n+zkjik+D
   aQF+SS6vFhIDLGYH5Zw4B8VtAciP348paML1CXpAvN/cjjEbxTND1WLxD
   CWTJAK+mslbjGdUmo+KqFlEk7nkygrfOofxrovjmP34M5oL0GIGy6alZa
   aLgldDnZZIxqt73BBwIVh9ZmB2EJO6O8t/Qji9PMyqY2H3tmVZ08YLCrO
   Kx6kO3zVp+Cirq9umduyX1Pn7W/A4z6feddgcrV1VjdQ0tuCVOT+N96ma
   Q==;
X-CSE-ConnectionGUID: eZd3Dxb7SWGyNwg87Rhgyw==
X-CSE-MsgGUID: bqGHnxpOREyeXC6tcCbY+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41500375"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="41500375"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 06:00:09 -0800
X-CSE-ConnectionGUID: 5wdBO304QIGqIKmBnH0WxA==
X-CSE-MsgGUID: o2kscnJVSLCiJ/DTQH/+dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120502479"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 06:00:02 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tmvTa-0000000F0fX-0FCE;
	Tue, 25 Feb 2025 15:59:58 +0200
Date: Tue, 25 Feb 2025 15:59:57 +0200
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
Message-ID: <Z73M3Ua6u1FpgBEK@smile.fi.intel.com>
References: <cover.1740421248.git.mazziesaccount@gmail.com>
 <29ec24f1498392cafbecc0e0c0e23e1ce3289565.1740421248.git.mazziesaccount@gmail.com>
 <Z72QAOA9xXbP16K-@kuha.fi.intel.com>
 <Z72Zp8tpnvlFGdQ_@smile.fi.intel.com>
 <ad39b453-7e5b-49bd-a4fd-6a4988636130@gmail.com>
 <Z72d7TzZ21WITW3f@smile.fi.intel.com>
 <893a3c45-537e-47ad-afbd-1e5d3b9abe2c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <893a3c45-537e-47ad-afbd-1e5d3b9abe2c@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_060015_037331_807A3200 
X-CRM114-Status: GOOD (  23.39  )
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

On Tue, Feb 25, 2025 at 03:29:17PM +0200, Matti Vaittinen wrote:
> On 25/02/2025 12:39, Andy Shevchenko wrote:
> > On Tue, Feb 25, 2025 at 12:29:31PM +0200, Matti Vaittinen wrote:
> > > On 25/02/2025 12:21, Andy Shevchenko wrote:
> > > > On Tue, Feb 25, 2025 at 11:40:16AM +0200, Heikki Krogerus wrote:

...

> > > > > 
> > > > > I did not check how many users are you proposing for this, but if
> > > > > there's only one, then IMO this should not be a global function yet.
> > > > > It just feels to special case to me. But let's see what the others
> > > > > think.
> > > > 
> > > > The problem is that if somebody hides it, we might potentially see
> > > > a duplication in the future. So I _slightly_ prefer to publish and
> > > > then drop that after a few cycles if no users appear.
> > > 
> > > After taking a very quick grep I spotted one other existing place where we
> > > might be able to do direct conversion to use this function.
> > > 
> > > drivers/net/ethernet/freescale/gianfar.c
> > > 
> > > That'd be 2 users.
> > 
> > I haven't checked myself, I believe your judgement,
> 
> I took a better look and you obviously shouldn't believe :) The gianfar used
> of_node instead of the fwnode. So, it'd be a single caller at starters.

...which is the same as dev_of_node(), which means that you can use your
function there.

-- 
With Best Regards,
Andy Shevchenko



