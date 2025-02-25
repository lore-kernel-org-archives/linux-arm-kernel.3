Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4CCC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 11:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kh6VEvloO4YquypZUFqR1MccY+ndKasOTSRyJgsJqRw=; b=TS3kMAT/DlmhIVG/FWS8vERrWy
	Oxr+qvOlG2dgA7bHTdFS8eD9NoP0pCdvS0RjfcfKYvclFChrmw8cgGEg3DY6mbgD8KKShUWFMSvRy
	1l90Syd+eOITl2YOhujQb1x0WfvDO6jfURA43YVlFJ0OL5VZcXbu7eMSKoCgqF2hyuqYpLWW+mYda
	OmDBeYFlRdSN/dWQNeIofZYQQxhDb5Xnz6vMJqx01x1R2Mm0uY6NwHTUMFK6TFStOmfTESzu17e4+
	p4KE+3ZeD+QfQ35IrNUOlcbEsiwB+ZIeQi9glSNgIbfElaSINNhbs65PMAnzOmrh3vRIn8M+D0Y/f
	HcAD+Ohw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmtUi-0000000H6T7-32Eq;
	Tue, 25 Feb 2025 11:53:00 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tms4N-0000000GnsJ-0GNF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 10:21:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740478903; x=1772014903;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O7XFosUMq18SOY1Uke3gT9fhryi5WO3Dg5KUjBJMkkw=;
  b=SMKLBp24p9xpXOq7b9JmUrMxQcts8aHgTbADKRo+uH8LVNqVx/O5D944
   ansC8ABK+ecdBOQXa4YvgjqRA3qQ+6sFazc6CRgfb9ONawLg3gl/+Rfnu
   inBSuGTn8N1MeYjsjf2Zk2DaBN40IQYm79V3Bn+ogN/WE0H4wo8hcZovP
   hqUHVqDlzBK/yfVDDp0cwtJLnZQTv4RGxLBbUhtfNqV8lEC5TfjN56xNq
   HCgGRmClgidWpEPkRu9Tt1IBnGNClVEI7g+UqHABwI6wMhnArWQ2NhltQ
   pH6rUbF3fB6uEqlFAQDiaYpCjBN+U4xdeAd4pF5TWr0XejbqNw2l30ALT
   A==;
X-CSE-ConnectionGUID: AmWIYWqmQ/uDVLuZS+OuIg==
X-CSE-MsgGUID: t5agoJZJQkiLvNvuYIAtwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="44101713"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="44101713"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 02:21:39 -0800
X-CSE-ConnectionGUID: scDSegHXRMquAd8KbKBguA==
X-CSE-MsgGUID: Q73F1GJkT++WQOlPBRuFvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="121321448"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 02:21:31 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tms47-0000000ExN6-17ps;
	Tue, 25 Feb 2025 12:21:27 +0200
Date: Tue, 25 Feb 2025 12:21:27 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>,
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
Message-ID: <Z72Zp8tpnvlFGdQ_@smile.fi.intel.com>
References: <cover.1740421248.git.mazziesaccount@gmail.com>
 <29ec24f1498392cafbecc0e0c0e23e1ce3289565.1740421248.git.mazziesaccount@gmail.com>
 <Z72QAOA9xXbP16K-@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z72QAOA9xXbP16K-@kuha.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_022143_114956_D7168A3A 
X-CRM114-Status: GOOD (  21.84  )
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

On Tue, Feb 25, 2025 at 11:40:16AM +0200, Heikki Krogerus wrote:
> > +/**
> > + * device_get_child_node_count_named - number of child nodes with given name
> > + *
> > + * Scan device's child nodes and find all the nodes with a specific name and
> > + * return the number of found nodes. Potential '@number' -ending for scanned
> > + * names is ignored. Eg,
> > + * device_get_child_node_count(dev, "channel");
> > + * would match all the nodes:
> > + * channel { }, channel@0 {}, channel@0xabba {}...
> > + *
> > + * @dev: Device to count the child nodes for

This has an inconsistent kernel doc structure in comparison to the rest in this
file.

> > + * Return: the number of child nodes with a matching name for a given device.
> > + */
> > +unsigned int device_get_child_node_count_named(const struct device *dev,
> > +					       const char *name)
> > +{
> > +	struct fwnode_handle *child;
> > +	unsigned int count = 0;
> > +
> > +	device_for_each_child_node(dev, child)
> > +		if (fwnode_name_eq(child, "channel"))
> 
> s/"channel"/name/ ?
> 
> > +			count++;
> > +
> > +	return count;
> > +}
> > +EXPORT_SYMBOL_GPL(device_get_child_node_count_named);
> 
> I did not check how many users are you proposing for this, but if
> there's only one, then IMO this should not be a global function yet.
> It just feels to special case to me. But let's see what the others
> think.

The problem is that if somebody hides it, we might potentially see
a duplication in the future. So I _slightly_ prefer to publish and
then drop that after a few cycles if no users appear.

Also this misses the test cases.

-- 
With Best Regards,
Andy Shevchenko



