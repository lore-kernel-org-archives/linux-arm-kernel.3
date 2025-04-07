Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01DE7C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 16:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aItmirLdEVI7NHCsRGR9Uysz/lglV3mIfktUv8r1Nvo=; b=clhnbfdhGdkWgiuDM8WgDAV1Eo
	iBp2qrRHNB09jEdbXWrDodR88VWVJls0i5aVrBtT+SBqhbTiaQNZCKnsHOKx+tnVomWGJSlgC875v
	WHXL0OUdSsPk4rHSAyF35HVQ9H4lV0Hgu97sB6hfAU/V8bhWbPEhu9mvSpxEf5oSSKcjG6uDgAW8K
	igQJUl95nqQYN112ZlRM3qdvxnCF5e9On+5hLQrKq9xx3u2s/Gru17DIKrQTCtM62MbsZRsKknXNF
	otq2IMq64UsjL77i2B4se+ALKfstBaT8pnlpDaf1jQEOKWqbjukh9cyS8AfAFJ+gVfmIMS8d9XkzZ
	9ZKTqUBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1oyI-0000000143c-0d0z;
	Mon, 07 Apr 2025 16:05:14 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1ntj-00000000poB-09Kn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 14:56:28 +0000
Received: by mail.gandi.net (Postfix) with ESMTPA id CCD0C4433E;
	Mon,  7 Apr 2025 14:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744037785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aItmirLdEVI7NHCsRGR9Uysz/lglV3mIfktUv8r1Nvo=;
	b=WsvImHZf8/ypzjdPBUs2PPKIK49DxWcoSWB6Mcnww6f5MVeVYwZZQbv1IJh3RQFXicMJxy
	/2HQmIvz9+45kBP7THQyY6yBdYIcB+7RfOWNcnUudJB//Uts5yI1W9GOPBFWNcPXRMd1Lc
	9FG/mUAbBgggzWKSB/7oCIvb/e9USVjgilXdzubN4JdIZBorlLZJhsHErJOC9mZ6fk3NNN
	ePAzGbupcjdoXVCQ7RAbf9QoSF8NW9il3M5LAgh0+q8S7AMx+j3I/6lElStUac0+266kFA
	W59HSTDgxkwMpRG3Y5OHRf0mHJGr3L/N2WtlKPMaQ/dfXZvg17ATPifcOPS84w==
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
Subject: [PATCH 10/16] i2c: mux: Create missing devlink between mux and adapter supplier
Date: Mon,  7 Apr 2025 16:55:39 +0200
Message-ID: <20250407145546.270683-11-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407145546.270683-1-herve.codina@bootlin.com>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtgeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheffiefgjeeuleeuueffleeufefglefhjefhheeigedukeetieeltddthfffkeffnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgepieenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeguddprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrt
 ghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomhdprhgtphhtthhopehmthhurhhquhgvthhtvgessggrhihlihgsrhgvrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_075627_207241_565FA9FE 
X-CRM114-Status: GOOD (  18.06  )
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

When removing an i2c controller device handling an i2c bus where an i2c
mux is connected to, the removal process hangs and is stuck in the
wait_completion() call done in i2c_del_adapter().

The i2c_del_adapter() tries to removed the i2c adapter related to the
i2c controller device and the wait_completion() is waiting for the i2c
adapter dev release. This release is performed when the device is no
more used (i.e. refcount reaches zero).

When an i2c mux is involved in an i2c path, the struct dev topology is
the following:
    +----------------+                +-------------------+
    | i2c controller |                |      i2c mux      |
    |     device     |                |      device       |
    |       ^        |                |                   |
    |       |        |                |                   |
    |  dev's parent  |                |                   |
    |       |        |                |                   |
    |   i2c adapter  |                | i2c adapter chanX |
    |     device  <---- dev's parent ------  device       |
    |   (no driver)  |                |    (no driver)    |
    +----------------+                +-------------------+

When an i2c mux device creates an i2c adapter for its downstream
channel, a reference is taken its adapter dev's parent. This parent is
the i2c mux upstream adapter device.

No relationship exists between the i2c mux device itself and the i2c
controller device in order to have the i2c mux device calling
i2c_del_adapter() to remove its downtream adapters and so, release
references taken to the upstream adapter.

This consumer/supplier relationship is typically a devlink relationship.

Also, i2c muxes can be chained and so, the upstream adapter can be
supplied by either an i2c controller device or an other i2c mux device.

In order to get the supplier of the adapter a mux is connected to,
rely on the newly introduced i2c_adapter_get_supplier() and create the
missing devlink between the i2c mux device and the supplier of the
adapter the mux is connected to.

With that done, the i2c mux device is removed before the device
handling the upstream i2c adapter (i2c controller device or i2c mux
device). All references are released and the i2c_del_adapter() call
performed by driver handling the upstream adapter device is not blocking
anymore.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/i2c/i2c-mux.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
index d8bdb3b40acf..84ffd58e4d6d 100644
--- a/drivers/i2c/i2c-mux.c
+++ b/drivers/i2c/i2c-mux.c
@@ -271,7 +271,9 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
 			u32 force_nr, u32 chan_id)
 {
 	struct i2c_adapter *parent = muxc->parent;
+	struct device *parent_supplier;
 	struct i2c_mux_priv *priv;
+	struct device_link *dl;
 	char symlink_name[20];
 	int ret;
 
@@ -378,6 +380,24 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
 				      ACPI_COMPANION(muxc->dev),
 				      chan_id);
 
+	/*
+	 * There is no relationship set between the mux dev and the device
+	 * handling the parent adapter. Create this missing relationship in
+	 * order to remove the i2c mux device (consumer) and so the dowstream
+	 * channel adapters before removing the device (supplier) which handles
+	 * the i2c mux upstream adapter.
+	 */
+	parent_supplier = i2c_get_adapter_supplier(parent);
+	dl = device_link_add(muxc->dev, parent_supplier, DL_FLAG_AUTOREMOVE_CONSUMER);
+	if (!dl) {
+		dev_err(muxc->dev, "failed to create device link to %s\n",
+			dev_name(parent_supplier));
+		put_device(parent_supplier);
+		ret = -EINVAL;
+		goto err_free_priv;
+	}
+	put_device(parent_supplier);
+
 	if (force_nr) {
 		priv->adap.nr = force_nr;
 		ret = i2c_add_numbered_adapter(&priv->adap);
-- 
2.49.0


