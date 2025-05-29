Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD326C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 14:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ktm3H4JoTcBPhvijSXu1K0RN9L58nKBd88Iy0VSKeiU=; b=mERBn0gz+GBYeWfkWOVyY9HVpx
	H70zE6XiHCgKCHL6xZzr3ejDp9pwslh2XmBZ7OIj63xsg1c4FStKXj/ZlY9JN1qRu5buJbLRzSJ10
	c3P9jtGi91X9ynxAVcx7J4MWnU6ymIA7C3vQvJW+Hz4sKT68Q/Ee408A7lSbKEJFK6Jp60d+UkelS
	W8K1ruyl5kEjRr9ntdTq1yqaxa+G74fh9Z63mNwaXzNfSwIgoaAoJB1XDzomktg2vqWHkn1zccU8r
	875MZrUcrzPwF9T2YNL3GHW9TQEzQk14jyXA6BnBicF6Gg6OutYymW30Pea+90Wpq+jCr6yXLnS6P
	K+9ifyWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKe6v-0000000FxAo-0whQ;
	Thu, 29 May 2025 14:19:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKdAB-0000000FqGX-1F7G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 13:19:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 967EF44DDA;
	Thu, 29 May 2025 13:19:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23FFAC4CEE7;
	Thu, 29 May 2025 13:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748524754;
	bh=0FPlq097Hcbp5iDFnnpPEASquDvr0YwVHBR1ZnHEybM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bGpNNkhuC+2wzq01z4Hg6fg9gFT4OCGfEH33UX/SRQFSxkuIstRSlH8RLLfCGnjJP
	 uLFY9f0FoIssiPqFtK9kkSboA5flQ+CQUdZkyEvUwI67Iiz3100skqqJj3zl5NaBIC
	 Vp4raynx46b7liwMGM5/alirwYlvjt0bi622Gh8UzySB9RP2UZTKFwyuOOACBZsj5A
	 pSpwn6kw8oVm/aNX63avKm3Mz/WoaVdPCbAW/fWLnWIr9O0l/EKUmgRgHLwFGzWJCx
	 /PUGfC1aBQdwZF90uxJqFFjJOuTfvP2Yg5RcNQ/yU4N0Y5PYuqmpr1pgm64RrXUaE4
	 IXj77ReiEv96Q==
Date: Thu, 29 May 2025 08:19:12 -0500
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Herve Codina <herve.codina@bootlin.com>,
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
	Arnd Bergmann <arnd@arndb.de>,
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
Message-ID: <20250529131912.GA2798026-robh@kernel.org>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
 <20250507071315.394857-24-herve.codina@bootlin.com>
 <8b97e095-dbed-438c-9c6d-d3c2c5929fc0@lunn.ch>
 <CAMuHMdUVvOMavxSAKaSMOwj_zXR=5h8KrrqNg4RS2Yaw3WXpKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUVvOMavxSAKaSMOwj_zXR=5h8KrrqNg4RS2Yaw3WXpKg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_061915_373740_1AD385CF 
X-CRM114-Status: GOOD (  22.69  )
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

On Thu, May 08, 2025 at 09:13:33AM +0200, Geert Uytterhoeven wrote:
> On Thu, 8 May 2025 at 00:24, Andrew Lunn <andrew@lunn.ch> wrote:
> > On Wed, May 07, 2025 at 09:13:05AM +0200, Herve Codina wrote:
> > > Only one device-tree overlay (lan966x_evb_lan9662_nic.dtbo) is handled
> > > and this overlay is directly referenced in lan966x_pci_load_overlay().
> > >
> > > This avoid to use the code for an other board.
> > >
> > > In order to be more generic and to allow support for other boards (PCI
> > > Vendor/Device IDs), introduce the lan966x_pci_info structure and attach
> > > it to PCI Vendor/Device IDs handled by the driver.
> > >
> > > This structure contains information related to the PCI board such as
> > > information related to the dtbo describing the board we have to load.
> > >
> > > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> >
> > How big is the dtbo ?
> >
> > This is going in the right direction. I'm just wondering if each dtbo
> > should be wrapped in its own very slim PCI driver, which simply
> > registers its lan966x_pci_info structure to a core driver. Only the
> > needed dtbo will then be loaded into memory as a module, not them all.
> 
> Alternatively, the dtbo could be loaded through request_firmware().
> That could lead to a generic support option in the PCI core, which would
> fallback to loading pci-<vid>-<pid>.dtbo when no driver is available.

Yes!

Rob

