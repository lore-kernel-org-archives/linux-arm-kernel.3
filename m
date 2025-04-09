Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A29A0C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 15:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lhtq1pefqTUVYOAkJzIOHqWiVsfsbUWsRek0JSSJoaM=; b=ND3ExT65OFGV+uymVvmw7UYfR1
	Eo4cy8V6dpTSFNBqhJUoljzW29NHswfl6WeCqMx7mg4ME8oxU5xQ94+Fei6D9tzmV3jYnUM8bZ8DM
	Oy2qVHhlY/oDy1FZEUhuMfR2e/dFGepYTkS7W6JgHClTTsn6B0LZRauow1W/ABBLgrkXAmXIrML/i
	eWYa/vIk1wBjqudY+eLo+Qgfj97LG1pmQl7FeYQRWQLRNCQe1QMkLrxuT30F0TrJ+qh0ggihzEtxS
	zWYBPAw5xJt5Ai4syvEyQh8KqWEYVquOfgyT7HNxVIrkh+q3vM9zaBgrSGqHV54zNROzFdS/BFeMt
	yC4BwEYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2XDj-00000007eYl-44Ni;
	Wed, 09 Apr 2025 15:20:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2WyO-00000007b44-3vCp
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Apr 2025 15:04:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Lhtq1pefqTUVYOAkJzIOHqWiVsfsbUWsRek0JSSJoaM=; b=ZNuTEhtVdUCIDP2WCjWFCDa3Vj
	yyI9nRj/7gj7jwXEwvnLlL0jDs7gTUsaOmGWFRwwQAVtj4IXTRDGRJf/JBHWTYFHpzE66nSO0N0D3
	PL01xYILElcRZD7OTWF3JNZOOhpi87LLY/+RfqLdgtw/m47koVWgDkzWPxlHI1hXNhgVt/rkL0SdJ
	cBKkVhMTttPASnoicPOyOJ2Agpw+rEYRXOGZvm80bOz/Mg5XvqXX1Rx6GhFEGmLegVG4YQYyIzhUU
	SlvV0zj+H0eBVWPvjbGZAeS7LVFnCNfA7p/R652CdDIUoeUAggyWyFdwclrbzOZpEDNLaOyoDEYz0
	11bzGmlQ==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2WyL-00000008ddk-14cR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 15:04:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Lhtq1pefqTUVYOAkJzIOHqWiVsfsbUWsRek0JSSJoaM=; b=EDb9t9ug3VAuhsP2v5wV6dRtb9
	iS7Wnq8zgIJ18meTszE5HNwkmgb/DJWG2rzHMpIlo2YO2DjOhaxa1Afh/x+VSB6uO5Dtr7QEl5l6y
	CTgeIulElJ7lZgvn0u/oTdY7ogOeKQ9FUbXWyrwgM8EocLlJ/LQT6+wOPKMDD0UK5Eds=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u2Wxt-008Ymd-Uk; Wed, 09 Apr 2025 17:03:45 +0200
Date: Wed, 9 Apr 2025 17:03:45 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Herve Codina <herve.codina@bootlin.com>,
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
Message-ID: <c6257afe-36bb-46d8-8c22-da3b85028105@lunn.ch>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
 <20250407145546.270683-16-herve.codina@bootlin.com>
 <19f1a382-1b6b-42bd-a548-a1a5644c9a1b@lunn.ch>
 <20250408162603.02d6c3a1@bootlin.com>
 <D91CSNC07NYM.3KC467K0OZ4GG@bootlin.com>
 <c14dd5c6-2dae-4398-89a9-342e7a25bb30@lunn.ch>
 <D91XV1I4CY37.20T12FMZ5QLQ5@bootlin.com>
 <b1b33000-4c10-43cd-bcf4-d24fc73902b1@lunn.ch>
 <20250409161444.6158d388@windsurf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409161444.6158d388@windsurf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_160413_377148_BCBD7973 
X-CRM114-Status: GOOD (  18.37  )
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

On Wed, Apr 09, 2025 at 04:14:44PM +0200, Thomas Petazzoni wrote:
> On Wed, 9 Apr 2025 16:04:51 +0200
> Andrew Lunn <andrew@lunn.ch> wrote:
> 
> > And you need some way to map the PCI ID to the correct .dtso file.
> > Maybe that is just a lookup table in the driver, or maybe you can pack
> > the .dtso file into a kernel module with the correct
> > MODULE_DEVICE_TABLE(pci, ...) so that PCI probing pulls in the
> > specific driver module with the .dtso, which via dependencies pulls in
> > the core driver which can actually make use of the .dtso?
> 
> Well, check the already upstream driver:
> 
>   https://elixir.bootlin.com/linux/v6.13.7/source/drivers/misc/lan966x_pci.c
> 
> It indeed binds on the PCI ID, and the driver bundles the .dtbo.

So it only supports a single .dtbo. In its current form it does not
scale to multiple .dtso files for multiple different boards built
around the PCIe chip.

At the moment, that is not really an issue, but when the second board
comes along, some refactoring will be needed.

      Andrew

