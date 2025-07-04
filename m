Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB149C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 11:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z/ao/2kml8jJZFHPFKKmBePrXHDwomfciEfTApf1ng0=; b=jZTIkEK9KQOOZyd60IxTXOatwD
	+VQCWCjEp703fUYQo48vF3rnGpGEOUP/SMTdAJiIOkgJzcfzLZucgny880b41fA5Baxyp5DiBVMbl
	uPQZ7LW/DQ2amuxfJVcJkg4Mg/gauIEI9/OCKFjnF7TcwoC86Fw0ccbjvB0mjon5sTq1lXFsEtJ9q
	925WzcAAPa6EahzCa6KvINggXW7zIE0Wz38Pcsucb4OC0pvX+nitHJr7vV5vpMIzNcAWdyu9R6qBV
	9t5SqgdBu4s0pJKcsIOcRg1spJEtUG+YizofT0qYgxgYRD1owzvhIXywf4I8GbTPZWH88I2oP2O87
	WIM287UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXeUW-0000000ECcW-2L3d;
	Fri, 04 Jul 2025 11:22:04 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXcEj-0000000Dpd0-1DFC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 08:57:39 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8E24143AEE;
	Fri,  4 Jul 2025 08:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751619453;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z/ao/2kml8jJZFHPFKKmBePrXHDwomfciEfTApf1ng0=;
	b=IsFNgvOIXVOwfZalpbJl3HeOSXGJ/b0Br9jNwmVj8c8XWQeGRJ8yNf3TykuiXP9YVWVNg9
	WswEtsNyDmTb6lPYtNo8jxAwOyYHr7+xBhPVcBIgta1Gmw8VnOWUw/IIgLl0UbPh+PxatT
	QEnGVRZSbWRjlpWe41sTUlxkGP/Yq4rgQ07Ce2ffpGvDVrPXEuUvzR/vQ7m9UpYt7tin2Y
	sLZZm9ZYReoWxyEcrLAoB6ePBBOxMVsZYJxN9iYmAivhvHar9hS8v4H3i9GFkWozo5fSTm
	tDdAojqJukJpigemHSwc8gA9r4PchXfJlcnlZExGtC/OGPUfoanwJMSTvEwmSg==
Date: Fri, 4 Jul 2025 10:57:25 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Andi
 Shyti <andi.shyti@kernel.org>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, Derek
 Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Saravana Kannan <saravanak@google.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>, Len
 Brown <lenb@kernel.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Wolfram Sang <wsa@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Davidlohr Bueso
 <dave@stgolabs.net>, Dave Jiang <dave.jiang@intel.com>, Alison Schofield
 <alison.schofield@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, Ira
 Weiny <ira.weiny@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org, Allan Nielsen
 <allan.nielsen@microchip.com>, Horatiu Vultur
 <horatiu.vultur@microchip.com>, Steen Hegelund
 <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 05/28] bus: simple-pm-bus: Populate child nodes at
 probe
Message-ID: <20250704105725.50cb72b9@bootlin.com>
In-Reply-To: <20250703093302.4f7743ea@bootlin.com>
References: <20250613134817.681832-1-herve.codina@bootlin.com>
	<20250613134817.681832-6-herve.codina@bootlin.com>
	<20250627155200.GB3234475-robh@kernel.org>
	<20250703093302.4f7743ea@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvvdejfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeviefffeegiedtleelieeghfejleeuueevkeevteegffehledtkeegudeigffgvdenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgeekpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhor
 hhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvg
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_015737_897765_BF5F2845 
X-CRM114-Status: GOOD (  39.92  )
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

Hi Rob,

On Thu, 3 Jul 2025 09:33:02 +0200
Herve Codina <herve.codina@bootlin.com> wrote:

> Hi Rob,
> 
> On Fri, 27 Jun 2025 10:52:00 -0500
> Rob Herring <robh@kernel.org> wrote:
> 
> > On Fri, Jun 13, 2025 at 03:47:45PM +0200, Herve Codina wrote:  
> > > The simple-pm-bus driver handles several simple busses. When it is used
> > > with busses other than a compatible "simple-pm-bus", it doesn't populate
> > > its child devices during its probe.
> > > 
> > > This confuses fw_devlink and results in wrong or missing devlinks.
> > > 
> > > Once a driver is bound to a device and the probe() has been called,
> > > device_links_driver_bound() is called.
> > > 
> > > This function performs operation based on the following assumption:
> > >     If a child firmware node of the bound device is not added as a
> > >     device, it will never be added.
> > > 
> > > Among operations done on fw_devlinks of those "never be added" devices,
> > > device_links_driver_bound() changes their supplier.
> > > 
> > > With devices attached to a simple-bus compatible device, this change
> > > leads to wrong devlinks where supplier of devices points to the device
> > > parent (i.e. simple-bus compatible device) instead of the device itself
> > > (i.e. simple-bus child).
> > > 
> > > When the device attached to the simple-bus is removed, because devlinks
> > > are not correct, its consumers are not removed first.
> > > 
> > > In order to have correct devlinks created, make the simple-pm-bus driver
> > > compliant with the devlink assumption and create its child devices
> > > during its probe.    
> > 
> > IIRC, skipping child nodes was because there were problems with 
> > letting the driver handle 'simple-bus'. How does this avoid that now?  
> 
> I don't know about the specific issues related to those problems. Do you
> have some pointers about them?
> 
> > 
> > The root of_platform_populate() that created the simple-bus device that 
> > gets us to the probe here will continue descending into child nodes. 
> > Meanwhile, the probe here is also descending into those same child 
> > nodes. Best case, that's just redundant. Worst case, won't you still 
> > have the same problem if the first of_platform_populate() creates the 
> > devices first?
> >   
> 
> Maybe we could simply avoid of_platform_populate() to be recursive when a
> device populate by of_platform_populate() is one of devices handled by
> the simple-bus driver and let the simple-bus driver do the job.
> 
> of_platform_populate will handle the first level. It will populate children
> of the node given to of_platform_populate() and the children of those
> children will be populate by the simple-bus driver.
> 
> I could try a modification in that way. Do you think it could be a correct
> solution?
> 

I have started to look at this solution and it's going to be more complex
than than I thought.

Many MFD drivers uses a compatible of this kind (the same exist for bus
driver with "simple-bus"):
  compatible = "foo,bar", "simple-mfd";

Usually the last compatible string ("simple-mfd" here) is a last fallback
and the first string is the more specific one.

In the problematic case, "foo,bar" has a specific driver and the driver
performs some operations at probe() but doesn't call of_platform_populate()
and relies on the core to do the device creations (recursively) based on
the "simple,mfd" string present in the compatible property.

Some other calls of_platform_populate() in they probe (which I think is
correct) and in that case, the child device creation can be done at two
location: specific driver probe() and core.

You pointed out that the core could create devices before the specific
driver is probed. In that case, some of existing drivers calling
of_platform_populate() are going to have issues.

I can try to modify existing MFD and bus drivers (compatible fallback to
simple-mfd, simple-bus, ...) in order to have them call of_platform_populate()
in they probe() and after all problematic drivers are converted, the
recursive creation of devices done in the core could be removed.

Before starting in that way, can you confirm that this is the right
direction?

Best regards,
Hervé

