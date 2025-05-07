Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA4EC3ABC6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 07:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xWcjp81uXpN46gH9tF+YC07UYV9Pv+eyOSzrWxh9hlM=; b=TsChdaYeQqOSm9AXwUwjiyCrPM
	TvIA5o6ceFvTMEuXa5YP1MWJpDAlGshdEblFWCBLVKOKv0hg+m6YbigH6VtKcUTHjfNY/65QXDupk
	byWDgJjd7sAKh8nDd2IgaU6prgvqv0WDzX++2RpBK9I4L+aEy+hi3M1OfRO22Q5R3dRYjHm8+DhDg
	4XmlnY/W4WjDEVB+u8Em/jPH3XbwKLauAEfvLkL9cRRKRmUXqgMDG2/y56ijZllpgt7A/ZStEsTct
	qIm1qHkAWa9NcvUGUnXF6Lz9lTix5QOxDvaX07+968hZQ9vH9it/0HU1vMXfRSjojYliIDZIupQXG
	/kKmyuKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCZdd-0000000Ecix-0y16;
	Wed, 07 May 2025 07:56:21 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCYyf-0000000ETbg-1ya5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 07:14:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPA id 1D19A43B5A;
	Wed,  7 May 2025 07:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746602040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xWcjp81uXpN46gH9tF+YC07UYV9Pv+eyOSzrWxh9hlM=;
	b=B7o6NsA74jTsbOHNyt0htY3F+35LRa+C9W5uf1uUyZyjJ8BTGMeoLSQ651nxtrIiveswbc
	+4M19dto788xqDwjBiETTSxz/9PKRFp8JndVnlFMw9IGrWR1Wv5b3yv1aIUjApIUmCa0yw
	QQNjXGptT+mbxD8/5IzImz/EjCdbatVcs+FowfxtASr7/OVXz3A/O75iuSulzI4DWv+sYt
	5tkQw9YytGtoF5g4xKk6BrVPm6GYAdNOjHT0zfIyiLV853zu+OCF5PYvb/vUNW/Fk3fAxC
	r9pkPL0VEM8P8X9Yuld+OdOZ2xDNW01E4DRqR5oA+T7/RtuYLrjGuEPzmT1psA==
From: Herve Codina <herve.codina@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Subject: [PATCH v2 17/26] of: property: Allow fw_devlink device-tree on x86 when PCI device-tree node creation is enabled
Date: Wed,  7 May 2025 09:12:59 +0200
Message-ID: <20250507071315.394857-18-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507071315.394857-1-herve.codina@bootlin.com>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeeivdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepleffudeludffledviefftedtffffjeehhfeiffelteejtdeugffggfffudffheegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedvpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhhrgifnhhguhhosehkv
 ghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_001401_641801_5AE9FFB8 
X-CRM114-Status: GOOD (  20.91  )
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

PCI drivers can use a device-tree overlay to describe the hardware
available on the PCI board. This is the case, for instance, of the
LAN966x PCI device driver.

Adding some more nodes in the device-tree overlay adds some more
consumer/supplier relationship between devices instantiated from this
overlay.

Those fw_node consumer/supplier relationships are handled by fw_devlink
and are created based on the device-tree parsing done by the
of_fwnode_add_links() function.

Those consumer/supplier links are needed in order to ensure a correct PM
runtime management and a correct removal order between devices.

For instance, without those links a supplier can be removed before its
consumers is removed leading to all kind of issue if this consumer still
want the use the already removed supplier.

The support for the usage of an overlay from a PCI driver has been added
on x86 systems in commit 1f340724419ed ("PCI: of: Create device tree PCI
host bridge node").

In the past, support for fw_devlink on x86 had been tried but this
support has been removed in commit 4a48b66b3f52 ("of: property: Disable
fw_devlink DT support for X86"). Indeed, this support was breaking some
x86 systems such as OLPC system and the regression was reported in [0].

Instead of disabling this support for all x86 system, a first approach
would be to use a finer grain and disable this support only for the
possible problematic subset of x86 systems (at least OLPC and CE4100).

This first approach could still leads to issues. Indeed, the list of
possible problematic system and the way to identify them using Kconfig
symbols is not well defined and so some system can be missed leading to
kernel regressions on those missing systems.

Use an other way and enable the support on x86 system only when this
support is needed by some specific feature. The usage of a device-tree
overlay by a PCI driver and thus the creation of PCI device-tree nodes
is a feature that needs it.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
link: https://lore.kernel.org/lkml/3c1f2473-92ad-bfc4-258e-a5a08ad73dd0@web.de/ [0]
---
 drivers/of/property.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index c1feb631e383..8b5cfee696e2 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1605,7 +1605,7 @@ static int of_fwnode_add_links(struct fwnode_handle *fwnode)
 	const struct property *p;
 	struct device_node *con_np = to_of_node(fwnode);
 
-	if (IS_ENABLED(CONFIG_X86))
+	if (IS_ENABLED(CONFIG_X86) && !IS_ENABLED(CONFIG_PCI_DYNAMIC_OF_NODES))
 		return 0;
 
 	if (!con_np)
-- 
2.49.0


