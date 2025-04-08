Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA07FC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 14:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JoHpHGrHvAWvhU7WqsQUuRPEF36RuyRVdBvT8MviKt0=; b=HpakljFnMS3trQ/ab6NFZVhW13
	TfgfALAuqQKPvaNgTnGjyLJEJokQzRaw3fz1s3yvcRTdpXQtWt5uoPOjB9LWX1bpG5I62LVvjoH7B
	3rFOMLk8SO+wTt0UU9il5mmWBaQgIaiKP7PiH6u1Adx6L09v5OCRHiSrOhn+StopUugGCDFm6002y
	D9OY+QaQOV5WBQAXLSqTwf6IUl1OMCM/4sIWj/1mSlEQssW5JjIBHbZ/EURLDgvRemyNWAR4tolYc
	b9rethJFg0zxw1TqhsNe2TWI43SwjZ4xR0X5PQUKdxcdDYmi7pSul+jQDnZhOVuvEm6nrHn+yzNa2
	t9n+svDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29eY-00000004KPn-3zax;
	Tue, 08 Apr 2025 14:10:14 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29YQ-00000004JES-3v1n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 14:03:56 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F197044327;
	Tue,  8 Apr 2025 14:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744121031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JoHpHGrHvAWvhU7WqsQUuRPEF36RuyRVdBvT8MviKt0=;
	b=l4hAQeZmLC5TBAns0oXotjt35VFAVSgOe8VItJYKZBXR/JTgmG4mFx+mLLC+YZ09PT1PQn
	IgcQ5XgjFd6R+LQZ/Ca/rD8cIIxblv50Pc0HceVa4xxDBag3jg70UiwZsK+W/ffrwkXTXm
	J/NlvHM0suGF4SfgCPO/f/VMxvOJZfb1deFP9s60qCPHuX9egj4CjqXBI2Hq0O0irkW5Vj
	6qQ5wnA7slRnIBspIo+Q6eHd6vwsgouiokXn6ChDwTS7ZGR69VRxSze3J2xk/sA0yzw+nB
	W4Jfz79hgJsczIM+2YjLZ6eT/b7Uw8IHPn3d7X/fYDzjv9gEC09G204x/G4VmQ==
Date: Tue, 8 Apr 2025 16:03:44 +0200
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
Subject: Re: [PATCH 12/16] clk: lan966x: Add MCHP_LAN966X_PCI dependency
Message-ID: <20250408160344.3d3c834b@bootlin.com>
In-Reply-To: <Z_PxdmKbBGlhpQpr@smile.fi.intel.com>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
	<20250407145546.270683-13-herve.codina@bootlin.com>
	<Z_PxdmKbBGlhpQpr@smile.fi.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdefvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvdfhleejtdeftdejveffgedtuddtgefhtedtudfhuefhtddtffeiueeigfdvhfdvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegvtdgrmedvgeeimeejjeeltdemvdeitgegmegvvddvmeeitdefugemheekrgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdegieemjeejledtmedviegtgeemvgdvvdemiedtfegumeehkegrpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedtpdhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehrrghfrggvl
 heskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomh
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_070355_217204_8DF765D7 
X-CRM114-Status: GOOD (  18.24  )
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

On Mon, 7 Apr 2025 18:38:30 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Mon, Apr 07, 2025 at 04:55:41PM +0200, Herve Codina wrote:
> > The lan966x clock controller depends on the LAN969x architecture or the
> > LAN966x SoC.
> > 
> > This clock controller can be used by the LAN966x PCI device and so it
> > needs to be available when the LAN966x PCI device is enabled.  
> 
> ...
> 
> >  	depends on HAS_IOMEM
> >  	depends on OF
> > -	depends on SOC_LAN966 || ARCH_LAN969X || COMPILE_TEST
> > +	depends on SOC_LAN966 || ARCH_LAN969X || MCHP_LAN966X_PCI || COMPILE_TEST  
> 
> This doesn't seem to scale. Why not simply
> 
> 	depends on HAS_IOMEM
> 	depends on OF || COMPILE_TEST
> 
> ?
> 

With your proposal, if we configure a kernel without SOC_LAN966x or
ARCH_LAN969x or MCHP_LAN966X_PCI, in other words we configure a kernel
without a real needed for this clock controller driver, the user will be
asked about this driver.

This was already reported by Geert
   https://lore.kernel.org/all/369233dfded88ff6fb342e03794fe31985d84d82.1737383314.git.geert+renesas@glider.be/

I agreed with Geert that asking the user about those driver the LAN966x
depends on was not a good things and leads to confusion.

So, to prevent asking the user about this driver, I followed the same
strategy and added the dependencies.

IMHO, we should keep those dependencies here.

Best regards,
Hervé

