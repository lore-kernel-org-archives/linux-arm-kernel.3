Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B40EC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 15:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zAnJxDH2cQNUkyYzrOZMk+S9iW0aoM/UKY9IFB7P0gI=; b=Kc5fAEch0FzZ/AtgRDuR6lj20+
	pBwXprzWeutEhf3tP7yUl+Kdu5G73bd2Np/EVCyKDQBj9CVSTuo+m3aVOR2hVLNLBQH2Ejx7AmEOC
	vKo2xDEt4eSsjI+qwrJvoJa31YWnbIFn/dVZC/u9gyknrdo5WUSA50Qunwd3g/u37te/oO7c+duov
	eTfonOAmUdLyfeeQw9hQpgoS3vKtFfTaf0dHXtzhgsGEl6asjA6igHVp86F77N5EpVoIuKU3dOfi/
	Xa0L4HaMHmk+RfDR/c826RE/pc8UejTN1g1/42mIWFx+rsTTmHXBT6ZIscmx2DQs/2T5OqomPLNRV
	15ZsYaXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH2o6-00000009gth-2IJL;
	Mon, 19 May 2025 15:53:38 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH1yQ-00000009Vz7-2FPe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 15:00:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6FD121FD58;
	Mon, 19 May 2025 15:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747666809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zAnJxDH2cQNUkyYzrOZMk+S9iW0aoM/UKY9IFB7P0gI=;
	b=BlrcDWKIV79p/Nbt0Xh+Zt/BftW3xjkeQJTQnChTfqsL/QJSllXnuNw6dAQUnOnmIUsRtm
	KSNcU3JqRelJteSXDXFkffd3WHWzlVOhZebpJMqBX3zVQDqvkebzIkM+upiOgh49FvE7t8
	XBpxGAxmbnLdgWUgXnlma9exg5WYXSMsnf+jKTZ1F5/zhFy6y5dgvRYfJQVuWDx9wO6Gth
	tFGi86S0BghEV3YKxfBpeBYqhhr3qjsNyzgFA5296OaRyjXg7WbW5YlC2/BblNOfQwHvzL
	LioPfHZLzqGusr+Qoi/ERBvUNbMAmyY7IGYaK1hnyOFQABEn/j2LT4L3TxWUwA==
Date: Mon, 19 May 2025 17:00:04 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Andi
 Shyti <andi.shyti@kernel.org>, Wolfram Sang
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
Subject: Re: [PATCH v2 23/26] misc: lan966x_pci: Introduce board specific
 data
Message-ID: <20250519170004.631d99af@bootlin.com>
In-Reply-To: <aB0ERYKdRreDe7Wt@smile.fi.intel.com>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
	<20250507071315.394857-24-herve.codina@bootlin.com>
	<aB0ERYKdRreDe7Wt@smile.fi.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvdduieekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeguddprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhto
 hepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggv
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_080014_860150_8CA441B4 
X-CRM114-Status: GOOD (  20.28  )
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

On Thu, 8 May 2025 22:21:41 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Wed, May 07, 2025 at 09:13:05AM +0200, Herve Codina wrote:
> > Only one device-tree overlay (lan966x_evb_lan9662_nic.dtbo) is handled
> > and this overlay is directly referenced in lan966x_pci_load_overlay().
> > 
> > This avoid to use the code for an other board.
> > 
> > In order to be more generic and to allow support for other boards (PCI
> > Vendor/Device IDs), introduce the lan966x_pci_info structure and attach
> > it to PCI Vendor/Device IDs handled by the driver.
> > 
> > This structure contains information related to the PCI board such as
> > information related to the dtbo describing the board we have to load.  
> 
> ...
> 
> >  static struct pci_device_id lan966x_pci_ids[] = {
> > -	{ PCI_DEVICE(PCI_VENDOR_ID_EFAR, 0x9660) },
> > +	{ PCI_VDEVICE(EFAR, 0x9660), (kernel_ulong_t)&evb_lan9662_nic_info },  
> 
> PCI_DEVICE_DATA() ?

PCI_DEVICE_DATA() need the device ID defined using a #define in the form
PCI_DEVICE_ID_##vend##_##dev

PCI_VDEVICE() allows the device ID value passed as an integer in the same
way as for PCI_DEVICE().

Also, according to its kdoc, it allows the next field to follow as the
device private data.

IMHO, I think PCI_VDEVICE() use is correct here and I will keep it.

Best regards,
Hervé


