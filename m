Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F0DC71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 14:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WKhGf/QJQpZzz9XDmJmiYvWYjQMvBbB+K2PYVqMHzA0=; b=nY4NRnKAeH+EGumXVn3e6PDZ0h
	ZQ0Qr3XLJsM4lhsc6aw7r1Q1nN7vmrD5Gc6PAWEKJimCfBKGnMmxi017t3KUWv2YUyU+HJ/0GLRA5
	S093YGTHBZ5+TvD8/Sec9lphRigDv/i6iMVuPqN8+OhBPQe7PlUDVRr+1IUNCIQEzwxPc4hHtDFsP
	5Jf2XARoxWwbjMPEJh2uFK9YUUNXy8asQOqpgVWmrDXIy8d4j/Xgfd9v/K1oNXtonhBNVBjvZDYvd
	d1SKD6yb65AVXizWfe/DNwUAdbZVHsLaLaYKuWgWdLWi0oo0WkcyuEDkCEZuK3LFvN6wA0jWJMD51
	a5RE1aCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ5CE-0000000GesN-0NoE;
	Fri, 13 Jun 2025 14:15:54 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ4m3-0000000GYlr-0WjK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 13:48:53 +0000
Received: by mail.gandi.net (Postfix) with ESMTPA id 291AF442C8;
	Fri, 13 Jun 2025 13:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749822529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WKhGf/QJQpZzz9XDmJmiYvWYjQMvBbB+K2PYVqMHzA0=;
	b=HZ36IoB/e1T643VwutZnR3mM0Rw10AMTL7VH9vAtrmlDKNYa5IoMmfEey56m35T00Ava5f
	BUHgF2snG4YJMIPvWut5m0flpXnww+wQOhHkGmDFmluUnWAOk1R6iji45ZntTIG55G+2+N
	jgKmk0Bz1MdxDXjYjbJ1A9d8KU1RxSxouVtGsaM7HfQmq5t7fcL09aoEzu7jema9GQ76PP
	oAky33JKc5kN5pPc5PE6sVBKJ3i1yVOqJ+rd8XbVHbPwQXp46hMF6ccCppXDBzNLcp7oOn
	yWdus2ch9Yi82V4YJBSHdkfw3PxtV8rArMRFlgVcYEDu2Qprr0K+Q6ixGrq/7Q==
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
Subject: [PATCH v3 02/28] driver core: Rename get_dev_from_fwnode() wrapper to get_device_from_fwnode()
Date: Fri, 13 Jun 2025 15:47:42 +0200
Message-ID: <20250613134817.681832-3-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613134817.681832-1-herve.codina@bootlin.com>
References: <20250613134817.681832-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukeduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelffduleduffelvdeiffettdffffejhefhieffleetjedtuefggffgffduffehgeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegledprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvr
 hhnvghlrdhorhhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomh
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_064851_295118_70FC20A1 
X-CRM114-Status: GOOD (  14.25  )
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

get_dev_from_fwnode() calls get_device() and so it acquires a reference
on the device returned.

In order to be more obvious that this wrapper is a get_device() variant,
rename it to get_device_from_fwnode().

Suggested-by: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/lkml/CAGETcx97QjnjVR8Z5g0ndLHpK96hLd4aYSV=iEkKPNbNOccYmA@mail.gmail.com/
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Saravana Kannan <saravanak@google.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/base/core.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index cbc0099d8ef2..36ccee91ba9a 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1881,7 +1881,7 @@ static void fw_devlink_unblock_consumers(struct device *dev)
 	device_links_write_unlock();
 }
 
-#define get_dev_from_fwnode(fwnode)	get_device((fwnode)->dev)
+#define get_device_from_fwnode(fwnode)	get_device((fwnode)->dev)
 
 static bool fwnode_init_without_drv(struct fwnode_handle *fwnode)
 {
@@ -1891,7 +1891,7 @@ static bool fwnode_init_without_drv(struct fwnode_handle *fwnode)
 	if (!(fwnode->flags & FWNODE_FLAG_INITIALIZED))
 		return false;
 
-	dev = get_dev_from_fwnode(fwnode);
+	dev = get_device_from_fwnode(fwnode);
 	ret = !dev || dev->links.status == DL_DEV_NO_DRIVER;
 	put_device(dev);
 
@@ -1960,7 +1960,7 @@ static struct device *fwnode_get_next_parent_dev(const struct fwnode_handle *fwn
 	struct device *dev;
 
 	fwnode_for_each_parent_node(fwnode, parent) {
-		dev = get_dev_from_fwnode(parent);
+		dev = get_device_from_fwnode(parent);
 		if (dev) {
 			fwnode_handle_put(parent);
 			return dev;
@@ -2016,8 +2016,8 @@ static bool __fw_devlink_relax_cycles(struct fwnode_handle *con_handle,
 		goto out;
 	}
 
-	sup_dev = get_dev_from_fwnode(sup_handle);
-	con_dev = get_dev_from_fwnode(con_handle);
+	sup_dev = get_device_from_fwnode(sup_handle);
+	con_dev = get_device_from_fwnode(con_handle);
 	/*
 	 * If sup_dev is bound to a driver and @con hasn't started binding to a
 	 * driver, sup_dev can't be a consumer of @con. So, no need to check
@@ -2156,7 +2156,7 @@ static int fw_devlink_create_devlink(struct device *con,
 	if (sup_handle->flags & FWNODE_FLAG_NOT_DEVICE)
 		sup_dev = fwnode_get_next_parent_dev(sup_handle);
 	else
-		sup_dev = get_dev_from_fwnode(sup_handle);
+		sup_dev = get_device_from_fwnode(sup_handle);
 
 	if (sup_dev) {
 		/*
@@ -2225,7 +2225,7 @@ static void __fw_devlink_link_to_consumers(struct device *dev)
 		bool own_link = true;
 		int ret;
 
-		con_dev = get_dev_from_fwnode(link->consumer);
+		con_dev = get_device_from_fwnode(link->consumer);
 		/*
 		 * If consumer device is not available yet, make a "proxy"
 		 * SYNC_STATE_ONLY link from the consumer's parent device to
-- 
2.49.0


