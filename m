Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B60C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 22:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PzMdG6ucufIYiDDg070rOIAisSRRkIriDyNiBBXVH3U=; b=doBJ5b3NIfWeE9tPQOMr9j3Hxb
	fN+DBlHSbiDTY8DIDOoLlE9wp/ZTovoXW95JesKL1GwnYL9i6HgbgElOt6XUBXLe7ZacWNnXWPZtN
	1hptxjM3amLavmKDFwvj3/oetvCNYmpL3hgJMeeZ2UuPTAROMbSjmCLEPCHpZFuXlLnYazrJ5uvSj
	ZaPMdan3Trgal8ukcODFnOJr2pPlrD6n4QDse21HFPtSdu+nSeda/xd81yysJ9d+aQPJdHx7E4Wzv
	6kMMjiRBG0APp7mklOO7wkYtaAakyWbO4aeMtjW+SjyPnz615bWz64aiFojSx1jfQWMXFwXpInGyW
	TQ7iy9jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCnDc-0000000GsVi-257w;
	Wed, 07 May 2025 22:26:24 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCnBb-0000000GsNl-17ST
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 22:24:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=PzMdG6ucufIYiDDg070rOIAisSRRkIriDyNiBBXVH3U=; b=H3AhQNzfKur7H3echOL82K5wSj
	UWauEM7K0xtUngTkTiumFckVqkxTSQmxx04ybKUuXMGDwQxdg9v4LTVktEbeK1wYbAEG7wA2phbCJ
	WOEUl0ZmHpOetacgwgUET9KPOR85GwrqWO+zoimHuICTlzt/azYqhg8fHIiVUKBeUXS8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uCnBL-00BwDo-6P; Thu, 08 May 2025 00:24:03 +0200
Date: Thu, 8 May 2025 00:24:03 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 23/26] misc: lan966x_pci: Introduce board specific data
Message-ID: <8b97e095-dbed-438c-9c6d-d3c2c5929fc0@lunn.ch>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
 <20250507071315.394857-24-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507071315.394857-24-herve.codina@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_152419_325166_AE32655E 
X-CRM114-Status: GOOD (  15.32  )
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

On Wed, May 07, 2025 at 09:13:05AM +0200, Herve Codina wrote:
> Only one device-tree overlay (lan966x_evb_lan9662_nic.dtbo) is handled
> and this overlay is directly referenced in lan966x_pci_load_overlay().
> 
> This avoid to use the code for an other board.
> 
> In order to be more generic and to allow support for other boards (PCI
> Vendor/Device IDs), introduce the lan966x_pci_info structure and attach
> it to PCI Vendor/Device IDs handled by the driver.
> 
> This structure contains information related to the PCI board such as
> information related to the dtbo describing the board we have to load.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

How big is the dtbo ?

This is going in the right direction. I'm just wondering if each dtbo
should be wrapped in its own very slim PCI driver, which simply
registers its lan966x_pci_info structure to a core driver. Only the
needed dtbo will then be loaded into memory as a module, not them all.

Pretty much all the pieces are here, so it can be done later.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

