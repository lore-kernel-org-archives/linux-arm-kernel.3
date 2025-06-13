Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04598C71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 14:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NNd/bH6tNn7AA01d7QKLXaHMTv/Kd/6mEFWBwdb70fc=; b=2OwHjswBquihu6Zz3p6UfLLRkL
	wm4qXPy8+hYZJUSdVibiFkchjLH41a3GXcd2KhX5yXdyM5mq0v9+JV10hDskZWyOyhejIf9i4jkKp
	W85HDfQ2IsAO8y3VlK3zx0TlPQVb9of9DGQCzbh4+rluDoNfdKqw5fHsuSeW3hNE5OLrLOFEqT+Ja
	AFcynddsmn5gOQrljJqZOdhWrHBdzK1jbAneFoaIbzAjW1ByzEXnG2w2tNQqwWGjbBEztJeC43MxT
	ywjJgI8tgMo+NpjVLkO3joORO6J4Acl7T2z8x/RmGtpahUqPXMp0t24QHYKqhaWV0Pe2CDcfEHJkN
	tVmI6DnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ5fY-0000000Gkjv-3pRE;
	Fri, 13 Jun 2025 14:46:12 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ4mb-0000000GYv0-00Jp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 13:49:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPA id A7A8D44288;
	Fri, 13 Jun 2025 13:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749822563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NNd/bH6tNn7AA01d7QKLXaHMTv/Kd/6mEFWBwdb70fc=;
	b=L5D+Sk5sxQpPZT6JgylcAiTXySDHAUa1pED55D+xqqoeJ2jeNw5lYe1udkeUb++nk6Q0Al
	Q605mB99cGt4/HswSKXjl0zJ89nmAmMqJWza/RpXS3lVC8h+vHEICiBX1cauGpfoKAdE8M
	9bMq+ihkedDSTz+n6wTLrYoAwS33ChMblUpaFxAn73cZXTadfMz/EPxOoLBVBA2WMwojww
	CC3TmfJL4zSnsQ4nAuxuhWWTtw8oC9pdbhuxK+XQkRabxBN2OjDso9pz2e+kdCA2zWCHtR
	/Ixl/JH4gD7nVZhIRAn+NnrDwYAXsfbP+0wpUeZI0elC/xmdWHNSe1W6WPPS3g==
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
Subject: [PATCH v3 15/28] i2c: core: Introduce i2c_get_adapter_physdev()
Date: Fri, 13 Jun 2025 15:47:55 +0200
Message-ID: <20250613134817.681832-16-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613134817.681832-1-herve.codina@bootlin.com>
References: <20250613134817.681832-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukeduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehffeigfejueelueeuffelueefgfelhfejhfehieegudekteeiledttdfhffekffenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpeduudenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegledprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrh
 hgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomh
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_064925_475425_531F2C41 
X-CRM114-Status: GOOD (  16.17  )
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

The physical device providing an I2C adapter is the device that calls
i2c_add_adapter() or variants and i2c_del_adapter().

Most of the time this physical device is the parent of the adapter
device.

Exceptions exist with i2c muxes. Indeed, in case of i2c muxes, the
parent of the mux adapter device points to the adapter device the mux is
connected to instead of the physical of this mux adapter.

Introduce i2c_get_adapter_physdev() and a new physdev field in the
adapter structure in order to ease the adapter physical device
retrieval.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/i2c/i2c-core-base.c | 16 ++++++++++++++++
 include/linux/i2c.h         |  3 +++
 2 files changed, 19 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 2ad2b1838f0f..86cd6da25024 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1916,6 +1916,22 @@ struct i2c_adapter *i2c_get_adapter_by_fwnode(struct fwnode_handle *fwnode)
 }
 EXPORT_SYMBOL(i2c_get_adapter_by_fwnode);
 
+/**
+ * i2c_get_adapter_physdev() - Get the physical device of an adapter
+ * @adapter: the adapter to get the physical device from
+ *
+ * Return:
+ * Look up and return the &struct device corresponding to the device supplying
+ * this @adapter.
+ *
+ * The user must call put_device() once done with the physical device returned.
+ */
+struct device *i2c_get_adapter_physdev(struct i2c_adapter *adapter)
+{
+	return get_device(adapter->physdev ?: adapter->dev.parent);
+}
+EXPORT_SYMBOL(i2c_get_adapter_physdev);
+
 static void i2c_parse_timing(struct device *dev, char *prop_name, u32 *cur_val_p,
 			    u32 def_val, bool use_def)
 {
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 20fd41b51d5c..dff04d20cafe 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -744,6 +744,7 @@ struct i2c_adapter {
 	int timeout;			/* in jiffies */
 	int retries;
 	struct device dev;		/* the adapter device */
+	struct device *physdev;		/* the physical device */
 	unsigned long locked_flags;	/* owned by the I2C core */
 #define I2C_ALF_IS_SUSPENDED		0
 #define I2C_ALF_SUSPEND_REPORTED	1
@@ -911,6 +912,8 @@ struct i2c_adapter *i2c_get_adapter(int nr);
 void i2c_put_adapter(struct i2c_adapter *adap);
 unsigned int i2c_adapter_depth(struct i2c_adapter *adapter);
 
+struct device *i2c_get_adapter_physdev(struct i2c_adapter *adap);
+
 void i2c_parse_fw_timings(struct device *dev, struct i2c_timings *t, bool use_defaults);
 
 /* Return the functionality mask */
-- 
2.49.0


