Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1108BC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 15:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ga4DYhJ2FO3ImSWe5QoRj6QIF5B7qFE+8eHa0kIn7Ms=; b=YeRXh20DlvS6jtfbvCe7OR2+pN
	J8xuAmiwCXf00x527Xp2kuEev01J6GTnn6QAA1MldxZTnGF6tpGHuF0VUHThDjiPtrwA6aNHOIeYf
	oo7wzuRjIZ3xxcMmSQYZhHjMRMz3W2MMo/1/5YMAyCMQMftqh2xP4i47AAN7rpDXuRRBQ24I/jbKu
	CRuAZC1EzvDBbt0vbPbRZyaO8BuuAePiyddAC+9wsFj/V34DFeN1J5aHMWC5Q75RG6PzMpACctnOr
	ueFZidAngaJqJ8A+8SxueyC/rEMI1uk1JGsHZBE7zW7rLBbATcns+QBW/eTSkYgE34VsuTppg5NYG
	ozWYb5rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVB6k-0000000F7eR-24MZ;
	Fri, 27 Jun 2025 15:35:18 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVARW-0000000EyCR-2qeS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 14:52:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8126544365;
	Fri, 27 Jun 2025 14:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751035958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ga4DYhJ2FO3ImSWe5QoRj6QIF5B7qFE+8eHa0kIn7Ms=;
	b=OTPRR4yKaNYHU2ov192tpqD6SRrTnToZ1hO2EKs+LgXa/u/n5Ff5+AFuSXuKxf48WQTFy9
	tvP0bwTeZzQG3M2K/eR7hrlZMT6G/tr8dkcAMFgq0yZpFgxhn1qJYxP+/xp3VX8ODxcLB8
	ToGFVrpah/FsapRai7V9/GgGbWagJ0lOA/O2Ak6rrtlB9gTfkrlbsfteBQLNa8Gr5HSv/Q
	PIzpSkoHSZBa3wA1kJ2c4ku32k11PGXFGs00q8vloMEdslC0RUceJAXHB90+PIZ7ZJNG2F
	uQ5mtoEX9RSsaMLDQqL3bNZ6pMWN0+C9YhJgIXQ/pnLFiGEeqvO4o7iTbCQu4Q==
Date: Fri, 27 Jun 2025 16:52:32 +0200
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
Subject: Re: [PATCH v3 02/28] driver core: Rename get_dev_from_fwnode()
 wrapper to get_device_from_fwnode()
Message-ID: <20250627165232.0b3dc935@bootlin.com>
In-Reply-To: <20250627141846.GA3234475-robh@kernel.org>
References: <20250613134817.681832-1-herve.codina@bootlin.com>
	<20250613134817.681832-3-herve.codina@bootlin.com>
	<20250627141846.GA3234475-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeffeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvdfhleejtdeftdejveffgedtuddtgefhtedtudfhuefhtddtffeiueeigfdvhfdvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgeekpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhop
 ehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvg
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_075243_035890_71BA3DC0 
X-CRM114-Status: GOOD (  20.60  )
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

On Fri, 27 Jun 2025 09:18:46 -0500
Rob Herring <robh@kernel.org> wrote:

> On Fri, Jun 13, 2025 at 03:47:42PM +0200, Herve Codina wrote:
> > get_dev_from_fwnode() calls get_device() and so it acquires a reference
> > on the device returned.
> > 
> > In order to be more obvious that this wrapper is a get_device() variant,
> > rename it to get_device_from_fwnode().
> > 
> > Suggested-by: Mark Brown <broonie@kernel.org>
> > Link: https://lore.kernel.org/lkml/CAGETcx97QjnjVR8Z5g0ndLHpK96hLd4aYSV=iEkKPNbNOccYmA@mail.gmail.com/
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Reviewed-by: Saravana Kannan <saravanak@google.com>
> > Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > ---
> >  drivers/base/core.c | 14 +++++++-------
> >  1 file changed, 7 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/base/core.c b/drivers/base/core.c
> > index cbc0099d8ef2..36ccee91ba9a 100644
> > --- a/drivers/base/core.c
> > +++ b/drivers/base/core.c
> > @@ -1881,7 +1881,7 @@ static void fw_devlink_unblock_consumers(struct device *dev)
> >  	device_links_write_unlock();
> >  }
> >  
> > -#define get_dev_from_fwnode(fwnode)	get_device((fwnode)->dev)
> > +#define get_device_from_fwnode(fwnode)	get_device((fwnode)->dev)  
> 
> In patch 3, you add the same define. Is there some reason to not move it 
> to a header?
> 

In this patch (patch 2), I rename the define. In patch 3, I move the define in
an other place in the same file (core.c) in order to have it available for the
function added (also in patch 3).

I don't think we need to move it to a header.

Best regards,
Hervé

