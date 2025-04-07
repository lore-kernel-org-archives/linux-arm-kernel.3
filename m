Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6004AC369A3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 16:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kD9ClAPkcPNvQ2iYHfbuGpRxSpQFRsp0tY1oJ6ehDRk=; b=EiUJKMbJt/N6g6zkas8QZJd2TL
	baEE9fD9nzluNl7jrxqOggk5CDMQ9jfB8kOUTk6Sf7Sc6m1EQUZUdjIR9g2ZMOc3I3ufzss5mr57B
	YHCJDp8X34WnodZbd0jFWSDYiUig2yHjN8S1rXZfJar0KlRxARARygeJU69iF8eip63vFq/vZeU3T
	inUSqGMWvsR2eNlIwadKve5kijXeKaru2Ifhrm84mEG/hUoa4YaEkZe31cFI5MDTAkpdEariUKduT
	sS11OEe/yjDVlf53EZ5aQ+uvSuwEyULiXo1B1z0L1s++XPZsZ9yK0TuZFVymI/PWmHJsQkdcU0KWf
	l8zS0ZCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1oyB-000000013rY-1vIk;
	Mon, 07 Apr 2025 16:05:07 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1ntZ-00000000plf-2ox2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 14:56:19 +0000
Received: by mail.gandi.net (Postfix) with ESMTPA id E468844333;
	Mon,  7 Apr 2025 14:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744037775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kD9ClAPkcPNvQ2iYHfbuGpRxSpQFRsp0tY1oJ6ehDRk=;
	b=fHeh3Q3vAiE9f7/1NRTt3k6LL7EWHzVL7T54/lfobgBmrEP0/5nUc2RTcQwDPt3Zrd5nvv
	dl1vEeW16POzheafzz6mu6bSPmCffJM/waRZpyl4IfbvMiWPbho4XACOv97EbkEvkg3apQ
	8aavhArgyVvN7sUZjG6zODH/nTDKmr2hMEHitAN8zowVvRjcx74kBkvLucXCgPw4f1grKb
	9kTJhKR0+J1yZyGZztFbxI009FPTKNkDAsCbWSPAdU+ZG8nBcvxdsNZau154HQ2dtrhFc6
	oEa43NV7TeUuk6/PF2QIuqWZnU4v6XCddxalNoudJpAxfJsxNB3WSe2Z3uY9gw==
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
Subject: [PATCH 05/16] bus: simple-pm-bus: Populate child nodes at probe
Date: Mon,  7 Apr 2025 16:55:34 +0200
Message-ID: <20250407145546.270683-6-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407145546.270683-1-herve.codina@bootlin.com>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtgeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheffiefgjeeuleeuueffleeufefglefhjefhheeigedukeetieeltddthfffkeffnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeguddprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrt
 ghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomhdprhgtphhtthhopehmthhurhhquhgvthhtvgessggrhihlihgsrhgvrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_075617_908712_05CA5A17 
X-CRM114-Status: GOOD (  22.03  )
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

The simple-pm-bus drivers handles several simple bus. When it is used
with busses other than a compatible "simple-pm-bus", it don't populate
its child devices during its probe.

This confuses fw_devlink and results in wrong or missing devlinks.

Once a driver is bound to a device and the probe() has been called,
device_links_driver_bound() is called.

This function performs operation based on the following assumption:
    If a child firmware node of the bound device is not added as a
    device, it will never be added.

Among operations done on fw_devlinks of those "never be added" devices,
device_links_driver_bound() changes their supplier.

With devices attached to a simple-bus compatible device, this change
leads to wrong devlinks where supplier of devices points to the device
parent (i.e. simple-bus compatible device) instead of the device itself
(i.e. simple-bus child).

When the device attached to the simple-bus is removed, because devlinks
are not correct, its consumers are not removed first.

In order to have correct devlinks created, make the simple-pm-bus driver
compliant with the devlink assumption and create its child devices
during its probe.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/bus/simple-pm-bus.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
index d8e029e7e53f..93c6ba605d7a 100644
--- a/drivers/bus/simple-pm-bus.c
+++ b/drivers/bus/simple-pm-bus.c
@@ -42,14 +42,14 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
 	match = of_match_device(dev->driver->of_match_table, dev);
 	/*
 	 * These are transparent bus devices (not simple-pm-bus matches) that
-	 * have their child nodes populated automatically.  So, don't need to
-	 * do anything more. We only match with the device if this driver is
-	 * the most specific match because we don't want to incorrectly bind to
-	 * a device that has a more specific driver.
+	 * have their child nodes populated automatically. So, don't need to
+	 * do anything more except populate child nodes. We only match with the
+	 * device if this driver is the most specific match because we don't
+	 * want to incorrectly bind to a device that has a more specific driver.
 	 */
 	if (match && match->data) {
 		if (of_property_match_string(np, "compatible", match->compatible) == 0)
-			return 0;
+			goto populate;
 		else
 			return -ENODEV;
 	}
@@ -64,13 +64,14 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(&pdev->dev, bus);
 
-	dev_dbg(&pdev->dev, "%s\n", __func__);
-
 	pm_runtime_enable(&pdev->dev);
 
+populate:
 	if (np)
 		of_platform_populate(np, NULL, lookup, &pdev->dev);
 
+	dev_dbg(&pdev->dev, "%s\n", __func__);
+
 	return 0;
 }
 
@@ -78,12 +79,16 @@ static void simple_pm_bus_remove(struct platform_device *pdev)
 {
 	const void *data = of_device_get_match_data(&pdev->dev);
 
-	if (pdev->driver_override || data)
+	if (pdev->driver_override)
 		return;
 
 	dev_dbg(&pdev->dev, "%s\n", __func__);
 
-	pm_runtime_disable(&pdev->dev);
+	if (pdev->dev.of_node)
+		of_platform_depopulate(&pdev->dev);
+
+	if (!data)
+		pm_runtime_disable(&pdev->dev);
 }
 
 static int simple_pm_bus_runtime_suspend(struct device *dev)
-- 
2.49.0


