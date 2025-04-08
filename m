Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92664C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 15:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0AxXXCyGehUeIEBMKM+/UdgR6pywaI6NfyB/Hg4NGkk=; b=Qj/+YHrtGx/k6P5JoPz8EYJM1j
	8UI+Xjf11KhlUufkUPatDluKO+X83nBNZ/dIS2CElOhZ3NXBQrqAphMVpPCbokY1jrWNlVFLPOzz2
	2xWLK11IQaAKfnZqqw2VX1oOnJKK44c1tq901MecSH3uI+yv9c1fbxWvtWa24sUXM2E0iB4RsfbsB
	N7NKGSXUCOV+VQkPE4hZe/n0JPiZqEQSz1b6IPIYRV9gZ/t5qD4cim10dGzuo3pbI8GjqbfZtfeyu
	WHY+dl+CAecQKTQHpPeSg67SpsK7R32aEuEUL/WikFpvPTI+c42cIvu0vUnd8RiXyKayVdXZYb5jn
	KAgK3+sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2B59-00000004faT-2AMI;
	Tue, 08 Apr 2025 15:41:47 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2B2A-00000004eto-0J9c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 15:38:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=0AxXXCyGehUeIEBMKM+/UdgR6pywaI6NfyB/Hg4NGkk=; b=ax
	RaKRvMxLNy1nBRskzmrWJqy7SKbGNVN5ztU5caLqrvQKZZPlHkHy104KGZfqfMnbtPn6mJ2MdUynW
	bSlFnNxpbCZGbL9L+rBQrRBde2BHYdR68UaRU610uhMDkZyCerFWvPcuXpriSsBVfUt5PPjdGGus8
	+qhrEZY1NPDNudE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u2B1l-008PrO-KZ; Tue, 08 Apr 2025 17:38:17 +0200
Date: Tue, 8 Apr 2025 17:38:17 +0200
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
Message-ID: <c14dd5c6-2dae-4398-89a9-342e7a25bb30@lunn.ch>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
 <20250407145546.270683-16-herve.codina@bootlin.com>
 <19f1a382-1b6b-42bd-a548-a1a5644c9a1b@lunn.ch>
 <20250408162603.02d6c3a1@bootlin.com>
 <D91CSNC07NYM.3KC467K0OZ4GG@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D91CSNC07NYM.3KC467K0OZ4GG@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_083842_112720_464F6507 
X-CRM114-Status: GOOD (  20.42  )
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

On Tue, Apr 08, 2025 at 05:13:54PM +0200, Thomas Petazzoni wrote:
> Andrew, Hervé,
> 
> On Tue Apr 8, 2025 at 4:26 PM CEST, Herve Codina wrote:
> 
> >> What exactly does this DTSO file represent?
> >
> > The dsto represents de board connected to the PCI slot and identified
> > by its PCI vendor/device IDs.
> 
> If I may extend on that by providing what I believe is a more
> accurate/precise definition.
> 
> The DTSO doesn't represent the board, rather it describes the HW
> topology of the devices inside the PCI endpoint. Indeed, the PCI
> endpoint is a full-blown SoC with lots of different HW blocks that
> already have drivers in the kernel (because the same chip can be used
> with Linux running on an ARM core embedded in the SoC, rather than
> access as a PCI endpoint). So the DTSO describes the full topology of
> the HW blocks inside this complex PCI endpoint, just like the DTS
> describes the full topology of the HW blocks inside an SoC.

"HW blocks inside an SoC." That would be the SoC .dtsi file. Anything
outside of the SoC is in the .dts file. OEM vendors take the SoC,
build a board around it, and name there .dts file after the board,
describing how the board components are connected to the SoC.

So..

So by PCI endpoint, you mean the PCIe chip? So it sounds like there
should be a .dtsi file describing the chip.

Everything outside of the chip, like the SFP cages, are up to the
vendor building the board. I would say that should be described in a
.dtso file, which describes how the board components are connected to
the PCIe chip? And that .dtso file should be named after the board,
since there are going to many of them, from different OEM vendors.

	Andrew

