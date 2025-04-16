Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8227EC369C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 10:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dllKgwcLha1xL/vp7a/BLD+IvTjOmLEdGFp4zUwZcgg=; b=AYEDe2qmnjtxT/tSE86Q7WyCX3
	T0IfslodjJ89sNw6xWCyV5qkQeIauGY2UV5oU5WWVK3jFB4i7flq81lOZrPAI5xPE6QDGnT2zBKPo
	3vdVW56aBlb60wdGf1i9Vck2GA21Bw3rzONQHEcnIvkfykt2MX7S1S6oKZIGGru8QjTOTIgzpZhWa
	iYN+PqWfVLMqAfk83fEUewkkANjvF2LILJlFOxR4ttsEtb3/0YrGrqMQp87mctquVe2efx6NegSYH
	xgEZ7fHIds9m6v5v3cY41Y4RTxchOUi+hPvRO5wZqvQ4J+Yh5UPUxF8EQkziiCIR/B8ALmh4jPqgH
	85WCkXxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u503j-00000009ANj-0DBT;
	Wed, 16 Apr 2025 10:31:59 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4yua-00000008x1v-29N7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 09:18:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6D0D61FCF1;
	Wed, 16 Apr 2025 09:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744795104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dllKgwcLha1xL/vp7a/BLD+IvTjOmLEdGFp4zUwZcgg=;
	b=nunaxTzVBV3n6npKioC4tkVt5qyJ/0ovo+X8BcdX9YasgCi5MZmYPXEYmZQLlVcbXUapoU
	/YW+9QKRf1K7y+ySRHWe80jMUkTndaRM8MOjvKCQyRoTQwPNs9rC5OBGm8mx+ZxtuFTS0M
	Mh+JZq330W/CcxlMqhLY9sUb27AkokWn+pB6L4aFnGPvahVNli93kPUcEwJ9DtSixG4nMG
	P1sEhO6BOAsiptpbuVq7KGWaNNBphmoJglgknx9T1i6XMbdUohCbAbO6ZiHQumVwZs6Zly
	BGVahasiNILSThVKRNFpHbojxJF6fnoFTX/w8G6I6tYPNy9h7p/XJv+V6hbqyA==
Date: Wed, 16 Apr 2025 11:18:19 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Lunn
 <andrew@lunn.ch>
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
 <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 15/16] misc: lan966x_pci: Add dtso nodes in order to
 support SFPs
Message-ID: <20250416111819.4fd7b364@bootlin.com>
In-Reply-To: <20250410084809.1829dc65@windsurf>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
	<20250407145546.270683-16-herve.codina@bootlin.com>
	<19f1a382-1b6b-42bd-a548-a1a5644c9a1b@lunn.ch>
	<20250408162603.02d6c3a1@bootlin.com>
	<D91CSNC07NYM.3KC467K0OZ4GG@bootlin.com>
	<c14dd5c6-2dae-4398-89a9-342e7a25bb30@lunn.ch>
	<D91XV1I4CY37.20T12FMZ5QLQ5@bootlin.com>
	<b1b33000-4c10-43cd-bcf4-d24fc73902b1@lunn.ch>
	<20250409161444.6158d388@windsurf>
	<c6257afe-36bb-46d8-8c22-da3b85028105@lunn.ch>
	<20250410084809.1829dc65@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdehleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppedvrgdtudemvgdtrgemvdegieemjeejledtmedviegtgeemvgdvvdemiedtfegumeehkegrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvgeeimeejjeeltdemvdeitgegmegvvddvmeeitdefugemheekrgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeguddprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehrrghfrggvlhesk
 hgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvg
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_021828_678441_16A41AF0 
X-CRM114-Status: GOOD (  18.46  )
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

Hi Thomas, Andrew,

On Thu, 10 Apr 2025 08:48:09 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Wed, 9 Apr 2025 17:03:45 +0200
> Andrew Lunn <andrew@lunn.ch> wrote:
> 
> > So it only supports a single .dtbo. In its current form it does not
> > scale to multiple .dtso files for multiple different boards built
> > around the PCIe chip.
> > 
> > At the moment, that is not really an issue, but when the second board
> > comes along, some refactoring will be needed.  
> 
> Indeed, but that's really an implementation detail. It doesn't change
> anything to the overall approach. The only thing that would have to
> change is how the driver gets the .dtbo. We could bundle several .dtbos
> in the driver, we could fall back to request_firmware(), etc.
> 

Not sure we need to split right now the existing dtso file nor rename it
even if it is updated in the series.

This could be done later when an other user of the LAN996x PCI chip is
there.

Doing something right now will probably need other modification when this
potential other user comes in. Indeed, depending on specificities of this
future user, what is done now could not match the need of this future user.

Any opinion?

Best regards,
Hervé

