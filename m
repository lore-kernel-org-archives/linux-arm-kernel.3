Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233DBC369A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 13:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FGv7EI/vb/WroSRb61QAnWmRAgGHfwWpS5vWQR/P62w=; b=gzV9Teas6y8pW/pilijItjG/ZL
	TcZBH4ZUAROdp2Kwz+J+0wCOb6Dw1SaFaePOmnJgIQevD44ZuTjlC6l0C6fb81eEqUn3icd1QNFTV
	znRidYkroG6cKUwjokait9MMpDijSVJSam8prH+Ng2nqweQbeJRp4h2k4V1gwZLtiZR2Xli8idgWu
	2ywRRoZeu1u6SzXDyBVRDRuY5LNelEJrOtg0zkEDFe4z9rWoqErS8lwiwcxYjIzvv4xU8Z1lEiWSu
	0I9kVxAeAlFadQcpcGWzIIBr2+ItFC0iBup49BWVzTNodm1Z5NI4/9xkQg6k+oGyvWgUcpUCA7xZa
	6n7NixYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29U8-00000004INt-3qyr;
	Tue, 08 Apr 2025 13:59:28 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29KX-00000004GNW-3CVH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 13:49:35 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B7CA443E60;
	Tue,  8 Apr 2025 13:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744120169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FGv7EI/vb/WroSRb61QAnWmRAgGHfwWpS5vWQR/P62w=;
	b=ocTueDsOQBY97b6OOGZOl+0+CGjLCjgOKSwwXqHwiCnH6vmx1anE6O9yAj63OnXYrkuzyc
	ROeY6i+mCpKNCUjvpEnBoBGRjljPmj9YGxlYTA/MdqwYN0OvjRnHcXpWfG+ih9o15hA3om
	cSFR/SgeScMlY632kxbwMBT9LJSqMUtWn+KBqMpAkjocWWk9R/fDd/CBhILERv7yvmijyw
	d/Z/iOC9dEKOrcjowZeFJyqfiBe//l55JzjDhjW1oY0QoY71+uBBGstbso15FwiONrrOyg
	nYDzGAt8fmeGJE1pR3EzZACDqmlnhQmlHzJPn/UrRwysA5i1M4/SQN4buqsMSQ==
Date: Tue, 8 Apr 2025 15:49:25 +0200
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
Subject: Re: [PATCH 11/16] of: property: Allow fw_devlink device-tree
 support for x86
Message-ID: <20250408154925.5653d506@bootlin.com>
In-Reply-To: <Z_Pw_MoPpVNwiEhc@smile.fi.intel.com>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
	<20250407145546.270683-12-herve.codina@bootlin.com>
	<Z_Pw_MoPpVNwiEhc@smile.fi.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdefvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfeevgfefffejteefveffkefffefgtedugedvhfevjedvgeekieelffeihfeuvdeknecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmedvgeeimeejjeeltdemvdeitgegmegvvddvmeeitdefugemheekrgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdegieemjeejledtmedviegtgeemvgdvvdemiedtfegumeehkegrpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedtpdhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdpr
 hgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomh
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_064934_095581_979C41EE 
X-CRM114-Status: GOOD (  29.16  )
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

On Mon, 7 Apr 2025 18:36:28 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Mon, Apr 07, 2025 at 04:55:40PM +0200, Herve Codina wrote:
> > PCI drivers can use a device-tree overlay to describe the hardware
> > available on the PCI board. This is the case, for instance, of the
> > LAN966x PCI device driver.
> > 
> > Adding some more nodes in the device-tree overlay adds some more
> > consumer/supplier relationship between devices instantiated from this
> > overlay.
> > 
> > Those fw_node consumer/supplier relationships are handled by fw_devlink
> > and are created based on the device-tree parsing done by the
> > of_fwnode_add_links() function.
> > 
> > Those consumer/supplier links are needed in order to ensure a correct PM
> > runtime management and a correct removal order between devices.
> > 
> > For instance, without those links a supplier can be removed before its
> > consumers is removed leading to all kind of issue if this consumer still
> > want the use the already removed supplier.
> > 
> > The support for the usage of an overlay from a PCI driver has been added
> > on x86 systems in commit 1f340724419ed ("PCI: of: Create device tree PCI
> > host bridge node").
> > 
> > In the past, support for fw_devlink on x86 had been tried but this
> > support has been removed in commit 4a48b66b3f52 ("of: property: Disable
> > fw_devlink DT support for X86"). Indeed, this support was breaking some
> > x86 systems such as OLPC system and the regression was reported in [0].
> > 
> > Instead of disabling this support for all x86 system, use a finer grain
> > and disable this support only for the possible problematic subset of x86  
> 
> > system mixing ACPI and device-tree at boot time (i.e. OLPC and CE4100).  
> 
> This is incorrect, they never had ACPI to begin with. Also there is third
> platform that are using DT on x86 core — SpreadTrum based phones.

I will rework the commit log to avoid 'mixing ACPI and device-tree'

For "SpreadTrum based phones", do you have an idea about the Kconfig symbol
I could use to filter our this x86 systems?

Anything I find upstream related to SpreadTrum seems base on ARM cpus.
I probably miss something.

> 
> And not sure about AMD stuff (Geode?).

Same here, if some AMD devices need to be filtered out, is there a specific
Kconfig symbol I can use ?

> 
> > [0] https://lore.kernel.org/lkml/3c1f2473-92ad-bfc4-258e-a5a08ad73dd0@web.de/  
> 
> Can you make this to be a Link tag?
> 
> Link: https://lore.kernel.org/lkml/3c1f2473-92ad-bfc4-258e-a5a08ad73dd0@web.de/ [0]
> 

Yes, of course, I will do that in the next iteration.

Best regards,
Hervé




-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

