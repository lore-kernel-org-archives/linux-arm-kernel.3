Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36716C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 07:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rQpUEyE2hSL3/anSM+mUj3B/dfO987OTyH9st7Zw9rI=; b=zonGpI9pYmKK9NaZAvtmqlvMnW
	y3kzGVBZNCmGr9xD9TshNXe8YlZkx2P4QD6EO0D4WxKZD6N/GDOA0tSGZjhrPCpDby7X8GfLeko7d
	tL7xef6+Na8/vYXMqqxXVQ8OmWld7yYaDTufdlAq4JNzTGkA8rEteoM/3fUykQGoi+QLocF8hO0ZM
	JboSpwFy1CfQxJxVfZ3nMAvxMnJSdKSQVxogtfsjJRCAwG38ZoVxLE5UbthXOE6375Puq3d54opBa
	lGFYFfYFyCuSyUiX4Slw8LeFXsjttgPbx3Gzem91BHgyiEMsRxUo/u2LSg3i7u6aOuZi+ZRTJaxO6
	Ez31Q8mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR3yj-00000003b8r-3VHn;
	Mon, 16 Jun 2025 07:10:01 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR3tA-00000003aLW-3bsv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 07:04:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C090944358;
	Mon, 16 Jun 2025 07:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750057451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rQpUEyE2hSL3/anSM+mUj3B/dfO987OTyH9st7Zw9rI=;
	b=RvuZAWtwncTDYBTmDQAlBIYQ37ITn2LNv8AE9RnE6ibp9xhLMXoG/P+FYoXnQn4WXwPoAU
	/kMIcIHg7mBPD6KS4fM4TATpCovYXdlJ/S/5tPFqDNgWBxRwyYcORmltrjG6O9PZf37lQB
	IQmasJyHwwVGFYltHgdTmBdQFOSbPNwi/8qxzvBfE4MxT7JDW0imBcadoL9/jsDUuPzXpw
	fBtVIp8AFo8XzSXPdRTZcI0QUmtJbiBZNxj1lORjNz3V1ub/LaYlPzQYKTAon4QLlOoMwk
	PeM3kR9n0FPn0e2zs4hpdyyi9dxvIyrQ9p8iEFKfpxusw0Kmk7p6j5aYgBKFCQ==
Date: Mon, 16 Jun 2025 09:04:06 +0200
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
Message-ID: <20250616090406.32f62ca4@bootlin.com>
In-Reply-To: <CAGETcx9u-7TJ6_J5HdmDT=7A6Z08P-rUC0n+qnBoBi+ejRc2SQ@mail.gmail.com>
References: <20250613134817.681832-1-herve.codina@bootlin.com>
	<20250613134817.681832-7-herve.codina@bootlin.com>
	<CAGETcx9u-7TJ6_J5HdmDT=7A6Z08P-rUC0n+qnBoBi+ejRc2SQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvheelfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeviefffeegiedtleelieeghfejleeuueevkeevteegffehledtkeegudeigffgvdenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgeekpdhrtghpthhtohepshgrrhgrvhgrnhgrkhesghhoohhglhgvrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrn
 hgvlhdrohhrghdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggv
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_000417_385489_45961687 
X-CRM114-Status: GOOD (  15.57  )
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

On Fri, 13 Jun 2025 14:13:49 -0700
Saravana Kannan <saravanak@google.com> wrote:

> On Fri, Jun 13, 2025 at 6:49 AM Herve Codina <herve.codina@bootlin.com> wrote:
> >
> > Setting fwnode->dev is specific to fw_devlink.
> >
> > In order to avoid having a direct 'fwnode->dev = dev;' in several
> > place in the kernel, introduce fw_devlink_set_device() helper to perform
> > this operation.
> >  
> 
> This should not be set anywhere outside the driver core files. I'll
> get to reviewing the series, but until then, NACK to this.
> 
> Is there a specific patch that explain why we need to set this outside
> driver core?

We need to set it in case of creating device-tree node for PCI.

Usually, fwnode are created (based on DT or ACPI) and then, dev are
created.

In the PCI DT node creation case, device are already created and then, based
on information already computed by the kernel, DT node are created.

You can see that on patch 11 (dev setting was already upstream and it is
replace by a call to the helper for PCI host bridge) and on patch 13 (PCI
device).

Other patches (8, 9 and 10) replace the existing direct setting of the dev
member by a call to the helper.

Best regards,
Hervé

