Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B8B1C71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 15:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k7BaHTEYgKDQPLhY52vqf1rSzupjlsDNPhEf5S8DgEg=; b=0a2D3kH2w3hdOZHw/b01yrHC5Z
	JquebZipZcSEx80J85P0agkGYpbiBxh8yE7KpLCOdNwq3e4xDtyoaGRM7Uk/YdemiCCLo/boLU7H0
	vOlIpvraEl/KiM9x7wnmblmtDyUjMs/9ys0SOam1ZP2HMz/qdTWTKsyZcwG+QoHBO+L34i5FI/MZm
	wMPcWu6QTFZXedVbemH1/7Hzs5UlfricJjWBSHInNJVbp0pSy+pbSvTzsXYRgnMIsGMi+RKutDBwg
	kAZntmS0CHx4kMykvyCxQwMzWY8iZcolmq9fIqO7iyUOAEossxDCgavDeTFAw1tY/w2R84cn7WUlx
	eBPbklRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ625-0000000GpMG-11F2;
	Fri, 13 Jun 2025 15:09:29 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ4my-0000000GZ1x-3gP3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 13:49:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPA id 16FEE439C5;
	Fri, 13 Jun 2025 13:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749822587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k7BaHTEYgKDQPLhY52vqf1rSzupjlsDNPhEf5S8DgEg=;
	b=fc29cCTY8Wy6wHMG62+e0nAHr6dGDhi8eHjlTRxnQEjTpVBbRpEo56mA5eUVTZ7rEqDDr8
	HzDVyCrPOqY8cf6eduEl6jHZxTH1ZodB0VBiNUyaKgoi8f+EOg8F3CBJw2bsgqqwqaiENi
	SzEMnf4sLBHY/XfdxMFEIxa1GjIOHgHwV2xvBRxRce/5K4P37Ou38KOKJFmHlWHcXVDCg7
	1xpMI2nHTitbgBquDs9UTe1UaSP1r/Hod9ez6batX/8rB7O5vVU4V+5ZIylYRuAPyUWEtt
	CSSEpq4egLyCOvRDHK+LPIFTUhd5dggJemvtxQp/GeOyYTGjFwDpzuDH9rvyvQ==
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
	Davidlohr Bueso <dave@stgolabs.net>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v3 25/28] misc: lan966x_pci: Introduce board specific data
Date: Fri, 13 Jun 2025 15:48:05 +0200
Message-ID: <20250613134817.681832-26-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613134817.681832-1-herve.codina@bootlin.com>
References: <20250613134817.681832-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukeduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehffeigfejueelueeuffelueefgfelhfejhfehieegudekteeiledttdfhffekffenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpeduleenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegledprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrh
 hgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomh
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_064949_067330_D01D1F09 
X-CRM114-Status: GOOD (  15.51  )
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

Only one device-tree overlay (lan966x_evb_lan9662_nic.dtbo) is handled
and this overlay is directly referenced in lan966x_pci_load_overlay().

This avoid to use the code for an other board.

In order to be more generic and to allow support for other boards (PCI
Vendor/Device IDs), introduce the lan966x_pci_info structure and attach
it to PCI Vendor/Device IDs handled by the driver.

This structure contains information related to the PCI board such as
information related to the dtbo describing the board we have to load.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/misc/lan966x_pci.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/misc/lan966x_pci.c b/drivers/misc/lan966x_pci.c
index e60ab662b8f3..5fa6af531a53 100644
--- a/drivers/misc/lan966x_pci.c
+++ b/drivers/misc/lan966x_pci.c
@@ -18,10 +18,6 @@
 #include <linux/pci_ids.h>
 #include <linux/slab.h>
 
-/* Embedded dtbo symbols created by cmd_wrap_S_dtb in scripts/Makefile.lib */
-extern char __dtbo_lan966x_evb_lan9662_nic_begin[];
-extern char __dtbo_lan966x_evb_lan9662_nic_end[];
-
 struct pci_dev_intr_ctrl {
 	struct pci_dev *pci_dev;
 	struct irq_domain *irq_domain;
@@ -118,17 +114,23 @@ static int devm_pci_dev_create_intr_ctrl(struct pci_dev *pdev)
 	return devm_add_action_or_reset(&pdev->dev, devm_pci_dev_remove_intr_ctrl, intr_ctrl);
 }
 
+struct lan966x_pci_info {
+	void *dtbo_begin;
+	void *dtbo_end;
+};
+
 struct lan966x_pci {
 	struct device *dev;
 	int ovcs_id;
+	const struct lan966x_pci_info *info;
 };
 
 static int lan966x_pci_load_overlay(struct lan966x_pci *data)
 {
-	u32 dtbo_size = __dtbo_lan966x_evb_lan9662_nic_end - __dtbo_lan966x_evb_lan9662_nic_begin;
-	void *dtbo_start = __dtbo_lan966x_evb_lan9662_nic_begin;
+	const struct lan966x_pci_info *info = data->info;
 
-	return of_overlay_fdt_apply(dtbo_start, dtbo_size, &data->ovcs_id, dev_of_node(data->dev));
+	return of_overlay_fdt_apply(info->dtbo_begin, info->dtbo_end - info->dtbo_begin,
+				    &data->ovcs_id, dev_of_node(data->dev));
 }
 
 static void lan966x_pci_unload_overlay(struct lan966x_pci *data)
@@ -169,6 +171,9 @@ static int lan966x_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 
 	pci_set_drvdata(pdev, data);
 	data->dev = dev;
+	data->info = (const struct lan966x_pci_info *)id->driver_data;
+	if (!data->info)
+		return -EINVAL;
 
 	ret = lan966x_pci_load_overlay(data);
 	if (ret)
@@ -196,8 +201,17 @@ static void lan966x_pci_remove(struct pci_dev *pdev)
 	lan966x_pci_unload_overlay(data);
 }
 
+/* Embedded dtbo symbols created by cmd_wrap_S_dtb in scripts/Makefile.lib */
+extern char __dtbo_lan966x_evb_lan9662_nic_begin[];
+extern char __dtbo_lan966x_evb_lan9662_nic_end[];
+
+static struct lan966x_pci_info evb_lan9662_nic_info = {
+	.dtbo_begin = __dtbo_lan966x_evb_lan9662_nic_begin,
+	.dtbo_end = __dtbo_lan966x_evb_lan9662_nic_end,
+};
+
 static struct pci_device_id lan966x_pci_ids[] = {
-	{ PCI_DEVICE(PCI_VENDOR_ID_EFAR, PCI_DEVICE_ID_EFAR_LAN9662) },
+	{ PCI_DEVICE_DATA(EFAR, LAN9662, &evb_lan9662_nic_info) },
 	{ }
 };
 MODULE_DEVICE_TABLE(pci, lan966x_pci_ids);
-- 
2.49.0


