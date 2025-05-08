Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23FEDC3ABC6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 19:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JVRXhmY/kAfo2cZtUh2KQb4tsUUbM6FKG1N6mgoSGJw=; b=YlKx8/+MRdRwrfKwdt2Uqg/NeS
	ukEfaAqO8IkYZOE+tvqXjW9dk7E2MduYuOO+lRpvlmjOhpX8BIXPhn/CbW7S8xAX6l3FOmPUCHf8u
	ci8VE0t6oA2LWhfWe4lrqRKrP0FrSVncqodnR+7IKiF1uDqaY2raVyxweboTBVlshe/2yb97zb65b
	oFYxcFlFDG0TSzVaCG3BTH82DdiSODCP6NxMYMopZ/q3iw08WbtK4i3/s6eL/nLaF0+AHOQbg8HYY
	JK7yNd2GAqrZe44sDc2oz9dZmBYB/lU4fTu3aUsOfhQHDFSmHG2Bl+q9X3hmC78x8aCPz3IRSarxh
	C/iyVUmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD6kj-00000001dZG-45VP;
	Thu, 08 May 2025 19:17:53 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD6ih-00000001dKA-3HJA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 19:15:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746731747; x=1778267747;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kc2apVHoDu/c5UkKVj1TkV8BatDP+BUXsduJk1vXdY4=;
  b=IJPEKDc8Gbyd+Dmhm87CuwHG8oa/mNnzQ29djDr6GHa5pxY5oe2/a5+M
   TgDNdLq6MjlK6oIH2Tdh8WembFTyTcxRSPbzOMgOmpVQjLyLJcyxh3d9p
   uN0ovB8nSx2AbQZD6S73o3md0UBBllItj/MfPlUZ78AwATkwG0nQv9Nek
   7W0rsrOV3rpYPBVKpPbyWgMRpEmra4XVtYP2qCnVCB02cjdxQBGRR5mLp
   ddLcEnXhF4xekYHFUXk7brOc7bl33Tl5PQZt5uM9YkAtLUKQWZJW/AzEH
   qwU2XHkZzKsrX33m3meqq0m9Wy3zHyjRXC9Y857vwkutk9XXmGTazcvT6
   g==;
X-CSE-ConnectionGUID: xRnysBKJRiWTXex5wOA2qw==
X-CSE-MsgGUID: QR92OGc4SRuM0li0/bYxmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="51198439"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="51198439"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 12:15:44 -0700
X-CSE-ConnectionGUID: bMEPplM9TIuxI2f+ID6KOw==
X-CSE-MsgGUID: tTrlCkqcRDSjExAAr9K+qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="137383198"
Received: from smile.fi.intel.com ([10.237.72.55])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 12:15:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uD6iR-00000004D4L-4Bgk;
	Thu, 08 May 2025 22:15:32 +0300
Date: Thu, 8 May 2025 22:15:31 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 16/26] i2c: mux: Create missing devlink between mux
 and adapter physical device
Message-ID: <aB0C05WnKkgslAuT@smile.fi.intel.com>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
 <20250507071315.394857-17-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507071315.394857-17-herve.codina@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_121547_832493_C491AA5E 
X-CRM114-Status: GOOD (  23.80  )
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

On Wed, May 07, 2025 at 09:12:58AM +0200, Herve Codina wrote:
> When removing an i2c controller device handling an i2c bus where an i2c
> mux is connected to, the removal process hangs and is stuck in the
> wait_completion() call done in i2c_del_adapter().
> 
> The i2c_del_adapter() tries to removed the i2c adapter related to the
> i2c controller device and the wait_completion() is waiting for the i2c
> adapter device release. This release is performed when the device is no
> more used (i.e. refcount reaches zero).
> 
> When an i2c mux is involved in an i2c path, the struct dev topology is
> the following:
>     +----------------+                +-------------------+
>     | i2c controller |                |      i2c mux      |
>     |     device     |                |      device       |
>     |       ^        |                |                   |
>     |       |        |                |                   |
>     |  dev's parent  |                |                   |
>     |       |        |                |                   |
>     |   i2c adapter  |                | i2c adapter chanX |
>     |     device  <---- dev's parent ------  device       |
>     |   (no driver)  |                |    (no driver)    |
>     +----------------+                +-------------------+
> 
> When an i2c mux device creates an i2c adapter for its downstream
> channel, a reference is taken to its adapter dev's parent. This parent
> is the i2c mux upstream adapter device.
> 
> No relationship exists between the i2c mux device itself and the i2c
> controller device (physical device) in order to have the i2c mux device
> calling i2c_del_adapter() to remove its downtream adapters and so,
> release references taken to the upstream adapter.
> 
> This consumer/supplier relationship is typically a devlink relationship.
> 
> Also, i2c muxes can be chained and so, the upstream adapter can be
> supplied by either an i2c controller device or an other i2c mux device.
> 
> In order to get the physical device of the adapter a mux is connected
> to, rely on the newly introduced i2c_adapter_get_physdev() and create
> the missing devlink between the i2c mux device and the physical
> device of the adapter the mux is connected to.
> 
> With that done, the i2c mux device is removed before the device
> handling the upstream i2c adapter (i2c controller device or i2c mux
> device). All references are released and the i2c_del_adapter() call
> performed by driver handling the upstream adapter device is not blocking
> anymore.

...

> +	/*
> +	 * There is no relationship set between the mux device and the physical
> +	 * device handling the parent adapter. Create this missing relationship
> +	 * in order to remove the i2c mux device (consumer) and so the dowstream
> +	 * channel adapters before removing the physical device (supplier) which
> +	 * handles the i2c mux upstream adapter.
> +	 */
> +	parent_physdev = i2c_get_adapter_physdev(parent);
> +	dl = device_link_add(muxc->dev, parent_physdev, DL_FLAG_AUTOREMOVE_CONSUMER);
> +	if (!dl) {
> +		dev_err(muxc->dev, "failed to create device link to %s\n",
> +			dev_name(parent_physdev));
> +		put_device(parent_physdev);
> +		ret = -EINVAL;
> +		goto err_free_priv;
> +	}
> +	put_device(parent_physdev);

Since you are not checking parent_physdev for NULL, the dev_name() can print a
"(null)" string. Is this by design?

-- 
With Best Regards,
Andy Shevchenko



