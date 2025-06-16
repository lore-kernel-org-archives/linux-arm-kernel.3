Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7E4C71155
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 12:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JdVcfJET7Dxtcjmwndr0ZscFzeUpQrIvRpTqWodsqTM=; b=YK3cMPjnXkmT4MJk2pkGoIgzWz
	Hl5lv8OKM4dv3T22cLGCPkI6bbZuopOiP7wrClQdC5FEjTTifrAJQVIhI/i3z9JbaD2OFoCuOz0yH
	cU6SLLdzkMoz1vojyfC4x8asSM06JRhMUNCHmzcfM/tkx8xxWtcjXsiLCMKjk846vomMt2O2E10Ht
	QyZvf2d2s4omuBDVo023oxq6gEiOoDiXWcxJDR5sPAf6iCc1MH4gswYCj0lHj1H8MToagJxNtgVEz
	/ep1EL0nCyLrZ2DX3EL2jpUZCzT82GbRYy2odMMuVQODaCt1+CM8OYCdnOJxkPVwwWGg0xnR2T5gT
	0xKS1m2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR9IO-00000004Qe8-2iMa;
	Mon, 16 Jun 2025 12:50:40 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR8Bu-00000004ED1-2zG2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 11:39:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750073994; x=1781609994;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ma9+AWd3cIZf5Lwt4Vp92HukPMmMYh/Kb6RRViodh+0=;
  b=RQl8sq20vMv3fxNKRmqNp0Sc2ODwBAjvN3nctJYJHKywa+mCheKwKWzj
   yjXZm+nALaiXK/vxd1O1mdFC5kkGwKE14y+t4KPPVxpGBpsKSZY1clikA
   UiMfruklXMBkVmGsCV+c9sgOIFKxNabHPypyCMFI5sy4pXdnS/SPNKC6T
   QAr2iHiZX4HbRa8PGIv4wn8tjqVC/ZyaSrZGhHcC4Z19WqtYjtnpTJLK8
   KPenbezXJosXM9G+6ZqvtMl8bZgVURMiWiQ73BdidB8LXJYXi11IS6g+d
   TDGUrVvjI+kF/p8qYh55h+3AWP67xLWku1g5aJl4wfjL5e/GdmunDXpyj
   g==;
X-CSE-ConnectionGUID: tgoarVttRDO298zkPJM6WA==
X-CSE-MsgGUID: R+am/AETQgurEHM4H+AjKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52303592"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="52303592"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 04:39:54 -0700
X-CSE-ConnectionGUID: 4QcUPl3STGqo4EMxHH73Ew==
X-CSE-MsgGUID: hF5ltUg9SAaHsRMrX3NVog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="148282666"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 04:39:43 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uR8Be-000000073pQ-0wKC;
	Mon, 16 Jun 2025 14:39:38 +0300
Date: Mon, 16 Jun 2025 14:39:38 +0300
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
	Davidlohr Bueso <dave@stgolabs.net>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 07/28] drivers: core: Use fw_devlink_set_device()
Message-ID: <aFACeiO9ysybUwtv@smile.fi.intel.com>
References: <20250613134817.681832-1-herve.codina@bootlin.com>
 <20250613134817.681832-8-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613134817.681832-8-herve.codina@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_043954_794903_7FD22660 
X-CRM114-Status: UNSURE (   9.05  )
X-CRM114-Notice: Please train this message.
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

On Fri, Jun 13, 2025 at 03:47:47PM +0200, Herve Codina wrote:
> The code set directly fwnode->dev field.
> 
> Use the dedicated fw_devlink_set_device() helper to perform this
> operation.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



