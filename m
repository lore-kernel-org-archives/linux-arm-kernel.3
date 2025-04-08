Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E212BC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 14:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZU8AgxcMgNb7+V6IhjT3po2+emT09ZzOnp6Z/8jLn6c=; b=0Dt9kXlw7WrBxNvhyofsiHrxDf
	Jh5OdZlFTi5xYoaCctzw3hqy4OSeK4+SPCjUbovwuP8fyN7HDcbFN8hEJwLDF7ZE0KgsrONyzM08K
	eKNUAe2FqViRsM/KxFP+JvtUedE4sWxskjzafp2wmfMRtoSqFXqwQqVbr6JC/5NZiEzn9OOBlb4w0
	NO+KuJNKMrfRUe4PFkjA9fWG6Ctp43BEuDR9/gBoM5sD5+sRD5aNb4x+cbdAPBUNl7BrRipOdXseu
	+zJw1yZG/skKxr6ZPSo3/WYTRYmhWEjUPR+VkQvQnB086Y9YDSsj8s/JbTvF+qZIfoZufbGZavP5q
	7ZQbDwdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2AEe-00000004SHg-3baS;
	Tue, 08 Apr 2025 14:47:32 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2ACs-00000004RxI-3xOY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 14:45:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ZU8AgxcMgNb7+V6IhjT3po2+emT09ZzOnp6Z/8jLn6c=; b=TLs5lB9Q6k6NOM0ejAiZKSUmbw
	Dj+iAfTAAhm+Ug5dOAXdaCUR0ebD73P/pVGjYFtKaTG8ZV+/atjxB8tqHRg7WBYsJwW5Vwwr7EF9c
	EXg2eTLofm8UMCn7fjXC4Ewz5LuW28/Ib8u6LPJzVd95vL9xcZUe0UdgFLyk1LVTAELk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u2ACU-008PSe-Gy; Tue, 08 Apr 2025 16:45:18 +0200
Date: Tue, 8 Apr 2025 16:45:18 +0200
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
Subject: Re: [PATCH 15/16] misc: lan966x_pci: Add dtso nodes in order to
 support SFPs
Message-ID: <e370fcd3-bd58-47d1-bc0c-c0abeebbefdc@lunn.ch>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
 <20250407145546.270683-16-herve.codina@bootlin.com>
 <19f1a382-1b6b-42bd-a548-a1a5644c9a1b@lunn.ch>
 <20250408162603.02d6c3a1@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408162603.02d6c3a1@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_074542_978368_78A59304 
X-CRM114-Status: GOOD (  21.86  )
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

On Tue, Apr 08, 2025 at 04:26:03PM +0200, Herve Codina wrote:
> Hi Andrew,
> 
> On Mon, 7 Apr 2025 22:05:31 +0200
> Andrew Lunn <andrew@lunn.ch> wrote:
> 
> > On Mon, Apr 07, 2025 at 04:55:44PM +0200, Herve Codina wrote:
> > > Add device-tree nodes needed to support SFPs.
> > > Those nodes are:
> > >  - the clock controller
> > >  - the i2c controller
> > >  - the i2c mux
> > >  - the SFPs themselves and their related ports in the switch
> > > 
> > > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > > ---
> > >  drivers/misc/lan966x_pci.dtso | 111 ++++++++++++++++++++++++++++++++++
> > >  1 file changed, 111 insertions(+)
> > > 
> > > diff --git a/drivers/misc/lan966x_pci.dtso b/drivers/misc/lan966x_pci.dtso
> > > index 94a967b384f3..a2015b46cd44 100644
> > > --- a/drivers/misc/lan966x_pci.dtso
> > > +++ b/drivers/misc/lan966x_pci.dtso  
> > 
> > What exactly does this DTSO file represent?
> 
> The dsto represents de board connected to the PCI slot and identified
> by its PCI vendor/device IDs.

Then i think the name lan966x_pci.dtso is too generic. It should be
named after whatever microchip calls the RDK.

> We can move the PCI chip in a dtsi included by this dtso but in the
> end this leads to the exact same representation. Further more, moving
> out the PCI chip description in its own dtsi out of this dtso can be
> done in a second step when an other dtso uses the same chip.

And what would you call this pulled out dtsi file? lan966x_pci.dtsi?
That is going to be confusing.

Naming is hard, but we should assume this PCIe device is going to be
successful, and a number of OEMs will build cards around it, so there
needs to be space within the naming scheme for them.

	Andrew

