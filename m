Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75FA7C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 17:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NL8ZRffWu2aZLP4WJ8zTsOXgV6iJyI/q+WwmzBO4Dls=; b=w+L3n0opvp8pZZKt2UlswPJxe+
	3biP2iYwAJeIVx//yCYOggrQYZRJ0nGwsM8pmllYkaJFLdZhWgrw7+BJVr8XlPWtyUT8l4znAfKdX
	dLO1f2krepxXIOdqlaRvwxU9Nd23cAyJ9N6YXDNS+6Fjno4V8mk0HtOE5RvzrEtCKBDZgbpnIkMl3
	zS4M+QF5CZyp7fWXWRILrGj92YEKVm1Jz5EcX3Ep8EykBUiMX3VsRmme/J5JJb5IaI/dRSBLd+QBc
	bdzpmVTfNCV3SXimpa7/ubR5s1qtE+kSSyzZKYuPJb+2Kt7c5ZWCd4XLrvw/NKVPUrqMXUZjAnhZ8
	FUJppxxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVCgw-0000000FNe0-3Zqa;
	Fri, 27 Jun 2025 17:16:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVBMw-0000000FAqu-3UbV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 15:52:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 097A561434;
	Fri, 27 Jun 2025 15:52:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B088C4CEED;
	Fri, 27 Jun 2025 15:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751039521;
	bh=f0UYA/EuZoGSHsVhZD3Fus+HSK9WipcpF5RxkV+BP5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pyPdnJ7Q7HuuIiKgrWaMDcrBwxGTZiscgxJc6vl+XrICm0G79l/w04xJOgIgSsiT4
	 nyJKeqIT4LG/SdOrP9BThyVFe+sK/VvM3jidhmIf4FL5wNqqTU5vXGLNIqJcAXv1fB
	 qKTpyLWg6gUYFK9zYNPKm3MeePbH4VzwGEN7jkKanOyl7pqQcVspMU/YR0KWDgEe+y
	 Zv5XPVN4hnsL9/6Codf3WfenmJLS/Wop+OvwNF2usYFuIMsbN5lfU8nIT0Fa6ZEQ9G
	 1eaaz5yVdyekzbuVGyJ58FdAsHP1VfbszTS+QL47CPNvx+4zmaedL/KBAtCkPkCxRv
	 NsSgI1XvWhPIA==
Date: Fri, 27 Jun 2025 10:52:00 -0500
From: Rob Herring <robh@kernel.org>
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
	Arnd Bergmann <arnd@arndb.de>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
Subject: Re: [PATCH v3 05/28] bus: simple-pm-bus: Populate child nodes at
 probe
Message-ID: <20250627155200.GB3234475-robh@kernel.org>
References: <20250613134817.681832-1-herve.codina@bootlin.com>
 <20250613134817.681832-6-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613134817.681832-6-herve.codina@bootlin.com>
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

On Fri, Jun 13, 2025 at 03:47:45PM +0200, Herve Codina wrote:
> The simple-pm-bus driver handles several simple busses. When it is used
> with busses other than a compatible "simple-pm-bus", it doesn't populate
> its child devices during its probe.
> 
> This confuses fw_devlink and results in wrong or missing devlinks.
> 
> Once a driver is bound to a device and the probe() has been called,
> device_links_driver_bound() is called.
> 
> This function performs operation based on the following assumption:
>     If a child firmware node of the bound device is not added as a
>     device, it will never be added.
> 
> Among operations done on fw_devlinks of those "never be added" devices,
> device_links_driver_bound() changes their supplier.
> 
> With devices attached to a simple-bus compatible device, this change
> leads to wrong devlinks where supplier of devices points to the device
> parent (i.e. simple-bus compatible device) instead of the device itself
> (i.e. simple-bus child).
> 
> When the device attached to the simple-bus is removed, because devlinks
> are not correct, its consumers are not removed first.
> 
> In order to have correct devlinks created, make the simple-pm-bus driver
> compliant with the devlink assumption and create its child devices
> during its probe.

IIRC, skipping child nodes was because there were problems with 
letting the driver handle 'simple-bus'. How does this avoid that now?

The root of_platform_populate() that created the simple-bus device that 
gets us to the probe here will continue descending into child nodes. 
Meanwhile, the probe here is also descending into those same child 
nodes. Best case, that's just redundant. Worst case, won't you still 
have the same problem if the first of_platform_populate() creates the 
devices first?

Rob

