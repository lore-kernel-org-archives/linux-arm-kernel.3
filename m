Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B269C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 13:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XbgewCf1aPu6a/OvrU1OzXiSrJPGli1RsDcGc+DA04A=; b=bJxTmGcEVBxo+DeiCJoXysbBSj
	2XwsbP6gdc4U0bw+oxMQyf0uHhE7TkaRiO68p2uIY7z8baqLGFgeX8LJmvnQw6TV9AyS6sRp/ZfBm
	87cmybibmJNJloWHGAzxbQdu1IWMUvKzG9rwoOcz5PgfKPZzaLJVsP49E4Fy5ilB66earggNGOJXs
	frl3BQOwx9ma+vyc/OV5S06rNU6el5c/DCjDRhcNcc9TVWXJ5ahZy16p0XH5N0vrqxANzX6Wa/LmV
	JtFuXKFPNMn0ef6PzdTN52bHsjGK7E9BFnBU+uTtXke08GycAyTrUNmqfc+Cuj3zZC/LllaXxzj6G
	6K5UZYAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29SP-00000004I5I-0z87;
	Tue, 08 Apr 2025 13:57:41 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29J7-00000004GEx-2aNW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 13:48:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744120085; x=1775656085;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=QZAL+S5YzRwLwlwsMXd2zOLO+f+OKUqCHKeJeegQlnk=;
  b=Cmkh94ja/J8o92/5HXBnkYuJeCqp4QEtuaDrw3sZogjaB5R+GSDTicjF
   N2BuIvVR0R0ZoxYmPMnjKaGKN2QRO+1FdZ6J9IeF94lIvsNsI3uPYx9XY
   jXIDZxnzmlxwX2UwYeTdMgRnh/c5eBgyRpA96EjnUkGH1q4iY261rDzYG
   Qh/1q/0pVuRdbFirsMader3kxKtl//gS9LyRjk8ZQ6JpMgHIvcepvGzB6
   EDo5qRycX2ikduD+aqM7CLDdM0uA5uI5kuyVG7bdLrjrkTo5G8ocMemvZ
   rA/VukMwkXB+uDEoS6h4Hd4OBvIWrmnkNtF4+Nzp0A4z7RUQN2uY1Kizr
   w==;
X-CSE-ConnectionGUID: yNGLuc6PTmSvxxl75CNweA==
X-CSE-MsgGUID: X+6AzY/ST8Cs+0p2mY3+AQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45687605"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="45687605"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 06:48:04 -0700
X-CSE-ConnectionGUID: iAYgxfehTbaEoToFMmJRlA==
X-CSE-MsgGUID: iqkx9wdbSa+Z+aMmj20O9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="128794917"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 06:47:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u29It-0000000APvn-2CjO;
	Tue, 08 Apr 2025 16:47:51 +0300
Date: Tue, 8 Apr 2025 16:47:51 +0300
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
Subject: Re: [PATCH 08/16] i2c: core: Introduce i2c_get_adapter_supplier()
Message-ID: <Z_UpB1cgU_99JHdF@smile.fi.intel.com>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
 <20250407145546.270683-9-herve.codina@bootlin.com>
 <Z_Puy8eEBc6tubEx@smile.fi.intel.com>
 <20250408150836.327a337d@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250408150836.327a337d@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_064805_725482_AFAFB92A 
X-CRM114-Status: GOOD (  27.48  )
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

On Tue, Apr 08, 2025 at 03:08:36PM +0200, Herve Codina wrote:
> On Mon, 7 Apr 2025 18:27:07 +0300
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Apr 07, 2025 at 04:55:37PM +0200, Herve Codina wrote:

...

> > > +	return get_device(adapter->supplier ?: adapter->dev.parent);  
> > 
> > What will be the meaning when both are set? Why dev.parent is not the same
> > as supplier in this case?  Looking at the commit message example, it seems
> > like you want to provide a physdev or sysdev (as term supplier seems more
> > devlink:ish), like it's done elsewhere. And in the same way _always_ initialise
> > it. In such a case, the ambiguity will be gone.
> 
> When both are set (this is case for i2c muxes), the adapter->supplier the
> device that register the I2C adapter using i2c_add_adapter() or variant.
> In other word, the device that creates the I2C adapter.
> 
> The adapter->dev.parent is most of the time the device that register the
> I2C adapter except for i2c muxes. For I2C muxes, this adapter->dev.parent
> is the adapter the i2c mux is connected to.
> 
> Between physdev and sysdev, I really prefer physdev and, if renaming from
> supplier to physdev is still needed (and wanted), I will rename it. Let me
> know.

The terms supplier/consumer are widely used in terms of power and devlink.
I think here should not be used the term supplier.

> For initialization, I don't want to modify all the I2C controller drivers.
> What I can do is to initialize adapter->supplier using adapter->dev.parent
> during the i2c_register_adapter() call if it was not already initialize by
> the caller (i.e. the I2C controller driver).

This can be done in the I²C core, but I'm not insisting on this part.
We can start from your function only and then decide later on how to
proceed (depending on how many users of that field appear and what
they want to do with it).

> Does it make sense ?

-- 
With Best Regards,
Andy Shevchenko



