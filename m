Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762E7C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 12:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=48rObYaeZ/USnSNxnjEIUdReTs2PvkcUzFPZ3od5ozQ=; b=sNIemV6bgxVz7DPY1EIXMtaVO0
	dFxvXByMFeMwoU1ZnICpV1ZRReZzeCA7O7Ye5zb7mwFjGOLbXYuM8SSpBG88ZMEitmi26I1oLHCpg
	2/JmL+AVJkxZVB3++N8O5fnf+RKwhyuJ8NCeRCRWXrvelS8xAnrKbKiiBH1aVxDy8SRIAQhCMzamK
	V95HV/IkeNFmnztXONuuWhQhuWs65QBCf/6QPeihwS4KTQPmAqL+937am7xsKZJHjNHUJTCruybei
	IpbnFY8VMUgf8yu4nCVxdMq0UYzAEjqVy9hv8zK1gw+JKzkjFjpUocdHoGHPBWoMxDsGl9U6+uEIK
	AfLXXN2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u51pU-00000009V8r-3KDZ;
	Wed, 16 Apr 2025 12:25:24 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u51X0-00000009RMV-0a40
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 12:06:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=48rObYaeZ/USnSNxnjEIUdReTs2PvkcUzFPZ3od5ozQ=; b=Uf1PAeeNB7mtGRr9XeqT+lWOsk
	tU/VlmKveq7vFIay9Q57fAfy2osB/m5R1soDdnon8DLivpYkDTVTN4JNGXBHfNH521M+lfQLHBuMv
	th6fTqdKgseLY7FfLCKg5Gz/1l1WR3qZm5b53xVUgQD+DFQE2KYw/OzgerrpF0pmvjkQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u51WY-009c9k-0K; Wed, 16 Apr 2025 14:05:50 +0200
Date: Wed, 16 Apr 2025 14:05:49 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 15/16] misc: lan966x_pci: Add dtso nodes in order to
 support SFPs
Message-ID: <97cf068f-3770-4df9-a60a-30761ffcb03d@lunn.ch>
References: <19f1a382-1b6b-42bd-a548-a1a5644c9a1b@lunn.ch>
 <20250408162603.02d6c3a1@bootlin.com>
 <D91CSNC07NYM.3KC467K0OZ4GG@bootlin.com>
 <c14dd5c6-2dae-4398-89a9-342e7a25bb30@lunn.ch>
 <D91XV1I4CY37.20T12FMZ5QLQ5@bootlin.com>
 <b1b33000-4c10-43cd-bcf4-d24fc73902b1@lunn.ch>
 <20250409161444.6158d388@windsurf>
 <c6257afe-36bb-46d8-8c22-da3b85028105@lunn.ch>
 <20250410084809.1829dc65@windsurf>
 <20250416111819.4fd7b364@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416111819.4fd7b364@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_050618_178109_76F596FB 
X-CRM114-Status: GOOD (  25.45  )
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

On Wed, Apr 16, 2025 at 11:18:19AM +0200, Herve Codina wrote:
> Hi Thomas, Andrew,
> 
> On Thu, 10 Apr 2025 08:48:09 +0200
> Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> 
> > On Wed, 9 Apr 2025 17:03:45 +0200
> > Andrew Lunn <andrew@lunn.ch> wrote:
> > 
> > > So it only supports a single .dtbo. In its current form it does not
> > > scale to multiple .dtso files for multiple different boards built
> > > around the PCIe chip.
> > > 
> > > At the moment, that is not really an issue, but when the second board
> > > comes along, some refactoring will be needed.  
> > 
> > Indeed, but that's really an implementation detail. It doesn't change
> > anything to the overall approach. The only thing that would have to
> > change is how the driver gets the .dtbo. We could bundle several .dtbos
> > in the driver, we could fall back to request_firmware(), etc.
> > 
> 
> Not sure we need to split right now the existing dtso file nor rename it
> even if it is updated in the series.
> 
> This could be done later when an other user of the LAN996x PCI chip is
> there.
> 
> Doing something right now will probably need other modification when this
> potential other user comes in. Indeed, depending on specificities of this
> future user, what is done now could not match the need of this future user.
> 
> Any opinion?

I agree support for multiple .dtso can be done later.

But i would do the split between the .dtsi file for the PCIe device,
and the .dtso file for the board now. That is a pretty fundamental
concept in Linux DT support.

	Andrew

