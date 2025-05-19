Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C3BC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 12:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ftDhpzUCFCgv9VuWBrFfvAn7gkRBGVdQ8LoorzEtpsw=; b=tofO8/lwWiM7jykvdE4ZJxfffb
	CWurmM92wMpJLhT5ow+XppszBcWhPXir2YvyjC+odRVUN/euU8KQh0DoKbq0yYiPBXNqD8ACwv86k
	mJVEhviefHIjbgrCNGaSbkXMAJIS4hBTUXZ21/FVUh0m2ZdqsgzROKedBP/T86zhMTqyqewy5Furs
	TYjCJcz6puyVgKnc35IOn4I6/RHoHbC7GIxkxpm1h9LiBy1MeTyAg4MpqpnrvXVCaKNuUbGt0Bqyz
	5KFbaJcJ2531mH9TWbPyOVufUN/Pd+4oEp7nNGKkBO1MWR6rWUnrlYIUseYhvfiKCChJv625Sy3Ip
	TI7dwsKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzwb-00000009D7G-0DRb;
	Mon, 19 May 2025 12:50:13 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzsi-00000009CCF-1pKD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 12:46:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4F2CF43B16;
	Mon, 19 May 2025 12:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747658768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ftDhpzUCFCgv9VuWBrFfvAn7gkRBGVdQ8LoorzEtpsw=;
	b=ILHAtyQvoP+l2aYzHP8Fne8YPi4v3LTOIJmtiweeGuqExqV7XVp/RAGwvlWo+2bozMnJxz
	xvT2E0qMBoy/JD4wgc6RIcO0JDORVOwgN+JNpzL1Jh2kQ9iNH8Xp0BDG2RJ2h6CvUeVnHW
	vzQNNTOebdoZy+NCYZ6DHctXLI07e0mzrWnLh5MnJ4sUL7vHKuUvljTnyHJnOMrjTvBAGD
	pzOqJu4GyhIFiwLVotKe5XZ8jGxnwS6gzpXVsb3qlCYp/gJCXGvOD90J5VhE2H+5Xg2AFQ
	/Ki2TGqtfWeo7+6iL1S2bR5R9EEHx8pr6jLf0w3i/oScnDNxEkwd0ylP3bzyyA==
Date: Mon, 19 May 2025 14:46:02 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, Derek
 Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Saravana
 Kannan <saravanak@google.com>, Bjorn Helgaas <bhelgaas@google.com>, Mark
 Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Wolfram Sang <wsa@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org, Allan Nielsen
 <allan.nielsen@microchip.com>, Horatiu Vultur
 <horatiu.vultur@microchip.com>, Steen Hegelund
 <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 05/26] bus: simple-pm-bus: Populate child nodes at
 probe
Message-ID: <20250519144602.0399c9c5@bootlin.com>
In-Reply-To: <CAJZ5v0iL9-JzTzE7pYTJGuB1BbrE6L12K2FKNpQ8dhX9GureJw@mail.gmail.com>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
	<20250507071315.394857-6-herve.codina@bootlin.com>
	<CAJZ5v0iL9-JzTzE7pYTJGuB1BbrE6L12K2FKNpQ8dhX9GureJw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvddugedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjefflefhieduteegffeifeeggfffvdeuvdeutddvfeduudeukeffleehheffkeetnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeguddprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgp
 dhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomh
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_054613_096724_1078E486 
X-CRM114-Status: GOOD (  47.04  )
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

Hi Rafael,

On Fri, 16 May 2025 21:22:20 +0200
"Rafael J. Wysocki" <rafael@kernel.org> wrote:

> On Wed, May 7, 2025 at 9:13 AM Herve Codina <herve.codina@bootlin.com> wrote:
> >
> > The simple-pm-bus drivers handles several simple bus. When it is used  
> 
> s/drivers/driver/ (I think)
> s/simple bus/simple busses/

Will be fixed.

> 
> > with busses other than a compatible "simple-pm-bus", it don't populate  
> 
> s/it don't/it doesn't/

Will be fixed.

> 
> > its child devices during its probe.
> >
> > This confuses fw_devlink and results in wrong or missing devlinks.  
> 
> Well, fair enough, but doesn't it do that for a reason?

I think devlink is confused just because "simple-bus" or similar handled
by this driver didn't follow the devlink rule: "Child nodes should be
created during parent probe".

Suppose the following:
   foo@0 {
	compatible = "vendor,foo"

	bar@0 {
		compatible = "simple-bus";

		baz@100 {
			compatible = "vendor,baz"
		};
	};
   };

The foo driver probe() calls from of_platform_default_populate() to create
the bar device.

The bar is create and thanks to its compatible string, the simple-bus
probe() is called. Without my modification, the baz device was not created
during the simple-bus probe().

of_platform_default_populate() called from foo probe() creates the baz
device thanks to the recursive of_platform_bus_create() call.

This leads the baz device created outside the bar probe() call.
This "out of bus probe()" device creation confuses devlink.

> 
> > Once a driver is bound to a device and the probe() has been called,
> > device_links_driver_bound() is called.
> >
> > This function performs operation based on the following assumption:
> >     If a child firmware node of the bound device is not added as a
> >     device, it will never be added.
> >
> > Among operations done on fw_devlinks of those "never be added" devices,
> > device_links_driver_bound() changes their supplier.
> >
> > With devices attached to a simple-bus compatible device, this change
> > leads to wrong devlinks where supplier of devices points to the device
> > parent (i.e. simple-bus compatible device) instead of the device itself
> > (i.e. simple-bus child).
> >
> > When the device attached to the simple-bus is removed, because devlinks
> > are not correct, its consumers are not removed first.
> >
> > In order to have correct devlinks created, make the simple-pm-bus driver
> > compliant with the devlink assumption and create its child devices
> > during its probe.
> >
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  drivers/bus/simple-pm-bus.c | 23 ++++++++++++++---------
> >  1 file changed, 14 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
> > index d8e029e7e53f..93c6ba605d7a 100644
> > --- a/drivers/bus/simple-pm-bus.c
> > +++ b/drivers/bus/simple-pm-bus.c
> > @@ -42,14 +42,14 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
> >         match = of_match_device(dev->driver->of_match_table, dev);
> >         /*
> >          * These are transparent bus devices (not simple-pm-bus matches) that
> > -        * have their child nodes populated automatically.  So, don't need to
> > -        * do anything more. We only match with the device if this driver is
> > -        * the most specific match because we don't want to incorrectly bind to
> > -        * a device that has a more specific driver.
> > +        * have their child nodes populated automatically. So, don't need to
> > +        * do anything more except populate child nodes.  
> 
> The above part of the comment has become hard to grasp after the
> change.  In particular, why populate child notes if they are populated
> automatically?

What do you thing about:
	/*
	 * These are transparent bus devices (not simple-pm-bus matches) that
	 * have their child nodes be populated automatically. So, don't need to
	 * do anything more except populate child nodes. We only match with the
	 * device if this driver is the most specific match because we don't
	 * want to incorrectly bind to a device that has a more specific driver.
	 */

> 
> > + We only match with the
> > +        * device if this driver is the most specific match because we don't
> > +        * want to incorrectly bind to a device that has a more specific driver.
> >          */
> >         if (match && match->data) {
> >                 if (of_property_match_string(np, "compatible", match->compatible) == 0)
> > -                       return 0;
> > +                       goto populate;  
> 
> Doesn't this interfere with anything, like the automatic population of
> child nodes mentioned in the comment?

I don't think so.

Device population is protected against multiple calls with OF_POPULATED_BUS
flag:
  https://elixir.bootlin.com/linux/v6.15-rc6/source/drivers/of/platform.c#L349

> 
> >                 else
> >                         return -ENODEV;
> >         }
> > @@ -64,13 +64,14 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
> >
> >         dev_set_drvdata(&pdev->dev, bus);
> >
> > -       dev_dbg(&pdev->dev, "%s\n", __func__);
> > -
> >         pm_runtime_enable(&pdev->dev);
> >
> > +populate:
> >         if (np)
> >                 of_platform_populate(np, NULL, lookup, &pdev->dev);
> >
> > +       dev_dbg(&pdev->dev, "%s\n", __func__);  
> 
> So how to distinguish between devices that only have child nodes
> populated and the ones that have drvdata set?

Hum, I don't see your point.
Can you clarify ?

> 
> > +
> >         return 0;
> >  }
> >
> > @@ -78,12 +79,16 @@ static void simple_pm_bus_remove(struct platform_device *pdev)
> >  {
> >         const void *data = of_device_get_match_data(&pdev->dev);
> >
> > -       if (pdev->driver_override || data)
> > +       if (pdev->driver_override)
> >                 return;
> >
> >         dev_dbg(&pdev->dev, "%s\n", __func__);
> >
> > -       pm_runtime_disable(&pdev->dev);
> > +       if (pdev->dev.of_node)
> > +               of_platform_depopulate(&pdev->dev);
> > +
> > +       if (!data)
> > +               pm_runtime_disable(&pdev->dev);
> >  }
> >
> >  static int simple_pm_bus_runtime_suspend(struct device *dev)
> > --  

Thanks for your feedback.

Best regards,
Hervé

