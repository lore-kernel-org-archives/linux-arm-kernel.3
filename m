Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5778C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 12:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GMZxfN46qBFe0l9X6tDmqZc8eIicmoFcaHSnxcRX8Zg=; b=l+6mW+U6PcErK8ZhEI59W0ZhF+
	ALDo1ONiT1ZsixhtH8d1b2miCM0cCDI4ZmzaZOeS0T08NrZKGyHME63g4NgVwVtgEfoiZWZEqTLsr
	FN18NBZLEXiYYj8iYPrGv4L6D5J0v9R08zZxhZijY1ibECS/pDhzKCQb1/UDC2k5iB3dgyZ6/aKV2
	AJvoQdGU1Oik8OIFqbsucmv0x9ukCAzdvETuygYZisXmU/jPtLg6V02XdmdiY/sJOV/6Y41pevjFi
	eoEmrrkM3OqHGDh44YXIKkg9Aw8QcvAFzXlnbRmu+zBK4w8amjzFcxAKck3oFAcr5vH45Yl5n0+xD
	XDlZRkKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzJp-000000096DJ-26oN;
	Mon, 19 May 2025 12:10:09 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzGg-000000095sy-36hK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 12:06:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747656415; x=1779192415;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X9JYOmBZRRIrcEoIxM35PaaiyYlkP8TFD/KMSQVTS0U=;
  b=JdCRGhaEn+qI5doIMAOdkK0za+kEkIfrP8JdhCuUHib+5Zy1cJhOLby0
   gtnGpWi68AnCrpxljfa3tGYGIF6LvWDc87kmR9j+8xoLUbc7jDalbXFHW
   QsHe1k6dWhj4xmgheqLsboyUME2sDZ6bwymPNUIGq6ThSds2CrEuuBpOj
   cDGImTriG7+F4UVsOOdSOHo05afZRfYHejrP5mypqeyb3gsMenT6Qim4L
   j7nAOoMDr520kZ81eN/KLsF9D0yAxdpcL8GBDbzHsSM7hMB4vc57N2OOa
   wW/zBoAvwvv2Ii4vWueLeWTvPCOupbvrJH2E33X9phy8kmoUSZ6vkh2Kk
   g==;
X-CSE-ConnectionGUID: cQ2pOMPZQ9qvtO+SKxx4SA==
X-CSE-MsgGUID: fUOCxmlDRbK4DsscfeyD1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="53225187"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="53225187"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 05:06:54 -0700
X-CSE-ConnectionGUID: WMsdqKWhTEWrSxf4sLI6yQ==
X-CSE-MsgGUID: iTaMPZPKSmWRJ7+uxsle8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="144112208"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 05:06:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uGzGL-000000031iT-3wdP;
	Mon, 19 May 2025 15:06:33 +0300
Date: Mon, 19 May 2025 15:06:33 +0300
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
Subject: Re: [PATCH v2 05/26] bus: simple-pm-bus: Populate child nodes at
 probe
Message-ID: <aCseyW1iZgZNZNqd@smile.fi.intel.com>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
 <20250507071315.394857-6-herve.codina@bootlin.com>
 <aBy_aBkC7NpicXho@smile.fi.intel.com>
 <20250519135818.01db3341@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519135818.01db3341@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_050654_826838_D66CD7E2 
X-CRM114-Status: GOOD (  23.36  )
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

On Mon, May 19, 2025 at 01:58:18PM +0200, Herve Codina wrote:
> On Thu, 8 May 2025 17:27:52 +0300
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > On Wed, May 07, 2025 at 09:12:47AM +0200, Herve Codina wrote:

...

> > >  		if (of_property_match_string(np, "compatible", match->compatible) == 0)  
> > 
> > Side note, there is an fwnode_is_device_compatible() API for such cases. And IIRC
> > there is also OF variant of it.
> 
> fwnode_device_is_compatible() checked for all compatible string. I mean, if
> we have compatible = "foo,custom-bus", "simple-bus";
> fwnode_device_is_compatible() checking against "simple-bus" returns true.
> 
> Here, we want "simple-bus" as the first position in the compatible string.
> In other word, we want to match the more specific compatible string as
> mentioned in the comment.

I admit I'm not an expert in DT, but why is the compatibility position
dependent?

...

> > > +	if (pdev->dev.of_node)  
> > 
> > Why do you need this check? AFAICS it dups the one the call has already in it.
> 
> of_platform_populate() was called only if an OF node is present.
> I want to call of_platform_depopulate() on removal also only if an OF node
> is present.
> 
> I don't see the other call that duplicated this check.
> 
> Can you clarify?

The of_...() is already NULL-aware (AFAICS), why do you need the duplicated
check?

> > > +		of_platform_depopulate(&pdev->dev);  

-- 
With Best Regards,
Andy Shevchenko



