Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76EFCC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 15:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ThiterbTvL+mYGXh+idmEWQ5hcYVOVl2geFkwk5TYJc=; b=pXyABZRcj4TyJ7xVzUsHKBptLb
	SuSk7m/tpD1IV1e6PjSRSTRWKzyiwb8VA1kysjjO3taG0kvqjH1AE1u5X02v/N79JyIudW26x9N/2
	mJcDmuRBCSdIlhgsDUWoc0Ch2SKZyfN/2919n4qY5MX8t+U56qDOL+Bh6khkl0H6sy5hJ6mttjSen
	tu8jjOdTOJmTfwLhou0zA7u6e8Ufkv/fSTakL2A+sN+2QEvRCnjn8GNhTsocNxY92nSmAhmrhlijK
	IDiC8Kpdp/Qd2dh2yZ25Oh2ZkynD8heLHO4UHEvi9my6i3MjAjI0ju63Ph8JMjZGgxghjOasI1r1F
	c7g00xtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVBBJ-0000000F8TQ-1Tjq;
	Fri, 27 Jun 2025 15:40:01 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVAYF-0000000EzdH-1I7d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 14:59:40 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B280243914;
	Fri, 27 Jun 2025 14:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751036376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ThiterbTvL+mYGXh+idmEWQ5hcYVOVl2geFkwk5TYJc=;
	b=AZZxZg1sYkT9vHUrIb2/97+6gfdNO4TtsAae3Q97XVRt49b0/Vi8ATyjffit62MZ37kfFL
	ymp82e/YrnESaBvIOQpjbOf2NByT+aIPb77AUb4LL4j2gswmjCDrkd8q8JlI9EKD/dTAGv
	ehdRnIQrsEL+gjpbp5/HZ3gDsDO5/1suKp3xnM2E14rmnSJF/7NfSxhMn203GJECVD9In9
	m8CXZqLY8ct1ish67IsDUCaBumDTG5qcx7dEbGr9De+dkZwMfiwoTHf5QNh6Zrf48SviUx
	IemOqFS+LYffkXWwV86Y/xGnsTH8VmnMH3qqowHZYUhXdCZGAKaDau1hHDHE3g==
Date: Fri, 27 Jun 2025 16:59:30 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Saravana Kannan <saravanak@google.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Andi
 Shyti <andi.shyti@kernel.org>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, Derek
 Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>, Len Brown
 <lenb@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>, Sakari Ailus
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
Subject: Re: [PATCH v3 06/28] driver core: fw_devlink: Introduce
 fw_devlink_set_device()
Message-ID: <20250627165930.344b429c@bootlin.com>
In-Reply-To: <20250616090406.32f62ca4@bootlin.com>
References: <20250613134817.681832-1-herve.codina@bootlin.com>
	<20250613134817.681832-7-herve.codina@bootlin.com>
	<CAGETcx9u-7TJ6_J5HdmDT=7A6Z08P-rUC0n+qnBoBi+ejRc2SQ@mail.gmail.com>
	<20250616090406.32f62ca4@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeffeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegkedprhgtphhtthhopehsrghrrghvrghnrghksehgohhoghhlvgdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnv
 ghlrdhorhhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvg
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_075939_477779_878F2870 
X-CRM114-Status: GOOD (  23.18  )
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

Hi Saravana,

On Mon, 16 Jun 2025 09:04:06 +0200
Herve Codina <herve.codina@bootlin.com> wrote:

> Hi Saravana,
> 
> On Fri, 13 Jun 2025 14:13:49 -0700
> Saravana Kannan <saravanak@google.com> wrote:
> 
> > On Fri, Jun 13, 2025 at 6:49 AM Herve Codina <herve.codina@bootlin.com> wrote:  
> > >
> > > Setting fwnode->dev is specific to fw_devlink.
> > >
> > > In order to avoid having a direct 'fwnode->dev = dev;' in several
> > > place in the kernel, introduce fw_devlink_set_device() helper to perform
> > > this operation.
> > >    
> > 
> > This should not be set anywhere outside the driver core files. I'll
> > get to reviewing the series, but until then, NACK to this.
> > 
> > Is there a specific patch that explain why we need to set this outside
> > driver core?  
> 
> We need to set it in case of creating device-tree node for PCI.
> 
> Usually, fwnode are created (based on DT or ACPI) and then, dev are
> created.
> 
> In the PCI DT node creation case, device are already created and then, based
> on information already computed by the kernel, DT node are created.
> 
> You can see that on patch 11 (dev setting was already upstream and it is
> replace by a call to the helper for PCI host bridge) and on patch 13 (PCI
> device).
> 
> Other patches (8, 9 and 10) replace the existing direct setting of the dev
> member by a call to the helper.
> 

Have you got time to look at the series, patches I pointed out and the reply
from Andy?

Are modifications still nacked on your side?
If so, what kind of modification would you like to see in order to move
forward?

Best regards,
Hervé

