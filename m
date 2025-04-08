Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D38C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 13:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UOhMDuFqtRk7BH6T/PmLdxDa9c5hJPubu57xqa7O+Ro=; b=Ld7x50h71PNDJ/xZx3q3ouGUq2
	PHzJR+FbVXLAOzWTDHymORdWPR5bsgISbqNnQzvvbk82UIM/mzadYt7pJwFZaKJAIrYZ+mUN930DJ
	aEVpaxyndNni8BCVBZbD6bE5OGyr5arHnXxfKx4rzt1qeglCHqydLlroEx7/7itlcyPcSiqccVTmO
	7U8kel0VUr0IVxZeZQJD18by8VX7V7USUlxfJublVgBAhC6N/QoSXNU8xc3kqsJOX9DfYNc5lZHqV
	AKq8lA6g1FT+k2hyO1EvPjpwlBAydz2fdVFY5QR0NDs/92znZRTywh27zCQw4OQ3oDyprbp25O9Hq
	/gUdxYyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2957-00000004Doh-3iTI;
	Tue, 08 Apr 2025 13:33:38 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28Qd-000000042QT-01GJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 12:51:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6DBCA43210;
	Tue,  8 Apr 2025 12:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744116704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UOhMDuFqtRk7BH6T/PmLdxDa9c5hJPubu57xqa7O+Ro=;
	b=nf4kYgYRWY4bZyISBsuoJ7DSaNAl7+wuSlkQE1iZDaE5xSpRmvhSWjeY7hJmDti38AuTzm
	AUnD9vw+BQFSq+MrJEm+87J0zwgLW7Fivj/7S9JjOMEeNTD/TxY2sdf4fW1daGQpoyn3WX
	D/oqMLYo4M5wfxErSiXaBLtG11yE3YIwhsc2oNFI3mpmM6Z10Q35Nl9yDnxMYq9cEnH0RL
	iA3yzrX9pfWy0AsorLfINMFg4DofnttwbhAIIQsE6PYgDhrNddQPNrLnYtqBYGFBE3Wegg
	cCT109goYuFvc37Qr0/1D3+27OR+dn+OuoFrn6y0iOz5YvjQrEOG5c5HC4ZtUQ==
Date: Tue, 8 Apr 2025 14:51:39 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, Derek
 Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Saravana
 Kannan <saravanak@google.com>, Bjorn Helgaas <bhelgaas@google.com>, Mark
 Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, Daniel Scally
 <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Wolfram Sang <wsa@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org, Allan Nielsen
 <allan.nielsen@microchip.com>, Horatiu Vultur
 <horatiu.vultur@microchip.com>, Steen Hegelund
 <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 06/16] PCI: of: Set fwnode.dev of newly created PCI
 device nodes
Message-ID: <20250408145139.293c79a2@bootlin.com>
In-Reply-To: <Z_PvhVkdhubA9jAe@smile.fi.intel.com>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
	<20250407145546.270683-7-herve.codina@bootlin.com>
	<Z_PvhVkdhubA9jAe@smile.fi.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdefudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppedvrgdtudemvgdtrgemvdegieemjeejledtmedviegtgeemvgdvvdemiedtfegumeehkegrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvgeeimeejjeeltdemvdeitgegmegvvddvmeeitdefugemheekrgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegtddprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhop
 egurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_055147_494883_418C6F9E 
X-CRM114-Status: GOOD (  23.82  )
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

Hi Andy,

On Mon, 7 Apr 2025 18:30:13 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Mon, Apr 07, 2025 at 04:55:35PM +0200, Herve Codina wrote:
> > Device-tree node can be created when CONFIG_PCI_DYNAMIC_OF_NODES. Those
> > node are created and filled based on PCI core information but the
> > fwnode.dev field is not set.
> > 
> > When later an overlay is applied, this consuses fw_devlink. Indeed,
> > without any device attached to the node, fw_devlink considers that this
> > node will never become a device. When this node is pointed as a
> > supplier, devlink looks at its ancestors in order to find a node with a
> > device that could be used as the supplier.
> > 
> > In the PCI use case, this leads to links that wrongly use the PCI root
> > bridge device as the supplier instead of the expected PCI device.
> > 
> > Setting fwnode.dev to the dev of the PCI device allows devlink to use
> > this device as a supplier and so, correct links are created.  
> 
> ...
> 
> > +	/*
> > +	 * Set the fwnode.dev in order to have fw_devlink creating links
> > +	 * pointing to this PCI device instead of walking up to the PCI host
> > +	 * bridge.
> > +	 */
> > +	np->fwnode.dev = &pdev->dev;  
> 
> This is too invasive. I suppose here should be a helper for this kind of
> operation. If not, create one.
> 
> 	fw_devlink_set_device(...);
> 
> 
> or alike.

Yes, I will add
  void fw_devlink_set_device(struct fwnode_handle *fwnode, struct device *dev);

Also, I will probably add a new patch in this series in order to use
the new fw_devlink_set_device() when relevant in the already existing code.

Best regards,
Hervé

