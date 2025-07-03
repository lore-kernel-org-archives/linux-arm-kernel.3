Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 173F4C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 06:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4+WaR4VhxZXal3ni8c5FuKUZQzKkcDX9MLohXTPfTgg=; b=15hXn0tzirq8jjTchqWtyKcyqt
	kzlIUrQt3iC/VD4SHi6zPTjNqndTXDei121VkM0G93qNKabmkVLAvroBl/QucMTX6LVGnLcyDu/aQ
	NlR9L6XqcnHFHOcqC0eAGRPY9NYVw9cl1/vfog8gf5bI9D602lKenCMuic8Ti57AOKVGpM6EK1vex
	dvgxfpvpZ3Q/2g/15W+B6zKpyACfYMt9wt6T+giWS1JXlvckYho1Cc2Mnb6LJ85kui5BuXF/JbOhI
	KVurK4vUMhy5teufrERTzcDwk+3vkGZ8RkFQpVRPucol1Nb6Dmp6jMggPsge9Gb+9CTKdlLpcVOWV
	qUxMsfhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXDcU-0000000AOul-1UwL;
	Thu, 03 Jul 2025 06:40:30 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXDa7-0000000AOaU-3CnK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 06:38:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 598C041B5F;
	Thu,  3 Jul 2025 06:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751524679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4+WaR4VhxZXal3ni8c5FuKUZQzKkcDX9MLohXTPfTgg=;
	b=PwapMf4AOf1u09JZyAvuq3MEs5Q4wJkpokCf2i9YxktO3oxlAqxu3Kuva4qlUMVWrZe6Ch
	VsiHnhZuSck3prB2PK5yzQ3fhCQSCMLnythuh+f1I7Xp/uqgW095xyV41I1sLuK+fb2Rt4
	34LwUAwFXNTWwxNYB2VkvYdynIt2L6NXbtpqKiJNhf9VRJHwM5lSz6I4HCFqw9fpinlL/Q
	6J9qijxfXxGDsGK9I7GWGydnMqWvaV6jJyPnc6KvT53yUQPq+TtCmIIR/doowMzDlFQfuL
	lyDTf+GBFBaRwnczT067UcPIVZgQ9a5tk0e34+6QyDx5/zD9/kxezacCrcPHxA==
Date: Thu, 3 Jul 2025 08:37:55 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andrew Lunn
 <andrew@lunn.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael
 J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Shawn
 Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, Derek
 Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Saravana Kannan <saravanak@google.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>, Len
 Brown <lenb@kernel.org>, Daniel Scally <djrscally@gmail.com>, Heikki
 Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus
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
Subject: Re: [PATCH v3 18/28] of: property: Allow fw_devlink device-tree on
 x86 when PCI device-tree node creation is enabled
Message-ID: <20250703083755.2fee7e7c@bootlin.com>
In-Reply-To: <CAL_JsqJCuevzu69bx3yWm3ZR9wZ+UsWuNXscig5KMm2WH4WxOw@mail.gmail.com>
References: <20250613134817.681832-1-herve.codina@bootlin.com>
	<20250613134817.681832-19-herve.codina@bootlin.com>
	<20250627162245.GA3513535-robh@kernel.org>
	<aF7H4-toeb7Ouz3d@smile.fi.intel.com>
	<CAL_JsqJCuevzu69bx3yWm3ZR9wZ+UsWuNXscig5KMm2WH4WxOw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduleehkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvhfeljedtfedtjeevffegtddutdeghfettdduhfeuhfdttdffieeuiefgvdfhvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtudemvgdtrgemvdekheemsgelkedtmegvgedttgemiegtgeefmegshegssgemrgegvdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvkeehmegsleektdemvgegtdgtmeeitgegfeemsgehsggsmegrgedvkedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegkedprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgth
 hdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggv
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_233804_420459_3DD64B14 
X-CRM114-Status: GOOD (  26.46  )
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

Hi Rob, Andy,

On Fri, 27 Jun 2025 12:49:36 -0500
Rob Herring <robh@kernel.org> wrote:

> On Fri, Jun 27, 2025 at 11:33 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Fri, Jun 27, 2025 at 11:22:45AM -0500, Rob Herring wrote:  
> > > On Fri, Jun 13, 2025 at 03:47:58PM +0200, Herve Codina wrote:  
> >
> > ...
> >  
> > > > -   if (IS_ENABLED(CONFIG_X86))
> > > > +   if (IS_ENABLED(CONFIG_X86) && !IS_ENABLED(CONFIG_PCI_DYNAMIC_OF_NODES))  
> > >
> > > I really want CONFIG_PCI_DYNAMIC_OF_NODES to go away at some point, not
> > > add more users.
> > >
> > > I think this should instead check for specific platforms not with
> > > kconfig symbols but DT properties. For ce4100, you can just check the
> > > root compatible string. For OLPC, there isn't a root compatible (in the
> > > DT I have). You could check for /architecture == OLPC instead. There's
> > > some virtualization guests using DT now too. I would think their DT's
> > > are simple enough to avoid any fw_devlink issues.  
> >
> > I don't think this is good approach. The above check is more reliable in my
> > opinion.  
> 
> I'm fine with any solution that doesn't add a
> CONFIG_PCI_DYNAMIC_OF_NODES which we can't remove. Adding it was a
> kick the can down the road to merge the support worry the mixed
> usecase (on ACPI systems) later. It's now later.
> 
> > > Alternatively, we could perhaps make x86 fw_devlink default off  
> >
> > For my (little) knowledge I believe this is not feasible anymore.
> > Some x86 code (drivers) relies on fw_devlink nowadays. But take
> > this with grain of salt, I may be way mistaken.  
> 
> Doesn't the CONFIG_X86 check disable it?
> 
> Rob

Filtering out by Kconfig seems a no-go:
  - Check for CONFIG_OLPC of CONFIG_X86_INTEL_CE as proposed in v1
    (https://lore.kernel.org/lkml/20250407145546.270683-12-herve.codina@bootlin.com/)
    was a no-go from Andy

  - Check for CONFIG_PCI_DYNAMIC_OF_NODES as proposed here is a no-go from
    Rob

I will follow Rob's suggestion based on DT properties. With a DT property
list, it would be easier to add more x86 fw_delink broken system in the list
of the system to exclude.

Best regards,
Hervé

