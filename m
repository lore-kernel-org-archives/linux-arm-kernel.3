Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDCFBC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 14:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JWzD99WB5KN2vaRYPTzKx8K4XzMyZwRHO6NZZmlHLEY=; b=WxZP8/7E5RiR6pJ+obMbFzX6AJ
	wu3mcn7Rfiy8tP9/BLVJxGOaUzszjPj4FlwlwpHXiG7k2o1fN/X8/3p8BH/b9x6p91dC5roCqH2TS
	jMp5FKVFXdeRLKDqvFkCTvXOU7AONEFLeGDMpwQYY1ZGWAaJcU+524Yyh7cOr3z7epJpvoFxwNYAT
	HMpB93XatevwcqeP5KukayL+OxwfT/Y8853moOeKisIycJlnVjfd7v1WwidebcWyKyX9GGaeh8xde
	R6geZGuSJvaTaIbRm7rgt+6/dKnXuHpEhP8jorRNa8G4VOG+8r4bPztJ9jHMe847I50PUjgpKPPIy
	fMsr25jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueE0r-00000002iBp-45Rq;
	Tue, 22 Jul 2025 14:30:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueDbh-00000002dGs-1jR5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 14:04:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 91608601FB;
	Tue, 22 Jul 2025 14:04:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85268C4CEF1;
	Tue, 22 Jul 2025 14:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753193075;
	bh=uPFuamjn8JgXag9RFI74J/C90ZWWlQSjqj7GpBmomJ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sWkFl8nCPLNDlOJMG6Ch0dE8liwQT/TjEDMiX0lMwJnuLusjuKrCzLod80NRSELUo
	 u8NHIk9I5drvAO5b8cWaslWSSVtrI12ORXbU6cnC3czmox0Gpc/eBFVmQbv7WsXDHP
	 7XI0tTvIdC3OANtPZeGtvVmL87/AUfVlow3h8BPE2czQ//X9ztlbTiQMaD2B0vzKbf
	 q9hGEfFkRTSDPXvxHMcUnuRjST9bZDk/bPZV2PYpDIsFdoH6g089xiau1VqsOdWm+K
	 5yrtXZWYlUbYU8EfrX/vfKb1ZfK13RF2n1xAXnRVjHWsiZpxmDlx7rVQTbvJetcEdK
	 Bwqfe2NYx+UOw==
Date: Tue, 22 Jul 2025 16:04:31 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Peter Rosin <peda@axentia.se>, Derek Kiernan <derek.kiernan@amd.com>, 
	Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Wolfram Sang <wsa@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Davidlohr Bueso <dave@stgolabs.net>, Dave Jiang <dave.jiang@intel.com>, 
	Alison Schofield <alison.schofield@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Dan Williams <dan.j.williams@intel.com>, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-cxl@vger.kernel.org, Allan Nielsen <allan.nielsen@microchip.com>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, Steen Hegelund <steen.hegelund@microchip.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 15/28] i2c: core: Introduce i2c_get_adapter_physdev()
Message-ID: <sk6dwbont52x7zt3woqghurkkkms72f3zxubbadi2gp2yj3sbw@wdstymdtzouc>
References: <20250613134817.681832-1-herve.codina@bootlin.com>
 <20250613134817.681832-16-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613134817.681832-16-herve.codina@bootlin.com>
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

Hi Herve,

On Fri, Jun 13, 2025 at 03:47:55PM +0200, Herve Codina wrote:
> The physical device providing an I2C adapter is the device that calls
> i2c_add_adapter() or variants and i2c_del_adapter().
> 
> Most of the time this physical device is the parent of the adapter
> device.
> 
> Exceptions exist with i2c muxes. Indeed, in case of i2c muxes, the
> parent of the mux adapter device points to the adapter device the mux is
> connected to instead of the physical of this mux adapter.
> 
> Introduce i2c_get_adapter_physdev() and a new physdev field in the
> adapter structure in order to ease the adapter physical device
> retrieval.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Makes sense to me,

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

