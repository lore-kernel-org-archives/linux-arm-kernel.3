Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7580C3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 08:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=755kpgsraEp2tBtZBZZ+v2dmL4b1o2Ua8bVQPPvDfko=; b=QnDUmbXdS0D7U/6h608+y2utgM
	kOeTB0qZX+6Qj54aPBRNn9o1P6oE5jlyqavexRFJ/a9N2NP1PG03sRL+rQGlQNWTkO+gaiV4l120/
	QP6ka9Stm3CE7PUzzdkGkO0w3+jARrfuy1cSIthY+JpdvwmKYOMF+xlDJRi4ksQcwUSgToGrr6Iua
	ptj4U4UuVE3pW6uhhIbiBq2lO3FLK0l5B3u+bfATu+3XHFnPlUHhZPCQ2eYIOY9buy0wza5foZcYJ
	PPF5vu1ekD92VDaCJZPncohmXwjL3vJp4i37X1Cl6lb8szZzAY0Y5F8fKZqeaLp5lGKgIHqeOjVcc
	/yMVNqBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCZnG-0000000Eexz-0lSs;
	Wed, 07 May 2025 08:06:18 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCYyq-0000000ETfS-2Gbp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 07:14:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPA id F05AD43409;
	Wed,  7 May 2025 07:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746602051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=755kpgsraEp2tBtZBZZ+v2dmL4b1o2Ua8bVQPPvDfko=;
	b=BYmC9g2I7rrrY4zyiPdJUAxMqOQeqsXTQDJjE38lUgl9ofAeXb6E40KMdnX3Cl0/R/DEWQ
	dnPX1nc/xE4k4d5SyYlVjWoDNoyhyfsjis4rM6ofJN905bTbG9+W5Z9pnLZljjEEJbRkZA
	8FU5RBseZNYVqSvPyjJpW3kBvtb9Via38/G3mGAtLaio6YwrvOHlDayv7MQJzweJi6re32
	BE7Oh7ytY1P99bdw25shuqM5sMzMEy88H35N7ljDs4C+Y7y0uJT5yT29GtDqbd9Q16LJxH
	v4LZi612SM8DdMLWM/U+C9j+d7m8doYpBcjkHoUGZqUXCFfJMZ2Fo2DE9KAGRQ==
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
Subject: [PATCH v2 22/26] misc: lan966x_pci: Rename lan966x_pci.dtso to lan966x_evb_lan9662_nic.dtso
Date: Wed,  7 May 2025 09:13:04 +0200
Message-ID: <20250507071315.394857-23-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507071315.394857-1-herve.codina@bootlin.com>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeeivdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptefgiefhuddukeelgffhkeeftdeikeevtddtgffhveelgffftdejgedvffejgfeinecuffhomhgrihhnpehmihgtrhhotghhihhprdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegvddprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuo
 heskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomh
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_001412_726939_C0323CF0 
X-CRM114-Status: GOOD (  13.62  )
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

The lan966x_pci.dtso describes the Microchip EVB-LAN9662-NIC board [0]

This PCI board embeds a LAN9962 PCI device chip, part of the LAN966x
family.

Rename the lan966x_pci.dtso accordingly.

Link: https://www.microchip.com/en-us/development-tool/EV53U25A [0]
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 MAINTAINERS                                               | 2 +-
 drivers/misc/Makefile                                     | 2 +-
 .../{lan966x_pci.dtso => lan966x_evb_lan9662_nic.dtso}    | 0
 drivers/misc/lan966x_pci.c                                | 8 ++++----
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename drivers/misc/{lan966x_pci.dtso => lan966x_evb_lan9662_nic.dtso} (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index b985f34bcde8..537ecac86d25 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15812,9 +15812,9 @@ F:	drivers/irqchip/irq-lan966x-oic.c
 MICROCHIP LAN966X PCI DRIVER
 M:	Herve Codina <herve.codina@bootlin.com>
 S:	Maintained
+F:	drivers/misc/lan966x_evb_lan9662_nic.dtso
 F:	drivers/misc/lan966x_pci.c
 F:	drivers/misc/lan966x_pci.dtsi
-F:	drivers/misc/lan966x_pci.dtso
 
 MICROCHIP LAN969X ETHERNET DRIVER
 M:	Daniel Machon <daniel.machon@microchip.com>
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index d6c917229c45..a3c6687ea15f 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -71,6 +71,6 @@ obj-$(CONFIG_TPS6594_PFSM)	+= tps6594-pfsm.o
 obj-$(CONFIG_NSM)		+= nsm.o
 obj-$(CONFIG_MARVELL_CN10K_DPI)	+= mrvl_cn10k_dpi.o
 lan966x-pci-objs		:= lan966x_pci.o
-lan966x-pci-objs		+= lan966x_pci.dtbo.o
+lan966x-pci-objs		+= lan966x_evb_lan9662_nic.dtbo.o
 obj-$(CONFIG_MCHP_LAN966X_PCI)	+= lan966x-pci.o
 obj-y				+= keba/
diff --git a/drivers/misc/lan966x_pci.dtso b/drivers/misc/lan966x_evb_lan9662_nic.dtso
similarity index 100%
rename from drivers/misc/lan966x_pci.dtso
rename to drivers/misc/lan966x_evb_lan9662_nic.dtso
diff --git a/drivers/misc/lan966x_pci.c b/drivers/misc/lan966x_pci.c
index 9c79b58137e5..b28066c96534 100644
--- a/drivers/misc/lan966x_pci.c
+++ b/drivers/misc/lan966x_pci.c
@@ -19,8 +19,8 @@
 #include <linux/slab.h>
 
 /* Embedded dtbo symbols created by cmd_wrap_S_dtb in scripts/Makefile.lib */
-extern char __dtbo_lan966x_pci_begin[];
-extern char __dtbo_lan966x_pci_end[];
+extern char __dtbo_lan966x_evb_lan9662_nic_begin[];
+extern char __dtbo_lan966x_evb_lan9662_nic_end[];
 
 struct pci_dev_intr_ctrl {
 	struct pci_dev *pci_dev;
@@ -125,8 +125,8 @@ struct lan966x_pci {
 
 static int lan966x_pci_load_overlay(struct lan966x_pci *data)
 {
-	u32 dtbo_size = __dtbo_lan966x_pci_end - __dtbo_lan966x_pci_begin;
-	void *dtbo_start = __dtbo_lan966x_pci_begin;
+	u32 dtbo_size = __dtbo_lan966x_evb_lan9662_nic_end - __dtbo_lan966x_evb_lan9662_nic_begin;
+	void *dtbo_start = __dtbo_lan966x_evb_lan9662_nic_begin;
 
 	return of_overlay_fdt_apply(dtbo_start, dtbo_size, &data->ovcs_id, dev_of_node(data->dev));
 }
-- 
2.49.0


