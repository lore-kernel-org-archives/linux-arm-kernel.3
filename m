Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A53EC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 10:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3DEGWb1kwqI7AX69Qoy4+pgxQwOYg9ApVeMN1RIQsP4=; b=ZcLvC+p5+7qZ9my3+irSIfTA/O
	lCm7RiX6OQHFh2Xf0QjiDsKSqeVHUriNJZeSndmt6hG2uDkhUmnJxbQ5q6YTRNG0oAyTJE9Df+sZP
	79JUTKN8WM3ilE7ty5ZewXlVkcaTve1QeFioZZexS7EXJS/QWs9ME2JLtFABjNR63ICHZoJycDZoj
	g5q6TnwDKemaBtYuck4AE0TiOhaOW5LL7gKUD6LCDfrtangLh21aK/BbKu7QYVwo1CuFWufybY02d
	Y+xP0lnXPrQ4mhp6e39WGEmr7ZmnzMm9JGKvjQbCjGKFSaNjKG0VE38BE/7aCJZxmBBMEEksxbRwP
	i3vva+Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrlF-0000000GjJB-20Tz;
	Tue, 25 Feb 2025 10:01:57 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrQT-0000000Ge81-3k7i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 09:40:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740476429; x=1772012429;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9MeSK15KTX1GpVUkanLg3jxBL8S+QzQcHgh3wTNK8Oc=;
  b=SVyf1K/vlmFehsSRwi63p/4kZCS0jZKcGrEaJnPZGuQhrTTtkPbLUohr
   nyrw0qLZLXJGBXPBSroZXINT4m76p9Dly75J0gvnoDr2mSXzcoW644WPX
   8Rc0BF+rFdG7H8UPPjToPJ8o5sAOhzwOBhGSpagLnJkwZY2XceZ7NBpNz
   0PLKJpQc8O5skyzkQ6Xk46AY22BDnRc+rN0fLki7/tnT3WX4yREhl2kR2
   z48zGtMLBOgRnCe1VC4FfWGe/zqCWzlBpC/xGgGw7RX9Aey2bGd6cxQMC
   5yb3XbWYHSvGc2WUFVD7RLmqJWXzlMp/l4rY/LZ0hjoXaScYTy4hZiOmk
   Q==;
X-CSE-ConnectionGUID: OhXzUAa2SLGz7waHuOHwkQ==
X-CSE-MsgGUID: kvnMY749QBOsgRp+SZlW0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="40510225"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; 
   d="scan'208";a="40510225"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 01:40:27 -0800
X-CSE-ConnectionGUID: wuPiuA/zQd22MTq7/2Oa3Q==
X-CSE-MsgGUID: 1/aed8HrRI+DCsOedLJWuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117267075"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa008.jf.intel.com with SMTP; 25 Feb 2025 01:40:18 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 25 Feb 2025 11:40:16 +0200
Date: Tue, 25 Feb 2025 11:40:16 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
Message-ID: <Z72QAOA9xXbP16K-@kuha.fi.intel.com>
References: <cover.1740421248.git.mazziesaccount@gmail.com>
 <29ec24f1498392cafbecc0e0c0e23e1ce3289565.1740421248.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29ec24f1498392cafbecc0e0c0e23e1ce3289565.1740421248.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_014029_954426_C47B0572 
X-CRM114-Status: GOOD (  16.20  )
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

Hi,

> +/**
> + * device_get_child_node_count_named - number of child nodes with given name
> + *
> + * Scan device's child nodes and find all the nodes with a specific name and
> + * return the number of found nodes. Potential '@number' -ending for scanned
> + * names is ignored. Eg,
> + * device_get_child_node_count(dev, "channel");
> + * would match all the nodes:
> + * channel { }, channel@0 {}, channel@0xabba {}...
> + *
> + * @dev: Device to count the child nodes for
> + *
> + * Return: the number of child nodes with a matching name for a given device.
> + */
> +unsigned int device_get_child_node_count_named(const struct device *dev,
> +					       const char *name)
> +{
> +	struct fwnode_handle *child;
> +	unsigned int count = 0;
> +
> +	device_for_each_child_node(dev, child)
> +		if (fwnode_name_eq(child, "channel"))

s/"channel"/name/ ?

> +			count++;
> +
> +	return count;
> +}
> +EXPORT_SYMBOL_GPL(device_get_child_node_count_named);

I did not check how many users are you proposing for this, but if
there's only one, then IMO this should not be a global function yet.
It just feels to special case to me. But let's see what the others
think.

thanks,

-- 
heikki

