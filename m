Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C14C369A3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 16:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BVPT0CFkqtX/ZcwT+Cc/lDNZWWWi2vq+Tcz4vrmiE6g=; b=kBsOBImD8OM/xrVP2ZkwBsAMZN
	UrzLtCGD2ojnt39EgMoZtSbM4uqZrRKu4XTbo3u97Pypd85nyEZsvT+acI5/BDynlF6A+bowekda3
	ekkiBy6MwmgC5lN9Qmc5FazsUPCvG7uzleGTKvpGi2VwXR/LKJM7QBfrELYx+9OsqxQfA8EerOHQw
	2wXfaVMiJQIGa+cy5Aw1oYtUDjnwRfQGv7ESr8LwEkk4z0a1wR4NXzpywqdu8UYnioBAwVbwByjy0
	G/Ehg1vUfGC2aC0j8f++nZqvbthidPVK1pO1ZvoZjKpZLIJ7I2rAJVy0IgTb+tR9D0BPmuQeseWr4
	MF2TA8bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1oy1-000000013c0-3CuV;
	Mon, 07 Apr 2025 16:04:57 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1ntO-00000000pi8-1mkx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 14:56:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPA id C7B0644333;
	Mon,  7 Apr 2025 14:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744037759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BVPT0CFkqtX/ZcwT+Cc/lDNZWWWi2vq+Tcz4vrmiE6g=;
	b=AEfocUA/21kPxWHKfw8jxdyA1UpdsBAP2ARoRqUIV44X1+NtGaOs+mvc5hbx7lGRON38EG
	8EdRiyVXfjngizQzKPYdcaoIkLVFz70gC8PVdJCxKkx7FgLTqC3sd/CrhJaI+Xp52nJqj+
	ydQYj8PltIX9XZVYmYg3meK3XegIY2trYNfqr3z81pTiQbi8IjUTml8T3avDvXlvrMbQBL
	G9X7PgxgRXA2igkfN4KsY8oCmQz6/dG3FxctKN1x/XkM4eBr4N6QB5WZaA8Jw7c5Qppqnt
	jW0ctNrXD66wH0yXieSqK0E8TaJhuS+4xX6VZuluZQQkb9Q9IvUCOgGdnAYhBg==
From: Herve Codina <herve.codina@bootlin.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Herve Codina <herve.codina@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mark Brown <broonie@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 00/16] lan966x pci device: Add support for SFPs
Date: Mon,  7 Apr 2025 16:55:29 +0200
Message-ID: <20250407145546.270683-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtgeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelteduffeltddvtdffgedugfejffeggeekheejiefggfeivefhkeffheehheeiueenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeguddprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrhhgruhgvr
 hesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomhdprhgtphhtthhopehmthhurhhquhgvthhtvgessggrhihlihgsrhgvrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_075606_660316_E0C000D2 
X-CRM114-Status: GOOD (  24.92  )
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

Hi,

This series add support for SFPs ports available on the LAN966x PCI
device. In order to have the SFPs supported, additional devices are
needed such as clock controller and I2C.

As a reminder, the LAN966x PCI device driver use a device-tree overlay
to describe devices available on the PCI board. Adding support for SFPs
ports consists in adding more devices in the already existing
device-tree overlay.

With those devices added, the device-tree overlay is more complex and
some consumer/supplier relationship are needed in order to remove
devices in correct order when the LAN966x PCI driver is removed.

Those links are typically provided by fw_devlink and we faced some
issues with fw_devlink and overlays.

This series gives the big picture related to the SFPs support from
fixing issues to adding new devices. Of course, it can be split if
needed.

The first part of the series (patch 1, 2 and 3) fixes fw_devlink when it
is used with overlay. Patches 1 and 3 were previously sent by Saravana
[0]. I just rebased them on top of v6.15-rc1 and added patch 2 in order
to take into account feedback received on the series sent by Saravana.

Those modification were not sufficient in our case and so, on top of
that, patch 4 and 5 fix some more issues related to fw_devlink.

Patches 6 and 7 are related also to fw_devlink but specific to PCI and
the device-tree nodes created during enumeration.

Patches 8, 9 and 10 are related fw_devlink too but specific to I2C
muxes. Patches purpose is to correctly set a link between an adapter
supplier and its consumer. Indeed, an i2c mux adapter's parent is not
the i2c mux supplier but the adapter the i2c mux is connected to. Adding
a new link between the adapter supplier involved when i2c muxes are used
avoid a freeze observed during device removal.

Patch 11 adds support for fw_delink on x86. fw_devlink is needed to have
the consumer/supplier relationship between devices in order to ensure a
correct device removal order. Adding fw_devlink support for x86 has been
tried in the past but was reverted [1] because it broke some systems.
Instead of disabling fw_devlink on *all* x86 system, use a finer grain
and disable it only on system which could be broken.

Patches 12 and 13 allow to build clock and i2c controller used by the
LAN966x PCI device when the LAN966x PCI device is enabled.

The next 2 patches (patches 14 and 15) update the LAN966x device-tree
overlay itself to have the SPF ports and devices they depends on
described.

The last patch (patch 16) adds new drivers in the needed driver list
available in the Kconfig help to keep this list up to date with the
devices described in the device-tree overlay.

Once again, this series gives the big picture and can be split if
needed. Let me know.

[0] https://lore.kernel.org/lkml/20240411235623.1260061-1-saravanak@google.com/
[1] https://lore.kernel.org/lkml/3c1f2473-92ad-bfc4-258e-a5a08ad73dd0@web.de/

Best regards,
Hervé

Herve Codina (14):
  driver core: Rename get_dev_from_fwnode() wrapper to
    get_device_from_fwnode()
  driver core: Avoid warning when removing a device while its supplier
    is unbinding
  bus: simple-pm-bus: Populate child nodes at probe
  PCI: of: Set fwnode.dev of newly created PCI device nodes
  PCI: of: Remove fwnode_dev_initialized() call for a PCI root bridge
    node
  i2c: core: Introduce i2c_get_adapter_supplier()
  i2c: mux: Set adapter supplier
  i2c: mux: Create missing devlink between mux and adapter supplier
  of: property: Allow fw_devlink device-tree support for x86
  clk: lan966x: Add MCHP_LAN966X_PCI dependency
  i2c: busses: at91: Add MCHP_LAN966X_PCI dependency
  misc: lan966x_pci: Fix dtso nodes ordering
  misc: lan966x_pci: Add dtso nodes in order to support SFPs
  misc: lan966x_pci: Add drivers needed to support SFPs in Kconfig help

Saravana Kannan (2):
  Revert "treewide: Fix probing of devices in DT overlays"
  of: dynamic: Fix overlayed devices not probing because of fw_devlink

 drivers/base/core.c           |  93 ++++++++++++---
 drivers/bus/imx-weim.c        |   6 -
 drivers/bus/simple-pm-bus.c   |  23 ++--
 drivers/clk/Kconfig           |   2 +-
 drivers/i2c/busses/Kconfig    |   2 +-
 drivers/i2c/i2c-core-base.c   |  16 +++
 drivers/i2c/i2c-core-of.c     |   5 -
 drivers/i2c/i2c-mux.c         |  21 ++++
 drivers/misc/Kconfig          |   5 +
 drivers/misc/lan966x_pci.dtso | 206 ++++++++++++++++++++++++++--------
 drivers/of/dynamic.c          |   1 -
 drivers/of/overlay.c          |  15 +++
 drivers/of/platform.c         |   5 -
 drivers/of/property.c         |   2 +-
 drivers/pci/of.c              |   8 +-
 drivers/spi/spi.c             |   5 -
 include/linux/fwnode.h        |   1 +
 include/linux/i2c.h           |   3 +
 18 files changed, 318 insertions(+), 101 deletions(-)

-- 
2.49.0


