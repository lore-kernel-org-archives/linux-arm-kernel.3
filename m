Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC409C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 22:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CPkQ9CydGnG5tF/EHT21gmnn1PO6zhIZzOrZPNx4PgA=; b=Dx34uS44d+4BnYqNumNFl/uIPI
	Kn6Pyi9AbIlKRW7ULt48bvAVJA0025uKyeg9YcQyRtXmaolsV8B9myrddMPWzbAxkwRW+nzUhIlQT
	B5MMTRpRpWXD4S29ovAhdR54JbvIqu0gefWBZYFPZY6THF9ChP7sKtYEM742jRR2uSbm6xa5YAc3j
	ebjfxvMOtAik4Q8QP1b1Yvsx7aqBryvv5qMKRseuIPf6lGJP7QDPq7K/0R8EI2XpywOtrQSuios1F
	KiVolMBVBaOWpN0azDsIxg0efGJvxD/5OYsLQVYyD/p+8x1BUIgZDOeo/BLpmQA9g7X8XnzGc4/tL
	pTD0lIQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCn6C-0000000Grwy-3MBW;
	Wed, 07 May 2025 22:18:44 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCn2k-0000000GrjQ-11mt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 22:15:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=CPkQ9CydGnG5tF/EHT21gmnn1PO6zhIZzOrZPNx4PgA=; b=U/Toc8P1QESr/ikkBlUdgnkPeZ
	wtmk8RevqEbmM0rvr1ojqNGeRhJe76CZ7XVDMiDnBlPvJTpsGybkWEQPVN4jDWkTmMPCzd2Kg2zVe
	DRcNXD0c3AlEyc50C97JLBRg6L0r/ubgs5FUC4kGnUvDYE7ZMVesEit9HWwG5OgMYRGg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uCn2W-00BwA0-Op; Thu, 08 May 2025 00:14:56 +0200
Date: Thu, 8 May 2025 00:14:56 +0200
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
Subject: Re: [PATCH v2 22/26] misc: lan966x_pci: Rename lan966x_pci.dtso to
 lan966x_evb_lan9662_nic.dtso
Message-ID: <0c3028dd-8c98-4816-bb52-7383391e5a94@lunn.ch>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
 <20250507071315.394857-23-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507071315.394857-23-herve.codina@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_151510_281247_32E24B44 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
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

On Wed, May 07, 2025 at 09:13:04AM +0200, Herve Codina wrote:
> The lan966x_pci.dtso describes the Microchip EVB-LAN9662-NIC board [0]
> 
> This PCI board embeds a LAN9962 PCI device chip, part of the LAN966x
> family.
> 
> Rename the lan966x_pci.dtso accordingly.
> 
> Link: https://www.microchip.com/en-us/development-tool/EV53U25A [0]
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

