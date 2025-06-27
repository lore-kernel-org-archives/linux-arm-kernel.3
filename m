Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F346C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 17:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pJLsP3FGX+/FtggvbC9ctuA5MpseUu51ppjPRhxm1ME=; b=rKsXQ5c88Jf2X3tsbpDJR+ievZ
	4XPU/DIEk/LtIywS1rJ9neQX8yO31JviJqResKBn7UX5GK7AVxcr1nD+GicGRPmiolWuNfoUsKKTW
	FZ8Ic5d7ZcLuI7PL9jeHWLY8uxsW9bI244+sK5PXiJDSRc/3R+50vBHJhysCf2rOk/Fu4gXG1mnhF
	LYAwoWskSnJcpAeKL2ts9NLWEPwI7kecOA7qw8sP3ukirgOsdP3/aHwUt3lVTXi1ZYdZId4gyEiWr
	WfkOnt9nG/bIPmNnqkFaJJw7xFvb1WFEU4+m4nDkjxAg0vC7qxex8NY2w8v9464BvQFs/KL65JJwT
	+7k09XpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVCjF-0000000FOC8-0uHM;
	Fri, 27 Jun 2025 17:19:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVBTL-0000000FCAy-3PqC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 15:58:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E02636111F;
	Fri, 27 Jun 2025 15:58:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D7B3C4CEE3;
	Fri, 27 Jun 2025 15:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751039918;
	bh=tBv0zN4w3fBWkY/nFOn0k+IhVxh6OQEYPfuuw9vKCvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b4tJ94JZTjGfbHmZDMM8bIuOky0BWZylZfr+Z7v8HXEL7evqfsEWw1BgYoEYnFfpX
	 SdKj4hkTwOEnNMp6O4y/hMVwX+Tk/9SY3kG6RNby6zDETioc5MDSawDH9+LcaRgrsG
	 Pz3RCeX3aRYkjYStdMtyjYME4zWrNpS+iykXmBun6VP+XXrF6ivxSzv5WeRN87gV/M
	 HLSMkb13vj/LZuOP9gKQN4koUKfveUcJGZoe0jAWfkjC9sE+Y1rfFm+XLyHfVaaSV5
	 SQAYvDPy3PQkLshJCnEyhDpwGRkyX80rd1xx5d7Iwju+Cm+YcCtjz9Kx4UzxQ1xIYx
	 RCWGTryFzxJ0Q==
Date: Fri, 27 Jun 2025 10:58:37 -0500
From: Rob Herring <robh@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
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
	Davidlohr Bueso <dave@stgolabs.net>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 00/28] lan966x pci device: Add support for SFPs
Message-ID: <20250627155837.GC3234475-robh@kernel.org>
References: <20250613134817.681832-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613134817.681832-1-herve.codina@bootlin.com>
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

On Fri, Jun 13, 2025 at 03:47:40PM +0200, Herve Codina wrote:
> Hi,
> 
> This series add support for SFPs ports available on the LAN966x PCI
> device. In order to have the SFPs supported, additional devices are
> needed such as clock controller and I2C.
> 
> As a reminder, the LAN966x PCI device driver use a device-tree overlay
> to describe devices available on the PCI board. Adding support for SFPs
> ports consists in adding more devices in the already existing
> device-tree overlay.
> 
> With those devices added, the device-tree overlay is more complex and
> some consumer/supplier relationship are needed in order to remove
> devices in correct order when the LAN966x PCI driver is removed.
> 
> Those links are typically provided by fw_devlink and we faced some
> issues with fw_devlink and overlays.
> 
> This series gives the big picture related to the SFPs support from
> fixing issues to adding new devices. Of course, it can be split if
> needed.
> 
> The first part of the series (patch 1, 2 and 3) fixes fw_devlink when it
> is used with overlay. Patches 1 and 3 were previously sent by Saravana
> [0]. I just rebased them on top of v6.15-rc1 and added patch 2 in order
> to take into account feedback received on the series sent by Saravana.
> 
> Those modification were not sufficient in our case and so, on top of
> that, patch 4 and 5 fix some more issues related to fw_devlink.
> 
> Patches 6 to 12 introduce and use fw_devlink_set_device() in already
> existing code.
> 
> Patches 13 and 14 are related also to fw_devlink but specific to PCI and
> the device-tree nodes created during enumeration.
> 
> Patches 15, 15 and 17 are related fw_devlink too but specific to I2C
> muxes. Patches purpose is to correctly set a link between an adapter
> supplier and its consumer. Indeed, an i2c mux adapter's parent is not
> the i2c mux supplier but the adapter the i2c mux is connected to. Adding
> a new link between the adapter supplier involved when i2c muxes are used
> avoid a freeze observed during device removal.
> 
> Patch 18 adds support for fw_delink on x86. fw_devlink is needed to have
> the consumer/supplier relationship between devices in order to ensure a
> correct device removal order. Adding fw_devlink support for x86 has been
> tried in the past but was reverted [1] because it broke some systems.
> Instead of enabling fw_devlink on *all* x86 system or on *all* x86
> system except on those where it leads to issue, enable it only on system
> where it is needed.
> 
> Patches 19 and 20 allow to build clock and i2c controller used by the
> LAN966x PCI device when the LAN966x PCI device is enabled.
> 
> Patches 21 to 25 are specific to the LAN966x. They touch the current
> dtso, split it in dtsi/dtso files, rename the dtso and improve the
> driver to allow easier support for other boards.
> 
> The next patch (patch 26) update the LAN966x device-tree overlay itself
> to have the SPF ports and devices they depends on described.
> 
> The last two patches (patches 27 and 28) sort the existing drivers in
> the needed driver list available in the Kconfig help and add new drivers
> in this list keep the list up to date with the devices described in the
> device-tree overlay.
> 
> Once again, this series gives the big picture and can be split if
> needed. Let me know.

Please suggest how you think this should get merged? There's 8 
maintainer trees involved here. Some parts can be merged independently? 
We need to spread over 2 cycles? Greg just takes it all?

Rob

