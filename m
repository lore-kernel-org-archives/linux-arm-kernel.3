Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96FDC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 16:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l0JP9W6U1LjdFgPNOZLeL/srJMeNPv7qFK8Qwhn+e3s=; b=DebP14RifUR/WXLmjY3XytK1TX
	HgTJUmQIcnqyQsTRfghvT0ZL+Y7wYcuk7AmaDL+G7fIdDAzzpgQX8/btgAjGDFQoPQksoTl+7KjV+
	WZ+aT8/p0BuivahNSO954PY7URk1MrV/qNpdXtg9wpYeOniUtZ/iZEGkI88KjW+OzLQDX+iSRJKyz
	GlsCcG6fjkHh2H7XVFi7KTJguAQPFpI4/fndr5zGCEBwWVFj8wOOPAadmcFy7xpSqMV7HHyRKIKSS
	3QMpTpKxRXjb4WDXDojAZ1iLmjvcRXtNUZwP/MrICc05YhEB8StFPECMfCTeuuf8mqYjyR8whEAm5
	Ja8MASZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pMU-00000001D5U-2zqI;
	Mon, 07 Apr 2025 16:30:14 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1oQd-00000000y50-1Hd9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 15:30:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744039827; x=1775575827;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g0yyqdpKhTJeG+BAd0Yg/gUdc7l4ULmzVrzx9Rpmr6U=;
  b=m8CzBLsTptY3Xf6g3XGx7Ym50hFjohPW/qs+GBGQ6LppT0LzwxgHXsF3
   b0RlRYiFnDC69Xo5CEYZNaKCkyoRN2N+6Gvdv+SEzmGn3jUkdORwPheSW
   W45YupKX0EaGQIamqCggIelu14V1pNYZWcNQavmy/uwfbkz+rwy+9xVJL
   z+cp9ChupGNaBLWvhp3iDkRHy/kWSbReTKXr8Fl7sVhufSFgnQly11azp
   FVR3MKMEqMSNWG5j5/1QRBvzy3skwEOedskXRt9kymYNaHmesK7E6h8rr
   5HyiXcZGDJYYYI8eB06pfXDtTezsXuHiiyxuC6gTcGeTBArKJ1iGRZe/K
   w==;
X-CSE-ConnectionGUID: HAIhzz/LQ4izQBm+zqzgJw==
X-CSE-MsgGUID: YjGn+cM3Q4yCTKrLgxZVhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="62980194"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="62980194"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:30:26 -0700
X-CSE-ConnectionGUID: GDqsXhTrRFKRa8fqJC2lKA==
X-CSE-MsgGUID: vQcAL9GpSRixUUMsO+9hag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="158982543"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:30:17 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u1oQP-0000000A6tV-2nff;
	Mon, 07 Apr 2025 18:30:13 +0300
Date: Mon, 7 Apr 2025 18:30:13 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Subject: Re: [PATCH 06/16] PCI: of: Set fwnode.dev of newly created PCI
 device nodes
Message-ID: <Z_PvhVkdhubA9jAe@smile.fi.intel.com>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
 <20250407145546.270683-7-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407145546.270683-7-herve.codina@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_083027_356087_98FDFCCC 
X-CRM114-Status: GOOD (  19.29  )
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

On Mon, Apr 07, 2025 at 04:55:35PM +0200, Herve Codina wrote:
> Device-tree node can be created when CONFIG_PCI_DYNAMIC_OF_NODES. Those
> node are created and filled based on PCI core information but the
> fwnode.dev field is not set.
> 
> When later an overlay is applied, this consuses fw_devlink. Indeed,
> without any device attached to the node, fw_devlink considers that this
> node will never become a device. When this node is pointed as a
> supplier, devlink looks at its ancestors in order to find a node with a
> device that could be used as the supplier.
> 
> In the PCI use case, this leads to links that wrongly use the PCI root
> bridge device as the supplier instead of the expected PCI device.
> 
> Setting fwnode.dev to the dev of the PCI device allows devlink to use
> this device as a supplier and so, correct links are created.

...

> +	/*
> +	 * Set the fwnode.dev in order to have fw_devlink creating links
> +	 * pointing to this PCI device instead of walking up to the PCI host
> +	 * bridge.
> +	 */
> +	np->fwnode.dev = &pdev->dev;

This is too invasive. I suppose here should be a helper for this kind of
operation. If not, create one.

	fw_devlink_set_device(...);


or alike.

-- 
With Best Regards,
Andy Shevchenko



